# Entropy assessment: entropy-guard (snapshot 447da9a)

- **Target**: `targets/entropy-guard-447da9a`, a read-only copy of the entropy-guard repository with no `.git` directory.
- **Assessed**: 2026-10-04.
- **Route taken**: `skills/entropy-assessment/SKILL.md` v0.6.0 (Steps 1-3: classify and route) to `skills/docs-first-planning-assessment/SKILL.md` v0.1.0 (Phase 1 assessment and Phase 2 guard refinement) to `skills/guards-integrator/SKILL.md` v0.2.2 (integration brief).
- **Not observable in this snapshot**: commit history, commit messages, whether the pre-commit hook is enabled, how often the local guard is actually run, and the state of GitHub issues and pull requests. The loop map below is therefore built from the documents plus the indirect evidence they cite.

Companion files in this folder:

- `canonical-truth-map.md`: which document owns which truth.
- `current-state-packet.md`: the short orientation note for the next fresh session.
- `guard/SKILL.md`: the refined local guard, a drop-in replacement for `skills/local/entropy-guard/SKILL.md`.
- `integration.md`: the guards-integrator brief.
- `questions.md`: the questions for the steward, each with a recommended answer.
- `feedback.md`: upstream feedback on the entropy-guard skills used in this run.

---

## 1. Front door (entropy-assessment)

### Intent summary

entropy-guard is a markdown-only repository that exports agent skills for keeping iterated, AI-assisted systems coherent. The skills assess a system, generate or refine a lightweight "entropy guard" for it, and fit that guard into the system's real handoff loop. `INTENT.md` is the declared north star. The repository deliberately applies its own method to itself through a local guard. Broader theory was moved to a sibling repository, `entropy-immune-system`. The stated next phase is to validate the skills on a larger batch of external docs-first planning repositories.

Intent is clear and discoverable: `README.md`, `INTENT.md` and `AGENTS.md` agree on it. This is not an intent-missing finding.

### System shape classification

**A. Docs-first planning**, with a secondary fit to **D. Workflow-heavy**.

The skill picks A when most of its five conditions hold. Here is how each one applies to the target:

- **Markdown-first or documentation-as-system**: holds. `AGENTS.md` says "Keep the repo markdown-first", and there is no code.
- **Planning or design docs are the primary artifact**: holds only in part. The primary artifact is a set of exported method documents (the skills) together with `INTENT.md`. These are the product, not a plan for some other system.
- **TODO, decision log or agent instructions carry meaningful state**: holds. `DECISIONS.md` has 17 entries, `LEARNINGS.md` has 15 entries, and `AGENTS.md` and `TODO.md` are both active.
- **Main loop is repeated human and AI sessions**: holds. The contributors include Justin, Claude Sonnet 4.6 and OpenCode (gpt-5.4).
- **Likely drift is docs-to-docs, workflow or stale state**: holds. See the entropy profile below.

D also fits, because `DECISIONS.md` ("Keep a single local guard…") says the workflow is part of the product. The skill says to choose the shape with the highest current risk. The top risks found below are docs-to-docs (two overlapping skills, a decision log that disagrees with the skills, and theory sitting beside practice), so the shape chosen is A.

### Route

Step 3 sends shape A to `skills/docs-first-planning-assessment/SKILL.md`, and the rest of this assessment follows that skill. `skills/session-coherence-skill-generator/SKILL.md` is not on the route, because no step of the front door points to it. That gap is itself finding 1 below.

---

## 2. Phase 1: assessment (docs-first-planning-assessment)

### Intent and planning horizon

The intent is as stated above. The planning horizon falls into three groups.

**Settled.** These choices are recorded in `DECISIONS.md` and are not to be reopened casually:

- `entropy-assessment` is the single front door and acts as a router.
- `docs-first-planning-assessment` is the deepest specialised path.
- `guards-integrator` is a separate skill that runs at adoption time.
- Exportable skills live in `skills/`, and skills for this repository's own use live in `skills/local/`.
- Every skill uses the agentskills.io format: a `SKILL.md` file with frontmatter.
- The repository keeps one combined local guard rather than separate guards.
- Guards normally mature from External to Prompted before any deeper automation.
- The project invests in skills that create guards, not in a library of finished guards.
- `LEARNINGS.md` holds tactical learnings only.
- Broader theory lives in the sibling repository `entropy-immune-system`.

**Active.** Two pieces of work are open:

- The external validation batch on docs-first planning repositories. It is listed in `TODO.md` "Next Up" and has not started: "Doing Now" is `[empty]` and no results are recorded anywhere.
- The bootstrap mode recently added to `session-coherence-skill-generator`. This is the newest entry in `DECISIONS.md`.

**Exploratory or deferred.** None of these exists yet:

- the guard runner;
- the guard evaluator;
- specialised tracks for code-first and other repository shapes;
- the `doc-health-check` skill;
- "just-in-time" guard generation with no persistent guard file. This is theory, and it is owned by the sibling repository.

### Canonical truth map

The full map is in `canonical-truth-map.md`. It found two problems:

- **One concept has two homes.** "Generate a session-end guard" is owned by both `docs-first-planning-assessment` Phase 2 and `session-coherence-skill-generator`, and neither of them knows about the other.
- **Theory has four locations and no stated owner.** It sits in `PHILOSOPHY.md`, in `explorations/`, in three entries of `LEARNINGS.md`, and in the sibling repository. No document says which of these is canonical.

### Loop map (real, as far as the snapshot shows)

- **Fresh session starts** from `AGENTS.md`, the standing agent instructions. Its Quick Links list `README.md`, `INTENT.md`, `PHILOSOPHY.md`, `TODO.md`, `DECISIONS.md`, `LEARNINGS.md` and `skills/`, all with equal apparent status. There is no short "trust these first" orientation note.
- **Active work is tracked** in the "Doing Now" section of `TODO.md`, written before work starts and cleared at the end (`AGENTS.md` Working Practices).
- **Decisions and learnings are captured** at session end, through checks 1 and 2 of the local guard.
- **The coherence pause** is the local guard `skills/local/entropy-guard/SKILL.md`, run before committing. It is nudged by `.githooks/pre-commit`, a non-blocking reminder that has to be enabled by hand with a symlink (`README.md` line 140).
- **The handoff** is a local commit. Sometimes a pull request follows: `LEARNINGS.md` line 152 cites review feedback on the guards-integrator pull request.
- **Upstream feedback** goes into GitHub issues through `skills/local/entropy-guard-feedback/`. Issues #9-#12 drove the docs-first specialisation (`DECISIONS.md` line 17).
- **Re-evaluation** happens ad hoc, by running `entropy-assessment` against this repository again (dogfooding). The local guard's last evaluation is dated 2026-04-07.
- **Automated gates**: none. There is no CI, no scripts and no tests.

### Entropy profile (ranked by destructive potential)

**1. Parallel truth: two guard generators with no stated relationship, and a front door that routes to only one of them.**

Current symptoms:

- **The two skills cover the same ground.** `session-coherence-skill-generator` writes a session-end handoff guard, by default `skills/session-coherence-guard/SKILL.md`, that checks TODO state, decisions, learnings and workflow docs. `docs-first-planning-assessment` Step 7 produces "one combined docs + workflow guard run at session end or before commit" over the same areas.
- **Nothing connects them.** Neither skill mentions the other. `entropy-assessment` Step 3 routes no shape to the session-coherence generator. `INTENT.md` line 88 gives the generator role only to `entropy-assessment` and `docs-first-planning-assessment`.
- **`guards-integrator` still describes the old structure.** Line 20 says "After `entropy-assessment` generates one or more guards", and line 227 says to use `entropy-assessment` "to decide what guards are needed". entropy-assessment stopped generating guards when it became a router.
- **The session-coherence generator looks imported.** It names another project, FlowBook, at lines 22 and 193. It uses a different metadata schema (`generated`, `last_updated`, `skill_version`, `system_snapshot`) from the other five skills, which use `metadata.version`. It also lacks the upstream feedback check that the other three exportable skills carry under the decision "Upstream feedback should be embedded…".
- **No decision records why it exists.** `DECISIONS.md` records only its bootstrap mode, not why it was added or how it relates to the docs-first path.

Rating and fix:

- **Decay rate**: medium. Every edit to either generator widens the gap, and the validation batch will send repository after repository through the front door.
- **Recovery cost**: high. Users outside the project either get two overlapping guards or pick one at random. Cleaning up later means reconciling guards already placed in other repositories.
- **Canonical anchor for the fix**: the section "The guard lifecycle: four distinct tools" in `INTENT.md`, together with Step 3 of `entropy-assessment`, plus a new `DECISIONS.md` entry that records the relationship.

**2. The decision log no longer matches the skills it governs.** It has drifted in both directions: entries describe structure that has gone, and a decided behaviour has vanished from the skills.

Entries that describe structure since replaced. `DECISIONS.md` has 17 entries. Only 2 carry supersession markers (lines 105 and 131). Five more describe structure that the "Specialize first…" decision replaced, and they carry no marker:

- **"Rename entry point…" (line 113)** describes entropy-assessment as having "two explicit phases… Phase 2 (Guard Generation, Steps 5–8)". entropy-assessment is now a router with no Phase 2.
- **"Entropy assessment should support guard refinement…" (line 39)** names `skills/entropy-assessment/SKILL.md` in its Impact. That behaviour now lives in `docs-first-planning-assessment` Step 6.
- **"Add workflow/process as a first-class assessment domain" (line 47)** says to "add a dedicated appendix". No skill has an appendix now: a search for "appendi" in `skills/` finds nothing. The domain itself survives as item 4a and shape D of entropy-assessment.
- **"Guard generation should produce immediate integration advice" (line 95)** says to "strengthen `skills/entropy-assessment/`". That advice now sits in Step 8 and the Output section of `docs-first-planning-assessment`.
- **"Farm broader…" (line 23)** sets the validation loop as "a larger set of open source projects… track whether that produces more merged PRs". `INTENT.md` lines 122-135 and the "Project status" section of `README.md` now say docs-first planning repositories, judged by clearer session recovery and fewer stale ideas being brought back.

There are two smaller problems in the log. Line 134 claims to supersede "Exportable skills vs local skills" (line 71), but that entry has no marker and still holds. And no entry has a date, so position in the file is the only signal of which entry came later.

Decided behaviour that vanished. The entry at line 39 requires "bootstrap actions to be verified against the current artifact before they are written". `LEARNINGS.md` "Bootstrap checks need direct evidence…" (line 27) records the failure that prompted it. The current `docs-first-planning-assessment` Step 5 lists "Bootstrap actions" with no verification requirement: a search for "verif" in that skill finds nothing. A fix that had been validated was dropped in the rewrite, and nothing recorded the loss.

Rating and fix:

- **Decay rate**: slow for any one entry, but each restructure of a skill strands several entries at once.
- **Recovery cost**: high. A fresh agent reading line 113 could reasonably try to restore a Phase 2 to entropy-assessment. The dropped verification step brings back a failure that was "only caught in self-review", just as the validation batch is about to write bootstrap actions for other repositories.
- **Canonical anchor for the fix**: supersession markers and dates in `DECISIONS.md`, and restoring the verification requirement to Step 5 of `docs-first-planning-assessment`.

**3. State entropy for the next phase: validation evidence has no home.**

Current symptoms:

- **Three documents name the next phase**: `TODO.md` lines 11-13, `INTENT.md` lines 122-135 and `README.md` line 125 all describe an external validation batch that will "track what changes prove useful".
- **No place exists to record its results.** No file, section or convention says where the results of each assessed repository should go. GitHub issues hold feedback about the skills, not validation results.

Rating and fix:

- **Decay rate**: nothing yet, but fast once the batch starts, because results will land in chat transcripts and commit messages.
- **Recovery cost**: high. This evidence is what the next refinement of the skills depends on, and once a transcript is gone it cannot be rebuilt.
- **Canonical anchor for the fix**: there is none yet. See question Q5.

**4. Residue from the scope split: theory still sits next to live practical truth.**

Current symptoms:

- **`explorations/` is unlabelled.** It holds 4 documents, 1,467 of the repository's 3,442 markdown lines (about 43%). By the decision at line 23, the theory moved to `entropy-immune-system`, "seeded with the exploration documents". The folder is not listed in the "What's here" section of `README.md` or in the Key Files section of `AGENTS.md`. Two of the four documents are `status: draft`. Nothing says whether these are canonical or historical copies.
- **Three `LEARNINGS.md` entries are theory.** The entries at lines 117, 127 and 137 (just-in-time generation, the four-component hierarchy, and guards working at the wrong layer) are validated only by "the 2026-03-19 philosophical conversation". They restate `PHILOSOPHY.md` lines 73-116, which is parallel truth, and they contradict the decision "LEARNINGS.md stays tactical" (line 139). The just-in-time entry says "the mature form collapses assess → fix with no persistent guard artifact", while every generator in this repository writes a persistent `SKILL.md`.
- **The "Step 0" learning (lines 87-93) stands on deleted skills.** It is validated by "all four domain generators", which were deleted by the decision at line 129. Its implication, to port Step 0 into the entry point, has been neither done nor closed.
- **One learning names a skill that is not here.** `LEARNINGS.md` line 63 says "Led to the distill-article skill", and no such skill exists in this repository. The decision at line 142 puts article work in a separate repository called `writing`.

Rating and fix:

- **Decay rate**: slow, because these documents do not change.
- **Recovery cost**: medium. The danger is that old ideas get picked up again. An agent searching "guard generation" lands on the just-in-time entry and steers the practical skills toward the no-artifact model that the scope split had deferred.
- **Canonical anchor for the fix**: the decision "Farm broader…" makes the sibling repository the home for theory. `PHILOSOPHY.md` stays the home for fragments.

**5. Workflow and practice: the reference example does not apply its own current method, and its guard has gone stale.**

Current symptoms:

- **There is no current-state packet.** The local guard says it was generated by the docs-first assessment (line 14), and that skill makes a packet a required output. `LEARNINGS.md` lines 7-13 say orientation at session start matters as much as guarding at session end.
- **The guard was last evaluated before the newest skill arrived.** It says "Last evaluated: 2026-04-07" (line 21). The session-coherence generator was generated on 2026-05-10 and later gained bootstrap mode. Guard check 3 asks only whether a changed skill still reflects `INTENT.md`, not where the skill sits in the router or the lifecycle. That is how finding 1 got through.
- **The guard has stale references.** Four of them:
  - Line 99 points to "README.md (Key Documents table)", but the README actually has "What's here" tables (line 82).
  - Line 92 claims "20+ markdown files", but there are 17.
  - Line 33 says to "use doc-health-check", a skill that does not exist (`TODO.md` line 20 tracks it as backlog).
  - Line 14 says the guard was generated by the docs-first assessment, while line 19 says "Generated: 2026-03-19, via entropy-assessment v0.4.0", which predates the docs-first skill.
- **The reminder hook is opt-in.** Whether it is enabled cannot be seen in this snapshot.

Rating and fix:

- **Decay rate**: fast.
- **Recovery cost**: low, if the stale item is caught within a session.
- **Canonical anchor for the fix**: `skills/local/entropy-guard/SKILL.md` and `AGENTS.md`.

Low-priority residue, not ranked: the project scaffolding left Go entries in `.gitignore` and Python, Go and Makefile sections in `.editorconfig`, and `AGENTS.md` still says "Working code with tests beats perfect code" and asks contributors to check that docs agree "with the code" in a repository with no code. These mislead a little and cost nothing to leave for now.

### Recommendations

What to consolidate:

- **Session-end guard generation.** Record one decision on how `docs-first-planning-assessment` Phase 2 and `session-coherence-skill-generator` divide the work (Q1), then make the router, `INTENT.md`'s lifecycle section and `guards-integrator` say the same thing.
- **The three theory entries in `LEARNINGS.md`.** Delete them from `LEARNINGS.md`. `PHILOSOPHY.md` lines 73-116 already hold the same content (Q3).

What to demote or mark as historical:

- **`explorations/`.** Give each of its 4 documents a status line saying it is a historical seed copy, and name the sibling repository as the canonical home (Q2). List the folder as historical in `README.md` and `AGENTS.md`.
- **The 5 `DECISIONS.md` entries listed in finding 2.** Mark each one partially superseded, naming which part and what replaced it.
- **The FlowBook references** in `session-coherence-skill-generator`. Remove them, or explain where the skill came from.

What to restore:

- **Bootstrap-action verification in `docs-first-planning-assessment` Step 5 (Q7).** It is decided and validated but missing from the skill.

What to guard:

- **The local guard.** Refine it (see Phase 2). The main additions check where a skill sits in the router and lifecycle, check whether a rewrite kept behaviour that was decided, mark superseded decisions, and keep the current-state packet up to date.
- **The current-state packet.** Add it as `CURRENT_STATE.md` (Q6).

### Bootstrap actions

These are one-time pieces of work that should be done before the refined guard runs as a routine. On 2026-10-04 each target named below was checked against the snapshot and confirmed to exist in the state described. Record their completion in `TODO.md` "Next Up", not in the guard file. The text below is ready to paste:

```md
- [ ] B1 Decide how session-coherence-skill-generator relates to docs-first-planning-assessment Phase 2 (DECISIONS.md entry), then update entropy-assessment Step 3/4d routing, INTENT.md "The guard lifecycle" generator line (line 88), guards-integrator "When to Run" (line 20) and "What This Is Not" (line 227), and remove the FlowBook mentions (session-coherence-skill-generator lines 22, 193)
- [ ] B2 Mark the 5 partially superseded DECISIONS.md entries (lines 23, 39, 47, 95, 113) and fix the stray supersession claim at line 134; add a **Date** line to new entries from now on
- [ ] B3 Restore "verify each bootstrap action against the current artifact before writing it" to docs-first-planning-assessment Step 5
- [ ] B4 Remove the 3 theory entries from LEARNINGS.md (lines 117, 127, 137; content already in PHILOSOPHY.md 73-116); annotate the "Step 0" entry (four domain generators deleted; port-to-entry-point implication open or closed); qualify "distill-article skill" as living in the writing repo
- [ ] B5 Add a historical status line to each explorations/ doc pointing to entropy-immune-system; list explorations/ as historical in README.md "What's here" and AGENTS.md Key Files
- [ ] B6 Create CURRENT_STATE.md from the 2026-10-04 current-state packet; make it the first AGENTS.md Quick Link
- [ ] B7 Replace skills/local/entropy-guard/SKILL.md with the refined guard (fixes the Key Documents, 20+ files, doc-health-check and generated-by mismatches)
- [ ] B8 Choose the home for external validation results before the first batch run
- [ ] B9 Drop or keep the doc-health-check backlog item (TODO.md line 20)
```

**What blocks the validation batch.** Only B1, B3 and B8 have to be done before the batch starts. B2 and B4-B9 can follow it. Weighed the other way, finishing all nine first would delay the batch by a session for gains that are mostly about reading comfort, and this snapshot gives no evidence to settle which order costs less.

---

## 3. Phase 2: guard refinement

### Step 6: existing guard surfaces

| Surface | Verdict | Reason |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | **amend** | Sound structure and the right trigger. It has 4 stale references and lacks checks for role placement, preserved decided behaviour, supersession marking and the current-state packet. The replacement is `guard/SKILL.md`. |
| `.githooks/pre-commit` | **keep as-is** (one line added later) | It already names the guard and the "Doing Now" check. Adding a packet line belongs to the Next step in `integration.md`. |
| `AGENTS.md` Working Practices and Key Files | **amend** | Add `CURRENT_STATE.md` as the first thing to read, and list `explorations/` as historical. The rest still matches practice. |
| `TODO.md` | **keep as-is** | It is honest: Doing Now is empty and Next Up matches `INTENT.md`. It receives B1-B9. |
| `DECISIONS.md` | **amend** | Supersession markers and dates (B2). |
| `LEARNINGS.md` | **amend** | Remove the theory duplicates and annotate the orphaned entries (B4). |
| `README.md` Contributing and "What's here" | **keep as-is**, then amend after B1 and B5 | Its listings are correct today. |
| `explorations/` | **demote to historical context** | B5. |
| `PHILOSOPHY.md` | **keep as-is** | It is declared a free space, and it becomes the single in-repository home for the theory fragments. |
| `skills/local/entropy-guard-feedback/SKILL.md` | **keep as-is** | It works as the feedback path, and its fallback to manual submission is clear. |

### Step 7: what the refined guard changes

`guard/SKILL.md` keeps the existing guard's single trigger and its order. Here is what changed:

- **Check 1, Decisions**: when a new decision replaces an earlier one, mark the earlier one, and date new entries.
- **Check 2, Learnings**: only tactical learnings validated by use go here. Theory goes to `PHILOSOPHY.md` or the sibling repository.
- **Check 3** is renamed "Skill role and intent alignment". When a skill is added, removed or changes role, check the router, the lifecycle section of `INTENT.md`, the other skills that name it, its feedback check, and that its frontmatter `name` matches its directory. When a skill is rewritten, search `DECISIONS.md` and `LEARNINGS.md` for the skill's name and confirm the behaviour they require still exists. This is the check that would have caught findings 1 and 2.
- **Check 6** now names the real listings: `AGENTS.md` Quick Links and Key Files, and the "What's here" tables in `README.md`.
- **Check 7** treats `explorations/` and superseded decisions as historical: do not bring a concept back from them without checking.
- **New check 9, guard-induced entropy**: any proposed automation must check something that does not change often. This is the check the docs-first skill requires.
- **Check 10, Current state**: covers `TODO.md`, `CURRENT_STATE.md` and the validation results, and is written so it still works before those files exist.
- **Stale references removed**: the "20+ markdown files" count, the "Key Documents table" and `doc-health-check`. The guard now points to a re-run of `entropy-assessment` as the full evaluation, which is the evaluator role in `INTENT.md`.

### Step 8: enforcement depth for each check

| Check | Depth now | Possible later depth |
|---|---|---|
| 1 Decisions, including supersession marking | Narrative, prompted by the hook | Date-line presence on new entries could become semi-embedded once dates are adopted |
| 2 Learnings | Narrative | (none) |
| 3 Skill role and intent alignment | Narrative | "Frontmatter `name` equals directory" can become semi-embedded |
| 4 Workflow and practice alignment | Narrative, prompted | (none) |
| 5 Canonical ownership and local implications | Narrative | Never automate: it needs judgment |
| 6 Key files listings | Narrative | "Every skill directory is listed in README and AGENTS" can become semi-embedded, because skill directory names rarely change |
| 7 Cross-references and supersession | Narrative | Checking that relative links resolve can become semi-embedded, because that rule does not change. Supersession stays narrative. |
| 8 Stale placeholders | Narrative | (none) |
| 9 Guard-induced entropy | Narrative | (none) |
| 10 Current state | Narrative, prompted (the hook already mentions "Doing Now") | (none) |

**Leave as narrative for now**: the router naming every skill, and every skill ending with a feedback check. Both depend on wording and headings that vary today (for example "Upstream Feedback Check" in one skill and "Step 7: Capture upstream feedback…" in another).

### Immediate integration advice

There are two actors (Justin and AI agents from at least two vendors) and four handoff points (session start, session end before commit, pull request, and GitHub feedback issues), so the docs-first skill hands off to `guards-integrator`. The full brief is in `integration.md`. Done now, it comes to four moves:

1. Swap in the refined guard.
2. Paste B1-B9 into `TODO.md`.
3. Create `CURRENT_STATE.md` and link it first in `AGENTS.md`.
4. Keep the existing hook. The next step is a small non-blocking script, run from that hook, that checks links, frontmatter names and skill listings.

---

## 4. Uncertainties and open cleanup

- **The loop map is inferred.** With no `.git`, how often the guard really runs, whether the hook is enabled, and the pull request and issue flow all come from document references, not observation.
- **The sibling repository was not read** (rules for this run), so I do not know whether it holds copies of `explorations/`. B5 assumes it does (Q2).
- **The FlowBook origin of `session-coherence-skill-generator` is inferred** from its vocabulary and metadata schema, not confirmed.
- **The classification is ambiguous between A and D.** Choosing D would have led to the lightweight fallback, then back to docs-first by entropy-assessment item 4d, so the route would have ended in the same place.
- **The refined guard grows from 9 checks to 10.** Whether it stays inside the 2-5 minute budget is unmeasured. `integration.md` sets the check.
- **Answers assumed.** The guard and integration plan assume Q1, Q5 and Q6 are answered as recommended in `questions.md`.

## 5. Upstream feedback check

Yes. The front door left the next step implicit for one exported skill, and the docs-first skill has two reusable gaps. The formatted notes are in `feedback.md`. They were not filed as GitHub issues because this run allows no network access.
