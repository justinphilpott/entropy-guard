<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

**Session coherence guard report: ORC (`orchestrator`) and the orchestration lab Scope.** I ran it as a check only, in the guard's suggest-only mode. I edited nothing, wrote nothing and committed nothing.

**Verdict:** not ready to hand off. The session left one defect: an unfinished rename of a setting, in uncommitted changes.

## The baseline each repository was compared against
- **ORC:** compared with `START_ORC=0cad5b9` on branch `session`. Coverage is complete.
  - There is 1 commit, `d0ad219` ("Rename a loop variable in parseScopeDirectories"), changing `src/agent-discovery.ts` by 2 lines added and 2 removed.
  - Nothing is staged.
  - 2 files have unstaged changes: `src/agent-discovery.ts` and `test/production-composition.acceptance.test.ts`.
  - There are no untracked files.
- **The lab Scope:** coverage is incomplete. This copy is not a git repository, so there is no git baseline. Every file in it was last modified 2026-10-04 17:31, before the session's commit at 2026-10-07 17:09, so nothing shows the session changed it.

## What was checked, and what was not
- **Checked:**
  - the guard's "what changed" block;
  - `git diff --check` on ORC, which is clean for both the commit and the working tree;
  - the check that file paths named in ORC's `README.md`, `AGENTS.md` and `SECURITY-REVIEW.md` still exist;
  - the core-ties allowance diff, which shows no change;
  - the content-line count of the lab's `STATE.md`;
  - a search of both repositories for the old and new names of the setting;
  - Intent, and judgment checks 1 to 11, against what the session changed.
- **Not checked:**
  - `pnpm typecheck`, `test`, `test:e2e` and `api:report`. There is no `node_modules`, and I was told not to run the suites. `api:report` is not needed, because `src/package-api.ts` is unchanged. The end-to-end trigger did not fire.
  - Live state: `service:status`, `journalctl`, `list:approval-grants`, `status:agent-packages` and `~/.config/orchestrator/env`. All are outside the paths I was allowed to read.
  - `node tools/map.mjs` and `--check`, because the map reads GitHub and I had no web access. So whether this session opened issues or left marks on the map is not known.

## Findings this session caused
1. **An unfinished rename of the setting that tells ORC where Scope directories are** (unstaged). It changes `ORCHESTRATOR_SCOPE_DIRECTORIES` to `ORCHESTRATOR_SCOPE_DIRS` in two places: the constant at `src/agent-discovery.ts:17`, and the string `test/production-composition.acceptance.test.ts:126` gives to `vi.stubEnv`.
   - **Check 4 fails** (the table row for environment variable names). `README.md:81` in its "Run" section still says "Set `ORCHESTRATOR_SCOPE_DIRECTORIES`…".
   - **An install that sets the old name would silently lose its Scopes.** Nothing reads or refuses the old name. `parseScopeDirectories(undefined)` returns an empty list, and `test/runtime.test.ts` asserts that a missing value does not throw. That list feeds both agent discovery and package loading, at `src/runtime.ts:477`, `src/runtime.ts:998` and `src/web-cli.ts:644`. So once a restart card puts this build live, every Scope agent and package would disappear without an error. I did not read the live env file, so whether it sets the old name is not verified. The README is the only place that documents the setting.
   - **Intent: this is a defect in the work, not a change of intent.** No decision records the new name, and the module's own comment calls this "the historical environment variable". The two ways to fix it are:
     - revert the 2 lines;
     - or get Justin's decision, then finish the rename: the README, an explicit refusal or migration for the old name, and the live env file.
   - This is a **missing system**, not just an instance: nothing tells the operator when no Scope directories are configured or an env-file key is not recognised, so any rename of this setting fails silently.
2. **Danger will require a `## Security review` section on any pull request.** `src/agent-discovery.ts` matches the guarded path `^src/` in `dangerfile.js`. Danger owns this check.

Commit `d0ad219` itself, the loop variable renamed from `entry` to `part`, changes no relationship and has no findings.

## Problems that were already there
- ORC `AGENTS.md:102` names `src/bookwhen.ts`, which does not exist. It was already missing at `0cad5b9`.
- The lab's `STATE.md` has 87 content lines. The lab's `AGENTS.md` caps it at "about forty", while the file's own header says "Target: sixty lines", so the two documents also disagree.
- `STATE.md` states what ORC runs three ways, as recorded on 4 October at 17:31:
  - line 35 says `8cee662`, restarted at 14:48:27;
  - line 58 says "ORC live: 369628b since 22:12:47";
  - line 88 says it started on 3 October at 22:12:47 on `369628b`.
- `STATE.md:94` records standing grant `e9675bd9` "until 1 Oct 18:00Z". That end had already passed on the file's own date, 4 October. I did not re-read it live.
- `reports/2026-09-13-core-refactor-proposal.md:99` uses the old name. It is a dated report that describes its own day, so it stays as it is.

## Proposals for Justin
None are needed on intent. If the new name is wanted, that is his decision on a name, and it is not recorded anywhere.

## Files updated
None, because this was a check-only run.

## First next action
The guard says to write this into `STATE.md`, but I could not edit files. It is: revert the unstaged rename in `src/agent-discovery.ts` and `test/production-composition.acceptance.test.ts`, or finish it once Justin decides.
