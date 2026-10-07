<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard report: ORC and the orchestration lab, read 2026-10-07 17:32 BST

### Baseline and coverage
- **ORC** (`.../eval2/r4/cut/b/orchestrator`):
  - The start point is `7fadf55` ("ORC at 8cee662"), which is also `main` and `origin/main`. The working branch is `session`.
  - The session made 1 commit, `1f85beb`. Nothing is staged, 2 files are modified but unstaged, and there are no untracked files.
- **Lab** (`.../eval2/r4/cut/b/scope-orchestration-lab`): **coverage is incomplete.**
  - This copy is not a git repository, so it cannot be diffed.
  - No file in it is newer than 2026-10-04 17:31. The session started 2026-10-07 17:09, so I treated the lab as untouched. That conclusion comes from file timestamps, not from git.
- **Not checked, and why:**
  - **Live state was not read** (`pnpm service:status`, `pnpm list:approval-grants`, cards, durable work). There is no node_modules, and these commands read outside the permitted paths.
  - **`pnpm typecheck` and `pnpm test` were not run**, as instructed. Whether they pass is unknown.
  - **The lab's map check and diary were not run.** `node tools/map.mjs --check` and `node tools/report.mjs --no-tests` both call GitHub through `gh`, and `report.mjs` also writes `status.html` and a snapshot file.
  - **Some files the guard names are outside the permitted paths and were not read:**
    - the rules owned elsewhere (`~/pro/local-config/home/AGENTS.md`, `HOW_NOT_TO_PLAN.md`, `scope/docs/MODEL.md`);
    - ORC's installed env file, `~/.config/orchestrator/env`.
- The guard names `~/pro/orchestrator` and `~/scopes/scope-orchestration-lab`. I applied it to the copies above instead.

### What changed
1. **Commit `1f85beb`**, "Rename a loop variable in parseScopeDirectories", renames `entry` to `part` in `src/agent-discovery.ts`. Behaviour is unchanged. No finding.
2. **Uncommitted and unstaged:** ORC's environment variable for Scope directories is renamed.
   - The constant `SCOPE_DIRECTORIES_ENVIRONMENT` (`src/agent-discovery.ts:17`) changes from `ORCHESTRATOR_SCOPE_DIRECTORIES` to `ORCHESTRATOR_SCOPE_DIRS`.
   - `test/production-composition.acceptance.test.ts:126` now stubs the new name.

### Findings caused by this session

**F1 (serious, uncommitted): the rename would silently turn off Scope agent discovery wherever ORC is configured with the documented name.**
- **Nothing reports the missing setting.** `parseScopeDirectories` returns `[]` with no message when the variable is unset. Three places then build from that empty list:
  - `src/runtime.ts:477`, the agent catalogue;
  - `src/runtime.ts:998`, the Scope packages (`createProductionAgentPackages`);
  - `src/web-cli.ts:644`, the web host's equivalents.
- **The documented name is the old one.**
  - `README.md:81` still tells the operator to set `ORCHESTRATOR_SCOPE_DIRECTORIES`.
  - The code's own comment calls it "the historical environment variable".
  - The service gets its settings from `~/.config/orchestrator/env`, loaded by `scripts/orc-env.sh`. I could not read that file, so whether it sets the old name is **unverified**. It is the only name the docs give.
- **Likely effect:** once merged and restarted through the "Restart ORC onto <commit>" card, every Scope agent and package would disappear without an error, including Moving Stillness and Finance.
- **There is no migration path.** ORC does not fall back to the old name, does not refuse it with a message, and nothing records the change.
- **The test was changed to match the code, but the README was not.** Under intent rule step 6, the code is the wrong side: nothing authorises renaming an operator-facing setting. There is no decision in the lab's `decisions/`, no issue, and the session's commit message describes something else.
- **Classification (intent rule step 1):** a defect in the work, not an adaptation within what is authorised. This is an **instance**: a wrong edit to code whose job already exists.
- **Fix (not applied, check only):** revert the two lines.
- **Where I searched:**
  - README.md, AGENTS.md and every `*.md` in ORC;
  - the help text in `src/cli.ts`, which names no environment variables;
  - `scripts/`, `e2e/`, `.github/`, `dangerfile.js`;
  - the whole lab.

  The old name appears only at `README.md:81` and in the lab's dated report `reports/2026-09-13-core-refactor-proposal.md:99`, which is history and should be left. The new name appears only in the two changed lines.

**F2: the lab's `tools/collect.mjs` would not show F1.**
- Its `agents()` reads `~/scopes/*/agents/*.md` straight from disk, not the directories ORC is configured with. The diary's agents section would stay full while ORC discovers nothing.
- Its durable-work reader (`~/.local/share/orchestrator-proof/async-work/tasks.db`) is unaffected.
- So the guard's "must not come back empty" check passes but does not catch F1.

**F3: the pull request will need a `## Security review` section.** `src/agent-discovery.ts` is guarded (`^src\/` in `dangerfile.js`). This applies to commit `1f85beb` alone too. "No new authority; a local variable rename" is enough for that commit.

### Problems already there (not caused by this session)
- **P1: ORC says nothing when no Scope directory is configured.** `parseScopeDirectories` silently drops an unset variable, relative paths and missing paths, and `test/runtime.test.ts:667` asserts that tolerance. This is a **missing system**: nothing at startup reports "no Scope directories configured", which is why F1 would be silent. The #199 startup log names only agents that were found but unavailable.
- **P2: the lab's `STATE.md` is over both caps.**
  - It has 87 non-blank lines (99 in total).
  - The lab's `AGENTS.md` says about forty content lines; `STATE.md`'s own header says sixty.
  - The two caps still differ.
- **P3: the lab's `STATE.md` contradicts itself about live facts.**
  - The running ORC build is stated three times, and the statements disagree. Line 35 says it was restarted at 14:48:27 on `8cee662` (4 Oct); lines 58 and 88 say it has run `369628b` since 22:12:47 on 3 Oct.
  - Line 94 says grant `e9675bd9` covers the test entry until 1 Oct 18:00Z. That date had already passed when the file was updated on 4 Oct.
  - Line 91 gives Moving Stillness `main` as `c759f96`, but line 32 says MS #53 merged as `fc830aa`.
  - Lines 31–58 hold dated event narrative, which belongs in commit messages or issues.
- **P4: the lab's diary and ORC can disagree about which agents exist.** `collect.mjs` reads every directory under `~/scopes` rather than the set ORC is configured with. This is the root of F2.

### Checks that did not apply this session
- Justin decided nothing.
- No claim in `STATE.md` changed.
- No agent-facing text changed and no tool was renamed.
- Nothing in `web/`, cards or durable work changed, so `test:e2e` is not needed.
- No issue was opened and no repository joined the work.
- No session report was added at ORC's root.
- No learning was recorded in `FRICTION.md`.

### Proposals for Justin
- **On F1:** none needed if the rename is reverted. If he wants the shorter name, that is his decision to record in the lab's `decisions/`. It would need:
  - a migration: read both names, or refuse the old one with a message naming the new;
  - README.md and the env file changed in the same step.
- **On P1:** should ORC log a warning, or refuse to start, when no Scope directory is configured?

### Files updated
None. This was a check only.

### Next action for the lab's `STATE.md` (not written)
"ORC branch `session`: revert the uncommitted rename of `ORCHESTRATOR_SCOPE_DIRECTORIES` to `ORCHESTRATOR_SCOPE_DIRS` before committing; as written it would silently disable Scope agent discovery on the next restart. Then run `pnpm typecheck && pnpm test` and open the PR with a `## Security review` section."
