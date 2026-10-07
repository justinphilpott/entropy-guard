# Integration brief: entropy-guard's session guard

From `guards-integrator` v0.4.0, 2026-10-07. Findings (F…) and questions (Q…) are those in `assessment.md`. It reuses
the assessment's loop map. The target is a read-only snapshot with no `.git`, so nothing here could be exercised in
the target itself.

## Loop as it is

- **Smallest unit of change:** an agent or human work session that ends in a local commit. No pull request template, no
  CI, no tests.
- **Habitual pause:** before commit (`AGENTS.md:19`, `README.md:137-138`).
- **Where follow-up gets lost:** at session start, which has no current-state section to read (F11), and at commit,
  where the reminder hook runs only if someone has symlinked it (`AGENTS.md:19`, `README.md:140`).

## Placement

- **`entropy-guard`** (`skills/local/entropy-guard/SKILL.md`, updated in place; the full text is `guard/SKILL.md`).
  - **Trigger:** end of a meaningful work session, before the commit lands. That is the latest cheap moment, because
    the commit message carries the result and `TODO.md` "Doing Now" must be cleared before it.
  - **Actor:** whoever made the change, the agent or Justin.
  - **Entry point:**
    - `AGENTS.md` "Working Practices" first bullet and "Key Files";
    - `README.md` "Contributing" step 3;
    - the `.githooks/pre-commit` reminder;
    - after `settled.diff`, the first line of `TODO.md` "Current state".
  - **Output:** a one-line result in the commit message. Proposals go to `DECISIONS.md`, and the next action to
    `TODO.md`.
  - **Escalation:**
    - A gap too large for the change goes to `TODO.md` "Next Up" or "Backlog".
    - A disagreement with intent goes to `DECISIONS.md` as a proposal for Justin, once Q1 is answered as recommended.
      Until then the current repair stands.
  - **Ordering:** the only guard. The feedback checks in the exported skills run at the end of using those skills, and
    are independent of it.
  - **Cost:**
    - The guard is 1,063 words. It replaces a 1,400-word guard on the same trigger, which `INTENT.md:116` puts at 2-10
      minutes.
    - It fires once per meaningful commit and is skipped for trivial ones.
    - It fits the loop; no trigger move is needed.

## Depth of each check

- **Judgment checks stay External, prompted by the hook and `AGENTS.md`:** intent, skill contracts, decisions,
  learnings, workflow and supersession.
- **The link check and `git diff --check` are stable invariants.**
  - Now: commands in the guard.
  - Next: run from the existing hook, printing problems and still exiting 0.
  - The link check depends on no wording or path that is still moving.

## Adoption

| Mechanism | What it is | Status | Evidence | Date |
|---|---|---|---|---|
| `.githooks/pre-commit` reminder | reminder | unknown | Configuration only: the file exists and always exits 0. Enabling it needs a symlink, and the snapshot has no `.git` to show one. Not seen firing | 2026-10-07 |
| `entropy-guard` at session end | executed check | unknown | No commit history in the snapshot, so no completed guard report could be read. The guard's "Last evaluated: 2026-04-07" is an evaluation, not a run | 2026-10-07 |
| Fresh agent finds the guard | discovery | planned | Configuration only: `AGENTS.md:19`, `:41` and `README.md:137` name it. Not tested: any session started on this machine also loads this machine's own instruction files, which would contaminate the test | 2026-10-07 |
| Link check command | executed check | planned | The command itself ran on the snapshot: 49 links, none broken, under zsh, bash and sh; a planted broken link was reported. That is evidence for the command, not for a run at the trigger | 2026-10-07 |
| `settled.diff`, `provisional.diff` | changes | planned | `patch -p1` applies both in order to a pristine copy | 2026-10-07 |

## Plan

- **Now** (no new infrastructure):
  - Apply `settled.diff`. It updates the guard (F8), fixes stale skill text (F9, F12), adds decision markers (F10),
    marks `explorations/` historical (F7), adds the state section to `TODO.md` (F11), and records the four proposals
    in `DECISIONS.md`.
  - Run the updated guard at the end of that same session, and put its result in the commit message. That report is
    the first adoption evidence.
  - Confirm the reminder fires on that commit. If it does not, link the hook as `AGENTS.md:19` says.
  - In each agent tool used here (the explorations record Claude Sonnet 4.6 and OpenCode gpt-5.4 sessions), start a
    fresh session in the repo and ask what it must do before handing off. If a tool does not load `AGENTS.md`, add
    the smallest pointer that tool does load, outside vendor-specific folders.
- **Next:**
  - Once Justin answers the proposals at the top of `DECISIONS.md`: apply `provisional.diff` (Q1, Q4), and the Q2 and
    Q3 change lists from `assessment.md`.
  - Add the link check and `git diff --check` to `.githooks/pre-commit` as non-blocking output.
- **Later:** discovering and running guards across repos belongs to the existing backlog item "Design a guard runner
  concept" (`TODO.md:18`). Link to it rather than starting parallel work. No CI exists, so there is no CI step to plan.

## Uncertain

- Whether the hook is linked in Justin's clone: not checkable here.
- Which instruction files each agent tool used here loads. The snapshot has only `AGENTS.md`.
- Whether the GitHub label `agent-feedback`, used by `gh issue create` in the feedback helper, exists: not checked (no
  network access in this run).
- Whether a user-wide instructions file binds this repo (the guard leaves it marked unresolved).
