---
name: session-coherence-guard
description: Check ORC and the orchestration-lab Scope for coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session: before the last rewrite of the lab's `STATE.md`, before commit or handoff, and before
a pull request is marked ready to merge. Check only this session's change, in each repository it touched: ORC at
`~/pro/orchestrator`, the lab at `~/scopes/scope-orchestration-lab`.

## Where things live
- Authorised intent: the lab's `scope.yaml`, `SCOPE.md`, `decisions/` and `memory/authority-rules-step-1.md`; ORC's
  `README.md` ("Direction") and `AGENTS.md`. Steward: Justin (`scope.yaml`).
- Current state and next steps: the lab's `STATE.md`. Read it first. Open work: the map, orchestrator#140.
- Decisions: the lab's `decisions/`, and the issue on #140 a decision concerns. Where ORC's design decisions belong for
  good is an open question listed in `STATE.md`.
- Rules owned elsewhere: the user-wide `~/pro/local-config/home/AGENTS.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`; the
  rules in orchestrator#140's description; ORC's `SECURITY-REVIEW.md` and `dangerfile.js`.

## What changed this session
In each repository this session touched:
```bash
git log --oneline "$START"..HEAD          # commits
git diff "$START" HEAD                    # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
Add live changes, each read with the time: an ORC restart, or a card, grant or package build approved
(`pnpm service:status` in ORC says what runs).
If the start point is unknown, compare against `origin/main` and report "coverage incomplete".

## Intent
Does this change fit the authorised intent in the files above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in the lab's `decisions/`, or on the issue it concerns; work
>    that depends on it waits for the decision.
> 4. Do not edit the lab's `scope.yaml`, `SCOPE.md`, `decisions/` or `memory/authority-rules-step-1.md`, or ORC's
>    `README.md` "Direction" or `AGENTS.md`, to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- Always, for each claim changed in `STATE.md`: do its other mentions agree, above all which ORC build runs and what is
  merged, live or paused? Is each live value re-read now, with where and when, or labelled with its recorded date?
- If Justin decided something: is it in `decisions/` or on its issue, dated and in his words, and does `STATE.md` only
  link to it?
- If ORC changed what it reaches, launches or reads a credential for (`src/core/research-tools.ts`,
  `src/adapters/notifications/`, `src/adapters/browser/`, `src/adapters/mcp/`, `src/adapters/orc-service.ts`,
  `src/core/child-agent-process.ts`, `src/core/analysis-tools.ts`, `src/adapters/scope-credentials.ts`,
  `src/web-cli.ts`, `config/installation.ts`): search the code for every member of that kind. Does `AGENTS.md` list
  each, does `README.md` only link to that list, and does `test/architecture.test.ts` confine it?
- If an allowance in `test/core-ties.ts` rose: say so in the report and in the pull request's `## Security review`,
  quoting `AGENTS.md` ("a count may only fall") and the reason. A passing test is not Justin's approval.
- If a file that changes what an agent can reach is outside `GUARDED` in `dangerfile.js` (such as
  `scripts/execution-policies.ts`, `scripts/activate-research-agent.ts`): review it anyway, and propose adding it.
- Before saying tests pass: run the commands below in each checkout changed, and report each command and its result.
  Nothing runs them on pull requests yet (#144).
- If ORC's durable-work schema (`src/adapters/async-store/sqlite.ts`), its state directory (`getDefaultStateDir`), its
  agent files (`src/core/*.md`) or a host connector's setting names changed: does the lab's `tools/collect.mjs` still
  read them, and do Scope package manifests still match (#198)? A claim about ORC's live records names the state
  directory it was read from.
- If code changed the subject of a record in `decisions/`, such as `src/core/async/` against
  `2026-09-17-async-work-architecture.md`: is there a later recorded decision? If not, record a proposal.
- If a command, flag, path or setting named in a README or `AGENTS.md` changed: search both repositories for the old
  name. A report or design note added at ORC's root is dated and says it is history.
- When two documents describe one thing, decide which owns it and reduce the other to a link. Keep summaries and
  independent tests of the same contract.

```bash
# ORC, ~/pro/orchestrator
pnpm typecheck
pnpm test          # includes test/architecture.test.ts and the core-ties ratchet
pnpm test:e2e      # when web/, e2e/ or the web server changed
pnpm api:report    # when src/package-api.ts changed; then a `## Package API` section
# Lab, ~/scopes/scope-orchestration-lab
node tools/map.mjs --check
```

## Report
- Baseline per repository, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: removing a module makes an
  untouched `AGENTS.md` list wrong. Problems that were already there, listed separately.
- Proposals for Justin; files updated; the next action, written into `STATE.md`. A gap too large for this change
  becomes an issue placed on orchestrator#140.
