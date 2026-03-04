---
name: code-guard-generator
description: Analyze a codebase and design an entropy guard for it. Identifies pattern proliferation, abstraction decay, responsibility drift, and naming drift. Maps each entropy vector to the appropriate enforcement depth. Use directly when you know the target is code, or via the entropy-assessment entry point.
metadata:
  version: "0.1.0"
---

# Skill: Code Guard Generator

Analyze a codebase and design an entropy guard appropriate for it. This is a domain-specific variant of the [entropy assessment](../entropy-assessment/SKILL.md) skill, tuned for the ways codebases uniquely decay.

> **Before you begin**: Read [INTENT.md](../../INTENT.md). Code entropy is where the enforcement depth spectrum matters most — much of what degrades in code *can* be mechanically enforced, and the generator should be explicit about what should be a skill-file check vs a linter rule vs a type constraint.

> **Status**: Living scaffold. Refine based on real use. Note what works and what doesn't in LEARNINGS.md.

---

## When to Run

- When a codebase undergoes repeated iteration and has no code-specific entropy guard
- When a codebase has extensive tooling (linters, types, CI) but still feels like it's accumulating incoherence — the tooling is catching syntax-level problems but missing design-level drift
- When asked to evaluate whether an existing codebase's quality mechanisms are adequate

## When NOT to Run

- As a substitute for actually running an existing code guard — if one exists, run it
- For throwaway scripts, prototypes, or one-off experiments that won't be maintained
- When the codebase needs a linter, not a guard — if the problems are formatting, syntax, or style, the answer is tooling, not a skill file

---

## The Process

Work through each step. Steps 0–5 are analysis; Steps 6–7 produce the guard.

### Step 0: Codebase inventory

Before analyzing entropy, discover what governing structures already exist around the code. The question isn't "does code exist" — it's "what keeps this code coherent?"

**Catalogue what's present:**

- [ ] **Intent/architecture documentation** — does the codebase have an INTENT.md, architecture doc, or design doc that explains *why* the code is structured the way it is? If not, this is the highest-priority finding — the codebase can't explain its own design rationale.
- [ ] **Stated conventions** — is there a contributing guide, style guide, or conventions doc? Are conventions documented or only culturally transmitted?
- [ ] **Static analysis** — what linters, formatters, and type checkers are in place? (ESLint, Prettier, mypy, clippy, golangci-lint, etc.) What rules are enabled? Are there custom rules?
- [ ] **Type system usage** — how much of the codebase is typed? Is the type system used structurally (making invalid states unrepresentable) or cosmetically (annotating obvious types)?
- [ ] **CI/CD pipeline** — what runs automatically? (Lint, test, build, deploy?) What gates exist before merge?
- [ ] **Dependency management** — how are dependencies tracked? Is there a lockfile? Are there automated update tools (Dependabot, Renovate)?
- [ ] **Code organization** — what's the directory structure? Is there a clear module/package boundary? Is there a pattern to where new code goes?

**Classify gaps:**

For each expected element that's missing, determine:

- **Missing and needed** — the generated guard should include a bootstrap action (e.g., "document the top 3 architectural conventions before the first guard run")
- **Missing and fine** — a small project may not need formal architecture docs or custom linter rules
- **Present but stale or ignored** — a linter config that hasn't been updated in years, a contributing guide that nobody follows, CI checks that are routinely overridden

If there is no architecture documentation at all, **flag this prominently**. Without articulated design rationale, a guard can check mechanical consistency but not intent alignment. Step 1 will need to shift from "read the architecture" to "help the maintainer articulate the key design decisions and why."

### Step 1: Understand the codebase's design intent

This is not "what does the code do?" — it's "what design philosophy governs how it's built?"

- What are the core architectural choices? (Monolith vs services, framework choice, data flow patterns, state management approach)
- Why were these choices made? Are the reasons still valid?
- What does "good code" look like in *this specific codebase*? (This varies enormously — a high-performance system has different norms than a CRUD app)
- What would it look like if this codebase had drifted badly? What would confuse a new contributor most?
- Is there a dominant contributor whose style *is* the convention? What happens when they're unavailable?

Write a 2–4 sentence design intent summary. If you can't articulate the design philosophy, that itself is a finding — the codebase may have accrued multiple conflicting philosophies.

### Step 2: Map the code iteration pattern

- **How does code change?** (Feature branches + PRs? Trunk-based? Direct commits? AI agent sessions?)
- **Who changes code?** (Solo developer, small team, large team, rotating contributors, AI agents, open source contributors?)
- **What is the review process?** (Formal code review? Pair programming? Self-merge? No review?)
- **How often does it change?** (Multiple times daily? Weekly? Sporadically?)
- **What is the handoff point?** (PR merge? Deploy? Sprint boundary?)

Pay attention to the **contributor diversity pattern**. A codebase with one contributor has different entropy risks than one with many. Solo projects drift in style slowly but can drift in design intent without anyone noticing. Multi-contributor projects drift in style fast (pattern proliferation) but have more opportunities to catch design drift (if review is functioning).

### Step 3: Identify code entropy vectors

For this specific codebase, what degrades? Consider:

- **Pattern proliferation**: multiple approaches to the same class of problem coexist. Error handling done three ways. Data fetching done two ways. Each locally correct, globally incoherent. This is the most common code entropy vector and the hardest to catch mechanically because each instance passes lint and type checks individually.

- **Abstraction decay**: an abstraction was created for a good reason, the underlying need shifted, but the abstraction persists. The name says one thing, the implementation does another. Newcomers build on a mental model that's wrong. Worse: "wrapper" abstractions that add no value but add indirection.

- **Responsibility drift**: modules that started with a clear purpose accumulate unrelated responsibilities. The file is 800 lines and handles three concerns. No single commit was wrong, but the aggregate is. Often visible as "this file is the junk drawer."

- **Dependency rot**: not just outdated versions (that's mechanical), but dependencies the project has outgrown, dependencies that overlap, dependencies whose API surface the project uses 2% of, or dependencies that were added for one use and are now load-bearing in unexpected ways.

- **Dead code accumulation**: commented-out code, unreachable branches, unused functions, feature flags that are always on/off. Dead code misleads readers about what's important and what's active.

- **Naming drift**: variables, functions, classes, and files whose names no longer describe what they do. Often caused by scope expansion without rename — `handleClick` now handles clicks, keyboard events, and touch events.

- **Convention erosion**: the codebase had a convention, it wasn't enforced mechanically, and it's been gradually violated until the convention is the minority pattern. The "right way" and the "common way" have diverged.

- **Knowledge silos**: parts of the code that only one person understands, not because they're complex, but because the design rationale was never externalized. The code works, but nobody can confidently modify it.

Rank the top 3–5 vectors by destructive potential for *this specific codebase*. Pattern proliferation and abstraction decay are almost always in the top 3 — if they're not, explain why.

### Step 4: Assess existing code quality mechanisms

- Does the codebase already have mechanisms for maintaining code coherence? Consider:
  - Linting (what rules? custom rules? auto-fix?)
  - Type checking (strict mode? coverage?)
  - Code review process (who reviews? what do they check? is there a checklist?)
  - Architectural decision records (ADRs)
  - Module boundaries or dependency rules (no-restricted-imports, dependency-cruiser, etc.)
  - Code ownership (CODEOWNERS file, domain experts)
  - Refactoring cadence (is there dedicated time, or does it only happen reactively?)

- For each existing mechanism, map it to the **enforcement depth spectrum** (from INTENT.md):
  - External (relies on discipline) — "reviewer checks for pattern consistency"
  - Prompted (removes need to remember) — PR template asks "does this follow existing patterns?"
  - Semi-embedded (catches mechanically) — linter rule, import restriction, CI check
  - Fully embedded (structurally impossible to violate) — type system constraint, module boundary, architectural invariant

- **Critical assessment**: where is the codebase relying on discipline for something that could be mechanically enforced? These are the highest-value recommendations. Conversely, where is it trying to mechanically enforce something that requires judgment? Those create false-positive fatigue.

### Step 5: Consult INTENT.md

Check your analysis against [INTENT.md](../../INTENT.md):

- Does the proposed guard preserve **continuity of intent** — does the code continue to reflect its original design philosophy as it evolves?
- Does it preserve **internal consistency** — do patterns, conventions, and abstractions agree with each other?
- Does it preserve **accumulated knowledge** — are design decisions recorded so they're not re-litigated?
- Does it preserve **legibility** — can a new contributor orient quickly and make confident changes?
- Is it **low-burden** (2–10 minutes at the handoff point)?
- Is it **delta-scoped** — checking what changed this iteration, not auditing the whole codebase?

Adjust if not.

### Step 6: Design the guard

Write a draft guard skill file. It should include:

- **When to Run** — tied to the code handoff point identified in Step 2
- **When NOT to Run** — scope boundaries
- **Bootstrap checks** (if Step 0 identified critical gaps) — one-time actions to establish baselines (e.g., document the top architectural conventions, enable strict type checking, add a linter rule for the most common anti-pattern)
- **Checklist** — organized into two sections:

  **Judgment-requiring checks** (keep as skill-file items):
  - Pattern consistency: does the new code follow existing patterns for this class of problem, or introduce a new approach? If new, is it intentional and documented?
  - Abstraction fitness: do the abstractions touched in this change still accurately represent what they wrap? Has scope grown beyond the name?
  - Responsibility coherence: does any file or module now handle responsibilities that don't belong together?
  - Design intent alignment: does this change serve the codebase's stated architectural goals?

  **Mechanically-assistable checks** (with enforcement depth recommendations):
  - Dead code: can a static analysis tool detect the specific type of dead code this codebase accumulates?
  - Naming consistency: can a linter or naming convention rule catch drift?
  - Dependency hygiene: can automated tools flag unused or overlapping dependencies?
  - Convention adherence: for each convention that's being checked by discipline, recommend a mechanical enforcement and specify the tool

- **Output** — what the contributor records after running
- **Rationale** — why each check exists and what entropy vector it guards against
- **Integration** — how this guard gets run (see Step 7)
- **Versioning metadata** — when generated, by which generator, for what system state (see Step 7)

### Step 7: Close the loop

A guard that isn't integrated into the workflow won't get run. A guard that isn't versioned won't get updated.

**Integration instructions** — the generated guard must specify:
- **Trigger**: when does this guard run? (Pre-commit hook, PR review step, CI check) Tie this to the handoff point from Step 2. Code guards often have the richest integration options — pre-commit hooks for fast checks, CI for heavier analysis.
- **Discovery**: how does a contributor find out this guard exists? (Contributor guide, guard manifest, pre-commit hook output, AGENTS.md)
- **Enforcement depth**: for mechanically-assistable checks, specify whether they should be linter rules (immediate feedback), CI checks (blocks merge), or advisory (reports only).

**Versioning metadata** — include in the generated guard:
- **Generated**: date and generator version
- **System snapshot**: brief description of the codebase's state when the guard was designed (size, key architectural patterns, tooling in place, known gaps). This allows future re-evaluation: has the codebase outgrown this guard?
- **Last evaluated**: date (initially same as generated; updated when the guard is re-assessed)

**Output summary** — note in your output:
- What the top entropy vectors were and why
- Whether any existing mechanisms already cover some of them
- What the Step 0 inventory revealed — especially any tooling gaps or stale mechanisms
- **Enforcement depth recommendations** — which discipline-based checks should be pushed to mechanical enforcement, with specific tool suggestions
- The split between judgment-requiring and mechanically-assistable checks
- **Integration plan**: how the guard will be triggered and discovered
- **Versioning baseline**: the system snapshot for future comparison
- Any uncertainties or areas where the guard should be refined after real use

---

## What This Is Not

- A replacement for actually running a code guard — analysis is not practice
- A linter configuration tool — if the problem is mechanical, the answer is a linter rule, not a guard
- A code review checklist — though the generated guard may inform code review, it's designed for the contributor, not the reviewer
- A refactoring plan — it identifies entropy vectors, not specific refactoring tasks
- An architecture prescription — it guards coherence with the *existing* design intent, not the "ideal" architecture
