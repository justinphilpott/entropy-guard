# Bootstrap: the smallest missing memory

Read this in two cases:
- **A young repository,** which has started to accumulate real work but has no stable place to keep its context
  between sessions. Bootstrap adds the smallest missing memory, and builds no guard until there is a repeated loop
  to guard.
- **An established repository missing one surface,** when an assessment needs a state file or decision log that does
  not exist. Assess and add only that surface, then return to the caller.

Inherit the caller's operating mode. In plan, audit-only or discuss-first mode, propose the files; in build mode,
create them.

## Signals that it applies

- The repo has one or a few commits, and its purpose or current direction lives mostly in conversation, memory or
  uncommitted notes.
- A fresh session would have to rediscover the current task, the next action, or why early choices were made.
- A handoff, human or agent, is likely soon, and there is no obvious place to record live state.

## Principles

- Add a memory surface only when the cost of rediscovering it is present or close.
- Prefer one small file or section to several new process documents.
- Classify each missing surface as **Needed now**, **Soon** or **Premature**. Absence is evidence, but not every
  absence is a gap to fill.
- Even in build mode, create only the **Needed now** surfaces unless the owner approves more.

## The ladder, in order

1. **Purpose:** `README.md` or `INTENT.md`, when the repo cannot say what it is for and who decides that.
2. **Active state:** `TODO.md` or `STATE.md`, when current work and next steps would be painful to rediscover.
3. **Decisions:** `DECISIONS.md` or ADRs, once choices exist that would be costly to reopen.
4. **Learnings:** `LEARNINGS.md`, once non-obvious gotchas or validated patterns have appeared.
5. **Operator instructions:** `AGENTS.md` or `CONTRIBUTING.md`, when people or agents will repeatedly enter the repo.
6. **A guard:** only once there is a repeated session, commit, PR or release loop, or recurring drift.

## Output

- The context surfaces that exist.
- What a fresh session would have to rediscover.
- Missing surfaces, as **Needed now**, **Soon** and **Premature**.
- The minimal patch, or the files created in build mode.
- A guard-readiness verdict, `not yet`, `soon` or `ready now`, with the event that would make a guard worth building.
  Return it to the caller: `ready now` lets the caller go on to build a guard; `not yet` and `soon` end guard
  construction.
