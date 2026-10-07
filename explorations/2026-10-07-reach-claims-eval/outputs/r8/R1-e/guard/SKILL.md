---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. One guard covers both
repositories: ORC (`~/pro/orchestrator`) and the lab Scope that manages its work (`~/scopes/scope-orchestration-lab`).

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: lab `scope.yaml`, `SCOPE.md` and `decisions/`; ORC `README.md` ("Direction") and `AGENTS.md`.
  Steward: Justin. Open intent questions: lab `decisions/2026-10-07-proposals-awaiting-justin.md`.
- Current state and next steps: lab `STATE.md`. Read it first.
- Decisions: lab `decisions/`; a decision about one issue goes on that issue, under orchestrator#140.
- Rules owned elsewhere: local-config `home/AGENTS.md`; orchestrator#140's description; ORC `SECURITY-REVIEW.md` and
  `dangerfile.js`; lab `memory/authority-rules-step-1.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`.

## What changed this session
In each repository the session touched, find the commit the session started from, and write it in place of `<start>`
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
Also list, each with a time read from `date`: ORC restarts, package and grant cards approved, standing grants, and
map marks this session made or relied on.

## Intent
Does this change fit the authorised intent in lab `scope.yaml`, `SCOPE.md` and `decisions/`, and ORC `README.md`
("Direction") and `AGENTS.md`? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in the lab's `decisions/`; work that depends on it waits
>    for the decision.
> 4. Do not edit the lab's `scope.yaml`, `SCOPE.md` or `decisions/`, or ORC's `README.md` "Direction" or `AGENTS.md`,
>    to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If ORC's reach changed (a subprocess, network call, DNS lookup, credential read, connector, or tool given to a model
  or package): does ORC `AGENTS.md` "Boundaries" list it, does `test/architecture.test.ts` detect it, and does the
  pull request carry `## Security review`? A reach no recorded decision covers is a proposal, not a doc edit.
- If an allowance in ORC `test/core-ties.ts` rose: which recorded decision of Justin's covers it? None means a
  proposal, and the rise waits.
- If ORC code changed a command, setting, path, port, environment variable, tool name or file name: search ORC
  `README.md`, `AGENTS.md`, `MCP.md`, `SECURITY-REVIEW.md`, agent definitions and lab `STATE.md` for the old name.
- If a source module's behaviour changed: does its header (Owns, Never, Today) still describe it? The header test
  checks only that one exists.
- If what `src/package-api.ts` exports changed: was `pnpm api:report` run, does the pull request carry
  `## Package API`, and was the version raised if built packages break?
- If the session took a decision with Justin: is it in lab `decisions/` or on its issue, dated and attributed, and
  not only in `STATE.md`?
- For each state claim changed in lab `STATE.md`: do its other mentions still agree, does each live fact say when
  and where it was read, was every time written read from `date`, and is the file within the size `AGENTS.md` sets?
- If the session opened, moved or worked an issue: is it on the map, and are this session's marks cleared
  (`node tools/map.mjs stopped <ref>`)?
- If something broke in real use: is it in lab `FRICTION.md`, at the top, called an instance or a missing system?
- If the session wrote a one-off report or branch note: is it dated, and kept out of the documents that describe
  current behaviour?
- If ORC's state directory or a connector's setting names changed: report the copies outside ORC (lab
  `tools/collect.mjs`, package manifests) for reduction to one owner, rather than editing both.
```bash
# ORC, ~/pro/orchestrator. CI runs none of these; Danger checks only the pull request's description.
pnpm typecheck
pnpm test
pnpm test:e2e              # when web/, e2e/, the browser or the web server changed
# Lab, ~/scopes/scope-orchestration-lab
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
- Proposals for Justin; files updated; the next action, written into lab `STATE.md`.
