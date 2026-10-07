# Entropy assessment: agentic-architecture

- **Target:** a read-only snapshot of `agentic-architecture`, with no `.git` directory.
- **Assessed:** 2026-10-07.
- **Skills used:** entropy-assessment v0.9.0. It routed to docs-first-planning-assessment v0.3.0 (route A), which was
  called for its analysis and returned to entropy-assessment Step 3.
- **Mode:** audit with patches. The target was not edited; every change is delivered as a patch file beside this one.

**Route and result in one paragraph.** The intent pass finds the repository marked **reference-only** by its README.md
and AGENTS.md banners. It is a docs-first planning repository, so it takes shape A. The **guard decision is `none`**,
because the system is reference-only (entropy-assessment Step 3; docs-first Step 7.3), so the guard generator is not
called and no guard is written. The route ends with a correction and a demotion:
- **A settled patch.** It records the reference-only status in DECISIONS.md, updates the state file, and removes three
  claims that this repository is the current authority.
- **A provisional demotion of the existing guard.** It waits on the steward's answer to Q1.

---

## 1. Intent

### The steward
The steward is **Justin**, inferred and not stated. Nothing in the repository names the steward of
`agentic-architecture` (finding F16). The evidence:
- `components/orchestrator/scope/scope.yaml` line 6 has `steward: "justin"`.
- `components/orchestrator/scope/README.md` line 3 links to `github.com/justinphilpott/agentic-architecture`.
- NORTH_STAR.md line 3 describes "a personal agentic system".
- runs/001 RUN.md line 41 refers to "Justin's ChatGPT Plus subscription".

### Authorised intent, with the source of each part

| Part | Source | Kind | Evidence of authority |
|---|---|---|---|
| This repository is reference-only. Current Personal Agent architecture is in `../personal-agent`; the current Scope and Project model is in `../../scope`. Decisions here are not current authority. | README.md lines 3-5 | Directive (status banner) | Neither attributed nor dated |
| "Do not extend or reinterpret this blueprint as current design without explicit authorization." | AGENTS.md lines 3-6 | Directive (status banner) | Neither attributed nor dated |
| Vision and design values for a personal agentic system: creator over consumer, map over territory, structural guardrails, own stack | NORTH_STAR.md | Description (north star) | Neither |
| System-level decisions, 2026-02-27 to 2026-07-26 | DECISIONS.md | Decisions | Dated, not attributed |
| Component-level decisions | `components/{agent,orchestrator,scope}/DECISIONS.md` | Decisions | Dated, not attributed |

### Three readings
- **Declared.** The body text still calls this repository the current, "bleeding-edge" design source (F2), and its
  state file lists active fronts (F3).
- **Enacted.** No commit history is available. The latest dated work is the 2026-07-26 decision on the temporal
  coordinator's V0 (DECISIONS.md lines 836-851), together with the matching edits to PICKUP.md, SCHEDULING.md, MODEL.md
  and the orchestration snapshot. After that, the undated banners.
- **Authorised.** The banners: this is now a reference record, and current authority is elsewhere.

### Gaps by condition
- **Stale description:** F2, F3, F4, F7, F12. Corrections are limited to what the banners or a dated decision plainly
  settle (section 9).
- **Conflict:** F8 (the orchestrator's authority) and F9 (two owners for open questions).
- **Missing:** F1 (no durable record of the reference-only status), F15 (no successor named for some concepts), F16 (no
  named steward).
- **Ambiguous:** what reference-only permits, which is Q1; F17 (whether a current snapshot may be edited in place);
  F18 ("clarify intent", with no one named to do it).
- **Unauthorised drift:** possibly F10 (`display_name`) and F11 (scope status `planned`). Their authorisation may live
  in the `scope` repository, which was not read. F19 (the authentication used in practice) is possibly an adaptation.
- **Prose control:** none found. The existing guard states that it is discipline-based (`skills/entropy-guard.md`
  line 114), and nothing cites it as an enforced control.

### Existing guard repair instructions, read against the intent-change rule (v2)
- **Intent: F6e.** `skills/entropy-guard.md` line 79 says "If a component's status has changed, update
  components.yaml". AGENTS.md line 71 says "only elevate status when explicitly instructed". The repair lets the work
  change a status the steward controls.
- **Intent: F18.** AGENTS.md line 25 says "clarify intent and update the docs". The same idea appears at AGENTS.md
  line 64 and DECISIONS.md line 869. None says who clarifies the intent, so an agent could read it as permission to
  rewrite intent documents.
- **Ownership: F6f.** `skills/entropy-guard.md` lines 38-41 ask for the scope manager, the orchestrator, the
  manifest/interior split and the workflow primitive to be "consistently described across" three or four files each.
  That keeps parallel descriptions in step instead of naming one owner. Line 36 (the five-layer view in RUNTIME.md) is a
  projection of MODEL.md and is not flagged.

### Questions
There are two, Q1 and Q2, in `questions.md`.
- **Q1** asks what reference-only permits. The recommended answer is (a), a frozen record.
- **Q2** asks which repository owns the temporal coordinator contract, the `template/` sources and layer 1 of the
  five-layer stack. The recommended answer is (a): each moved, and the steward names the owner.

### Proposed changes, and where they are recorded
- **Recording the reference-only status** is a recording, not a new decision. It goes into DECISIONS.md, the decision
  owner per AGENTS.md lines 28 and 67, in `settled.patch`.
- **The steward's answer to Q1** would be recorded as a DECISIONS.md entry, in `provisional-Q1a-frozen.patch`. It is
  not applied.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: reference-only.** Evidence: README.md lines 3-5 and AGENTS.md lines 3-6. Nothing contradicts them
  except body text the banners override (F2). This limits the route to correction and demotion.
- **Shape: A, docs-first planning.** Evidence:
  - The repository is entirely Markdown and YAML, with no code, build, CI or hooks.
  - Decisions are in DECISIONS.md; state is in ROADMAP.md and `components/*/TODO.md`; agent instructions are in
    AGENTS.md (CLAUDE.md is a symlink to it).
  - Work happened in repeated sessions: the AGENTS.md session-start procedure, the kickoff skill, PICKUP.md, and the
    "Pickup" sections in the run records.
- **Repositories: the system spans several.**
  - Successors named by the banners: `../personal-agent` and `../../scope`.
  - Implementation: `../temporal-coordinator` (components.yaml line 29).
  - Theory: `../agentic-learning`. Distribution: `../agentic-architecture-distribution`.
  - Instances: the scope repositories under `~/scopes/`.

  Only this repository could be read, so the system was assessed from this repository alone. That gap is stated under
  Uncertainties.

**Planning horizon, as recorded before the banners:**
- **Settled:** DECISIONS.md entries and the AGENTS.md settled list.
- **Active:** the temporal coordinator V0 (done, 2026-07-26), the "Under Review" items in the orchestration v1
  snapshot, and the ROADMAP.md "Working towards" lists.
- **Exploratory:** the DECISIONS.md open questions.

Under the banners, nothing here is active.

---

## 3. Findings

This is the one findings list; other sections refer to findings by id. Severity is judged for a reference-only
repository: **H** misleads a fresh session about where authority lies; **M** is internal inconsistency an agent could
act on; **L** is a minor inconsistency or a historical note.

| Id | Sev | Finding | Evidence (file:line) | Source |
|---|---|---|---|---|
| F1 | H | The reference-only status exists only in two banners. Neither is dated or attributed, and DECISIONS.md, the decision owner (AGENTS.md:28,67; DECISIONS.md:3), has no entry for it. | README.md:3-5; AGENTS.md:3-6; DECISIONS.md (no entry) | Read |
| F2 | H | Body text still claims current authority, against the banners. | README.md:9 "Bleeding-edge design source for the current named version… under active review"; AGENTS.md:8 "This repo holds the current architecture state"; AGENTS.md:12-14 "Settled — current strong positions"; MODEL.md:31 (layer 1 is "the bleeding-edge design source for the current named version"); DECISIONS.md:137 (a decision record, not edited) | Read |
| F3 | H | The state file read first (AGENTS.md:38) presents active work, with no mention of the status. Component TODO "Next Up" lists and `in-progress` statuses say the same. | ROADMAP.md:3-71; components.yaml:18,27,33,39; components/orchestrator/TODO.md:14-20; components/scope/TODO.md:24-29 | Read |
| F4 | H | The index sends sessions to a superseded pickup. | architecture/INDEX.md:15-17 "Next architecture work starts at PICKUP.md" against PICKUP.md:3 "Status: superseded historical pickup point (2026-07-26)" and PICKUP.md:8-10 | Read |
| F5 | H | The session-start procedure and the kickoff skill lead a fresh session to choose next design work here, and neither mentions the status. | AGENTS.md:36-45 (step 6, "the 1-3 most plausible next actions"); skills/session-kickoff.md:86 "recommend the best next action from the packet" | Read |
| F6 | M | The existing guard, `skills/entropy-guard.md`, is stale and mis-scoped. See the six parts below this table. | skills/entropy-guard.md; AGENTS.md:72; skills/README.md:8 | Read |
| F7 | M | Scope-manager anatomy is contradicted outside the snapshot, and a completeness claim is false. RUNTIME.md keeps "Runtime gateway (unified for v0)" and "unified sandbox gateway", which were superseded 2026-07-16. PICKUP.md:15 says that wording "has been cleaned up except historical superseded decision titles". | RUNTIME.md:67,82; DECISIONS.md:573-575; ARCH.md:22; PICKUP.md:15 | Search: `grep -rni 'unified\|gateway'` over all `.md` and `.yaml` outside `archive/`. Only RUNTIME.md:67,82 remain, apart from DECISIONS.md history and an unrelated hit at PI_AGENT_OVERVIEW.md:21. |
| F8 | M | **Conflict** over the orchestrator's authority. "No secrets and no scope repo access" against "authority (scope access, secret reach, tool reach, autonomy) is mode-tunable". No dated decision records the change, and the 2026-04-06 entry is not marked superseded. | No access: DECISIONS.md:370-376; AGENTS.md:30; RUNTIME.md:88; components/orchestrator/DECISIONS.md:9; components/orchestrator/MODEL.md:27-33,65; components/scope/PLAN.md:32; components/scope/MODEL.md:63; skills/entropy-guard.md:39. Mode-tunable: MODEL.md:78; components.yaml:20; ARCH.md:52-59,68 | Search: `grep -rni 'no scope repo access\|no secrets\|no repo access\|mode-tunable'` |
| F9 | M | **Conflict:** two declared owners for open questions. The snapshot holds items (scope-manager decomposition, `context_ref` target) that are absent from the registry. AUTH_OPTIONS_ANALYSIS.md keeps architectural open questions of its own. | AGENTS.md:28; DECISIONS.md:305-309,877 ("live only in DECISIONS.md") against architecture/SCHEMA.md:78 and ARCH.md:70-72 ("source of truth here"); AUTH_OPTIONS_ANALYSIS.md:246-251 | Read |
| F10 | M | The manifest field set is restated in full in 7 places. The root manifest and the scope template add `display_name`, which no decision records; the 2026-04-07 decision says "Additional manifest fields should not be added until routing or auditing proves they are needed". | Owner: DECISIONS.md:466-475. Restated: DECISIONS.md:301,345,372; AGENTS.md:30; MODEL.md:62; components/scope/PLAN.md:32; skills/entropy-guard.md:57. Linked correctly: components/scope/MODEL.md:57. `display_name`: components/orchestrator/scope/scope.yaml:4,14,28; components/scope/template/scope.yaml:4,20-22; components/scope/skills/scope-design.md:33. Identity fields without it: components/scope/DECISIONS.md:29 | Search for the literal field list; paraphrases may exist |
| F11 | L | Scope status `planned` is outside the settled lifecycle `active \| archived \| closed`. | DECISIONS.md:23,323; MODEL.md:80; components/scope/MODEL.md:5 against components/orchestrator/scope/scope.yaml:7, SCOPES_PLANNED.md:11, components/scope/skills/scope-design.md:36 | Search: `grep -rn 'status: planned'` and related patterns |
| F12 | M | Questions that are resolved are still referenced as open, in 12 places (9 entries) listed below this table. The existing guard's check at line 48 targets exactly this. | See the list below | Read. The list is the instances found, not proven exhaustive. |
| F13 | L | The scope template has no `roles/`, although bindings live in scope repos under `roles/{role-id}/bindings/`. Run 002 had to add it by hand. Under "directory layout is the extension model" its absence may be intended. | DECISIONS.md:688-692; components/agent/DECISIONS.md:99-103; components/scope/MODEL.md:35-41; runs/002 RUN.md:230 | Read |
| F14 | L | components.yaml gives these repositories as `../library`, `../seed`, `../entropy-guard`, `../entropy-immune-system`, `../git-sync`, `../flowbook`, `../flowvoice` and `../scope`. README.md gives the same ones as `../../…`. The 2026-04-04 layout (tools flat in `~/pro/`; this repository in `~/pro/agentic/`, per runs/001 RUN.md:29) agrees with README.md. | components.yaml:35,51,56,61,66,71,76,81; README.md:43-50; DECISIONS.md:174-178 | Read. Not checked on disk: outside the allowed read set. |
| F15 | M | The banners name successors for two concepts only. The temporal coordinator contract is still called "authoritative" here, and the template source "single source" claim and layer 1 of the five-layer stack still point here. | README.md:3-5; DECISIONS.md:830,847; MODEL.md:31,88; SCHEDULING.md:20; AGENTS.md:19; components.yaml:29 | Read |
| F16 | L | No document names the steward of this repository. | See section 1 | Read |
| F17 | L | The orchestration v1 snapshot (id 2026-07-16) carries pg-boss V0 content from the 2026-07-26 decision, so it was edited in place. INDEX.md:22 says "if the model has moved, make a new snapshot", but INDEX.md:25 keeps "fix typos only" for old snapshots. It is ambiguous for the current one. | ARCH.md:11,18,30,41,47,66; DECISIONS.md:836; INDEX.md:22,25 | Read |
| F18 | L | "Clarify intent and update the docs" names no one to do the clarifying. | AGENTS.md:25,64; DECISIONS.md:869 | Read |
| F19 | L | AUTH_OPTIONS_ANALYSIS.md holds an undated "Current Working Decision" (direct API key; no subscription plumbing) outside the decision log. The runs used subscription-backed Codex login. Line 8, "not a commitment to … Pi", predates or ignores the 2026-04-28 Pi decision. | AUTH_OPTIONS_ANALYSIS.md:8,10-27; runs/001 RUN.md:41; runs/002 RUN.md:33,140; runs/003 RUN.md:68; DECISIONS.md:721-739 | Read |
| F20 | L | The reference role is kept in two copies, here and in the live scope repo, and they were edited in step. | runs/002 RUN.md:118,241; roles/professional-presence-profile-editor/ | Read |
| F21 | L | The version is "Sol 0.1" in ROADMAP.md and "0.x" elsewhere. | ROADMAP.md:3 against README.md:7, AGENTS.md:8, components.yaml:10 | Read |
| F22 | L | Superseded material sits nearby without a marker. LEARNINGS.md:35 says "Keep one super repo per vertical", against one repository per scope (2026-04-06). SCOPES_PLANNED.md:26 says the workflows will live in `workflows/` "once the orchestrator scope is instantiated", but drafts already exist. | components/scope/LEARNINGS.md:35; DECISIONS.md:327-337; SCOPES_PLANNED.md:26; components/orchestrator/scope/workflows/ | Read |
| F23 | L | The onboarding files omit the declared owner of anatomy. The AGENTS.md session start and key files never mention architecture/INDEX.md or the snapshots, nor RUNTIME.md, SCHEDULING.md or `components/temporal-coordinator/`. README.md navigation omits `components/temporal-coordinator/` and `archive/`. | AGENTS.md:36-45,92-115; README.md:16-35; DECISIONS.md:855-861 | Read |

The six parts of **F6**:
- **(a) It invites extension.** Its standing instruction (`skills/entropy-guard.md`:116, AGENTS.md:72,
  skills/README.md:8) runs it on every non-trivial commit. Several checks extend the design: lines 32-33 (does the
  roadmap reflect the current state), line 47 (new open questions) and lines 79-80 (update statuses and progress).
  That runs against the banners.
- **(b) It predates snapshot ownership.** The 2026-07-16 decision (DECISIONS.md:855-861) made the snapshot the owner of
  anatomy. The guard never names INDEX.md or the snapshots, so it cannot catch F7.
- **(c) It carries copied state.** Its frontmatter `system_snapshot` and `last_evaluated: 2026-04-27` (lines 6-7) put
  state inside the guard.
- **(d) It copies a definition.** Line 57 copies the manifest field list.
- **(e) Intent flag:** line 79 (see section 1).
- **(f) Ownership flag:** lines 38-41 (see section 1).

Whether it was ever run: unknown. There is no git history and no guard report.

The 12 places, in 9 entries, where **F12** finds a resolved question still referenced as open:
- SCOPES_PLANNED.md:90 lists as open "sandbox isolation model, workspace lifecycle triggers, agent runtime binding
  location". They were resolved at DECISIONS.md:275-285, :650 and :692.
- components/agent/DECISIONS.md:12 calls inter-agent communication and runtime setup "still open questions". Resolved
  at DECISIONS.md:559 and :635.
- components/scope/skills/scope-design.md:155 says "Skill injection is an open question". Resolved at
  DECISIONS.md:678.
- components/orchestrator/PLAN.md:28 says "format TBD — see … open questions". Resolved at DECISIONS.md:612-618.
- components/orchestrator/MODEL.md:84-86 and SCOPES_PLANNED.md:30 send readers to DECISIONS.md#open-questions for
  cross-scope workflow exposure. It is not in the registry; it is a direction-set decision at DECISIONS.md:666-670.
- RUNTIME.md:126 says "See open questions in DECISIONS.md" for the sandbox provider. That is a direction-set decision
  at DECISIONS.md:696-698.
- ROADMAP.md:54, :58 (the "who triggers" part only) and :63 list items resolved on 2026-04-27.
- components/scope/TODO.md:39 has workspace-lifecycle design, whose triggers were resolved on 2026-04-27.
- DECISIONS.md:896, a deferred item on "Layer 2 distribution form", was settled at DECISIONS.md:156-162 on
  2026-05-14.

---

## 4. Truth map

| Concept | Canonical home | Other places, and their role |
|---|---|---|
| The repository's lifecycle status | README.md and AGENTS.md banners now. DECISIONS.md is proposed (F1). | ROADMAP.md (the state file needs a pointer; F3) |
| Vision and design values | NORTH_STAR.md | MODEL.md (a summary) |
| System model and the five layers | MODEL.md | RUNTIME.md (a projection of layers 3-5); DECISIONS.md:131-142 (the decision record) |
| Orchestration and scope-manager anatomy | `architecture/snapshots/2026-07-16-orchestration/ARCH.md`, via INDEX.md (DECISIONS.md:855-861) | MODEL.md:78,86 (a summary with a link); RUNTIME.md:57-90 (a restatement that contradicts it, F7, F8); AGENTS.md:30-34 (a restatement, F8); components/orchestrator/MODEL.md (local, F8) |
| Decisions | DECISIONS.md; component `DECISIONS.md` files for local decisions | Component "Current inherited constraints" lists (summaries; one is stale, F12) |
| Open questions | **Disputed (F9):** DECISIONS.md "Open Questions" against the snapshot's "Under Review" section | RUNTIME.md:165-167 and SCOPES_PLANNED.md:88-90 (links, partly stale, F12) |
| Manifest field set | DECISIONS.md:466-475 | Restated in 7 places; artifacts disagree (F10) |
| Scope schema | components/scope/template/scope.yaml (components/scope/MODEL.md:81) and components/scope/DECISIONS.md | components/scope/MODEL.md and PLAN.md (summaries); scope-design.md (product artifact) |
| Role and binding schema | components/agent/template/ and components/agent/DECISIONS.md | components/agent/MODEL.md (summary); role-design.md (product artifact) |
| Temporal coordinator contract | components/temporal-coordinator/SPEC.md, whose current ownership is unclear (F15) | SCHEDULING.md, MODEL.md:88, RUNTIME.md:33-43, components.yaml:26-30 (consistent summaries) |
| Current state and next work | ROADMAP.md (read first) | components/*/TODO.md; architecture/PICKUP.md (superseded); runs/README.md (paused) |
| Agent instructions | AGENTS.md (CLAUDE.md is a symlink to it) | components/*/scope/AGENTS.md (templates) |
| Product artifacts | skills/session-kickoff.md, skills/entropy-guard.md, components/scope/skills/scope-design.md, components/agent/skills/role-design.md | — |
| Templates | components/scope/template/, components/agent/template/ | roles/ (a reference example; a copy lives in a scope repo, F20) |
| Historical | archive/; INTERFACE_REFINEMENT_PLAN.md; PICKUP.md; ORCHESTRATION.md (a stub pointer); superseded DECISIONS entries; runs/ | — |
| Research | PI_AGENT_OVERVIEW.md, AUTH_OPTIONS_ANALYSIS.md | — |

## 5. Loop map

The documented loop:
1. AGENTS.md is loaded automatically (CLAUDE.md is a symlink to it). runs/001 RUN.md:74 observed that Pi also loads
   AGENTS.md and CLAUDE.md.
2. A fresh session reads, in order: ROADMAP.md, MODEL.md, DECISIONS.md, components.yaml, then the component's MODEL.md,
   DECISIONS.md and PLAN.md.
3. The kickoff skill builds a current-state packet. It lives in the conversation and is never saved.
4. The session works.
5. Decisions go to DECISIONS.md; local decisions go to `components/*/DECISIONS.md`.
6. Learnings go to components/scope/LEARNINGS.md. There is no root LEARNINGS file.
7. Before a non-trivial commit, the session runs `skills/entropy-guard.md` (AGENTS.md:72).
8. Discussion items go to the DECISIONS.md open questions (`skills/entropy-guard.md`:98).

The real loop, as far as the evidence shows. There is no git history, so commit-level practice could not be seen.
- Work was tracked across ROADMAP.md, two component TODO files, PICKUP.md and per-run "Pickup — start here" sections
  (runs/001 RUN.md:112). That is four state surfaces.
- The last recorded handoff is PICKUP.md, which marks itself superseded.

The loop no longer applies: the banners stop design work here. A fresh session meets the banner first, then a
procedure (F5) and a state file (F3) that both point at design work. That mismatch is the main way this repository can
still cause drift.

## 6. Ranked risks

1. **The status is unanchored and superseded material sits nearby, at whole-repository level.** Findings: F1, F2, F3,
   F4, F5, F23.
   - Decay: every fresh session.
   - Recovery cost: high. Design work done here diverges from `personal-agent` and `scope`, which is the cross-layer
     drift DECISIONS.md:125 calls the most dangerous kind.
   - Symptoms: a session asked "what's next?" follows ROADMAP.md and the kickoff skill into new design work.
   - Anchor: the banners, to be recorded in DECISIONS.md.
2. **The existing guard runs against the lifecycle (workflow drift).** Finding: F6.
   - Decay: every non-trivial commit.
   - Recovery cost: medium.
   - Symptoms: the guard asks agents to update statuses, progress and open questions, which keeps the record "current".
   - Anchor: the banners; the answer to Q1.
3. **Parallel truth between the snapshot and prose.** Findings: F7, F8, F9, F10.
   - Decay: slow now that work has stopped.
   - Recovery cost: medium for anyone mining this record. The record holds two incompatible positions on the
     orchestrator's authority and on the scope manager.
   - Anchor: the snapshot via INDEX.md; DECISIONS.md:466-475 for the manifest fields.
4. **State dishonesty.** Findings: F7 (the false "hygiene pass is complete"), F12, F21, F22.
   - Decay: slow.
   - Recovery cost: low per item.
   - Anchor: the dated DECISIONS.md entries.
5. **Successor pointers are incomplete, and some references are stale.** Findings: F14, F15.
   - Decay: whenever implementation work looks for its contract.
   - Recovery cost: medium.
   - Anchor: the answer to Q2.

## 7. Recommendations

- **Consolidate.** Record the status in DECISIONS.md, as an entry that records the banners' decision (settled). If Q1
  is answered (b), also reduce the manifest field restatements to links to DECISIONS.md:466-475, and the RUNTIME.md
  anatomy to a link to the snapshot.
- **Demote.**
  - `skills/entropy-guard.md` and its pre-commit instruction: provisional, depends on Q1 (a).
  - The kickoff skill: mark it as orientation only, not for choosing work (settled).
- **Mark historical.**
  - ROADMAP.md lists, through a status block (settled).
  - The INDEX.md "Current Pickup" line (settled).
  - The temporal coordinator contract, once an owner is named (provisional, Q2).
- **Leave as they are.** Under the recommended answer to Q1, leave F8 to F11, F13 and F17 to F23 listed and unfixed.

## 8. One-time cleanup

Each item below was checked against the current file before its patch was written. Line numbers are verified in
section 3.
- **Settled, apply now (`settled.patch`, 6 hunks):**
  - ROADMAP.md status block (the state-file update, below).
  - INDEX.md "Current Pickup" (F4).
  - README.md:9 and AGENTS.md:8 (F2).
  - The AGENTS.md:12-14 heading and lead sentence (F2).
  - A new DECISIONS.md entry (F1).
  - A pointer at the top of the kickoff skill (F5).
- **Provisional, Q1 = (a), frozen (`provisional-Q1a-frozen.patch`, 5 hunks):**
  - Demote the guard: a header in `skills/entropy-guard.md`, plus AGENTS.md:72, AGENTS.md:103 and
    skills/README.md:8 (F6).
  - A DECISIONS.md entry for the answer. It contains placeholders for the date and the steward.
- **Provisional, Q1 = (b), maintained (`provisional-Q1b-maintained.patch`, 14 hunks):**
  - F7: RUNTIME.md:67,82.
  - F12: SCOPES_PLANNED.md:30,90; RUNTIME.md:126; components/orchestrator/MODEL.md:86; PLAN.md:28;
    components/agent/DECISIONS.md:12; scope-design.md:155 (only the injection clause); DECISIONS.md:896;
    ROADMAP.md:54,58,63; components/scope/TODO.md:39.
  - F14: components.yaml paths. The path for `../temporal-coordinator` is left alone, because
    INTERFACE_REFINEMENT_PLAN.md:7 implies it sits in `~/pro/agentic/`.
  - Under (b), F8, F9, F10 and F11 would each need a steward decision, which is why they are not drafted.
- **Provisional, Q2 (`provisional-Q2-successors.patch`, 2 hunks):** pointers in SPEC.md and SCHEDULING.md:20, with
  the placeholder `<OWNER NAMED BY THE STEWARD>`.

Apply order: `settled.patch` first. Each provisional patch is built on top of it, and `patch -p1 --dry-run` confirmed
every patch applies to a fresh copy of the target.

**The state-file update (docs-first Step 5).** ROADMAP.md is the existing state file and is read first, so the status
block goes there; no competing file is added. The block holds:
- the current stage: reference-only, with its source and the date it was recorded;
- what to read first: the successor repositories, with the list marked incomplete as F15 requires;
- the settled decision, linked to its DECISIONS.md entry;
- the open questions;
- misleading material nearby, marked "including" because the list is not exhaustive;
- when the block goes stale, and who refreshes it.

No next actions are given, because none are authorised here until Q1 is answered.

## 9. Patch check (Rules along the whole route)

Each settled hunk was read against the findings and both questions.
- **Two hunks removed.** The first draft appended a pointer to the banner lines in README.md (line 5) and AGENTS.md
  (line 6). Q1 quotes those lines, so both hunks were removed from the settled patch.
- **Wording cut back to what the banners settle.** AGENTS.md:8 now repeats the banner's own words, "no longer current
  architecture authority". "The current named version is Sol (0.x)" (AGENTS.md:8, README.md:7) and the "`Sol` is the
  current version codename" clause in README.md:9 are unchanged, because the banners do not say whether Sol is still
  current.
- **Left alone because the banners do not settle them.** MODEL.md:31 (layer 1) is left alone: the banners do not say
  what replaces layer 1, which Q2 asks. DECISIONS.md:137 is a decision record and is left alone; the new entry is what
  supersedes it.
- **Lists that F15 calls incomplete.** Every settled hunk that restates the successor list marks it incomplete: the
  ROADMAP.md block says "That list is incomplete", and the DECISIONS.md entry says the successors "do not cover every
  concept here". The INDEX.md and kickoff hunks name no successors.
- **No settled hunk touches Q1 or Q2.** None edits text either question quotes or states its answer. "Not current work
  here" in the ROADMAP.md block refers to design extension, which the banners settle. Maintenance, which Q1 asks
  about, is not mentioned.
- **The provisional patches carry placeholders.** `<date …>`, `<steward>` and `<OWNER …>` are filled from the answers;
  none was filled by guessing.

## 10. Guard surfaces, checks and decision (docs-first Step 7)

**Existing guard surfaces:**

| Surface | Verdict | Finding |
|---|---|---|
| `skills/entropy-guard.md` | **Demote** (provisional, Q1 = a). Under (b): amend, so the decision becomes `update`. | F6 |
| AGENTS.md:72 (the pre-commit instruction) and AGENTS.md:103 (key files) | Demote with the guard | F6 |
| skills/README.md:8 | Demote with the guard | F6 |
| skills/session-kickoff.md | Keep, with a status pointer (settled) | F5 |
| AGENTS.md session-start procedure | Keep. The banner sits above it and the kickoff pointer covers step 6. | F5 |
| ROADMAP.md:69, "Entropy guard: automated coherence checks on hooks" | Historical, covered by the status block | F3 |
| `components/*/template/` | Keep (product artifacts) | F10, F13 |
| CLAUDE.md symlinks | Keep | — |
| Hooks and CI | None exist | — |

**The docs-first matrix checks, written against this repository's files.** They are recorded for reuse if Q1 is
answered (b); under `none` they are not built into a guard.
- **Parallel truth.** Orchestration and scope-manager anatomy is owned by INDEX.md and the current snapshot.
  RUNTIME.md, MODEL.md and AGENTS.md:30-34 link to it and do not restate it. The manifest fields are owned by
  DECISIONS.md:466-475, and other mentions link there.
- **Local-global inversion.** The "Current inherited constraints" lists in `components/*/DECISIONS.md` link to root
  entries. A list that restates a root position must still agree with it.
- **Superseded material nearby.** Before reviving anything in `archive/`, PICKUP.md, INTERFACE_REFINEMENT_PLAN.md or
  a superseded DECISIONS entry, check that DECISIONS.md or INDEX.md records it as current. Before treating anything here
  as current, check the DECISIONS.md reference-only entry.
- **Stale references.** In-repo Markdown links: none broken on 2026-10-07 (a link scan of every `.md` file).
  Repository paths in components.yaml and README.md must agree (F14).
- **Lost decisions and learnings.** Decisions go to DECISIONS.md, local ones to `components/*/DECISIONS.md`. Learnings
  go to components/scope/LEARNINGS.md.
- **State dishonesty.** For each changed claim in ROADMAP.md, a component TODO.md, components.yaml or runs/README.md,
  do the other mentions agree? Does any completeness claim, such as "hygiene pass is complete", hold up under a search?
- **Workflow drift.** Would a fresh agent following the AGENTS.md session start and the kickoff skill treat this
  repository as reference-only?
- **Brittle automation.** There is none. Keep checks as judgment; only links are mechanical.

**Guard decision: `none`.** The system is reference-only, so no guard is created or updated (entropy-assessment
Step 3; docs-first Step 7.3, "A reference-only or retired repo usually needs `none`"). The route finishes with the
settled correction and the provisional demotion. The generator is not called; its `none` branch says to stop and
report. If Q1 is answered (b), the decision becomes **`update`**: amend `skills/entropy-guard.md` in place for F6 (b)
to (f), and add a reference-only status check.

## 11. The generator's inputs

These are listed for completeness, and are inapplicable while the decision is `none`.
- **Steward, intent documents, decision surface, open intent questions.**
  - Steward: Justin, inferred (F16).
  - Intent documents: the README.md and AGENTS.md banners, NORTH_STAR.md, DECISIONS.md.
  - Decision surface: DECISIONS.md, plus `components/*/DECISIONS.md` for local decisions.
  - Open intent questions: Q1 and Q2.
- **Current-state file, and who refreshes it.** ROADMAP.md. Who refreshes it is **unresolved**: no owner is recorded.
  The settled block says "whoever records the answer".
- **Rules the repository is bound by but does not own.** **Unresolved.** No user-wide rules file could be read (outside
  the allowed read set), and none is referenced in the repository.
- **Verification commands.** None exist. There is no build, test, CI or hooks; nothing runs by itself.
- **Code areas and the docs and tests that describe them.** **Inapplicable**: there is no code. The templates are
  described by `components/*/MODEL.md` and `DECISIONS.md`.
- **Live operational state or spend.** **Inapplicable** in this repository. The runs/ records describe past
  subscription-model runs and change nothing live.
- **Findings by id:** F1 to F23.

## 12. Uncertainties and what was not covered

- **No git history.** The enacted reading rests on dated text only. Whether the existing guard ever ran is unknown.
  The banners' date and author are unknown, so it is unknown whether work dated 2026-07-26 came before or after the
  status change.
- **The other repositories were not read:** `personal-agent`, `scope`, `temporal-coordinator`, `agentic-learning`,
  `agentic-architecture-distribution` and the scope repositories. Not checked as a result:
  - whether the successors hold the authority the banners give them;
  - F10 and F11 might be authorised in `scope`;
  - F14's paths were not checked on disk.
- **Not read in full:** `runs/*/events.jsonl` (only the opening lines), the runs/003 output (opening section) and
  `archive/scheduling-cronicle-investigation.md` (header, first 40 lines and headings). None bears on the guard
  decision.
- **Searches that support completeness claims (F7, F8, F10, F11)** used literal patterns, given in section 3.
  Paraphrases may have been missed.
- **No user-wide or global instruction file was consulted** for precedence.
