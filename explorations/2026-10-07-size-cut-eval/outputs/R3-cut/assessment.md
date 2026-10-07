# Entropy assessment: agentic-architecture

- **Target:** read-only snapshot of `agentic-architecture` (78 files, about 5,600 lines; no `.git`).
- **Date:** 2026-10-07. Every line reference below was read on this date from the snapshot.
- **Route:** `entropy-assessment` → intent pass → lifecycle **reference-only**, shape **A (docs-first planning)** →
  `docs-first-planning-assessment` Steps 1-7 → `session-coherence-skill-generator` (plan mode) →
  `guards-integrator`.
- **Outputs beside this file:**
  - `status-correction.patch`: the state-file update and status corrections;
  - `guard/SKILL.md`: the refined guard, provisional on Q1;
  - `integration.md`: the integration brief;
  - `questions.md`: the steward questions;
  - `read-log.md`;
  - `skill-feedback.md`: notes on the skills themselves.
- **Nothing was applied to the target.**

Findings are in one list (section 3), and other sections refer to them by id.

---

## 1. Intent

### Steward

No file names a steward for this repository (finding F11). Every scope manifest in it names `justin`
(`components/orchestrator/scope/scope.yaml:6`, `:23`, `:34`; `SCOPES_PLANNED.md:12`), and `NORTH_STAR.md:3`, `:50`
describes a personal system for one person. That the repository owner, `justin`, is the steward is an **agent
inference**, used below as "the repository owner".

### Authorised intent, with sources

| # | Statement | Where | Kind | Authority evidence | Date |
|---|---|---|---|---|---|
| A1 | Reference-only. Not current architecture authority. Current Personal Agent architecture is in `../personal-agent`; the current Scope/Project model is in `../../scope`. "Do not treat decisions in this repository as current authority." "Do not extend or reinterpret this blueprint as current design without explicit authorization." | `README.md:3-5`, `AGENTS.md:3-6` | directive (status banner) | neither attributed nor dated | unknown. The banner names `personal-agent`, which no dated entry mentions, so it is probably later than the last dated entry (2026-07-26). That is an inference, not a record. |
| A2 | The repository is a blueprint for a personal agentic system, a map and not territory. | `NORTH_STAR.md:3-18`; `DECISIONS.md:45-49` | description and decision | dated, not attributed | 2026-04-01 |
| A3 | Working rules: no stale docs; `DECISIONS.md` is the only open-question registry; docs serve intent. | `AGENTS.md:25-28`; `DECISIONS.md:305-309`, `:855-871` | directives | dated, not attributed | 2026-04-05, 2026-07-16 |
| A4 | 78 dated decision entries (counted 2026-10-07). Under A1 they are historical authority: a record of what was decided here, not current design. | `DECISIONS.md:7-871` | decisions | dated, not attributed | 2026-02-27 to 2026-07-26 |

### Three readings

- **Declared:** below the banners, the documents still describe a live design source:
  - "Bleeding-edge design source for the current named version" (`README.md:9`);
  - "This repo holds the current architecture state" (`AGENTS.md:8`);
  - open work in `ROADMAP.md:12-71`;
  - "in-progress" components in `components.yaml:17-41`.
- **Enacted:** there is no git history to read. The latest dated records are the 2026-07-26 pg-boss decision
  (`DECISIONS.md:836-851`) and the documents aligned to it (`SCHEDULING.md`, `RUNTIME.md:33-49`, `PICKUP.md:3`). The
  run line was paused after run 003 (`runs/README.md:7-9`). The banners are the latest visible change (an inference).
- **Authorised:** A1. The banners are the only statement of current status, and they contradict the declared
  reading.

### Gaps, by condition

| Condition | Gap | Findings | Response |
|---|---|---|---|
| Stale description | The text under the banners, plus ROADMAP, components.yaml, the INDEX pickup, the kickoff and the guard, present the repository as active. | F1, F2 | Correct them from A1, citing it (`status-correction.patch`). This rests on A1, which is unattributed and undated; it is treated as a directive because it is imperative and appears identically in both orientation files. |
| Stale description | Component documents call questions open that `DECISIONS.md` settled on 2026-04-27. RUNTIME keeps wording superseded on 2026-07-16. components.yaml paths disagree with the recorded directory layout. | F3, F4, F9, F13, F14 | One-time cleanup citing the deciding entries (section 10), provisional on Q1. |
| Conflict | Where open questions live: `DECISIONS.md` only (2026-04-05), or the snapshot's "Under Review" as "source of truth" (2026-07-16 snapshot rules). | F5 | Presented with both sources. No question asked: in a reference-only repository the answer changes nothing that gets built. |
| Missing | No steward is named. | F11 | Recorded as a finding; the guard uses "the repository owner". |
| Missing | No map of which successor repository now owns each concept held here: the temporal coordinator contract, the orchestration snapshot, the templates, the run method. | F15 | Name the missing decision. It belongs to the owners of the successor repositories. Q2 and Q3 cover the parts that change this repository. |
| Ambiguous | "Without explicit authorization" (`AGENTS.md:5-6`) can mean frozen, or open to authorised edits. | F1, F2 | Q1 |
| Ambiguous | "Do not treat decisions in this repository as current authority" against the template "single source" decisions. | F8 | Q2 |
| Unauthorised drift | None established. With no git history, enacted work after A1 cannot be compared with it. | — | — |
| Prose control | "No stale docs" and "update all references" are stated as invariants and enforced only by a hand-run guard. A hygiene pass is cited as complete when it is not. Snapshot rules are not followed. | F12, F6 | Enforcement point: the refined guard's checks 3 and 4, plus a link checker (`integration.md`). Nothing cites these rules as a security control. |

### Questions

Three questions, each in full with its recommended answer in `questions.md`:

- **Q1:** are authorised edits still expected here, or is the repository frozen? Recommended: edits are still
  expected.
- **Q2:** are the templates still copied? Recommended: no; template authority moved to `../../scope`.
- **Q3:** freeze open work or migrate it? Recommended: freeze it in place.

### Proposed changes and where they are recorded

- **A1 copied into `DECISIONS.md`:** a new entry, "Date not recorded — agentic-architecture is reference-only", in
  `status-correction.patch`. It records A1 and decides nothing new; it is marked as awaiting the steward's date and
  wording.
- **No intent document is edited.** The banners and `NORTH_STAR.md` are untouched. The descriptions under the
  banners are corrected from A1.

---

## 2. Lifecycle, shape, repositories, horizon

- **Lifecycle: reference-only.**
  - Evidence: `README.md:3-5` and `AGENTS.md:3-6`.
  - The run line is paused (`runs/README.md:7-9`) and `architecture/PICKUP.md:3` is superseded.
  - This limits the route to corrections, demotions and refining the existing guard. No new registers, hooks or CI
    are recommended.
- **Shape: A, docs-first planning.** Every file is Markdown, YAML (templates, a catalog, manifests) or committed JSONL
  run records. There is no code. State is carried by decision logs (root and three components), `ROADMAP.md`,
  component `TODO.md` files and agent instructions (`AGENTS.md`, with `CLAUDE.md` as a symlink to it).
  - No other shape fits. D (workflow-heavy) was considered, because runs and skills are present, but the documents
    are the product.
- **Repositories:** one is assessed. While the repository was active, the system also spanned:
  - implementations: `../temporal-coordinator` (`components.yaml:29`) and the scope implementation, given as
    `../scope` in `components.yaml:35` and as `../../scope` in `README.md:43`;
  - the distribution source: `../agentic-architecture-distribution`;
  - theory: `../agentic-learning`.

  The current successors are `../personal-agent` and `../../scope`. All of these are outside this run's bounds, so
  the system could not be assessed as one; see Uncertainties.
- **Planning horizon:**
  - Settled: the `DECISIONS.md` entries, as historical authority.
  - Active: none (A1).
  - Exploratory, now frozen:
    - the snapshot's "Under Review" (`architecture/snapshots/2026-07-16-orchestration/ARCH.md:74-79`);
    - the PICKUP probe (`architecture/PICKUP.md:20-124`);
    - the open questions (`DECISIONS.md:879-896`);
    - the open questions in `AUTH_OPTIONS_ANALYSIS.md:246-251`.

---

## 3. Findings

Rank is given in section 6. Here, "Risk" names the matrix risk from `docs-first-planning-assessment`.

**F1. The reference-only status lives only in two banners, and everything below them still presents the repository
as current authority with live work.** Risk: state dishonesty and workflow drift.
- `README.md:3-5` against `:7`, "Current named version", and `:9`, "Bleeding-edge design source for the current named
  version".
- `AGENTS.md:3-6` against `:8`, "holds the current architecture state", `:12-14`, "current strong positions", and
  `:36-45`, where session start reads ROADMAP to learn "what's being worked towards", then builds the kickoff packet
  and chooses work from it.
- `ROADMAP.md:12-71`: unchecked items under "Working towards next", "after that" and "Backlog".
- `components.yaml:17-41`: statuses in-progress and planned.
- `architecture/INDEX.md:15-17`: "Next architecture work starts at PICKUP.md", while `PICKUP.md:3` says
  "superseded".
- A search for "reference-only" and "personal-agent" finds only `README.md:3-5` and `AGENTS.md:3-6`.
  `DECISIONS.md` has no entry for the change.

**F2. The existing guard and the kickoff skill are shaped for active work, and are stale.** Risk: workflow drift.
- `skills/entropy-guard.md:4-7`:
  - generated 2026-04-02 by entropy-assessment v0.5.2; `last_evaluated` 2026-04-27;
  - its system snapshot says "Open questions reduced from 22 to 11", but `DECISIONS.md:879-896` now lists 13;
  - it does not mention the temporal coordinator, the architecture snapshots, the runs, or reference-only status.
- Checklist items that maintain the repository as live: `:32-33` (ROADMAP reflects current component work), `:75`,
  `:79-80` (update components.yaml status and ROADMAP progress).
- It has no rule for telling drift from an approved change of intent. `:118` plans a "Prompted" reminder.
- It is mandated at `AGENTS.md:72`.
- `skills/session-kickoff.md:50-56`, `:78` builds "active fronts" and "next actions" from ROADMAP.

**F3. Component documents and inventories still call questions open that `DECISIONS.md` has settled.** Risk: stale
references and parallel truth. Each line below was verified on 2026-10-07:
- `components/agent/DECISIONS.md:12` says "inter-agent communication and runtime setup are still open questions".
  Settled at `DECISIONS.md:551-559` and `:622-635` (2026-04-27).
- `components/orchestrator/DECISIONS.md:13` says "(mechanism TBD)". Settled at `DECISIONS.md:551`.
- `components/orchestrator/PLAN.md:28` says "format TBD — see root DECISIONS.md open questions". Settled at
  `DECISIONS.md:612-618`.
- `components/orchestrator/PLAN.md:29` says "whatever mechanism is chosen". Settled at `DECISIONS.md:551`.
- `components/orchestrator/MODEL.md:84-86` lists "Cross-scope workflow exposure model" as tracked in the registry.
  It is not in `DECISIONS.md:875-896`; its direction was set at `:666-670`.
- `SCOPES_PLANNED.md:30` duplicates that question and links to the registry.
- `SCOPES_PLANNED.md:90` names three questions as open that are not:
  - "sandbox isolation model" is decided at `DECISIONS.md:275-285`;
  - "workspace lifecycle triggers" is decided at `:639-650`;
  - "agent runtime binding location" is decided at `:688-692`.
- `components/scope/skills/scope-design.md:155` says "Skill injection is an open question". Settled at
  `DECISIONS.md:674-678`.
- `components/scope/TODO.md:39` says "Design workspace lifecycle". Decided at `DECISIONS.md:639-650`.
- `RUNTIME.md:126` says "See open questions in DECISIONS.md" about the sandbox provider. That is a direction-set
  decision, `DECISIONS.md:696-698`, not an open question.

**F4. Superseded "unified gateway" wording remains in `RUNTIME.md`, and the hygiene pass is recorded as complete.**
Risk: superseded material nearby and state dishonesty.
- `RUNTIME.md:67` says "Runtime gateway (unified for v0)".
- `RUNTIME.md:82` says "Deterministic platform service and unified sandbox gateway".
- `DECISIONS.md:575` superseded that framing on 2026-07-16.
- `architecture/PICKUP.md:15` says "Hygiene pass is complete: … unified-gateway wording has been cleaned up except
  historical superseded decision titles".

**F5. Open questions have two homes, and other files hold overlapping lists.** Risk: parallel truth. Intent
condition: conflict.
- `DECISIONS.md:305-309` and `AGENTS.md:28` say "Architectural open questions live only in DECISIONS.md".
- `architecture/SCHEMA.md:78` and `ARCH.md:72` say "Under Review … source of truth" for the domain.
- `DECISIONS.md:855-861`, which set up the snapshots, does not say which rule wins.
- Overlapping lists sit outside the registry:
  - `AUTH_OPTIONS_ANALYSIS.md:246-251`;
  - `components/scope/skills/scope-design.md:159-164`, whose items at `:161-162` duplicate `DECISIONS.md:894-895`;
  - `components/agent/skills/role-design.md:200-204`.

**F6. Snapshot v1 was edited in place to describe the 2026-07-26 model.** Risk: prose control. Low.
- `ARCH.md:11-12`, `:18`, `:30`, `:41`, `:47` and `:66` describe the pg-boss V0 decided at `DECISIONS.md:836-851`.
- `architecture/INDEX.md:22` says "if the model has moved, make a new snapshot".
- The 2026-07-26 entry cites no snapshot version, which `INDEX.md:26` asks decisions to do.

**F7. Decisions and learnings were left in run records and an analysis note.** Risk: lost decisions and learnings.
- Run 001 proposes that "Pi's event types become the v0 of the runtime event log schema"
  (`runs/001-moving-stillness-status/RUN.md:85`, `:117`). There is no `DECISIONS.md` entry, and `ROADMAP.md:26` is
  still unchecked.
- `components/orchestrator/TODO.md:16`, "Review run 001 findings…", is still open.
- In run 002 (`runs/002-professional-presence-diagnostic/RUN.md`), the copy-from-reference drift (`:241`) and the
  next decisions (`:244-248`) are unresolved.
- `AUTH_OPTIONS_ANALYSIS.md:10-16` records a "Current Working Decision" to use direct API-key auth. It is undated and
  not in `DECISIONS.md`. All three runs used a Codex subscription login instead:
  - `runs/001-moving-stillness-status/RUN.md:41`, which calls it "not a long-term commitment";
  - `runs/002-professional-presence-diagnostic/RUN.md:33`, `:140`;
  - `runs/003-professional-presence-opening-proposals/RUN.md:68`.

**F8. The scope template and the run records disagree.** Risk: product artifact drift. This matters only if Q2 is
answered "still copied".
- `components/scope/template/CLAUDE.md` is a symlink to `AGENTS.md`, according to the snapshot listing.
- `runs/002-professional-presence-diagnostic/RUN.md:38` says the template "does not include CLAUDE.md or roles/".
- `RUN.md:45` resolves "Do not add CLAUDE.md".
- `components/scope/skills/scope-design.md:118` emits "AGENTS.md + CLAUDE.md symlink".
- Live roles belong in scope repositories at `roles/{role-id}/` (`components/agent/MODEL.md:66-86`), but the
  template has no `roles/`, which run 002 added by hand (`RUN.md:230`).

**F9. Paths to sibling repositories disagree.** Risk: stale references.
- `components.yaml:35`, `:51`, `:56`, `:61`, `:66`, `:71`, `:76` and `:81` use `../scope`, `../library`,
  `../seed`, `../entropy-guard`, `../entropy-immune-system`, `../git-sync`, `../flowbook` and `../flowvoice`.
- `README.md:43-50` uses `../../` for the same repositories.
- The recorded layout matches README:
  - `DECISIONS.md:174-178` puts tools flat in `~/pro/` and design repositories in `~/pro/agentic/`;
  - `SCOPES_PLANNED.md:71` lists these tools under `~/pro/`;
  - `runs/001-moving-stillness-status/RUN.md:29` places this repository at `~/pro/agentic/agentic-architecture`.
- Whether any of the paths resolves was not checked; they point outside the target.

**F10. Root decisions are restated locally, and an example identifier disagrees with the real one.** Risk:
local-global inversion. Low.
- `components/orchestrator/DECISIONS.md:18-29` repeats `DECISIONS.md:489-500`, with the same date and content.
- The 2026-07-10 remotes/checkouts decision is recorded twice: `components/scope/DECISIONS.md:17-22` and
  `DECISIONS.md:758-780`.
- The example manifest at `DECISIONS.md:352` gives moving-stillness the id `0d779f2b-…`.
  `components/orchestrator/scope/scope.yaml:11` gives `379b2dbe-…`, which matches the `scope_id` that run 001 read
  from the live scope (`runs/001-moving-stillness-status/output.md`, Scope Identity table).

**F11. No steward is named for this repository.** Intent condition: missing.
- No file names an owner. `DECISIONS.md` entries are dated and never attributed.
- Every scope manifest names `justin` (`components/orchestrator/scope/scope.yaml:6`, `:23`, `:34`;
  `SCOPES_PLANNED.md:12`).
- The `planning` scope, which governs this repository, has no steward line (`SCOPES_PLANNED.md:76-82`).

**F12. The no-stale-docs rules are prose controls.**
- "No stale docs" (`AGENTS.md:26`; `architecture/INDEX.md:23`, "we control entropy") and "When a question is
  resolved, update all references" (`AGENTS.md:28`) are stated as invariants.
- The only enforcement is the hand-run guard, which calls itself "External (discipline-based)"
  (`skills/entropy-guard.md:114`).
- F3 and F4 show both rules unenforced.
- `PICKUP.md:15` cites the hygiene pass as done.

**F13. The archive banner cites a conclusion that `SCHEDULING.md` no longer holds.** Risk: superseded material. Low.
- `archive/scheduling-cronicle-investigation.md:3-8` says the "core-owned Postgres-backed temporal coordinator …
  behind the adapter boundary" is retained in `SCHEDULING.md`.
- `SCHEDULING.md:1-5` now describes an enqueue-only pg-boss V0 with no adapter (`DECISIONS.md:836-851`).

**F14. The scope inventory decision has a stale count.** Risk: stale description and lost decision. Low.
- `DECISIONS.md:201-203` says "Six scopes identified".
- `SCOPES_PLANNED.md` lists the root scope plus seven child scopes, including professional-presence (active,
  `:42-52`) and life-integration (`:84-86`).
- Professional-presence was made active during run 002 (`runs/002-professional-presence-diagnostic/RUN.md:14`,
  `:43`), with no `DECISIONS.md` entry.

**F15. No concept-to-successor map.** Intent condition: missing.
- The banners name two successors but no mapping. Concepts whose new home cannot be found from here:
  - the temporal coordinator contract, which `DECISIONS.md:847` calls authoritative in
    `components/temporal-coordinator/SPEC.md`;
  - the orchestration snapshot;
  - the role and scope templates;
  - the run method.

**Working well, noted for calibration:**
- Superseded decisions carry a struck-through body and a pointer to their replacement (`DECISIONS.md:53-57`,
  `:73-77`, `:481-485`, `:743-746`).
- The temporal coordinator contract is restated consistently in `SCHEDULING.md`, `RUNTIME.md:33-49`, `MODEL.md:88`,
  `ARCH.md` and `components.yaml:30`. All say enqueue-only, with no consumer; checked 2026-10-07.

---

## 4. Truth map

**Document roles:**

| Role | Documents |
|---|---|
| Canonical | `NORTH_STAR.md` (vision and values); `MODEL.md` (system model, five-layer stack); `DECISIONS.md` (decisions and the open-question registry); `architecture/INDEX.md` with `snapshots/2026-07-16-orchestration/ARCH.md` (orchestration anatomy); `components.yaml` (component status); `MANIFEST.md` (tools); `SCOPES_PLANNED.md` (scope inventory); `RUNTIME.md` (runtime view); `components/temporal-coordinator/SPEC.md` (TC contract, `DECISIONS.md:847`) |
| Current state | `ROADMAP.md` (read first, `AGENTS.md:38`); `components/scope/TODO.md`; `components/orchestrator/TODO.md`; `runs/README.md` (status of the run line); the "Pickup" sections in `runs/*/RUN.md`; `architecture/PICKUP.md` (superseded) |
| Local elaboration | `components/{scope,agent,orchestrator}/{MODEL,DECISIONS,PLAN}.md`; `components/scope/LEARNINGS.md`; `components/temporal-coordinator/PLAN.md` |
| Product artifact | `components/scope/template/`, `components/agent/template/`, `components/orchestrator/scope/` (draft root scope), `components/scope/skills/scope-design.md`, `components/agent/skills/role-design.md`, `roles/professional-presence-profile-editor/`, `skills/entropy-guard.md`, `skills/session-kickoff.md` |
| Agent instructions | `AGENTS.md`, with `CLAUDE.md` symlinked to it (root, scope template, root-scope draft) |
| Historical, superseded or imported | `archive/scheduling-cronicle-investigation.md`; `architecture/PICKUP.md`; `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`; `ORCHESTRATION.md` (a redirect stub); `runs/00{1,2,3}-*`; the superseded entries in `DECISIONS.md`; the undated research notes `AUTH_OPTIONS_ANALYSIS.md` and `PI_AGENT_OVERVIEW.md`. Under A1, the whole repository is now reference. |

**Concepts:**

| Concept | Canonical home | Also stated in | State |
|---|---|---|---|
| Repository status and authority | banners at `README.md:3-5` and `AGENTS.md:3-6` | nowhere else | F1; a `DECISIONS.md` entry is proposed |
| Settled positions | `DECISIONS.md` | summary at `AGENTS.md:16-34` (`AGENTS.md:14` asks for both to be updated together) | consistent where checked |
| Architectural open questions | `DECISIONS.md:875-896` | snapshot "Under Review"; AUTH note; skill sections; component docs | F5, F3 |
| Orchestration anatomy | the snapshot, through `INDEX.md` | `MODEL.md:78`, `:86` point to it; `RUNTIME.md:57-84` restates it | F4 |
| Temporal coordinator contract | `components/temporal-coordinator/SPEC.md` | `SCHEDULING.md`, `RUNTIME.md:33-49`, `MODEL.md:88`, `ARCH.md`, `components.yaml:30` | consistent |
| Component status | `components.yaml` | `MODEL.md`, `ROADMAP.md` | frozen (F1) |
| Scope schema v2 | `components/scope/template/scope.yaml` and `components/scope/DECISIONS.md:17-22` | `DECISIONS.md:758-780`; `components/scope/MODEL.md:13-20` | decision recorded twice (F10) |
| Manifest field set | `DECISIONS.md:462-477` | `AGENTS.md:30`, `MODEL.md:62`, `components/scope/PLAN.md:32` | consistent |
| Root scope name | `DECISIONS.md:489-500` | `components/orchestrator/DECISIONS.md:18-29` | duplicate (F10) |
| Scope inventory | `SCOPES_PLANNED.md` | `DECISIONS.md:201-203`; the root-scope manifest | F14 |
| Local directory layout | `DECISIONS.md:174-178` | `README.md` Related (agrees); `components.yaml` (disagrees) | F9 |
| Role and binding pattern | `components/agent/DECISIONS.md` and its template | `components/agent/MODEL.md`, `role-design.md` | consistent |

---

## 5. Loop map

**As documented** (`AGENTS.md:36-72`):
1. An agent loads `AGENTS.md`: automatically in Claude Code through the `CLAUDE.md` symlink, and in Pi, which loads
   it by default (`runs/001-moving-stillness-status/RUN.md:74`, `:83`).
2. It reads `ROADMAP.md`, `MODEL.md`, `DECISIONS.md` and `components.yaml`, then the component docs.
3. It builds the kickoff packet in the conversation (no file) and chooses work from it.
4. It checks "conclusion or deliberation".
5. It edits.
6. It runs `skills/entropy-guard.md` before a non-trivial commit, then commits.

**Where things are captured:**
- Decisions go to root and component `DECISIONS.md`.
- Learnings go to `components/scope/LEARNINGS.md` and to the run findings. The root has no LEARNINGS file.

**Handoff happens through:**
- commits;
- `architecture/PICKUP.md` (until 2026-07-26);
- "Pickup — start here next session" sections in run records (`runs/001-moving-stillness-status/RUN.md:112`);
- component `TODO.md` "Doing Now" (`components/scope/TODO.md:5-7`).

**As it really is** (from what the snapshot shows):
- A fresh agent meets the reference-only banner on line 3 of `AGENTS.md`, then roughly 110 lines describing the
  active loop (F1).
- No durable state file exists apart from ROADMAP. The kickoff packet is never written down.
- The guard is hand-run, and its snapshot was last refreshed on 2026-04-27, while decisions continued to 2026-07-26
  (F2).
- Without git, it cannot be told whether the guard was run. No CI, PR template or hook folder exists in the snapshot.

---

## 6. Ranked risks

| Rank | Risk | Findings | Decay rate | Recovery cost | Fix anchored in |
|---|---|---|---|---|---|
| 1 | A fresh session takes the repository as current authority and works from its frozen queue | F1, F2 | Immediate, every session: `AGENTS.md` loads automatically, and its body leads into the active loop | High. Work built on the old blueprint has to be found and undone, and it can carry into the successor repositories, the cross-layer drift `DECISIONS.md:125` calls the most dangerous kind | A1, copied into `DECISIONS.md`; the ROADMAP Status block |
| 2 | Readers get wrong "open or settled" answers from stale references and superseded wording, while hygiene is reported complete | F3, F4, F12, F13 | Already decayed; static if the repository stays frozen | Low per item (about 13 one-line corrections); the misleading answers cost more | `DECISIONS.md` entries of 2026-04-27 and 2026-07-16 |
| 3 | Decisions and learnings that exist only in runs and notes, and are lost to anyone carrying the work forward | F7, F14, F15 | Done, and growing harder to recover as the context fades | Medium: the run records have to be reread | `DECISIONS.md`, or the successor repositories (Q3) |
| 4 | Template drift, if the templates are still copied | F8 | Fires on each new scope or role | Medium per scope | Q2 |
| 5 | Two homes for open questions | F5 | Slow now | Low while frozen | Unresolved conflict; not worth resolving in a frozen repository |

---

## 7. Existing guard surfaces

Sorted by whether they execute, following `entropy-assessment/mixed-profile.md`, with each surface's disposition from
docs-first Step 7.

| Executes? | Surface | Disposition |
|---|---|---|
| Runs by itself | None found. The snapshot has no `.github/`, `.githooks/`, `.husky/` or `.pre-commit-config.yaml`. | — |
| Loaded automatically, checks nothing | `AGENTS.md` (through the `CLAUDE.md` symlink; Pi loads it by default) | **Amend:** session start and the status lines (`status-correction.patch`) |
| Runs only by hand | `skills/entropy-guard.md` (mandated at `AGENTS.md:72`) | **Replace in place** with `guard/SKILL.md`, provisional on Q1 |
| Runs only by hand | `skills/session-kickoff.md` (`AGENTS.md:43`) | **Demote:** marked historical by the patch |
| Decided, not built | the "Prompted" reminder (`skills/entropy-guard.md:118`); "Entropy guard: automated coherence checks on hooks" (`ROADMAP.md:69`) | **Demote:** reference-only status removes the reason. Frozen with ROADMAP. |
| Declared but missing | `skills/run-experiment.md` (`runs/README.md:24`; `runs/001-moving-stillness-status/RUN.md:100`, `:124`). A workflow skill, not a guard. | Leave as a historical intention (Q3) |
| Unknown | git hooks in the real checkout (`core.hooksPath`, `.git/hooks/`). The snapshot has no `.git`. | Check in the real repository (`integration.md`) |

---

## 8. Is a guard needed? (entropy-assessment Step 3)

**The decision:** no new guard. Refine the existing guard to fit a reference-only repository.

The skills allow a reference-only repository to finish "with a correction or a demotion and no generated guard",
and say it "usually needs no new guard". This repository already has a guard that its own loop mandates
(`AGENTS.md:72`), and the existing guard is part of the problem (F2), so it cannot be left as it is.

| Option | Cost | Result |
|---|---|---|
| Leave the guard | nothing | Its checklist keeps telling authorised sessions to maintain ROADMAP progress and component statuses as if live. |
| Demote the guard | edits to `AGENTS.md:72` and the guard | No check remains on the authorised edits the banner allows. |
| Refine in place (chosen) | one file replaced, same path | Existing pointers keep working, and the check fits reference-only work. |

The choice depends on Q1:
- If the steward answers that the repository is **frozen**, demote instead: mark `skills/entropy-guard.md` historical,
  remove `AGENTS.md:72`, and drop `guard/SKILL.md`.
- The status corrections (F1) are needed either way.

---

## 9. Recommendations: consolidate, demote, mark historical

**Corrected by `status-correction.patch`.** None of these depends on Q1-Q3:

- **Record the reference-only status in `DECISIONS.md`:** a new entry copying A1 from the banners, marked as
  awaiting the steward's date.
- **`ROADMAP.md` becomes the state file:** a new Status block (section 11).
- **`AGENTS.md`:**
  - line 8 is reworded so it no longer claims "holds the current architecture state";
  - the "Settled" list is marked historical, noting that Q2 is open;
  - session start is rewritten for a reference-only repository;
  - the Key files entry for the kickoff is marked historical.
- **`README.md:7`, `:9`:** set in the past tense, with a pointer to the Status block.
- **`components.yaml`:** a header comment saying its statuses are frozen. The statuses themselves are not rewritten.
- **`architecture/INDEX.md` "Current Pickup":** now says none, and that `PICKUP.md` is superseded.
- **`skills/session-kickoff.md` and `skills/README.md`:** the kickoff is demoted to historical.

**Depend on the steward's answers:**

- **Q1:** replace or retire `skills/entropy-guard.md`.
- **Q2:** mark `components/scope/template/` and `components/agent/template/` historical, or fix F8 in them.
- **Q3:** freeze the open-work lists, or migrate them.

**Consolidations not recommended while the repository is frozen:**

- **F5:** merging the open-question homes.
- **F10:** removing the duplicate component decisions.

Both are historical records now. Rewriting them would be reinterpretation, which the banner rules out.

---

## 10. One-time cleanup

These items are conditional on Q1 being answered "(b) authorised edits". Each was verified against the current file
on 2026-10-07. They are tracked as next action 2 in the ROADMAP Status block, not in the guard.

| # | File and line | Now says | Correct to, citing |
|---|---|---|---|
| C1 | `components/agent/DECISIONS.md:12` | "inter-agent communication and runtime setup are still open questions" | settled; cite `DECISIONS.md` 2026-04-27, "Communication is HTTP + JSON-RPC…" and "A running agent is a harness…" |
| C2 | `components/orchestrator/DECISIONS.md:13` | "(mechanism TBD)" | HTTP + JSON-RPC with an A2A-compatible task lifecycle (`DECISIONS.md:551`) |
| C3 | `components/orchestrator/PLAN.md:28` | "format TBD — see root DECISIONS.md open questions" | in memory from `scope.yaml` (`DECISIONS.md:612-618`) |
| C4 | `components/orchestrator/PLAN.md:29` | "whatever mechanism is chosen" | the HTTP + JSON-RPC task lifecycle (`DECISIONS.md:551`) |
| C5 | `components/orchestrator/MODEL.md:84-86` | "Cross-scope workflow exposure model" listed as tracked in the registry | direction set at `DECISIONS.md:666-670`; not in the registry |
| C6 | `SCOPES_PLANNED.md:30` | the question text, with a link to the open questions | link to `DECISIONS.md:666-670` |
| C7 | `SCOPES_PLANNED.md:90` | "sandbox isolation model, workspace lifecycle triggers, agent runtime binding location" listed as open | drop those three (`DECISIONS.md:275-285`, `:639-650`, `:688-692`) |
| C8 | `components/scope/skills/scope-design.md:155` | "Skill injection is an open question" | settled at `DECISIONS.md:674-678` |
| C9 | `components/scope/TODO.md:39` | "[ ] Design workspace lifecycle…" | decided at system level (`DECISIONS.md:639-650`) |
| C10 | `RUNTIME.md:67`, `:82` | "unified for v0"; "unified sandbox gateway" | the single sandbox security perimeter, with seams under review (`DECISIONS.md:575`; `ARCH.md:22`) |
| C11 | `RUNTIME.md:126` | "See open questions in DECISIONS.md" | `DECISIONS.md:696-698`, the sandbox provider decision (direction set) |
| C12 | `archive/scheduling-cronicle-investigation.md:3-8` | the conclusion it says is "retained in SCHEDULING.md" | add "superseded again 2026-07-26: pg-boss enqueue-only V0, no adapter (`DECISIONS.md:836-851`)" |
| C13 | `components.yaml:35`, `:51`, `:56`, `:61`, `:66`, `:71`, `:76`, `:81` | `../scope`, `../library`, and so on | `../../…`, per `DECISIONS.md:174-178` and `SCOPES_PLANNED.md:71`; check that each path resolves first |

---

## 11. State-file update

The existing state file is `ROADMAP.md`, which the documented loop reads first (`AGENTS.md:38`). No competing
summary is added. `status-correction.patch` adds a "Status — reference-only" block to the top of `ROADMAP.md`.

**What the block holds:**
- the stage;
- what to trust first;
- live work: none;
- Q1-Q3;
- misleading material nearby;
- next actions.

**How it meets the rules for claims:**
- Each claim likely to change carries its source and the date it was checked (2026-10-07).
- The block says what makes it stale and who refreshes it.
- The successor paths are labelled as not checked.

**How the patch was validated:**
- `git apply --check --whitespace=error-all` passed against copies of the 8 target files.
- Applying it reproduced the edited copies exactly.

**The 8 files it touches:** `README.md`, `AGENTS.md`, `ROADMAP.md`, `DECISIONS.md`, `components.yaml`,
`architecture/INDEX.md`, `skills/session-kickoff.md`, `skills/README.md`.

**Checked against the open questions, so the patch settles none of them:**
- **Q1:** `AGENTS.md:72` and `skills/entropy-guard.md` are untouched.
- **Q2:** the templates are untouched, and the patched `AGENTS.md` names Q2 as open.
- **Q3:** the lists are called "not live work in this repository", and the patch says that whether items move is
  open.

---

## 12. Checks supplied to the generator

The docs-first matrix was written against this repository's files:

| Matrix risk | Check for this repository | Findings |
|---|---|---|
| State dishonesty | Statements of direction, status, open work or next steps must not present the repository as current authority; the banners, Status block and `DECISIONS.md` entry must agree. | F1, F2 |
| Superseded material nearby | Superseded markers name their replacement, and the index files say the same. | F4, F5 (INDEX), F13 |
| Stale references | "Open" claims are checked against `DECISIONS.md`; sibling paths are checked against `DECISIONS.md:174-178`; links go through lychee when it is installed. | F3, F9 |
| Lost decisions and learnings | A session's decisions and learnings go to `DECISIONS.md` or are named for a successor repository. | F7, F14 |
| Parallel truth | The contract line: decide the owner, reduce the other to a link. | F10 |
| Workflow drift | Covered by placing the guard and amending `AGENTS.md` session start (`integration.md`), not by a check. | F2 |
| Brittle automation | Only the link check is automated; nothing that depends on wording. | — |

Left out:
- Template checks, because Q2 is open.
- Snapshot-versioning checks (F6), because no new snapshots are expected in a reference-only repository.

---

## 13. Generator report

`session-coherence-skill-generator` v0.4.0, run in **plan mode**: the target is read-only, and the stricter of the
runtime mode and the wording wins.

**Inputs supplied:**
- the steward (F11, inferred);
- the intent documents (A1 banners, `NORTH_STAR.md`) and the decision surface (`DECISIONS.md`);
- Q1-Q3;
- the state file: the `ROADMAP.md` Status block, refreshed by whoever changes the status.

**Inputs with nothing to supply:**
- Rules owned elsewhere: a user-wide instructions file may apply, but none is referenced from the target and none
  was read (out of bounds).
- Verification commands: none in the repository, and no CI.
- Code areas: none.
- Live state or spend a session can change: none from this repository. The runs used a subscription model login,
  but they are paused (`runs/README.md:7-9`).

**The guard:**
- `guard/SKILL.md` replaces `skills/entropy-guard.md` in place.
- The path and the name `entropy-guard` are kept, so `AGENTS.md:72`, `:103` and `skills/README.md:8` stay valid and
  no second name appears.
- It is provisional on Q1 being answered (b).

**Size and J:**
- **J = 6** repo-specific checks. The two contract lines are counted in the 450 base.
- **Budget:** 450 + 36 × 6 + S 84 + C 28 = **778** words.
- **Actual:** 778 words, after cutting 6 words of restatement from a 784-word draft. The old guard was 1,325 words.

**Review before handover:**
- The patch was checked against Q1-Q3 (section 11).
- The guard's repair instructions route new work to the successor repositories, or to a proposal in `DECISIONS.md`.
  This is consistent with A1.
- If Q2 is answered "still copied", add one check: if `components/*/template/` changed, does it match the component
  `DECISIONS.md` files and the `CLAUDE.md` and `roles/` choices at
  `runs/002-professional-presence-diagnostic/RUN.md:45`, `:230`?

**Doc references:**
- None added. The existing pointers already reach the path.
- The kickoff references were demoted in the patch.

**Validation run:**
- `git diff --check` on the guard found no whitespace errors.
- The patch check is in section 11.
- lychee was not run: there is no git checkout here.

**Open questions the guard leaves visible:** Q1-Q3, in the Status block it points to.

**Handoff:** to `guards-integrator`, in `integration.md`.

---

## 14. Next step

1. The steward answers Q1-Q3 (`questions.md`) and dates the reference-only entry.
2. Apply `status-correction.patch`. It does not depend on the answers.
3. If Q1 is answered (b): replace `skills/entropy-guard.md` with `guard/SKILL.md`, apply the cleanup C1-C13, and
   verify adoption as described in `integration.md`.

---

## 15. Uncertainties and what was not covered

- **No git metadata.** There is no commit history (the enacted reading rests on dated records only), no hooks
  configuration, no remote name (the guard assumes `origin/main`), and no way to tell whether the old guard was ever
  run.
- **Banner date and author unknown.** A1's chronology relative to the other content is inferred.
- **Out of bounds, not read:**
  - the sibling and successor repositories (`../personal-agent`, `../../scope`, `../agentic-learning`,
    `../temporal-coordinator`, `../agentic-architecture-distribution`), so no pointer into them was resolved;
  - any user-wide agent instructions.
- **Only partly read:**
  - `archive/scheduling-cronicle-investigation.md`: header and headings;
  - `runs/*/events.jsonl` and `runs/*/output.md`: samples and the identity table only;
  - `runs/003-professional-presence-opening-proposals/output.md`: not read.
- **Not checked:** whether OpenCode, the secondary interface in `MANIFEST.md:11`, loads `AGENTS.md`.
- **Machine-specific paths.** The checkout paths in `components/orchestrator/scope/scope.yaml:21`, `:32`
  (`/home/justin/...`) differ from the home directory run 001 used (`/home/justin-philpott/...`,
  `runs/001-moving-stillness-status/RUN.md:29`). Run 002 used `/home/justin/...`, so this looks like two machines
  rather than an error. Not raised as a finding.
