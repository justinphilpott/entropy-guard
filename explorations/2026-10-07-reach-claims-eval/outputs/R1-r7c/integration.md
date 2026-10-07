# Integration brief: the session coherence guard for ORC and the orchestration lab

From `guards-integrator` (v0.4.0), run on 2026-10-07. It covers the one guard, `guard/SKILL.md`. Findings (F…) and
questions (Q…) are those in `assessment.md` and `questions.md`. The targets were read-only snapshots. Nothing was
installed and nothing has run, so every mechanism below is `planned` or `unknown`.

## The loop as it is

The loop map is in `assessment.md` §6. These parts matter for placing the guard:
- **The smallest unit of change:** a commit on a branch, in either repository.
  - ORC's changes reach `main` through a pull request. Danger checks it. Claude merges once review and tests pass
    (lab `decisions/2026-09-25-claude-merges-after-review.md`, from the settled patch).
  - The lab's own flow is unknown: no CI and no PR template. The two pre-push hooks, one per repository, only print a
    summary.
- **The habitual pauses:**
  - opening a PR;
  - merging it;
  - pulling ORC's checkout, so that ORC raises its restart card;
  - rewriting `STATE.md` "at each verified event";
  - stopping for the night, when work stays on branches after 22:00.
- **Where follow-up gets lost:**
  - decisions written only into `STATE.md`, which is then overwritten (F1);
  - sessions in ORC's checkout, which are never sent to `STATE.md` (F21);
  - processes kept on 4 Oct that nobody runs (F19, F22).
- **Who does each handoff:**
  - Claude, Codex and opencode do the work.
  - Justin approves cards, decides, and merges where Claude does not.

## Placement

- **`session-coherence-guard`:**
  - **Trigger:** at the end of a work session, before the session's last commit or push. When a PR is open, run it
    before asking Justin for anything on that PR. This is the latest point where a wrong `STATE.md` line or a
    missing decision record is still cheap to fix. It must run before the overwrite of `STATE.md` that ends the
    session, not after.
  - **Actor:** the agent that did the session's work.
  - **Entry point:** a "Before handing off" section in the lab's `AGENTS.md` and in ORC's `AGENTS.md`, both drafted in
    `patch-provisional.diff` under Q4. The guard itself goes to the lab at `skills/session-coherence-guard/SKILL.md`;
    the lab's `skills/` folder already exists.
  - **Output:** the report in the PR description under `## Session coherence` for ORC work, or in the commit message
    for lab-only work. The next action goes into `STATE.md`'s "Next".
  - **Escalation:** a gap too large for this change becomes an issue placed on the map, as a sub-issue under
    orchestrator#140. A change of intent becomes a proposal in the lab's `decisions/`.
  - **Ordering:** after `pnpm typecheck && pnpm test` and before the PR's `## Security review` section is final. The
    guard's guarded-path check reads that section, and Danger re-checks it on GitHub.
  - **Cost:** 12 checks, of which 10 fire only when their area changed, plus one `git grep`, a read-only probe of the
    diary's readers, and, for ORC, the test suite the session should run anyway. That is about 2-5 minutes, a few times a day. It fits the loop. The costliest
    check, the reach search, fires only on ORC code that launches, connects or reads credentials.

## Depth of each check

- **External now:** the guard is a skill run by hand.
- **Prompted next:** add one line to both `.githooks/pre-push` files, "Ran the session coherence guard? (lab
  `skills/session-coherence-guard/SKILL.md`)". It should never block, matching the hooks' own rule. This helps only
  where `core.hooksPath` is set (unknown, F13).
- **Mechanical parts move to tooling once they are stable:**
  - **Reach (F6, F7):** after Q1, widen `test/architecture.test.ts` to see `fetch` passed as a value, `node:dns`, and
    imports of libraries that launch or connect (`playwright`). The guard's search then becomes the test, and the
    guard keeps only the judgment: is the new reach authorised?
  - **Tests on every PR (#144):** once Justin picks GitHub Actions or a pre-push hook, the guard drops its
    `pnpm typecheck && pnpm test` line for ORC.
  - **The state-file cap (F5):** after Q5, a line count can join `node tools/map.mjs --check`, which already exits 1
    on a stray issue. It is stable enough to automate.
  - **Stale paths in documents (F9, F18, F20):** a link and path checker such as lychee. It is not installed (checked
    2026-10-07), so it stays planned.
- **Kept as judgment:** whether a change fits authorised intent; whether a live fact is fresh; whether a decision was
  taken. These are not automatable.

## Adoption

| Mechanism | What it is | Status | Evidence | Date |
|---|---|---|---|---|
| `session-coherence-guard` at session end | executed check | planned | not installed; it waits on Q4, and no run at its trigger has happened | 2026-10-07 |
| A fresh session finds the guard, in the lab | instruction pointer | planned | the lab's `CLAUDE.md` is a symlink to `AGENTS.md`, so Claude Code would load the pointer; the pointer is not yet written | 2026-10-07 |
| A fresh session finds the guard, in ORC | instruction pointer | unknown | Codex and opencode load `AGENTS.md`; ORC has no `CLAUDE.md`, so whether Claude Code loads ORC's `AGENTS.md` is unknown | 2026-10-07 |
| Pre-push reminder line | reminder | planned | the hooks exist in `.githooks/`; whether they are enabled is unknown (no git configuration in the snapshot) | 2026-10-07 |
| Danger security-review and package-API checks | executed check, not an enforced invariant (warns, does not block, without GitHub Pro) | verified 2026-10-02, per lab `STATE.md` 79-81; not re-observed | "proven on GitHub (pass, fail with the section removed, pass restored)" | 2026-10-02 |
| Architecture test, widened for reach | enforced invariant, once in CI | planned (Q1, #144) | — | 2026-10-07 |

**To count the guard as adopted, two things must hold.**
1. One completed guard report must exist at its trigger: a PR description's `## Session coherence` section, or a lab
   commit message.
2. A fresh session in each repository, with no context, must name the guard and its path when asked "what must you do
   before handing off?" Check Claude Code in both repositories, and Codex or opencode in ORC.

## Plan

- **Now**, with what exists today, once Q4 is answered:
  - Apply `patch-settled.diff`. It records the steward's decisions and corrects `STATE.md` (F1-F4).
  - Copy `guard/SKILL.md` into the lab at `skills/session-coherence-guard/SKILL.md`.
  - Apply the Q4 hunks of `patch-provisional.diff`, which add the two "Before handing off" pointers.
  - Run the guard once at the next session end.
  - Ask a fresh session in each repository what it must do before handing off (F21, F22).
- **Next:**
  - Add the pre-push reminder line to both hooks, and check `git config core.hooksPath` in both checkouts.
  - Add `CLAUDE.md` → `AGENTS.md` in ORC, as the lab has, if Claude Code is found not to load it. That is a new file in
    ORC; Justin's say-so first.
- **Later:**
  - Widen the architecture test after Q1 (F6, F7).
  - Run tests on every PR (#144).
  - Run the diary, weekly review and FRICTION mining through ORC scheduling (#166, #60, F19).
  - Add the state-cap check to `map.mjs --check` after Q5.
  - Add a path checker when one is installed.

## Uncertain

- Whether either `.githooks/` folder is the effective hooks path: no git configuration in the snapshot.
- Whether Claude Code sessions in ORC load its `AGENTS.md`.
- Whether lab changes go through pull requests at all. That decides whether the guard's report lands in a PR or a
  commit message.
- The guard's reach search uses `git grep --untracked`, so new, uncommitted files are searched too. It has not been run
  in a real checkout: the snapshot has no `.git`.
