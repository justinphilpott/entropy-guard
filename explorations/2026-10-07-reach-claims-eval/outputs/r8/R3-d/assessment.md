# Entropy assessment: agentic-architecture

- **Assessed:** 2026-10-07, from a read-only snapshot with no `.git` directory. Line numbers refer to that snapshot.
- **Skills used:** entropy-guard's `entropy-assessment` (v0.9.0), its `intent-pass.md` and `intent-change-rule.md` (v2), and
  `docs-first-planning-assessment` (v0.3.0), run as a called skill. I also read the "Inputs, and the guard decision"
  section of `session-coherence-skill-generator` (v0.5.0).
- **Mode:** build, as the caller asked. The target cannot be edited, so every change is delivered as a patch.
- **Route taken:** the repository is **reference-only**, and its shape is **A, docs-first planning**. Docs-first
  analysis ran through Step 7. The guard decision is **`none`**, finishing with a correction and a demotion. Because
  the decision is `none`, nothing is handed to the generator or the integrator, and no guard was generated.

## Contents

1. Intent
2. Lifecycle, shape and repositories
3. Findings (the one list; other sections refer to these ids)
4. Truth map
5. Loop map
6. Ranked risks
7. Recommendations
8. One-time cleanup
9. State-file update
10. Guard surfaces and the checks for this repository
11. Guard decision and the generator's inputs
12. Questions for the steward
13. What was not covered, and uncertainties
14. Files delivered

---

## 1. Intent

### Steward

No file in the repository says who decides what it is for (F6). **The steward is inferred to be Justin Philpott**,
and this is an inference, not a recorded fact. It rests on three things:
- the root scope draft names `steward: "justin"` (`components/orchestrator/scope/scope.yaml:6`, and
  `SCOPES_PLANNED.md:12`);
- the repositories it points at are under the GitHub account `justinphilpott` (`components/orchestrator/scope/scope.yaml:18`);
- run 001 was paid for through "Justin's ChatGPT Plus subscription" (`runs/001-moving-stillness-status/RUN.md:41`).

### Authorised intent, with sources

Each statement below gives its kind and its evidence of authority, which are recorded separately.

| Part | Where | Kind | Authority |
|---|---|---|---|
| **Lifecycle:** reference-only. Current Personal Agent architecture lives in `../personal-agent`; the current Scope and Project model lives in `../../scope`. "Do not extend or reinterpret this blueprint as current design without explicit authorization." | `AGENTS.md:3-6`; `README.md:3-5` ("Do not treat decisions in this repository as current authority") | Directive (a status banner) | Neither attributed nor dated. It is not in `DECISIONS.md` (F1). Its own words, "no longer", place it after the material it demotes. |
| **Purpose:** a blueprint for a personal agentic system that takes repetitive work off its owner, plus eight design values. | `NORTH_STAR.md:3`, `NORTH_STAR.md:26-42` | Description of intent (the north star) | Neither |
| **Decisions:** dated system-level decisions, 2026-02-27 to 2026-07-26. | `DECISIONS.md` | Decision log | Every entry is dated; no entry names who decided. |
| **Settled positions:** 19 bullets summarising `DECISIONS.md`. | `AGENTS.md:12-34` | Directives (a standing summary) | Neither. The banner now makes them history. |
| **The repository's own precedence rule:** resolve conflicts "by current snapshots/index and dated decisions"; "the newer settled state wins". | `AGENTS.md:25`, `AGENTS.md:70`, `DECISIONS.md:869` | Directive | Dated 2026-07-16 in `DECISIONS.md` |

A missing author or date does not make the banner an inference (intent pass, section 1). It is used as the authorised
lifecycle throughout this assessment. Recording it properly is question 2.

### Three readings

- **Declared.** Under the banners, the documents still describe an active, "bleeding-edge" blueprint at "current
  named version Sol 0.1" with work "being worked towards". The sources are `README.md:9`, `AGENTS.md:8`,
  `AGENTS.md:38` and `ROADMAP.md:1-3`.
- **Enacted.** The last dated work is 2026-07-26: the temporal coordinator's pg-boss V0 decision (`DECISIONS.md:836-851`)
  and the retirement of `architecture/PICKUP.md` (`PICKUP.md:3-4`). The manual Pi runs stopped after 2026-05-13 and are
  paused (`runs/README.md:7-9`).
  - There is no commit history in the snapshot.
  - Every file has the same modification time (2026-08-01 21:12), so file dates give no ordering.
  - When the banners were added cannot be read from the snapshot.
- **Authorised.** The banners make this repository reference-only and send current work to two other repositories.
  Neither of those was read, because they are outside the target.

### Gaps, by condition

- **Stale description.** These documents contradict a later recorded directive or decision:
  - F2: "current" claims under the banners;
  - F7: `architecture/INDEX.md` sends sessions to a pickup file that marks itself superseded;
  - F8: `RUNTIME.md` keeps the superseded "unified" gateway;
  - F9: `DECISIONS.md` lists as deferred a question it decided on 2026-05-14;
  - F11: component notes call settled matters "open" or "TBD";
  - part of F14: `MODEL.md:3` names the old directory.

  Each correction is limited to what the directive or decision plainly settles (sections 8 and 9).
- **Conflict.**
  - F3: the banner forbids extending the blueprint, but the session-start ritual and the pre-commit guard steer every
    session towards extending it. Which remedy applies is question 1.
  - F13: `AGENTS.md:28` says open questions live only in `DECISIONS.md`; `architecture/SCHEMA.md:78` makes a snapshot's
    "Under Review" list the source of truth for its domain. This one is not asked, because the answer changes nothing
    built in a reference-only repository.
- **Missing.**
  - F1: the reference-only status has no entry in `DECISIONS.md` (question 2).
  - F6: no file names the steward.
  - F10: `README.md` calls the Level 2 distribution repository "historical", but no decision retires it.
- **Ambiguous.**
  - F4: two rules let the work revise intent without saying who decides. "Clarify intent and update the docs"
    (`AGENTS.md:25`, `DECISIONS.md:869`) does not say who clarifies intent. "Anything can be revisited with strong
    enough reasoning, and when it changes we update this list" (`AGENTS.md:14`) does not say who decides that a
    settled position has changed.
  - The scope of "reference-only" itself is **not** ambiguous for this run, once the whole sentence is read.
    `AGENTS.md:5-6` forbids *extending* or *reinterpreting the blueprint as current design*. A correction that marks
    material as historical does neither, so corrections are permitted.
- **Unauthorised drift.** None is shown by the evidence available. Commits could not be inspected.
- **Prose control.** F15: "No stale docs" is written as a standing rule and cited as done, but nothing enforces it.

### The existing guards, read against the intent-change rule (v2)

The existing guards are `skills/entropy-guard.md`, `skills/session-kickoff.md` and the working rules in `AGENTS.md`.

**Intent paths, where the work could change authorised intent (F4):**
- `skills/entropy-guard.md:31`: "Do decisions in DECISIONS.md align with descriptions in MODEL.md, RUNTIME.md, and
  NORTH_STAR.md?" It checks alignment with the intent document but does not say which side yields. A mismatch could be
  "fixed" by editing `NORTH_STAR.md`.
- `skills/entropy-guard.md:79`: "If a component's status has changed, update components.yaml." This lets an observed
  change move a field that `AGENTS.md:71` reserves for the steward: "only elevate status when explicitly instructed".
- `AGENTS.md:14`, `AGENTS.md:25` and `DECISIONS.md:869`, as above: no decider is named.

**Ownership paths, where two independent definitions are kept in step instead of one being made the owner (F5):**
- `skills/entropy-guard.md:38`: "Is the scope manager consistently described across MODEL.md, RUNTIME.md, and
  components.yaml?" `RUNTIME.md:57-84` restates the scope manager's anatomy in full, against the 2026-07-16 decision
  that "prose docs point at it and must not restate anatomy" (`DECISIONS.md:857`). F8 is the live instance.
- `skills/entropy-guard.md:39` (no secrets "across all files") and `:41` (the workflow convention across four files)
  are the same keep-in-step pattern.
- `AGENTS.md:51`: "If your change touches one file, check what other files reference the same concepts and update them
  too."
- **Sound counterpart:** `skills/entropy-guard.md:74` states the one-owner rule correctly. `AGENTS.md:28` ("update all
  references") is about links, so it is not a parallel definition.

### Questions

There are two, in `questions.md`, each with a recommended answer. No steward was available, so this run continued on
the recommendations and drafted everything that depends on them as provisional (`provisional.patch`).

### Proposed changes, and where they are recorded

- **No intent change is proposed.**
- **The decision records that would answer questions 1 and 2** are drafted as two `DECISIONS.md` entries in
  `provisional.patch`, awaiting the steward.
- **The two open questions** are listed in the `ROADMAP.md` status block by `settled-orientation.patch`.

## 2. Lifecycle, shape and repositories

- **Lifecycle: reference-only.** The evidence:
  - `README.md:3-5` and `AGENTS.md:3-6` both say so;
  - `README.md:11-12` and `README.md:42` already call the Level 2 distribution source "historical";
  - the last dated design work is 2026-07-26.

  This status limits what the route recommends: corrections, historical markers and demotion only, with no new guard
  and no restructuring.
- **Shape: A, docs-first planning.** Markdown is the product. Decision logs, roadmaps, TODO files and agent
  instructions carry the state, and the work happened in repeated agent sessions, each starting with a session-start
  ritual (`AGENTS.md:36-45`).
  - There is no implementation code.
  - The YAML files are templates and draft scope definitions.
  - The `runs/*/events.jsonl` files are run records.
  - No other shape fits better.
- **Repositories: one repository assessed.** It names several neighbours but holds none of their content:
  - the successors `../personal-agent` and `../../scope`;
  - the temporal coordinator implementation;
  - `agentic-learning`;
  - the scope repositories.

  None of them was read, because they are outside what this run may read. The banners already treat this repository
  as separate from its successors, not as part of one system with them.

## 3. Findings

Each finding has an id, its evidence and its source. Condition labels follow the intent pass.

| Id | Finding | Evidence | Condition |
|---|---|---|---|
| F1 | The reference-only status lives only in the two banners. `DECISIONS.md` has no entry for it, with or without a date or decider. A session following `AGENTS.md:50` ("check DECISIONS.md before asking") finds nothing about it. | `README.md:3-5`, `AGENTS.md:3-6`; searching `DECISIONS.md` for "reference" finds nothing | Missing (question 2) |
| F2 | "Current" claims sit directly under the banners: "This repo holds the current architecture state" (`AGENTS.md:8`), "Settled — current strong positions" (`AGENTS.md:12-14`), "Bleeding-edge design source for the current named version" (`README.md:9`), "design docs live in components/scope/" (`README.md:43`), and "Roadmap — Current Named Version", "Working towards next" (`ROADMAP.md:1, 3, 12, 29`). Some claims are left because the banner does not settle them: "Sol is the current version codename" (`README.md:7, 9`; `AGENTS.md:8`), and `MODEL.md:31-32`, which names this repository as layer 1 of the five-layer stack. | the lines cited | Stale description, settled by the banners |
| F3 | The active-development rituals steer every session to extend the blueprint, which the banner forbids. Session start: "Check ROADMAP.md — know what version we're on and what's being worked towards" (`AGENTS.md:38`), and the kickoff's "1-3 most plausible next actions" (`AGENTS.md:43`). The guard is a standing pre-commit instruction (`AGENTS.md:72`; `skills/entropy-guard.md:116`, "You do not need to be asked"). Several of its checks direct extension: new open questions (`:47`), syncing TODO "Next Up" lists into the roadmap (`:75`), updating `components.yaml` status (`:79`), updating roadmap progress (`:80`), and adding issues to `DECISIONS.md` (`:98`). | the lines cited | Conflict; the remedy is question 1 |
| F4 | Paths for unauthorised intent change in the guard and the working rules (section 1). | `skills/entropy-guard.md:31, 79`; `AGENTS.md:14, 25, 71`; `DECISIONS.md:869` | Ambiguous: who decides |
| F5 | Keep-in-step checks over several full descriptions, instead of one owner and links (section 1). | `skills/entropy-guard.md:38, 39, 41`; `AGENTS.md:51` | Parallel truth (ownership) |
| F6 | No file names the steward of this repository. The inferred steward is in section 1. | absence; `components/orchestrator/scope/scope.yaml:6` | Missing |
| F7 | The handoff state is dishonest in four places. (1) `architecture/INDEX.md:15-17` says "Current Pickup: Next architecture work starts at PICKUP.md", while `PICKUP.md:3` says "superseded historical pickup point (2026-07-26)". (2) `PICKUP.md:15` says "unified-gateway wording has been cleaned up", but `RUNTIME.md:67` and `:82` still carry it. (3) `runs/001-moving-stillness-status/RUN.md:112` still has "Pickup — start here next session" although the run line is paused (`runs/README.md:7`). (4) The daily-summary workflow is tracked as next work in three places: `ROADMAP.md:25`, `components/orchestrator/TODO.md:17`, `components/scope/TODO.md:27`. | the lines cited | Stale description (1 is settled by `PICKUP.md:3`); state dishonesty |
| F8 | `RUNTIME.md:57-84` restates the scope manager's anatomy, including "Runtime gateway (unified for v0)" (`:67`) and "unified sandbox gateway" (`:82`). The orchestration snapshot (v1) superseded that on 2026-07-16 (`DECISIONS.md:575`), and the decision at `DECISIONS.md:855-857` says prose must point at the snapshot rather than restate it. | the lines cited | Stale description; parallel truth |
| F9 | `DECISIONS.md:896` lists "Layer 2 distribution form: build step vs separate distribution repo" as deferred. The 2026-05-14 entry (`DECISIONS.md:156-162`) chose a separate repository. | the lines cited | Stale description |
| F10 | `README.md:11-12` and `:42` call `agentic-architecture-distribution` the "historical" Level 2 source. `MODEL.md:32` and the 2026-05-14 decision present it as the Level 2 source. No decision retires it. | the lines cited | Missing; not asked |
| F11 | Component notes still call settled matters open: `components/agent/DECISIONS.md:12` ("inter-agent communication and runtime setup are still open questions"), `components/orchestrator/DECISIONS.md:13` ("mechanism TBD"), and `components/orchestrator/PLAN.md:28-29` ("format TBD", "whatever mechanism is chosen"). The 2026-04-27 root decisions resolve all three (`DECISIONS.md:551-559`, `:612-618`, `:622-635`). | the lines cited | Stale description |
| F12 | The decision naming the root scope `root-general` is recorded in full twice, rationale included: `DECISIONS.md:489-500` and `components/orchestrator/DECISIONS.md:18-29`. That breaks the repository's own rule that component notes link rather than restate (`AGENTS.md:69`; `components/orchestrator/DECISIONS.md:5`). | the lines cited | Parallel truth (local-global inversion) |
| F13 | Open questions live outside the registry. (1) `AUTH_OPTIONS_ANALYSIS.md:246-251` has its own list. (2) `components/orchestrator/MODEL.md:84-87` says "Cross-scope workflow exposure model" is tracked in the root registry, and `SCOPES_PLANNED.md:30` links the same question there, but the registry (`DECISIONS.md:875-896`) has no such entry. (3) `AGENTS.md:28` ("live only in DECISIONS.md") conflicts with `architecture/SCHEMA.md:78` ("Under Review … source of truth for the domain"). | the lines cited | Parallel truth; conflict |
| F14 | Some references are stale. `MODEL.md:3` says proto tools "live in the pro-agentic directory", contrary to the 2026-04-04 directory decision (`DECISIONS.md:174-178`). `components.yaml:35` gives `implementation: ../scope` and `:51-81` use `repo: ../library`, `../seed` and so on, where `README.md:41-50` uses `../../` for the same repositories and `DECISIONS.md:176-178` places tools, and the scope implementation, flat in `~/pro/`. `archive/scheduling-cronicle-investigation.md:5-7` says its conclusion is "retained in SCHEDULING.md", which now describes pg-boss enqueueing with no adapter boundary. | the lines cited. The `components.yaml` paths could not be checked on disk. | Stale references |
| F15 | "No stale docs" is written as a rule (`AGENTS.md:26`; `DECISIONS.md:857`; `architecture/INDEX.md:23`) and cited as achieved: "Hygiene pass is complete" (`PICKUP.md:15`). Nothing enforces it: the guard is "External (discipline-based)" (`skills/entropy-guard.md:114`), and F7 and F8 show it failing. Enforcement would sit in the guard's "No stale content" checks (`skills/entropy-guard.md:89-94`). | the lines cited | Prose control |
| F16 | The existing guard predates most of the July work: generated 2026-04-02 by entropy-assessment v0.5.2, `last_evaluated: 2026-04-27` (`skills/entropy-guard.md:4-6`). It has no checks for the snapshot rules in `architecture/`, the temporal coordinator or `runs/`. This matters only if question 1 keeps it. | the lines cited | Workflow drift |
| F17 | The reference role in `roles/professional-presence-profile-editor/` and its live copy in the scope repository have to be changed together. The repository already names this: "Copy-from-reference drift risk is real" (`runs/002-professional-presence-diagnostic/RUN.md:241`). `roles/README.md:3-5` already marks the copy here as reference only, so the live copy owns the role. No action is needed. | the lines cited | Parallel truth (already acknowledged) |

**No action needed: observed reach.** Run 001 recorded that, with no sandbox, the agent read files outside the scope
directory (`runs/001-moving-stillness-status/RUN.md:89`). The run used this as evidence *for* the prescribed isolation
boundary and did not loosen the boundary. That is the correct use of observed behaviour.

## 4. Truth map

The roles come from docs-first Step 2. The left column names each concept and its one canonical home.

| Concept, and its canonical home | Other places that carry it, and their role |
|---|---|
| **Lifecycle status:** the `AGENTS.md:3-6` banner, which agents load automatically. It belongs in `DECISIONS.md` once dated (F1). | `README.md:3-5`: a summary for people, which agrees with it. Contradicted by `AGENTS.md:8, 12-14`, `README.md:9, 43`, `ROADMAP.md:1-3`, `skills/session-kickoff.md` and `skills/entropy-guard.md:7` (F2, F3). |
| **Vision and values:** `NORTH_STAR.md` | `README.md:9`: a summary |
| **System decisions:** `DECISIONS.md` | `AGENTS.md:12-34`: a summary (now historical). Component `DECISIONS.md` "inherited constraints" lists are local summaries, some stale (F11). `components/orchestrator/DECISIONS.md:18-29` is a full duplicate (F12). |
| **Open questions:** `DECISIONS.md:875-896` (architectural), plus the snapshot's "Under Review" (per domain) | `AUTH_OPTIONS_ANALYSIS.md:246-251`, `components/orchestrator/MODEL.md:84-87`, `SCOPES_PLANNED.md:28-30` and the workflow stubs (F13). Per-scope inventory questions in `SCOPES_PLANNED.md` are allowed by `DECISIONS.md:309`. |
| **System model and the five-layer frame:** `MODEL.md`, kept as prose by `DECISIONS.md:857` | `RUNTIME.md:7`: the runtime view of layers 3-5 |
| **Orchestration anatomy:** `architecture/snapshots/2026-07-16-orchestration/ARCH.md`, made current only by `architecture/INDEX.md` | `RUNTIME.md:57-84` restates it (F8). `DECISIONS.md:573-594` is the superseded original. |
| **Temporal coordinator contract:** `components/temporal-coordinator/SPEC.md` (`DECISIONS.md:847`) | Summaries in `SCHEDULING.md`, `RUNTIME.md:33-49`, `MODEL.md:88`, `components.yaml:26-30` and the snapshot. `PLAN.md` is local elaboration. `INTERFACE_REFINEMENT_PLAN.md` is historical. |
| **Component status:** `components.yaml` | `MODEL.md` primitives (a summary) |
| **Current state and next work:** `ROADMAP.md`, the first file the session-start ritual reads (`AGENTS.md:38`) | `components/scope/TODO.md`, `components/orchestrator/TODO.md` and `PLAN.md` files (component state). `architecture/PICKUP.md` (historical). `runs/README.md` (run-line state). The pickup sections in `runs/*/RUN.md` (historical) (F7). |
| **Templates (product artifacts):** `components/scope/template/` and `components/agent/template/` | The root scope draft in `components/orchestrator/scope/`, an instance of the scope template |
| **Design skills (product artifacts):** `components/scope/skills/scope-design.md` and `components/agent/skills/role-design.md` | none |
| **Repository-maintenance skills:** `skills/session-kickoff.md` and `skills/entropy-guard.md` | `skills/README.md` (index) and `AGENTS.md:43, 72` (the instructions that invoke them) |
| **Reference role:** the live copy in `scope-professional-presence`, outside the target | `roles/professional-presence-profile-editor/`, a reference copy (F17) |
| **Historical material** | `archive/`, `architecture/PICKUP.md`, `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`, `ORCHESTRATION.md` (a redirect stub), the superseded entries in `DECISIONS.md`, `runs/*`, and `components/scope/LEARNINGS.md` (which keeps historical notes by design, line 3) |

## 5. Loop map

**Documented loop (`AGENTS.md`):**
1. An agent runtime loads `AGENTS.md` automatically. `CLAUDE.md` is a symlink to it, and run 001 confirms that Pi also
   loads it (`runs/001-moving-stillness-status/RUN.md:83`). The banner is the first thing read.
2. The session-start ritual reads `ROADMAP.md`, then `MODEL.md`, then `DECISIONS.md`, then `components.yaml`, then the
   component docs (`AGENTS.md:36-45`).
3. `skills/session-kickoff.md` builds a current-state packet in the conversation, with 1-3 next actions.
4. The session does its work.
5. Before a non-trivial commit, the session runs `skills/entropy-guard.md` (`AGENTS.md:72`), by discipline only
   (`skills/entropy-guard.md:114`).
6. The commit is the handoff.

Handoff notes lived in `architecture/PICKUP.md`, the pickup sections in `runs/*/RUN.md`, and the "Doing Now" and
"Next Up" sections of the component `TODO.md` files.

**Real loop:** it cannot be observed from the snapshot. There is no commit history, and the file times are uniform.
The last recorded working sessions were the 2026-07-16 to 2026-07-26 snapshot and temporal-coordinator work. Nothing
shows what loop, if any, has run since the banner was added. Read whole, the banners say the loop moved to
`../personal-agent` and `../../scope`. Any session that still opens this repository meets the banner first and the
active-development ritual straight after it. That collision is the main risk (R1).

## 6. Ranked risks

| Rank | Risk (matrix name) | Findings | Decay rate | Recovery cost | Anchor for the fix |
|---|---|---|---|---|---|
| R1 | **Superseded material nearby.** In this repository, the whole repository is the superseded material. | F2, F3, F7 | Every session that opens the repository and follows `AGENTS.md` past the banner | High: work done here has to be found and moved to the successor repositories, and decisions recorded here carry no authority | The `AGENTS.md` banner, then a dated `DECISIONS.md` entry (question 2) |
| R2 | **Workflow drift.** The pre-commit guard and the kickoff still direct extension. | F3, F4, F16 | Every non-trivial commit | Medium: roadmap ticks, status changes and open questions added to a dead log | The banner; the remedy is question 1 |
| R3 | **State dishonesty.** Handoffs claim things are current or done when they are not. | F7, F15 | It has already happened, and nothing will refresh it | Low (4 files), but each one misleads a reader | `ROADMAP.md` as the state file |
| R4 | **Parallel truth.** Restated anatomy, duplicated decisions, open questions outside the registry. | F5, F8, F11, F12, F13 | Slow now that the repository is dormant | Low per item | The snapshot for anatomy; root `DECISIONS.md` for decisions |
| R5 | **Stale references.** | F14 | Slow | Low | `DECISIONS.md` "Local directory structure" |

## 7. Recommendations

- **Mark as historical (settled, recommended):** `ROADMAP.md` (a status block and headings), the "Settled" heading and
  description line in `AGENTS.md`, the description line and Related row in `README.md`, and the pickup pointer in
  `architecture/INDEX.md`. These are in `settled-orientation.patch`.
- **Demote (provisional, question 1):** the session-start ritual, the pre-commit guard line, `skills/session-kickoff.md`
  and `skills/entropy-guard.md`. These are in `provisional.patch`. Retiring the guard is a demotion, not a guard
  rewrite, so the guard decision stays `none`.
- **Record (provisional, question 2):** the reference-only status, as a dated `DECISIONS.md` entry that the banners
  link to. Once it exists, `DECISIONS.md` owns the status and the banners become summaries of it.
- **Bring into line with recorded decisions (settled, optional):** F8, F9, F11 and part of F14, in
  `settled-accuracy.patch`. They are worth applying only if the reference is to stay accurate for people who still
  read it.
- **Do not:**
  - write a new guard;
  - add a new state or summary file, since `ROADMAP.md` serves;
  - consolidate F12 or F13, or rewrite `MODEL.md`'s five-layer table to name a successor. The banner does not say what
    layer 1 is now, and in a reference-only repository consolidation has little value.

## 8. One-time cleanup

Each item below was checked against the current file in the snapshot.

**In `settled-accuracy.patch` (optional):**
- `DECISIONS.md:896`: the deferred "Layer 2 distribution form" question is marked resolved by the 2026-05-14 entry. Its
  sync/drift caution is kept (F9).
- `RUNTIME.md:67` and `:82`: the "unified" wording is replaced by a pointer to the snapshot's seams. The seam bullets
  are left alone, because the snapshot still has them under review (F8).
- `components/agent/DECISIONS.md:12`, `components/orchestrator/DECISIONS.md:13` and
  `components/orchestrator/PLAN.md:28-29` now cite the 2026-04-27 root decisions (F11).
- `MODEL.md:3`: "the pro-agentic directory" becomes "under `~/pro/`". It does not say "flat in `~/pro/`", because
  `agentic-colab`, one of the proto tools, sits in `~/pro/agentic/` by the same decision. An "only"-style claim has to
  hold for the whole list (F14).

**Not patched, and not recommended while the repository is reference-only.** These are listed for anyone who revives
it:
- `components.yaml:35` and `:51-81`: the relative paths disagree with `README.md`, but they could not be checked on
  disk (F14). The `temporal-coordinator` path (`components.yaml:29`) agrees with
  `INTERFACE_REFINEMENT_PLAN.md:7` and is left alone.
- `components/orchestrator/MODEL.md:84-87` and `SCOPES_PLANNED.md:30`: either add the question to the registry or
  restate it as detail of the direction set at `DECISIONS.md:666-670`. No decision says which (F13).
- `AUTH_OPTIONS_ANALYSIS.md:246-251`: move the questions to the registry, or mark the document as a historical
  analysis (F13).
- `components/orchestrator/DECISIONS.md:18-29`: reduce it to a link to `DECISIONS.md:489-500` (F12).
- `runs/001-moving-stillness-status/RUN.md:112-126`: mark the pickup section historical (F7).
- `archive/scheduling-cronicle-investigation.md:5-7`: correct its claim about what `SCHEDULING.md` retains (F14).

This list is not tracked in the target. Adding a cleanup list to a reference-only repository would itself be new
active work there. This assessment is the handoff note that holds it.

## 9. State-file update

**The state file is `ROADMAP.md`.** It is the first file the documented loop reads (`AGENTS.md:38`) and the one it
reads to learn what is current. No competing summary was added.

`settled-orientation.patch` puts a status block at the top of `ROADMAP.md`. The block holds:
- **The current stage:** reference-only, with its source.
- **The documents to trust first, read as history:** `DECISIONS.md`, `architecture/INDEX.md` and the temporal
  coordinator spec, each with the date of its last change.
- **Where current work lives, per the banners:** stated as "not checked from this repository". This is a live fact
  that was not observed, so it is labelled as such.
- **Misleading material nearby:** the unchecked roadmap items, `PICKUP.md`, the run-001 pickup section, the component
  "Next Up" lists, and the two skills that still assume active development. For the skills, the block states that fact
  without answering question 1.
- **The open questions:** questions 1 and 2, written out.
- **One next action.**
- **What makes it stale**, and who refreshes it: whoever changes either banner or answers a question, in the same
  commit.

The patch also checks the other mentions of each claim it changes in the same file. The headings at `ROADMAP.md:1, 3,
12, 29` are made consistent with the block. `provisional.patch` refreshes the block again once the answers exist, as
the block requires.

## 10. Guard surfaces and the checks for this repository

### Existing guard surfaces (docs-first Step 7.1)

| Surface | Verdict | Why |
|---|---|---|
| `skills/entropy-guard.md` (pre-commit guard) | **Demote**, pending question 1 | It directs extension, which conflicts with the banner (F3). It is stale (F16) and has intent and ownership paths (F4, F5). |
| `skills/session-kickoff.md` (session-start packet) | **Demote**, pending question 1 | Its output is "most plausible next actions" for a repository with none (F3). |
| `AGENTS.md` (and `CLAUDE.md`, a symlink to it) | **Keep the banner. Amend the body:** the "current" claims (settled) and the session start and pre-commit line (provisional) | F2, F3 |
| `README.md` Status banner | **Keep** | It agrees with `AGENTS.md`. |
| `architecture/INDEX.md` snapshot rules | **Keep. Amend** the "Current Pickup" pointer (settled) | F7 |
| `skills/README.md` | **Amend**, provisional | It indexes the two skills being demoted. |
| Hooks | **None exist.** The guard says its enforcement is discipline only (`skills/entropy-guard.md:114`). | No hook should be added to a reference-only repository. |
| `components/*/template/` | **Keep.** They are product artifacts, not guards. | The scope template already has `workflows/` and no `activity/`, which matches `DECISIONS.md:191`. |

### The matrix's checks, written against this repository's files (docs-first Step 7.2)

These checks are recorded for the reference-only state. They become the starting inputs if the repository is ever
revived and the decision changes to `create` or `update`. While the repository stays reference-only, they are applied
by hand when a correction is made.

- **Superseded material nearby.** Before reviving anything from this repository, read the `AGENTS.md` banner and the
  `ROADMAP.md` status block. Examples are `components/orchestrator/scope/workflows/daily-summary/WORKFLOW.md` and the
  seam list in `architecture/PICKUP.md`. Current work belongs in `../personal-agent` or `../../scope`.
- **State dishonesty.** Does the `ROADMAP.md` status block still match both banners? Does any other file present work
  here as next? Check `architecture/INDEX.md` "Pickup", the `runs/*/RUN.md` pickups and the `components/*/TODO.md`
  "Next Up" lists.
- **Workflow drift.** Would a fresh agent following `AGENTS.md` do what this session did? In particular, did the
  session extend the blueprint without the steward's explicit authorization? Extension here means new decisions,
  roadmap ticks or a `components.yaml` status change.
- **Lost decisions.** If this session changed the lifecycle or a successor pointer, is the change recorded in
  `DECISIONS.md` with a date and a decider?
- **Parallel truth.** Do the `README.md` and `AGENTS.md` banners still agree? Is the `ROADMAP.md` block a summary that
  points at them, and at the `DECISIONS.md` entry once it exists, rather than a third definition?
- **Stale references.** Do `../personal-agent` and `../../scope` resolve? This is the only check stable enough to
  automate as a link check.
- **Brittle automation.** Everything else stays judgment. The terminology checks in `skills/entropy-guard.md:52-61`
  encode churning wording and should not be scripted.

## 11. Guard decision and the generator's inputs

**Decision: `none`.** The reason:
- The repository is reference-only (section 2). `entropy-assessment` Step 3 and docs-first Step 7.3 both say this
  usually needs `none`, finishing with a correction or a demotion.
- The correction is `settled-orientation.patch`, with `settled-accuracy.patch` optional.
- The demotion is the retirement of the existing guard and kickoff in `provisional.patch`, pending question 1. It
  retires a guard; it does not write checking policy, so it is not generator work.
- If question 1 is answered "keep them for corrections", the decision becomes **`update`**. The inputs below then go
  to `session-coherence-skill-generator`, which hands on to `guards-integrator`.

**The generator's inputs** (from its "Inputs, and the guard decision" section):

| Input | Value |
|---|---|
| Steward | **Unresolved.** Inferred to be Justin Philpott (F6). |
| Documents that hold authorised intent | The `AGENTS.md` banner (lines 3-6) and the `README.md` banner (lines 3-5) for lifecycle; `NORTH_STAR.md` for purpose; the `AGENTS.md` "Settled" list as history |
| Decision surface | `DECISIONS.md` (system, with its open-question registry at lines 875-896); `components/*/DECISIONS.md` (component-local); the "Under Review" list in the current snapshot (per domain) |
| Open intent questions | Questions 1 and 2 (`questions.md`) |
| Current-state file, and who refreshes it | `ROADMAP.md`, with the status block from `settled-orientation.patch`. It is refreshed by whoever changes a banner or answers a question, in the same commit. No named owner (**unresolved**, F6). |
| Rules the repository is bound by but does not own | **Unresolved.** Nothing inside the repository names a user-wide instructions file, a spending policy or merge rules, and nothing outside the target was read. |
| Verification commands | **Inapplicable.** There are no build, test or CI commands and no hooks. The only stable check is link resolution. |
| Code areas, and the docs and tests that describe them | **Inapplicable.** There is no code. The YAML files are templates and drafts, and `runs/*/events.jsonl` are records. |
| Live operational state or spend a session can change | **None while the run line is paused** (`runs/README.md:7-9`). Resuming the Pi runs would spend money on model usage: run 001 used a subscription (`RUN.md:41`), and `AUTH_OPTIONS_ANALYSIS.md` recommends direct API keys. |
| Findings | F1 to F17 (section 3) |

## 12. Questions for the steward

There are two, in `questions.md`, each with its source, readings, a concrete case where the readings diverge, and a
recommended answer:
1. Retire the session-start ritual and the pre-commit guard, or keep them for corrections? Recommended: retire them.
2. Record the reference-only status in `DECISIONS.md`, with its date and decider. Recommended: yes, dated from the
   commit that added the banner.

## 13. What was not covered, and uncertainties

- **No commit history.** The intent pass asks for commit messages to be searched before reporting that nothing records
  a decision. That was impossible here. F1 and the dates in question 2 may be settled from `git log` in the real
  repository without asking the steward.
- **Nothing outside the target was read.** That rules out the successor repositories, the temporal coordinator
  implementation, the scope repositories and `agentic-learning`. So these were not checked:
  - whether `../personal-agent` and `../../scope` exist and agree with the banners;
  - whether `components.yaml`'s paths resolve;
  - whether the claims in `SPEC.md` and `SCHEDULING.md` about the implementation are true. Examples are "`queue.ts` is
    the only application source module that imports pg-boss" and "Only these routes exist". Both are exhaustive claims
    about another repository and are unverified here.
- **Read in part only:**
  - `PI_AGENT_OVERVIEW.md`: lines 41-59 not read;
  - `AUTH_OPTIONS_ANALYSIS.md`: lines 31-239 read as headings only;
  - `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`: lines 1-40 only;
  - `archive/scheduling-cronicle-investigation.md`: the header only;
  - `components/scope/skills/scope-design.md` and `components/agent/skills/role-design.md`: the first 25-30 lines;
  - `runs/002` and `runs/003` `RUN.md`: headings, observations, findings and next steps.
- **Not read:** `runs/*/events.jsonl`, `input.md` and `output.md`.

  None of these is a document a session reads first. A finding inside them would not change the route or the guard
  decision.
- **Open, and deliberately left so:**
  - whether "Sol" is still the current named version in the successor repositories;
  - what layer 1 of the five-layer model is now;
  - whether the Level 2 distribution repository was retired by a decision (F10).
- **The counterfactual.** If the banner were a draft that was never meant to land, the orientation corrections would
  be premature. The intent pass says missing attribution does not make a directive unusable, and nothing in the
  snapshot contradicts the banner, so this run treats it as authorised. Question 2 would expose the case.

## 14. Files delivered

| File | Reader | What it is |
|---|---|---|
| `assessment.md` | Steward, and the next agent | This assessment |
| `questions.md` | Steward | Questions 1 and 2, with recommended answers |
| `settled-orientation.patch` | Whoever applies changes to the target | Recommended corrections; touches no open question |
| `settled-accuracy.patch` | The same | Optional corrections from dated decisions; touches no open question |
| `provisional.patch` | The same, after the steward answers | Implements the recommended answers to questions 1 and 2, with date and steward placeholders |
| `integration.md` | Steward | Why no integration advice is produced on this route |
| `read-log.md` | The evaluator | The skill files opened, in order |
| `feedback.md` | entropy-guard maintainers | Places where the skills were unclear for this case |

The three patches were checked with `git apply` on a scratch copy of the snapshot. They were applied in each of these
orders, and each applied cleanly:
- orientation, then accuracy, then provisional;
- orientation, then provisional;
- orientation alone;
- accuracy alone.

Applying all three in order reproduces the intended tree exactly. Every repository-internal link in the changed files
resolves.
