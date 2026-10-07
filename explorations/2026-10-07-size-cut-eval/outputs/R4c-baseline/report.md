<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard report: ORC and the orchestration lab, 7 Oct 2026, read 17:33 BST

I ran it in suggest-only mode. I edited no file in either repository, committed nothing and wrote no files.

### Baseline compared against, and whether coverage was complete
- **ORC:** compared from `0cad5b9` (the given start) to `HEAD` on branch `session`. There are 2 commits. The working tree is clean, with nothing staged, unstaged or untracked. Coverage of ORC is complete.
  - `d0ad219` renames a loop variable in `parseScopeDirectories` (`src/agent-discovery.ts`).
  - `bc5e525` "Let the Analyst compare local history with the latest release tag":
    - adds `latestReleaseTag()` to `src/core/analysis-tools.ts`, which calls `fetch("https://api.github.com/repos/${repository}/releases/latest")`;
    - adds `ANALYSIS_TOOLS` to the direct-network allow-list in `test/architecture.test.ts`.
- **Lab:** `scope-orchestration-lab` is **not a git repository** in this snapshot, so the guard's diff loop failed for it. Coverage of the lab is incomplete. All of its files are dated 4 Oct, which suggests this session did not touch it, but that is not proven.

### What was checked, and what was not
- **Checked:**
  - the intent checks;
  - judgment checks 1–4, 6, 7, 8 and 11 (checks 5 and 9 were not triggered);
  - `git diff --check` on the working tree and on the session's commits: clean;
  - the script that finds code paths named in ORC's documents that no longer exist;
  - the count of `STATE.md` content lines;
  - the core-ties diff (`test/core-ties.ts` is unchanged).
  - I also recounted the agent-name ties in the changed files by hand, using the same rule as `countTieMatches`.
- **Not run:**
  - `pnpm typecheck`, `pnpm test`, `pnpm test:e2e` and `pnpm api:report`: there is no `node_modules`, and the brief said not to run them. `test:e2e` and `api:report` were not triggered anyway.
  - `node tools/map.mjs` and `--check`: they call `gh api`, which is off-limits.
  - `service:status`, `journalctl`, `list:approval-grants` and `status:agent-packages`: they read outside the allowed paths.
- **Not stated:** what ORC runs live, and the state of grants and package approvals.

### Findings this session caused
1. **The Analyst's module gained direct network access, against the documented boundary, and no decision of Justin's authorises it.** This is a change of intent nobody has decided, plus a defect in the work.
   - These now disagree with the code:
     - ORC `AGENTS.md` lines 68–71 ("the analyst reads the filesystem with no network");
     - `AGENTS.md` line 98 ("Direct network access exists only in `src/core/research-tools.ts`… and `src/adapters/notifications/ntfy.ts`");
     - the "Never:" header lines of `src/core/analysis-tools.ts` (line 4, "must not provide network access") and of `src/core/analyst-agent.ts`.
   - README "Boundary" lists "additional external data sources" as needing a decision. The README's opening list of external data paths does not include GitHub.
   - I searched the lab's `decisions/`, `STATE.md` and ORC for an authorisation and found none.
2. **The session widened the enforcer to admit the change** (Intent step 6: a test does not authorise weakening a documented constraint). The network allow-list test was the control for "the analyst has no network". With `ANALYSIS_TOOLS` added, nothing now enforces that rule (check 3). The test's own name, at line 1295, still says "Jina reads and ntfy notices".
3. **Two architecture tests should fail. This is from reading the code; I did not run them.**
   - The agent-tie ratchet: `src/core/analysis-tools.ts` has 7 agent-name matches against an allowance of 6. The new match is "Analyst" in the doc comment at line 369. Fixing it by raising the allowance would itself be a check 6 question for Justin.
   - The network allow-list test: the new expected list is `[core/analysis-tools.ts, adapters/notifications/ntfy.ts, core/research-tools.ts]`, but `sourceFiles()` returns the files sorted, and `toEqual` compares order.
   - So the widened test was evidently never run green.
4. **The commit message claims a capability that is not wired in.** `latestReleaseTag` is exported but not used anywhere. No tool registers it, and the tool list in `analyst.md` is unchanged.
5. **For the security review** (owned by `SECURITY-REVIEW.md` and Danger, not this guard):
   - The `fetch` has no timeout and no size bound, in a module whose header says it owns budgets.
   - `repository` goes into the URL unencoded.
   - Both changed files are on Danger's guarded paths, so the pull request needs a `## Security review` section.

The rename in `d0ad219` raises no finding. The tie count for `agent-discovery.ts` is unchanged at 1.

### Problems already there before this session
- ORC `AGENTS.md` line 102 names `src/bookwhen.ts`, which does not exist. It was already absent at `0cad5b9`.
- The lab's `STATE.md` has 87 content lines. The lab's `AGENTS.md` caps it at "about forty", while `STATE.md`'s own header says "Target: sixty lines": two numbers for one limit.
- `STATE.md` gives what ORC runs three ways, all recorded on 4 Oct and not re-read:
  - line 35: `8cee662`, restarted 14:48:27;
  - line 58: `369628b` since 22:12:47;
  - line 88: `369628b`, started 3 Oct 22:12:47.
- `STATE.md` line 94: grant `e9675bd9` ran "until 1 Oct 18:00Z", so it was already past its end at the 4 Oct update. I did not check it against the live grant list.

### Proposals for Justin, and where they were recorded
- **Should any agent see GitHub release data, and should it be the Analyst?** Giving it to the Analyst puts network access next to private files. The Researcher already reads public pages through Jina, so it may already cover this need without touching the Analyst's boundary.
- **Not recorded**, because this run was check-only. It belongs in a lab `decisions/` file marked "Proposed, awaiting Justin", with a line in `STATE.md`'s "Waiting on Justin" section.
- Until he decides, the recommended defect fix is to remove `latestReleaseTag` and the `ANALYSIS_TOOLS` entry from the network allow-list. That restores the test and the documents to agreement.

### Files updated
None: no edits to `STATE.md`, `decisions/` or `FRICTION.md`.

### First next action
Not written to `STATE.md`, because this run was check-only. It should read: "Revert the Analyst's GitHub fetch (`bc5e525`) and record the GitHub-access proposal for Justin before any pull request."

### Friction in the guard itself
- The guard's diff loop assumes the lab is a git repository and fails noisily when it is not.
- Its outside-the-files commands are hard-coded to `$HOME` paths rather than `$ORC` and `$LAB`.
