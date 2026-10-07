# Integration brief: agentic-architecture entropy guard

From `guards-integrator`. Finding ids (F1-F19) and risk ids (R1-R5) refer to `assessment.md`. The guard is
`guard/SKILL.md`, to be placed at `skills/entropy-guard.md` by `bootstrap.patch`. Everything here is provisional on
Q1 in `questions.md`.

## Loop map

- **Change starts in:** an agent or human session in the repository. `CLAUDE.md` is a symlink to `AGENTS.md`, and
  Claude Code and Pi both load it automatically (`runs/001-moving-stillness-status/RUN.md:74`, `:83`).
- **What happens now:** the repository is mostly read for reference. The costly moment is the start of a session,
  when the session-start ritual rebuilds a live plan (F13, R1). Commits are rare status corrections.
- **First handoff:** a local commit (`AGENTS.md:72`).
- **Automated gate:** none. There is no `.github/`, `.githooks/` or `.husky/`, and the effective hooks path is
  unknown because the snapshot has no `.git` (F14).
- **Final handoff:** a push to the remote. No pull-request flow is evident.

## Guard placement

The guard is a commit-time defence; the start of a session is defended by the status signals.

- **`entropy-guard`** (`skills/entropy-guard.md`):
  - **Trigger:** before every commit in this repository, including one-line status edits. The old trigger said
    "non-trivial", and that exemption is where status drift creeps in.
  - **Actor:** the agent or person committing.
  - **Why here:** at the commit, the change is still unpublished and cheap to correct.
  - **Cost:** 2-5 minutes, all judgment except four commands.
- **Defence at session start, which is not a guard:**
  - the `AGENTS.md` banner;
  - the new "Session start" step 1, which points to the Status block;
  - the Status block at the top of `ROADMAP.md`.

  This is what addresses R1. It lives in `current-state.patch` and `bootstrap.patch`, not in the guard, because a
  guard must not hold current state.

## Adoption plan

- **Now:**
  1. The steward answers Q1.
  2. Apply `current-state.patch`, then `bootstrap.patch`. Together they:
     - place the guard at `skills/entropy-guard.md`;
     - change `AGENTS.md:72` to "Before committing any change, run skills/entropy-guard.md";
     - make the Status block the first session-start step.
- **Next:** none is justified. The old guard's "next maturity step", a non-blocking hook reminder
  (`skills/entropy-guard.md:118`), and the backlog item `ROADMAP.md:69` ("Entropy guard: automated coherence checks
  on hooks") are withdrawn rather than carried forward, because commits are now rare. Revisit only if commits here
  become routine again. That would itself be a change of status for the steward to record.
- **Later:** none.

## Adoption status

- **`entropy-guard`:** a reminder, through an `AGENTS.md` standing instruction. It is not a check that runs by
  itself, and it is not an enforced invariant. Status: **`planned`**. The trigger has not fired and no fresh
  session has been tested. The target is a read-only snapshot with no `.git`, and this run has no approval to
  commit.
  - **Configuration evidence:** none yet, since the patches are not applied.
  - **Execution evidence:** on a scratch copy of the snapshot with both patches applied (2026-10-07), the guard's
    mechanical lines worked.
    - `git diff --check` was clean.
    - `grep -c "Reference-only" README.md AGENTS.md` returned 1 and 1.
    - The `DECISIONS.md` heading check flagged the new reference-only entry, as designed.
    - `@{upstream}` was absent, so the guard's "coverage incomplete" fallback applies.
    - `lychee` is not installed, so that line is currently skipped.

    That copy is not the real repository, so this proves the commands, not adoption.
- **To verify after applying:**
  1. Make one real status-correction commit, and confirm the guard was run and its report produced.
  2. Start a fresh session with no context and ask "what must I do before committing, and what is this repository's
     status?" It should name `skills/entropy-guard.md` and the Status block. Check both loading paths: Claude Code
     through the `CLAUDE.md` symlink, and Pi through its own loading of `AGENTS.md` (Pi without
     `--no-context-files`).
  3. Ask that session "what's next?" It should answer from the Status block (the steward's questions), not from
     the historical roadmap.

## Discovery plan

- `AGENTS.md`: the session-start steps and the working-practices line, both in `bootstrap.patch`. Agents load it
  automatically.
- `skills/README.md` lists the guard with its new purpose.
- `README.md` navigation already links `skills/`, and the Key files list in `AGENTS.md` names the guard.
- No new file or folder is added; the guard keeps its existing path.

## Execution plan

- **Order:**
  1. Read the Status block.
  2. Make the change.
  3. Run the guard before committing.
  4. Put any state change into the Status block, and any proposal for the steward into `DECISIONS.md`.
- **Parallel:** the four mechanical lines can run together. The judgment checks follow.
- **Output:** the guard's report goes into the session reply. Lasting results go to the Status block and
  `DECISIONS.md`, never into the guard file.
- **Escalation:**
  - A change that turns out to be new design stops, and moves to `../personal-agent` or `../../scope`.
  - A change of intent becomes a proposal for Justin in `DECISIONS.md`.

## Automation opportunities

Each of these is a stable invariant. None is worth a hook while commits are rare.

- A local link check: `lychee --offline`. It is not installed on this machine (checked with `command -v lychee`,
  2026-10-07), so install it only if commits become routine.
- Banner presence and new-decision-heading detection are already exact commands in the guard. They could become a
  hook if the repository's status ever changes.
- Volatile wording, such as which documents are historical or what the scope manager's seams are, stays a judgment
  check.

## Risks and uncertainties

- **Who still commits here is assumed, not known.** I assumed occasional commits by Justin or an agent. If the
  answer to Q1 is "frozen", the guard is unnecessary, and the right move is to demote it and the
  `AGENTS.md:72` instruction.
- **Sessions from sibling repositories are unchecked.** A session working in `../personal-agent` or `../../scope`
  that reads this repository by path may never load its `AGENTS.md`. For those readers, only the `README.md` banner
  and the Status block protect them. Check whether those repositories' instructions warn about this one; I could
  not read them.
- **Q2 and Q3 could make parts of this repository live** (the temporal coordinator spec, or the templates). Either
  answer adds a check to the guard.

## entropy-guard feedback

Yes. See `feedback.md`. The note covers the reference-only path through docs-first and generation, which left the
read-time risk and the guard decision implicit. `gh` and the web are not available in this run, so the issue is
written out for manual submission.
