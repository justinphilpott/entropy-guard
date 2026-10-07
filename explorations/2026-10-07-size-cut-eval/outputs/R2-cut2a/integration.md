# Integration brief: entropy-guard's refined local guard

From `guards-integrator`, after `session-coherence-skill-generator` refined `skills/local/entropy-guard/SKILL.md`
(draft at `guard/SKILL.md`). It reuses the assessment's loop map (`assessment.md` section 5) and refers to findings by
id. Snapshot `447da9a`, assessed 2026-10-07. The target is read-only and has no `.git`, so nothing here has been run
in the real repo.

What exists to build on:
- **CI and PR templates:** none (`.github/` is absent).
- **Hook framework:** none (no `.pre-commit-config.yaml`, no `.husky/`).
- **Tracked hook:** `.githooks/pre-commit`, executable. It prints the reminder and always exits 0.
- **Effective hooks path:** unknown, because the snapshot has no git config. A clone enables the hook only by the
  manual symlink that AGENTS.md line 19 and README.md line 140 describe.
- **Agent instructions:** AGENTS.md only.
- **Known pain:** forgetting to run the guard, which is why the hook was added (DECISIONS.md lines 31-35).

## Placement

- **`entropy-guard`**, at the end of a meaningful work session, before the commit that lands it:
  - **Actor:** the agent or person who did the work.
  - **Entry point:** AGENTS.md "Working Practices" (line 19) and "Key Files" (line 41), plus the reminder that
    `.githooks/pre-commit` prints.
  - **Output:** a line in the commit message; proposals for the steward in DECISIONS.md; the state and next action in
    TODO.md.
  - **Escalation:** a gap too large for the current change goes to TODO.md Next Up or Backlog. An intent disagreement
    becomes a DECISIONS.md proposal, and work that depends on it waits.
  - **Ordering:** it is the only guard. It reads its baseline from TODO.md "Doing Now" before that section is cleared.
    `entropy-guard-feedback` runs after it only when the session found a reusable problem with the skills (F15).

## Adoption

- **`entropy-guard`: planned, not verified.**
  - **Configuration evidence:** the hook file exists, is executable, and exits 0.
  - **Execution evidence:** none. No commit could be made and no git config could be read, and no fresh session was
    run against the repo.
  - **Why the guard is not installed yet:** it waits for Q1 and Q2. It names a steward and carries the intent-change
    rule, and both enact recommended answers.
- **Two checks that make it count as adopted, after install:**
  1. **The trigger fires.** In a working clone, read `git config core.hooksPath`, else `ls -l .git/hooks/pre-commit`,
     and record which is set. Then make a scratch commit on a throwaway branch and see the reminder print. The
     scratch commit needs the steward's go-ahead. Record the date and the output.
  2. **A fresh session finds it.** Start a session with no context in each harness seen here (Claude Code and
     OpenCode, from the `explorations/` frontmatter). Ask what it must do before handing off, and check that it names
     `skills/local/entropy-guard/SKILL.md` and the start commit in "Doing Now".

## Plan

- **Now, independent of the questions:** apply `cleanup.patch`, then `state-update.patch` (F6-F10, F13, F14).
- **Now, once Q1 and Q2 are answered:**
  - Copy `guard/SKILL.md` over `skills/local/entropy-guard/SKILL.md` and delete its provisional comment.
  - Apply `integration.patch`. It changes AGENTS.md line 22 so "Doing Now" records the start commit, which is the
    guard's baseline. It also stops TODO.md line 20 claiming the guard refers to `doc-health-check` (F12).
  - Then run the two adoption checks above (F11).
- **Next:** add the link check and the skill-name check (the guard's two `bash -c` commands) to `.githooks/pre-commit`
  as printed warnings, keeping `exit 0` per DECISIONS.md "Guard adoption should usually mature…". Both are stable
  invariants: 0 failures on the snapshot, and planted failures were caught (F16).
- **Later:** if mechanical checks are to run without anyone invoking them, that belongs to the guard-runner item
  already in TODO.md Backlog (line 18), not to new parallel work. There is no CI to move them into.

## Uncertain

- **Agent harnesses:** whether Claude Code and OpenCode sessions in this repo load AGENTS.md automatically was not
  checked. Adoption check 2 settles it.
- **Upstream branch:** the guard's fallback baseline `origin/main` is assumed. No git config was readable.
- **Pull requests:** whether work usually lands through them or by direct commits to main is unknown (LEARNINGS.md
  line 152 mentions a reviewed PR). If PRs are the norm, add a PR-description line naming the guard result as a second
  prompt.
