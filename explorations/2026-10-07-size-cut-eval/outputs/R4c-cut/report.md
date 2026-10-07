<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard report: ORC and the orchestration lab

### Baseline and coverage
- **ORC** (`…/r4/cut/c/orchestrator`): compared from `7fadf55` (equal to `main` and `origin/main`) to `session` HEAD `e0af3bd`. The session made 2 commits, `1f85beb` (renames a loop variable in `parseScopeDirectories`) and `e0af3bd` (adds `latestReleaseTag` and widens the architecture test). It changed 3 files: `src/agent-discovery.ts`, `src/core/analysis-tools.ts` and `test/architecture.test.ts`. The working tree is clean: nothing staged, unstaged or untracked.
- **Lab** (`…/r4/cut/c/scope-orchestration-lab`): this copy is not a git repository, so it could not be diffed. File times show nothing changed after 4 Oct 17:31, so the session did not touch it. Coverage of the lab is therefore by file time only.
- **Read:** the guard; ORC's `README.md`, `AGENTS.md`, `SECURITY-REVIEW.md`, `dangerfile.js`, `src/cli.ts` help, `src/core/analyst.md`, the session diff and the relevant architecture and core-ties tests; the lab's `STATE.md`, `AGENTS.md`, `scope.yaml`, `SCOPE.md`, `decisions/`, `memory/` and `tools/`.
- **Not run:**
  - `pnpm typecheck`, `pnpm test` and `test:e2e`: there is no `node_modules`, and the brief said not to run the suites.
  - `pnpm service:status` and `pnpm list:approval-grants`: these are live reads of the real machine, outside the given paths.
  - `node tools/map.mjs --check`: it calls GitHub through `gh`, and the web was not allowed. No issue was opened this session in any case.
  - `node tools/report.mjs`: it writes files.
- **Not read:** the rules owned elsewhere (`local-config/home/AGENTS.md`, `HOW_NOT_TO_PLAN.md`, `scope/docs/MODEL.md`), because they are outside the allowed paths. The guard names `~/pro/orchestrator` and `~/scopes/…`; I used the copies given in the brief.

### Findings caused by this session

1. **The Analyst's module now has direct network access, which the authorised intent rules out, and nobody decided it.**
   - `latestReleaseTag()` in `src/core/analysis-tools.ts` calls `fetch("https://api.github.com/repos/${repository}/releases/latest")`.
   - It contradicts these statements:
     - ORC `AGENTS.md`, "Boundaries": "the analyst reads the filesystem with no network".
     - The same section: "Direct network access exists only in `research-tools.ts` … and `ntfy.ts`".
     - The same section: "Any new authority requires an explicit human choice."
     - `README.md`, "Boundary": "additional external data sources" are "deliberately absent, and each requires a decision". Its opening also lists the only external data paths.
     - The module's own header: "Never: It must not provide network access".
     - `src/core/analyst-agent.ts`: "Never: This agent's tools must not expose network access".
   - I found no decision for it. The lab's `decisions/` holds only `2026-09-17-async-work-architecture.md`. A search of both repositories for `api.github`, `releases/latest` and `release tag` finds only the new code.
   - Classification under the intent-change rule: **an undecided change of intent**.

2. **The enforced boundary was weakened to fit the code.**
   - `ANALYSIS_TOOLS` was added to the allowed list in the architecture test "limits core network I/O to the approved modules: Jina reads and ntfy notices".
   - The test's title was left unchanged, so it now names two approved modules while allowing three.
   - Rule 6 of the intent-change rule applies: a test does not authorise weakening a documented constraint.

3. **`pnpm test` will fail on the core-ties ratchet.**
   - The new doc comment says "so the Analyst can compare…", which counts as an agent-name tie.
   - I computed the count with ORC's own `countTieMatches` (`scripts/source-headers.js`) on the file at each commit: `src/core/analysis-tools.ts` goes from 6 at `7fadf55` to 7 at HEAD, against an allowance of 6.
   - The expected failure is "contains 7 agent matches, above its allowance of 6". I did not run the suite itself.

4. **The commit claims a capability it does not deliver.**
   - Its message is "Let the Analyst compare local history with the latest release tag", but nothing calls `latestReleaseTag`.
   - It is not a registered tool, and it is not in `ANALYSIS_TOOL_CLASSIFICATIONS` or in the tool list in `analyst.md`.
   - It has no test.
   - The result is dead code whose only effect is the widened network boundary.

5. **If it were wired up as written, it would break the security patterns. No model can reach it today.**
   - The `repository` string goes into the URL unchecked. SECURITY-REVIEW pattern 5 says any parameter a model supplies is validated against a schema before use.
   - The fetch has no timeout and no size bound, unlike every other Analyst read.
   - A release tag name is written by the repository's owner, so the agent that holds private files would also see attacker-authored content.

6. **A security review is due.** The change touches `src/` and the architecture test, so Danger requires a `## Security review` section in the pull request. "No new authority" would not be a true answer here. No pull request exists yet.

7. **The rename in `src/agent-discovery.ts` has no effect.** `entry` became `part`, with no other references to it. The tie count stays at 1, and the lab's `tools/collect.mjs` does not read this code.

### Problems that were already there
- **`STATE.md` is over both caps.** `grep -c . STATE.md` gives 87 lines. The lab's `AGENTS.md` sets "about forty content lines" and `STATE.md`'s own header says "Target: sixty lines".
- **`STATE.md` holds dated history**, for example the 4 Oct power cut and the 3 Oct decisions.
- **`STATE.md` states live facts more than once, and they disagree.**
  - "ORC live: 369628b since 22:12:47" and the "ORC:" bullet ("started 2026-10-03 22:12:47 on 369628b") conflict with "#195 live (`8cee662`, restarted 14:48:27)".
  - Grant `e9675bd9` is listed "until 1 Oct 18:00Z", which is past.
- **Justin's 3 Oct and 4 Oct decisions exist only in `STATE.md`.** None of them is in `decisions/`.
- **ORC's `AGENTS.md` lists three subprocess modules, but the architecture test allows four.** It leaves out `adapters/orc-service.ts`, added by #101.

### Proposals for Justin
- **Should the Analyst reach `api.github.com`?** This should be recorded as a proposal in the lab's `decisions/`. Until he decides, `e0af3bd` should not merge. If he says no, drop the function and revert the change to the test's allowed list. If he says yes:
  - Make it a real, classified tool.
  - Validate the repository as `owner/name`, and add a timeout and a size bound.
  - Fix the core-ties count and rename the network test.
  - Update `AGENTS.md`, `README.md` and both "Never:" headers.

### Files updated
None. This was a check-only run.

### Next action (not written into `STATE.md`, per the brief)
Hold `e0af3bd` for Justin's decision on the Analyst's network access. `1f85beb` can go forward by itself.
