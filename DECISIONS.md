# Decisions

Record architectural choices so future you (and agents) understand why.

---

### Exportable skills vs local skills: skills/ and skills/local/

**Context**: The project has two kinds of skills — ones designed for use by external projects (the guard generators) and ones generated for this repo's own use (entropy-guard, distill-article). Domain generators were previously files inside the entry point directory, but they're independently invocable skills in their own right.
**Decision**: Exportable skills live directly under `skills/`. Local skills live under `skills/local/`. Domain generators are promoted to peer skills with their own directories. The entry point remains the recommended starting point, but each domain generator can be invoked directly.
**Impact**: Clear structural distinction between what this project exports and what it uses internally. Domain generators are independently discoverable.

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

### Two-layer generator architecture: entry point + domain generators

**Context**: The general-purpose generator tried to both assess systems and produce guards. Domain-specific generators (docs, test, code, API) proved to have fundamentally different analytical lenses — different inventories, different entropy vectors, different enforcement depth stories. The general generator couldn't go deep enough on any domain.
**Decision**: Refactor into a two-layer system. The entry point (`skills/entropy-guard-generator/SKILL.md`) assesses the system, identifies relevant domains, and routes to domain-specific generators. Domain generators produce the actual guards. The entry point coordinates outputs so guards don't overlap or leave gaps.
**Impact**: Clean separation of concerns. Each domain generator can go deep. Cross-domain coordination happens at the entry point level. New domains can be added without modifying existing generators.

---

### Guard creation skills over guard libraries

**Context**: Debated whether to invest in a large library of system-specific guards or in the meta-skill that creates them.
**Decision**: Invest primarily in the guard creation skill (and potentially domain-specific variants). Maintain only a small number of exemplary guards as reference implementations, not a browsable library.
**Impact**: The meta-skill is the product, not individual guards. Avoids a library of "near misses" that are 70% right for any given system.

---

### LEARNINGS.md stays tactical; articles capture conceptual work

**Context**: Extended discussions produce two kinds of knowledge — tactical learnings (short, specific, validated) and conceptual frameworks (longer-form arguments and analyses). Needed to decide where each lives.
**Decision**: LEARNINGS.md keeps its current format for tactical insights. Conceptual/intellectual work from conversations is captured via the distill-article skill into `articles/` as Substack-ready drafts. PHILOSOPHY.md remains for fragments and reflections that aren't structured enough for an article.
**Impact**: Three containers with clear purposes — no ambiguity about where to put what.
