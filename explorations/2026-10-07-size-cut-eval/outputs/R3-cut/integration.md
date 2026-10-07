# Integration brief: agentic-architecture guard

From `guards-integrator` v0.4.0, run on 2026-10-07 against the read-only snapshot. Finding ids (F1-F15) refer to
`assessment.md`.

**The guard:** `guard/SKILL.md`, which replaces `skills/entropy-guard.md` in place.

**Provisional on Q1.** This brief assumes the steward answers (b), "authorised edits are still expected". If the
answer is (a), "frozen", the brief shrinks to the demotion described under Plan.

## Loop as it is

- **Smallest unit of change:** one commit made by an agent session or by the steward. No pull request template and
  no CI exist in the snapshot.
- **Habitual pause:** the end of a session, before commit. `AGENTS.md:72` already puts the guard there. The kickoff
  at session start was the other pause, and the patch demotes it.
- **Where follow-up got lost** (F7):
  - run "Pickup" sections (`runs/001-moving-stillness-status/RUN.md:112`);
  - `architecture/PICKUP.md`, now superseded;
  - the conversation-only kickoff packet.

  After the patch, the `ROADMAP.md` Status block is the one place follow-up goes.

## Placement

- **Trigger:** at the end of any session that changed files, before commit. Reading sessions change nothing and need
  no guard. The commit is the last cheap moment, because a reader in a later session cannot tell a reverted claim
  of authority from a real one (F1).
- **Actor:** the agent that made the authorised edit, or the steward when editing by hand.
- **Entry point:** `AGENTS.md:72`, "Before committing non-trivial changes, run skills/entropy-guard.md". It is
  unchanged, and the path is kept so this pointer, `AGENTS.md:103` and `skills/README.md:8` stay valid. Agents
  meet it automatically:
  - Claude Code, through the `CLAUDE.md` symlink;
  - Pi, which loads `AGENTS.md` by default (`runs/001-moving-stillness-status/RUN.md:74`).
- **Output:** the guard's report goes in the commit message. Its next action is written into the `ROADMAP.md`
  Status block.
- **Escalation:** a change that would present the repository as current authority, or add live work, stops. It is
  recorded as a proposal for the repository owner in `DECISIONS.md`, or taken to `../personal-agent` or
  `../../scope`, as the guard's intent rule and first check say. Pre-existing problems (F3, F4, F13) go to the
  Status block's next action 2, not into the guard.
- **Ordering:** the only guard. The kickoff is demoted, so nothing runs before it.

## Depth

- **External plus Prompted:** a skill run by hand, with the standing instruction at `AGENTS.md:72` as the prompt.
  Edits to a reference-only repository should be rare. Missed runs are not yet the main failure, so no hook is
  proposed.
- **Automated:** only the link check, and only when `lychee` is installed (F9, C13). Link resolution is a stable
  mechanical invariant. Status wording is not, so it stays a judgment in the guard.
- **Demoted:** two "decided, not built" surfaces, the "Prompted" reminder (`skills/entropy-guard.md:118`) and
  `ROADMAP.md:69`, "automated coherence checks on hooks". The reference-only status removes their reason, and they
  are frozen with ROADMAP rather than built.

## Adoption

`guard/SKILL.md` is **planned, not verified.** Neither adoption condition could be exercised from a read-only
snapshot with no git:

- **Trigger fired once:** not done. It needs a scratch commit in the real repository, which this run is not
  authorised to make.
- **A fresh session finds it:** not done. It needs a session with no context in the real repository.

**What counts as configuration evidence.** `AGENTS.md:72` points at `skills/entropy-guard.md`, and Claude Code loads
`AGENTS.md` through `CLAUDE.md`. That is evidence of configuration, not of execution.

**To verify, once the patch and the guard are applied:**

1. **Fresh session check.** Ask a fresh Claude Code session in the repository: "What must you do before handing off
   a change here?" It should name `skills/entropy-guard.md` and say the repository is reference-only. Ask the same
   of a Pi session.
2. **Scratch commit check.** On a throwaway branch, make an edit that adds an unchecked item to `ROADMAP.md`'s
   "Working towards next". Run the guard. Its first check should flag the edit and route it to a proposal. Record
   the date, and delete the branch.
3. **Cleanup check (C13).** Run the guard's link command. Note whether `lychee` was installed, and which links
   failed.

## Plan

- **Now:**
  - Apply `status-correction.patch` (F1, F2). It does not depend on Q1-Q3.
  - Replace `skills/entropy-guard.md` with `guard/SKILL.md` if Q1 is answered (b).
  - Apply cleanup C1-C13 (F3, F4, F9, F13).
  - Run the three verification steps above.
- **If Q1 is answered (a), frozen:**
  - Mark `skills/entropy-guard.md` historical, in the same way the patch marks `skills/session-kickoff.md`.
  - Remove the instruction at `AGENTS.md:72`.
  - Drop `guard/SKILL.md`.
  - Skip the cleanup.
- **If Q2 is answered "still copied":** add the template check named in `assessment.md` section 13, and fix F8 in
  `components/scope/template/`.
- **Next and Later:** nothing is justified. A reference-only repository with rare edits does not warrant hooks or
  CI.

## Uncertain

- Whether the real checkout has hooks enabled (`git config core.hooksPath`, `.git/hooks/`). The snapshot has no
  `.git`.
- Whether OpenCode, listed as a secondary interface in `MANIFEST.md:11`, loads `AGENTS.md`.
- Whether `lychee` is installed on the machine that edits this repository.
- The upstream ref the guard compares against. `origin/main` is assumed; the snapshot shows no remote or branch
  names.
