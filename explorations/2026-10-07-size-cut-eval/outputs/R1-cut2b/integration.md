# Integration brief: the session-coherence guard for ORC and the orchestration-lab Scope

From `guards-integrator`, 2026-10-07. It covers the draft guard in `guard/SKILL.md`. It reuses the loop map and
findings in `assessment.md` (section 7, and findings F1-F22), and adds only what placement needs. Everything here is
**planned**: no commit, push or install was authorised, the targets are read-only, and the guard's home waits on Q1.

## The loop as it is

- **Smallest unit of change.**
  - In ORC: a branch in a worktree, then a pull request. Danger checks it, Astra reviews it, Claude merges it, and
    Justin approves the restart card.
  - In the lab: a commit to `STATE.md`, `FRICTION.md` or `reports/`. No PR process is visible; the lab has no CI.
- **Habitual pauses.** These five:
  - the PR, where the Security review section is written;
  - the merge;
  - the restart card;
  - the `STATE.md` rewrite "at each verified event";
  - the end of a session, by compaction or the 22:00 cut-off.
- **Where follow-up is lost.** These three:
  - `STATE.md` rewrites drop decisions and unfiled follow-ups (F1, F3);
  - an ORC session never meets the lab's state (F18);
  - kept processes have no runner (F13, F15, F17).

## Placement

- **`session-coherence-guard`.**
  - **Trigger:** at the end of each work session, after the tests and before the last commit, the final `STATE.md`
    rewrite and `node tools/map.mjs stopped`. For an ORC change, also before the PR is marked ready, so the boundary
    check (check 4) lands while the Security review section is being written.
  - **Actor:** the agent that did the work: Claude Code, or Codex and opencode in overnight runs (`tools/map.mjs` 31
    lists them). Not Justin.
  - **Entry point:**
    - the lab's `AGENTS.md`, "Before handing off" (patch 04);
    - ORC's `AGENTS.md`, a pointer to the lab and the guard (patch 05);
    - the briefs for overnight runs, where `STATE.md` 65 already plans to add the map-marking rule.
  - **Output:**
    - the report in the session's final message;
    - the next action in `STATE.md`;
    - decisions in `decisions/`;
    - for ORC changes, a line in the PR's Security review section when a boundary changed.
  - **Escalation:** a gap too large for the change becomes a GitHub issue on the map, under #141 "keep the system
    healthy" or #167 "how we work". An undecided change of intent becomes a proposal for Justin in `decisions/`.
  - **Ordering:**
    1. after `pnpm typecheck && pnpm test` (and `pnpm test:e2e` when its trigger holds);
    2. alongside Danger, which checks a section is present, not its content;
    3. before the diary (`tools/report.mjs`), so the diary draws the corrected state.

## Depth of each check

- **External now (run by hand):** all nine checks, with judgement.
- **Prompted next:** the `AGENTS.md` pointers (patches 04 and 05), and one line in the overnight-run briefs. A
  user-level Claude Code Stop hook could remind as well, but it lives outside the repositories and is Claude-only.
  Keep the repositories' instructions as the source.
- **Semi-embedded later:** move the stable mechanics out of the guard, into these places:
  - check 9 (tests by hand) goes to #144's CI job;
  - check 3 (the "Where we are now" line) goes to `node tools/map.mjs --check` (assessment, section 9);
  - check 6 (the lab's parsers) goes to `tools/collect.mjs` reporting the headings it cannot parse;
  - part of check 4 goes to an architecture-test rule confining `playwright` imports;
  - part of check 5 goes to a test that paths named in ORC's live docs exist, plus a link checker in #144's job.
- **Keep as judgement:** checks 1, 2, 7 and 8, since `STATE.md` wording, decisions and document ownership are still
  moving. Do not automate them.

## Adoption

- **`session-coherence-guard`: planned, not verified.** The trigger has not fired. No fresh session was asked, and
  nothing is installed. To verify once Q1 and Q2 are answered and patches 04 and 05 are applied:
  1. End one real lab session and one real ORC session with the guard. The trigger has fired when its report
     appears in the final message, and `STATE.md` carries the next action.
  2. Ask a fresh Claude Code session started in ORC, with no context, "what must you do before handing off?" It
     should name the guard and its path. Ask the same of a Codex or opencode session, which read `AGENTS.md`. ORC has
     no `CLAUDE.md` (F18), so the Claude Code check is the one most likely to fail; if it does, add
     `CLAUDE.md -> AGENTS.md` as the lab has.
  3. Configuration is not execution: the pointer existing in `AGENTS.md` is not the guard having run.

## Plan

- **Now (needs Justin's answers first):**
  - Q1 and Q2;
  - install `guard/SKILL.md` at the lab's `skills/session-coherence-guard/SKILL.md`;
  - apply patches 04 and 05, and patches 01-03, which are corrections (F1-F12, F15, F17);
  - patch 01's PR carries "## Security review: No new authority".
- **Next:**
  - add the guard line to overnight-run briefs (`STATE.md` 65's planned brief change);
  - after two weeks of runs, read the guard's reports for missed runs and checks that never fire, and trim them.
- **Later, linked to existing work rather than parallel projects:**
  - tests and a link check on every PR: #144 (F13);
  - the diary and the other kept processes run by ORC scheduling: #166 (F15, F21; #60, #70, #182);
  - the architecture-test rules for Playwright and doc paths: under #143, "tests that run themselves and test the
    real thing" (F8, F9);
  - the lab's parser fixes (F16): no issue found; file one under #141.

## Uncertain

- Whether either repository's `.githooks/pre-push` is enabled (`core.hooksPath`): not visible in the snapshot.
- Whether Claude Code loads ORC's `AGENTS.md` without a `CLAUDE.md`: not checked.
- Whether the lab's commits go through PRs: not visible.
- The rules in orchestrator#140's description, which the map's agents follow: not read.
