---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. One guard covers both
repositories: ORC (`~/pro/orchestrator`, and any worktree of it) and the orchestration-lab Scope
(`~/scopes/scope-orchestration-lab`), which manages ORC's work.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: the lab's `scope.yaml`, `SCOPE.md`, `decisions/` and `memory/authority-rules-step-1.md`; ORC's
  `README.md` ("Direction", "Boundary"), `AGENTS.md` ("Boundaries", "Core ships with no specific Scope, model, owner,
  or agent", "Approval cards"), and the boundaries `test/architecture.test.ts` enforces. Steward: Justin.
- Current state and next steps: the lab's `STATE.md`. Read it first.
- Decisions: the lab's `decisions/`; the map's rules: orchestrator#140's description.
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`; ORC's
  `SECURITY-REVIEW.md` and `dangerfile.js`.
- Open intent questions: `STATE.md`, "Waiting on Justin". A check below that depends on one says so; never settle one
  in a repair.

## What changed this session
Do this in each repository the session touched. Find the commit the session started from, and write it in place of
`<start>` below. If you cannot, use `origin/main` and report "coverage incomplete". If neither exists, report committed
changes as not covered, and still inspect staged, unstaged and untracked work.
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
Add the live changes this session caused, each read now with the time: ORC's running build (`pnpm service:status`),
cards approved or requested, standing grants (`pnpm list:approval-grants`), and map marks (`node tools/map.mjs`).

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
> 4. Do not edit the authorised-intent files listed above to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If an ORC code area changed: does the doc that describes it still hold?
  - What reaches outside (`src/adapters/`, `src/runtime.ts`, `src/core/child-agent-process.ts`,
    `src/core/analysis-tools.ts`, `src/core/research-tools.ts`): AGENTS.md "Boundaries"; README "Run", "Boundary".
  - Durable work (`src/core/async/`, `src/app/async/`): README "Boundary"; the lab's
    `decisions/2026-09-17-async-work-architecture.md`.
  - `src/package-api.ts`: `src/package-api.api.md` (`pnpm api:report`) and a `## Package API` PR section.
  - The restart card (`src/adapters/orc-service.ts`, `scripts/orc-service.ts`): README "As a service".
  - `config/installation.ts` or an environment variable: README "Run". `dangerfile.js` `GUARDED`: SECURITY-REVIEW.md
    "Which changes ask for this". A lab `tools/*.mjs` change: the lab's README and AGENTS.md.
- For each claim changed in `STATE.md`: do its other mentions in the file agree? Does each live claim (running commit,
  restart, merged PR, grant, test count) say where and when this session read it? One not re-read keeps its old date.
- If anything now reaches outside ORC in a new way (a network call; a process launched directly or through Playwright,
  the MCP SDK or Pi; a credential read; an outbound notice; a tool): check every "only", "exactly" and "never" claim in
  AGENTS.md "Boundaries" and the README against all of `src/` and `config/`, and that the PR has `## Security review`.
  Code that exceeds a claim is an intent question, not a doc fix (open: three cases, `STATE.md`).
- If Justin decided something this session: is it recorded, dated and attributed, in `decisions/` (or the issue that
  owns it) before `STATE.md` is overwritten, with `STATE.md` linking to it?
- Before overwriting `STATE.md`: is it overwritten, not appended, and within the cap in the lab's AGENTS.md "Keeping
  state"? (Open: AGENTS.md says about forty content lines, the file's header sixty; report against both.)
- If a module's behaviour changed: does its `Today:` header still hold, and for `src/cli.ts` its help text? The
  architecture test checks that a header exists, not that it is true.
- If a command, script, flag, environment variable, path or tool name was renamed or removed: search both
  repositories' markdown, and `src/cli.ts`, for the old name.
- If ORC code changed: did `pnpm typecheck` and `pnpm test` pass in this session? Nothing runs them by itself (#144),
  and Danger's failed check does not block a merge.
- If the session opened issues or marked work: does `node tools/map.mjs --check` pass, and are this session's
  `working` marks cleared with `stopped`?
- Before reviving or restoring something a historical file names (ORC's root branch reports such as `REWORK.md` or
  `SLICE1.md`, `MCP.md`'s browser sections, the lab's `reports/`): do the code or `decisions/` record it as superseded?
- If real use taught something: is it at the top of the lab's `FRICTION.md` under today's date, marked (workshop)
  where it is?
```bash
# ORC: nothing runs these by itself yet (#144)
pnpm typecheck && pnpm test
pnpm api:report               # only when src/package-api.ts's exports changed
# lab
node tools/map.mjs --check
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For an exhaustive list or an "only" claim, check the full scope, including delegated behaviour. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin, in `decisions/` marked as awaiting him; files updated; the next action, written into
  `STATE.md`; a gap too large for this change, as an issue placed on the map (orchestrator#140).
