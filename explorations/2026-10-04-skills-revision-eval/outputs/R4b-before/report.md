# Session-end guard report: orc-lab-entropy-guard

**entropy check: not clean. Nothing updated or filed, because this was a check-only run. Needed: ORC `README.md` line 81 (map); tests not run (practice).**

Kinds of drift this session caused:

- **map**: ORC's `README.md` still names the old environment variable.
- **practice**: the suites were not run on the change, and the rename is uncommitted, with no PR.
- **state** and **reader**: none caused by this session. The state drift listed at the end was already there.

## Step 0: what this session changed

- **ORC, committed on branch `session`:** `79ffd42`, "Rename a loop variable in parseScopeDirectories" (`entry` became `part` in `src/agent-discovery.ts`). This is internal only.
- **ORC, uncommitted in the working tree:** the environment variable that lists Scope directories was renamed from `ORCHESTRATOR_SCOPE_DIRECTORIES` to `ORCHESTRATOR_SCOPE_DIRS`. The constant is `SCOPE_DIRECTORIES_ENVIRONMENT` in `src/agent-discovery.ts:17`, and one test stub changed with it, at `test/production-composition.acceptance.test.ts:126`.
- **No PR, no merge, no push.** `main` and `origin/main` are both `9908acb`.
- **Lab:** no files changed. The fixture's lab is not a git repository, so I checked file times instead: no file in it is newer than 17:31, and the session started at 18:41.
- **Live events and Justin's decisions:** none.

## Checks

1. **Tests: fired, not met.** ORC code changed, but `pnpm typecheck`, `pnpm test` and `pnpm test:e2e` were not run, because there is no `node_modules` and this run was told not to. `pnpm test:e2e` is in scope too: `src/web-cli.ts:644` and `src/runtime.ts` read this variable when ORC composes itself at startup. Reading the code, the stub and the constant match and `test/runtime.test.ts` uses the constant, but that is a reading, not a run.
2. **ORC's docs against its code: fired, one finding.**
   - **The finding.** An environment variable was renamed, and `README.md:81` still says "Set `ORCHESTRATOR_SCOPE_DIRECTORIES` to a comma-separated list of absolute Scope directories." It has to change in the same PR as the code.
   - **`AGENTS.md`** does not name the variable, so it needs no edit.
   - **Path check:** it printed one line, `AGENTS.md names missing src/bookwhen.ts`. That is older than this session: `AGENTS.md` is unchanged since `9908acb`, and the guard's own "Why" cites it from 4 Oct.
   - **Header `Today:` lines:** the one in `src/agent-discovery.ts` ("The load method retains path-bearing compatibility fields…") is still true. The test file has no `Today:` line.
   - **Danger:** `src/agent-discovery.ts` matches Danger's guarded pattern `^src/`, so the PR needs a `## Security review` section.
3. **Names that agents read: fired, one live hit.** I searched for `ORCHESTRATOR_SCOPE_DIRECTORIES` in the guard's search set and then across both whole trees.
   - **Live hit:** `orchestrator/README.md:81`, the same line as check 2.
   - **Deliberately historical:** `scope-orchestration-lab/reports/2026-09-13-core-refactor-proposal.md:99`. It is a dated report, so it stays as it is.
   - **Nothing else.** No hits in `src/core`, `AGENTS.md`, `SECURITY-REVIEW.md`, the lab's `STATE.md`, `AGENTS.md`, `SCOPE.md`, `memory/`, `skills/` or `tools/`.
4. **Superseded designs: did not fire.** Nothing here acted on a root report or a lab report.
5. **The lab's readers: did not fire.** The variable is not one of the formats the guard lists, and `tools/*.mjs` neither names it nor reads `process.env`. I did not run `node tools/report.mjs`, because it rewrites `status.html`.
6. **Learnings: did not fire.** Nothing broke in real use.
7. **Decisions: did not fire.** Justin decided nothing this session.
8. **STATE.md: no line is affected by this session.** Nothing merged or restarted, and STATE does not name the variable. I did not run `pnpm service:status`: there is no `node_modules`, and no live fact changed. The older problems in STATE are listed at the end.
9. **The map: did not fire.** No issues were opened, closed or worked on. `node tools/map.mjs --check` was not run, because it needs GitHub.

## Before this rename merges

- **The live env file may set the old name.** The concern is ORC's machine env file, `~/.config/orchestrator/env`, which `scripts/orc-env.sh` loads for `orc.service`. I could not read it, because it is outside this run's paths. If it sets `ORCHESTRATOR_SCOPE_DIRECTORIES`, then on the first restart after this merges, `parseScopeDirectories(undefined)` returns `[]`. ORC would then find no Scope agents, and nothing would report an error.
- **What to do.** Either rename the key in the env file when the restart card is approved, or have the code also read the old name. The PR should say which.
- **One more stale name.** The constant is still called `SCOPE_DIRECTORIES_ENVIRONMENT`, while its value is now `…_SCOPE_DIRS`.

## Already there before this session (not caused by it, not fixed)

The guard's checks turned these up, and its own "Why" describes them as they stood at 17:31. They belong on the map under orchestrator#140 if they are not filed there already. I could not check GitHub.

- **`AGENTS.md` names a file that does not exist:** `src/bookwhen.ts`.
- **The lab's `STATE.md` breaks its own rules in four ways:**
  - **Length:** 87 content lines (`grep -c .`), against "about forty" in the lab's `AGENTS.md` and "sixty" in STATE's own header.
  - **Contradiction:** line 23 says "#193 … in review, not merged", and line 31 says "#193 is live".
  - **Two builds named as running:** `369628b` (lines 58 and 88) and `8cee662`, restarted at 14:48:27 (line 35).
  - **Expired grant:** grant `e9675bd9` is listed, "until 1 Oct 18:00Z" (line 94).
