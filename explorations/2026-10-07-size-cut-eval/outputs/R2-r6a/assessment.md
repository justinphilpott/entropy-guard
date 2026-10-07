# Entropy assessment: entropy-guard, snapshot 447da9a

Assessed 2026-10-07 with entropy-guard's skills: `entropy-assessment` v0.9.0, `docs-first-planning-assessment`
v0.3.0, `session-coherence-skill-generator` v0.5.0 and `guards-integrator` v0.4.0. The target is an older copy of the
entropy-guard repository and is treated as any other system.

This file holds the whole assessment and the generator's report. The other outputs are:
- `guard/SKILL.md`: the updated guard;
- `integration.md`: the integration brief;
- `questions.md`: five questions for the steward;
- `patches/`: one settled patch and six provisional patches;
- `feedback.md`: notes on entropy-guard's own skills;
- `read-log.md`: the skill files opened.

## How this run worked

- **Route:**
  1. The `entropy-assessment` intent pass.
  2. Lifecycle and shape: shape A, docs-first planning.
  3. `docs-first-planning-assessment` Steps 1-7, as a called skill.
  4. Guard decision `update`.
  5. `session-coherence-skill-generator`.
  6. `guards-integrator`.
- **Mode:** the target is a read-only snapshot, so this run was plan mode toward it, and nothing in it was edited.
  - **What a build mode would have done:** applied the settled patch, and recorded the work in `TODO.md` "Doing Now"
    first (the generator's Step 1). The work that build mode would apply is delivered as patches instead.
  - **What the patches touch:** `TODO.md`, `DECISIONS.md`, `AGENTS.md`, two skills and the four exploration files.
- **Read in full:**
  - `README.md`, `INTENT.md`, `AGENTS.md`, `DECISIONS.md`, `LEARNINGS.md`, `TODO.md`;
  - all six `SKILL.md` files;
  - `.githooks/pre-commit`, `.gitignore`, `.editorconfig`.
- **Read in part:**
  - `PHILOSOPHY.md`: lines 1-60 and its headings;
  - `LICENSE`: lines 1-5;
  - the four files in `explorations/`: their frontmatter, lines 676-749 of the 2026-03-24 conversation, and searches
    for the steward's statements.
- **Not available, so not covered:**
  - git history (the snapshot has no `.git`), so nothing here says what was committed when, or whether a guard or
    hook ran;
  - the GitHub issues the repo uses (#9-#12, and the `agent-feedback` label);
  - the sibling repositories `entropy-immune-system` and `writing`;
  - any user-wide instructions file.

## Intent

### Steward

Justin Philpott. No document in the repo names a steward (F01). The evidence settles who it is:
- **He decides scope, in his own recorded words.** On 2026-03-24 he wrote: "let's keep them in explorations, as I want
  to preserve the entropy-guard project and really farm this new evolution off into its own repo"
  (`explorations/2026-03-24-entropy-immune-system-conversation.md` line 713).
- **He is the only named human.** See `PHILOSOPHY.md` line 43, and the `participants` field of every exploration.
- **The repositories are his.** They live under his GitHub account (`skills/local/entropy-guard-feedback/SKILL.md`
  line 10, `AGENTS.md` line 68, `DECISIONS.md` line 142).

### Statements used

| Where | Kind | Evidence of authority | Date |
|---|---|---|---|
| `explorations/2026-03-24-entropy-immune-system-conversation.md` line 713 | directive (scope) | attributed to Justin Philpott, dated | 2026-03-24 |
| same file, line 611: "the entropy-guard ran as a pre-commit" | observation by the steward | attributed, dated | 2026-03-24 |
| `DECISIONS.md` line 26, "Farm broader entropic-immunity exploration…" | decision | neither (it matches the line 713 directive) | none |
| `DECISIONS.md` line 18, "Specialize first around docs-first planning repos…" | decision | neither | none |
| `DECISIONS.md` line 10, bootstrap mode for the session-coherence skill | decision | neither | none |
| `DECISIONS.md` line 42, refinement and bootstrap verification | decision | neither | none |
| `DECISIONS.md` line 81, skill format (`name` matches folder) | decision | neither | none |
| `DECISIONS.md` line 90, guards carry their integration | decision | neither | none |
| `INTENT.md` (whole), the declared north star (`AGENTS.md` line 38) | directive and description | dated revision note, unattributed (line 5) | 2026-04-07 |
| `INTENT.md` line 3, "refined collaboratively — by humans and AI agents" | directive | neither | none |
| `INTENT.md` lines 122-135, scope boundary and validation loop | directive | via the dated revision note, unattributed | 2026-04-07 |
| `INTENT.md` line 88, who carries the generator role | description | via the revision note | 2026-04-07 |
| `INTENT.md` line 94, guards carry a "system snapshot" | description | via the revision note | 2026-04-07 |
| `AGENTS.md` line 19, run the guard before committing, "non-negotiable" | standing instruction | neither | none |
| `AGENTS.md` line 27, "update INTENT.md and note why" | standing instruction | neither | none |
| `AGENTS.md` lines 31-34, project constraints | standing instruction | neither | none |
| `README.md` lines 119-125, project status | description | neither | none |
| `skills/local/entropy-guard/SKILL.md` lines 68, 88, 90, 99 | guard repair instructions | neither | none |
| `LICENSE` line 3, "Copyright (c) 2026 entropy-guard" | description | none | 2026 |

### Authorised intent

- **Scope.** entropy-guard is the practical project: assessment, guard generation and refinement, integration, and
  validation on real projects. The broader entropic-immunity theory continues in the sibling `entropy-immune-system`
  repo.
  - Sources: the steward's directive (conversation line 713), `DECISIONS.md` line 26, `INTENT.md` lines 124-127,
    `AGENTS.md` line 34.
- **Specialisation.** The work specialises first around docs-first planning repos. `entropy-assessment` stays the one
  front door, and `guards-integrator` stays separate (`DECISIONS.md` line 18).
- **What a guard is.** A guard is delta-scoped and low-burden, at 2-10 minutes. It checks coherence, not content, and
  is not a blocker. Each check sits at the right enforcement depth, and the project applies its own guards to itself
  (`INTENT.md` lines 59-65, 98-118).
- **Repository constraints.**
  - The repo is markdown-first, with no runtime (`AGENTS.md` line 31).
  - Exportable skills live in `skills/`, local ones in `skills/local/` (`DECISIONS.md` line 74, `AGENTS.md` line 33).
  - Skills follow the agentskills.io format (`DECISIONS.md` line 81).
- **Next step.** Validate externally on a larger batch of docs-first planning repos (`INTENT.md` lines 129-135,
  `TODO.md` "Next Up"). What the validation measures is open (Q3).

Only the scope statement can be traced to the steward's own words. The rest are recorded decisions and directives
with no author or date, so precedence is the system's own: `INTENT.md` is the north star (`AGENTS.md` line 38), and
`DECISIONS.md` holds the decisions. That uncertainty is F02.

### Declared, enacted and authorised

- **Declared:** a practical guard workflow, strongest for docs-first planning repos, entered through a routing front
  door. The generator role belongs to the assessment skills (`INTENT.md` line 88; `README.md` lines 23-66).
- **Enacted:** the commit history was not available, so this is inferred from the files.
  - **The newest dated work:** a second, generic guard writer, `session-coherence-skill-generator` (metadata
    2026-05-10 and 2026-05-11), and a decision giving it a bootstrap mode. Its "FlowBook" mentions suggest it was
    written for another project.
  - **The work not started:** the validation batch, whose "Next Up" items in `TODO.md` are all unchecked.
- **Authorised:** see above. No recorded decision covers adopting the second writer or its relation to the
  docs-first guard design. The bootstrap decision at `DECISIONS.md` line 9 takes the skill as already present. That
  gap is a conflict with a missing decision (F05), not unauthorised drift, because a recorded decision builds on the
  skill.

### Gaps by condition

| Condition | Findings | Response |
|---|---|---|
| Stale description | F07, F09 | Corrected, citing "Specialize first…" (`DECISIONS.md` line 18), in the settled patch. `INTENT.md` line 88 is not plainly settled by any decision, so it stays open (Q1). |
| Conflict | F05, F11, F16, F22 | Both sides presented (Q1, Q3, Q5). F16 follows `README.md` inside the provisional guard update. |
| Missing | F01; F05 (no decision adopts the second writer) | F01 is settled by evidence (S6). F05's missing decision is Q1. |
| Ambiguous | F03, F13, F21 | Readings given (Q2, Q4). F21 does not change this run's work, so it was not asked. |
| Unauthorised drift | F08 | The work is fixed: the lost requirement is restored (S3). |
| Prose control | F18 | Enforcement would sit in a commit-msg hook or CI. Reported, not changed. |

### Repair instructions in the existing guard

Read against entropy-guard's intent-change rule, v2.
- **Intent: one repair treats the work as permission to change intent.** `skills/local/entropy-guard/SKILL.md` line
  68 says: "If misaligned: update the skill, or if INTENT.md itself needs revision, update it with a dated note
  explaining what prompted the change." `AGENTS.md` line 27 gives the same path ("update INTENT.md and note why"), and
  `INTENT.md` line 3 invites it. Whether that path is authorised is Q2 (F03).
- **Ownership: two repairs keep descriptions in step without asking which one owns the concept.**
  - Line 88 says: "Did you change something that another doc also describes? If so, update both."
  - Line 99 says: "…AGENTS.md (Key Files section), README.md (Key Documents table), and any other docs that list
    project structure? Update if not."
  - **Why this is a defect, not a duplicate:** line 87 asks the right question, about one canonical home. The lists in
    `README.md` and `AGENTS.md` are summaries, which should be kept correct. The defect is that lines 88 and 99 do not
    tell a summary (keep it correct) from an independent second definition (reduce it to a link).
  - **A related repair:** line 90, "If inconsistent: fix it now.", repairs without first establishing which side is
    wrong (F04).

### Questions

Five questions, all in `questions.md` with readings, a case from this repo where the readings diverge, and a
recommended answer:
- **Q1:** which skill writes guards.
- **Q2:** whether agents may revise `INTENT.md` themselves.
- **Q3:** what the external validation measures.
- **Q4:** where the docs-first current-state packet lives.
- **Q5:** whether a guard carries a system snapshot.

### Proposed changes and where they were recorded

The settled patch adds one entry at the top of `DECISIONS.md`, "Open proposals awaiting the steward", which records
all five proposals as undecided. `TODO.md` "Current state" lists them as open questions and links to that entry.
Nothing that depends on an answer is in the settled patch.

## Lifecycle, shape and repositories

- **Lifecycle: active.** This is the repo's own declaration, and not confirmed by history.
  - **Evidence:** `README.md` line 5 ("actively used, actively refined") and line 121 ("Actively evolving"); open
    "Next Up" work in `TODO.md`; the newest dated content is 2026-05-11, in the session-coherence skill's metadata.
  - **What could not be checked:** with no git history, nothing here says whether the real repository has moved on
    since the snapshot.
- **Shape: A, docs-first planning.** Markdown is the product, decision logs, TODOs and agent instructions carry state,
  and work happens in repeated human and agent sessions (`AGENTS.md` lines 17-34).
  - **D, workflow-heavy, also fits:** the repo exports a way of working (`DECISIONS.md` line 57).
  - **Why A is the riskier fit:** the top three risks below are docs-to-docs and product-contract drift, which A's
    matrix covers along with workflow drift. The workflow-specific risks rank lower (F16, F18).
- **Repositories: one.** The sibling repos `entropy-immune-system` and `writing` receive material farmed out of this
  one. They do not manage its work, so they were not assessed and were not read.

## Planning horizon

- **Settled:**
  - the practical scope;
  - specialising on docs-first with one front door;
  - one local guard covering docs and workflow;
  - moving from external to prompted guards;
  - `skills/` versus `skills/local/`;
  - the agentskills.io format.
- **Active:** the external validation batch, and refining the docs-first skill, the packet and the integration advice
  from its results (`TODO.md` "Next Up").
- **Exploratory:**
  - the guard runner and evaluator (`INTENT.md` lines 92-94; `TODO.md` "Backlog");
  - a multi-domain validation;
  - further specialised tracks;
  - `doc-health-check`;
  - all theory, which now lives in the sibling repo.

## Findings

One list. Each finding gives its condition or vector, its evidence and its severity. Line numbers are in the snapshot
as read on 2026-10-07.

- **F01: no document names the steward.**
  - **Condition:** missing.
  - **Evidence:** `README.md`, `INTENT.md` and `AGENTS.md` name no owner or decider, and `LICENSE` line 3 names
    "entropy-guard". The evidence under "Steward" above settles that it is Justin Philpott.
  - **Fixed by:** S6. **Severity:** medium, because every proposal needs someone to go to.
- **F02: no decision carries a date or an author.**
  - **Condition:** missing evidence of authority.
  - **Evidence:**
    - All 17 entries in `DECISIONS.md` are Context, Decision and Impact only.
    - The order is newest-first at the top but not throughout: "Two-layer…" (line 103) sits above "Consolidate…"
      (line 129), which supersedes it.
    - The `INTENT.md` revision note (line 5) is dated but unattributed.
  - **Effect:** only the scope decision can be traced to the steward's own words.
  - **Fixed by:** not patched retroactively, which would need the steward's memory. The updated guard asks for a date
    on each new entry. **Severity:** medium.
- **F03: three instructions let agents rewrite intent.**
  - **Condition:** ambiguous, and flagged as an intent repair.
  - **Evidence:** guard line 68, `AGENTS.md` line 27 and `INTENT.md` line 3, quoted above.
  - **Next:** Q2. **Severity:** high, because the repo itself calls intent entropy "catastrophic to recover"
    (`INTENT.md` line 33).
- **F04: repairs keep descriptions in step without asking which one owns the concept.**
  - **Condition:** an ownership flag.
  - **Evidence:** guard lines 88, 90 and 99, and `AGENTS.md` lines 62-64 ("Maintaining These Docs").
  - **Fixed by:** the updated guard's "Repairs" section, which is provisional (the guard update). **Severity:**
    medium.
- **F05: two skills write guards, to different contracts.**
  - **Condition:** a conflict, with a missing decision.
  - **Evidence:**
    - `skills/docs-first-planning-assessment/SKILL.md` lines 132-202 against
      `skills/session-coherence-skill-generator/SKILL.md` lines 198-315.
    - Neither names the other.
    - `skills/entropy-assessment/SKILL.md` line 68 routes only to the first; `INTENT.md` line 88 assigns the generator
      role only to the assessment skills; `README.md` lines 89 and 91 say both produce guards.
    - No decision adopts the second writer. Searched: every mention of "session-coherence" in the repo; there are no
      commit messages to search.
  - **Next:** Q1. **Severity:** high.
- **F06: the session-coherence skill carries residue from the project it was written for.**
  - **Condition:** standalone residue.
  - **Evidence:**
    - "FlowBook" appears at lines 22-23 and 193-194 of `skills/session-coherence-skill-generator/SKILL.md`, and in no
      other file.
    - Its frontmatter uses `generated`, `last_updated` and `skill_version` (lines 4-13), where the other five skills
      use `metadata.version`.
    - It is dated 2026-05-10 and 2026-05-11, later than `INTENT.md`'s last revision and the local guard's last
      evaluation, both 2026-04-07.
  - **Fixed by:** it is flagged in `TODO.md` "Misleading material nearby" (S1). Rewriting the skill belongs with Q1.
    **Severity:** low to medium.
- **F07: `guards-integrator` names a step that no longer exists.**
  - **Condition:** a stale description, settled by "Specialize first…": `entropy-assessment`'s role became "triage
    and routing" (`DECISIONS.md` line 18).
  - **Evidence:** `skills/guards-integrator/SKILL.md` line 20 says "After `entropy-assessment` generates one or more
    guards". Version 0.6.0 of `entropy-assessment` routes and never generates (lines 66-71, 116-126).
  - **Fixed by:** S4. **Severity:** low.
- **F08: a recorded requirement was lost when `entropy-assessment` became a router.**
  - **Condition:** unauthorised drift.
  - **Evidence:**
    - `DECISIONS.md` line 42: "Require bootstrap actions to be verified against the current artifact before they are
      written". `LEARNINGS.md` lines 27-33 record the two errors it prevents.
    - `skills/docs-first-planning-assessment/SKILL.md` line 114 lists "Bootstrap actions" with no verification.
    - A search for "verif" across the six skills finds only `skills/guards-integrator/SKILL.md` line 96, which is
      unrelated.
    - "Specialize first…" records no removal.
    - The decision's other requirements survive: refinement as an outcome (docs-first lines 132-152), completion
      tracked outside the guard (docs-first line 202), and, in part, the cold-start pattern (`guards-integrator` line
      107).
  - **Fixed by:** S3, which fixes the work. **Severity:** medium.
- **F09: superseded decisions sit unmarked beside live ones.**
  - **Condition:** superseded material nearby.
  - **Evidence:** four entries describe `entropy-assessment`'s Phase 2, Step 8 or domain appendices as current:
    `DECISIONS.md` lines 39-43, 47-51, 95-99 and 113-117. None carries a supersession marker, while lines 105 and 131
    carry markers in the repo's own style. `LEARNINGS.md` lines 33, 42, 52 and 112 cite the same structure as
    evidence; they are historical records and are left as they are.
  - **The risk:** a session "restores" Phase 2 to `entropy-assessment`.
  - **Fixed by:** S2, and the supersession check in the guard. **Severity:** medium.
- **F10: exploration material sent to the sibling repo is not demoted here.**
  - **Condition:** superseded material nearby.
  - **Evidence:**
    - The four files in `explorations/` (1,467 lines) carry `status: complete` or `draft` and no historical marker.
    - They are absent from `README.md` "What's here" and from `AGENTS.md` "Key Files", but cited by `LEARNINGS.md`
      line 122 and `PHILOSOPHY.md` line 45.
    - `LEARNINGS.md` lines 117-143 hold three theory entries, "validated by" a conversation, whose implications steer
      future design. Line 123 reads "The mature form collapses assess → fix with no persistent guard artifact".
  - **Fixed by:** S5 and S6. The `LEARNINGS.md` entries are left as they are: no decision settles whether they move.
    **Severity:** medium.
- **F11: three statements of the validation measure disagree, and `README.md` restates `INTENT.md`'s loop in full.**
  - **Condition:** a conflict, with parallel truth.
  - **Evidence:** `DECISIONS.md` line 26, `INTENT.md` lines 129-135, `README.md` line 125, `TODO.md` line 12.
  - **Next:** Q3. **Severity:** medium.
- **F12: the state file holds tasks only.**
  - **Condition:** a risk of state dishonesty.
  - **Evidence:**
    - `TODO.md` (20 lines) has no stage, no documents to trust first, no open questions and no superseded material,
      yet `AGENTS.md` line 22 makes it the live context, and guard line 127 calls it the "live state representation".
    - `TODO.md` line 3 says to "graduate to an issue tracker" later, but GitHub issues are already in use
      (`DECISIONS.md` line 17; the feedback helper). Part of the state lives where this snapshot cannot show it.
  - **Fixed by:** S1. **Severity:** medium.
- **F13: the docs-first skill does not say where its current-state packet lives.**
  - **Condition:** ambiguous.
  - **Evidence:** `skills/docs-first-planning-assessment/SKILL.md` lines 116-126; `README.md` line 40; `INTENT.md`
    line 73.
  - **Next:** Q4. **Severity:** medium, because it shapes every repo assessed.
- **F14: the existing guard holds stale references and claims.**
  - **Evidence:**
    - Line 99 points at "README.md (Key Documents table)"; `README.md`'s tables are under "What's here" (line 82).
    - Line 92 says "With 20+ markdown files"; the snapshot holds 17.
    - Line 14 says the guard was "Generated by" both assessments, while line 19 says it was generated on 2026-03-19
      by `entropy-assessment` v0.4.0, and line 21 that it was evaluated on 2026-04-07 against the docs-first skill.
    - Lines 33 and 137 point at `doc-health-check`, which does not exist. That is honestly tracked (`TODO.md` line
      20).
  - **Fixed by:** the guard update. **Severity:** low to medium.
- **F15: the existing guard cannot find "this session", and does not check the skills' contracts.**
  - **Evidence:**
    - Line 12 scopes the guard to "what changed in this session" but gives no way to find where the session started.
    - It has no mode or safety rules.
    - Nothing checks that a skill's name, path or handoff still matches the skills that call it, which is the drift
      in F05 and F07.
    - It records no evaluation after 2026-04-07, and the session-coherence skill was added after that. Whether the
      guard ran in that session cannot be told without history.
  - **Fixed by:** the guard update. **Severity:** medium.
- **F16: `README.md` and the guard disagree about when to record the guard's result.**
  - **Condition:** a minor conflict.
  - **Evidence:** `README.md` line 138 says to commit with a note, or "entropy check clean"; guard line 131 says to
    include the note "if anything changed".
  - **Fixed by:** the updated guard follows `README.md`, because a run that leaves no note looks the same as a skipped
    run (`integration.md`). This is part of the guard update. **Severity:** low.
- **F17: the labels for enforcement depth have drifted.**
  - **Condition:** inconsistency.
  - **Evidence:** `INTENT.md` lines 102-105 and `skills/guards-integrator/SKILL.md` lines 94-97 call the first depth
    "External", where `skills/docs-first-planning-assessment/SKILL.md` line 179 calls it "Narrative /
    judgment-heavy". `INTENT.md` owns the spectrum.
  - **Fixed by:** S7. **Severity:** low.
- **F18: the guard's run is described as enforced, and nothing enforces it.**
  - **Condition:** prose control.
  - **Evidence:**
    - `AGENTS.md` line 19 calls it "non-negotiable"; `README.md` line 78 says "This project runs its own entropy guard
      before every commit".
    - The only mechanism, `.githooks/pre-commit` (lines 3-9), prints a reminder and exits 0. That is by design
      (`DECISIONS.md` line 34), and it runs only once linked into `.git/hooks/` (`README.md` line 140), which the
      snapshot cannot show.
    - The steward observed on 2026-03-24 that "the entropy-guard ran as a pre-commit" (conversation line 611).
  - **Where enforcement would sit:** a commit-msg hook or CI step that requires the guard's note. Nothing cites the
    rule as a safety control.
  - **Fixed by:** not changed, because the non-blocking choice is a recorded decision. `integration.md` covers how to
    verify adoption. **Severity:** low to medium.
- **F19: seed scaffolding residue.**
  - **Evidence:**
    - `AGENTS.md` line 21 ("Working code with tests…") in a repo with no code or tests (`AGENTS.md` lines 51 and
      57);
    - `.gitignore` lines 17-25 (Go);
    - `.editorconfig` lines 11-18 (Python, Go, Makefile).
  - **Fixed by:** not patched; it is harmless. **Severity:** low.
- **F20: a reference that cannot be checked.**
  - **Evidence:** `LEARNINGS.md` line 63 says "Led to the distill-article skill." No such skill is here.
    `DECISIONS.md` line 142 sends articles to the separate `writing` repo, which was not read.
  - **Status:** not covered.
- **F21: `INTENT.md` says both that every guard is a skill file and that guards are not always skill files.**
  - **Condition:** ambiguous.
  - **Evidence:** line 80 says "Each guard is a skill file ready to be placed"; line 65 says "Always a skill file: not
    all guards are checklists".
  - **Readings:** (a) the generator only ever outputs skill files; (b) judgment guards ship as skill files, and
    mechanical checks take other forms.
  - **Where they diverge:** the updated guard's name-match command could become its own CI check under (b), but not
    under (a).
  - **Why it was not asked:** this run keeps the command inside the guard. **Severity:** low.
- **F22: `INTENT.md` says guards carry a system snapshot, and the generators disagree.**
  - **Condition:** a conflict.
  - **Evidence:** `INTENT.md` line 94 says "(generated date, system snapshot) that each guard carries"; the old guard's
    lines 18-22 carry a snapshot; the session-coherence template (lines 274-280) carries only `generated` and `source`;
    entropy-guard's current generator forbids copying state into a guard.
  - **Next:** Q5. **Severity:** low to medium.

## Truth map

Roles:
- **Canonical:** `INTENT.md` (purpose and principles), `DECISIONS.md` (decisions), `AGENTS.md` (working practice).
- **Current state:** `TODO.md`.
- **Product artifacts:** the five `skills/**/SKILL.md` files and the local guard. Their names, paths and handoffs are
  contracts.
- **Templates:** the guard templates inside the docs-first and session-coherence skills.
- **Historical:** `explorations/`, and the superseded entries in `DECISIONS.md`.
- **Free reflection, not canonical:** `PHILOSOPHY.md`.
- **Entry summary:** `README.md`.
- **Local elaboration:** none.

| Concept | Owner | Also stated in | State |
|---|---|---|---|
| Purpose, entropy model, guard principles, enforcement depth, guard lifecycle | `INTENT.md` | `README.md` "What is an entropy guard?"; `AGENTS.md` intro (summaries) | clear owner; line 88 open (F05), line 94 open (F22) |
| Scope: practical work here, theory in the sibling repo | `DECISIONS.md` "Farm…", from the steward's line 713 | `INTENT.md` "Scope boundary"; `README.md` lines 7 and 123; `AGENTS.md` line 34 | consistent |
| Validation loop and its measure | `INTENT.md` lines 122-135 | `README.md` line 125 (full restatement); `DECISIONS.md` line 26 (different measure); `TODO.md` "Next Up" (tasks) | parallel truth and conflict (F11) |
| How contributors work | `AGENTS.md` "Working Practices" | `README.md` "Contributing"; guard check 4; hook text | mostly consistent (F16, F18) |
| What each skill does | each `SKILL.md` | `README.md` skill tables; `AGENTS.md` "Key Files"; `INTENT.md` lines 71 and 86-90 | summaries correct except `INTENT.md` line 88 (F05) and `guards-integrator` line 20 (F07) |
| How a guard is written | two owners: docs-first Phase 2 and the session-coherence skill | `README.md` lines 52-58 | two owners (F05) |
| Current state | `TODO.md` | GitHub issues (not read) | thin (F12) |
| Decisions | `DECISIONS.md` | none | undated (F02); superseded entries unmarked (F09) |
| Learnings | `LEARNINGS.md` | `PHILOSOPHY.md` (reflections) | theory entries (F10) |
| This repo's guard | `skills/local/entropy-guard/SKILL.md` | `AGENTS.md` lines 19 and 41; `README.md` line 78; the hook | F14, F15 |
| Which files exist | the filesystem | `README.md` "What's here"; `AGENTS.md` "Key Files" and "Quick Links" (summaries) | `explorations/` missing from both (F10) |

## Loop map

- **Start:** an agent loads `AGENTS.md`, then reads `TODO.md` and writes "Doing Now" (`AGENTS.md` line 22).
  Orientation otherwise comes from `README.md` and `INTENT.md`, because no current-state section exists before S1.
- **Work:** edits to skills and documents, with "Docs travel with code" (`AGENTS.md` line 23).
- **Pause:** the local guard before commit (`AGENTS.md` line 19), and the hook's reminder if it is linked (unknown).
- **Capture:** `DECISIONS.md` and `LEARNINGS.md`, through guard checks 1-2.
- **Handoff:** a commit carrying the guard's note (`README.md` line 138), with "Doing Now" cleared (`AGENTS.md` line
  22; hook line 6). Sometimes a pull request with review (`LEARNINGS.md` line 152).
- **Feedback upstream:** GitHub issues through the feedback helper.
- **The real loop against the documented one:** the history needed to compare them is absent. The steward reported
  the guard running at pre-commit on 2026-03-24. One sign of divergence since: the 2026-05 addition of the
  session-coherence skill left `INTENT.md`, `entropy-assessment` and the docs-first skill out of line, and no decision
  recorded the addition (F05).

## Ranked risks

1. **Two guard writers** (F05, F06, F07, F22).
   - **Decay:** medium. Every edit to either skill widens the gap, and outside users already receive two shapes.
   - **Recovery:** high. Guards in the wrong shape live in other repos.
   - **Anchor:** the steward's Q1 decision in `DECISIONS.md`, then `INTENT.md` "The guard lifecycle".
2. **Agents may rewrite intent, with no named steward and no attributed decisions** (F01, F02, F03).
   - **Decay:** slow.
   - **Recovery:** very high (`INTENT.md` line 33).
   - **Anchor:** the Q2 decision, and the steward line in `AGENTS.md`.
3. **Superseded material nearby, and one requirement already lost** (F08, F09, F10).
   - **Decay:** medium.
   - **Recovery:** medium.
   - **Anchor:** supersession markers in `DECISIONS.md`, and `TODO.md` "Misleading material nearby".
4. **State and measure drift** (F11, F12, F13, F18).
   - **Decay:** fast.
   - **Recovery:** cheap if caught within one session.
   - **Anchor:** `TODO.md`, and `INTENT.md`'s validation section.
5. **Guard and reference drift** (F04, F14, F15, F16, F17).
   - **Decay:** fast.
   - **Recovery:** cheap.
   - **Anchor:** each `SKILL.md`, and the updated guard.

## Recommendations

- **Consolidate, all provisional:**
  - guard writing into one skill (Q1);
  - the validation loop into `INTENT.md`, with `README.md` linking to it (Q3);
  - the intent-change policy, across `AGENTS.md`, `INTENT.md` and the guard (Q2);
  - the packet into the existing state file (Q4).
- **Demote or mark historical, settled:**
  - the four superseded `DECISIONS.md` entries (S2);
  - `explorations/` (S5, S6).
- **Demote, not patched:**
  - the "FlowBook" mentions, which go with the Q1 rewrite of the session-coherence skill;
  - the three theory entries in `LEARNINGS.md` (lines 117-143). The steward decides whether they move to the sibling
    repo, which nothing recorded settles.
- **Leave:** the seed residue (F19), which is low value. `AGENTS.md` line 21 can be tidied in any later session.

## Patches

- **Settled:** `patches/settled.patch`, applied with `patch -p1` from the repository root. It touches no open
  question, and each item was checked against the current file. Its items are:
  - **S1** (F12): `TODO.md` gains a "Current state" section, the docs-first state-file update set out below.
  - **S2** (F09, plus the proposals): four "Partially superseded by 'Specialize first…'" markers in `DECISIONS.md`,
    worded so as not to say which skill writes guards; and the "Open proposals awaiting the steward" entry, which
    records Q1-Q5 undecided.
  - **S3** (F08): `skills/docs-first-planning-assessment/SKILL.md` line 114 gains "each verified against the current
    file before it is written".
  - **S4** (F07): `skills/guards-integrator/SKILL.md` line 20 becomes "After one or more guards are generated or
    refined".
  - **S5** (F10): a "Historical record" banner after the frontmatter of each of the four exploration files, citing the
    "Farm…" decision.
  - **S6** (F01, F10): `AGENTS.md` names Justin Philpott as steward, and lists `explorations/` in "Key Files" as
    historical.
  - **S7** (F17): `skills/docs-first-planning-assessment/SKILL.md` line 179 is relabelled "External (narrative,
    judgment-heavy)".
- **Provisional:** not to be applied until the named question is answered and recorded in `DECISIONS.md`. Each is
  written for the recommended answer, and each file's header names its question.
  - `provisional-Q1-one-skill-writes-guards.patch`: `INTENT.md` line 88, `README.md` lines 52, 89 and 91, the
    docs-first Phase 2 introduction, `entropy-assessment` step 4d, and the session-coherence skill's requirements.
  - `provisional-Q2-who-changes-intent.patch`: `AGENTS.md` line 27 and `INTENT.md` line 3.
  - `provisional-Q3-validation-measure.patch`: `README.md` line 125, a marker on "Farm…", and `TODO.md` "Next Up"
    item 2.
  - `provisional-Q4-packet-location.patch`: docs-first lines 116 and 186, and `README.md` line 40.
  - `provisional-Q5-guard-snapshot.patch`: `INTENT.md` line 94.
  - `provisional-guard-update.patch`, waiting on Q2 and Q5: installs `guard/SKILL.md`, and updates `README.md` line
    78 and `TODO.md` line 20.
- **Housekeeping on application:** each provisional patch also removes its own question from `TODO.md`. Once the last
  is applied, the session deletes the empty "Open questions" line and the proposals entry in `DECISIONS.md`.
- **How they were checked:**
  - Applied to a copy of the target in 12 different orders, with no fuzz, no rejects and identical results.
  - Each provisional patch also applies on its own on top of the settled patch.
  - No added line has trailing whitespace.

## State-file update

Docs-first Step 5. The state file is `TODO.md`, which `AGENTS.md` line 22 makes the live context. S1 adds "Current
state" above "Doing Now", holding these:
- the stage, with its source and the date it was checked;
- the documents to trust first;
- the settled decisions, by title;
- the misleading material nearby;
- the five open questions, linked to `DECISIONS.md`;
- the next actions;
- what makes the section stale, and who refreshes it: the session that closes a "Next Up" item, answers a question or
  revises `INTENT.md`.

No competing summary file is added.

## Guard surfaces

| Surface | Keep, amend, replace or demote | Findings |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | amend, updated in place (provisional on Q2 and Q5) | F03, F04, F14, F15, F16, F22 |
| `.githooks/pre-commit` | keep; its text still matches | F18 |
| `AGENTS.md` "Working Practices" | amend line 27 (provisional on Q2); keep the rest | F03 |
| `AGENTS.md` "Maintaining These Docs" | keep; a summary list, kept correct | F04 |
| `README.md` "Contributing" | keep; the updated guard's report follows it | F16 |
| `TODO.md` | amend (S1) | F12 |
| `DECISIONS.md` | amend (S2) | F02, F09 |
| `LEARNINGS.md` | keep; its "Validated by" lines are records | F09, F10 |
| `skills/local/entropy-guard-feedback/SKILL.md` | keep | none |

There are no CI workflows (no `.github/`), no hook framework and no pull request template.

## Docs-first checks against this repo's files

Docs-first Step 7.2: each risk in the docs-first matrix, and the check in the updated guard that covers it.

| Matrix risk | Check in `guard/SKILL.md` | Findings |
|---|---|---|
| Parallel truth | "Repairs", one owner per concept; the check on guard-writing instructions | F04, F05 |
| Local-global inversion | none; there are no component notes here | none |
| Superseded material nearby | the supersession check, which names `entropy-assessment`'s former Phase 2 and the sibling repo | F09, F10 |
| Stale references | the cross-reference grep; the skill-handoff check; the frontmatter name-match command | F07, F14 |
| Lost decisions and learnings | the decisions and learnings check, with a date on each decision | F02, F08 |
| State dishonesty | the standing `TODO.md` claims check; the "Doing Now" check | F12 |
| Workflow drift | the workflow check, against `AGENTS.md`, `README.md` "Contributing" and the hook | F16, F18 |
| Brittle automation | only the folder-name invariant is automated; it is stable (`DECISIONS.md` line 81). Checks of wording stay judgment. | none |

## Guard decision and generator inputs

**Guard decision: `update`.** The repo is active, with a repeated loop from session to commit. Its guard covers the
right areas but has F03, F04, F14, F15 and F16.

The generator's inputs:
- **Steward:** Justin Philpott (F01).
- **Documents holding authorised intent:** `INTENT.md`; the scope decisions in `DECISIONS.md` (lines 18 and 26);
  `README.md` "Project status"; `AGENTS.md` "Project Constraints".
- **Decision surface:** `DECISIONS.md`.
- **Open intent questions:** Q1-Q5, all unresolved.
- **Current-state file:** `TODO.md`, refreshed by whoever ends a session (`AGENTS.md` line 22).
- **Rules the repo is bound by but does not own:** the agentskills.io specification (`DECISIONS.md` line 81); seed
  scaffolding feedback (`AGENTS.md` lines 66-68); the issue label convention of the upstream GitHub repo. Whether a
  user-wide instructions file binds this repo is unresolved; none is visible in the snapshot.
- **Verification commands:** none in the repo (`AGENTS.md` lines 49-58), and nothing runs automatically. The guard
  adds one, the folder-name check.
- **Code areas:** none. The analogue is each skill, against `README.md` "What's here", `AGENTS.md` "Key Files" and
  `INTENT.md` "The guard lifecycle".
- **Live state or spend a session can change:** no spend. A session can create GitHub issues on
  `justinphilpott/entropy-guard` through `gh issue create` (feedback helper, lines 44-51).
- **Findings:** F01-F22.

## Generator report

- **Guard:** `guard/SKILL.md`, to go to `skills/local/entropy-guard/SKILL.md`, updated in place.
  - **Name:** kept as `entropy-guard` rather than the template's `session-coherence-guard`, because `DECISIONS.md`
    line 81 requires a skill's `name` to match its folder.
  - **Version:** `metadata.version` is kept, following the repo's convention, and moves from 0.2.3 to 0.3.0.
- **Size: 1,057 words** (`wc -w`), against a budget of 1,068, so 11 under. The budget's terms are:
  - **Common contract:** 706.
  - **Checks:** 8 repo-specific checks × 36 = 288.
  - **Pointers:** 44, the filled-in "Where things live" values, including the "Triggered by" pointer that
    `DECISIONS.md` line 90 requires.
  - **Commands:** 30.
  - **Not in any term:** the filled-in Intent values and the report's fourth line.
- **The eight repo-specific checks, beyond the template's two:**
  1. skill handoffs;
  2. guard-writing ownership;
  3. skill principles and depth;
  4. decisions and learnings;
  5. supersession;
  6. cross-references;
  7. workflow alignment;
  8. "Doing Now" and follow-ups.
- **Dropped from the old guard:**
  - its "When to Run" sections, rationale blocks and "What This Is Not";
  - the mentions of `doc-health-check`;
  - the "System snapshot" and "Integration" metadata. The snapshot waits on Q5; integration became a "Triggered by"
    pointer;
  - the stale-placeholder check, which no finding justifies.

  The other old checks survive, merged.
- **Review before handover:**
  - "Modes and safety" is present.
  - The baseline is bound, falling back to `origin/main`, which is assumed and could not be verified.
  - Patches are sorted: the settled patch was checked against the source passages of Q1-Q5.
  - No repair edits intent to match the work, and "update both" became the one-owner repair.
  - The size is within budget.
- **Operator docs:** `AGENTS.md` lines 19 and 41 already give the guard's path. `README.md` line 78's summary of what
  it checks is updated by the guard-update patch.
- **Validation:**
  - `git diff --check` could not run, because the snapshot has no git. Added lines were checked for trailing
    whitespace instead, and none have it.
  - The folder-name command reported nothing on the target, and reported a deliberately mismatched skill in a test
    copy.
  - The patches were tested as described under "Patches".
- **Open questions the guard leaves visible:** it points at `TODO.md`'s open questions. Its intent rule and its
  missing snapshot wait on Q2 and Q5.
- **Handoff:** to `guards-integrator`, in `integration.md`.

## Uncertainties

- **History:** without git history, none of the following can be checked:
  - the real loop;
  - whether the guard or the hook ever ran;
  - who made each decision;
  - whether the live repository has changed since this snapshot.
- **GitHub issues:** these are part of the current state and were not read.
- **The intent-change rule's home:** the guard names entropy-guard's `skills/entropy-assessment/intent-change-rule.md`
  as its source. That file does not exist in this snapshot. If it is added here later, the guard should point at it
  rather than carry a copy.
- **The upstream branch:** `origin/main` is assumed.
- **The `writing` repo and `distill-article`:** not checked (F20).
