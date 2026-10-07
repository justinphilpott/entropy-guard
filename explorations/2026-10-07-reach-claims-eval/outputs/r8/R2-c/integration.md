# Integration brief: entropy-guard's session-end guard

From `guards-integrator`, run on 2026-10-07 after `session-coherence-skill-generator` updated the guard. The guard
being placed is `guard/SKILL.md`, which replaces `skills/local/entropy-guard/SKILL.md` at the same path. Finding ids
(F1 and so on) and the loop map are in `assessment.md`. The mode is plan: the target is read-only, so nothing was
installed.

## The loop as it is (Step 1)

- **Smallest unit of change:** an agent or human work session that ends in a commit. Pull requests are used
  sometimes (`LEARNINGS.md:152`).
- **The habitual pause:** before the commit (`AGENTS.md:19`).
- **Where follow-up gets lost:**
  - decisions made in session (`skills/local/entropy-guard/SKILL.md:48`);
  - work state kept in GitHub issues, not `TODO.md` (F14);
  - what a fresh session should not trust (F7).
- **Mechanisms that exist:**
  - a tracked hook folder, `.githooks/`, with one hook;
  - one agent instruction file, `AGENTS.md`.
- **Mechanisms that do not exist:** CI, a hook framework, PR templates, `CLAUDE.md`. The effective hooks path in any
  clone is unknown: there is no `.git`, and `README.md:140` asks each clone to symlink the hook by hand.

## Placement (Step 2)

- **`skills/local/entropy-guard/SKILL.md` (updated):**
  - **Trigger:** the end of a meaningful work session, before the commit that closes it. Trivial typo or formatting
    commits are skipped (`AGENTS.md:19`). This is the latest point at which a stale reference or an uncaptured
    decision is still cheap to fix.
  - **Actor:** whoever ends the session, an agent or a human.
  - **Entry point:**
    - `AGENTS.md` "Run entropy-guard before committing" (`:19`) and "Key Files" (`:41`);
    - the commit reminder from `.githooks/pre-commit`, in clones that enabled it.
  - **Output:** the guard's report goes in the commit message: what was updated, or "entropy check clean". This
    already matches `README.md:138`. The next action goes into `TODO.md`.
  - **Escalation:** a gap too large for the session goes to `TODO.md` Backlog, never into the guard. A change of
    intent becomes a proposal in `DECISIONS.md` (after Q1).
  - **Ordering:** it is the only guard, and runs after the work and before the commit.
- **Cost against frequency:** `AGENTS.md:19` estimates 2–5 minutes. The guard has 11 checks and is about 1,118 words
  once installed, down from 1,400. Most checks are triggered by a kind of change, so a typical session answers "no"
  to most of them. That fits once per meaningful session.

## Depth of each check (Step 3)

- **Judgment checks:** intent fit, ownership, supersession, state honesty, workflow alignment, learnings. These stay
  in the guard as **External** checks, **Prompted** by the hook and by `AGENTS.md`. This is the maturity path the repo
  already chose (`DECISIONS.md:31-35`).
- **`git diff --check` and the link check:** stable and mechanical. They live as commands in the guard today, because
  there is no CI to move them into. They are candidates for semi-embedding Later.
- **Not automated:** the wording of `TODO.md` "Current state" or of `DECISIONS.md` entries. It changes too often (the
  docs-first "brittle automation" row).

## Visible to agents (Step 4)

No change is needed. `AGENTS.md:19` names the guard's path and makes running it a completion step before commit, and
the path does not change with the update. The guard's Report puts its result in the commit message, which ties it to
the step `AGENTS.md:22` already uses to write that message.

## Adoption (Step 5)

| Mechanism | What it is | Status | Evidence | Date |
|---|---|---|---|---|
| `.githooks/pre-commit` | reminder | **unknown** | Run directly, it prints the reminder to stderr and exits 0. That shows the script works, not that it fires at commit. No clone was available to see whether it is linked; that is configuration evidence, still missing. | 2026-10-07 |
| Current guard, `skills/local/entropy-guard/SKILL.md` v0.2.3 | executed check | **unknown** | The snapshot has no commit history, so no guard report or "entropy check clean" note can be found. | 2026-10-07 |
| Updated guard, `guard/SKILL.md` | executed check | **planned** | Not installed: the target is read-only, and installing waits on Q1 (`patches/provisional-Q1.patch`). | 2026-10-07 |
| Discovery by a fresh agent | how agents find the guard | **verified** for the path | A read-only agent with no context, asked what it must do before handoff, opened `AGENTS.md` first. It named `skills/local/entropy-guard/SKILL.md` and the hook, citing `AGENTS.md` lines 19 and 40–41. It was asked directly, it did not open the guard, and only one way of loading instructions was tried. | 2026-10-07 |
| The guard's link check | executed check, inside the guard | **verified** | Run in bash on the target with all patches applied: no broken links, and it flagged a planted broken link. Its first version flagged its own text; that was fixed and re-run. | 2026-10-07 |
| Report in the commit message | the guard's output | **planned** | It needs a real session end and a commit, which this run may not make. | 2026-10-07 |

**Adopted?** Not yet. The updated guard has not run once at its trigger. The reminder has not been seen firing at a
commit.

## Plan (Step 6)

- **Now, with what exists:**
  - Apply `patches/settled.patch`. It brings in the `TODO.md` "Current state" section (F7), the line fixes to the
    current guard (F8), the explorations pointer (F6), the supersession notes (F5) and the `README.md:78` wording
    (F9).
  - In each working clone, link the hook as `README.md:140` says, then make one commit to see it fire. That moves the
    hook's status to verified.
- **Next, once the steward answers Q1:**
  - Apply `patches/provisional-Q1.patch`, which installs the updated guard.
  - Run it at the next session end, and check that the commit message carries its report. That is the guard's first
    execution evidence.
  - Apply the Q2 to Q4 patches as each answer arrives.
- **Later:**
  - If CI is ever added, move the link check and `git diff --check` into it.
  - A guard runner is already a Backlog item ("Design a guard runner concept", `TODO.md:18`). Link to it rather than
    starting parallel work.

## Uncertain

- How agents in this repo load instructions beyond `AGENTS.md`: no vendor file exists. This was not tested with a
  natural session start, only with an agent asked directly.
- Whether contributors' clones link the hook: not observable from the snapshot.
- Whether the 2–5 minute estimate (`AGENTS.md:19`) holds for the 11-check guard: it can only be measured once the
  guard has been run.
