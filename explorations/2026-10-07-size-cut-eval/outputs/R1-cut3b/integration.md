# Integration brief: the session coherence guard for ORC and the orchestration lab

From `guards-integrator`, 7 October 2026. The guard is `guard/SKILL.md`. Finding ids refer to `assessment.md` §3, and
the real loop is in `assessment.md` §5; neither is repeated here. The targets are read-only snapshots, so nothing below
has been exercised: every adoption item is **planned**.

## The loop, as it bears on placement

- **The smallest unit of change differs by repository:**
  - in ORC, a pull request, merged by Claude once review and local tests pass, then a restart card that Justin
    approves;
  - in the lab, a commit, with no pull request and no CI.
- **The habitual pauses:**
  - opening a pull request, where Danger runs;
  - asking for a merge;
  - the rewrite of `STATE.md` at each verified event;
  - 22:00, after which work stays on branches.
- **Where follow-up gets lost:** in the `STATE.md` rewrite (F1, F3); in merges whose tests ran only locally (F16); in
  map marks left behind; in diary days not run (F17).

## Placement

**Where the guard file lives:** `scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`. The evidence for
this, without asking:

- Justin's 4 Oct decision makes the lab the central Scope for code quality.
- The 30 Sep skills placement (`reports/2026-09-30-skills-one-home.md`) puts a Scope's skills in its own `skills/`
  folder, and the lab's exists, holding `.gitkeep`.
- Keeping it out of ORC avoids putting an owner's workflow into a repository whose rule is to ship with no owner tie.
- It is not placed in `.claude/`.

**`session-coherence-guard`:**

- **Trigger:** at the end of a work session, before the session's last rewrite of `STATE.md`, and, in ORC, before the
  pull request is opened or the merge is asked for. That is the latest point at which a lost decision (F1) or a
  drifted boundary description (F11) is still cheap to fix. Pre-commit is too early, because a session makes several
  commits, and the merge is too late for the pull-request text.
- **Actor:** the coding agent running the session (Claude Code, Codex, opencode or Pi); Justin, when he works by hand.
- **Entry point:**
  - a "Before handing off" section in lab `AGENTS.md`, which Claude Code reaches through `CLAUDE.md`;
  - the same section in ORC `AGENTS.md`;
  - a "Session coherence" section in ORC's PR template, so that a pull request without the report is visibly
    incomplete;
  - `patches/lab-guard-placement.patch` and `patches/orc-guard-pointers.patch` hold all of these.
- **Output:** the guard's report goes in the pull request's "Session coherence" section (ORC) or the commit message
  (lab). The next action goes into lab `STATE.md`.
- **Escalation:** a gap too large for the session becomes an issue on the #140 map, with the `core` label when it needs
  ORC's core. It is named in `STATE.md` "Waiting on Justin" only when it needs his decision.
- **Ordering:**
  - after `pnpm typecheck && pnpm test`, which the guard lists, because CI does not run them (F16);
  - before Danger, which checks the pull request the guard's report goes into;
  - alongside the `SECURITY-REVIEW.md` questions: the guard checks that the section exists for guarded paths, and
    Danger enforces it.

**Depth chosen for each part:**

- **The guard as a whole:** run by hand from a skill, with a prompt in the instruction files and the PR template. Its
  checks are judgement: which document owns a concept, whether a claim is current, whether a change of authority was
  approved.
- **To move into tooling as the system allows:**
  - the environment-variable comparison: a test against an `.env.example` (F12);
  - the map check: scheduled through #166 (F17);
  - the tests: CI through #144 (F16);
  - link checking: lychee in the existing Danger workflow, once its installation is confirmed;
  - the state-file cap: a line count in the lab's pre-push hook, once Q2 is answered (F2).
- **Not to automate:** the wording of `AGENTS.md` boundaries, and the contents of `STATE.md`. Both still move weekly.

## Adoption

**`session-coherence-guard`: planned, not verified.** It counts as adopted only when both of these hold:

1. **Its trigger has fired once.** After the placement patches are applied, run the guard at the end of one real ORC
   session. Expected evidence: a pull request whose "Session coherence" section holds the guard's report with its
   baseline and coverage, plus a `STATE.md` rewrite that names the next action. Until then this is configuration
   evidence only: "the PR template has the section" is not "the guard ran".
2. **A fresh session finds it.** Ask a session with no context, "What must you do before handing off?", once in each way
   agents load instructions here:
   - Claude Code in the lab, through the `CLAUDE.md` symlink;
   - Claude Code in ORC. **ORC has no `CLAUDE.md` (F26).** If the session does not quote ORC's `AGENTS.md`, add the
     lab's `CLAUDE.md -> AGENTS.md` symlink to ORC. That is a new file at ORC's root, and needs Justin's yes.
   - Codex, opencode and Pi, which read `AGENTS.md`.
   Each must name the guard and its path. A pointer from an instruction file counts, even though Claude Code does not
   load the lab's `skills/` folder by itself (`reports/2026-09-30-skills-one-home.md`).

**Enforced invariants.** None are added. The four scripts added to `GUARDED` (F14) are enforced by Danger. For that
change, a permitted failing case to record is a pull request touching `scripts/execution-policies.ts` without a
Security review section, which Danger fails. Not run: it needs a pull request on GitHub.

## Plan

- **Now, with what exists:**
  - Apply `lab-guard-placement.patch` and `orc-guard-pointers.patch`.
  - Run the two adoption checks above.
  - Apply `orc-corrections.patch` through a pull request, with a `## Security review` section, and
    `lab-state-and-decisions.patch`, so the guard starts from documents that are true (F1, F3, F7, F10, F11, F13, F14,
    F23).
- **Next, light prompting:**
  - Add one line to both `.githooks/pre-push` files: "Ran the session coherence guard?" Both hooks never block, by
    design, so this stays a reminder.
  - Before relying on it, check `git config core.hooksPath` in both repositories (F19).
- **Later, stable mechanics into existing places:**
  - tests on pull requests (#144), after which the guard's `pnpm test` line drops (F16);
  - the diary, the map check and the weekly review run through ORC scheduling (#166, #64; F17);
  - the `.env.example` test (F12);
  - lychee in `danger.yml`;
  - the state-file cap check (F2, after Q2).
  - Monthly FRICTION-into-rules (#60) reviews the guard's misses and refines its checks.
- **Gaps that already have an owner, linked rather than duplicated:**
  - F5 → #149;
  - card values and approvals bound to builds → #133 and #137;
  - F28 → #202;
  - F16 → #144;
  - F17 → #166.

## Uncertain

- **Whether Claude Code loads ORC's `AGENTS.md`** without a `CLAUDE.md` (F26). Not checked.
- **Whether `.githooks/` is the effective hooks path** in either repository. The snapshots have no `.git` (F19).
- **Whether `lychee` is installed on athena.** Not checked, because this run read nothing outside the targets. The
  guard runs it only if `command -v lychee` finds it.
- **Whether agents load the lab's `skills/` automatically.** Claude Code reads only `~/.claude/skills/`, according to
  the lab's 30 Sep report. The `AGENTS.md` pointer is the entry point either way.
- **Whether sessions working only in a Moving Stillness repository should run this guard.** The package seam (F28)
  touches them, but that repository was outside this assessment.
