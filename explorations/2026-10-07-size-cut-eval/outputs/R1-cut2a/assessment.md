# Entropy assessment: ORC and the orchestration lab, as one system

**Run on:** 7 October 2026, on read-only snapshots of both repositories. Their files are dated 4 October, and the
lab's `STATE.md` says "Updated 2026-10-04 17:31". Steward absent.

**Route taken:**
- `entropy-assessment`, with its intent pass and the intent-change rule.
- Shape B, so `mixed-profile.md`.
- Docs-first Steps 2, 3 and 5 on the lab, which is a docs-first member repository.
- Step 3: build a guard.
- `session-coherence-skill-generator` in plan mode. The targets are read-only, so the guard and every change are
  drafts in this folder.
- `guards-integrator`.

**Repositories:**
- `orchestrator`, here called ORC. Its checkout on the machine is `~/pro/orchestrator`.
- `scope-orchestration-lab`, here called the lab. Its checkout is `~/scopes/scope-orchestration-lab`.

**What this run produced:**
- `assessment.md`, this file.
- `questions.md`: four questions for Justin, each with a recommended answer.
- `guard/SKILL.md`: the drafted guard.
- `integration.md`: how to fit the guard into the real loop.
- `patches/scope-orchestration-lab.patch` and `patches/orchestrator.patch`: proposed changes, never applied.
- `read-log.md`, and `feedback.md` for entropy-guard itself.

## What was covered and what was not

**Read in full:**
- in both repositories: every top-level instruction, state, scope and README file;
- in the lab: `decisions/`, `memory/`, the three `tools/*.mjs`;
- in ORC: `dangerfile.js`, the CI workflow, both pre-push hooks, the PR template and `package.json`;
- the tests in ORC that enforce its boundaries (the parts cited), and these reports: the review synthesis and design
  review of 1 Oct, the issue-map overview and labels review of 4 Oct, and the skills-one-home report of 30 Sep.

**Read in part:**
- `FRICTION.md`: every heading, and in full the entries for 12 and 21–29 September and for 3–4 October.
- ORC's 12 root reports: opening lines, plus a scan of every code path they name.
- `src/`: by search, plus the files cited below.
- The rest of `reports/`: by search only.

**Not covered, and why:**
- GitHub, which the snapshots do not contain. That leaves out the issues, including the rules in orchestrator#140's
  description, and PR descriptions and checks.
- Git history and git configuration: the snapshots have no `.git`.
- Files outside the two repositories that they cite: `~/pro/local-config/home/AGENTS.md`,
  `~/pro/agentic/HOW_NOT_TO_PLAN.md`, `~/pro/scope/docs/MODEL.md`, `pro/agentic/agentic-architecture/MODEL.md`,
  and the Moving Stillness and finance Scopes. This run was not allowed to read them.
- The running system. Every live fact below is quoted from `STATE.md` with its date, never observed.
- Test results: no test suite was run. Test counts are quoted from `STATE.md`.

## 1. Intent

### Steward

**Justin**, for both repositories:
- The lab's `scope.yaml` names him: line 6, `steward: justin`; lines 35–37 make him the only member, with role admin.
- ORC has no steward field. Its `AGENTS.md` attributes its rules to "Justin" and "the operator" (lines 11, 33–37, 117).

### Authorised intent, with sources

| # | Statement | Where | Kind | Authority evidence | Date |
|---|---|---|---|---|---|
| A1 | The lab exists to develop and operate ORC and its reusable Scope-owned agents | lab `SCOPE.md` 5–7; `scope.yaml` 5 | directive | the steward field; the text itself is unattributed | Scope created 2026-07-11 |
| A2 | The lab is the central Scope for project management, core issue tracking, code quality and security; "Astra is to say what else it should cover" | lab `STATE.md` 39–40 | decision | attributed and dated | 4 Oct |
| A3 | North star: ORC is the UX surface to Justin's agentic system; his "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; after the six slots, "work towards a point of consolidation" | lab `STATE.md` 6–10 | decision | attributed and dated | 25–26 Sep |
| A4 | Core ships with no specific Scope, model, owner or agent | ORC `AGENTS.md` 30–45 | directive | attributed and dated | 12–13 Sep |
| A5 | ORC owns a general async work capability; delivery is declared per task type; facades live in Scope packages; SQLite storage | lab `decisions/2026-09-17-async-work-architecture.md` | decision | attributed and dated | 17 Sep |
| A6 | Authority rules, step 1. Affirmed: rules 1, 2 (amended), 4 and 5. Open: rule 3, rule 6, chat handling, Iris's role | lab `memory/authority-rules-step-1.md` | decision | attributed and dated | 1 Oct |
| A7 | orchestrator#140 is the map of work and the reference point for all work | ORC `AGENTS.md` 7–12; lab `AGENTS.md` 7–10 | directive | attributed and dated | 2 Oct |
| A8 | Processes kept; ORC scheduling (#166) built first; where issues live; Moving Stillness paused | lab `STATE.md` 33–34, 41–53 | decision | attributed and dated | 4 Oct |
| A9 | "Claude merges a PR once review and tests pass" | lab `STATE.md` 17 | directive | attributed and dated | 25 Sep |
| A10 | The lethal trifecta; enforced controls; standing grants at most seven days, for one exact target | ORC `AGENTS.md` 68–91 | directive | partly attributed (#20, #67); cards: "the operator, 2026-09-26" (117–118) | Sep |
| A11 | Scope logins "should DEFINITELY NOT be centralised" | ORC `src/adapters/scope-credentials.ts` 14–15 | decision, quoted in code | attributed to the operator, dated | 28 Sep |
| A12 | Security reviews are checked by Danger on GitHub | ORC `dangerfile.js` 40; lab `STATE.md` 79 | decision | attributed and dated ("B") | 2 Oct |
| A13 | `HOW_NOT_TO_PLAN.md` governs new design work: "one scored real use must come first" | lab `AGENTS.md` 27–29 | directive | neither attributed nor dated; the cited file is outside the snapshot | — |
| A14 | "relax suggested development to 'what is naturally needed given where we are and what's likely coming next'" | lab `reports/2026-09-22-pushback-analysis.md` 131–134, quoting Justin | decision, recorded in a report | attributed and dated | 21 Sep |
| A15 | "Keep documentation concise and retrospective: record only what the implementation and real use established" | ORC `AGENTS.md` 154–155; ORC `README.md` 22–23 | directive | neither | — |
| A16 | `STATE.md` holds about forty content lines (`AGENTS.md` 34), or sixty lines (`STATE.md` 4) | lab | directive, twice | neither | — |

### Declared, enacted and authorised

**Declared.** ORC's README, last edited on 13 September according to the 1 Oct design review (line 175), says:
- ORC is a local-first personal agent whose read-only data paths include Bookwhen;
- scheduling and workflow execution are "deliberately absent";
- ADA does not work yet (#23).

**Enacted.** What `STATE.md`, `FRICTION.md` and the code show being built:
- durable work, with recurring series (`scripts/async-work.ts`; the `*:async-series` scripts in `package.json`);
- standing grants, and Scope packages approved by card;
- ORC driving Playwright itself (#76);
- ntfy notices to the phone;
- invoicing through a finance Scope;
- the restart card, the issue map, resolve-before-acting (#193) and one package API version (#201).

**Authorised.** A3, A4, A5, A6 and A8 cover that enacted work. The declared README lags it (F3, F4, F5, F24).

**Unauthorised drift: none found.** Caveat: approvals for single features, such as the phone work and invoicing,
would be recorded in issues and PR descriptions, which this run could not read.

### Gaps, by condition

- **Stale description.** F3, F4, F5, and the lab's purpose in F15. The patches correct each one, citing the decision
  that settles it.
- **Conflict.** F9: forty against sixty. Put to Justin as Q2.
- **Missing.** F2: nothing says where each kind of decision is recorded. The lab patch adds one row to the lab's
  `AGENTS.md` table naming `decisions/`, the decision owner that already exists; it decides nothing new. Where the
  session-end guard lives is also missing: Q1.
- **Ambiguous, and not asked.** F18, the pace rule, and F19, "consolidation". Justin's 4 Oct ordering (#166 first)
  settles the next step under every reading, and no guard check depends on either.
- **Unauthorised drift.** None found (see the caveat above).
- **Prose control.** F10. Enforcement would sit in GitHub's required status checks or in a merge gate. Documents cite
  Danger as the control: lab `STATE.md` 79–82 and ORC `AGENTS.md` 140–143.

### Existing guards' repair instructions, read against the intent-change rule

Two drift paths, quoted in F16 and F17:
- F16, the lab's `AGENTS.md` line 19: "A resource joined or left this Scope | `scope.yaml`, then one line in
  `SCOPE.md`". This is an "update both" instruction.
- F17, ORC's `AGENTS.md` lines 154–155: docs "record only what the implementation and real use established". This
  rewrites stated constraints to match the work.

Read and clean:
- the core-ties ratchet, whose "allowance falls in the same change" is enforced by an exact-count test and only moves
  towards A4;
- `pnpm api:report`, which regenerates a projection;
- `SECURITY-REVIEW.md`'s questions;
- the security section of `AGENTS.md`.

### Questions and proposed changes

**Questions:** `questions.md` holds Q1 to Q4 for Justin, each with a recommended answer:
- Q1: where the guard lives;
- Q2: the cap on `STATE.md`;
- Q3: how #144 runs tests;
- Q4: ORC's root reports.

**Proposed changes.** They are in `patches/`, not applied, and none of them changes intent:
- The lab patch adds `decisions/2026-10-04-steward-decisions-from-state.md`. It copies the decisions found only in
  `STATE.md` (intent pass §5: recording them is not deciding them again), and it records Q1 to Q4 as "Awaiting
  Justin".
- It also corrects `SCOPE.md` from A2 and leaves "what else it should cover" open.
- The ORC patch corrects README and `AGENTS.md` from A4, A5, A11 and the code.
- Each patch's header names the open questions it touches.

## 2. Lifecycle, shape and repositories

**Lifecycle: active.** Evidence:
- `scope.yaml` lines 7 and 14 say `status: active`.
- `STATE.md` records four ORC merges and four verified restarts on 4 Oct.
- `orc.service` is in daily use, as recorded; this run did not observe it.

**Shape: B, mixed docs and code.** It is the riskiest fit, because most findings sit between the docs and the code.
Two other shapes also fit, and all three route to `mixed-profile.md`:
- **C, code-first:** ORC has 117 source files and 71 test files.
- **D, workflow-heavy:** the map, Danger, reviews, the diary and the kept processes.

**The repositories, assessed as one system:**
- ORC holds the code, and the lab manages its work: state, decisions, friction, the map tools.
- The lab's `SCOPE.md` line 16 splits them: facts about ORC go in its repository, facts about their relationship go
  in the lab.
- The lab is docs-first, so docs-first Steps 2, 3 and 5 were run on it (sections 5 and 6, and the patch).
- Out of scope: scope-moving-stillness, the Bookwhen ops tool, scope, scope-finance and local-config. They appear
  only where they explain a finding.

## 3. Domains present and changing

| Domain | Where | Changing? |
|---|---|---|
| Code | ORC `src/`, `web/`, `scripts/`, `config/`; lab `tools/*.mjs` | yes: four ORC merges on 4 Oct |
| Documentation | ORC: 15 root `.md` files; lab: `STATE.md`, 1,402-line `FRICTION.md`, about 80 reports (14 on 1 Oct) | yes |
| Tests | ORC: 71 files under `test/`, 5 E2E specs; lab: none | yes |
| API and data contracts | ORC: `src/package-api.api.md` and `ORC_PACKAGE_API_VERSION`; Danger's guarded paths. Lab: the `STATE.md` line and `FRICTION.md` headings its tools parse | yes |
| Workflow and process | the map (#140); Danger; pre-push summaries; Astra reviews; the diary; the processes kept on 4 Oct | yes |
| Live operational state | `orc.service` and its built `dist`; cards and grants; Scope credentials; ntfy; the Bookwhen test entry; the GitHub Project | yes |

## 4. Repositories and ownership: concepts with more than one home

| Concept | Its homes now | Finding |
|---|---|---|
| Justin's decisions | `STATE.md`, `decisions/`, `memory/`, ORC `AGENTS.md`, reports, #140, `~/.claude/plans/` | F1, F2 |
| Which repositories make up the work | `scope.yaml` (2), `tools/collect.mjs` (6), `tools/report.mjs` header (5), the map (9) | F15 |
| Guarded paths for security review | `dangerfile.js`, `test/architecture.test.ts`, `SECURITY-REVIEW.md` | F23 |
| Enforced boundaries | `test/architecture.test.ts`, and ORC `AGENTS.md` prose | F6 |
| The cap on `STATE.md` | lab `AGENTS.md`, `STATE.md` header | F9 |
| Which build ORC runs | `STATE.md`, which gives two values; `pnpm service:status` | F8 |
| The lab's resources | `scope.yaml`, and `SCOPE.md` "Projects", under an "update both" rule | F16 |
| The package API version | one constant, `src/core/agents/package.ts`, with a report, a test and a Danger rule (#201) | settled; no finding |

## 5. Truth map

**Which document owns which truth (docs-first Step 2):**

| Document | Role | What it owns |
|---|---|---|
| lab `SCOPE.md` | canonical | the Scope's purpose; the authority split between repositories |
| lab `scope.yaml` | canonical: the formal inventory | resources, steward, status |
| lab `AGENTS.md` (`CLAUDE.md` links to it) | canonical | the lab's working rules: where learnings go, how state is kept |
| lab `STATE.md` | current state, read first | where the work stands. A product contract: `tools/map.mjs` lines 181–191 parse its `**Where we are now:**` line |
| lab `decisions/` | canonical | decisions; one entry, of 17 Sep |
| lab `memory/authority-rules-step-1.md` | canonical | Justin's answers on authority, step 1 |
| lab `memory/slots-run-walkthrough.md` | historical | a dated trace of 28 Sep, naming browser files renamed since |
| lab `FRICTION.md` | canonical | failures in real use. A product contract: `tools/collect.mjs` line 156 parses its headings |
| lab `AGENT_IDEAS.md` | canonical | ideas, "not approved designs" (line 3) |
| lab `reports/`, `research/` | historical, each dated | a few are named "of record" |
| lab `status.html`, `reports/*.json` | generated projections | the diary |
| ORC `README.md` | canonical | what ORC is, how to run it; stale in part (F3, F4, F5, F24) |
| ORC `AGENTS.md` | canonical | rules for changing ORC; the core-neutrality directive; boundaries, which partly restate the test (F6) |
| ORC `test/architecture.test.ts`, `test/core-ties.ts` | canonical, enforced | boundaries (README lines 169–170 say so) |
| ORC `SECURITY-REVIEW.md` | canonical | the review questions |
| ORC `dangerfile.js` | canonical | the guarded paths |
| ORC `src/package-api.api.md` | generated | the package contract |
| ORC `GRANTS.md` | local elaboration | the grants design of 20 Sep; its present tense is stale at line 13 |
| ORC `MCP.md` | historical (browser sections, with a banner) and live (the MCP client) | — |
| ORC `CLASSIFY`, `FIXES`, `GRANTS-E2E`, `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`, `TURN-RECORD`, `VISIBILITY` | historical branch reports, unmarked | F7 |

**Each concept's canonical home:**

| Concept | Canonical home | Also stated in |
|---|---|---|
| What the lab is for | `SCOPE.md`; A2 extends it | `scope.yaml` purpose; lab README |
| North star | none that lasts: it is only in `STATE.md`. Proposed home: `decisions/` | ORC README "Direction", in part |
| Where the work stands | `STATE.md` | `status.html`; the dated `reports/2026-10-04-issue-map-overview.md` |
| Open work | GitHub issues on #140 | `STATE.md` "Waiting on Justin", a summary |
| Decisions | no single home (F1, F2). Proposed: `decisions/` for the lab's concerns, ORC `AGENTS.md` for core rules | `STATE.md`, `memory/`, reports |
| Working rules | `~/pro/local-config/home/AGENTS.md`, then each repository's `AGENTS.md` | `STATE.md` "How we work" |
| Failures and learnings | `FRICTION.md` | reports |
| What ORC enforces | `test/architecture.test.ts` | ORC `AGENTS.md`, README, `SECURITY-REVIEW.md` |
| Running ORC as a service | README "As a service" | `scripts/orc-service.ts` line 41 points the unit's `Documentation=` at `OPERATOR.md` (F7) |
| The repositories in the work | none (F15) | four lists |

## 6. Loop map (docs-first Step 3)

**A session that starts in the lab:**
- reads `AGENTS.md`, which Claude Code meets through the `CLAUDE.md` link;
- then `STATE.md`, `SCOPE.md`, and #140 through `node tools/map.mjs`;
- user-wide rules come from `~/pro/local-config/home/AGENTS.md`, linked into each tool (`reports/2026-09-30-skills-one-home.md`).

**A session that starts in ORC:**
- reads ORC's `AGENTS.md`, then README, `test/architecture.test.ts` and #140;
- never reaches the lab's `STATE.md`, which ORC's `AGENTS.md` does not name;
- ORC has no `CLAUDE.md` link, so whether Claude Code loads its `AGENTS.md` at all is unknown (F21).

**Tracking and branching:**
- Work is tracked as GitHub issues on #140 and Project 4, with marks set by `map.mjs working` and `stopped`.
- Branches live in worktrees, under `/tmp` by the 4 Oct FRICTION entry; where they should live is open as #196.
- Recorded rule: "After 22:00, work stays on branches".

**Review, merge and deploy:**
- Review: Astra's adversarial reviews, each finding then checked by Claude.
- Merge: Claude merges "once review and tests pass", but the tests run by hand (F11). Danger warns on a missing
  security review and does not block (F10).
- Deploy: the ORC checkout is pulled, ORC raises a restart card, and Justin approves it (ORC `AGENTS.md` line 136).

**Capture and handoff:**
- In practice, decisions are captured by overwriting `STATE.md`, sometimes in `decisions/`, `memory/` or a report (F1).
- Learnings become `FRICTION.md` entries, each classed as an instance or a missing system. Rules are promoted to
  local-config's `AGENTS.md`.
- The handoff is a `STATE.md` overwrite at each verified event.
- The nightly diary is not running (F12).
- No guard runs at session end (F22).

## 7. Findings

One list for the whole route. The ranked risks, the guard, the integration brief and the patches refer to these ids.

- **F1. Justin's decisions recorded only in a file that is overwritten.**
  - **Evidence:** the 4 Oct interview (A2, A8), the north star (A3), the merge rule (A9), the Moving Stillness pause
    and the 3 Oct decisions all sit only in `STATE.md`, at lines 6–10, 17, 33–34, 38–54 and 57–58. The lab's
    `AGENTS.md` lines 33–34 say `STATE.md` is overwritten "at each verified event: a commit lands, tests pass, a
    decision is taken". The lab's `decisions/` holds one entry, of 17 Sep.
  - **Source:** lab `STATE.md`, `AGENTS.md`, `decisions/`.
- **F2. Nothing says where each kind of decision is recorded.**
  - **Evidence:** decisions are spread over seven places: `decisions/`, `memory/`, `STATE.md`, ORC's `AGENTS.md`,
    reports (the skills rule went to local-config's `DECISIONS.md`), the description of #140, and a plan in
    `~/.claude/plans/agile-booping-waffle.md`. That plan is outside both repositories (`memory/authority-rules-step-1.md`
    line 5). The lab's "Where a learning goes" table has no row for decisions.
  - **Source:** the files named.
- **F3. Stale description: scheduling listed as deliberately absent.**
  - **Evidence:** ORC `README.md` 152–154 lists scheduling and workflow execution as "deliberately absent". This
    contradicts A5 (17 Sep), and the code has recurring series (`package.json`: `list:async-series` and the other
    `*:async-series` scripts).
  - **Source:** ORC README; lab `decisions/`.
- **F4. Stale description: Bookwhen described as part of ORC's core.**
  - **Evidence:**
    - ORC `README.md` 5–7, 76–79 and 145–150 describe Bookwhen data paths in core, `ORCHESTRATOR_BOOKWHEN_API_TOKEN`
      and the pinned `@jphil/bookwhen-client@0.6.1`.
    - ORC `AGENTS.md` 102–103 names `src/bookwhen.ts`. The file does not exist, and nothing in `src/` reads that token.
    - `test/architecture.test.ts` 1311–1321 asserts the client is absent from source and dependencies, and that
      Bookwhen implementations are out of source.
    - A4 settles it. The staleness was found on 1 Oct (`reports/2026-10-01-review-synthesis.md` item 7; design review
      line 175). It was still there on 4 Oct, held as "Small cleanups, on your word" (synthesis line 95), although a
      correction backed by a recorded decision needs no new one.
  - **Source:** the files and lines named.
- **F5. Stale description: where credentials are read.**
  - **Evidence:** ORC `README.md` 103–104 says "A credential is read in exactly one place, `src/runtime.ts`".
    `src/adapters/scope-credentials.ts` reads the credentials each Scope holds, citing A11, the decision of 28 Sep.
  - **Source:** ORC README; `scope-credentials.ts`.
- **F6. ORC's `AGENTS.md` restates a list the test enforces, and the restatement has drifted.**
  - **Evidence:** ORC `AGENTS.md` 92–96 names three modules allowed to start subprocesses.
    `test/architecture.test.ts` 822–835 enforces four; the fourth is `src/adapters/orc-service.ts`, from
    orchestrator#101.
  - **Source:** both files.
- **F7. Superseded material beside live documents: twelve branch reports at ORC's root.**
  - **Evidence:**
    - The reports are `CLASSIFY` through `VISIBILITY`, listed in section 5.
    - They speak in the present tense: "Nothing is pushed" (`OPERATOR.md` 12, `SEAM.md` 12); "Nothing committed,
      nothing pushed" (`REWORK.md` 3); "Today that job needs a source edit" (`GRANTS.md` 13).
    - A scan for code paths in backticks found 11 that no longer exist, across 7 documents (6 reports and
      `AGENTS.md`): `src/adapters/browser/service.ts` and `mcp.ts`, `src/core/policies.ts`, `src/core/ports/browser.ts`,
      `src/adapters/async-store/store.ts`, two test files, and `src/bookwhen.ts`.
    - Only `MCP.md` is marked as history.
    - `scripts/orc-service.ts` line 41 makes `OPERATOR.md` the systemd unit's `Documentation=`. The design review
      says these reports are "referenced by no code", which is wrong for this one.
    - Its proposal to delete them waits on Justin (Q4).
  - **Source:** the ORC files; lab `reports/2026-10-01-design-review.md` 171–173 and 248–255.
- **F8. `STATE.md` contradicts itself in the version of 4 Oct.**
  - **Evidence:**
    - Line 88 gives the main process "started 2026-10-03 22:12:47 on `369628b`", and line 58 "ORC live: 369628b since
      22:12:47". Against that, lines 31–36 record restarts at 13:36:37, 14:03:34, 14:26:04 and 14:48:27 on 4 Oct, and
      line 56 a reboot at 11:41.
    - Line 23 says #193 is "built and in review, not merged"; line 31 says "#193 is live".
    - Line 59 says "Next on the browser stack: #118, then #52"; lines 33–34 say those wait while Moving Stillness is
      paused.
    - Line 91 gives Moving Stillness's `main` as `c759f96`; line 32 has MS #53 merged as `fc830aa`.
    - Line 94 says grant `e9675bd9` "covers the test entry until 1 Oct 18:00Z", three days before the update.
    - `tools/map.mjs` reads the line 23 value into the diary.
    - The same failure is recorded twice before: `FRICTION.md` 866–869 (12 Sep) and 621–627 (22 Sep).
  - **Source:** lab `STATE.md`, `FRICTION.md`, `tools/map.mjs`.
- **F9. `STATE.md`'s size, against two caps that disagree.**
  - **Evidence:** the file has 99 lines, 87 of them non-empty, some over 250 characters. `AGENTS.md` 34 caps it at
    "about forty content lines"; `STATE.md` 4 sets a "Target: sixty lines". It also holds history ("Phone (closed
    3 Oct)"), decisions, and ORC design detail, which `AGENTS.md` 21 ("Do not duplicate repository facts here")
    excludes. Q2.
  - **Source:** lab `STATE.md`, `AGENTS.md`.
- **F10. Prose control: the security-review check warns and does not block.**
  - **Evidence:** `SECURITY-REVIEW.md` 53–55 says a direct push to `main` is not checked, and "without GitHub Pro a
    failed check warns rather than blocks a merge. Merge only when it is green". ORC `AGENTS.md` 142–143 says the
    same. The merge rule (A9) relies on agents keeping that, and on tests that nothing runs (F11).
  - **Source:** ORC `SECURITY-REVIEW.md`, `AGENTS.md`; lab `STATE.md` 17.
- **F11. Tests run only by hand.**
  - **Evidence:**
    - `.github/workflows/danger.yml` is the only CI job, and it runs only `dangerfile.js`. Nothing runs
      `pnpm typecheck`, `pnpm test` or `pnpm test:e2e` on its own.
    - The E2E suite was red on `main` for a week, unnoticed (`FRICTION.md` 396–399).
    - Danger's Package API rule fires only when `src/package-api.api.md` changed (`dangerfile.js` 83). The test that
      forces that file's update is itself run by hand (ORC `AGENTS.md` 132).
    - The PR template has no `## Package API` section.
    - Decided, not built: #144, kept on 4 Oct.
  - **Source:** the ORC files named; lab `STATE.md` 45 and 69.
- **F12. The diary is described as nightly, and nothing runs it.**
  - **Evidence:**
    - `tools/report.mjs` 56: "The diary is the nightly job". Its line 13 records that the earlier overview stopped
      "because nothing ran it each day (orchestrator#64)".
    - Snapshots exist for 29 Sep to 2 Oct and none for 3 or 4 Oct. `status.html` was generated 2 Oct 08:45 UTC, with
      `suites` null.
    - The same failure as #64, so this is a missing system, not an instance. The decision of 4 Oct (#166 first)
      builds that system.
  - **Source:** lab `tools/report.mjs`, `reports/*.json`, `status.html`.
- **F13. The map check passes when it should fail.**
  - **Evidence:**
    - `node tools/map.mjs --check` treats a repository it cannot read as having no issues (`map.mjs` 176:
      `issues(repo) ?? []`).
    - It covers the 6 repositories in `tools/collect.mjs`; the map spans 9.
    - Confirmed by Claude on 4 Oct (`reports/2026-10-04-labels-review-astra.md` 8–13).
    - The check is a kept process (A8).
  - **Source:** lab `tools/`, the report named.
- **F14. Brittle automation: the diary drops friction entries.**
  - **Evidence:**
    - The diary's `FRICTION.md` reader (`tools/collect.mjs` 156) drops 3 of 34 dated sections: "2026-09-21 night",
      "late" and "evening". This run checked it by applying the regular expression to the file.
    - `FRICTION.md` line 3 says "Newest first". From line 1153 on, the sections run oldest-first (11 to 19 Sep).
  - **Source:** lab `tools/collect.mjs`, `FRICTION.md`.
- **F15. Which repositories make up the work has four homes, and the lab's purpose is stated too narrowly.**
  - **Evidence:**
    - The four lists: `scope.yaml` lists 2 resources, `tools/collect.mjs` 6 repositories, the header of
      `tools/report.mjs` 5, and the map 9.
    - The lab's purpose in `scope.yaml` 5 and `SCOPE.md` 5–7 is narrower than A2. That is a stale description; the
      patch corrects `SCOPE.md` once A2 is in `decisions/`.
  - **Source:** the lab files named.
- **F16. An "update both" instruction.**
  - **Evidence:** the lab's `AGENTS.md` line 19: "A resource joined or left this Scope | `scope.yaml`, then one line
    in `SCOPE.md`". It keeps two copies of one list in step. `SCOPE.md` 23 already makes `scope.yaml` the formal
    inventory.
  - **Source:** lab `AGENTS.md`, `SCOPE.md`.
- **F17. "Retrospective documentation" with no condition that a decision exists.**
  - **Evidence:** ORC `AGENTS.md` 154–155 and `README.md` 22–23 say to record only what was built and used. Applied
    to the README's "Direction" and "Boundary", this would have an agent rewrite a stated constraint, such as the
    "deliberately absent" list, to match whatever was built. Intent-change rule, points 4 and 6.
  - **Source:** ORC `AGENTS.md`, README.
- **F18. Ambiguous: the pace of new design work.**
  - **The two statements:** A13 ("one scored real use must come first") and A14 ("what is naturally needed").
  - **Reading 1:** every new design waits for a scored use.
  - **Reading 2:** obviously needed completions go ahead; new systems need a reason.
  - **Where they diverge:** building #166's scheduler before any scheduled job has run. A8 settles that case.
  - **Source:** lab `AGENTS.md`; the report named in A14.
- **F19. Ambiguous: "work towards a point of consolidation" (A3).**
  - **Reading 1:** consolidate code. The design review's §4, "Remove what nothing uses".
  - **Reading 2:** consolidate process. The map and the central lab.
  - **Status:** not asked. A8 orders the next step under either reading.
  - **Source:** lab `STATE.md` 9–10.
- **F20. The lab's README is stale.**
  - **Evidence:**
    - It documents `node tools/report.mjs --serve` (line 18). `report.mjs` has no such flag and says "nothing is
      served" (line 13).
    - It gives "~10s" for a run with tests, where `report.mjs` line 10 says about two minutes.
    - It says `--no-tests` "keeps the day's test count". It writes `suites: null` over the day's snapshot instead
      (`report.mjs` 51 and 313).
  - **Source:** lab `README.md`, `tools/report.mjs`.
- **F21. The loop splits by the repository a session starts in.**
  - **Evidence:**
    - A session that starts in ORC never meets the lab's `STATE.md`, which holds the merge rule, the Moving Stillness
      pause and the live facts. ORC's `AGENTS.md` 3–12 names README, the test and #140 only.
    - The lab links `CLAUDE.md` to `AGENTS.md`; ORC has no `CLAUDE.md`. Whether Claude Code loads ORC's `AGENTS.md`
      is therefore unverified.
  - **Source:** both `AGENTS.md` files; the symlink in the lab snapshot.
- **F22. A process kept without anything behind it: "entropy guard at session end".**
  - **Evidence:** it is among the processes Justin kept on 4 Oct (`STATE.md` 49). Neither repository has a guard file.
    One may exist outside them; that is unknown (Q1).
  - **Source:** both repositories.
- **F23. The guarded-path list is in three places.**
  - **Evidence:**
    - `dangerfile.js` 44–59 holds it.
    - `test/architecture.test.ts` 723–740 checks it independently but omits `AGENTS.md` and `config/`, so dropping
      either from `GUARDED` would pass the test.
    - `SECURITY-REVIEW.md` 177–181 restates it in prose without `config/`, `package.json`, the lockfile or the two
      scripts.
  - **Source:** the three files.
- **F24. ORC's README is stale on restarts.**
  - **Evidence:** README 126–128 says ORC "is down for about two seconds" and that "A conversation reply in progress
    is cut off". `src/app/orc-restart.ts` 165 says ORC is unavailable for "about ten seconds"; a reply being written is
    finished first, and a message sent meanwhile is refused (`src/conversation-controller.ts` 1719). This shipped
    with #195 on 4 Oct.
  - **Source:** ORC README and the source files named.

## 8. Ranked risks

The risks are ranked by decay rate times recovery cost.

1. **Justin's decisions die when `STATE.md` is overwritten** (F1, F2).
   - **Decay:** hours. `STATE.md` was rewritten several times on 4 Oct alone.
   - **Recovery:** high. A lost decision is asked again or contradicted. Git keeps old versions, but no reader looks
     there.
   - **Symptoms:** the 4 Oct interview, the north star and the merge rule exist only in `STATE.md`.
   - **Anchor:** the lab's `decisions/`.
2. **`STATE.md` says confident things that are not true** (F8, F9, F21).
   - **Decay:** hours.
   - **Recovery:** medium to high. Wrong answers about a live service reach Justin. `FRICTION.md` records it on 12 Sep,
     22 Sep and 29 Sep ("You restarted ORC at 14:00:34" was false). The values also flow into the diary through
     `map.mjs`.
   - **Anchor:** the lab's `AGENTS.md` "Keeping state", with one cap (Q2).
3. **Verification runs by hand while merging is delegated** (F10, F11, F12, F13).
   - **Decay:** every merge, and there were four ORC merges on 4 Oct.
   - **Recovery:** high. A red E2E suite went unseen for a week. A guarded change can merge with a red Danger check.
   - **Anchor:** #144 and #166, both decided.
4. **ORC's prose disagrees with its code, beside superseded reports** (F3 to F7, F17, F23, F24).
   - **Decay:** medium. The README was untouched for 142 non-merge commits.
   - **Recovery:** medium. Agents copy dead names out of prose. On 26–27 Sep a removed tool name,
     `list_moving_stillness_entries`, was copied from agent-facing text into memory, and a review round missed it
     (`FRICTION.md` 414–421). No cost was seen, because the agent found the real tools.
   - **Anchor:** `test/architecture.test.ts`, A4 and A5.
5. **The lab's tools disagree with their own inputs** (F13, F14, F15, F16, F20).
   - **Decay:** slow to medium. Each new repository or Scope adds a mismatch; finance joined on 2 Oct.
   - **Recovery:** low to medium, because the misses are silent.
   - **Anchor:** one list of repositories, and stable formats checked by the tools themselves.

## 9. Existing guard surfaces, by whether they execute

| Surface | Category | Note |
|---|---|---|
| Danger on every ORC pull request (`.github/workflows/danger.yml`): Security review and Package API sections | runs by itself | warns, does not block (F10). The lab has no CI |
| ORC and lab pre-push hooks (`.githooks/pre-push`) | unknown | whether they are enabled cannot be told without `.git`. Either way they only print a push summary and never block |
| `pnpm test`: the boundary tests, the core-ties ratchet, the guarded-path test, the package API report test, the source-header test | runs only by hand | F11 |
| `pnpm typecheck`, `pnpm test:e2e`, `pnpm api:report`, `pnpm pi:check` | runs only by hand | |
| `node tools/map.mjs --check` | runs only by hand | false passes (F13) |
| `node tools/report.mjs`, the diary, which runs ORC's and Moving Stillness's unit suites | runs only by hand | F12 |
| `SECURITY-REVIEW.md` checklist; Astra adversarial reviews; FRICTION's instance-or-missing-system rule | runs only by hand | judgment |
| Tests on every PR (#144); ORC scheduling for the diary, the weekly review, FRICTION into rules (#60), cleanups (#70, #182) | decided, not built | A8 |
| Label validation (labels review, 4 Oct); binding approvals to builds (#137); packages testing against ORC's real parts (#202) | decided, not built | proposal, issue, issue |
| "Entropy guard at session end" | declared, but missing | F22 |
| The README's `report.mjs --serve`; the README's "one snapshot per day" | declared, but missing | F20, F12 |
| GitHub branch protection; the rules in #140's description | unknown | not in the snapshot |

Keep each surface. Amend the map check (F13) and the diary's parser (F14, in the patch).

## 10. Mechanical checks belong to tools

Recommended tools. Whether any of them is installed on athena was **not checked**, so the guard depends on none.

- **ORC's own tests** for stable invariants:
  - every backticked code path in a root `.md` file exists, unless the file is marked as history (F7);
  - the guarded-path test lists every entry in `GUARDED` (F23).
- **A link checker such as lychee** for both repositories' markdown.
- **`--check` modes in the lab's own tools:**
  - the `**Where we are now:**` line parses;
  - every `FRICTION.md` heading parses;
  - `STATE.md` is within the cap (F8, F9, F14).
- **One repository list** read by both `collect.mjs` and `map.mjs`, with an unreadable repository failing the check
  (F13, F15).
- **An instruction-file linter such as ctxlint or agnix** for the two `AGENTS.md` files: optional.

## 11. Recommendations: consolidate, demote, mark as history

- **Consolidate decisions.** Copy into `decisions/` (the patch). `STATE.md` links them, and the lab's `AGENTS.md`
  names `decisions/` as their home (F1, F2).
- **Consolidate the repository list** into one module read by both lab tools (F13, F15).
- **Reduce restatements to links:**
  - ORC `AGENTS.md`'s module lists point to the test; the patch adds that pointer (F6);
  - `SECURITY-REVIEW.md`'s path list points to `dangerfile.js` (F23);
  - `SCOPE.md`'s "Projects" list points to `scope.yaml`, which retires the "update both" line (F16). This one is a
    recommendation only; the patch does not change it.
- **Demote ORC's twelve root reports**, as Q4 asks: history banner or deletion. Repoint the unit's `Documentation=`
  first.
- **Add a condition to F17's rule:** "unless the text states a decided constraint; then the intent-change rule
  applies". This is a recommendation for Justin, not patched, because it rewrites a standing directive.

## 12. One-time cleanup

Each item was checked against the current file.

| Item | File and lines | In a patch? |
|---|---|---|
| Bookwhen token, client and core data paths | ORC `README.md` 5–7, 76–79, 145–150 | yes |
| "read in exactly one place" | ORC `README.md` 103–104 | yes |
| Scheduling listed as absent | ORC `README.md` 152–154 | yes |
| Restart: two seconds, reply cut off | ORC `README.md` 126–128 | yes |
| `src/bookwhen.ts`; three subprocess modules | ORC `AGENTS.md` 92–96, 102–103 | yes |
| `--serve`, the timings, "keeps the day's test count" | lab `README.md` 16–21 | yes |
| FRICTION heading regular expression | lab `tools/collect.mjs` 156 | yes |
| The `STATE.md` contradictions; the expired grant | lab `STATE.md` | yes |
| `FRICTION.md` order from line 1153 | lab `FRICTION.md` | no: a large move, judged lower value |
| Add `AGENTS.md` and `config/` to the guarded-path test | ORC `test/architecture.test.ts` 723–740 | no: a guarded change; needs a Security review section |
| A `## Package API` placeholder in the PR template | ORC `.github/pull_request_template.md` | no: guarded path |
| Repoint `Documentation=` | ORC `scripts/orc-service.ts` 41 | no: waits on Q4 |

Cleanup is tracked as issues on the map (#140, under A, #141), never in the guard.

## 13. The current-state update

The update is in `patches/scope-orchestration-lab.patch`, as a rewrite of `STATE.md`. It has:
- 41 content lines, 58 lines in all;
- the current stage; what to trust first; settled decisions, linked; open questions, including Q1 to Q4; superseded
  material nearby; two next actions;
- every live fact marked "as recorded on 4 Oct", with the command to re-read it;
- a line saying what makes the file stale and who refreshes it.

It leaves the header's "Target: sixty lines" unchanged (Q2). It moves "Where we are now" from #193, which is live, to
#166, built first by A8. The patch header lists everything moved out of `STATE.md` and where each item lives now.

## 14. Is a guard needed, and the handover

**Step 3: yes, build one.** The system is active. A session-end guard is a kept process (A8) with nothing behind it
(F22). No sound existing guard was found to refine; if one exists outside these repositories, Q1 says to fold this
draft into it.

**Step 4: the handover to the generator:**
- the intent: section 1;
- the analysis: sections 3 to 6 and 9;
- the ranked risks: section 8.

## 15. Generator report

- **Mode: plan.** The targets are read-only. Discuss-first is also the default for a change across repositories, and
  the stricter mode wins. Nothing in the targets was edited.
- **Inputs, all supplied by the assessment:**
  - steward and intent documents: section 1;
  - the state file and who refreshes it: lab `STATE.md`, refreshed by the agent ending each session;
  - rules owned elsewhere: local-config's `AGENTS.md`, `SECURITY-REVIEW.md`, `dangerfile.js`, #140;
  - which checks run by themselves: section 9;
  - code areas with their docs and tests: section 5;
  - live state: section 3.
- **Guard:**
  - Drafted at `guard/SKILL.md`, to the guard contract.
  - Proposed home: `skills/session-coherence-guard/SKILL.md` in the lab (Q1).
  - Size: 900 words, with J = 9. The template's generic two-documents line is not counted in J.
  - Budget: 450 + 36 × 9 + S + C = 450 + 324 + 89 + 39 = 902. It is within budget.
- **Its checks, and the findings each one serves:**
  - docs against code: F3 to F5, F24;
  - boundary prose against the test: F6, F23;
  - merge readiness: F10, F11;
  - decisions to their home: F1, F2;
  - `STATE.md` claims and format: F8, F9;
  - the map: F13;
  - FRICTION headings and order: F14;
  - retired names, and the root reports: F7;
  - whether a fresh agent in either repository meets the rules: F21.
- **Questions the guard leaves visible:** an HTML comment marks it as a draft awaiting Q1, Q2 and Q3. Its cap check
  reads the cap from the lab's `AGENTS.md` rather than fixing a number. Its merge check asks for `pnpm typecheck` and
  `pnpm test` by hand until #144.
- **The intent-change rule** is copied as version 2, with Justin, the intent documents and `decisions/` filled in. No
  repair instruction in it edits an intent document to match work.
- **Patches against open questions:** checked. Each patch header lists the questions it touches and leaves their text
  unchanged.
- **Doc references to add**, from `integration.md` and provisional on Q1: one line in each repository's `AGENTS.md`.
- **Validation run:**
  - `git diff --no-index --check` over the original and changed copies: no whitespace errors;
  - `patch -p2 --dry-run` of both patches against fresh copies of the targets: both apply;
  - `node --check` on the changed `collect.mjs`: passes;
  - the new FRICTION regular expression matches 34 of 34 headings;
  - the new `STATE.md` still matches `map.mjs`'s "Where we are now" expression.
- **Handed to `guards-integrator`:** `integration.md`.

## 16. Next step

1. Justin answers Q1 to Q4 (`questions.md`).
2. Apply the lab patch, with `decisions/` first. Open a pull request for the ORC patch, with a Security review
   section.
3. Place the guard as `integration.md` says, and run it at the end of the #166 work.

## 17. Uncertainties

- Every live fact (builds, restarts, grants, test counts) is quoted from `STATE.md` of 4 Oct, not observed.
- Issue descriptions, the rules on #140, PR descriptions and branch protection were not read. Approvals for single
  features could be recorded there, so "no unauthorised drift" holds only for what was read.
- The user-wide rules (`~/pro/local-config/home/AGENTS.md`) and `HOW_NOT_TO_PLAN.md` were not read. A13 and A14 are
  judged from the repositories' own quotations of them.
- Whether `.githooks` is enabled in either clone, and whether Claude Code loads ORC's `AGENTS.md`, are unknown.
- Whether a session-end guard exists outside these repositories is unknown (Q1).
- `FRICTION.md` and `reports/` were read in part. A finding confined to an unread report could be missed.
