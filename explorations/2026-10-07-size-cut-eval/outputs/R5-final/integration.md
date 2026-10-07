# Integration brief: entropy-guard's session guard

From `skills/guards-integrator/SKILL.md`, 2026-10-07, plan mode. The guard is the draft in `guard/SKILL.md`, which
replaces `skills/local/entropy-guard/SKILL.md` in place. Finding ids (F1 to F16) refer to `assessment.md`; the loop
map is there too and is reused, not repeated.

## Placement
- `skills/local/entropy-guard/SKILL.md`: at the end of a meaningful work session, before commit (`AGENTS.md:19`) /
  the agent or person who did the work / `AGENTS.md` "Working Practices" and "Key Files", `README.md`
  "Contributing", and the `.githooks/pre-commit` reminder where enabled / the report, with one line in the commit
  message (`README.md:138`), the next action in `TODO.md` and proposals in `DECISIONS.md` / a gap too large for this
  change goes to `TODO.md` "Next Up" or "Backlog" / the only guard, so no ordering question.
- Cost against frequency: the guard is 1,197 words; most checks are trigger-gated and answer "no"; the two scripted
  checks took 0.11 s together on the snapshot's 17 markdown files (timed 2026-10-07 on a scratch copy). It fires once per meaningful session. That fits the loop.
  Not timed end to end: no real session was run.
- Trigger stays at session end. The hook fires at `git commit`, after the point where the guard should already have
  run; it is a late, cheap reminder, which is what `DECISIONS.md:31-35` chose. No change.

## Depth of each check
- Judgment checks (intent, decisions, learnings, workflow, one home, supersession, `TODO.md`): External, Prompted by
  `AGENTS.md:19` and the hook. Keep.
- Skill name matches folder, and relative links resolve (F16): scripted in the guard today, run by hand. These are
  stable invariants (`DECISIONS.md:79-83`; links), so they are the first candidates to embed.

## Adoption
- `.githooks/pre-commit` reminder: reminder. In a scratch copy of the snapshot, 2026-10-07: with no hook enabled, a
  commit printed nothing; after the symlink `README.md:140` describes, a commit printed the reminder and went through.
  Status for that mechanism: `verified` (scratch). Status in the steward's clone: `unknown`, because the snapshot has
  no `.git`, so `core.hooksPath` and `.git/hooks/` could not be read. That is configuration, not execution.
- Guard: executed check. `planned`. It has not run at its trigger. Evidence so far, 2026-10-07: in a scratch git copy
  with the draft installed, `git diff --check`, the name check and the link check all ran with zero hits; both
  scripted checks caught a deliberate break in a separate scratch repository. That is a test of its commands, not a
  guard report.
- A fresh agent finds it: `planned`. Configuration evidence only: `AGENTS.md:19` and `:41` name
  `skills/local/entropy-guard/SKILL.md`, and the update keeps that path. No agent-specific folders (`.claude/`,
  `.cursor/` and the like) exist in the snapshot, so `AGENTS.md` is the one instruction file. A clean fresh-session
  test was not possible here: any session started on this machine loads the live repository's own `AGENTS.md`.

## Plan
- Now: apply `guard/SKILL.md` over `skills/local/entropy-guard/SKILL.md` and the two patches in `patches/`, after
  the steward has seen `questions.md`. No change to `AGENTS.md` or `README.md` is needed for discovery: the path is
  unchanged.
- Now: at the next real session end, run the guard and keep its report in the commit message. That turns the guard's
  `planned` into `verified`. Then ask a session started without context what it must do before handing off.
- Next: put the two scripted checks into `.githooks/pre-commit`, printing hits and still exiting 0, so they run
  without being remembered (`DECISIONS.md:31-35`, External then Prompted then deeper). Remove them from the guard
  when they move, so they are not defined twice.
- Later: if the repo gains CI, move the same two checks there as failing checks.
- Linked to decisions rather than started: the guard-writer conflict (F4) waits for Q3; the intent repair path in
  `AGENTS.md:27` (F2) waits for Q2.

## Uncertain
- Whether the steward's clone has the hook enabled: not readable from the snapshot.
- How long the updated guard takes in a real session: not measured.
