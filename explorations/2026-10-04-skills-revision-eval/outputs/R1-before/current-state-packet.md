# Current-state packet: ORC and the Orchestration Lab

**What this packet is.** It was written for the next fresh session, from read-only snapshots taken on
2026-10-04: the lab's `STATE.md`, updated 17:31, and ORC's files from 14:44. **None of it was checked against
the live service, git or GitHub.** Re-read `pnpm service:status` before repeating anything about what runs.

**This is a one-off snapshot, not a second state file.** The lab's `STATE.md` stays the place for current state.
Use this packet as input to rewriting `STATE.md` (bootstrap B2), then discard it.

## Stage

ORC is in daily use. It runs as `orc.service` on athena and is restarted only by Justin approving a restart
card. Work now goes through **one map of GitHub issues rooted at orchestrator#140**. The lab is the central
Scope for project management, issue tracking, code quality and security (Justin, 4 Oct).

**What runs, per STATE's latest timestamped line:** #195 live on `8cee662`, restarted at 14:48:27 on 4 Oct.
STATE also says `369628b` since 3 Oct 22:12:47. That line is older; check before repeating either.

## Trust first

1. **Lab `AGENTS.md`, then `STATE.md`, then `SCOPE.md`, then #140.** STATE contradicts itself in places;
   where it does, the later-timestamped line is more likely current.
2. **In ORC, `test/architecture.test.ts` is the truth about boundaries.** `AGENTS.md` describes the same
   boundaries and is wrong in two places:
   - it names `src/bookwhen.ts`, which no longer exists;
   - its subprocess list leaves out `src/adapters/orc-service.ts`.
3. **ORC `README.md`:** its "Run", "As a service", "Verify" and "Pi" sections are usable. Its overview,
   "Boundary" and Bookwhen-token paragraph are stale.

## Settled: do not reopen casually

- **Core is tie-free.** It names no Scope, model, owner or agent. Bookwhen code stays out of ORC; a test
  enforces this.
- **No agent holds all three legs of the lethal trifecta**, except behind enforced controls.
- **Approval cards** are drawn from fixed blocks. Packages are approved only by a card.
- **Never stop, start or build ORC's `dist` by hand.**
- **Security review is checked by Danger on GitHub** (since 2 Oct). The pre-push trailer is gone.
- **Clean up with `wt remove` and `gh poi`**, and only your own worktrees.
- **Claude merges a PR once review and tests pass.** After 22:00, work stays on branches.
- **Decisions of 4 Oct (they live only in `STATE.md` until bootstrap action B1 moves them):**
  - the lab is the central Scope;
  - a Scope's issues stay in its own repository, on one map, with a `core` label;
  - all listed processes are kept, including the entropy guard at session end;
  - ORC scheduling (#166) is built first.

## Active fronts

- **Browser stack.** #193 (resolve before acting) is live. It has not yet been seen working on real Bookwhen;
  Justin will try it. #118 and #52 are next, but **Moving Stillness is paused** (4 Oct), so work that touches
  it waits.
- **Package API version (#201)** is live.
- **#202:** packages cannot test against ORC's real parts.
- **Scheduling (#166)** is to be built first.
- **Authority rules step 2 (#149).**

## Open questions (waiting on Justin)

- **#144:** tests on every PR, by GitHub Actions or a pre-push hook.
- **#137:** bind approvals to builds.
- **#196:** where agent worktrees live.
- **Labels:** the type-label proposal, after Astra's revisions.
- **ADA and Analyst** are shown as unavailable (`binding_missing`, `connector_missing`): look into it?
- **Delete the leftover `.playwright-mcp/`** in ORC's checkout?
- **Demote ORC's 12 root task reports** to history? This needs his yes (#37).

## Nearby things likely to mislead you

- **ORC's root task reports are history, not guidance:** `CLASSIFY`, `FIXES`, `GRANTS`, `GRANTS-E2E`,
  `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`, `TURN-RECORD`, `VISIBILITY`. Several say "Nothing
  pushed" or name files that are gone.
- **`MCP.md`.** The browser no longer runs through MCP. Since #76 (3 Oct) ORC drives Playwright's library
  itself.
- **`config/installation.ts` is no longer how authority is granted.** Grants are recorded by operator
  commands and approval cards (`pnpm grant:*`, policy store).
- **`unavailableOperations` was removed.** `grantedOperations` is the control.
- **Grant `e9675bd9`** expired on 1 Oct 18:00Z, though STATE still lists it.
- **`status.html`** was last generated on 2 Oct 08:45 UTC. Its "ORC runs" figure reads 0 whenever ORC's
  database could not be read.
- **Lab `README.md`** documents `node tools/report.mjs --serve`, which does not exist.

## Plausible next actions

1. **Bootstrap B1 and B2** (see `assessment.md`): move the 4 Oct decisions into `decisions/`, then rewrite
   `STATE.md` without its contradictions, reading the live facts from `pnpm service:status`.
2. **Bootstrap B4:** one ORC PR bringing `README.md` and `AGENTS.md` in line with `test/architecture.test.ts`.
3. **Install the session-end guard** (`guard/SKILL.md`) at `skills/orc-lab-entropy-guard/SKILL.md` in the lab,
   and add the one-line pointers described in `integration.md`.
