---
name: session-coherence-guard
description: Check ORC and the orchestration lab for coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. It covers two
repositories as one system: ORC (`~/pro/orchestrator`) and the orchestration lab (`~/scopes/scope-orchestration-lab`).

## Where things live

- Authorised intent: the lab's `decisions/`; ORC `AGENTS.md` (Boundaries, core ties); ORC `README.md` (Direction,
  Boundary); the lab's `SCOPE.md` and `scope.yaml`; `memory/authority-rules-step-1.md`. Steward: Justin.
- Current state and next steps: the lab's `STATE.md`. Read it first.
- Decisions: the lab's `decisions/`, or the issue a decision concerns, on the map of work (orchestrator#140).
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; ORC `SECURITY-REVIEW.md` and `dangerfile.js`; the rules
  in orchestrator#140's description; `~/pro/scope/docs/MODEL.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`.

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

Add live changes the checks depend on, each read with the time: the build ORC runs (`pnpm service:status` in ORC),
cards approved, grants, and writes to a live site.
If the start point is unknown, compare against `origin/main` and report "coverage incomplete".

## Intent

Does this change fit the authorised intent listed above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in the lab's `decisions/`, or on the issue it concerns; work
>    that depends on it waits for the decision.
> 4. Do not edit ORC's `README.md` and `AGENTS.md`, the lab's `SCOPE.md` and `scope.yaml`, or the records in
>    `decisions/` to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks

- If what an agent can reach changed (tools, connectors, subprocesses, network, the browser, credentials,
  `config/installation.ts`): search the code for every member of that kind, not only the one changed, and compare
  them with ORC `AGENTS.md`'s Boundaries, `README.md`'s Boundary and `test/architecture.test.ts`. Where they disagree,
  establish which is wrong first; new reach goes into the Boundaries only after Justin's decision (rule 4 above).
- If a change adds or extends anything in README's "Deliberately absent" list: name the decision of Justin's that
  covers it. If there is none, apply the intent rule above.
- If a setting (`ORCHESTRATOR_*`), command, script, module or path was added, renamed or removed: search the Markdown
  of both repositories, `memory/` included, for the old name.
- If something another repository also declares changed (a connector setting, a manifest field, a tool name in agent
  text, the package API version, the state directory): name each place that repeats it, and say whether it still
  agrees.
- If Justin decided something this session, in chat, on a card or in an interview: is it recorded in `decisions/` or
  on its issue, dated and attributed, and not only in `STATE.md`?
- For each claim changed in `STATE.md`: do its other mentions in the file agree? Does each live fact say where and
  when it was read, and a value not re-read say so? Is the file within the cap its owner sets, with no history in it?
- If the session says ORC work is live: was the restart read (start time, `build.json`, health) before saying so?
- If an issue was opened, or work started or stopped: is the issue on the map, and is the session's mark cleared?
- If something broke in real use: does `FRICTION.md` have an entry in date order, classed as an instance or a missing
  system, with its cost?
- If a report, design note or memory file was added or edited: does it say whether it is current or historical, and
  do the code paths it names exist?
- When two documents describe one thing, decide which owns it and reduce the other to a link. Keep summaries and
  independent tests of the same contract.

```bash
# ORC: CI runs only Danger, so run these
pnpm typecheck
pnpm test                 # includes test/architecture.test.ts and test/core-ties.ts
pnpm test:e2e             # when web/, e2e/ or the approval flow changed
pnpm api:report           # when src/package-api.ts exports changed
# The lab
node tools/map.mjs --check
```

## Report

- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin; files updated; the next action, written into the lab's `STATE.md`.
