# Intent Statement

> This document is the north star for the entropy-guard project and the meta-skill we are building. It is meant to be refined collaboratively — by humans and AI agents — as our understanding deepens. When you update it, note the date and what prompted the revision.

*Last revised: 2026-02-21 — initial seed draft*

---

## What entropy means here

In thermodynamics, entropy is the tendency of closed systems toward disorder. In the systems we care about — software projects, living documents, collaborative processes, AI-assisted workflows — entropy looks different. It accumulates not as heat death, but as:

- **Intent drift**: the work gradually stops serving its original purpose without anyone noticing
- **Frayed edges**: half-finished thoughts, stale placeholders, orphaned files that no longer connect to anything
- **Forgotten learnings**: decisions re-litigated, gotchas re-discovered, patterns re-invented
- **Internal inconsistency**: docs that contradict each other, names that no longer match their referents, stated principles that don't match actual practice
- **Loss of self-awareness**: the system no longer knows what it is, what it decided, or why

These forms of entropy are insidious because they compound. Each iteration that doesn't actively guard against drift makes the next iteration harder and less coherent.

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

---

## What the meta-skill should achieve

The meta-skill (`skills/meta-guard.md`) is a process for analyzing *any* system — codebase, document corpus, team process, collaborative AI workflow — and designing an appropriate entropy guard for it. A good output from the meta-skill:

- Identifies the highest-value entropy vectors for that specific system (not a generic checklist)
- Proposes a guard that is proportionate to the system's complexity and iteration rate
- Acknowledges when multiple guards may be needed for complex systems
- Produces a guard file ready for the guards/ library, with rationale

The meta-skill is itself subject to this project's entropy guard. It should be run on this project periodically.

---

## Guiding principles

- **Guards should be the minimum viable intervention** — enough to hold coherence, no more
- **Low-burden by design** — 2–10 minutes, not an hour; this is sustained practice, not a one-off audit
- **Collaborative and cumulative** — humans and AI agents both contribute; each iteration should leave the system better-understood than before
- **Self-applying** — the guards and meta-skill developed here should be applied to this project itself

---

*This document is a living artifact. If you find something missing, imprecise, or worth expanding — add it. Note what prompted the revision.*
