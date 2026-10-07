# Integration brief: the session-coherence guard for ORC and the orchestration lab

From `guards-integrator` (v0.4.0), 2026-10-07. Finding ids (F…) and questions (Q…) refer to `assessment.md` and
`questions.md`. The loop it fits into is the loop map in section 5 of `assessment.md`. Nothing below has been
exercised: the targets are read-only snapshots, so every mechanism is `planned` or `unknown`, never `verified` by this
run.

## Placement

- **`session-coherence-guard`**, whose path is provisional on Q2 (recommended: the lab's
  `skills/session-coherence-guard/SKILL.md`).
  - **Trigger:** at the end of every work session that touched ORC or the lab, before the commit that hands off, and in
    ORC before the pull request is opened. That is the latest point at which a stale document, a decision left only in
    `STATE.md`, or an unlisted reach (F1, F2, F9) can still be fixed in the same change. Danger checks the pull request
    afterwards, on GitHub; it checks only that the description has its sections. Merging comes later still: under the
    25 Sep rule, Claude merges once review and tests pass.
  - **Actor:** the agent that did the work (Claude Code, Codex, opencode), or Justin in a session of his own.
  - **Entry point:** a "Before handing off" line in the lab's `AGENTS.md` and in ORC's `AGENTS.md`
    (`patch-provisional.diff`, Q2). Claude Code reaches the lab's file through its `CLAUDE.md` symlink; the other
    agents read `AGENTS.md` directly.
  - **Output:** the guard report, in the session's final handoff message, and in the pull request description for ORC
    changes. The next action goes into the lab's `STATE.md`. Proposals for Justin go to the lab's `decisions/`, marked
    as awaiting him.
  - **Escalation:** a gap too large for the session becomes a GitHub issue placed on the #140 map. Read
    `node tools/map.mjs --check` output, not only its exit code (F13). Never track it in the guard.
  - **Ordering:** after `pnpm typecheck && pnpm test` and the reach search, which the guard asks for when ORC code
    changed; before the pull request; Danger runs after it, on GitHub.
  - **Cost against frequency:** about 1,230 words to read, the git commands in one or two repositories, and an
    `rg` search taking seconds. ORC's tests were not timed here; the lab records about two minutes for ORC's and
    Moving Stillness's suites together (`tools/report.mjs`). The trigger fires a few times a day. The guard adds no
    test run that F12 does not already require, so the cost fits the loop.

## Depth of each check

- **External now:** the guard is a skill, run by hand.
- **Prompted next:** the `AGENTS.md` pointers. Also one line in ORC's `.github/pull_request_template.md`, asking for
  the guard report beside `## Security review`. That template is a path Danger guards, so the line needs its own pull
  request with a security-review section ("No new authority").
- **Embed the stable mechanics as soon as they settle; keep judgment in the guard:**
  - **The reach check (F1, F2):** the parts that are stable become the architecture test. The browser-launch
    confinement is in the settled patch; the DNS pattern and the delegated-reach list wait on Q1. Whether a document's
    list matches the hits stays judgment.
  - **Tests on pull requests (F12):** orchestrator#144. A GitHub Actions job running `pnpm typecheck && pnpm test` is
    recommended over a pre-push hook. A committed hook can sit unenabled unnoticed (FRICTION 2026-09-23), and these
    snapshots cannot show whether either hook is enabled (F15). GitHub is already where Danger runs.
  - **The state directory (F11):** the running ORC publishes where it is (design-review target 5, #62). The guard's
    check then becomes a refusal by the scripts.
  - **The map check (F13):** fix its two false passes (labels review, 4 Oct); the guard keeps "read the output".
  - **Links:** lychee in CI is not installed on this machine, so no guard depends on it yet.
- **Leave as judgment, because the wording still moves:** `STATE.md`'s content, decision wording, and whether a
  document describes its code area.

## Adoption

What each mechanism is, its status, its evidence, and the date:

| Mechanism | Kind | Status | Evidence | Date |
|---|---|---|---|---|
| `session-coherence-guard` | executed check | planned | No guard report exists. The guard has not been run at a session end | 2026-10-07 |
| "Before handing off" pointers in both `AGENTS.md` files | reminder | planned | Provisional patch, awaiting Q2 | 2026-10-07 |
| A fresh session finds the guard | discovery | planned | Not asked. Ask a session with no context, "what must you do before handing off?", once in each repository, for each loader: Claude Code (the lab's `CLAUDE.md` symlink; ORC has no `CLAUDE.md`), and Codex, opencode and Pi (`AGENTS.md`) | 2026-10-07 |
| Danger's security-review and package-API checks | enforced invariant | verified per the record, not re-checked here | `STATE.md` lines 79–81: on orchestrator #179, a pass, then a fail with the section removed, then a pass restored | 2026-10-02 |
| Architecture test (reach, core ties) | executed check, by hand | unknown per session | No CI runs it (F12) | 2026-10-07 |
| `node tools/map.mjs --check` | executed check, by hand | unknown | Known to pass falsely (F13) | 2026-10-04 |
| Pre-push hooks, both repositories | reminder (a summary, never blocking) | unknown | The snapshot has no git configuration for `core.hooksPath` (F15) | 2026-10-07 |
| Daily diary (`tools/report.mjs`) | executed check, by hand | not running daily | The last snapshot is `reports/2026-10-02.json` (F14) | 2026-10-04 |

## Plan

- **Now**, with what exists today:
  - Justin answers Q1–Q3.
  - Apply `patch-settled.diff` (F1–F9, F11) through a pull request in ORC with a `## Security review` section, and a
    commit in the lab.
  - Then apply `patch-provisional.diff`, edited to match his answers.
  - Install `guard/SKILL.md` at the path Q2 settles.
  - Run the guard once at the next session end in each repository, and record the report.
  - Run the fresh-session check above.
- **Next**, light prompting or automation:
  - the pull-request template line;
  - orchestrator#144 as a GitHub Actions job (F12);
  - copy the authority-rules plan from `~/.claude/plans/` into the lab (F9).
- **Later**, stable checks moved into tooling:
  - the Q1 test extension (F2);
  - the `map.mjs` fixes (F13);
  - design-review target 5 (F11);
  - the diary, the weekly review and FRICTION-monthly scheduled through #166 (F14);
  - design-review target 4 for the top-level reports (F7);
  - `README.md` added to Danger's guarded paths (F4).
- **Every gap above already has its owner.** Each is linked to the issue or decision that holds it (#144, #166, #62,
  #154, design-review targets 4 and 5, the labels review), rather than to new parallel work.

## Uncertain

- Whether Claude Code sessions in ORC load `AGENTS.md`, given ORC has no `CLAUDE.md`: not checked.
- Whether `core.hooksPath` is set in either clone: not readable from the snapshots.
- Whether Danger still runs on every pull request: the workflow file is present, and the last recorded proof is from
  2 Oct.
- Whether the lab's changes go through pull requests at all: the lab has no `.github/` in the snapshot.
