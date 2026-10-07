# Canonical truth map: entropy-guard (snapshot 447da9a, read 2026-10-04)

This map is part of the docs-first-planning-assessment, Phase 1 Step 2. It records which document owns which truth in the target repository.

## Documents by role

**Canonical, system-wide truth**

- `INTENT.md`: purpose, the entropy model (five dimensions and inter-domain drift), what a guard should and should not be, the guard lifecycle (generator, integrator, runner, evaluator), enforcement depth, and the scope boundary with the next validation loop.
- `AGENTS.md`: how contributors work here (Working Practices, Project Constraints, Commands, Testing).
- `DECISIONS.md`: settled choices. 17 entries; 2 are marked superseded and 5 more should be (see `assessment.md`, finding 2).

**Product, the exported method.** The skill's role list has no slot for this. These skills are canonical for their own method:

- `skills/entropy-assessment/SKILL.md`: routing (Step 3).
- `skills/docs-first-planning-assessment/SKILL.md`: the deep docs-first method.
- `skills/guards-integrator/SKILL.md`: the integration method.
- `skills/session-coherence-skill-generator/SKILL.md`: the session handoff guard generator and the bootstrap mode for young repos.

**Current-state and handoff artifacts**

- `TODO.md`: active work and Next Up.
- The "Project status" section of `README.md`: a summary of the current stage.
- There is no current-state packet yet. See `current-state-packet.md`.

**Local elaborations**

- `README.md`: an overview, usage prompts and file listings. It links to `INTENT.md` for definitions.
- `skills/local/entropy-guard/SKILL.md`: this repository's own application of `INTENT.md`.
- `skills/local/entropy-guard-feedback/SKILL.md`: the mechanics of filing feedback.
- `.githooks/pre-commit`: the reminder surface for the local guard.

**Templates and instance-shaping documents**

- The scaffolds inside `guards-integrator` (the loop map, guard placement, adoption plan and brief).
- The "Generated Guard Checklist Template" inside `session-coherence-skill-generator`.
- `skills/local/entropy-guard/SKILL.md`, in its second role as "a reference example of generator output".

**Tactical knowledge**

- `LEARNINGS.md`: 15 entries. 3 are theory duplicated from `PHILOSOPHY.md`, and 2 rest on artifacts that no longer exist here.

**Historical, superseded or imported material**

- `explorations/`: 4 documents, 1,467 lines, seed material for the sibling repository `entropy-immune-system`. Not labelled as historical.
- The superseded `DECISIONS.md` entries.
- The FlowBook residue in `session-coherence-skill-generator`, which appears to have been imported from another project.
- The "autopoiesis" section of `PHILOSOPHY.md`, as a historical source. `PHILOSOPHY.md` is still a declared free space.

## Concept ownership

| Concept | Canonical home | Other mentions (role) | Problem |
|---|---|---|---|
| Purpose and scope | `INTENT.md` | `README.md` intro (summary), `AGENTS.md` line 3 (summary) | None. |
| Entropy dimensions, inter-domain drift, enforcement depth | `INTENT.md` | `README.md` (link), `guards-integrator` Step 3 and `docs-first` Step 8 (local application of depth) | None. |
| Guard lifecycle: which skill carries which role | `INTENT.md` "The guard lifecycle" | `README.md` skill tables | `session-coherence-skill-generator` is missing from the lifecycle section. |
| Routing: which skill serves which repository shape | `entropy-assessment` Step 3 | `README.md` "How to use this repo" | `session-coherence-skill-generator` is not routed. `guards-integrator` lines 20 and 227 still treat entropy-assessment as the generator. |
| **Generating a session-end guard** | **Two homes**: `docs-first-planning-assessment` Phase 2 and `session-coherence-skill-generator` | `README.md` table rows 89 and 91 describe both | Parallel truth (finding 1). |
| Integrating a guard into the loop | `guards-integrator` | `docs-first` Step 8 "immediate integration advice" (local) | None. |
| Repository working practice | `AGENTS.md` | `README.md` Contributing (summary), local guard check 4, the hook text | None. |
| Repository file listing | None single. There are three listings: `AGENTS.md` Quick Links (partial: one skill), `AGENTS.md` Key Files, and `README.md` "What's here" | Local guard check 6 keeps them in step | These three are kept in step by design. `explorations/` appears in none of them. |
| Settled decisions | `DECISIONS.md` | The rationale lines in the skills | Entries are stale and undated (finding 2). |
| A decided behaviour required of a skill | `DECISIONS.md` and the skill itself | `LEARNINGS.md` | Bootstrap verification is decided but missing from the skill (finding 2). |
| Current stage and next phase | `TODO.md` (active work) | `INTENT.md` lines 122-135, `README.md` line 125, `DECISIONS.md` line 26 | `DECISIONS.md` line 26 carries an older success measure ("more merged PRs"). |
| Validation results | **None** | (none) | No home (finding 3). |
| Theory: autopoiesis, just-in-time guards, layers, entropic immunity | The sibling repository, by decision (`DECISIONS.md` line 23) | `PHILOSOPHY.md` lines 41-126, `explorations/` (4 documents), `LEARNINGS.md` lines 117-143 | Four locations, with no statement of which is canonical (finding 4). |
| Upstream feedback process | `skills/local/entropy-guard-feedback/` | Feedback checks in 3 exportable skills; `AGENTS.md` "entropy-guard Feedback" | `session-coherence-skill-generator` has no feedback check. |
