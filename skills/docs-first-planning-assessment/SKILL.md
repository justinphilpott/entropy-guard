---
name: docs-first-planning-assessment
description: Analyse markdown-first planning and design repos for entropy risks. Map which document owns which truth, bring the repo's current-state file up to date for fresh sessions, and supply the docs-first checks that the guard generator builds into the repo's guard.
metadata:
  version: "0.2.0"
---

# Skill: Docs-First Planning Assessment

Use this for markdown-first planning, architecture, blueprint, and design repos where the main artifact is evolving
documentation and the main iteration loop is human and AI work across repeated sessions.

This skill is the analysis for this repo shape. It does not write guards itself:
`skills/session-coherence-skill-generator/SKILL.md` builds the guard from what this skill finds.

The lifecycle for this repo shape:

1. establish authorised intent
2. map canonical truth ownership
3. bring the repo's current-state file up to date for the next fresh session
4. supply the docs-first checks to the guard generator
5. integrate the guard into the actual handoff loop

## When to Run

- The repo is markdown-first and the docs are the product, plan, or design surface
- The main risks are docs-to-docs drift, stale planning state, forgotten decisions, or workflow/practice drift
- Fresh AI sessions or handoffs regularly need to recover current truth from a large doc set
- The project already has a guard, but it is missing planning-repo checks like canonical ownership or supersession
  awareness

## When NOT to Run

- The system is primarily code-first and the main risks live in implementation, tests, or API contracts: use
  `skills/entropy-assessment/SKILL.md`
- The repo is a static one-off document with little iteration and no recurring handoff loop
- The main need is adoption-time placement of an already-built guard: use `skills/guards-integrator/SKILL.md`

---

## Phase 1: Assessment

### Step 1: Establish authorised intent and planning horizon

If `entropy-assessment` already ran the intent pass in this session, use its output. Otherwise, run the intent pass
in [`../entropy-assessment/intent-pass.md`](../entropy-assessment/intent-pass.md).

Then identify the planning horizon: what is settled, what is active, and what is still exploratory?

### Step 2: Map the canonical truth structure

The key question in docs-first planning repos is not just "what docs exist?" It is "which document owns which
truth?"

Classify the main documents into these roles:

- **Canonical system-wide truth**: the main home for repo-wide intent, architecture, conventions, current shape, or
  settled decisions
- **Current-state / handoff artifacts**: `TODO.md`, `STATE.md`, session notes, current work summaries, next-step
  trackers
- **Local elaborations**: component docs, sub-area notes, local implications of system-wide constraints
- **Templates / instance-shaping docs**: templates, checklists, scaffolds, example packets
- **Historical / superseded / imported material**: docs preserved for context, merged-in packets from an earlier
  standalone system, or explicitly retired approaches

For each major concept, ask:

- Where is its one canonical home?
- Which other docs mention it only as a link, summary, or local implication?
- Are two docs trying to be independently complete about the same thing?
- Are historical or imported docs still sitting near live truth without enough demotion?

Produce a **canonical truth map** with short bullets or a table.

### Step 3: Map the real iteration loop

These repos often drift through workflow, not just content.

Write a short loop map:

- how a fresh session starts
- which docs are normally read first
- where active work gets tracked
- when decisions/learnings are captured
- when the contributor pauses to check coherence
- whether the main handoff is session end, commit, PR, or something else

Prefer the real loop over the idealized loop.

### Step 4: Identify the top docs-first entropy vectors

Rank the top 3-5 risks for this repo. Common vectors here:

- **Parallel truth**: two or more docs behave like peers for the same concept
- **Registry/catalog duplication drift**: the same decision, question, component status, or convention is
  maintained in multiple files and slowly diverges
- **Standalone residue**: imported or merged docs still behave like independent source-of-truth packets
- **Local-vs-global inversion**: component docs restate system-wide truth in full rather than recording only local
  implications
- **Superseded-nearby interference**: old material is marked or half-marked but still easy to rehydrate into
  current work
- **Workflow/practice drift**: contributor instructions, guard triggers, TODO discipline, or handoff rituals no
  longer match reality
- **State entropy**: `TODO.md`, roadmap docs, stage summaries, or session notes no longer honestly represent the
  repo's current condition
- **Phrase-encoded automation brittleness**: scripts or checks encode wording, path assumptions, or transitional
  terminology that churns faster than the guard can be maintained

For each risk, note:

- decay rate
- recovery cost
- current symptoms
- likely canonical source that should anchor the fix

### Step 5: Bring the current-state file up to date

A fresh session needs a short, operational view of current truth. Put that view in the repo's **existing**
current-state file (`TODO.md`, `STATE.md`, a handoff note, or whatever the loop map shows is read first). Do not
create a second summary that competes with it. If the repo has no such file, create the smallest one, following the
bootstrap rules in `session-coherence-skill-generator`.

The current-state view holds:

- the current stage of the system
- the canonical docs to trust first, from the truth map
- settled decisions not to reopen casually, each linked to where it is recorded
- active fronts and current work areas
- open questions, including any questions from the intent pass
- nearby superseded concepts or historical docs likely to mislead a fresh session
- 1-3 plausible next actions

It carries only what the docs and code cannot tell a fresh reader quickly: decisions, supersessions, open questions
and rules. It is not an overview of the repo.

Each claim likely to change within weeks, such as a stage, an active front or a next action, carries its source and
the date it was last checked. The file also says what makes it stale, for example "re-check after any change to
`ROADMAP.md`".

### Step 6: Deliver the assessment

Deliver Phase 1 as a compact set of artifacts:

- **Intent section**, from the intent pass
- **Canonical truth map**
- **Loop map**
- **Entropy profile**: top risks ranked by destructive potential
- **Recommendations**: what to consolidate, demote, mark as historical, or guard
- **Bootstrap actions**: one-time cleanup needed before a recurring guard makes sense, each verified against the
  current artifact
- **The current-state update**, as a patch or as the files changed

If your goal is assessment only, stop here.

---

## Phase 2: Supply the guard generator

Use this phase when the repo needs a new guard or the existing guard needs amendment. The guard itself is built by
`skills/session-coherence-skill-generator/SKILL.md`. This phase prepares what that generator needs from this repo
shape.

### Step 7: Inventory existing guard surfaces

Before anything new is built, inspect what already shapes the loop:

- existing guard files or checklists
- `AGENTS.md`, `CONTRIBUTING.md`, working-practice docs
- `TODO.md`, session logs, handoff notes, decision logs, learnings logs
- pre-commit reminders, wrappers, task templates, or PR templates

Classify each surface as one of:

- keep as-is
- amend
- replace
- demote to historical context

Prefer refining a mostly-sound existing guard over replacing it.

### Step 8: Prepare the docs-first checks

These are the judgment checks a guard for this repo shape needs. Write each one against this repo's actual files:

- **Canonical ownership**: if a concept changed, does it still have one canonical home?
- **One owner, not two copies**: when a change touches something that two documents both describe, decide which
  owns it and reduce the other to a link or a local implication. Do not keep both up to date as peers.
- **Supersession**: before restoring a deleted file, reviving an old concept, or fixing a broken reference by
  recreation, check whether the thing was intentionally superseded in `DECISIONS.md`, the current-state file, or
  another canonical artifact
- **Cross-reference integrity**: did any changed paths, section names, or doc links go stale?
- **Decision and learning capture**: did this session produce something that belongs in `DECISIONS.md`,
  `LEARNINGS.md`, ADRs, or equivalent?
- **State honesty**: does the current-state file still match reality?
- **Workflow alignment**: do the instructions a fresh agent would follow still match the loop actually used in this
  session?

Note which of these, if any, are stable enough to move into tooling. Link checking and required-file checks usually
are. Keep checks that depend on volatile wording, unstable paths, or fast-moving architecture as judgment checks for
now.

### Step 9: Hand to the generator

Run `skills/session-coherence-skill-generator/SKILL.md` with these inputs:

- the intent section
- the canonical truth map and the loop map
- the checks from Step 8
- the guard surfaces from Step 7

Then hand the result to `skills/guards-integrator/SKILL.md` for placement and a check that the guard is actually
adopted.

### Output

Deliver:

- the Phase 1 artifacts
- the inputs handed to the generator
- the guard the generator built or amended
- any uncertainties or cleanup items still open

Track bootstrap completion in a companion artifact, such as `TODO.md`, a session log or a handoff note. Never track
it by editing the guard definition itself.

---

## Upstream Feedback Check

Before you finish, ask whether this skill itself missed something reusable.

Examples:

- it failed to identify the repo's real canonical truth structure
- its current-state update was too large to be useful in a fresh session
- it proposed automation that would clearly become a new entropy surface
- it missed a docs-first planning vector that future users would likely hit too

If yes, capture a short feedback note and use `skills/local/entropy-guard-feedback/SKILL.md` when working inside this
repo.

---

## What This Is Not

- A general code-quality assessment
- A full document rewrite or harmonization pass by default
- A guard builder: `session-coherence-skill-generator` builds the guard
- A promise that every docs-first planning repo needs multiple guards; most want one session-close guard and a good
  current-state file
