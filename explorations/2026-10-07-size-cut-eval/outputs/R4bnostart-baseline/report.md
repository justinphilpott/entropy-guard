<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard report: ORC and the orchestration lab

I ran the guard at `eval2/guards/baseline-SKILL.md` as a check only, in its "Plan or suggest-only" mode. I edited nothing, committed nothing and wrote no files.

### Baseline and coverage
- **ORC** (`.../bnostart/orchestrator`, branch `session`):
  - No start commit was given, so the guard compared against the merge-base with origin/main, `0cad5b9` ("ORC at 8cee662"). The guard itself printed "coverage incomplete".
  - Committed this session: `d0ad219` "Rename a loop variable in parseScopeDirectories". It renames `entry` to `part` in `src/agent-discovery.ts` and is harmless.
  - **Unstaged, in no commit:** `src/agent-discovery.ts:17` changes `SCOPE_DIRECTORIES_ENVIRONMENT` from `"ORCHESTRATOR_SCOPE_DIRECTORIES"` to `"ORCHESTRATOR_SCOPE_DIRS"`. `test/production-composition.acceptance.test.ts:126` now stubs the new name.
  - Nothing is staged, and there are no untracked files.
- **Lab** (`.../bnostart/scope-orchestration-lab`): this is **not a git repository**, so I had no baseline and could not detect changes. Every git step failed there, so lab coverage is none. All its files are dated 4 Oct 17:31, before the 7 Oct 17:09 session commit. That suggests the lab was not edited, but file dates are the only evidence.

### Checked
- The Intent checks: whether core gains ties to a specific Scope, model, owner or agent, and whether boundaries are still enforced.
- Judgment checks 1 to 11.
- These read-only commands:
  - `git diff --check` on ORC's commit range and on its unstaged changes: both clean.
  - Code paths named in ORC's `README.md`, `AGENTS.md` and `SECURITY-REVIEW.md` that no longer exist.
  - The count of content lines in the lab's `STATE.md`.
  - The diff of `test/core-ties.ts`, the file that caps how often core may name a specific Scope, model, owner or agent. No allowance changed, including in the unstaged work.
- A search of both repositories for the old and new variable names.

### Not checked
- **ORC's test suites:** `pnpm typecheck` and `pnpm test` were not run, because there is no node_modules and you said not to. I make no claim that the suites pass. `test:e2e` and `api:report` were not triggered: nothing under web/, e2e/ or the browser adapter changed, and `src/package-api.ts` did not change.
- **All live reads:**
  - the env file `~/.config/orchestrator/env`;
  - `pnpm service:status` and `journalctl`;
  - `list:approval-grants` and `status:agent-packages`.

  These are outside the permitted paths or need pnpm. I state nothing about what ORC runs now, its grants, or package approvals.
- **The map of work:** `node tools/map.mjs` and `--check` call GitHub through `gh`, so I did not check map placement or marks (check 10).
- **Decisions by Justin (check 2):** I have no session transcript, and neither repository records a decision dated 7 Oct.

### Findings this session caused
1. **The unstaged rename breaks the variable name ORC's README documents. If merged as it stands, ORC's next restart would quietly lose every Scope agent.**
   - **README and code disagree.** ORC `README.md:81` ("Run") still tells the operator to set `ORCHESTRATOR_SCOPE_DIRECTORIES`. This is guard check 4, row "environment variable names".
   - **Nothing reports an unset value:**
     - `parseScopeDirectories(undefined)` returns `[]`.
     - `test/runtime.test.ts:667` asserts that a missing value is tolerated.
     - `scripts/orc-env.sh` loads any `KEY=value` line without checking it against a list of known keys.
   - **Effect at the next restart:** an env file still holding the old key loads without error, but the old key is ignored. ORC would then start with no Scope directories, so no Scope agent definitions and no Scope packages (`src/runtime.ts:998-999`, `src/web-cli.ts:644-656`).
   - **Concrete case:** the lab's `STATE.md`, recorded 3 Oct, lists Moving Stillness's main and adverts agents as available. Both would vanish without any error after the restart card for this branch.
   - **Not verified:** which key the live env file holds. It is outside the permitted paths.
   - **Intent, step 6:** the code and the test were changed together, against the README. So the test no longer checks the name independently, and it does not authorise the rename. No decision records the rename in the lab's `decisions/`, ORC's `AGENTS.md` or `STATE.md`. The constant's own docstring calls it "the historical environment variable".
   - **Judgment:** a defect in the work (an incomplete rename), not a change of intent. Either revert it, or complete it in one change: README line 81, the live env file, and startup handling of the retired key.
   - **Naming:** the rename also leaves the constant `SCOPE_DIRECTORIES_ENVIRONMENT` holding `..._DIRS`, so one concept now has two spellings.
   - **One owner (check 11):** the name now lives in four places with no single owner: the constant, the test literal, the README, and the env file.
   - This is a **missing system**, because nothing ties an environment variable name the code reads to the README or the live env file, and ORC starts silently with no Scope directories when the key is absent. The README line is the instance.

Checks with nothing to report: the committed change raises no finding, and `core-ties.ts` is unaffected. Check 5 did not fire, because none of the lab's ORC readers changed. No real-use failure is evidenced for `FRICTION.md` (check 9).

### Already there, not caused by this session
- ORC's `AGENTS.md` names `src/bookwhen.ts`, which does not exist. It is also absent at origin/main.
- The lab's `STATE.md` has 87 content lines. The lab's `AGENTS.md` caps it at "about forty", and the `STATE.md` header says "Target: sixty lines", which contradicts that cap.
- The lab's `STATE.md` gives conflicting accounts of what ORC runs. Line 35 says `8cee662`, restarted 14:48:27. Lines 58 and 88 say `369628b`, since 22:12:47. These were recorded on 4 Oct and I did not re-read them.
- The lab's `STATE.md` still lists grant `e9675bd9` "until 1 Oct 18:00Z", which is past its end.
- The lab report `reports/2026-09-13-core-refactor-proposal.md:99` names the old variable. It describes its own day and should stay as it is (check 7).

### Proposals for Justin
There is no intent proposal, because the rename is judged a defect in the work. One design question follows from it: should ORC refuse to start, or at least log, when no Scope directory is configured or a retired key is present? That would reverse the tolerate-missing behaviour asserted at `test/runtime.test.ts:667`. Because this was a check-only run, the question is not recorded anywhere.

### Files updated
None. This was a check-only run.

### First next action
Not written, because this was a check-only run. It belongs in the lab's `STATE.md`: resolve the unstaged `ORCHESTRATOR_SCOPE_DIRS` rename in ORC's `session` worktree, by reverting it or by completing it with the README and the live env file in one change, before anything on `session` is merged or restarted onto.
