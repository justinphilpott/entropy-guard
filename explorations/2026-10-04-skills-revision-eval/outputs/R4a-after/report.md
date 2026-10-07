<!-- Saved by the coordinating session: the run could not write this file itself (the harness refused the write), so it returned the report as text. Text below is the run's report, unchanged. -->

# Session coherence guard report: ORC + orchestration lab

Guard: `eval/guards/after-SKILL.md`. Mode: **audit-only** (nothing edited, committed or tested). Run 2026-10-04 19:03 +0100 against the eval copies `eval/r4/after/a/orchestrator` and `eval/r4/after/a/scope-orchestration-lab`.

**This session's change:** one commit on branch `session`, `79ffd42` — renames loop variable `entry` → `part` in `parseScopeDirectories`, `src/agent-discovery.ts` (2 lines). Nothing uncommitted, nothing pushed. Close to the guard's "When not to use" (typo/formatting in one file); run because the brief required it.

## Baseline
- **ORC:** `9908acb` (start commit = `main` = `origin/main`). Coverage complete.
- **Lab: coverage incomplete.** The lab copy has no `.git`, so no baseline. Every lab file's mtime is 17:31, before the 18:41 session commit; the lab directory itself changed at 17:57 (cause unknown).
- **Merged PRs:** not checked (`gh` needs the web); the local `origin.git` holds only `main` at `9908acb`.

## Coverage
Checked: the full diff; the file-header `Today:` line (still true); reach-changing files (untouched); README line 81 on `ORCHESTRATOR_SCOPE_DIRECTORIES` (still true); `GUARDED`, Pi version and seam files (unchanged); intent docs; `git diff --check 9908acb` (clean); lab grep checks.

Not run: `pnpm typecheck` and `pnpm test` (forbidden by the brief); `node tools/map.mjs --check` (needs the web); lab `diff --check` (no git); issue #140's rules and documents outside the allowed paths (not read).

## Live reads
None. `pnpm service:status` and the `orc-env.sh` listings read the host's real ORC, outside the allowed paths, and there is no `node_modules`. No running-system change is in evidence.

## Findings caused by this session
None. The rename preserves behaviour and shadows nothing. Owed before merge:
- **Security review section:** `src/` is in `GUARDED` in `dangerfile.js`, so the PR needs a `## Security review` section ("No new authority; <reason>").
- **Tests:** no CI job runs them (`.github/workflows/` holds only `danger.yml`); they need running locally with counts recorded.

## Problems that were already there
1. Lab `STATE.md` is 87 non-blank lines against "about forty" in the lab's `AGENTS.md`; its own header says "sixty".
2. `STATE.md` gives three answers for which build ORC runs: line 35 `8cee662`; lines 58 and 88 `369628b`.
3. The map line `**Where we are now:** #193 … not merged` (line 23) contradicts "#193 is live" (line 31).
4. Grant `e9675bd9` "until 1 Oct 18:00Z" has expired (line 94); the password change has no status date.
5. Moving Stillness `main`: line 91 says `c759f96`; line 32 says MS #53 merged as `fc830aa`.
6. Justin's decisions of 3 and 4 Oct are recorded in `STATE.md`, not in `decisions/`.
7. Finished items still present: Phone "closed 3 Oct", the Git cleanup and Danger bullets.
8. `FRICTION.md` headings at lines 635, 665 and 684 are skipped by `friction()` in `tools/collect.mjs`.
9. ORC `AGENTS.md` line 102 names `src/bookwhen.ts`, which does not exist; `test/architecture.test.ts` lines 1315–1316 forbid the Bookwhen client.
10. `CLASSIFY.md` and `GRANTS.md` name `src/adapters/browser/service.ts` and `mcp.ts`, which no longer exist. `MCP.md`, `POLICY-STORE.md`, `REWORK.md` and `SLICE1.md` also name missing paths, but they are history.

## Proposals for Justin
None recorded (check-only). Candidate: decide which `STATE.md` cap holds, forty lines or sixty.

## Files updated
None.

## First action for the next session
Not written to `STATE.md` (check-only). It would be: run the tests, then open the PR with a Security review section.
