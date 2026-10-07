---
name: session-coherence-guard
description: Check ORC and the orchestration lab's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. A session may touch ORC
(`~/pro/orchestrator`), the lab (`~/scopes/scope-orchestration-lab`) or both: check each repository it touched.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: the lab's `scope.yaml` and `SCOPE.md`; the lab's `decisions/` and
  `memory/authority-rules-step-1.md`; ORC's `AGENTS.md` and `README.md` ("Direction"); the north star in the lab's
  `STATE.md`. Steward: Justin.
- Current state and next steps: the lab's `STATE.md`. Read it first.
- Decisions: the lab's `decisions/` for the lab's role and processes; the issue itself, on the map orchestrator#140, for
  a decision about one issue. Decisions about ORC's direction: UNRESOLVED (asked of Justin on 7 Oct 2026); the one
  recorded so far is in the lab's `decisions/` (2026-09-17).
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; the rules in orchestrator#140's description; ORC's
  `SECURITY-REVIEW.md`, `dangerfile.js` and `test/architecture.test.ts`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`.

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
working tree shows nothing yet still lands. Add live changes the checks depend on (which build ORC runs, from
`pnpm service:status`; a grant; a card approved or raised), read with the time. -->

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
> 4. Do not edit the lab's `scope.yaml`, `SCOPE.md` or `decisions/`, ORC's `AGENTS.md` or `README.md` ("Direction"),
>    or the north star in `STATE.md` to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If ORC's `src/`, `config/` or `scripts/` changed what ORC or an agent can reach (a subprocess, network, credential,
  connector, tool or Scope tie): do ORC's `README.md` (opening, "Credentials", "Boundary") and `AGENTS.md`
  ("Boundaries") still describe it, including every "only", "exactly" and "never" list, delegated behaviour included?
- For each state claim changed in the lab's `STATE.md`: do its other mentions still agree? Does a live fact (what ORC
  runs, a merge, a grant's expiry) say where, when and what was read, and is an older value marked as recorded?
- If the lab's `STATE.md` changed: is `**Where we are now:** <ref>` still there for `tools/map.mjs`, and is the file
  within its size limit (UNRESOLVED: `AGENTS.md` says about forty content lines, `STATE.md` sixty lines)?
- If the session took or relayed a decision of Justin's: is it in its owner under "Decisions", not only in `STATE.md`?
- If a name in prose changed (a `pnpm` script, an `ORCHESTRATOR_*` setting, a `tools/*.mjs` flag, a path): search both
  repositories' `README.md`, `AGENTS.md`, `SCOPE.md` and `memory/` for the old name.
- If ORC's `web/`, `src/web-server.ts`, `src/adapters/browser/` or `e2e/` changed: did `pnpm test:e2e` pass?
  `pnpm test` excludes it.
- If ORC work merged: was ORC restarted by its card, not by hand, and was what runs read back (`pnpm service:status`,
  process start time) before `STATE.md` said so?
- If an issue was opened, closed or worked on: does `node tools/map.mjs --check` pass, and are this session's In
  Progress marks cleared (`node tools/map.mjs stopped <ref>`)?
- If the session wrote a report or branch record into a repository: is it dated and marked as a record, with
  current state left to `STATE.md`?
- If something broke or surprised in real use: is it in the lab's `FRICTION.md`, dated, newest first?
```bash
cd ~/pro/orchestrator && pnpm typecheck && pnpm test   # when ORC changed: no CI runs them (orchestrator#144)
cd ~/scopes/scope-orchestration-lab && node tools/map.mjs --check   # when issues changed; needs gh
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
- Proposals for Justin; files updated; the next action, written into the lab's `STATE.md`.
