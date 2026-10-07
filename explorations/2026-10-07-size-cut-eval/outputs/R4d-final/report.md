<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard report: ORC and the Orchestration Lab (audit only, nothing edited, nothing committed)

### Baseline and coverage
- **ORC** (`.../d/orchestrator`): the session started from `a47b2c0`, which is `main` and `origin/main`. Coverage is complete. The branch `session` holds 1 commit, `38fc2c5` "Rename a loop variable in parseScopeDirectories". It has no upstream and has not been pushed.
- **Lab** (`.../d/scope-orchestration-lab`): this copy is **not a git repository**, so no git checks could run and coverage is incomplete. Every file in it has a modification time of 2026-10-04 17:31, so nothing suggests the session touched it. `STATE.md` was not overwritten.
- **Not checked**, because the brief ruled them out:
  - `pnpm typecheck && pnpm test`
  - `pnpm api:report` (not needed: `src/package-api.ts` did not change)
  - the live reads: `pnpm service:status`, `pnpm list:approval-grants`, `node tools/map.mjs [--check]`
- Nothing shows the session made a live change. The branch is unpushed and no issue or map mark is evident.

### Findings caused by this session
1. **A rename of an environment variable is staged, then undone in the working tree, so `git diff HEAD` shows nothing.**
   - ORC's git index (the staging area, which is what the next commit holds) renames `ORCHESTRATOR_SCOPE_DIRECTORIES` to `ORCHESTRATOR_SCOPE_DIRS` in two files:
     - `src/agent-discovery.ts:17`, the `SCOPE_DIRECTORIES_ENVIRONMENT` constant
     - `test/production-composition.acceptance.test.ts:126`
   - The working tree reverses both lines. `git status` shows `MM` for both files.
   - A plain `git commit` would land the rename. The code and the test in the index agree with each other, so the tests would probably still pass and would not catch it.
   - **Why it matters:** if the rename lands, ORC's `README.md:81` ("Run") still tells the operator to set `ORCHESTRATOR_SCOPE_DIRECTORIES`. `src/runtime.ts:477` and `:998` read the variable through `parseScopeDirectories`, which returns `[]` without any error when the variable is unset. If the installation's environment file sets the old name, as the README instructs, the next restart would find no Scope directories for agent definitions or packages. I did not read that file, because it holds secrets and is outside the allowed paths.
   - **Intent:** no decision covers this rename, and the session's commit message describes only the loop variable. I judge it a **defect in the work**, a leftover in the index, not an undecided change of intent.
   - **Repair (not applied):** `git restore --staged src/agent-discovery.ts test/production-composition.acceptance.test.ts`, which makes the index match `HEAD` and the working tree.
2. **The committed change (`entry` renamed to `part`) does not change behaviour.**
   - The module's `Today:` header and README "Run" still hold.
   - `src/cli.ts` does not mention the variable.
   - `pnpm typecheck` and `pnpm test` are **not shown to have run this session**: nothing runs them by itself (#144).
   - `src/` is in `dangerfile.js` `GUARDED`, so the pull request needs a `## Security review` section, for example "No new authority; renames a local variable."

**Old name elsewhere:** the lab's `reports/2026-09-13-core-refactor-proposal.md:99` names it too. That file is a historical report and should be left as it is.

### Problems already there before this session
- The lab's `STATE.md` is 99 lines, 87 of them not blank. That exceeds both caps: the lab's AGENTS.md says about 40 content lines, and the file's own header says sixty.
- `STATE.md` contradicts itself about which ORC build is running. Line 35 says `8cee662`, restarted 4 Oct at 14:48:27. Lines 58 and 88 say `369628b`, running since 3 Oct at 22:12:47.
- `STATE.md:94` says grant `e9675bd9` lasts "until 1 Oct 18:00Z", which had already expired by the file's own date of 4 Oct.

### Proposals for Justin, files updated, next action
- **Proposals for Justin:** none. The staged rename is a defect, not a change of intent. If he does want the rename, it needs three things: a decision, a README "Run" update, and a migration of the environment file through a restart card.
- **Files updated:** none, because this was audit only.
- **Next action:** unstage the rename before the next commit, then run `pnpm typecheck && pnpm test`. This was not written into `STATE.md`, because the run was audit only.
