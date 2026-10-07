---
name: session-coherence-guard
description: Check ORC and the orchestration lab for coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

<!-- Draft: awaits Justin's answers on its home, the STATE.md cap, and #144's test step. -->

Run at the end of a work session, before commit or handoff, in each repository the session changed. Check only this
session's change. The lab is `~/scopes/scope-orchestration-lab`; ORC is `~/pro/orchestrator`.

## Where things live
- Authorised intent: the lab's `SCOPE.md`, `scope.yaml` and `decisions/`; ORC's `AGENTS.md` ("Core ships with no
  specific Scope…", "Boundaries") and its README's "Direction" and "Boundary". Steward: Justin.
- Current state and next steps: the lab's `STATE.md`. Read it first. Open work: the map, orchestrator#140.
- Decisions: the lab's `decisions/`; authority rules in the lab's `memory/authority-rules-step-*.md`.
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; each repository's `AGENTS.md`; ORC's
  `SECURITY-REVIEW.md` and `dangerfile.js`; the rules in #140's description.

## What changed this session
In each repository the session changed:
```bash
git log --oneline "$START"..HEAD          # commits
git diff "$START" HEAD                    # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
Add the live changes the checks depend on, read with the time: an ORC restart, an approved card or grant, a write to
Bookwhen or a vault. If the start point is unknown, compare against `origin/main` and report
"coverage incomplete".

## Intent
Does this change fit the authorised intent above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in the lab's `decisions/`, marked as awaiting him; work that
>    depends on it waits for the decision.
> 4. Do not edit the lab's `SCOPE.md`, `scope.yaml` or `decisions/`, or ORC's `AGENTS.md` rules or README
>    "Direction" and "Boundary", to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`.)

## Checks
- If ORC's `src/`, `config/`, `scripts/` or `package.json` changed: search ORC's README and `AGENTS.md`, and the
  lab's `STATE.md`, for each setting, environment variable, path, tool name and command the change renamed or
  removed. Does each mention still hold?
- If a boundary enforced by `test/architecture.test.ts` or `test/core-ties.ts` changed: does ORC's `AGENTS.md` still
  agree with the test, and point to it rather than restate its lists?
- When two documents describe one thing, decide which owns it and reduce the other to a link. Keep summaries and
  independent tests of the same contract.
- Before merging an ORC pull request: is Danger's "Security review" check green (a red one warns, it does not
  block), and did `pnpm typecheck` and `pnpm test` pass on the pull request's head?
- Did this session take or hear a decision of Justin's? Record it in his words, dated, in its home: the lab's
  `decisions/`, or ORC's `AGENTS.md` for a core rule. `STATE.md` links it and never holds it alone.
- For each state claim changed in `STATE.md`: do its other mentions in the file agree? Does each live fact say where
  and when it was read? Is `**Where we are now:** <ref>` still in that form, which `tools/map.mjs` reads? Is the file
  within the cap that the lab's `AGENTS.md` sets?
- If an issue was opened, closed, started or stopped: is it on the map, and marked with `node tools/map.mjs working`
  or `stopped`? `--check` treats a repository it could not read as having no issues, so check it named each one.
- If `FRICTION.md` gained an entry: is it newest first, headed `## YYYY-MM-DD — title` (the diary reads only that
  form), and classed as an instance or a missing system?
- If a tool, file, path or name was retired or renamed: search both repositories' agent-facing text for the old name.
  Cite none of ORC's root branch reports (`CLASSIFY.md` to `VISIBILITY.md`) as current.
- If either `AGENTS.md`, this guard or a skill changed: would a fresh agent starting in either repository meet the
  rule?
```bash
# ORC, when it changed. CI runs only Danger.
pnpm typecheck && pnpm test
pnpm test:e2e      # when web/, e2e/, src/web-*.ts or src/adapters/browser/ changed
pnpm api:report    # when src/package-api.ts's exports changed
# The lab
node tools/map.mjs --check
```

## Report
- Baseline per repository, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in the
  code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin; files updated; the next action, written into the lab's `STATE.md`.
