<!-- Saved by the coordinating session: the run could not write this file itself (the harness refused the write), so it returned the report as text. Text below is the run's report as returned. -->

# Session coherence guard: ORC and Orchestration Lab, 2026-10-04 19:05

Guard: `session-coherence-guard` (eval copy `after-SKILL.md`). Mode: **plan or suggest-only**. This was a check, so nothing was edited or committed.

## Baseline

- **ORC** (`.../r4/after/b/orchestrator`, branch `session`): compared against `9908acb` ("ORC at 8cee662"), the given session start and also `origin/main`. Git coverage is complete.
  - 1 commit, `79ffd42` ("Rename a loop variable in parseScopeDirectories", 18:41:52).
  - 2 uncommitted modified files, no untracked files.
- **Lab** (`.../r4/after/b/scope-orchestration-lab`): **coverage incomplete.** Not a git repository, so no start commit, no `origin/main` and no diff. File modification times used instead: every file 17:31:12, the directory 17:57:02, all before the session's commit (18:41:52); no file newer than `STATE.md`. Nothing shows the session touched the lab.
- **Merged pull requests:** not checked; `gh pr list` needs the web.

## Coverage

Run: the change listing for ORC; `git diff --check 9908acb` on ORC (clean); the stale-path loop over ORC's root `*.md` files; the README checks (environment variables, `pnpm` scripts, Pi `0.82.1` against `package.json`, matching in all four places); Danger's `GUARDED` list against the changed paths; the seam between ORC's Scope discovery and `agents()` in the lab's `tools/collect.mjs`; the lab's `STATE.md` line count, its `**Where we are now:**` line, and the `FRICTION.md` heading format.

Not run: `pnpm typecheck` and `pnpm test` (forbidden by the brief; no `node_modules`); `pnpm test:e2e` (not needed: nothing under `web/`, `e2e/`, `src/web-server.ts` or `src/web-cli.ts` changed); `node tools/map.mjs --check` (calls `gh api`); `git diff --check` on the lab (not a git repository); every live read (below).

The Boundaries check was not triggered: neither changed file is on the guard's list of files that set what an agent can reach.

## Live reads

None taken. `pnpm service:status`, `list:async-work` and `list:approval-grants` read the machine's real systemd unit and ORC's real state directory, outside the allowed paths, and there is no `node_modules`. So none of `STATE.md`'s statements about which build runs, the cards or the grants were verified. `~/.config/orchestrator/env` was not read, because the guard forbids printing it.

## Findings caused by this session

**1. The uncommitted change renames ORC's Scope-directories environment variable and leaves the running configuration behind.**

- `ORCHESTRATOR_SCOPE_DIRECTORIES` becomes `ORCHESTRATOR_SCOPE_DIRS` in the constant `SCOPE_DIRECTORIES_ENVIRONMENT` (`src/agent-discovery.ts:17`) and the stub at `test/production-composition.acceptance.test.ts:126`.
- **The README is now wrong.** `README.md:81`, in "Run", still tells the operator to set `ORCHESTRATOR_SCOPE_DIRECTORIES`. No code reads that name after this change.
- **Nothing falls back to the old name.** `parseScopeDirectories(undefined)` returns `[]` silently.
- **That one value feeds two things.** At `src/runtime.ts:477` and `:998`, and `src/web-cli.ts:644`, it drives both agent discovery and `createProductionAgentPackages`.
- **If it merges,** the next "Restart ORC onto <commit>" card would start ORC with no Scope agents and no Scope packages, unless Justin first edits `~/.config/orchestrator/env` by hand — a fix only he can apply by hand, a design defect under the global rules.
- **This has happened once already:** the lab's `FRICTION.md`, "2026-09-21 — the browser had never worked…", line 733: "ORC was started without its environment, so no Scope directories loaded and the agent did not exist at all."
- **Inferred, not read:** the env file's use of the old name (the README tells operators to set it, and `STATE.md` records Scope agents as available on live ORC).
- **Intent:** the incomplete rename is a **defect in the work** (README not updated, nothing reads the old name, nothing migrates the env file). *Whether* to rename an operator-facing configuration key is **a decision nobody has made**: nothing in `decisions/`, `STATE.md` or the README's "Direction" asks for it; application-wide naming is open as #42, waiting on Justin.
- **The rename does not settle a naming convention:** the doc comment on `parseScopeDirectories` calls the variable "historical"; the constant and the function still say "Directories"; ORC's other variables are split (`ORCHESTRATOR_STATE_DIR` abbreviates; `ORCHESTRATOR_BOOKWHEN_OPS_DIRECTORY` and `ORCHESTRATOR_MOVING_STILLNESS_EVENTS_DIRECTORY` spell it out).
- **Instance or missing system:** an **instance** (a rename that skipped its README and deployed configuration). It also exposes a **missing system**: nothing checks that the `ORCHESTRATOR_*` names in the env file are ones ORC reads, and an empty Scope list starts without a warning.

**2. One variable name is stated in two places, so the rename had to edit both.** The acceptance test stubs the name as a string literal; `test/runtime.test.ts` already imports `SCOPE_DIRECTORIES_ENVIRONMENT`. Under "one owner, not two copies", the test should take the name from the constant.

**3. The lab's overview page would not show finding 1.** `agents()` in `tools/collect.mjs` scans `~/scopes/*/agents` directly, not via ORC's variable, so `status.html` would keep listing Scope agents ORC no longer loads.

**4. The workflow is unfinished.** One commit on `session`, the rename uncommitted on top; nothing pushed (`origin` has only `main`); no pull request. `src/agent-discovery.ts` matches Danger's `GUARDED` pattern `/^src\//`, so a PR needs a `## Security review` section saying the change decides which Scope agents and packages load. No tests run, no counts recorded; `.github/workflows/` holds only `danger.yml`, so nothing else will run them. No issue named, so the work may not be on the map (not checkable without `gh`).

**5. `STATE.md` does not mention this session's work.** A fresh session would not find the uncommitted rename or its risk.

**Commit `79ffd42` raises no finding:** `entry` → `part` preserves behaviour (no other reference in the loop body); the `Today:` header line is still true; `git diff --check` clean.

## Problems that were already there (not this session's)

In the lab's `STATE.md`:
- Too long: 87 non-blank lines against "about forty content lines" (lab `AGENTS.md`, "Keeping state"); its own header says "Target: sixty lines".
- Two builds stated as live: line 35 (`8cee662`, restarted 14:48:27) against line 58 ("ORC live: 369628b since 22:12:47") and line 88.
- "Where we are now" contradicts itself: line 23 "#193 in review, not merged" against line 31 "#193 is live".
- Expired facts: grant `e9675bd9` "until 1 Oct 18:00Z"; a Bookwhen password change "due" since the 27 September leak.
- Decisions in the wrong place: Justin's 3 and 4 October decisions sit in `STATE.md`; `decisions/` holds only `2026-09-17-async-work-architecture.md`.
- Finished items still present, e.g. "Phone (closed 3 Oct)".

In the lab's `FRICTION.md`: headings at lines 635, 665 and 684 (`## 2026-09-21 night —`, `late —`, `evening —`) are skipped by `friction()` in `tools/collect.mjs`.

In ORC's root documents: `AGENTS.md` names `src/bookwhen.ts` ("Boundaries"), which does not exist; `CLASSIFY.md`, `GRANTS.md` and `MCP.md` name browser and MCP files that are gone (`REWORK.md`, `SLICE1.md`, `POLICY-STORE.md` too, but those are history); `README.md:76` tells the operator to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN`, which nothing in `src/` reads.

## Proposals for Justin

None written (check-only). Finding 1 needs one decision: **should ORC's Scope-directories variable be renamed at all?**
- (a) Revert the rename.
- (b) Keep it: ORC reads both names for a time and logs whenever the old one is used; the README changes in the same commit.
- (c) First ask whether the "historical" variable should exist at all; if configured sources replace it, (a) and (b) become unnecessary.

This would go in `decisions/`, marked as proposed.

## Files updated

None (the report file write was refused, as explained).

## First action for the next session

Settle finding 1 before anything is committed or pushed: revert the rename or complete it (option b), and record that in `STATE.md`. Not written there, because this run was a check.
