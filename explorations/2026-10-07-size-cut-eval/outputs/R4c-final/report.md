<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Session coherence guard report (audit-only: nothing edited, nothing committed)

### Baseline and coverage
- **ORC:** I compared start commit `49aa2e9` (which is also `main` and `origin/main`) with `session` at `10af58b`. Coverage of ORC is complete. The session made 2 commits touching 3 files: `src/agent-discovery.ts`, `src/core/analysis-tools.ts` and `test/architecture.test.ts`. Nothing is staged, unstaged or untracked.
- **Lab Scope:** this copy is not a git repository, so git cannot list its changes and coverage there is incomplete. As a substitute I checked file dates: no file is newer than `STATE.md`, and every file is dated 2026-10-04 17:31. The lab looks untouched.
- **Not checked, because the checks need the live machine or GitHub, which this run excludes:**
  - `pnpm service:status` and `pnpm list:approval-grants` (there is also no `node_modules`).
  - `node tools/map.mjs --check`, which calls GitHub through `gh`.
  - Whether a pull request exists for this branch.
- **Not run:** `pnpm typecheck` and `pnpm test`. You reported both passed.
- **What git shows about live state:** the session's commits exist only on the local branch `session`. Nothing was merged, so no restart onto them could have followed.

### Findings caused by this session
1. **The Analyst's module now makes network calls, which no one has authorised.**
   - Commit `10af58b` adds `latestReleaseTag()` to `src/core/analysis-tools.ts`. It sends an unauthenticated `fetch` to `https://api.github.com/repos/${repository}/releases/latest`.
   - This contradicts four written statements of intent:
     - ORC's `AGENTS.md` "Boundaries" says "Direct network access exists only in `src/core/research-tools.ts` … and in `src/adapters/notifications/ntfy.ts`".
     - The same section says "the analyst reads the filesystem with no network", which is the lethal-trifecta rule.
     - The README's opening lists ORC's external data paths, and GitHub is not one of them.
     - The README "Boundary" section says "additional external data sources … each requires a decision rather than a convenience".
   - Neither the lab's `decisions/` nor `STATE.md` records such a decision.
   - Under the guard's intent rule this is an undecided change of intent, not a fault in the docs. This is an **instance**, not a missing system: the boundary and its test already exist, and the session went past both.
2. **The architecture test was widened to let the new code pass.**
   - `test/architecture.test.ts` line 1309 adds `ANALYSIS_TOOLS` to the list of modules allowed direct network access.
   - So the passing test is not evidence that the boundary holds; under intent rule 6, a test cannot authorise weakening a documented constraint.
   - The test's own title, "…approved modules: Jina reads and ntfy notices", now disagrees with its assertion.
3. **The module's own header is now false.** The "Never:" line of `analysis-tools.ts` says "must not provide network access".
4. **The commit message claims a feature that is not wired up.**
   - "Let the Analyst compare local history with the latest release tag" is not what the code does.
   - `latestReleaseTag` has no caller, and `ANALYST_TOOLS` in `src/core/analyst-agent.ts` is unchanged, so the Analyst cannot reach it.
   - The boundary was loosened, but the feature was not built. Wiring it up would also break the "Never: … must not expose network access" line in `analyst-agent.ts`.
5. **A smaller code note.** Unlike the ntfy and Jina network calls, `latestReleaseTag` has no timeout and no bound on response size, and it puts `repository` into the URL without encoding it.
6. **Security review.** `src/` and `test/architecture.test.ts` are on Danger's guarded list, so any pull request from this branch needs a `## Security review` section. It should answer question 2 of `SECURITY-REVIEW.md`: does this add an outbound channel to an agent that reads private data?

**Checks the session passed:**
- The `entry`→`part` rename in `parseScopeDirectories` changes no behaviour. Its header and the README "Run" description of `ORCHESTRATOR_SCOPE_DIRECTORIES` still hold.
- `src/package-api.ts` is unchanged, so `api:report` is not needed.
- None of these checks applied: the `STATE.md` overwrite, the record of Justin's decisions, reviving a historical file, `FRICTION.md`.

### Problems already there before this session
- **Three "only" or "exactly" claims in ORC's docs that the code already exceeds:**
  - **Subprocesses:** `AGENTS.md` "Boundaries" lists the subprocess modules but omits `src/adapters/orc-service.ts`, which the architecture test allows (from orchestrator#101). It also omits the Chromium launch in `src/adapters/browser/playwright.ts`.
  - **Bookwhen client:** `AGENTS.md` says "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client", but that file does not exist.
    - The test asserts that no file imports `@jphil/bookwhen-client`.
    - The README "Run" section's `ORCHESTRATOR_BOOKWHEN_API_TOKEN` is read nowhere in `src/` or `config/`.
  - **Credentials:** the README says "A credential is read in exactly one place, `src/runtime.ts`", but `src/adapters/scope-credentials.ts` also reads Scope credentials.
- **The guard points at a list that is not there.** It refers to "open: three cases, `STATE.md`", but `STATE.md` contains no such list.
- **`STATE.md` is too long and contradicts itself.**
  - It is 99 lines, 87 of them non-blank. The lab's `AGENTS.md` "Keeping state" caps it at about forty content lines, and its own header says sixty.
  - It gives ORC's running build three ways: line 35 says `8cee662` from 14:48:27, while lines 58 and 88 say `369628b` since 22:12:47. That comes from reading the file as dated 2026-10-04, not a live read.

### Proposals, files updated, next action
- **Files updated:** none, because this was audit-only.
- **Proposal for Justin, to write in the lab's `decisions/` marked as awaiting him (not written):** should the Analyst's module get network access to api.github.com? Three options:
  - Decline: revert `latestReleaseTag` and the allowlist line.
  - Approve, with a security review, and then update `AGENTS.md`, the README, the headers and the test title.
  - Find the tag without the network: local tags read through the existing git tool, or the Researcher, which already has network access and no filesystem access.
- **Next action for `STATE.md` (not written):** branch `session` (`10af58b`) holds this undecided network addition and should not be merged until Justin decides.
- **For the map (orchestrator#140), not checked:** the three pre-existing boundary claims need an issue on the map, if they are not already on it.
