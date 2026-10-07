# Entropy assessment: ORC and the orchestration lab

Assessed 2026-10-07 with entropy-guard's `entropy-assessment` (v0.9.0), from read-only snapshots of two
repositories:

- **ORC** (`orchestrator/`): Justin's TypeScript orchestration system. In this report its paths are written from
  its root, such as ORC `AGENTS.md`.
- **The lab** (`scope-orchestration-lab/`): the Scope that manages ORC's work. Its paths are written as lab `STATE.md`.

Neither snapshot has a `.git` folder or `node_modules`, and nothing on GitHub was read. "What was not covered" below
lists every gap that follows from that.

**Route taken:**
1. Intent pass (`intent-pass.md`).
2. Lifecycle and shape: shape B, mixed docs and code, spanning two repositories (`mixed-profile.md`).
3. Docs-first Steps 2, 3, 5 and 7 on the lab, because it is docs-first and manages the work.
4. Guard decision: `create`. Then `session-coherence-skill-generator`, which wrote `guard/SKILL.md`, and
   `guards-integrator`, which wrote `integration.md`.

**Other outputs:**
- `questions.md`: five questions for the steward, each with a recommended answer.
- `patches/settled.patch`: changes that touch no open question.
- `patches/provisional.patch`: changes that wait on the questions, naming which question each waits on. Both patches
  apply cleanly to copies of the snapshots, settled first; no test was run.

---

## 1. Intent

### Steward

**Justin.** Lab `scope.yaml:6` (`steward: justin`), and `members: justin, role admin` (`:35-37`). ORC names no steward, but its
`AGENTS.md` quotes Justin's decisions ("Justin, 2026-09-13", "Justin, 2 Oct 2026") and "the operator" (2026-09-26,
2026-09-28). The lab's `STATE.md` identifies the operator as Justin ("by Justin's restart card").

### Authorised intent, with the source of each part

| Part | Source | Kind and authority |
|---|---|---|
| The lab exists to develop and operate Justin's orchestration platform and its reusable Scope-owned agents | lab `scope.yaml:5`, `:13`; `SCOPE.md:3-6` | Scope definition; steward named; created 2026-07-11 |
| Facts about ORC belong in ORC's repository, facts about the Scope model in `pro/scope`, and facts about their relationship in the lab | lab `SCOPE.md:17-24` | Directive; undated, unattributed |
| ORC is the UX surface to Justin's agentic system: his "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; "work towards a point of consolidation" once the six slots work | lab `STATE.md:8-11` | Steward decision, 2026-09-25 and 2026-09-26. **Held only in an overwritten file (F01)** |
| The lab is the central Scope. Where issues live. The nine processes kept. Scheduling (#166) built first. Astra runs this assessment | lab `STATE.md:38-54` | Steward decision, 4 Oct (interview). **Held only in STATE (F01)** |
| Claude merges a PR once review and tests pass | lab `STATE.md:17` | Steward decision, 2026-09-25. **Held only in STATE (F01)** |
| The map of work is orchestrator#140 | ORC `AGENTS.md:9-12`; lab `AGENTS.md:7-10`; `tools/map.mjs:3-4` | Steward decision, 2 Oct; the rules themselves are on GitHub (not read) |
| Core ships with no specific Scope, model, owner or agent | ORC `AGENTS.md:30-55` | Steward decision, 2026-09-12 and 2026-09-13, quoted |
| Boundaries: the lethal trifecta, enforced controls, grants, what ORC reaches, and "any new authority requires an explicit human choice" | ORC `AGENTS.md:14-112` | Directive. Partly sourced (issue #20, #67). Its reach lists are ambiguous (Q1) |
| Approval cards built from fixed blocks | ORC `AGENTS.md:114-128` | Operator decision, 2026-09-26 |
| Security review in the PR description, checked by Danger | ORC `AGENTS.md:138-143`; `dangerfile.js:7` | Steward decision, 2026-10-02 ("B") |
| Async work: owned by ORC, delivery declared per task type, scheduling now/at/recurring, SQLite | lab `decisions/2026-09-17-async-work-architecture.md` | Steward decision, 2026-09-17 |
| Authority rules 1, 2, 4 and 5 affirmed; 3, 6, chat handling and Iris's role open | lab `memory/authority-rules-step-1.md` | Steward decision, 1 Oct |
| Scope logins are never centralised | `src/adapters/scope-credentials.ts:14-15` | Operator decision, 2026-09-28, quoted in code |
| Direction: Iris is the front door, ADA designs agents, every agent belongs to a Scope, and candidates are staged | ORC `README.md:9-23` | Description; unattributed |
| Pace: one scored real use before new design work; small examples first | lab `AGENTS.md:25-29`; ORC `AGENTS.md:152-155` | Directive; points to `HOW_NOT_TO_PLAN.md`, outside these repositories |

**Declared, enacted and authorised.**
- **Declared:** ORC's `README.md` still describes an early ORC: a published-events Bookwhen client, a plan made
  without being applied, and scheduling absent.
- **Enacted:** what `STATE.md` and `FRICTION.md` record of the last fortnight. This covered the browser driver, the
  phone, invoicing, package API versioning, the map, and Danger.
- **Authorised:** largely matches what was enacted (the 2026-09-17 decision, the 4 Oct decisions, the 2 Oct
  decisions). The exceptions are the reach lists (Q1) and the core-tie rises (Q2).

Enacted intent could only be read from those two state files, because there is no git history (see "What was not
covered").

### Gaps, by condition

- **Stale description:** F07, F08, F09 and F10. Each is corrected in `patches/settled.patch`, citing the decision
  that settles it:
  - F07 (the removed Bookwhen module): Justin's core-ties decision, ORC `AGENTS.md:33-42`;
  - F08 (where credentials are read): the operator's decision of 2026-09-28;
  - F09 (scheduling) and F10 (the specialist applies its plan): the decision of 2026-09-17.
  The other items on the README's "Deliberately absent" list are not plainly settled by any decision, so they stay
  as they are, and are noted under Q1.
- **Conflict:** F17. The cap on the state file's length is forty lines in lab `AGENTS.md` and sixty in `STATE.md`
  (Q3).
- **Missing:**
  - Where the session-end guard lives (Q5). Justin decided on 4 Oct that one will run, but no guard exists (F28).
  - What else the lab should cover. On 4 Oct Justin gave this question to Astra, so it is not asked here.
- **Ambiguous:**
  - Whether ORC `AGENTS.md`'s reach lists are rules or descriptions (F04 to F06, F11; Q1).
  - How the pace rule relates to Justin's "what is naturally needed" (F03). Not asked here: the guard points at
    both owners, and neither owner is inside these repositories.
- **Unauthorised drift, until a decision covers it:**
  - The core-tie allowance for `config/installation.ts` rose from 28 to 70 (F27; Q2; proposal P2).
  - A package's agent reaches ntfy through the phone connector (F06; Q1; proposal P1).
  For both, a proposal is drafted in `patches/settled.patch`, in lab `decisions/2026-10-07-proposals-awaiting-justin.md`.
- **Prose control:** these rules are written as if something enforces them, and nothing does:
  - "a count may only fall" (F27);
  - "Merge only when it is green" (F26);
  - "once review and tests pass", with no CI running the tests (F25);
  - "entropy guard at session end" (F28);
  - the cap on the state file's length (F17);
  - placing every issue on the map, checked only by hand (F30).
  The rule cited as a control is the core-tie ratchet (ORC `AGENTS.md:47-55`).

**Existing guards' repair instructions.** There is no existing guard. The instruction files contain no repair that
treats work as permission to change intent:
- lab `AGENTS.md:19`, "`scope.yaml`, then one line in `SCOPE.md`", keeps a summary next to its owner, which is
  allowed;
- ORC `AGENTS.md:132` regenerates a projection with `pnpm api:report`, which is allowed.

One file restates rules owned elsewhere: lab `STATE.md:15-19` repeats rules from the user-wide `AGENTS.md` (F19).

### Questions and proposals

There are five questions, all in `questions.md`. Q1 and Q2 are also recorded as proposals P1 and P2 for the lab's
decision record. Each question has a recommended answer:

- **Q1, what ORC may reach:** treat the lists as rules that `test/architecture.test.ts` enforces, and confirm the three
  reaches (the ORC service module, Chromium and the phone connector).
- **Q2, core-tie rises:** a recorded exception for `config/installation.ts` only, lasting until #152.
- **Q3, the state file's cap:** lab `AGENTS.md` owns it, and it is forty lines with its derivation written down.
- **Q4, ORC's root reports:** delete the seven branch reports (git keeps them), and keep the other five as live docs.
- **Q5, where the guard lives:** one guard in the lab's `skills/`, linked from both `AGENTS.md` files.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.**
  - Lab `scope.yaml:7` `status: active`, and the `orchestrator` project is `status: active` (`:14`).
  - `STATE.md` was updated 2026-10-04 17:31 and records five verified ORC restarts that day.
  - `FRICTION.md` has entries up to 2026-10-04.
  - `status-tracker` is archived (`scope.yaml:22-25`). Its repository is not in scope.
- **Shape: B, mixed docs and code, with a workflow-heavy side (D).**
  - ORC has about 150 source and test files.
  - ORC also has 15 root markdown files, and its workflow mechanisms are approval cards, the restart card, Danger
    and grants.
  - Both B and D route to `mixed-profile.md`.
- **Repositories: two, assessed as one system.** The lab is docs-first: markdown carries the state, and the work
  happens across repeated sessions. So docs-first Steps 2, 3, 5 and 7 were run on it (section 5).

---

## 3. Findings

One list. Every other section refers to these ids.

### Intent and decisions

**F01. Steward decisions are held only in the state file that is overwritten at each verified event.**
- Evidence: the north star (lab `STATE.md:8-11`), the decisions of 4 Oct (`:38-54`), the merging rule (`:17`), and
  the decisions of 2 Oct and 3 Oct (`:57-58`, `:76`, `:79`).
- Searched both repositories for "ChatGPT replacement", "point of consolidation", "central Scope" and "Claude
  merges". Only `STATE.md` matched, except that the Danger decision is also in `dangerfile.js:7`.
- Lab `AGENTS.md:33` says `STATE.md` "is overwritten at each verified event".
- **Corrected:** the settled patch copies them, with source and date, to `decisions/2026-09-25-orc-north-star.md` and
  `decisions/2026-10-04-lab-role-and-processes.md` (intent pass §5).

**F02. Steward decisions are recorded in six places, and ORC has no decision log.** The places:
- lab `decisions/`, which holds one file;
- lab `memory/authority-rules-step-1.md`;
- lab `STATE.md`;
- ORC `AGENTS.md`, as inline quotes;
- comments in the code (`dangerfile.js:7`; `src/adapters/browser/playwright.ts:10-12`, citing #76;
  `src/adapters/scope-credentials.ts:14-15`);
- GitHub issues (#140's rules).

One owner per concern is allowed. What is missing is a stated owner for steward decisions on direction and process.
The recommendation, used by the guard, is lab `decisions/`, with decisions about a single issue kept on that issue.

**F03. The pace rule and "what is naturally needed" read differently.**
- Lab `AGENTS.md:27-29`: "one scored real use must come first". ORC `AGENTS.md:154`: "small working examples before
  generalising".
- Justin, 21 Sep: "relax suggested development to 'what is naturally needed given where we are and what's likely
  coming next'" (`reports/2026-09-22-pushback-analysis.md:130-134`). Astra read it as correcting "omission of ordinary
  necessities", not as licence for every improvement (`reports/2026-09-25-direction-review-astra.md:72`).
- Ambiguous. The rule's owner, `HOW_NOT_TO_PLAN.md`, is outside these repositories. Not asked.

### Reach and authority: ORC's docs against its code

**F04. ORC `AGENTS.md:92-96` says where subprocess access exists, and the list is incomplete.** It names three
modules: `child-agent-process.ts`, `analysis-tools.ts` and `mcp/client.ts`. Two more launch processes:
- `src/adapters/orc-service.ts:9-15`: `execFile`, for git reads, a frozen pnpm install and `systemctl`.
  `test/architecture.test.ts:828-835` already approves it.
- `src/adapters/browser/playwright.ts:55`: `chromium.launch`. Neither the docs nor the test name it, and the test's
  pattern (`node:child_process|execSync|spawnSync`, `:829`) cannot detect it.

The search covered `child_process`, `execFile`, `spawn`, `fork`, `.launch(`, `chromium` and `StdioClientTransport` in
`src/` and `scripts/`. The `scripts/` hits (`build.mjs`, `dev-web.mjs`, `update-pi.mjs`, `orc-service.ts`) are
operator commands, and whether the claim covers them is unclear.

**F05. ORC `AGENTS.md:98-100` says direct network access exists only in `research-tools.ts` and `ntfy.ts`. The code
reaches further:**
- `playwright.ts` runs a Chromium that reaches the hosts its grant approves (`:47-61`, `:82-90`).
- It also imports `lookup` from `node:dns/promises` (`:14`). ORC `AGENTS.md:73` and `SECURITY-REVIEW.md` question 2
  count a DNS lookup as an outbound channel.
- What ORC's libraries reach for it (Pi calling the model provider, any MCP server) could not be checked, because
  `node_modules` is absent.
- The network test (`architecture.test.ts:1295-1317`) approves exactly `ntfy.ts` and `research-tools.ts`. Its patterns
  match neither `playwright` nor `node:dns`.

**F06. ORC `AGENTS.md:101-102` says "No model or agent reaches the ntfy transport, and it sends only a title, the
notice's summary and the one configured tap address."** The code contradicts it:
- `src/adapters/phone/index.ts:1-40` is a built-in `phone` connector that packages declare.
- Through it, a package's agent sends a notice with a title, text, a tap address and tags via `publishNtfy`.
- Its header dates its first user to 2 Oct and cites #184.

Whether this reach was authorised is not recorded in either repository (Q1, P1).

**F07. The removed Bookwhen module is still described.**
- ORC `AGENTS.md:102-103` names `src/bookwhen.ts` as "the only module that imports the pinned Bookwhen client". The
  file does not exist.
- ORC `README.md:76-79` says to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN` for `@jphil/bookwhen-client@0.6.1`. Nothing in
  `src/` or `config/` reads that variable; only three tests stub it (`production-composition.acceptance.test.ts:128`,
  `activate-research-agent.test.ts:153`, `child-agent-process.test.ts:648`).
- `package.json` has no such dependency, and `architecture.test.ts:1315-1320` refuses it.
- `list_open_fridays` is now a Scope package's contribution (`src/runtime.ts:259`).
- The helpers `bookwhen()` and `openFridays()` (`architecture.test.ts:415-423`) import removed modules and are never
  called.
- **Corrected in the docs** by the settled patch. The test leftovers are one-time cleanup.

**F08. ORC `README.md:103-104` says "A credential is read in exactly one place, `src/runtime.ts`".** The code shows
otherwise:
- The web token is read in `src/web-cli.ts:625` and `:753`.
- Scope logins are read by `src/adapters/scope-credentials.ts`, which is used by `package-approvals.ts` and
  `agent-packages.ts`.
- No credential read was found in `src/runtime.ts`, even though its header claims "Credential reads".

"No subprocess ORC launches receives one" is also doubtful: the Chromium is given the approved storage state
(`playwright.ts:57`).
- **Corrected:** the settled patch lists the places that were found, marked incomplete because Pi's own reads were
  not checked.
- **Left open:** the subprocess sentence is provisional (Q1).

**F09. ORC `README.md:152-154` lists scheduling as "deliberately absent".** But:
- The decision of 2026-09-17 provides `schedule: now | at | recurring` (lab `decisions/…:54`).
- The engine has it: `src/core/async/types.ts:72`, `src/app/async/calendar.ts`, and the `*:async-series` scripts in
  `package.json:38-42`.
- **Corrected** in the settled patch.

**F10. ORC `README.md:146-147` says the Moving Stillness specialist plans "without applying it".** But:
- The decision of 2026-09-17 has it submit `apply_slots` with approval required (`decisions/…:175-177`).
- A real apply ran on 28 Sep (lab `memory/slots-run-walkthrough.md`).
- **Corrected** in the settled patch.

**F11. ORC `README.md:3-7` sums up what ORC reaches, and the summary is out of date.** It says ORC "launches one
isolated fixed researcher child" and that its "read-only external data paths are published Bookwhen events, fixed
Bookwhen admin inspection…, and public webpages". ORC now also:
- launches a Chromium;
- writes through approved applies;
- sends notices to the phone.

The summary repeats the list in ORC `AGENTS.md` "Boundaries". The provisional patch (Q1) replaces it with a link to
that list.

**F12. ORC `AGENTS.md:47` says the core-tie ratchet covers `src/` and `web/src/`.** `test/core-ties.ts:8` and
`scripts/source-headers.js:14` also scan `config/`. **Corrected** in the settled patch.

**F13. Nothing in production composes the MCP client.**
- No file in `src/` or `config/` calls `createMcpClient` or `createPiMcpTools`; only `test/mcp-client.test.ts` uses
  them.
- Yet `MCP.md:4` says "The MCP client below still serves Pi's MCP tools", and ORC `AGENTS.md:94` lists it as a
  subprocess path.
- Not corrected: whether it is dead code or waiting for #46 ("MCP everywhere", deferred) is the maintainer's call.

### Documentation and workflow

**F14. ORC `README.md:131-136`, "Verify", leaves out `pnpm test:e2e` (`package.json:58`).** The E2E suite failed on
`main` for a week unnoticed, because nothing runs it (lab `FRICTION.md`, 2026-09-27). The settled patch adds it.

**F15. The systemd unit's documentation link points at a branch report.** `scripts/orc-service.ts:41` writes
`Documentation=file://<checkout>/OPERATOR.md`, and `OPERATOR.md` is a branch report ("Branch
`feat/async-work-capability`… Nothing is pushed", `:3-11`). The operator's documentation is ORC `README.md:106-129`.
This is a one-time cleanup tied to Q4.

**F16. Seven ORC root files are reports of one branch or slice, sitting beside the live docs with nothing marking them
as history.**
- The seven, each describing itself as such: `REWORK.md:3` and `SEAM.md:3` ("Nothing committed/pushed"), `OPERATOR.md`,
  `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`, `GRANTS-E2E.md`.
- Some name files that are gone, such as `SLICE1.md:7`, `:24` (`src/adapters/browser/service.ts`).
- Five more are mechanism or design notes: `CLASSIFY.md`, `GRANTS.md`, `MCP.md` (partly marked historical),
  `TURN-RECORD.md`, `VISIBILITY.md`.
- Nothing indexes which of the twelve are live.
- The settled patch adds a "Historical report" banner to the seven. Moving or deleting them is Q4.

### The lab's state

**F17. `STATE.md` has no single agreed cap, and is well over both.** Lab `AGENTS.md:34` says "about forty content
lines". `STATE.md:4` says "Target: sixty lines". The 4 Oct version has 87 non-blank lines. Nothing checks either cap.

**F18. `STATE.md` contradicts itself on live facts, and states an expired grant as current.**
- It says ORC runs `369628b` (`:58`, `:88`) and also that ORC restarted onto `8cee662` at 14:48:27 on 4 Oct (`:35`).
- It says MS is at `c759f96` (`:91`) and also that "MS #53 merged as `fc830aa`" (`:32`).
- It says "Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z" in a file dated 4 Oct (`:94`).

The same pattern is recorded in `FRICTION.md` on 2026-09-12 and 2026-09-22.

**F19. `STATE.md` holds history, against its own rule.** Its "Do not append" (`:4`) and lab `AGENTS.md:33-36` rule it
out, yet it keeps:
- the git cleanup of 2 Oct;
- the Danger change of 2 Oct;
- the phone work, "closed 3 Oct";
- an Astra review log, mixed into a bullet about labels.

It also restates the user-wide rules (`:15-19`).

**F20. Every time written into `STATE.md` and `FRICTION.md` is typed by hand.** `FRICTION.md` 2026-09-30 calls this a
missing system: eight wrong times between 29 Sep and 2 Oct. No mechanism reads the clock.

**F21. The running ORC's state directory is defined in two places.**
- ORC's default is `~/.local/share/orchestrator` (`src/runtime.ts:189-190`). The running ORC uses `-proof`, from its
  environment file, which is outside both repositories.
- The lab's `tools/collect.mjs:16` hard-codes `~/.local/share/orchestrator-proof`.
- `FRICTION.md` 2026-09-28 records the third confusion between the two, and calls it a missing system (#62).

**F22. `FRICTION.md` is not in the order it claims.** It says "Newest first" (`:3`). Yet entries for 2026-09-11 to
2026-09-19 come after 2026-09-03 (`:1153-1402`), and 2026-09-12 has two sections (`:864`, `:1175`).

**F23. Lab `memory/slots-run-walkthrough.md:35` names `src/adapters/browser/service.ts` and `mcp.ts`, which are
gone.** The file is a dated trace of 28 Sep, so it is history, but it sits in `memory/`, the home of current facts
about the relationship. Low.

**F24. `AGENT_IDEAS.md` has two "Product search" sections (`:164`, `:173`).** Low.

### Enforcement

**F25. CI runs no tests, type checks or E2E.**
- `.github/workflows/danger.yml` is the only workflow, and it checks only the PR's description.
- The merging rule ("once review and tests pass") therefore rests on the merging agent's own report.
- Justin decided to keep "tests on every PR (#144)" on 4 Oct. How it runs is still open (`STATE.md:69`).

**F26. Danger warns on a failed check rather than blocking the merge, and direct pushes to `main` go unchecked.**
`SECURITY-REVIEW.md:53-55` says so ("without GitHub Pro a failed check warns rather than blocks a merge. Merge only
when it is green"), and so does ORC `AGENTS.md:142-143`. The documents are honest about it. It is still a rule that
only prose upholds.

**F27. "A count may only fall, and its allowance falls in the same change" (ORC `AGENTS.md:47-49`) is not
enforced.**
- The test checks only that each count equals its allowance (`architecture.test.ts:566`).
- The Scope allowance for `config/installation.ts` rose 28 → 51 → 64 → 70 between 28 Sep and 2 Oct
  (`test/core-ties.ts:41-49`).
- Each rise has a reason in a comment. None cites a decision (Q2, P2).

**F28. "Entropy guard at session end" is a kept process with no guard behind it.** Justin kept it on 4 Oct
(`STATE.md:49`). The lab's `skills/` holds only `.gitkeep`, and ORC has no `skills/`. Searching both repositories for
"entropy" found only `STATE.md` and one report.

**F29. The scheduled processes were decided but not built.** These are the daily diary, the weekly adversarial
review, the monthly FRICTION-into-rules (#60), branch cleanup (#70) and `/tmp` cleanup (#182). On 4 Oct, Justin
decided they run through #166, which is built first. The diary's snapshots in `reports/` cover only 6 days: 09-03,
09-07, 09-29, 09-30, 10-01 and 10-02.

**F30. The rule that every issue sits on the map is checked only by hand.** The rule is in ORC `AGENTS.md:11-12` and
lab `AGENTS.md:7-10`. The check, `node tools/map.mjs --check`, runs only by hand or when the diary runs.

**F31. Both repositories' `.githooks/pre-push` print a summary and never block.** Whether either hook is enabled
cannot be seen, because the snapshot has no git configuration.

**F32. The source-header test checks that a header exists, not that it is true.** It requires an Owns/Never/Today
header (`architecture.test.ts:531`; `scripts/source-headers.js`). The headers carry dated "Today:" claims, such as
`src/adapters/phone/index.ts:6-7`.

**F33. A connector's setting names are defined in ORC and again in each package's manifest, with no test across the
two.** `FRICTION.md` 2026-10-03 records it: Moving Stillness was unavailable for about an hour (#198). The package
side is outside these repositories.

**F34. The lab's `README.md` and `tools/report.mjs` disagree on how long a test run takes.** The README (`:16`) says
`node tools/report.mjs` "runs the test suite (~10s)". The tool's own header (`tools/report.mjs:10`) says about ten
seconds without the suites and two minutes with them. Which is right needs a timed run, so this is not corrected.
Low.

---

## 4. Mixed profile (ORC and the lab as one system)

### Domains present and actively changed

All six domains are present and changing:
- **Code:** ORC.
- **Documentation:** both repositories.
- **Tests:** ORC's unit suite, E2E and architecture tests.
- **API and data contracts:**
  - the package API report, `src/package-api.api.md`;
  - each package's manifest;
  - the approval card's template.
- **Workflow and process:**
  - Danger;
  - the restart and package cards;
  - the map;
  - `STATE.md` and `FRICTION.md`.
- **Live operational state:**
  - `orc.service`;
  - standing grants and package approvals;
  - durable-work tasks;
  - ntfy notices to the phone;
  - Bookwhen entries, through Moving Stillness, which is paused;
  - Waterlands invoices;
  - the marks on the GitHub Project.

### Repositories and ownership

| Concept | Owner | Second home (seam) |
|---|---|---|
| ORC's behaviour and reach | ORC (`AGENTS.md`, code, `architecture.test.ts`) | ORC `README.md` restates the reach (F11) |
| Steward decisions on direction and process | lab `decisions/` (recommended) | `STATE.md` (F01); `memory/`; ORC `AGENTS.md` quotes (F02) |
| Current state of the work | lab `STATE.md` | none |
| Open work | GitHub issues under orchestrator#140 | `STATE.md` summarises; `AGENT_IDEAS.md` holds ideas that are not yet issues |
| The running ORC's state directory | ORC's environment file (outside) | lab `tools/collect.mjs:16` (F21) |
| A connector's setting names | ORC | each package manifest (F33) |
| The cap on the state file's length | lab `AGENTS.md` | `STATE.md:4` (F17) |
| Rules for every agent | local-config `home/AGENTS.md` (outside) | `STATE.md` "How we work" (F19) |

### Drift between domains, by kind

- **Docs against implementation:** F04 to F13, F15.
- **Docs against docs:** F17, F18, F19, F22, F34.
- **Tests against implementation:** F05 (the network test misses the browser), F07 (dead test helpers and environment
  stubs), F32.
- **Contracts against implementation:** the package API report is kept current by a test (ORC `AGENTS.md:132`), and
  no drift was found in it. F33 is the seam.
- **Workflow against reality:** F25, F26, F29, F31.
- **Rules against enforcement:** F17, F26, F27, F28, F30.

### Top risks, ranked by decay rate times recovery cost

1. **What ORC reaches drifts from the docs and the tests that are meant to bound it** (F04 to F08, F11).
   - **Decay: fast.** Three reach changes landed in two days: #101's service module, #184's phone connector (2 Oct),
     and #197's Chromium (3 Oct).
   - **Recovery: high.** Each security review asks "What does this let an agent do that it could not do before?"
     (`SECURITY-REVIEW.md` question 1) against this baseline. "Any new authority requires an explicit human choice"
     (ORC `AGENTS.md:110`) cannot be judged from a wrong list.
   - **Anchor:** ORC `AGENTS.md` "Boundaries", enforced by `test/architecture.test.ts`.
2. **Steward decisions live in a file built to be overwritten** (F01, F02, F18, F19).
   - **Decay: daily.** `STATE.md` is rewritten at each verified event.
   - **Recovery: high.** A decision overwritten out of `STATE.md` survives only in git history and transcripts, and
     `FRICTION.md` records `STATE.md` giving confident wrong answers twice.
   - **Anchor:** lab `decisions/`.
3. **Rules that only prose upholds** (F25 to F28, F30).
   - **Decay: medium.** The allowances rose three times in five days, and the E2E suite stayed red for a week.
   - **Recovery: high.** Each failure is found late, after merges have built on it.
   - **Anchor:** CI under #144, scheduled checks under #166, and the guard.
4. **Superseded material and dead names next to live docs** (F07, F09, F10, F15, F16, F23).
   - **Decay: medium.**
   - **Recovery: medium.** `FRICTION.md` 2026-09-27 records an agent copying a dead tool name into new memory.
   - **Anchor:** ORC `README.md` and `AGENTS.md`.
5. **Values with two homes across repositories** (F21, F33).
   - **Decay: slow.**
   - **Recovery: high when it bites.** There have been three state-directory confusions, and an hour with Moving
     Stillness unavailable.
   - **Anchor:** ORC, with the copies reduced to links (#62, #198).

### Existing guard surfaces, by whether they run

- **Run by themselves:**
  - Danger's Security review and Package API checks on every PR (`.github/workflows/danger.yml`, `dangerfile.js`).
    Its runs are recorded in `STATE.md:79-82` and `FRICTION.md` 2026-10-02; this assessment did not observe one.
- **Run only by hand:**
  - `pnpm test`, which includes the architecture test, the core-tie ratchet, the API-report test, the header test
    and the UTF-8 check;
  - `pnpm typecheck`;
  - `pnpm test:e2e`;
  - `pnpm pi:check`;
  - `pnpm service:status`;
  - `node tools/map.mjs --check`;
  - `node tools/report.mjs`, the diary.
- **Decided, not built:**
  - tests on every PR (#144, decided 4 Oct; how it runs is open);
  - the scheduled processes, through #166 (F29);
  - the session-end guard (F28). This run builds it.
- **Declared, but missing:**
  - enforcement for "may only fall" (F27);
  - a check on the state file's cap (F17).
- **Unknown:**
  - whether either `.githooks/pre-push` is enabled (F31);
  - the night hook in `~/.claude/settings.json` and the push-summary script, which are outside these repositories.

What should happen to each surface (keep, amend, replace or demote) is in section 5, Step 7.

### Mechanical checks that belong to tools

The guard does not depend on any of these. Whether each is installed was not checked.
- **A link checker such as lychee,** run in CI over both repositories. It would catch dead paths like those in F15,
  F16 and F23.
- **ast-grep, or a test, for identifiers named in prose.** It would check tool names in agent definitions and
  `README.md`, and environment variables in docs (F07). Moving Stillness #25 already did this for its own texts.
- **Danger rules:**
  - fail a PR that raises a number in `test/core-ties.ts` unless its description cites a decision (F27, after Q2);
  - fail one that changes `STATE.md` past its cap (F17, after Q3).
- **The architecture test,** extended per Q1 (`patches/provisional.patch`).

---

## 5. Docs-first Steps 2, 3, 5 and 7, run on the lab

### Step 2: the truth map

| Document | Role | Owns |
|---|---|---|
| `scope.yaml` | canonical | identity, steward, purpose, projects, resources |
| `SCOPE.md` | canonical | purpose and the authority split |
| `AGENTS.md` (`CLAUDE.md` links to it) | canonical | working conventions, where a learning goes, the state rule, the pace rule |
| `decisions/` | canonical | steward decisions (one file before this assessment; three more in the settled patch) |
| `STATE.md` | current state | where the work stands. **Also, wrongly, decisions (F01), history (F19) and stale live facts (F18)** |
| `FRICTION.md` | canonical log | what broke in real use (F22) |
| `memory/authority-rules-step-1.md` | local elaboration, holding a steward decision | authority rules, step 1 |
| `memory/slots-run-walkthrough.md` | historical, dated 28 Sep | one run traced end to end (F23) |
| `AGENT_IDEAS.md` | canonical for ideas not yet issues | ideas, "not approved designs" (F24) |
| `tools/*.mjs`, `status.html`, `reports/<date>.json` | product artifact and generated projection | the diary and the map |
| `reports/*.md`, `research/` | historical | dated reviews and research |
| `skills/`, `workflows/` | empty (`.gitkeep`) | none yet |
| `README.md` | summary | links, and how to build the overview page |

For each major concept, the one canonical home:
- **open work:** orchestrator#140;
- **decisions:** `decisions/`;
- **state:** `STATE.md`;
- **ORC facts:** ORC.

The concepts that have a second home are listed in the ownership table in section 4.

### Step 3: the real loop

1. A fresh session opens `AGENTS.md`, or `CLAUDE.md`, which links to it. That sends it to `STATE.md`, then
   `SCOPE.md`, then orchestrator#140 (on GitHub), then `node tools/map.mjs`.
2. In ORC, a session reads `AGENTS.md`, then `README.md` and `test/architecture.test.ts`, then #140.
3. Work is marked with `node tools/map.mjs working <ref> --agent Claude` and cleared with `stopped`.
4. ORC changes go through a PR. Danger checks the description. Claude merges once review and tests pass, and the tests
   are run locally (F25). After the merge, the checkout is pulled and ORC raises a restart card, which Justin approves.
5. `STATE.md` is overwritten at each verified event, and `FRICTION.md` gains an entry when something breaks.
6. Steward decisions arrive in conversation or interview, and are written into `STATE.md` (F01).

**Where follow-up is lost:**
- `STATE.md` overwrites, which drop decisions and keep stale live facts (F18);
- unattended night runs (`FRICTION.md` 2026-09-30);
- worktrees in `/tmp`, which a power cut emptied (`FRICTION.md` 2026-10-04);
- times typed by hand (F20).

**The handoff point:** the end of the session, before the commit or PR. Merges and restarts follow from there.

### Step 5: bringing the state file up to date

`patches/settled.patch` rewrites lab `STATE.md`. The new version has 45 non-blank lines, including the title, a
five-line header and six headings. It holds:
- the stage;
- what to trust first;
- links to the decision records;
- the live facts, labelled "as last recorded on 4 Oct (not re-read)". The last verified ORC build, `8cee662`, replaces
  the contradictory `369628b`, and the grant shows its recorded end;
- the active fronts;
- what is open for Justin, including this assessment's questions;
- the misleading material nearby;
- two next actions;
- what makes it stale and who refreshes it.

The rewrite drops the history (F19), and nothing is lost: each steward decision moves to `decisions/`, and each open
item is kept. The header's "Target: sixty lines" is kept as it is, because changing it touches Q3. Its replacement is
in the provisional patch. No live fact was re-read: the snapshot cannot be observed.

### Step 7: the guard inputs

**What to do with each existing surface:**
- `dangerfile.js`: **keep.** Amend later with a rule on core-tie rises (Q2).
- `test/architecture.test.ts`: **keep.** Amend per Q1, in the provisional patch.
- `test/core-ties.ts`: **keep.** Its enforcement is amended through Q2.
- `tools/map.mjs --check`: **keep.** Move it into the scheduled diary (#166).
- Both `.githooks/pre-push`: **keep.** A reminder can be added later (see `integration.md`).
- ORC `.github/pull_request_template.md`: **keep.**
- Lab `AGENTS.md` and ORC `AGENTS.md`: **amend.** Add "Before handing off" (provisional, Q5).
- Lab `STATE.md`: **amend** (the settled patch).
- The seven ORC branch reports: **demote** (banner settled; moving or deleting them is Q4).

**The checks, written against these repositories' files.** These are the lines in `guard/SKILL.md` "Checks":

| Matrix risk | Check | Findings |
|---|---|---|
| Parallel truth | the reach lists, the copies of the state directory and setting names, decisions only in `STATE.md` | F04-F06, F21, F33, F01 |
| Stale references | old names in ORC docs and agent definitions after a code change | F07, F13, F15 |
| Superseded material nearby | one-off reports kept out of the live docs | F16 |
| Lost decisions and learnings | decisions go to `decisions/`, and breakage to `FRICTION.md` | F01, F22 |
| State dishonesty | `STATE.md` claims, live facts, times from `date`, the cap | F17-F20 |
| Workflow drift | the map, core-tie rises, the package API steps | F27, F30 |
| Brittle automation | headers' "Today:" claims checked by judgment, not by script | F32 |

**The guard decision: `create`.**
- No guard exists (F28).
- The system is active.
- Justin decided on 4 Oct that "entropy guard at session end" is kept.

---

## 6. Recommendations and cleanup

**What to consolidate, demote or mark as history.**
- **Consolidate:**
  - Steward decisions go into lab `decisions/` (F01, F02).
  - ORC's reach list has one owner, ORC `AGENTS.md` "Boundaries", and `README.md` links to it (F11; Q1).
  - The state file's cap is owned by lab `AGENTS.md` (Q3).
  - The running state directory is owned by ORC (F21, #62).
- **Demote:** the seven ORC branch reports (F16; Q4).
- **Mark as history:** `memory/slots-run-walkthrough.md` (F23). It is already dated, so a one-line note is enough.

**One-time cleanup.** Each item was checked against the current file on 2026-10-07. Track these in lab `STATE.md`
"Next" or as issues on the map, not in the guard.
1. Remove the unused `bookwhen()` and `openFridays()` helpers in ORC `test/architecture.test.ts:410-423`, and the
   three `ORCHESTRATOR_BOOKWHEN_API_TOKEN` stubs (F07).
2. Point the unit's `Documentation=` in ORC `scripts/orc-service.ts:41` at `README.md`, after Q4 (F15).
3. Decide whether the MCP client is dead code or waiting for #46. Then delete it, or correct `MCP.md:4` and ORC
   `AGENTS.md:94` (F13).
4. Restore `FRICTION.md` to newest-first order, and merge the two 2026-09-12 sections (F22).
5. Merge the two "Product search" sections in `AGENT_IDEAS.md` (F24).
6. Copy the three issue decisions of 3 Oct onto #194, MS failure-verdicts and MS #52, if they are not already there
   (F01).
7. Time `node tools/report.mjs` with and without its tests, then correct whichever of lab `README.md:16` and
   `tools/report.mjs:10` is wrong (F34).

---

## 7. Guard generation (`session-coherence-skill-generator` v0.5.0)

**Supplied:**
- this assessment's findings;
- the guard decision `create`;
- the generator's inputs, listed below.

**Inputs:**
- **Steward:** Justin.
- **Documents holding authorised intent:** lab `scope.yaml`, `SCOPE.md` and `decisions/`. Until the settled patch is
  applied, `STATE.md` "North star" and "Decided by Justin" hold some of it. Also ORC `README.md` "Direction" and ORC
  `AGENTS.md`.
- **Decision surface:** lab `decisions/`, with decisions about a single issue on that issue under #140.
- **Open intent questions:** Q1 to Q5. **Unresolved:** where the guard lives (Q5), so its placement is provisional.
- **Current-state file:** lab `STATE.md`, refreshed by whoever causes a verified event (lab `AGENTS.md:33`).
- **Rules bound but not owned:**
  - local-config `home/AGENTS.md`, which every tool's rules file links to (`reports/2026-09-30-skills-one-home.md:17-23`);
  - #140's rules;
  - `HOW_NOT_TO_PLAN.md`;
  - ORC `SECURITY-REVIEW.md` and `dangerfile.js`;
  - authority rules step 1;
  - the merging rule.
- **Verification commands:** `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report` and
  `node tools/map.mjs --check`. None runs by itself; only Danger does.
- **Code areas, with the docs and tests that describe them:**
  - reach: `src/`, `config/` ↔ `AGENTS.md` "Boundaries", `README.md`, `architecture.test.ts`;
  - package API: `src/package-api.ts` ↔ `src/package-api.api.md` and its test, Danger;
  - durable work: `src/*/async` ↔ lab `decisions/2026-09-17…`, `AGENTS.md` "Approval cards";
  - browser: `src/adapters/browser` ↔ `MCP.md`, `SECURITY-REVIEW.md`;
  - service: `src/adapters/orc-service.ts` and `scripts/` ↔ `README.md` "As a service";
  - core ties ↔ `test/core-ties.ts`;
  - module headers ↔ `scripts/source-headers.js`;
  - the lab's tools ↔ lab `README.md`.
- **Live state a session can change:**
  - restarts (by card only);
  - package, grant and durable-work cards;
  - the policy scripts (`grant:tool`, `grant:operation`);
  - ntfy;
  - Bookwhen, through Moving Stillness, which is paused;
  - invoices;
  - marks on the map.
  No spending rule is recorded in either repository; the guard points at local-config.
- **Findings:** F01 to F34.

**The guard:**
- **Path:** `guard/SKILL.md`. Its proposed home is lab `skills/session-coherence-guard/SKILL.md`, provisional on Q5.
- **Placeholders:** filled in for Justin, the intent documents and `decisions/`.
- **Intent-change rule:** version 2 copied in.

**Size against the budget**, measured with `wc -w` on 2026-10-07:

| Term | Words |
|---|---|
| Common contract | 706 |
| Checks: 11 lines, of which 9 go beyond the template's two standing ones, at 36 words each | 324 |
| Pointers ("Where things live" values) | 61 |
| Commands (the bash block, 40 words, plus the live-changes line, 27 words) | 67 |
| **Budget** | **1,158** |
| **Actual** | **1,047** |

The guard is within budget, and nothing was cut to get there.

**Review before handover:**
- The guard carries "Modes and safety", and binds a baseline for each repository it touches.
- Every proposed change is sorted. Nothing in the settled patch touches Q1 to Q5. The provisional patch names its
  questions per file.
- No repair instruction permits editing intent documents to match the work.

**Doc references:** the "Before handing off" pointers in lab `AGENTS.md` and ORC `AGENTS.md` are in the provisional
patch (Q5).

**Validation run:**
- `git diff --no-index --check` over both patches: no whitespace errors.
- Both patches applied with `patch -p1` to fresh copies of the snapshots, settled first: clean.
- Not run: `pnpm test` and `pnpm typecheck`, because there is no `node_modules`. The provisional test edit is
  therefore untested.

**Open questions the guard leaves visible:** it points at the proposals file (P1, P2) and at `STATE.md` "Open for
Justin" (Q3 to Q5).

**Handoff:** to `guards-integrator`, whose output is `integration.md`.

---

## 8. Uncertainties, and what was not covered

**What was not covered:**
- **GitHub:**
  - orchestrator#140 and its rules;
  - every issue and PR cited (#76, #101, #152, #184, #197 and others), including whether each reach was approved in
    its PR;
  - the results of Danger's runs;
  - the Project board.
- **Files outside the two repositories:**
  - local-config `home/AGENTS.md` and its push-summary script;
  - `HOW_NOT_TO_PLAN.md`;
  - `pro/scope/docs/MODEL.md`;
  - `pro/agentic/agentic-architecture/MODEL.md`;
  - `~/.claude/settings.json`;
  - ORC's environment file and state directory;
  - the Moving Stillness, finance and ops-tool repositories.
- **Git:** there is no history. Enacted intent was read from `STATE.md` and `FRICTION.md`, and whether the hooks are
  enabled is unknown.
- **What the libraries do for ORC:** Pi, Playwright and the MCP SDK. Their behaviour could not be checked, because
  `node_modules` is absent. Every reach and credential list here is marked incomplete for it.
- **Tests, type checks and the live service:** not run or observed.
- **Partial reads:**
  - `reports/`: 76 files, read selectively;
  - `FRICTION.md`: about two thirds read;
  - the `web/` client: listed, not read.

**Uncertainties:**
- Whether F06 (the phone connector reaching ntfy) and F04 and F05 (the Chromium) were authorised in their PRs. Q1
  exists for this.
- Whether F13's MCP client is dead code or reserved for later.
- Whether "entropy guard at session end" was meant to run in one repository or both. Q5 exists for this.

**Where each claim came from:** every finding cites a file and line in these snapshots, read on 2026-10-07. A date
attached to a claim is the source's date, not a fresh observation.

**A proposal is not a decision:** P1, P2 and Q1 to Q5 are proposals. Only the copies in `decisions/` record decisions,
and each of those was already taken by Justin.

---

## 9. Feedback on entropy-guard

1. **The generator assumes one repository.** Its contract and its default path, `skills/session-coherence-guard/SKILL.md`,
   assume a single repository. For a system spanning two, nothing says where the guard lives, or how "What changed"
   finds a baseline in each, so this had to become a question for the steward (Q5).
   **Suggestion:** a line in the generator for multi-repository systems. Place the guard in the repository that
   manages the work, and bind a baseline per repository touched.
2. **Docs-first Step 5 assumes the state file can be edited in place.** In audit or snapshot runs, the patch form, and
   the sort into settled and provisional, have to be inferred from Step 6 and "Rules along the whole route".
   **Suggestion:** say so in Step 5.
