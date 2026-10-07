# Entropy assessment: agentic-architecture

- **Target:** read-only snapshot at `scratchpad/eval/targets/agentic-architecture` (no `.git`). Read 2026-10-07.
- **Route:** `entropy-assessment` Steps 1-3 (intent pass, lifecycle, shape) → shape A, docs-first planning →
  `docs-first-planning-assessment` Phases 1 and 2. This file is that skill's assessment, with the intent section
  and lifecycle status added; there is no second report.
- **Mode:** plan / suggest-only. The target cannot be edited, so every change is a patch, and every patch is
  provisional on question Q1 (`questions.md`).
- **Other outputs:** `questions.md`, `current-state.patch`, `bootstrap.patch`, `guard/SKILL.md`, `integration.md`,
  `feedback.md`, `read-log.md`.

## Findings

One list. Every other section refers to these ids. Line numbers are from the snapshot.

| Id | Finding | Evidence | Condition or vector |
|---|---|---|---|
| F1 | The reference-only status exists only as two banners, with no date and no attribution. `DECISIONS.md` has no entry for it. | `README.md:3-5`, `AGENTS.md:3-6`. A search for "reference-only" and "personal-agent" finds only those banners (plus an unrelated use in `role-design.md:3`). | Missing record of a directive |
| F2 | The entry points and the model still describe the repository as the current design source. | `README.md:7-9` ("Bleeding-edge design source for the current named version"); `AGENTS.md:8` ("holds the current architecture state"); `AGENTS.md:12-14` ("current settled positions… we update this list"); `MODEL.md:31`; `DECISIONS.md:137` | Stale description |
| F3 | Six surfaces present next work as live. | `ROADMAP.md:12-71`; `components/orchestrator/TODO.md:14-26` and `PLAN.md:5-22`; `components/scope/TODO.md:24-43` and `PLAN.md:5-24`; `runs/README.md:20-29`; `runs/001-moving-stillness-status/RUN.md:112-126` ("start here next session") | State entropy |
| F4 | `architecture/INDEX.md` sends next work to a pickup file that marks itself superseded. | `architecture/INDEX.md:15-17` against `architecture/PICKUP.md:3-10` (superseded 2026-07-26) | Docs against docs |
| F5 | `RUNTIME.md` still calls the scope manager a unified gateway, while `PICKUP.md` says that wording was cleaned up. `RUNTIME.md` also restates scope-manager anatomy that the snapshot rules say prose must only point at. | `RUNTIME.md:67`, `:82`, `:57-84`; `PICKUP.md:15`; superseded at `DECISIONS.md:575` (2026-07-16); `ARCH.md:22`; `INDEX.md:5`, `:21` | Stale description; parallel truth |
| F6 | Questions settled by dated decisions are still described as open. | `components/agent/DECISIONS.md:12` (settled `DECISIONS.md:559`, `:635`); `components/orchestrator/PLAN.md:28-29` (`:618`, `:559`); `components/scope/skills/scope-design.md:155` (`:678`); `SCOPES_PLANNED.md:90` (`:650`, `:692`); `SCOPES_PLANNED.md:30` and `components/orchestrator/MODEL.md:84-86` point to registry entries that do not exist (direction set at `:666-670`); `RUNTIME.md:126` (sandbox provider, direction set at `:696-698`, not in the registry); `ROADMAP.md:36-37`, `:54`, `:58`, `:63` (`:622-650`, `:551-559`) | Stale description |
| F7 | Superseded scheduling wording survives. | `ROADMAP.md:48`, `:56` ("due-event trigger layer"); `PI_AGENT_OVERVIEW.md:94`, `:99`; `archive/scheduling-cronicle-investigation.md:4-7` says its conclusion is "retained in SCHEDULING.md", which no longer says it. Superseded by `DECISIONS.md:836-851` (2026-07-26). | Stale description |
| F8 | Open questions have two homes. `DECISIONS.md` is declared the only registry, while the snapshot rules make each snapshot's Under Review list "source of truth for the domain". Question text is also duplicated in four files. | `AGENTS.md:28`, `DECISIONS.md:305-309`, `:877` against `architecture/SCHEMA.md:78`, `ARCH.md:72`. Duplicates: `AUTH_OPTIONS_ANALYSIS.md:246-251`, `scope-design.md:159-164`, `role-design.md:200-204`, `components/orchestrator/MODEL.md:84-87` | Conflict |
| F9 | `components.yaml` gives eight tool repositories as `../<repo>`, but `README.md` gives `../../<repo>`. The 2026-04-04 decision puts tools flat in `~/pro/` and this repository in `~/pro/agentic/`. Not checkable on disk from the snapshot. | `components.yaml:35, 51, 56, 61, 66, 71, 76, 81`; `README.md:43-50`; `DECISIONS.md:176` | Stale description |
| F10 | Templates and the reference role may have two homes across repositories. `template/` is declared the single source here, while the banner moves the Scope and Project model to `../../scope`. The reference role already has a live copy that needed dual edits. Run 002 records the scope template without `CLAUDE.md`, and the snapshot's template has a `CLAUDE.md` symlink. | `AGENTS.md:19`; `components/scope/DECISIONS.md:60-64`; `components/agent/DECISIONS.md:48-52`; `components/scope/MODEL.md:81`; `README.md:4-5`; `runs/002-professional-presence-diagnostic/RUN.md:38`, `:241`; `components/scope/template/CLAUDE.md -> AGENTS.md` | Ambiguous (Q3) |
| F11 | The temporal coordinator spec is named authoritative, while the banner says no decision here is current authority. The implementation lives in a sibling repository. | `DECISIONS.md:830`, `:847`; `SCHEDULING.md:20`; `ARCH.md:41`; `components.yaml:29`; `INTERFACE_REFINEMENT_PLAN.md:6-7`; `README.md:5` | Ambiguous (Q2) |
| F12 | The mandated commit guard is tuned for active design. It asks whether the roadmap reflects current work, asks for new open questions, and asks for status updates. Its `system_snapshot` holds state last evaluated 2026-04-27, before the snapshots, the temporal coordinator and the reference-only status. | `AGENTS.md:72`; `skills/entropy-guard.md:5-7`, `:32-33`, `:47`, `:79-80`, `:98`, `:118` | Workflow drift |
| F13 | The session-start ritual builds "1-3 most plausible next actions" from the roadmap. Its canonical inputs never include the status banner. | `AGENTS.md:36-45`; `skills/session-kickoff.md:20-35`, `:69-80` | Workflow drift |
| F14 | "Run the guard before committing" and "No stale docs… in the same commit" are written as rules, and nothing enforces either. There is no `.githooks/`, `.husky/` or `.github/`. With no `.git`, the effective hooks path is unknown. F5-F7 show the stale-docs rule has lapsed. | `AGENTS.md:72`, `:26`; `skills/entropy-guard.md:114` ("External (discipline-based)") | Prose control |
| F15 | The documented working decision is direct API-key auth, with "Pi is not, by itself, the auth answer". Runs 001-003 used Pi's own ChatGPT-subscription Codex login, and no decision records the switch. | `AUTH_OPTIONS_ANALYSIS.md:10-16`, `:176-177`; `runs/001-…/RUN.md:41`; `runs/002-…/RUN.md:33`, `:140` | Unauthorised drift (historical; run line paused) |
| F16 | No document names who decides this repository's intent, and decision entries are dated but unattributed. The steward is inferred as Justin from three sources: the `justinphilpott/agentic-architecture` link, `steward: justin` in the scope manifests, and the personal-system framing. | `components/orchestrator/scope/README.md:3`; `components/orchestrator/scope/scope.yaml:6`; `NORTH_STAR.md:3` | Missing |
| F17 | The orchestrator decision log repeats a root decision in full. | `components/orchestrator/DECISIONS.md:18-29` against `DECISIONS.md:489-500` | Local-against-global inversion (minor) |
| F18 | The current snapshot (v1, dated 2026-07-16) describes the 2026-07-26 V0 model, so it was edited in place. The rules freeze only *old* snapshots, and they say nothing about editing the current one. | `ARCH.md:11`, `:18`, `:30`; `INDEX.md:25` | Ambiguous (low; no work depends on it) |
| F19 | The manifest example in `DECISIONS.md` gives moving-stillness a different id and purpose from the live root manifest. It may be illustrative. | `DECISIONS.md:351-364` against `components/orchestrator/scope/scope.yaml:11-15` | Low |

## Intent

**Steward:** Justin, the repository owner, by inference (F16). No document says who decides this repository's
intent, so that gap is itself recorded as F16. The banner's "without explicit authorization" (`AGENTS.md:5-6`) shows
that an authoriser exists, but it does not name one.

**Authorised intent, in short:**

- The repository is reference-only. It is not current architecture authority. Current Personal Agent architecture is
  in `../personal-agent`, and the Scope and Project model is in `../../scope` (`README.md:3-5`, `AGENTS.md:3-6`).
  This is a directive with no date and no attribution (F1). By the repository's own precedence (`AGENTS.md:70`:
  newer settled state wins; a directive outranks a description), it governs F2.
- The dated `DECISIONS.md` entries, the latest from 2026-07-26, are the record of the design while it was current.
  The banner says they are not current authority (`README.md:5`).
- The vision is `NORTH_STAR.md`, with no date and no attribution. It is historical under the banner.

**Three readings:**

- **Declared:** contradictory. The two banners say reference-only. Everything else (F2, F3, F13) says active design
  source.
- **Enacted:** the last dated work is the 2026-07-26 temporal coordinator V0 decision and its cleanup sweep
  (`PICKUP.md:3`, `INTERFACE_REFINEMENT_PLAN.md:3`). The manual Pi run line has been paused since May
  (`runs/README.md:7-9`). The banner was added later on an unknown date: it names `personal-agent`, which the
  `README.md` Related table never listed. There is no git history, so nothing shows whether any work followed the
  banner. File modification times are uniform (Aug 1) and come from the copy, so they are not evidence.
- **Authorised:** no statement anywhere is attributed to the steward. What remains is the banner directive and the
  dated, unattributed decisions.

**Gaps, by condition:**

- **Stale description**, so correct it and do not ask: F2 (from the banner, F1), F4, F5 (`DECISIONS.md:575`), F6,
  F7, F9. The patches correct F2, F4 and F5, because they sit on the path a fresh session reads. F6, F7 and F9 are
  listed in the new Status block as historical rather than corrected one by one, so the repository is not
  harmonised as if it were current. See Recommendations.
- **Conflict:** F8. Nothing depends on it while the repository is reference-only, so no question is asked. It is
  reported and left alone.
- **Missing:** F1 (the decision is not in the decision record) and F16 (the steward is not named). F1 is recorded by
  `bootstrap.patch` as an existing directive, with its missing date and attribution kept visible. Recording it does
  not decide it again. F16 is reported; no author is invented.
- **Ambiguous:** what "reference-only" permits (Q1); whether the temporal coordinator spec is still authoritative
  (F11, Q2); whether the templates are still the live copy source (F10, Q3); F18, which nothing depends on.
- **Unauthorised drift:** F15. The work is finished and the run line is paused, so there is nothing to fix here. If
  the auth choice is still live, it belongs in `../personal-agent`. No intent document is edited.
- **Prose control:** F14. Enforcement would have to sit in a git hook in this repository, or in the commit loop of
  whatever agent edits it. The guard is cited as a control only by `AGENTS.md:72` and its own Integration section.
  It is not cited in any safety decision.

**Settled from evidence, so not asked:**

- the steward's identity (F16);
- that the banner outranks the body text, by `AGENTS.md:70`;
- that F5 is stale, by `DECISIONS.md:575`;
- that F6 is stale, by the dated "Resolves open question" lines.

**Questions for the steward:** Q1, Q2 and Q3, with recommended answers, in `questions.md`. The work continues on
the recommended answers, and every patch is provisional on Q1.

**Proposed intent changes:** none. The `DECISIONS.md` entry in `bootstrap.patch` records an existing directive, and
lists Q1-Q3 as "Awaiting the steward, not decided".

## Lifecycle status

**Reference-only.** The evidence is F1's two banners, and the absence of any dated work after 2026-07-26. That
decides how much the route recommends: corrections and a demotion, plus a small refinement of the guard that
already exists (Step 3). No new structure is proposed.

## System shape

- **Shape A, docs-first planning.** The repository is markdown-first and has no code. Its main artifacts are
  architecture, decision, plan and template documents. Its loop is repeated human and AI sessions.
- **More than one repository.** The system spans this repository plus five others, which were named but not read
  (the run rules forbid it):
  - `../personal-agent` (the current architecture authority);
  - `../../scope` (the current Scope and Project model, and the `scopectl` implementation);
  - `../temporal-coordinator` (the temporal coordinator implementation, per `components.yaml:29`);
  - `../agentic-architecture-distribution` (the historical Level 2 distribution source);
  - `../agentic-learning` (general theory).

  They are treated as one system in the truth map below. What they contain is not covered.

## Planning horizon

- **Settled:** the dated `DECISIONS.md` entries, as a historical record.
- **Active:** nothing in this repository.
- **Exploratory:** the `components.yaml` entries marked exploratory, the open questions in `DECISIONS.md`, and the
  Under Review list in `ARCH.md`. All are frozen while the repository is reference-only.

## Canonical truth map

| Concept | Canonical home | Other mentions | Issue |
|---|---|---|---|
| Repository status | `README.md` and `AGENTS.md` banners; proposed: a `DECISIONS.md` entry | Contradicted by `README.md:9`, `AGENTS.md:8`, `MODEL.md:31`, `DECISIONS.md:137` | F1, F2 |
| Current state and next work | None honest. Six surfaces compete. | `ROADMAP.md`, component `TODO.md` and `PLAN.md` files, `INDEX.md` Current Pickup, `PICKUP.md`, `runs/` pickups | F3, F4. Proposed home: a Status block at the top of `ROADMAP.md` |
| Vision | `NORTH_STAR.md` | none | Historical under the banner |
| System model and five layers | `MODEL.md` | `DECISIONS.md:131-142` | Consistent |
| Orchestration anatomy | `architecture/snapshots/2026-07-16-orchestration/ARCH.md` via `INDEX.md` | `ORCHESTRATION.md` (redirect stub, good); `RUNTIME.md:57-84` restates it | F5, F18 |
| Decisions | `DECISIONS.md`; component `DECISIONS.md` files for local detail | `AUTH_OPTIONS_ANALYSIS.md:10` "Current Working Decision" sits outside the log | F15, F17 |
| Open questions | Disputed: `DECISIONS.md#open-questions` against snapshot Under Review | four duplicates | F8 |
| Component status and repository paths | `components.yaml` | `README.md` Related table | F9 |
| Temporal coordinator contract | `components/temporal-coordinator/SPEC.md` | `SCHEDULING.md` restates the API (consistent today); implementation repository not read | F11 |
| Scope schema and template | `components/scope/template/` with `components/scope/DECISIONS.md` | the same entry repeated at root `DECISIONS.md:758-780`; `../../scope` (not read) | F10 |
| Role and binding pattern | `components/agent/template/` | `roles/` reference role; live copy in `scope-professional-presence` (not read) | F10 |
| Root scope design | `components/orchestrator/scope/` | `SCOPES_PLANNED.md` | Status `planned` |
| Agent instructions | `AGENTS.md`, with `CLAUDE.md` as a symlink | template copies | F13 |
| Maintenance skills (product artifacts) | `skills/entropy-guard.md`, `skills/session-kickoff.md` | `AGENTS.md:43`, `:72` | F12, F13 |
| Historical | `archive/`, `INTERFACE_REFINEMENT_PLAN.md`, `PICKUP.md`, superseded `DECISIONS.md` entries, `runs/` | | Already labelled, apart from the false claim in `PICKUP.md:15` (F5) |

## Loop map

- **Session start:** `CLAUDE.md` is a symlink to `AGENTS.md`, and both Claude Code and Pi load it automatically
  (`runs/001-…/RUN.md:74`, `:83`). The banner is its first lines. Then `AGENTS.md:38-43` sends the session to
  `ROADMAP.md`, `MODEL.md`, `DECISIONS.md`, `components.yaml`, the component docs, and a session-kickoff packet held
  only in the conversation (F13).
- **Active work tracking:** `ROADMAP.md` checkboxes, component `TODO.md` files, `PICKUP.md`, and the pickup sections
  in `RUN.md` files. There is no root `TODO.md`.
- **Decision capture:** `DECISIONS.md` at the root and per component.
- **Coherence pause:** `skills/entropy-guard.md` before "non-trivial" commits, by discipline only (F14).
- **Handoff:** a commit. Nothing shows a pull-request flow (there is no `.github/`).
- **The real loop now:** sessions read the repository for reference, and occasionally make a status correction.
  The costly moment is reading, not committing: a session that follows the start ritual rebuilds a live plan
  (F13). So the main defence is the current-state update and the `AGENTS.md` correction. The commit guard comes
  second.

## Entropy profile

Ranked by destructive potential.

| Rank | Risk | Findings | Decay rate | Recovery cost | Anchor for the fix |
|---|---|---|---|---|---|
| R1 | A fresh session treats the reference-only repository as live. It plans, extends, or carries superseded design into the current repositories. | F1-F4, F13 | Every fresh session that follows `AGENTS.md` | High. The drift crosses repositories, and `DECISIONS.md:125` calls cross-layer drift "invisible from within either layer". | F1 directive, recorded in `DECISIONS.md`; a Status block in `ROADMAP.md` |
| R2 | Parallel truth across repositories, for templates, the reference role and the temporal coordinator spec. | F10, F11 | Grows as the current repositories evolve | High. Each side looks correct on its own. | Q2, Q3 |
| R3 | The mandated guard pushes toward extending the design and enforces nothing. | F12, F14 | Each commit (now rare) | Medium | The refined guard |
| R4 | Stale descriptions inside the record. | F5-F7, F9 | None new (frozen), but each one misleads a deep reader | Low per item | The dated decisions cited in the findings |
| R5 | Registry, snapshot-rule and duplicate-decision conflicts. | F8, F17-F19 | None while there is no work | Low | None needed now |

## Recommendations

- **Mark historical at repository scale; do not harmonise line by line.** The Status block, the `AGENTS.md`
  start-of-session rewrite and one-line banners on the next-work files cover F2 and F3. F6, F7 and F9 are listed in
  the Status block rather than edited. This is a deliberate choice, and the steward can reverse it.
- **Record F1 in `DECISIONS.md`** as an existing directive. Keep its missing date and attribution visible, and list
  Q1-Q3 as awaiting the steward.
- **Correct F4 and F5,** because they sit on the read path and their decisions settle them.
- **Refine the existing guard in place** (F12) into a short reference-only commit guard. Demote
  `skills/session-kickoff.md` to historical (F13).
- **Answer Q2 and Q3 before touching** `components/temporal-coordinator/` or any `template/` folder. A label inside
  a template is copied into every new repository.
- **Leave F8, F15 and F17-F19 alone.** Nothing depends on them while the repository is reference-only.
- **Withdraw the backlog item for a hook** (`ROADMAP.md:69`, "Entropy guard: automated coherence checks on hooks")
  and the old guard's "next maturity step" (`skills/entropy-guard.md:118`). Commits are now too rare to justify a
  hook. This connects to the existing item instead of starting new work; see `integration.md`.

## Bootstrap actions

Every action is in `bootstrap.patch`. Each one was checked against the snapshot file it changes, and the patch
applies cleanly.

| # | Action | File | Checked against |
|---|---|---|---|
| B1 | Record the reference-only directive, what it makes stale, and Q1-Q3 as awaiting the steward | `DECISIONS.md` (new entry before Open Questions) | No existing entry mentions reference-only (search, 2026-10-07) |
| B2 | Pointer to the Status block after the banner (the banner itself is untouched); historical framing of the positions list and working practices; new session-start steps; `:72` changed from "non-trivial changes" to "any change" | `AGENTS.md` | Lines 3-8, 12-14, 36-51, 60-72, 74-76, 98-103 |
| B3 | "Last named version"; reference framing; navigation pointer; `personal-agent` row in Related | `README.md` | Lines 7, 9, 21, 39-41 |
| B4 | Current Pickup becomes "None", pointing to `ROADMAP.md` | `architecture/INDEX.md` | Lines 15-17 |
| B5 | Unified-gateway wording corrected, citing the 2026-07-16 supersession | `RUNTIME.md` | Lines 67, 82 |
| B6 | One-line historical banners | `components/orchestrator/TODO.md`, `PLAN.md`; `components/scope/TODO.md`, `PLAN.md` | Titles |
| B7 | Historical banner on the kickoff skill; skills index updated | `skills/session-kickoff.md`, `skills/README.md` | Lines 1, 7-8 |
| B8 | Guard replaced in place | `skills/entropy-guard.md` (content = `guard/SKILL.md`) | Whole file |

Track whether the bootstrap is complete in the Status block, never in the guard.

## Current-state update

This is `current-state.patch`: a Status block at the top of `ROADMAP.md`, which is the first file the session-start
steps send a reader to. It carries:

- the stage, and where the work moved;
- what may change here;
- active fronts (none);
- the three open questions;
- historical material that is easy to mistake for current;
- two next actions;
- who refreshes it, and what makes it stale.

Each claim carries its source and the date it was checked. The location of current authority is marked as taken
from the banners and not re-read. No second summary file is created.

## Guard surfaces

| Surface | Runs? | Classification |
|---|---|---|
| `skills/entropy-guard.md`, mandated by `AGENTS.md:72` | By hand only | Amend: refine in place (F12) |
| `AGENTS.md` session start and `skills/session-kickoff.md` | By hand, at session start | Amend `AGENTS.md`; demote the kickoff skill to historical (F13) |
| `AGENTS.md` working practices (`:60-72`) | Discipline | Amend: historical framing, guard line kept |
| `ROADMAP.md:69` "Entropy guard… on hooks" | Decided, not built | Demote: withdrawn as historical |
| The old guard's "Next maturity step: Prompted" (`skills/entropy-guard.md:118`) | Declared, missing | Drop |
| Git hooks | Unknown: no `.git` in the snapshot; no tracked hook folder | None proposed |
| CI | None (no `.github/`) | None proposed |
| Supersession markers in `DECISIONS.md`; `INDEX.md` "alone says what is current"; `ORCHESTRATION.md` redirect | Conventions that work | Keep as they are |
| `PICKUP.md`, `INTERFACE_REFINEMENT_PLAN.md`, `archive/` | Already demoted | Keep |
| Mechanical: a link check | Not present. A script run on 2026-10-07 found every link inside the repository resolves, with 23 links into sibling repositories that could not be checked. | Recommend `lychee --offline` (not installed on this machine), only as an optional line in the guard |

## Is a guard needed?

**Yes. The existing guard is refined; no new one is built.** A reference-only repository may end with no guard
(Step 3). Here, though, `AGENTS.md:72` already mandates a guard, and that guard actively steers toward extending the
design (F12). Deleting it would leave nothing at commit time to catch an extension. Rewriting it into a short
reference-only guard costs about the same as demoting it. The main defence against R1 is still the read-path
correction, not the guard.

## Inputs handed to the generator

- **The intent section:** above.
- **The truth map and the loop map:** above.
- **The docs-first checks** (Step 8), written against this repository:
  - canonical ownership of the status (F1);
  - one owner, not two copies, between the banners, the `DECISIONS.md` entry and the Status block;
  - supersession (F4, F7, and the superseded entries in `DECISIONS.md`);
  - cross-references to `../personal-agent` and `../../scope`;
  - decision capture, here meaning that no new design is captured in this repository;
  - state honesty of the Status block;
  - workflow alignment (F13).
- **The guard surfaces:** the table above.
- **The stable mechanical candidates:**
  - `git diff --check`;
  - the banner-presence grep;
  - the new-decision-heading grep;
  - a link check.

  Everything else stays a judgment check, because it depends on wording.

## Generator report

- **Structures found:** the list is above. It is a decision log, `ROADMAP.md`, component TODO and PLAN files,
  `AGENTS.md` (with `CLAUDE.md` as a symlink), and two maintenance skills. There is no root state file and no
  hooks.
- **Guard:** `skills/entropy-guard.md`, updated in place under its existing name, because four files link to it.
  Draft at `guard/SKILL.md`. It carries intent-change rule v2, with Justin as steward, the two banners plus the
  `DECISIONS.md` entry plus `NORTH_STAR.md` as the intent documents, and `DECISIONS.md` as the decision surface.
  It holds no current state; it points to the Status block.
- **Document references added:** `AGENTS.md` and `skills/README.md` (in `bootstrap.patch`).
- **Validation run:** both patches applied with `git apply --whitespace=error-all` to a fresh copy of the snapshot,
  and the result matched the working copy. `git diff --check` was clean. The guard's mechanical lines were run on
  that scratch copy:
  - the banner grep returned 1 and 1;
  - the decision-heading grep flagged the new B1 entry, as intended;
  - `@{upstream}` was absent, so the guard's "coverage incomplete" fallback applies;
  - `lychee` is not installed.
- **Review against the open questions:** no patch labels `components/temporal-coordinator/` (Q2), `template/` or
  `roles/` (Q3). The banners are not edited. Q1-Q3 are recorded as undecided. Both patches are provisional on Q1.
- **Handoff:** to `guards-integrator`; see `integration.md`.

## Uncertainties and what was not covered

- **Sibling repositories.** The five sibling repositories were not read. So F9, F10 and F11 could not be checked
  against them, and nothing here is evidence about the current architecture.
- **History.** There is no git history and no `.git`. That leaves three things unknown: when the banner was added,
  whether any commits followed it, and whether hooks are enabled.
- **Paths.** Run 001 used `/home/justin-philpott/…`, while runs 002-003 and the manifests use `/home/justin/…`.
  This may be two machines; it was not judged.
- **Not read in detail:**
  - `runs/*/events.jsonl` and `runs/*/output.md`: data and experiment output, skimmed only through their `RUN.md`
    files;
  - the body of `archive/scheduling-cronicle-investigation.md`, beyond its first 40 lines.
- **Adoption** is unverified (`planned`); see `integration.md`.

## Upstream feedback

Yes. The feedback is filed in `feedback.md`. The front door routed correctly, but two places were left implicit:

- docs-first has no reference-only branch;
- the intent pass has no row for an undated, unattributed directive.
