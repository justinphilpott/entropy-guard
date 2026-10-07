---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.
One system in two repositories: ORC (`~/pro/orchestrator`) and the orchestration-lab Scope
(`~/scopes/scope-orchestration-lab`). Run each step in every repository the session changed.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: lab `scope.yaml`, `SCOPE.md`, `decisions/` and `memory/authority-rules-step-1.md`; ORC
  `README.md` (Direction, Boundary) and `AGENTS.md`. Steward: Justin.
- Current state and next steps: lab `STATE.md`. Read it first.
- Decisions: lab `decisions/`, or the issue that owns the concern on the map, orchestrator#140.
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`; orchestrator#140's
  description; ORC `SECURITY-REVIEW.md` and `dangerfile.js`.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use `origin/main` and
report "coverage incomplete". If neither exists, report committed changes as not covered, and still inspect staged,
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
Does this change fit the authorised intent in lab `scope.yaml`, `SCOPE.md` and `decisions/`, and ORC `README.md`
and `AGENTS.md`? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in the lab's `decisions/`, or the issue on orchestrator#140
>    that owns the concern; work that depends on it waits for the decision.
> 4. Do not edit lab `scope.yaml`, `SCOPE.md` or `decisions/`, or ORC `README.md` (Direction, Boundary) or
>    `AGENTS.md`, to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If ORC's code, config or tests changed: run the ORC commands below; nothing runs them on pull requests (orchestrator#144).
- If ORC's code or config changed what it launches, connects to, or hands a credential to: run the reach search below,
  compare its hits with ORC `AGENTS.md` Boundaries and `README.md`, and put the patterns and hits in the report.
- If a path `dangerfile.js` guards changed: it reaches `main` by a pull request with `## Security review` (and
  `## Package API` if `src/package-api.api.md` changed); a direct push is not checked.
- If an ORC setting, environment variable, command, path or tool name was renamed or removed: search both
  repositories' docs and the lab's `tools/` for the old name.
- For each state claim changed in lab `STATE.md`: do its other mentions still agree?
- If lab `STATE.md` changed: each live fact (the build ORC runs, a restart, a grant) has one value, with where and when
  it was read; older values are removed, not appended; it is within the cap in lab `AGENTS.md`; the
  `**Where we are now:** <ref>` line keeps the form `tools/map.mjs` reads.
- If Justin decided something this session: it is in the decision owner above, not only in `STATE.md`.
- If the session opened, closed or worked on issues: the lab command below passes, and the session's own marks are
  cleared with `node tools/map.mjs stopped <ref>`.
- If something broke in real use: an entry in lab `FRICTION.md`, newest first, as `## YYYY-MM-DD — <title>` with
  `- **` findings, the form `tools/collect.mjs` reads.
- If ORC moved its state directory or a path the lab's `tools/` read: do `tools/collect.mjs`'s paths still match?
- If a session report or review was written: it is dated, in lab `reports/`. (Whether ORC's older root reports move
  there is open for Justin.)
```bash
# ORC, from ~/pro/orchestrator
pnpm typecheck
pnpm test
pnpm test:e2e   # when web/, e2e/ or the durable-work surface changed
rg -n -e 'node:child_process' -e 'StdioClientTransport' -e 'worker_threads' -e 'chromium|\.launch\(' -e '\bfetch\b' -e 'node:(https?|net|tls|dgram|dns)' -e 'createServer' src config
# Lab, from ~/scopes/scope-orchestration-lab
node tools/map.mjs --check
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
- Proposals for Justin; files updated; the next action, written into lab `STATE.md`.
