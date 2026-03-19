# Decisions

Record architectural choices so future you (and agents) understand why.

---

### Upstream feedback should be embedded in assessment and integration flows

**Context**: The repo had a local `entropy-guard-feedback` helper for creating upstream issues, but agents only found it if they separately noticed the helper existed. The main exportable workflows (`entropy-assessment` and `guards-integrator`) did not explicitly ask whether the skills themselves had misfired, so the improvement loop depended on extra initiative rather than being part of normal use.
**Decision**: Keep the dedicated local feedback helper, but move the feedback prompt into the main exportable skills. `skills/entropy-assessment/` and `skills/guards-integrator/` should both end with an explicit upstream feedback check, and use the local helper when available to turn that note into a GitHub issue on entropy-guard.
**Impact**: The feedback path stays lightweight, but becomes part of the default workflow. Agents using the exported skills now have a built-in moment to surface reusable issues and suggestions, which tightens the loop between real-world use and methodology improvement.

---

### Exportable skills vs local skills: skills/ and skills/local/

**Context**: The project has two kinds of skills — ones designed for use by external projects (the assessment/generator skill) and ones for this repo's own use (e.g., entropy-guard).
**Decision**: Exportable skills live directly under `skills/`. Local skills live under `skills/local/`.
**Impact**: Clear structural distinction between what this project exports and what it uses internally.

---

### Skill format: agentskills.io spec with SKILL.md + frontmatter

**Context**: Skills were using a non-standard format (folder + README.md, no frontmatter). The [agentskills.io specification](https://agentskills.io/specification) defines a standard: entry point is `SKILL.md` with YAML frontmatter (`name` + `description` required), `name` must match the parent directory.
**Decision**: Adopt the agentskills.io spec. All skills use `SKILL.md` as the entry point with required frontmatter. Supersedes the earlier folder + README.md convention.
**Impact**: Standard-compliant skills. Agents can load skill metadata (name, description) at startup without reading the full file.

---

### Guards need closed-loop integration, not just checklist files

**Context**: Dogfooding revealed that a guard file sitting in a skills directory provides no value unless something ensures it gets run. A guard without integration into the workflow is dead weight.
**Decision**: Generators must produce guards that include integration instructions — how to hook into the workflow (pre-commit, CI, PR template), not just what to check. The guard output should specify its own enforcement mechanism.
**Impact**: Guards become actionable artifacts, not just reference documents. This also opens the door to a "guard runner" concept — a wrapper that discovers and executes all guards for a system.

---

### Guard generation should produce immediate integration advice, not just guard files

**Context**: The assessment skill already required an integration plan in Step 8, but the repo did not yet provide a dedicated way to examine a target system's actual agent / commit / PR / CI loop and translate generated guards into an adoption plan. That left a gap between guard design and guard use.
**Decision**: Add a separate exportable skill, `skills/guards-integrator/`, focused on mapping generated guards into a system's real iteration loop. Also strengthen `skills/entropy-assessment/` so guard generation always includes immediate adoption guidance and points to the integrator skill for deeper operational planning.
**Impact**: Running the assessment now yields not only candidate guards but also system-specific advice for how to make them valuable right away. The integrator skill clarifies that adoption is a first-class part of guard design, while still leaving room for a future guard runner implementation.

---

### Two-layer generator architecture: entry point + domain generators

*Superseded by "Consolidate domain generators into single skill" below.*

**Context**: The general-purpose generator tried to both assess systems and produce guards. Domain-specific generators (docs, test, code, API) proved to have fundamentally different analytical lenses — different inventories, different entropy vectors, different enforcement depth stories. The general generator couldn't go deep enough on any domain.
**Decision**: Refactor into a two-layer system. The entry point (`skills/entropy-assessment/SKILL.md`) assesses the system, identifies relevant domains, and routes to domain-specific generators. Domain generators produce the actual guards. The entry point coordinates outputs so guards don't overlap or leave gaps.
**Impact**: Clean separation of concerns. Each domain generator can go deep. Cross-domain coordination happens at the entry point level. New domains can be added without modifying existing generators.

---

### Rename entry point from entropy-guard-generator to entropy-assessment

**Context**: The entry point skill's primary value is assessment (Steps 1–4: establish intent, survey landscape, identify drift risks, recommend generators). Guard generation (Steps 5–8) is optional delegation to domain generators. But the name "generator" framed assessment as a means to an end rather than a first-class deliverable. Agents arriving cold didn't recognize this skill as the obvious start point for reviewing a system.
**Decision**: Rename to `entropy-assessment`. Restructure the skill into two explicit phases: Phase 1 (Assessment, Steps 1–4) produces a standalone entropy profile; Phase 2 (Guard Generation, Steps 5–8) is optional. Add an assessment output format between the phases.
**Impact**: Assessment becomes the obvious entry point for any agent evaluating a system. The skill is useful even without generating guards.

---

### Guard creation skills over guard libraries

**Context**: Debated whether to invest in a large library of system-specific guards or in the meta-skill that creates them.
**Decision**: Invest primarily in the guard creation skill (and potentially domain-specific variants). Maintain only a small number of exemplary guards as reference implementations, not a browsable library.
**Impact**: The meta-skill is the product, not individual guards. Avoids a library of "near misses" that are 70% right for any given system.

---

### Consolidate domain generators into single skill with domain appendices

**Context**: The four domain generators (docs, code, test, API) were ~80% identical scaffolding — Steps 0–7 with the same structure, domain-adapted. The unique domain knowledge (entropy vectors, inventory items, checklist design guidance) accounted for ~20% of their content. The assessment skill's Phase 2 existed solely as a routing/coordination layer between the entry point and the generators. This meant an agent had to read 5 files to do what one file could accomplish. The insight from the two-layer decision — that domains need different analytical lenses — was correct, but the domain-specific knowledge turned out to be reference data, not separate processes.
**Decision**: Fold all domain knowledge into the entropy-assessment skill as reference appendices (one per domain). Delete the four standalone generator skills. The assessment skill now handles both assessment (Phase 1) and generation (Phase 2) with built-in domain references. Supersedes "Two-layer generator architecture" and "Exportable skills vs local skills" (for the generator skills specifically — the distinction still applies to local skills like entropy-guard).
**Impact**: One file to read instead of five. All domain knowledge preserved as structured appendices. No routing/coordination overhead. The "different analytical lenses" insight is preserved — the appendices provide domain-specific vectors, inventory items, and checklist guidance — but without duplicating the process scaffolding four times.

---

### LEARNINGS.md stays tactical; articles live elsewhere

**Context**: Extended discussions produce two kinds of knowledge — tactical learnings (short, specific, validated) and conceptual frameworks (longer-form arguments and analyses). Needed to decide where each lives.
**Decision**: LEARNINGS.md keeps its current format for tactical insights. Conceptual/intellectual work from conversations is captured as article drafts in a separate [writing](https://github.com/justinphilpott/writing) repo. PHILOSOPHY.md remains for fragments and reflections that aren't structured enough for an article.
**Impact**: Clean separation — entropy-guard stays focused on the skill and its supporting docs. Articles live in their own repo where they can be edited and published independently.
