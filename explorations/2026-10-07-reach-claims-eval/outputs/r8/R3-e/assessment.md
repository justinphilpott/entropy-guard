# Entropy assessment: agentic-architecture

Assessed 2026-10-07 by an agent following entropy-guard's skills as written (`entropy-assessment` v0.9.0,
`docs-first-planning-assessment` v0.3.0, `session-coherence-skill-generator` v0.5.0). The target is a read-only
snapshot of the `agentic-architecture` repository with no `.git` directory: 78 files plus 3 `CLAUDE.md` symlinks to
`AGENTS.md`. All of it was read except the body of `archive/scheduling-cronicle-investigation.md` (header and a
keyword search only) and the raw event streams (`runs/*/events.jsonl`, of which only counts, event types and prompts
were checked).

## Route and mode

- **Mode:** build. The target cannot be edited, so every change is delivered as a patch in `patches/` and nothing
  has been applied.
- **Route:**
  1. `entropy-assessment` Step 1 ran the intent pass (`intent-pass.md`, with `intent-change-rule.md`).
  2. Step 2 recorded the lifecycle as **reference-only** and the shape as **A, docs-first planning**.
  3. Route A ran `docs-first-planning-assessment` as a called skill, through its Steps 1 to 7.
  4. Control returned to `entropy-assessment` Step 3, which gave the guard decision **`none`**.
  5. `session-coherence-skill-generator` was read only for its input list. On `none` it stops, so no guard was
     generated, and `guards-integrator` was not reached.
- **Files produced:** this assessment; `questions.md`; `integration.md`; `read-log.md`; `patches/settled.patch`;
  and `patches/provisional-Q1.patch`, `provisional-Q2.patch` and `provisional-Q3.patch`.

## 1. Intent

### Steward

The repository does not say who its steward is (finding F-02). The evidence points to Justin:

- `components/orchestrator/scope/scope.yaml` line 6 records `steward: "justin"` for the root scope.
- `NORTH_STAR.md` line 3 describes "a personal agentic system".
- `runs/001-moving-stillness-status/RUN.md` line 41 refers to "Justin's ChatGPT Plus subscription".

This assessment treats Justin as the steward. That is an inference, not a recorded fact.

### Authorised intent, with sources

| Part | Statement | Source | Kind | Authority evidence |
|---|---|---|---|---|
| Status | "Reference-only. ... Do not treat decisions in this repository as current authority." Current Personal Agent architecture is in `../personal-agent`; the current Scope/Project model is in `../../scope`. | `README.md` 3-5 | status banner (directive) | neither attributed nor dated |
| Status | "no longer current architecture authority ... Do not extend or reinterpret this blueprint as current design without explicit authorization." | `AGENTS.md` 3-6 | status banner (directive) | neither attributed nor dated |
| Purpose | A personal agentic system that takes repetitive work off its owner. Design values: map over territory, deterministic where possible, structural guardrails. | `NORTH_STAR.md` | description | neither |
| Settled positions | 17 standing positions | `AGENTS.md` 12-34 | standing instruction | undated; most are backed by dated `DECISIONS.md` entries |
| Decisions | dated entries from 2026-02-27 to 2026-07-26 | `DECISIONS.md` | decision log | dated, not attributed |
| Anatomy | orchestration v1 | `architecture/INDEX.md` and `architecture/snapshots/2026-07-16-orchestration/ARCH.md` | decision (2026-07-16) | dated |

Missing attribution does not make the banners inferences (`intent-pass.md` section 1). They are the only record of the
status. I searched all 81 entries for "reference-only", "personal-agent", "no longer current" and "current
authority", and the only status statements are these two banners. No commit messages exist to search.

### Three readings

- **Declared.** The body text still describes a live design source. `README.md` 9 says "Bleeding-edge design source
  for the current named version". `AGENTS.md` 8 says "This repo holds the current architecture state". `ROADMAP.md`
  still lists "Working towards next".
- **Enacted.** The latest dated work is 2026-07-26: the pg-boss V0 decision (`DECISIONS.md` 836) and `PICKUP.md`
  being marked superseded. The run line was paused after Run 003 (`runs/README.md` 7-9). With no history, nothing
  shows work after the banners.
- **Authorised.** The banners say reference-only. The repository's own precedence lets them win over the body
  descriptions: a recorded directive outranks a description, and `AGENTS.md` 70 says "When older notes conflict with
  newer settled docs, the newer settled state wins". The banners are the newer statement because they name a
  successor that nothing else in the repository mentions.

### Gaps by condition

- **Stale description:**
  - F-03: entry points against the banners.
  - F-09 and F-10: prose and component notes against dated decisions.
- **Conflict:**
  - F-12: orchestrator access.
  - F-13: who owns open questions.
  - F-14: template ownership.
- **Missing:**
  - F-01: the status has no date and no `DECISIONS.md` record.
  - F-02: no named steward.
- **Ambiguous:**
  - Q2: what "reference-only" permits.
  - F-16: location.
- **Unauthorised drift:**
  - F-19: authentication route.
  - F-20: manifest fields.
- **Prose control:** F-09. "No stale docs" (`AGENTS.md` 26) is enforced only by a discipline-based guard, and two
  records cite the cleanup as done while stale text remains.

### The existing guard, read against the intent-change rule

`skills/entropy-guard.md` (generated 2026-04-02, last evaluated 2026-04-27):

- **Intent flag.** Line 79 says "If a component's status has changed, update components.yaml". The repair has no
  "only when explicitly instructed" condition, but `AGENTS.md` 71 requires one and so does `DECISIONS.md` 2026-03-31
  ("A component only appears in MODEL.md when explicitly promoted"). As written, the repair lets observed work elevate
  a component's status without the steward. (F-06)
- **Ownership flag.** Line 38 ("Is the scope manager consistently described across MODEL.md, RUNTIME.md, and
  components.yaml?"), and lines 39, 40 and 41 in the same form, keep several full descriptions of one concept in step.
  They do not reduce those descriptions to links to the concept's owner. Since 2026-07-16 the owner of anatomy is the
  snapshot (`DECISIONS.md` 855-861). (F-06)
- The guard does not carry the intent-change rule at all. (F-06)

### Questions

Four questions, written out in full with readings, cases and reasons in `questions.md`. Q1, Q2 and Q3 change what
gets built, and each has its own provisional patch. Q4 is a structural move that only the steward can authorise, and
has no patch.

- **Q1.** When was the reference-only status decided, so `DECISIONS.md` can record it as a dated decision?
  Recommended: record it with the steward's date and name.
- **Q2.** Is the repository frozen (corrections and historical marking only), or maintained as a coherent reference?
  Recommended: frozen.
- **Q3.** Do the templates in `components/*/template/` and the reference role in `roles/` remain the source for new
  work, or has another repository taken them over? Recommended: the scope template's source is `../../scope`; the
  steward names the home of the role and binding template.
- **Q4.** Does the repository stay in `~/pro/agentic/` or move to `~/pro-archive/`? Recommended: stay for now.

### Proposed changes, and where they are recorded

No change of authorised intent is proposed. The settled patch records the four questions as open in `DECISIONS.md`'s
Open Questions under "About this repository's status", the decision surface this repository names (`AGENTS.md` 28).
It does not answer them. The provisional patches record the answers as dated decisions in the same file, once the
steward gives them.

## 2. Lifecycle, shape and repositories

- **Lifecycle: reference-only.** The evidence is the two banners (`README.md` 3-5, `AGENTS.md` 3-6), which carry no
  date or attribution (F-01). This status limits what the route recommends: corrections, demotion and historical
  marking, not new design.
- **Shape: A, docs-first planning.** The evidence:
  - There is no implementation code. The YAML files are templates and a scope draft.
  - Markdown carries state: `DECISIONS.md`, `ROADMAP.md`, the component `TODO.md` and `PLAN.md` files, and
    `architecture/PICKUP.md`.
  - Work ran in repeated agent sessions, through the `AGENTS.md` "Session start" steps, `skills/session-kickoff.md`,
    and the "Pickup — start here next session" section of Run 001.
  - No other shape fits better. B and C need meaningful code. D does not fit because the workflow surface serves the
    documents.
- **Repositories:** the wider system spans several:
  - this repository;
  - `../personal-agent`, the successor named in the banners;
  - `../../scope`, which holds the Scope implementation and the current Scope/Project model;
  - `../temporal-coordinator`, the implementation (`components.yaml` 29);
  - `../agentic-architecture-distribution`, the Level 2 source;
  - the scope repositories in `~/scopes/`.

  This run's rules allowed reading only this repository, so the others are not assessed. That is the largest coverage
  gap (section 13). This repository's only remaining job is to be consulted, and the cross-repository risk that
  matters is a successor treating it as authority.

## 3. Findings

One list. Severity is the risk of misleading a reader or agent who consults this reference-only repository.
"Handling" names the patch hunk, the steward question, or "recorded" (no change proposed here).

| ID | Sev. | Condition / risk | Finding and evidence | Handling |
|---|---|---|---|---|
| F-01 | high | Missing; lost decision | The reference-only status exists only in the banners (`README.md` 3-5, `AGENTS.md` 3-6). It has no date, no attribution and no `DECISIONS.md` entry. The repository's own rule resolves conflicts by "dated decisions" (`AGENTS.md` 25, `DECISIONS.md` 869), so an undated status cannot take part in that rule. | Settled: recorded as an open question. Q1, `provisional-Q1.patch`. |
| F-02 | low | Missing | No file names this repository's steward. The inference (Justin) is in section 1. | `provisional-Q1.patch` names the steward in the decision entry. |
| F-03 | high | Stale description | Entry-point text contradicts the banners: `README.md` 9 ("Bleeding-edge design source for the current named version"); `AGENTS.md` 8 ("holds the current architecture state"); `AGENTS.md` 14 ("These are the current settled positions"); `README.md` 43 (the scope repository's "design docs live in components/scope/", against the banner's "current generic Scope/Project model lives in scope"). | Settled patch. |
| F-04 | high | Workflow drift | The documented loop drives new work in a reference-only repository. `AGENTS.md` 36-45 sends a fresh session to learn "what's being worked towards" and to build "the 1-3 most plausible next actions". `skills/session-kickoff.md` Step 4 (lines 84-88) says to "recommend the best next action". The banner forbids extending the blueprint without explicit authorization. Claude Code loads this loop first, because `CLAUDE.md` is a symlink to `AGENTS.md`. | Settled patch: a reference-only gate in both files. |
| F-05 | medium | Workflow drift | Several instructions keep the repository on a maintained loop. `AGENTS.md` 72 mandates running `skills/entropy-guard.md` before non-trivial commits. The guard runs "At the start of an architecture session" (line 18), requires `ROADMAP.md` to reflect current work (line 32), and adds open questions to `DECISIONS.md` (line 98). `AGENTS.md` 65-66 asks for `MODEL.md`, `components.yaml` and `MANIFEST.md` to be kept current. | Q2, `provisional-Q2.patch` (demote). |
| F-06 | medium | Repair paths (intent pass §1) | Intent flag: guard line 79. Ownership flag: guard lines 38-41. The guard has no intent-change rule. Details in section 1. | Recorded. If Q2 is answered "maintained", these become the `update` amendments (section 12). |
| F-07 | low | Guard copies state | Guard line 7 (`system_snapshot`) copies current state into the guard and is now wrong. It says "Sol 0.1" and "Open questions reduced from 22 to 11"; the registry holds 13 (7 open, 6 deferred, `DECISIONS.md` 881-896). It predates the snapshot decision of 2026-07-16 and the V0 decision of 2026-07-26. | Recorded (same as F-06). |
| F-08 | medium | Superseded material nearby | `architecture/INDEX.md` 15-17 headed "Current Pickup" sends readers to `PICKUP.md` for "Next architecture work", but `PICKUP.md` line 3 says "Status: superseded historical pickup point (2026-07-26)". | Settled patch. |
| F-09 | medium | Stale description; prose control | Superseded anatomy survives in prose that the record says was cleaned. `RUNTIME.md` 67 says "Runtime gateway (unified for v0)" and line 82 "unified sandbox gateway"; the unified gateway was superseded on 2026-07-16 (`DECISIONS.md` 575; `AGENTS.md` 32). `PI_AGENT_OVERVIEW.md` 99 says "External due-event scheduler invoking Pi or the scope manager"; `DECISIONS.md` 826 says the scope manager is never the temporal coordinator's consumer, and V0 has no consumer (2026-07-26). Meanwhile `PICKUP.md` 15 says the "Hygiene pass is complete" and `DECISIONS.md` 826 says the coupling "has been swept out". The "No stale docs" rule (`AGENTS.md` 26) has no enforcement beyond a discipline-based guard (guard line 114), and the guard's keep-in-step checks (F-06) did not catch these. | Settled patch for `RUNTIME.md` 67 and 82 and `PI_AGENT_OVERVIEW.md` 99. Enforcement recorded, not built (section 7). |
| F-10 | medium | Local-global inversion; stale | Component notes restate questions that the 2026-04-27 decisions resolved: `components/agent/DECISIONS.md` 12 ("still open questions"); `components/orchestrator/DECISIONS.md` 13 ("mechanism TBD"); `components/orchestrator/PLAN.md` 28-29 ("format TBD", "whatever mechanism is chosen"); `components/orchestrator/MODEL.md` 25 and 40 (the orchestrator asks to "provision workspace"/"assemble a workspace", against "Workspace lifecycle is transparent to the orchestrator", `DECISIONS.md` 639-650); `components/scope/skills/scope-design.md` 155 ("Skill injection is an open question", against `DECISIONS.md` 674-678). | Settled patch. Each is corrected only as far as its decision reaches; for example, the open part of `scope-design.md` 155 is kept. |
| F-11 | medium | State dishonesty | `ROADMAP.md` 36-37, 54, 58 and 63 list as open questions that `DECISIONS.md` 2026-04-27 records as resolved (551-559, 622-635, 639-650). `ROADMAP.md` 56 restates the 2026-07-03 "due-event trigger layer" framing, superseded on 2026-07-26 (`DECISIONS.md` 743-746). | Settled patch: listed in the `ROADMAP.md` status block. The checklist itself is left as it stood. |
| F-12 | high (for successors) | Conflict on a privacy boundary | One side says "no secrets and no scope repo access": `DECISIONS.md` 2026-04-06 (370-376, not marked superseded); `AGENTS.md` 30; `RUNTIME.md` 88; `components/orchestrator/MODEL.md` 27-33; guard line 39. The other says the orchestrator's "authority (scope access, secret reach, tool reach, autonomy) is mode-tunable": `MODEL.md` 78 and `components.yaml` 20, with the snapshot's invariant at `ARCH.md` 68 and its mode `personal-local-open`, "Broad access" (`ARCH.md` 56). No `DECISIONS.md` entry mentions mode-tunable authority (searched for "mode"). Both readings are presented; neither is corrected. Newer prose does not authorise weakening a prescribed boundary (intent-change rule, item 6). | Recorded. Named in the `ROADMAP.md` status block. Not asked, because under the recommended Q2 nothing is built here. |
| F-13 | medium | Conflict; parallel truth | `DECISIONS.md` claims to be the "canonical registry" for open questions (305-309, 877; `AGENTS.md` 28), but the snapshot's "Under Review" also claims to be the "source of truth for the domain" (`ARCH.md` 72; `SCHEMA.md` 78; anatomy includes "under review", `INDEX.md` 3). No decision settles which wins. Question text is duplicated outside the registry: `scope-design.md` 159-164 and `components/scope/TODO.md` 42-43 restate deferred items 894-895. `components/orchestrator/MODEL.md` 86 and `SCOPES_PLANNED.md` 30 cite a registry question that is not in the registry; it is the "direction set" decision at `DECISIONS.md` 666-670. `AUTH_OPTIONS_ANALYSIS.md` 246-251 keeps architectural questions outside the registry. | Recorded. The conflict is named in the `ROADMAP.md` status block. |
| F-14 | medium | Conflict | `AGENTS.md` 19 says `components/{name}/template/` "is the single source", and `components/scope/skills/scope-design.md` 122 says to copy `components/scope/template/`. The banner says the current Scope/Project model lives in `../../scope`. Five planned scopes are not yet instantiated (`SCOPES_PLANNED.md`), and a new one would be scaffolded from this copy. | Q3, `provisional-Q3.patch`. |
| F-15 | low | Parallel truth ("update both") | `roles/professional-presence-profile-editor/` was copied into the live scope repository (Run 002 `RUN.md` 109-118). Run 002 line 241 says "Tightening the CV boundary required updating both the live copied role and the architecture repo reference role." | Q3, `provisional-Q3.patch`: marks this copy as a dated reference and names the live role as owner. |
| F-16 | low | Ambiguous | `DECISIONS.md` 176 says "`~/pro-archive/` holds completed/superseded projects". The banners say the current architecture lives elsewhere, but they use "reference-only", not "superseded", and the repository remains in `~/pro/agentic/`. | Q4. No patch: a move is a structural change for the steward. |
| F-17 | low | Stale references | `components.yaml` 35 and 51-81 give `../scope`, `../library`, `../seed`, `../entropy-guard`, `../entropy-immune-system`, `../git-sync`, `../flowbook` and `../flowvoice`. From `~/pro/agentic/agentic-architecture` those resolve under `~/pro/agentic/`, but `DECISIONS.md` 176-178 puts tools and apps in `~/pro/` and the scope implementation at `~/pro/scope/`. `SCOPES_PLANNED.md` 71 and `README.md` 43-50 agree with the decision. `MODEL.md` 3 names a "pro-agentic directory" that the layout no longer has. `../temporal-coordinator` (line 29) is not covered by the layout decision and is left unchanged. | Settled patch. I did not check whether those directories exist; they are outside the target. |
| F-18 | low | Stale references | `README.md` navigation (16-35) omits `components/temporal-coordinator/`, a component catalogued "in-progress" (`components.yaml` 26-30). `AGENTS.md` "Key files" (92-115) also omits it, along with `architecture/`, `runs/`, `RUNTIME.md`, `SCHEDULING.md` and `SCOPES_PLANNED.md`. | Settled patch for `README.md` only. `AGENTS.md` key files recorded. |
| F-19 | medium | Unauthorised drift; lost decision | `AUTH_OPTIONS_ANALYSIS.md` 10-16 holds an undated "Current Working Decision" ("direct API-key auth ... no subscription-auth plumbing yet") outside `DECISIONS.md`. All three runs used the ChatGPT Plus/Pro (Codex) subscription through Pi's own `/login` (Run 001 `RUN.md` 41; Run 002 `RUN.md` 33, 140, 218). That also contradicts the document's premise that "Pi is not, by itself, the auth answer" (176-177). Line 8, "not a commitment to ... Pi", predates or ignores `DECISIONS.md` 2026-04-28; which came first is not recorded. | Recorded. The runs do not authorise rewriting the working decision, and the banner says current architecture, which includes model access, now lives in `../personal-agent`. |
| F-20 | low | Unauthorised drift | `components/orchestrator/scope/scope.yaml` 14 and 28 add `display_name` to `kind: scope` manifest entries, and `components/scope/template/scope.yaml` 20-22 tells authors to. But `DECISIONS.md` 475 says "Additional manifest fields should not be added until routing or auditing proves they are needed", and the manifest field set is fixed at 345 and in `AGENTS.md` 30. | Recorded. |
| F-21 | low | State dishonesty (evidence record) | Run 003 `RUN.md` 53 says the compact stream has "19 events, 44 KB". The committed `events.jsonl` has 25 events and 78,595 bytes (counted 2026-10-07; its prompt matches `input.md`). Line 66 shows Run 003 reused Run 002's clone rather than a fresh one. | Settled patch for the count. |
| F-22 | low | Parallel truth | The `root-general` naming decision is recorded in full twice: `DECISIONS.md` 489-500 and `components/orchestrator/DECISIONS.md` 18-29. That file's own line 5 says not to duplicate. | Recorded. |
| F-23 | low | Superseded material nearby | The `archive/scheduling-cronicle-investigation.md` header (3-8) says `SCHEDULING.md` retains "any external scheduler is at most a backend clock/delivery detail behind the adapter boundary". `SCHEDULING.md` now says pg-boss owns eligibility and V0 has no adapter (3-5, 41-43). The file is clearly marked archived. | Recorded. |

## 4. Truth map

Document roles (docs-first Step 2):

| Role | Documents |
|---|---|
| Canonical | `README.md` and `AGENTS.md` (status banners, orientation, standing positions); `NORTH_STAR.md`; `MODEL.md`; `DECISIONS.md`; `architecture/INDEX.md` with the current snapshot; `components.yaml`; `MANIFEST.md`; `components/temporal-coordinator/SPEC.md` (the TC contract, per `DECISIONS.md` 2026-07-26) |
| Current state | `ROADMAP.md` (read first); `components/scope/TODO.md`; `components/orchestrator/TODO.md`; the component `PLAN.md` files; `runs/README.md` |
| Local elaboration | `components/*/MODEL.md` and `components/*/DECISIONS.md`; `components/scope/LEARNINGS.md`; `RUNTIME.md`; `SCHEDULING.md`; `SCOPES_PLANNED.md` |
| Product artifact | `skills/session-kickoff.md`; `skills/entropy-guard.md`; `components/scope/skills/scope-design.md`; `components/agent/skills/role-design.md`; `components/orchestrator/scope/**` (including the `WORKFLOW.md` standing instructions); `roles/**` |
| Template | `components/scope/template/**`; `components/agent/template/**`; `architecture/SCHEMA.md`; `architecture/LANGUAGE.md` |
| Research | `PI_AGENT_OVERVIEW.md`; `AUTH_OPTIONS_ANALYSIS.md` |
| Historical | `architecture/PICKUP.md`; `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`; `archive/`; `ORCHESTRATION.md` (a redirect); `runs/00*/` (evidence); superseded `DECISIONS.md` entries |

Each concept's single home, and where else it appears:

| Concept | Home | Also stated in | State |
|---|---|---|---|
| Repository status | should be `DECISIONS.md`; today only the banners | `README.md` 3-5, `AGENTS.md` 3-6 | no owner record (F-01) |
| Purpose and values | `NORTH_STAR.md` | `README.md` summary | sound |
| Five-layer model | `MODEL.md` | `RUNTIME.md` (a projection of layers 3-5); `DECISIONS.md` 131 (the why) | sound; the projection is allowed |
| Orchestration anatomy | the snapshot via `INDEX.md` (since 2026-07-16) | full restatements in `RUNTIME.md` 57-90, `MODEL.md` 76-90, `AGENTS.md` 30-34, `components.yaml` roles | restatements drift (F-09, F-12) |
| Orchestrator access | contested | see F-12 | conflict |
| Decisions | `DECISIONS.md` (system); `components/*/DECISIONS.md` (local) | `root-general` recorded twice (F-22); a working decision in `AUTH_OPTIONS_ANALYSIS.md` (F-19) | mostly sound |
| Open questions | contested: the `DECISIONS.md` registry against the snapshot's "Under Review" | duplicates in skills, TODOs, `MODEL.md` (F-13) | conflict |
| Component status | `components.yaml` | `MODEL.md`, `ROADMAP.md` | depends on Q2 |
| Current state and next work | `ROADMAP.md` | component TODO and PLAN files, `PICKUP.md` (superseded), `runs/README.md` "Pickup Later" | `ROADMAP.md` is out of date (F-11) |
| Scheduling contract | `components/temporal-coordinator/SPEC.md` | summaries in `SCHEDULING.md`, `RUNTIME.md`, `MODEL.md`; `PI_AGENT_OVERVIEW.md` (stale, F-09) | sound except F-09 |
| Scope schema and template | `components/scope/template/` (declared single source) | `components/scope/MODEL.md`; banner points the model to `../../scope` | Q3 (F-14) |
| Role and binding template; reference role | `components/agent/template/`; `roles/` | the live copy in the scope repository | Q3 (F-15) |
| Repository layout | `DECISIONS.md` 2026-04-04 | `components.yaml` paths, `README.md` table | `components.yaml` is wrong (F-17) |

## 5. Loop map

- **How a session starts.** Claude Code loads `CLAUDE.md`, a symlink to `AGENTS.md`. Pi also auto-loads `AGENTS.md`
  (Run 001 `RUN.md` 74). The banner is the first thing read. The "Session start" steps then send the session to
  `ROADMAP.md`, `MODEL.md`, `DECISIONS.md` and `components.yaml`, and on to the kickoff packet, which is built in
  conversation and not saved.
- **Where work was tracked:**
  - `ROADMAP.md`, which was maintained: line 19 is dated by Run 002 to 2026-05-13, and line 38 reflects the
    2026-07-26 decision;
  - the component TODO files;
  - `architecture/PICKUP.md`, the real pickup queue, which `INDEX.md` called "Current Pickup" but `AGENTS.md`'s
    session start never names;
  - the "Pickup — start here next session" sections of the run records.
- **When decisions and learnings were captured.** Decisions went into dated `DECISIONS.md` entries. Learnings went
  into `components/scope/LEARNINGS.md` and the "Findings" of each run; Run 001's findings still await promotion
  (`components/orchestrator/TODO.md` 16).
- **Handoff.** At commit, with the existing guard run by discipline (`AGENTS.md` 72). There is no evidence of pull
  requests and no history.
- **The loop the repository needs now.** Consultation: a reader, possibly arriving from `../personal-agent` or
  `../../scope`, needs to learn quickly what was decided here and must not treat it as current. The documented loop
  still serves building (F-04, F-05). That gap is the main risk.

## 6. Ranked risks

| # | Risk | Findings | Decay rate | Recovery cost | Symptoms seen | Anchor for the fix |
|---|---|---|---|---|---|---|
| 1 | Workflow drift on entry: a fresh session follows the start-up loop and extends a superseded blueprint, or treats it as authority | F-03, F-04, F-05 | immediate, every new session | high: work lands in the wrong repository and the decisions diverge from `../personal-agent` | session start and the kickoff skill ask for next actions; the guard is mandated on commit | the banners |
| 2 | Superseded material presented as current | F-08, F-09, F-11, F-23 | static while the repository is untouched, but every read misleads | medium | a "Current Pickup" that points at a superseded plan; "unified gateway"; a scheduler invoking the scope manager; resolved roadmap items still open | `DECISIONS.md` 2026-07-16 and 2026-07-26; `PICKUP.md` status line |
| 3 | The status decision that governs every reader is unrecorded | F-01, F-02, F-16 | grows as the successors move on | low now (one answer), higher later | no date; no `DECISIONS.md` entry; no named steward | `DECISIONS.md` |
| 4 | Contested boundaries that a successor may import | F-12, F-13, F-14, F-15 | slow | high if the weaker reading of a privacy boundary is copied | two readings of orchestrator access; two owners of open questions; two template sources; "update both" for the role | `DECISIONS.md` 2026-04-06 against snapshot v1 (unsettled); the banners |
| 5 | Stale references | F-17, F-18, F-21 | fast for paths | low | wrong relative paths; missing navigation; a run count that disagrees with its file | `DECISIONS.md` 2026-04-04; the committed files |

## 7. Recommendations

The lifecycle limits these to correcting, demoting and marking material historical.

- **Correct the entry points now** (settled patch). Make `README.md`, `AGENTS.md`, `skills/session-kickoff.md` and
  `architecture/INDEX.md` say what the banners say, and gate the session-start loop and the kickoff skill so they
  orient a reader rather than pick work (F-03, F-04, F-08).
- **Bring the state file up to date as a demotion block** (settled patch). `ROADMAP.md` is read first, so it gets a
  status block: the stage, what to trust, where the open questions live, what is out of date or contested, and when
  the block goes stale. The checklist under it stays as it stood (section 9).
- **Correct the stale descriptions that dated decisions settle**, limited to the files a consulting reader is most
  likely to open (F-09, F-10, F-17, F-18, F-21). Each correction cites its decision.
- **Record the status as a decision** once the steward gives the date (Q1, `provisional-Q1.patch`).
- **Demote the existing guard and the maintenance practices** if the steward chooses "frozen" (Q2,
  `provisional-Q2.patch`).
- **Mark the templates and the reference role as dated copies**, and point scaffolding at their owner (Q3,
  `provisional-Q3.patch`).
- **Do not do these here:**
  - resolve F-12 or F-13;
  - reduce `RUNTIME.md`'s anatomy to links;
  - rewrite `AUTH_OPTIONS_ANALYSIS.md`;
  - remove the `display_name` fields;
  - build enforcement for "No stale docs".

  Each is new design in a repository the banner says is not current. If the steward wants any of them, they belong to
  the successor repositories. F-12 is the one to carry there first, because it is a privacy boundary.

## 8. Proposed changes

### Settled patch: `patches/settled.patch`

The patch touches 16 files. No hunk edits an open question's text or states its answer; the one hunk that adds the
four questions to `DECISIONS.md` records them as open. On 2026-10-07 it applied cleanly to the snapshot with
`git apply -p1` and reproduced the intended tree exactly.

| File | Change | Finding | Evidence that settles it |
|---|---|---|---|
| `ROADMAP.md` | status block (the state-file update) | F-11, risks 1-4 | banners; `DECISIONS.md` dates |
| `README.md` | line 9 made reference-only; `personal-agent` row added; the `scope` row says it holds the current model; `components/temporal-coordinator/` added to navigation | F-03, F-18 | banner |
| `AGENTS.md` | line 8 and line 14 brought into line with the banner; reference-only gate before "Session start"; line 45 conditioned on the gate | F-03, F-04 | banner |
| `skills/session-kickoff.md` | reference-only gate; Step 4 no longer recommends next work without authorization | F-04 | banner |
| `architecture/INDEX.md` | "Current Pickup" becomes "Former Pickup" | F-08 | `PICKUP.md` 3; banner |
| `RUNTIME.md` | lines 67 and 82: "unified" becomes seams behind a single perimeter | F-09 | `DECISIONS.md` 575; `AGENTS.md` 32 |
| `PI_AGENT_OVERVIEW.md` | line 99: V0 enqueues with no production consumer; what invokes Pi is not specified | F-09 | `DECISIONS.md` 826 and 836-851; `SCHEDULING.md` |
| `components/agent/DECISIONS.md` 12, `components/orchestrator/DECISIONS.md` 13, `components/orchestrator/PLAN.md` 28-29, `components/orchestrator/MODEL.md` 25 and 40, `components/scope/skills/scope-design.md` 155 | resolved questions cited as resolved | F-10 | `DECISIONS.md` 551, 612, 622, 639, 674 |
| `components.yaml`; `MODEL.md` 3 | repository paths follow the layout | F-17 | `DECISIONS.md` 176-178 |
| `runs/003-.../RUN.md` 53 | event count recounted | F-21 | the committed file |
| `DECISIONS.md` Open Questions | the registry's claim scoped to this repository; the four status questions recorded as open | F-01, F-13 | banner |

### Provisional patches, one per question

Do not apply any of these until the steward answers its question. Each is written for the recommended answer, and
each fills `<DATE>`, `<STEWARD>` and, for Q3, `<HOME NAMED BY STEWARD>` from the steward's answer. Each applies on top
of the settled patch, alone or with the others in any order, using `patch -p1`, and every order gives the same tree.
`git apply` works in the order Q1, Q2, Q3. All of this was verified on 2026-10-07.

| Patch | Question | What it changes |
|---|---|---|
| `provisional-Q1.patch` | Q1 | adds the dated "This repository is reference-only" entry at the top of `DECISIONS.md`, naming the steward (F-01, F-02); removes Q1 from Open Questions; cites the entry in both banners |
| `provisional-Q2.patch` | Q2 (frozen) | demotes `skills/entropy-guard.md` with a header note; replaces the `AGENTS.md` 72 mandate; prefixes the `AGENTS.md` "Working practices" with a frozen note; updates `skills/README.md`; adds a `components.yaml` header and a `ROADMAP.md` "Frozen" bullet; adds a `DECISIONS.md` entry; removes Q2 (F-05) |
| `provisional-Q3.patch` | Q3 | marks `components/*/template/` and `roles/` as dated reference copies; points `AGENTS.md` 19, `components/scope/MODEL.md` 81, `scope-design.md` 122 and `components/agent/MODEL.md` 84 and 121 at the new source; annotates the template decision in `DECISIONS.md`; removes Q3 (F-14, F-15) |

Q4 has no patch.

## 9. State-file update

`ROADMAP.md` is the current-state file: it is step 1 of `AGENTS.md`'s session start. There is no root `TODO.md` or
`STATE.md`, so no competing file was added. Because the lifecycle is reference-only, the update is a status block at
the top of `ROADMAP.md`, not a refresh of the checklist. It holds the items docs-first Step 5 asks for:

- the stage;
- what to trust first;
- the open questions, by link to `DECISIONS.md`, because the repository's own rule keeps question text there
  (`AGENTS.md` 28);
- misleading material nearby, marked "not exhaustive";
- one next action;
- what makes the block stale, and who refreshes it.

Every claim in it carries the check date (2026-10-07) and its source. It states no answer to Q1-Q4. The block is in
`patches/settled.patch`.

## 10. Guard surfaces

| Surface | Kind | Classification | Reason |
|---|---|---|---|
| `skills/entropy-guard.md` | guard | demote (provisional on Q2) | It runs a maintained-repository loop (F-05), carries copied state (F-07) and has unsound repair paths (F-06). If Q2 is answered "maintained", it is amended instead (section 12). |
| `AGENTS.md` (loaded as `CLAUDE.md`) | instruction file | amend | Settled: status consistency and the session-start gate. Provisional on Q2: the working practices and the guard mandate. Provisional on Q3: template source. |
| `skills/session-kickoff.md` | instruction file | amend (settled) | the reference-only gate |
| `README.md` | instruction file | amend (settled) | F-03, F-18 |
| `architecture/INDEX.md` | instruction file | amend (settled) | F-08 |
| `skills/README.md` | instruction file | amend (provisional on Q2) | describes the guard as running |
| `components/scope/template/`, `components/agent/template/` | templates | keep until Q3, then mark | F-14 |
| `components/scope/skills/scope-design.md`, `components/agent/skills/role-design.md` | product artifacts | amend: line 155 settled, line 122 on Q3; `role-design.md` keep | F-10, F-14 |
| `runs/README.md` | handoff note | keep | The run line is already paused (lines 7-9), and the `AGENTS.md` gate covers its "Pickup Later" section. |
| Hooks, CI | none exist | none | Nothing executes. Every surface here is judgment. |

## 11. Docs-first checks, written against this repository

These are the matrix checks (docs-first Step 7.2) applied to this repository's actual files. Under the recommended
Q2 answer ("frozen"), someone making a correction runs them by hand, as judgment. If the answer is "maintained", they
are the content of the guard update.

| Matrix risk | Check |
|---|---|
| Parallel truth | If a change touches orchestrator access, scope-manager anatomy or open-question text, does every non-owner (`MODEL.md`, `RUNTIME.md`, `components.yaml`, the component `MODEL.md` and `DECISIONS.md` files) link to the owner (the snapshot via `architecture/INDEX.md` for anatomy; `DECISIONS.md` for decisions) rather than restate it? |
| Local-global inversion | If a component's `DECISIONS.md` or `MODEL.md` changed, does its "inherited constraints" list still match root `DECISIONS.md`? |
| Superseded material nearby | Before reviving a concept named in a superseded entry (the unified gateway, the due-event trigger layer, Core/Egress, `EventSink`, the tick, `workflows.yaml`, the root scope named `root`, `~/scope/`), check `DECISIONS.md` and the `PICKUP.md` and `INTERFACE_REFINEMENT_PLAN.md` status lines for its supersession. |
| Stale references | If a path or name changed, search for the old one, and check the repository paths in `components.yaml` against `DECISIONS.md` 2026-04-04. |
| Lost decisions | Did this change settle a choice? Record it, dated, in `DECISIONS.md`. Choices about this repository's status go under "About this repository's status". |
| State dishonesty | Does the `ROADMAP.md` status block still agree with the banners and with `DECISIONS.md`? |
| Workflow drift | Would a fresh agent following `AGENTS.md` "Session start" pick work here? It must stop at the reference-only gate. |
| Brittle automation | None exists; none is recommended. |

## 12. Guard decision and the generator's inputs

**Guard decision: `none`.** The lifecycle is reference-only. `entropy-assessment` Step 3 gives `none` for a
reference-only system, "which may finish with a correction or a demotion", and docs-first Step 7.3 agrees. The
correction is the settled patch. The demotion of the existing guard is `provisional-Q2.patch`. No guard is generated,
so there is no `guard/SKILL.md`.

If the steward answers Q2 "maintained", the decision becomes **`update`**. The existing guard would be amended in
place to the generator's contract:

- add the intent-change rule (version 2);
- remove `system_snapshot` (F-07);
- make the line 79 repair conditional on explicit instruction (F-06);
- replace the keep-in-step checks with owner-and-link checks (F-06);
- add the section 11 checks.

The generator's inputs, from its "Inputs, and the guard decision" section:

- **Steward:** Justin, inferred and not recorded (F-02); unresolved until Q1.
- **Documents holding authorised intent:** the banners in `README.md` and `AGENTS.md`; `NORTH_STAR.md`; the
  `AGENTS.md` settled positions (12-34); `DECISIONS.md`; `architecture/INDEX.md` with the current snapshot.
- **Decision surface:** `DECISIONS.md` for the system; `components/*/DECISIONS.md` for components.
- **Open intent questions:** Q1-Q4 (`questions.md`).
- **Current-state file:** `ROADMAP.md`. Who refreshes it is unresolved (Q2); under "frozen", whoever records a steward
  answer.
- **Rules the repository is bound by but does not own:** none are referenced in the target. Nothing outside the
  target was checked.
- **Verification commands:** none. There is no build, test, script, hook or CI, and nothing runs by itself.
- **Code areas and the docs and tests that describe them:** not applicable; the repository holds no implementation.
  Implementations live in `../temporal-coordinator` and `../../scope`, which were not read.
- **Live operational state or spend a session can change:** none in this repository. The run procedures
  (`runs/*/RUN.md`) invoke Pi against a ChatGPT subscription and local scope repositories, but the line is paused.
- **Findings by id:** F-01 to F-23.

## 13. Uncertainties and what was not covered

- **No history.** Without `.git`, the enacted reading rests on dated entries and run records. When the banners were
  added, and whether anything changed after them, is unknown.
- **Sibling repositories not read** (this run's rules):
  - `../personal-agent`, `../../scope`, `../temporal-coordinator`, `../agentic-architecture-distribution`, the scope
    repositories, and the targets of the repository paths in `components.yaml`.
  - So I could not check whether they link here, whether they adopted or replaced these decisions, where the
    templates live now, or whether F-12 carried over.
  - The `components.yaml` path corrections follow the recorded layout, not a check of the disk.
- **The steward is inferred** (F-02).
- **`../temporal-coordinator`** is left as written. `components/temporal-coordinator/PLAN.md` 4 and
  `INTERFACE_REFINEMENT_PLAN.md` 7 agree with it, and the layout decision does not name it.
- **Two home directories** appear in the run records (`/home/justin/...` and `/home/justin-philpott/...`), probably
  two machines. Not assessed.
- **Not read in full:** the body of `archive/scheduling-cronicle-investigation.md`, and the contents of the event
  streams.

## 14. Notes for entropy-guard

These are places where the skills left a step implicit, in ways other runs would hit. This run was not in the
entropy-guard repository, so they are noted here rather than filed.

1. **Docs-first Step 5 on a reference-only repository.** "Bring the current-state file up to date" sits awkwardly
   with `none` for reference-only systems. It is unclear whether to refresh the state or demote it. I demoted it: a
   status block, with the checklist left as it stood.
2. **Whether recording a question touches it.** The rule's text ("a change touches one if it edits the question's
   text") does not say whether adding a new question to the target's decision surface as open counts. I treated
   recording it as open as not touching it.
3. **A banner with no attribution.** The "Stale description" row needs "a later recorded steward decision". The intent
   pass counts a status banner as a directive even without attribution, but does not say whether it can serve as that
   later decision. I used the repository's own precedence (`AGENTS.md` 70), and asked only for the record's date
   (Q1).
4. **Demoting an existing guard under `none`.** This changes the loop, but the route reaches `guards-integrator` only
   through `create` or `update`, so the demotion gets no adoption check.
