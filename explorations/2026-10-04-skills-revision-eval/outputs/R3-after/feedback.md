# entropy-guard feedback

The upstream feedback checks in `entropy-assessment`, `docs-first-planning-assessment` and
`guards-integrator` all came back "yes". Two separate issues follow, in the format of
`skills/local/entropy-guard-feedback/SKILL.md`. Neither was filed: the run was not inside the
entropy-guard repository, and the web was off-limits. Both are ready to submit by hand at
https://github.com/justinphilpott/entropy-guard/issues/new with the label `agent-feedback`.

---

## Issue 1

**Title:** entropy-assessment: route A has no branch for a reference-only or retired repository

```
## Category
assessment

## What I Observed
The target was a docs-first planning repository whose README.md and AGENTS.md banners declare it
reference-only and name the repositories that now hold current truth. The front door's only
proportionality rule ("a retired or reference-only repository needs little or nothing new") sits in
Step 5, "Hand on", which route A never reaches: route A hands straight to
docs-first-planning-assessment. Nothing in that skill mentions retired or reference-only repositories.
Its Step 5 current-state template asks for "active fronts" and "1-3 plausible next actions", and its
Phase 2 assumes the repository needs a guard for ongoing design work. Followed literally, route A would
have refreshed the repository's existing active-development guard, whose checks tell agents to tick
roadmap boxes and raise component status. That is the opposite of what the banner asks. I applied the
Step 5 rule by hand.

## Suggestion
Check status before routing. Add "is this repository live, reference-only, or retired?" to front-door
Step 2, as a modifier that applies to every shape. When the answer is reference-only or retired:
- the current-state view becomes: status, successor repositories, nearby superseded material, and
  questions. Active fronts are "none authorised here", and the next actions are about confirming the
  status;
- the guard shrinks to one main check, "is this change one the status permits?", plus pointers from
  each area to the repository that owns it now;
- the option to retire the guard together with archiving the repository is offered explicitly.

## Project Context
A markdown-first architecture blueprint (about 80 files, no code), superseded by sibling repositories
but still consulted. The work loop is AI agent sessions (Claude Code, OpenCode, Pi) with a hand-run
pre-commit guard. Reference-only repositories are common in multi-repository personal portfolios, so
this is likely to apply generally.

---
Submitted by an AI agent working in an entropy-guard project.
```

---

## Issue 2

**Title:** intent-pass: no kind for an undated, unattributed directive, and none for an authorless decision log

```
## Category
skill

## What I Observed
The single most important intent statement in the target was a status banner in README.md and
AGENTS.md: "Reference-only … Do not treat decisions in this repository as current authority." It is
phrased as a directive, but it is undated, unattributed, and absent from DECISIONS.md. The intent pass
recognises four kinds of statement: steward decision, description, observation and inference. None fits
a directive like this. "Stale description" needs a later recorded steward decision, so the banner could
only be classed as a Conflict with the older dated DECISIONS.md entries. The likely newest intent
therefore had less standing than the text it replaced.

Separately, every DECISIONS.md entry was dated but had no author. The pass says a decision log
maintained by a team lead counts as steward decisions, but says nothing about a personal repository's
log whose entries were probably written by agents. Whether any authorised intent exists at all turns
on that, and the pass's "stop guard work if there is no usable intent" depends on it.

A smaller related gap: the "Enacted" reading needs recent commits, and the target was a snapshot with
no git history. The pass does not say what to do then.

## Suggestion
- Add a statement kind, "unrecorded directive": a rule or status phrased as a decision, with no date
  or author. The response: record it as a proposed decision in the decision surface, treat it as
  provisional intent, and ask the steward if work depends on it.
- State whether an owner-maintained decision log counts as steward decisions when its entries have no
  author. Recommendation: yes, provisionally, with the missing attribution reported as a Missing gap.
- When there is no history, derive the Enacted reading from dated content, and list that limit under
  Uncertainties.

## Project Context
The same docs-first architecture repository as Issue 1. Single-owner personal projects with
agent-written decision logs are the main users of entropy-guard, so the authorless-log question will
come up often.

---
Submitted by an AI agent working in an entropy-guard project.
```
