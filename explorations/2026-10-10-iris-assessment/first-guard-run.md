# The lab's session guard, first run at a session's end

Run by the Claude session that installed it, on 10 October 2026 at about 23:00, in report-only mode, from its copy on
scope-orchestration-lab branch `session-guard` (PR #6, not yet merged). The session's map id is
`2026-10-10T2005Z-claude`.

## Baseline and coverage

- **Lab:** branch `session-guard` against `origin/main` `eabe98e`, which it contains: `4e00149` and `58833c7`.
- **Orchestrator:** branch `docs/entropy-assessment-fixes` against `origin/main`: `549c117`. The live checkout
  `~/pro/orchestrator` was fetched, never pulled or checked out, so no restart card was due.
- No pull request was merged this session. Coverage is complete for both branches. The session's other changes, in
  entropy-guard and local-config, are outside this guard's two repositories.

## Checks

- **Code beside its docs:** orchestrator code did not change. The lab's `tools/map.mjs` gained one message; it
  describes itself, and no doc lists the map's output lines.
- **State claims:** `STATE.md`'s "three open questions" agrees with `memory/central-scope.md`, "Waiting"; its pause
  paragraph now points at `memory/central-scope.md`, which quotes `0c28182`.
- **Reach:** no reach changed. The orchestrator docs were corrected to the code; each claim was checked by a targeted
  search (PR #384's description lists them). The guard's two broad `grep` commands were not run.
- **Old names:** `ORCHESTRATOR_BOOKWHEN_API_TOKEN`, `src/bookwhen.ts` and Pi `0.82.1` remain only in `STATE.md`'s
  "Misleading nearby" line, which names them as gone.
- **Times and live facts:** each is dated and sourced: the 61 `STATE.md` commits on 8 October from `git log`; the
  pause from `0c28182`.
- **Justin's decisions this session:** the guard's home (10 Oct) is recorded in `memory/central-scope.md`, in the
  process list (added by this run, `58833c7`) and under "Waiting", and on orchestrator#383.
- **Working rules in force:** nothing touched `web/src/`; nothing was merged or restarted.
- **Merges:** none, so no test logs were due. No orchestrator test reads the documents changed.
- **Names:** new orchestrator prose says "Iris-app". Re-wrapped existing lines keep plain "Iris" four times
  ("Iris's own checkout", "Iris's environment file", "Iris's own kinds", "No subprocess Iris launches"). Reported,
  not changed, while question 3 is open.
- **`node tools/map.mjs --check`** exits 1 for reasons this session did not cause: goal #34 has no open children, and
  two pull requests are over 48 hours old (ms PR #33, finance PR #2). It also printed the new "No ★" line, because the
  map reads the main checkout's `STATE.md`, which lacks the "Where we are now" line until PR #6 merges.

## Findings caused by this session

None open. One was found and fixed during the run: the guard-home decision was attributed in "Waiting" but not in
the process list (`58833c7`).

## Next action

Justin merges scope-orchestration-lab PR #6, then orchestrator PR #384. The guard then runs from `main` at the next
session end, which closes orchestrator#383.

## Second run, from the lab's `main`, at the end of session `2026-10-11T0942Z-claude`

11 October 2026, 10:55 BST, after Justin's "please merge what is still relevant". Build mode: scoped repairs allowed.

- **Baseline:** lab `dd3e7c3`, orchestrator `1c4bbc4` (the last `main` commits before 09:42Z). Merged since: lab PR #6
  (09:45Z) and orchestrator PR #384 (09:53Z). Live Iris runs `3e04128` (`pnpm service:status`, 10:54); the live
  checkout was not pulled, so no restart card was due. Coverage complete.
- **Both pull requests had fallen behind `main`.** Justin settled the names on 11 Oct (orchestrator#42): Iris and the
  Iris agent, with Iris-app retired from files, and a `scripts/retired-words.mjs` check. Merging `main` into each:
  - the lab's `STATE.md` and `memory/core-and-scopes.md` conflicted, and were resolved to `main`'s current state, with
    the ★ line and the guard pointer kept;
  - the guard's three Iris-app became Iris, and its names check now runs the script, since question 3 was answered;
  - orchestrator PR #384 dropped its one-line glossary change for `main`'s, and six Iris-app became Iris.
- **Checks that found something:**
  - **Merge verification:** on PR #384's final head, `pnpm typecheck` and `pnpm lint` passed, and `pnpm test` passed
    1,628 of 1,629. The one failure is #394's known timeout under load (load average 47 on 8 cores), noted on #394
    with this run's numbers. GitHub checks were green. The lab has no tests or workflows.
  - **State claims:** `STATE.md` still said PR #384 was unmerged and the guard had never run; both lines corrected
    (lab `994b905`).
  - **Working rules in force:** ratchet mode (11 Oct) was in `STATE.md` and the user-wide `AGENTS.md`, not in
    `memory/central-scope.md`'s list; added there.
- **Checks that held:** reach (main's code since PR #384's base matches none of the guard's patterns, and every code
  site the lists name still exists); old names (`src/bookwhen.ts`, the Bookwhen token, Pi `0.82.1` now appear nowhere
  in either repository's living docs); `web/src/` untouched; no restart.
- **Pre-existing, not caused here:** `map.mjs --check` exits 1 for goal #34 with no open children and two pull
  requests over 48 hours old (ms PR #33, finance PR #2). The ★ shows again, on #328.
- **Next action:** none from this guard; orchestrator#383 closed through the map tool.
