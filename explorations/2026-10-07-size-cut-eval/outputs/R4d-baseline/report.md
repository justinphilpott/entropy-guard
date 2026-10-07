<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard report: ORC and the orchestration lab

**Mode:** audit-only, as instructed. I edited nothing, committed nothing and wrote no files. Time read: 2026-10-07 17:32 BST.

### Baselines and coverage
- **ORC** (`.../d/orchestrator`, branch `session`): compared against `0cad5b9`, which is also the merge-base with `origin/main`. Coverage is complete.
  - The session made 1 commit, `d0ad219` "Rename a loop variable in parseScopeDirectories".
  - There are no untracked files.
  - The staged change and the unstaged change cancel each other out, so the working tree is identical to `HEAD` (`git diff HEAD` is empty).
- **Lab** (`.../d/scope-orchestration-lab`): coverage is incomplete. It is not a git repository, so the guard's git commands fail on it. As a stand-in I checked modification times: no file there changed on or after 2026-10-07.

### What was checked
- The what-changed commands on ORC: commits, staged changes and unstaged changes, each read separately.
- Intent, and judgment checks 1 to 11.
- Of the mechanical checks:
  - `git diff --check` on the commits, the staged changes and the unstaged changes: all clean.
  - Code paths named in ORC's README, AGENTS.md and SECURITY-REVIEW.md.
  - The `STATE.md` line count.
  - The `test/core-ties.ts` diff: no allowance changed. The renames match none of its patterns.

### What was not checked
- **Live state:** `ORCHESTRATOR_STATE_DIR`, `pnpm service:status`, `journalctl`, `list:approval-grants` and `status:agent-packages`. These are outside the allowed paths and there is no node_modules.
- **The map:** `node tools/map.mjs` and `--check` were not run, because they call `gh`, which needs the network.
- **Suites:** `pnpm typecheck` and `pnpm test` are forbidden in this brief. `test:e2e` and `api:report` were not triggered: nothing in `web/`, `e2e/` or `src/package-api.ts` changed.
- **Scope package manifests (#198):** outside the allowed paths.

### Findings this session caused
1. **ORC's git index holds a half-done rename of the Scope-directories setting, and it is out of sync with the working tree.**
   - **What is staged:** `ORCHESTRATOR_SCOPE_DIRECTORIES` becomes `ORCHESTRATOR_SCOPE_DIRS`, in 2 places: `SCOPE_DIRECTORIES_ENVIRONMENT` at `src/agent-discovery.ts:17`, and the `vi.stubEnv` at `test/production-composition.acceptance.test.ts:126`.
   - **What is unstaged:** a reversal of both edits.
   - **The consequence:** a plain `git commit` would record the rename, but any test run checks the old name. Tests that pass would not cover what gets committed. This is a defect in the work.
   - **Check 4, the row for environment variable names:** ORC's `README.md` "Run" section, line 81, still documents `ORCHESTRATOR_SCOPE_DIRECTORIES`. If the staged version lands, the README and the code disagree. I checked the other places that row names:
     - README "As a service": does not name the setting.
     - ORC `AGENTS.md`: does not name it.
     - The lab's `memory/`: does not name it.
     - Lab report `2026-09-13-core-refactor-proposal.md` names the old name. That report describes its own day (check 7), so it needs no action.
   - **Live risk, not verified:** when the variable is unset, `parseScopeDirectories` silently returns `[]`. `test/runtime.test.ts` asserts that tolerance. If `~/.config/orchestrator/env` sets the old key, the next "Restart ORC" card would bring ORC up with no Scope agents or packages discovered, and no error. I did not read that file.
   - **Intent:** I found no recorded decision of Justin's authorising the rename, in the lab's `decisions/` or in `STATE.md`. Finishing the rename would also need his env file changed.
2. **`d0ad219` (`entry` renamed to `part`)** changes no relationship, so it produces no finding.

`src/agent-discovery.ts` is on Danger's guarded list, so the pull request will need a `## Security review` section. Danger enforces that on GitHub, so I left it to Danger.

### Problems that were already there
- ORC's `AGENTS.md` names `src/bookwhen.ts`, which does not exist. It was already absent at `0cad5b9`.
- **The lab's `STATE.md` is over its cap, and the two caps disagree.** It has 87 non-blank lines. The lab's `AGENTS.md` ("Keeping state") caps it at about 40, while `STATE.md`'s own header says "Target: sixty lines".
- **`STATE.md` gives two different running builds.** Two places say ORC runs `369628b`, started 22:12:47: "ORC live: 369628b since 22:12:47" and the "ORC:" bullet. A third says "#195 live (`8cee662`, restarted 14:48:27, verified)". None of these was re-read this session. The file was last updated 2026-10-04 17:31.
- **`STATE.md` says #193 is both unmerged and live.** One paragraph says "#193 … built and in review, not merged" and also "#193 is live: #200 merged as `3989cdb`".
- **A grant in `STATE.md` is past its end.** "Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z" is still presented as current.

### Proposals for Justin
None recorded, because this was check-only. One is needed: either the staged rename is unstaged, or Justin decides on the rename. Deciding means updating README line 81 and moving the env file's key to the new name in the same change.

### Files updated
None.

### First next action
Not written to `STATE.md`, because this was check-only. It would be: resolve the staged/unstaged split of `SCOPE_DIRECTORIES_ENVIRONMENT` before any commit, then run `pnpm typecheck && pnpm test` on exactly what will be committed.
