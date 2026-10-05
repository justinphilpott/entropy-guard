# Integration brief: entropy-guard local guard

- **Produced by:** `guards-integrator` v0.3.0, for the guard drafted in `guard/SKILL.md`.
- **Where the guard goes:** it replaces `skills/local/entropy-guard/SKILL.md` in the target.
- **Target:** the snapshot `entropy-guard-447da9a`, read 2026-10-04. It is read-only, so nothing here has been placed
  in the real repo.
- **Verification:** everything described as exercised ran in scratch copies under `scratch/`.

## Loop map

- **Change starts in:** a human or AI-agent session in a local clone or worktree. `AGENTS.md` is the entry point, and
  `TODO.md` "Doing Now" records the task.
- **First handoff:** a local commit. This is the guard's trigger. The reminder hook fires on `pre-commit` only where it
  is enabled.
- **Second handoff:** push, sometimes followed by a PR on GitHub (`LEARNINGS.md` line 152). There is no PR template
  and no CODEOWNERS.
- **Automated gate:** none. There is no `.github/workflows/` and no other CI.
- **Final handoff:** merge to `main`.
- **Outward loop:** consumer repos run the exported skills, and their feedback comes back as GitHub issues labelled
  `agent-feedback`.
- **Which declared mechanisms actually run** (verified 2026-10-04, `scratch/hook-verification.log`):

  | Case | How the hook was enabled | Result |
  |---|---|---|
  | A | `README.md` line 140 followed literally: `ln -s .githooks/pre-commit .git/hooks/pre-commit` | Broken symlink. The commit landed with no reminder and no warning |
  | B | `ln -s ../../.githooks/pre-commit .git/hooks/pre-commit` | Reminder fired |
  | C | `git config core.hooksPath .githooks` | Reminder fired |
  | D | Fresh clone of an enabled repo | `core.hooksPath` unset, no hook. Off by default |

## Guard placement

- **`entropy-guard`, refined:**
  - **Trigger:** the end of a meaningful session, before commit.
  - **Actor:** the agent or person who did the work.
  - **Why here:** the repo has one stable handoff, the commit, and decisions are freshest at that point. This agrees
    with the existing decision "Keep a single local guard" (`DECISIONS.md` lines 55-59).
  - **Entry point:** `AGENTS.md` "Working Practices" line 19, `README.md` "Contributing", and the hook message, which
    names the path.
  - **Output:** a commit-message line, plus updates to `TODO.md` and `DECISIONS.md`.
  - **Escalation:**
    - a gap too large to fix now goes to `TODO.md` "Backlog";
    - an intent disagreement becomes a `Proposed:` entry in `DECISIONS.md` for Justin Philpott (provisional, Q1 and
      Q2);
    - a defect in the exported skills goes through `skills/local/entropy-guard-feedback/` only when a skill's
      feedback check calls for it.
- **The guard's mechanical sub-checks** (links, skill names, whitespace, hook active):
  - They run inside the guard now and take about one second.
  - They are candidates for the hook and for CI later, because they encode durable invariants rather than wording.
- **Re-assessment, the evaluator role:** run `skills/entropy-assessment/SKILL.md` on this repo when the exported skill
  set changes shape, meaning a skill is added, removed or renamed, or a handoff between skills changes. That makes
  `INTENT.md` line 82's "periodically" concrete. It is stated at the end of the guard.

## Adoption plan

- **Now** (existing primitives only):
  1. Install `guard/SKILL.md` at `skills/local/entropy-guard/SKILL.md`.
  2. Apply `operator-docs.patch`, so `README.md` and `AGENTS.md` give `git config core.hooksPath .githooks`.
  3. Apply `current-state-update.patch`, so sessions start from `TODO.md` "Current state".
  4. Run `git config core.hooksPath .githooks` in each existing clone and worktree. The guard's last mechanical check
     reports any clone where this was missed.
- **Next** (light automation, still non-blocking):
  - Extend `.githooks/pre-commit` to run the guard's link and skill-name checks and print any findings, still with
    `exit 0`. This follows the repo's external-to-prompted path (`DECISIONS.md` lines 31-35).
  - Replace the hand-written link loop with the maintained `lychee` once it is installed:
    `lychee --offline --no-progress '**/*.md'`. It is not installed on the machine this run used.
- **Later:**
  - A GitHub Actions workflow that runs `lychee --offline` and the skill-name check on pull requests.
  - A linter for agent instruction files covering `AGENTS.md`, such as ctxlint or agnix. Not evaluated here.
  - The guard runner from `TODO.md` line 18, if more than one guard appears.

## Adoption status

- **`entropy-guard` (refined) is a reminder. Status: planned.**
  - Exercised 2026-10-04 in scratch copies only:
    - the reminder fired on commit with `core.hooksPath` (case C) and with the corrected symlink (case B);
    - it did not fire through the README's literal instruction (case A), and it is off in a fresh clone (case D).
  - **A fresh agent session found it.** A new agent was started with no context in `scratch/caseE`, a copy of the
    snapshot with the refined guard installed. Asked what it must do before committing, it named
    `skills/local/entropy-guard/SKILL.md` and cited `AGENTS.md` "Working Practices" line 19 and `README.md`
    "Contributing" line 137.
  - **Not exercised:** a commit in the real repository, because the target is read-only.
- **Mechanical sub-checks are a check that runs. Status: planned.**
  - Exercised 2026-10-04 (`scratch/guard-command-verification.log`): clean on the snapshot under bash, sh and zsh.
  - They caught a deliberately renamed `PHILOSOPHY.md` (3 broken links) and a deliberately mismatched skill name.
- **No enforced invariant exists or is proposed.** The judgment checks cannot be enforced, and a git hook cannot be
  forced on a clone.

## Discovery plan

- Keep the existing pointers: `AGENTS.md` line 19 ("Working Practices"), `AGENTS.md` line 41 ("Key Files"),
  `README.md` line 78 ("Adapt the project's own guard") and line 137 ("Contributing"), and the hook message.
- Change only the enable command (`operator-docs.patch`). Then a fresh agent that follows `AGENTS.md` both finds the
  guard and can switch on the reminder correctly.
- The guard opens by sending the reader to `TODO.md` "Current state", which ties the start-of-session file to the
  end-of-session check.

## Execution plan

- **Order:**
  1. The what-changed commands.
  2. The mechanical checks, in seconds.
  3. The Intent section.
  4. Judgment checks 1-8, in order.
  5. The report, then the commit-message line, then the `TODO.md` next action.
- **Can run in parallel:** the mechanical checks while `TODO.md` "Current state" is being read. The judgment checks
  depend on knowing what changed, so they run in sequence after it.
- **Outputs:**
  - the commit-message line ("entropy check clean", or what it surfaced);
  - `Proposed:` entries in `DECISIONS.md`;
  - updates to `TODO.md`;
  - issue URLs, if the feedback helper was used.

## Automation opportunities

- **Link integrity and skill-name check:** move from manual to the hook now (non-blocking), then to CI once a workflow
  exists. These are stable invariants.
- **Hook enabled:** this cannot move into the repo, because git never clones hook configuration. The guard's own
  check is the most that can be done.
- **Commit-message "entropy check" line:** a `commit-msg` hook could test that the line is present. Not recommended:
  it would reward typing "entropy check clean" without running the guard.
- **Prose references** (skill names, "Step N", table names): keep them as judgment. They encode wording that changes
  faster than a script could be maintained, as the integrator's docs-first caution warns.

## Risks and uncertainties

- The loop map is inferred from the docs. There is no git history, and PR frequency rests on one mention.
- It is unknown whether the steward's real clones have the hook enabled. The guard's check will show it at the first
  run.
- The guard's Intent section and decision check rest on the recommended answers to Q1 and Q2. If Justin chooses
  reading (a) for Q1, steps 3-4 of the guard's intent rule must be rewritten through the generator.
- The burden is close to the 2-5 minute limit: 8 judgment checks, compared with 9 before. Re-time it after three
  real runs.

## Upstream feedback on entropy-guard

Yes: three notes, in `upstream-feedback.md`. The one about the integrator's own workflow is note 2, about the guard
surfaces being classified twice on route A. The feedback helper needs `gh` and the web, which this run did not have,
so the notes are left formatted for manual submission.
