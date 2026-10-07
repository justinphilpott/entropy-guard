# Entropy assessment: ORC and the orchestration-lab Scope, as one system

Run on 2026-10-07 with entropy-guard's `entropy-assessment` v0.9.0, against read-only snapshots of two repositories
taken on 4 October 2026 (no `.git`, no `node_modules`):

- **ORC**, `orchestrator/` (checked out at `~/pro/orchestrator`): a TypeScript local-first agent orchestrator.
- **The lab**, `scope-orchestration-lab/` (checked out at `~/scopes/scope-orchestration-lab`): the Scope that manages
  ORC's work, holding its state, decisions, friction log, reports and three Node tools.

**Mode and limits.** Build mode, as the brief asks for the route carried through. The targets are read-only, so every
edit is delivered as a patch in `patches/` and nothing was applied. No steward was available: questions and their
recommended answers are in `questions.md`, and work that depends on them is only in the provisional patches. Live
services (ORC's running service, GitHub, ntfy, Bookwhen) were not read; every live fact below is quoted from a file
with that file's date.

**Route taken.** Front door, `entropy-assessment` Step 1 (intent pass) and Step 2: lifecycle active, shape B (mixed
docs and code) across two repositories, so `mixed-profile.md` for the system, plus docs-first Steps 2, 3, 5 and 7 on
the lab, whose job is managing the work. Step 3 guard decision: `create`. Step 4 handed to
`session-coherence-skill-generator`, which wrote `guard/SKILL.md` and handed to `guards-integrator`
(`integration.md`).

## 1. Intent

### The steward

**Justin.** The lab's `scope.yaml:6` says `steward: justin`, and `members` gives `justin` the `admin` role. ORC names
no steward in its own files; its `README.md:3` calls it "Justin's local-first personal agent", and its `AGENTS.md`
quotes "Justin" and "the operator" with dates. ORC is the lab's one active project (`scope.yaml:10-20`), so the lab's
steward is ORC's.

### Authorised intent, with the source of each part

| Part | Source | Kind and authority |
|---|---|---|
| The lab develops and operates ORC and its reusable Scope-owned agents | lab `scope.yaml:5,13`; `SCOPE.md:3-7` | Scope definition, steward named; undated |
| Facts about ORC live in ORC; about the Scope model in `pro/scope`; about their relationship in the lab | lab `SCOPE.md:17-24` | Directive; undated |
| ORC is Justin's "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; once the six slots work, work towards a point of consolidation | lab `STATE.md:8-11` | Steward, attributed and dated (25 and 26 Sep), held only in an overwritten state file (F1) |
| Iris as front door; ADA to create agents; every agent belongs to a Scope; candidates cannot grant themselves authority | ORC `README.md:9-23` | Description of direction; undated |
| Core ships with no tie to a Scope, model, owner or agent | ORC `AGENTS.md:30-45` | Steward, attributed and dated (12 and 13 Sep) |
| No agent holds the lethal trifecta; approval in a prompt is not a control; new authority needs an explicit human choice | ORC `AGENTS.md:68-112` | Directive; partly sourced to issue #20 |
| ORC owns a general async-work capability: task types declare delivery, retry, approval and schedule; SQLite store | lab `decisions/2026-09-17-async-work-architecture.md` | Steward decision, attributed and dated (17 Sep) |
| Authority rules 1, 2, 4 and 5 affirmed; 3, 6, chat handling and Iris's role open | lab `memory/authority-rules-step-1.md` | Steward answers, attributed and dated (1 Oct) |
| Scope logins "should DEFINITELY NOT be centralised" | ORC `src/adapters/scope-credentials.ts:15-16` | Operator, dated (28 Sep), quoted in code |
| ORC drives Playwright's library rather than Playwright MCP | ORC `src/adapters/browser/playwright.ts:10`; `MCP.md:3` | "decided 3 Oct 2026" under orchestrator#76; dated, the decider not named in the snapshot (the lab's `reports/2026-10-03-browser-stack-prior-art.md:74` says it is Justin's decision) |
| The lab is the central Scope; where issues live; the nine processes kept, among them "entropy guard at session end"; scheduling (#166) first; this assessment | lab `STATE.md:38-55` | Steward, attributed and dated (4 Oct), held only in the state file (F1) |
| Pace: one scored real use before new design work | lab `AGENTS.md:25-29`, pointing to `~/pro/agentic/HOW_NOT_TO_PLAN.md` | Directive; undated; see F6 |

Rules the system is bound by but does not own, not read here because they sit outside the snapshot:
`~/pro/local-config/home/AGENTS.md` (cited by lab `STATE.md:16-19`), `~/pro/agentic/HOW_NOT_TO_PLAN.md`,
`~/pro/scope/docs/MODEL.md`, and the rules in orchestrator#140's description.

### Three readings

- **Declared.** ORC is a local-first personal agent whose reach is narrow and listed (`README.md:3-7`,
  `AGENTS.md:92-104`), with reminders, scheduling, more data sources, workflow execution and file edits deliberately
  absent (`README.md:152-154`).
- **Enacted.** The last fortnight built durable work with schedules, a restart card that builds and restarts ORC,
  Playwright driven inside ORC, phone notices for packages, Scope credentials, invoicing through the finance Scope,
  the map of work (#140) with its tools, Danger on pull requests, and resolve-before-acting (#193) (lab `STATE.md`,
  `FRICTION.md` 26 Sep to 4 Oct, ORC code).
- **Authorised.** Most of what was enacted has a recorded decision: durable work and scheduling (17 Sep), Scope
  credentials (28 Sep), the browser in ORC's process (#76, 3 Oct), Danger (2 Oct), the map (2 Oct, quoted in
  `tools/map.mjs:4`). The gap is mostly between the declared reading and the other two: ORC's `README.md` was
  last substantively written on 13 Sep (lab `reports/2026-10-01-design-review.md`, section 2d).

### Gaps by condition

| Condition | Findings |
|---|---|
| Stale description | F3 (scheduling only), F4, F11 |
| Conflict | F5 |
| Missing | F1 (a durable record for decisions held only in `STATE.md`), F2 (ORC's decision record) |
| Ambiguous | F3 (the rest of the list, Q5), F6, F9 (Q1) |
| Unauthorised drift | none found that no decision covers; F9 is either drift or a stale document, and is Q1 |
| Prose control | F18 (Danger's check does not block), F17 ("enforced" checks nobody runs automatically), F5 (a cap nothing checks) |

### Existing guards' repair instructions

No entropy guard exists in either repository (F19). The other guard-like surfaces (`SECURITY-REVIEW.md`,
`dangerfile.js`, `test/architecture.test.ts`, `test/core-ties.ts`, `tools/map.mjs --check`, both `.githooks/pre-push`)
were read for repairs that change intent or keep two definitions in step. None does. `AGENTS.md:47-48` ("a count may
only fall, and its allowance falls in the same change") updates a ratchet's allowance with its count, an
independent check of one contract, not a competing definition.

### Questions and proposed changes

Five questions, Q1 to Q5, each with a recommended answer, in `questions.md`. Proposed changes are recorded as patches:
settled ones in `patches/settled-*.patch`, and those that depend on a question in `patches/provisional-*.patch`. No
intent document is changed except where a recorded steward decision settles it (section 10).

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** `scope.yaml:7` `status: active`, project `orchestrator` `status: active`; `STATE.md` updated
  2026-10-04 17:31; work merged and restarted on 4 Oct (`STATE.md:23-37`). The archived `status-tracker` project is
  outside this assessment.
- **Shape: B, mixed docs and code, across two repositories.** ORC is about 30,000 lines of TypeScript (the design review of 30 Sep
  counted 24,135 in `src/` and 5,616 in `web/src/`) with 67 test files and 15 markdown documents at its root; the lab is markdown (state, decisions, friction, 77 reports) with three Node tools
  that read ORC and GitHub. The riskiest shape that fits is B; D (workflow-heavy) also fits the lab, whose processes,
  map and diary are its main surface, and that is covered by running docs-first Steps 2, 3, 5 and 7 on it.
- **One system.** The lab's `STATE.md` holds ORC's current state, the lab's `decisions/` holds ORC's architecture
  decision, the lab's tools read ORC's checkout and database, and both `AGENTS.md` files send agents to the same map
  (orchestrator#140).

## 3. Findings

One list; later sections refer to these ids. Severity is the real size, not the worst case.

**F1. Steward decisions held only in an overwritten state file.** Lab `STATE.md` holds Justin's north star (25 and
26 Sep, lines 8-11), the merge rule (25 Sep, line 17), the 4 Oct interview decisions (lines 38-55), the 3 Oct
decisions on #194 and Moving Stillness (lines 57-58) and the 2 Oct decisions on Worktrunk and Danger (lines 76-82).
`AGENTS.md:33` says `STATE.md` "is overwritten at each verified event". Searched `decisions/`, `memory/`, `reports/`
and ORC's documents and code with `rg`: only the north star is quoted elsewhere (`reports/2026-09-30-priorities.md:7`)
and Danger in `dangerfile.js:7`. GitHub issues could not be read. Medium: the next overwrite can drop them.

**F2. ORC has no decision record of its own.** ORC's decisions sit in the lab's `decisions/` (one file), the lab's
`STATE.md` (F1), code comments (`playwright.ts:10`, "orchestrator#76, decided 3 Oct 2026"), `AGENTS.md` quotations
and GitHub issues. The lab's `SCOPE.md:19` says facts about ORC belong in ORC. Q3.

**F3. ORC README's "Deliberately absent" list.** `README.md:152-154` lists "reminders, scheduling, additional external
data sources, workflow execution, sandboxes, shell access, and file edits", each needing "a decision rather than a
convenience". Scheduling was decided on 17 Sep and is built (`src/core/async/types.ts:72`, `src/app/async/calendar.ts`,
the `schedules` table in `src/adapters/async-store/sqlite.ts:41`), so that word is a stale description. The other
items are ambiguous against the package-card model (packages bring browser, calendar, mail, client-record and
advert-file connectors, `config/installation.ts:116-168`; the advert files are "written beneath" a vault folder,
lines 116-119). Q5.

**F4. ORC README's reach and plan sentences.** `README.md:3-7` says ORC "launches one isolated fixed researcher
child" and that "its read-only external data paths are published Bookwhen events, fixed Bookwhen admin inspection and
planning operations, and public webpages through Jina Reader". `README.md:146-147` says the Moving Stillness
specialist calculates "a slot-change plan without applying it". The decision of 17 Sep makes applying slots durable
work with `approval: required` (decision file, Consequences); ORC now also launches MCP servers, the restart card's
commands and Chromium (F7); the published-events path is gone from ORC (`test/architecture.test.ts:1315-1320`).

**F5. Two caps for `STATE.md`.** Lab `AGENTS.md:34` "capped at about forty content lines"; `STATE.md:4` "Target:
sixty lines". The file was 99 lines (87 non-empty) on 4 Oct. Neither number is dated or attributed, and nothing checks
either. Q2.

**F6. The pace rule and the 21 Sep calibration.** Lab `AGENTS.md:27-29`: `HOW_NOT_TO_PLAN.md` "governs new design
work: one scored real use must come first." Justin on 21 Sep, quoted in `reports/2026-09-22-pushback-analysis.md:129-133`
and `-astra.md:145`, asked for "what is naturally needed given where we are and what's likely coming next".
`reports/2026-09-25-direction-review-astra.md:72` reads them as compatible. Ambiguous only at the edge (whether
scheduling, decided on 4 Oct to come first, needs a scored real use before design); the 4 Oct decision already
settles that case, so no question was asked. Low.

**F7. ORC's subprocess list is incomplete.** `AGENTS.md:92-96` names three modules that launch subprocesses. The code
also launches from `src/adapters/orc-service.ts` (git reads, `pnpm install --frozen-lockfile`, `node
scripts/build.mjs`, `systemctl --user restart orc.service`; lines 71, 102, 107, 128) and
`src/adapters/browser/playwright.ts:55` (`chromium.launch`, headless Chromium through Playwright's library). Approved
packages run inside ORC's process and may use any Node built-in, child processes included
(`src/adapters/agent-files/package-resolution.ts:1-20`, orchestrator#171). `test/architecture.test.ts:828-857`
confines subprocess modules to four (it includes `orc-service.ts`, and its comment omits the build step) and cannot
see Playwright's launch, because it matches `node:child_process`, not a library that launches. Reach record in
section 5. Medium-high: the boundary document and its test both describe a smaller system than runs.

**F8. ORC's network "only" claim is incomplete, and names a deleted module.** `AGENTS.md:98-104`: "Direct network
access exists only in `src/core/research-tools.ts` ... and in `src/adapters/notifications/ntfy.ts` ...
`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client". `src/bookwhen.ts` does not exist and
`@jphil/bookwhen-client` is not a dependency (`package.json`; the test asserts both at
`test/architecture.test.ts:1315-1316`). ORC also reaches the network through Chromium (`playwright.ts:55, 215`, kept to
approved hosts by a proxy rule), Pi's model calls, the restart card's `pnpm install`, MCP servers, and packages'
connectors inside its process (for example the mail connector `config/installation.ts:159-168` points at
`smtp.protonmail.ch`); it listens on loopback (`src/web-cli.ts:486`). `test/architecture.test.ts:1295-1317` agrees
with the document, and both miss the same reach: a document and a test that agree are not evidence of completeness.
Reach record in section 5.

**F9. Packages reach the ntfy transport through the phone connector.** `src/adapters/phone/index.ts` (2 Oct, #184)
lets an approved package send a notice with its own title, text, up to five tags and any `http`/`https` tap address
(lines 26-52) through `publishNtfy`. That contradicts `AGENTS.md:100-102` ("No model or agent reaches the ntfy
transport, and it sends only a title, the notice's summary and the one configured tap address") and the comment at
`test/architecture.test.ts:63`. The test still passes because the adapter passes `fetch` as a value. Whether this is
authorised reach (the document is stale) or drift (the code should limit the tap) is Q1. Low-medium: the topic and
server are fixed by the installation.

**F10. Credentials: where they are read, and subprocesses that inherit them.** `README.md:103-104`: "A credential is
read in exactly one place, `src/runtime.ts`, and handed to the narrow connector that needs it. No subprocess ORC
launches receives one." `src/runtime.ts` reads no credential. `src/web-cli.ts:625` reads `ORCHESTRATOR_WEB_TOKEN`;
`src/app/agent-packages.ts:766-780` resolves a connector's credentials from an environment variable or a Scope file
read by `src/adapters/scope-credentials.ts:28,43`. `scripts/orc-env.sh:45` exports every line of
`~/.config/orchestrator/env`, where `README.md:91` says credentials live, into ORC's environment, and
`src/adapters/orc-service.ts` runs git, `pnpm install`, the build and `systemctl` through `execFile` with no `env`
option (lines 15, 71, 102, 107, 128), so those children inherit ORC's whole environment. The researcher child gets
an isolated environment (`src/core/child-agent-process.ts:371-383`). Chromium is launched with no `env` either
(`playwright.ts:55`) and may inherit it; MCP servers' environment depends on the SDK and was not checked. This
violates a documented constraint (also `AGENTS.md:106`), so per the intent-change rule the code is the defect, not
the document. `AGENTS.md:64-65` states the aim that "credentials are read in one place"; the 28 Sep decision on Scope
logins makes a second place deliberate, and whether the aim still holds otherwise is open (not asked). Medium: which
credentials the env file holds today could not be read.

**F11. ORC README's Bookwhen token paragraph is stale.** `README.md:76-79` says to set
`ORCHESTRATOR_BOOKWHEN_API_TOKEN`, used through "exact-pinned `@jphil/bookwhen-client@0.6.1`". No source reads it
(only tests stub it: `test/activate-research-agent.test.ts:153` and two others); the calendar connector takes
`scope:calendar.api-token` (`config/installation.ts:121`). Already found by the lab's design review of 30 Sep (section
2d) and the synthesis of 1 Oct (item 7), and still unchanged.

**F12. One-off reports beside ORC's live documents.** Twelve reports at ORC's root (`CLASSIFY`, `FIXES`, `GRANTS-E2E`,
`GRANTS`, `MCP`, `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`, `TURN-RECORD`, `VISIBILITY`). Several describe
September branch states as current: `REWORK.md:3` "Nothing committed, nothing pushed"; `SEAM.md` and `OPERATOR.md`
"Nothing is pushed". `MCP.md` carries a banner marking its browser sections as history. Already found by the design
review of 30 Sep (section 2d, refactor target 4: move unique facts, then delete). Medium: superseded material nearby.

**F13. The lab's README against `tools/report.mjs`.** `README.md:16-18` documents `--serve` on port 4190;
`report.mjs` has no such flag and says "nothing is served" (line 13). The README times a full run at about ten
seconds; `report.mjs:10` says about two minutes with the suites and ten seconds without. The README says `--no-tests`
"keeps the day's test count"; the code writes `suites: null` into the day's `reports/<date>.json` (lines 51, 313), so
it replaces a count an earlier run recorded that day: a small data-loss defect. The README does not say that each run
also writes to the GitHub Project (`report.mjs:56`, `syncProject`).

**F14. The lab's `STATE.md` contradicts itself.** On 4 Oct:
- "**Where we are now:** #193 ... is built and in review, not merged" (line 23) against "#193 is live: #200 merged as
  `3989cdb`" (line 31);
- "ORC live: 369628b since 22:12:47" (line 58) and "main process started 2026-10-03 22:12:47 on `369628b`" (line 88)
  against "#195 live (`8cee662`, restarted 14:48:27, verified)" (lines 35-36);
- Moving Stillness `main` `c759f96` (line 91) against "MS #53 merged as `fc830aa`" (line 32);
- "Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z" (lines 93-94), stated as current three days after it
  ended.

`FRICTION.md` records the same failure twice before (12 and 22 Sep: "a state file that lied twice"). Medium-high.

**F15. The lab's learning table omits two places agents must write.** `AGENTS.md:12-20` sends learnings to ORC,
`pro/scope`, `memory/` and `scope.yaml`. It does not name `FRICTION.md`, which `STATE.md:4` and the kept process
"FRICTION into rules, monthly (#60)" rely on, nor `decisions/`. Low-medium.

**F16. Seams from the lab's tools into ORC and into the lab's own files, with no test.**
- `tools/collect.mjs:16` hard-codes ORC's state directory as `~/.local/share/orchestrator-proof`; ORC's default is
  `~/.local/share/orchestrator` unless `ORCHESTRATOR_STATE_DIR` is set (`src/runtime.ts:190`). It matches today
  through the env file, per `memory/slots-run-walkthrough.md:19`.
- `collect.mjs:123-148` queries ORC's SQLite tables `tasks` and `events` and their columns directly; ORC owns them in
  `src/adapters/async-store/sqlite.ts:52-80`.
- `collect.mjs:164-188` reads ORC's shipped agents from `src/core/*.md`; the design review's refactor target 3 moves
  them.
- `tools/map.mjs:184` parses `STATE.md` for `**Where we are now:** <ref>`, and `collect.mjs:151-160` parses
  `FRICTION.md`'s `## YYYY-MM-DD — title` headings and `- **` bullets.

Every reader returns null or empty when its source fails (`collect.mjs:2-4`), so a broken seam shows as a quiet gap
in the diary. Medium.

**F17. The checks called "enforced" run only by hand.** `README.md:135,170` says `pnpm test` "enforces" the
boundaries. GitHub runs only Danger (`.github/workflows/danger.yml`), which checks pull-request descriptions. Tests,
type checks and the E2E suite are not run by CI; the synthesis of 1 Oct ranks "Nothing runs the tests" first and
records the E2E suite red on `main` for a week. Tests on every PR (#144) is a kept process (4 Oct) whose mechanism is
still waiting on Justin (`STATE.md:69`). The lab's diary runs ORC's `vitest` when it runs (`collect.mjs:191-196`);
what triggers it was not found (F24). Medium-high.

**F18. Danger's check warns and does not block.** `SECURITY-REVIEW.md` "Recording it": "without GitHub Pro a failed
check warns rather than blocks a merge. Merge only when it is green." And a direct push to `main` is not checked
(`AGENTS.md:143`). The rule reads as enforced; only a person's discipline enforces it. Medium.

**F19. Kept processes with nothing behind them yet.** Of the nine processes Justin kept on 4 Oct: "entropy guard at
session end" has no guard in either repository (declared, missing); the weekly adversarial review, `/tmp` cleanup
(#182) and FRICTION into rules (#60) have no mechanism in the snapshot and wait on scheduling (#166), which was chosen
to come first (decided, not built).

**F20. An ORC session never meets the lab's state.** ORC `AGENTS.md:3-12` sends agents to `README.md`,
`test/architecture.test.ts` and orchestrator#140. Nothing points to the lab's `STATE.md`, `decisions/` or
`FRICTION.md`, which hold ORC's current state and decisions. ORC has no `CLAUDE.md`, so whether Claude Code sessions
in ORC's checkout load ORC's `AGENTS.md` at all is unknown (the lab links `CLAUDE.md` to `AGENTS.md`). Medium.

**F21. The core-ties ratchet does not cover `config/`.** `AGENTS.md:30-45` and `test/core-ties.ts` cover `src/` and
`web/src/`; `config/installation.ts` names `scope-moving-stillness`, `scope-finance`, `movingstillness.bookwhen.com`,
`smtp.protonmail.ch` and a model. This may be within the rule, which lets a model reach core "from configuration".
Already the subject of the design review's refactor target 1. Low.

**F22. Dead test helpers name deleted modules.** `test/architecture.test.ts:415-423` imports
`../src/workflows/bookwhen-event-admin/open-fridays.js` and `../src/bookwhen.js` in helpers that nothing calls. Low.

**F23. "The client owns no persistence".** `README.md:142-143`; `web/src` keeps the rail's width and collapsed state
in `localStorage` (`web/src/app.test.tsx:110-144`) and the token in `sessionStorage`, which the README itself
mentions (lines 67-68). Low.

**F24. Whether hooks and the nightly diary run is unknown.** Both repositories' `.githooks/pre-push` only print
local-config's `push-summary`; whether `core.hooksPath` points at them cannot be seen in a snapshot without `.git`.
`report.mjs:56` calls the diary "the nightly job"; nothing in either repository schedules it.

## 4. The lab, docs-first: who owns which truth, and the real loop

### Truth map

| Concept | Canonical home | Also stated in (role) |
|---|---|---|
| This Scope's identity, resources, steward | `scope.yaml` | `SCOPE.md` (summary), `README.md` (links) |
| This Scope's purpose and authority | `SCOPE.md` | `scope.yaml` `purpose` (summary) |
| What ORC is for | ORC `README.md` "Direction" | lab `STATE.md` "North star" (steward's words, only copy: F1) |
| ORC's boundaries and reach | ORC `AGENTS.md` "Boundaries" | `README.md:3-7,103-104,145-154` (second, staler copy: F4, F8, F10); `test/architecture.test.ts` (independent check, incomplete: F7, F8) |
| Which paths need a security review | ORC `dangerfile.js` `GUARDED` | `SECURITY-REVIEW.md`, PR template (point to it) |
| Current state of all the work | lab `STATE.md` | `status.html` (generated), `reports/<date>.json` (generated) |
| Open work | GitHub issues under orchestrator#140 | `tools/map.mjs` (projection), `STATE.md` "Waiting on Justin" (summary) |
| Decisions | lab `decisions/` (one file) | `STATE.md` (F1), `memory/authority-rules-step-1.md` (steward answers), code comments and issues (F2) |
| What broke in real use | lab `FRICTION.md` | none |
| Facts about the relationship | lab `memory/` | none |
| Agent ideas | lab `AGENT_IDEAS.md` | none |
| Working rules | `~/pro/local-config/home/AGENTS.md` (outside) | lab `AGENTS.md`, lab `STATE.md` "How we work" (summary plus one decision: F1) |
| The diary's input formats (product artifacts read by code) | `tools/map.mjs:184`, `tools/collect.mjs:151-160` | the `STATE.md` line and `FRICTION.md` headings they parse (F16) |
| Historical | lab `reports/` (77 dated files), `research/`; ORC's 12 root reports (F12), `MCP.md` browser sections | none current |

### Loop map, as it runs

1. **Start.** A lab session reads `AGENTS.md` (`CLAUDE.md` links to it), then `STATE.md`, `SCOPE.md` and
   orchestrator#140, and marks its issue with `node tools/map.mjs working <ref> --agent Claude`. A session started in
   ORC reads ORC's `AGENTS.md`, `README.md`, the architecture test and #140, and never `STATE.md` (F20).
2. **Work.** In an ORC worktree or branch (the 4 Oct power cut showed worktrees in `/tmp` do not survive a reboot;
   #196 is open). Tests and type checks by hand (F17).
3. **Review and merge.** Pull request; Danger checks the description sections (F18); Astra reviews on request; Claude
   merges once review and tests pass (Justin, 25 Sep).
4. **Go live.** Pull ORC's checkout; within a minute ORC raises "Restart ORC onto <commit>"; Justin approves; the
   session verifies start time, `build.json` and health (`STATE.md:31`).
5. **Record.** Overwrite `STATE.md` at each verified event; a dated `FRICTION.md` entry for what broke; `map.mjs
   stopped`. Decisions land in `STATE.md` (F1).
6. **Handoff.** At session end, through `STATE.md` and the final message. The diary (`report.mjs`) redraws the map;
   its trigger is unknown (F24).

**Where follow-up gets lost:** decisions in an overwritten file (F1), ORC sessions that never read the state (F20),
and live facts that go stale between overwrites (F14).

## 5. Drift between domains (mixed profile)

**Domains present and actively changed:** code, documentation, tests, API and data contracts (the package API report
`src/package-api.api.md`, ORC's SQLite schema read by the lab), workflow and process (map, diary, Danger, hooks,
processes kept on 4 Oct), and live operational state (`orc.service`, restart and package-build cards, grants, ntfy,
GitHub Project 4, Bookwhen through Moving Stillness, which is paused, and invoicing through the finance Scope).

**Repositories and ownership.**

| Concept | Owner | Second home |
|---|---|---|
| ORC's code, boundaries, package API | ORC | none |
| Current state, decisions, map tooling, friction | the lab | ORC decisions also in code comments and issues (F2) |
| ORC's state directory | ORC's env file (`ORCHESTRATOR_STATE_DIR`) | `tools/collect.mjs:16`, hard-coded (F16) |
| ORC's durable-work schema | `src/adapters/async-store/sqlite.ts` | `tools/collect.mjs:123-148` queries it (F16) |
| ORC's shipped agents | `src/core/*.md` | `tools/collect.mjs:164-188` lists them (F16) |
| Which repositories the map covers | `tools/collect.mjs:19-26` `REPOS` (six) | #140's description (not readable); `scope.yaml` lists the Scope's own resources, a different concept |

The seams with packages in other Scopes (connector setting names in ORC and in each manifest, orchestrator#198;
packages cannot test against ORC's real parts, #202) are outside these two repositories and already have issues.

**Docs against implementation:** F4, F10, F11, F13, F22, F23. **Docs against docs:** F5, F14. **Tests against
implementation:** F7, F8 (patterns that miss library reach), F22. **Contracts against implementation:** the package
API report has a test and a Danger rule (`AGENTS.md:132`, `dangerfile.js:50-57`); the lab's reads of ORC's schema
have none (F16). **Workflow against reality:** F17, F19, F24. **Rules against enforcement:** F5, F17, F18.

### The reach record (for F7, F8, F9, F10)

Patterns, run with ripgrep (`rg`, installed; ast-grep and Semgrep are not installed here) on 2026-10-07:

- launch: `from "node:child_process"|\bspawn\(|\bexecFile\(|\bexecFileSync\(|\bexecSync\(|\bfork\(|StdioClientTransport|chromium\.launch|\.launch\(|launchPersistentContext|launchServer|systemctl|process\.kill\(`
- network: `\bfetch\(|from "node:https?"|from "node:net"|from "node:dns"|from "node:tls"|https?\.request\(|WebSocket|createServer\(|\.listen\(|undici|axios|bookwhen-client|connectOverCDP|\.goto\(|StreamableHTTPClientTransport|SSEClientTransport|newContext\(|route\(`,
  then `fetch|request|post` in `src/adapters/notifications/` and `src/adapters/phone/` for `fetch` passed as a value
- credentials and environment: `process\.env`, `ORCHESTRATOR_BOOKWHEN_API_TOKEN`, and the credential readers found
- storage: `writeFile|appendFile|DatabaseSync|mkdir\(|rename\(|createWriteStream`; in `web/src`,
  `localStorage|sessionStorage|indexedDB`

Paths searched: ORC's `src/`, `web/src/`, `scripts/`, `config/`, `e2e/`; the lab's `tools/`.

| Hit | What it does | Process that runs it |
|---|---|---|
| `src/core/child-agent-process.ts:532` `spawn(process.execPath, …)` | launches the Pi researcher child, isolated environment (lines 371-383) | ORC (service or CLI) |
| `src/core/analysis-tools.ts:300` `spawn("git", …)` | read-only `git log` | ORC, for the analyst |
| `src/adapters/mcp/client.ts:60` `StdioClientTransport` | launches a declared MCP server | ORC |
| `src/adapters/orc-service.ts:71,102,107,128` | git reads, `systemctl --user restart`, `node scripts/build.mjs`, `pnpm install --frozen-lockfile`; no `env` given | ORC, inside an approved restart card |
| `src/adapters/browser/playwright.ts:55,215` | launches headless Chromium; `page.goto` to approved hosts | ORC, for a package's browser connector |
| `src/core/research-tools.ts:8` `node:https` request | Jina Reader | the researcher's Pi child |
| `src/adapters/notifications/ntfy.ts:97` `fetchImpl(…POST)` | the one ntfy publish | ORC (durable-work outbox, and packages through the phone connector) |
| `src/adapters/phone/index.ts:14` passes `fetch` to `publishNtfy` | packages' notices | ORC, called by package code |
| `src/web-server.ts:159`, `src/web-cli.ts:486` | HTTP server on loopback | ORC |
| `src/file-lock.ts:158,174` | abstract socket used as a lock | ORC |
| Pi (`@earendil-works/pi-coding-agent`, imported by `src/backends/pi/*`, `src/runtime.ts`) | model provider calls, delegated | ORC and the Pi child |
| Approved package code (`package-resolution.ts:1-20`) | any Node built-in, delegated | ORC |
| `src/web-cli.ts:625`, `src/app/agent-packages.ts:774-777`, `src/adapters/scope-credentials.ts:28,43` | read credentials | ORC |
| `scripts/orc-env.sh:45` | exports the env file into the environment | the systemd unit and dev mode, at start |
| `web/src/api.ts:243-435` `fetch` | same-origin calls to ORC's API | the operator's browser |
| `scripts/build.mjs:17-18`, `scripts/orc-service.ts:93-122`, `scripts/dev-web.mjs:89`, `scripts/update-pi.mjs:32`, `scripts/dev-web-readiness.ts:7` | node, git, systemctl, dev servers, port probes | an operator's shell, or the restart card's build |
| lab `tools/collect.mjs` (`gh`, `git`, `bash -c "pnpm -s exec vitest run"`, `node:sqlite` read-only), `tools/map.mjs` (`gh project item-add`, `item-edit`) | reads GitHub, checkouts and ORC's database; runs test suites; writes to GitHub Project 4 | an agent's or Justin's shell; the nightly trigger is unknown |

**Not covered:** library internals (no `node_modules` in the snapshot: Pi, Playwright's default environment for
Chromium, the MCP SDK's default environment, pnpm), the code of Scope packages (outside both repositories), which MCP
servers are declared at run time, and the contents of `~/.config/orchestrator/env`. Any list built from this record
is marked incomplete for those.

### Ranked risks (decay rate times recovery cost)

1. **The reach boundary is described smaller than it is** (F7, F8, F9, F10). Decays with every capability pull
   request; recovery is costly because security decisions cite `AGENTS.md` and the architecture test, and the
   history here includes a prose control cited in a safety decision (`FRICTION.md`, 20 to 22 Sep). Anchor: ORC
   `AGENTS.md` "Boundaries", one owner.
2. **The state file lies and holds decisions it can lose** (F1, F14, F5). Overwritten many times a day; the cost is a
   confident wrong answer or a lost decision, both seen before (12 and 22 Sep). Anchor: lab `STATE.md` plus
   `decisions/`.
3. **The checks run only when someone remembers** (F17, F18, F24). Decays quietly; a red E2E suite went unseen for a
   week. Anchor: #144, already decided in principle.
4. **Seams between the lab's tools and ORC** (F16, F13). Breaks when ORC's durable work is moved (refactor target 2)
   or agents move (target 3), and hides the break as an empty section. Anchor: ORC's schema in `sqlite.ts`.
5. **Superseded material beside live documents** (F11, F12, F4). Slow decay, moderate cost: a newcomer or an agent
   acts on a September branch report or a removed variable (`FRICTION.md` 27 Sep: an instruction "named a tool that
   was gone, and I copied it"). Anchor: design review target 4.

## 6. Existing guard surfaces, sorted by whether they execute

| Surface | Runs | Keep, amend, replace or demote |
|---|---|---|
| Danger on every pull request (`danger.yml`, `dangerfile.js`): security-review and package-API sections | by itself, on GitHub; warns, does not block (F18) | keep |
| `pnpm test` with `test/architecture.test.ts`, `test/core-ties.ts`, `test/package-api-report.test.ts` | only by hand (F17) | amend: add library-launch and value-`fetch` patterns, and a check that `orc-service.ts` passes an explicit `env` (F7 to F10) |
| `pnpm typecheck`, `pnpm test:e2e` | only by hand | keep; move into CI under #144 |
| `SECURITY-REVIEW.md` checklist | only by hand, prompted by Danger | keep |
| `node tools/map.mjs --check` | only by hand (and inside the diary) | keep |
| `node tools/report.mjs` (the diary) | unknown trigger (F24) | keep; fix `--no-tests` (F13) |
| `.githooks/pre-push` in both repositories | unknown whether enabled (F24); prints a summary only | keep |
| Tests on every PR (#144), bind approvals to builds (#137), package-against-ORC tests (#198, #202) | decided, not built | link, no parallel work |
| Weekly adversarial review, `/tmp` cleanup (#182), FRICTION into rules (#60) | decided, not built; wait on #166 | link |
| "Entropy guard at session end" | declared, but missing (F19) | create (this run) |

## 7. Recommendations, and one-time cleanup

Each item was checked against the snapshot's current file. Cleanup is tracked as issues under orchestrator#140 and
in `STATE.md`'s next actions, never in the guard.

1. **File an ORC defect under #140 for F10:** give `orc-service.ts`'s `execFile` calls an explicit minimal `env`,
   check what Chromium and MCP servers receive, and add an architecture-test assertion for it. A security-reviewed
   change.
2. **File under #140 for F7 to F9:** extend `test/architecture.test.ts` to see `playwright` or `chromium` imports and
   `fetch` passed as a value; after Q1, align the `NTFY_TRANSPORT` comment.
3. **File under #140 for F13:** `report.mjs --no-tests` should keep the day's existing suites rather than write null.
4. **F16:** connect to design review target 5 (operator commands through the running ORC) rather than a parallel
   project: the diary should read ORC's API or a test in ORC should pin the columns the lab reads.
5. **F12:** design review target 4 already covers the twelve root reports: move any fact recorded nowhere else into
   `AGENTS.md` or the glossary, then delete them. Structural; needs Justin's yes.
6. **F11, F4, F8, F10, F3:** the settled and provisional patches correct `README.md` and `AGENTS.md` (section 10).
7. **F1:** copy the 3 Oct Moving Stillness decisions into that Scope's decision record (outside this system).
8. **F22:** delete the two dead helpers in `test/architecture.test.ts`.
9. **F18:** whether Danger should block (branch protection or a paid plan) is Justin's call; until then the guard
   checks for a green result before a merge.
10. **F5:** after Q2, condense `STATE.md` to the cap at its next refresh.

## 8. The current-state file (docs-first Step 5)

The lab's `STATE.md` is the file every session reads first, so it was updated in place, as the settled patch
`patches/settled-lab.patch`; no competing summary was added. It now:
- corrects F14 from the file's own later records and marks each such fact "not re-read", with no live service read;
- moves the decisions of F1 to `decisions/2026-10-04-lab-role-and-processes.md` and links them (#194 and the
  Moving Stillness decisions stay until Q3 and that Scope's record);
- adds what to trust first, what misleads nearby, the open questions Q1 to Q5, and three next actions;
- says what makes it stale and who refreshes it;
- keeps `**Where we are now:** #193` in the form `tools/map.mjs` parses (checked with the same regular expression);
- leaves line 4 ("Target: sixty lines"), which Q2 quotes, unchanged.

It is 85 lines, down from 99, still over both caps (F5, Q2).

## 9. The guard decision and the generator's inputs

**Decision: `create`.** No guard exists, the system is active, and Justin kept "entropy guard at session end" as a
process on 4 Oct (F19). Path, on the recommended answer to Q4: the lab's `skills/session-coherence-guard/SKILL.md`.

Generator inputs:
- **Steward and intent:** Justin. Intent documents: lab `scope.yaml`, `SCOPE.md`; ORC `README.md` ("Direction",
  "Boundary"), `AGENTS.md`; lab `decisions/`, `memory/authority-rules-step-1.md`. Decision surface: lab
  `decisions/`; for ORC's own decisions, unresolved (Q3). Open intent questions: Q1 to Q5.
- **Current-state file:** lab `STATE.md`, overwritten at each verified event by the session that causes it
  (`AGENTS.md:33`).
- **Rules owned elsewhere:** `~/pro/local-config/home/AGENTS.md`, `~/pro/agentic/HOW_NOT_TO_PLAN.md`,
  `~/pro/scope/docs/MODEL.md`, orchestrator#140's description, ORC `SECURITY-REVIEW.md` and `dangerfile.js`, ORC
  `AGENTS.md` "Security review" (restarts only through the card; the package API section). A spending policy is not
  named anywhere in the snapshot; the user-wide file may hold one (not read).
- **Verification commands:** ORC `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report`; lab
  `node tools/map.mjs --check`, `node tools/report.mjs`. Only Danger runs by itself.
- **Code areas and what describes them:** reach and authority (`src/core/*`, `src/adapters/{mcp,browser,
  notifications,phone,orc-service,scope-credentials}*`, `src/app/agent-packages.ts`, `config/installation.ts`) with
  `AGENTS.md` "Boundaries", `README.md`, `SECURITY-REVIEW.md`, `test/architecture.test.ts`; package API
  (`src/package-api.ts`) with `src/package-api.api.md` and its test; service and restart (`scripts/orc-service.ts`,
  `src/adapters/orc-service.ts`, `src/app/orc-restart.ts`) with `README.md` "As a service"; durable work
  (`src/core/async`, `src/app/async`, `src/adapters/async-store`) with the 17 Sep decision and the lab's
  `collect.mjs`; the lab's tools with the lab's `README.md`, `STATE.md` and `FRICTION.md` formats.
- **Live state a session can change:** ORC's running build (merge, pull, restart card), package approvals and builds,
  grants, ntfy notices, GitHub Project 4 marks, Bookwhen through Moving Stillness (paused), invoices and email through
  the finance Scope. Spend: none seen in the snapshot.
- **Findings:** F1 to F24.

## 10. Patches, and their check against the findings and the questions

Four files in `patches/`, per repository, each opening with a list of its hunks. Both pairs were applied to fresh
copies of the snapshot with `git apply` and compared with the intended result; `git diff --check` found no
whitespace errors.

**Settled** (`settled-orchestrator.patch`, `settled-lab.patch`): touch no open question.
- ORC `AGENTS.md`, subprocess and network lists (F7, F8): adds each missing reach with its recorded authority
  (#101, #76, #171, Pi, packages), removes the deleted `src/bookwhen.ts`, and marks both lists incomplete for what
  section 5 did not cover and for "one further path ... under an open question". It does not describe the phone
  connector (Q1). Q1's quoted sentence is kept word for word. Nothing in it states what F10 contradicts.
- ORC `README.md`: the opening reach sentences become one link to `AGENTS.md` (one owner, F8); the Direction gains
  Justin's 25 and 26 Sep words verbatim, with their dates and source (F1; a recorded steward decision, so the intent
  document may change); the Bookwhen token paragraph becomes Scope credentials, citing the 28 Sep decision (F11); the
  credentials paragraph names where credentials are read, says what the search did not cover, and marks the
  subprocess exception and the unchecked Chromium and MCP cases rather than deleting the constraint (F10; the code
  is the defect); Verify says what runs by itself and the test's pattern gap (F17, F7); Boundary says applying a plan
  was decided as approved durable work, citing 17 Sep, and that the Moving Stillness declaration was not read (F4).
  The "Deliberately absent" sentence, which Q5 quotes, is untouched here.
- Lab `AGENTS.md`: learning rows for `FRICTION.md` and for decisions about the lab and its relationship (F15; ORC's
  own decisions left to Q3); "Before handing off" for sessions started in the lab (Q4 decides ORC's).
- Lab `decisions/2026-10-04-lab-role-and-processes.md`: F1, the lab's decisions only, in `STATE.md`'s words.
- Lab `README.md`: F13.
- Lab `STATE.md`: section 8. Its open-questions list states each question, not an answer; "misleading nearby" says
  only what F3 establishes (the list still names scheduling) and leaves the rest to Q5.

**Provisional** (`provisional-orchestrator.patch`, `provisional-lab.patch`): one or more hunks per question, written to
the recommended answer, not to be applied until Justin answers: Q1 (the ntfy sentence and the test comment), Q2 (the
cap's owner and number), Q3 (ORC's decision pointer, #194's copy), Q4 (ORC's pointer to the guard, and the lab's wording),
Q5 (the "Deliberately absent" sentence, including "scheduling", which the 17 Sep decision alone would settle but which
sits in the quoted sentence).

## 11. Guard generation report (`session-coherence-skill-generator`)

- **Supplied:** this assessment's findings and inputs (section 9). Guard decision `create`.
- **Written:** `guard/SKILL.md`, for the lab's `skills/session-coherence-guard/SKILL.md`, to the v0.5.0 contract, with
  the intent-change rule v2 copied in and filled (Justin; the lab's `decisions/`; `scope.yaml`, `SCOPE.md`, ORC's
  `README.md` and `AGENTS.md`).
- **Size: 1,096 words** (`wc -w`), against a budget of 1,083: the common contract 724, plus 7 checks beyond the two
  standing ones at 36 each (252), plus pointers 61, plus commands 46. The 13-word excess comes from filling the
  intent rule's placeholders with three intent documents, and from naming both repositories in "What changed this
  session", which a two-repository system needs. Duplication was removed first (a comment and a repeated pointer).
- **Its checks map to findings:** reach search (F7 to F10), docs naming changed things (F4, F11, F13), `STATE.md`
  claims, live facts, the map line and the cap (F5, F14, F16), decisions recorded (F1), the lab's readers (F16),
  merge readiness by hand and Danger green (F17, F18), the map check, superseded material (F12), friction (F15).
- **Commands checked:** the reach `rg` pattern runs on the ORC snapshot (217 hits in 54 files over the whole tree,
  hence the guard runs it on changed files only); `rg` is installed. The `collect.mjs` reader command was not run,
  because it reads paths under the home directory outside the snapshot; its three exports exist
  (`collect.mjs:123,150,164`).
- **Doc references added:** the lab's `AGENTS.md` "Before handing off" (settled); ORC's `AGENTS.md` "Before handing off"
  (provisional, Q4).
- **Open questions the guard leaves visible:** Q3 in its "Decisions" pointer, all five through its pointer to
  `STATE.md`, and Q2 through its check of the cap "in `AGENTS.md`".
- **Review before handover:** the guard carries "Modes and safety" and binds its baseline to `<start>` or
  `origin/main`; its repairs edit no intent document to match work; both patches were checked as in section 10.
- **Handoff:** to `guards-integrator`, in `integration.md`.

## 12. Questions for the steward

In full, with recommended answers, in `questions.md`:
- **Q1:** may a package send a phone notice with its own text and tap link? Recommended: yes, as built.
- **Q2:** forty lines or sixty for `STATE.md`, and which file owns the cap? Recommended: sixty, owned by `AGENTS.md`.
- **Q3:** ORC's decisions in the lab's `decisions/`, or in ORC? Recommended: the lab's.
- **Q4:** one guard in the lab for both repositories, or one each? Recommended: one, in the lab.
- **Q5:** which "Deliberately absent" items still need their own decision? Recommended: reminders, sandboxes and shell
  access only.

## 13. Uncertainties, and what was not covered

- **Live state:** nothing live was read. Which build ORC runs, which grants exist and whether agents are available are
  quoted from `STATE.md` of 4 Oct.
- **GitHub:** issues, including #140's rules and #76's decision, could not be read, so a decision recorded only there
  was not found (F1, F2).
- **Git configuration and history:** no `.git`, so whether hooks are enabled, when files last changed, and commit
  messages that quote Justin could not be searched (F24).
- **Library behaviour:** Playwright's and the MCP SDK's default child environment, and what Pi reads and reaches, were
  not verified (F10, section 5).
- **Package code:** Moving Stillness's and the finance Scope's packages are outside these repositories; their
  declarations and connectors were not read.
- **Rules owned elsewhere:** the user-wide `AGENTS.md`, `HOW_NOT_TO_PLAN.md` and the Scope model were not read. The
  merge rule of 25 Sep (F1) may have been changed there later.
- **Reports:** of the lab's 77 reports, the 30 Sep design review, the 1 Oct synthesis, the 30 Sep skills report, the
  3 Oct browser report and the pushback analyses were read in part; the rest were searched, not read.
