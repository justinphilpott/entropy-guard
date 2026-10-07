# State — orchestration-lab

Updated 2026-10-07, an entropy-assessment rewrite of the 2026-10-04 17:31 file; **nothing live was re-read**. **Current state only.** History is in `git log`, open work in GitHub issues,
what broke in real use in `FRICTION.md`. Overwrite at each verified event; do not append. Target: sixty lines.

**Stale when** ORC restarts, a pull request named here settles, or Justin decides: whoever caused it rewrites this file
(`AGENTS.md`, "Keeping state"). A live value below is as recorded on 4 Oct: re-read it, with where and when, to state it.

## Read first
- The map of work, orchestrator#140 (Justin, 2 Oct), and its rules; then `SCOPE.md`. In ORC: `README.md`, `AGENTS.md`,
  `test/architecture.test.ts`.
- Steward decisions: `decisions/` (north star, merge rule, the 4 Oct interview and the 3 Oct decisions are in
  `decisions/2026-10-04-steward-decisions-from-state.md`); authority rules step 1: `memory/authority-rules-step-1.md`.
- Rules owned elsewhere: the user-wide `local-config/home/AGENTS.md` (prior art first, live-service statements say where,
  when and what was read, after 22:00 work stays on branches); `~/pro/agentic/HOW_NOT_TO_PLAN.md` (pace).
- Of record: `reports/2026-09-25-direction-review.md` and `-astra.md`; `reports/2026-09-25-issue-sweep.md`. Invoicing:
  Waterlands is the test bed, generic code in Finance (ORC #51). Generic-capability tracking: ORC #77.

## Where we are now (recorded 4 Oct; re-read before stating)
- **#193 resolve before acting is merged and restarted onto:** ORC #200 `3989cdb` (restart 13:36:37), MS #53 `fc830aa`
  (build cards approved 13:40:50). Not yet seen on real Bookwhen; Justin will try it. Not closed: Playwright's own
  readiness wait after the check (#200). Review: `reports/2026-10-04-resolve-before-acting-review-astra.md`.
- **Restarted onto since:** #201 `adaa127` (14:03:34), #199 `6d89ce7` (14:26:04; its log named ADA `binding_missing` and
  Analyst `connector_missing`), #195 `8cee662` (14:48:27). Last recorded build: `8cee662`, restart recorded as verified.
  Now: `pnpm service:status` in `~/pro/orchestrator`; log `journalctl --user -u orc.service`.
- Tests recorded 4 Oct: ORC 970 + E2E 5, MS 185. **Moving Stillness is paused** (Justin, 4 Oct): #118, #52, MS #52 wait.
- Invoicing works through ORC (JPWL112, JPWL113, real Waterlands vault); email parked on a woodwork domain (finance #3);
  `invoicing.json` in the vault is uncommitted for Justin's review.

## Waiting on Justin
- Asked 4 Oct: look into ADA and Analyst being unavailable? Delete the leftover `.playwright-mcp/` in ORC's checkout?
- In the order of `reports/2026-10-01-review-synthesis.md`: #144 tests on every PR (Actions or pre-push?); #137 bind
  approvals to builds, before any real email; #149 authority rules step 2 (`reports/2026-10-01-iris-speaks-for-you.md`);
  the scheduling chat (#166, built first: decision of 4 Oct). Also #196 (where agent worktrees live); the type labels
  wait on Astra's revisions (`reports/2026-10-04-labels-review-astra.md`); close #33 and #28 on his word.
- Unmerged by 4 Oct: orchestrator #106, #132, #133; scope-finance #1, #2. No `## Security review` yet on 2 Oct: #132,
  #133, #176, #178.
- Bookwhen login password change due after the leak of 27 Sep. Grant `e9675bd9` ended 1 Oct 18:00Z by its recorded expiry.
- Entropy assessment of 7 Oct, open questions: Q1 where ORC design decisions are recorded; Q2 whether a core-ties
  allowance may rise; Q3 this file's cap, forty content lines (`AGENTS.md`) or sixty (above); Q4 whether README's
  "reminders" and "workflow execution" are still absent; Q5 whether README's "a credential is read in exactly one place"
  is a rule.

## Misleading material nearby
- ORC's root holds branch-time reports (`CLASSIFY`, `FIXES`, `GRANTS-E2E`, `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`,
  `SLICE1`, `TURN-RECORD`, `VISIBILITY`): their test counts, schema versions and "nothing is pushed" are history.
- `decisions/2026-09-17-async-work-architecture.md` still lists `idempotency`; ORC split it into `repeatEffect` and
  `submissionKey` (ORC `FIXES.md`, `79a33ef`).
- ORC's operator scripts read `~/.local/share/orchestrator` unless `ORCHESTRATOR_STATE_DIR` is set in the shell; the
  running ORC used `~/.local/share/orchestrator-proof` when last recorded (`FRICTION.md`, 28 Sep; #62).

## Next
1. Build ORC scheduling (#166), first by Justin's 4 Oct decision.
2. Land the entropy assessment's corrections (ORC docs are a guarded change: `## Security review`, no new authority) and,
   once Justin has looked at it, its drafted session-end guard at `skills/session-coherence-guard/SKILL.md`.
3. Map follow-ups, not urgent (file as issues on #140 if not already): the marking rule in Codex and opencode briefs, a
   hook clearing a session's marks, ORC's own agents on the map, more blocked-by links.
