# Current-State Packet: agentic-architecture

Built 2026-10-04 from the repo snapshot (`docs-first-planning-assessment` Phase 1 Step 5). Successor repos were not read. Re-check anything marked *unverified* before relying on it.

**Current stage**
- **Reference-only.** The banners at the top of `README.md` and `AGENTS.md` (undated) say this repo is no longer architecture authority.
- **Successors:** `../personal-agent` holds the Personal Agent architecture; `../../scope` holds the Scope/Project model (*unverified*: not read).
- **Last dated design work:** 2026-07-26 (temporal coordinator pg-boss V0 decision; `architecture/PICKUP.md` superseded).
- **Allowed here** (recommended until a dated decision says otherwise): status headers, successor pointers, harvest records, broken-reference fixes. **Not allowed** without explicit authorisation: new or changed design, status elevation, new snapshots, roadmap progress.

**Canonical docs to trust first** (as historical record)
1. `README.md` / `AGENTS.md` banners: status and successors
2. `DECISIONS.md`: dated decisions. Skip entries marked *(superseded)*. The 2026-04-27 "unified platform gateway" entry is also superseded, though its heading does not say so.
3. `architecture/INDEX.md` → `architecture/snapshots/2026-07-16-orchestration/ARCH.md`: orchestration anatomy v1
4. `components/temporal-coordinator/SPEC.md`: temporal coordinator V0 contract
5. `MODEL.md` § Five-layer stack: map/territory layering

**Settled invariants** (as recorded here; do not reopen in this repo)
- Map, not territory: design artifacts describe; runtime instantiations run.
- One repo per scope, hard isolation; scope info splits into manifest (routing metadata) and interior (sealed).
- The orchestrator has no secrets and no scope-repo access; it routes on manifests only.
- The scope manager is the single sandbox security perimeter; its internals decompose into seams (orchestration v1).
- The temporal coordinator V0 is enqueue-only and route-free: one-time schedules, pg-boss delayed jobs, no consumer, no delivery claim.
- Pi is the agent runtime; Postgres is the platform data store.

**Active fronts**
- None in this repo. Work that would continue the design belongs in the successor repos.
- Housekeeping fronts, recommended and not yet done:
  - record the retirement in `DECISIONS.md`
  - header-demote the live-state docs
  - harvest the run findings

**Open questions**
- For this repo:
  - When was it retired, and what may still change here? (`questions.md` Q1, Q2)
  - Which of its decisions and run findings have the successors already taken? (Q4)
  - Who owns the temporal coordinator contract now? (Q5)
- Architectural questions are **frozen**, not resolved: `DECISIONS.md` § Open Questions (7 open, 6 deferred) and orchestration v1 § Under Review (6 items). Do not resume them here.

**Nearby superseded concepts likely to mislead**
- `ROADMAP.md` "Working towards next", `components.yaml` `in-progress` statuses, `components/*/TODO.md` "Next Up", `components/*/PLAN.md` "Current Focus". All read as live; none is.
- `architecture/INDEX.md` "Current Pickup" → `PICKUP.md`, which calls itself superseded (2026-07-26).
- `RUNTIME.md` "Runtime gateway (unified for v0)". Superseded by orchestration v1 seams.
- `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md` and the 2026-07-03, 07-15 and 07-16 scheduling decisions: the former TC Core/Egress tick design, all superseded by pg-boss V0.
- "Open question" notes for questions settled on 2026-04-27, in:
  - `SCOPES_PLANNED.md` line 90
  - `components/scope/skills/scope-design.md` line 155
  - `components/orchestrator/PLAN.md` line 28
  - the inherited-constraint lists in `components/agent/DECISIONS.md` and `components/orchestrator/DECISIONS.md`
- `AUTH_OPTIONS_ANALYSIS.md` "Current Working Decision: direct API key". The runs actually used subscription (Codex login) auth.
- `skills/session-kickoff.md` and `skills/entropy-guard.md` as found: built for live-repo work.

**Plausible next actions**
1. Record the retirement as a dated `DECISIONS.md` entry naming the successors and allowed edits. Then add a one-line status header to the 11 live-state docs listed in `assessment.md` § 6.
2. Start a "Harvest status" ledger in `runs/README.md` for the run 001-003 findings and unpromoted decisions (Pi event types as event-log schema v0, `roles/` missing from the scope template, the reference-vs-live role drift rule), each marked "moved to `<successor>`" or "dropped".
3. Install the reference-only guard (`guard/SKILL.md`) at `skills/entropy-guard.md`, and amend `skills/session-kickoff.md` and `AGENTS.md` session-start to lead with status.
