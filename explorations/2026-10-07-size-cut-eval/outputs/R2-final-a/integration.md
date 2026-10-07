# Integration brief: entropy-guard's session-end guard

This is the output of `guards-integrator` for `guard/SKILL.md`, the update of `skills/local/entropy-guard/SKILL.md` in
entropy-guard snapshot `447da9a`, dated 2026-10-07. It reuses the loop map in `assessment.md` section 5, and finding
ids refer to `assessment.md` section 3.

**This guard is provisional.** Its Intent section depends on Q3, and its steward on Q4 (`questions.md`). Install it
only after both are answered; nothing here has been installed.

## The loop as it is

- **Smallest unit of change:** one work session that ends in a commit.
- **Habitual pauses:**
  - writing "Doing Now" in `TODO.md` before the work (`AGENTS.md:22`);
  - running the guard before the commit (`AGENTS.md:19`);
  - the reminder at `git commit`, if the hook is linked.
- **Where follow-up gets lost:**
  - work done outside `TODO.md`, such as the May 2026 generator (F8);
  - re-evaluating the guard after the skills change (F15).
- **Existing mechanisms:**
  - CI: none.
  - Hook frameworks: none.
  - Tracked hooks: `.githooks/pre-commit`. It prints a reminder and exits 0. It is enabled by symlinking it to
    `.git/hooks/pre-commit` (`README.md:140`), not through `core.hooksPath`.
  - PR templates: none.
  - Agent instructions: `AGENTS.md` only.
- **What is unknown:** the effective hooks path, because the snapshot has no `.git`.

## Placement

The guard is `entropy-guard` (`skills/local/entropy-guard/SKILL.md`). It is placed as follows:

- **Trigger:** the end of a meaningful work session, before the commit that closes it. Trivial changes are skipped
  (`AGENTS.md:19`). That is the latest cheap moment: after the commit, a stale reference or an unrecorded decision
  ships in history, and the next session starts from it (F8).
- **Actor:** the contributor, human or agent, who did the work.
- **Entry point:**
  - `AGENTS.md:19` "Run entropy-guard before committing", and "Key Files" at `AGENTS.md:41`;
  - `README.md` "Contributing", step 3;
  - the reminder from `.githooks/pre-commit:4` at `git commit`.
- **Output:**
  - a one-line result in the commit message, or "entropy check clean" (`README.md:138`);
  - proposals for the steward in `DECISIONS.md`;
  - the next action in `TODO.md` "Current state".
- **Escalation:** a gap too large for the session goes to `TODO.md` "Next Up" or "Backlog", and is fixed in a later
  commit.
- **Ordering:** it is the only guard. It runs after the work and before `git commit`; the hook fires during the
  commit as a reminder that it should already have run.
- **Cost against frequency:** roughly 1,100 words of mostly judgment checks, plus six git commands and two search
  commands. The repo budgets 2 to 5 minutes for the ritual (`AGENTS.md:19`), once per meaningful session. That fits
  the loop, so the trigger stays where it is.

**Depth of each check:**

| Check | Depth | Why |
|---|---|---|
| Intent, one owner, supersession, workflow, decisions and learnings | External | judgment |
| Running the guard at all; "Doing Now" cleared | Prompted, by `.githooks/pre-commit:4` and `:6` | already in place, and non-blocking by decision (`DECISIONS.md:31-35`) |
| Skill `name` matches its folder | External now; Prompted next | a stable invariant from agentskills.io, safe to automate |
| Relative links resolve | not checked now; Semi-embedded later | a stable invariant, but there is no CI to hold it; the old guard proposed the same move (`skills/local/entropy-guard/SKILL.md:110`) |
| Stale-name search | External | needs the old name, which only the session knows |

## Adoption

| Mechanism | What it is | Status | Evidence | Date |
|---|---|---|---|---|
| `.githooks/pre-commit` | reminder | `unknown` | The hook is committed and exits 0. That is configuration evidence only: the snapshot has no `.git`, so neither the hooks link nor a firing can be seen (F15) | 2026-10-07 |
| `entropy-guard` v0.2.3, the current guard | executed check | `unknown` | No commit history in the snapshot. "Last evaluated: 2026-04-07" (`SKILL.md:21`) records an evaluation, not a run | 2026-10-07 |
| `entropy-guard` v0.3.0, this update | executed check | `planned` | It needs Q3 and Q4 answered, then one run at a session end with its result in the commit message | — |
| A fresh agent finds the guard | discovery | `planned` | Not run. A session started from this run inherits the assessor's own instruction files, so it would not be a no-context session in the target. The way agents load instructions here is `AGENTS.md`; the agents named in `explorations/` are Claude Sonnet 4.6 and OpenCode (gpt-5.4), and whether each loads `AGENTS.md` automatically was not checked | — |

## Plan

**Now**, with what exists today:
- The steward answers Q1 to Q4 (`questions.md`). The proposals for Q1 and Q3 are in `patches/decisions.patch`.
- Apply `patches/state-TODO.patch`, `patches/decisions.patch` and `patches/cleanup.patch` (F6, F7, F8, F11, F12).
  They record the questions and settle none. Once the cleanup and decisions patches are in, remove the matching
  `TODO.md` backlog item.
- Once Q3 and Q4 are answered, replace `skills/local/entropy-guard/SKILL.md` with `guard/SKILL.md` (F2, F3, F13).
  - If Q3 goes the other way, rewrite rule 4 of its Intent section first.
  - If the steward is someone else, change the name in its five places.
  - No operator doc needs a new reference, because the path is unchanged.

**Next**, light prompting:
- Verify adoption:
  - Link the hook in a working clone and watch it fire on a scratch commit; that verifies the reminder.
  - Run v0.3.0 once at a session end, with the result in the commit message; that verifies the executed check.
  - Ask a no-context session started in the repository what it must do before handing off; that verifies
    discovery.
- Add the skill-name check from the guard to `.githooks/pre-commit` as a printed warning, keeping `exit 0`. It is a
  stable invariant (`DECISIONS.md:79-83`), and a warning keeps the non-blocking decision (`DECISIONS.md:31-35`).
- Re-run `skills/entropy-assessment/SKILL.md` on this repo once Q1 is answered, since that changes a skill's role
  (F15, `INTENT.md:82`).

**Later:**
- When the repo gains CI, move the skill-name check and a relative-link check into it (F11, F13).
- Nothing else is ready to embed: the remaining checks depend on wording that is still moving.

## Uncertain

- Whether any clone has the hook linked, and whether the guard has ever run (F15).
- Whether the agents used here load `AGENTS.md` without being told to.
- Whether the remote is named `origin`, as the guard's fallback baseline assumes.
- Whether pull requests are a regular handoff. `LEARNINGS.md:152` shows at least one, and if they are regular, a PR
  template line could later carry the guard result.

## Feedback on entropy-guard

There are notes on the skills used in this run in `feedback.md`. I am not working inside the entropy-guard
repository, so they are not filed as issues.
