# Entropy Assessment: agentic-architecture

- Target: `targets/agentic-architecture` (read-only snapshot, no `.git`, so commit history and cadence could not be read)
- Assessed: 2026-10-04
- Route taken: `skills/entropy-assessment/SKILL.md` (v0.6.0), Steps 1-3 → routed to `skills/docs-first-planning-assessment/SKILL.md` (v0.1.0), Phase 1 and Phase 2 → integration handed to `skills/guards-integrator/SKILL.md` (v0.2.2)
- Companion outputs in this folder:
  - `canonical-truth-map.md` — which document owns which truth (Phase 1 Step 2)
  - `current-state-packet.md` — compact packet for the next fresh session (Phase 1 Step 5)
  - `guard/SKILL.md` — refined guard; replaces the target's `skills/entropy-guard.md` in place
  - `integration.md` — guards-integrator brief
  - `questions.md` — questions for the steward, each with a recommended answer
  - `feedback.md` — upstream feedback notes on entropy-guard itself

---

## 1. Front door (entropy-assessment Steps 1-3)

### Intent summary

`agentic-architecture` is the design blueprint ("map, not territory") for a personal agentic system: scopes, an orchestrator, a deterministic scope manager, a temporal coordinator, and Pi-based agents, aimed at delegating repetitive business work so the owner can spend less time at a screen (`NORTH_STAR.md`). Its body docs describe it as the "bleeding-edge design source for the current named version", Sol 0.x (`README.md` line 9, `AGENTS.md` line 8, `MODEL.md` line 31). But both `README.md` (lines 3-5) and `AGENTS.md` (lines 3-6) now open with an undated banner: the repo is **reference-only**, current Personal Agent architecture lives in `../personal-agent`, the current Scope/Project model lives in `../../scope`, and decisions here must not be treated as current authority.

Intent is discernible, so Step 1 does not stop. But the intent has changed underneath the repo: the purpose statement in the banner and the purpose statement in the body disagree. That disagreement is the top finding below.

### System shape classification

**A. Docs-first planning.** Routed to `docs-first-planning-assessment`.

Evidence for docs-first:
- 61 markdown and 7 YAML files and 0 source files; the docs are the product
- `DECISIONS.md` (78 entries, 896 lines), `ROADMAP.md`, two component `TODO.md` files, two component `PLAN.md` files and `architecture/PICKUP.md` carry state
- the iteration loop is repeated human and AI sessions: `AGENTS.md` session-start steps, `skills/session-kickoff.md`, `skills/entropy-guard.md`
- the drift found is docs-to-docs, state, and workflow drift

Ambiguities noted (none outranks docs-first on current risk):
- **Mixed docs + code flavour.** `components/temporal-coordinator/SPEC.md` calls itself the authoritative contract for an implementation that lives in a sibling repo (`../temporal-coordinator`), which has its own `spec/` (per `INTERFACE_REFINEMENT_PLAN.md`: "blueprint SPEC → impl `spec/` → code"). That is a cross-repo docs-vs-implementation surface this repo cannot see.
- **Workflow-heavy flavour.** `skills/session-kickoff.md`, `skills/entropy-guard.md` and the `runs/` experiment procedure are workflow artifacts.
- **Lifecycle stage.** The repo is reference-only. None of the router's four shapes covers lifecycle stage; see `feedback.md`.

### Domain map

Each domain below is listed with whether it is present here and whether it is still iterated.

- **Code:** absent. The temporal coordinator implementation is in a sibling repo.
- **Documentation:** present. It was iterated heavily from 2026-03-31 to 2026-07-26 (last dated `DECISIONS.md` and `PICKUP.md` entries); per the banner it should now be frozen.
- **Tests:** absent.
- **API contracts:** present, one: `components/temporal-coordinator/SPEC.md` (V0 HTTP routes, `schedule_due` event shape). The schemas `scope.yaml` v2, `role.yaml`, `binding.yaml` are template contracts.
- **Workflow / process:** present: `AGENTS.md` (symlinked as `CLAUDE.md`), `skills/session-kickoff.md`, `skills/entropy-guard.md`, `runs/README.md` procedure. No CI, no hooks, no PR template.

---

## 2. Planning horizon (docs-first Step 1)

- **Settled (historical):** every `DECISIONS.md` entry not marked superseded, as of 2026-07-26; the orchestration v1 snapshot invariants; the temporal coordinator V0 contract in `SPEC.md`.
- **Active:** per the banner, nothing should be active here. Six surfaces still present live work:
  - `ROADMAP.md` "Working towards next" (3 open items) and "Working towards after that"
  - `components.yaml` (4 components `in-progress`)
  - `components/scope/TODO.md` and `components/orchestrator/TODO.md` "Next Up"
  - `components/scope/PLAN.md` and `components/orchestrator/PLAN.md` "Current Focus"
  - `architecture/INDEX.md` "Current Pickup", pointing at a `PICKUP.md` that calls itself "superseded historical pickup point (2026-07-26)"
- **Exploratory:** `DECISIONS.md` Open Questions (7 "genuinely open", 6 "deferred"), the orchestration v1 snapshot "Under Review" list (6 items), and `PICKUP.md` "Questions To Pin" (10 seams).

---

## 3. Canonical truth map (docs-first Step 2)

Full map: `canonical-truth-map.md`. Summary of what it found:

- The concept with the weakest canonical home is the **repo's own status**. "Reference-only" exists in two banners and nowhere else: no dated `DECISIONS.md` entry, nothing in `ROADMAP.md`, `components.yaml`, `MODEL.md`, `skills/session-kickoff.md` or `skills/entropy-guard.md`.
- **Open questions have five homes**, though `AGENTS.md` line 28 and the 2026-04-05 decision say `DECISIONS.md` is the only one.
- **Scope-manager anatomy** is owned by the orchestration v1 snapshot (per the 2026-07-16 decision), but `RUNTIME.md` restates it in the superseded "unified gateway" form.
- **Component-local docs** mostly link to root decisions correctly. Their "inherited constraints" lists have gone stale, and `components/orchestrator/DECISIONS.md` restates the root `root-general` decision in full.

---

## 4. Loop map (docs-first Step 3)

This is the real loop as far as the snapshot shows. With no `.git`, cadence and the PR/no-PR question are inferred.

- **Session start:** an agent (Claude Code primary, OpenCode secondary, per `MANIFEST.md`) opens the repo and auto-loads `AGENTS.md` (`CLAUDE.md` is a symlink to it). The agent sees the reference-only banner, then the "Session start" steps in the same file: read `ROADMAP.md`, `MODEL.md`, `DECISIONS.md`, `components.yaml`, then run `skills/session-kickoff.md`.
- **Docs read first:** `skills/session-kickoff.md` names exactly those four files as canonical inputs. None of them carries the reference-only status, and the kickoff skill does not read `README.md`, `architecture/INDEX.md` or the banner.
- **Where active work is tracked:** `ROADMAP.md`, `components/*/TODO.md`, `components/*/PLAN.md`, `architecture/PICKUP.md`, and the "Pickup" / "Next" sections of `runs/*/RUN.md`. That is 7 places, with no single live-state home.
- **When decisions and learnings are captured:** decisions go to `DECISIONS.md` (root) or `components/*/DECISIONS.md`. Learnings go to `components/scope/LEARNINGS.md` and `runs/README.md` "What We Learned"; there is no root learnings file.
- **Coherence pause:** `skills/entropy-guard.md` "before committing non-trivial changes" (`AGENTS.md` line 72). It is external, discipline-only, with no hook.
- **Main handoff:** the local commit, then the push. A new cross-repo handoff exists since the retirement: concepts move from here into `personal-agent` and `scope`. Nothing in this repo records that handoff.

The declared loop and the real loop diverge at the first step. A fresh agent following `AGENTS.md` step 1-6 builds a packet from four files that all describe a live Sol 0.1 project. The kickoff output would say "working towards: a scope you can use; next: flesh out daily-summary". The banner is the only counterweight.

---

## 5. Entropy profile (docs-first Step 4)

These are ranked by destructive potential (decay rate × recovery cost).

### R1. Retirement applied to two banners, not to the repo (Superseded-nearby interference at repo scale; State entropy)

- **Symptoms:**
  - `AGENTS.md` contradicts itself: line 3 says "no longer current architecture authority", line 8 says "This repo holds the current architecture state".
  - `README.md` line 7 says "Current named version: Sol 0.x" two lines below the reference-only banner.
  - 19 lines in 10 files use live-state language ("current named version", "bleeding-edge", "Working towards", "Next Up", "Current Focus", "Current Pickup", `status: in-progress`), not counting historical `DECISIONS.md` text or the two skills. The reference-only status appears in exactly 2 places.
  - The banner is undated and has no `DECISIONS.md` entry, so a reader cannot tell which docs predate retirement.
- **Decay rate:** every fresh session. The `AGENTS.md` session-start procedure leads straight into live-mode files.
- **Recovery cost:** high. An agent can extend a retired design here, or carry superseded decisions (Postgres store, unified scope manager, Sol versioning) into `personal-agent` or `scope` as if current, where they are expensive to unpick.
- **Anchor for the fix:** a dated `DECISIONS.md` entry recording the retirement and naming the successors; one-line status headers on each live-state surface linking to it.

### R2. The protective loop is still built for a live repo (Workflow/practice drift)

- **Symptoms:**
  - `skills/entropy-guard.md`: `last_evaluated: 2026-04-27`. Its `system_snapshot` says "Current named version: Sol 0.1… Open questions reduced from 22 to 11"; the registry now holds 13. The snapshot already mentions the 2026-07-16 seam framing, so it was edited without bumping `last_evaluated`.
  - The guard knows nothing of `architecture/` snapshots (2026-07-16), `components/temporal-coordinator/`, `runs/`, or the retirement.
  - Several checks ask the agent to keep `ROADMAP.md`, `components.yaml` and component TODOs current, which is live-design maintenance the banner forbids.
  - The guard's Output step sends unresolved issues to `DECISIONS.md` Open Questions, a registry this repo should no longer grow.
  - `skills/session-kickoff.md` canonical inputs omit the status banner and `architecture/INDEX.md`.
  - `AGENTS.md` "Key files" omits `architecture/`, `components/temporal-coordinator/`, `runs/`, `RUNTIME.md`, `SCHEDULING.md`, `SCOPES_PLANNED.md`.
  - `README.md` navigation omits `components/temporal-coordinator/` and `archive/`.
- **Decay rate:** every session and every commit. This is the mechanism that keeps reproducing R1.
- **Recovery cost:** low to medium (rewrite one guard, amend one skill and one instructions file).
- **Anchor:** `AGENTS.md`, plus the guard and kickoff skill it points to.

### R3. Parallel open-question registries and stale "still open" references (Parallel truth; Registry duplication drift)

- **Symptoms:**
  - `AGENTS.md` line 28 and the `DECISIONS.md` 2026-04-05 entry say open questions live only in `DECISIONS.md`.
  - `architecture/SCHEMA.md` and the orchestration v1 snapshot say "Under Review" is "source of truth for the domain".
  - Open questions are also kept in `architecture/PICKUP.md`, `components/orchestrator/MODEL.md` ("Remaining open questions", including one not in the registry), the "Open Questions Surfaced" sections of both component skills, `AUTH_OPTIONS_ANALYSIS.md`, and each `WORKFLOW.md`.
  - At least 8 references treat questions as open that later decisions resolved:
    - `SCOPES_PLANNED.md` line 90 lists "sandbox isolation model, workspace lifecycle triggers, agent runtime binding location", resolved 2026-04-05 and 2026-04-27.
    - `components/scope/skills/scope-design.md` line 155: "Skill injection is an open question", resolved 2026-04-27.
    - `components/orchestrator/PLAN.md` line 28: cache "format TBD", resolved 2026-04-27.
    - `components/orchestrator/DECISIONS.md` line 13: comms "mechanism TBD", resolved 2026-04-27.
    - `components/agent/DECISIONS.md` line 12: "inter-agent communication and runtime setup are still open questions", resolved 2026-04-27.
    - `DECISIONS.md` line 271 (2026-04-05 entry): workspace transition trigger "is an open question". Resolved 2026-04-27, but the older entry carries no annotation.
    - `DECISIONS.md` line 896 still defers "Layer 2 distribution form", which the 2026-05-14 decision settled (separate `agentic-architecture-distribution` repo).
    - `RUNTIME.md` lines 67 and 82 still describe the scope manager as a "unified" gateway, superseded on 2026-07-16. `architecture/PICKUP.md` line 15 claims that wording was already swept out.
  - The superseded 2026-04-27 "Scope manager is the unified platform gateway" heading has no *(superseded)* title marker, unlike the 7 other superseded entries.
- **Decay rate:** slow now the repo is frozen.
- **Recovery cost:** medium. A harvester reading this repo for what was settled will mistake resolved questions for open ones, or the reverse.
- **Anchor:** `DECISIONS.md` (decisions and the open-question registry) and `architecture/INDEX.md` → orchestration v1 (anatomy).

### R4. Experiment findings and learnings never promoted, and now at risk of being lost (Knowledge entropy; State entropy)

- **Symptoms:**
  - Run 001's pickup list (`runs/001-moving-stillness-status/RUN.md` lines 116-120) asks to record "Pi's event types as the v0 runtime event/action log schema" as a decision. No such decision exists, and `ROADMAP.md` line 26 "Runtime event/action log schema" is still unchecked.
  - `components/orchestrator/TODO.md` "Review run 001 findings" is still open. Runs 002 and 003 appear in no TODO.
  - Run 002 found the scope template needs `roles/`; the template still has none.
  - Run 002 found that copying reference roles into live scope repos is a real drift risk, with no promotion rule recorded.
  - Run 002 records "the current scope template… does not include `CLAUDE.md`. Do not add `CLAUDE.md`", but the snapshot's `components/scope/template/CLAUDE.md` is a symlink to `AGENTS.md`. Either the template changed after the run without a note, or the record is wrong.
  - `AUTH_OPTIONS_ANALYSIS.md` "Current Working Decision: direct API-key auth", but all 3 runs used ChatGPT-subscription Codex login.
  - There is no root `LEARNINGS.md`; learnings are split between `runs/README.md` and `components/scope/LEARNINGS.md`.
- **Decay rate:** grows as memory fades and the successor repos diverge.
- **Recovery cost:** high. These are empirical results from real Pi runs, and rediscovering them means re-running experiments.
- **Anchor:** `runs/README.md` (the run index), and the successor repos' decision logs.

### R5. Referential and schema drift in machine-readable files (Referential entropy)

- **Symptoms:**
  - `components.yaml` gives sibling paths as `../scope`, `../library`, `../seed`, `../entropy-guard`, while `README.md` uses `../../scope`, `../../library`, `../../seed`, `../../entropy-guard` for the same repos. `DECISIONS.md` (2026-04-04) puts tools flat in `~/pro/`, and the run records show this repo at `~/pro/agentic/agentic-architecture`. So the `components.yaml` paths likely resolve to non-existent `~/pro/agentic/<tool>` directories. Not verified on disk: outside this run's reading scope.
  - `display_name` appears in `components/scope/template/scope.yaml` and in all 3 identities in `components/orchestrator/scope/scope.yaml`, but in no decision, model doc or manifest field list. The 2026-04-07 decision says "Additional manifest fields should not be added until routing or auditing proves they are needed".
  - `architecture/INDEX.md` says old snapshots are "stable records (fix typos only)". The orchestration v1 snapshot dated 2026-07-16 contains pg-boss V0 content decided 2026-07-26, so it was edited in place beyond typos.
  - `DECISIONS.md` is not in date order (2026-02-27 entries after 2026-04-01; 2026-05-14 between 2026-04-23 and 2026-04-03; 2026-07-26 before 2026-07-16), while the repo's own conflict rule resolves disputes "by chronology".
- **Decay rate:** slow. **Recovery cost:** low.
- **Internal link check, run 2026-10-04:** 0 broken links inside the repo; 20 links point to sibling repos and were not checked.

---

## 6. Recommendations (docs-first Step 5)

- **Consolidate:** the repo's status into one canonical, dated `DECISIONS.md` entry. Both banners link to it.
- **Demote with a one-line header, no rewrite:** `ROADMAP.md`, `components.yaml` (YAML comment), `components/scope/TODO.md`, `components/scope/PLAN.md`, `components/orchestrator/TODO.md`, `components/orchestrator/PLAN.md`, `SCOPES_PLANNED.md`, `RUNTIME.md`, `AUTH_OPTIONS_ANALYSIS.md`, `components/scope/skills/scope-design.md`, `components/agent/skills/role-design.md`.
- **Rename the label:** in `architecture/INDEX.md`, change "Current Pickup" to "Historical pickup".
- **Amend, not replace:** `AGENTS.md` (remove the line-8 contradiction; session-start in reference mode; key files); `skills/session-kickoff.md` (status first); `skills/entropy-guard.md` (refined in `guard/SKILL.md`).
- **Mark historical:** the superseded heading for the 2026-04-27 unified-gateway entry; annotate the 2026-04-05 workspace-trigger question as resolved 2026-04-27; close the deferred "Layer 2 distribution form" question against 2026-05-14.
- **Guard:** one combined reference-only delta guard at commit time (`guard/SKILL.md`), with the kickoff skill as its session-start companion.
- **Leave alone:** `archive/`, `INTERFACE_REFINEMENT_PLAN.md`, `PICKUP.md` body and `runs/*/RUN.md` bodies. They are already correctly self-demoted or are historical records.

## 7. Bootstrap actions (one-time, before the recurring guard makes sense)

Record completion of these in a companion artifact (the commit message, or the new `DECISIONS.md` entry), never in the guard file.

1. **B1. Record the retirement:** a dated `DECISIONS.md` entry. It names the successors (`../personal-agent`, `../../scope`), lists what edits remain allowed, and says the existing open-question registry is frozen. Date: steward to supply (`questions.md` Q1).
2. **B2. Header-demote** the 11 live-state surfaces listed in section 6, linking to B1.
3. **B3. Amend `AGENTS.md`:** delete or reword line 8. Replace "Session start" steps 1-6 with: read the banner and B1, decide whether the question belongs in a successor repo, then run the amended kickoff. Add the missing key files.
4. **B4. Fix the R3 references** that would mislead a harvester about what was settled: the 8 stale "still open" references and the missing superseded title marker.
5. **B5. Start a harvest ledger:** a "Harvest status" section in `runs/README.md`, one line per run finding or unpromoted decision, with where it went (successor repo) or "dropped". Seed it with the R4 items.
6. **B6. Install the refined guard** at `skills/entropy-guard.md`, same path so existing references stay valid, and amend `skills/session-kickoff.md` per `integration.md`.

## 8. Existing guard surface inventory (docs-first Step 6)

Each surface below gets one of the skill's four verdicts (keep / amend / replace / demote).

- `skills/entropy-guard.md` — **amend**: refined to reference-only mode; see `guard/SKILL.md`.
- `skills/session-kickoff.md` — **amend**: add the status inputs, put "Repository status / successors" as the first packet line, allow "Active fronts: none here".
- `skills/README.md` — **keep**. It adds one line once the guard changes mode.
- `AGENTS.md` (+ `CLAUDE.md` symlink) — **amend** (B3). The symlink itself is good: one source for two agent tools.
- `README.md` — **amend**: lines 7-9 contradict the banner; navigation is missing 2 paths.
- `DECISIONS.md` — **amend** (B1, B4).
- `architecture/INDEX.md` — **amend**: rename the "Current Pickup" label.
- `architecture/PICKUP.md`, `archive/`, `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md` — **keep**: already correctly demoted.
- `ROADMAP.md`, `components.yaml`, `components/*/TODO.md`, `components/*/PLAN.md`, `SCOPES_PLANNED.md`, `RUNTIME.md` — **demote to historical context** (B2).
- `runs/README.md` — **amend**: it becomes the harvest ledger (B5).
- `components/scope/LEARNINGS.md` — **keep**.
- `components/scope/skills/scope-design.md`, `components/agent/skills/role-design.md` — **demote to historical context**. They are design skills, not guards, but they carry stale open-question notes.
- CI, hooks, PR templates — **none exist; no guard needed now** (see `integration.md` for when that changes).

## 9. Uncertainties

- **Retirement date and scope.** The banner is undated. I treated it as authoritative because it is the top of both files every agent reads first; `questions.md` Q1 and Q2.
- **Successor contents unread.** I did not read `../personal-agent` or `../../scope` (outside this run's scope), so I cannot say which concepts here are already superseded there. Every "historical" label above means "per this repo's own banner", not "verified against the successor".
- **Activity level.** With no `.git`, I cannot tell whether sessions still happen here. If none do, only B1-B3 matter.
- **Temporal coordinator contract ownership.** `SPEC.md` claims authority over a live implementation in another repo; whether that still holds after retirement is unknown (`questions.md` Q5).
- **Template history.** Whether the `CLAUDE.md` symlink in the scope template was added after run 002, or was always there, cannot be told from the snapshot.

## 10. Upstream feedback check

The front door and the docs-first skill both had a reusable gap: neither checks the repo's **lifecycle stage** (live / maintenance / reference-only / archived), so both default to producing live-repo artifacts. The front-door Output was also ambiguous once it routed away. Notes are in `feedback.md`. They were not filed as GitHub issues: this run was not inside the entropy-guard repo, and web access was out of scope.
