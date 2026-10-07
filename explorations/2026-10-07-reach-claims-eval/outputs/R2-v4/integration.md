# Integration brief: the refined `entropy-guard`

From `guards-integrator`. Finding ids (F1 and so on) and questions (Q1 to Q3) refer to `assessment.md` and
`questions.md`. Mode: plan only. Nothing was installed, committed or run in the target.

## Loop map

The loop map is section 5 of `assessment.md`. In short:

- Change starts in an agent or human session that loads `AGENTS.md`.
- First handoff: a local commit, with a non-blocking reminder hook if the clone has enabled it (unknown).
- Second handoff: a pull request, sometimes.
- No CI.
- Upstream feedback goes to GitHub issues.

## Guard placement

- **`entropy-guard`** (`skills/local/entropy-guard/SKILL.md`, replaced by `guard/SKILL.md`): the place is
  unchanged, because the repo's one stable handoff is still the end of a meaningful session, before commit
  (`DECISIONS.md:55`).
  - Trigger: before committing meaningful work.
  - Actor: whoever did the session, agent or person.
  - Entry point: `AGENTS.md` "Working Practices", `README.md` "Contributing", and the hook's reminder.
  - Output: the guard's report in the commit message, plus updates to `TODO.md` "Current state" and any "Proposed:"
    entries in `DECISIONS.md`.
  - Escalation: a gap too large for the session goes to `TODO.md` "Next Up" or "Backlog"; an undecided change of
    intent becomes a "Proposed:" entry for Justin Philpott.
- **`TODO.md` "Current state (read first)"**, the session-start half of the lifecycle the repo prescribes (F12).
  - Trigger: the start of a fresh session.
  - Entry point: the new first bullet in `AGENTS.md` "Working Practices" (`patches/AGENTS.md.patch`).
  - It is refreshed by the guard's check 7.
- **The guard's mechanical sub-checks** (links, skill names against folders, whitespace): run inside the guard by
  hand for now; there is no CI to move them to.

## Adoption plan

- **Now:**
  1. Justin answers Q1 and records it in `DECISIONS.md`. Q2 and Q3 can follow; nothing in this plan waits on them
     except B8.
  2. Apply `patches/TODO.md.patch`, `patches/DECISIONS.md.patch`, `patches/AGENTS.md.patch` and
     `patches/skills.patch`. None of them settles an open question.
  3. Once Q1 is answered, replace `skills/local/entropy-guard/SKILL.md` with `guard/SKILL.md`, keeping whichever
     rule 4 wording the answer selects and deleting the provisional note.
  4. Run the guard on the commit that installs it, and carry out the two checks under "Adoption status" below.
- **Next:**
  - Change the hook instructions in `AGENTS.md:19` and `README.md:140` from a symlink to
    `git config core.hooksPath .githooks`. Then one command, `git config core.hooksPath`, shows whether a clone has
    the reminder on, which today nothing shows (F14).
  - After Q2 is decided, fix the skill handoffs (bootstrap action B8).
- **Later:** if the repo gains CI, move the link check (lychee in offline mode, or the guard's shell loop) and the
  frontmatter check into it. A guard runner is already a backlog item (`TODO.md:18`, `DECISIONS.md:91`). Link to it
  there; do not start a parallel one.

## Adoption status

Each status records what was exercised, and when.

| Guard or surface | What it is | Status | Evidence |
|---|---|---|---|
| Refined `entropy-guard` (`guard/SKILL.md`) | a reminder (the hook) plus a check run by hand; not an enforced invariant | `planned` | Not installed: the target is a read-only snapshot, and no commit was authorised. Its mechanical checks were run on a patched scratch copy on 2026-10-07 and printed nothing. |
| Current `entropy-guard`: hook trigger | a reminder | `unknown` | Configuration evidence only: `.githooks/pre-commit` exists, is executable and exits 0, and `AGENTS.md:19` and `README.md:140` say to link it. With no `.git`, it cannot be seen whether any clone has. Execution evidence: none; the commit messages that would carry its notes were not available. |
| Current `entropy-guard`: fresh-session discovery | — | `planned` | Static paths only: `AGENTS.md:19` and `:41` name the guard's path, and `README.md:137` links it. No fresh session was run. |
| `TODO.md` "Current state" read at session start | a reminder | `planned` | Depends on `patches/AGENTS.md.patch` being applied. |

**To move these to `verified` when installing** (both need actions this run was not authorised to take):

- **The trigger fires.** Enable the hook, make a scratch commit on a throwaway branch, and see the reminder print.
- **A fresh session finds the guard.** Start a session in the repo with no prior context and ask: "What do you read
  first, and what must you do before handing off?" It should name `TODO.md` "Current state" and
  `skills/local/entropy-guard/SKILL.md`.
  - Repeat this for each kind of agent that works here. The repo's own records show Claude models
    (`PHILOSOPHY.md:9`) and OpenCode (`explorations/2026-03-24-entropy-immune-system-conversation.md:6`).
  - The repo has `AGENTS.md` but no `CLAUDE.md`, so whether a Claude Code session reaches `AGENTS.md` unprompted is
    exactly what this check must show.
  - If it does not, the smallest fix is a one-line `CLAUDE.md` pointing at `AGENTS.md`. That is a plain file, not a
    vendor folder.

## Discovery plan

- `AGENTS.md` "Working Practices": the session-start bullet (patch), and the existing "Run entropy-guard before
  committing" bullet, unchanged.
- `README.md` "Contributing", step 3: unchanged; it already names the guard.
- `.githooks/pre-commit`: unchanged text; its pointer to the guard's path stays valid, because the guard is replaced
  in place.

## Execution plan

- **Order:**
  1. "What changed this session".
  2. Section 1, intent.
  3. Sections 2 to 8, the judgment checks.
  4. The mechanical checks.
  5. Update `TODO.md` "Current state".
  6. Write the report into the commit message.
- **Parallel:** the mechanical checks can run while the judgment checks are worked through.
- **Output:** the commit message's report, `TODO.md`, and "Proposed:" entries in `DECISIONS.md`. Nothing is written
  into the guard file.

## Automation opportunities

- **Links:** move to lychee in CI once CI exists. Link integrity is a durable invariant (`docs-first` Step 8).
- **A skill's frontmatter name against its folder:** CI, for the same reason.
- **Whitespace (`git diff --check`):** CI, or a blocking pre-commit check if the steward wants one. Today the hook
  only reminds, by decision (`DECISIONS.md:31`).
- **Keep as judgment checks:** ownership, supersession, intent fit, and step-number contracts between skills. These
  depend on wording that is still moving (R1, Q2).

## Risks and uncertainties

- **The guard is longer.** It has grown from 139 to about 220 lines, mostly sections the generator requires (what
  changed, modes, the intent-change rule, commands, report, safety). If runs start being skipped, trim the
  table and section 3 before anything else, and record that the length was the cause.
- **Q1 decides the intent section.** If the steward keeps the current practice, the alternative rule 4 wording
  applies; nothing else in the guard changes.
- **The default branch is assumed.** The baseline falls back to `main`, which the snapshot could not confirm.
- **Pull requests:** their frequency is unknown. If pull requests become the usual handoff, revisit whether the
  report belongs in the pull request description as well as the commit message.

## Upstream feedback (`guards-integrator` Step 8)

Yes: two notes, in `feedback.md`. Neither concerns the integration advice itself; both are about the skills that fed
it.
