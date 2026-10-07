# Entropy assessment: ORC and the orchestration-lab Scope

Assessed 2026-10-07, with entropy-guard's `entropy-assessment` (v0.8.0) and the skills it routes to, from read-only
snapshots of two repositories taken on 4 October 2026:

- **ORC** (`orchestrator/`), the TypeScript orchestration system, files dated 2026-10-04 14:44.
- **The orchestration-lab Scope** (`scope-orchestration-lab/`), which manages ORC's work, files dated 2026-10-04 17:31.

The snapshots have no `.git`, so nothing here is drawn from history, hook configuration or GitHub. No live service was
read. Every statement about live state is what a file recorded, with that file's date. No steward was available: each
question is in `questions.md` with a recommended answer, and the work went ahead on those recommendations, drafted as
provisional where it depends on one.

**Route taken:** `entropy-assessment` → `intent-pass.md` (with `intent-change-rule.md`) → shape B, two repositories
assessed as one system → `mixed-profile.md` across both, plus `docs-first-planning-assessment` Steps 2, 3 and 5 on the
lab → Step 3, a new guard is needed → `session-coherence-skill-generator` → `guards-integrator`. The generator's
`bootstrap.md` was not needed: the lab already has a state file and a decision folder.

Other output: `questions.md`, `guard/SKILL.md`, `integration.md`, `patches/orchestrator.patch`,
`patches/scope-orchestration-lab.patch`, `state-update/STATE.md` (the proposed state file, for reading),
`feedback.md` (notes on entropy-guard itself), `read-log.md`.

---

## 1. Intent

### Steward

**Justin.** The lab's `scope.yaml:6` names `steward: justin`, and lists ORC's repository as the application resource of
its active `orchestrator` project (`scope.yaml:10-20`). ORC's own repository names no steward, but its `AGENTS.md`
quotes Justin's directives (`AGENTS.md:33-37`, `:117-118`) and the lab's `SCOPE.md:11-12` claims ORC as its project.

### Authorised intent, with the source of each part

| Part | Source | Kind and authority |
|---|---|---|
| What ORC is for: Justin's "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; once the six slots work, "work towards a point of consolidation" | lab `STATE.md:8-11` | Directive; Justin, dated 25 and 26 Sep. **Only in the overwritten state file** (F2). |
| The Scope's purpose: develop and operate ORC and its reusable Scope-owned agents | lab `scope.yaml:5`, `:13`; `SCOPE.md:5-7` | Description in the formal inventory; steward named, undated. |
| Authority split: facts about ORC in ORC's repository, the generic Scope model in `~/pro/scope`, their relationship in the lab | lab `SCOPE.md:19-24`; `AGENTS.md:12-23` | Standing instruction, unattributed. |
| ORC's direction: Iris as front door, ADA to create agents, every agent belongs to a Scope, candidates cannot grant themselves authority | ORC `README.md:9-23` | Description, unattributed. |
| Core ships with nothing tying it to a Scope, model, owner or agent | ORC `AGENTS.md:30-55` | Directive; Justin, 2026-09-12 and 13, quoted. |
| The lethal-trifecta rule; approval requested in a prompt is not a control; standing grants only on `grantable` work | ORC `AGENTS.md:68-90`; `SECURITY-REVIEW.md` | Standing instruction; research in issue #20. |
| Approval cards drawn from fixed blocks | ORC `AGENTS.md:114-128` | Directive; "the operator, 2026-09-26". |
| ORC owns a general async-work capability, scheduling included; Moving Stillness's apply waits for approval | lab `decisions/2026-09-17-async-work-architecture.md` | Decision; Justin, 2026-09-17. |
| Authority rules 1, 2, 4 and 5 affirmed; 3, 6, chat handling and Iris's role open | lab `memory/authority-rules-step-1.md` | Decision; Justin, 1 Oct 22:05. |
| ORC drives Playwright's library in its own process | lab `reports/2026-10-03-browser-stack-prior-art.md:76` | Decision; Justin, 3 Oct, "lets use the library". Held in a report. |
| Security reviews checked on GitHub by Danger | ORC `dangerfile.js:7`; lab `STATE.md:79-82` | Decision; Justin, 2 Oct, "B". Held in a code comment. |
| The map of work is orchestrator#140 | lab `AGENTS.md:7-10`; ORC `AGENTS.md:9-12` | Directive; Justin, 2 Oct. |
| The 4 Oct interview: the lab is the central Scope for project management, issue tracking, code quality and security; the processes kept, including "entropy guard at session end"; scheduling (#166) built first; Moving Stillness paused | lab `STATE.md:33-34`, `:38-55` | Decisions; Justin, 4 Oct. **Only in the overwritten state file** (F2). |
| Claude merges a pull request once review and tests pass | lab `STATE.md:17-18` | Decision; Justin, 25 Sep. Only in the state file (F2). |
| Rules owned elsewhere: the user-wide `local-config/home/AGENTS.md`, `~/pro/agentic/HOW_NOT_TO_PLAN.md`, the Scope model's `MODEL.md`, the rules in #140's description | cited by lab `STATE.md:16`, `AGENTS.md:27-29`, `SCOPE.md:24` | Outside the snapshot; **not read**. They take precedence where they apply. |

**Declared, enacted and authorised.** What the documents declare (ORC's README, a local-first personal agent with
read-only data paths and no scheduling) lags what was enacted (durable work with schedules, an in-process browser that
writes to Bookwhen after approval, phone notices, invoicing). Most of that enactment is authorised by recorded
decisions (17 Sep, 2 Oct, 3 Oct), so the gaps are mainly stale descriptions, not drift. Two places where enactment may
have outrun authorisation are F5 (core-ties allowances raised) and F10 (restart commands inherit ORC's environment).

### Gaps by condition

- **Stale description:** F12, F13 and F14 contradict later recorded decisions; F4 is a decision record overtaken by a
  later change. The patch corrects only what the decisions plainly cover (section 8).
- **Conflict:** F7 (the state file's cap, forty or sixty lines).
- **Missing:** F3 (no named home for ORC's design decisions).
- **Ambiguous:** F8 ("consolidation").
- **Unauthorised drift, possibly:** F5. Whether it is drift or an adaptation is Q2.
- **Prose control:** F5 ("a count may only fall"), F6 ("once review and tests pass"), F7 (the state cap), F15 ("read in
  exactly one place"), F10 ("no subprocess ORC launches receives one").
- **Steward decisions found only in an overwritten state file:** F2, copied to the lab's `decisions/` by the patch.
- **Existing guards' repair instructions:** none tells anyone to edit intent documents to match the work, or to keep two
  copies in step. The core-ties ratchet's "lower the allowance to N in the same change" (`test/architecture.test.ts:344`)
  only moves a count toward the rule.

### Questions

Five, in `questions.md`, each with a recommended answer: Q1 where ORC's design decisions are recorded (F3); Q2 whether
a core-ties allowance may rise (F5); Q3 the state file's cap (F7); Q4 whether README's "reminders" and "workflow
execution" are still deliberately absent (F13); Q5 whether README's "a credential is read in exactly one place" is a
rule or a description (F15).

### Proposed changes, and where they are recorded

- Steward decisions copied from `STATE.md` into a new record in the lab's `decisions/` (F2). Copying is not deciding.
- No intent document is changed to match the work. The ORC documentation patch corrects descriptions only where a
  recorded decision of Justin's or a rule in the same file settles them, and cites it.
- No new intent change is proposed by this assessment. F5's allowance rises are put to Justin as Q2, not recorded as
  approved.

---

## 2. Lifecycle, shape and repositories

**Lifecycle: active.** `scope.yaml:7` and `:15` say `status: active`; the lab's `STATE.md` was rewritten at 17:31 on
4 Oct and records four restarts that day; `FRICTION.md` has an entry for every day from 20 Sep to 4 Oct; ORC runs as
a systemd service (`README.md:106-129`). Nothing limits what the route may recommend.

**Shape: B, mixed docs and code,** across two repositories assessed as one system:

- **ORC** is code-first (shape C): 117 source files, 71 test files, an architecture test that enforces boundaries,
  with a large prose surface beside it (15 top-level markdown files, about 227 KB).
- **The lab** is docs-first (shape A): the state file, decisions, memory, friction log, reports and the map's tooling
  that manage ORC's work.
- Workflow-heavy traits (shape D) run through both: the map, approval cards, Danger, restart and build cards, reviews.

B is the riskiest fit: the costliest drift found sits between the documents and the code, and between the two
repositories. Following Step 2, `docs-first-planning-assessment` Steps 2, 3 and 5 were also run on the lab.

**Repositories and ownership** (from `mixed-profile.md`):

| Concept | Owner | A second home |
|---|---|---|
| ORC's code, boundaries and agent rules | ORC (`AGENTS.md`, `test/architecture.test.ts`) | ORC's README restates them (F11, F15) |
| Current state of all the work | lab `STATE.md` | none in ORC, and ORC's sessions are not pointed at it (F22) |
| Open work | GitHub issues on orchestrator#140 | `STATE.md` lists some, as it should, by number |
| ORC's design decisions | not named (F3) | lab `decisions/`, a lab report, a code comment, ORC branch reports, `STATE.md` |
| The running ORC's state directory | ORC's env file, outside both repos | ORC's code default, `scripts/orc-service.ts`, the lab's `tools/collect.mjs`, the lab's memory note (F18) |
| ORC's durable-work schema | ORC (`src/adapters/async-store/sqlite.ts`) | read directly by the lab's `tools/collect.mjs` (F21) |
| The security-review path list | ORC `dangerfile.js` | restated, incompletely, in `SECURITY-REVIEW.md` (F19) |
| A host connector's setting names | ORC | each Scope package's manifest (orchestrator#198; F21) |

---

## 3. Findings

One list. Every other section refers to these ids. Line numbers are in the 4 Oct snapshots.

**State and decisions**

- **F1. The lab's `STATE.md` contradicts itself and is over both of its caps.** It says #193 is "built and in review,
  not merged" (`:23`) and that "#193 is live: #200 merged" (`:31`). It gives the running build as `369628b` since
  22:12:47 on 3 Oct (`:58`, `:88`) and as `8cee662` restarted 14:48:27 on 4 Oct (`:35-36`); a power cut at 11:41 on
  4 Oct (`:56`) means the 3 Oct start time cannot also be current. It says #201 was just filed (`:56-57`) and live
  (`:34`); browser-stack work is next (`:59`) and waits while Moving Stillness is paused (`:33-34`); a grant "covers the
  test entry until 1 Oct 18:00Z" (`:94`), three days past. The file is 99 lines against `AGENTS.md:34`'s "about forty
  content lines" and its own "sixty" (`:4`). The same failure is recorded twice before: `FRICTION.md:866-869` (12 Sep,
  finished work listed as missing) and `:621-626` (22 Sep, "two false statements, both found by being asked a direct
  question"). Source: docs against docs.
- **F2. Steward decisions live only in the overwritten state file.** The north star (`STATE.md:8-11`), the merge rule
  (`:17-18`), the 4 Oct interview (`:38-55`), Moving Stillness paused (`:33-34`) and the 3 Oct decisions (`:57-58`)
  appear in no other file in either repository. `STATE.md` is "overwritten at each verified event" (`:4`;
  `AGENTS.md:33`), so the next rewrite can drop them. Source: intent pass §5.
- **F3. No named home for ORC's design decisions.** ORC has no decision log. Its decisions sit in the lab's
  `decisions/` (one file), a lab report (`reports/2026-10-03-browser-stack-prior-art.md:76`), a code comment
  (`dangerfile.js:7`), an ORC branch report (`FIXES.md:138`, "the approved split", approver not named), `STATE.md`, and
  presumably GitHub issues. The lab's `SCOPE.md:19-21` says facts about ORC belong in ORC's repository. Condition:
  missing. Question Q1.
- **F4. A decision record overtaken by a later change, with no note.** `decisions/2026-09-17-async-work-architecture.md`
  (`:47`) declares `idempotency: natural | keyed | none`; ORC replaced it with `repeatEffect` and `submissionKey`
  (`src/core/async/types.ts:142-144`, `:332-334`; `FIXES.md:138-158`), which a manifest carrying the old field is
  refused for. Who approved the split is not recorded. Source: superseded material nearby.
- **F7. Two caps for one state file.** `AGENTS.md:34`: "capped at about forty content lines". `STATE.md:4`: "Target:
  sixty lines." No recorded decision says which wins, and nothing checks either. Condition: conflict. Question Q3.
- **F8. "Consolidation" allows two readings.** Justin, 26 Sep: once the six slots work, "work towards a point of
  consolidation" (`STATE.md:10-11`). It could mean no new capability until things are consolidated, or consolidating
  the architecture while agents keep arriving. They diverge on the finance agent (30 Sep) and the advert agent (2 Oct),
  each installed after that date (`test/core-ties.ts:43-46`). Justin's later decisions settle the immediate direction
  (4 Oct: build scheduling #166 first), so no question is asked; the reading is noted for him. Condition: ambiguous.

**Enforcement**

- **F5. The core-ties ratchet has risen three times, against its stated rule.** `AGENTS.md:47-48`: "a count may only
  fall, and its allowance falls in the same change", which carries Justin's open-source directive (`:33-37`). The
  allowance for `config/installation.ts` went 28 → 51 (30 Sep) → 64 → 70 (both 2 Oct), each with a reason in the comment
  (`test/core-ties.ts:41-48`, citing #152). The test enforces an exact count, not a falling one
  (`test/architecture.test.ts:334-350`, `:566`), and Danger asks only for a `## Security review` section. Condition:
  prose control; drift or adaptation is Question Q2.
- **F6. "Tests pass" is a claim no check makes on a pull request.** The only CI is Danger
  (`.github/workflows/danger.yml`), which checks that two description sections exist (`dangerfile.js:44-74`). Nothing
  runs `pnpm typecheck` or `pnpm test` on a pull request, yet `README.md:131-136` and `AGENTS.md:3-4` call
  `test/architecture.test.ts` what enforces the boundaries, and Claude merges "once review and tests pass"
  (`STATE.md:17`). Tests on every pull request (#144) were kept on 4 Oct; how is waiting on Justin (`STATE.md:69`).
  Condition: prose control; enforcement would sit in a pull-request workflow.
- **F9. Danger's guarded list misses scripts that change what an agent can reach.** `GUARDED` (`dangerfile.js:11-26`)
  includes `scripts/approve-agent-package.ts` and `scripts/async-work.ts`, but not `scripts/execution-policies.ts`
  (writes tool and operation grants: `grant:tool`, `grant:operation`, `package.json:21-23`, `:60`, `:64`),
  `scripts/activate-research-agent.ts` (the only place candidate activation is reachable,
  `test/architecture.test.ts:1069-1083`) or `scripts/approval-grants.ts` (raises and revokes standing-grant cards). A
  pull request changing how `grant:tool` reads its three arguments needs no security review. Source: rules against
  enforcement.
- **F10. The restart card's commands inherit ORC's whole environment.** `README.md:103-104`: "No subprocess ORC
  launches receives one" (a credential). `src/adapters/orc-service.ts` runs git, `pnpm install`, the build and
  `systemctl` through `execFile` with no `env` option (`:71`, `:102`, `:107`, `:128`), so each inherits what
  `scripts/orc-env.sh` loaded from `~/.config/orchestrator/env`, where `README.md:68-69` advises pinning
  `ORCHESTRATOR_WEB_TOKEN`. The Pi child and the analyst's git are given an environment built in code
  (`src/core/child-agent-process.ts:372`, `src/core/analysis-tools.ts:314`). The added exposure is small: the commit being
  built runs with that same environment once ORC restarts on it. The documented constraint stands, so the fix belongs in
  the code (section 7). Source: rules against enforcement.

**ORC's documents against its code**

- **F11. README's list of what ORC reaches is out of date, and restates `AGENTS.md`.** `README.md:5-7` names "published
  Bookwhen events, fixed Bookwhen admin inspection and planning operations, and public webpages through Jina Reader" as
  its read-only data paths. The code also reaches ntfy (`src/adapters/notifications/ntfy.ts`), drives Chromium to
  granted hosts and writes through it after approval (`src/adapters/browser/playwright.ts`), and activates Scope
  package connectors for mail, calendars and client records (`config/installation.ts:112-168`). Source: docs against
  implementation; parallel truth with `AGENTS.md:92-108`.
- **F12. Both documents describe a Bookwhen client ORC no longer has.** `README.md:76-79` tells the operator to set
  `ORCHESTRATOR_BOOKWHEN_API_TOKEN` for the pinned `@jphil/bookwhen-client@0.6.1`; `AGENTS.md:102-103` says
  `src/bookwhen.ts` is the only module importing it. There is no `src/bookwhen.ts`; no file in `src/`, `scripts/` or
  `config/` reads that variable; the test refuses the client as a dependency or import and refuses Bookwhen code in
  source (`test/architecture.test.ts:1311-1321`). `list_open_fridays` is now a Scope package's tool, answering
  "unavailable" until the package is approved (`src/runtime.ts:259-260`). `src/cli.ts:6` and `:34` still advertise
  Bookwhen availability. Stale against `AGENTS.md:40-41`'s own rule that a Bookwhen connector belongs to the Scope.
- **F13. README predates the async-work decision.** `README.md:147` says Moving Stillness calculates a slot plan
  "without applying it"; `:152-154` lists "scheduling" as deliberately absent. Justin's decision of 17 Sep makes
  scheduling part of ORC and makes Moving Stillness's apply approval-gated durable work (lab decision, "Decision" and
  "Consequences"); the code has a `schedules` table (`src/adapters/async-store/sqlite.ts:41-51`) and series commands
  (`package.json:38-42`). Condition: stale description. "reminders" and "workflow execution", in the same list, are not
  plainly settled by that decision: Question Q4.
- **F14. `AGENTS.md`'s lists of what ORC launches and reaches each miss a member, and one test cannot see one.** The
  subprocess list (`AGENTS.md:92-96`) omits `src/adapters/orc-service.ts`, which the test already allows
  (`test/architecture.test.ts:822-834`, orchestrator#101). The network list (`:98-104`) omits the in-process Chromium
  of `src/adapters/browser/playwright.ts`, decided by Justin on 3 Oct. The test "limits core network I/O to the
  approved modules: Jina reads and ntfy notices" (`:1295-1312`) matches `fetch`, HTTP, socket and WebSocket imports,
  not `import { chromium } from "playwright"`, so it passes while ORC drives a browser. Condition: stale description,
  plus a check that does not cover a member of the kind it names.
- **F15. "A credential is read in exactly one place, `src/runtime.ts`" (`README.md:103`) no longer holds.** ORC's web
  token is read in `src/web-cli.ts:625`; a credential a Scope owns is read from that Scope's folder by
  `src/adapters/scope-credentials.ts`; `src/runtime.ts` reads none. `AGENTS.md:106-108` states the looser rule,
  "composition roots and narrowed connectors". Whether the README sentence is a rule (then the code is drift) or a
  description (then it should link to `AGENTS.md`) is Question Q5.
- **F16. The MCP client appears to have no production caller.** No file in `src/`, `scripts/`, `config/` or `web/src/`
  imports `src/adapters/mcp/client.ts` or `src/backends/pi/mcp-tools.ts` other than each other and tests. `MCP.md:3-5`
  says the client "still serves Pi's MCP tools" and `AGENTS.md:94-96` lists it as live. The search was textual; a
  dynamic import by computed name would escape it.
- **F17. Superseded reports sit beside live documents at ORC's root, and the service points at one.** Ten files are
  branch-time reports: `CLASSIFY.md`, `FIXES.md`, `GRANTS-E2E.md`, `OPERATOR.md`, `POLICY-STORE.md`, `REWORK.md`,
  `SEAM.md`, `SLICE1.md`, `TURN-RECORD.md`, `VISIBILITY.md`. None is marked as history. Examples: `REWORK.md:3` "Nothing
  committed, nothing pushed"; `FIXES.md:152`, `:557` "the schema version stays at 1", where the code migrates to 3
  (`sqlite.ts:530-534`); `MCP.md:40-44` reports deleting `playwright.ts`, which exists again, and `:53-55` cites
  `test/browser-service.test.ts`, which does not; `MCP.md:60` "Pending final verification"; `GRANTS.md:88` cites
  `src/adapters/browser/service.ts`, which does not exist. `scripts/orc-service.ts:41` writes
  `Documentation=file://…/OPERATOR.md` into the systemd unit, but `OPERATOR.md` is the report of a branch about approval
  cards and notifications; the service is documented in `README.md:106-129`.
- **F19. `SECURITY-REVIEW.md` restates the guarded-path list, incompletely.** Its "Which changes ask for this"
  (`:178-180`) omits `config/`, `package.json`, `pnpm-lock.yaml`, `test/core-ties.ts` and the two guarded scripts that
  `dangerfile.js:11-26` lists; the architecture test checks `dangerfile.js` (`:723-741`), not this prose. Source:
  parallel truth.

**Across the two repositories**

- **F18. Which state directory the running ORC uses has five homes, and the confusion has cost four wrong claims.**
  ORC's default is `~/.local/share/orchestrator` (`src/runtime.ts:190`). The running service uses
  `~/.local/share/orchestrator-proof`, set in its env file (`FRICTION.md:360-362`; lab
  `memory/slots-run-walkthrough.md:19`). `pnpm service:status` reads the env file (`scripts/orc-service.ts:132-133`);
  every other operator script uses the default (`scripts/async-work.ts:18`, `approval-grants.ts:25`,
  `execution-policies.ts:20`, `approve-agent-package.ts:27`, `activate-research-agent.ts:28`, `timeline.ts:155`); the
  lab's `tools/collect.mjs:16` hard-codes the live value. Recorded costs: 21 Sep (`FRICTION.md:653-656`), 26 Sep, a
  grant reported missing that was granted (`:466-470`), 26-27 Sep watchers that watched an empty directory, and 28 Sep
  (`:359-366`), which calls it "a missing system". Issue #62 holds it. Three failures from one cause: the layer above is
  missing, not another instance.
- **F21. The lab's diary reads ORC's internals directly, and fails silently.** `tools/collect.mjs` queries ORC's
  SQLite tables and columns (`:123-146`) and lists ORC's agents from `src/core/*.md` (`:164-180`). Every reader
  "returns null or an empty list when its source is unavailable" (`:2-4`, `:145`). It was rebuilt once already because
  ORC paths moved (`:6-7`), and ORC's schema is at its third version (`sqlite.ts:530-534`). No test in either
  repository ties them. A similar seam cost an hour on 3 Oct: a host connector's setting names live in ORC and again in
  each package manifest (`FRICTION.md:63-67`, #198; packages cannot test against ORC's parts, #202).
- **F22. Sessions that start in ORC are not pointed at the current state.** ORC's `AGENTS.md:3-12` sends a fresh agent
  to the README, the architecture test and #140; nothing points to the lab's `STATE.md` or `FRICTION.md`. The lab has
  `CLAUDE.md` linked to `AGENTS.md`; ORC has no `CLAUDE.md`, so whether a Claude Code session in ORC loads its
  `AGENTS.md` at all is not visible here.

**The lab's documents and tools**

- **F20. The lab README names a mode the diary does not have.** `README.md:16-22` offers `node tools/report.mjs
  --serve` on port 4190 and says a full run takes about ten seconds; `tools/report.mjs` handles only `--no-tests` (`:51`),
  says "nothing is served" (`:13`), and puts a full run at about two minutes (`:10`).
- **F23. The session-end entropy guard was decided and not built.** Kept by Justin on 4 Oct (`STATE.md:49`); the lab's
  `skills/` holds only `.gitkeep`, and neither repository has a guard of this kind.
- **F24. `FRICTION.md` is not newest-first throughout.** It says "Newest first" (`:3`), but from `:1153` a second block
  runs oldest-first (11 to 19 Sep), repeating 12 and 17 Sep. `tools/collect.mjs:150-161` counts sections either way.
  Small.
- **F25. Both pre-push hooks only print a summary, and may not run.** Each calls
  `~/pro/local-config/scripts/push-summary`, outside the snapshot, and never blocks; each needs
  `git config core.hooksPath .githooks`, which a snapshot cannot show. Neither repository has a pre-commit hook.
- **F26. The pull-request template has no `## Package API` section** although Danger fails a change to the package API
  report without one (`dangerfile.js:50-57`; `.github/pull_request_template.md`). Small.

---

## 4. Truth map and loop map

### Which document owns which truth (docs-first Step 2, extended to ORC's documents)

| Document | Role | Notes |
|---|---|---|
| lab `scope.yaml` | canonical | the Scope's identity, steward, projects and resources |
| lab `SCOPE.md` | canonical | purpose and the authority split |
| lab `AGENTS.md` (`CLAUDE.md` links to it) | canonical | how agents work in the lab: read order, map, where learnings go, pace, keeping state |
| lab `STATE.md` | current state | read first; also the only home of several decisions (F1, F2) |
| lab `decisions/` | canonical | one decision so far, partly overtaken (F4) |
| lab `memory/authority-rules-step-1.md` | canonical | Justin's answers on authority rules, 1 Oct |
| lab `memory/slots-run-walkthrough.md` | local elaboration | one run traced, read 28-29 Sep |
| lab `FRICTION.md` | canonical log | what broke in real use; feeds the monthly "FRICTION into rules" (#60) |
| lab `AGENT_IDEAS.md` | register | ideas, explicitly not approved designs |
| lab `reports/*.md`, `research/` | historical | dated reviews and research; one holds a decision (F3) |
| lab `reports/*.json`, `status.html` | generated projection | the diary's snapshots and page |
| lab `README.md` | local elaboration | orientation and diary commands (F20) |
| lab `tools/` | product artifact | the map and the diary; names, flags and output are contracts (F21) |
| lab `skills/`, `workflows/` | empty | `.gitkeep` only (F23) |
| ORC `README.md` | canonical | what ORC is, how to run and verify it; boundary statements restate `AGENTS.md` (F11, F15) |
| ORC `AGENTS.md` | canonical | the rules for changing ORC, and the lists of what it reaches and launches (F12, F14) |
| ORC `test/architecture.test.ts`, `test/core-ties.ts` | canonical, executable | the enforced boundaries; run only by hand (F6) |
| ORC `SECURITY-REVIEW.md` | product artifact | the review checklist; restates the path list (F19) |
| ORC `dangerfile.js`, `.github/` | canonical, executable | the guarded-path list and the one CI job |
| ORC `src/package-api.api.md` | generated projection | API Extractor's report, checked by a test |
| ORC source headers (`Owns`, `Never`, `Today`) | local elaboration | required by the architecture test (`:531-539`) |
| ORC `GRANTS.md`, `MCP.md` | local elaboration, part historical | design notes with stale paths (F17) |
| ORC's ten branch reports | historical, unmarked | F17 |
| ORC `.github/pull_request_template.md` | template | F26 |

**One canonical home for each major concept:** ORC's purpose, the lab's `decisions/` once F2's copy lands (README's
"Direction" summarises); ORC's boundaries, `AGENTS.md` enforced by the architecture test (README links); open work,
#140; current state, lab `STATE.md`; guarded paths, `dangerfile.js`; core ties, `test/core-ties.ts`; async-work design,
the lab decision of 17 Sep with later changes recorded against it (F4); the running state directory, nowhere yet (F18).

### The real loop (docs-first Step 3)

1. **A session starts.** In the lab, `CLAUDE.md` → `AGENTS.md` → `STATE.md`, `SCOPE.md`, the map #140. In ORC,
   `AGENTS.md` → README, architecture test, #140 (F22). Agents mark the issue they take with `node tools/map.mjs
   working`.
2. **Work happens on a branch in a worktree** (`REWORK.md:3`, `.gitignore`'s `.worktrees/`); where agent worktrees live
   is open (#196).
3. **Handoff is a pull request:** a `## Security review` section when guarded files change (Danger), a `## Package API`
   section when the API report changes, often an adversarial review by Astra filed in the lab's `reports/`. Claude
   merges once review and tests pass; the tests are run by hand (F6).
4. **Going live is a card:** ORC raises "Restart ORC onto <commit>" after a pull, Justin approves, and the new build
   is recorded in `STATE.md` as live with commit and time. Scope packages go live through build cards.
5. **State is rewritten** "at each verified event" (lab `AGENTS.md:33`); the file records four restarts on 4 Oct alone,
   each one such an event.
6. **Learnings and decisions are captured** in `FRICTION.md` (daily), `reports/` (reviews), `memory/` (relationship
   facts), `AGENT_IDEAS.md` (ideas, committed at once), `STATE.md` (decisions, F2) and issues.
7. **The diary** (`node tools/report.mjs`) and the map check are run by hand until ORC's scheduling (#166) runs them.

Follow-up is lost at step 5, where an overwrite can drop a decision or an ask (F1, F2), and at ORC's root, where
reports read as current (F17).

---

## 5. Ranked risks

By decay rate times recovery cost.

1. **The state file is not honest, and carries decisions it can lose** (F1, F2). *Decay:* fast; it is rewritten
   several times a day. *Recovery:* high; wrong answers about a live service reach Justin with confidence (twice
   before, `FRICTION.md` 12 and 22 Sep), and a dropped decision is recoverable only from history. *Symptoms:* five
   contradictions and an expired grant in one 99-line file. *Anchor:* lab `STATE.md`, with decisions in the lab's
   `decisions/`.
2. **The boundary checks are cited as enforced but run only by hand, and their own rules can be edited away** (F5, F6,
   F9, F10). *Decay:* every pull request. *Recovery:* high; a weakened boundary is found only by someone thinking to
   run the suite or to read a ratchet's history. *Symptoms:* allowance raised three times in five days; authority
   scripts outside the guarded list. *Anchor:* `test/architecture.test.ts`, `dangerfile.js`, #144.
3. **ORC's capability and boundary documents trail its code** (F11 to F16). *Decay:* medium; a capability has arrived
   every few days (finance 30 Sep, phone 2 Oct, browser 3 Oct). *Recovery:* medium to high; security reviews answer
   "what does this let an agent do that it could not before?" against a list that is already wrong, and a cold agent
   believes ORC holds a Bookwhen client. *Anchor:* `AGENTS.md`, checked by the architecture test.
4. **The two repositories share facts that only one of them owns** (F18, F21, F22). *Decay:* medium; the schema
   reached its third version since 17 Sep and a connector rename broke Moving Stillness on 3 Oct. *Recovery:* medium; failures
   are silent (null readers, an empty directory) and have produced four wrong claims. *Anchor:* ORC, through #62, #198
   and #202.
5. **No home for ORC's decisions, and superseded material beside live truth** (F3, F4, F17). *Decay:* slower; the
   reports do not change, but each new one adds to the pile. *Recovery:* medium; a decision is relitigated or an old
   report is followed. *Anchor:* the answer to Q1, and the lab's `decisions/`.

---

## 6. Existing guard surfaces, by whether they run

- **Runs by itself:** Danger's "Security review" job on every pull request to ORC (`.github/workflows/danger.yml`):
  section presence for guarded paths and for the package API report. It does not run on a direct push to `main`
  (`AGENTS.md:141-143`), and whether it is a required check cannot be seen.
- **Runs only by hand:** ORC's `pnpm typecheck`, `pnpm test` (architecture test, core-ties and cause-discard ratchets,
  package API report test), `pnpm test:e2e`, `pnpm api:report`, `pnpm pi:check`; the lab's `node tools/map.mjs --check`
  and `node tools/report.mjs`; the `SECURITY-REVIEW.md` checklist; Astra's adversarial reviews.
- **Decided, not built:** tests on every pull request (#144, mechanism awaiting Justin); the session-end entropy guard
  (4 Oct; F23); scheduled runs of the diary, weekly review, FRICTION into rules (#60), branch cleanup (#70) and `/tmp`
  cleanup (#182), all through #166; approvals bound to builds (#137); an independent read for grantable task types (#74);
  Scopes loaded by card (#152), which would end the core-ties raises; a hook to clear a session's map marks.
- **Declared, but missing:** `src/bookwhen.ts` (F12); the diary's `--serve` (F20); "a count may only fall" against
  raises (F5); the state file's cap (F7).
- **Unknown:** both `.githooks/pre-push` hooks (F25); whether Claude Code sessions in ORC load `AGENTS.md` (F22).

Mechanical checks belong to tools. None of lychee, ctxlint, agnix or ast-grep is on the PATH of the machine this ran on
(checked 7 Oct; the `sg` on the PATH is `/usr/bin/sg`, not confirmed to be ast-grep). A relative-link check run by hand
on both repositories' top-level markdown found no broken links, so the drift is in named paths and identifiers, not
links.

---

## 7. Recommendations

### Consolidate, demote, mark historical

- **Reduce ORC's README boundary statements to a link to `AGENTS.md`** (F11), and `SECURITY-REVIEW.md`'s path list to
  a link to `dangerfile.js` (F19). In the patch.
- **Mark ORC's ten branch reports as history:** a first line each naming the branch, the date and what superseded it,
  as `MCP.md` already does for its browser sections (F17). Moving them, for instance beside the lab's other reports,
  changes how files are organised: Justin's call.
- **Point the systemd unit's `Documentation=` at `README.md`** (`scripts/orc-service.ts:41`; F17).
- **Record F4's later change against the 17 Sep decision:** a dated note naming who approved the `idempotency` split,
  once that is known. Do not rewrite the decision.
- **Move decisions out of `STATE.md`** (F2). In the patch.

### One-time cleanup, each checked against the 4 Oct file

| Item | File and line | Finding | In a patch |
|---|---|---|---|
| Remove the Bookwhen token paragraph | ORC `README.md:76-79` | F12 | yes |
| Replace the `src/bookwhen.ts` sentence | ORC `AGENTS.md:102-103` | F12 | yes |
| Add `orc-service.ts` to the subprocess list | ORC `AGENTS.md:92-96` | F14 | yes |
| Add the in-process browser to the network list | ORC `AGENTS.md:98-102` | F14 | yes |
| "without applying it"; "scheduling" | ORC `README.md:147`, `:152-154` | F13 | yes |
| Link the guarded-path list | ORC `SECURITY-REVIEW.md:178-180` | F19 | yes |
| `--serve` and the run time | lab `README.md:16-22` | F20 | yes |
| Bookwhen in the CLI's help text | ORC `src/cli.ts:6`, `:34` | F12 | no: guarded code |
| Stale test and module names | ORC `MCP.md:53-55`, `GRANTS.md:88` | F17 | no: mark as history instead |
| Reorder or label the oldest-first block | lab `FRICTION.md:1153` | F24 | no |
| Add a commented `## Package API` section | ORC `.github/pull_request_template.md` | F26 | no: guarded |

### Changes to code and checks (proposals; each is a guarded change)

- A pull-request workflow running `pnpm typecheck` and `pnpm test` (F6). This is #144; Justin is choosing between
  Actions and a hook.
- Add `scripts/execution-policies.ts`, `scripts/activate-research-agent.ts` and `scripts/approval-grants.ts` to
  `GUARDED`, and to the architecture test's list of required entries (F9).
- Give `orc-service.ts`'s `execFile` calls an explicit environment, as the Pi child and the analyst's git have (F10).
- Make the network test recognise a library-driven browser, so `playwright.ts` is named in its approved list (F14).
- After Q2: a check that fails when a core-ties allowance rises without the approval Q2 names (F5).
- Operator scripts read the running ORC's state directory as `service:status` does, and the lab's diary asks ORC
  through a command instead of reading its database (F18, F21; #62).
- Decide whether the MCP client is kept, wired or retired (F16).

---

## 8. The state-file update (docs-first Step 5)

`patches/scope-orchestration-lab.patch` rewrites the lab's existing `STATE.md` (readable whole in
`state-update/STATE.md`) and adds `decisions/2026-10-04-steward-decisions-from-state.md`. The rewrite:

- keeps the file and its header sentence, including "Target: sixty lines" (Q3), and has 44 content lines;
- resolves each contradiction in F1 to the latest recorded value, and labels every live value as recorded on 4 Oct and
  not re-read; it says what makes the file stale and who rewrites it;
- links settled decisions to where they are recorded, lists the canonical documents to read first, the active fronts,
  the five open questions, the misleading material nearby (F4, F17, F18) and three next actions;
- drops history (the power cut, the phone work closed on 3 Oct) that `git log` and the issues hold.

`patches/orchestrator.patch` holds ORC's documentation corrections. Each patch's opening lines name the decision behind
each change and the open questions it touches, with the text each question is about left unchanged.

---

## 9. Guard generation (session-coherence-skill-generator)

- **Mode:** plan or suggest-only, because both targets are read-only snapshots; discuss-first by default, because the
  guard spans two repositories. The guard is a draft for Justin; nothing was installed.
- **Inputs:** all present from this assessment: the steward, intent documents and decision surface (section 1, Q1
  open); the state file and who refreshes it (lab `AGENTS.md:33`); rules owned elsewhere; verification commands, of
  which only Danger runs by itself (section 6); code areas with the documents and tests that describe them (section 4);
  live state a session can change (ORC restarts by card, grants, package builds, the Bookwhen site through Moving
  Stillness, ntfy, invoicing); findings by id. No secret was read: `~/.config/orchestrator/env` is outside the
  snapshot, and only `.gitignore` shows that `.env` files are excluded.
- **Built:** a new guard, `guard/SKILL.md`, meant for the lab at `skills/session-coherence-guard/SKILL.md`, the empty
  skills folder of the Scope Justin made central on 4 Oct. One guard covers both repositories, because the costliest
  drift is between them. There was no existing guard to refine.
- **Size:** 934 words, with **J = 9** justified checks plus the contract's own check on parallel documents. Budget:
  450 + 36 × 9 + S + C = 450 + 324 + 88 + 70 ≈ 932 words, with S the words of the "Where things live" section and C the
  repository-specific commands and live-state lines. Within two words of budget, after removing one copied ORC rule
  (never start, stop or build ORC by hand) that belongs to ORC's `AGENTS.md`.
- **Checks mapped to findings:** state honesty, F1; decisions recorded, F2; reach, launch and credentials, F10 to F16;
  core-ties rises, F5; unguarded authority scripts, F9; tests before claiming they pass, F6; cross-repository seams,
  F18 and F21; decision subjects, F4; renamed names and new root reports, F17 and F20.
- **Reviewed before handover:**
  - Against the open questions: the guard's decision pointer says where ORC's decisions belong is open (Q1); the
    core-ties check reports a rise and quotes the rule without deciding whether Justin must approve it (Q2); nothing in
    it depends on Q3, Q4 or Q5.
  - Every repair instruction against authorised intent: the guard carries the intent-change rule v2 with Justin, the
    intent documents and the decision surface filled in, and tells no one to edit an intent document to match work.
  - Size: as above.
- **Documents that would mention the guard in build mode:** the lab's `AGENTS.md` and ORC's `AGENTS.md`; the wording is
  in `integration.md`.
- **Validation:** both patches applied cleanly to fresh copies of the snapshots and reproduced the drafted files
  exactly; `git diff --no-index --check` over the drafts reported no whitespace errors. The repositories' own test
  suites were not run: the snapshots have no `node_modules`.
- **Open questions the guard leaves visible:** Q1 and Q2, through `STATE.md`'s list.
- **Handover:** to `guards-integrator`; the brief is `integration.md`.

---

## 10. Next step

For Justin: answer Q1 to Q5 (`questions.md`), then look over the guard draft. For an agent, once he has: apply the two
patches (ORC's as a pull request with "No new authority" in its security review), place the guard as `integration.md`
says, and raise the code proposals in section 7 as issues on #140, linking those that already exist (#62, #144, #152,
#198, #202).

---

## 11. Uncertainties and what was not covered

- **Not read:** GitHub (the map #140 and its rules, issue texts, pull requests, branch protection), git history, the
  user-wide `local-config/home/AGENTS.md`, `HOW_NOT_TO_PLAN.md`, the Scope model, the Moving Stillness and finance
  repositories, ORC's env file and state directory, and the running service. Any of them may already record a decision
  this assessment calls missing, F2 and F3 especially.
- **Live facts:** none observed. Every build, restart, grant and test count is as the 4 Oct files recorded it.
- **Sampled, not exhaustive:** ORC's 117 source files were searched by pattern for the kinds named in the documents
  (subprocesses, network, credentials, the Bookwhen client, environment variables, state directories), not read in
  full. `web/` and `e2e/` were not examined beyond their names. Of the lab's 79 report files, only those cited by live
  documents were opened.
- **F16** rests on a textual search for importers.
- **F10's** exposure depends on what the env file holds, which was not read.
- **F25:** whether either hook is enabled cannot be told from a snapshot.
