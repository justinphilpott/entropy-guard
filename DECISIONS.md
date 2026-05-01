# Decisions

Record architectural choices so future you (and agents) understand why.

---

### Specialize first around docs-first planning repos, but keep entropy-assessment as the front door

**Context**: Repeated real use of `entropy-assessment` has not converged on conventional code-heavy repositories. The strongest, most consistent signal has come from markdown-first planning/design repos where the main artifacts are architecture docs, decision logs, task state, templates, and contributor/agent workflow guidance. The recent issue cluster (`#9`-`#12`) sharpened that further: these systems need explicit canonical truth mapping, current-state session packets, supersession-aware guard checks, and caution about brittle phrase-encoded automation. This is now a distinct workflow shape, not just a few extra appendix bullets.
**Decision**: Keep `skills/entropy-assessment/` as the single front door, but change its role to triage and routing rather than carrying all deep guidance itself. Add a specialized export, `skills/docs-first-planning-assessment/`, for markdown-first planning/design repos. Treat the current-state packet as an output of that specialized assessment rather than a separate skill for now. Keep `skills/guards-integrator/` as the separate adoption-time skill.
**Impact**: The repo stays easy to enter, but the deepest validated path is now explicit instead of buried inside a general skill. `entropy-assessment` can remain the obvious first stop while the docs-first planning workflow gets the space it needs to evolve without overloading the umbrella skill. Broader code/test/API support remains in scope, but is now more honestly positioned as less validated until future specializations or stronger evidence emerge.

---

### Farm broader entropic-immunity exploration into a sibling repo; keep entropy-guard practical

**Context**: The March 2026 explorations on autopoiesis, layered intent, steering, viability, and entropic immunity opened a broader research program than `entropy-guard` itself needs in order to stay useful. Letting that conceptual exploration continue inside this repo risked blurring the scope of the practical guard project and making the README / INTENT / contributor guidance less clear about what this repo is actually trying to validate next.
**Decision**: Keep `entropy-guard` focused on practical entropy protection: assessment, guard generation/refinement, integration, and iterative validation of those workflows on real projects. Farm the broader entropic-immunity exploration into a sibling repo, `entropy-immune-system`, seeded with the exploration documents and early research scaffolding. Set the next validation loop here to: assess a larger set of open source projects, generate or refine guards, run them locally while making targeted improvements, and track whether that produces more merged PRs.
**Impact**: `entropy-guard` retains a clear operational center and a concrete next step. The broader theory can evolve without forcing premature architectural or philosophical expansion into this repo. Future contributors should treat `entropy-guard` as the practical ladder and `entropy-immune-system` as the larger inquiry.

---

### Guard adoption should usually mature from external to prompted before deeper automation

**Context**: The repo's local `entropy-guard` ritual had clear standing instructions and was being used, but its main failure mode was now forgetfulness rather than disagreement about scope. For judgment-heavy guards like session-close or pre-commit rituals, jumping straight from a manual skill file to CI enforcement is usually the wrong move; the useful intermediate step is a non-blocking reminder at the real handoff point. The exportable assessment process already named Prompted enforcement in theory, but it did not yet emphasize this manual-to-prompted progression as the default next move after a guard proves valuable.
**Decision**: Treat `External -> Prompted -> deeper embedding` as the normal maturity path for judgment-heavy guards. Add a tracked non-blocking pre-commit reminder to this repo's local workflow, and strengthen the exportable assessment / integration guidance so assessed projects are encouraged to add reminder layers before they jump to heavier automation.
**Impact**: This repo now practices the adoption path it recommends. Future assessments should more consistently distinguish "the guard definition" from "the reminder surface that makes it run," which should reduce skipped-guard failures without prematurely turning judgment calls into hard gates.

---

### Entropy assessment should support guard refinement and evidence-based bootstrap design

**Context**: Applying `entropy-assessment` to real projects exposed a cluster of related misfires. The skill framed Phase 2 primarily as generating new guards, even when the right outcome was a targeted amendment to an existing guard. It also allowed bootstrap checks to be written from indirect notes without verifying the current artifact, and it did not clearly distinguish stable guard definitions from the companion artifacts that should record bootstrap completion. Cold-start projects with no established loop likewise had no named minimum-viable integration pattern.
**Decision**: Treat guard refinement as a first-class Phase 2 outcome alongside guard generation. Require bootstrap actions to be verified against the current artifact before they are written, require bootstrap completion to be tracked outside the guard file, and add an explicit no-existing-loop bootstrap integration pattern for early-stage projects. Also make internal docs-to-docs drift more explicit for markdown-first systems.
**Impact**: `skills/entropy-assessment/SKILL.md` now fits existing-guard systems better, produces more trustworthy bootstrap checks, preserves guard files as stable definitions, and offers a clearer adoption path for cold-start repos. The methodology also better matches the repo's own framing that documentation-first systems often drift internally rather than primarily against code.

---

### Add workflow/process as a first-class assessment domain

**Context**: Dogfooding `entropy-assessment` against this repo showed a repeatable gap. The skill already talked about collaborative workflow and inter-domain drift in principle, but its explicit Phase 1 domain map and Phase 2 appendices only covered documentation, code, tests, and API contracts. That made workflow-heavy repos awkward to classify and left no direct path to generate workflow/process guards when the main entropy risks lived in handoffs, rituals, or contributor instructions.
**Decision**: Extend `skills/entropy-assessment/SKILL.md` with workflow/process as a first-class domain in both assessment and guard generation. Add workflow/process signals to the Phase 1 domain map and drift analysis, and add a dedicated appendix covering inventory items, entropy vectors, checklist guidance, and existing mechanisms.
**Impact**: The assessment now matches the repo's own framing that entropy often accumulates in practice as much as in map or territory. Workflow-heavy systems can be assessed without awkward shoehorning, and the skill can recommend either a dedicated workflow guard or a combined guard when that is the lower-burden design.

---

### Keep a single local guard, but treat workflow/practice drift as first-class

**Context**: Re-running `entropy-assessment` against this repo showed that its main entropy risks no longer fit neatly into a docs-only framing. The project is a documentation-as-system repo, but it also exports a way of working: TODO discipline, agent instructions, upstream feedback capture, and a pre-commit ritual. The existing local `entropy-guard` skill mostly checked documentation consistency and knowledge capture, but did not name workflow/practice drift as a first-class thing it was guarding.
**Decision**: Keep one local `entropy-guard` skill rather than splitting into separate docs and workflow guards, because this repo still has one obvious low-burden handoff point: end of a meaningful work session / before commit. Update that guard so it explicitly checks workflow/practice alignment alongside documentation consistency.
**Impact**: The local guard stays lightweight and easy to remember, but better matches the actual entropy profile of the repo. The assessment methodology also gets a clearer real-world example of a system where workflow is part of the artifact being preserved.

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

*Partially superseded by "Specialize first around docs-first planning repos, but keep entropy-assessment as the front door" above.*

**Context**: The four domain generators (docs, code, test, API) were ~80% identical scaffolding — Steps 0–7 with the same structure, domain-adapted. The unique domain knowledge (entropy vectors, inventory items, checklist design guidance) accounted for ~20% of their content. The assessment skill's Phase 2 existed solely as a routing/coordination layer between the entry point and the generators. This meant an agent had to read 5 files to do what one file could accomplish. The insight from the two-layer decision — that domains need different analytical lenses — was correct, but the domain-specific knowledge turned out to be reference data, not separate processes.
**Decision**: Fold all domain knowledge into the entropy-assessment skill as reference appendices (one per domain). Delete the four standalone generator skills. The assessment skill now handles both assessment (Phase 1) and generation (Phase 2) with built-in domain references. Supersedes "Two-layer generator architecture" and "Exportable skills vs local skills" (for the generator skills specifically — the distinction still applies to local skills like entropy-guard).
**Impact**: One file to read instead of five. All domain knowledge preserved as structured appendices. No routing/coordination overhead. The "different analytical lenses" insight is preserved — the appendices provide domain-specific vectors, inventory items, and checklist guidance — but without duplicating the process scaffolding four times.

---

### LEARNINGS.md stays tactical; articles live elsewhere

**Context**: Extended discussions produce two kinds of knowledge — tactical learnings (short, specific, validated) and conceptual frameworks (longer-form arguments and analyses). Needed to decide where each lives.
**Decision**: LEARNINGS.md keeps its current format for tactical insights. Conceptual/intellectual work from conversations is captured as article drafts in a separate [writing](https://github.com/justinphilpott/writing) repo. PHILOSOPHY.md remains for fragments and reflections that aren't structured enough for an article.
**Impact**: Clean separation — entropy-guard stays focused on the skill and its supporting docs. Articles live in their own repo where they can be edited and published independently.
