# Integration brief: entropy-guard snapshot 447da9a

From `guards-integrator` v0.4.0, run 2026-10-07 on the guard in `guard/SKILL.md`. That guard updates
`skills/local/entropy-guard/SKILL.md` in place. Finding ids (F…) refer to `assessment.md`, and the loop map is in its
§4. This was plan mode: the target is read-only and has no `.git`, so nothing was installed, committed or run at its
trigger.

## Placement

- **`entropy-guard`** (the updated guard):
  - **Trigger:** the end of a meaningful work session, before `git commit`. That is the last moment before the change
    is recorded, and decisions and learnings are freshest then.
  - **Actor:** the agent or person who did the work.
  - **Entry point:** the standing instruction at AGENTS.md:19, which names the path; README.md "Contributing" step 3;
    and the reminder from `.githooks/pre-commit` as a backstop.
  - **Output:**
    - a one-line result in the commit message (README.md:138);
    - proposals for Justin in DECISIONS.md "Proposed, awaiting Justin";
    - the next action in TODO.md.
  - **Escalation:** a gap too large for the change goes to TODO.md "Next Up" or "Backlog".
  - **Ordering:** it is the only guard. It runs after the work and before the commit. The hook fires during
    `git commit`, after the guard should already have run.
  - **Cost:** reading about 1,300 words, then 6 git commands and 2 scripted checks. Each scripted check took well under
    a second on the 21-file snapshot (2026-10-07). That fits the 2-5 minutes per meaningful session that AGENTS.md:19
    claims, and the trigger fires once per such session.
- **Depth of each check:**
  - The judgment checks stay in the guard (External).
  - The prompts are AGENTS.md:19 and the hook (Prompted).
  - The link check and the name-matches-folder check are the only stable mechanical invariants. They live in the
    guard as commands now, and are candidates to move into the hook (see Plan).

## Adoption

| Mechanism | Kind | Status | Evidence | Date |
|---|---|---|---|---|
| AGENTS.md:19 standing instruction | reminder | planned | Configuration only: the line names `skills/local/entropy-guard/SKILL.md`, which the update keeps. No fresh-session test was run (see Uncertain). | 2026-10-07 |
| `.githooks/pre-commit` | reminder | unknown | Content read: it prints the reminder and always exits 0. Whether any clone has it linked is unknown, because the snapshot has no `.git`. It has not been seen to fire. | 2026-10-07 |
| `entropy-guard` (updated) | executed check | planned | Never run at its trigger. That needs the settled patch applied and a session ending in a commit. Before this update, no record of a run exists either (F13, F18). | 2026-10-07 |
| Link check and name check (inside the guard) | executed check | planned | Commands only: both pass on the snapshot and on the fully patched tree, and both caught a planted broken link and a planted name mismatch in a scratch copy. Neither has run at its trigger. | 2026-10-07 |

This is configuration evidence, not execution evidence: no mechanism above has been seen to fire or produce a guard
report in this repo.

## Plan

- **Now** (each step needs Justin's go-ahead, because it edits his repo):
  1. Apply `patches/settled.patch`. It updates the guard, adds TODO.md "Current state", and records the questions and
     supersession markers in DECISIONS.md (F5-F10, F15, F17).
  2. At the end of that same session, run the updated guard. Its report in that commit message is the first piece of
     execution evidence (F18).
  3. Check whether the hook is linked: `git config core.hooksPath; ls -l .git/hooks/pre-commit`. If it is not, link it
     as README.md:140 says, then watch it fire on the next commit.
  4. In a real clone, ask a new agent session with no context "what must you do before handing off?". It should name
     the guard and its path.
- **Next:**
  - Once Justin answers Q1-Q3 (`questions.md`), apply the matching `patches/provisional-Q<n>.patch` (F3, F5, F12).
  - Add the two scripted checks to `.githooks/pre-commit` so they print warnings. The hook must still exit 0, as the
    decision at DECISIONS.md:31-35 keeps it non-blocking. Links and skill names are stable invariants, and link rot is
    this repo's fastest-decaying vector (F7).
- **Later:**
  - If CI is ever added, move those two checks there.
  - A guard runner is already in TODO.md "Backlog" ("Design a guard runner concept"), so do not start parallel work
    for it.

## Uncertain

- **Whether the hook is linked in any clone:** not checkable here.
- **The fresh-agent test was not run.** A session started from this environment loads the live entropy-guard repo's
  AGENTS.md from its working directory, so it would not show what the snapshot's instructions do. Run it in a real
  clone (Now, step 4).
- **The reminder comes after the commit is made.** It fires during `git commit` and always exits 0, so the commit
  goes ahead anyway. An agent sees it only in the commit output and would have to amend. The trigger that actually
  works is the standing instruction; the hook is a backstop.
- **Whether agents here load `skills/` automatically:** not checked. The pointer at AGENTS.md:19 counts either way.

## Feedback on entropy-guard

There are 5 notes on where the skills left a step implicit for this target, in `feedback.md`. They were not filed:
the network was not used, and this is not a working checkout of the entropy-guard repo.
