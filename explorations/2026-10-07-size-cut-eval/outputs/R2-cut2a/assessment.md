# Entropy assessment: entropy-guard snapshot `447da9a`

- **Target:** `.../scratchpad/eval/targets/entropy-guard-447da9a`, an older copy of the entropy-guard repository,
  read-only, with no `.git`. Line numbers below refer to that snapshot.
- **Assessed:** 2026-10-07, with the entropy-guard skills in `tool-cut2` (entropy-assessment v0.8.0,
  docs-first-planning-assessment v0.3.0, session-coherence-skill-generator v0.4.0, guards-integrator v0.4.0).
- **Route:** `entropy-assessment` Step 1 (intent pass) → Step 2 shape **A, docs-first planning** →
  `docs-first-planning-assessment` Steps 1-7 → `session-coherence-skill-generator` in plan mode (refine the existing
  guard) → `guards-integrator`.
- **Mode:** plan / suggest-only. The target is read-only, so every change is a patch or a file in this folder, not an
  edit. No steward was available; questions are in `questions.md`, each with a recommended answer.

Outputs in this folder: this assessment (one findings list, F1-F16); `questions.md`; `guard/SKILL.md` (the refined
guard); `integration.md`; three patches that apply in order to the snapshot (`cleanup.patch`, `state-update.patch`,
`integration.patch`); `feedback.md` (notes on the entropy-guard skills themselves); `read-log.md`.

---

## 1. Intent

### Steward

Nothing in the repo names one (F1). The evidence points to **Justin Philpott**: he gives the scope direction in
`explorations/2026-03-24-entropy-immune-system-conversation.md` line 713, the feedback helper files issues on
`justinphilpott/entropy-guard`, and AGENTS.md line 68 credits his `seed` scaffold. Used provisionally, pending Q1.

### Authorised intent, with the source of each part

Authority evidence is given for each: only one source in the snapshot is both attributed to the steward and dated.

| # | Intent | Source | Kind; authority |
|---|---|---|---|
| I1 | The repo is for practical entropy protection: assessment, guard generation and refinement, integration, and validation of those on real projects. | Steward, 2026-03-24, conversation line 713: "I want to preserve the entropy-guard project and really farm this new evolution off into its own repo"; DECISIONS.md lines 23-27 ("Farm broader…"); INTENT.md line 126 | Directive; attributed and dated (the conversation); the decision entry is neither |
| I2 | Broader theory (entropic immunity, autopoiesis, JIT guard processes, layered steering) lives in the sibling `entropy-immune-system` repo. | Same three sources; README.md line 7; AGENTS.md line 34. The conversation's line 22 names "JIT guard processes" as part of "the next evolution" he farms off | As I1 |
| I3 | `entropy-assessment` is the single front door and routes; `docs-first-planning-assessment` is the deepest path; the current-state packet is its output; `guards-integrator` stays separate. | DECISIONS.md lines 15-19 ("Specialize first…"); INTENT.md line 5 (revised 2026-04-07) and lines 69-73 | Decision; neither attributed nor dated. INTENT revision dated, not attributed |
| I4 | The next phase is external validation on a batch of docs-first planning repos. | INTENT.md lines 129-135; README.md line 125; TODO.md lines 11-13 | Description and state; the success measure is contested (F4, Q3) |
| I5 | Guards are delta-scoped, low burden (2-10 minutes), not blockers, and mapped to an enforcement depth; the project applies them to itself. | INTENT.md lines 59-65, 98-118 | Description in the north star; undated per line |
| I6 | The meta-skill is the product; keep only a few exemplary guards. | DECISIONS.md lines 121-125 | Decision; neither |
| I7 | Guards need an adoption path; judgment guards mature from manual to a non-blocking reminder. | DECISIONS.md lines 31-35, 87-91, 95-99 | Decision; neither |
| I8 | The repo stays markdown-first with no runtime. | AGENTS.md line 31 | Standing instruction; neither |

### Declared, enacted, authorised

- **Declared:** I1-I8, from README.md, INTENT.md and AGENTS.md.
- **Enacted:** no commit history was available, so enactment is read from dated artifacts only. The newest is
  `session-coherence-skill-generator` (metadata 2026-05-10, last updated 2026-05-11) and the DECISIONS.md entry above
  all others, which gave it a bootstrap mode. No validation-batch results are recorded in the repo.
- **Authorised:** I1 and I2 by the steward's own recorded words. Everything else rests on unattributed decision
  entries and an unattributed INTENT.md revision.

### Gaps by condition

| Condition | Gap | Response |
|---|---|---|
| Missing | No steward named (F1). | Q1 |
| Missing | No decision says which skill writes guards, or introduces `session-coherence-skill-generator` (F5). | Q4 |
| Missing | Decision entries carry no date or decider, so precedence is unrecoverable where an entry does not say what it supersedes (F9). | Guard asks for date and decider on new entries; no backfilling by guesswork |
| Conflict | Validation measure: merged PRs (DECISIONS.md line 26) or session clarity (INTENT.md line 135) (F4). | Q3 |
| Conflict | INTENT.md lines 3 and 139, AGENTS.md lines 27 and 32, and the guard's check 3 let anyone edit the north star to match the work; the intent-change rule the generator must embed forbids it (F2). | Q2. All patches leave those lines unchanged |
| Ambiguous | "what the generator produces" (README.md line 78), "the guard generators" (guard line 3): which generator (F5). | Folded into Q4 |
| Stale description | `guards-integrator` expects `entropy-assessment` to generate guards (F6); four decision entries describe removed structure (F9); the guard's references (F12); a missing skill (F14). | Corrected in `cleanup.patch` or the refined guard, citing DECISIONS.md "Specialize first…" |
| Unauthorised drift | None found that no decision covers. The generator's arrival is unrecorded, but DECISIONS.md lines 7-11 accept it implicitly (F5). Caveat: no commit history was read. | None |
| Prose control | "non-negotiable" and "mandatory" guard runs, backed by an opt-in reminder that exits 0 (F11). | `integration.md` adoption checks |

Paths for unauthorised drift in existing guard repair instructions, read against the intent-change rule: F2 (old
check 3, "update it with a dated note") and F3 (old check 5, "update both"; old check 6, "Update if not").

### Questions and proposed changes

Four questions, Q1-Q4, in `questions.md`. They are recorded as proposals, marked "Not decisions", in the target's
DECISIONS.md by `state-update.patch`; INTENT.md is not edited.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active** as of the snapshot. Evidence: README.md line 5 ("actively used, actively refined"), line 119
  ("Actively evolving"), TODO.md Next Up, newest in-file date 2026-05-11. Its state on 2026-10-07 is not observable
  from a snapshot.
- **Shape: A, docs-first planning.** Evidence: AGENTS.md line 31 (markdown-first, no runtime); 17 markdown files and
  one 9-line shell hook; DECISIONS.md, TODO.md and AGENTS.md carry state; work runs in repeated human and agent
  sessions (AGENTS.md line 22; transcripts with Claude Sonnet 4.6 and OpenCode gpt-5.4 in `explorations/`).
  **D, workflow-heavy** also fits, because the repo exports a way of working (DECISIONS.md lines 57-59). A was taken
  because the top risks below are docs-to-docs, and the docs-first matrix covers workflow drift too.
- **Repositories: one.** The sibling `../entropy-immune-system/` (AGENTS.md line 15) is a separate system that took
  the broader theory (I2), not a repository that manages this one's work; it was not read. GitHub issues on
  `justinphilpott/entropy-guard` are an inbound feedback queue (DECISIONS.md line 17 cites #9-#12); not read.

---

## 3. Findings

One list. Other sections and files refer to these ids.

- **F1. No steward is named.** No file says who decides intent. LICENSE line 3: "Copyright (c) 2026 entropy-guard".
  Source: intent pass. → Q1.
- **F2. Intent documents and the guard invite editing intent to match the work.** INTENT.md line 3 ("meant to be
  refined collaboratively — by humans and AI agents … When you update it, note the date"); line 139 ("If you find
  something missing, imprecise, or worth expanding — add it"); AGENTS.md line 27 ("If a decision refines or challenges
  the intent, update INTENT.md and note why"); line 32 ("Prefer updating the core knowledge docs (`README.md`,
  `INTENT.md`, …) in the same change when behavior or methodology shifts"); guard line 68 ("if INTENT.md itself
  needs revision, update it with a dated note"). Effect seen: INTENT.md line 5 records a revision with a date and no
  author. Source: intent pass, read against the intent-change rule. → Q2.
- **F3. Guard repair instructions keep copies in step.** Guard line 88: "Did you change something that another doc
  also describes? If so, update both." Line 99: "is this reflected in AGENTS.md (Key Files section), README.md (Key
  Documents table), and any other docs that list project structure? Update if not." Line 87 already has the better
  rule (one canonical home). Source: intent pass.
- **F4. The validation batch has two success measures.** DECISIONS.md line 26: "track whether that produces more
  merged PRs". INTENT.md line 135: "clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and
  sharper feedback". README.md line 125 follows INTENT.md. Neither attributed. Source: intent pass. → Q3.
- **F5. Two skills write guards, and nothing says which owns it.** `docs-first-planning-assessment` Phase 2 (lines
  132-202, its own checklist) and `session-coherence-skill-generator` (lines 198-315, its own template). The
  generator is referenced by no other skill (search: only README.md line 91, AGENTS.md line 46, DECISIONS.md lines
  9-10). INTENT.md line 88 gives the generator role to the assessment skills and omits it. No decision introduces it.
  README.md line 78 and guard line 3 call the local guard an example of "the generator" or "the guard generators".
  Source: docs-first Step 2 (product artifacts are contracts). → Q4.
- **F6. `guards-integrator` expects a hand-off that no longer exists.** Line 20: "After `entropy-assessment`
  generates one or more guards"; line 221: "If the assessment skill generated the guards in the same session".
  `entropy-assessment` v0.6.0 only routes (its lines 66-71), per DECISIONS.md line 18. Source: docs-first Step 2.
  → `cleanup.patch`.
- **F7. Imported residue in the generator.** `session-coherence-skill-generator` lines 22 and 193 name "FlowBook",
  defined nowhere in the repo. Its metadata (`generated`, `last_updated`, `skill_version`) differs from every other
  skill's `metadata.version`. Source: docs-first Step 4 (superseded or imported material). → FlowBook in
  `cleanup.patch`; the metadata format is left for the Q4 reconciliation.
- **F8. Farmed-off theory sits undemoted beside live truth.** `explorations/` holds 4 files and 17,387 of the repo's
  36,137 markdown words (48%), is indexed by neither README.md nor AGENTS.md, and DECISIONS.md line 26 says the
  sibling was "seeded with the exploration documents"; the steward chose to keep them in `explorations/` (conversation
  line 713). LEARNINGS.md lines 117-133 present JIT and four-component theory as validated ("Validated by: The
  2026-03-19 philosophical conversation") with design implications for this repo ("The mature form collapses assess →
  fix with no persistent guard artifact"), against LEARNINGS.md line 3 ("Focus on what you validated") and I1, I6, I7.
  The same theory reuses "four components" and "generator" with meanings different from INTENT.md lines 84-96.
  Source: docs-first Step 4. → `cleanup.patch` marks them historical; nothing is deleted.
- **F9. The decision log cannot show precedence.** Entries have no dates or deciders. Order is mixed: line 105 says
  the superseding entry is "below", line 131 that its superseding entry is "above". Entries at lines 39, 47, 95 and
  113 describe an `entropy-assessment` Phase 2, appendices or Step 8 that the "Specialize first…" restructure removed,
  with no supersession note; only lines 105 and 131 carry one. Source: intent pass and docs-first Step 4. → notes in
  `cleanup.patch`; dates and deciders asked for by the guard.
- **F10. State is spread and undated.** The next step appears in TODO.md lines 11-13, README.md line 125, INTENT.md
  lines 129-135 and DECISIONS.md line 26, with different details (F4). TODO.md has no stage, no check dates, nothing
  saying when it goes stale, and nothing about the newest work (the generator's bootstrap mode). No session-start step
  orients a fresh session, although LEARNINGS.md lines 7-13 says docs-first repos need one and INTENT.md line 118 says
  the project applies its methods to itself. Source: docs-first Steps 3-5. → `state-update.patch`.
- **F11. A rule worded as enforced, backed by a reminder.** AGENTS.md line 19 ("This is non-negotiable"), line 41
  ("mandatory pre-commit ritual"), README.md line 78 ("runs its own entropy guard before every commit").
  `.githooks/pre-commit` prints a reminder and exits 0, and runs only after a manual per-clone symlink (AGENTS.md line
  19, README.md line 140). Non-blocking is deliberate (DECISIONS.md lines 31-35); the gap is that nothing shows the
  guard ran. The commit-message note (README.md line 138) could not be checked without history. Source: intent pass
  (prose control). → `integration.md`.
- **F12. The existing guard's references are stale.** `doc-health-check` (lines 33, 137) does not exist (TODO.md line
  20 tracks it); "README.md (Key Documents table)" (line 99): README.md has no such table; "20+ markdown files" (line
  92): there are 17; "Last evaluated: 2026-04-07" (line 21) predates the generator. Source: docs-first Step 7. → the
  refined guard.
- **F13. Seed scaffold residue.** AGENTS.md line 21: "Working code with tests beats perfect code in progress", in a repo
  with no code or tests (AGENTS.md lines 31, 51, 57). `.gitignore` lines 17-25 (Go) and `.editorconfig` (Python, Go,
  Makefile) are harmless and left. Source: docs-first Step 4. → AGENTS.md line in `cleanup.patch`.
- **F14. A learning names a skill that is not here.** LEARNINGS.md line 63: "Led to the distill-article skill."
  DECISIONS.md lines 139-143 put articles in the separate `writing` repo. → `cleanup.patch`.
- **F15. Sessions can change external state.** `skills/local/entropy-guard-feedback/SKILL.md` lines 44-51 run
  `gh issue create` on a public repository; nothing records which issues a session filed. No spend. Source: generator
  inputs. → the guard's "What changed this session".
- **F16. Two stable invariants are checkable now, and nothing checks them.** Relative markdown links resolve, and each
  skill's frontmatter `name` matches its folder (DECISIONS.md lines 79-83). Run on the snapshot: 0 broken links
  outside `explorations/`, 6 of 6 names match. Both commands caught a planted broken link and a planted renamed
  `name:` in a scratch copy. Source: docs-first matrix (brittle automation: automate only stable invariants). → guard
  commands; `integration.md` Next.

---

## 4. Truth map

| Concept | Canonical home | Also stated in | State |
|---|---|---|---|
| Purpose and scope | INTENT.md | README.md lines 3-7, 119-127; AGENTS.md lines 3, 34 | Summaries agree; who may change it is open (F2, Q2) |
| Entropy model, enforcement depth | INTENT.md lines 9-109 | `guards-integrator` Step 3, docs-first Step 8 | Exported skills restate it to stand alone outside the repo: acceptable |
| Decisions | DECISIONS.md | INTENT.md lifecycle; LEARNINGS.md implications | Precedence unclear (F9) |
| Learnings | LEARNINGS.md | none | Holds unvalidated theory (F8) |
| Next steps and state | TODO.md | README.md "Project status", INTENT.md "Scope boundary…", DECISIONS.md line 26 | Diverging (F4, F10) |
| Working practice | AGENTS.md | README.md "Contributing" (summary); hook text; guard check 4 | Agree |
| Skill catalogue | each skill's `description` | README.md "What's here"; AGENTS.md "Key Files"; INTENT.md lifecycle | INTENT.md omits the generator (F5) |
| Who writes guards | none | docs-first Phase 2; generator; `guards-integrator` line 20 | Conflict (F5, F6, Q4) |
| Broader theory | sibling repo (I2) | `explorations/`; PHILOSOPHY.md lines 41-126; LEARNINGS.md lines 117-143 | Undemoted (F8). PHILOSOPHY.md is a free space by DECISIONS.md line 142: fine |
| Steward | none | none | Missing (F1) |

Document roles: **canonical** INTENT.md, DECISIONS.md, AGENTS.md, LEARNINGS.md; **current state** TODO.md;
**product artifacts** the four exportable skills and the two local skills; **summary** README.md; **free space**
PHILOSOPHY.md; **historical or imported** `explorations/`, the FlowBook residue, and the decision entries in F9.

## 5. Loop map (documented; the real loop could not be observed without history)

- **Start:** an agent loads AGENTS.md (no CLAUDE.md or other vendor file exists) and reads TODO.md for active work
  (README.md line 135); it writes "Doing Now" first (AGENTS.md line 22). Nothing else orients the session (F10).
- **Inputs:** steward direction in conversation, sometimes in plan mode first (conversation line 681), and GitHub
  issues filed by agents using the skills elsewhere (DECISIONS.md line 17).
- **Capture:** decisions and learnings at guard time (old checks 1-2).
- **Pause:** the local guard before commit; the hook reminds if a clone enabled it (F11).
- **Handoff:** a commit with a note of what the guard found (README.md line 138). Pull requests are used at least
  sometimes (LEARNINGS.md line 152). No CI and no PR template.

## 6. Risks, ranked

| Rank | Risk | Findings | Decay | Recovery cost | Anchor for the fix |
|---|---|---|---|---|---|
| R1 | Intent drifts through sanctioned edits to the north star | F1, F2, F3, F9 | Slow | High: INTENT.md line 33 calls intent loss "catastrophic to recover" | Steward decisions in DECISIONS.md (Q1, Q2) |
| R2 | Parallel truth in the product's skill hand-offs | F5, F6, F12 | Fast: every skill edit | Medium-high: the skills are exported, so a broken hand-off ships to other repos | One decision on the guard writer (Q4); skill `description`s |
| R3 | Superseded theory and entries beside live truth | F8, F9, F7 | Slow | Medium: a fresh session can revive "no persistent guards" | DECISIONS.md "Farm broader…"; steward, 2026-03-24 |
| R4 | State spread across four files, undated | F10, F4 | Fast | Cheap if caught within one iteration | TODO.md |
| R5 | Workflow claimed as enforced, with no record it ran | F11, F13, F16 | Medium | Cheap | AGENTS.md; `.githooks/pre-commit` |

## 7. Recommendations

- **Mark historical, now:** `explorations/` (a README.md row), the two LEARNINGS.md theory entries, and four decision
  entries (F8, F9). In `cleanup.patch`. Nothing is deleted: the steward chose to keep `explorations/`.
- **Correct, now:** `guards-integrator`'s hand-off naming both current writers (F6), FlowBook (F7), the seed line
  (F13), the distill-article line (F14). In `cleanup.patch`.
- **Consolidate, after Q4:** one guard writer, with docs-first supplying its checks; then README.md "How to use this
  repo", `guards-integrator` line 20, the generator's metadata format, and INTENT.md's lifecycle through a proposal.
  Tracked in TODO.md by `state-update.patch`.
- **After Q2:** align INTENT.md lines 3 and 139 and AGENTS.md lines 27 and 32 with the answer.
- **After Q3:** record the chosen measure against each validation-batch repo.
- **Leave:** LEARNINGS.md lines 137-143 (layer hierarchy): it came from the same conversation, but checking purpose
  against intent is arguably this repo's practical work, so it was not demoted (see Uncertainties).

## 8. One-time cleanup, each verified against the snapshot

| Item | File and line checked | Finding |
|---|---|---|
| Name both current guard writers in the trigger and the closing note | `skills/guards-integrator/SKILL.md` 20, 221 | F6 |
| Remove "FlowBook" | `skills/session-coherence-skill-generator/SKILL.md` 22-23, 193-194 | F7 |
| Add a historical status line to the JIT and four-component entries | LEARNINGS.md 123, 133 | F8 |
| Index `explorations/` as historical | README.md 107 | F8 |
| Add supersession notes, after confirming `entropy-assessment` v0.6.0 has Steps 1-4 only, workflow/process in Step 4a, and no Phase 2, appendices or Step 8 | DECISIONS.md 39, 47, 95, 113 | F9 |
| Note that distill-article is not here | LEARNINGS.md 63 | F14 |
| Replace the code-and-tests line | AGENTS.md 21 | F13 |

All three patches were applied in order to a scratch git copy of the snapshot, with the refined guard copied in;
`git diff --check` was clean.

## 9. State-file update

`state-update.patch` adds a "Current state" section to TODO.md, the existing state file, rather than a new file:
stage, what to read first, settled decisions with links, open proposals and the work waiting on them, misleading
material nearby, three next actions, the check date and what makes it stale. It also records Q1-Q4 in DECISIONS.md
as "Proposed, awaiting the steward". In build mode, "Doing Now" would have held this session's work and start commit
and been cleared before commit; the patch shows the state after the session.

---

## 10. Is a guard needed?

Yes: the repo is active and already runs a guard. Most of the guard is sound, but three things need fixing: its
repair instructions open intent to drift (F2, F3), its references are stale (F12), and it has no baseline or
mechanical checks (F16). Decision: **refine the existing guard in place** through `session-coherence-skill-generator`.

### Guard surfaces

| Surface | Verdict | Why |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | Amend: replace with `guard/SKILL.md` | F2, F3, F12, F16 |
| AGENTS.md "Working Practices" | Amend line 22, the start commit (`integration.patch`); keep line 19; leave line 27 for Q2 | Guard baseline; F11; F2 |
| `.githooks/pre-commit` | Keep; add mechanical warnings in Next | F16 |
| TODO.md | Amend (`state-update.patch`) | F10 |
| DECISIONS.md | Amend (supersession notes; proposals) | F9; Q1-Q4 |
| README.md "Contributing" | Keep | Summary of AGENTS.md |
| Feedback checks in the exported skills, and `entropy-guard-feedback` | Keep | Working as designed |

## 11. Generator report

- **Inputs supplied:** the intent section; the truth and loop maps; F1-F16; the guard surfaces. Steward: Justin
  Philpott (provisional, Q1). Intent documents: INTENT.md, README.md "Project status", AGENTS.md "Project Constraints",
  and the DECISIONS.md scope decisions. State file: TODO.md, refreshed by whoever changes a skill, a decision or the
  plan. Rules owned elsewhere: the agentskills.io format (DECISIONS.md lines 79-83); no user-wide instructions file,
  spending policy or merge rule appears in the snapshot. Verification commands: none in the repo, none automatic.
  Code areas: none; the product artifacts are the six skills, described in README.md "What's here", AGENTS.md "Key
  Files" and INTENT.md's lifecycle. Live state: GitHub issues (F15); no spend.
- **Guard:** `skills/local/entropy-guard/SKILL.md`, updated in place; drafted at `guard/SKILL.md`. The name stays
  `entropy-guard`, not the template's `session-coherence-guard`, because DECISIONS.md lines 79-83 require `name` to
  match the folder.
- **Size:** 957 words installed, plus a 47-word provisional comment to delete on install (1,004 as drafted; v0.2.3 was
  1,400). J = 9. S = 104 words (67 under "Where things live", plus 37 in the session-start and GitHub-issue lines). C
  = 88. Budget: 450 + 36 × 9 + 104 + 88 = 966. Within budget. Counting the two repo-specific lines as S is this run's
  call; without it the budget is 929, and the guard is 28 words over.
- **What changed from v0.2.3:**
  - Old checks 1, 2, 4 and 9 kept as the decision, learning, workflow and state checks.
  - Old check 3's repair instruction replaced by the intent-change rule (Q2); its skill-vs-INTENT questions kept.
  - Old check 5's "update both" replaced by one owner per truth (F3).
  - Old checks 6 and 7 folded into the hand-off and old-name checks.
  - Old check 8 (stale placeholders) dropped. Nothing in the snapshot showed placeholder drift beyond
    `doc-health-check`, which TODO.md already tracks.
  - Rationale paragraphs and the system-snapshot metadata dropped: the contract keeps current state in TODO.md.
- **Review before handover:**
  - Each patch's header names the open questions it touches, and none settles one.
  - No repair instruction edits an intent document to match the work.
  - The size is within budget.
- **Operator docs:** the guard's path is unchanged and already appears in AGENTS.md lines 19 and 41 and README.md
  lines 78, 97 and 137, so no new references were added.
- **Validation:** with no `.git`, the checks were run in a scratch git copy with all patches and the guard applied:
  - `git diff --check` was clean.
  - The link check found 0 broken links, and the name check found 6 of 6 names matching.
  - Planted faults were each caught: a broken link, a renamed `name:` and trailing whitespace.
- **Open questions the guard leaves visible:** Q1 (its steward line), Q2 (its Intent section), Q4 (it says "the guard
  writer" and names neither skill).
- **Handoff:** `integration.md`.

### Files build mode would change

`skills/local/entropy-guard/SKILL.md` (replaced), AGENTS.md, TODO.md, DECISIONS.md, LEARNINGS.md, README.md,
`skills/guards-integrator/SKILL.md`, `skills/session-coherence-skill-generator/SKILL.md`. Nothing else.

---

## 12. Next step

The steward answers Q1-Q4 (`questions.md`). `cleanup.patch` and `state-update.patch` depend on no answer and can be
applied now; `integration.patch` and the guard wait for Q1 and Q2.

## 13. Uncertainties and what was not covered

- **No git history.** Enacted intent comes from dated artifacts only. The real loop, whether commit messages carry
  guard notes, whether the hook is enabled, and the upstream branch name (`origin/main` is assumed in the guard) are
  all unverified.
- **Read in part:** `explorations/`. Frontmatter and headings of all four files were read, plus lines 1-30 and
  675-740 of the 2026-03-24 conversation; the full 8,306-word conversation and the 5,962-word autopoiesis transcript
  were not. Every other file in the snapshot was read in full.
- **Not read (out of scope for this run):** the sibling repo, the GitHub issues, and the size review cited by the
  generator's Size section.
- **Snapshot age:** the newest in-file date is 2026-05-11. The steward may have moved on any question since.
- **LEARNINGS.md lines 137-143:** whether the layer-hierarchy entry is farmed-off theory or current direction is not
  settled by the evidence, so it was left unmarked.
- **Agent harnesses:** whether Claude Code and OpenCode sessions here load AGENTS.md automatically was not checked.
