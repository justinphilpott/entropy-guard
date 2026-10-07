# Upstream feedback on entropy-guard

These come from the upstream feedback checks in `entropy-assessment`, `docs-first-planning-assessment` and
`guards-integrator` Step 8. They are formatted with the `entropy-guard-feedback` helper's issue template. They were
**not filed**: this run has no web access, so `gh issue create` was not run. Submit them by hand at
https://github.com/justinphilpott/entropy-guard/issues/new, with the label `agent-feedback`, after checking for
duplicates. The two issues are distinct.

---

## Issue 1

**Title:** session-coherence-skill-generator: the required intent-change rule collides with a target's own "agents
may edit the intent doc" practice while the steward is absent

```
## Category
skill

## What I Observed
The generator requires every guard to carry the intent-change rule, including clause 4: "Do not edit
<intent documents> to match the work unless <steward> has recorded that decision." intent-pass.md Step 4
says that when the steward is unavailable, "Do not implement, install or enforce a recommendation that
needs a new decision."

The target named no steward, and its AGENTS.md told agents to "update INTENT.md and note why" when a
decision refines or challenges intent. Carrying clause 4 adopts a new decision for the target. Leaving it
out breaks the generator's contract. Neither skill says which wins.

I carried the rule with clause 4 marked provisional, wrote the target's current practice beside it as
alternative wording, pointed to the proposal in the decision log, and told the integration plan to install
the guard's Intent section only after the steward answers.

## Suggestion
In the generator's "What a Guard Holds", or its Build-Mode step 6, say what to do when a target's recorded
practice contradicts a clause of the rule and no steward decision exists: carry the clause as provisional,
with the current practice beside it and a link to the proposal in the decision surface, and install it
only after the answer.

## Project Context
A markdown-only methodology repo (no code, tests or CI), worked in AI-agent sessions with commit as the
handoff, no steward named, and an existing local guard being refined.

---
Submitted by an AI agent working in an entropy-guard project.
```

---

## Issue 2

**Title:** intent pass and docs-first: an open steward question gets three homes when the steward is absent

```
## Category
assessment

## What I Observed
With the steward absent, each open question is told to go to a different place:
- intent-pass.md Step 4: "record each question with its recommended answer" (no location given);
- intent-pass.md Step 5: proposed intent changes go to the decision surface;
- docs-first-planning-assessment Step 5: the current-state file holds "open questions, including any
  questions from the intent pass";
- entropy-assessment's Output: the assessment lists "Questions for the steward".

Followed literally, the same question is written in three places, which the docs-first "One owner, not two
copies" check would then flag in the target. I put the full question, with readings and a recommended
answer, in the decision surface as a "Proposed:" entry; the current-state file has one line linking to it;
the assessment refers to it by id.

## Suggestion
Name the decision surface as the one home for open steward questions, recorded as proposals with their
recommended answers. Have the current-state file and the assessment link to that entry rather than restate
it.

## Project Context
The same docs-first planning repo as the other issue: DECISIONS.md is the decision surface, and TODO.md is
the current-state file.

---
Submitted by an AI agent working in an entropy-guard project.
```
