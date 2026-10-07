# Entropy assessment: entropy-guard at commit 447da9a

- **Target:** a read-only snapshot of the entropy-guard repository at commit 447da9a. It has 21 files and no `.git`
  directory.
- **Date:** 2026-10-07.
- **Method:** the entropy-guard skills in `tool-final/skills`, used as written.
- **Route:** `entropy-assessment` Step 1, which runs `intent-pass.md`, then Step 2, where the repo classified as shape
  A (docs-first planning). That shape runs `docs-first-planning-assessment` as a called skill, which supplies Steps 2
  to 7 of the analysis. The guard decision is `update`, so the work went on to `session-coherence-skill-generator`
  and then `guards-integrator`.
- **Mode:** build, with every write redirected to the output folder, because the target may not be edited. Changes
  to the target are delivered as `target.patch` and `guard/SKILL.md`. No steward was present (see Questions).

Other outputs:
- `guard/SKILL.md`: the updated local guard, which replaces `skills/local/entropy-guard/SKILL.md`.
- `target.patch`: the state-file update, the decision-log proposals and supersession lines, and two one-line
  cleanups.
- `integration.md`: how to place and adopt the guard.
- `questions.md`: the three questions, each with a recommended answer.
- `feedback.md`: notes on the skills used, which were not filed.
- `read-log.md`: the skill files opened during the run.

---

## Intent

### Steward

The steward is **Justin Philpott**. This is inferred, because no document names an owner or steward (F3). The
evidence:
- `skills/local/entropy-guard-feedback/SKILL.md` lines 10 and 47 file issues on github.com/justinphilpott/entropy-guard.
- AGENTS.md line 68 and DECISIONS.md line 142 link to other `justinphilpott` repositories.
- In both explorations conversations, Justin Philpott is the participant who sets direction.

Q1 asks him to confirm the role.

### Authorised intent, with sources

Kinds and authority are recorded separately. DECISIONS.md entries carry neither a date nor an author. Their order is
taken to be newest first, because the top entry concerns the newest-dated skill (2026-05-10) and "Specialize first"
refers to the "Consolidate" entry as "above".

| # | Intent | Source | Kind | Authority |
|---|---|---|---|---|
| A1 | entropy-guard stays practical (assessment, guard generation and refinement, integration, validation); broader theory goes to the sibling `entropy-immune-system` repo | Justin, explorations/2026-03-24-entropy-immune-system-conversation.md line 713: "let's keep them in explorations, as I want to preserve the entropy-guard project and really farm this new evolution off into its own repo"; also line 86; DECISIONS.md lines 23–27; INTENT.md lines 122–127 | steward's words; decision; description | attributed and dated (2026-03-24); decision unattributed and undated |
| A2 | `entropy-assessment` is the front door and router; docs-first planning is the specialised, best-validated path | DECISIONS.md lines 15–19; INTENT.md line 5 (revised 2026-04-07) | decision; description | unattributed; INTENT dated |
| A3 | What a guard preserves and must not be: delta-scoped, low burden, enforcement depth matched to the check, self-applying | INTENT.md lines 47–118 | directive in the north star | unattributed; file dated 2026-04-07 |
| A4 | Judgment-heavy guards mature from External to Prompted (a non-blocking reminder) before deeper automation | DECISIONS.md lines 31–35 | decision | unattributed, undated |
| A5 | One local guard, covering documentation and workflow drift together | DECISIONS.md lines 55–59 | decision | unattributed, undated |
| A6 | The guard-creation skill is the product; keep only a few exemplary guards | DECISIONS.md lines 121–125 | decision | unattributed, undated |
| A7 | Exported skills in `skills/`, local ones in `skills/local/`; the agentskills.io format, with `name` matching the folder | DECISIONS.md lines 71–83 | decision | unattributed, undated |
| A8 | LEARNINGS.md stays tactical; articles go to the `writing` repo; PHILOSOPHY.md holds fragments | DECISIONS.md lines 139–143 | decision | unattributed, undated |
| A9 | Bootstrap mode for young repos in `session-coherence-skill-generator` | DECISIONS.md lines 7–11 | decision | unattributed, undated |
| A10 | The next validation round and its measure | the round is open: see F5 and Q2 | conflict | — |

### Declared, enacted, authorised

- **Declared.** README.md, INTENT.md and AGENTS.md say the repo is a practical, markdown-first guard toolkit, now to
  be validated on a batch of docs-first planning repos.
- **Enacted.** There is no git history, so commits cannot be read. Recent work is judged instead from the newest
  dated artifact, open work and the newest decision:
  - the newest dated artifact is `session-coherence-skill-generator`, dated 2026-05-10 and 2026-05-11, a generic
    session-coherence generator imported from a project called FlowBook (F2);
  - the validation batch in TODO.md "Next Up" is unticked;
  - the newest decision extends the generator.

  So the latest work extended guard generation rather than starting the declared validation. Decision A9 covers part
  of that work. The generator's adoption, and how it relates to docs-first Phase 2, is recorded nowhere (F1, Q3).
- **Authorised.** A1 to A9 above. The only statements both attributed and dated are the steward's words in
  explorations/, and they support A1.

### Gaps by condition

| Condition | Gap | Response |
|---|---|---|
| Stale description | Four decision entries describe an `entropy-assessment` with Phase 2 and appendices that the later "Specialize first" decision removed (F6) | Supersession lines added, citing that decision (`target.patch`) |
| Stale description | `guards-integrator` lines 20 and 227 assume `entropy-assessment` generates guards (F11) | Left unchanged: the right replacement depends on Q3 |
| Stale description | The local guard names a "Key Documents table", a `doc-health-check` skill and "20+ markdown files", none of which exist (F9) | Fixed in `guard/SKILL.md` |
| Conflict | The validation measure: merged PRs in open source projects, or session-quality measures on docs-first repos (F5) | Q2 |
| Missing | No document names the steward (F3) | Q1 |
| Missing | No decision adopts `session-coherence-skill-generator` or says which skill writes guards (F1) | Q3 |
| Ambiguous | INTENT.md invites "humans and AI agents" to refine it (F4) | Q1 |
| Ambiguous | "Each guard is a skill file" (INTENT.md line 80) against "not … always a skill file" (line 65) (F18) | Not asked: the answer does not change this run's output |
| Unauthorised drift | None established. The generator work is covered in part by A9, and the rest is a missing decision (F1) | — |
| Prose control | "This is non-negotiable" and "runs its own entropy guard before every commit", backed by an opt-in reminder that exits 0 (F10) | Reported; see `integration.md` |
| Not about intent | A validated rule dropped in the specialisation (F7); a thin state file (F12); unlabelled history (F13) | Fixed in `target.patch` |

### Existing guard repair lines, checked against the intent-change rule

- **Intent.** `skills/local/entropy-guard/SKILL.md` line 68: "If misaligned: update the skill, or if INTENT.md itself
  needs revision, update it with a dated note explaining what prompted the change." This lets session work rewrite
  the authorised intent. AGENTS.md line 27 says the same as a standing instruction: "If a decision refines or
  challenges the intent, update INTENT.md and note why." Whether this is allowed is Q1.
- **Ownership.** The same file, line 88: "Did you change something that another doc also describes? If so, update
  both." This keeps two definitions in step, and it contradicts the line above it (line 87), which asks for "one
  obvious canonical home". Replaced in the new guard by the one-owner check and repair (F8).

### Questions (full text in `questions.md`)

- **Q1.** May a session edit INTENT.md, or only propose, with INTENT.md changed after Justin Philpott records the
  decision? Recommended: propose only, and name him as owner.
- **Q2.** What counts as success for the validation round? Recommended: both merged PRs and the session-quality
  measures, on docs-first repos first.
- **Q3.** Which skill writes guards? Recommended: `session-coherence-skill-generator` alone, with
  `docs-first-planning-assessment` supplying the docs-first checks.

### Proposed changes and where they are recorded

The three questions are recorded as proposals P1 to P3 at the top of DECISIONS.md, under "Proposals awaiting
decision", in `target.patch`, each marked as awaiting Justin Philpott. They are proposals, not decisions. No intent
document is changed.

---

## Lifecycle, shape and repositories

- **Lifecycle: active.**
  - README.md line 121 says "Actively evolving".
  - TODO.md "Next Up" holds three open items.
  - The newest dated artifact is from 2026-05-11.
  - No git history was available to confirm activity after that.
- **Shape: A, docs-first planning.**
  - AGENTS.md line 31 says "Keep the repo markdown-first … there is no application runtime".
  - DECISIONS.md, TODO.md and AGENTS.md carry the repo's state.
  - Work happens in repeated human and agent sessions.
- **Shape D (workflow-heavy) also fits.** The product is a way of working: skills, a ritual and a hook. A was taken as
  the riskier of the two, because the top risks are documents defining the same thing twice (R1, R3). A's analysis
  also covers workflow drift.
- **Repositories: one.** The repo does reference four things outside the snapshot, none of which holds this repo's
  code or manages its work:
  - the sibling `entropy-immune-system` repo, which holds separate theory;
  - the `writing` repo;
  - the `seed` scaffold;
  - GitHub issues, where upstream feedback lands. They were not read: there was no web access (F12).

## Truth map

| Concept | Owner | Other mentions | Status |
|---|---|---|---|
| Purpose, scope, principles | INTENT.md | README.md "What is an entropy guard" and "Project status"; AGENTS.md "Project Constraints" (summaries) | Sound |
| Decisions | DECISIONS.md | INTENT.md revision note | Undated, unattributed; only 2 of 14 entries carry supersession lines (F6) |
| What a generated guard holds | **two owners**: `docs-first-planning-assessment` Phase 2 (lines 132–202) and `session-coherence-skill-generator` (lines 198–315) | INTENT.md lines 75–80 and 86–88; README.md line 52 | Parallel truth (F1) |
| Routing and the front door | `skills/entropy-assessment/SKILL.md` | README.md "How to use"; AGENTS.md "Key Files" | Sound; `guards-integrator`'s handoff is stale (F11) |
| Integration | `skills/guards-integrator/SKILL.md` | docs-first Step 8 (summary, delegating) | Sound |
| Working practices | AGENTS.md "Working Practices" | README.md "Contributing"; `.githooks/pre-commit`; local guard checks 4 and 9 | Sound, but its enforcement prose outruns the mechanism (F10) |
| Live state | TODO.md | README.md "Project status"; INTENT.md lines 129–135 | Thin (F12); conflicting measure (F5) |
| Learnings | LEARNINGS.md | — | Holds three theory entries (F14) |
| Reflections and theory | PHILOSOPHY.md; `explorations/` (historical); sibling repo (continuing) | LEARNINGS.md lines 117–143 | `explorations/` unlisted (F13) |

Product artifacts: the four exported skills and the two local skills. Their names, paths, steps and handoffs are
contracts between skills, and between this repo and every repo assessed with it.

## Loop map

This is the documented loop. The real one cannot be observed without git history.

- **A session starts** in AGENTS.md, which agents load as their instruction file. README.md "Contributing" says to
  check TODO.md first.
- **Work is tracked** in TODO.md "Doing Now", written before work starts and cleared at the end (AGENTS.md line 22).
  Feedback from other repos goes to GitHub issues labelled `agent-feedback`, which TODO.md does not mention.
- **Decisions and learnings** are captured at session end, through the local guard's checks 1 and 2.
- **The coherence pause** is the local guard, run "after any meaningful work session … before committing". A
  non-blocking pre-commit reminder fires only in clones that have linked `.githooks/pre-commit`.
- **The handoff** is a commit, with the guard's outcome in its message. There is no CI and no PR template.

## Findings

One list. Other sections refer to these by id. Sources are file and line in the snapshot, unless marked as a command
run on 2026-10-07.

- **F1. Two independent definitions of what a generated guard holds.**
  - `docs-first-planning-assessment` lines 132–202 (Phase 2, Step 7's checklist areas) and
    `session-coherence-skill-generator` lines 198–315 ("Generated Skill Requirements" and its template) each define a
    guard, with different required parts.
  - No skill routes to the generator: grep finds it only in README.md line 91, AGENTS.md line 46 and DECISIONS.md
    lines 9–10.
  - INTENT.md lines 86–88 give the generator role to the assessment skills only. README.md line 52 says the
    specialised assessment "continues into guard generation".
  - No decision records adopting the generator. → Q3.
- **F2. The session-coherence generator carries residue from the project it came from.** It names "FlowBook" (lines
  22 and 193). Its metadata uses `generated`, `last_updated` and `skill_version` where every other skill uses
  `metadata.version`. Its operational checks (pods, spend, deploys) are aimed at code repos. Cleanup waits on Q3.
- **F3. No document names the steward or owner.**
  - grep for "steward" finds only theory text in explorations/.
  - LICENSE line 3 reads "Copyright (c) 2026 entropy-guard".
  - The owner was inferred from links (see Intent). → Q1.
- **F4. Who may edit the intent documents is ambiguous.**
  - INTENT.md lines 3 and 139 invite humans and agents to refine it.
  - AGENTS.md line 27 and the local guard's line 68 tell sessions to update it.
  - → Q1.
- **F5. The validation measure conflicts.**
  - DECISIONS.md line 26: "open source projects … more merged PRs".
  - INTENT.md lines 129–135: docs-first repos, "clearer session recovery, fewer reintroduced stale ideas, more
    coherent docs".
  - README.md line 125 and TODO.md lines 11–13 also describe the round.
  - No decision settles which measure applies. → Q2.
- **F6. Four decision entries describe a skill that no longer exists, with no supersession line.**
  - The entries: DECISIONS.md lines 39–43, 47–51, 95–99 and 113–117.
  - They describe `entropy-assessment` Phase 2, its appendices and its Steps 5 to 8. Version 0.6.0 of that skill
    has Steps 1 to 4 only, with no phases or appendices (`skills/entropy-assessment/SKILL.md` lines 30–126).
  - The later decision at lines 15–19 ("rather than carrying all deep guidance itself") plainly covers the change.
    Only the entries at lines 105 and 131 carry markers.
  - Fixed: supersession lines added in `target.patch`.
- **F7. A recorded, validated requirement was lost in the specialisation.**
  - DECISIONS.md line 42 says: "Require bootstrap actions to be verified against the current artifact before they
    are written". LEARNINGS.md lines 27–33 record it as validated.
  - No current skill requires it. `docs-first-planning-assessment` line 114 lists "Bootstrap actions" without it,
    and `entropy-assessment` has no bootstrap step.
  - Fixed in `target.patch`: docs-first Step 5, with the version raised to 0.1.1.
- **F8. The local guard's ownership repair keeps two definitions in step.** Line 88 says "If so, update both",
  against its own line 87. Fixed in `guard/SKILL.md`.
- **F9. The local guard has three stale references.**
  - Line 99 names "README.md (Key Documents table)". There is no such table; README.md's tables sit under "What's
    here" (lines 82–115).
  - Line 33 says to "use doc-health-check" for a full audit. That skill does not exist; TODO.md line 20 tracks it,
    and the guard's own line 137 admits it.
  - Line 92 says "20+ markdown files". There are 17 (`find . -name '*.md' | wc -l`).
  - Fixed in `guard/SKILL.md`.
- **F10. A prose control.**
  - AGENTS.md line 19 says running the guard "is non-negotiable", and README.md line 78 says the project "runs its
    own entropy guard before every commit".
  - The only mechanism is `.githooks/pre-commit`, which prints a reminder and runs `exit 0` (lines 3–9). It fires
    only in a clone that has linked it in (AGENTS.md line 19, README.md line 140).
  - A non-blocking reminder is the authorised level (DECISIONS.md line 34). Whether runs actually happen cannot be
    checked without git history.
  - Reported only; see `integration.md`.
- **F11. `guards-integrator` has a stale handoff.** Line 20 says "After `entropy-assessment` generates one or more
  guards", and line 227 says to use `entropy-assessment` "to decide what guards are needed". Version 0.6.0 of
  `entropy-assessment` routes and recommends (Steps 3 and 4d) but generates nothing. Left unchanged, because the
  replacement depends on Q3.
- **F12. The state file is thin.**
  - TODO.md is 20 lines. It has no stage, no list of documents to trust, no settled decisions, no open questions and
    no warning about misleading material nearby.
  - It does not point to the GitHub issues where feedback lands (`entropy-guard-feedback` lines 44–50; DECISIONS.md
    line 17 cites issues #9 to #12).
  - Fixed in `target.patch`.
- **F13. `explorations/` is unlabelled history.**
  - It holds 4 files and 1,467 lines; two of the files are marked `status: draft`. It is listed in neither README.md
    nor AGENTS.md.
  - It stays here by the steward's decision of 2026-03-24 (conversation line 713), as seed material for the sibling
    repo.
  - Nothing tells a fresh session that its line of thought continues elsewhere. Fixed: a README.md row and a
    state-file line.
- **F14. LEARNINGS.md holds theory that was not validated in use.**
  - Three entries (lines 117–143) are "validated by" the 2026-03-19 conversation. This runs against LEARNINGS.md's
    own header (line 3, "Focus on what you validated") and DECISIONS.md lines 139–143 ("tactical").
  - Line 123 suggests the mature form has "no persistent guard artifact", which points away from the persisted
    guards the repo ships.
  - The 2026-03-24 decision to keep theory in explorations/ covered that day's documents only, so moving these
    entries is the owner's call. Recommendation only; the state file warns.
- **F15. The current-state packet has no stated home.** `docs-first-planning-assessment` lines 116–126 ask for a
  packet without saying where it lives. In a repo that already has a TODO.md, this invites the "Parallel truth" and
  "Registry/catalog duplication drift" that the same skill lists (lines 87–88). Recommendation (a design change),
  not patched.
- **F16. Leftovers from the seed scaffold.**
  - AGENTS.md line 21 says "Working code with tests beats perfect code in progress", in a repo with no code or tests
    (lines 31, 51 and 57).
  - `.gitignore` lines 17–25 hold a Go section.
  - `.editorconfig` has rules for `.py`, `.go` and Makefile files.
  - Low risk. AGENTS.md lines 66–68 give the feedback path to `seed`.
- **F17. A reference that cannot be checked.** LEARNINGS.md line 63 says "Led to the distill-article skill". No such
  skill exists here; it may live in the `writing` repo (DECISIONS.md line 142). Low risk.
- **F18. INTENT.md is ambiguous about whether guards are only skill files.** Line 80 says "Each guard is a skill file
  ready to be placed"; line 65 says a guard should not be "always a skill file". Not asked: `guards-integrator`
  places mechanical checks in tooling under either reading.
- **Checked clean, by commands run on 2026-10-07:**
  - all 49 relative markdown links resolve;
  - all 6 skill `name` fields match their folders.

## Ranked risks

| Rank | Risk | Findings | Decay | Recovery cost | Anchor for the fix |
|---|---|---|---|---|---|
| R1 | Two definitions of what a guard is | F1, F2, F11, F15 | Fast: each edit to either skill widens the gap | High: shapes every guard produced for other repos, and the reference example | A decision on P3 |
| R2 | Intent authority open and validation measure in conflict | F3, F4, F5 | Slow | Severe: INTENT.md line 33 says intent entropy is "catastrophic to recover" | Decisions on P1 and P2 |
| R3 | Superseded material beside live truth | F6, F7, F13, F14 | Medium | Medium to high: archaeology, and a validated rule was already lost | DECISIONS.md supersession lines; README.md listing |
| R4 | The guard has drifted, and its enforcement is weaker than its prose | F8, F9, F10 | Per session | Low if caught in the session | The guard; AGENTS.md "Working Practices" |
| R5 | A thin state file | F12 | Fast | Low | TODO.md |

## Recommendations

- **Consolidate:** one guard writer, once P3 is answered (F1). Then reduce the other skill's guard definition to a
  link, and fix F2 and F11 in the same change.
- **Demote or label:** `explorations/` as history (done, F13). The owner should decide whether the three
  theory entries move from LEARNINGS.md to PHILOSOPHY.md or the sibling repo (F14).
- **Mark as superseded:** the four decision entries (done, F6).
- **Restore:** bootstrap-action verification (done, F7).
- **Product, owner's call:** have `docs-first-planning-assessment` keep its current-state packet in the repo's
  existing state file (F15). Report the seed leftovers (F16) through AGENTS.md's seed feedback path.

## One-time cleanup

Each item was verified against the current file before it was written.

| Item | Verified at | Delivered in |
|---|---|---|
| Supersession lines on four decision entries | DECISIONS.md lines 39, 47, 95, 113 (headings present; no marker) | `target.patch` |
| Bootstrap-action verification restored | docs-first line 114 (clause absent); version at line 5 is "0.1.0" | `target.patch` |
| `explorations/` listed as history | README.md lines 100–107 (no explorations row) | `target.patch` |
| The guard's stale references | local guard lines 33, 92, 99 | `guard/SKILL.md` |

Not cleaned, because each waits on an answer: F2, F11 and INTENT.md lines 86–88 (P3); AGENTS.md line 27 (P1).

## State-file update

The TODO.md hunk of `target.patch` adds a "Current State" section above "Doing Now":
- the stage;
- the documents to trust first;
- four settled decisions, by title;
- the open proposals P1 to P3;
- the GitHub issues pointer, marked not read;
- the misleading material nearby;
- three next actions.

It says what makes it stale (a new decision entry, or a Next Up change) and who refreshes it (that session, prompted
by the guard). "Checked 2026-10-07 at commit 447da9a" is the date of this reading of the snapshot. Nothing else in
TODO.md changes; the Backlog's `doc-health-check` line stays true because the new guard still points at it.

## Guard inputs (docs-first Step 7)

**Existing guard surfaces.**

| Surface | Verdict | Why |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | amend (update) | F4, F8, F9; product-contract and supersession checks missing (R1, R3) |
| AGENTS.md "Working Practices" | keep for now | Line 27 waits on P1; "non-negotiable" reported (F10) |
| `.githooks/pre-commit` | amend later | Non-blocking link and name checks (`integration.md`, Next) |
| README.md "Contributing" | keep | Agrees with AGENTS.md |
| TODO.md | amend | F12 |
| DECISIONS.md | amend | F6; proposals P1 to P3 |
| LEARNINGS.md | keep | F14 is the owner's call |
| `explorations/` | demote (label) | F13 |
| `skills/local/entropy-guard-feedback/SKILL.md` | keep | Sound |

There is no CI and no PR template.

**The matrix's checks, written against this repo.** In the guard's Checks, by matrix row:
- **Parallel truth:** the one-owner line, which names INTENT.md, DECISIONS.md, each SKILL.md and TODO.md.
- **Local-global inversion:** the same line ("reduced to links or correct summaries").
- **Superseded material nearby:** the "Before restoring …" line, which names explorations/ and older DECISIONS.md
  entries, and the new-decision line, which asks for "Superseded" lines.
- **Stale references:** the rename line, with its grep, and the link-check command.
- **Lost decisions and learnings:** the DECISIONS.md and LEARNINGS.md lines.
- **State dishonesty:** the TODO.md standing check.
- **Workflow drift:** the AGENTS.md, README.md and hook agreement line.
- **Brittle automation:** the automation line.

Checks specific to this repo, beyond the matrix:
- skill handoffs, because skills are product contracts (F11);
- skill-to-INTENT alignment;
- placeholders;
- GitHub issues filed through the feedback helper;
- the skill `name`-matches-folder command.

**Guard decision: `update`.** A guard exists, is used (AGENTS.md line 19) and is mostly sound, but needs amendment
for F4, F8 and F9 and checks for R1 and R3.

**The generator's inputs.** The skill points to a list called "Before writing"; the generator's list is under
"Inputs, and the guard decision" (see `feedback.md`).
- **Steward:** Justin Philpott, inferred (F3); confirmation is part of Q1.
- **Intent documents:** INTENT.md; README.md "Project status"; AGENTS.md "Project Constraints".
- **Decision surface:** DECISIONS.md.
- **Open intent questions:** Q1 to Q3.
- **Current-state file:** TODO.md. Today it is refreshed by AGENTS.md's "Doing Now" discipline; after the patch, by
  the session that changes it, prompted by the guard.
- **Rules bound but not owned:** the agentskills.io specification (DECISIONS.md lines 79–83). User-wide agent
  instruction files: unresolved, as none are visible in the repo.
- **Verification commands:** the repo has none (AGENTS.md line 51), and nothing runs by itself (no CI). The guard
  adds two, tested on 2026-10-07.
- **Code areas and their docs and tests:** there is no code. The product areas are the skills in `skills/`, which
  README.md "What's here" and "How to use", AGENTS.md "Key Files" and INTENT.md "The guard lifecycle" describe.
  There are no tests.
- **Live state a session can change:** GitHub issues on justinphilpott/entropy-guard, through the feedback helper.
  No spend was found.
- **Findings:** F1 to F18.

## Guard generation (session-coherence-skill-generator)

- **Decision and path:** `update`. The guard is `skills/local/entropy-guard/SKILL.md`, updated in place, and
  delivered as `guard/SKILL.md`. The name stays `entropy-guard` rather than the template's
  `session-coherence-guard`, because the repo's recorded format rule says `name` must match the folder (DECISIONS.md
  line 81).
- **The intent-change rule:** copied in, with Justin Philpott, INTENT.md, README.md "Project status", AGENTS.md
  "Project Constraints" and DECISIONS.md filled in. It was copied rather than pointed to, because the target has no
  `skills/entropy-assessment/intent-change-rule.md`. Its Intent section is marked provisional on P1.
- **Size:** 1,380 words (`wc -w`). The budget is 1,259 words, made of four terms:

  | Budget term | Words | How it was counted |
  |---|---|---|
  | Common contract | 706 | Reproduced with `wc -w` on the template with the rule copied in |
  | Checks | 396 | 11 justified checks beyond the two standing ones, × 36. Their actual words: 345 |
  | Pointers | 57 | The filled "Where things live" bullets are 85 words; the template's are 28 |
  | Commands | 100 | The link and name checks |

  The excess is 121 words. Duplication was checked first, and none was removed. The excess is all justified
  coverage:
  - about 33 words: the P1 provisional note;
  - about 33 words: the commit-message report line (README.md "Contributing" step 4);
  - about 36 words: the TODO.md discipline, folded into the standing state check instead of a 12th check;
  - about 30 words: the skip-for-trivial and `doc-health-check` pointers;
  - about 26 words: provenance metadata;
  - about 22 words: placeholder fills.
- **Coverage of both existing guard definitions** (relevant to Q3):
  - Every checklist area in docs-first Step 7 has a line, including the check against guard-induced entropy.
  - The generator's required sections are present: modes, judgment checks, exact commands, safety rules, and a
    check on live operational state (GitHub issues).
  - The one deliberate departure is the generator's "current active direction" statement. It is replaced by a
    pointer to TODO.md, because the contract keeps state out of the guard.
- **Review (generator Step 4):**
  - "Modes and safety" is present, and the baseline is bound.
  - No repair edits intent documents. The "update both" repair is gone.
  - The patches were checked against the open questions (see below).
  - Size is as reported above.
- **Validation, run 2026-10-07:**
  - `git diff --no-index --check` reports no whitespace errors in the guard or the patched files.
  - The guard's command block runs clean on the target, and clean on a copy with `target.patch` applied and the new
    guard installed.
  - On a copy with one link and one skill `name` broken on purpose, the block reported both.
  - `patch -p1 --dry-run` applies `target.patch` cleanly.
- **Doc references:** none added. AGENTS.md lines 19 and 41, and README.md lines 78, 97 and 137, already name the
  guard at the same path, and README.md line 78's summary of what it checks stays true.
- **Not done: generator Step 1** (record the work in the state file), because the target is read-only.
  `target.patch` is the record.
- **Handoff:** to `guards-integrator`, whose brief is `integration.md`.

## Patches checked against the open questions

| Change | Settled by | Questions touched |
|---|---|---|
| TODO.md "Current State" | The findings; names P1 to P3 as open | Lists P1–P3, settles none |
| DECISIONS.md proposals P1 to P3 | Intent pass, step 5 | Records them, settles none |
| DECISIONS.md supersession lines | DECISIONS.md lines 15–19 | P3 text unchanged: the lines say where things live today, not which skill should own guards |
| docs-first Step 5 verification | DECISIONS.md line 42; LEARNINGS.md lines 27–33 | None |
| README.md `explorations/` row | Steward, 2026-03-24 (conversation line 713); DECISIONS.md line 26 | None |
| `guard/SKILL.md` | Generator contract; F8, F9 | Provisional on P1; does not settle P3 |

Left unchanged on purpose:
- INTENT.md lines 3, 139 and 86–88, and README.md line 52 (P1, P3);
- AGENTS.md line 27 (P1);
- `guards-integrator` lines 20 and 227 (P3);
- the generator's FlowBook text (P3);
- LEARNINGS.md lines 117–143, the theory entries, which are the owner's call;
- docs-first's packet location (F15, a design change).

## Uncertainties and what was not covered

- **No git history.** The enacted reading, the real loop, and whether the guard has ever run (F10) could not be
  observed.
- **Not read, for lack of web access or because they sit outside the snapshot:**
  - the GitHub issues (#9 to #12, and the `agent-feedback` label);
  - the `entropy-immune-system`, `writing` and `seed` repositories.
- **Read in part only.** Of `explorations/`, only the front matter, the headings and the conversation passages that
  hold the steward's decisions (2026-03-24 conversation, lines 84–130 and 640–749) were read. Every other file in
  the target was read in full.
- **DECISIONS.md order and authorship are inferred.** It is taken as newest first, and the entries as the steward's
  record, from their content.
- **The template line "Never commit or push unless asked"** is read as compatible with AGENTS.md's "Commit early,
  commit often", on the grounds that the guard itself never commits and the repo's standing practice is the ask.
- **Whether every agent tool used here loads AGENTS.md** was not tested (see `integration.md`). The repo has no
  CLAUDE.md, and explorations show both Claude and OpenCode sessions.
