---
name: entropy-assessment
description: Assess any system for entropy risks. Inventories what exists, identifies which domains are at risk, surfaces cross-domain drift, and produces an entropy profile with recommendations. Optionally continues to guard generation using domain-specific generators.
metadata:
  version: "0.2.0"
---

# Skill: Entropy Assessment

Assess a system's entropy profile — where it's drifting, what's at risk, and what to do about it. This skill walks through a structured assessment that produces a standalone entropy report. If you want to go further and generate guards, it coordinates domain-specific generators to do that.

**Two phases, one skill:**
- **Phase 1 (Steps 1–4): Assessment** — produces an entropy profile and recommendations. This is a complete, useful deliverable on its own.
- **Phase 2 (Steps 5–8): Guard generation** — optional. Runs domain-specific generators to produce guard artifacts based on the assessment.

> **Before you begin**: Read [INTENT.md](../../INTENT.md) (from the [entropy-guard](https://github.com/justinphilpott/entropy-guard) project). The intent statement defines what a guard should preserve and what it should not be. Use it as your north star throughout.

> **Status**: Living scaffold. The starting point for all entropy assessment and guard generation. Refine based on real use and note what works in LEARNINGS.md.

---

## Domain-specific generators

These live alongside this file and produce the actual guards:

- [**docs-guard-generator**](../docs-guard-generator/SKILL.md) — documentation systems
- [**test-guard-generator**](../test-guard-generator/SKILL.md) — test suites
- [**code-guard-generator**](../code-guard-generator/SKILL.md) — codebases
- [**api-guard-generator**](../api-guard-generator/SKILL.md) — API contracts

Each generator has its own Step 0 (system inventory), domain-specific entropy vectors, and enforcement depth analysis. The assessment phase (Steps 1–4) determines which generators are relevant; the generation phase (Steps 5–8) runs them and coordinates their output.

---

## When to Run

- When you want to understand a system's entropy risks (assessment only — stop after Step 4)
- When you encounter a new system that undergoes repeated iteration and has no entropy guard
- When asked to evaluate whether an existing system's guards are adequate
- When an existing guard feels stale or misaligned and you need to reassess from scratch

## When NOT to Run

- As a substitute for actually running an existing guard — if a guard exists, run it
- For trivial one-off scripts or throwaway artifacts that won't be iterated
- When you already know which domain generator to run — go directly to it

---

## Phase 1: Assessment

### Step 1: Establish system intent

Before anything else, determine whether the system can explain itself.

- Does intent documentation exist? (INTENT.md, README with a clear "why," architecture doc, design doc)
- If yes: read it and write a 2–4 sentence intent summary.
- If no: **this is the highest-priority finding.** Before a guard can check alignment with intent, intent must be articulated. Help the maintainer write a brief intent statement — even 2–3 sentences is enough to anchor everything that follows. Record it in the system (INTENT.md, README, or wherever is natural).

If you can't articulate what this system is for after investigation, stop. A guard for a system with no discernible intent is premature — the first task is to clarify purpose, not to guard it.

### Step 2: Assess the system landscape

Survey the system at a high level to understand what it contains and how it's structured. You're not going deep yet — you're building a map to decide which domain generators are relevant.

**What domains does this system span?**

| Domain | Present? | Signals |
|--------|----------|---------|
| **Code** | Yes/No | Source files, build system, runtime artifacts |
| **Documentation** | Yes/No | README, docs/, wiki, guides, API reference, inline docs |
| **Tests** | Yes/No | Test files, test config, CI test steps, coverage reports |
| **API contracts** | Yes/No | API endpoints, OpenAPI spec, GraphQL schema, protobuf, IPC interfaces, public SDK |

Most systems span multiple domains. A web application likely has all four. A documentation project might only have docs (and possibly tests for doc tooling). A library might have code, tests, docs, and an API contract.

**What is the iteration pattern?**

- How does this system change? (Commits, PRs, agent sessions, document edits, manual processes?)
- Who makes changes? (Solo developer, team, AI agents, a mix?)
- How often? (Multiple times daily, weekly, per sprint, sporadically?)
- What is the handoff point? (PR merge, deploy, sprint boundary, session end?)

Note whether different domains have different iteration patterns. Documentation may lag code. Tests may lag features. API specs may only update at release time. These cadence mismatches are themselves an entropy signal.

### Step 3: Identify cross-domain drift risks

Before routing to domain-specific generators, assess the **inter-domain drift** risks (from INTENT.md). These live in the gaps *between* domains and no single domain generator will catch them:

- **Docs vs. implementation**: do the docs describe the current system, or a past version?
- **Tests vs. implementation**: do the tests verify the current contract, or an old one?
- **API spec vs. implementation**: does the spec match what the code actually does?
- **Tests vs. docs**: do the documented behaviors have corresponding tests? Do tested behaviors appear in the docs?

Note the most dangerous drift risks. These will inform how the domain generators coordinate — for example, the docs guard should cross-check against code, and the test guard should cross-check against the API contract.

### Step 4: Select and sequence domain generators

Based on Steps 2 and 3, decide which domain generators to run.

**Selection criteria:**

- Only run generators for domains that are present and will be iterated. Don't generate a test guard for a system with no tests and no plan to add them.
- Prioritize by entropy risk. If docs/code drift is the biggest danger, run the docs generator first.
- Consider whether the standard `entropy-guard` skill (the general post-work checklist in `skills/local/entropy-guard/SKILL.md`) already covers the system adequately. For simple systems with one domain, the standard guard may be enough. Note this explicitly rather than running generators unnecessarily.

**Sequencing:**

If running multiple generators, sequence them so each can build on the previous one's findings:

1. **Code** first (if applicable) — establishes the architectural baseline that other domains reference
2. **API contract** second (if applicable) — defines the contract surface that tests should verify and docs should describe
3. **Tests** third (if applicable) — can reference the code architecture and API contract
4. **Docs** last (if applicable) — can reference all of the above and check alignment across them

This is a suggested order, not a requirement. Adapt to the system.

**Coordination instructions:**

When invoking each domain generator, provide it with:
- The system intent summary from Step 1
- The relevant cross-domain drift risks from Step 3
- What the other generators are covering, so it can avoid overlap and include cross-domain checks where appropriate

### Assessment output

At this point you have a complete entropy assessment. Deliver it as a report:

- **System intent summary** (from Step 1)
- **Domain map** — which domains are present, their iteration patterns, cadence mismatches (from Step 2)
- **Entropy risk profile** — top cross-domain drift risks, ranked by danger (from Step 3)
- **Recommendations** — which domain generators to run (if any), in what order, and why. For simple systems, note if the standard entropy-guard checklist is sufficient (from Step 4)
- **Bootstrap actions** — anything the system needs before guards can work (e.g., write an intent statement, consolidate duplicate conventions)

> **If your goal is assessment only, stop here.** The report above is a complete deliverable — it tells the system's maintainers where entropy is accumulating and what to do about it. Continue to Phase 2 only if you want to produce guard artifacts.

---

## Phase 2: Guard Generation (optional)

This phase takes the assessment from Phase 1 and produces concrete guard artifacts by running domain-specific generators. Only continue here if the goal is to produce guards, not just to assess.

### Step 5: Run the generators

Run each selected domain generator in sequence. Each generator follows its own Steps 0–7 process and produces a draft guard.

As each generator completes, note:
- What guard it produced
- What entropy vectors it prioritized
- What enforcement depth recommendations it made
- What cross-domain checks it included

### Step 6: Coordinate the outputs

After all generators have run, review the complete set of guards for coherence:

- **Overlap**: are any checks duplicated across guards? Consolidate — each check should live in exactly one guard.
- **Gaps**: are there cross-domain drift risks from Step 3 that no guard covers? Add them to the most appropriate guard.
- **Handoff alignment**: if guards run at different handoff points (e.g., code guard at PR merge, docs guard at release), are the cross-domain checks timed correctly? A docs/code drift check is useless if it runs before the code has been merged.
- **Burden check**: will running all the guards together stay within the low-burden principle (total 2–10 minutes at each handoff point)? If not, consider consolidating or staggering.
- **Bootstrap sequencing**: if multiple guards have bootstrap actions (from their Step 0 findings), what order should they be done in? Intent documentation first, then everything else.

### Step 7: Close the loop — integration and versioning

A guard that isn't integrated into the workflow is dead weight. This step ensures every guard produced actually gets run.

**Integration plan:**

For each guard, specify:
- **Trigger**: exactly when and how the guard runs. Options by enforcement depth:
  - *External*: contributor runs it manually (skill file instructions)
  - *Prompted*: pre-commit hook prints a reminder, PR template includes a checkbox
  - *Semi-embedded*: CI step runs the guard automatically, blocks merge if checks fail
  - *Fully embedded*: guard checks are structural (type system, schema validation) — no separate "run" needed
- **Discovery**: how does a new contributor find out which guards exist? Recommend a manifest — a `guards/` directory, a section in AGENTS.md, or a guard-runner config file that lists all active guards.
- **Execution**: if multiple guards exist, what order do they run in? Can they run in parallel, or do they depend on each other's output?

The ideal integration is a **guard runner** — a wrapper (script, CI step, or skill) that:
1. Discovers all guards registered for this system
2. Runs them in the correct order at the correct handoff point
3. Aggregates output into a single report
4. Blocks commit/merge if any guard flags a critical issue

If the target system doesn't have the infrastructure for a guard runner, the minimum viable integration is: add the guard to the contributor guide with "run before commit" instructions, and add a PR template checkbox.

**Versioning:**

Each generated guard should include metadata:
- **Generated**: date and which generator version produced it
- **Last evaluated**: date the guard was last regenerated or reviewed for fit
- **System snapshot**: brief description of the system state when the guard was designed (so future evaluators can tell if the system has outgrown the guard)

This enables a periodic health check: "was this guard designed for the system as it exists today, or for an older version?" A guard designed for a 3-file project may be inadequate for a 30-file project. The entry point can be re-run to evaluate whether existing guards need regeneration.

### Step 8: Output

Deliver the complete guard set to the target system. For each guard:
- Save it as a skill file in the target system's skills directory
- Include the versioning metadata (generated date, system snapshot)
- Include integration instructions (trigger, discovery, execution)
- Note its scope, handoff point, and relationship to other guards

Provide a summary that includes:
- The system intent summary
- Which domains were assessed and why
- Which generators were run (and which were skipped, with reasoning)
- The top cross-domain drift risks and which guards address them
- Bootstrap actions needed before the guards can be run effectively (ordered)
- **Integration plan**: how the guards will be triggered, discovered, and executed
- **Versioning baseline**: the system snapshot so future evaluations can detect drift
- Any uncertainties or areas to revisit after real use

---

## What This Is Not

- A guard itself — the assessment diagnoses entropy risks, and the optional generation phase produces guards
- A replacement for domain generators — this assesses and routes, the generators do the deep work
- A one-size-fits-all template — the value is in system-specific assessment and targeted recommendations
- A finished product — the first version of any assessment or guard set should be treated as a hypothesis, validated by real use
