# Questions for the steward, Justin

No steward was available for this run, so each question carries the answer I recommend, and the run continued on
that recommendation. Work that depends on an answer is drafted only as a provisional patch
(`patches/provisional-Q<n>.patch`), never applied or enforced. Four questions; finding ids refer to `assessment.md`.

## Q1. Where are your decisions about ORC recorded?

- **The statements.** The lab's `SCOPE.md` (line 19) and `AGENTS.md` (line 16): facts about ORC belong in ORC's
  repository. Yet the one recorded ORC architecture decision, `decisions/2026-09-17-async-work-architecture.md`, sits
  in the lab, and ORC has no decision log. Your other ORC decisions sit in ORC's code comments as "the operator"
  (`src/adapters/scope-credentials.ts` line 14), in `dangerfile.js` (line 7), in `STATE.md`, and in report tables.
  Your 4 Oct decision makes the lab "the central Scope for project management, core issue tracking, code quality and
  security" (`STATE.md` line 39), which leans one way but does not say where decisions go. Findings F1, F2.
- **The readings.** (a) The lab's `decisions/` folder holds decisions about ORC as well as about the lab. (b) ORC gets
  its own decision log, and the lab's folder holds only lab decisions.
- **Where they diverge.** On 3 Oct you decided that orchestrator#194's preview keeps all six items. Today that lives
  only in `STATE.md` and will be lost at its next overwrite. Under (a) it is copied to the lab's `decisions/`; under (b)
  a new `DECISIONS.md` is made in ORC first. The session-end guard's "Decisions" pointer, and where it tells an agent to
  record a proposal about ORC, follow the same split.
- **Recommended: (a), the lab's `decisions/`, one dated file per decision in your words.** Reasons: your 4 Oct decision
  makes the lab the central Scope for project management; the precedent (17 Sep) is already there; and it keeps ORC
  free of owner-specific records, which matters for your open-source test (ORC `AGENTS.md` lines 30–37). A code comment
  quoting "the operator" would then name the record it comes from.

## Q2. Does a merged pull request count as your decision to widen one of ORC's boundaries?

- **The statements.** ORC `AGENTS.md` line 110: "Any new authority requires an explicit human choice." `AGENTS.md`
  lines 47–48 and `test/core-ties.ts` lines 6–7: a core-ties count "may only fall". Your delegation of 25 Sep: Claude
  merges a pull request once review and tests pass (`STATE.md` line 17). Findings F9, F10.
- **The readings.** (a) A merged pull request with a `## Security review` section is the explicit choice; the docs
  then only need to catch up. (b) It is not: a widening needs your own recorded word, and the merge delegation covers
  merging, not granting authority.
- **Where they diverge, in two real cases.**
  - `src/adapters/orc-service.ts` (orchestrator#101) may now launch git, `systemctl`, `pnpm install` and ORC's build;
    `test/architecture.test.ts` (lines 823–832) allows it, but `AGENTS.md` (lines 92–96) still lists three modules.
    Under (a), `AGENTS.md` is corrected now. Under (b), it waits for your word, and the widening is a proposal.
  - The Scope allowance for `config/installation.ts` in `test/core-ties.ts` rose from 28 to 51 (30 Sep), then to 64 and
    70 (2 Oct), to install agents (lines 41–48). Under (a), that stands. Under (b), you confirm it as an exception
    until Scopes load by card (orchestrator#152), or #152's work removes it.
- **Recommended: (b), with both cases put to you for confirmation now.** Reasons: `AGENTS.md` asks for a human choice,
  and the 25 Sep delegation is worded as a merge rule, not an authority rule; the test enforces the core-ties count
  exactly but not its direction, so nothing else stops a rise. The proposal record is drafted in
  `patches/provisional-Q2.patch`.

## Q3. Is `STATE.md` capped at forty content lines or sixty?

- **The statements.** The lab's `AGENTS.md` line 34: "capped at about forty content lines". `STATE.md` line 4:
  "Target: sixty lines". Neither is attributed. The 4 Oct file had 99 lines, 87 with content. Finding F4.
- **The readings.** (a) Forty content lines, with `AGENTS.md` the owner. (b) Sixty lines.
- **Where they diverge.** The state-file update in `patches/settled.patch` is 60 lines, 53 with content: within (b),
  over (a). The session-end guard checks the file against the cap.
- **Recommended: (b), sixty lines, stated once in `AGENTS.md` and linked from `STATE.md`.** Reason, derived from what
  the file must hold: a header and its staleness rule (5 lines), stage and the current front (6), what to trust and not
  (8), active fronts (10), waiting on you (13), live facts with their dates (7), next actions (3), plus headings: about
  55–60. At forty, the decisions waiting on you or the dated live facts would be cut.

## Q4. Which items in ORC README's "Deliberately absent" list still stand?

- **The statement.** ORC `README.md` lines 152–154, last edited 13 Sep: "Deliberately absent, and each requires a
  decision rather than a convenience: reminders, scheduling, additional external data sources, workflow execution,
  sandboxes, shell access, and file edits." Finding F7.
- **What is already settled.** "Scheduling" is contradicted by your decision of 17 Sep (`decisions/2026-09-17-async-
  work-architecture.md`: a task type declares `now`, `at` or `recurring`), and by the `schedules` table in ORC's store.
  "Workflow execution", "additional external data sources" and "reminders" are not plainly settled by any record.
- **The readings.** (a) The remaining items still stand as written. (b) Workflow execution is covered by the 17 Sep
  decision too, since it names "a rebuild every Friday at 22:00" and "a daily mentor report" as task types, and new
  external systems are decided one at a time through package approval cards and browser host grants.
- **Where they diverge.** A session that adds a scheduled task type running a Scope workflow, such as the Friday
  rebuild: under (a) the guard reports it as needing your decision; under (b) it is within what is authorised.
- **Recommended: (b) for workflow execution; keep reminders, sandboxes, shell access and file edits as absent; keep
  "each additional external system requires a decision", pointing to `AGENTS.md` for what ORC reaches today.** Reason:
  the 17 Sep decision names workflow-shaped task types explicitly. The text is drafted in
  `patches/provisional-Q4.patch`.

## Considered and not asked

- **"Consolidation" (26 Sep) against the work since** (finding F22). Your recorded 4 Oct decisions say what comes next
  (#166 first), so the guard can check against those without settling it.
- **The twelve root reports in ORC** (finding F15). Already put to you: `reports/2026-10-01-review-synthesis.md`, item
  7, "Small cleanups, on your word". One fact to add to it: `OPERATOR.md` is referenced by code.
