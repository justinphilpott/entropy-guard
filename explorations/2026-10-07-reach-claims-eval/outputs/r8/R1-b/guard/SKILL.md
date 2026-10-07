---
name: session-coherence-guard
description: Check ORC's and the orchestration-lab Scope's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.
It covers two repositories as one system: ORC (`~/pro/orchestrator`) and this Scope
(`~/scopes/scope-orchestration-lab`). Run "What changed this session" in each one the session touched.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
<!-- Pointers only. Never copy current direction, work status, next tasks or build ids into the guard; they belong in
the state file. Stable links to an issue or record that owns a policy are fine. -->
- Authorised intent: ORC `README.md` ("Direction", "Boundary") and `AGENTS.md`; this Scope's `SCOPE.md`,
  `scope.yaml`, `decisions/` and `memory/authority-rules-step-1.md`. Steward: Justin.
- Current state and next steps: this Scope's `STATE.md`. Read it first.
- Decisions: this Scope's `decisions/`; an issue-scoped one on its issue under orchestrator#140. Unresolved: where
  decisions about ORC itself go. Open intent questions: `STATE.md`, "Waiting on Justin".
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; ORC `SECURITY-REVIEW.md` and `dangerfile.js`;
  orchestrator#140's description; `~/pro/agentic/HOW_NOT_TO_PLAN.md`.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use `origin/main`
and report "coverage incomplete". If neither exists, report committed changes as not covered, and still inspect staged,
unstaged and untracked work.
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
>    undecided change of intent as a proposal for Justin in this Scope's `decisions/`; work that depends on it waits
>    for the decision.
> 4. Do not edit ORC's `README.md` or `AGENTS.md`, or this Scope's `SCOPE.md`, `scope.yaml` or `decisions/`, to
>    match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If ORC's restart or service code changed (`src/adapters/orc-service.ts`, `src/app/orc-restart.ts`,
  `scripts/orc-service.ts`, `scripts/orc-env.sh`): does README's "As a service" still describe it?
- For each state claim changed in `STATE.md`: do its other mentions still agree?
- If ORC code that launches a process, sends or delegates a network request, reads a credential or decides what a
  package bundle may import changed (`src/core/`, `src/adapters/`, `src/app/agent-packages.ts`, `config/`,
  `package.json`): do README's opening and "Credentials" and AGENTS.md's Boundaries still name all of it, including
  what Playwright, Pi, pnpm and package bundles do? Run the search below; put its output in the report.
- If a process launch changed: does the launched process still get no credential, as README's "Credentials" says?
- If a file that changes what an agent can reach or be granted was added or moved: does `dangerfile.js`'s `GUARDED`
  cover it?
- If ORC code changed: did `pnpm typecheck` and `pnpm test` pass this session? Nothing runs them on a pull request
  yet (#144). If `src/package-api.ts`'s exports changed: `pnpm api:report`, and a `## Package API` section.
- If an ORC path, variable, state location or table that `tools/collect.mjs`, `tools/map.mjs` or `tools/report.mjs`
  reads changed, or how ORC picks its state directory: does the lab tool still read the same thing?
- If Justin decided something this session: is it dated and attributed in `decisions/` or on its issue, not only in
  `STATE.md`?
- For each live fact changed in `STATE.md`: does it say where and when it was read, with older contradicting lines
  gone, and does the file keep to `AGENTS.md`'s "Keeping state"?
- If a report was written at ORC's root: should it be in this Scope's `reports/`, and if it stays, is it dated?
```bash
pnpm typecheck && pnpm test   # in ORC, when its code changed
grep -rnE "node:child_process|chromium\.launch|StdioClientTransport|fetch|node:(https?|net|tls|dgram)|process\.env|readScopeCredential" src config   # in ORC
node tools/map.mjs --check    # in this Scope, when issues changed
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
- Proposals for Justin; files updated; the next action, written into `STATE.md`.
