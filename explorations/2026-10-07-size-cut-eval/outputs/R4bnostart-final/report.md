<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard report (check only: nothing edited, nothing committed)

### Baseline and coverage
- **ORC** (`.../bnostart/orchestrator`): the session started from `a47b2c0`. The reflog shows `checkout: moving from main to session` at that commit, and it is also `origin/main`. Coverage of ORC is complete:
  - 1 commit, `38fc2c5`, "Rename a loop variable in parseScopeDirectories".
  - Unstaged edits to `src/agent-discovery.ts` and `test/production-composition.acceptance.test.ts`.
  - Nothing staged and no untracked files.
- **Lab Scope** (`.../bnostart/scope-orchestration-lab`): this is **not a git repository**, so I could not find a baseline for it, and coverage of the lab is incomplete. Every file in it is dated 4 Oct 17:31, so as far as file times show, the session did not touch it.
- **Not run or not read, with the reason for each:**
  - `pnpm typecheck && pnpm test`: the caller forbade it, and there is no `node_modules`.
  - `node tools/map.mjs --check`: it calls GitHub through `gh`, and web access was forbidden.
  - `pnpm service:status` and `pnpm list:approval-grants`: these read systemd and live state outside the permitted paths.
  - `~/.config/orchestrator/env`: outside the permitted paths.
  - Live changes in general: none were read. The `session` branch is not pushed (the remote has only `main`, at `a47b2c0`).

### Findings caused by this session
1. **The Scope-directories environment variable was renamed in code, and the documentation and the installation's env file were left on the old name.** This change is unstaged.
   - **What changed:** the constant `SCOPE_DIRECTORIES_ENVIRONMENT` in `src/agent-discovery.ts:17` went from `ORCHESTRATOR_SCOPE_DIRECTORIES` to `ORCHESTRATOR_SCOPE_DIRS`. The acceptance test was edited to match.
   - **README is now wrong:** ORC's README "Run" section, line 81, still tells operators to set `ORCHESTRATOR_SCOPE_DIRECTORIES`.
   - **Effect on a running ORC:** `parseScopeDirectories(undefined)` returns `[]` and logs nothing (`src/runtime.ts:477,998`, `src/web-cli.ts:644`). The systemd unit loads `~/.config/orchestrator/env` through `scripts/orc-env.sh`. If that file sets the old name, as the README instructs (I did not read it), then a build and restart from this change would quietly drop every Scope agent and package, with no error.
   - **Tests would not catch it:** `test/runtime.test.ts` uses the constant, and the acceptance test was changed to the new name.
   - **Intent classification:** no decision in the lab's `decisions/`, in `STATE.md` or in ORC's docs authorises this rename. The commit message describes only the loop-variable rename. Where the README, the code and a test disagree, the README is the documented contract and the test was edited to follow the code, so the code is what moved.
   - **Verdict:** as written, this is a **defect in the work**. Whether to rename the variable at all is undecided, and may belong to the open naming issue #42, which is Justin's call.
2. **The commit itself is clean.** `38fc2c5` renames `entry` to `part`, with no change in behaviour. The `Today:` header in `src/agent-discovery.ts` still holds. `src/cli.ts` help text does not mention the variable, and `src/package-api.ts` is unaffected.
3. **Any pull request from this branch needs a `## Security review` section.** It changes `src/`, which `dangerfile.js` lists in `GUARDED`. "No new authority" is a complete answer here. No pull request exists yet.

### Problems that were already there (not caused by this session)
- **A missing or misnamed Scope-directories variable fails silently.** ORC starts with no Scope agents and logs nothing, and the test "tolerates missing or malformed values" asserts that behaviour. Finding 1 is what makes this matter now.
- **`STATE.md` is over both line caps.** It has 87 non-blank lines, against "about forty" in the lab's AGENTS.md and sixty in its own header. These two caps disagree, which is still an open question.
- **`STATE.md` line 3 says "History is in `git log`",** but this copy of the lab has no git repository.
- **The lab's `reports/2026-09-13-core-refactor-proposal.md:99` names the old variable.** It is a dated historical report, so it stays as written.

### Proposals, files and next action
- **Files updated:** none, because this was a check only. No proposal was written to `decisions/` and no issue was placed on the map.
- **Next action (not written into `STATE.md`):** revert the unstaged rename of the environment variable, so the session stays at its committed loop-variable rename. If the rename is wanted, put it to Justin under #42. Done properly, it would:
  - update README "Run";
  - read the old name as a fallback, or log a warning when the old name is set;
  - say in the session's handoff that the env file needs changing.
- **Still to run once dependencies exist:** `pnpm typecheck && pnpm test`.
