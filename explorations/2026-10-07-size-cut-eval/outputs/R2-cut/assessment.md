# Entropy assessment: entropy-guard at commit 447da9a

- **Target:** a read-only snapshot of the entropy-guard repository at commit 447da9a, with no `.git` directory.
- **Run:** 2026-10-07, by an agent, with entropy-guard skills `entropy-assessment` v0.8.0, `docs-first-planning-assessment`
  v0.3.0, `session-coherence-skill-generator` v0.4.0 and `guards-integrator` v0.4.0.
- **Mode:** a full assessment, then guard generation in plan mode, because the target cannot be edited. Changes to the
  target are delivered as patches in `patches/` and as a replacement guard in `guard/SKILL.md`.
- **Steward:** not present. The questions are in `questions.md`, each with a recommended answer. Work that depends on an
  answer is marked provisional.

## Route taken

1. `entropy-assessment`, Step 1: the intent pass (`intent-pass.md`).
2. `entropy-assessment`, Step 2: lifecycle **active**; shape **A, docs-first planning**.
3. `docs-first-planning-assessment`, Steps 1–7. Its assessment is the assessment; this file adds the intent and
   lifecycle sections.
4. `entropy-assessment`, Step 3: the guard is needed, and it is a refinement of the existing guard.
5. `session-coherence-skill-generator` refined `skills/local/entropy-guard/SKILL.md` in place, following the generator's
   guard contract. The generator report is below.
6. `guards-integrator` wrote `integration.md`.

## Intent

**The steward is Justin Philpott.** No intent document or operator document names him (F1). The identification rests
on these sources:

- his recorded decisions about the project's direction, in `explorations/2026-03-24-entropy-immune-system-conversation.md`:86
  and :713;
- the repository's GitHub owner, given at `skills/local/entropy-guard-feedback/SKILL.md`:10 and `AGENTS.md`:68.

### Authorised intent, by source

The authority column says whether a statement carries the steward's name and a date (both, one of the two, or
neither).

| Statement | Where | Kind | Authority | Date |
|---|---|---|---|---|
| "use this repo as a base and keep it operating within its current structure", while a new project takes the new ideas | conversation 2026-03-24:86 | decision (steward's words) | attributed, dated | 2026-03-24 |
| "let's keep them in explorations, as I want to preserve the entropy-guard project and really farm this new evolution off into its own repo" | conversation 2026-03-24:713 | decision | attributed, dated | 2026-03-24 |
| What he values: suggested changes from an agent with no prior knowledge "merged within a short space of time" | conversation 2026-03-24:86; `explorations/2026-03-19-autopoiesis.md`:22 | description (steward's words) | attributed, dated | 2026-03-19, 2026-03-24 |
| Keep entropy-guard practical; the broader theory goes to the sibling repo `entropy-immune-system`; the next loop tracks merged PRs | `DECISIONS.md`:23-27 | decision | neither | none (written after 2026-03-24) |
| Specialise around docs-first planning; keep `entropy-assessment` as the front door | `DECISIONS.md`:15-19 | decision | neither | none (matches `INTENT.md` revision of 2026-04-07) |
| The remaining 15 entries in `DECISIONS.md` | `DECISIONS.md` | decision | neither | none |
| Purpose, entropy dimensions, guard principles, scope boundary, next validation loop | `INTENT.md` | description and directive | dated only | revised 2026-04-07 |
| "Consult INTENT.md… If a decision refines or challenges the intent, update INTENT.md and note why" | `AGENTS.md`:27; `INTENT.md`:3 | directive | neither | none |

**Precedence used:**

- the steward's recorded words come first;
- `DECISIONS.md` entries come next, as recorded decisions;
- `INTENT.md` and `README.md` follow, as descriptions, although `AGENTS.md`:38 calls `INTENT.md` the north star.

No source contradicts the steward's words.

**The three readings:**

- **Declared** (`README.md`, `INTENT.md`): practical entropy guards, specialised on docs-first planning repos. The next
  phase is an external validation batch.
- **Enacted:** there is no git history to read, so this rests on dated content only. The newest work is
  `session-coherence-skill-generator`, generated 2026-05-10 and updated 2026-05-11, together with the
  `DECISIONS.md` entry for its bootstrap mode. The repo records no validation-batch results. Adding a generator is within
  the authorised scope ("guard generation/refinement", `INTENT.md`:126). So enacted work has not drifted outside scope,
  but the declared next step shows no visible progress (F10).
- **Authorised:** the steward's words and the two decisions in the table above.

### Gaps, by condition

The finding ids refer to the findings list below.

- **Missing:** F1 (the steward is named nowhere); F10 (where validation results are recorded); F4 (no decision
  records why `session-coherence-skill-generator` was added).
- **Ambiguous:** F3 (who may change `INTENT.md`).
- **Conflict:** F4 (two skills that write guards); F10 (the validation measure).
- **Stale description**, corrected from a recorded decision without asking:
  - F6: `DECISIONS.md` entries describing structures that the "Specialize first" decision replaced;
  - F8: `LEARNINGS.md` entries whose implications the steward's 2026-03-24 words set aside for this repo;
  - F9: `explorations/` shown as seed material, per the steward's 2026-03-24 words.
- **Unauthorised drift:** F7 (the bootstrap-verification requirement in `DECISIONS.md`:42 is no longer carried by any
  skill). The work should be fixed; no intent document needs editing.
- **Prose control:** F13 (the guard is described as run before every commit; nothing makes it run).

### Questions for the steward

Full text, readings, divergent cases and recommendations are in `questions.md`.

- **Q1** (F3): who may revise `INTENT.md`?
- **Q2** (F4): which skill writes guards?
- **Q3** (F10): what does the validation batch measure, and where are its results recorded?

### Proposed changes

Each proposal is recorded as a "Proposed" entry, awaiting Justin, at the top of `DECISIONS.md` in
`patches/DECISIONS.md.patch`. None of them is in force. The same patch adds supersession markers for F6, which follow
from the "Specialize first" decision.

## Lifecycle, shape and repositories

- **Lifecycle: active.** The evidence:
  - `README.md`:5 says "actively used, actively refined", and :121 says "Actively evolving";
  - `TODO.md`:11-13 holds open Next Up work;
  - the newest dated content is 2026-05-11 (`skills/session-coherence-skill-generator/SKILL.md`:6).
- **Shape: A, docs-first planning,** with workflow-heavy (D) traits. The evidence for A:
  - there are 17 Markdown files and one 9-line shell hook, and no application code (`AGENTS.md`:31, :51);
  - `DECISIONS.md`, `TODO.md` and `AGENTS.md` carry the repo's state;
  - work happens in repeated human and agent sessions (`AGENTS.md`:3, :22; transcripts with two agent tools).

  D also fits, because the workflow is part of the product (`DECISIONS.md`:57; the local guard's check 4). A was taken
  as the riskiest: the top risks (F4, F6, F9) are documents drifting from each other inside the product and its logs.
  The workflow risks (F13, F14) are cheaper to repair.
- **Repositories: one.** Three neighbouring surfaces were not assessed:
  - the sibling repo `entropy-immune-system` and the `writing` repo are separate systems with their own purpose
    (`DECISIONS.md`:23-27, :139-143);
  - the GitHub issue tracker is an outside state surface that holds part of the work (F12). It was not read.
- **Planning horizon:**
  - **settled:** the docs-first specialisation, the front door, the integrator as a separate skill, `skills/` versus
    `skills/local/`, the agentskills.io format, one local guard, a reminder before deeper automation, and moving the
    explorations out;
  - **active:** the validation batch and the newest generator;
  - **exploratory:** the guard runner and the guard evaluator, a code-first track, and just-in-time (JIT) guards, which
    moved to the sibling repo.

## Truth map

| Concept | Canonical home | Also stated in | State |
|---|---|---|---|
| Purpose and scope boundary | `INTENT.md` | `README.md` "Project status", `AGENTS.md` "Project Constraints" (summaries) | consistent; validation measure conflicts with `DECISIONS.md`:26 (F10) |
| Entropy model, guard principles, four lifecycle tools | `INTENT.md` | `README.md`:68-74 (links) | `INTENT.md`:65 vs :80 disagree on whether every guard is a skill file (F16) |
| How guards are written | **two homes**: `docs-first-planning-assessment` Phase 2 and `session-coherence-skill-generator` | `README.md`:52, `INTENT.md`:88 name only the first | parallel truth (F4) |
| Skill set and routing | the skills (product artifacts) | `README.md` "What's here", `AGENTS.md` "Key Files" | the router never reaches the generator (F4); `guards-integrator`:20 is stale (F17) |
| Decisions | `DECISIONS.md` | — | undated, unattributed, partly unordered (F2); stale entries unmarked (F6) |
| Learnings | `LEARNINGS.md` | — | stale step references and conversation-only entries (F8) |
| Contributor workflow | `AGENTS.md` "Working Practices" | `README.md` "Contributing", `.githooks/pre-commit`, local guard check 4 | consistent; seed residue (F15); the claim that the guard always runs (F13) |
| Current state | `TODO.md` | — | no current-state section (F11); issues are tracked elsewhere (F12) |
| The repo's own guard | `skills/local/entropy-guard/SKILL.md` | `README.md`:78-79, :97; `AGENTS.md`:19, :41 | stale references (F14) |
| Historical theory | `explorations/` (4 files) | `PHILOSOPHY.md`, `LEARNINGS.md`:117-143 | not listed or marked as historical (F9) |

## Loop map

The real loop, as far as the snapshot shows:

- **Session start:** an agent loads `AGENTS.md`, if its tool does so. That has not been verified per tool. It then reads
  the Quick Links. `TODO.md` "Doing Now" is `[empty]`, and there is no current-state section.
- **Tracking:** "Doing Now" is written before the work and cleared at the end (`AGENTS.md`:22; hook line 6). GitHub
  issues carry the feedback and issue clusters (`DECISIONS.md`:17), and `TODO.md` does not link them.
- **Capture:** decisions and learnings are recorded during the work and at guard checks 1 and 2.
- **Pause:** the local guard runs before commit (`AGENTS.md`:19). It is prompted by `.githooks/pre-commit`, which each
  clone must enable for itself (`README.md`:140).
- **Handoff:** a commit carrying an "entropy check" note (`README.md`:138), then a pull request (`LEARNINGS.md`:152
  cites PR review). There is no CI.
- **Not checkable:** with no git history, the snapshot cannot show whether the guard is actually run, or whether commit
  messages carry the note.

## Findings

Each finding has an id, its evidence and the risk it represents.

- **F1. The steward is named nowhere.** `README.md`, `INTENT.md` and `AGENTS.md` name no owner, and `LICENSE`:3 reads
  "Copyright (c) 2026 entropy-guard". He is identified only from the transcripts and the GitHub owner (see Intent).
  Risk: missing intent.
- **F2. `DECISIONS.md` cannot establish which decision came later.** Every entry has no date and no author. The order is
  not chronological: "Two-layer" (:103) is superseded by "Consolidate" (:129), which sits below it. This assessment had
  to date entries from `INTENT.md`:5, skill metadata and the transcripts. Risk: intent and state.
- **F3. Who may change intent is ambiguous.** `INTENT.md`:3 and `AGENTS.md`:27 let any contributor, agents included,
  revise `INTENT.md` with a dated note. The 2026-04-07 revision (`INTENT.md`:5) has no author. See Q1. Risk: intent.
- **F4. Two skills write guards, with no decision on how they relate.** The evidence:
  - `docs-first-planning-assessment`:132-202 writes a "delta guard" wherever the repo keeps its guard;
  - `session-coherence-skill-generator`:198-315 writes a "session-coherence guard" at
    `skills/session-coherence-guard/SKILL.md`, with modes, mechanical commands and operational-state checks;
  - `entropy-assessment` (v0.6.0 in the target) never routes to the generator, and `INTENT.md`:88 and
    `README.md`:21-66 omit it;
  - no decision records the generator's arrival: `DECISIONS.md`:9 calls it "the previous
    `session-coherence-skill-generator`".

  See Q2. Risk: parallel truth in the product.
- **F5. `session-coherence-skill-generator` still carries text from another project.** The evidence:
  - it mentions "FlowBook" at :22 and :193;
  - it speaks of "coding session" and "codebase" (:19-20);
  - its metadata uses `generated`, `last_updated`, `skill_version` and `system_snapshot`, where the other five skills
    use `metadata.version`;
  - it has no upstream feedback check, which `DECISIONS.md`:66 gives the main exported skills.

  Risk: standalone residue.
- **F6. `DECISIONS.md` describes structures that no longer exist, without saying so.** These entries describe an
  `entropy-assessment` Phase 2, appendices or Steps 5–8: :39-43, :47-51, :95-99 and :113-117. The target's
  `entropy-assessment` v0.6.0 has none of these. Only :129-135 carries a supersession marker. Fixed in
  `patches/DECISIONS.md.patch`. Risk: superseded material nearby.
- **F7. Decided knowledge was lost from the skills.** Two things are missing:
  - **Bootstrap verification.** `DECISIONS.md`:42 requires bootstrap actions to be "verified against the current
    artifact before they are written" (also `LEARNINGS.md`:27-33). No target skill says this: a search of `skills/` for
    "verif" finds only unrelated hits.
  - **Domain appendices.** The appendices for code, tests, API and workflow (`DECISIONS.md`:50, :134-135, "All domain
    knowledge preserved") are in no file. The "Specialize first" decision covers moving deep guidance out of
    `entropy-assessment`, but not where it went. Without git, it could not be checked whether history keeps them.

  Risk: lost knowledge, and unauthorised drift for bootstrap verification.
- **F8. `LEARNINGS.md` has stale references and entries validated only by conversation.** The evidence:
  - :33, :52, :93 and :112 cite steps and phases that no longer exist;
  - :63 cites a "distill-article skill" that is not in this repo (perhaps in the `writing` repo; not checked);
  - :117-143 hold three entries "Validated by" the 2026-03-19 conversation alone. Their implications contradict
    `INTENT.md`:80 and the steward's later decision to keep this repo in its current structure (2026-03-24:86, :713).
    One of them (:123) says the mature form has "no persistent guard artifact".

  `LEARNINGS.md`:3 asks for "what you validated". Risk: superseded material nearby, and knowledge.
- **F9. The `explorations/` folder is unlisted and unmarked.** It holds 4 files and 17,387 of the repo's 36,418 words
  (48%). It is not listed in `README.md` "What's here" or in `AGENTS.md` "Key Files", and nothing marks it as seed
  material for `entropy-immune-system`. The steward's own framing (2026-03-24:713) treats it as material to farm
  out, and the agent's closing note in the same transcript calls it seed material for the future repo. `DECISIONS.md`:26 says the sibling repo was seeded with these documents, so
  two copies may exist; the sibling was not checked. Risk: superseded material nearby.
- **F10. The validation measure is in conflict, and results have no home.** The two sources:
  - `DECISIONS.md`:26 says "a larger set of open source projects… more merged PRs";
  - `INTENT.md`:129-135, `README.md`:125 and `TODO.md`:11-13 say docs-first planning repos, measured by session
    recovery, stale ideas and coherence.

  No place is named for per-run results, and none are recorded. See Q3. Risk: conflict and state.
- **F11. The repo lacks the session-start packet it prescribes for others.** `INTENT.md`:73, `LEARNINGS.md`:7-13 and
  `README.md`:40 prescribe one, and `INTENT.md`:118 requires the project to apply its own methods. `TODO.md` holds only
  task lists. Fixed in `patches/TODO.md.patch`. Risk: state dishonesty.
- **F12. Work is tracked in two places.** `TODO.md` and the GitHub issues (`DECISIONS.md`:17 "#9-#12"; the
  feedback helper's `agent-feedback` label) both hold work, and `TODO.md` links no issue. `TODO.md`:3 still talks of
  graduating to an issue tracker later. Risk: parallel truth in state.
- **F13. The guard is described as always run, and nothing makes it run.** `README.md`:79 says "runs its own entropy
  guard before every commit", and `AGENTS.md`:19 calls running it "non-negotiable". The only mechanism is
  `.githooks/pre-commit`. It is non-blocking by decision (`DECISIONS.md`:31-35), and a fresh clone does not run it until
  someone enables it (verified in a scratch copy, see `integration.md`). Enforcement would sit in a commit-message check
  for the "entropy check" note (`README.md`:138). Nothing cites the rule as a safety control. Risk: prose control.
- **F14. The local guard is stale.** The evidence:
  - :99 cites a "README.md (Key Documents table)", which does not exist;
  - :92 says "20+ markdown files", where there are 17;
  - :33 and :137 cite `doc-health-check`, which does not exist (tracked in `TODO.md`:20);
  - it was last evaluated on 2026-04-07, before the generator was added, yet calls itself an example of what "the guard
    generators" produce (:3; `README.md`:97);
  - at 1,400 words it is above the generator's size budget.

  Replaced by `guard/SKILL.md`. Risk: workflow drift and stale references.
- **F15. Scaffolding from the seed template remains.** `AGENTS.md`:21 says "Working code with tests beats perfect code",
  in a repo with no code and no tests (:51, :57). `.gitignore`:17-25 has a Go section, and `.editorconfig` has py, go
  and Makefile sections. Risk: frayed edges, low.
- **F16. `INTENT.md` disagrees with itself in small ways.** :65 says guards are "not always a skill file", while :80
  says "Each guard is a skill file". `INTENT.md`:84-96 has "four distinct tools", while `LEARNINGS.md`:127-133 and
  `PHILOSOPHY.md` have a different set of "four components". Risk: consistency, low. A fix would edit an intent
  document, so it is a proposal only.
- **F17. `guards-integrator` describes the old routing.** :20 says to run it "After `entropy-assessment` generates one
  or more guards", but `entropy-assessment` no longer generates guards. Risk: stale reference.

## Ranked risks

Ranked by decay rate times recovery cost.

1. **Two guard-writing paths (F4, F5, F17).** Decay: medium, since every edit to either skill widens the gap. Recovery:
   high, because the product's core output differs depending on which route a user takes. Symptoms: two output
   locations, two vocabularies, and a router that skips one skill. Anchor: a decision in `DECISIONS.md` (Q2).
2. **Stale and lost decisions (F6, F7, F2).** Decay: a step change at each restructure; the skills have been
   restructured at least four times. Recovery: high without git, because only archaeology recovers it. Symptoms: a
   fresh reader believes `entropy-assessment` has Phase 2 and appendices, and bootstrap verification has quietly gone.
   Anchor: `DECISIONS.md` supersession markers, and `docs-first-planning-assessment` Step 5.
3. **Superseded theory nearby (F9, F8).** Decay: slow. Recovery: medium. Symptoms: 48% of the repo's words sit
   unmarked, and the validated-learnings log advises against persistent guards. Anchor: the steward's 2026-03-24
   decision and `DECISIONS.md` "Farm…".
4. **State dishonesty (F11, F12, F10).** Decay: fast. Recovery: low. Symptoms: no orientation for a fresh session,
   issues not linked, and a next phase with no measure and no record. Anchor: `TODO.md`.
5. **Workflow claims and a stale guard (F13, F14, F15).** Decay: medium. Recovery: low. Anchor: the local guard and
   `AGENTS.md`.

## Guard surfaces, by whether they execute

- **Runs by itself:** none observable. There is no CI, and no enabled hook can be seen.
- **Runs only by hand:**
  - `skills/local/entropy-guard/SKILL.md` (amend: replaced by `guard/SKILL.md`);
  - `skills/local/entropy-guard-feedback/SKILL.md` (keep), which writes GitHub issues;
  - `AGENTS.md` Working Practices, as standing instructions (amend only through Q1);
  - running the exported skills on this repo (`INTENT.md`:82).
- **Decided, not built:**
  - the guard runner (`INTENT.md`:92, `DECISIONS.md`:91, tracked at `TODO.md`:18);
  - the guard evaluator (`INTENT.md`:94, not tracked).
  - A link checker in CI was suggested (the local guard, :110) but not decided.
- **Declared, but missing:**
  - `doc-health-check` (tracked at `TODO.md`:20);
  - the "distill-article skill" (`LEARNINGS.md`:63).
- **Unknown:** whether `.githooks/pre-commit` is enabled in any clone. It is tracked and executable in the snapshot,
  and fires once enabled (see `integration.md`). Also unknown: whether commit messages carry the "entropy check" note.

## Recommendations

- **Consolidate:** one skill should write guards (Q2), and the router should reach it.
- **Fix the work:** restore "verify each bootstrap or cleanup action against the current file" in
  `docs-first-planning-assessment` (F7). `DECISIONS.md`:42 already decides it.
- **Mark as historical:** `explorations/`, by listing it in `README.md` "What's here" as seed material for
  `entropy-immune-system`; and `LEARNINGS.md`:117-143, as exploratory and continued in the sibling repo (F8, F9).
- **Demote:** remove the `README.md`:79 claim that the guard runs before every commit, or make it honest: "is run
  before commit, prompted by an opt-in reminder hook" (F13).

## One-time cleanup

Each item was checked against the current file on 2026-10-07. Track progress in `TODO.md`, not in the guard.

1. Apply `patches/TODO.md.patch` (F11) and `patches/DECISIONS.md.patch` (F6, plus the proposals for Q1–Q3).
2. Replace `skills/local/entropy-guard/SKILL.md` with `guard/SKILL.md` (F14). Its Intent section is provisional until
   Q1 is answered.
3. Add the steward's name to `AGENTS.md` (F1). This records a fact; it is not an intent change.
4. Mark `LEARNINGS.md` at :117, :127 and :137 "Exploratory: continued in `entropy-immune-system`". At :33, :93 and
   :112, mark the step references as historical (F8).
5. List `explorations/` in `README.md` "What's here" as historical seed material (F9).
6. Fix `skills/guards-integrator/SKILL.md`:20 (F17). The right wording depends on Q2.
7. Remove "FlowBook" from `session-coherence-skill-generator` at :22 and :193 (F5).
8. Change `AGENTS.md`:21 to drop "code with tests" (F15). Lowest priority.
9. Once the new guard is installed, the parenthetical at `TODO.md`:20 ("referenced in local/entropy-guard/SKILL.md") is
   stale. Re-word it, or decide whether `doc-health-check` is still wanted.

## State-file update

`patches/TODO.md.patch` adds a "Current state" section to the existing `TODO.md`, the file a fresh session reads after
`AGENTS.md`. Every claim in it is dated 2026-10-07. The section says what makes it stale and who refreshes it. It leaves
Q1–Q3 open.

## Supplying the generator

The docs-first risk matrix, written against this repo's files and mapped to the checks in `guard/SKILL.md`:

| Matrix risk | Guard check |
|---|---|
| Parallel truth | 1 (skill contract and its dependents), 3 (which of the two guard writers owns a change) |
| Local-global inversion | not applicable: this repo has no component notes |
| Superseded material nearby | 4 (supersession markers; check before recreating anything); historical pointer under "Where things live" |
| Stale references | 9 (structure, counts and paths), the `grep` for old names, and check 2 (name and folder agree) |
| Lost decisions and learnings | 5, 6 |
| State dishonesty | 7, 10 (issues linked) |
| Workflow drift | 8 |
| Brittle automation | only stable invariants are scripted: the name/folder rule and a search for old names. "Doing Now cleared" stays a judgment check, because it depends on the `[empty]` wording |

## Generator report

Run by `session-coherence-skill-generator` v0.4.0, in plan mode (the target is read-only).

- **Inputs supplied:**
  - the steward, Justin Philpott (F1);
  - the intent document `INTENT.md` and the decision surface `DECISIONS.md`;
  - open questions Q1–Q3;
  - the state file `TODO.md` "Current state", refreshed by whoever runs the guard at session end;
  - rules owned elsewhere: the agentskills.io specification, and the feedback helper's issue rules;
  - verification commands: none exist, and none run by themselves;
  - code: none beyond the hook, which `README.md` and `AGENTS.md` describe;
  - live state a session can change: GitHub issues filed through the feedback helper.

  No user-wide instructions file is referenced from the target. Whether one binds contributors could not be checked.
- **Guard:** it updates `skills/local/entropy-guard/SKILL.md` in place, delivered as `guard/SKILL.md`. The name stays
  `entropy-guard`, because the agentskills.io format (`DECISIONS.md`:79-83) requires the name to match the folder.
- **Intent-change rule:** copied, version 2, with the steward, the intent documents and the decision surface filled in.
  The target has no `skills/entropy-assessment/intent-change-rule.md` to point to, so the rule is copied rather than
  linked.
- **Size:** 939 words, with J = 10 checks.
  - **Budget:** 450 + 36 × 10 + S 77 (source pointers) + C 54 (commands) = 941 words.
  - **Within budget.** The checks average 33 words each.
  - 49 of the words are the provisional note for Q1, which is deleted once Q1 is answered.
  - The old guard was 1,400 words with 9 checks.
- **Review before handover:**
  - The patches leave Q1–Q3 open: every proposal is marked "Proposed… not in force".
  - The guard's Intent section is marked provisional for Q1.
  - Check 3 makes nobody choose an owner between the two guard writers for good; Q2 still does that.
  - Check 5 asks that each new decision say who decided. This is a new convention for the log, which follows from F2 and
    the intent-change rule. Justin may reject it.
  - Repair instructions were checked against authorised intent.
- **Validation run:**
  - `git diff --no-index --check` on both patched files found no whitespace errors;
  - both patches dry-run apply cleanly to the snapshot;
  - the name check passes on all six `SKILL.md` files in the target (run with `find`, since there is no git), and
    reports a planted mismatch in a scratch repo;
  - `lychee`, `agnix`, `ctxlint` and `ast-grep` are not installed on the machine used for this run, so the guard does
    not depend on them.
- **Doc references added:** none needed. `AGENTS.md`:19, :41, `README.md`:78-79, :137 and the hook already name the
  guard's path, which is unchanged.
- **Generator step 1** (record the work in the state file) could not be done in a read-only target. Under the target's
  own practice (`AGENTS.md`:22), "Doing Now" would be cleared again before the commit in any case.
- **Handoff:** to `guards-integrator`, in `integration.md`.

## Uncertainties and what was not covered

- **No git history.** Commits, the enacted intent, whether the guard runs, hook enablement, whether the appendices
  survive in history, and the order of the decisions could not be read.
- **Outside sources not read:** the GitHub issues (#9–#12 and `agent-feedback`), the sibling `entropy-immune-system`
  repo, and the `writing` repo.
- **Explorations only partly read.** Front matter, headings and every message from Justin were read. The agent replies
  in the two long transcripts were not read in full.
- **Which agent tools load `AGENTS.md` automatically** was not checked. The transcripts show two tools in use: Claude
  Sonnet 4.6 and OpenCode with gpt-5.4.
- **The default branch is assumed to be `origin/main`** for the guard's fallback baseline.

## Next step

Answer Q2 first, because the validation batch exercises the guard-writing path, then Q1 so that the guard can be
installed. Apply the two patches and cleanup items 3–5 now: they do not depend on any answer. Then follow
`integration.md` "Now".
