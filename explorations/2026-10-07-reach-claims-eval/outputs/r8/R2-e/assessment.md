# Entropy assessment: entropy-guard snapshot 447da9a

Assessed 2026-10-07. Target: `eval/targets/entropy-guard-447da9a`, a read-only snapshot of an older entropy-guard
repository (21 files, no `.git`). Line numbers below refer to that snapshot.

## Route and mode

- **Route:** `entropy-assessment` Step 1 (the intent pass) → Step 2, shape **A, docs-first planning** →
  `docs-first-planning-assessment` run as a called skill (its Steps 1-7), returning here → Step 3, guard decision
  **`update`** → Step 4, handed to `session-coherence-skill-generator` → `guards-integrator`.
- **Mode: plan.** The target is read-only, so nothing in it was edited. Every change is delivered in this folder:
  `settled.patch` (apply now), `provisional-Q1.patch` to `provisional-Q4.patch` (apply only after the steward answers
  that question), `guard/SKILL.md` (the updated guard, installed by `provisional-Q1.patch`). The files build mode would
  change are exactly the files those patches touch.
- **No steward available.** Questions and recommended answers are in `questions.md`; the work that depends on them is
  drafted, never applied.

## Intent

**Steward:** Justin Philpott, **inferred**. No file names a steward (finding F1). The evidence is ownership: the feedback
helper files issues on `justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md` lines 10, 47),
the seed and writing repositories are under the same account (AGENTS.md line 68, DECISIONS.md line 142), and
PHILOSOPHY.md line 43 and the explorations' front matter list him as a participant.

**Authorised intent, with sources.** All 17 DECISIONS.md entries are recorded decisions with neither date nor decider
(F1); they rank above descriptions, with that uncertainty kept visible.
- Purpose: practical entropy protection (assessment, guard generation and refinement, integration, iterative
  validation on real projects). DECISIONS.md line 26; INTENT.md lines 124-127.
- Out of scope here: broader entropic-immunity theory, which continues in `../entropy-immune-system`. DECISIONS.md
  line 26.
- `entropy-assessment` stays the single front door as a router; `docs-first-planning-assessment` is the deepest path.
  DECISIONS.md line 18.
- Guards come with integration (lines 90, 98); judgment-heavy guards mature External → Prompted (line 34); this repo
  keeps one combined local guard (line 58); young repos are bootstrapped before a guard (line 10).
- Skills follow the agentskills.io format (line 82); exportable skills in `skills/`, local ones in `skills/local/`
  (line 74); LEARNINGS.md stays tactical, articles live in the writing repo (line 142).
- Guard principles: INTENT.md lines 47-66 and 113-118 (declared intent, the "north star", last revised 2026-04-07,
  unattributed). Repository constraints: AGENTS.md lines 29-34 (standing directives, unattributed).

**Three readings.**
- *Declared* (README, INTENT, AGENTS): the above, with the next phase an external validation batch of docs-first
  planning repos (INTENT.md lines 129-135, README.md line 125, TODO.md lines 11-13).
- *Enacted* (dated content only; there is no commit history): the latest dated work built bootstrap mode into
  `session-coherence-skill-generator` (generated 2026-05-10, updated 2026-05-11, its lines 5-6), a skill imported from
  another project (F15). The validation batch has not started (every Next Up item unchecked).
- *Authorised*: DECISIONS.md covers the generator's bootstrap mode but not its adoption or its relation to the
  docs-first guard phase (F4).

**Gaps by condition** (evidence in the findings list):
- Missing: F1 (steward), F4 (no decision adopting the generator).
- Conflict: F4 (two skills write guards; INTENT.md line 88 names a third arrangement), F8 (validation measure).
- Ambiguous: F2 (is INTENT.md's own invitation to edit it the steward's standing authorisation?), F7 (which part of
  "Consolidate" was superseded).
- Unauthorised drift: F6 (a decided requirement dropped), F13 (theory entries in LEARNINGS.md against DECISIONS.md
  line 142).
- Prose control: F9 (the guard ritual).
- Stale description: F5 (its correction depends on Q2, so it is held provisional), F11, F14.
- Existing guard repair instructions, read against the intent-change rule: **Intent** flag on guard line 68 (F2);
  **Ownership** flag on guard line 88 (F3).
- Not intent-dependent, fixed as usual: F11, F15, F16, F19, F20.

**Questions:** Q1-Q4, in `questions.md`, each with a recommended answer. **Proposed changes recorded:** the Q1 and Q2
proposals are added to DECISIONS.md by `settled.patch`, marked "awaiting the steward; not in force"; all four
questions are listed in TODO.md's new "Current state".

## Lifecycle, shape and repositories

- **Lifecycle: active.** README.md line 5 ("actively used, actively refined") and line 121 ("Actively evolving"); the
  latest dated change is 2026-05-11; TODO.md has open Next Up work. This is a snapshot about five months older than
  today, with no history to show later activity.
- **Shape: A, docs-first planning**, with D (workflow-heavy) also fitting. 17 of 21 files are markdown; the only
  executable is a 9-line hook that prints a reminder; AGENTS.md line 31 says "markdown-first ... no application
  runtime"; DECISIONS.md, TODO.md and AGENTS.md carry the state; work runs in repeated human and agent sessions
  (AGENTS.md line 22). D fits because the product is workflow skills and this repo's own ritual is part of the product
  (guard line 78). A is the riskier reading: the three worst risks (R1-R3) are docs-to-docs and intent drift, and A's
  matrix also covers workflow drift (R4). B and C do not fit: there is no implementation.
- **Repositories: one.** Related but not assessed (outside the permitted reading): `../entropy-immune-system` (a
  separate inquiry, DECISIONS.md line 26), `justinphilpott/writing`, `justinphilpott/seed`, and the GitHub issues on
  `justinphilpott/entropy-guard`, which carry some work (F16).
- **Planning horizon.** Settled: the DECISIONS.md entries listed above. Active: the validation batch (not started) and
  the generator's place (F4, Q2). Exploratory: the guard runner and evaluator (INTENT.md line 86, TODO.md line 18),
  further specialised tracks (TODO.md line 19), layer 1-2 checking and just-in-time generation (PHILOSOPHY.md,
  LEARNINGS.md lines 117-143), entropic immunity (sibling repo).

## Findings

One list; every other section refers to these ids.

- **F1. No steward is named, and no decision is dated or attributed.** All 17 DECISIONS.md entries (lines 7-143) carry
  neither; INTENT.md line 3 names "humans and AI agents" as its refiners; LICENSE names "entropy-guard". Source: intent
  pass. Recorded as inferred (TODO.md "Current state", guard pointer).
- **F2. Four standing instructions let the working session rewrite intent.** Guard line 68: "if INTENT.md itself needs
  revision, update it with a dated note"; AGENTS.md line 27: "update INTENT.md and note why"; AGENTS.md line 32: update
  INTENT.md "in the same change when behavior or methodology shifts"; INTENT.md lines 3 and 139 invite any contributor
  to revise it. INTENT.md line 3 may itself be the steward's standing authorisation, so this is Ambiguous, not a plain
  defect → Q1, `provisional-Q1.patch`.
- **F3. The guard's repair keeps two definitions in step.** Guard line 88: "Did you change something that another doc
  also describes? If so, update both." It contradicts the line before it (87: one canonical home). Fixed in
  `settled.patch`.
- **F4. Two skills write guards, and no decision relates them.** docs-first-planning-assessment Phase 2 (lines
  132-202; Output line 196 "the refined or generated guard") and session-coherence-skill-generator (lines 198-231,
  default path `skills/session-coherence-guard/SKILL.md`, different required sections). INTENT.md lines 86-88 name only
  entropy-assessment and docs-first as the generator, so that list is **incomplete**; README.md lines 50-58 send guard
  generation through docs-first; README.md line 91 and AGENTS.md line 46 list the generator; entropy-assessment v0.6.0
  Steps 3 and 4d never route to it; DECISIONS.md line 9 ("The previous session-coherence-skill-generator") is its only
  record. Searched `session-coherence` across every file; commit messages are unavailable. → Q2.
- **F5. guards-integrator's entry condition names a router as the guard generator.** Line 12 "Use this after
  generating guards", line 20 "After `entropy-assessment` generates one or more guards"; entropy-assessment v0.6.0 is a
  router (its line 12; DECISIONS.md line 18). The replacement depends on Q2 → `provisional-Q2.patch`.
- **F6. A decided requirement was lost when entropy-assessment became a router.** DECISIONS.md line 42: "Require
  bootstrap actions to be verified against the current artifact before they are written" (why: LEARNINGS.md lines
  27-33). No current skill says so: entropy-assessment v0.6.0 has no bootstrap actions, and docs-first line 114 lists
  "Bootstrap actions" without verification. The decision's other two parts survive (docs-first line 202; the
  generator's bootstrap mode). Line 43's Impact still describes features entropy-assessment no longer has. Fixed in
  `settled.patch` (docs-first line 114).
- **F7. The domain knowledge "preserved as structured appendices" is in no file.** DECISIONS.md lines 134-135 and line
  50; line 131 says "Partially superseded" without naming the part. entropy-assessment v0.6.0, read in full, has no
  appendices; a search for "appendi" finds only DECISIONS.md and LEARNINGS.md line 42. → Q4.
- **F8. The validation loop's target and measure differ across four places.** DECISIONS.md line 26: open-source
  projects, "track whether that produces more merged PRs"; INTENT.md lines 129-135, README.md line 125 and TODO.md
  lines 11-13: docs-first planning repos, session-quality measures, no PRs. "Specialize first" (lines 15-19) settles
  the repo shape, not the measure. → Q3.
- **F9. The guard ritual is written as stronger than anything makes it.** AGENTS.md line 19: "non-negotiable"; README.md
  line 78: "This project runs its own entropy guard before every commit", stated as fact. The only mechanism is
  `.githooks/pre-commit`, which prints and exits 0 (line 9), and runs only after a manual symlink (README.md line 140);
  the snapshot cannot show whether it is enabled or whether the guard ran. The non-blocking design is decided
  (DECISIONS.md lines 31-35), so the mechanism is as intended; README.md line 78 overstates it. Enforcement would sit
  in the hook (blocking) or CI; neither is decided. Guard line 22 describes the integration accurately. README.md line
  78 fixed in `settled.patch`; AGENTS.md line 19 reported only.
- **F10. The reminder fires after the commit message is fixed.** The hook runs inside `git commit` and exits 0. With
  `git commit -m`, the usual agent form, the message is already written and the commit lands while the reminder
  prints. The guard's result belongs in that message (guard line 131, README.md line 138), so the reminder can only
  prompt an amend or the next commit. AGENTS.md line 22 ordering fixed in `settled.patch`; see `integration.md`.
- **F11. Stale references and counts in the guard.** Line 99 "README.md (Key Documents table)": README has "What's here"
  (line 82). Line 92 "20+ markdown files": 17 (`find`, 2026-10-07). Line 33 "use doc-health-check for that": no such
  skill (line 137 and TODO.md line 20 already say so). Fixed in `settled.patch`.
- **F12. The guard's provenance claims disagree and predate the generator.** Guard line 14 "a reference example of the
  docs-first planning output"; guard line 3 "what the guard generators produce"; README.md line 97 "a reference example
  of generator output"; README.md line 78 "a concrete example of what the generator produces". The guard was last
  evaluated 2026-04-07 (line 21), before the generator existed, and lacks the generator's required sections (its lines
  213-227: modes, mechanical checks, safety rules). Which claim is right depends on Q2; kept verbatim in settled hunks.
- **F13. Conceptual material sits beside live truth.** `explorations/` (4 files, 1,467 lines) is in no listing; its
  three 2026-03-24 files are the entropic-immunity material DECISIONS.md line 26 moved to the sibling repo ("seeded with
  the exploration documents"), and the working conclusions call themselves notes "for a future derived project" (lines
  20-22). LEARNINGS.md lines 117-143 hold three entries validated only by "the 2026-03-19 philosophical conversation",
  duplicating PHILOSOPHY.md's "The regress of representation", "Just-in-time guard generation" and "The four things and
  their temporal hierarchy" (lines 72-114), against LEARNINGS.md line 3 and DECISIONS.md lines 139-143. Marked in
  `settled.patch`.
- **F14. Historical lines point at retired structure.** LEARNINGS.md line 33 ("Step 5 ... Step 7"), line 93 ("Step 0"),
  line 112 ("Step 8"), line 63 ("Led to the distill-article skill": not in this repo; it may exist elsewhere,
  unverified); DECISIONS.md lines 42-43, 50, 97 and 116 name Phase 1/2, Step 8 and appendices of the pre-router skill;
  DECISIONS.md lines 71-75 lack the partial-supersession marker that line 134 implies. History left as written;
  `settled.patch` adds the marker and a "Misleading material nearby" line in TODO.md.
- **F15. An imported project's name sits in an exportable skill.** The generator's lines 22-23 and 193 mention
  "FlowBook", defined nowhere in the repo. Reworded, meaning kept, in `settled.patch`.
- **F16. Work is tracked in two places without a link.** TODO.md, and GitHub issues (DECISIONS.md line 17 cites
  #9-#12; the feedback helper files `agent-feedback` issues; TODO.md line 3 plans to move to an issue tracker). TODO.md
  does not mention the issues. Not read (no web access). `settled.patch` names them in TODO.md "Current state".
- **F17. What the workflow reaches beyond the repo.** AGENTS.md lines 49-52 ("No build, test, or runtime commands
  yet") holds for its stated scope. Search, 2026-10-07, over every file including `explorations/` and the four non-
  markdown files, for `gh`, `git`, `curl`, `wget`, `npm`, `pnpm`, `pip`, `docker`, `ssh`, URLs and `../` paths. It
  found: `gh issue create` and `gh issue list` against `justinphilpott/entropy-guard` (feedback helper lines 46-51,
  77), invoked from guards-integrator line 174, docs-first line 217, entropy-assessment line 150 and AGENTS.md line
  72, authorised by DECISIONS.md lines 63-67; the hook (prints only); `../entropy-immune-system` as the home of theory
  work (AGENTS.md lines 15, 34, 47); feedback to the seed project, mechanism unstated (AGENTS.md lines 66-68); articles
  in the writing repo (DECISIONS.md line 142). The delegated targets were not inspected. The guard's last check
  reports any outside write without claiming this list is complete.
- **F18. Both summaries of the guard's checks omit two of its nine.** README.md line 78 and guard line 3 list five
  areas; checks 2 (Learnings) and 3 (Skill / Intent Alignment) are missing, and the guard calls the second "the most
  dangerous form of entropy here" (line 70). Key files, placeholders and TODO fall under the listed "stale references"
  and "honest state". Completed in `settled.patch`; `provisional-Q1.patch` rewrites README's list for the new guard.
- **F19. guards-integrator's discovery list misses this repo's own hook.** Line 46 lists `.pre-commit-config.yaml`,
  `.husky/`, `.git/hooks/`; this repo uses a tracked `.githooks/pre-commit` (DECISIONS.md line 34). Fixed in
  `settled.patch`.
- **F20. Seed scaffolding residue.** AGENTS.md line 21 ("Working code with tests beats perfect code") in a repo with no
  code or tests (lines 51, 57); `.gitignore` lines 17-25 (Go); `.editorconfig` lines 11-18 (Python, Go, Makefile). Low.
  Tracked in TODO.md Backlog for the seed project (AGENTS.md lines 66-68).

## Truth map

| Concept | Canonical home | Elsewhere, and in what role | Status |
|---|---|---|---|
| Purpose, scope, guard principles | INTENT.md | README.md lines 1-23, 119-125; AGENTS.md lines 3, 29-34 (summaries) | Sound; amendment path open (F2) |
| Settled choices | DECISIONS.md | Implications in LEARNINGS.md; skill text | Undated, unattributed (F1); retired structure (F14) |
| Working practice | AGENTS.md "Working Practices" | README.md "Contributing"; hook text; guard check 4 (prompts) | Overstated in README.md line 78 (F9) |
| Current state, next work | TODO.md | README.md lines 119-127, INTENT.md lines 122-135, DECISIONS.md line 26 | Next phase restated, measure differs (F8); issues unlinked (F16) |
| Routing an assessment | `skills/entropy-assessment/` (product) | README.md "How to use" | Does not reach the generator (F4) |
| Docs-first analysis | `skills/docs-first-planning-assessment/` (product) | README, AGENTS summaries | Lost a decided requirement (F6) |
| **Writing a guard** | **Contested**: docs-first Phase 2 and `skills/session-coherence-skill-generator/` | INTENT.md line 88 names a third arrangement; README.md lines 50-58 | Parallel truth (F4, F12) → Q2 |
| Integration | `skills/guards-integrator/` (product) | docs-first Step 8 | Stale entry condition (F5); hook discovery gap (F19) |
| This repo's guard | `skills/local/entropy-guard/` | AGENTS.md lines 19, 41; README.md line 78; hook | F2, F3, F11, F12, F18 |
| Skill catalogue | each `SKILL.md` front matter | README "What's here", AGENTS "Key Files" (summaries) | Correct and complete |
| Theory and reflection | PHILOSOPHY.md; `../entropy-immune-system`; writing repo | LEARNINGS.md lines 117-143 (copies); `explorations/` (history) | F13 |
| Templates | the generator's guard template (lines 268-315); integrator scaffolds | — | — |
| Historical | `explorations/`; superseded DECISIONS.md entries (lines 103-109, 129-135; 71-75 unmarked) | — | F13, F14 |

## Loop map

- **Session start:** AGENTS.md (the only agent instruction file; no `CLAUDE.md` or vendor folder), README.md, then
  TODO.md "Doing Now", written before work starts (AGENTS.md line 22); INTENT.md for significant decisions (line 27).
- **Work tracked in:** TODO.md, and GitHub issues for feedback (F16).
- **Decisions and learnings captured:** at the guard, at session end (guard checks 1-2).
- **Coherence pause:** the guard before commit (AGENTS.md line 19); the hook's reminder inside `git commit`, if enabled
  (F9, F10).
- **Handoff:** the commit, with the guard's one-line result in its message (README.md line 138). A pull request was used
  at least once (LEARNINGS.md line 152); there is no PR template and no CI (no `.github/`).
- **Real versus documented:** not observable. Without history, whether commits carry guard notes, how often the guard
  runs, and whether the hook is enabled are unknown.

## Ranked risks

| # | Risk | Decay | Recovery cost | Symptoms | Anchor for the fix |
|---|---|---|---|---|---|
| R1 | Two guard writers, no owner | Fast: each skill edit widens the gap | High: exported, so other repos hold guards of both shapes | F4, F5, F12 | A DECISIONS.md answer to Q2, then INTENT.md "The guard lifecycle" |
| R2 | Intent rewritten by the session doing the work | Slow | Catastrophic (INTENT.md line 33) | F2, F1 | A DECISIONS.md answer to Q1 |
| R3 | Decided requirements lost when skills are restructured | Each restructure | High: found only by reading DECISIONS.md against current skills | F6, F7, F14 | DECISIONS.md; guard check 3 |
| R4 | The guard ritual described as stronger than it is | Fast | Cheap if caught | F9, F10, F18 | AGENTS.md "Working Practices" |
| R5 | Conceptual material read as guidance | Medium | Medium: e.g. LEARNINGS.md line 123 ("no persistent guard artifact") against a generator that writes persistent guards | F13, F14, F8 | DECISIONS.md lines 26, 139-143 |

## Recommendations

- **Consolidate** guard writing in one skill (Q2; recommended: the generator). Drafted in `provisional-Q2.patch`.
- **Demote** LEARNINGS.md lines 117-143 to summaries of PHILOSOPHY.md (done by marker in `settled.patch`). Removing
  them from LEARNINGS.md is the steward's option, not done.
- **Mark historical** `explorations/` (AGENTS.md "Key Files", `settled.patch`). Deleting the three 2026-03-24 files is
  an option for the steward once he confirms the sibling repo holds them; not verified here.
- **Mark supersession** on DECISIONS.md "Exportable skills vs local skills" (`settled.patch`); "Consolidate" waits on Q4.
- **Leave alone:** README.md line 125's statement of measures until Q3 is answered.

## One-time cleanup

Each item was checked against the current file on 2026-10-07; all are in `settled.patch` except the last.

- Guard lines 3, 33, 88, 92, 99 (F3, F11, F18).
- README.md line 78 (F9, F18).
- docs-first line 114 (F6); guards-integrator line 46 (F19); generator lines 22-23 and 193 (F15).
- AGENTS.md "Key Files" gains `explorations/` (F13); AGENTS.md line 22 runs the guard before the commit message (F10).
- LEARNINGS.md lines 117, 127, 137 gain status markers (F13); DECISIONS.md line 71 gains a marker (F14).
- TODO.md "Current state" and two items (F1, F8, F13, F14, F16, F20).
- Seed residue (F20): tracked in TODO.md Backlog, to report to the seed project, not edited here.

## State-file update

TODO.md is the state file the loop map shows is read first; no competing summary was added. `settled.patch` gives it a
"Current state" section (stage, what to trust first, the inferred steward, Q1-Q4, misleading material nearby, what is
tracked elsewhere) with its check date, what makes it stale, and who refreshes it, plus one Next Up item (answer
Q1-Q4) and one Backlog item (F20). The existing three Next Up items remain the next actions.

## Guard surfaces

| Surface | Verdict |
|---|---|
| `skills/local/entropy-guard/SKILL.md` | Amend now (settled hunks); replace in place by `guard/SKILL.md` after Q1 |
| AGENTS.md "Working Practices" | Amend line 22 now; lines 27 and 32 after Q1 |
| `.githooks/pre-commit` | Keep (decided non-blocking reminder); add the two stable checks as warnings later (`integration.md`) |
| README.md "Contributing" | Keep |
| TODO.md | Amend (state section) |
| DECISIONS.md, LEARNINGS.md | Keep as decision and learning surfaces; amend markers |
| `skills/local/entropy-guard-feedback/` | Keep |
| `explorations/` | Demote: marked as history |

## Guard checks against this repo's files

The matrix's checks, written against the actual files, became the 11 checks in `guard/SKILL.md`:

| Guard check (in order) | Matrix row | Findings |
|---|---|---|
| 1. Skill name, path, inputs or handoff changed → naming skills, README "What's here", AGENTS "Key Files" | Parallel truth, stale references | F4, F5, F12 |
| 2. TODO.md state claim changed → its other mentions; "Doing Now" cleared | State dishonesty | F8, F16 |
| 3. A skill changed → INTENT.md guard principles; decided requirements survive | Lost decisions | F6, F7 |
| 4. A choice made → DECISIONS.md, dated, decider named, supersession marked | Lost decisions | F1, F14 |
| 5. A learning → LEARNINGS.md; theory elsewhere | Lost learnings, parallel truth | F13 |
| 6. A concept's text changed → one canonical home | Parallel truth | F3, F4, F13 |
| 7. Restoring or reviving → supersession recorded? `explorations/` treated as current? | Superseded material nearby | F7, F13, F14 |
| 8. A file or heading added, renamed or removed → search, listings, commands | Stale references | F11 |
| 9. Contributor workflow changed → AGENTS, README, hook, guard agree | Workflow drift | F9, F10 |
| 10. A script or hook check proposed → stable invariants only | Brittle automation | — |
| 11. A write outside the repo → reported | (live state) | F17 |

The commands: `git diff --check`, a relative-link check, and a skill-name-matches-folder check (DECISIONS.md "Skill
format"). The old guard's placeholder check is folded into check 2; its rationale paragraphs are left to this
assessment, since a guard holds checking policy only.

## Guard decision: `update`

An existing guard needs amendment (F2, F3, F11, F12, F18, and the contract's baseline, modes and safety, and intent
rule). It is updated in place at `skills/local/entropy-guard/SKILL.md`, keeping the name `entropy-guard`: the
agentskills.io decision requires the name to match its folder, and AGENTS.md lines 19 and 41, README.md lines 78, 97
and 137, and the hook all name that path.

## Generator inputs

- **Steward:** Justin Philpott (inferred, F1). **Authorised intent:** INTENT.md; README.md lines 1-7 and "Project
  status"; AGENTS.md "Project Constraints"; DECISIONS.md. **Decision surface:** DECISIONS.md. **Open intent questions:**
  Q1-Q4.
- **Current-state file:** TODO.md, refreshed by the session that changes a state claim (AGENTS.md line 22; its new
  section states the rule); the steward closes questions.
- **Rules bound by, not owned:** the agentskills.io specification (DECISIONS.md lines 79-83). A user-wide instruction
  file: **unresolved**, none inside the repo, and outside it was not inspected. Merge rules, security or spending
  policy: none found.
- **Verification commands:** none run by themselves (no CI, no hook framework; the hook only prints). The guard's three
  commands were tested (below).
- **Code areas:** none. Product areas: the four exportable skills, described by README "What's here", AGENTS "Key
  Files", INTENT.md lines 69-96 and each other's named handoffs; the two local skills, by README and AGENTS. No tests.
- **Live state a session can change:** GitHub issues on `justinphilpott/entropy-guard`, through the feedback helper.
  No deploys, services or spend.
- **Findings:** F1-F20.

## Generator output

- **Guard:** `guard/SKILL.md`, for `skills/local/entropy-guard/SKILL.md`, installed by `provisional-Q1.patch`.
- **Size: 1,174 words** (`wc -w`, 2026-10-07), against a **budget of 1,189**:
  - common contract: 724 (the generator's own measurement, 2026-10-07);
  - checks: 9 beyond the two standing ones × 36 = 324;
  - pointers: 55 words of "Where things live" values;
  - commands: 86 words of repo-specific commands.
- **Doc references added:** none needed; the path is already named in AGENTS.md, README.md and the hook.
- **Validation run, 2026-10-07:**
  - the guard's commands, run with `sh` and `zsh` on the original, settled and fully patched copies: no output;
  - with a broken link and a mismatched skill name planted in a scratch copy, both were reported;
  - `git diff --no-index --check` on the patched copies: no whitespace errors;
  - `settled.patch` and each provisional patch apply cleanly with `patch -p1`, alone and in sequence.
- **Left visible in the guard:** Q1 (the "Open" line under Intent); the inferred steward; the unresolved user-wide
  instruction file; Q2-Q4 through TODO.md.
- **Step 1 in plan mode:** build mode would add a "Doing Now" line for this work to TODO.md; not in the patches, since
  it belongs to the session that applies them.
- **Review before handing over:** the guard carries "Modes and safety" and binds its baseline, falling back to
  `@{upstream}`. Its repair instructions follow the contract, and the old intent-editing repair (guard line 68) is
  removed only by `provisional-Q1.patch`. The patches are reviewed below.
- **Handover:** to `guards-integrator`; see `integration.md`.

## Patch review

Every hunk was read against the findings and Q1-Q4.

**`settled.patch`, 17 hunks; none touches an open question.**

| Hunk | Findings | Why it is settled |
|---|---|---|
| AGENTS.md line 22 | F10 | The lines Q1 quotes (27 and 32) are outside its changed lines |
| AGENTS.md "Key Files" | F13 | Settled by DECISIONS.md line 26 |
| DECISIONS.md, two proposals | Q1, Q2 | Recorded as proposals awaiting the steward, as the intent pass directs; they decide nothing and edit no quoted text |
| DECISIONS.md line 71 marker | F14 | Settled by line 134; Q4 concerns a different supersession |
| LEARNINGS.md, 3 markers | F13 | Settled by DECISIONS.md lines 139-143 and the PHILOSOPHY.md copies |
| README.md line 78 | F9, F18 | Q2 quotes README.md lines 50-58 and 97, not 78. The F12 sentence is kept verbatim, and the check list is completed |
| docs-first line 114 | F6 | Settled by DECISIONS.md line 42 |
| guards-integrator line 46 | F19 | Q2 quotes line 20, not 46 |
| guard line 3 | F18 | List completed; the F12 phrase is kept verbatim |
| guard line 33 | F11 | — |
| guard lines 88, 92, 99 | F3, F11 | Line 68, which Q1 quotes, is outside the hunk |
| generator lines 22-23 and 193 | F15 | Q2 quotes lines 198-231 |
| TODO.md "Current state" and Next Up | F1, F8, F13, F14, F16 | Lists Q1-Q4 as open and answers none; "Stage" names no guard writer |
| TODO.md Backlog | F20 | — |

**Provisional patches.**
- `provisional-Q1.patch`: INTENT.md lines 3 and 139, AGENTS.md lines 27 and 32, README.md line 78's check list
  (rewritten to cover all 11 new checks, per F18), and the guard replacement.
- `provisional-Q2.patch`: INTENT.md line 88 (adds the generator, completing F4's list), README.md lines 52, 89 and
  91, docs-first Phase 2 and its Output, entropy-assessment Step 4d, guards-integrator line 20 (F5).
- `provisional-Q3.patch`: INTENT.md line 135.
- `provisional-Q4.patch`: DECISIONS.md line 131.

## Questions for the steward

Q1-Q4 in `questions.md`, each with its statement and source, readings, a concrete case and a recommended answer.

## Uncertainties and what was not covered

- **No git history.** Enacted intent comes from dated content only; commit messages could not be searched for the
  steward's words; hook enablement, guard runs and commit notes are unobservable.
- **Not read:** `../entropy-immune-system`, the writing and seed repositories, and the GitHub issues (outside the
  permitted reading; no web).
- **Partly read:** `explorations/` was read by front matter, opening sections and headings, not in full (1,467 lines).
  It was searched in full for commands and URLs, and none were found.
- **Inferences:** the steward is inferred; the regenerated guard follows the guard contract of the generator I was
  given (v0.5.0), not the target's own generator template (v0.2.0). If Q2 is answered (a), the guard's shape may need
  to follow docs-first Phase 2 instead.
- **The intent-change rule is copied, not linked:** this snapshot has no `skills/entropy-assessment/intent-change-rule.md`.
- **Judgment call:** whether the new TODO.md "Current state" (17 lines) is short enough for a fresh session.
- **Feedback on the skills that ran:** in `feedback.md`.
