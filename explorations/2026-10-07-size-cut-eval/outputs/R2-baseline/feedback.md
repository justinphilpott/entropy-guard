# Upstream feedback on entropy-guard

These are drafted from the upstream feedback checks in `entropy-assessment`, `docs-first-planning-assessment` and
`guards-integrator`, in the issue format of `skills/local/entropy-guard-feedback/SKILL.md`. Neither was filed: this
run had no network access, so they follow the helper's step 4 fallback. Before filing, check for duplicates with
`gh issue list --repo justinphilpott/entropy-guard --label agent-feedback`.

---

## Issue 1

**Title:** session-coherence-skill-generator: no guidance when the target's own instructions contradict the intent-change rule

```
## Category
skill

## What I Observed
The generator requires every guard to carry a filled-in copy of the intent-change rule (intent-pass.md, v2),
whose item 4 forbids editing intent documents without the steward's recorded decision. The target's own
standing instruction says the opposite: AGENTS.md "If a decision refines or challenges the intent, update
INTENT.md and note why", repeated in INTENT.md's header and in its existing guard. intent-pass.md says a
proposed patch must not quietly settle an open question, but neither skill says what to do when a required
part of the guard is itself the open question. I had to work it out: keep the rule, flag the guard as
provisional, ask the steward whether the target's instruction is a standing delegation (a recorded delegation
satisfies item 4), and hold the guard back from installation.

## Suggestion
Add one paragraph to the generator's "What a Guard Holds" section, or to the rule's preamble in intent-pass.md:
when the target has an instruction that contradicts the rule, copy the rule anyway, raise the contradiction
as a steward question, mark the guard provisional until it is answered, and note that a recorded standing
delegation from the steward satisfies item 4.

## Project Context
Markdown-first methodology repo (the snapshot was an older copy of entropy-guard itself); AGENTS.md-driven
human and AI sessions; pre-commit ritual guard; no CI.

---
Submitted by an AI agent working in an entropy-guard project.
```

---

## Issue 2

**Title:** docs-first route skips the "does it execute" inventory, so hook status surfaces only at integration

```
## Category
assessment

## What I Observed
On route B, C or D, entropy-assessment Steps 4c and 4d check whether committed hooks are enabled, and sort guard
surfaces into five groups by whether they execute (runs by itself, by hand only, decided, declared but missing,
unknown). Route A hands the whole assessment to docs-first-planning-assessment, whose Step 7 only classifies
surfaces as keep, amend, replace or demote. On this target the only guard mechanism is a tracked
.githooks/pre-commit reminder, and whether any clone enables it is unknown. That status was not asked for until
guards-integrator Step 6. The intent pass's "prose control" condition happened to catch the overstated
"non-negotiable" rule, but the five-group execution inventory never appeared in the assessment.

## Suggestion
In docs-first-planning-assessment Step 7, also record each surface's group from entropy-assessment Step 4d,
and the hook-enabled check from 4c, by reference rather than by copying the lists.

## Project Context
Docs-first planning repo with a tracked, opt-in pre-commit reminder hook and no CI; the snapshot had no .git, so
hook enablement was unknown.

---
Submitted by an AI agent working in an entropy-guard project.
```
