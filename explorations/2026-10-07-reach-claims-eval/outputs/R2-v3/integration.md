# Integration brief: entropy-guard's session-end guard

From `guards-integrator`, 2026-10-07, for the refined guard in `guard/SKILL.md`. That guard is to replace
`skills/local/entropy-guard/SKILL.md` in the entropy-guard repo, snapshot 447da9a. Finding ids (F1…) and question
ids (Q1…) refer to `assessment.md` and `questions.md`.

The snapshot has no `.git`, so no hook configuration, commit history or CI could be read. Every claim below about
what runs is labelled.

## Loop map

- **Change starts in:** a human or AI agent session, in a local clone.
  - The agent's standing instructions are in `AGENTS.md`.
  - "Doing Now" in `TODO.md` is written before work starts (`AGENTS.md:22`).
- **Work:** edits to markdown: skills, `INTENT.md`, `README.md`, `DECISIONS.md`, `LEARNINGS.md`.
- **First handoff:** a local commit.
  - The local guard is run by hand (`AGENTS.md:19`).
  - `.githooks/pre-commit` prints a reminder if it was enabled by a manual symlink (`README.md:140`, `AGENTS.md:19`).
    Whether it is enabled is **unknown** (F7).
- **Second handoff:** pull requests, at least sometimes (`LEARNINGS.md:152`). There is no PR template, and no CI:
  `.github/` is absent.
- **Upstream loop:** GitHub issues on `justinphilpott/entropy-guard`, filed through
  `skills/local/entropy-guard-feedback/SKILL.md`.
- **Where entropy enters:** sessions start with nothing saying what is settled, superseded or open (F6). The guard is
  remembered, or it is not (F7).

## Guard placement

- **`entropy-guard`** (refined): trigger, actor and reason.
  - **Trigger:** end of a meaningful session, before commit.
  - **Actor:** the agent or person who did the work.
  - **Why here:** decisions and learnings are freshest then, and the commit is the repo's one stable handoff
    (`DECISIONS.md` "Keep a single local guard…").
  - **Cost:** 2 to 5 minutes. The checks are mostly judgment, with 4 mechanical commands.
- **Session-start companion:** not a guard. A read of `TODO.md` "Current state", added by `patches/TODO.md.patch`.
  It pairs with the guard, whose TODO check refreshes the section.

## Adoption plan

- **Now, independent of the open questions:**
  - Apply `patches/DECISIONS.md.patch`: the supersession markers and the three proposals.
  - Apply `patches/TODO.md.patch`: the "Current state" section.
  - Add one line to `AGENTS.md` "TODO.md as live context": "At session start, read `TODO.md` 'Current state' first."
- **Now, after Q1 is answered:**
  - Replace `skills/local/entropy-guard/SKILL.md` with `guard/SKILL.md`.
  - Fill the steward pointer in "Where things live" and in rule step 3 from the recorded decision.
  - If Q1 is answered (a), contributors may edit intent. Then rewrite the guard's Intent section before installing
    it, because rule v2 assumes a steward.
  - The hook's text needs no change: the path is the same.
- **Next:**
  - Make hook enablement one instruction, in `AGENTS.md` "Working Practices":
    `git config core.hooksPath .githooks`. It needs no symlink, and it picks up future hooks.
  - Reduce `README.md:140` to a link to that instruction.
  - Reword `README.md:78` to say a reminder prompts the guard (F7).
- **Later:**
  - Move the link check and the front-matter name check into CI once CI exists, or into the guard runner already in
    the `TODO.md` backlog ("Design a guard runner concept"). No parallel project.

## Adoption status

| Guard or surface | What it actually is | Status | What was exercised, and when |
|---|---|---|---|
| `.githooks/pre-commit` | **A reminder** (`exit 0`) | **unknown** | Nothing. There is no `.git`, so neither `core.hooksPath` nor `.git/hooks/` could be read, and no commit was made |
| `entropy-guard`, refined: trigger | **A check that runs** when invoked by hand. There is no enforced invariant; non-blocking by decision (`DECISIONS.md:31-35`) | **planned** | Not installed. The target is read-only, Q1 is open, and making a commit was not authorised |
| `entropy-guard`, refined: discovery by a fresh session | Configuration only: `AGENTS.md:19` and `:41`, `README.md:137` and the hook's message all name `skills/local/entropy-guard/SKILL.md` | **planned** | Not exercised. Any session started from this environment loads the live entropy-guard repository's own `AGENTS.md`, which names the same path, so it could not show whether the snapshot alone leads a fresh agent to the guard |
| Mechanical sub-checks | **Checks that run** when invoked | **verified**, for the non-git parts | 2026-10-07, on the snapshot: link loop found 0 broken of 49; name loop 0 mismatched of 6; Doing Now `[empty]`. Both loops caught a planted broken link and a planted name mismatch in a scratch copy. The git commands were not exercised (no `.git`) |

These statements are configuration evidence, not execution evidence. "`AGENTS.md` names the guard" does not mean a
session found it, and "the hook file exists" does not mean the hook ran.

**To verify after adoption:**

- Make one real or scratch commit in a clone with the hook enabled, and see the reminder.
- Start one fresh agent session in a clone, outside any environment that preloads entropy-guard instructions. Ask
  what it must do before handing off, and confirm it names the guard and its path.

## Discovery plan

- **Already present:**
  - `AGENTS.md` "Working Practices" (`:19`) and "Key Files" (`:41`);
  - `README.md` "Contributing", step 3;
  - the hook's message.
- **Add:** the session-start line in `AGENTS.md`, from Now above, so a fresh agent reads `TODO.md` "Current state"
  before it works, and finds the open questions and the superseded designs there.

## Execution plan

1. **Order at session end:**
   1. "What changed this session" (git commands);
   2. Intent;
   3. judgment checks 1 to 10;
   4. mechanical checks;
   5. update `TODO.md`;
   6. the commit-message note.
2. **In parallel:** the mechanical checks can run while the judgment checks are worked through.
3. **Outputs:**
   - **Commit message:** the guard's note, or "entropy check clean".
   - **`TODO.md`:** "Current state", and "Doing Now" cleared.
   - **`DECISIONS.md`:** any proposals, as entries titled "Proposed: …".
   - **Report:** findings caused by the session, kept apart from problems already there.
4. **Escalation:** a gap too large for the session goes to `TODO.md` Next Up or Backlog. A change of intent goes to
   `DECISIONS.md` as a proposal for the steward, and work that depends on it waits.

## Automation opportunities

- **Link integrity:** use lychee in offline mode, or the guard's shell loop. Durable.
- **Front matter `name` equals the folder name:** a durable invariant (`DECISIONS.md` "Skill format…").
- **Required files present:** durable.
- Keep canonical ownership, supersession, workflow alignment and state honesty in the narrative guard. They depend on
  wording and on structure that is still moving.
- Do not script phrase searches such as grepping for "Phase 2". They would encode transitional terms.

## Risks / uncertainties

- The loop map assumes the commit is the main handoff, because of `README.md:138`. It could not be checked against
  history.
- If Q1 is answered (a), the guard's Intent section needs rewriting: rule v2 has no collaborative variant.
- If Q2 is answered and the guard-building skills change, the guard's check 4 still holds. Only the skills it points
  at change.
- The 180-line guard is longer than the old one at 139 lines. Watch whether the check is still finished in 2 to 5
  minutes over the first few real runs.

## entropy-guard feedback

Yes. See `feedback.md`. Note 3 concerns this skill: the fresh-session discovery check. Notes 1, 2 and 4 concern the
intent pass and the generator.
