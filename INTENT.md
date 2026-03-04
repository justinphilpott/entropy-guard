# Intent Statement

> This document is the north star for the entropy-guard project and the meta-skill we are building. It is meant to be refined collaboratively — by humans and AI agents — as our understanding deepens. When you update it, note the date and what prompted the revision.

*Last revised: 2026-02-24 — added entropy dimensions, enforcement depth spectrum, and inter-domain drift (from discussion on making the project genuinely useful)*

---

## What entropy means here

In thermodynamics, entropy is the tendency of closed systems toward disorder. In the systems we care about — software projects, living documents, collaborative processes, AI-assisted workflows — entropy looks different. It accumulates not as heat death, but as:

- **Intent drift**: the work gradually stops serving its original purpose without anyone noticing
- **Frayed edges**: half-finished thoughts, stale placeholders, orphaned files that no longer connect to anything
- **Forgotten learnings**: decisions re-litigated, gotchas re-discovered, patterns re-invented
- **Internal inconsistency**: docs that contradict each other, names that no longer match their referents, stated principles that don't match actual practice
- **Loss of self-awareness**: the system no longer knows what it is, what it decided, or why

These forms of entropy are insidious because they compound. Each iteration that doesn't actively guard against drift makes the next iteration harder and less coherent.

### Entropy dimensions

An operational definition: **entropy is the effort required for a competent newcomer to accurately understand a system's current state, purpose, and design rationale — and to make a confident, correct change.** A low-entropy system explains itself. A high-entropy system requires archaeology.

This can be assessed across five dimensions:

1. **Intent entropy**: how much of the "why" has been lost? Can you explain the rationale for each major design choice without reverse-engineering it from code?
2. **Consistency entropy**: how many patterns coexist for the same class of problem? How many conventions are violated?
3. **Referential entropy**: how many cross-references, links, and names are stale or broken?
4. **State entropy**: how much of the system's self-description is outdated? Does the system accurately represent its own condition?
5. **Knowledge entropy**: how many learnings have been lost and will need to be rediscovered?

Each dimension decays at a different rate and has a different recovery cost. **Guards should be prioritized by the product of decay rate and recovery cost.** Intent entropy decays slowly but is catastrophic to recover. Referential entropy decays fast but is cheap to fix — if caught within one iteration. Left for five iterations, it becomes archaeology.

### Inter-domain drift

Most real-world entropy shows up as drift *between* domains, not just within them. A system has three aspects that must stay in agreement:

- **The map** (documentation) — what the system says it is
- **The territory** (code/implementation) — what the system actually does
- **The practice** (workflow) — how people actually use and change the system

A guard that only checks internal consistency within one domain will miss the most damaging form of entropy: the map no longer matches the territory, or the stated practice no longer matches what people actually do.

---

## What a guard should preserve

An entropy guard — whether a skill, a ritual, a checklist, or a suite of processes — should work to preserve:

1. **Continuity of intent**: the system continues to serve what it set out to serve, even as it evolves
2. **Internal consistency**: the parts of the system agree with each other — docs match code, names match reality, decisions are recorded and respected
3. **Accumulated knowledge**: learnings, decisions, and hard-won insights survive across iterations and contributors
4. **Legibility**: a new contributor (human or AI) can orient quickly — the system can explain itself
5. **Honest state**: the system accurately represents its own current condition, not an idealized past version

---

## What a guard should NOT be

- **A full audit**: guards are delta-scoped — they address what changed in this iteration, not everything that could theoretically be wrong
- **A blocker**: a guard that takes too long won't be run. Low burden is a design requirement, not a nice-to-have
- **Opinionated about content**: a guard checks *coherence and completeness*, not whether the underlying decisions were wise
- **Static**: guards themselves need to evolve as systems evolve. A guard that no longer fits the system is itself a source of entropy
- **Always a skill file**: not all guards are checklists. Depending on the entropy vector, the right guard might be a linting rule, a CI check, an architectural constraint, or a type system invariant. Skill files are appropriate for judgment-requiring checks; mechanical checks should be embedded more deeply (see enforcement depth below)

---

## What the guard generator should achieve

The system is a two-layer architecture. The entry point (`skills/entropy-assessment/SKILL.md`) assesses any system — codebase, document corpus, API, test suite, collaborative workflow — and produces an entropy profile. It can optionally route to domain-specific generators that produce the actual guards. Domain generators (docs, test, code, API) are peer skills under `skills/` and provide deep, domain-aware analysis.

A good output from the guard generator:

- Identifies which domains the system spans and which are highest-risk
- Routes to the right domain-specific generators, providing cross-domain context
- Produces guards that are proportionate to the system's complexity and iteration rate
- Coordinates multiple guards so they don't overlap or leave gaps — especially at inter-domain boundaries
- Each guard is a skill file ready to be placed in the target system, with rationale

The guard generator is itself subject to this project's entropy guard. It should be run on this project periodically.

### The guard lifecycle: three distinct tools

A complete guard system involves three distinct tools that serve different purposes:

1. **Guard generator** (design-time) — analyzes a system and produces guards tailored to its entropy profile. Run when setting up guards for a new system or re-evaluating whether existing guards still fit. This is the entry point + domain generators described above.

2. **Guard runner** (run-time) — discovers all guards registered for a system and executes them at the correct handoff point (pre-commit, CI, PR review). This is the operational wrapper that ensures guards actually get run. A guard that exists but isn't run is dead weight. The runner handles discovery, ordering, execution, and output aggregation.

3. **Guard evaluator** (maintenance-time) — periodically checks whether the guard set is still appropriate for the system. Have the guards gone stale? Has the system outgrown them? Are they consistent with each other? This is the generator re-run in evaluation mode, aided by the versioning metadata (generated date, system snapshot) that each guard carries.

These three tools have different cadences: the generator runs once (or rarely), the runner runs at every handoff point, and the evaluator runs periodically. They should not be conflated.

### Enforcement depth spectrum

Not all guards should live at the same level. There is a spectrum of enforcement depth, and the meta-skill should map each identified entropy vector to the appropriate level:

1. **External** (skill file, checklist) — relies on discipline; best for judgment-requiring checks like intent alignment
2. **Prompted** (pre-commit hook, workflow reminder) — removes the need to remember; still requires judgment
3. **Semi-embedded** (linting, CI checks, automated tests) — catches mechanical issues automatically; no discipline required
4. **Fully embedded** (type system, schema constraints, architectural invariants) — certain entropy is structurally impossible

Heuristic: **if you're relying on discipline for something that could be mechanically checked, that's a design smell.** Conversely, if you're trying to mechanically enforce something that requires judgment, you'll get false positives and people will learn to ignore the guard.

The most mature form of a guard is when it becomes a behaviour of the system itself — the external skill file is scaffolding that can eventually be removed for entropy vectors that are mechanically checkable.

---

## Guiding principles

- **Guards should be the minimum viable intervention** — enough to hold coherence, no more
- **Low-burden by design** — 2–10 minutes, not an hour; this is sustained practice, not a one-off audit
- **Collaborative and cumulative** — humans and AI agents both contribute; each iteration should leave the system better-understood than before
- **Self-applying** — the guards and meta-skill developed here should be applied to this project itself

---

*This document is a living artifact. If you find something missing, imprecise, or worth expanding — add it. Note what prompted the revision.*
