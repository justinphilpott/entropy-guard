---
name: docs-first-planning-assessment
description: Assess markdown-first planning and design repos for entropy risks, map canonical truth ownership, produce a compact current-state packet for fresh sessions, and generate or refine docs/workflow delta guards.
metadata:
  version: "0.1.0"
---

# Skill: Docs-First Planning Assessment

Use this for markdown-first planning, architecture, blueprint, and design repos where the main artifact is evolving documentation and the main iteration loop is human and AI work across repeated sessions.

This workflow stays focused on delta guard production from assessment, but for this repo shape the useful lifecycle is bigger than a post-work guard alone:

1. assess the entropy profile
2. map canonical truth ownership
3. produce a compact current-state packet for the next fresh session
4. generate or refine a session-end delta guard
5. integrate the guard into the actual handoff loop

## When to Run

- The repo is markdown-first and the docs are the product, plan, or design surface
- The main risks are docs-to-docs drift, stale planning state, forgotten decisions, or workflow/practice drift
- Fresh AI sessions or handoffs regularly need to recover current truth from a large doc set
- The project already has a guard, but it is missing planning-repo checks like canonical ownership or supersession awareness

## When NOT to Run

- The system is primarily code-first and the main risks live in implementation, tests, or API contracts
- The repo is a static one-off document with little iteration and no recurring handoff loop
- The main need is adoption-time placement of an already-designed guard; use `skills/guards-integrator/SKILL.md` for that

---

## Phase 1: Assessment

### Step 1: Establish intent and planning horizon

Before classifying any documents, determine what the repo is trying to do now.

- Read the highest-level intent docs first: `README.md`, `INTENT.md`, architecture overview, roadmap, or equivalent.
- Write a 2-4 sentence intent summary.
- Identify the planning horizon: what is already settled, what is active, and what is still exploratory?

If you cannot tell what the repo is for, stop. The first entropy problem is missing purpose, not guard quality.

### Step 2: Map the canonical truth structure

The key question in docs-first planning repos is not just "what docs exist?" It is "which document owns which truth?"

Classify the main documents into these roles:

- **Canonical system-wide truth**: the main home for repo-wide intent, architecture, conventions, current shape, or settled decisions
- **Current-state / handoff artifacts**: `TODO.md`, session notes, current work summaries, next-step trackers
- **Local elaborations**: component docs, sub-area notes, local implications of system-wide constraints
- **Templates / instance-shaping docs**: templates, checklists, scaffolds, example packets
- **Historical / superseded / imported material**: docs preserved for context, merged-in packets from an earlier standalone system, or explicitly retired approaches

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
- **Registry/catalog duplication drift**: the same decision, question, component status, or convention is maintained in multiple files and slowly diverges
- **Standalone residue**: imported or merged docs still behave like independent source-of-truth packets
- **Local-vs-global inversion**: component docs restate system-wide truth in full rather than recording only local implications
- **Superseded-nearby interference**: old material is marked or half-marked but still easy to rehydrate into current work
- **Workflow/practice drift**: contributor instructions, guard triggers, TODO discipline, or handoff rituals no longer match reality
- **State entropy**: `TODO.md`, roadmap docs, stage summaries, or session notes no longer honestly represent the repo's current condition
- **Phrase-encoded automation brittleness**: scripts or checks encode wording, path assumptions, or transitional terminology that churns faster than the guard can be maintained

For each risk, note:

- decay rate
- recovery cost
- current symptoms
- likely canonical source that should anchor the fix

### Step 5: Produce the assessment packet

Deliver Phase 1 as a compact set of artifacts.

Required outputs:

- **Intent summary**
- **Canonical truth map**
- **Loop map**
- **Entropy profile**: top risks ranked by destructive potential
- **Recommendations**: what to consolidate, demote, mark as historical, or guard
- **Bootstrap actions**: one-time cleanup work needed before a recurring guard makes sense

Also produce a **current-state packet** for the next fresh session. Keep it short and operational.

The packet should include:

- current stage of the system
- canonical docs to trust first
- settled invariants or decisions not to reopen casually
- active fronts / current work areas
- open questions
- nearby superseded concepts or historical docs likely to mislead a fresh session
- 1-3 plausible next actions

If your goal is assessment only, stop here.

---

## Phase 2: Guard Generation / Refinement

Use this phase when the repo needs a new guard or the existing guard needs amendment.

### Step 6: Inventory existing guard surfaces

Before drafting anything new, inspect what already shapes the loop.

- existing guard files or checklists
- `AGENTS.md`, `CONTRIBUTING.md`, working-practice docs
- `TODO.md`, session logs, handoff notes, decision logs, learnings logs
- pre-commit reminders, wrappers, task templates, or PR templates

Classify each surface:

- keep as-is
- amend
- replace
- demote to historical context

Prefer refining a mostly-sound existing guard over replacing it.

### Step 7: Design the docs-first delta guard

For this repo shape, the default is usually one combined docs + workflow guard run at session end or before commit.

The guard should stay delta-scoped and low-burden. It should check only what changed in this session.

Recommended checklist areas:

- **Canonical ownership**: if a concept changed, does it still have one canonical home?
- **Local implication discipline**: do nearby docs carry links or local implications rather than parallel full explanations?
- **Supersession check**: before restoring a deleted file, reviving an old concept, or fixing a broken reference by recreation, check whether it was intentionally superseded in `DECISIONS.md`, a current-state doc, or another canonical artifact
- **Cross-reference integrity**: did any changed paths, section names, or doc links go stale?
- **Decision / learning capture**: did this session produce something that belongs in `DECISIONS.md`, `LEARNINGS.md`, ADRs, or equivalent?
- **State honesty**: does `TODO.md` or the current-state summary still match reality?
- **Workflow alignment**: do the instructions a fresh agent would follow still match the loop actually used in this session?

Include at least one explicit check against guard-induced entropy:

- If you are recommending automation, is the invariant durable enough to justify it?
- If the proposed script mostly encodes current wording, path names, or transitional terms, keep it in the narrative guard for now.

### Step 8: Recommend enforcement depth and integration

For each check, choose the smallest effective depth.

- **Narrative / judgment-heavy**: canonical ownership, supersession, intent alignment, local-vs-global fit
- **Prompted**: reminder hooks, wrapper prompts, session-close standing instructions
- **Semi-embedded**: link checking, required file presence, stable frontmatter/schema checks, stale-path searches, template structure checks
- **Avoid early automation** when the check depends on volatile phrasing, unstable paths, or architecture that is still moving quickly

If AI agents participate, make the lifecycle explicit:

- session start: read the current-state packet first
- during work: update the canonical home, not every nearby mention
- session end / before commit: run the delta guard

If the system has multiple actors or multiple handoff points, hand the result to `skills/guards-integrator/SKILL.md` for a deeper adoption plan.

### Output

Deliver:

- the refined or generated guard
- the current-state packet
- the canonical truth map
- immediate integration advice
- any uncertainties or cleanup items still left open

Do not track bootstrap completion by editing the guard definition itself. Record completion in a companion artifact such as `TODO.md`, a session log, or a handoff note.

---

## Upstream Feedback Check

Before you finish, ask whether this skill itself missed something reusable.

Examples:

- it failed to identify the repo's real canonical truth structure
- it recommended a packet that was too large to be useful in a fresh session
- it proposed automation that would clearly become a new entropy surface
- it missed a docs-first planning vector that future users would likely hit too

If yes, capture a short feedback note and use `skills/local/entropy-guard-feedback/SKILL.md` when working inside this repo.

---

## What This Is Not

- A general code-quality assessment
- A full document rewrite or harmonization pass by default
- A replacement for `guards-integrator`
- A promise that every docs-first planning repo needs multiple guards; many still want one combined session-close guard plus a good current-state packet
