# Entropy assessment: ORC and the Orchestration Lab, assessed as one system

Run on 2026-10-07 with entropy-guard's `entropy-assessment` (v0.9.0), its intent pass and mixed profile, Steps 2, 3, 5
and 7 of `docs-first-planning-assessment` (v0.3.0) on the lab, `session-coherence-skill-generator` (v0.5.0) and
`guards-integrator` (v0.4.0).

**What was assessed.** Read-only snapshots, without `.git`, of:
- **ORC**, `orchestrator/` (lives at `~/pro/orchestrator`): a TypeScript orchestration system, 278 files outside
  `node_modules` (none present);
- **the lab**, `scope-orchestration-lab/` (lives at `~/scopes/scope-orchestration-lab`): the Scope that manages ORC's
  work, 100 files.

**Mode.** Build, into the output folder only. The targets are read-only, so every change to them is delivered as a
patch, sorted into settled and provisional (`patches/`, described under "Proposed changes"). No steward was available:
five questions, each with a recommended answer, are in `questions.md`.

**Route.** Intent pass; lifecycle `active`; shape **B, mixed docs and code**, across two repositories assessed as one
system; the mixed profile; docs-first Steps 2, 3, 5 and 7 on the lab, which is docs-first; guard decision `create`;
generator; integrator (`integration.md`).

---

## 1. Intent

### Steward

**Justin.** Lab `scope.yaml` line 6, `steward: justin`, and line 36–37, his only member role, `admin`. ORC's
`AGENTS.md` quotes him as the one who decides (lines 11, 33–37, 117–118). Nothing names anyone else.

### Authorised intent, with the source of each part

| Part | Source | Kind and authority |
|---|---|---|
| The lab is Justin's Scope for developing and operating ORC and its reusable Scope-owned agents | lab `SCOPE.md` 5–7; `scope.yaml` 5, 13 | Description; steward-owned inventory, undated |
| ORC's north star: the UX surface to his agentic system; ChatGPT replacement, daily tool, test ground, showpiece; consolidation once the six slots work | lab `STATE.md` 8–11 | Decision, Justin, 25 and 26 Sep; only in an overwritten file (F8, P5) |
| The lab is the central Scope for project management, core issue tracking, code quality and security; where issues live; the nine processes kept; scheduling (#166) first; Astra runs this assessment; labels wait | lab `STATE.md` 38–55 | Decision, Justin, 4 Oct interview; only in an overwritten file (F8) |
| The map of work, orchestrator#140, is the reference point for every agent | lab `AGENTS.md` 7–8; ORC `AGENTS.md` 9–12 | Directive, Justin, 2 Oct |
| Core ships with no specific Scope, model, owner or agent; domain code such as a Bookwhen connector belongs to its Scope | ORC `AGENTS.md` 30–45 | Directive, Justin, 12 and 13 Sep |
| Boundaries: tools withheld rather than prompted; the lethal trifecta; admin agents only behind enforced controls; standing grants; any new authority needs an explicit human choice | ORC `AGENTS.md` 14–112 | Directives, partly attributed through issues #20, #67 |
| Approval cards from a fixed set of blocks | ORC `AGENTS.md` 114–128 | Directive, the operator, 26 Sep |
| ORC owns a general async work capability; delivery, schedule and approval are declared per task type | lab `decisions/2026-09-17-async-work-architecture.md` | Decision, Justin, 17 Sep |
| Authority rules 1, 2 (amended), 4 and 5 affirmed; 3, 6, chat handling and Iris's role open | lab `memory/authority-rules-step-1.md` | Decision, Justin, 1 Oct |
| ORC drives the browser through Playwright's library | lab `reports/2026-10-03-browser-stack-prior-art.md` 76; orchestrator#76 | Decision, Justin, 3 Oct |
| Security reviews checked on GitHub by Danger | ORC `dangerfile.js` 7 | Decision, Justin, 2 Oct ("B") |
| Claude merges a pull request once review and tests pass | lab `STATE.md` 17 | Decision, Justin, 25 Sep; only in `STATE.md` (F8) |
| Moving Stillness is paused | lab `STATE.md` 33 | Decision, Justin, 4 Oct; only in `STATE.md` (F8) |
| Where facts and learnings go: ORC facts in ORC, Scope-model facts in `~/pro/scope`, their relationship in the lab | lab `SCOPE.md` 17–24; `AGENTS.md` 12–23 | Directives, unattributed |
| Pace: one scored real use before new design | lab `AGENTS.md` 25–29, pointing to `~/pro/agentic/HOW_NOT_TO_PLAN.md` | Directive; the target file is outside the snapshot and was not read |
| ORC is Justin's local-first personal agent; Iris is the front door; ADA is meant to create agents | ORC `README.md` 3–23 | Description, unattributed |

### Declared, enacted, authorised

- **Declared:** ORC is Justin's local-first personal agent (ORC `README.md`); the lab develops and operates ORC and
  its Scope-owned agents (`SCOPE.md`, `scope.yaml`).
- **Enacted,** from the lab's `STATE.md` of 4 Oct, `FRICTION.md` entries of 30 Sep to 4 Oct and the dated reports
  (no commit history was available): resolving browser targets before acting (#193), one package API version
  (#201), availability logging (#199), finishing a reply before restart (#195), phone notices (#139, #184, #186,
  #187, #189), the restart card (#101), the map of work and its labels, invoicing through the finance Scope, and
  adversarial reviews by Astra.
- **Authorised:** the table above. The enacted work sits inside it, with one exception and two unrecorded
  authorisations below.

### Gaps by condition

- **Stale description**, corrected only as far as a recorded decision plainly covers (settled patch):
  - Bookwhen code described as part of ORC (F3), against ORC `AGENTS.md` 39–42 (Justin, 12–13 Sep).
  - "Scheduling" listed as deliberately absent (F16), against the 17 Sep decision.
  - Chromium missing from the reach lists (F1, F2), against Justin's 3 Oct "lets use the library".
  - Left as they are, because no decision plainly settles them: "reminders" and "workflow execution" in ORC
    `README.md` line 152–153.
- **Conflict:** the cap on `STATE.md`, forty content lines in lab `AGENTS.md` 34 against sixty in `STATE.md` 4 (F6).
  Question P3.
- **Missing:**
  - the explicit human choice ORC `AGENTS.md` 110 requires for the restart card's subprocesses (F1). Question P1.
  - where the session-end guard Justin kept on 4 Oct lives (F19). Question P4.
- **Ambiguous:** whether "facts about ORC belong in its repository" (lab `SCOPE.md` 19–21) covers Justin's decisions
  about ORC, which in practice are recorded in the lab (F13). Readings and the case where they diverge are in
  question P5.
- **Unauthorised drift:** the phone connector lets approved packages reach the ntfy transport, while ORC `AGENTS.md`
  101–102 says no model or agent reaches it (F2). Recorded as proposal P2 for Justin; `AGENTS.md` is not edited to
  match.
- **Prose control:**
  - ORC's `README.md` 135 and 169–170 and `AGENTS.md` 3–4 present `test/architecture.test.ts` as the enforcement of
    the boundaries; its reach checks miss reach through a library (F4). Enforcement belongs in that test; the settled
    patch extends it.
  - The `STATE.md` cap (F6): nothing checks it. Enforcement belongs in the session guard now, and later in the diary
    script.
  - `node tools/map.mjs --check` "fails when an open issue is outside" the map (F10): it covers 6 of the 9
    repositories and passes on a failed read. Enforcement belongs in `tools/map.mjs`; Astra's labels review already
    found it.
  - Nothing cites the `STATE.md` cap or the map check as a security control. The architecture test is cited as the
    enforcement of ORC's boundaries.

### Existing guards' repair instructions

There is no entropy guard in either repository, so no repair instruction treats work as permission to change intent.
Repairs that keep independent definitions of one concept in step, flagged under the one-owner rule:
- `pnpm pi:update` keeps four Pi pins in step (`scripts/update-pi.mjs` 8–11). pnpm overrides force those four; the
  script is the right mechanism. `README.md` 165 is a fifth copy that the script does not move (F17).
- The fix for #197 renamed Moving Stillness's manifest setting to match ORC's, keeping two definitions of the
  connector's setting names in step (F14, orchestrator#198).
- `STATE.md`'s header restates, with a different number, the cap `AGENTS.md` owns (F6).
- `SECURITY-REVIEW.md` 177–181 restates the guarded paths `dangerfile.js` owns (F17).

### Questions and proposed changes

Five questions with recommended answers: `questions.md`, recorded for Justin in the lab as
`decisions/2026-10-07-proposals-from-entropy-assessment.md`, inside the settled patch. Steward decisions found only in
`STATE.md` are copied to `decisions/2026-10-04-lab-role-and-processes.md`, also in the settled patch; the north star
waits on P5.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** `scope.yaml` lines 7 and 14 say `status: active` for the Scope and the `orchestrator`
  project. `STATE.md` was updated 2026-10-04 17:31. `FRICTION.md` has entries each day to 4 Oct. ORC runs as a
  service and was restarted four times on 4 Oct (`STATE.md` 31–35).
- **Shape: B, mixed docs and code,** the riskiest of three that fit:
  - ORC is code-first (C): 39,069 lines in `src/`, `scripts/`, `config/`, `e2e/` and `web/`, and 970 tests (`STATE.md`
    30). It also carries 15 root Markdown files, and its `AGENTS.md` is its security boundary.
  - The lab is docs-first (A) with a workflow surface (D): state, decisions, friction, reports, the map of work, and
    752 lines of tooling in `tools/`.
  - Risk sits between the two. ORC's documents state its security boundary in prose. The lab's tools read ORC's
    internals. The lab records ORC's decisions.
- **Repositories: two, assessed as one system.** Sessions work in ORC, often in worktrees, and record state,
  decisions and friction in the lab (lab `AGENTS.md` 3–5, 12–23).
- **Beyond the two:** the lab's tools and the map reach Moving Stillness, the Bookwhen ops tool, the Scope model,
  finance and local-config (`tools/collect.mjs` 18–25). None of those was read.

---

## 3. Findings

One list; every other section refers to these ids. Line numbers are in the snapshot.

**F1. ORC's list of where subprocess access exists is incomplete.** ORC `AGENTS.md` 92–96 names three modules: the Pi
child, git history, and the MCP client. A search of `src/` for `child_process`, `spawn`, `exec*`, `fork`,
`StdioClientTransport`, `.launch(` and `chromium` also finds:
- `src/adapters/orc-service.ts`, for the restart card (orchestrator#101). It runs git's read commands (71), `pnpm
  install --frozen-lockfile` (128), which reaches the package registry when a release adds packages (33–36), `node
  scripts/build.mjs` (107), and `systemctl --user restart orc.service` (102). `test/architecture.test.ts` 823–835
  approves it as the fourth module; no decision of Justin's in the two repositories does (P1).
- `src/adapters/browser/playwright.ts` 55, which launches a headless Chromium for each browser session through
  Playwright's library. Justin decided this on 3 Oct (lab `reports/2026-10-03-browser-stack-prior-art.md` 76).

Delegated reach, acknowledged in general by `AGENTS.md` 96 ("Approved Scope packages may implement separately declared
connectors"):
- an approved package bundle may import any `node:` built-in, `node:child_process` included
  (`src/adapters/agent-files/bundle-imports.ts` 3–4);
- Moving Stillness's operations connector runs the Bookwhen ops tool, a separate Playwright program
  (lab `memory/slots-run-walkthrough.md` 13–16; ORC `config/installation.ts` 127, 280).

Operator scripts (`scripts/build.mjs`, `dev-web.mjs`, `update-pi.mjs`, `orc-service.ts`) also launch processes. They
are run by a person, not by ORC, and are outside the claim. *Source: code search, 7 Oct.*

**F2. ORC's list of where network access exists is incomplete, and one sentence is contradicted by the code.** ORC
`AGENTS.md` 98–104 says direct network access exists only in the Jina reader and the ntfy transport. Further:
- `src/adapters/browser/playwright.ts` navigates Chromium (`page.goto`, 215) and looks hosts up with `node:dns`
  (14, 518–520), confined to the hosts a grant names (44–55). This is the 3 Oct decision.
- "No model or agent reaches the ntfy transport, and it sends only a title, the notice's summary and the one
  configured tap address" (101–102; repeated in `test/architecture.test.ts` 63). `src/adapters/phone/index.ts` gives
  an approved package a phone connector that sends the package's own title, text, up to five tags and any http(s) tap
  address through `publishNtfy` (1–14, 30–44). Its header dates the first user to 2 Oct and cites #184. No recorded
  decision covers it (P2).
- "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client" (102–103): the file does not exist,
  and `test/architecture.test.ts` 1315–1316 asserts that no file imports the client and that it is no dependency.
- Delegated network reach the list does not mention: Pi's calls to the model provider (`config/installation.ts`
  21–25), MCP servers launched over stdio, `pnpm install` from the restart card, and package bundles' `node:`
  built-ins.

The web server listening on port 5173 is inbound, not outbound. *Source: code search for `fetch`, `node:http(s)`,
`node:net`, `node:dns`, `WebSocket`, `.goto(`, `undici` and similar, 7 Oct. Not checked: what Pi, MCP servers, package
bundles and OpenTelemetry's environment-configured exporters (`src/diagnostics.ts` 71–75) reach on their own.*

**F3. ORC's README and AGENTS.md describe Bookwhen code ORC no longer has.**
- `README.md` 76–79 tells the operator to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN` for open-Friday queries through
  `@jphil/bookwhen-client@0.6.1`. No source reads that variable; only tests stub it. The client is not a dependency
  (`package.json`).
- `README.md` 3–7 calls ORC's external paths "read-only", including published Bookwhen events. The browser connector
  writes to admin sites under grants (ORC `AGENTS.md` 76–91).
- `README.md` 145–147 says the model sees open Fridays.
- `AGENTS.md` 20–22 lists a `list_open_fridays` tool. `test/architecture.test.ts` 801–820 fixes the surface without
  it, and 1319–1321 keeps Bookwhen code out of ORC.

*Source: ORC docs against code and tests.*

**F4. The architecture test's reach checks miss reach through a library.**
- The subprocess check (823–835) matches `node:child_process`, `execSync` and `spawnSync`.
- The network check (1295–1317) matches `fetch(`, `fetchImpl`, `WebSocket` and imports from `http`, `https`,
  `http2`, `net`, `tls` and `dgram`.
- `chromium.launch`, `page.goto` and `lookup` from `node:dns/promises` pass both.
- `README.md` 135 and 169–170 and `AGENTS.md` 3–4 present this test as what enforces the boundaries.
- Its `NTFY_TRANSPORT` comment (63) repeats F2's contradicted sentence, and no check asks who imports the ntfy sender.

*Source: the test against `src/`.* Prose control: enforced for Node's own primitives only.

**F5. ORC's tests run only when someone runs them.**
- CI runs only Danger, `.github/workflows/danger.yml`, which checks pull-request descriptions.
- `pnpm typecheck`, `pnpm test` (with the architecture, core-ties, API-report and source-header checks) and
  `pnpm test:e2e` run on no pull request.
- Justin kept "tests on every PR" on 4 Oct; the mechanism waits on him (orchestrator#144, `STATE.md` 45, 69).
- Danger warns rather than blocks without GitHub Pro, and never sees a direct push to `main` (`SECURITY-REVIEW.md`
  53–55).

**F6. The cap on the lab's `STATE.md` is stated twice, differently, and nothing enforces it.** Lab `AGENTS.md` 34
says "about forty content lines"; `STATE.md` 4 says "Target: sixty lines". The file had 99 lines on 4 Oct, and 405 on
23 Sep (`FRICTION.md` 536–540). Conflict and prose control (P3).

**F7. `STATE.md` contradicts itself and carries stale live facts.** At 2026-10-04 17:31:
- **Whether #193 is merged:** "#193 … is built and in review, not merged" (23), against "#193 is live: #200 merged as
  `3989cdb`" (31).
- **What ORC runs:** "ORC live: 369628b since 22:12:47" (58) and "main process started 2026-10-03 22:12:47 on
  `369628b`" (88), against restarts on 4 Oct at 13:36:37, 14:03:34, 14:26:04 and 14:48:27 (31–35).
- **#201:** "#201 live" (34), against "Filed #201" (56–57).
- **Moving Stillness:** `main` `c759f96` (91), against MS #53 merged as `fc830aa` (31–32).
- **A grant:** grant `e9675bd9` "until 1 Oct 18:00Z" (94), expired three days before the file's date.

The same failure is recorded three times before: `FRICTION.md` 12 Sep (864–870), 22 Sep (621–626) and 23 Sep
(536–540). Three failures from one cause: nothing checks the state file at session end. **A missing system.**

**F8. Justin's decisions are recorded only in `STATE.md`, which is overwritten at each verified event** (lab
`AGENTS.md` 33). They are the north star (8–11), the merge rule (17), the 4 Oct interview (38–55), Moving Stillness
paused (33) and three 3 Oct issue decisions (57–58). The lab has a decision folder, `decisions/`, holding one
decision.

**F9. `tools/map.mjs` reads a line in `STATE.md` as data.** `whereWeAre()` (180–190) parses
`**Where we are now:** <ref>` to place ★ on the map. Nothing documents that contract. A rewrite that drops the phrase
silently removes the mark. Brittle automation.

**F10. Lab `AGENTS.md` overstates what `node tools/map.mjs --check` proves.**
- `AGENTS.md` 7–10 says every open issue of ORC and its Scopes sits under #140, and that `--check` fails when an open
  issue is outside it.
- The check reads only the 6 repositories in `tools/collect.mjs` 18–25, while the map spans 9.
- A failed repository read becomes an empty list and passes (`outsideMap`, `tools/map.mjs` 174–179).
- Astra found both on 4 Oct and Claude confirmed them (`reports/2026-10-04-labels-review-astra.md` 9–14). The same
  review found no label check behind the kept process "map and label check".

**F11. The lab README misdescribes the diary, and the diary is not daily.**
- `README.md` 15–24 offers `node tools/report.mjs --serve`. `tools/report.mjs` reads only `--no-tests` (22, 51), and
  its header says "nothing is served" (13).
- The README times a full run at "~10s"; the header says about two minutes, and ten seconds without tests (9–10).
- `--no-tests` "keeps the day's test count", says the README. It writes `suites: null` into that day's snapshot
  (313), replacing any count taken earlier.
- Snapshots exist for 3 and 7 Sep and 29 Sep to 2 Oct. `status.html` was last generated on 2 Oct, 08:45 UTC. The
  "daily diary" Justin kept is run by hand until ORC scheduling (#166) is built.

**F12. The lab's diary reads ORC's internals, and a mismatch is silent.** `tools/collect.mjs`:
- **State directory:** hard-codes ORC's state at `~/.local/share/orchestrator-proof` (16). ORC's own default is
  `~/.local/share/orchestrator` unless `ORCHESTRATOR_STATE_DIR` is set (`src/runtime.ts` 190).
- **Database:** opens `async-work/tasks.db` (ORC: `src/app/async-work.ts` 325) and queries ORC's `tasks` and `events`
  tables by column name (123–145).
- **Agent definitions:** lists ORC's shipped agents from `src/core/*.md` front matter (162–176).
- **On failure:** each reader returns nothing rather than failing (1–4). The diary was already rebuilt once because
  its readers pointed at moved ORC paths (6–7).
- **History:** the two state directories have been confused three times (`FRICTION.md` 28 Sep, 360–367, "a missing
  system"; orchestrator#62).

A concept with two homes: where ORC's state lives and what its schema is.

**F13. Where Justin's decisions about ORC are recorded is ambiguous.**
- Lab `SCOPE.md` 19–21 says facts about ORC belong in ORC's repository.
- ORC's architecture decision is in the lab's `decisions/`, ORC has no decision log, ORC's `AGENTS.md` quotes
  decisions inline as standing rules, and the north star is only in the lab's `STATE.md`.

Ambiguous (P5).

**F14. A connector's setting names are defined in ORC and again in each package's manifest, with no test across the
two.** When #197 renamed `granted-tools` to `granted-actions`, Moving Stillness was unavailable for about an hour
(`FRICTION.md` 3 Oct, 63–70; orchestrator#198). The seam reaches beyond the two repositories; it is linked to its
existing issue.

**F15. Superseded material sits beside ORC's live docs.**
- ORC's root holds 11 point-in-time reports and design notes beside `README.md` and `AGENTS.md`: `REWORK.md`, `SEAM.md`,
  `OPERATOR.md`, `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`, `GRANTS-E2E.md`, `TURN-RECORD.md`, `CLASSIFY.md`,
  `VISIBILITY.md` and `GRANTS.md`.
- Their status lines are history: "Nothing committed, nothing pushed" (`REWORK.md` 3); "Nothing is pushed"
  (`OPERATOR.md` 12).
- Only `MCP.md` carries a superseded banner. Neither `README.md` nor `AGENTS.md` links any of them.
- The systemd unit written by `scripts/orc-service.ts` 41 points its `Documentation=` at `OPERATOR.md`, a branch
  report. The live service docs are `README.md`'s "As a service".

**F16. ORC `README.md` 152–154 lists "scheduling" as deliberately absent.** The 17 Sep decision gives task types
`schedule: now, at, or recurring`, and `src/app/async/calendar.ts` resolves recurring rules. Stale description.

**F17. Two values are copied from their owners.**
- `README.md` 165, "Currently on Pi Coding Agent `0.82.1`", is a fifth copy of the pin, which `pnpm pi:update` does
  not move.
- `SECURITY-REVIEW.md` 177–181 lists the guarded paths. It omits `config/`, `package.json`, `pnpm-lock.yaml`,
  `test/core-ties.ts` and three scripts that `dangerfile.js` 11–26 guards. The pull-request template already names
  `dangerfile.js` as the owner.

**F18. Neither pre-push hook can be shown to run.** Both `.githooks/pre-push` files print a summary from
`~/pro/local-config/scripts/push-summary`, which is outside the snapshot. They run only where `core.hooksPath` is
`.githooks`, and the snapshot has no git configuration. A committed hook that never ran is on record for Moving
Stillness (`FRICTION.md` 541–544). Status unknown.

**F19. "Entropy guard at session end" is a process Justin kept on 4 Oct (`STATE.md` 49), and neither repository has
one.** Declared, but missing.

**F20. `reports/2026-09-17-async-review-critical.md` is an 832 KB raw agent transcript saved as Markdown.** Its lines
are JSON. It includes the session's system prompt and an attachment of the user-wide instructions file (lines 6, 16).
Searches of `reports/` match it, and it reads as a report it is not. Low.

---

## 4. Repositories and ownership

| Concept | Owner | Second home, if any |
|---|---|---|
| ORC's code, boundaries and rules | ORC (`src/`, `AGENTS.md`, `SECURITY-REVIEW.md`, `dangerfile.js`) | The lab describes ORC's live state in `STATE.md`, which is fine as state |
| What ORC launches and reaches | ORC `AGENTS.md` "Boundaries" | `README.md` 3–7 (F3), and the architecture test, an independent test (F4) |
| Justin's decisions about ORC | Unclear (F13): lab `decisions/` in practice | ORC `AGENTS.md` quotes; lab `STATE.md` (F8) |
| Current state of the work | lab `STATE.md` | — |
| Open work | GitHub issues under orchestrator#140 | `STATE.md` mirrors "where we are now" |
| The cap on `STATE.md` | lab `AGENTS.md` | `STATE.md` header (F6) |
| ORC's state directory and durable-work schema | ORC (`src/runtime.ts`, `src/app/async-work.ts`, `src/adapters/async-store/sqlite.ts`) | lab `tools/collect.mjs` (F12) |
| A connector's setting names | ORC | each package manifest (F14) |
| Guarded paths | ORC `dangerfile.js` | `SECURITY-REVIEW.md` (F17) |
| The Pi version | ORC `package.json` (four pins moved by `pnpm pi:update`) | `README.md` (F17) |
| Reports | lab `reports/` | ORC's root (F15) |
| What broke in real use | lab `FRICTION.md` | `reports/2026-09-30-learnings-digest.md`, a summary |

## 5. Drift between domains

- **Docs against implementation:** F1, F2, F3, F11, F15, F16, F17.
- **Docs against docs:** F6, F7, F13.
- **Tests against implementation:** F4. The test checks Node's primitives; the browser reaches through a library.
- **Contracts against implementation:** F12, ORC's database schema read by the lab without a contract. F14, connector
  setting names. The package API report is guarded by a test and a Danger rule, and is fine.
- **Workflow against reality:** F5, F10, F11, F18, F19.
- **Rules against enforcement:** F4, F6, F10.

## 6. Top risks, ranked by decay rate times recovery cost

1. **Reach claims drift from reach** (F1, F2, F3, F4).
   - **Decay:** fast. Three new reaches arrived within a week (the phone connector on 2 Oct, the browser library on
     3 Oct, the restart card around 1–2 Oct), and none reached the lists.
   - **Recovery cost:** high. The lists are the boundary the security review reasons from (`SECURITY-REVIEW.md`,
     questions 1 and 2), and the test cited as enforcing them passes.
   - **Anchor:** ORC `AGENTS.md` "Boundaries".
2. **The state file is dishonest, and decisions are lost in it** (F6, F7, F8, F9).
   - **Decay:** the file is rewritten several times a day.
   - **Recovery cost:** wrong answers given to Justin with confidence (`FRICTION.md` 22 Sep), and decisions
     overwritten.
   - Recorded four times. **A missing system.**
   - **Anchor:** lab `AGENTS.md` "Keeping state" and `decisions/`.
3. **Checks pass falsely or do not run** (F5, F10, F11, F18).
   - **Decay:** silent.
   - **Recovery cost:** medium; nobody learns a check has stopped meaning anything.
   - **Anchor:** orchestrator#144, the labels review, #166.
4. **Seams between the repositories** (F12, F13, F14).
   - **Decay:** with each ORC refactor.
   - **Recovery cost:** medium. The state-directory split caused three confusions; #198 cost an hour of
     unavailability.
   - **Anchor:** ORC's own definitions.
5. **Superseded material nearby** (F15, F16, F17, F20).
   - **Decay:** slow.
   - **Recovery cost:** low to medium. Fresh sessions read history as current, and the systemd unit points at a
     branch report.

---

## 7. Docs-first Steps 2, 3, 5 and 7, on the lab

### Step 2: truth map

| Document | Role | Owns |
|---|---|---|
| `SCOPE.md`, `scope.yaml` | canonical | purpose, authority, resource inventory (the second is a formal projection of the first) |
| `AGENTS.md` (`CLAUDE.md` links to it) | canonical | working conventions, the cap on `STATE.md`, where learnings go |
| `decisions/` | canonical | Justin's decisions (one so far; F8, F13) |
| `memory/authority-rules-step-1.md` | canonical (local) | Justin's answers on authority rules, 1 Oct |
| `memory/slots-run-walkthrough.md` | local elaboration, historical | one traced run, 28 Sep |
| `STATE.md` | current state | where the work stands; holds decisions it should not (F8) |
| `FRICTION.md` | canonical | what broke in real use; read by `tools/collect.mjs` |
| `AGENT_IDEAS.md` | canonical | agent, tool and skill ideas |
| `reports/*.md` | historical, dated | `STATE.md` names the current ones; F20 |
| `reports/*.json`, `status.html` | generated projection | the diary's snapshots and page |
| `tools/*.mjs` | product artifact | the diary and the map; their flags and readers are contracts (F9, F10, F11, F12) |
| `research/` | historical | prior art |
| `skills/`, `workflows/` | empty placeholders (`.gitkeep`) | — |

No local-global inversion was found: `memory/` notes are dated and local.

### Step 3: the loop as it runs

1. **Start:** a session loads lab `AGENTS.md` through `CLAUDE.md`, reads `STATE.md`, then `SCOPE.md`, then the map
   (#140). For ORC work, ORC `AGENTS.md` points to `README.md` and the architecture test. ORC has no `CLAUDE.md`
   link (see `integration.md`).
2. **Work:** on GitHub issues on the map, marked with `node tools/map.mjs working`. Changes are made in ORC worktrees,
   by default under `/tmp` (#196).
3. **Review and merge:** pull requests get Astra reviews by complexity and the Danger check. Claude merges once review
   and tests pass (Justin, 25 Sep).
4. **Release:** after a merge, the ORC checkout is pulled. Justin approves the restart card, and the restart is
   verified by process start time.
5. **Handoff:** `STATE.md` is overwritten at each verified event, `FRICTION.md` is written the same day, and a report
   is written for each review.
6. **The diary** is run by hand.

**Where follow-up is lost:**
- `STATE.md` grows and contradicts itself instead of being overwritten (F6, F7).
- Decisions stay in `STATE.md` (F8).
- The diary skips days (F11).
- Nothing runs at session end (F19).

### Step 5: the state file, brought up to date

`STATE.md` is rewritten in `patches/settled-lab.patch`: 60 lines, 42 of them content. Following the rules:
- **Stage, trust-first documents and decisions:** linked, the decisions to `decisions/`.
- **Active fronts and open questions:** listed, the five proposals among them.
- **Misleading material nearby:** named.
- **Next actions:** two.
- **Contradictions** (F7): resolved to the verified claims.
- **Live facts:** each carries when it was read, and the file says nothing was re-read since 4 Oct 17:31.
- **Staleness:** the file says what makes it stale and who rewrites it.
- **The map contract** (F9): the `**Where we are now:** #193` line keeps the form `tools/map.mjs` parses, checked by
  running its regular expression on the result.
- **Header:** "Target: sixty lines" is left as it is, because changing it touches P3.

### Step 7: guard inputs

**Existing surfaces in the lab:**

| Surface | Verdict |
|---|---|
| `AGENTS.md` | keep; amend the map-check sentence (settled) and add the guard pointer (P4) |
| `.githooks/pre-push` | keep; it is a summary, not a guard, and whether it runs is unknown (F18) |
| `tools/map.mjs --check` | amend through the labels review's follow-up (F10), not parallel work |
| `tools/report.mjs` | keep; amend so `--no-tests` keeps the day's test count (F11) |
| `STATE.md`'s header rules | keep; amend the cap pointer (P3) |
| `.claude/settings.json` | plugins only; no guard belongs in a vendor folder |

**The matrix's checks, against this system's files.** Each is the guard check or tool named:
- **Parallel truth** (F6, F8, F17): the state and decision checks, and the one-owner repair.
- **Superseded material** (F15, F20): the check before reviving or citing a report.
- **Stale references** (F3, F11, F15): the code-and-docs check, and a link checker later.
- **Lost decisions** (F8): the decision check.
- **State dishonesty** (F7): the two `STATE.md` checks.
- **Workflow drift** (F10, F11): the map check, and the report's list of problems already there.
- **Brittle automation** (F9): the ★ check.

**Decision:** `create`.

---

## 8. Existing guard surfaces, by whether they execute

- **Runs by itself:**
  - Danger on ORC pull requests: the Security review and Package API sections. Shown working on GitHub on 2 Oct
    (`STATE.md` 79–81). It warns rather than blocks, and does not see direct pushes (F5).
- **Runs only by hand:**
  - ORC `pnpm typecheck` and `pnpm test`: architecture boundaries, the core-ties ratchet, cause-discard allowances,
    source headers, the package-API report.
  - ORC `pnpm test:e2e`, `pnpm pi:check` and `pnpm codemap`.
  - Lab `node tools/map.mjs --check` and `node tools/report.mjs`.
  - Astra reviews.
- **Decided, not built:**
  - tests on every PR (#144);
  - the scheduled processes behind #166: daily diary, weekly adversarial review, FRICTION into rules monthly (#60),
    branch and worktree cleanup (#70), `/tmp` cleanup (#182);
  - a test of connector names across ORC and packages (#198);
  - packages testing against ORC's real parts (#202).
- **Declared, but missing:**
  - the session-end entropy guard (F19), which this run creates;
  - the label half of "map and label check" (F10).
- **Unknown:**
  - both pre-push hooks (F18).

## 9. Mechanical checks belong to tools

- **The project's own tests:**
  - ORC's architecture test should catch library-mediated reach. The settled patch adds a check confining
    Playwright's library and `node:dns` to the browser driver (F4).
  - When #144 is decided, `pnpm typecheck` and `pnpm test` should run on every pull request (F5).
- **`tools/map.mjs`:** the coverage and failed-read gaps (F10) and the absent label check, through the labels
  review's follow-up.
- **The diary:** it could print `STATE.md`'s content-line count against the cap (F6) once it runs daily.
- **lychee** for Markdown links in both repositories, and **ast-grep** for environment variables and tool names named
  in prose (F3). Whether either is installed was not checked: the machine is outside the snapshot. The guard does not
  depend on them.

---

## 10. Proposed changes

Every target change is a patch in `patches/`, one per repository, generated against the snapshot. Apply them with
`git apply` from each repository's root. Each was checked to apply cleanly: settled first, then each provisional
patch alone, and all together. `git diff --check` reports no whitespace errors.

### Settled: touches no open question

`patches/settled-orchestrator.patch`:
- `AGENTS.md`:
  - drops `list_open_fridays` (F3);
  - lists Chromium under subprocess and network access, citing Justin's 3 Oct decision (F1, F2);
  - replaces the `src/bookwhen.ts` sentence (F2, F3);
  - marks both lists incomplete, naming what was not checked and that proposals P1 and P2 are pending. It leaves the
    ntfy sentence untouched.
- `README.md`:
  - reduces the external-path list to a summary and a link to `AGENTS.md` (F3);
  - replaces the Bookwhen token paragraph (F3);
  - replaces the open-Fridays sentence with the 17 Sep decision on how Moving Stillness's changes are applied (F3);
  - removes "scheduling" from what is absent, citing the decision (F16);
  - points to `package.json` for the Pi version (F17).
- `SECURITY-REVIEW.md`: the guarded-path list becomes a pointer to `dangerfile.js` (F17).
- `scripts/orc-service.ts`: the unit's `Documentation=` points at `README.md` (F15).
- `test/architecture.test.ts`: a new test confines Playwright's library and `node:dns` imports to
  `src/adapters/browser/playwright.ts` (F4).
  - Its two regular expressions were run against the snapshot's `src/` and match only that file.
  - `node --check` parses the patched file.
  - The suite was not run, because the snapshot has no `node_modules`.
  - This patch touches guarded paths, so its pull request needs a `## Security review` section.

`patches/settled-lab.patch`:
- `STATE.md`: rewritten (Step 5; F7, F9).
- `README.md`: the diary's real flags, timings and `--no-tests` behaviour (F11).
- `AGENTS.md`: what `map.mjs --check` covers (F10).
- `decisions/2026-10-04-lab-role-and-processes.md`: Justin's decisions copied from `STATE.md` with their source lines
  (F8). Recording them decides nothing again.
- `decisions/2026-10-07-proposals-from-entropy-assessment.md`: P1 to P5, recorded as awaiting Justin, as the intent
  pass requires. Its home follows current practice; P5 could move the ORC ones.

### Provisional: apply only after Justin answers the named question

- `provisional-P1-orchestrator.patch` (**P1**): `AGENTS.md` lists the restart card's four commands. Fill in the
  decision's date.
- `provisional-P2-orchestrator.patch` (**P2**): `AGENTS.md`'s ntfy sentence states how packages reach ntfy, and the
  architecture test's comment follows. Fill in the tap-address rule and date.
- `provisional-P3-lab.patch` (**P3**): `STATE.md`'s header points to the cap in `AGENTS.md`.
- `provisional-P4-lab.patch` and `provisional-P4-orchestrator.patch` (**P4**): install the guard at the lab's
  `skills/session-coherence-guard/SKILL.md`, and add a "Before handing off" pointer to both `AGENTS.md` files.
- `provisional-P5-lab.patch` and `provisional-P5-orchestrator.patch` (**P5**): add a decisions row to the lab's "Where
  a learning goes", a Decisions pointer in ORC's `AGENTS.md`, and the north star copied to the lab's `decisions/`.
- **After both P1 and P2 are applied,** delete the incompleteness note's clause about pending proposals in ORC's
  `AGENTS.md`.

### One-time cleanup, for issues on the map, never in the guard

Each item was checked against the current file.
1. **Triage ORC's root reports** (F15): link each live one from `README.md`, and give each historical one a banner
   like `MCP.md`'s, or move it to the lab's `reports/`. A move changes where things live, so it needs Justin's yes.
2. **`tools/report.mjs --no-tests`** should keep the day's earlier test count rather than write `null` (F11).
3. **`tools/map.mjs`:** read the map's 9 repositories, and fail on a repository that cannot be read (F10). This is
   already found by the labels review; attach it there.
4. **`tools/collect.mjs`:** read ORC's state directory from ORC's own environment file, or from one place both share,
   instead of hard-coding it (F12, #62).
5. **`reports/2026-09-17-async-review-critical.md`:** replace it with the review's text, or rename it `.jsonl` (F20).
6. **Check that each 3 Oct decision is recorded on its issue:** #194, the dropping of MS `failure-verdicts`, MS #52.

---

## 11. Guard generation (session-coherence-skill-generator)

- **Supplied:** this assessment's findings and the inputs below.
- **Decision:** `create`. The guard is `guard/SKILL.md`. Its intended home is the lab's
  `skills/session-coherence-guard/SKILL.md`, provisional on P4.
- **Size:** 1,138 words (`wc -w`), against a budget of 1,176.

| Budget term | Words |
|---|---|
| Common contract, as measured by the generator | 706 |
| 8 repo-specific checks beyond the two standing ones, at 36 each | 288 |
| Pointers: the filled-in "Where things live" | 94 |
| Commands: the checks' command block (61), the live-changes line (19), and one sentence on running in each repository (8) | 88 |

  The 8 checks came to 292 words; the two standing checks, filled in, to 59 against about 25 as placeholders. No
  duplication was left to remove.
- **Doc references added:** the "Before handing off" pointers in both `AGENTS.md` files, provisional on P4.
- **Validation:**
  - The patches apply cleanly and pass `git diff --check`.
  - The guard's `node --input-type=module -e …` command was run against a stub module of the same shape. It was not
    run against the lab's real `tools/collect.mjs`, which would read ORC's live database outside the snapshot.
  - `pnpm` commands were not run: there is no `node_modules`.
- **Review before handover:**
  - The guard carries "Modes and safety" and binds its baseline.
  - The settled patches touch no open question.
  - The guard's repairs and its copy of the intent-change rule (v2, with Justin, the intent documents and lab
    `decisions/` filled in) forbid editing intent documents to match work.
  - The size is within budget.
- **Open questions the guard leaves visible:** P5 is in its "Decisions" pointer. P1 to P3 are pending proposals its
  reach and cap checks will meet.
- **Handoff:** to `guards-integrator`; see `integration.md`.

### Generator inputs

- **Steward:** Justin.
- **Intent documents:** lab `SCOPE.md`, `scope.yaml`, `decisions/`, `memory/authority-rules-step-1.md`, and the north
  star in `STATE.md`; ORC `README.md` ("Direction", "Boundary") and `AGENTS.md`.
- **Decision surface:** lab `decisions/`, and issues on the map. Open question: P5.
- **Current-state file:** lab `STATE.md`, rewritten by whoever causes a verified event (Claude, Codex or Justin).
- **Rules bound by but not owned:**
  - `~/pro/local-config/home/AGENTS.md`, for every session: prior art first, and how to report a live service (lab
    `STATE.md` 15–16);
  - a local-config rule that spending goes through ORC's permissions (lab `reports/2026-10-03-branch-cleanup.md` 46);
  - ORC `SECURITY-REVIEW.md` and `dangerfile.js`;
  - the map's rules in orchestrator#140;
  - `~/pro/agentic/HOW_NOT_TO_PLAN.md`;
  - `~/pro/scope/docs/MODEL.md`;
  - the merge rule (Justin, 25 Sep).

  The external files were not read.
- **Verification commands:**
  - ORC: `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report`, `pnpm codemap --today`,
    `pnpm service:status`.
  - Lab: `node tools/map.mjs --check`, `node tools/report.mjs`.
  - Only Danger runs by itself.
- **Code areas and what describes them:**

  | Area | Docs | Tests and checks |
  |---|---|---|
  | Researcher and analyst (`src/core/child-agent-process.ts`, `research-tools.ts`, `analysis-tools.ts`) | `README.md` "Use", "Boundary"; `AGENTS.md`; module headers | the architecture test's topology, subprocess and network checks; their own tests |
  | Browser (`src/adapters/browser/`) | `AGENTS.md` (after the settled patch); `MCP.md` (history); headers; lab report of 3 Oct | `browser-connector.test.ts`; the new architecture check |
  | Notices (`src/adapters/notifications/`, `src/adapters/phone/`) | `AGENTS.md` 98–102; headers | `ntfy-notifications`, `phone-connector`, `notification-transports` tests |
  | Restart (`src/adapters/orc-service.ts`, `src/app/orc-restart.ts`, `scripts/orc-service.ts`) | `README.md` "As a service"; `AGENTS.md` 136 | `orc-restart.test.ts`; the subprocess check |
  | Durable work (`src/core/async/`, `src/app/async*`, `src/adapters/async-store/`) | lab `decisions/2026-09-17…`; `AGENTS.md` "Approval cards"; `FIXES.md`, `REWORK.md`, `SEAM.md`, `OPERATOR.md` (history) | `async-*` tests; the async-layer and storage-vocabulary checks |
  | Packages (`src/app/agent-packages.ts`, `src/adapters/agent-files/`, `src/package-api.ts`) | `AGENTS.md` "Security review"; `GRANTS.md`; `POLICY-STORE.md`; `src/package-api.api.md` | `package-*` tests; the package-API report test; Danger's Package API rule |
  | Installation config (`config/installation.ts`) | its header; `SECURITY-REVIEW.md` "Preparing for isolation" | `production-composition.acceptance.test.ts` |
  | Web client (`web/src/`) | `README.md` "Run" | vitest, e2e |
  | Lab tools (`tools/*.mjs`) | lab `README.md`, `AGENTS.md` | none |

- **Live state a session can change:**
  - `orc.service`, restarted only through the card (ORC `AGENTS.md` 136);
  - ORC's state directory: durable work, cards, standing grants, package approvals;
  - the ntfy topic;
  - Bookwhen entries, through Moving Stillness, which is paused;
  - GitHub issues and the Project's marks;
  - credentials under `~/.config/orchestrator/env` and the Scopes' credential folders.
- **Spend a session can cause:** model calls through ORC, and Astra runs. The local-config spending rule named above
  governs them; it was not read.
- **Findings:** F1 to F20.

---

## 12. Uncertainties, and what was not covered

- No git history: "enacted" intent comes from `STATE.md`, `FRICTION.md` and dated reports, not from commits.
  Whether hooks are enabled (F18) cannot be shown.
- GitHub was not read: orchestrator#101 and #184, which may record P1 and P2's decisions; #140's rules; #144, #166 and
  #198.
- Nothing outside the two snapshots was read: the user-wide `AGENTS.md`, `HOW_NOT_TO_PLAN.md`, the Scope model, the
  Moving Stillness package (F14), and ORC's live state directory (F12's real path).
- The reach search covered `src/`, `config/`, `scripts/` and `web/src/`, not `node_modules` (absent). Pi, MCP
  servers, package bundles and OpenTelemetry's exporters were not traced (F1, F2).
- ORC's tests were not run (no `node_modules`; installing needs the network). The new architecture check was
  validated by running its regular expressions and by `node --check` only.
- `reports/` (79 files) and `FRICTION.md` (about 1,400 lines) were read selectively: the entries cited, the section
  list, and the reports `STATE.md` names as of record.
- Whether lychee, ast-grep or another linter is installed was not checked.

Notes on where the skills were implicit are in `feedback.md`.
