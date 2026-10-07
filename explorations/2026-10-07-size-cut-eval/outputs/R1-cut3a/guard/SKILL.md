---
name: session-coherence-guard
description: Check ORC and the Orchestration Lab for coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0"
---

<!-- Provisional. Drafted with no steward available: which record owns decisions (Q1), which sessions run this (Q2),
where this file lives (Q3) and STATE.md's size cap (Q4) await Justin, in the entropy-guard assessment of 2026-10-07.
Remove this note when they are answered. -->

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

## Where things live
- Authorised intent: the lab's `SCOPE.md`, `scope.yaml` and `decisions/`; ORC's `README.md` "Direction" and "Boundary"
  and its `AGENTS.md` boundary rules. Steward: Justin.
- Current state and next steps: the lab's `STATE.md`. Read it first.
- Decisions: the lab's `decisions/`, dated, in Justin's words. The map's rules: orchestrator#140.
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; ORC's `SECURITY-REVIEW.md` and `dangerfile.js`.
- Repositories: ORC at `~/pro/orchestrator`, the lab at `~/scopes/scope-orchestration-lab`; the Scope repositories on
  the map are `REPOS` in the lab's `tools/collect.mjs`.

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
Add live changes the checks depend on, each read with the time: ORC restarted (`pnpm service:status`), cards
approved, grants made or revoked. If the start point is unknown, compare against `origin/main` and report "coverage
incomplete".

## Intent
Does this change fit the authorised intent above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in the lab's `decisions/`; work that depends on it waits
>    for the decision.
> 4. Do not edit the lab's `SCOPE.md`, `scope.yaml` or `decisions/`, or ORC's `README.md` "Direction" and
>    "Deliberately absent" or `AGENTS.md` boundary rules, to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If ORC changed a tool, connector, credential, subprocess, network path, setting, command or file named in its
  `README.md`, `AGENTS.md` or `SECURITY-REVIEW.md`: search those for the old name; does each still describe the code?
  Where `AGENTS.md`'s boundary lists and `test/architecture.test.ts` disagree, establish which is wrong first.
- If ORC renamed anything a Scope package declares or names (connector settings, tool names, task-type fields):
  search each repository in `REPOS` for the old name before merging (orchestrator#198).
- If a pull request touching a guarded path merged: was Danger's "Security review" check green? A failed check only
  warns.
- If ORC code changed: do `pnpm typecheck` and `pnpm test` pass; `pnpm test:e2e` too if `web/`, approval cards or
  composition changed? If `src/package-api.ts` changed: `pnpm api:report`, and a `## Package API` section.
- If Justin decided anything: is it in `decisions/`, dated, in his words, with `STATE.md` linking to it rather than
  holding it?
- For each claim changed in `STATE.md`: do its other mentions still agree? Is the file overwritten, not appended,
  within the cap in the lab's `AGENTS.md` "Keeping state", stamped from `date`? Does each live fact (build, restart,
  grant, card) say where and when it was read, or say it is old? Does `**Where we are now:** #N` keep that form?
- If an issue was opened, or work started or stopped: does `node tools/map.mjs --check` pass, with this session's marks
  cleared by `node tools/map.mjs stopped <ref>`?
- If something broke in real use: is there a `FRICTION.md` entry, newest first, headed `## YYYY-MM-DD — <title>`? If
  it became a rule, is the rule in a file agents load?
- If a name, path or fact came from an ORC root report or a lab report: was it checked against the code or manifest?
  Before recreating something a report describes, check `decisions/` and `STATE.md` for what superseded it.
- When two documents describe one thing, decide which owns it and reduce the other to a link. Keep summaries and
  independent tests of the same contract.

```bash
pnpm typecheck && pnpm test   # in ~/pro/orchestrator, when ORC changed; pull requests do not run them yet (#144)
node tools/map.mjs --check    # in ~/scopes/scope-orchestration-lab
```

## Report
- Baseline in each repository, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin, in `decisions/` as awaiting him; files updated; the next action, written into `STATE.md`. A gap
  too large for this session becomes an issue placed on orchestrator#140.
