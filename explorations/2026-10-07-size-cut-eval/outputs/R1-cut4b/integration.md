# Integration brief: the session-coherence guard for ORC and the orchestration lab

From `guards-integrator`, in plan mode. Finding ids refer to `assessment.md`, questions to `questions.md`. The loop
map is the assessment's section 4 and the guard surfaces are its section 7; this brief adds only what placement needs.
Everything below is provisional on Q3, which decides where the guard lives. Nothing here has been installed or
exercised.

## The loop, where the guard has to sit

- **Smallest unit of change:** one issue on the map (orchestrator#140), worked on a branch, usually in a worktree,
  ending in a pull request. Some lab work is committed directly, such as `STATE.md` overwrites and `FRICTION.md`
  entries.
- **Habitual pauses:** opening the pull request (Danger runs); the Astra review; the merge; the "Restart ORC onto
  <commit>" card; the `STATE.md` overwrite after a verified event; the end of a session, often at night.
- **Where follow-up gets lost:**
  - decisions taken in conversation that land only in `STATE.md` (F4);
  - live facts in `STATE.md` that go stale with each restart (F1);
  - tests nobody runs before a merge (F5);
  - processes that wait for scheduling (F17);
  - the session end, which has nothing to run (F16).

## Placement

- **`session-coherence-guard`** (draft: `guard/SKILL.md`; proposed home: the lab's
  `skills/session-coherence-guard/SKILL.md`):
  - **Trigger:** at session end, before the session's last push or pull request. For a session that merges, before
    the merge, because a merge reaches the live service at the next restart card, which is the last cheap point.
    Run it again before `STATE.md` is overwritten after a verified event.
  - **Actor:** whichever agent ran the session (Claude, Codex, opencode, Astra), or Justin when he works directly.
  - **Entry point:** a one-line pointer in both `AGENTS.md` files (see Plan, Now). Claude Code does not load skills
    from a Scope's `skills/` folder (`reports/2026-09-30-skills-one-home.md` 30–35), so the pointer is what a session
    will meet.
  - **Output:** the report's findings go into the pull request description, beside the `## Security review` section.
    The next action goes into the lab's `STATE.md`. Proposals for Justin go into the lab's `decisions/`, marked as
    awaiting him.
  - **Escalation:** a gap too large for the current change becomes a GitHub issue placed on the map as a sub-issue of
    the branch it serves (ORC `AGENTS.md` 11–12), for example under "Map A: keep the system healthy" (#141). It is
    named in `STATE.md` only if it blocks.
  - **Ordering:** after the commands in its own block (typecheck, tests); before the pull request is opened, so its
    findings can enter the description; alongside `SECURITY-REVIEW.md`, which it does not replace. Danger then
    checks the security section on GitHub.

## Depth of each check

- **External (run by hand), now:** every check in the guard. They are judgment checks: whether a description or the
  code is wrong, whether a decision covers a change, whether a state claim is honest.
- **Prompted, next:** the `AGENTS.md` pointers, and a line in ORC's `.github/pull_request_template.md`. The
  pre-push hooks already print local-config's `push-summary` in both repositories, and a reminder there would reach
  every repository at once. But whether those hooks are enabled is unknown (F20), and the script lives outside this
  system.
- **Semi-embedded, later:** the mechanical parts, each into a check that already exists or is already decided.
  - Tests on every pull request: #144 (F5). When it lands, the guard's commands block shrinks to what CI does not run.
  - Confine `from "playwright"` to `src/adapters/browser/playwright.ts` in `test/architecture.test.ts` (F8).
  - A path and link check over Markdown, such as lychee or a small test, for code paths named in prose (F6, F13).
    Whether lychee is installed was not checked.
  - `node tools/map.mjs --check` and the daily diary, run through ORC scheduling: #166 (F17).
  - Connector names checked across repositories: #198 (F14).
  - A `STATE.md` line-count check, once Q4 names the cap (F2).
- **Fully embedded, later:** grantable task types refused without an independent read: #74 (F19).
- **Not automated:** wording and paths still moving, such as the browser stack, which changed on 3 Oct and is paused
  with Moving Stillness.

## Adoption

- **`session-coherence-guard`:** `planned`. Neither condition has been met.
  - **Trigger fired:** no. The snapshots are read-only and this run may not commit or push.
  - **Found by a fresh session:** not tested.
  - **No configuration evidence either:** the snapshots have no `.git`, so the hooks path and branch protection could
    not be read.
- **To verify once installed:**
  1. In each repository, ask a fresh Claude Code session, and a fresh Codex or opencode session, "what must you do
     before handing off?". The guard counts as found only if each names it and its path.
  2. Run it once at the end of a real session. Its report should appear in that pull request's description.
  3. When F8's test change lands, add a scratch `chromium.launch` in another module, check that
     `test/architecture.test.ts` refuses it, and record the refusal.

## Plan

- **Now** (after Justin answers Q3; the patches can go first):
  - Lab: apply `decision-records.patch`, then `state-update.patch` (F1–F4).
  - ORC: apply `doc-corrections.patch` in a pull request with a `## Security review` section (F6, F7, F10).
  - Install the guard at the path Q3 settles, and add one line to each `AGENTS.md` (F16). Suggested, for the lab's
    `AGENTS.md` under "Keeping state" and for ORC's under "Working Style": "Before handing off, run the session guard,
    `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`, and put its report in the pull
    request." Not in `.claude/`, which is one vendor's folder.
- **Next:**
  - Add a line to ORC's pull request template: "Session guard: run, coverage complete or not, and what it found".
  - Check `git config core.hooksPath` in both clones before relying on any hook (F20).
- **Later:**
  - #144, tests on every pull request (F5).
  - A new issue under "Map A3: security" (#145) for the architecture test's browser gap (F8).
  - A path checker under "Map A2: tests that run themselves" (#143) (F6, F13).
  - #166 for the map check and the diary (F17); #198 (F14); #74 (F19); the `STATE.md` size check after Q4 (F2).

## Uncertain

- Whether a session-end guard already exists outside the snapshot, for example in local-config (Q3, F16).
- Whether the pre-push hooks run in either clone, and whether branch protection requires the Danger check (F19, F20).
- Whether opencode, Codex and Pi load anything from a Scope's `skills/`. The 30 Sep report says they read
  `~/.agents/skills`, which the lab's `skills/` is not linked into. ORC's own agents run with `noSkills: true` and are
  not the audience.
- Whether the line in the pull request description is the right place for the report, or whether Justin wants it in
  `STATE.md` only. This is a small choice, and Justin's to make.
