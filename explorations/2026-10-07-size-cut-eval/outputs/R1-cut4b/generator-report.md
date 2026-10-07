# Generator report: session-coherence-skill-generator, plan mode

Finding ids refer to `assessment.md`; questions to `questions.md`.

## Mode

**Plan / suggest-only.** The targets are read-only, the guard spans two repositories (where discuss-first is the
default), and the steward is absent. So the guard is drafted here and nothing in the targets is edited. Its placement
is provisional on Q3.

## Inputs: supplied or found

All taken from the assessment. Nothing was rediscovered for the guard.

| Input | Where it came from | Complete? |
|---|---|---|
| Steward, intent documents, decision surface, open intent questions | assessment section 1; Q1–Q4 | yes |
| Current-state file, and who refreshes it | lab `STATE.md`, overwritten "at each verified event" (lab `AGENTS.md` 33), by the agent whose session caused it | yes |
| Rules bound but not owned | `~/pro/local-config/home/AGENTS.md`; ORC `SECURITY-REVIEW.md` and `dangerfile.js`; orchestrator#140's rules; the merge rule (Justin, 2026-09-25, in `decision-records.patch`) | partly: the user-wide file is outside the snapshot and was not read. No spending policy was found in the snapshot |
| Verification commands, and which run by themselves | assessment section 7: only Danger runs by itself | yes |
| Code areas and the docs and tests that describe them | assessment sections 3 and 5 (F6–F10, F14) | yes, for the boundary surface; `web/src/` was not mapped |
| Live state a session can change | `orc.service` (restart by card), durable work and grants, Bookwhen through Moving Stillness, ntfy, GitHub Project marks | yes; model-inference spend not assessed |
| Findings | F1–F20 | yes |

## The guard

- **Path:** `guard/SKILL.md` here. Proposed install path: the lab's `skills/session-coherence-guard/SKILL.md`
  (provisional, Q3).
- **Size: 912 words, J = 10.** Budget: 450 + 36 × 10 + S + C, where S is 68 words of source pointers and C is 42
  words of commands, so 920 words. The guard is within budget. Counting the template's generic two-documents line as
  an eleventh check would make the budget 956.
- **The ten checks, and the findings each answers:**
  1. Agent reach against the Boundaries and the architecture test: F7, F8, F9, F10, F12.
  2. "Deliberately absent" items need a decision: F10.
  3. Renamed settings, commands and paths searched in Markdown: F6, F13, F18.
  4. Names repeated in another repository: F14.
  5. Steward decisions recorded outside `STATE.md`: F4.
  6. `STATE.md` claims agree, live facts carry where and when, within the owner's cap: F1, F2, F3.
  7. Live only after the restart is read: F1.
  8. Map and marks: F17. (`node tools/map.mjs --check` is in the commands block.)
  9. `FRICTION.md` entry in date order: F15.
  10. Reports and memory say current or historical: F13, F18.
- **Commands block:** `pnpm typecheck`, `pnpm test`, `pnpm test:e2e` and `pnpm api:report` in ORC, because CI runs
  only Danger (F5); `node tools/map.mjs --check` in the lab.
- **Copied rule:** intent-change rule v2, with Justin, the intent documents and the decision surface filled in.

## Review before handing over (Step 4)

- **Patches against open questions.** Each patch header names the questions it touches. None changes the text a
  question is about. The one word changed in an intent document, "scheduling", is settled by Justin's 2026-09-17
  decision.
- **Repair instructions against authorised intent.**
  - The guard has no "update both" instruction. Its two-documents line reduces one copy to a link.
  - Check 1 was reworded during review. As first drafted ("do the Boundaries still name each?"), it would have led a
    session to add new reach to `AGENTS.md` to match the code. It now says to establish which is wrong first, and
    that new reach enters the Boundaries only after Justin's decision.
  - Check 6 points at "the cap its owner sets" and names no number, so it does not settle Q4.
- **Size against budget:** within, as above.

## Doc references added

None in the targets, which are read-only. In build mode these would change:

- the lab's `skills/session-coherence-guard/SKILL.md` (new);
- lab `AGENTS.md` and ORC `AGENTS.md`: a one-line pointer each (see `integration.md`);
- lab `STATE.md`: `state-update.patch` already says the draft guard waits on Q3 (generator Step 1).

## Validation run

- `git diff --no-index --check` on the guard and on every file the three patches produce: no whitespace errors.
- All three patches applied cleanly with `patch -p1` to copies of the snapshot files, in the order
  `decision-records.patch`, then `state-update.patch`, and separately `doc-corrections.patch`. The results matched the
  intended files byte for byte.
- Every path the new `STATE.md` links to exists, or is created by `decision-records.patch`.
- Not run: ORC's `pnpm typecheck` and `pnpm test`. The patches change only Markdown, and the snapshot has no
  installed dependencies.

## Open questions the guard leaves visible

- Q3 decides where it is installed.
- Q4 decides the number check 6 points at.
- Q1 and Q2 shape what check 2 asks for and what check 1 compares against.
- Q1, Q2 and Q4 are recorded as proposals P1–P3 in `decisions/2026-10-07-proposed-intent-changes.md`; Q3 is in
  `questions.md` only, since it is about placement, not intent.

## Handoff

To `guards-integrator`: the guard, the loop map (assessment section 4), the guard surfaces (section 7) and F5, F16,
F17 and F20. The brief is `integration.md`.
