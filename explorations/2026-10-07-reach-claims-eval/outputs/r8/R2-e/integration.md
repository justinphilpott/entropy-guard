# Integration brief: entropy-guard's local guard

For the updated guard `guard/SKILL.md`, which replaces `skills/local/entropy-guard/SKILL.md` in place once the steward
answers Q1 (`provisional-Q1.patch`). Until then, the existing guard stays, improved by `settled.patch`. Finding ids
refer to `assessment.md`. Written 2026-10-07 in plan mode: the target is a read-only snapshot with no `.git`, so
nothing here was installed or exercised in the target.

## Loop as it is

- **Smallest unit of change:** a work session ending in a local commit. A pull request was used at least once
  (LEARNINGS.md line 152); there is no PR template and no CI.
- **Habitual pause:** none observable. The documented pause is the guard before commit (AGENTS.md line 19). Whether it
  happens cannot be seen without history (F9).
- **Where follow-up gets lost:** decisions and learnings made mid-session (the guard's own reason for checks 4-5), and
  the guard result itself. The reminder fires inside `git commit`, after a `-m` message is fixed, and lets the commit
  land (F10).

## Placement

- **`entropy-guard`** (`skills/local/entropy-guard/SKILL.md`):
  - **Trigger:** at the end of a meaningful work session, **before `git commit` is typed**, since its one-line result
    goes in the commit message (README.md line 138). The latest cheap moment is before the message is written, not
    pre-commit.
  - **Actor:** the agent or person who did the session.
  - **Entry point:** AGENTS.md "Working Practices" (line 19, and line 22 once `settled.patch` adds the ordering);
    README.md "Contributing" step 3; the hook's reminder as a backstop.
  - **Output:** one line in the commit message ("entropy check clean" or what changed); proposals for the steward in
    DECISIONS.md; the next action in TODO.md.
  - **Escalation:** a gap too large for this change goes to TODO.md Next Up or Backlog (the old guard's line 138
    practice, kept by the new guard's report to TODO.md).
  - **Ordering:** the only guard. Run it after the work and before deriving the commit message from "Doing Now" and
    clearing it (AGENTS.md line 22, as patched).
- **Cost against frequency:** AGENTS.md line 19 puts it at 2-5 minutes, once per meaningful commit. Most of its 11
  checks are conditional and say "nothing to do" for a typical session. Its link and name checks took 0.04 s on the
  patched copy (2026-10-07); `git diff --check` could not be timed without `.git`. It fits the loop.

## Depth of each check

- **Judgment checks** (Intent, checks 1-11): External, in the skill, and Prompted, through AGENTS.md and the hook. This
  is the decided maturity path (DECISIONS.md lines 31-35).
- **Link check and skill-name check:** stable invariants (a link resolves; DECISIONS.md "Skill format" requires a skill's
  name to match its folder), so they can move into tooling (Next).
- **Keep as judgment:** anything keyed to wording, such as the supersession list in check 7 or the section names in
  checks 1-2. These churn with the docs (docs-first matrix, "Brittle automation").

## Adoption

| Mechanism | Kind | Status | Evidence | Date |
|---|---|---|---|---|
| `.githooks/pre-commit` reminder | reminder | unknown | Configuration only: the file exists and exits 0. Enabling it needs a symlink into `.git/hooks/` (README.md line 140); the snapshot has no `.git`, so the effective hooks path (`git config core.hooksPath`, else `.git/hooks/`) could not be read, and it was never seen to fire | 2026-10-07 |
| Existing guard, run at commit | executed check | unknown | No commit history, so no guard result can be seen. Guard line 21 records an evaluation of the guard on 2026-04-07, not a run | 2026-10-07 |
| Updated guard (`guard/SKILL.md`) | executed check | planned | Not installed: provisional on Q1, and the target is read-only | 2026-10-07 |
| Guard's three commands | executed check | planned | The commands themselves were verified on scratch copies, not the target's loop: clean on the original and patched trees, and a planted broken link and name mismatch were both reported | 2026-10-07 |
| Fresh agent finds the guard | discovery | unknown | Configuration only: AGENTS.md lines 19 and 41 name `skills/local/entropy-guard/SKILL.md`, the path exists, and the update keeps it. No context-free session was asked: in this harness a new session preloads another entropy-guard repository's instructions, which name the same path, so its answer could not show what the target's AGENTS.md alone achieves | 2026-10-07 |

## Plan

- **Now:**
  - Apply `settled.patch`. Its AGENTS.md line 22 hunk puts the guard before the commit message (F10).
  - In the working clone, check the reminder is enabled: `git config core.hooksPath`, then
    `ls -l .git/hooks/pre-commit`. If neither points at `.githooks/pre-commit`, enable it as README.md line 140 says.
    `git config core.hooksPath .githooks` is an alternative that picks up future tracked hooks without one symlink each.
    That is a choice for the steward, not a correction.
  - After the steward answers Q1, apply `provisional-Q1.patch` (it installs the updated guard). If the answer is (a),
    adjust the guard's "Open" line instead (see `questions.md`).
  - Verify adoption at the next meaningful commit:
    - the guard's report lands in the commit message;
    - the reminder is seen firing;
    - a session started without other entropy-guard instructions loaded is asked what it must do before handing off,
      and its answer is recorded.
- **Next:**
  - Add the link check and the skill-name check to `.githooks/pre-commit` as warnings that keep `exit 0`. This follows
    the External → Prompted path the repo decided (DECISIONS.md lines 31-35), and both are stable invariants (F11).
  - Keep the hook's existing reminder text. It mentions TODO.md "Doing Now", which is a summary of AGENTS.md line 22;
    keep it correct.
- **Later:**
  - If the repo gains CI, move the two checks there.
  - The guard runner is already tracked in TODO.md Backlog line 18; link to it rather than starting parallel work.

## Uncertain

- Whether this repo's agents load `skills/` automatically, or only follow AGENTS.md's pointer: not checked.
- Whether contributors commit with `-m` (F10 assumes the agent form) or through an editor, where the reminder appears
  before the message is written: unknown without history.
- Whether issues filed by the feedback helper (F17) ever reach the steward's review before posting: the helper and
  DECISIONS.md lines 63-67 let an agent file them directly. That is decided, so it is noted, not changed.

## Feedback on entropy-guard

Notes on the skills that ran are in `feedback.md`.
