<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard report: ORC and the orchestration lab

I ran this as a check only. No files were written or edited, and nothing was committed.

### Baseline and coverage
- **ORC** (`orchestrator`, branch `session`): the start point is `7fadf55`, which is also `main` and `origin/main`. Coverage of git is complete:
  - 1 commit, `1f85beb`;
  - 2 staged files;
  - 2 unstaged files;
  - no untracked files.
- **Lab** (`scope-orchestration-lab`): this copy is not a git repository, so it has no baseline. I checked modification times instead. No file is newer than 2026-10-04 17:31, so I found no change. **Coverage of the lab is incomplete.**

### Findings caused by this session
1. **The staging area holds an environment-variable rename that the working tree has reverted.**
   - **What is staged:** `git diff --cached` renames ORC's variable `ORCHESTRATOR_SCOPE_DIRECTORIES` to `ORCHESTRATOR_SCOPE_DIRS`. It is the constant `SCOPE_DIRECTORIES_ENVIRONMENT` at `src/agent-discovery.ts:17`, plus the matching line `test/production-composition.acceptance.test.ts:126`.
   - **What the working tree holds:** `git diff` undoes both lines, so the working tree is identical to HEAD.
   - **What a commit would take:** a plain `git commit` commits the rename. `git commit -a` commits nothing. Any test run checks the working tree, not the commit.
   - **If the rename is committed:**
     - `README.md:81` still says to set `ORCHESTRATOR_SCOPE_DIRECTORIES`, so an untouched file becomes wrong.
     - The live service reads its variables from `~/.config/orchestrator/env` through `scripts/orc-env.sh`. I did not read that file; it is outside the allowed paths. If it uses the documented name, then after the next build and restart `parseScopeDirectories(undefined)` returns `[]` with no error. That is called at `runtime.ts:477` and `:998`, and at `web-cli.ts:644`. ORC would then find no Scope agents and no Scope packages.
     - The tests would still pass, because the constant and the test were renamed together.
     - The lab's `tools/collect.mjs` reads `~/scopes/*/agents` directly, not the variable. Its agents section would therefore stay full and hide the loss.
   - **How it classifies under the guard's intent rule:** a defect in the work, an edit half-reverted and left staged. If the rename was meant, it is an undecided change to a documented operator setting. It has no decision in `decisions/`, no README edit, no migration of the env file and no fallback.
   - This is an **instance**, because the rename is a leftover staged edit, not a job no part of the system owns.
2. **The committed change does not change behaviour and fits the intent.** `1f85beb` renames a loop variable (`entry` to `part`) in `parseScopeDirectories`, and no document names that variable. Two things follow for the pull request:
   - It touches `src/`, which Danger guards (`dangerfile.js:12`), so its description needs a `## Security review` section.
   - It must say which of `pnpm typecheck` and `pnpm test` ran. I ran neither, as instructed, and the repository shows no evidence that the session ran them.

### Problems already there (the session did not change them)
- **The lab's `STATE.md` is over both caps:** 87 non-blank lines (99 in total). The lab's `AGENTS.md` sets "about forty content lines"; the file's own header says "Target: sixty lines".
- **Live facts in `STATE.md` contradict each other:**
  - ORC: "#195 live (`8cee662`, restarted 14:48:27)" against "main process started 2026-10-03 22:12:47 on `369628b`" and "ORC live: 369628b since 22:12:47".
  - Moving Stillness: "`main` `c759f96`" against "MS #53 merged as `fc830aa`".
- **A fact in `STATE.md` is past its end date:** grant `e9675bd9` ran "until 1 Oct 18:00Z", which was already past at the file's 4 Oct update.
- **`STATE.md` is not current-state only:** it holds dated history, such as the 4 Oct power cut and the 2 Oct and 3 Oct entries.
- **ORC gives no warning when no Scope directory is configured.** Finding 1 is the example: a misnamed variable silently hides every Scope agent.

### Not checked
- `pnpm typecheck`, `pnpm test` and `pnpm test:e2e`: not run, as instructed (there is no `node_modules`).
- `pnpm service:status` and `pnpm list:approval-grants`: not run, so the live build and grants were not read. I have no evidence about cards approved or durable work submitted.
- `node tools/map.mjs --check` and `node tools/report.mjs --no-tests`: not run. Both call `gh` (the web) and read real home paths. As far as I can tell, no issue was opened and no repository joined, so the map check was not triggered.
- The env file, the rules files owned elsewhere, and GitHub issues (including #42, application-wide naming) were not read; all are outside the allowed paths.

### Proposals for Justin
- **Only if the shorter name `ORCHESTRATOR_SCOPE_DIRS` is wanted:** record that decision in the lab's `decisions/`. The change would then need to include:
  - `README.md:81`;
  - the live env file;
  - either a fallback to the old name or a startup refusal or warning.

### Files updated
None.

### Next action
This is meant for the lab's `STATE.md`; I did not write it there. Before any commit on ORC branch `session`, unstage the `ORCHESTRATOR_SCOPE_DIRS` rename with `git restore --staged src/agent-discovery.ts test/production-composition.acceptance.test.ts`. Then run `pnpm typecheck && pnpm test`, and open the pull request with a `## Security review` section that says which checks ran.

### Learning
A test run checks the working tree, but a commit takes the staging area. This is a candidate entry for the top of the lab's `FRICTION.md`, marked "(workshop)"; not written.
