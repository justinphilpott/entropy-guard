# Integration brief: the session coherence guard for ORC and the lab

Written with `guards-integrator` (v0.4.0) for `guard/SKILL.md`. Finding ids (`F<n>`) and the loop map are in
`assessment.md` (sections 3 and 5); questions (`Q<n>`) are in `questions.md`.

This run was read-only, so the guard is placed nowhere yet. Everything below is planned or recommended, not done.
Where the placement depends on Q1, it follows the recommended answer and is marked provisional.

## The loop, as it is

- **The smallest unit of change:**
  - in ORC, a pull request (Danger checks its description);
  - in the lab, a commit, often a rewrite of `STATE.md`.
- **The habitual pauses:**
  - opening and merging a PR;
  - pulling the live checkout, then Justin approving the "Restart ORC onto <commit>" card;
  - each `STATE.md` rewrite;
  - the 22:00 switch to work on branches;
  - context compaction, after which lab `AGENTS.md` says to re-read `STATE.md`.
- **Where follow-up gets lost:**
  - decisions left in `STATE.md` (F1);
  - review recommendations waiting for Justin's word (F4);
  - kept processes with nothing to run them (F12);
  - ORC sessions that never see the lab (F18).

## Placement

- **`session-coherence-guard`** (provisional home: lab `skills/session-coherence-guard/SKILL.md`, per Q1):
  - **Trigger:** at the end of a session, before the last `STATE.md` rewrite and before a PR is marked ready or merged.
    That is the latest cheap moment. Once an ORC PR merges and Justin approves the restart card, a wrong doc or state
    claim is live and gets quoted to him (F2).
  - **Actor:** the working agent (Claude, Codex or opencode), or Justin when he works by hand. ORC's own agents count
    once they work on the map.
  - **Entry point:** one line in each repository's `AGENTS.md` (see Plan, Now). In the lab, that line goes in
    "Keeping state", which every session already reads.
  - **Output:**
    - for ORC, the guard's report goes in the PR description, beside the `## Security review` section;
    - for the lab, it goes in the commit message;
    - the next action goes into `STATE.md`.
  - **Escalation:**
    - a gap too large for this change becomes a GitHub issue placed on the map under orchestrator#140, per lab
      `AGENTS.md`;
    - a change of intent becomes a proposal for Justin in the lab's `decisions/`.
  - **Ordering:**
    - after `pnpm typecheck` and `pnpm test`, so it can report them (F7);
    - alongside Danger, since it checks different things;
    - before the weekly adversarial review, which then audits what the guards let through.

## Depth of each check

The guard's checks sit at different depths:
- **External (judgment), staying in the guard:**
  - decisions recorded (F1);
  - state honesty (F2);
  - docs matching the code (F4, F5);
  - where reports go (F6);
  - learnings.
- **Prompted:** the `AGENTS.md` pointers below, and a PR-template line once Q1 is settled.
- **Semi-embedded now:** `pnpm test` (architecture boundaries), `node tools/map.mjs --check`, and `grep -c . STATE.md`
  for the cap (F3), all run by the guard.
- **To embed later:**
  - the `STATE.md` cap;
  - the map check's failed-read pass;
  - tests on every PR;
  - a check that tools named in agent-facing text exist.

  These are stable mechanics, so they belong in tooling (see Plan, Later). Volatile wording, such as which build runs,
  stays a judgment check.

## Adoption

- **`session-coherence-guard`: not adopted. Status: planned.**
  - Neither condition has been met:
    - the trigger has not fired on a real or scratch session end;
    - no fresh session has been asked what it must do before handing off.
  - Exercising either needs a commit to these repositories, which this run had no approval for.
- **How to verify, once placed:**
  1. Run the guard at the end of one real lab session. Its report should appear in the commit message, and `STATE.md`
     should end within its cap.
  2. Run it at the end of one real ORC session. Its report should appear in the PR description.
  3. In each repository, ask a fresh session with no context: "What must you do before handing off?" Ask once for each
     way agents load instructions:
     - Claude Code (the lab has `CLAUDE.md` linking to `AGENTS.md`; ORC has none, F18);
     - Codex and opencode, which read `AGENTS.md`.
     The guard counts as found only if every one of them names it and its path.
- **What to record for the one enforced invariant the guard relies on today:** a refused failing case. For example,
  a scratch PR that touches `src/` with no security section should show Danger failing. This was recorded on 2 Oct
  (`STATE.md:81`), so it is old evidence.

## Plan

**Now**, with what exists, after Justin answers Q1:
- Apply `patches/lab-decisions-and-state.patch` (F1, F2, F3, F10). That gives the guard a truthful `STATE.md` and a
  `decisions/` folder to point at.
- Add the guard at the agreed path. Add one line to lab `AGENTS.md` "Keeping state": "At the end of a session, run
  `skills/session-coherence-guard/SKILL.md`."
- Add one line to ORC's `AGENTS.md` under "The map of work" naming the same guard by its absolute path. Make it part
  of the same PR as `patches/orc-docs-corrections.patch` (F4, F5, F18). It is a guarded path, so the PR's
  `## Security review` section says: "No new authority; documentation only".
- Run the adoption checks above, and record the result here.

**Next**, light prompting:
- Add a `## Coherence` section to ORC's `.github/pull_request_template.md` (a guarded path), asking for the guard's
  report. Danger could later require it, the same way it requires the security section. Do this only if missed runs
  turn out to be the main failure, as the integrator's maturity path says.

**Later**, stable mechanics into existing tooling, each linked to the work that already owns it:
- **Tests on every PR:** orchestrator#144. Run `pnpm typecheck`, `pnpm test` and the E2E suite in CI.
  - This retires the guard's "did the tests pass" check (F7).
  - It removes the live-checkout hazard of `test:e2e`, because CI's `dist/` is disposable (F13).
  - Until then, the guard keeps the worktree rule.
- **The map check:** have `tools/map.mjs --check` fail on a failed repository read, and read the one repository list
  that Q4 settles. This belongs to the labels follow-up (`reports/2026-10-04-labels-review-astra.md`) (F8, F10).
- **The lab's reads of ORC:** read ORC through a surface ORC declares, not its files. This is ORC #62 and
  design-review recommendation 5 (F9). Until then, the guard's diary check stands.
- **The `STATE.md` cap:** move it into a lab check once Q2 settles the number (F3). There is no lab test suite today,
  so the smallest home is `tools/report.mjs` or a pre-commit line in the lab's `.githooks/`. Enabling a hook needs
  `git config core.hooksPath .githooks`, and whether either clone has it set is unknown.
- **Tool names in agent-facing text:** an ORC test that every tool named in `src/core/*.md` exists, following
  scope-moving-stillness#25's test.
- **Dead names in prose:** a link checker such as lychee, and ast-grep for identifiers named in prose. Neither is
  installed on this machine (checked 2026-10-07 with `command -v`; `/usr/bin/sg` is the login tool, not ast-grep).
  Install one before any check depends on it.
- **The kept processes:** the diary, the weekly adversarial review, FRICTION into rules and the cleanups move to ORC
  scheduling, orchestrator#166, per the 4 Oct decision (F12).

## Uncertain

- Whether Claude Code sessions in ORC load `AGENTS.md`. There is no `CLAUDE.md` in the snapshot (F18). Not checked.
- Whether either clone sets `core.hooksPath`. The snapshots have no `.git`. Not checked.
- Whether GitHub branch protection makes Danger blocking, and whether lab changes go through PRs. Not checked.
- Whether something outside these repositories runs the diary nightly (F12). The evidence conflicts.
- Whether Q1's recommended home holds. If Justin chooses a guard per repository, split the checks: F1–F3 and F8–F10
  go to the lab, and F4–F7 and F13 to ORC. Each repository's `AGENTS.md` then points at its own guard.
