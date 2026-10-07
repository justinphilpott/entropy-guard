# Integration brief: entropy-guard (snapshot 447da9a, 2026-10-04)

This brief was produced with `skills/guards-integrator/SKILL.md` v0.2.2. The docs-first assessment hands off to it because this loop has more than one actor and more than one handoff point.

The guards and artifacts it places:

- **The refined local guard**, `guard/SKILL.md`. It replaces `skills/local/entropy-guard/SKILL.md` in place.
- **The current-state packet**, `current-state-packet.md`. Its recommended home is `CURRENT_STATE.md`.
- **The re-evaluation run**, meaning `entropy-assessment` re-run against this repository.
- **Upstream feedback**, filed through `skills/local/entropy-guard-feedback/`.

## Loop map

The snapshot has no `.git` directory, so this map is built from the documents and the evidence they cite:

- **Change starts in** a human or AI session working directly in the repository. Named contributors include Justin, Claude Sonnet 4.6 and OpenCode (gpt-5.4). `AGENTS.md` holds the standing instructions.
- **Session start**: `AGENTS.md` Quick Links (README, INTENT, PHILOSOPHY, TODO, DECISIONS, LEARNINGS, all with equal status). The contributor writes `TODO.md` "Doing Now" before starting work.
- **Coherence pause**: the local guard, run at session end before committing.
- **First handoff**: a local commit. `.githooks/pre-commit` prints a reminder and never blocks. It is enabled per clone by a manual symlink.
- **Second handoff, sometimes**: pull request review. `LEARNINGS.md` line 152 cites review feedback on the guards-integrator pull request.
- **Feedback loop**: GitHub issues on `justinphilpott/entropy-guard`. Issues #9-#12 drove the last restructure.
- **Re-evaluation**: ad hoc dogfooding runs of `entropy-assessment` against this repository. The last one was 2026-04-07.
- **Automated gate**: none. There is no CI and there are no scripts.
- **Coming next**: an outer loop. Assess an external repository, generate a guard there, record the result, then feed back into the skills here.

## Guard placement

- **`entropy-guard` (the refined local guard)** runs at session end or before commit.
  - Who: whoever made the change, human or agent.
  - Why here: it is the one stable, low-burden handoff (the `DECISIONS.md` entry "Keep a single local guard…"), and the context is freshest at that point.
- **`CURRENT_STATE.md`** is read first at session start and refreshed by guard check 10 at session end.
  - Who: the session that is starting reads it; the session that is ending refreshes it.
  - Why here: the `LEARNINGS.md` entry "Docs-first planning repos need session-start orientation…" says drift starts from reading the wrong truth surface.
- **The re-evaluation run** (`entropy-assessment` re-run against this repository) is triggered by an event, not a calendar. Run it when an exportable skill is added, removed or changes role, and after any validation-batch run that files feedback against a skill.
  - Who: the maintainer, or an agent asked to do it.
  - Why here: the guard's last evaluation (2026-04-07) predates the session-coherence generator (generated 2026-05-10). That generator then sat outside the router and the lifecycle until this run found it.
- **Upstream feedback** is filed at the end of each external assessment in the validation batch.
  - Who: the agent running that assessment.
  - Output: a GitHub issue, plus its number in the validation-results record.
- **The mechanical sub-check script** (the Next stage, below) runs from the pre-commit hook. It never blocks.

## Adoption plan

**Now**, using only existing workflow primitives:

- Replace `skills/local/entropy-guard/SKILL.md` with `guard/SKILL.md`.
- Paste bootstrap items B1-B9 from `assessment.md` into `TODO.md` "Next Up". Completion is tracked there, never in the guard file.
- Once Q6 is answered, create `CURRENT_STATE.md` from `current-state-packet.md`. Make it the first `AGENTS.md` Quick Link, and add one Working Practices line: "Session start: read CURRENT_STATE.md before the rest of the docs."
- Add "Read CURRENT_STATE.md" as step 0 of `README.md` Contributing.
- Keep the hook as it is. This repository already sits at Prompted depth for the guard.

**Next**, to reduce reliance on memory:

- Add one line to `.githooks/pre-commit`: "If the stage or active work changed, refresh CURRENT_STATE.md."
- Replace the manual symlink instruction with one command per clone, `git config core.hooksPath .githooks`. Put it in `README.md` Contributing and `AGENTS.md`, so the reminder is not lost in fresh clones.
- Add a non-blocking check, called by the hook, that prints warnings and always exits 0. It checks three things, each of them a rule that rarely changes:
  - Every relative markdown link resolves. On 2026-10-04 every link resolved: 0 broken outside `explorations/`.
  - Every `skills/**/SKILL.md` has a frontmatter `name` equal to its directory.
  - Every skill directory appears in both the `README.md` "What's here" tables and the `AGENTS.md` Key Files list.

  Use an existing markdown link checker for the first of these rather than writing one, if one is available on the contributors' machines.

**Later**:

- Run the same check as a CI job on pull requests, once pull requests become the usual handoff or an outside contributor appears.
- Build a guard runner (`TODO.md` backlog) only if this repository gains a second local guard.
- Add a check that new `DECISIONS.md` entries carry a Date line, once dates are adopted.

## Discovery plan

- **`AGENTS.md`**: `CURRENT_STATE.md` becomes the first Quick Link. Working Practices already names the guard and stays as it is.
- **`README.md` Contributing**: add step 0, "read CURRENT_STATE.md". Step 3 already names the guard.
- **`.githooks/pre-commit`**: the message already names the guard's path.
- **`CURRENT_STATE.md`**: lists the nearby superseded material, so a fresh agent meets the warnings before the stale documents.

## Execution plan

- **Order at session end**: run checks 1 to 9 of the guard in sequence, then check 10 last, because current state summarises what the others changed.
- **In parallel**: the mechanical script (Next) runs independently of the narrative checks.
- **Output**: one line in the commit message, either "entropy check: <what was updated>" or "entropy check clean". Name workflow drift, or a skill whose role or decided behaviour had drifted, when that was the cause.
- **Escalation**: some gaps are too large for one session. Examples are a concept with two canonical homes, or a skill whose role is unclear. Record such a gap in `TODO.md` "Next Up" as a decision for the steward, and do not reconcile the wording during the session.

## Automation opportunities

| Check | Move to tooling? | When |
|---|---|---|
| Relative links resolve (guard check 7) | Yes. This rule rarely changes. | Next |
| Frontmatter `name` equals the directory (check 3) | Yes. It is fixed by the agentskills.io decision. | Next |
| Every skill directory is listed in README and AGENTS (check 6) | Yes. Skill directory names rarely change. | Next |
| New `DECISIONS.md` entries have a Date line (check 1) | Yes, once adopted | Later |
| Router names every exportable skill (check 3) | No. It depends on prose wording. | Keep narrative |
| Every exportable skill ends with a feedback check (check 3) | No. Headings vary today ("Upstream Feedback Check" in some skills, "Step 7: Capture upstream feedback…" in another). | Keep narrative |
| Supersession, canonical ownership, tactical versus theory (checks 1, 2, 5, 7) | No. These need judgment. | Never |

## Risks / uncertainties

- **The loop is inferred.** It is not certain that the guard runs on most commits, or that the hook is enabled in each clone and agent worktree. After 3 real sessions, check whether the commit messages carry an entropy-check line.
- **The guard grew from 9 checks to 10.** Time the next 3 runs. If they go past 5 minutes, merge check 8 into check 7.
- **`CURRENT_STATE.md` is a new state artifact and can itself go stale.** Its only refresh trigger is guard check 10. If two sessions in a row leave it stale, the hook line in the Next stage becomes the priority.
- **Multi-vendor discovery is unverified.** I have not checked that every agent tool used here loads `AGENTS.md` automatically. If one does not, its wrapper prompt needs a line naming `CURRENT_STATE.md` and the guard.
- **This plan assumes Q1, Q5 and Q6 are answered as recommended** in `questions.md`.

## Upstream feedback on guards-integrator (Step 7)

Yes, two items, written out in `feedback.md`:

- **F1**: lines 20 and 227 still treat `entropy-assessment` as the guard generator.
- **F4**: the cold-start evidence list does not name a tracked hooks folder such as `.githooks/`. I found this repository's hook only because `README.md` names it.
