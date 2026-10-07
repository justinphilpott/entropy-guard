# Entropy assessment: agentic-architecture

- **Target:** `agentic-architecture`, a read-only snapshot with no `.git`.
- **Date:** 2026-10-07.
- **Skills used:** entropy-guard's `entropy-assessment` v0.9.0, with `intent-pass.md` and `intent-change-rule.md` v2,
  then `docs-first-planning-assessment` v0.3.0 (route A).
- **Mode:** audit-only. The target was not edited; every proposed change is in `proposed-changes.patch`.
- **Guard decision: `none`, provisional on steward question Q1.** The repository is reference-only. The run ends
  with a demotion of the existing guard surfaces and a state-file update, both delivered as a patch.

**Files written alongside this one:**
- `questions.md`: the steward questions Q1-Q3, each with a recommended answer;
- `proposed-changes.patch`: the state-file update, the proposed decision record, two "fixed as usual" corrections and
  the demotion notes;
- `integration.md`: why the integrator was not reached, and where the demoted guard surfaces sit in the loop;
- `read-log.md`.

## Coverage

**Read in full:** all 78 files, with these exceptions:
- the three `runs/*/events.jsonl` streams were not read;
- of the run outputs, only the head of runs/001's `output.md` was read, and none of runs/002's or runs/003's;
- `AUTH_OPTIONS_ANALYSIS.md` was read at lines 1-60 and 205-263, plus its headings;
- `archive/scheduling-cronicle-investigation.md` was read at lines 1-30, plus its headings;
- `components/scope/skills/scope-design.md` was read at lines 1-40 and 150-164, plus its headings and a keyword search;
- `components/agent/skills/role-design.md` was read at lines 190-204, plus its headings and a keyword search.

**Not covered:**
- **Git history.** The snapshot has no `.git`. The "enacted" reading and the real loop rest on dates written inside
  documents. Every file carries the same modification time, 2026-08-01 21:12, which is a checkout time, not when each
  file was written.
- **Other repositories.** The system spans several repositories (see Lifecycle, shape and repositories). None of them
  was read, so claims about what they hold are not made here.
- **Link targets outside the repository.** Relative paths were checked against each other and against this
  repository's own records (F18), not against a filesystem.

## Intent

### Steward

**Unresolved (F3).** No file names who decides what `agentic-architecture` is for. Inference: the scope definitions
name `justin` as steward (components/orchestrator/scope/scope.yaml:6, :23, :34), and runs/001-moving-stillness-status/RUN.md:41
refers to "Justin's ChatGPT Plus subscription". SCOPES_PLANNED.md:76-82 puts this repository in a "planning" scope that has
no steward field. No DECISIONS.md entry is attributed: all are dated and none is signed.

### Authorised intent, by source

| Part | Source | Kind | Authority |
|---|---|---|---|
| Purpose: a blueprint for a personal agentic system that delegates repetitive work to agents | NORTH_STAR.md:3, design values :26-42 | description of vision | neither dated nor attributed |
| Status: reference-only; current authority in `../personal-agent` and `../../scope`; no extension without explicit authorisation | README.md:3-5, AGENTS.md:3-6 | directive (status notice) | neither dated nor attributed |
| Role: the bleeding-edge, Level 1 design source | DECISIONS.md:137 (2026-04-23), :158 (2026-05-14) | decision | dated, not attributed |
| Settled positions | AGENTS.md:12-34, summarising DECISIONS.md | directive list | not dated, not attributed |
| Decision surface | DECISIONS.md (root), components/{scope,agent,orchestrator}/DECISIONS.md (local), orchestration snapshot `Under Review` (architecture/snapshots/2026-07-16-orchestration/ARCH.md:70-79) | decisions | dated, not attributed |
| Temporal coordinator contract | components/temporal-coordinator/SPEC.md, made authoritative by DECISIONS.md:847 | specification | via a dated decision |

### Three readings

- **Declared:** this repository is two things at once. The notice says it is reference-only. The body text says it is
  "the bleeding-edge design source" (README.md:9) and "holds the current architecture state" (AGENTS.md:8).
- **Enacted:** the latest dated work is the temporal coordinator V0 decision of 2026-07-26 (DECISIONS.md:836-851). On
  the same date PICKUP.md was marked superseded (architecture/PICKUP.md:3). The run line paused after 2026-05-13
  (runs/README.md:7-9). The notice names `../personal-agent`, which no other file mentions, so it is the newest
  statement in the repository. The checkout time shows it existed by 2026-08-01.
- **Authorised:** the repository records no statement in the steward's own words. The strongest recorded decisions,
  dated 2026-04-23 and 2026-05-14, make this the design source. The notice that demotes it has unknown authority.
  The system's own precedence rule, "resolve by current snapshots/index and dated decisions; beyond that, clarify
  intent" (AGENTS.md:25, DECISIONS.md:869), cannot place an undated notice, so the conflict goes to the steward (Q1).

### Gaps by condition

| Condition | Findings |
|---|---|
| Conflict | F1 (status notice against dated decisions), F7 (which document owns open questions) |
| Missing | F2 (no decision record of the demotion), F3 (steward not named) |
| Ambiguous | F5, second part: "clarify intent and update the records" does not say who clarifies |
| Stale description | F9, F11, F12, F13, F14 |
| Unauthorised drift | F16 (manifest fields), F17 (auth working decision against what the runs did) |
| Prose control | F4 (the reference-only notice) |

**Gaps that do not depend on intent, fixed as usual and included in the patch:** F10 (a contradictory state pointer)
and F18 (stale paths).

### Repair instructions in existing guards, read against the intent-change rule

- **Intent (F5):** AGENTS.md:14 says "anything can be revisited with strong enough reasoning, and when it changes we
  update this list in the same pass." This lets any session change the settled positions without a recorded steward
  decision, which is a path for unauthorised drift. The guard itself, `skills/entropy-guard.md`, has no "update the
  intent to match" repair. Its line 98, "add them to DECISIONS.md Open Questions", records rather than decides.
- **Ownership (F6):** skills/entropy-guard.md:38 asks "Is the scope manager consistently described across MODEL.md,
  RUNTIME.md, and components.yaml?" That keeps several descriptions in step instead of naming the owner, which since
  2026-07-16 is the orchestration snapshot (DECISIONS.md:857). The guard's own line 74 has the correct form.

### Questions

These are in `questions.md`, each with its readings, a concrete case and a recommendation:
- **Q1:** is this repository reference-only? Recommended: yes, recorded in DECISIONS.md.
- **Q2:** should the stale text be corrected, or the repository stay frozen? Recommended: stay frozen apart from the
  status records.
- **Q3:** should the unpromoted findings of runs 001-003 be carried to the successor repositories? Recommended: yes,
  as a check before copying anything.

**Not asked:** F7 and the "who clarifies" ambiguity in F5. Neither changes what gets built while the repository is
reference-only. Both become questions if Q1 is answered "active".

### Proposed changes and where they are recorded

- **A proposed DECISIONS.md entry,** "Proposed 2026-10-07 — agentic-architecture is reference-only", marked as
  awaiting the steward. It is in `proposed-changes.patch`. No intent document is changed.
- **F16 and F17** would be recorded as proposals in DECISIONS.md only if Q2 is answered B.

## Lifecycle, shape and repositories

- **Lifecycle: reference-only, provisional on Q1.** The evidence is the notice (README.md:3-5, AGENTS.md:3-6),
  PICKUP.md being superseded (architecture/PICKUP.md:3), and the paused run line (runs/README.md:7-9). The
  counter-evidence is DECISIONS.md:137 and :158, which describe it as the design source.
- **Shape: A, docs-first planning.** The repository is markdown and YAML only, with no code, CI or hooks
  (skills/entropy-guard.md:7). Decision logs, TODOs, a roadmap and agent instructions carry its state. Work happened
  in repeated sessions, run by both people and agents. No other shape fits better.
- **Repositories:** the system spans more than one. This repository records the design, while the implementation and
  the live state are elsewhere:
  - the successors named by the notice, `../personal-agent` and `../../scope`;
  - `../agentic-architecture-distribution`, the Level 2 source;
  - the temporal coordinator implementation;
  - the live scope repositories, `scope-moving-stillness` and `scope-professional-presence`.

  Only this repository was available, so the assessment treats it as the reference-only member of that system. The
  cross-repository risk is F20.

## Findings

One list. Every other section refers to these ids. Each finding gives its evidence by file and line in the target.

- **F1. The status notice conflicts with dated decisions (Conflict).** README.md:3-5 and AGENTS.md:3-6 say the
  repository is reference-only and not current authority. DECISIONS.md:137 (2026-04-23) and :158 (2026-05-14), and
  the descriptions at README.md:9, AGENTS.md:8 and MODEL.md:31, say it is the design source. `personal-agent` appears
  only in the two notices, so they are later than every other line. → Q1.
- **F2. The demotion is not recorded in the decision owner (Missing).** DECISIONS.md has no entry after 2026-07-26,
  and no entry mentions reference-only status. The patch proposes one, awaiting the steward.
- **F3. The steward of this repository is not named (Missing).** See Intent, Steward.
- **F4. The reference-only notice is a prose control (Prose control).** Nothing enforces "do not extend ... without
  explicit authorization", and the repository's own procedures send a fresh session into design work without
  checking it:
  - AGENTS.md:36-45 ("Session start" ends by choosing 1-3 next actions);
  - skills/session-kickoff.md:9-12;
  - skills/entropy-guard.md:18 and :116 ("You do not need to be asked").

  Enforcement would sit at session start (a step 0 in AGENTS.md) and, if wanted, at the repository host by
  archiving; the host was not checked. Nothing cites the notice as a control.
- **F5. An intent-change path, and an ambiguity, in the instruction file.**
  - AGENTS.md:14 lets the settled list change "with strong enough reasoning", with no steward decision.
  - AGENTS.md:25 and DECISIONS.md:869 say "clarify intent and update the records" without saying who clarifies. Under
    one reading the steward does; under the other, the session does. In the concrete case of README.md:9 against the
    notice, the second reading lets an agent rewrite either one.
- **F6. A guard check keeps an independent definition in step (Ownership).** See skills/entropy-guard.md:38 under
  "Repair instructions". The evidence is F9.
- **F7. Two rules own open questions (Conflict).**
  - DECISIONS.md:305-309, AGENTS.md:28, architecture/LANGUAGE.md:26 and skills/entropy-guard.md:45 and :98 make
    DECISIONS.md the only registry.
  - architecture/SCHEMA.md:78, the snapshot's ARCH.md:72 and architecture/INDEX.md:3 make the snapshot's `Under
    Review` "source of truth for the domain".

  The 2026-07-16 decision (DECISIONS.md:855-861) does not say which wins. The scope-manager seam question, for
  example, lives only in ARCH.md:74.
- **F8. The existing guard is stale and predates the July decisions.**
  - skills/entropy-guard.md:6-7 gives `last_evaluated: 2026-04-27` and a snapshot reading "Sol 0.1 … Open questions
    reduced from 22 to 11". The registry now holds 13: 7 open at DECISIONS.md:881-887 and 6 deferred at :891-896.
  - It has no check for the 2026-07-16 snapshot rule or for the temporal coordinator SPEC.
  - Its line 18 ("At the start of an architecture session") and line 98 ("note any issues found and fixed") would edit
    a reference-only repository.
- **F9. RUNTIME.md restates the superseded unified gateway (Stale description).** RUNTIME.md:67 has "Runtime gateway
  (unified for v0)" and :82 has "unified sandbox gateway". The model was superseded on 2026-07-16 (DECISIONS.md:575,
  ARCH.md:22), and RUNTIME.md:57-84 restates in full anatomy that the snapshot owns. PICKUP.md:15 claims this wording
  was already "cleaned up".
- **F10. The snapshot index points to a superseded pickup (contradictory state).** architecture/INDEX.md:15-17
  ("Next architecture work starts at PICKUP.md") against architecture/PICKUP.md:3 ("superseded historical pickup
  point (2026-07-26)"). Fixed in the patch, citing PICKUP.md's own status.
- **F11. The orchestrator model contradicts the workspace-lifecycle decision (Stale description).**
  components/orchestrator/MODEL.md:25 ("provision workspace for scope X") and :40 ("calls the scope manager to
  assemble a workspace") against DECISIONS.md:648 (2026-04-27): "It never says 'provision a sandbox' — it submits
  work". The later decision does not cover the other call on line 25, "update manifest status for scope Y", so that
  call stays.
- **F12. Questions that have been resolved are still described as open (Stale description).**
  - a. components/agent/DECISIONS.md:12; resolved at DECISIONS.md:559 and :635.
  - b. components/orchestrator/DECISIONS.md:13, "(mechanism TBD)"; resolved at DECISIONS.md:551-559.
  - c. components/orchestrator/PLAN.md:28-29; resolved at DECISIONS.md:612-618 and :551-559.
  - d. components/scope/skills/scope-design.md:155, "Skill injection is an open question"; resolved at
    DECISIONS.md:674-678.
  - e. SCOPES_PLANNED.md:90, "workspace lifecycle triggers, agent runtime binding location"; resolved at
    DECISIONS.md:650 and :692. The same line's "sandbox isolation model" is not in the registry.
  - f. components/orchestrator/MODEL.md:84-86 and SCOPES_PLANNED.md:30 point to a "cross-scope workflow exposure" open
    question that the registry (DECISIONS.md:875-896) does not hold. DECISIONS.md:666-670 records it as "direction
    set".
  - g. DECISIONS.md:271 and :299 state questions as open, and later entries (:650, :618) resolved them with no
    pointer back.
  - h. ROADMAP.md:54 ("what is a running agent?") was resolved at DECISIONS.md:622-635. ROADMAP.md:58 and
    components/scope/TODO.md:39 ("who triggers each transition") were resolved at DECISIONS.md:639-650.
- **F13. The registry holds a settled question (Stale description).** DECISIONS.md:896, "Layer 2 distribution form:
  build step vs separate distribution repo", was settled by DECISIONS.md:156-162 (2026-05-14). The registry's caution
  "must avoid the sync/drift problem" is not settled by that decision and stays open.
- **F14. Scheduling text predates the 2026-07-26 V0 decision (superseded material nearby).**
  - ROADMAP.md:48 and :56 ("due-event trigger layer").
  - PI_AGENT_OVERVIEW.md:94 and :99 ("External due-event scheduler invoking Pi or the scope manager").
  - archive/scheduling-cronicle-investigation.md:3-8 says SCHEDULING.md keeps the "core-owned Postgres-backed
    temporal coordinator … behind the adapter boundary". SCHEDULING.md:1-55 now describes an enqueue-only pg-boss V0
    with no adapter.
- **F15. Snapshot v1 holds content from after the model moved (low).** architecture/snapshots/2026-07-16-orchestration/ARCH.md:1-7
  is v1, dated 2026-07-16, yet holds 2026-07-26 V0 and pg-boss content at :11, :18, :30 and :47. INDEX.md:22 and :25
  say to make a new snapshot when the model moves, and that the date gives chronology. Whether this was an in-place
  edit cannot be confirmed without git.
- **F16. Manifest fields have drifted beyond the decided set (Unauthorised drift).** DECISIONS.md:466-475 lists the
  required `kind: scope` fields, and says "Additional manifest fields should not be added until routing or auditing
  proves they are needed". `display_name` has been added in several places:
  - components/orchestrator/scope/scope.yaml:14 and :28;
  - the comment in components/scope/template/scope.yaml:20-22;
  - the capture step in components/scope/skills/scope-design.md:33.

  The top-level `display_name` (scope.yaml:4, template :4) is also missing from the identity lists at
  components/scope/MODEL.md:15 and components/scope/DECISIONS.md:29. No decision covers it.
- **F17. The auth working decision differs from what the runs did (Unauthorised drift, low).**
  AUTH_OPTIONS_ANALYSIS.md:10-16 and :253-257 say to use direct API-key auth. runs/001-moving-stillness-status/RUN.md:28
  and :41 and runs/002-professional-presence-diagnostic/RUN.md:33 and :140 used `openai-codex/gpt-5.5` through
  subscription login. No decision covers either.
- **F18. Path pointers disagree (Stale references).** components.yaml:35 (`implementation: ../scope`) and :51-81
  (`repo: ../library` and similar) do not match README.md:43-50 (`../../scope` and similar). This repository's own
  records settle which is right:
  - DECISIONS.md:176-178 puts tools and apps flat in `~/pro/`, with the scope implementation at `~/pro/scope/`;
  - SCOPES_PLANNED.md:71 lists each tool under `~/pro/`;
  - runs/001-moving-stillness-status/RUN.md:29 puts this repository at `~/pro/agentic/agentic-architecture`.

  So README.md is right. Fixed in the patch for `scope` and the seven tools. `../agentic-colab` is correct
  (DECISIONS.md:176). The temporal coordinator paths (components.yaml:29, INTERFACE_REFINEMENT_PLAN.md:7) agree with
  each other; their target was not checked.
- **F19. Parallel truth.**
  - a. The root-scope name is decided in full twice: DECISIONS.md:489-500 and components/orchestrator/DECISIONS.md:18-29.
    The component file's own header (line 5) says not to duplicate.
  - b. Open-question text is copied outside the registry, against AGENTS.md:28: scope-design.md:159-164,
    components/agent/skills/role-design.md:200-204 and components/scope/TODO.md:42-43 restate DECISIONS.md:894-895.
- **F20. Run learnings were never promoted (Lost decisions and learnings).** runs/001-moving-stillness-status/RUN.md:114-120
  and runs/002-professional-presence-diagnostic/RUN.md:241 and :246-248 list findings meant for the architecture.
  components/orchestrator/TODO.md:16 and ROADMAP.md:26 are still open, and no decision records them. With this
  repository reference-only, they may be lost unless the successors hold them; that was not checked. → Q3.
- **F21. The decision log is not in date order (low).** The entry at DECISIONS.md:87 (2026-02-27) follows 2026-04-01
  entries; :156 (2026-05-14) precedes :166 (2026-04-03); :836 (2026-07-26) precedes :855 and :865 (2026-07-16).
  AGENTS.md:40 asks sessions to read "especially recent entries", and the order hides which those are.

## Truth map

**Document roles:**
- **canonical:** NORTH_STAR.md, MODEL.md, DECISIONS.md, architecture/INDEX.md with the current snapshot,
  components/temporal-coordinator/SPEC.md, and AGENTS.md for conventions;
- **current state:** ROADMAP.md (read first), architecture/PICKUP.md (superseded), components/{scope,orchestrator}/TODO.md,
  runs/README.md;
- **local elaboration:** components/*/MODEL.md, DECISIONS.md, PLAN.md and LEARNINGS.md;
- **product artifact:** skills/*.md, components/*/skills/*.md, architecture/LANGUAGE.md and SCHEMA.md, and the
  WORKFLOW.md stubs;
- **template:** components/*/template/, and roles/ (reference examples);
- **historical:** archive/, components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md, architecture/PICKUP.md,
  struck-through DECISIONS entries, and runs/*;
- **research:** PI_AGENT_OVERVIEW.md, AUTH_OPTIONS_ANALYSIS.md;
- **redirect:** ORCHESTRATION.md.

| Concept | Canonical home | Links or summaries | Problem |
|---|---|---|---|
| This repository's status and authority | none recorded | README.md and AGENTS.md notices; DECISIONS.md:137, :158 | F1, F2 |
| Vision and values | NORTH_STAR.md | README.md, AGENTS.md | none |
| Five-layer model | MODEL.md:25-48 (why: DECISIONS.md 2026-04-23) | RUNTIME.md:7 zoomed view | none |
| Orchestration anatomy, including scope manager seams | the snapshot through INDEX.md (DECISIONS.md:855-861) | MODEL.md:86, components.yaml:24, AGENTS.md:32 (summaries) | RUNTIME.md:57-84 restates it (F9) |
| Settled decisions | DECISIONS.md | AGENTS.md:12-34 summary; component DECISIONS.md files | F19a; F5 on how the summary changes |
| Architectural open questions | contested (F7) | RUNTIME.md:165-167, SCOPES_PLANNED.md:88-90, orchestrator MODEL.md:80-87 | F12, F13, F19b |
| Temporal coordinator V0 | components/temporal-coordinator/SPEC.md | SCHEDULING.md, MODEL.md:88, RUNTIME.md:33-49, components.yaml:30, ARCH.md | ROADMAP.md, PI_AGENT_OVERVIEW.md and the archive header (F14) |
| Scope schema | components/scope/template/scope.yaml with components/scope/DECISIONS.md | components/scope/MODEL.md | manifest and identity fields (F16) |
| Role and binding schema | components/agent/template/ with components/agent/DECISIONS.md | roles/ (example), live copy in scope-professional-presence | copy-from-reference drift, recorded in runs/002 RUN.md:241 |
| Committed first workflows | SCOPES_PLANNED.md (per DECISIONS.md:452) | DECISIONS.md:454-456, ROADMAP.md:33-35, orchestrator PLAN.md:15-18 (name-only summaries) | consistent today |
| Local directory layout | DECISIONS.md:174-178 | README.md Related, components.yaml paths | F18 |
| Current work | ROADMAP.md | PICKUP.md, component TODO.md files, run "Pickup" sections | F10, F12h, F14, F20 |

## Loop map

- **Documented loop:**
  1. AGENTS.md "Session start": ROADMAP.md, MODEL.md, DECISIONS.md, components.yaml, then the component docs.
  2. `skills/session-kickoff.md` builds a current-state packet in the conversation and picks 1-3 next actions.
  3. The work is done.
  4. `skills/entropy-guard.md` runs before a non-trivial commit (AGENTS.md:72).
  5. Open issues go to DECISIONS.md Open Questions.
- **Real loop, inferred without git history:**
  - The architecture work of July started from architecture/PICKUP.md, through INDEX.md's "Current Pickup".
  - The run work started from each RUN.md "Pickup — start here next session" section.
  - Decisions were captured as dated DECISIONS.md entries, with supersession notes.
  - Cleanup happened in sweeps: PICKUP.md:15's "hygiene pass" and the archive header's "decoupling sweep".
  - The handoff was the commit.
  - The guard's metadata was not refreshed after 2026-04-27 (F8), so there is no evidence it ran after the July
    decisions.
- **Now:** a fresh session enters through README.md or AGENTS.md, meets the notice, and then reads a "Session start"
  and a ROADMAP.md that still direct design work (F4). This is the live loop risk.

## Ranked risks

1. **Status ambiguity sends sessions into a reference-only repository (workflow drift and prose control).**
   - Decay rate: immediate, on every fresh session.
   - Recovery cost: high. Work lands in a non-authoritative repository and diverges from `../personal-agent` and
     `../../scope`.
   - Symptoms: F1, F4, F8, AGENTS.md:8, and ROADMAP.md's unchecked "Working towards next".
   - Anchor: a dated, attributed DECISIONS.md entry (Q1), then ROADMAP.md's status section.
2. **Superseded material sits next to live-looking truth.**
   - Decay rate: none now, because the repository is frozen; each reader is misled once.
   - Recovery cost: medium.
   - Symptoms: F9, F10, F14, F15.
   - Anchor: architecture/INDEX.md and the dated DECISIONS.md entries of 2026-07-16 and 2026-07-26.
3. **Parallel truth and zombie open questions.**
   - Decay rate: medium while active, and nil while frozen.
   - Recovery cost: medium, because each resolution must be traced through 8 places.
   - Symptoms: F7, F11, F12, F13, F19.
   - Anchor: DECISIONS.md and the snapshot, once F7 has an owner.
4. **Learnings lost at the repository boundary.**
   - Decay rate: one loss, at the freeze.
   - Recovery cost: medium to high, because the runs would have to be repeated.
   - Symptoms: F20.
   - Anchor: the successor repositories, which were not checked (Q3).
5. **Unauthorised schema and policy drift.**
   - Decay rate: low.
   - Recovery cost: low while frozen.
   - Symptoms: F16, F17.
   - Anchor: DECISIONS.md:466-475, and a decision on auth if one is ever made.

## Recommendations

- **Consolidate:** none while the repository is reference-only. If Q1 is answered "active": give open questions one
  owner (F7), reduce RUNTIME.md's scope-manager section to a link to the snapshot (F9), and reduce
  components/orchestrator/DECISIONS.md:18-29 to a link (F19a).
- **Demote** the existing guard surfaces, provisional on Q1 (see Guard surfaces):
  - `skills/entropy-guard.md`: runs only on an authorised change, and its snapshot is historical;
  - `skills/session-kickoff.md`: not run unless a change is authorised;
  - AGENTS.md "Session start": a step 0 that points to the notice and the ROADMAP.md status section.
- **Mark historical:** the notice already does this for the whole repository. The ROADMAP.md status section names the
  nearby superseded material (F9, F10, F14), so no per-file banners are needed while the repository is frozen.
- **Record:** the proposed DECISIONS.md status entry (F2, Q1).

## One-time cleanup

**Gated by Q2.** If Q2 is answered A, apply only the patch. If Q2 is answered B, apply these as well. Each item was
checked against the current file on 2026-10-07.

1. RUNTIME.md:57-84. Replace the full scope-manager description with a summary and a link to the snapshot, and drop
   "unified" at :67 and :82 (F9, DECISIONS.md:575).
2. components/orchestrator/MODEL.md:25 and :40. Replace provisioning or assembly calls with task submission, citing
   DECISIONS.md:648, and keep "update manifest status for scope Y" (F11).
3. F12a-e and F12g-h. Mark each resolved, with a link to the resolving entry. F12f: correct the pointer so it reads
   "direction set" (DECISIONS.md:666).
4. DECISIONS.md:896. Mark the question as resolved by the 2026-05-14 entry, and keep the sync/drift caution visibly
   open (F13).
5. ROADMAP.md:48 and :56, PI_AGENT_OVERVIEW.md:94 and :99, and the archive header at :3-8. Point to SCHEDULING.md and
   the 2026-07-26 decision (F14).
6. components/orchestrator/DECISIONS.md:18-29. Reduce to a link to DECISIONS.md:489-500 (F19a).
7. scope-design.md:159-164, role-design.md:200-204 and components/scope/TODO.md:42-43. Replace the copied question
   text with links (F19b). This leaves F7 open.
8. F16 and F17. Record each as a proposal in DECISIONS.md awaiting the steward. Do not edit the intent documents to
   match the work.

F15 and F21 need no cleanup while the repository is frozen. If it becomes active, F15 calls for a v2 snapshot and F21
for a note on the log's ordering.

**Tracking:** this list belongs in ROADMAP.md's status section or a handoff note, never in the guard. The proposed
status section refers to it only as the Q2 question.

## State-file update

ROADMAP.md is the state file the loop reads first (AGENTS.md:38). `proposed-changes.patch` adds a "Status — read this
first" section holding:
- the stage, provisional on Q1;
- the canonical documents to trust as history;
- misleading material nearby;
- Q1-Q3, unanswered;
- three next actions;
- when the section goes stale and who refreshes it.

It settles no open question. No competing summary file is added.

## Guard surfaces (docs-first Step 7)

**1. Existing surfaces:**

| Surface | Executes? | Classification |
|---|---|---|
| skills/entropy-guard.md | no (discipline-based, :114) | **demote**: status note, provisional on Q1 |
| skills/session-kickoff.md | no | **demote**: one "When NOT to Run" line |
| AGENTS.md "Session start" and "Working practices" | no | **amend**: step 0 points to the notice. The intent path at :14 (F5) is reported, not changed, because changing it is a decision |
| README.md and AGENTS.md reference-only notices | no (F4) | **keep**, and record in DECISIONS.md (F2) |
| architecture/INDEX.md "This index alone says what is current" | no | **keep**; its pickup line is fixed (F10) |
| components/*/template/, roles/ | no | **keep** (frozen templates and examples) |
| runs/.gitignore | yes, through git | **keep** |
| Hooks | none exist | ROADMAP.md:69's "automated coherence checks on hooks" is not pursued while reference-only |

**2. The matrix's checks, written against this repository's files.** These are inputs for a future `update` if Q1 is
answered "active". They are not a guard.
- **Parallel truth:** if DECISIONS.md, INDEX.md or a snapshot changed, do RUNTIME.md, MODEL.md, components.yaml or
  AGENTS.md:12-34 restate the changed anatomy instead of linking to it (F9, F6)?
- **Local-global inversion:** if components/*/DECISIONS.md or MODEL.md changed, do they restate a root decision in full
  (F19a), or list a resolved root question as open (F12a-c)?
- **Superseded nearby:** before reviving anything from PICKUP.md, INTERFACE_REFINEMENT_PLAN.md, archive/ or a
  struck-through DECISIONS.md entry, check DECISIONS.md 2026-07-16 and 2026-07-26 for its supersession.
- **Stale references:** if a path or name changed, search for the old one. Check components.yaml and README.md
  "Related" paths against DECISIONS.md:174-178 (F18).
- **Lost decisions:** did this session produce a decision, or a run finding meant for the architecture? Record it in
  the owner F7 settles, and in date order (F21).
- **State dishonesty:** if ROADMAP.md, PICKUP.md or a component TODO.md changed, does it still agree with DECISIONS.md
  and the status notice, and does INDEX.md's pickup line point at a live file (F10)?
- **Workflow drift:** would a fresh agent following AGENTS.md "Session start" have made this change, and was the
  change explicitly authorised (F4)?
- **Intent:** a change to AGENTS.md:12-34 or NORTH_STAR.md needs the steward's recorded decision (F5).
- **Brittle automation:** none exists. Keep every check as judgment; only link checks are stable enough to automate.

**3. Guard decision: `none`, provisional on Q1.** The repository is reference-only (docs-first Step 7.3), and the run
ends with a demotion and a correction, both delivered as a patch. If Q1 is answered "active", the decision becomes
`update` of skills/entropy-guard.md, using the inputs below.

## The generator's inputs

These are from session-coherence-skill-generator's "Inputs" list. They are not needed for `none`, and are supplied
for a possible `update`.

| Input | Value | Status |
|---|---|---|
| Steward | `justin`, inferred (F3) | unresolved |
| Documents holding authorised intent | NORTH_STAR.md; README.md and AGENTS.md notices; AGENTS.md:12-34; architecture/INDEX.md with the current snapshot | unresolved on status (Q1) |
| Decision surface | DECISIONS.md, the components' DECISIONS.md files, and the snapshot's Under Review | open-question owner unresolved (F7) |
| Open intent questions | Q1, Q2, Q3 | open |
| Current-state file and who refreshes it | ROADMAP.md, with nobody named as refresher (AGENTS.md:65-66 names only MODEL.md, components.yaml and MANIFEST.md) | refresher unresolved; the patch names one |
| Rules owned elsewhere | none found in the target; any user-wide rules file is outside this assessment | not covered |
| Verification commands | none; there is no code, CI or hook (skills/entropy-guard.md:7) | inapplicable |
| Code areas | none in this repository; the implementations are elsewhere (components.yaml:29, :35) | inapplicable |
| Live state or spend a session can change | none in the repository; the run procedures invoke paid or subscription models (runs/001-moving-stillness-status/RUN.md:21-30), and the run line is paused | paused |
| Findings | F1-F21 | supplied |

## Uncertainties

- **The status's date and author are unknown.** The chronology rests on one inference: `personal-agent` appears
  nowhere but the notices. The shared checkout time, 2026-08-01, shows only that the notice existed by then.
- **The real loop is inferred from dates inside documents,** because there is no git history.
- **What the successor repositories hold is unknown.** F20's risk may already be resolved there.
- **F15 cannot tell an in-place edit of snapshot v1 from content written on 2026-07-26 under an older date.**
- **F18's corrected paths follow this repository's own records.** Whether those directories exist was not checked.

## Feedback on the skills

These are notes on the route. Filing them as issues belongs to `skills/local/entropy-guard-feedback`, which applies
when working in the entropy-guard repository, so it was not opened here.

1. **`none` and demotion pull in different directions.** entropy-assessment Step 3 says `none` means "no guard change
   is needed", yet a reference-only system "may finish with ... a demotion". docs-first Step 7.1 classifies existing
   guards as "demote". Neither says whether a status note added to an existing guard counts as writing a guard, which
   only the generator may do. This run treated it as a demotion.
2. **The Output asks for "the generator's inputs" without saying what to do for `none`.** Listing them needed the
   generator's skill to be read. This run listed them as provisional, because Q1 could turn `none` into `update`.
3. **An unattributed status notice that contradicts dated decisions has no rule in `intent-pass.md`.** Step 2 can
   order a recorded decision over a description, but not an undated directive against a dated decision. That left
   the lifecycle provisional on a steward question.
4. **Nothing in the skills owns the placement of demoted guard surfaces.** docs-first says placing an existing guard
   belongs to guards-integrator, but the `none` route never reaches the integrator.
