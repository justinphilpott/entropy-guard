# Integration brief: the entropy-guard local guard

This comes from `guards-integrator` v0.4.0, run on 2026-10-07 on the guard in `guard/SKILL.md`. That guard replaces
`skills/local/entropy-guard/SKILL.md` in place. The loop map and the findings (F) are in `assessment.md`, and are not
repeated here. Nothing below has been exercised: the target is a read-only snapshot with no `.git`, so every mechanism
is `planned` or `unknown`.

## Loop as it is

- **The smallest unit of change** is a commit, at the end of a session that writes markdown.
- **The habitual pause** is just before the commit. `AGENTS.md:19` says to run the guard then, and `.githooks/pre-commit`
  reminds, in clones where someone linked it (`README.md:140`).
- **Follow-up gets lost in three places:**
  - clean guard runs leave no record (F13, F14);
  - nothing triggers re-running the assessment when a skill is added (F17);
  - feedback issues from other projects' sessions have no confirmation step (F11).

## Placement

- **`entropy-guard`** (`skills/local/entropy-guard/SKILL.md`):
  - **Trigger:** at the end of a meaningful session, before the commit. Trivial changes are skipped (`AGENTS.md:19`).
  - **Actor:** the agent or person who did the session.
  - **Entry point:** the `AGENTS.md` "Working Practices" first bullet and "Key Files", and the hook's message. The path
    is unchanged, so all three stay correct.
  - **Output:** the guard's report, as a note in the commit message ("entropy check clean" when nothing changed), with
    the next action written into `TODO.md`.
  - **Escalation:** a gap too large for this commit goes to `TODO.md` "Next Up" or "Backlog". Intent changes go to
    `DECISIONS.md` "Proposed, awaiting the steward".
  - **Ordering:** it is the only guard. Run the commands in "What changed this session" first, then the checks, then
    the reference checks.
  - **Cost against frequency:** the guard is 1,149 words, with 8 checks and one command block that took 0.05 s
    on the snapshot's 17 markdown files (timed 2026-10-07). A run is about 5 to 10 minutes per meaningful commit. That is within `INTENT.md:116`'s
    "2–10 minutes", though above `AGENTS.md:19`'s "2–5 minutes", because the guard now checks the baseline and the
    skills' handoffs. No trigger change is needed.

## Depth of each check

- **External, kept as judgment:** intent fit; checks 1 to 7 (skill contracts and routing, state, decisions and
  learnings, superseded material, workflow, upstream issues).
- **Prompted:** the reminder in `.githooks/pre-commit`, which stays non-blocking (`DECISIONS.md:31-35`).
- **Semi-embedded, later:** the reference checks. These are relative links, backticked repo paths, and skill `name`
  matching its folder, the agentskills.io rule (`DECISIONS.md:79-83`). All three are stable invariants. Paths that are
  still moving are not automated.

## Adoption

| Mechanism | What it is | Status | Evidence | Date |
|---|---|---|---|---|
| `.githooks/pre-commit` reminder | reminder | unknown | The file exists and prints a reminder, then exits 0. Whether it is linked (`.git/hooks/pre-commit` or `core.hooksPath`) cannot be read: there is no `.git`. No firing has been seen. | 2026-10-07 |
| current guard, v0.2.3 | executed check | unknown | `README.md:78` says it runs "before every commit". There is no git log to check, and clean runs leave no record (F13, F14). | 2026-10-07 |
| updated guard, `guard/SKILL.md` | executed check | planned | Waits for Q1, Q2 and Q5 (`provisional.patch`). It is adopted when one session has run it at its trigger and left a report in a commit message. | 2026-10-07 |
| the guard's reference checks | executed check | planned | The commands were tested on copies of the snapshot on 2026-10-07: under `sh` and `zsh`, and on a deliberately broken copy, where they caught a broken link and a wrong `name`. That proves the commands work. It is not a guard run. | 2026-10-07 |
| a fresh session finds the guard | discovery | planned | `AGENTS.md:19` and `:41` name the path. The only instruction file is `AGENTS.md`. Ask a session with no context what it must do before handing off, once for each agent tool used here. | 2026-10-07 |
| commit-note reminder (Next) | reminder | planned | Not built (F13). | 2026-10-07 |

## Plan

- **Now:**
  1. The steward answers Q1, Q2 and Q5 (`questions.md`).
  2. Apply `settled.patch`. It needs no answer, and it fixes the current guard's stale references in the meantime (F9,
     F10, F14).
  3. Apply `provisional.patch` for the answered questions, and copy `guard/SKILL.md` into place.
  4. Run the guard once at the next meaningful commit, and keep its report in the commit message.
  5. Ask a fresh session what it must do before handing off.
  6. Link the hook in this clone, and see it fire on a scratch commit.
- **Next:**
  - **Add a `commit-msg` hook** to `.githooks/` that warns, without blocking, when a commit message has no entropy-check
    line. This turns "runs before every commit" (`README.md:78`) into something that leaves evidence (F13, F14). It
    stays Prompted, in keeping with `DECISIONS.md:31-35`.
  - **Record the session's starting commit** in `TODO.md` "Doing Now" when work begins (`AGENTS.md:22`), so the guard's
    `<start>` can be found rather than falling back to `@{upstream}`.
  - **Rerun `entropy-assessment` on this repo** whenever a skill is added or removed (guard check 3; F17). That gives
    `INTENT.md:82`'s "periodically" a trigger.
- **Later:**
  - Call the reference checks from `.githooks/pre-commit`, as non-blocking warnings, or from CI if CI is added.
  - Fold them into the guard runner in `TODO.md:18` when that is built, rather than starting a separate script.

## Uncertain

- Which agent tools work in this repo, and whether each loads `AGENTS.md`. There is no `CLAUDE.md` or vendor file. This
  was not checked, and the snapshot cannot show it.
- Whether the hook is linked in any clone. This was not checked.
- How often the current guard actually runs. There is no history to read.

## Feedback on entropy-guard

The notes on the skills themselves are in `feedback.md`.
