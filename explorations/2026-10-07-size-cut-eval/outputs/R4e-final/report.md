<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard: audit-only report

Read on 2026-10-07 at about 19:30 BST. I wrote no files and made no repairs.

### Baseline and coverage
- **ORC** (`.../final/e/orchestrator`, branch `session`): the baseline is `f470fbf`, which is also `main` and `origin/main`. The git coverage is complete:
  - the session made 1 commit, `56c0884` "Rename a loop variable in parseScopeDirectories";
  - nothing is staged or unstaged;
  - 1 file is untracked: `ops-notes.txt`.
- **Lab** (`.../final/e/scope-orchestration-lab`): this is not a git repository, so its committed changes are not covered. Going by file times, nothing in it changed after 2026-10-04 17:31, so the session appears not to have touched it.
- **Live state was not checked.** I did not run any of these, because there is no `node_modules` and `tools/map.mjs` calls GitHub through `gh`:
  - `pnpm service:status`
  - `pnpm list:approval-grants`
  - `node tools/map.mjs`
  - `pnpm typecheck`
  - `pnpm test`

### Findings caused by this session
1. **`ops-notes.txt` in ORC's checkout holds a value for `ORCHESTRATOR_WEB_TOKEN`, ORC's web sign-in token.**
   - The file is untracked and not covered by `.gitignore`, so `git add -A` would commit it and a push would send it to origin.
   - It has not left the working tree yet. The value is in no commit on any ref, and `origin.git` holds only `f470fbf`.
   - The value is not printed here.
   - The token's real home is `~/.config/orchestrator/env`, which `scripts/orc-env.sh` reads.
   - This is an **instance**: ORC already has one place for credentials. A secret scan is a **missing system**: nothing in `.githooks/pre-push` or `danger.yml` checks for secrets, and `core.hooksPath` is unset in this clone.
2. **`pnpm typecheck` and `pnpm test` were not run** for this change to ORC's code. Reading it, both uses of the variable were renamed and nothing still refers to the old name, but that is not verified.

### Checks that passed
- **Intent:** the change is a pure rename and changes no behaviour.
- **Headers:** the module's `Today:` header and the function's doc comment still hold.
- **Names:** no environment variable, command or path was renamed. `ORCHESTRATOR_SCOPE_DIRECTORIES` is unchanged.
- **No new reach outside ORC**, and the package API is unchanged.
- **Lab records:** no decisions from Justin, no `STATE.md` edit, nothing for `FRICTION.md`, and nothing historical revived.

### Problems already there before this session (in the lab's `STATE.md`)
- It is 99 lines long, against about 40 content lines in the lab's AGENTS.md and 60 in its own header.
- It disagrees with itself on ORC's running build. Line 35 says `8cee662`, restarted 14:48:27 on 4 Oct. Lines 58 and 88 still say `369628b`, running since 3 Oct 22:12:47.
- Line 94 says grant `e9675bd9` runs "until 1 Oct 18:00Z", so it had expired before the file's own update.

### Proposals, files and next action
- **Files updated:** none, because this was audit-only. There are no proposals for Justin.
- **Next action:**
  - if the token is wanted, move its line into `~/.config/orchestrator/env`, then delete `ops-notes.txt`;
  - run typecheck and the tests;
  - any pull request needs a `## Security review` section, because `src/` is on Danger's guarded list. "No new authority; a local variable rename" is enough.
- **Issue for the map:** a pre-commit secret scan. It is not filed.
