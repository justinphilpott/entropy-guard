---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0"
---

<!-- Draft of 2026-10-07, not installed. Its home and the decision record it names wait on Justin's answers to the
entropy assessment's questions Q1 and Q2. Remove this comment when installed. -->

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. One system spans two
repositories, ORC (`~/pro/orchestrator`) and the orchestration-lab Scope (`~/scopes/scope-orchestration-lab`): run
the checks in each one the session changed.

## Where things live
- Authorised intent: the lab's `decisions/` (north star and Justin's decisions), `SCOPE.md` and `scope.yaml`; ORC's
  `README.md` ("Direction") and `AGENTS.md`. Steward: Justin.
- Current state and next steps: the lab's `STATE.md`. Read it first.
- Decisions: the lab's `decisions/`, one dated file in Justin's words, linked from the issue it serves.
- Open work: orchestrator#140 and its sub-issues (`node tools/map.mjs` in the lab).
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md` (user-wide); `~/pro/agentic/HOW_NOT_TO_PLAN.md`
  (pace); ORC's `SECURITY-REVIEW.md` and `dangerfile.js` (security review on pull requests) and
  `test/architecture.test.ts` (the enforced boundaries).

## What changed this session
```bash
git log --oneline "$START"..HEAD          # commits
git diff "$START" HEAD                    # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
Run these in each repository the session touched. Add the live changes the checks depend on, each read with the
time: which build ORC runs (`pnpm service:status` in ORC), a restart, an approved card or grant, a merge.
If the start point is unknown, compare against `origin/main` and report "coverage incomplete".

## Intent
Does this change fit the authorised intent in the files above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in the lab's `decisions/`; work that depends on it waits
>    for the decision.
> 4. Do not edit the lab's `SCOPE.md`, `scope.yaml` or `decisions/`, or ORC's `README.md` "Direction" or
>    `AGENTS.md`, to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- For each state claim changed in `STATE.md`: do its other mentions in the file still agree? Each live fact says
  where and when it was read; one not re-read this session keeps its old date and says so.
- If Justin decided something this session: is it in `decisions/`, dated and in his words, with `STATE.md` only
  linking to it?
- Does `STATE.md` keep its `**Where we are now:** #N` line, which `tools/map.mjs` reads, naming the issue being
  worked?
- If ORC changed what the model, a subprocess or the network can reach (`src/tools.ts`, `src/runtime.ts`,
  `src/adapters/`, `config/installation.ts`): does `AGENTS.md` "Boundaries" still describe it, and does
  `test/architecture.test.ts` check it?
- If a command, setting, environment variable, path or tool name changed or went: search both repositories'
  Markdown and agent definitions for the old name.
- If ORC's durable-work tables or state directory changed, or a heading format in the lab's `STATE.md` or
  `FRICTION.md`: do the lab's `tools/collect.mjs` and `tools/map.mjs` still read them?
- If the session added a document: which existing document owns its concept? A dated session report says so in
  its first line, and nothing links it as current.
- When two documents describe one thing, decide which owns it and reduce the other to a link. Keep summaries and
  independent tests of the same contract.
- If ORC's code changed: CI runs only the Danger check, so run the commands below and report their results.

```bash
pnpm typecheck && pnpm test              # in ORC
pnpm test:e2e                            # in ORC, when web/, e2e/ or src/adapters/browser/ changed
node tools/map.mjs --check               # in the lab, when issues were opened or moved
```

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin; files updated; the next action, written into `STATE.md`.
