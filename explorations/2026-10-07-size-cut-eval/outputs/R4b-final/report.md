<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

Session coherence guard report, check only. No files were edited, nothing was committed, and no fixes were made.

## Baseline and coverage
- **ORC** (`.../final/b/orchestrator`): the start commit `49aa2e9` was given. Coverage of the session's work is complete:
  - 1 commit since the start: `516b880`, "Rename a loop variable in parseScopeDirectories", which renames `entry` to `part` in `src/agent-discovery.ts`.
  - Nothing is staged and nothing is untracked.
  - 2 files have unstaged changes:
    - `src/agent-discovery.ts:17` changes `SCOPE_DIRECTORIES_ENVIRONMENT` from `"ORCHESTRATOR_SCOPE_DIRECTORIES"` to `"ORCHESTRATOR_SCOPE_DIRS"`.
    - `test/production-composition.acceptance.test.ts:126` changes the matching `vi.stubEnv` to the new name.
- **Lab** (`.../final/b/scope-orchestration-lab`): this directory is not a git repository, so there is no baseline and **coverage is incomplete**. As a fallback I checked modification times: no file is newer than 2026-10-07 00:00, and the latest is 2026-10-04 17:57. That fits the lab being untouched this session, but it does not prove it.
- **Live changes:** not read. `pnpm service:status`, `pnpm list:approval-grants` and `node tools/map.mjs` were not run, because there is no `node_modules` and no web access. The rename is uncommitted, so it has not reached ORC's restart card through git.

## Checks not run
- `pnpm typecheck && pnpm test`: not run, as instructed. ORC code changed, so as of now nothing in this session shows they pass.
- `node tools/map.mjs --check`: not run (it needs GitHub). The session did not appear to open issues or mark work.
- `pnpm api:report`: not needed, because `src/package-api.ts` did not change.

## Findings caused by this session
1. **ORC's README now names the wrong environment variable.** The "Run" section of `README.md` (line 81) still tells operators to set `ORCHESTRATOR_SCOPE_DIRECTORIES`. With the unstaged change, ORC reads only `ORCHESTRATOR_SCOPE_DIRS`. I searched both repositories (every file, not only markdown) and `src/cli.ts` for the old name. Apart from a historical lab report (below), the README is the only stale mention.
2. **An installation that follows the README loses its Scope agents with no message.** `parseScopeDirectories(undefined)` returns `[]`, and `test/runtime.test.ts` (lines 668–680) asserts that a missing value does not throw. So once ORC restarts on this change with an env file that still uses the old name:
   - Scope agent discovery (`src/runtime.ts:477`, `src/web-cli.ts:644`) finds nothing.
   - Scope packages (`createProductionAgentPackages`) find nothing.
   - Nothing reports it.

   I did not read the live env file at `~/.config/orchestrator/env`. It is outside the allowed paths and holds credentials, so whether the live service uses the old name is unknown. This is an **instance** (a rename that skipped the old-name search). It also shows a **missing system**: nothing warns when a Scope-directory variable is unset or uses a stale name.
3. **The rename works against the module's own description.** The header of `src/agent-discovery.ts` calls it a "compatibility discovery facade", and line 39 says `parseScopeDirectories` "Parses the historical environment variable". Renaming a compatibility name breaks the compatibility it is kept for. The `Today:` header still holds.
4. **The change needs a security review on its pull request.** `src/` is under `GUARDED` in `dangerfile.js`, so a PR carrying this change needs a `## Security review` section. "No new authority" is a sufficient answer: the change adds no new way to reach outside ORC, because the same variable is read under a new name.
5. **The rename is not in the commit.** The commit `516b880` holds only the loop-variable rename. The variable rename is a separate logical change and is not staged.

**Intent:** no authorised-intent file names this variable. That covers `scope.yaml`, `SCOPE.md`, `decisions/`, `memory/authority-rules-step-1.md`, the README's "Direction" and "Boundary", and AGENTS.md's "Boundaries", "Core ships with no…" and "Approval cards". So this is an adaptation within existing authority, carried out with defects (findings 1–3), not an undecided change of intent. Whether to keep the old name as an alias, or change the live env file in step with the restart, involves Justin's machine-local config.

## Problems already there (not caused by this session)
- The lab's `STATE.md` has 87 non-blank lines (99 in total). That is over both limits: the lab's AGENTS.md says "about forty content lines" and the file's own header says sixty. It was not touched this session.
- `SECURITY-REVIEW.md`, section "Which changes ask for this", covers fewer paths than `GUARDED` in `dangerfile.js`. It leaves out:
  - `config/`
  - `package.json` and `pnpm-lock.yaml`
  - `scripts/approve-agent-package.ts` and `scripts/async-work.ts`
  - `test/core-ties.ts`
  - `scripts/source-headers.js`
- The lab's `reports/2026-09-13-core-refactor-proposal.md:99` names `ORCHESTRATOR_SCOPE_DIRECTORIES`. It is a dated historical report, so it should be left as it is.

## Proposals, files updated, next action
- **Proposals for Justin:** none written, because this run was check-only. Candidate: decide how the rename reaches the live env file (an alias during the change, or editing the env file before approving the restart card).
- **Files updated:** none.
- **Next action:** not written into `STATE.md` (check only). Suggested next action:
  - update README "Run", or revert the rename;
  - commit the rename separately;
  - run `pnpm typecheck && pnpm test`;
  - settle the live env-file migration before any restart.
- **Map issue:** none filed. Candidate gap: no warning when Scope directories are unconfigured.
