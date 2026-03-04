---
title: "When the Map Is the Territory: Quality for Documentation-as-Product"
status: draft
date: 2026-03-03
themes: [entropy, documentation, map-territory, quality-processes]
source: Session where dogfooding the generator against a documentation-only project revealed that standard quality frameworks assume a separate implementation
---

# When the Map Is the Territory: Quality for Documentation-as-Product

Every quality framework I've seen makes the same assumption: there's something, and then there's the description of that thing. Code and its documentation. An API and its spec. A system and its architecture diagram. The quality question is always: does the description match the reality?

This is the map/territory model. Korzybski's famous axiom — "the map is not the territory" — is the foundation of most quality thinking. Keep the map in sync with the territory. When they drift, you have a problem.

But what happens when the map *is* the territory?

## Documentation-as-system

Some systems are made entirely of documentation. Not documentation about a system — documentation that *is* the system:

- A methodology repository where the skill definitions *are* the product
- A design system where the documentation *is* what designers consume
- An internal wiki that *is* the source of truth for how the organisation works
- A policy handbook that *is* the governance framework
- A knowledge base that *is* the institutional memory

These systems have no separate implementation to drift from. There's no code to go out of sync with. There's no deployed service to diverge from the spec. The artifact is the product.

When you try to apply standard quality frameworks to these systems, something breaks. "Do the docs match the code?" is meaningless. "Does the spec reflect the implementation?" has no referent. The entire vocabulary of map/territory quality doesn't apply.

But these systems absolutely accumulate entropy. They just accumulate it differently.

## How the vectors invert

The entropy vectors don't disappear — they point inward instead of across a domain boundary.

**Map/territory drift → Internal consistency drift.** In a codebase, docs can contradict the implementation. In a documentation-as-system, *docs contradict other docs*. File A says the process has five steps. File B says four. File A was updated last month; File B was updated six months ago. Neither is "the code" — both are the system. Internal consistency becomes the primary quality vector.

**Coverage gaps → Conceptual completeness gaps.** In a codebase, you worry about features without documentation. In a documentation-as-system, you worry about *concepts without coverage*. The methodology discusses enforcement depth but no skill file actually applies it. The intent statement mentions inter-domain drift but no guard checks for it. The gap isn't between code and docs — it's between what the system claims to address and what it actually addresses.

**Stale examples → Stale methodology.** In a codebase, you worry about code samples that no longer compile. In a documentation-as-system, you worry about *process descriptions that no longer reflect current practice*. The contributing guide says "run the guard before committing" but the guard was redesigned two weeks ago and the guide still describes the old version.

**Audience confusion → Scope confusion.** In a codebase, developer docs can get mixed with user docs. In a documentation-as-system, *design-time documents can get mixed with run-time documents*. A file that explains how to build guards (design-time) sits alongside a file that explains how to run them (run-time). The reader can't tell which mode they're in.

## What this means for quality checks

If you're maintaining a documentation-as-system, your quality process needs different checks than a standard "keep docs in sync with code" approach.

**Check internal consistency, not map/territory sync.** When you modify one document, ask: does any other document describe the same thing? Do they still agree? In a 20-file documentation system, any structural change (renaming a file, reorganising a directory, changing a process) creates a wave of potential inconsistencies across every file that references the changed thing.

**Check conceptual completeness, not feature coverage.** When you introduce a concept in one place, ask: does this concept get operationalised somewhere? If INTENT.md says "guards should map to the enforcement depth spectrum," is there a guard or generator that actually does this? Concepts that exist only in theory — stated but never applied — are the documentation-as-system equivalent of untested code.

**Check self-referential coherence.** A documentation-as-system often describes its own structure and processes. These self-descriptions rot faster than anything else, because every structural change makes them stale. If your README says "the project has three skills" and you just added a fourth, the README is immediately wrong — and unlike code, there's no compiler to tell you.

**Check knowledge capture, not just knowledge existence.** The most insidious entropy in a documentation-as-system is *knowledge that was generated but not captured*. A discussion produces three architectural decisions and two insights. The decisions log gets one entry. The rest lives only in the conversation transcript — write-only, never read again. The check isn't "do your docs exist?" but "are your docs *complete* relative to what you know?"

## The special case of methodology repos

This pattern is especially acute for methodology repos — systems that describe *how to do quality work*. A methodology repo that accumulates entropy is telling people to do quality work using a degraded quality process. The meta-irony is precise: the tool for fighting entropy succumbs to entropy.

The fix is the same as for any system: periodic regeneration. Take the methodology repo, pretend you've never seen it, and derive the quality checks from scratch. What would you check if you were encountering this system for the first time?

When we did this, we found that the quality checklist for our methodology repo was missing checks for the two things that mattered most: whether the methodology skills still aligned with the stated principles, and whether the documents agreed with each other. The checklist had been "passing" for weeks — not because these things were fine, but because nobody was looking.

## The broader lesson

The map/territory model is powerful, but it has a blind spot: it assumes a separation between description and reality. For the growing category of systems where the description *is* the reality — knowledge bases, policy frameworks, methodology repos, design systems, process handbooks — you need a different quality vocabulary.

The entropy is real. The decay is real. The cost of letting it compound is real. But the checks need to point inward: consistency, completeness, self-referential coherence, and knowledge capture.

When the map is the territory, the only thing that can contradict the map is itself.
