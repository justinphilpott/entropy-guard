# Entropy assessment: agentic-architecture

Assessed 2026-10-07 from a read-only snapshot of the repository (no `.git`). Line numbers refer to that snapshot.

## Route and mode

- **Route.** `entropy-assessment` Step 1 (intent pass, `intent-pass.md`, existing guard read against
  `intent-change-rule.md`) → Step 2 (lifecycle: reference-only; shape A, docs-first planning) →
  `docs-first-planning-assessment` Steps 1–7 as a called skill → back to `entropy-assessment` Step 3 (guard decision
  `none`) → Step 4 (no handover: the generator is reached only for `create` or `update`; its own `none` branch says
  stop and report). `guards-integrator` was not reached.
- **Mode.** Plan for the target: nothing in it was edited. Every proposed change is a patch in this folder, sorted
  into one settled patch and two provisional patches, as "Rules along the whole route" require.

## Intent

**Steward.** No file names a steward for this repository (F2). Inferred: Justin, from the GitHub owner in
`components/orchestrator/scope/README.md:3` (`justinphilpott/agentic-architecture`), `steward: "justin"` for the root
scope (`components/orchestrator/scope/scope.yaml:6`, `SCOPES_PLANNED.md:12`) and "Justin's" in
`SCOPES_PLANNED.md:86` and `runs/001-moving-stillness-status/RUN.md:41`. This is an inference, not a record.

**Authorised intent, by source.** Kind and evidence of authority are kept apart.

| Statement | Where | Kind | Authority evidence |
|---|---|---|---|
| Reference-only; current Personal Agent architecture is in `../personal-agent`, the current Scope/Project model in `../../scope`; "Do not treat decisions in this repository as current authority" | `README.md:3-5` | directive (status banner) | neither attributed nor dated |
| "no longer current architecture authority … Do not extend or reinterpret this blueprint as current design without explicit authorization" | `AGENTS.md:3-6` | directive (status banner) | neither attributed nor dated |
| Vision and design values of the blueprint | `NORTH_STAR.md:3-52` | description of intent | neither |
| System decisions, 2026-02-27 to 2026-07-26 | `DECISIONS.md` | decisions | dated, not attributed |
| Component decisions | `components/*/DECISIONS.md` | decisions | dated, not attributed |
| "Settled — current strong positions" | `AGENTS.md:12-34` | directives (summary of DECISIONS.md) | neither |

Precedence used: no statement is attributed to the steward, so the system's own precedence applies: "When older notes
conflict with newer settled docs, the newer settled state wins" (`AGENTS.md:70`), and conflicts are settled by "the
current snapshot/index and dated decisions" (`AGENTS.md:25`, `DECISIONS.md:869`). The banners are directives that
postdate the body text they sit above, so they win over it. Whether they are the steward's own words is unrecorded
(F1, F2); missing attribution does not make them an inference, and this assessment uses them as usable intent.

**Three readings.**
- **Declared:** the banners say reference-only; the body text under them still says current design source
  (`README.md:9`, `AGENTS.md:8`, `AGENTS.md:12-14`) (F3).
- **Enacted:** the last dated work is 2026-07-26 (`DECISIONS.md:836`, `architecture/PICKUP.md:3-4`,
  `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md:3`); the experiment line paused after 2026-05-13
  (`runs/README.md:7`, `runs/003-professional-presence-opening-proposals/RUN.md:4`). Recent commits: **not covered**,
  the snapshot has no git history. All 78 files share the modification time 2026-08-01 21:12, so the banners were
  present by then (inference from file times).
- **Authorised:** the banners, for what the repository is now for; the dated decisions, for what it decided while it
  was current.

**Gaps, by condition** (evidence is in the findings list):
- Stale description: F3 (against the banners), F7 (against the 2026-07-16 snapshot decision), F8 (against
  2026-04-27 entries), F9.
- Conflict: F10 (who owns open questions), F11 (scope status values).
- Missing: F1 (the reference-only decision has no durable dated record), F2 (no named steward).
- Ambiguous: F5 (does the working loop stay in force?), F16 (who may "clarify intent").
- Unauthorised drift: F11 (`planned` used), F12 (`display_name` added to manifests), F18 (subscription auth used
  against a "current working decision").
- Prose control: F15 (the banner's "do not extend" rule).
- Existing guard against the intent-change rule and the one-owner rule: F14.
- Gaps that do not depend on intent: F4, F6, F17, F19.

**Questions:** Q1 (F5) and Q2 (F1, F2), in `questions.md`, each with a recommended answer.

**Proposed changes and where they are recorded:** `settled.patch` (F3, F4, F6). `provisional-q1.patch` (F5) and
`provisional-q2.patch` (F1; drafts the DECISIONS.md record, marked as awaiting the steward), neither to be applied
until its question is answered.

## Lifecycle, shape and repositories

- **Lifecycle: reference-only.** Evidence: `README.md:3-5`; `AGENTS.md:3-6`; `architecture/PICKUP.md:3` ("superseded
  historical pickup point (2026-07-26)"); `runs/README.md:7` ("paused"); `INTERFACE_REFINEMENT_PLAN.md:3`
  ("superseded historical plan (2026-07-26)"). Against: only body text that predates the banners (F3). This limits the
  route to corrections and a demotion; internal cleanup of the frozen record is not recommended (see
  Recommendations).
- **Shape: A, docs-first planning.** No implementation code (`AGENTS.md:88`: implementation lives in component
  repos). Of 78 files, 61 are Markdown; the rest are 7 YAML definitions and templates, 3 run event logs, 2
  `.gitignore` files and 5 `.gitkeep` files. State lives in `DECISIONS.md`, `ROADMAP.md`, `components/*/TODO.md` and
  `AGENTS.md`, and work ran in repeated sessions (`AGENTS.md:36-45`, `skills/session-kickoff.md`). Shape D
  (workflow-heavy) fits in part, because the riskiest surface is the session loop (F5); the docs-first matrix covers
  workflow drift, so route A covers that risk.
- **Repositories.** Assessed alone. It names related repositories (`../personal-agent`, `../../scope`,
  `../agentic-architecture-distribution`, `../temporal-coordinator`, `../agentic-learning`), but none manages this
  repository's work, and none was read (outside this run's allowed reads). Whether the banners' pointers are correct,
  and whether this roadmap's open items moved there, is **not covered**.

## Findings

One list; every other section refers to these ids.

- **F1 — The reference-only decision has no durable dated record.** The banners (`README.md:3-5`, `AGENTS.md:3-6`)
  carry no date or attribution; `DECISIONS.md` (latest dated entry 2026-07-26 at `:836`) has no entry for the change.
  The repository settles conflicts by dated decisions (`DECISIONS.md:869`), so its most important decision cannot be
  placed in its own chronology. Missing. → Q2, `provisional-q2.patch`.
- **F2 — No steward is named for the repository.** See Intent. Missing. Folded into Q2 (the record's attribution).
- **F3 — Body text still claims current authority under the banners.** `README.md:9` "Bleeding-edge design source for
  the current named version … provisional shapes are under active review"; `README.md:43` "design docs live in
  components/scope/" against `README.md:4-5` "the current generic Scope/Project model lives in scope";
  `AGENTS.md:8` "This repo holds the current architecture state"; `AGENTS.md:12,14` "Settled — current strong
  positions", "These are the current settled positions". Stale description against the banners, corrected only as far
  as the banners plainly say. "Current named version: Sol 0.x" (`README.md:7`, `AGENTS.md:8`) is left as it is: the
  banners do not say whether Sol is still a current version anywhere. → `settled.patch`.
- **F4 — The snapshot index sends new work to a superseded pickup.** `architecture/INDEX.md:15-17` "Current Pickup:
  Next architecture work starts at PICKUP.md" against `architecture/PICKUP.md:3` "Status: superseded historical pickup
  point (2026-07-26)" and the banners. → `settled.patch`.
- **F5 — The working loop still directs active design work.** `AGENTS.md:36-45` (build a current-state packet and
  "the 1-3 most plausible next actions", then "choose work"), `AGENTS.md:72` (run the guard before non-trivial
  commits), `skills/session-kickoff.md:10,86` ("When the user asks what's next?" … "recommend the best next action"),
  `skills/entropy-guard.md:18` ("At the start of an architecture session"). The banner forbids extending the
  blueprint "without explicit authorization" (`AGENTS.md:5-6`), which leaves room for authorised work here, so the
  evidence does not settle whether the loop stays in force. Workflow drift; ambiguous. → Q1, `provisional-q1.patch`.
- **F6 — The first-read state file has no status, and resolved items look open.** `ROADMAP.md` is read first
  (`AGENTS.md:38`, `skills/session-kickoff.md:24`) and lists "Working towards next" (`:12-27`) as live work. Open items
  already resolved by dated entries: `:36` "Inter-agent communication patterns" and `:63` "Communication
  architecture" (`DECISIONS.md:551-559`), `:37` "Agent runtime setup" and `:54` "Agent design: what is a running
  agent" (`DECISIONS.md:622-635`), `:61` "Task-level checkpointing" (`DECISIONS.md:598-608`), the trigger part of `:58`
  "Workspace definition and lifecycle" (`DECISIONS.md:639-650`); `:56` "Scheduling: core-owned deterministic temporal
  coordinator, due-event trigger layer" was superseded (`DECISIONS.md:743-746`, `:836-851`). State dishonesty. →
  `settled.patch` adds a status section; the items themselves are left as the frozen record.
- **F7 — RUNTIME.md restates anatomy the snapshot owns, in superseded words, and PICKUP.md says this was cleaned
  up.** `RUNTIME.md:57-84` defines the scope manager in full, including "Runtime gateway (unified for v0)" (`:67`) and
  "unified sandbox gateway" (`:82`). The owner is the orchestration snapshot (`DECISIONS.md:857`: "prose docs point at
  it and must not restate anatomy"; `architecture/snapshots/2026-07-16-orchestration/ARCH.md:22`: decomposes into
  seams; superseding note `DECISIONS.md:575`). `architecture/PICKUP.md:15` claims "unified-gateway wording has been
  cleaned up except historical superseded decision titles"; checked across the whole repository, `RUNTIME.md:67,82`
  contradict it, and `DECISIONS.md:584,592` are body lines (not titles) of the entry marked superseded at `:575`.
  Parallel truth; stale description. No edit while reference-only; named in the ROADMAP status section.
- **F8 — Resolved questions are still described as open.** `components/orchestrator/PLAN.md:28` (manifest cache
  format "TBD", resolved `DECISIONS.md:612-618`) and `:29` (communication mechanism, `:551-559`);
  `components/orchestrator/MODEL.md:84-86` (cites "Cross-scope workflow exposure model" as tracked in the registry;
  the registry at `DECISIONS.md:879-896` does not hold it; direction set at `:666-670`);
  `components/orchestrator/DECISIONS.md:13` "(mechanism TBD)"; `components/agent/DECISIONS.md:12` "inter-agent
  communication and runtime setup are still open questions" (`:559`, `:635`); `components/scope/TODO.md:39` (workspace
  lifecycle, `:650`); `components/scope/skills/scope-design.md:155` "Skill injection is an open question" (`:678`);
  `SCOPES_PLANNED.md:30` (points to the registry for a question it does not hold) and `:90` ("workspace lifecycle
  triggers, agent runtime binding location", `:650`, `:692`); `DECISIONS.md:299` (cache format "is an open
  question", `:618`); `RUNTIME.md:126` (points to registry questions on sandbox isolation that it does not hold;
  direction set at `:696-698`). The repository's own rule was "When a question gets resolved, every occurrence must
  be found and updated" (`DECISIONS.md:307`). Stale references. No edit while reference-only.
- **F9 — Local notes contradict later dated decisions without a superseded mark.**
  `components/orchestrator/MODEL.md:25` ("provision workspace for scope X") and `:40` ("Orchestrator calls the scope
  manager to assemble a workspace") against `DECISIONS.md:641-648` ("It never says 'provision a sandbox' — it
  submits work"); `components/scope/LEARNINGS.md:35` "Keep one super repo per vertical" against `DECISIONS.md:327-335`
  (one repo per scope), while the neighbouring entry at `:39` is marked historical; `archive/scheduling-cronicle-
  investigation.md:3-8` says its conclusion (core-owned Postgres coordinator) is "retained in SCHEDULING.md", which now
  describes the pg-boss V0 (`SCHEDULING.md:3-5`, `DECISIONS.md:836-851`). Superseded material nearby. No edit.
- **F10 — Two owners for open questions.** `DECISIONS.md:305-309,877` and `AGENTS.md:28` ("Architectural open
  questions live only in DECISIONS.md"), with `architecture/LANGUAGE.md:26`, against `architecture/SCHEMA.md:78`
  ("Under Review … source of truth for the domain") and `ARCH.md:72` ("source of truth here"). The 2026-07-16 entry
  (`DECISIONS.md:855-861`) gives the snapshot "anatomy" but names no owner for open questions. The existing guard
  enforces one side (`skills/entropy-guard.md:45`). Conflict. Not asked: nothing built depends on it while the
  repository is reference-only.
- **F11 — Scope status values disagree.** `DECISIONS.md:23,323` and `components/scope/MODEL.md:5` give
  `active | archived | closed`; `components/scope/skills/scope-design.md:36` adds "`planned` if not yet operational",
  and the root scope uses it (`components/orchestrator/scope/scope.yaml:7`, `SCOPES_PLANNED.md:11`). No decision
  covers `planned`. Conflict and unauthorised drift. Not asked, as F10.
- **F12 — Manifest entries carry a field the decision withheld.** `DECISIONS.md:466-475`: "Additional manifest fields
  should not be added until routing or auditing proves they are needed"; `components/orchestrator/scope/scope.yaml:14,28`
  add `display_name` to `kind: scope` entries, and `components/scope/template/scope.yaml:20-22` documents it. No
  decision covers it. Unauthorised drift. Not asked.
- **F13 — One decision recorded in full twice.** "The root scope is named `root-general`" at `DECISIONS.md:489-500`
  and `components/orchestrator/DECISIONS.md:18-29`, against that file's own rule "Do not duplicate them here in full"
  (`:5`). Owner: the root log (cited by `MODEL.md:66`). Parallel truth. No edit.
- **F14 — The existing guard, read against the intent-change rule and the one-owner rule.**
  - *Intent:* the guard has no intent-change rule. Its default repair, "After running, note any issues found and
    fixed" (`skills/entropy-guard.md:98`), applied to "Do decisions in DECISIONS.md align with descriptions in …
    NORTH_STAR.md?" (`:32`), leaves editing `NORTH_STAR.md` to match open. "If a component's status has changed,
    update components.yaml" (`:79`) skips `AGENTS.md:71` ("only elevate status when explicitly instructed").
  - *Ownership:* "Is the scope manager consistently described across MODEL.md, RUNTIME.md, and components.yaml?"
    (`:38`) keeps RUNTIME.md's independent definition in step instead of reducing it to a link to the snapshot that
    owns it (F7), and omits the snapshot. "Are manifest/interior references consistent across …" (`:40`) keeps six
    copies of the manifest field list in step (`AGENTS.md:30`, `MODEL.md:62`, `DECISIONS.md:345,372`,
    `components/scope/PLAN.md:32`, and the guard's own copy at `:57`; owner `DECISIONS.md:466-473`). Considered and
    not flagged: `:36` (RUNTIME.md's data-flow view is a zoomed projection of the stack) and `:39`, `:41` (summaries
    that link back to their decisions; keep them correct).
  - *State copied into the guard:* the `system_snapshot` frontmatter (`:7`) says "Open questions reduced from 22 to
    11"; the registry now holds 7 open and 6 deferred (`DECISIONS.md:879-896`). It predates the snapshots, the
    temporal coordinator and the reference-only status; `last_evaluated: 2026-04-27` (`:6`). No check covers
    `architecture/`, `components/temporal-coordinator/` or `runs/`.
  - No action under `none`; these are the update inputs if the repository is ever reactivated.
- **F15 — The banner's rule is a prose control.** "Do not extend or reinterpret this blueprint as current design
  without explicit authorization" (`AGENTS.md:5-6`; `README.md:5`). Nothing enforces it: no hooks, no CI
  (`skills/entropy-guard.md:7` "No code, no CI, no hooks"; none in the snapshot). Enforcement would sit at the
  repository host (a read-only, archived remote) or in a commit hook. Nothing cites it as a control; the guard
  predates it and does not check it.
- **F16 — Who may "clarify intent" is not stated.** `AGENTS.md:14` "anything can be revisited with strong enough
  reasoning, and when it changes we update this list in the same pass"; `AGENTS.md:25` and `DECISIONS.md:869`
  "clarify intent and update the docs/records". Readings: the steward clarifies and records; or the working agent
  decides and edits. Divergent case: under the second reading, an agent meeting F10 could rewrite
  `DECISIONS.md:305-309` to give open questions to the snapshot; under the first it records a proposal. Ambiguous. Not
  asked while reference-only.
- **F17 — Sibling repository paths disagree.** `components.yaml:35,51,56,61,66,71,76,81` (`../scope`, `../library`,
  `../seed`, `../entropy-guard`, `../entropy-immune-system`, `../git-sync`, `../flowbook`, `../flowvoice`) resolve to
  `~/pro/agentic/<name>`; `README.md:43-50` use `../../<name>`; `DECISIONS.md:176,178` put tools flat in `~/pro/` and
  the scope implementation at `~/pro/scope/`. `MODEL.md:3` still says "the pro-agentic directory". Not verified on
  disk. Stale references. No edit.
- **F18 — A "current working decision" outside the log, and open questions outside the registry.**
  `AUTH_OPTIONS_ANALYSIS.md:10-16,253-257` ("use the direct API-key route for the first slice") against the runs, which
  used Pi's subscription login (`runs/001-moving-stillness-status/RUN.md:41`,
  `runs/002-professional-presence-diagnostic/RUN.md:33,140,218`,
  `runs/003-professional-presence-opening-proposals/RUN.md:68`); no decision covers either. Open-question text outside
  the registry: `AUTH_OPTIONS_ANALYSIS.md:246-251`, and `components/scope/skills/scope-design.md:161-162`, which
  duplicate `DECISIONS.md:894-895`. Unauthorised drift (historical) and parallel truth. No edit.
- **F19 — Navigation and catalog gaps.** `README.md:16-35` omits `components/temporal-coordinator/` and `archive/`;
  `AGENTS.md:92-115` omits `architecture/`, `components/temporal-coordinator/`, `runs/`, `RUNTIME.md`,
  `SCHEDULING.md` and `SCOPES_PLANNED.md`. Pi has status `component` (`components.yaml:43-45`) but no entry under
  "Primitives" in `MODEL.md:76-90`, though `DECISIONS.md:41` says promoted components appear in MODEL.md. No edit.

In-repo links: all resolve (checked 2026-10-07). 23 links leave the repository and were not checked.

## Truth map

| Concept | Canonical home | Others (role) |
|---|---|---|
| What this repository is now | `README.md:3-5` banner | `AGENTS.md:3-6` (copy); body text contradicts it (F3); `ROADMAP.md` silent (F6); `architecture/INDEX.md:15-17` contradicts it (F4) |
| Vision and values | `NORTH_STAR.md` | — |
| System decisions | `DECISIONS.md` | `AGENTS.md:12-34` (summary); component `DECISIONS.md` (local, one duplicate F13) |
| Open questions | contested: `DECISIONS.md#open-questions` vs snapshot "Under Review" (F10) | duplicates F18; stale mentions F8 |
| Orchestration anatomy | `architecture/snapshots/2026-07-16-orchestration/ARCH.md` via `architecture/INDEX.md` | `RUNTIME.md:57-84` (competing, F7); `MODEL.md:86`, `components.yaml:24`, `AGENTS.md:32` (summaries) |
| Five-layer stack | `MODEL.md:25-48` | `RUNTIME.md:5-19` (projection) |
| Temporal coordinator contract | `components/temporal-coordinator/SPEC.md` | `SCHEDULING.md`, `MODEL.md:88`, `RUNTIME.md:33-49`, `components.yaml:30` (summaries, consistent) |
| Component status | `components.yaml` (`DECISIONS.md:41`) | `MODEL.md` (gap F19) |
| Manifest field set | `DECISIONS.md:466-475` | six copies (F14); `display_name` drift (F12) |
| Scope status values | `DECISIONS.md:23` | `scope-design.md:36`, root `scope.yaml:7` disagree (F11) |
| Planned scope inventory | `SCOPES_PLANNED.md` | root `scope.yaml` manifest |
| Current state | `ROADMAP.md` | `components/{orchestrator,scope}/TODO.md`, `runs/README.md` (paused) |

Roles of the remaining documents: local elaboration — `components/{scope,agent,orchestrator}/{MODEL,PLAN}.md`,
`components/scope/LEARNINGS.md`, `components/temporal-coordinator/PLAN.md`. Product artifacts — `skills/entropy-guard.md`,
`skills/session-kickoff.md`, `components/scope/skills/scope-design.md`, `components/agent/skills/role-design.md`.
Templates — `components/scope/template/`, `components/agent/template/`; drafts of an instance —
`components/orchestrator/scope/`, `roles/professional-presence-profile-editor/`. Historical — `archive/`,
`architecture/PICKUP.md`, `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`, `ORCHESTRATION.md` (redirect),
`runs/001-003`, `PI_AGENT_OVERVIEW.md`, `AUTH_OPTIONS_ANALYSIS.md`.

## Loop map

- **Documented:** session start reads `ROADMAP.md`, `MODEL.md`, `DECISIONS.md`, `components.yaml`, then component docs,
  then builds a current-state packet in the conversation and picks next work (`AGENTS.md:36-45`). Before commit, run
  `skills/entropy-guard.md` (`AGENTS.md:72`), which fixes what it finds and sends discussion items to `DECISIONS.md`
  (`:98`). Decisions go to `DECISIONS.md` or a component log; learnings only to `components/scope/LEARNINGS.md`; work
  is tracked in `ROADMAP.md`, `components/*/TODO.md`, and in July in `architecture/PICKUP.md`; run records carried
  their own pickup sections (`runs/001-moving-stillness-status/RUN.md:112`). Handoff: commit. No hooks, no CI.
- **Real:** commits are not available, so practice is read from documents only. The banners were added on top of this
  loop without changing it (F5): a fresh session following `AGENTS.md` reads a `ROADMAP.md` with no status and plans
  next work.

## Ranked risks

1. **Workflow drift (F5, F4).** Fires on every new session opened here; recovery means moving misplaced design work
   to `../personal-agent` or `../../scope`. Anchor: the banners.
2. **State dishonesty (F3, F6).** Already present; cheap to fix. Anchor: the banners and dated decisions.
3. **Superseded material and parallel truth (F7, F8, F9, F13).** Static now that the record is frozen, but costly for
   anyone using it as a reference, who must rebuild the chronology. Anchor: dated `DECISIONS.md` entries and
   `architecture/INDEX.md`.
4. **Lost decisions (F1, F2, F18).** The status change and its owner are recorded nowhere durable; this gets harder
   to recover with time. Anchor: `DECISIONS.md`.
5. **Unresolved conflicts carried forward (F10, F11, F12, F16).** Matter if patterns are promoted from here into
   `../../scope` or `../personal-agent`. Anchor: those repositories' decision logs (not covered).

Brittle automation: none; the repository has no scripts.

## Recommendations

- **Apply `settled.patch`.** It marks `README.md:9`, `README.md:43`, `AGENTS.md:8` and `AGENTS.md:12-14` as
  not current (F3), repoints `architecture/INDEX.md`'s pickup section (F4), and adds the status section to
  `ROADMAP.md` (F6). Each item was checked against the current file.
- **Demote, if Q1 is answered as recommended:** `provisional-q1.patch` marks `skills/entropy-guard.md` and
  `skills/session-kickoff.md` dormant and replaces the session-start steps in `AGENTS.md` (F5).
- **Record, if Q2 is answered as recommended:** `provisional-q2.patch` adds the reference-only decision to
  `DECISIONS.md` with the steward's date and attribution (F1, F2).
- **Consolidate nothing while reference-only.** F7–F13 and F16–F19 are recorded, not fixed: correcting a frozen record
  adds little, and the status section names the most misleading items. They become the cleanup list if the
  repository is reactivated, or the checklist when a pattern is promoted from it.

## State-file update

`ROADMAP.md` is the file read first (`AGENTS.md:38`), so it is updated in place rather than adding a summary
(`settled.patch`). The new "Status of this repository" section holds the stage and its source with the date read,
what to trust first, the misleading material nearby (F6, F7, F8), the open questions (Q1, Q2) and the next actions
(none authorised here). It says what makes it stale and who rewrites it.

## Guard surfaces

| Surface | Verdict |
|---|---|
| `skills/entropy-guard.md` | demote (provisional, Q1); F14 lists what an update would need |
| `skills/session-kickoff.md` | demote (provisional, Q1) |
| `AGENTS.md` (also `CLAUDE.md`, a symlink to it) | amend: status lines settled (F3); session start and pre-commit line provisional (F5) |
| `README.md` and `AGENTS.md` banners | keep; they are the control that matters, and prose (F15) |
| `ROADMAP.md` | amend (settled status section) |
| `architecture/INDEX.md` pickup section | amend (settled, F4) |
| `components/scope/template/AGENTS.md`, `components/orchestrator/scope/AGENTS.md` and their `CLAUDE.md` symlinks | keep (templates for scope repositories, not this loop) |
| Hooks, CI | none exist |

**Checks written against this repository's files,** for a guard if it is ever reactivated (Step 7.2):
- Parallel truth: if `RUNTIME.md`, `MODEL.md` or a component `MODEL.md` describes orchestration anatomy, does it link
  to the snapshot listed in `architecture/INDEX.md` instead of restating it?
- Local-global inversion: does a new `components/*/DECISIONS.md` entry hold only component-local choices?
- Superseded material: before reviving anything from `archive/`, `architecture/PICKUP.md`,
  `INTERFACE_REFINEMENT_PLAN.md` or a struck-through `DECISIONS.md` entry, check `DECISIONS.md` for its supersession.
- Stale references: for each "Resolves open question: X" added to `DECISIONS.md`, search the Markdown for X and fix
  mentions that still call it open.
- Lost decisions: did the session decide anything, including a change to this repository's status, that
  `DECISIONS.md` does not record?
- State dishonesty: does the `ROADMAP.md` status section still match the banners, `README.md:9` and `AGENTS.md:8`?
- Workflow drift: would a fresh agent following `AGENTS.md` "Session start" have done what this session did?
- Automation: only in-repo link resolution is stable enough to script; everything else stays judgment.

## Guard decision: `none`

No guard is generated or amended. The repository is reference-only, and both skills name `none` for that case,
finishing "with a correction or a demotion": the correction is `settled.patch`, and the demotion is
`provisional-q1.patch`, pending Q1. The generator's `none` branch is "stop. Report that no guard change is needed, and
why", so there is no handover and no integration step.

**Generator inputs,** as its "Inputs, and the guard decision" lists them, for the record:
- Steward: **unresolved** (F2; inferred Justin). Intent documents: `README.md` and `AGENTS.md` banners,
  `NORTH_STAR.md`, `DECISIONS.md`. Decision surface: `DECISIONS.md`, with component logs for local choices. Open intent
  questions: Q1, Q2.
- Current-state file: `ROADMAP.md`. Who refreshes it: **unresolved**; the status section says whoever changes the
  repository's status rewrites it.
- Rules owned elsewhere: none recorded in the repository; any user-wide instructions file is **not covered** by the
  snapshot.
- Verification commands: none; nothing runs by itself.
- Code areas: **inapplicable** (no code); the YAML templates are described by the component `MODEL.md` and
  `DECISIONS.md` files.
- Live operational state or spend: **inapplicable**; `runs/` records past runs only.
- Findings: F1–F19 above.

## Questions for the steward

Two, in `questions.md`: Q1, whether the session-start ritual and the guard stay in force while the repository is
reference-only; Q2, when and by whom the reference-only decision was made, and whether `DECISIONS.md` records it.

## Not covered, and uncertainties

- Git history: absent, so the enacted reading rests on dated documents only.
- Sibling repositories, and the 23 outgoing links: not read. Whether `../personal-agent` and `../../scope` hold what
  the banners say is unverified, as are F17's paths on disk.
- Read in part: `components/agent/skills/role-design.md` (first 60 lines and a search), `archive/scheduling-cronicle-
  investigation.md` (first 30 lines and a search), run outputs and `events.jsonl` files (opening lines).
- The banners' authority: used as the steward's directive by the repository's own precedence, though unattributed (F1,
  F2). If they were not the steward's decision, the lifecycle, the guard decision and every patch would change.
