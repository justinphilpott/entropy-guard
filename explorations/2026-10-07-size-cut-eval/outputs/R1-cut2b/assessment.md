# Entropy assessment: ORC and the orchestration-lab Scope

Prepared 2026-10-07 by an agent following entropy-guard's skills (`entropy-assessment` v0.8.0 and the files it points
to). One assessment for the whole route.

- **Targets**, assessed as one system, both read-only snapshots with no `.git`:
  - ORC, a TypeScript orchestration system (`orchestrator/`; at home `~/pro/orchestrator`);
  - the orchestration-lab Scope that manages ORC's work (`scope-orchestration-lab/`; at home
    `~/scopes/scope-orchestration-lab`).
- **Route.** Intent pass, then shape B (mixed docs and code) through `mixed-profile.md`. The lab is a docs-first member
  repository, so docs-first Steps 2, 3 and 5 also ran on it. Then a guard drafted with
  `session-coherence-skill-generator`, and placement advice from `guards-integrator`.
- **Mode.** The targets are read-only and no steward was available, so this is plan mode: nothing in the targets was
  changed. Patches are in `patches/`, the draft guard in `guard/SKILL.md`, placement advice in `integration.md`, and
  questions for the steward in `questions.md`.
- **Evidence limits** are listed in section 14. Every claim below names its file and line in the snapshots, read
  on 2026-10-07. A claim about a live service (ORC's running build, a grant, a card) is quoted from the lab's
  `STATE.md` as it stood on 2026-10-04 17:31 and was not re-read.

## 1. Intent

### Steward

**Justin.** The lab's `scope.yaml` names him (line 6, `steward: justin`; line 37, `role: admin`). ORC's `README.md`
line 3 calls ORC "Justin's local-first personal agent", and ORC's `AGENTS.md` quotes him as the source of its rules.

### Authorised intent, with the source of each part

| Part | Source | Kind and authority |
|---|---|---|
| ORC is "his ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; after the six slots work, "work towards a point of consolidation" | lab `STATE.md` 8-11 | directive; attributed and dated (25 and 26 Sep). Held in an overwritten file (F3) |
| Core ships with no specific Scope, model, owner or agent ("not the tiniest hint of scope specific code inside the core") | ORC `AGENTS.md` 30-46 | directive; attributed and dated (12 and 13 Sep); ratcheted by `test/core-ties.ts` |
| ORC owns a general async work capability; delivery, retry, schedule and the other policies are declared per task type | lab `decisions/2026-09-17-async-work-architecture.md` | decision; "Decided by Justin on 2026-09-17", written by Claude |
| The map of work is orchestrator#140, the reference point for every agent | ORC `AGENTS.md` 9-12; lab `AGENTS.md` 7-10 | directive; attributed and dated (2 Oct) |
| Authority rules 1, 2, 4 and 5 affirmed; rules 3, 6, chat handling and Iris's role open | lab `memory/authority-rules-step-1.md` | decision; attributed and dated (1 Oct 22:05) |
| The lab is the central Scope for project management, core issue tracking, code quality and security; the processes kept; #166 first; Astra runs this assessment | lab `STATE.md` 38-55 | decision; "Decided by Justin, 4 Oct afternoon (interview)". Only in the overwritten file (F3) |
| Claude merges a PR once review and tests pass | lab `STATE.md` 17-18 | decision; attributed and dated (25 Sep). Only in `STATE.md` |
| Security reviews are checked by Danger; git cleanup moves to Worktrunk and gh poi | lab `STATE.md` 76-82; ORC `dangerfile.js` 7 | decisions; attributed and dated (2 Oct) |
| The browser runs through Playwright's library, not Playwright MCP | ORC `src/adapters/browser/playwright.ts` 10-12 | decision; "orchestrator#76, decided 3 Oct 2026", decider not named |
| Relax development to "what is naturally needed given where we are and what's likely coming next", bounded by "not ... huge edifices that don't have a clear reason" | lab `reports/2026-09-22-pushback-analysis.md` 127-133 | directive; attributed and dated (21 Sep 18:05, 18:11), quoted in a report |
| The lab's purpose: "Justin's Scope for developing and operating ORC and its reusable Scope-owned agents" | lab `SCOPE.md` 5-7; `scope.yaml` 5 | description; unattributed, undated |
| ORC's direction: Iris as front door, ADA to create agents, every agent belongs to a Scope | ORC `README.md` 9-23 | description; unattributed, undated |
| Pace: "one scored real use must come first"; documentation concise and retrospective | lab `AGENTS.md` 25-29 (pointing at `~/pro/agentic/HOW_NOT_TO_PLAN.md`, not read); ORC `AGENTS.md` 152-155 | standing instruction; unattributed, undated |

Rules the system is bound by and does not own, all outside this run and not read: `~/pro/local-config/home/AGENTS.md`
(user-wide, cited by lab `STATE.md` 15-16), `~/pro/agentic/HOW_NOT_TO_PLAN.md`, `~/pro/scope/docs/MODEL.md` (cited by
`SCOPE.md` 23-24), `pro/agentic/agentic-architecture/MODEL.md` (cited by ORC `AGENTS.md` 59), and the rules in
orchestrator#140's description.

### Three readings

- **Declared.** The documents describe a personal agent with Iris at the front and Scope-owned agents. ORC's `README.md`
  still describes read-only Bookwhen paths, and lists scheduling and workflow execution as "deliberately absent".
- **Enacted.** No git history was available. From `STATE.md`, `FRICTION.md` and the code, the work up to 4 Oct
  pursued these:
  - durable work with approval cards, standing grants and recurring schedules;
  - a Playwright browser that writes to Bookwhen through a Scope package;
  - phone notices;
  - invoicing through a Finance Scope;
  - the issue map and labels;
  - package API versioning (#201);
  - resolve-before-acting (#193).
- **Authorised.** Each of those is covered by a recorded decision in the table above (17 Sep, 2 Oct, 3 Oct, 4 Oct),
  or by the north star. **No unauthorised drift was found.** The evidence for that is thin: no commits, and no
  GitHub issues were read.

### Gaps, by condition

| Condition | Gap | Finding |
|---|---|---|
| Stale description | ORC `README.md` and `AGENTS.md` describe a Bookwhen client the core-ties directive removed and the architecture test forbids | F8 |
| Stale description | ORC `README.md` lists scheduling and workflow execution as deliberately absent, after the 17 Sep decision | F10 |
| Stale description | `SCOPE.md` purpose predates the 4 Oct "central Scope" decision | F5 |
| Stale description | The 17 Sep decision record still lists `idempotency`, split by "the approved split" the same day (approver not recorded) | F11 |
| Conflict | `STATE.md`'s cap: "about forty content lines" against "Target: sixty lines" | F2, Q4 |
| Ambiguous | The pace rule against Justin's 21 Sep "what is naturally needed" | F7, Q3 |
| Missing | No document names where steward decisions are recorded; the documented loop puts them in an overwritten file | F3, F4, Q2 |
| Missing | The session-end entropy guard Justin kept on 4 Oct has no home or content | F17, Q1 |
| Prose control | "Merge only when it is green", while the check warns rather than blocks; a merge rule ("once review and tests pass") with tests in no CI | F13, F14 |
| Prose control | `STATE.md`'s size cap; "Do not duplicate repository facts here" (lab `AGENTS.md` 21) | F2 |
| Prose control | "A new grantable type should not be declared without" an independent read (ORC `AGENTS.md` 88-90) is already tracked as #74 | linked to #74 |

Gaps that do not depend on intent, such as a missing `--serve` flag (F15) or parsers that drop headings (F16), are
in the findings and fixed as usual.

### Existing repair instructions, read against the intent-change rule

- **An "update both" instruction.** The lab's `AGENTS.md` line 19 says "A resource joined or left this Scope →
  `scope.yaml`, then one line in `SCOPE.md`". That keeps two copies of one thing in step (F6).
- **Decisions sent to an overwritten file.** The lab's `AGENTS.md` line 33 says "`STATE.md` is overwritten at each
  verified event: ... a decision is taken". That sends decisions into a file that is overwritten (F3).
- **No instruction edits intent documents to match the work.** ORC's ratchet instruction (`AGENTS.md` 47-48, "a count
  may only fall, and its allowance falls in the same change") and `pnpm api:report` (`AGENTS.md` 132) keep a check
  with what it checks. They are mechanisms, not intent edits.

### Questions, with recommended answers

Five questions, in `questions.md`. Their one-line answers:
- Q1, the guard's home: the lab's `skills/`.
- Q2, where decisions are recorded: the lab's `decisions/`.
- Q3, pace: the scored-use rule still gates new design.
- Q4, `STATE.md`'s cap: about forty content lines, derived.
- Q5, ORC's branch reports: marked in place now, moved to `docs/` when option F of 30 Sep is decided.

### Proposed changes, and where they were recorded

- **No proposed change of intent.** Q3 is a question, not a proposal.
- **Steward decisions copied from `STATE.md`.** Patch 03 copies them to
  `decisions/2026-10-04-decisions-recorded-in-state.md`, with source lines and dates, marked "Copying is not deciding
  again". This is the intent pass §5 rule; the copy's location touches Q2.

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** Evidence:
  - `scope.yaml` line 7 and its `orchestrator` project, line 14, both say `status: active`;
  - `STATE.md` was updated 2026-10-04 17:31 and records four ORC restarts that day (lines 31-35);
  - `FRICTION.md` has an entry dated 4 Oct (line 20).
  The `status-tracker` project is archived and outside these snapshots.
- **Shape: B, mixed docs and code,** with traits of D, workflow-heavy. Evidence:
  - ORC holds 143 TypeScript source files under `src/` and `web/src/`, and 73 files under `test/` and `e2e/`;
  - ORC's root also holds about 32,000 words of Markdown;
  - the lab is almost entirely Markdown and process: state, friction log, 79 files of reports, the map tooling;
  - risk sits between the two, in state claims about code and live services.
  B was taken; D's surfaces (handoffs, map, diary, hooks) are covered by the same profile.
- **Repositories: two, assessed as one system.** ORC holds the code. The lab holds ORC's current state, decisions,
  friction log and reviews, and is the central Scope for its project management by the 4 Oct decision. The lab is
  docs-first, so docs-first Steps 2, 3 and 5 ran on it (section 7).

## 3. Domains present and actively changed

| Domain | Where | Changing? |
|---|---|---|
| Code | ORC `src/`, `web/src/`, `scripts/`, `config/`; lab `tools/*.mjs` | yes: four ORC merges on 4 Oct (`STATE.md` 31-35) |
| Documentation | ORC root Markdown; lab `README.md`, `SCOPE.md`, `AGENTS.md`, `STATE.md`, `FRICTION.md`, `reports/` | yes: `STATE.md`, `FRICTION.md` and two reports on 4 Oct |
| Tests | ORC `test/` (vitest), `e2e/` (Playwright) | yes: "Tests: ORC 970 + E2E 5" (`STATE.md` 30) |
| API and data contracts | ORC `src/package-api.ts` and its report `src/package-api.api.md`; the SQLite schema in `src/adapters/async-store/sqlite.ts` | yes: #201 on 4 Oct |
| Workflow and process | the map (#140, `tools/map.mjs`), Danger, pre-push hooks, the diary, restart and build cards | yes: the 4 Oct interview |
| Live operational state | `orc.service` on athena, the durable-work database, grants, the Bookwhen test entry, ntfy | yes: restarts and cards on 4 Oct |

## 4. Concepts and their homes

| Concept | Owner | Second home, if any | Finding |
|---|---|---|---|
| ORC's enforced boundaries (tools, subprocess, network) | ORC `test/architecture.test.ts` | ORC `AGENTS.md` "Boundaries" restates them as lists, now stale | F9 |
| Paths that need a security review | ORC `dangerfile.js` `GUARDED` | `SECURITY-REVIEW.md` 177-185 restates a narrower list | F20 |
| Current state of the work | lab `STATE.md` | ORC has none; `status.html` is a generated projection (fine) | F1, F18 |
| Open work | GitHub issues on orchestrator#140 | `STATE.md` also lists issue states ("Unmerged", "Waiting on Justin") | F1 |
| Steward decisions | none named | `STATE.md`, `decisions/`, `memory/`, `reports/` "Of record", ORC `AGENTS.md` quotes, ORC source headers, GitHub issues | F3, F4 |
| The lab's resources and projects | `scope.yaml` | `SCOPE.md` "Projects" (kept in step by instruction) | F6 |
| ORC's state directory | ORC `src/runtime.ts` 190 (`ORCHESTRATOR_STATE_DIR`, else `~/.local/share/orchestrator`) | lab `tools/collect.mjs` 16 hard-codes `~/.local/share/orchestrator-proof` | F16 |
| ORC's durable-work tables | ORC `src/adapters/async-store/sqlite.ts` | lab `tools/collect.mjs` 124-133 queries them with no shared contract | F16 |
| "Where we are now" | `STATE.md` prose | `tools/map.mjs` 181-190 parses it with a regular expression | F16 |
| The pace rule | `~/pro/agentic/HOW_NOT_TO_PLAN.md` (not read) | restated in lab `AGENTS.md`, ORC `AGENTS.md`, ORC `GRANTS.md` 4-5 | F7 |
| `STATE.md`'s size limit | none settled | lab `AGENTS.md` 34 and `STATE.md` 4, with different numbers | F2 |
| Bookwhen reads and writes | the Moving Stillness Scope package (not in these snapshots) | ORC `README.md` and `AGENTS.md` still describe an ORC module for it | F8 |

## 5. Findings

One list; other sections refer to these ids.

- **F1. `STATE.md` contradicts itself, and this is the third time it has been wrong.** Source: the lab's `STATE.md`,
  4 Oct 17:31. The contradictions within the file:
  - line 23 says #193 is "built and in review, not merged"; line 31 says "#193 is live: #200 merged as `3989cdb`";
  - lines 58 and 88 say ORC runs `369628b`, started 3 Oct 22:12:47; lines 31-35 record restarts on 4 Oct onto
    `3989cdb`, `adaa127`, `6d89ce7` and then `8cee662` (14:48:27);
  - line 59 says "Next on the browser stack: #118, then #52"; line 33 says that work waits because Moving Stillness is
    paused;
  - line 91 gives Moving Stillness `main` as `c759f96`; line 32 says MS #53 merged as `fc830aa`;
  - line 94 cites grant `e9675bd9` "until 1 Oct 18:00Z", three days past.

  `FRICTION.md` records the same failure twice before. On 12 Sep (line 866), "STATE described finished work as
  missing". On 22 Sep (line 621), "`STATE.md` contained two false statements, both found by being asked a direct
  question". **This is a missing system, not an instance.** Three failures share one cause: nothing checks a
  `STATE.md` claim against the file's other claims or against the live service. The file is also appended to,
  against its own "do not append" (line 4).
- **F2. Two numbers for one limit, and the file exceeds both.** The lab's `AGENTS.md` line 34 says "capped at about
  forty content lines". `STATE.md` line 4 says "Target: sixty lines". The file has 87 content lines and 1,246 words,
  and nothing checks either number.
- **F3. Steward decisions live only in an overwritten file.** Source: the lab's `STATE.md`. Decisions found only
  there:
  - the 4 Oct interview (lines 38-55);
  - the 25 Sep merge rule (17-18);
  - Moving Stillness paused, 4 Oct (33);
  - the three 3 Oct decisions (56-58);
  - the north-star quotes (8-11).

  The 2 Oct Danger decision is also in `dangerfile.js` line 7. The lab's `AGENTS.md` line 33 routes "a decision is
  taken" into a `STATE.md` overwrite. Patch 03 copies these decisions to `decisions/` (intent pass §5).
- **F4. No document names where decisions are recorded.** `decisions/2026-09-17-async-work-architecture.md` is the
  lab's only decision record, and no `README.md`, `SCOPE.md`, `AGENTS.md` or `STATE.md` in either repository links
  to it. Only 17 Sep reports do. Other decisions sit in:
  - `memory/authority-rules-step-1.md`;
  - `STATE.md`'s "Of record" (96-99);
  - quotes in ORC's `AGENTS.md`;
  - ORC source headers (`playwright.ts` 10-12);
  - GitHub issues (not read).

  The lab's `AGENTS.md` table "Where a learning goes" (12-19) has no row for a decision.
- **F5. `SCOPE.md`'s purpose predates the 4 Oct decision.** `SCOPE.md` 5-7 and `scope.yaml` 5 state the lab's
  purpose without the 4 Oct decision that "the lab is the central Scope for project management, core issue tracking,
  code quality and security" (`STATE.md` 39-40). A stale description: patch 02 corrects `SCOPE.md` in Justin's
  recorded words and leaves his open "Astra is to say what else it should cover" open. `scope.yaml`'s `purpose` is
  a second copy whose format the Scope model owns (`SCOPE.md` 23-24, not read), so it is left alone.
- **F6. An instruction to keep two copies in step.** The lab's `AGENTS.md` line 19 sends a resource change to
  `scope.yaml` "then one line in `SCOPE.md`". `SCOPE.md` 9-15 repeats `scope.yaml`'s project list. Recommend reducing
  `SCOPE.md`'s list to a pointer once the Scope model (not read) confirms `SCOPE.md` need not carry it.
- **F7. The pace rule and Justin's 21 Sep words admit two readings.** The lab's `AGENTS.md` 25-29 says "one scored
  real use must come first". ORC's `AGENTS.md` 152-155 and `GRANTS.md` 4-5 say the same. Justin, 21 Sep
  (`reports/2026-09-22-pushback-analysis.md` 127-133): "relax suggested development to 'what is naturally needed ...'".
  Ambiguous; Q3.
- **F8. ORC's docs describe a Bookwhen client that ORC no longer has.**
  - ORC's `README.md` 76-79 tells the reader to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN` for the pinned
    `@jphil/bookwhen-client@0.6.1`.
  - ORC's `AGENTS.md` 102-103 says "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client".
  - Against both: `src/bookwhen.ts` does not exist, the dependency is not in `package.json`, and no source reads the
    variable (only tests stub it). `test/architecture.test.ts` 1315-1321 asserts the client is absent and "keeps
    Bookwhen implementations out of ORC source".

  The code follows the steward's core-ties directive (ORC `AGENTS.md` 30-37), so the documents are wrong. Patch 01
  corrects them.
- **F9. ORC's `AGENTS.md` boundary lists lag the architecture test, and neither covers the browser.**
  - **Tools.** The parent model's tool list (20-24) includes `list_open_fridays`. The test's approved surface
    (`architecture.test.ts` 801-820) does not. `src/runtime.ts` 259 supplies that tool as a Scope package
    contribution.
  - **Subprocesses.** `AGENTS.md` 92-96 names three subprocess modules. The test (822-835) allows four; the fourth,
    `src/adapters/orc-service.ts` (#101), is the restart card that `AGENTS.md` 136 itself describes.
  - **The browser.** `src/adapters/browser/playwright.ts` 16 and 54-55 imports `playwright` and launches Chromium for
    each session (#76, 3 Oct). Neither `AGENTS.md`'s subprocess and network lists nor the test's patterns
    (`child_process`, `fetch`, `http`) cover it.

  `AGENTS.md` is what every change is reviewed against (`SECURITY-REVIEW.md`; Danger guards it). This is an instance
  of a list with two homes. The fix is to keep the exact lists in the test and state the rule in `AGENTS.md`, not to
  maintain both. Patch 01 corrects the prose; the test change is a recommendation (section 9).
- **F10. ORC's `README.md` describes boundaries that have since moved.** `README.md` 5-7 calls the external data
  paths read-only Bookwhen and Jina. `README.md` 145-147 says the Moving Stillness specialist plans "without applying
  it". `README.md` 152-154 lists "scheduling" and "workflow execution" as deliberately absent. Since then:
  - durable and recurring work was decided on 17 Sep (lab `decisions/`) and built (`sqlite.ts` 41-51,
    `src/app/async/calendar.ts`, `package.json` `*:async-series` scripts);
  - writes go through approval cards and standing grants (`AGENTS.md` 82-91 and 114-128).

  A stale description of an intent document, corrected by patch 01 from those records.
- **F11. A decision record carries no supersession note.** `decisions/2026-09-17-async-work-architecture.md` 46-47
  lists `idempotency: natural | keyed | none`. ORC's `FIXES.md` 138-161, "The approved split", replaced it with
  `repeatEffect` and `submissionKey` (`src/core/async/types.ts` 142-144, 332-334); the approver is not named. Patch 02
  adds a note that decides nothing.
- **F12. Superseded material sits beside live truth in ORC's root.**
  - Eight dated branch reports sit in ORC's root, about 22,600 words: `CLASSIFY.md`, `FIXES.md`, `GRANTS-E2E.md`,
    `OPERATOR.md`, `POLICY-STORE.md`, `REWORK.md`, `SEAM.md` and `SLICE1.md`. Several say "Nothing pushed".
  - They are named like the live documents, and they name removed paths: `src/adapters/browser/service.ts`,
    `src/adapters/async-store/store.ts` and `src/core/policies.ts`.
  - They also name a removed command, `pnpm approve:agent-package` (`GRANTS-E2E.md`, `SEAM.md`), which `AGENTS.md` 134
    says does not exist.
  - `MCP.md` marks its browser sections as history, but still names `src/core/ports/browser.ts` and
    `test/browser-service.test.ts`, which no longer exist.

  `FRICTION.md` line 414 shows the cost: an agent copied a tool name that had gone. Linked to option F of
  `reports/2026-09-30-priorities.md` ("`docs/` in each repository"); Q5. `VISIBILITY.md`, `TURN-RECORD.md` and
  `GRANTS.md` may be current reference; only one constant was checked (`MAX_PACKAGE_TURN_ARGUMENT_BYTES`, present).
- **F13. Verification runs only by hand.**
  - ORC's only CI job runs Danger (`.github/workflows/danger.yml` 31). Type checks, unit tests and the E2E suite run
    by hand.
  - `FRICTION.md` line 396: the E2E suite "had failed on `main` for a week, unnoticed".
  - The 25 Sep merge rule ("once review and tests pass") depends on those hand runs.
  - Tests on every PR (#144) was kept on 4 Oct; its mechanism waits on Justin (`STATE.md` 45, 69).
- **F14. The security-review check warns, and nothing blocks the merge.** `SECURITY-REVIEW.md` 53-55: "without GitHub
  Pro a failed check warns rather than blocks a merge. Merge only when it is green." That sentence is a prose
  control. Direct pushes to `main` go unchecked (`AGENTS.md` 142-143). `STATE.md` 82 lists four open PRs touching
  guarded files without the section.
- **F15. The daily diary is not daily, and its README promises a missing flag.** The newest snapshot is
  `reports/2026-10-02.json`; `status.html` says "2026-10-02 · generated 08:45 UTC". The lab's `README.md` 12-24
  presents the page as "what ORC is today". The same README also has two errors:
  - it documents `node tools/report.mjs --serve`, which `tools/report.mjs` does not implement ("nothing is served",
    line 13);
  - it says the full run takes "~10s", where the tool's own header says about two minutes (line 10).

  Patch 02 corrects the README. The schedule waits on #166.
- **F16. Machine contracts on prose and on ORC's internals fail silently.** All four checked:
  - `tools/collect.mjs`'s `friction()` (149-160) drops three of `FRICTION.md`'s 34 dated sections, the 21 Sep
    "night", "late" and "evening" ones, because its heading pattern does not match them. Checked by running the
    pattern on 2026-10-07.
  - `tools/map.mjs` 181-190 reads `STATE.md`'s `**Where we are now:** #N` line. It currently stars #193, which the
    same file says is live.
  - `tools/collect.mjs` 16 hard-codes ORC's state directory as `~/.local/share/orchestrator-proof`, and 124-133
    queries ORC's `events` and `tasks` tables. Nothing ties either to ORC's `src/runtime.ts` 190 or
    `src/adapters/async-store/sqlite.ts`. `FRICTION.md` line 360 records the two state directories confused for the
    third time.
  - Every reader returns null when its source is missing (`collect.mjs` 2-4), so a break shows as an empty section.
- **F17. The session-end entropy guard has no home.** It was kept on 4 Oct (`STATE.md` 49) and exists in neither
  repository: the lab's `skills/` holds a `.gitkeep`, and ORC has none. Neither `AGENTS.md` says what to do before
  handing off, beyond the lab's `STATE.md` overwrite. Q1.
- **F18. ORC sessions are never pointed at the lab's state.** ORC's `AGENTS.md` 3-12 sends agents to `README.md`, the
  architecture test and #140, but not to the lab's `STATE.md`, `decisions/` or `FRICTION.md`. The lab has
  `CLAUDE.md -> AGENTS.md`; ORC has no `CLAUDE.md`. Whether Claude Code loads ORC's `AGENTS.md` without one was not
  checked.
- **F19. A plan sits where only Claude can read it.** The authority-model plan is held only in a vendor-specific
  folder: `memory/authority-rules-step-1.md` line 5 cites `~/.claude/plans/agile-booping-waffle.md`. Codex, opencode
  and Astra also work here (`tools/map.mjs` 31, the reports), and cannot reach it.
- **F20. `SECURITY-REVIEW.md` restates the guarded list, narrower.** `SECURITY-REVIEW.md` 177-185 says which changes
  need a review, narrower than `dangerfile.js` `GUARDED` (11-26). It leaves out `config/`, `package.json`,
  `pnpm-lock.yaml`, `test/core-ties.ts` and two scripts. It mentions "a short exemption list", and `EXEMPT` is empty
  (line 29). The PR template already names `dangerfile.js` as the owner.
- **F21. `FRICTION.md`'s order and size.** `FRICTION.md` says "Newest first" (line 3), but its 11-19 Sep entries sit
  at the end in date order (lines 1153-1402). It has 1,402 lines and about 19,400 words. "FRICTION into rules,
  monthly (#60)" was kept on 4 Oct and has no runner.
- **F22. A raw transcript filed as a report.** `reports/2026-09-17-async-review-critical.md`, 69,750 words, is a raw
  agent transcript in JSON lines, filed as a Markdown report. It embeds a user-wide instructions file.

## 6. Ranked risks (decay rate × recovery cost)

1. **R1: `STATE.md` states wrong things with confidence (F1, F2, F16).**
   - Decay: fast. It is rewritten several times a day, and the 4 Oct file gained at least six appended live updates.
   - Recovery: high. Wrong claims reach Justin as answers about live services, such as "a morning's plan built on a
     restart that had not happened" (`FRICTION.md` 29 Sep).
   - Symptoms: the five contradictions in F1.
   - Anchor: `STATE.md` with the lab's `AGENTS.md` "Keeping state". Guard checks 1 and 3; patch 03.
2. **R2: Justin's decisions lost at the next overwrite (F3, F4, F5, F11).**
   - Decay: one rewrite away; trimming to the cap would drop the 4 Oct interview.
   - Recovery: high. A lost decision has to be asked again, or is silently reversed.
   - Anchor: the lab's `decisions/` (Q2). Guard check 2; patches 02 and 03.
3. **R3: ORC's boundary prose drifts from the enforced boundary (F8, F9, F10, F20).**
   - Decay: moderate; each new capability (#76 on 3 Oct, #101) moves it.
   - Recovery: high. Security reviews are written against `AGENTS.md`, and a gap such as the browser's Chromium
     launch is invisible to both the prose and the test.
   - Anchor: `test/architecture.test.ts` for what is enforced, and `AGENTS.md` for the rule. Guard check 4; patch 01;
     section 9.
4. **R4: Kept processes and verification that nothing runs (F13, F14, F15, F17, F21).**
   - Decay: continuous.
   - Recovery: moderate to high. A week of merges went without E2E; the diary is two days stale; the processes kept
     on 4 Oct have no runner.
   - Anchor: #144 and #166. Guard check 9; `integration.md`.
5. **R5: Superseded material and silent cross-repo contracts (F12, F16, F22).**
   - Decay: slow to moderate.
   - Recovery: moderate. Agents copy dead names (`FRICTION.md` 414), and the diary drops sections without saying so.
   - Anchor: ORC `AGENTS.md` "concise and retrospective"; `tools/collect.mjs`. Guard checks 5, 6 and 7; patch 01.

## 7. The lab as a docs-first member (docs-first Steps 2, 3 and 5)

### Truth map

| Document | Role | Notes |
|---|---|---|
| `SCOPE.md` | canonical: purpose, authority | purpose stale (F5) |
| `scope.yaml` | canonical: inventory, steward | duplicated by `SCOPE.md`'s project list (F6) |
| `AGENTS.md` (and `CLAUDE.md`, a symlink to it) | canonical: working conventions | decisions routed into `STATE.md` (F3); no hand-off step (F17) |
| `STATE.md` | current state | contradictory and over its cap (F1, F2); holds decisions (F3) |
| `decisions/` | canonical: decisions | one file, unlinked (F4, F11) |
| `memory/` | local elaboration: the relationship's facts | `authority-rules-step-1.md` is a decision record (F4, F19) |
| `FRICTION.md` | historical: learning log | read by `tools/collect.mjs` (F16, F21) |
| `AGENT_IDEAS.md` | exploratory: "prompts for a conversation, not approved designs" | fine as labelled |
| `reports/` (79 files), `research/` | historical; a few "of record" (`STATE.md` 96-99) | one raw transcript (F22) |
| `tools/*.mjs` | product artifact: the map, the diary and their readers | contracts with `STATE.md`, `FRICTION.md` and ORC (F16) |
| `status.html`, `reports/*.json` | generated projections | stale since 2 Oct (F15) |
| `skills/`, `workflows/` | empty placeholders (`.gitkeep`) | the guard's proposed home (Q1) |

### Loop map, as it runs

1. **Start.** The agent tool loads the lab's `AGENTS.md`; `CLAUDE.md` points to it. It says to read `STATE.md`, then
   `SCOPE.md`, then the map (#140). A session that starts in ORC loads ORC's `AGENTS.md` instead, which never reaches
   the lab's state (F18).
2. **Work.** Issues on #140 are marked with `node tools/map.mjs working`. Code changes go on ORC or Moving Stillness
   branches and worktrees, then into PRs.
3. **Pull request.** Danger checks for a Security review section and, when the package API report changes, a Package
   API section. Astra reviews; Claude merges once review and tests pass, with tests run by hand.
4. **Live.** ORC raises "Restart ORC onto <commit>"; Justin approves the card.
5. **Capture.**
   - `STATE.md` is rewritten at each verified event; in practice it is appended to (F1).
   - What broke goes to `FRICTION.md`; ideas go to `AGENT_IDEAS.md`, committed at once.
   - Reviews go to `reports/`; decisions go into `STATE.md` (F3).
6. **Hand-off.** `STATE.md`'s "Next" section, and `node tools/map.mjs stopped`. The diary (`tools/report.mjs`) is meant
   to run nightly and last ran on 2 Oct.

Follow-up gets lost in three places: in `STATE.md` rewrites, which drop decisions and follow-ups; in unfiled "map
follow-ups" (`STATE.md` 65-66); and across the ORC-to-lab boundary.

### State-file update

Patch 03 rewrites the existing `STATE.md` rather than adding a summary, and copies the STATE-only decisions to
`decisions/`.
- **Size.** 39 content lines, inside both conflicting caps (Q4); it leaves both cap texts unchanged.
- **What it holds.** The six required items:
  - the stage;
  - the documents to trust first;
  - decisions, linked to where they are recorded;
  - active fronts and open questions, including Q1-Q5;
  - misleading material nearby;
  - next actions.
- **Staleness.** It says what makes it stale and who rewrites it.
- **Live facts.** Each one is labelled "as recorded on 4 Oct: re-read before stating", with the file's latest value,
  and the contradiction resolved by the file's own timestamps. It keeps the `**Where we are now:** #193` line that
  `tools/map.mjs` reads.

## 8. Guard surfaces, by whether they execute

- **Runs by itself.**
  - Danger's Security review and Package API checks on every PR (`danger.yml`, `dangerfile.js`). I saw only the
    configuration; `STATE.md` 79-81 records that it ran on #179 and MS #49 on 2 Oct. It warns rather than blocks
    (F14). Keep.
  - ORC's restart and package-build cards, raised within a minute (`README.md` 123-129, `AGENTS.md` 134-136). These
    guard live state, not coherence.
- **Runs only by hand.**
  - `pnpm typecheck`, and `pnpm test`, which includes `test/architecture.test.ts`, the `test/core-ties.ts` ratchet,
    the package API report test and the source-header test.
  - `pnpm test:e2e`, `pnpm api:report`, `pnpm service:status` and `pnpm pi:check`.
  - In the lab, `node tools/map.mjs --check` and `node tools/report.mjs`.
  - The `SECURITY-REVIEW.md` checklist, prompted by Danger.
- **Decided, not built.**
  - Tests on every PR (#144).
  - Scheduled runs through ORC scheduling (#166): the diary, the weekly adversarial review, FRICTION into rules (#60),
    branch and worktree cleanup (#70), `/tmp` cleanup (#182).
  - The session-end entropy guard (4 Oct).
  - An independent read for grantable task types (#74), and approvals bound to builds (#137).
  - A hook that clears a session's map marks (`STATE.md` 65).
  - A tool-name test in Moving Stillness (MS #25, `FRICTION.md` 414-419; that repository was not covered).
- **Declared, but missing.**
  - The lab README's `--serve` (F15).
  - The session-end guard in either repository (F17).
  - Any check of `STATE.md`'s cap (F2).
  - `SECURITY-REVIEW.md`'s exemption list, which is empty (F20).
- **Unknown.**
  - Both repositories' `.githooks/pre-push`. Whether `core.hooksPath` points at them cannot be seen without `.git`.
    They only print `~/pro/local-config/scripts/push-summary` (outside this run) and never block.
  - User-level Claude Code hooks (`FRICTION.md` 29 Sep mentions a night hook).
  - GitHub branch protection.

## 9. Mechanical checks that belong to tools

Whether each tool is installed on athena was not checked; the draft guard depends on none of them.
- **ORC's own architecture test.**
  - Confine `import ... from "playwright"` to `src/adapters/browser/playwright.ts` (F9).
  - Assert that every `src/` or `test/` path named in `AGENTS.md`, `README.md` and `SECURITY-REVIEW.md` exists. It
    would have caught `src/bookwhen.ts`, and fits the suite's existing style (F8, F12).
  - Better still for lists: `AGENTS.md` states each rule and names the test that holds the list, so there is one
    home (patch 01 starts this for the tool surface).
- **The lab's tools.**
  - `tools/map.mjs --check` should fail when `STATE.md` has no parsable "Where we are now" line, or when it names a
    closed issue.
  - `tools/collect.mjs` should report dated `FRICTION.md` headings it could not parse, rather than drop them (F16).
- **A link checker** such as lychee, over both repositories' Markdown links, run in the job #144 creates.
- **An instruction-file linter** such as ctxlint or agnix, for the two `AGENTS.md` files. Optional.

## 10. Recommendations and one-time cleanup

**Consolidate.**
- `STATE.md`'s decisions go to `decisions/` (patch 03).
- `AGENTS.md`'s boundary lists defer to the architecture test (patch 01, then section 9).
- `SECURITY-REVIEW.md` 177-185 becomes a pointer to `dangerfile.js`'s `GUARDED` list (F20). Not patched: a small
  guarded-file edit, left for the same PR as patch 01 if wanted.
- One `STATE.md` cap (Q4).

**Demote or mark historical.**
- The eight ORC branch reports (patch 01; Q5 for moving them).
- The `idempotency` section of the 17 Sep record (patch 02).
- `reports/2026-09-17-async-review-critical.md`: mark it as a transcript, or remove it; git keeps it (F22).
- `MCP.md`'s dead paths sit in sections it already marks as history; leave them.

**One-time cleanup.** Each item was verified against the current file on 2026-10-07:

| Item | File and lines | Patch |
|---|---|---|
| Bookwhen client and token | ORC `README.md` 76-79; `AGENTS.md` 102-103 | 01 |
| External paths, writes, "deliberately absent" | ORC `README.md` 5-7, 145-147, 152-154 | 01 |
| Tool surface, subprocess modules, browser | ORC `AGENTS.md` 20-24, 92-96 | 01 |
| Historical banners | ORC's eight branch reports, line 2 | 01 |
| `--serve` and run times | lab `README.md` 16-22 | 02 |
| 4 Oct purpose | lab `SCOPE.md` 5-7 | 02 |
| Supersession note | lab `decisions/2026-09-17-async-work-architecture.md`, after line 5 | 02 |
| State rewrite and decisions copy | lab `STATE.md`; new `decisions/2026-10-04-decisions-recorded-in-state.md` | 03 |

Left as recommendations, not patched: F16's parsers and state directory, F19's plan location, F20, F21.

## 11. Is a guard needed? (Step 3) And the hand-on (Step 4)

**Yes, build one.** The system is active. Neither repository has a coherence guard. Justin kept "entropy guard at
session end" on 4 Oct, which authorises it, and R1, R2 and R5 are decided at session end. This is a new guard, not a
refinement. Handed to `session-coherence-skill-generator`:
- the intent section (section 1);
- the analysis (sections 3, 4, 5, 7 and 8);
- the ranked risks (section 6).

## 12. Generator report (`session-coherence-skill-generator`)

- **Mode: plan.** The targets are read-only, and the change spans two repositories. The skill's discuss-first
  default, the steward's absence and the read-only targets all point the same way, and the stricter mode wins. The
  guard was drafted, nothing was installed, and the guard is provisional on Q1 and Q2.
- **Inputs, all taken from this assessment.**
  - Steward and intent documents: section 1. Decision surface: the lab's `decisions/`, provisional on Q2. Open
    questions: Q1-Q5.
  - Current-state file: the lab's `STATE.md`, rewritten by the agent ending a session (lab `AGENTS.md` 33-36).
  - Rules owned elsewhere: user-wide `AGENTS.md`, `HOW_NOT_TO_PLAN.md`, `SECURITY-REVIEW.md` and `dangerfile.js`, and
    the 25 Sep merge rule. No spending policy was found in these snapshots; the user-wide file may hold one.
  - Verification commands, and which run by themselves: section 8, where only Danger does.
  - Code areas and their documents: section 4. Live state a session can change: ORC's running build, restart and
    build cards, grants, the Bookwhen test entry.
- **Draft.** `guard/SKILL.md`. Intended home: the lab's `skills/session-coherence-guard/SKILL.md` (Q1).
- **Size: 822 words, J = 9.** The budget is 450 + 36 × 9 + 84 (source pointers) + 32 (commands) = 890, so the draft is
  within it. J counts the template's two standard checks as well as the seven specific ones.
- **Each check, and the findings it answers:**

  | Check | Answers |
  |---|---|
  | 1. `STATE.md` claims agree, and live facts are dated | F1 |
  | 2. Decisions recorded in `decisions/` | F3, F4 |
  | 3. The "Where we are now" line | F16 |
  | 4. ORC boundaries against `AGENTS.md` and the test | F8, F9, F10 |
  | 5. Old names searched for | F8, F12 |
  | 6. The lab's tool contracts | F16 |
  | 7. New documents | F12, F22 |
  | 8. Two documents for one thing | F5, F6, F20 |
  | 9. Tests run by hand | F13 |

- **Review before handing over.**
  - The repair instructions follow intent-change rule v2, filled in for Justin, the intent documents and
    `decisions/`. None says "update both".
  - Every patch header names the open questions it touches. Patches 04 and 05 settle Q1 and Q2, so they are marked
    provisional.
  - The guard holds no build ids, task status or direction; it points at `STATE.md` and `decisions/`.
- **Operator docs.** The workflow is documented in the lab's `AGENTS.md` and ORC's `AGENTS.md`. Patches 04 and 05
  (provisional) add the pointers.
- **Validation.**
  - All five patches apply to copies of the snapshot files with `patch -p1`, the ORC pair in either order.
  - `git diff --no-index --check` finds no whitespace errors in the guard.
  - No repository commands were run: there is no checkout.
- **Files build mode would change:**
  - the lab's `skills/session-coherence-guard/SKILL.md`, new (Q1);
  - the lab's `AGENTS.md` (patch 04);
  - ORC's `AGENTS.md` (patch 05);
  - the lab's `STATE.md`, which the generator's step 1 updates (patch 03);
  - patches 01 and 02.
- **Open questions the guard leaves visible.**
  - Q1, its home: the draft comment.
  - Q2, its "Decisions" line.
  - Q3: it points at `HOW_NOT_TO_PLAN.md` as a rule owned elsewhere.
  - Q4: it encodes no number.
  - Q5: its new-document check works under any answer.
- **Handed to `guards-integrator`:** `integration.md`.

## 13. Next step

1. Justin answers Q1-Q5 (`questions.md`).
2. Apply patches 01-03. They are corrections; patch 01 goes through a PR with a Security review section.
3. On answers to Q1 and Q2, install the guard and apply patches 04 and 05. Then exercise the trigger once and ask a
   fresh session what it must do before handing off (`integration.md`, Adoption).

## 14. Uncertainties and what was not covered

- **No `.git`.** No commit history, hook configuration or branch state; the enacted reading rests on `STATE.md`,
  `FRICTION.md`, reports and code.
- **Not read: GitHub.** Not the issues, #140's rules, the PRs, the Project, or branch protection. Some STATE-only
  decisions may also be recorded on issues.
- **Not read: files the targets cite outside this run.**
  - `~/pro/local-config/home/AGENTS.md`;
  - `~/pro/agentic/HOW_NOT_TO_PLAN.md`;
  - `~/pro/scope/docs/MODEL.md`;
  - `pro/agentic/agentic-architecture/MODEL.md`;
  - `~/.claude/plans/agile-booping-waffle.md`;
  - `local-config`'s `push-summary`;
  - the Moving Stillness, Finance and Bookwhen ops repositories.
- **Not observed: live state.** No ORC service, build, card, grant or Bookwhen page was seen. Every live fact here
  dates from the 4 Oct file.
- **Sampled, not read in full.** The 79 report files (about ten read in part), `FRICTION.md` (header, structure, and the
  12, 22 and 26-29 Sep entries), and ORC's `src/` only where a document's claim pointed. `web/` was not reviewed. No
  test suite was run.
- **Not checked.** Whether Claude Code loads ORC's `AGENTS.md` without a `CLAUDE.md` (F18); whether `VISIBILITY.md`,
  `TURN-RECORD.md` and `GRANTS.md` are current (F12).
- **Proposal and decision.** Everything here is a proposal: the patches, the guard and the recommended answers. Only
  Justin's recorded decisions, copied with their sources, are decisions.
