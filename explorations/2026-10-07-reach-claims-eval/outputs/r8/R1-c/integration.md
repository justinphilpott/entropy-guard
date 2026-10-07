# Integration brief: the session-coherence guard for ORC and the orchestration-lab Scope

From `guards-integrator`, 2026-10-07. Finding ids (F1 to F25) and the loop map are in `assessment.md`; questions Q1
to Q5 are in `questions.md`. Nothing here was installed or run: the targets are read-only snapshots, and the guard's
home waits on Q1. Every mechanism below is therefore `planned` or `unknown`, except where the lab's own records show
an earlier verification, which is labelled as theirs.

## The loop as it is

- **Smallest unit of change.** One agent session on one map issue. It is a branch and pull request in ORC, and a
  direct commit in the lab: the lab's records show no pull requests of its own, which is not certain.
- **Habitual pauses.** A commit; a pull request (Danger runs); Claude's merge after review and tests; pulling ORC,
  then the restart card; Justin's go-ahead at the end of an evening ("after 22:00, work stays on branches").
- **Where follow-up gets lost.**
  - `STATE.md` is appended to instead of rewritten (F1, F2), and decisions land only there (F4).
  - Tests are not run on pull requests (F9).
  - Map marks are left behind (`tools/map.mjs` flags marks older than 14 hours).

## Placement

- `session-coherence-guard` (`guard/SKILL.md`, to be copied to the lab's `skills/session-coherence-guard/SKILL.md`
  if Q1 is answered as recommended):
  - **Trigger:** at the end of every session that changed ORC or the lab, after the work's own tests and before the
    session's last commit, its pull request, or the merge. It must come before the merge, because once ORC's
    restart card runs, a wrong `STATE.md` or a stale Boundaries list has already been read by the next session
    (F1, F7).
  - **Actor:** the coding agent that did the work (Claude, Codex or opencode), or Justin when he works by hand.
  - **Entry point:** a "Before handing off" section in the lab's `AGENTS.md`, and a two-line pointer in ORC's
    `AGENTS.md` (both in the provisional patches, Q1).
  - **Output:** the guard's report in the last commit's message (the lab) or the pull request's description under
    `## Session coherence` (ORC); the next action written into the lab's `STATE.md`.
  - **Escalation:** a gap too large for the session becomes an issue on the map, orchestrator#140, placed under the
    branch it serves.
  - **Ordering:** after the session's tests; before Danger sees the pull request, so the security-review section can
    cite the reach search; before `node tools/map.mjs stopped <ref>` clears the session's mark, which the guard
    itself does.
  - **Cost against frequency:** a few minutes per session. Reading the guard is about 1,100 words. `pnpm typecheck`
    and `pnpm test` run in under the two minutes `tools/report.mjs` budgets for both repositories' suites; the E2E
    suite took 8.3 to 8.5 seconds in its recorded runs (`orc:OPERATOR.md:34-40`), plus a build. The ripgrep reach
    search is instant, and `map.mjs --check` is a few GitHub calls. Sessions run several times a day. Against the
    cost of F3's incidents (a morning lost to a false restart), this fits. The ORC commands run only when ORC
    changed, so lab-only sessions pay seconds.

## Depth of each check

- **External now:** the whole guard is a skill run by hand.
- **Prompted next:** one line in each repository's `.githooks/pre-push` naming the guard. Check
  `git config core.hooksPath` first; the snapshots cannot show it (F22). Also a `## Session coherence` and a
  `## Package API` prompt in ORC's `.github/pull_request_template.md`.
- **Semi-embedded later:**
  - `pnpm typecheck` and `pnpm test` on every pull request (orchestrator#144, F9);
  - `node tools/map.mjs --check` and the diary on ORC's scheduler (orchestrator#166, Justin's 4 Oct decision, F17);
  - once Q5 is decided, a small check in the lab's `tools/` that `STATE.md` is within the cap and keeps the
    `**Where we are now:** <ref>` form `tools/map.mjs` reads (F15). Both are stable invariants.
- **Fully embedded later:** the reach rule in `orc:test/architecture.test.ts`, extended to Playwright's browser
  launch and `node:dns` (F24) once Q2 says which reaches are allowed.
- **Stays judgment:** intent, whether docs still describe changed code, and state honesty. Their wording and paths
  still move weekly.

## Making it visible to agents

- The smallest change a fresh agent meets at the right moment is a line in each repository's `AGENTS.md`. For ORC,
  that is also where it learns the lab's `STATE.md` exists (F18).
- Skills in a repository's `skills/` folder are not loaded automatically by every tool. Claude Code reads only
  `~/.claude/skills/` (`lab:reports/2026-09-30-skills-one-home.md:30-35`), so the pointer is what makes the guard
  found, not the folder.
- ORC's `AGENTS.md` is a guarded path. The pull request adding the pointer needs a `## Security review` section:
  "No new authority; a documentation pointer."

## Adoption

| Mechanism | Kind | Status | Evidence | Date |
|---|---|---|---|---|
| `session-coherence-guard` | executed check | planned | not run: no session to run it on, targets read-only, home waits on Q1 | 2026-10-07 |
| Pointer in each `AGENTS.md` | reminder | planned | provisional patches, Q1 | 2026-10-07 |
| Fresh-session discovery | — | planned | not asked: no fresh session was run | 2026-10-07 |
| Pre-push reminder line | reminder | planned | hooks exist in both repositories; whether they are enabled is unknown (F22) | 2026-10-07 |
| Danger "Security review" | executed check: a failing status that warns, not blocks, without GitHub Pro (F10) | verified, by the lab's own record, not re-checked here | `lab:STATE.md:79-82`: proven on GitHub with a pass, a fail with the section removed, and a pass restored | 2026-10-02 |
| Architecture test's reach ratchets | executed check | unknown | exists (`orc:test/architecture.test.ts:828,1295`); runs only by hand (F9); not run here, no `node_modules` | 2026-10-07 |
| Tests on every pull request | enforced invariant, once built | planned | orchestrator#144, waiting on Justin | 2026-10-07 |

Adoption counts only when two things hold:
- the guard has run once at its trigger, shown by a completed report in a commit message or pull request;
- a fresh session in each repository, asked what it must do before handing off, names the guard and its path.

Check the second for each way agents load instructions here: Claude Code, Codex and opencode, each in an ORC worktree
and in the lab.

## Plan

- **Now** (after Q1):
  - copy `guard/SKILL.md` to its home and apply the pointer hunks of the provisional patches;
  - apply the settled patches (F1, F2, F4, F7, F8, F11, F12, F13);
  - run the guard at the next session end in each repository, and keep its report as the adoption evidence;
  - ask a fresh session in each repository what it must do before handing off.
- **Next:**
  - the pre-push reminder lines and the pull-request template prompts, after checking `core.hooksPath` (F22);
  - fix `src/adapters/orc-service.ts` to pass an explicit environment (F25);
  - read `ORCHESTRATOR_STATE_DIR` in the lab's `tools/collect.mjs` (F14).
- **Later:**
  - tests on every pull request (orchestrator#144, F9);
  - the scheduled diary and map check through ORC's scheduler (orchestrator#166, F17);
  - the architecture test covering the browser and DNS (F24, after Q2);
  - the `STATE.md` size and format check (F15, after Q5).

  Each of these links to its existing issue or decision, not to new parallel work.

## Uncertain

- Whether Claude Code sessions in these repositories load each repository's `AGENTS.md`: neither has a `CLAUDE.md`.
  Not checked.
- Whether either `.githooks/` folder is the effective hooks path: not readable from the snapshots.
- Whether the lab takes changes by pull request or by direct commit, which decides where the guard's report goes.
- The guard's home, the cap it checks, and the reports check, all pending Q1, Q5 and Q4.
