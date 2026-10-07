# Entropy assessment: ORC and the Orchestration Lab, as one system

- **Date:** 2026-10-07. **Assessed:** read-only snapshots of ORC (`orchestrator`) and the lab
  (`scope-orchestration-lab`), both taken on 2026-10-04 (the lab's `STATE.md` says "Updated 2026-10-04 17:31").
- **Route:** `entropy-assessment` → intent pass → shape B, through `mixed-profile.md`, plus docs-first Steps 2, 3 and 5
  on the lab, which is a docs-first member → a guard is needed → `session-coherence-skill-generator` → `guards-integrator`.
- **Mode:** no steward was available, and the targets could not be edited. Every change is delivered as a patch or a
  draft, and each part that depends on an open question is marked provisional.
- **Evidence limits:** the snapshots have no git metadata, and GitHub was not readable. Section 13 lists what was not
  covered.

**Outputs:**
- this file;
- `questions.md`: five questions for Justin, each with a recommended answer;
- `patches/lab.diff`: P1 rewrites `STATE.md`, P2 records decisions held only in it, P4 records proposals, P5
  corrects `SCOPE.md`;
- `patches/orchestrator.diff`: P3 corrects stale lines in ORC's `README.md`, `AGENTS.md` and `SECURITY-REVIEW.md`;
- `guard/SKILL.md`: the session-end guard, provisional;
- `integration.md`: where the guard sits and how its adoption is checked;
- `skill-feedback.md`: notes on the entropy-guard skills themselves;
- `read-log.md`: the skill files opened, in order.

## 1. Intent

### Steward

Justin. The lab's `scope.yaml` (line 6) records `steward: justin`, and he is its only member (`admin`, lines 35-37).
ORC's `README.md` (line 3) calls ORC "Justin's local-first personal agent". On ORC's side, nothing names a steward
separately. The lab's `SCOPE.md` makes the lab the Scope "for developing and operating ORC".

### Authorised intent, with the source of each part

| Part | Source | Kind | Authority |
|---|---|---|---|
| North star: ORC is the UX surface to Justin's own agentic system; "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; "work towards a point of consolidation" once the six slots work | lab `STATE.md` lines 8-11 | directive | attributed and dated (25 and 26 Sep) |
| The lab develops and operates ORC and its reusable Scope-owned agents | lab `scope.yaml` line 5; `SCOPE.md` lines 5-7 | description | the Scope's own definition |
| The lab is the central Scope for project management, core issue tracking, code quality and security. Issues stay in each Scope's repository on one central map. Nine processes are kept. Scheduling (#166) is built first. | lab `STATE.md` lines 38-54 | decision | attributed and dated (4 Oct, interview) |
| Core ships with no specific Scope, model, owner or agent; domain code such as a Bookwhen connector belongs to its Scope | ORC `AGENTS.md` lines 30-45 | directive | attributed and dated (12 and 13 Sep) |
| No agent holds the lethal trifecta; any new authority needs an explicit human choice | ORC `AGENTS.md` lines 68-80, 110-112 | directive | not attributed or dated |
| ORC owns a general async work capability, with declared delivery, approval and schedule | lab `decisions/2026-09-17-async-work-architecture.md` | decision | attributed and dated |
| The map of work is orchestrator#140 | lab `AGENTS.md` lines 7-8; ORC `AGENTS.md` line 11 | directive | attributed and dated (2 Oct) |
| The browser is driven through Playwright's library | lab `reports/2026-10-03-browser-stack-prior-art.md` line 76 | decision | attributed and dated (3 Oct) |
| Scope logins are not centralised | ORC `src/adapters/scope-credentials.ts` line 14 | decision | attributed to "the operator", dated 28 Sep |
| Authority rules, step 1 | lab `memory/authority-rules-step-1.md` | decision | attributed and dated (1 Oct) |
| Pace: one scored real use before new design | lab `AGENTS.md` lines 27-29, citing `~/pro/agentic/HOW_NOT_TO_PLAN.md` | directive | the cited file is outside the snapshot |

### Three readings

- **Declared.** ORC's `README.md` declares a local-first personal agent. Its external data is read-only. Bookwhen is
  ORC's own connector, and scheduling and workflow execution are deliberately absent. The lab's `README.md` and
  `SCOPE.md` declare a Scope for developing and operating ORC.
- **Enacted** (from `STATE.md`, `FRICTION.md`, reports and the code, not from git history): durable work with
  approval cards, standing grants and recurring series; an in-process Playwright browser; Scope packages with their own
  connectors and credentials; a restart card; phone notices; invoicing; a central issue map over six repositories. On
  4 Oct there was "resolve before acting", and four changes went live.
- **Authorised.** Most of what was enacted is covered by the decisions in the table. The gaps are F5, F6 and F13
  (descriptions behind the decisions), and F6's subprocess case (enacted with no decision visible).

### Gaps by condition

- **Stale description:**
  - F5: ORC's `README.md`.
  - F6: ORC's `AGENTS.md`, the Bookwhen sentence and the network list.
  - F24: the lab's `SCOPE.md`.
  - Each is corrected only as far as a recorded decision plainly covers it (patches P3 and P5).
- **Conflict:** F4, `STATE.md`'s cap of forty lines or sixty (question Q4).
- **Missing:** F2, no named owner for decisions (Q1).
- **Ambiguous:**
  - F13, "retrospective" documentation against statements of intent (proposal P4.3);
  - F14, the map's repositories against `scope.yaml` (Q5);
  - the scope of "entropy guard at session end" (Q2) and the guard's home (Q3).
- **Unauthorised drift:** F6's subprocess case, ORC's service adapter (proposal P4.1), and where credentials are read
  (F5; proposal P4.4). Neither is fixed in the work or the documents; both are recorded as proposals.
- **Prose control:** F11 lists the kept processes that nothing runs, and the `STATE.md` rules that nothing checks.
  Nothing cites them as a security control. The Danger check is a real control but only advisory (F11).

### Existing guards' repair instructions, read against the intent-change rule

- **F12.** The lab's `AGENTS.md` line 19, "A resource joined or left this Scope | `scope.yaml`, then one line in
  `SCOPE.md`". This keeps two copies of one fact in step, which the rule names as a path for drift.
- **F13.** ORC's `AGENTS.md` lines 154-155, "Keep documentation concise and retrospective: record only what the
  implementation and real use established". Applied to the README's "Direction" or "Deliberately absent", this is an
  instruction to edit intent to match the work.
- No other repair instruction in the two repositories tells an agent to edit intent documents. The core-ties ratchet's
  "its allowance falls in the same change" (ORC `AGENTS.md` line 47) and `pnpm api:report` keep a check in step with
  the code. Those are tests and generated reports of one contract, which is allowed.

### Questions and proposals

- **Questions:** Q1 to Q5, in `questions.md`. Section 12 gives each in one line.
- **Proposed changes, and where they are recorded** (as patches, since the targets are read-only):
  - P2 copies the decisions that lived only in `STATE.md` to `decisions/2026-10-04-recorded-from-state.md`.
  - P4 records four proposals as awaiting Justin in `decisions/2026-10-07-proposals-awaiting-justin.md`:
    - P4.1, the service adapter's subprocess authority;
    - P4.2, the "Deliberately absent" list;
    - P4.3, the wording of "retrospective";
    - P4.4, where credentials are read.
  - Both files follow the one decision record that exists (Q1).

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.**
  - `scope.yaml` lines 7 and 15 give `status: active`.
  - `STATE.md` records four ORC changes made live on 4 Oct (#193, #201, #199, #195).
  - `FRICTION.md`'s newest entry is 2026-10-04.
  - The archived `status-tracker` project (`scope.yaml` lines 22-31) is outside this assessment. Moving Stillness,
    a separate Scope, is paused (Justin, 4 Oct).
- **Shape: B, mixed docs and code, with D's workflow surface. The lab is a docs-first member (A).**
  - ORC has 111 TypeScript files under `src/`, 62 test files, a React client in `web/`, and 15 Markdown files at its
    root.
  - The lab is Markdown plus 3 small tools: `tools/map.mjs`, `tools/report.mjs` and `tools/collect.mjs`.
  - Processes carry much of the state: the map, Danger, `STATE.md` and the diary.
  - Following the skill, B is taken as the riskiest shape, and docs-first Steps 2, 3 and 5 were run on the lab.
- **Repositories, assessed as one system:**
  - ORC, the application (the lab's `scope.yaml` lines 16-20);
  - the lab, which manages ORC's work. `STATE.md` is the one state file for both.
  - The map and the diary also span four other repositories (F14). They were not read.

## 3. Truth map (docs-first Step 2)

### Roles of the main documents

| Document | Role |
|---|---|
| lab `AGENTS.md` (also `CLAUDE.md`, a link) | canonical: agent instructions and conventions |
| lab `SCOPE.md` | canonical: purpose, projects, authority |
| lab `scope.yaml` | canonical: formal resource inventory, steward, status. It also states purpose, a second copy beside `SCOPE.md` |
| lab `STATE.md` | current state. Today it also holds steward decisions (F1). It is also a product artifact: `tools/map.mjs` parses its "Where we are now" line (F15) |
| lab `decisions/` (1 file) | canonical: settled decisions |
| lab `memory/authority-rules-step-1.md` | a decision record kept in `memory/` |
| lab `memory/slots-run-walkthrough.md` | local elaboration: one traced run, 28 Sep |
| lab `FRICTION.md` | a historical log. Also a product artifact: `tools/collect.mjs` parses its headings (F15) |
| lab `AGENT_IDEAS.md` | ideas: "prompts for a conversation, not approved designs" (line 3) |
| lab `reports/*.md` (68) | historical and dated. Some hold decisions (F2, F10) |
| lab `reports/*.json`, `status.html` | generated projections (the diary) |
| ORC `README.md` | canonical for direction (intent); a description for running, verifying and the boundary |
| ORC `AGENTS.md` | canonical: constraints and procedure |
| ORC `SECURITY-REVIEW.md` | canonical checklist. A product artifact: Danger's failure message sends people to it |
| ORC `test/architecture.test.ts`, `test/core-ties.ts`, `dangerfile.js` | enforced rules: canonical for what is checked |
| ORC `src/package-api.api.md` | a generated contract report |
| ORC `.github/pull_request_template.md` | template |
| ORC `CLASSIFY`, `FIXES`, `GRANTS`, `GRANTS-E2E`, `MCP`, `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`, `TURN-RECORD`, `VISIBILITY` (`.md`) | historical one-off reports. Only `MCP.md` is marked as history (F9) |

### Each concept's canonical home, and where else it appears

| Concept | Canonical home | Also stated in | Status |
|---|---|---|---|
| What the system is for | `STATE.md` lines 8-11 (overwritten) | ORC `README.md` "Direction"; `SCOPE.md`; `scope.yaml` | belongs in a decision record (F1; P2) |
| Settled decisions | none named | `decisions/`, `STATE.md`, reports, `memory/`, ORC code comments, ORC `AGENTS.md` | F1, F2; Q1 |
| Current position | `STATE.md` | GitHub Project 4 (live marks) | F3 |
| Open work and the map's rules | GitHub, orchestrator#140 | both `AGENTS.md` files, `STATE.md`, `tools/map.mjs` | links only, agree |
| ORC's boundary (tools, network, subprocesses) | `test/architecture.test.ts` (what is checked) | ORC `AGENTS.md`; `README.md` "Boundary" | they disagree (F5, F6, F7) |
| Core independence | ORC `AGENTS.md` and `test/core-ties.ts` | — | they agree |
| Guarded paths | `dangerfile.js` `GUARDED` | `SECURITY-REVIEW.md` lines 179-181 (a shorter copy); the architecture test (an independent subset check) | F8 |
| Async work and scheduling | `decisions/2026-09-17-…` | ORC `README.md` (says scheduling is absent); ORC `FIXES`/`REWORK`/`SEAM`/`OPERATOR` (history) | F5, F9 |
| Operating the service | ORC `README.md` "As a service" | ORC `AGENTS.md` lines 134-136, under "Security review"; the systemd unit's `Documentation=`, which points to `OPERATOR.md` | F18, F9 |
| Where credentials are read | ORC `README.md` and `AGENTS.md` ("exactly one place, `src/runtime.ts`") | code: `src/adapters/scope-credentials.ts`, `src/web-cli.ts` line 625 | F5; P4.4 |
| Repositories on the map | lab `tools/collect.mjs` `REPOS` | — (`scope.yaml` lists two projects) | F14; Q5 |
| ORC's state directory | ORC environment, `ORCHESTRATOR_STATE_DIR` (`src/runtime.ts` line 190) | lab `tools/collect.mjs` line 16, hard-coded | F22 |
| Where a learning goes | lab `AGENTS.md` table, lines 12-19 | `STATE.md` lines 3-4 (`FRICTION.md`) | F16 |
| The processes kept | `STATE.md` lines 43-52 (overwritten) | — | F1, F11 |

## 4. Loop map (docs-first Step 3)

- **Start.**
  - A Claude Code session in the lab loads `CLAUDE.md`, a link to `AGENTS.md`. That file says: read `STATE.md`
    first, and again after a compaction; then `SCOPE.md`; then orchestrator#140.
  - In ORC, `AGENTS.md` says to read `README.md` and `test/architecture.test.ts`, then #140. ORC has no `CLAUDE.md`
    in the snapshot (F23).
- **Who works:**
  - Claude Code, interactively and on overnight loops;
  - Codex and opencode runs (`STATE.md` line 65);
  - Astra (GPT through `opencode run`), for read-only adversarial reviews that end in `reports/*-astra.md`.
  - Worktrees sit in `/tmp`, and a power cut on 4 Oct emptied them (`FRICTION.md`, 2026-10-04). Where they should live
    is #196, undecided.
- **Unit of change:** an ORC pull request per issue, sometimes paired with a Moving Stillness pull request that must go
  live with it (#200 with MS #53). Then:
  - Danger checks for the Security review section;
  - Claude merges "once review and tests pass" (Justin, 25 Sep);
  - the checkout is pulled, and Justin approves the restart card;
  - the restart is verified by process start time.
- **Decisions** are taken in conversation (the 4 Oct interview) and then written into `STATE.md` or a report. They
  rarely reach `decisions/` (F1, F2).
- **Learnings** go into a dated `FRICTION.md` entry, each classed "an instance" or "a missing system". The monthly
  "FRICTION into rules" (#60) is not running (F11).
- **State.** The documented rule is to overwrite `STATE.md` at each verified event. In practice, dated paragraphs
  accumulate: the file had 99 lines with three answers to "which build runs" (F3).
- **The diary** is run by hand. Its last snapshot is `reports/2026-10-02.json` (F11).
- **Where follow-up is lost:**
  - decisions in an overwritten file;
  - cleanups waiting "on your word" (ORC's README, stale since 1 Oct);
  - stale names copied from one document into another (`FRICTION.md` lines 414-421).
- **Handoff point:** the `STATE.md` overwrite and the clearing of map marks at session end. That is where Justin placed
  "entropy guard at session end" on 4 Oct.

## 5. Domains, and concepts with two homes (mixed profile)

**Domains present and actively changed:**
- **Code.** ORC's TypeScript, and the lab's 3 tools.
- **Documentation.** Both repositories.
- **Tests.** ORC's: 970 unit tests and 5 end-to-end, according to `STATE.md` on 4 Oct.
- **API and data contracts:**
  - `src/package-api.api.md`;
  - the task-type review templates;
  - the `scope.yaml` schema;
  - Scope package manifests;
  - ORC's SQLite schema, which the lab's diary reads (F22).
- **Workflow:** the map, Danger, `STATE.md`, `FRICTION.md`, the diary, Astra's reviews, the restart card.
- **Live operational state:**
  - `orc.service` and its build;
  - ORC's state directory;
  - approval grants and cards;
  - Scope credentials;
  - the ntfy topic;
  - the GitHub Project's marks.

**Concepts with two homes** (each looks right on its own side):
- F14, the map's repositories;
- F21, names shared by ORC and Scope packages;
- F22, ORC's state directory and SQLite schema, read by the lab;
- F8, the guarded paths;
- F18, the service procedure;
- F2, decisions.

## 6. Findings

One list. Every other section refers to these ids.

- **F1. Steward decisions are held only in the overwritten state file.**
  - **Where:** lab `STATE.md`:
    - the North star, lines 8-11;
    - the merge rule, lines 17-18;
    - the 4 Oct interview, lines 38-54;
    - Moving Stillness paused, line 33;
    - Justin's 3 Oct decisions, lines 56-58;
    - git cleanup, lines 76-78.
  - **Why it matters:** none of these is in `decisions/`, which holds one file. `STATE.md` is overwritten "at each
    verified event" (lab `AGENTS.md` line 33).
  - **Response:** the intent pass says to copy them. Patch P2 does.
- **F2. No named owner for decisions; they are scattered.**
  - **Where:** `decisions/` (1 file); `STATE.md`; reports (`reports/2026-10-03-browser-stack-prior-art.md` line 76);
    `memory/authority-rules-step-1.md`; ORC code comments (`src/adapters/scope-credentials.ts` line 14;
    `dangerfile.js` line 7); ORC `AGENTS.md` (Justin's quotes).
  - **The tension:** the lab's `SCOPE.md` (lines 19-21) puts facts about ORC in ORC's repository, yet the one ORC
    architecture decision is in the lab.
  - **Condition:** Missing. Question Q1.
- **F3. `STATE.md` is internally inconsistent and stale. This is the file every session reads first.**
  - **Which build runs, three answers:**
    - line 58: "ORC live: 369628b since 22:12:47";
    - line 88: "started 2026-10-03 22:12:47 on `369628b`";
    - lines 31-35: restarts on 4 Oct, the latest at 14:48:27 onto `8cee662`.
  - **#193:** line 23 says it is "built and in review, not merged"; line 31 says "#193 is live".
  - **Moving Stillness:** line 91 says `main` is at `c759f96`; line 32 says MS #53 merged as `fc830aa`.
  - **An expired grant:** line 94 says grant `e9675bd9` "covers the test entry until 1 Oct 18:00Z", three days before
    the update.
  - **Size and form:** 99 lines, with dated paragraphs appended despite "do not append" (line 4).
  - **History of the same failure:** `FRICTION.md` 2026-09-12 (line 866, "STATE described finished work as missing");
    2026-09-22 (line 621, two false statements told to Justin); 2026-09-29 (line 297, a timestamp written without
    reading the clock).
  - **Condition:** state dishonesty. Patch P1 rewrites the file.
- **F4. Two caps for one file.** The lab's `AGENTS.md` line 34 says "about forty content lines"; `STATE.md` line 4 says
  "Target: sixty lines". No decision settles which. Conflict; question Q4.
- **F5. ORC's `README.md` is stale against recorded decisions and enforced tests.**
  - **The Bookwhen paragraph** (lines 76-79) says to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN` and names
    `@jphil/bookwhen-client@0.6.1`.
    - No source file reads the variable; only tests stub it.
    - `test/architecture.test.ts` lines 1315-1316 assert the client is neither imported nor a dependency.
    - Justin's 12-13 Sep decision covers this (ORC `AGENTS.md` lines 40-42).
  - **"Scheduling"** is in the "Deliberately absent" list (lines 152-154). The 2026-09-17 decision covers it, and it is
    built (`src/app/async/calendar.ts`; the `*:async-series` scripts).
  - **Paragraphs that need rewriting, not correcting:** lines 5-7 make Bookwhen ORC's own read-only data path. Lines
    145-147 say the slot plan is computed "without applying it".
  - **Where credentials are read:** "A credential is read in exactly one place, `src/runtime.ts`" (line 103). Scope
    credentials are read by `src/adapters/scope-credentials.ts`, and the web token by `src/web-cli.ts` line 625.
    - The 28 Sep decision covers Scope credentials only.
    - "One place that reads a credential" is a constraint in `SECURITY-REVIEW.md`, so this part is a proposal (P4.4),
      not a correction.
  - **Known since 1 Oct** (`reports/2026-10-01-design-review.md` lines 175-179; `reports/2026-10-01-review-synthesis.md`
    line 43), and still present on 4 Oct.
  - **Response:** P3 corrects the first two items only.
- **F6. ORC `AGENTS.md`'s boundary lists disagree with the code and its tests.**
  - **(a)** Lines 102-103 name `src/bookwhen.ts` as the only importer of the Bookwhen client. The file does not exist,
    and the test forbids the client. Corrected in P3, covered by the 12-13 Sep decision.
  - **(b)** Lines 98-101 limit direct network access to `research-tools.ts` and `ntfy.ts`. But
    `src/adapters/browser/playwright.ts` (lines 16 and 55) launches Chromium. Corrected in P3, covered by Justin's
    3 Oct "lets use the library".
  - **(c)** Lines 92-96 list three subprocess modules. `test/architecture.test.ts` lines 822-835 approve a fourth,
    `src/adapters/orc-service.ts` (orchestrator#101). No steward decision was visible, so it is not corrected. It is
    recorded as proposal P4.1.
- **F7. The architecture test's network scan cannot see a browser.** The patterns at `test/architecture.test.ts` lines
  1296-1302 match `fetch`, sockets and HTTP modules. A Playwright launch matches none of them, so "limits core network
  I/O to the approved modules" passes while `playwright.ts` reaches the network. The fix would sit in that test. This is
  a test checking a different representation from the one used.
- **F8. Guarded paths are defined twice.**
  - `dangerfile.js` lines 11-26 hold 14 patterns.
  - `SECURITY-REVIEW.md` lines 179-181 restate them in prose. The prose leaves out `config/`, `package.json`,
    `pnpm-lock.yaml`, `scripts/approve-agent-package.ts`, `scripts/async-work.ts`, `test/core-ties.ts` and
    `scripts/source-headers.js`.
  - The pull request template already defers to `dangerfile.js`.
  - Parallel truth. P3 reduces the prose to a link.
- **F9. Superseded material sits beside live truth at ORC's root.**
  - Twelve one-off reports sit next to `README.md`, `AGENTS.md` and `SECURITY-REVIEW.md`. Only `MCP.md` is marked as
    history.
  - They name 10 files that no longer exist: `CLASSIFY`, `GRANTS`, `MCP`, `POLICY-STORE`, `REWORK` and `SLICE1`.
    `GRANTS-E2E.md` names `POLICY-SOURCE.md`, which is absent.
  - Some say "Nothing is pushed" (`OPERATOR.md`, `SEAM.md`) or "Nothing committed" (`REWORK.md` line 3), yet they sit
    on `main`.
  - **New here:** `scripts/orc-service.ts` line 41 writes `Documentation=file://<checkout>/OPERATOR.md` into the
    systemd unit. `OPERATOR.md` is a branch report about approval cards and notifications, with no service content.
    The 1 Oct design review's "referenced by no code" is wrong for this file: retiring it as proposed would leave the
    unit's link dangling.
  - Agents copying stale names is a recorded harm (`FRICTION.md` lines 414-421).
- **F10. Lab reports hold decisions and superseded placements.**
  - Decisions: F2.
  - `reports/2026-09-30-skills-one-home.md` line 67 places `develop-agent` in the lab's `skills/`, which holds only
    `.gitkeep`.
  - Dated file names mark the reports as historical, so the risk is lower than in F9.
- **F11. Of the nine processes Justin kept on 4 Oct, only the Danger checks run by themselves, and they only warn.**
  - **Running by themselves:** the Danger checks warn without blocking a merge (`SECURITY-REVIEW.md` lines 53-55).
  - **Run by hand:**
    - the map check;
    - the daily diary, whose snapshots stop at 2 Oct.
  - **Decided, not built:**
    - tests on every pull request (#144). CI runs only Danger, and the end-to-end suite failed on `main` for a week
      unnoticed (`FRICTION.md` line 396);
    - the label check, which waits on the labels proposal;
    - weekly review, FRICTION into rules (#60), branch cleanup (#70) and `/tmp` cleanup (#182). All wait on #166.
  - **Kept but missing:** "entropy guard at session end" has nothing behind it in either repository.
  - **Rules with nothing checking them:** `STATE.md`'s cap, and its "do not append".
- **F12. One repair instruction keeps two copies in step.** The lab's `AGENTS.md` line 19 says "`scope.yaml`, then one
  line in `SCOPE.md`". Purpose is also stated in both (`scope.yaml` line 5, `SCOPE.md` lines 5-7).
- **F13. "Retrospective" documentation does not separate descriptions from intent.**
  - **Where:** ORC `AGENTS.md` lines 154-155, ORC `README.md` lines 22-23, the lab's `AGENTS.md` line 29.
  - **Where the readings diverge:** under that rule, an agent seeing the durable work engine would delete "workflow
    execution" from README line 153. Under the intent-change rule, it waits for Justin. No decision plainly covers that
    word.
  - **Condition:** Ambiguous. Proposal P4.3.
- **F14. The map's repositories are defined only in code.** `tools/collect.mjs` lines 19-26 (`REPOS`) list six
  repositories ("Finance joined on 2026-10-02"). `scope.yaml` and `SCOPE.md` list two projects. Ambiguous; question Q5.
- **F15. Tools parse two lab documents, with no check on the format.**
  - **`STATE.md`:** `tools/map.mjs` lines 181-191 read `**Where we are now:** #N` from it. If the line is missing,
    `whereWeAre()` returns null and the map silently stops showing the position.
  - **`FRICTION.md`:** `tools/collect.mjs` line 156 reads its headings. 3 of the 34 headings ("2026-09-21 night", "late"
    and "evening") do not match, so their findings are counted under 2026-09-22.
  - **Condition:** brittle automation. P1 keeps the `STATE.md` line's form, and was checked to parse as #193.
- **F16. The "Where a learning goes" table is incomplete.** The lab's `AGENTS.md` lines 12-19 name neither
  `FRICTION.md` nor where a rule taken from it goes. `FRICTION.md` line 610 records four rules "promoted into a file
  loaded by nothing". The kept monthly "FRICTION into rules" depends on this.
- **F17. `FRICTION.md` is out of order.** It says "Newest first" (line 3), but its 2026-09-11 to 2026-09-19 entries
  (lines 1153-1402) come after 2026-09-03, oldest first. Low.
- **F18. ORC's operating procedure is described twice.** ORC `AGENTS.md`'s "Security review" section (lines 130-136)
  holds package-approval and service procedure that repeats `README.md` "As a service" (lines 106-129). Parallel truth,
  low.
- **F19. The diary's run time is misstated.** The lab's `README.md` line 16 says a full `node tools/report.mjs` run
  takes about ten seconds. `tools/report.mjs` line 10 says that is the `--no-tests` time, and a full run takes about two
  minutes. Low.
- **F20. ORC's pull request template has no `## Package API` section.** `dangerfile.js` lines 50-56 and ORC `AGENTS.md`
  line 132 require one when `src/package-api.api.md` changes. Low.
- **F21. Names ORC shares with Scope packages have two homes.**
  - Connector setting names are defined in ORC and again in each package's manifest. A rename from `granted-tools` to
    `granted-actions` took Moving Stillness down for an hour on 3 Oct (`FRICTION.md` lines 63-69; orchestrator#198).
  - Tool names in agent-facing text: scope-moving-stillness#25.
  - Packages cannot test against ORC's real parts: #202.
  - The package side was outside this assessment.
- **F22. The lab's diary assumes ORC's internals.**
  - It hard-codes ORC's state directory (`tools/collect.mjs` line 16, `~/.local/share/orchestrator-proof`).
  - ORC reads that directory from `ORCHESTRATOR_STATE_DIR`, with a different default (`src/runtime.ts` line 190).
  - The diary opens ORC's SQLite tables directly (`tools/collect.mjs` lines 123-131), and a failure returns null
    silently.
  - The same class of failure is recorded: "operator commands read a different ORC" (`FRICTION.md`, 2026-09-28;
    design review section 5).
- **F23. ORC's checkout has no `CLAUDE.md`.** The lab has one, a link to `AGENTS.md`. Whether a Claude Code session
  opened in ORC loads ORC's `AGENTS.md` is unknown from the snapshot. This bears on where the guard's pointer will be
  found.
- **F24. The lab's `SCOPE.md` purpose does not reflect the 4 Oct decision** that the lab is the central Scope for
  project management, core issue tracking, code quality and security. Stale description; corrected in P5, citing the
  decision. "What else it should cover" stays open.

## 7. Ranked risks (decay rate × recovery cost)

1. **`STATE.md` tells fresh sessions the wrong state** (F3, F4, F15).
   - **Decay:** fast. Several verified events a day; 4 Oct had at least five.
   - **Recovery cost:** high. It produces confident wrong statements to Justin about live services (`FRICTION.md`
     2026-09-12, 2026-09-22, 2026-09-29).
   - **Anchor:** the lab's `AGENTS.md` "Keeping state". Fixed now by P1; kept by the guard's `STATE.md` check.
2. **Steward decisions are lost, or decided again** (F1, F2, F10, F24).
   - **Decay:** every overwrite of `STATE.md`.
   - **Recovery cost:** high. A decision has to be reconstructed or put to Justin again. The skills placement had been
     discussed in at least four earlier rounds (`reports/2026-09-30-skills-one-home.md` lines 9-13).
   - **Anchor:** `decisions/` (Q1). Fixed by P2; kept by the guard's decision check.
3. **ORC's boundary and operating documents drift from the code and enforced tests** (F5, F6, F7, F8, F9).
   - **Decay:** fast. Several ORC pull requests merge a day.
   - **Recovery cost:** medium to high. `AGENTS.md` is the boundary description that a security reviewer reads beside
     `SECURITY-REVIEW.md`. Stale facts persisted for at least three days after being found, and stale names have been
     copied into new text before.
   - **Anchor:** `test/architecture.test.ts` and `dangerfile.js` for what is checked; recorded decisions for what is
     authorised.
4. **Processes that were kept run only when someone remembers** (F11, F23).
   - **Decay:** medium.
   - **Recovery cost:** high when the tests go red unnoticed: a week of merges on 27 Sep.
   - **Anchor:** the 4 Oct decision (P2), #144, #166.
5. **Seams across repositories, with a name or a path defined twice** (F21, F22, F14).
   - **Decay:** each rename.
   - **Recovery cost:** medium. Moving Stillness was unavailable for an hour on 3 Oct, and ORC was misread on 28 Sep.
   - **Anchor:** ORC defines; #198, #202, design review section 5.

## 8. Existing guard surfaces

**Runs by itself:**
- Danger, in `.github/workflows/danger.yml`, on every pull request event. It requires a `## Security review` section
  for guarded paths, and a `## Package API` section when the API report changes.
- It only warns without GitHub Pro, and direct pushes are not checked (`SECURITY-REVIEW.md` lines 53-55).
- Keep it.

**Runs only by hand:**
- `pnpm typecheck`.
- `pnpm test`. This includes the architecture boundary scans, the core-ties ratchet, the cause-discard allowances, the
  check of guarded paths, and the package API report test. Keep it; amend the network scan (F7).
- `pnpm test:e2e`.
- `pnpm api:report` and `pnpm pi:check`.
- The lab's `node tools/map.mjs --check`, which also flags marks older than 14 hours. Keep it; a candidate to run by
  itself.
- `node tools/report.mjs`, the diary.
- The `SECURITY-REVIEW.md` checklist. Keep it; amend its list (P3).

**Decided, not built:**
- tests on every pull request (#144);
- the scheduled processes, through #166: diary, weekly review, #60, #70, #182;
- the label check;
- a test that tool names in agent text exist (scope-moving-stillness#25, another repository);
- a cross-check of connector setting names (#198).

**Declared, but missing:**
- "entropy guard at session end", listed among processes "kept" on 4 Oct, with no guard in either repository. This
  run drafts it.
- `STATE.md`'s cap, and its "do not append" (F3, F4).
- The pull request template's missing Package API section (F20). Amend.

**Unknown:**
- Whether either repository's `.githooks/pre-push` is enabled. Both only print a push summary and never block. The
  snapshots have no git configuration.
- GitHub branch protection.
- User-level Claude Code hooks. The lab's `.claude/settings.json` enables two plugins and no hooks.

No existing entropy guard was found, so a new one is built rather than one refined.

## 9. Recommendations

**Consolidate:**
- Decisions go into the lab's `decisions/` (Q1). `STATE.md` links to them (P1, P2).
- The guarded-path list has one home, `dangerfile.js` (P3).
- The service procedure: ORC's `AGENTS.md` links to `README.md` "As a service" rather than repeating it (F18). Proposed,
  not patched.

**Demote, or mark as historical:**
- `STATE.md`'s history goes to `git log` (P1).
- ORC's twelve root reports. This is already proposed, awaiting Justin (`reports/2026-10-01-design-review.md`
  section 4; synthesis item 7). Two conditions first:
  - point the systemd unit's `Documentation=` at `README.md` (F9);
  - move `GRANTS.md`'s live definitions into `AGENTS.md`, as that review proposes.

**Amend instructions:** add `FRICTION.md`, and where a promoted rule goes, to the lab's "Where a learning goes" table
(F16). This is a proposal; it touches no open question.

**Leave to tools (mixed-profile):** the mechanical checks go to tools, not to the guard. Each is detailed in
`integration.md` under "Depth":
- the project's own tests: a test in ORC that every path named in its main documents exists; and the network scan
  (F7);
- the map tool failing on a missing "Where we are now" line, and the FRICTION parser (F15);
- a link checker such as lychee, once confirmed installed. Not checked in this run.

## 10. One-time cleanup

Each item was checked against the current file in the snapshot.

1. ORC `README.md` lines 76-79 and 152-154; `AGENTS.md` lines 98-104; `SECURITY-REVIEW.md` lines 179-181: present.
   Patch `orchestrator.diff` (P3) applies cleanly to a copy of the snapshot.
2. Lab `STATE.md` (99 lines) and `SCOPE.md`; the new decision files. Patch `lab.diff` (P1, P2, P4, P5) applies cleanly
   to a copy of the snapshot, and `tools/map.mjs`'s pattern still reads `#193` from the new `STATE.md`.
3. ORC `.github/pull_request_template.md`: 7 lines, with no Package API section (F20). Not patched.
4. ORC `scripts/orc-service.ts` line 41 points the unit's documentation at `OPERATOR.md` (F9). Not patched: a guarded
   path, and part of the root-report decision.
5. Lab `FRICTION.md` lines 1153-1402 are out of order (F17); `README.md` line 16 misstates the diary's run time (F19);
   `tools/collect.mjs` line 156 misses 3 headings (F15). Not patched.
6. The 10 dangling path references in ORC's root reports (F9). These go with the root-report decision.

Track these in `STATE.md` or issues on the map, not in the guard.

## 11. The state-file update, and the guard

- **The state file (docs-first Step 5; generator Step 1).** `patches/lab.diff`, part P1, rewrites `STATE.md` to 41
  content lines, which is inside both caps. It does not choose between them (Q4).
  - It separates fresh observations from recorded ones. There were no fresh observations: every live fact is marked
    "as last recorded on 4 Oct".
  - It says what makes the file stale and who refreshes it.
  - It points to the canonical documents.
  - It links decisions rather than holding them.
  - It lists misleading material nearby.
  - It records this assessment and the provisional guard.
- **Is a guard needed (Step 3)?** Yes. The system is active, the decision on 4 Oct asks for one, and no guard exists.
  - The generator's mode is Discuss-first, the default for a change across repositories. With no steward available,
    the guard was drafted, not installed.
  - **Path:** `guard/SKILL.md`, intended for the lab's `skills/session-coherence-guard/SKILL.md` (Q3).
  - **Size:** 911 words, with J = 10 checks. The budget is 450 + 36 × 10 + S 76 + C 27 = 913.
  - **Provisional on:** Q1 (the decision surface), Q2 (which sessions run it), Q3 (its home) and Q4 (the cap it checks).
- **How the guard's checks map to findings:**

  | Guard check | Findings |
  |---|---|
  | 1, ORC docs against code and tests | F5, F6, F7 |
  | 2, names shared with Scope packages | F21 |
  | 3, the Danger check was green | F11 |
  | 4, ORC's test commands | F11 |
  | 5, decisions recorded | F1, F2 |
  | 6, `STATE.md` | F3, F4, F15 |
  | 7, the map | F11 |
  | 8, `FRICTION.md` | F15, F16 |
  | 9, material taken from reports | F9, F10 |
  | 10, two documents describing one thing | F8, F12, F18 |

- **Adoption:** `integration.md` places the guard and plans the adoption check. Nothing was exercised.

## 12. Next step, and questions for the steward

**Next step:** Justin answers Q1 to Q3. Then the guard is placed, with its two pointers, and both patches go in. The
ORC patch needs a pull request with a Security review section. Then a fresh session is checked to find the guard
(`integration.md`).

**Questions.** Each is in full in `questions.md`, with its readings and the case where they diverge:
- **Q1.** Which record owns decisions about ORC and the lab? Recommended: the lab's `decisions/`.
- **Q2.** Which sessions run the guard? Recommended: every session that commits to ORC or the lab, by any agent.
- **Q3.** Where does the guard live? Recommended: the lab's `skills/session-coherence-guard/`, with a pointer in each
  repository's `AGENTS.md`.
- **Q4.** Is `STATE.md` capped at forty lines or sixty? Recommended: forty, the cap in `AGENTS.md`.
- **Q5.** Should the map's repositories be listed in `scope.yaml`? Recommended: no. `REPOS` stays the one list, and
  `SCOPE.md` points to it.

**Not asked, because they are already with Justin:**
- the README and root-report cleanup;
- the four proposals in P4.

## 13. Uncertainties, and what was not covered

- **No git metadata.**
  - The enacted reading comes from `STATE.md`, `FRICTION.md` and reports, not `git log`.
  - Whether the hooks are enabled is unknown.
  - The design review's "142 non-merge commits since `README.md` changed" was not re-checked.
- **No GitHub.**
  - The rules in #140's description, and the contents of #101, #144, #166, #198 and #202, were not read.
  - A decision recorded only on an issue was not seen. It could settle F6(c), for example.
- **Outside the snapshots, and not assessed:**
  - `~/pro/local-config/home/AGENTS.md`, which `STATE.md` line 16 cites;
  - `~/pro/agentic/HOW_NOT_TO_PLAN.md`, the pace rule;
  - `~/pro/scope/docs/MODEL.md`;
  - the Moving Stillness repositories, the Bookwhen ops tool, and `~/.claude` settings.
  - This run's own agent context carried a user-wide rules file that may bear on the pace rule. It was not read from
    the snapshot and is not used as evidence here.
- **Not run:** ORC's tests and type checks (the snapshot has no `node_modules`). The test counts are `STATE.md`'s,
  from 4 Oct.
- **Read only in part:**
  - `FRICTION.md`: 8 of its 34 sections in full, plus all headings;
  - `AGENT_IDEAS.md`: headings only;
  - about 12 of the lab's 68 Markdown reports;
  - ORC's `src/`, mostly by search;
  - ORC's root reports: opening lines and path checks;
  - not read: `web/`, `e2e/`, `config/installation.ts` beyond searches.
- **No live observation.** Every live fact is from 4 Oct, three days before this run.

If this route or a step was misrouted or too implicit, `skill-feedback.md` says so. The feedback skill files such
notes as issues when working in the entropy-guard repository; that was not done here.
