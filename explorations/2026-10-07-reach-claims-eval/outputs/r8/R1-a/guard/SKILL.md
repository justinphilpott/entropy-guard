---
name: session-coherence-guard
description: Check ORC's and the orchestration-lab Scope's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: the lab's `SCOPE.md` and `scope.yaml` (`purpose`); ORC's `README.md` ("Direction") and
  `AGENTS.md` ("Core ships with no specific Scope, model, owner, or agent", "Boundaries"); the lab's `decisions/`.
  Steward: Justin (`scope.yaml`, `steward`).
- Current state and next steps: the lab's `STATE.md`. Read it first.
- Decisions: the lab's `decisions/`, or the issue that owns the concern on the map, orchestrator#140.
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`;
  `~/pro/scope/docs/MODEL.md`; ORC's `SECURITY-REVIEW.md` and `dangerfile.js`; the map's rules, in #140.
- Unresolved when written (2026-10-07; answers go to `decisions/`): whether ORC's reach lists cover reach a library
  performs for ORC; where this guard lives; which state-file cap holds. Until answered, report against both readings.

## What changed this session
Run this in each repository the session touched: ORC (`~/pro/orchestrator`, or the worktree used) and the lab
(`~/scopes/scope-orchestration-lab`). Find the commit the session started from, and write it in place of `<start>`
below. If you cannot, use `origin/main` and report "coverage incomplete". If neither exists, report committed changes
as not covered, and still inspect staged, unstaged and untracked work.
```bash
git log --oneline <start>..HEAD           # commits
git diff <start> HEAD                     # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
<!-- Check staged and unstaged separately: `git diff HEAD` nets them out, so a change staged and then undone in the
working tree shows nothing yet still lands. Add live changes the checks depend on (a deployed build, a grant), read
with the time. -->

## Intent
Does this change fit the authorised intent in the files above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in the lab's `decisions/`, marked as awaiting him; work that
>    depends on it waits for the decision.
> 4. Do not edit the lab's `SCOPE.md` or `scope.yaml`, or ORC's `README.md` "Direction" or `AGENTS.md` core and
>    boundary rules, to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`.)

## Checks
- If ORC code changed: does the doc for that area still describe it? Reach and credentials: `AGENTS.md`
  "Boundaries", `README.md` "Run" and "Boundary". Service and restart: `README.md` "As a service". Package API:
  `src/package-api.api.md`. Durable work, cards, grants: lab `decisions/2026-09-17-async-work-architecture.md`,
  `AGENTS.md` "Approval cards". Pi: `README.md` "Pi". Lab tools: the lab's `README.md`.
- For each state claim changed in `STATE.md`: do its other mentions still agree?
- If code that launches, connects, resolves names, reads a credential or loads package code changed (`src/core/`,
  `src/adapters/`, `src/app/agent-packages.ts`, `src/runtime.ts`, `config/`, `package.json`): run the reach search
  below, record its patterns, paths and each hit with the process that runs it, and check every list or "only" claim
  in `AGENTS.md`, `README.md` and `test/architecture.test.ts` against the hits. A doc and a test agreeing is not
  completeness.
- If Justin decided something this session: is it in `decisions/` or its owning issue, dated and in his words, and
  linked from `STATE.md`, rather than only in `STATE.md` or a report?
- If `STATE.md` changed: was it overwritten, not appended; does each live fact (build running, cards, grants, test
  counts) say where and when it was read, with no older value of it left in the file; is it within the cap?
- If a claim rests on ORC's durable work, grants or approvals read through a script or lab tool: was it read from the
  state directory the running ORC uses (its env file's, as `pnpm service:status` resolves it), and does the report
  say which?
- If an issue was opened or a map mark set: is the issue on the #140 map and the mark cleared? Read `map.mjs --check`
  output, not only its exit code: it passes when a repository read fails, and reads 6 of the map's 9 repositories.
- If ORC code changed: did typecheck and tests run this session, and does a Danger-guarded change go through a pull
  request with `## Security review` (and `## Package API` when `src/package-api.api.md` changed)?
- If the session relied on a top-level ORC report or a lab report: was the claim checked against the code,
  `AGENTS.md` and `decisions/` first?
- If the session restarted ORC, decided a card or grant, or wrote to a live service or the GitHub Project: does the
  report say what changed, and where, when and how it was read back?
```bash
# ORC, if its code changed. Nothing runs these on a pull request (orchestrator#144).
pnpm typecheck && pnpm test
pnpm test:e2e        # if web/ or the web server changed
pnpm api:report      # if src/package-api.ts changed; commit the report it writes
# Reach search, from ORC's root, when the reach check fires:
rg -n -e "child_process|StdioClientTransport|['\"]playwright|createAgentSession" -e '\bfetch\b|fetchImpl|WebSocket' \
  -e 'node:(https?|http2|net|tls|dns|dgram)' -e 'process\.env|ORCHESTRATOR_[A-Z_]+|readScopeCredential|await import\(' src config
# The lab:
node tools/map.mjs --check
# Each repository touched:
git diff --check
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For a claim about everything of a kind, such as what the system reaches or launches, search the code rather than
  trusting a document and a test that agree, and record the search. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin; files updated; the next action, written into the lab's `STATE.md`.
