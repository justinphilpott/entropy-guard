# Integration brief: the entropy-guard repo's session-end guard

From `guards-integrator` 0.4.0, run on 2026-10-07 after `session-coherence-skill-generator` updated the guard
(`guard/SKILL.md`, for `skills/local/entropy-guard/SKILL.md`). Finding ids (F1–F16) and questions (Q1–Q5) are in
`assessment.md` and `questions.md`; the loop map is `assessment.md` section 5. Mode: plan, so nothing in the target
was changed or run except reading and the hand-run of the hook script noted below.

## Placement
- `entropy-guard` (`skills/local/entropy-guard/SKILL.md`): at the end of a meaningful work session, before the
  commit / the contributing agent or person / `AGENTS.md` "Working Practices" and "Key Files", plus the
  `.githooks/pre-commit` reminder at `git commit` / a one-line result in the commit message (`README.md` line 138);
  proposals to `DECISIONS.md`; the next action into `TODO.md` / a gap too large for this change goes to `TODO.md`
  Next Up or Backlog.
  - Ordering: the only guard. Run its three commands first (seconds), then the judgment checks.
  - Cost against trigger: twelve checks, most answered "no" in a typical session, plus three commands; `AGENTS.md`
    line 19 budgets 2–5 minutes, once per meaningful session rather than per trivial commit. That fits. The estimate
    is untested on the updated guard.
  - Why here: the session's decisions and learnings are freshest before the commit, and the commit message is where
    this repo already records the result. No pull-request or CI stage is documented to move it to.
- Depth of each check:
  - Links resolve, `SKILL.md` names match folders, whitespace: stable invariants (F16). Run inside the guard now;
    candidates for the hook next (Plan).
  - Every other check: judgment; External, prompted by the hook.

## Adoption
- `.githooks/pre-commit` reminder: reminder; `unknown`. Configuration evidence only: the file is tracked and
  executable, and when run by hand on 2026-10-07 it printed its three-line reminder and exited 0. Whether any clone
  enables it (`.git/hooks/pre-commit` linked, as `README.md` line 140 says, or `core.hooksPath`) cannot be read: the
  snapshot has no `.git`. Never seen firing at a commit.
- `entropy-guard` as updated (0.3.0): executed check; `planned`. Not applied (it waits on Q2) and never run at its
  trigger; this run could not commit.
- `entropy-guard` as it stands (0.2.3): executed check; `unknown`. Its results would be in commit messages; there is
  no history to read (F12).
- Discovery by a fresh agent: `verified` 2026-10-07, for the guard's path, which the update keeps. An agent with no
  context, asked to orient itself in the snapshot, read `README.md`, `TODO.md`, `AGENTS.md`, the hook and the guard,
  and named `skills/local/entropy-guard/SKILL.md` and clearing `TODO.md` "Doing Now" as what it must do before
  committing; it also said nothing is enforced at commit time. Only one way of loading instructions was tested (an
  agent reading files when asked); automatic loading of `AGENTS.md` by an agent runtime was not.
- The guard's three commands: the commands work, `verified` 2026-10-07 on the snapshot (49/49 links, 6/6 names), on
  the fully patched copy (52/52, 6/6), and against planted failures (a broken link and a mismatched `name`, both
  reported). As an adopted mechanism they are `planned`, because they run only when the guard runs.

## Plan
- Now: apply `patch-settled.diff` (F7, F8, F11(c), F12, F13).
- Now: answer Q1–Q5, listed in `TODO.md` "Current state" after the settled patch; then apply the matching parts of
  `patch-provisional.diff`, converting the two "Proposed" entries in `DECISIONS.md` into dated, attributed decisions.
- Now: after the guard is applied, run it once at the next session end and put its result in that commit's message;
  that run, not the reminder, is the adoption evidence (F11).
- Now: in each working clone, confirm the reminder is enabled (`ls -l .git/hooks/pre-commit` or `git config
  core.hooksPath`) and record the result in the same commit message (F12).
- Next: have `.githooks/pre-commit` also run the two stable checks (links, `SKILL.md` names) and print any problem,
  still exiting 0, as `DECISIONS.md` "Guard adoption should usually mature from external to prompted…" describes
  (F16). The judgment checks stay in the guard.
- Linked rather than restarted: `doc-health-check` (`TODO.md` Backlog), the guard runner (`TODO.md` Backlog), and the
  generator-ownership change (`DECISIONS.md` proposal, Q3).

## Uncertain
- Whether the hook is enabled in any clone: not checkable here.
- Whether agents in this repo load `AGENTS.md` automatically: not checked.
- Whether past commits carry the guard's result: no history.
- The 2–5 minute cost of the updated guard: estimated, not timed.
- Where pull requests sit in the loop: `LEARNINGS.md` line 152 mentions PR review, but no template or rule says when
  one is opened. If PRs are the habitual handoff, the guard's result could also go in the PR description.
