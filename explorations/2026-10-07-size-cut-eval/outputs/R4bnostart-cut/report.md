<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

# Session coherence guard report: ORC and the orchestration lab, 2026-10-07

I ran the guard as a check only. I edited, staged and committed nothing, wrote no files, and installed nothing.

## Baseline and coverage
- **ORC** (`.../bnostart/orchestrator`, branch `session`): no session start point was given, so I followed the guard's fallback and compared against `origin/main` = `7fadf55` ("ORC at 8cee662"). The reflog shows `session` was branched from `main` at that commit, so it is probably the real start of the git history. As the guard requires, I report **coverage incomplete**.
- **The lab** (`.../bnostart/scope-orchestration-lab`) is not a git repository in this copy, so the guard's git commands could not run there. Judging by file modification times, nothing in it changed after 2026-10-04 17:31 (`find -newermt 2026-10-05` returns nothing). I treated it as untouched this session, on that evidence only.
- **What changed in ORC this session:**
  - Committed `1f85beb`, "Rename a loop variable in parseScopeDirectories". It renames `entry` to `part` in `src/agent-discovery.ts` and changes no behaviour.
  - **Unstaged, so in no commit:** the environment variable ORC reads its Scope directories from is renamed from `ORCHESTRATOR_SCOPE_DIRECTORIES` to `ORCHESTRATOR_SCOPE_DIRS`. That is the constant `SCOPE_DIRECTORIES_ENVIRONMENT` at `src/agent-discovery.ts:17`, plus the stub at `test/production-composition.acceptance.test.ts:126`.
  - Nothing is staged and there are no untracked files.

## What I did not check or run, and why
- **`pnpm typecheck && pnpm test`:** not run, as instructed (there is no `node_modules`). Nothing records that the session ran them either.
- **`pnpm service:status` and `pnpm list:approval-grants`:** not run. They need dependencies, and the live state is outside the permitted paths. The running build and the grants are unread.
- **`~/.config/orchestrator/env`:** not read, because it is outside the permitted paths. Finding 2 depends on this file.
- **`node tools/map.mjs --check`:** not run, because it calls GitHub through `gh`. It would not have been triggered anyway: I can see no new issue and no repository joining the work.
- **`node tools/report.mjs --no-tests`:** the guard calls for it because agent discovery's configuration changed. Not run, because it writes `status.html` and a snapshot.
- **`pnpm test:e2e`:** not needed. `web/`, cards and durable work are untouched.

## Findings caused by this session
1. **ORC's README now names a variable ORC no longer reads.** `README.md:81` still says "Set `ORCHESTRATOR_SCOPE_DIRECTORIES` to a comma-separated list of absolute Scope directories." The new name appears in no document:
   - not in `README.md`, `AGENTS.md` or `OPERATOR.md`;
   - not in the `src/cli.ts` help, which names no environment variables at all.
2. **Any installation still setting the old name would silently lose every Scope agent.**
   - `parseScopeDirectories` returns `[]` when the value is unset (`src/agent-discovery.ts:41`), and nothing reads the old name.
   - Both start paths then build the agent directory and `createProductionAgentPackages` from an empty list: `src/web-cli.ts:644/656/665` and `src/runtime.ts:477/998`. Scope agents such as Moving Stillness's, their packages and their durable work would not be discovered. I found no warning anywhere on that path.
   - The setting lives in `~/.config/orchestrator/env`. `scripts/orc-env.sh` reads that file for both `orc.service` and dev mode. I have not read it, so whether it uses the old name is unverified. The README tells operators to set the old name, so it very probably does.
   - This would show up at the first "Restart ORC onto <commit>" card after a merge. Repairing it would need Justin to edit the env file by hand.
   - This is an **instance** (the rename did not bring its documentation or a transition from the old name) on top of a **missing system**, because nothing checks that a key in the env file is one ORC reads. `orc-env.sh` exports any `KEY=value` line, and an obsolete key is ignored without a word.
3. **The rename is unrecorded and uncommitted.** The message of `1f85beb` describes only the loop variable. No decision in the lab's `decisions/`, no ORC document and no commit says why an operator-facing name changes.
   - Applying intent-change rule v2, step 1: this is not a change of intent, because `scope.yaml`, `SCOPE.md`, ORC's README "Direction" section and `AGENTS.md` name no environment variables.
   - It is a **defect in the work**: the rename is incomplete, and it has a consequence that Justin owns. Whether to rename at all is Justin's choice.
4. **The lab's `tools/collect.mjs` would hide finding 2.** Its agents section (`agents()`, line 164) scans `~/scopes/*/agents` directly rather than ORC's configured list. So it would not come back empty: it would keep listing Scope agents that ORC no longer loads, and `status.html` would look healthy. That difference is older than this session; the rename is what makes it matter.

The guard's other checks were not triggered:
- I can see no decision by Justin this session, and `STATE.md` is unchanged.
- No agent-facing text changed, and no tool was renamed.
- The state directory and the durable-work schema are unchanged.
- No session report was added at ORC's root.

## Problems that were already there (listed separately)
- **`STATE.md` is over both of its caps.** It has 87 non-blank lines (`grep -c .`) and 99 in total. The lab's `AGENTS.md` sets "about forty content lines"; `STATE.md`'s own header sets "Target: sixty lines".
- **The running build is stated four times, and the statements disagree.**
  - Line 88: started 2026-10-03 22:12:47 on `369628b`.
  - Line 58: "ORC live: 369628b since 22:12:47".
  - Line 56: came back on `369628b` after the power cut at 11:41 on 4 Oct.
  - Line 35: `8cee662`, restarted 14:48:27 on 4 Oct, verified. This is the latest, and it matches this repository's baseline commit.
  
  All four were read on 4 Oct and are three days old.
- **Grant `e9675bd9` is past its own end date.** Line 94 says it "covers the test entry until 1 Oct 18:00Z".
- **`STATE.md` holds dated events:** restart times, merges and the power cut. The guard says these belong in commit messages or issues.
- **Justin's decisions are held only in `STATE.md`.** These are the 4 Oct interview decisions, the 3 Oct decisions (#194, MS `failure-verdicts`, MS #52) and the 2 Oct decisions (Worktrunk and `gh poi`, Danger "B"). The lab's `decisions/` holds one file, `2026-09-17-async-work-architecture.md`. Some may also be recorded elsewhere, such as local-config `DECISIONS.md`, but I could not check outside the permitted paths.

## Proposals for Justin
- **P1. Drop or complete the environment variable rename.**
  - (a) Drop it and keep only `1f85beb`. I recommend this, because nothing recorded gives a reason for the rename.
  - (b) Complete it. Update `README.md:81`. Read the old name as a fallback, with a startup warning that names both (or refuse to start when only the old name is set). Say in the pull request that `~/.config/orchestrator/env` changes.
- **P2. Add a check that every key in `~/.config/orchestrator/env` is one ORC reads**, so a stale name is reported rather than ignored. This is the missing system from finding 2.
- **P3. Tidy the lab's records (already there before this session).** Move the 2–4 Oct decisions into the lab's `decisions/`, and cut `STATE.md` down to current state under one agreed cap.
- **A learning to record**, which I did not write: "ORC treats an unset Scope-directories variable as no Scope directories, without a message." It is true of ORC, so per the lab's `AGENTS.md` it belongs in the ORC repository.

## Files updated
None. This was a check only.

## Next action for the lab's `STATE.md` (not written; proposed text)
"ORC branch `session`: commit `1f85beb` renames a loop variable and changes no behaviour. On top of it is an uncommitted rename of `ORCHESTRATOR_SCOPE_DIRECTORIES` to `ORCHESTRATOR_SCOPE_DIRS`, which leaves `README.md:81` wrong and would silently drop all Scope agents on a host whose env file uses the old name. Waiting on Justin: drop or complete the rename. `pnpm typecheck` and `pnpm test` have not been run."
