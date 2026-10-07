---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. It covers two
repositories as one system: ORC (`~/pro/orchestrator`) and this Scope, the orchestration lab
(`~/scopes/scope-orchestration-lab`), where this guard lives.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
<!-- Pointers only. Never copy current direction, work status, next tasks or build ids into the guard; they belong in
the state file. Stable links to an issue or record that owns a policy are fine. -->
- Authorised intent: this Scope's `scope.yaml` (purpose) and `SCOPE.md`; the records in `decisions/`;
  `memory/authority-rules-step-1.md`; ORC's `AGENTS.md` and its `README.md` ("Direction", "Boundary"). Steward: Justin,
  called "the operator" in ORC's source.
- Current state and next steps: this Scope's `STATE.md`. Read it first. Open work: issues on the map, orchestrator#140.
- Decisions: this Scope's `decisions/`. Where Justin's decisions about ORC are recorded is unresolved, awaiting his
  answer; until then, name any proposal about ORC in the report.
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; ORC's `AGENTS.md`, `SECURITY-REVIEW.md` and
  `dangerfile.js`; the map's rules in orchestrator#140; `~/pro/agentic/HOW_NOT_TO_PLAN.md`; `~/pro/scope/docs/MODEL.md`.

## What changed this session
In each repository or worktree the session touched, find the commit the session started from, and write it in place of
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
working tree shows nothing yet still lands. -->
Add the live changes the checks depend on, read with the time: what ORC runs (`pnpm service:status` in ORC's checkout),
and any card, grant or package approval the session caused.

## Intent
Does this change fit the authorised intent in the files above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in this Scope's `decisions/` (for ORC, see "Where things
>    live"); work that depends on it waits for the decision.
> 4. Do not edit `scope.yaml`, `SCOPE.md`, the records in `decisions/`, `memory/authority-rules-step-1.md`, or the
>    direction and boundaries in ORC's `AGENTS.md` and `README.md` to match the work unless Justin has recorded that
>    decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
<!-- One line per justified check, each with a trigger and a named thing to check. -->
- If ORC's `src/`, `config/`, `scripts/` or `package.json` changed: do ORC's `README.md`, `AGENTS.md` and
  `SECURITY-REVIEW.md` still describe each setting, command, path and identifier it touched? Search both repositories
  for every old name, this Scope's `memory/` included.
- For each state claim changed in `STATE.md`: do its other mentions still agree?
- If what ORC launches, reaches, reads credentials from or offers a model changed, or an allowance in
  `test/core-ties.ts`, an exact list in `test/architecture.test.ts` or `EXEMPT` in `dangerfile.js` rose: does
  `AGENTS.md`, "Boundaries", still match, and does a recorded decision of Justin's authorise it? Whether a merged pull
  request counts as that decision awaits Justin's answer; report the widening either way.
- If `STATE.md` changed: was it overwritten, holding no history; within the cap (unresolved: this Scope's `AGENTS.md`
  says about forty content lines, `STATE.md` sixty lines); does `**Where we are now:** <ref>`, which `tools/map.mjs`
  reads, name the current front; does each live fact say where and when it was read, with expired ones gone?
- If Justin decided something this session: is it recorded in his words, dated, with its source, in `decisions/` (for
  ORC, see "Where things live"), not only in `STATE.md`, a code comment, a report, a pull request or an issue?
- Was every time written this session into `STATE.md`, `FRICTION.md`, a report or an issue read from the clock
  (`date`), not typed (`FRICTION.md`, 30 Sep; orchestrator#192)?
- If something broke or taught something in real use: is it in `FRICTION.md`, newest first, under
  `## YYYY-MM-DD — title` (`tools/collect.mjs` parses it), marked (workshop) where it is, saying instance or missing
  system? Did other learnings and ideas go where this Scope's `AGENTS.md` says?
- Is new open work an issue on the map, and are this session's In Progress marks cleared
  (`node tools/map.mjs stopped <ref>`)?
- If ORC changed: did `pnpm typecheck` and `pnpm test` pass, here or in CI (orchestrator#144), and did changes to
  Danger's guarded paths go through a pull request, not a direct push to `main`?
- If ORC's durable-work schema (`src/adapters/async-store/sqlite.ts`), shipped agents (`src/core/*.md`) or state
  directory changed: does this Scope's diary still read them? Its readers return nothing, silently, on a mismatch.
- If ORC's live state changed (a restart, a build, a grant or package approval): did it go through ORC's card, not by
  hand, and was it verified by `pnpm service:status` and the process start time before being stated anywhere?
```bash
# ORC, when it changed and CI has not run them:
pnpm typecheck && pnpm test
pnpm api:report                   # when what src/package-api.ts exports changed
# This Scope:
node tools/map.mjs --check
node tools/report.mjs --no-tests  # when ORC's store, agents or state directory changed; writes status.html
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
