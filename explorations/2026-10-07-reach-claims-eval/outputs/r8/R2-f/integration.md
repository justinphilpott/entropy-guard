# Integration brief: entropy-guard's session guard

From `guards-integrator` v0.4.0, 2026-10-07. It reuses the loop map and findings in `assessment.md`, cited by id (F1
to F18) and question (Q1 to Q4). The guard is `skills/local/entropy-guard/SKILL.md`: the existing v0.2.3 now, and the
updated version in `guard/SKILL.md` once Q2 is answered.

## The loop as it is

- **Smallest unit of change:** a meaningful work session ending in a commit; sometimes a pull request.
- **Habitual pause:** before the commit, where the guard runs and `TODO.md` "Doing Now" is cleared (`AGENTS.md` lines
  19 and 22).
- **Where follow-up gets lost:**
  - periodic re-assessment, which has no trigger (F8);
  - work recorded only in GitHub issues, which were not read;
  - whether the hook fires in a given clone at all (F7).

## Mechanisms found

| Mechanism | What it actually does |
|---|---|
| CI | none (no `.github/`, no CI configuration) |
| Hook framework | none (no `.pre-commit-config.yaml`, no `.husky/`) |
| Tracked hook folder | `.githooks/pre-commit`: prints a four-line reminder to stderr and `exit 0`s. It runs only if the clone links it into `.git/hooks/` (README line 140) or sets `core.hooksPath`. Neither can be read: the snapshot has no `.git`. |
| PR templates | none |
| Agent instruction files | `AGENTS.md` only. There is no `CLAUDE.md` and no `.github/copilot-instructions.md`. |

## Placement

- **`skills/local/entropy-guard/SKILL.md`**
  - **Trigger:** the end of a meaningful work session, before commit, as now. Commit is the latest moment it still
    catches drift cheaply, because the session's context is still loaded.
  - **Actor:** whoever did the work, human or agent.
  - **Entry point:** these four, all naming the same path, which the update in place keeps:
    - `AGENTS.md` line 19, in Working Practices;
    - `AGENTS.md` line 41, in Key Files;
    - README "Contributing", step 3;
    - the reminder hook's text.
  - **Output:** these four:
    - a note in the commit message every time, or "entropy check clean" (F15);
    - proposals for the steward in `DECISIONS.md` under "Proposed, awaiting the steward";
    - the next action in `TODO.md` "Current state";
    - skill misfires through `skills/local/entropy-guard-feedback/SKILL.md`.
  - **Escalation:** a gap too large for the session goes to `TODO.md` Next Up or Backlog (the guard's Repairs section).
  - **Ordering:** it is the only guard. It runs after the work and before the commit, and the feedback helper runs
    after it only when a skill misfired.
  - **Cost against frequency:** the guard is 1,073 words of judgment. `AGENTS.md` line 19 puts it at 2 to 5 minutes,
    once per meaningful session. Its three commands run in seconds. That fits the loop, and nothing needs moving.
- **`.githooks/pre-commit`:** keep as it is. It prompts at every commit and names the same guard path.

## Depth of each check

| Check | Depth | Why |
|---|---|---|
| Intent, canonical ownership, supersession, skill contracts, decisions and learnings, state, workflow | external, prompted by the hook | judgment; their wording and structures are still moving (Q1, Q3), so not automated |
| Broken relative links | prompted now; next, a printed warning in the hook | link integrity is a stable invariant (docs-first risk matrix; guard line 110 already names it as the first check to mechanise) |
| Whitespace (`git diff --check`) | external now | cheap and stable, but the editor settings already cover most of it; no new surface is justified |
| Search for an old name | external | needs the old name, so it stays a judgment-triggered command |

## Visible to agents

`AGENTS.md` line 19 already makes the guard part of finishing work, and line 41 lists it. No change is needed for
discovery. Q2's patch changes only line 27, the intent instruction.

## Adoption

| Mechanism | Kind | Status | Evidence | Date |
|---|---|---|---|---|
| `.githooks/pre-commit` reminder | reminder | unknown | Never seen firing. No `.git` in the snapshot, so neither `core.hooksPath` nor `.git/hooks/pre-commit` can be read. | 2026-10-07 |
| Existing guard v0.2.3 at commit | executed check | unknown | No commit messages are available, so no "entropy check" notes could be found. | 2026-10-07 |
| Updated guard (`guard/SKILL.md`) | executed check | planned | Not installed; provisional on Q2. | 2026-10-07 |
| Fresh-session discovery | discovery | verified | A context-free agent session, limited to the snapshot, was asked what it must do before handing off. It named `skills/local/entropy-guard/SKILL.md`, the "Doing Now" clearing and the commit note. It cited `AGENTS.md` lines 19 and 22, README lines 137-138, and the guard's lines 26-28. It opened `README.md`, then `AGENTS.md`, then the guard. | 2026-10-07 |
| Link check in the hook | executed check | planned | Proposed below. | 2026-10-07 |

The discovery result is configuration and instruction evidence. It is not evidence that the guard ran.

## Plan

- **Now**
  - The steward answers Q1 to Q4 (`questions.md`), and `patches/settled.patch` is applied (F10, F12, F13, F15, and F9
    and F14 in part).
  - In the real clone, enable the reminder (`git config core.hooksPath .githooks`, or the symlink in README line 140).
    Make one scratch commit to see it fire, then record the result as reminder evidence (F7).
  - At the next real session end, run the guard and put its note in the commit message. That note is the first
    execution evidence.
- **Next**
  - Once Q2 is answered, apply `patches/provisional-Q2.patch` to install the updated guard. Run it once at a real
    session end, and record that run as its adoption evidence.
  - Add the guard's link-check command to `.githooks/pre-commit` as a printed warning that still exits 0, keeping
    `INTENT.md`'s "not a blocker".
- **Later**
  - Give periodic re-assessment (F8) a trigger through the guard runner already in the `TODO.md` Backlog (line 18).
    Do not start parallel work for it.
  - The `doc-health-check` gap stays with its existing Backlog item (`TODO.md` line 20).

## Uncertain

- Whether the clone's hook is enabled: not checked, because there is no `.git` (F7).
- Whether the repo's agents load `AGENTS.md` automatically: not checked. The discovery test pointed a context-free
  session at the snapshot; it did not reproduce the repo's real agent setup.
- Whether `python3` is available wherever the link check would run in the hook: not checked.
- Whether the steward named in the guard is right: inferred, not recorded (F1).
