# Entropy assessment: agentic-architecture

- **Target:** `eval/targets/agentic-architecture`, a read-only copy with no `.git`. Read on 2026-10-07. Line numbers
  below refer to that copy.
- **Skills used:** `entropy-assessment` 0.9.0 (with `intent-pass.md` and intent-change rule v2), then
  `docs-first-planning-assessment` 0.3.0 as a called skill. `session-coherence-skill-generator` 0.5.0 was read for its
  list of inputs only; it was not invoked.
- **Mode:** outputs are written to this folder; nothing in the target is changed. Every proposed change is a patch,
  none applied.

## Route taken

1. `entropy-assessment` Step 1: the intent pass.
2. Step 2: lifecycle is **reference-only**; shape is **A, docs-first planning**.
3. `docs-first-planning-assessment` Steps 1 to 7, run as a called skill, returned to Step 3.
4. Step 3: guard decision **`none`**, finishing with corrections (settled) and a demotion of the existing guard
   (provisional, question Q3).
5. Step 4: no handover. The generator is not invoked for `none`, so `guards-integrator` is not reached.

## Intent

### Steward

No document names the steward of this repository (finding F2). The evidence points to Justin:
- the root scope draft's `steward: "justin"` (`components/orchestrator/scope/scope.yaml:6`);
- the repo's own URL, `github.com/justinphilpott/agentic-architecture` (`components/orchestrator/scope/README.md:3`);
- `NORTH_STAR.md:3`, "a personal agentic system";
- run records naming him (`runs/001-moving-stillness-status/RUN.md:41`).

This assessment treats Justin as the steward. Confirming it is part of Q1.

### Authorised intent, with sources

| Statement | Where | Kind | Evidence of authority | Date |
|---|---|---|---|---|
| Reference-only; no longer current architecture authority. Successors are `../personal-agent` (Personal Agent architecture) and `../../scope` (Scope and Project model). Do not extend or reinterpret the blueprint as current design without explicit authorization. | `README.md:3-5`, `AGENTS.md:3-6` | directive (status banner) | neither attributed nor dated | none; later than the body text, which it calls "no longer" current |
| Vision and design values | `NORTH_STAR.md` | description of intent | neither | none |
| System decisions, and the open-question registry | `DECISIONS.md` | decisions | dated, not attributed | 2026-02-27 to 2026-07-26 |
| "Settled" positions | `AGENTS.md:12-33` | directives, summarising decisions | neither | none |
| Component-local decisions | `components/*/DECISIONS.md` | decisions | dated, not attributed | 2026-02-27 to 2026-07-10 |
| Snapshot rules: the current snapshot owns its domain's anatomy | `architecture/INDEX.md:5`, `:21`; `DECISIONS.md:855-861` | decision | dated | 2026-07-16 |

The banner is the governing statement. It carries no date or author. Missing attribution does not make it an
inference (intent pass §1), and the system's precedence ranks a directive over a description (§2). So it settles the
lifecycle, and the uncertainty about its date and author stays visible in Q1.

### Three readings

- **Declared:** an active, "bleeding-edge design source for the current named version" (`README.md:9`), holding "the
  current architecture state" (`AGENTS.md:8`), with a roadmap "working towards next" (`ROADMAP.md:12`). The banner
  above both says the opposite.
- **Enacted:** the last dated work is the temporal coordinator pg-boss V0 decision (`DECISIONS.md:836`, 2026-07-26).
  It was propagated to SPEC, PLAN, SCHEDULING, RUNTIME, MODEL, the snapshot and PICKUP, which was marked superseded
  (`architecture/PICKUP.md:3`). The run line paused after Run 003 (`runs/README.md:7-9`, 2026-05). The banner is the
  last apparent change. There is no git history, so the enacted reading rests on dated text only.
- **Authorised:** reference-only, per the banner. The decisions in `DECISIONS.md` are authorised history, not current
  authority.

### Gaps, by condition

- **Stale description:** F3, F4, F5, F6 (against the banner); F11 (against later decisions in `DECISIONS.md`).
- **Conflict:** F7, between the banner and the active-work instructions; F12, on orchestrator authority.
- **Missing:** F1, no dated record of the reference-only call; F2, no named steward.
- **Ambiguous:** what "do not extend or reinterpret" permits in maintenance (Q2).
- **Unauthorised drift:** F14 (`display_name` in manifest entries); F15 (subscription auth used against the recorded
  working decision). Both are recorded, not fixed, because the repo is reference-only.
- **Prose control:** F17.

### The existing guard, read against the intent-change rule

The existing guard is `skills/entropy-guard.md`.
- **Intent flags** (F8): `:32`, `:79` and `:31`. It also carries no intent-change rule.
- **Ownership flags** (F9): `:38`, `:39`, `:40`, `:41`. The guard also copies a definition at `:57`, and copies state
  into its frontmatter at `:7`.

### Questions and proposed changes

- **Questions:** Q1 to Q3, in `questions.md`, each with a recommended answer.
- **Proposed record:** the reference-only entry for `DECISIONS.md`, drafted in `provisional-Q1.patch`. It awaits the
  steward and is recorded nowhere in the target, which is read-only.
- **Intent changes:** none proposed.

## Lifecycle, shape and repositories

- **Lifecycle: reference-only.**
  - **Evidence for:** `README.md:3-5`, `AGENTS.md:3-6`. `AGENTS.md` is auto-loaded through the `CLAUDE.md` symlink;
    Pi also auto-loads `AGENTS.md` (`runs/001-moving-stillness-status/RUN.md:74`).
  - **Consistent with it:** the paused run line (`runs/README.md:7`), and PICKUP marked superseded
    (`architecture/PICKUP.md:3`).
  - **Contrary text:** F3 to F6. All of it is description, outranked by the directive.
- **Shape: A, docs-first planning.** Markdown is the product. There is no code, CI or hooks (`skills/entropy-guard.md:7`
  says so too). Decision logs, TODOs, RUN pickups and agent instructions carry state, and work ran in repeated
  sessions. Shape D, workflow-heavy, partly fits the session-start and kickoff rituals, but the docs-first matrix covers
  that as workflow drift. A is the riskier fit, so A was taken.
- **Repositories:** the system spans several.
  - Implementation repos: `../temporal-coordinator` and `../scope` (`components.yaml:29`, `:35`).
  - Successors: `../personal-agent` and `../../scope` (`README.md:3-5`).
  - Theory: `../agentic-learning`.
  - None of these could be read in this run, so they were not assessed together (see "Not covered").

## Findings

Each finding has an id, its evidence and its source. Other sections refer to these ids.

- **F1 — The reference-only call has no dated record.** The banner (`README.md:3-5`, `AGENTS.md:3-6`) has no date
  or author, and `DECISIONS.md` has no entry (the last is `:836`, 2026-07-26). The repo dates its history from dated
  decisions (`AGENTS.md:25`; `DECISIONS.md:869`), so this call cannot be placed. Missing. → Q1.
- **F2 — No document names this repo's steward.** Evidence under "Steward" above. Missing. → Q1.
- **F3 — "Current" claims contradict the banner.** `README.md:9` ("bleeding-edge design source for the current named
  version"); `AGENTS.md:8` ("This repo holds the current architecture state"); `AGENTS.md:12` and `:14` ("current
  strong positions", "These are the current settled positions"). Stale description. → settled patch.
- **F4 — INDEX points to a superseded pickup as current.** `architecture/INDEX.md:15-17` says "Current Pickup… Next
  architecture work starts at PICKUP.md", but `architecture/PICKUP.md:3` says "superseded historical pickup point
  (2026-07-26)". Contradictory state. → settled patch.
- **F5 — The state file reads as active.** `ROADMAP.md` is the first file `AGENTS.md:38` (session start, step 1) sends
  a session to. It still reads "Current named version" (`:3`) and lists open items under "Working towards next"
  (`:12-27`), with no current-state section. State dishonesty. → settled patch (docs-first Step 5).
- **F6 — Component statuses read as current.** `components.yaml` statuses are `in-progress` (`:18`, `:27`, `:33`,
  `:39`), and session start step 4 reads them (`AGENTS.md:41`), with no lifecycle pointer. → settled patch, a header
  comment.
- **F7 — Active-work instructions conflict with the banner.** These lead a fresh session to choose and do blueprint
  work, which the banner forbids without explicit authorization:
  - session start (`AGENTS.md:36-45`, ending in "the 1-3 most plausible next actions" at `:43`);
  - `skills/session-kickoff.md` ("Likely Next Actions", `:108`);
  - "Before committing non-trivial changes, run skills/entropy-guard.md" (`AGENTS.md:72`);
  - the working practices (`AGENTS.md:60-72`).

  Both sides are directives, and no recorded decision says which wins. Conflict. → Q3, provisional patch.
- **F8 — Existing guard, intent flags.** Each is a path for unauthorised drift:
  - `skills/entropy-guard.md:32`: "Does ROADMAP.md 'working towards next' reflect the actual current state of
    component work?" This makes the forward plan follow the work. Those lists hold committed targets
    (`DECISIONS.md:450`).
  - `:79`: "If a component's status has changed, update components.yaml". Raising a status needs explicit
    instruction (`AGENTS.md:71`; `DECISIONS.md:39-41`).
  - `:31`: "Do decisions in DECISIONS.md align with descriptions in MODEL.md, RUNTIME.md, and NORTH_STAR.md?" It gives
    no direction for repair. `NORTH_STAR.md` is an intent document, and nothing says it changes only on a steward
    decision.
  - The guard has no intent-change rule.
- **F9 — Existing guard, ownership flags, staleness and copied state.**
  - **Ownership.** These checks keep several independent copies in step, where they should reduce them to links:
    - `:38`: "Is the scope manager consistently described across MODEL.md, RUNTIME.md, and components.yaml?" Since
      2026-07-16 the snapshot owns that anatomy, and prose must not restate it (`DECISIONS.md:857`;
      `architecture/INDEX.md:21`).
    - `:39`: "…consistently state it has no secrets and no scope repo access across all files?" (see also F12);
    - `:40`: the manifest/interior description across four files;
    - `:41`: the workflow convention across four docs.
  - **Not flagged:** `:36`. RUNTIME's diagram is a declared zoomed view of the stack (`RUNTIME.md:7`), a projection
    rather than a competing definition.
  - **Copied definition:** `:57` restates the manifest field list owned by `DECISIONS.md:466-475`.
  - **Copied state:** the frontmatter at `:7` holds current state, now stale ("Open questions reduced from 22 to 11";
    the registry now holds 7 open and 6 deferred, `DECISIONS.md:879-896`).
  - **Stale:** generated 2026-04-02 and last evaluated 2026-04-27. It predates the snapshots (2026-07-16), the TC V0
    (2026-07-26) and the banner.
- **F10 — Open-question text repeated outside the registry, and stale.** The repo's rule is to "never duplicate the
  question text" (`AGENTS.md:28`; `DECISIONS.md:305-309`).
  - `SCOPES_PLANNED.md:90` lists as open "sandbox isolation model, workspace lifecycle triggers, agent runtime binding
    location". The second is resolved at `DECISIONS.md:650` and the third at `:692`; the first is not in the registry
    (`:879-896`).
  - `SCOPES_PLANNED.md:30` sends a direction-set item to `#open-questions` (`DECISIONS.md:666`).
  - `components/orchestrator/MODEL.md:84-87` restates question text, and says "Cross-scope workflow exposure model" is
    tracked in the registry. It is not.

  Parallel truth. → Q2.
- **F11 — Component docs list resolved items as open.** Stale description. → Q2.
  - `components/agent/DECISIONS.md:12`, "inter-agent communication and runtime setup are still open questions",
    against `DECISIONS.md:559` and `:635`.
  - `components/orchestrator/DECISIONS.md:13`, "(mechanism TBD)", against `DECISIONS.md:551-559`.
  - `components/orchestrator/PLAN.md:28`, "format TBD", against `DECISIONS.md:612-618`.
- **F12 — Conflict on orchestrator authority.** No recorded decision supersedes the older text. Both sides are
  presented; no patch changes either.
  - **One side:** `AGENTS.md:30`, "No secrets, no repo access", and `DECISIONS.md:370` (2026-04-06), which is not
    marked superseded.
  - **The other side:** the orchestration snapshot v1, `architecture/snapshots/2026-07-16-orchestration/ARCH.md:68`,
    "Orchestrator authority is mode-tunable"; `MODEL.md:78`, "authority (scope access, secret reach…) is
    mode-tunable"; and `components.yaml:20`.
  - **Precedence:** the repo's own rule, "resolve by current snapshots/index and dated decisions" (`AGENTS.md:25`),
    points at the snapshot. But "scope access" being tunable is not plainly settled by any decision.
- **F13 — Superseded gateway wording survives, and PICKUP says it was removed.** `RUNTIME.md:67` ("Runtime gateway
  (unified for v0)") and `:82` ("unified sandbox gateway") keep the wording of the superseded decision
  (`DECISIONS.md:573-575`). `architecture/PICKUP.md:15` says this wording "has been cleaned up". `RUNTIME.md:57-84`
  also restates scope-manager anatomy that the snapshot owns. Parallel truth, and a false state claim in a document
  already marked superseded. → Q2, which fixes the wording only.
- **F14 — `display_name` added to manifest entries without a decision.** It appears in `kind: scope` entries
  (`components/orchestrator/scope/scope.yaml:14`, `:28`) and in the template's note
  (`components/scope/template/scope.yaml:20-22`). That is against `DECISIONS.md:475`: "Additional manifest fields
  should not be added until routing or auditing proves they are needed." The top-level `display_name` and `version`
  are also missing from the identity lists in `components/scope/MODEL.md:15` and `components/scope/DECISIONS.md:29`.
  Unauthorised drift. It is recorded, not fixed: the current scope schema belongs to the successor `../../scope`.
- **F15 — Runs used subscription auth against the recorded working decision.** `AUTH_OPTIONS_ANALYSIS.md:10-20` says
  "Current Working Decision: direct API-key auth… no subscription-auth plumbing yet". Runs 001 to 003 used Codex
  subscription login (`runs/001-moving-stillness-status/RUN.md:41`; Run 002, "Current facts"). The file also keeps
  its own "Open Questions" (`:246`). Unauthorised drift, small and historical. It is recorded, not fixed; the state
  section lists the file as misleading.
- **F16 — Sibling repo paths disagree.** In `components.yaml`, `repo: ../library` and the other tool entries
  (`:51-81`), and `implementation: ../scope` (`:35`), resolve to `~/pro/agentic/<name>`. But `DECISIONS.md:176` puts
  tools flat in `~/pro/`, and `README.md`'s Related table and `SCOPES_PLANNED.md:71` use `~/pro/<name>`. The TC path
  (`:29`) is unresolved: `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md:7` implies
  `~/pro/agentic/temporal-coordinator`. Stale references, unverified on disk; the layout record dates from 2026-04-04
  and 2026-04-28. → Q2.
- **F17 — Prose control.** `AGENTS.md:28`, "Architectural open questions live only in DECISIONS.md", is written as
  fact. Its only enforcement would be the guard's check at `skills/entropy-guard.md:45`, which runs by discipline
  only (`:114`), and the rule is violated (F10, F15). Only the guard's rationale cites it (`:105`), and never as a
  safety control. Reported only.
- **F18 — Small navigation gaps.** `README.md:16-35` and the key files in `AGENTS.md` omit
  `components/temporal-coordinator/` and `archive/`. Step 5 of session start (`AGENTS.md:42`) expects MODEL.md and
  DECISIONS.md for each component; temporal-coordinator has neither. A scaffold placeholder survives at
  `runs/001-moving-stillness-status/RUN.md:76`. → Q2, navigation and placeholder.
- **F19 — A run finding was never decided.** Run 001 proposed "Pi's event types become the v0 of the runtime event
  log schema — record as a decision" (`RUN.md:85`, `:117`). `DECISIONS.md:731` records only that Pi's stream "is the
  seed", and `ROADMAP.md:26` keeps the schema open. This is a proposal that was never decided, not a decision to
  record. Noted for the successor.
- **F20 — One role, defined twice across repos.** Run 002 found that a boundary change had to be made in both the
  reference role here (`roles/professional-presence-profile-editor/`) and its live copy in the scope repo ("Copy-from-
  reference drift risk is real", Run 002 Findings). With this repo reference-only, the live copy owns the role. Noted.

## Truth map

| Concept | Canonical home | Also stated in |
|---|---|---|
| Lifecycle status | `README.md:3-5` | `AGENTS.md:3-6` (summary, kept); contradicted by F3 to F6 |
| Vision and values | `NORTH_STAR.md` | none that compete |
| System decisions | `DECISIONS.md` | `AGENTS.md:12-33` (summary that has drifted: F12) |
| Open questions | `DECISIONS.md:875-896` | duplicated: F10, F15; linked properly at `RUNTIME.md:167` |
| Orchestration anatomy (scope manager, modes, TC role) | snapshot v1, through `architecture/INDEX.md` | `RUNTIME.md:57-84` (competing: F13); `MODEL.md:86-88` and `components.yaml` (summaries that link) |
| TC V0 contract | `components/temporal-coordinator/SPEC.md` | `SCHEDULING.md`, `RUNTIME.md:33-49`, `PLAN.md` (summaries that link) |
| Manifest field set | `DECISIONS.md:462-475` | `AGENTS.md:30`, `MODEL.md:62`, `components/scope/PLAN.md:32`, guard `:57`; extended without a decision (F14) |
| Scope schema | `components/scope/template/scope.yaml` with `components/scope/DECISIONS.md` | `components/scope/MODEL.md:13-20`, which has drifted (F14) |
| Role and binding schema | `components/agent/template/` with `components/agent/DECISIONS.md` | the reference role in `roles/` (F20) |
| Component status | `components.yaml` | `MODEL.md`, `ROADMAP.md` |
| Steward | none (F2) | — |

The main documents, by role:
- **Canonical:** `README.md` (the banner), `NORTH_STAR.md`, `DECISIONS.md`, `MODEL.md`, the snapshot with
  `architecture/INDEX.md`, and `SPEC.md`.
- **Current state:** `ROADMAP.md`, `components/*/TODO.md`, `runs/README.md` and the RUN pickups. `PICKUP.md` was one
  and is now superseded.
- **Local elaboration:**
  - `components/*/MODEL.md`, `components/*/PLAN.md` and `components/*/DECISIONS.md`;
  - `components/scope/LEARNINGS.md`;
  - `RUNTIME.md`, `SCHEDULING.md` and `SCOPES_PLANNED.md`;
  - `ORCHESTRATION.md`, which is a stub pointer.
- **Product artifacts:**
  - the two templates;
  - the two design skills;
  - `skills/session-kickoff.md` and `skills/entropy-guard.md`;
  - `architecture/LANGUAGE.md` and `architecture/SCHEMA.md`;
  - the root scope draft;
  - `components.yaml`.
- **Historical:**
  - `archive/`;
  - `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`;
  - `architecture/PICKUP.md`;
  - the superseded entries in `DECISIONS.md`;
  - `runs/001-003`;
  - `PI_AGENT_OVERVIEW.md` and `AUTH_OPTIONS_ANALYSIS.md`;
  - `roles/`.

Under the banner, the whole repo is now historical, and the roles above describe how it was organised.

## Loop map

- **Documented loop:**
  1. Session start (`AGENTS.md:36-45`) reads `ROADMAP.md`, `MODEL.md`, `DECISIONS.md` and `components.yaml`, then
     component docs.
  2. The session-kickoff packet is built in conversation; nothing persists it.
  3. Work is chosen.
  4. `skills/entropy-guard.md` runs before commit (`AGENTS.md:72`).
  5. Decisions go to `DECISIONS.md`. Learnings go only to `components/scope/LEARNINGS.md`; there is no root learnings
     file. Run findings go to `RUN.md`.
- **Real loop, as far as the copy shows:**
  - **Last active period:** each change was propagated across the docs, and PICKUP and INTERFACE_REFINEMENT_PLAN were
    marked superseded with dates. The "no stale docs" practice held through 2026-07-26. Handoff was at commit; RUN
    files carried "Pickup — start here next session".
  - **Now:** the first thing any agent reads is the banner, since `CLAUDE.md` is a symlink to `AGENTS.md`. The next
    thing it reads is a procedure that sends it into the roadmap and to "next actions" (F7).
  - **Handoff:** no hooks or CI exist, so the handoff is discipline only.

## Ranked risks

1. **R1 — Workflow drift into a reference-only repo** (F7, F8, F3 to F6).
   - **Decay:** at every new session, because `AGENTS.md` is auto-loaded and its procedure ends in choosing work.
   - **Recovery cost:** high. Design work landing here instead of in the successors recreates the "two design repos for
     one system" reconciliation burden recorded at `DECISIONS.md:109`.
   - **Symptoms:** F4, F5, `skills/session-kickoff.md:108`, and the guard's repairs.
   - **Anchor:** `README.md:3-5`.
2. **R2 — State dishonesty on the first-read surfaces** (F4, F5, F6, `PICKUP.md:15` from F13).
   - **Decay:** already decayed; read every session.
   - **Recovery cost:** low.
   - **Anchor:** the new current-state section in `ROADMAP.md`.
3. **R3 — Parallel truth inside the historical record** (F10, F11, F12, F13, F17, F20).
   - **Decay:** frozen now, but it misleads anyone using the repo as a reference for "what was decided".
   - **Recovery cost:** medium. Q2 decides whether to pay it.
   - **Anchors:** `DECISIONS.md` and snapshot v1.
4. **R4 — Lost decisions** (F1, F2, F19).
   - **Decay:** grows as memory fades.
   - **Recovery cost:** cheap now, while the steward remembers the date; impossible later.
   - **Anchor:** `DECISIONS.md`.

Superseded material nearby is a low risk here. PICKUP, INTERFACE_REFINEMENT_PLAN, archive and the superseded TC
decisions all carry dated supersession markers.

## Recommendations

- **Mark historical** (settled patch): the "current" claims (F3), the INDEX pickup line (F4), the roadmap below a new
  current-state section (F5), and the component statuses (F6).
- **Demote** (provisional, Q3): `skills/entropy-guard.md`, `skills/session-kickoff.md`, the session start in AGENTS.md
  and its pre-commit instruction (F7, F8, F9).
- **Record** (provisional, Q1): the reference-only call, as a dated entry in `DECISIONS.md`, naming the steward (F1,
  F2).
- **Consolidate:** nothing beyond the above, because reference-only limits what to recommend. If Q2 is answered yes,
  apply the content corrections in `provisional-Q2.patch`.
- **Leave for the successors:** F12, F14, F15, F19 and F20 belong to whoever now owns the current model
  (`../personal-agent`, `../../scope`).

## One-time cleanup, verified against the current files

Each item was applied to a copy of the target by exact-text replacement. Each old text matched exactly once. All four
patches apply in this order with `patch -p1` from the repo root: settled, then Q1, Q2, Q3.

- **`settled.patch`** (touches no open question):
  - `README.md:9` and `AGENTS.md:8`, `:12`, `:14` (F3);
  - `architecture/INDEX.md:15-17` (F4);
  - `components.yaml`, a header comment (F6);
  - `ROADMAP.md`, the current-state section (F5, below).
- **`provisional-Q1.patch`** (Q1): a new `DECISIONS.md` entry, with placeholders for the date, the recording date and
  the steward.
- **`provisional-Q2.patch`** (Q2, apply only if the answer is yes):
  - `SCOPES_PLANNED.md:30`, `:90` (F10);
  - `components/orchestrator/MODEL.md:84-87` (F10);
  - `components/orchestrator/DECISIONS.md:13`, `components/orchestrator/PLAN.md:28`, `components/agent/DECISIONS.md:12`
    (F11);
  - `RUNTIME.md:67`, `:82` (F13);
  - the `components.yaml` sibling paths (F16; verify on disk first; the TC path is left alone);
  - the `README.md` navigation, and the placeholder at `runs/001-moving-stillness-status/RUN.md:76` (F18).
- **`provisional-Q3.patch`** (Q3):
  - replace the session start in `AGENTS.md` with a reference-only orientation;
  - demote the pre-commit instruction in `AGENTS.md:72`;
  - mark the two key-file entries for the skills "(historical)";
  - add historical notes to `skills/entropy-guard.md`, `skills/session-kickoff.md` and `skills/README.md`.

F12 and F14 are in no patch. F12 is a conflict that needs a decision, and F14 is drift with a decision owner outside
this repo.

## State-file update (docs-first Step 5)

The existing state file is `ROADMAP.md`, the first file session start reads. The settled patch inserts a "Current
state (read this first)" section at its top, and leaves the old roadmap below it, marked as historical. The section
holds:
- the stage, reference-only, citing the banner, with its date left as Q1;
- what to trust first, for current work (the successors, not checked from here) and for history;
- the last dated decision (2026-07-26), and no active fronts;
- Q1 to Q3, kept apart from the architectural open-question registry;
- misleading material nearby, not exhaustive;
- material written for active work, pending Q3;
- three next actions;
- what makes the section stale, and who refreshes it: whoever changes the README status note.

## Guard surfaces (docs-first Step 7)

| Surface | Where | Classification |
|---|---|---|
| Lifecycle banner | `README.md:3-5`; `AGENTS.md:3-6`, auto-loaded through the `CLAUDE.md` symlink | **keep**: the effective control for reference-only |
| Pre-commit guard | `skills/entropy-guard.md`, wired by `AGENTS.md:72` | **demote** (provisional, Q3): unsound for this lifecycle (F8, F9) |
| Session-start ritual | `AGENTS.md:36-45`; `skills/session-kickoff.md` | **demote** (provisional, Q3) |
| Working practices | `AGENTS.md:47-72` | **demote** by a note (provisional, Q3) |
| Templates and design skills | `components/*/template/`, `components/*/skills/` | **keep** as historical product artifacts |
| `runs/.gitignore` | keeps raw event streams out of git | **keep** |
| Hooks and CI | none exist | none |

The matrix's checks, written against this repo's files. A guard would use them only if Q3 is answered (d), a minimal
reference-only guard:
- **Parallel truth:** if a change touches orchestrator authority, compare `AGENTS.md:30` and `DECISIONS.md:370` with
  `ARCH.md:68`. Ownership is pending the steward (F12).
- **Local-global inversion:** the "inherited constraints" lists in `components/*/DECISIONS.md` should link root
  entries, not restate their status (F11).
- **Superseded material nearby:** before reviving anything from `PICKUP.md`, `INTERFACE_REFINEMENT_PLAN.md`,
  `archive/` or `DECISIONS.md:743-834`, check its supersession marker.
- **Stale references:** when a path changes, search for the old name. Compare the `components.yaml` paths with
  `DECISIONS.md:176`, and the README navigation with the files (F16, F18).
- **Lost decisions and learnings:** if the session produced a decision, add it to `DECISIONS.md` with its date (F1,
  F19).
- **State dishonesty:** does the current-state section of `ROADMAP.md` still agree with the README banner and the
  INDEX pickup line?
- **Workflow drift:** would a fresh agent following `AGENTS.md` have extended the blueprint where this session did
  not? (F7)
- **Brittle automation:** none exists. Keep every check as judgment.

## Guard decision and the generator's inputs

**Decision: `none`.**
- The lifecycle is reference-only (`README.md:3-5`). `entropy-assessment` Step 3 and docs-first Step 7 both point to
  `none` for this case.
- The existing guard is not to be updated, because it is unsound for this lifecycle. It is demoted instead, which
  `none` allows ("may finish with a correction or a demotion").
- If the steward answers Q3 with (d), a minimal reference-only guard, the decision becomes `update`. The route would
  then re-enter at the generator with the inputs below.

The generator's inputs, with each inapplicable or unresolved one marked:

| Input | Value |
|---|---|
| Steward | Justin, inferred (F2). **Unresolved** formally (Q1). |
| Intent documents | `README.md:3-5` and `AGENTS.md:3-6` (lifecycle). Historical: `NORTH_STAR.md`, the settled list in `AGENTS.md`, `DECISIONS.md`. |
| Decision surface | `DECISIONS.md` for system decisions; `components/*/DECISIONS.md` for component-local ones. |
| Open intent questions | Q1, Q2, Q3. |
| Current-state file, and who refreshes it | `ROADMAP.md`, its "Current state" section (from the settled patch). Whoever changes the README status note refreshes it. |
| Rules bound but not owned | None found in the repo. Any user-wide instruction files were outside this run's reach: **unresolved**. |
| Verification commands | None: no build, tests, CI or hooks. **Inapplicable.** |
| Code areas | None; templates only. **Inapplicable.** |
| Live state or spend a session can change | None in this repo. Re-running a `runs/` procedure would use a model subscription (`RUN.md:41`); the line is paused (`runs/README.md:7-9`). |
| Findings | F1 to F20. |

The guard's size budget does not apply, because no guard was written.

## Questions for the steward

Q1 to Q3 are in `questions.md`, each with its recommended answer. Work continued on the recommendations:
- Q1: the entry is drafted with placeholders and not applied.
- Q2: the answer is "signposting only", so the Q2 patch is not applied.
- Q3: the answer is "demote", and the demotion is drafted as provisional.

## Uncertainties and what was not covered

- **No git history.** Commit messages could not be searched, as intent pass §1 asks before reporting that nothing
  records a decision. The enacted reading uses dated text only. File modification times (all 2026-08-01) are copy
  times and were not used.
- **Other repos not read.** The successors, the implementation repos and `agentic-learning` were outside this run's
  allowed reads. So:
  - the successors' existence and paths were not checked;
  - the repos were not assessed as one system, as Step 2 asks;
  - F14, F16 and F20 could not be checked against them.
- **The banner's authority.** Its author and date are unknown. It is treated as a directive under intent pass §1 and
  §2, and the remaining doubt sits in Q1.
- **Completeness of the lists.** The misleading-material list in the state section and the guard surfaces are not
  exhaustive.
- **Not read in full:**
  - `AUTH_OPTIONS_ANALYSIS.md`: lines 1-40 and 200-263 read, plus its headings;
  - `archive/scheduling-cronicle-investigation.md`: lines 1-25;
  - `components/scope/skills/scope-design.md`: lines 1-30;
  - `components/agent/skills/role-design.md`: searched for stale terms only;
  - `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`: lines 1-40;
  - `runs/002-professional-presence-diagnostic/RUN.md`: lines 61-179 not read;
  - the `output.md` files of all three runs, and the `events.jsonl` streams, except the start of Run 001's.

  Findings that depend on those parts would be missed.
- **Notes on the skills** are in `skills-feedback.md`.
