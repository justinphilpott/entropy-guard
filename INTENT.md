# Intent Statement

> This document is the north star for the entropy-guard project and the meta-skill we are building. Its steward is Justin Philpott. Anyone, human or agent, can propose a change by recording it in `DECISIONS.md` as proposed; it lands here once Justin has decided it. When you update it, note the date, what prompted the revision, and the decision it follows.

*Last revised: 2026-10-04 — following Justin's approval of the skills revision ("go ahead with the revision", 4 October; `explorations/2026-10-04-skills-review-synthesis.md`): intent is authorised by the steward rather than inferred, one skill builds guards, guards hold only durable checking policy, and ORC becomes the next validation target. Previous revision: 2026-04-07, docs-first planning specialization.*

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

1. **Continuity of intent**: the system continues to serve what its steward authorised, even as it evolves. A change of intent is the steward's decision, recorded with a date. A guard never resolves a mismatch between work and intent by editing the intent to fit the work.
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
- **A copy of current state, or of rules owned elsewhere**: a guard holds durable checking policy and points at the state file, the decision log and the rules' owners. Copied state and copied rules go stale as soon as their owners change them.
- **Always a skill file**: not all guards are checklists. Depending on the entropy vector, the right guard might be a linting rule, a CI check, an architectural constraint, or a type system invariant. Skill files are appropriate for judgment-requiring checks; mechanical checks should be embedded more deeply (see enforcement depth below)

---

## What the guard generator should achieve

The skills share one flow:

1. **The front door** (`skills/entropy-assessment/SKILL.md`) runs the intent pass (`skills/entropy-assessment/intent-pass.md`), which establishes what the steward has authorised, separately from what the documents and code currently say. It then classifies the system's shape and routes it.
2. **Analysis**: `skills/docs-first-planning-assessment/SKILL.md` for markdown-first planning and design repos; the front door's own profile for mixed, code-first and workflow-heavy systems, including systems spread over more than one repository.
3. **Guard building**: `skills/session-coherence-skill-generator/SKILL.md` is the only skill that writes guards, and it bootstraps young repos.
4. **Adoption**: `skills/guards-integrator/SKILL.md` places the guard and checks that it is actually adopted.

For docs-first planning repos the useful output is a small lifecycle: an entropy profile, a canonical truth map, an up-to-date current-state file for fresh sessions, and a session-end guard that protects the delta before it compounds.

A good output from the generator:

- Identifies which domains the system spans and which are highest-risk
- Produces guards that are proportionate to the system's complexity and iteration rate
- When generating guards for multiple domains, ensures they don't overlap or leave gaps — especially at inter-domain boundaries
- Each guard is a skill file ready to be placed in the target system, with rationale

The assessment workflow is itself subject to this project's entropy guard. It should be run on this project periodically.

### The guard lifecycle: four distinct tools

A complete guard system involves four distinct roles that serve different purposes. In this repo, assessment, generation and integration are explicit skills. The runner and the evaluator are not separate tools, for the reasons given under each.

1. **Guard generator** (design-time) — analyzes a system and produces guards tailored to its entropy profile. Run when setting up guards for a new system or re-evaluating whether existing guards still fit. In this repo, the assessment skills decide what is needed (`skills/entropy-assessment/` and `skills/docs-first-planning-assessment/`), and `skills/session-coherence-skill-generator/` builds the guard.

2. **Guard integrator** (adoption-time) — examines the system's current loops (agent sessions, commits, PRs, CI, releases) and recommends how generated guards should be discovered, triggered, and introduced with minimal friction. This is the bridge between guard design and real use. A generated guard without an adoption path is only half-finished. In this repo, that role is represented by `skills/guards-integrator/SKILL.md`.

3. **Guard runner** (run-time) — executes guards at the correct handoff point (pre-commit, CI, PR review). A guard that exists but isn't run is dead weight. Decided on 2026-10-04 not to build a separate runner: each guard defines what changed in a session and picks its checks for that change, and the system's own loop (a hook, CI, an agent's standing instructions, or a scheduler) runs it. The integrator verifies that this actually happens.

4. **Guard evaluator** (maintenance-time) — periodically checks whether the guard set is still appropriate for the system. Have the guards gone stale? Has the system outgrown them? Are they consistent with each other? This is a fresh assessment run against the system. For the skills themselves, the evaluator is the set of known-answer cases in `explorations/2026-10-04-skills-revision-eval.md`, run before and after each revision.

These four tools have different cadences: the generator and integrator run when guards are introduced or redesigned, the runner runs at every handoff point, and the evaluator runs periodically. They should not be conflated.

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

## Scope boundary and next validation loop

This repo is now intentionally narrower than the broader conceptual work it helped surface.

- `entropy-guard` stays focused on practical entropy protection: assessment, guard generation/refinement, integration, and eventually stronger operational validation.
- The larger exploration into entropic immunity, layered steering, viability, and broader sociotechnical theory now continues in the sibling `entropy-immune-system` repo.

The next major step for this repo is not to widen its philosophy further, but to validate its current practical level more aggressively. The first validation wedge was the repo shape where the methodology was already proving useful: docs-first planning systems. The next target is ORC, Justin's orchestration system, assessed together with the lab Scope that manages it (Justin, 2026-10-04: "Once we've upgraded entropy guard if that's clearly useful, we'll be ready to unleash it on the ORC"). It is a mixed code, docs and workflow system spread over more than one repository, which tests the routes beyond docs-first.

- assess ORC and the lab together, read-only first, then with Justin's approval for any change
- select a larger batch of docs-first planning / architecture / blueprint repos
- run `entropy-assessment` as the front door and follow its route
- generate or refine guards where appropriate and keep each repo's current-state file up to date for session start
- run those guards locally while making targeted improvements
- track whether this produces clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and sharper feedback on what the methodology gets right or wrong

---

*This document is a living artifact. If you find something missing, imprecise, or worth expanding — add it. Note what prompted the revision.*
