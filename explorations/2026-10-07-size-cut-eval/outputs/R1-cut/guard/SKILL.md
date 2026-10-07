---
name: session-coherence-guard
description: Check ORC and the orchestration lab for coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff, in each repository the session changed: ORC
(`~/pro/orchestrator`) and the lab (`~/scopes/scope-orchestration-lab`). Check only this session's change.

## Where things live
- Authorised intent: the lab's `scope.yaml` and `SCOPE.md`; ORC's `README.md` ("Direction") and `AGENTS.md`. Steward:
  Justin.
- Current state and next steps: the lab's `STATE.md`. Read it first.
- Decisions: the lab's `decisions/`, one file per decision; authority rules in the lab's `memory/`; the map's rules in
  orchestrator#140.
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`;
  `~/pro/scope/docs/MODEL.md`; ORC's `SECURITY-REVIEW.md` and `test/architecture.test.ts`.

## What changed this session
In each repository the session touched:
```bash
git log --oneline "$START"..HEAD          # commits
git diff "$START" HEAD                    # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
Add live changes the checks depend on, each read with the time: ORC's running build (`pnpm service:status` in ORC),
grants (`pnpm list:approval-grants`), and any card approved or durable work submitted.
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
> 4. Do not edit the lab's `scope.yaml` and `SCOPE.md`, or ORC's `README.md` ("Direction") and `AGENTS.md`, to match
>    the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If Justin decided something this session: is it in the lab's `decisions/`, dated, attributed and naming what it
  supersedes? `STATE.md` links to it and never holds the only copy.
- For each claim changed in `STATE.md`: do its other mentions in the file still agree?
- Is each live fact in `STATE.md` (running build, restart, grant, merge) stated once, with when and where it was read,
  and not past an end date it names?
- Is `STATE.md` current state only, within the cap set in the lab's `AGENTS.md` and its own header? Dated events go to
  the commit message or the issue. While those two caps differ, report the count against both.
- If ORC's tools, connectors, environment variables, dependencies, scripts, or subprocess or network modules changed:
  do ORC's `README.md`, `AGENTS.md` and the help in `src/cli.ts` still say what the code does? Search the docs for
  each old and new name.
- If agent-facing text changed or a tool was renamed (ORC's `src/core/*.md`, a Scope's `agents/` or `memory/`): does
  every tool it names exist?
- If ORC code changed: did `pnpm typecheck` and `pnpm test` pass, and `pnpm test:e2e` when `web/`, cards or durable
  work changed? Say in the pull request which ran. Run `test:e2e` only in a worktree: it rebuilds `dist/web`, which
  the running ORC serves.
- If ORC's state directory, durable-work schema (`src/adapters/async-store/sqlite.ts`) or agent discovery changed:
  does the lab's `tools/collect.mjs` still read them? Its durable-work and agents sections must not come back empty.
- If an issue was opened or a repository joined the work: is it on the map, and did `node tools/map.mjs --check` read
  every repository? A failed read passes silently.
- Before adding a session report at ORC's root: is there a recorded decision on where such reports go? If not, ask.
- When two documents describe one thing, decide which owns it and reduce the other to a link. Keep summaries and
  independent tests of the same contract.
- Did the session teach something? Record it where the lab's `AGENTS.md` says ("Where a learning goes"); new
  `FRICTION.md` entries go at the top.
```bash
# ORC: CI runs only Danger (orchestrator#144 is the open work)
pnpm typecheck && pnpm test
# lab
node tools/map.mjs --check
grep -c . STATE.md
node tools/report.mjs --no-tests   # when ORC's state, schema or discovery changed
```

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin; files updated; the next action, written into the lab's `STATE.md`.
