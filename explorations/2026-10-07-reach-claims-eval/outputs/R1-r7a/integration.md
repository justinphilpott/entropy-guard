# Integration brief: the session-end guard for ORC and the orchestration lab

From `guards-integrator`. It reuses the loop map and findings in `assessment.md`, and refers to findings by id. One
guard is placed: `session-coherence-guard` (`guard/SKILL.md`), whose intended home is the lab's
`skills/session-coherence-guard/SKILL.md`.

## The loop as it is

- **The smallest unit of change:**
  - in ORC, a pull request from a worktree branch, merged by Claude once review and tests pass (25 Sep rule) and then
    put live through a restart card;
  - in the lab, a direct commit, usually an overwrite of `STATE.md`.
- **Habitual pauses:**
  - a merge request or report to Justin;
  - a restart card waiting for his approval;
  - the overwrite of `STATE.md` "at each verified event";
  - the night handoff.
- **Where follow-up is lost:**
  - superseded lines left in `STATE.md` (F10);
  - decisions held only there (F12);
  - ORC-only sessions that never read `STATE.md` (F16);
  - tests that nothing runs on a pull request (F13);
  - a map check that passes when GitHub cannot be read (F14).

## Placement

- **`session-coherence-guard`:**
  - **Trigger:** at the end of any session that changed ORC (any checkout or worktree) or the lab. It runs after the
    session's tests, and before the last commit, the `STATE.md` overwrite, a merge request, or telling Justin the work
    is done. That is the latest point at which a stale `STATE.md` line, an unrecorded decision or an undocumented reach
    is still one edit away. Pre-commit is too early in ORC, where a session makes many commits.
  - **Actor:** the agent running the session, whether Claude Code, Codex, opencode or Pi; Justin when he edits by
    hand, if he chooses.
  - **Entry point:** two settled edits, both in `settled.patch`:
    - lab `AGENTS.md` "Keeping state" names the guard;
    - ORC `AGENTS.md` gains "Where the work stands, and the end of a session", which points at the lab's `STATE.md`
      and the guard.
  - **Output:**
    - the guard report, in the session's last message to Justin;
    - the next action, written into the lab's `STATE.md`;
    - for an ORC pull request, any reach the search found, written into its `## Security review`.
  - **Escalation:**
    - a gap too large for this change becomes a GitHub issue placed on the map (orchestrator#140);
    - an undecided change of intent becomes a proposal for Justin in the lab's `decisions/`.
  - **Ordering:** after `pnpm typecheck` and `pnpm test`, which the guard checks were run; before Danger, which runs
    on the pushed pull request; alongside `node tools/map.mjs --check`.

**Cost against frequency.** The guard runs several times a day, and one run costs:
- reading the guard, 1,224 words;
- six git commands in one or two repositories;
- one `git grep`, which takes seconds;
- the map check, which needs network access to GitHub.

The test suites are the costly part, at about two minutes for both together (lab `tools/report.mjs` header). The
session should run them anyway, so the guard only checks that they ran. That fits the loop. Nothing needs moving.

## Depth of each check

- **External now.** Intent, decision recording, the honesty of `STATE.md`, and comparing reach against documents all
  stay judgment in the guard.
- **Prompted now.** Two pointers in `AGENTS.md` files (above).
- **To move into tooling as each stabilises:**
  - **The reach comparison**, into `test/architecture.test.ts`, once Q1 settles which modules are approved. The test
    should then see `node:dns`, imports of `playwright`, Pi session construction, and `fetch` passed as a value (F1,
    F2, F3). This is an enforced invariant.
  - **The mechanical parts of `STATE.md`,** into a small check in the lab's `tools/`, once Q3 settles the cap: the
    line count, the `**Where we are now:** #n` form that `tools/map.mjs` reads, and grant lines past their expiry
    (F10, F11). This is semi-embedded.
  - **The map check,** made to fail closed, with one list of repositories (F14). This is semi-embedded, in
    `tools/map.mjs`.
  - **Tests on every pull request,** through #144 (F13). This is semi-embedded, in CI.

  Do not automate the wording of `STATE.md` or the names of the root reports. Both are still moving.

## Adoption

| Mechanism | What it is | Status | Evidence | Date |
|---|---|---|---|---|
| `session-coherence-guard` | executed check | planned | Written in this run. It has not run at its trigger, and the targets are read-only snapshots, so no guard report exists | 2026-10-07 |
| Pointer in lab `AGENTS.md` "Keeping state" | reminder | planned | In `settled.patch`, which applies cleanly to a copy of the snapshot; it is not applied to the live repository | 2026-10-07 |
| Pointer in ORC `AGENTS.md` | reminder | planned | As above. `AGENTS.md` is a Danger-guarded path, so its pull request needs "## Security review: No new authority; documentation only" | 2026-10-07 |
| A fresh session finds the guard | discovery | planned | Not tested. After the patch lands, ask a fresh session with no context "what must you do before handing off?" in three places: Claude Code in the lab, Claude Code in ORC (U2: ORC has no `CLAUDE.md` link), and Codex in ORC. Each must name the guard and its path | 2026-10-07 |
| Danger: Security review and Package API sections | enforced invariant (the section is present, not that its content is right) | unknown in this run | `STATE.md` 79–82 records it verified on GitHub on 2 Oct (pass, fail with the section removed, pass restored). That was not re-observed | 2026-10-07 |
| `.githooks/pre-push`, both repositories | reminder (prints `push-summary`, never blocks) | unknown | The snapshots have no `.git`, so `core.hooksPath` cannot be read (F18). Configuration evidence would still not show that a hook ran | 2026-10-07 |
| `test/architecture.test.ts` reach checks | enforced invariant when run | unknown | Runs only by hand (F13). Its lists omit Chromium, Pi, `node:dns` and the phone connector path (F1 to F3). Not run here, because `node_modules` is absent | 2026-10-07 |
| `node tools/map.mjs --check` | executed check, by hand | unknown | Fails open when a `gh` read fails, and reads 6 of the 9 repositories (F14; labels review, 4 Oct) | 2026-10-07 |

Gathering execution evidence needs a commit or a push to the live repositories, and neither was authorised in this
run. Every mechanism therefore stays `planned` or `unknown`.

## Plan

- **Now** (with what exists):
  - Apply `settled.patch` and install `guard/SKILL.md` at the lab's `skills/session-coherence-guard/SKILL.md` (F17,
    F16, F12, F10, F5, F4, F7, F20).
  - Run the guard at the end of the next session that touches either repository, and keep its report.
  - Ask the fresh-session question above.
  - Put Q1 to Q3 and A1 and A2 to Justin (`questions.md`). Q1 to Q3 are already listed in the updated `STATE.md`.
- **Next** (light prompting or automation):
  - With Justin's yes, add one line to the user-wide `~/pro/local-config/home/AGENTS.md` naming the guard for sessions
    in ORC or the lab. That file reaches every tool (`reports/2026-09-30-skills-one-home.md` 17–25), so it covers U2.
  - After Q3, add the `STATE.md` check to `tools/` and call it from the guard's command block.
  - Fix the map check to fail closed, as part of the labels work (`reports/2026-10-04-labels-review-astra.md`), not
    as a parallel project.
- **Later** (stable mechanics into existing tooling):
  - After Q1, widen the architecture test's reach checks, and apply `provisional-Q1.patch` edited to the answer.
  - Run the tests on every pull request (#144), and the diary on a schedule (#166, F15).
  - Move Scope bindings out of `config/installation.ts` (#152, F8, F9). After that, the guard's core-ties check
    shrinks to "no allowance rose".

## Uncertain

- Whether Claude Code sessions in ORC load ORC's `AGENTS.md` without a `CLAUDE.md` link (U2). Not checked.
- Whether either repository's hooks path is set (F18). Not checkable from the snapshots.
- Whether the user-wide `AGENTS.md` already names a session-end ritual for these repositories. It was not read.
- Whether ORC's own agents will ever edit these repositories. If they do, the guard needs a trigger in ORC's durable
  work, which does not exist yet.
