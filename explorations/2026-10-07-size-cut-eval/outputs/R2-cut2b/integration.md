# Integration brief: entropy-guard's local guard

From `guards-integrator`, run after `session-coherence-skill-generator` refined `skills/local/entropy-guard/SKILL.md`
(the draft is in `guard/SKILL.md`). Finding ids (F1 to F18) refer to `assessment.md`. Mode: plan only. The target is a
read-only snapshot with no `.git`, so nothing here was exercised.

## Loop map (reused from the assessment)

- **Change starts in:** an agent or human session. The agent reads `AGENTS.md` and writes its task into `TODO.md`
  "Doing Now" (`AGENTS.md:22`).
- **Handoff:** a local commit. Pull requests are used at least sometimes: `LEARNINGS.md:152` mentions review feedback
  on the `guards-integrator` PR.
- **Pause point:** before commit. The guard runs here, prompted by `.githooks/pre-commit` if a contributor enabled it
  by symlink (`README.md:140`).
- **Not present:** CI, a PR template, or a hook framework.
- **Also outside the repo:** GitHub issues on `justinphilpott/entropy-guard`, label `agent-feedback`, which agents
  file from assessments of other repos.

## Placement

The guard is the refined `skills/local/entropy-guard/SKILL.md`, the repo's only guard.

- **Trigger:** end of a meaningful session, before commit. This is the latest moment that still catches drift
  cheaply: decisions are fresh, and nothing has been committed yet.
- **Actor:** whoever did the work, agent or human.
- **Entry point:** three places name the guard's path today, so none needs adding:
  - `AGENTS.md:19` (Working Practices) and `AGENTS.md:41` (Key Files);
  - `README.md:137` (Contributing);
  - the reminder printed by `.githooks/pre-commit`.
- **Output:** one note in the commit message, "entropy check clean" or what changed. Proposals for the steward go to
  `DECISIONS.md`, the next action goes to `TODO.md`.
- **Escalation:**
  - a gap too large for this change goes to `TODO.md` "Next Up";
  - an undecided intent change goes to `DECISIONS.md` as a proposal awaiting Justin Philpott (F3).
- **Ordering:** it is the only guard. Its link check runs inside it.
- **Re-evaluation:** `INTENT.md:82` says to re-evaluate "periodically", and nothing triggers that (F13). Guard check 3
  now adds "re-evaluate the local guard" to `TODO.md` whenever a skill is added or removed. That makes the trigger an
  event: had it existed, the arrival of `session-coherence-skill-generator` would have fired it.
- **Install condition:** do not install until Q1 is answered (`questions.md`), because the guard's Intent section
  carries the recommended answer.

## Depth of each check

These follow the recorded decision in `DECISIONS.md:31-35` (judgment-heavy guards go from external to prompted
before any deeper automation).

- **Checks 1 to 6, 8 and 9:** stay in the guard, as judgment.
- **Link check and `git diff --check` (check 7):** the guard runs them by hand today. They are stable invariants, so
  they are candidates for the hook (see Next).
- **Prompt:** the existing non-blocking hook, which keeps `exit 0`.
- **No CI step:** the repo has no CI to put one in.

## Adoption

The guard counts as **planned, not verified**. Neither adoption test could be run here.

**Its trigger has fired once:** unknown.

- Configuration evidence: `.githooks/pre-commit` exists, prints a reminder that names the guard's path, and exits 0.
- Enabling it takes a manual symlink (`README.md:140`).
- The snapshot has no `.git`, so neither `git config core.hooksPath` nor `.git/hooks/` could be read.
- There is no execution evidence that the hook or the guard ever ran. No commit messages were available.

**A fresh agent session finds it:** not tested.

- Configuration evidence: `AGENTS.md` names the guard twice.
- `AGENTS.md` is the only agent instruction file in the repo. The transcripts in `explorations/` show both Claude
  (Sonnet 4.6) and OpenCode (gpt-5.4) sessions. Whether each of those tools loads `AGENTS.md` by itself is not
  established here.

Steps for the steward, in a real clone:

1. Run `git config core.hooksPath` and `ls -l .git/hooks/pre-commit`. This only shows the configuration.
2. Make a commit on a scratch branch and check the reminder prints. This shows the hook running.
3. In each agent tool you use, ask a session with no context "what must you do before committing in this repo?",
   and record whether it names `skills/local/entropy-guard/SKILL.md`.

## Plan

**Now**, with what exists:

- Apply `decisions.patch`, `cleanup.patch` and `state-file.patch`. They settle no open question (F7, F8, F9, F15, F18).
- Answer Q1 to Q3.
- Once Q1 is answered, replace `skills/local/entropy-guard/SKILL.md` with `guard/SKILL.md` (F3, F4, F14, F17), and
  update the backlog line at `TODO.md:20`, which `state-file.patch` lists as a Next Up item.

**Next**, light prompting:

- Change the enabling instruction at `README.md:140` from a symlink to `git config core.hooksPath .githooks`, so any
  hook added later takes effect without re-linking.
- Have `.githooks/pre-commit` print the guard's link check, still exiting 0. Links are a stable invariant (F12, F14).
- Both are proposals. They touch no open question.

**Later:** nothing is justified yet.

- No CI, scheduler or schema exists to move checks into.
- The guard runner is already tracked at `TODO.md:18`. Link to it rather than starting parallel work.
- If missed guard runs are ever shown, a commit-msg hook that looks for the guard note is where enforcement would sit
  (F12).

## Uncertain

- Whether the hook is enabled in any clone: not checked, because the snapshot has no `.git`.
- Whether agents in use load `AGENTS.md` automatically: not checked.
- Whether the guard has been run since 2026-04-07: unknown, because no commit history was available.
- What the GitHub issues track: not inspected, because no web access was allowed in this run.
