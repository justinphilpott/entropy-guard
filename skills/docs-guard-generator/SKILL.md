---
name: docs-guard-generator
description: Analyze a documentation system and design an entropy guard for it. Identifies map/territory drift, coverage gaps, link rot, stale examples, and terminology drift. Use directly when you know the target is documentation, or via the entropy-guard-generator entry point.
---

# Skill: Documentation Guard Generator

Analyze a documentation system and design an entropy guard appropriate for it. This is a domain-specific variant of the [general entropy guard generator](../entropy-guard-generator/SKILL.md), tuned for the ways documentation uniquely decays.

> **Before you begin**: Read [INTENT.md](../../INTENT.md). Pay particular attention to the section on **inter-domain drift** — documentation entropy is fundamentally about the map diverging from the territory.

> **Status**: Living scaffold. Refine based on real use. Note what works and what doesn't in LEARNINGS.md.

---

## When to Run

- When a system has documentation that undergoes repeated iteration and has no doc-specific entropy guard
- When documentation exists but feels unreliable — people routinely distrust or ignore the docs
- When asked to evaluate whether an existing system's documentation practices are sustainable

## When NOT to Run

- As a substitute for actually running an existing doc guard — if one exists, run it
- For systems with no documentation at all — the answer is "write some," not "guard what doesn't exist"
- For throwaway or personal notes that won't be read by others

---

## The Process

Work through each step. Steps 0–5 are analysis; Steps 6–7 produce the guard.

### Step 0: Documentation inventory

Before analyzing entropy, discover what you're working with. This prevents generating a guard that references artifacts that don't exist.

**Catalogue what's present:**

- [ ] **Intent/purpose documentation** — does the system have an INTENT.md, a README with a clear "why" section, architecture docs, or design docs? If not, this is itself the highest-priority finding.
- [ ] **Doc types** — what kinds of documentation exist? (API reference, user guides, developer docs, tutorials, decision logs, changelogs, ADRs, runbooks, inline code comments, README files)
- [ ] **Location pattern** — are docs co-located with code (e.g., docs/ directory, inline, docstrings)? Separate site (wiki, Confluence, Notion)? Both? Scattered?
- [ ] **Build/generation pipeline** — are any docs auto-generated? (API docs from code, typedoc, Sphinx, Storybook, etc.)
- [ ] **Source of truth** — when docs and code disagree, which one is correct? Is this explicitly stated anywhere, or just culturally understood?

**Classify gaps:**

For each expected artifact that's missing, determine:

- **Missing and needed** — the generated guard should include a bootstrap action (e.g., "write a 2-sentence intent statement before the first guard run")
- **Missing and fine** — not every system needs every doc type. A small CLI tool doesn't need a tutorial site.
- **Present but possibly stale** — exists but shows signs of age (dates, references to removed features, etc.)

If there is no intent documentation at all, **flag this prominently**. A guard cannot check alignment with intent that was never articulated. Step 1 will need to shift from "read the intent" to "help the maintainer articulate and capture it."

### Step 1: Understand the documentation's purpose

This is not "what does the system do?" — it's "what role does the documentation play?"

- Who reads these docs? (New contributors, end users, ops teams, future AI agents, the author themselves in 6 months?)
- What decisions do the docs inform? (How to use the system? How to change it? Whether to adopt it?)
- What is the cost of a reader trusting stale docs? (Wasted time? Broken deployment? Security vulnerability? Incorrect mental model that compounds?)
- What does "good documentation" look like for *this specific system*? (Comprehensive API reference? Clear getting-started path? Accurate architecture overview?)

Write a 2–4 sentence documentation intent summary. This is distinct from the system's own intent — it's about what the docs specifically need to achieve.

### Step 2: Map the documentation iteration pattern

Documentation often changes on a different cadence than code. Map both:

- **When do docs change?** (Same PR as code? Separate doc sprints? Retroactively when someone complains? Never?)
- **Who changes docs?** (Same people who write code? A docs team? Only when onboarding forces it?)
- **What triggers a doc update?** (New feature? Bug report citing bad docs? Scheduled review? Nothing — they just accumulate?)
- **What is the doc handoff point?** (PR merge? Release? Sprint boundary? There isn't one?)

If there is no natural handoff point for documentation, that itself is a finding — the guard needs to create one.

Note the **lag pattern**: how much time typically passes between a code change and the corresponding doc update? This is the window during which map/territory drift accumulates.

### Step 3: Identify documentation entropy vectors

For this specific documentation system, what degrades? Consider:

- **Map/territory drift**: docs describe the system as it was, not as it is. The most damaging doc entropy vector — readers build incorrect mental models and make wrong decisions.
- **Coverage gaps**: features, APIs, configuration options, or workflows that have no documentation at all. Often invisible because nobody notices what's not there.
- **Audience confusion**: docs written for the wrong reader. Developer internals mixed with user-facing guides. Expert-level docs as the only onboarding path.
- **Stale examples**: code samples, command examples, or screenshots that no longer work or reflect current behavior. Particularly dangerous because readers will copy-paste them.
- **Link rot**: internal cross-references that point to moved/deleted content, external links that 404.
- **Structural decay**: docs that grew organically without reorganization — the table of contents no longer reflects the actual structure, sections are in the wrong place, related content is scattered.
- **Terminology drift**: the docs use names or terms that the codebase has since moved away from.
- **Zombie content**: sections that are no longer relevant but were never removed. They dilute trust in the rest of the docs.

Rank the top 3–5 vectors by destructive potential for *this specific documentation system*. The ranking should reflect the product of decay rate and recovery cost (per INTENT.md).

### Step 4: Assess existing documentation guards

- Does the system already have documentation quality mechanisms? Consider:
  - Doc linters or style checkers
  - Link checkers (automated or manual)
  - Auto-generated docs from code (API docs, type docs)
  - PR templates that require doc updates
  - Doc review as part of code review
  - Scheduled doc audits
  - "Docs or it didn't ship" policies

- For each existing mechanism, map it to the **enforcement depth spectrum** (from INTENT.md):
  - External (relies on discipline)
  - Prompted (removes need to remember)
  - Semi-embedded (catches mechanically)
  - Fully embedded (structurally impossible to violate)

- What do existing mechanisms cover, and what do they miss?
- Are any existing mechanisms themselves stale or ignored?

Auto-generated docs deserve special attention: they solve some entropy vectors (API docs stay in sync with code) but can create others (generated content that's technically accurate but unhelpful, creating a false sense of "we have docs").

### Step 5: Consult INTENT.md

Check your analysis against [INTENT.md](../../INTENT.md):

- Does the proposed guard preserve **legibility** — can a new reader orient quickly?
- Does it preserve **honest state** — do the docs accurately represent the system's current condition?
- Does it address **inter-domain drift** — the map/territory problem between docs and implementation?
- Is it **low-burden** (2–10 minutes at the handoff point)?
- Is it **delta-scoped** — checking what changed this iteration, not auditing all docs?

Adjust if not.

### Step 6: Design the guard

Write a draft guard skill file. It should include:

- **When to Run** — tied to the documentation handoff point identified in Step 2
- **When NOT to Run** — scope boundaries
- **Bootstrap checks** (if Step 0 identified critical gaps) — one-time actions to establish baselines before the recurring guard makes sense
- **Checklist** — one item per high-value entropy vector from Step 3. Each item should be:
  - A yes/no question scoped to *what changed in this iteration*
  - A clear action if yes
  - Where possible, a note on whether this check could eventually be mechanized (moved deeper on the enforcement spectrum)
- **Inter-domain drift check** — at least one item should explicitly verify that documentation changes are consistent with implementation changes (or vice versa)
- **Output** — what the contributor records after running
- **Rationale** — why each check exists, so future maintainers can adapt
- **Integration** — how this guard gets run (see Step 7)
- **Versioning metadata** — when generated, by which generator, for what system state (see Step 7)

Note: if the documentation system *is* the product (not documentation *about* a separate system), adapt the map/territory framing. Internal consistency between docs replaces map/territory drift. Coverage of concepts replaces coverage of features. The entropy vectors are the same in kind but point inward.

### Step 7: Close the loop

A guard that isn't integrated into the workflow won't get run. A guard that isn't versioned won't get updated.

**Integration instructions** — the generated guard must specify:
- **Trigger**: when does this guard run? (Pre-commit, PR review, doc publish, CI step) Tie this to the handoff point from Step 2.
- **Discovery**: how does a contributor find out this guard exists? (Contributor guide, guard manifest, pre-commit hook output)
- **Enforcement depth**: is this a reminder (external), a prompted check (PR template), or automated (CI)?

**Versioning metadata** — include in the generated guard:
- **Generated**: date and generator version
- **System snapshot**: brief description of the documentation system's state when the guard was designed (number of doc types, key docs present, known gaps). This allows future re-evaluation: has the system outgrown this guard?
- **Last evaluated**: date (initially same as generated; updated when the guard is re-assessed)

**Output summary** — note in your output:
- What the top entropy vectors were and why
- Whether any existing mechanisms already cover some of them
- What the Step 0 inventory revealed — especially any critical gaps that the guard's bootstrap checks address
- Any uncertainties or areas where the guard should be refined after real use
- Recommendations for moving any checks deeper on the enforcement spectrum (e.g., "link checking should be a CI step, not a manual check")
- **Integration plan**: how the guard will be triggered and discovered
- **Versioning baseline**: the system snapshot for future comparison

---

## What This Is Not

- A replacement for actually running a documentation guard — analysis is not practice
- A style guide or writing guide — this guards coherence and accuracy, not prose quality
- A full documentation audit tool — the guards this produces are delta-scoped, not comprehensive
- A documentation generation tool — it designs the guard, not the docs themselves
