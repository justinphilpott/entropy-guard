# Canonical Truth Map: agentic-architecture

Produced 2026-10-04 by `docs-first-planning-assessment` Phase 1 Step 2. Read from the snapshot only; successor repos (`../personal-agent`, `../../scope`) were not read.

## Document roles

Each main document is placed in one of the skill's five roles.

- **Canonical system-wide truth**
  - `README.md` / `AGENTS.md` banners: repo status (reference-only). This is the only home, and it is undated.
  - `NORTH_STAR.md`: vision and design values
  - `MODEL.md`: system model, five-layer stack, two governance levels, primitives
  - `DECISIONS.md`: dated decisions (78 entries) and the architectural open-question registry
  - `architecture/INDEX.md` → `architecture/snapshots/2026-07-16-orchestration/ARCH.md`: orchestration anatomy (v1)
  - `architecture/LANGUAGE.md`, `architecture/SCHEMA.md`: snapshot vocabulary and shape
  - `components/temporal-coordinator/SPEC.md`: temporal coordinator V0 contract (claims authority over a sibling-repo implementation)
  - `MANIFEST.md`: tools in use
- **Current-state / handoff artifacts** (all should now be historical)
  - `ROADMAP.md`, `components.yaml` (status values), `components/scope/TODO.md`, `components/orchestrator/TODO.md`, `components/scope/PLAN.md`, `components/orchestrator/PLAN.md`, `architecture/PICKUP.md` (self-demoted), `runs/README.md`, the "Pickup"/"Next" sections of `runs/*/RUN.md`
- **Local elaborations**
  - `components/scope/MODEL.md`, `components/scope/DECISIONS.md`, `components/scope/LEARNINGS.md`, `components/agent/MODEL.md`, `components/agent/DECISIONS.md`, `components/orchestrator/MODEL.md`, `components/orchestrator/DECISIONS.md`, `components/temporal-coordinator/PLAN.md`, `RUNTIME.md` (runtime view of layers 3-5), `SCHEDULING.md` (V0 boundary summary), `SCOPES_PLANNED.md` (per-scope inventory)
- **Templates / instance-shaping docs**
  - `components/scope/template/`, `components/agent/template/`, `components/orchestrator/scope/` (root scope draft), `roles/professional-presence-profile-editor/` (reference role), `components/scope/skills/scope-design.md`, `components/agent/skills/role-design.md`, `skills/session-kickoff.md`, `skills/entropy-guard.md`
- **Historical / superseded / imported**
  - `archive/scheduling-cronicle-investigation.md`, `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`, `architecture/PICKUP.md`, `ORCHESTRATION.md` (redirect stub), 8 superseded `DECISIONS.md` entries, `runs/00{1,2,3}-*/` (experiment records), `AUTH_OPTIONS_ANALYSIS.md` and `PI_AGENT_OVERVIEW.md` (evaluation notes)

## Concept ownership

For each concept: its one canonical home, where else it appears, and whether those appearances are links (fine) or parallel explanations (drift).

| Concept | Canonical home | Other appearances | Verdict |
|---|---|---|---|
| Repo status (reference-only, successors) | None. Two undated banners (`README.md` lines 3-5, `AGENTS.md` lines 3-6) | Contradicted by `README.md` lines 7-9, `AGENTS.md` line 8, `MODEL.md` line 31, `ROADMAP.md`, `components.yaml` | **No canonical home; actively contradicted.** Needs a dated `DECISIONS.md` entry. |
| Open questions (architectural) | `DECISIONS.md` § Open Questions (per `AGENTS.md` line 28 and the 2026-04-05 decision) | Orchestration v1 "Under Review" (declared "source of truth for the domain" by `architecture/SCHEMA.md`), `PICKUP.md` "Questions To Pin", `components/orchestrator/MODEL.md` "Remaining open questions", "Open Questions Surfaced" in both component skills, `AUTH_OPTIONS_ANALYSIS.md`, each `WORKFLOW.md` | **Two declared canonical homes plus 5 parallel lists.** For a frozen repo, freeze both declared homes and say so in B1. |
| Orchestration / scope-manager anatomy | Orchestration v1 snapshot via `architecture/INDEX.md` (2026-07-16 decision) | `RUNTIME.md` § Scope manager restates it in the superseded "unified gateway" form; `MODEL.md` and `components.yaml` summarise it correctly with links | **Parallel, stale explanation in `RUNTIME.md`.** |
| Temporal coordinator V0 | `components/temporal-coordinator/SPEC.md` | `SCHEDULING.md`, `RUNTIME.md`, `MODEL.md`, `components.yaml`, `DECISIONS.md` 2026-07-26: consistent summaries | Consistent inside this repo. **Cross-repo owner unknown**: the implementation repo has its own `spec/`. |
| Scope `scope.yaml` v2 shape | `components/scope/DECISIONS.md` 2026-07-10 + `components/scope/template/scope.yaml` | `DECISIONS.md` 2026-07-10 (root restates it in full), `components/scope/MODEL.md`, `components/scope/PLAN.md` | **Duplicated across root and component decision logs.** The template also carries an undocumented `display_name` field. |
| Manifest field set | `DECISIONS.md` 2026-04-07 "Root scope manifest entries reuse the scope resource shape" | `AGENTS.md`, `MODEL.md`, `components/orchestrator/MODEL.md`, `components/scope/PLAN.md`, `skills/entropy-guard.md` repeat the list `id, name, purpose, status, remotes/checkouts, steward` | Repeated but consistent. `components/orchestrator/scope/scope.yaml` adds `display_name`, which the decision says not to add without evidence. |
| Root scope name `root-general` | `DECISIONS.md` 2026-04-23 | `components/orchestrator/DECISIONS.md` 2026-04-23 restates the decision and its rationale in full | **Local-vs-global inversion.** The component copy should be a link. |
| Inherited constraints per component | Root `DECISIONS.md` | "Current inherited constraints" lists in `components/{scope,agent,orchestrator}/DECISIONS.md` | **Stale.** The agent and orchestrator lists still say comms/runtime are open or TBD (resolved 2026-04-27). |
| Live work queue | None single. `ROADMAP.md` claims system level | 2 component TODOs, 2 component PLANs, `PICKUP.md`, run pickup sections | **7 queues.** Moot once demoted (B2). |
| Learnings | None at root | `components/scope/LEARNINGS.md`, `runs/README.md` "What We Learned", run "Findings" sections | **Scattered; unharvested.** `runs/README.md` should become the harvest ledger (B5). |
| Auth / model access for runs | `AUTH_OPTIONS_ANALYSIS.md` "Current Working Decision" (a decision outside `DECISIONS.md`) | Runs 001-003 actually used ChatGPT-subscription Codex login | **Doc says one thing, practice did another.** |
| Template contents (scope) | `components/scope/template/` | Run 002 record says the template has no `CLAUDE.md` and needs `roles/`; the snapshot template has a `CLAUDE.md` symlink and no `roles/` | **Template and run record disagree.** The `roles/` finding was never applied. |
| Reference role vs live role | `roles/professional-presence-profile-editor/` (reference) | Live copy in `~/scopes/scope-professional-presence/roles/` (per run 002) | **Cross-repo copy with no promotion or sync rule.** Run 002 already hit it. |
| Sibling repo locations | `DECISIONS.md` 2026-04-04 (`~/pro/` flat, `~/pro/agentic/` for design repos) | `README.md` uses `../../<tool>`; `components.yaml` uses `../<tool>` | **The two path sets disagree.** `README.md` matches the decision. |
| Retired terminology (phase, `root`, `workflows.yaml`, `activity/`, `~/scope/`) | Superseded markers in `DECISIONS.md` | Grep of the snapshot found none in live prose | Clean. |

## Where two docs try to be independently complete about the same thing

- `RUNTIME.md` § Scope manager vs the orchestration v1 snapshot (anatomy)
- `DECISIONS.md` 2026-07-10 vs `components/scope/DECISIONS.md` 2026-07-10 (`scope.yaml` v2)
- `DECISIONS.md` 2026-04-23 vs `components/orchestrator/DECISIONS.md` 2026-04-23 (`root-general`)
- `DECISIONS.md` § Open Questions vs orchestration v1 § Under Review (open questions), each declared "source of truth"

## Historical material sitting near live truth without enough demotion

- `architecture/INDEX.md` "Current Pickup" → `PICKUP.md`, which says it is superseded. The label is live; the target is historical.
- The `DECISIONS.md` 2026-04-27 "Scope manager is the unified platform gateway" heading has no *(superseded)* marker, so it reads as current to anyone scanning headings.
- `components/scope/skills/scope-design.md` and `components/agent/skills/role-design.md` read as live instructions, carry stale open-question notes, and are probably superseded by the `scope` successor (unverified).
- The whole live-state layer (`ROADMAP.md`, `components.yaml`, TODOs, PLANs) sits next to a reference-only banner with nothing linking the two.
