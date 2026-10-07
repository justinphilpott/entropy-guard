# Entropy assessment: entropy-guard (snapshot `entropy-guard-447da9a`)

- **Date:** 2026-10-07
- **Target:** `scratchpad/eval/targets/entropy-guard-447da9a`, a read-only snapshot with no `.git`.
- **Assessor:** an agent following the entropy-guard skills in `eval2/tool-cut2`.
- **Steward:** absent. Questions and recommended answers are in `questions.md`.
- **Mode:** the target could not be edited, so every change is delivered as an applicable patch or as a draft.

## Route taken

1. `entropy-assessment`, Step 1: the intent pass (`intent-pass.md`, `intent-change-rule.md`).
2. `entropy-assessment`, Step 2: lifecycle status, then Shape A (docs-first planning).
3. `docs-first-planning-assessment`, Steps 1 to 7.
4. `session-coherence-skill-generator`: refine the existing guard in place, in plan mode.
5. `guards-integrator` (`integration.md`).

Files produced alongside this one:

- `guard/SKILL.md`: the refined guard;
- `state-file.patch`: the `TODO.md` update;
- `decisions.patch`: the proposals awaiting the steward, and the supersession notes;
- `cleanup.patch`: one-time corrections that settle no open question;
- `questions.md`, `integration.md`, `feedback.md`, `read-log.md`.

All three patches apply cleanly to copies of the target (`patch --dry-run -p1`, checked 2026-10-07).

---

## Intent

### Steward

The steward is **Justin Philpott**. No core document names him (F1), so this rests on the following evidence:

- His own recorded words set this repo's scope. On 2026-03-24 he said: "let's keep them in explorations, as I want to
  preserve the entropy-guard project and really farm this new evolution off into its own repo"
  (`explorations/2026-03-24-entropy-immune-system-conversation.md:713`; see also :86 and :125).
- The repo's GitHub home is `justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md:10`).

### Authorised intent, with the source of each part

None of the 17 entries in `DECISIONS.md` carries a date or an attribution (F2). They are recorded as decisions, with
that uncertainty kept visible. Each part of the authorised intent, and where it comes from:

- **Purpose.** Practical entropy protection: assessment, guard generation and refinement, integration, and validation
  on real projects. Broader theory lives in the sibling repo `entropy-immune-system`. Sources: `DECISIONS.md:23-27`
  ("Farm..."), which matches the steward's dated words above; `INTENT.md:124-127`; `AGENTS.md:34`.
- **Entry and depth.** `entropy-assessment` is the single front door and router. `docs-first-planning-assessment` is
  the deepest path, and docs-first repos come first. Source: `DECISIONS.md:15-19`.
- **Guard character.** Guards are delta-scoped, low burden (2 to 10 minutes) and not blockers. Judgment stays in
  skills, and mechanics go deeper. Source: `INTENT.md:47-109`, a description of authority unknown, revised 2026-04-07.
  This is reinforced by decisions: maturity from external to prompted (`DECISIONS.md:31-35`), one local guard
  (`:55-59`), guards carrying their integration (`:87-91`), the meta-skill as the product with few exemplar guards
  (`:121-125`).
- **Structure.** Exportable skills live in `skills/` and local ones in `skills/local/` (`DECISIONS.md:71-75`). Skills
  use the agentskills.io format (`:79-83`). `LEARNINGS.md` stays tactical (`:139-143`). The generator gets a bootstrap
  mode (`:7-11`).
- **Self-application.** The project applies its own guards to itself (`INTENT.md:118`).

### Three readings

- **Declared.** `INTENT.md`, `README.md` and `TODO.md` say the next phase is an external validation batch on
  docs-first planning repos.
- **Enacted.** There is no commit history in the snapshot, so this is read from dated artifacts only:
  - the newest dated work is `session-coherence-skill-generator`, with metadata dated 2026-05-10 and 2026-05-11;
  - `INTENT.md` was last revised 2026-04-07, and the local guard was last evaluated 2026-04-07;
  - no validation-batch results exist in the repo.
- **Authorised.** As listed above. The generator work is covered by a recorded decision (`DECISIONS.md:7-11`), so it is
  not unauthorised drift. What the generator is for, relative to the docs-first assessment, is undecided (F6).

### Gaps, by condition

The evidence for each is in the findings list below.

- **Stale description:** F7 and F9. Each is corrected from `DECISIONS.md:15-19`, citing it.
- **Conflict:** F3 (collaborative editing of `INTENT.md` against the steward's "question intent is rare"), which is
  Q1. F5 (the validation measure), which is Q2.
- **Missing:** F1 (steward unnamed), settled by evidence. F2 (undated, unattributed decisions). F6 (which skill
  writes guards), which is Q3.
- **Ambiguous:** F11 (just-in-time "no persistent guard" against persistent guard files). Evidence settles it: every
  later decision builds persistent guards (`DECISIONS.md:10`, `:58`, `:90`). F15 (which tracker holds the work).
- **Unauthorised drift:** F18. A requirement that `DECISIONS.md:42` imposed was dropped in a restructure, and no
  decision covers that. The fix is to the work.
- **Prose control:** F12 and F13.
- **Paths for unauthorised drift in existing repair instructions:** F3 and F4.

### Questions for the steward

The full form of each is in `questions.md`.

- **Q1.** Who may change `INTENT.md`? Recommended: proposal first. The guard's Intent section depends on this.
- **Q2.** What does the validation batch measure? Recommended: the `INTENT.md:135` measures, plus accepted changes
  wherever a repo has a PR flow.
- **Q3.** Which skill writes guards? Recommended: `session-coherence-skill-generator` only.

### Proposed changes, and where they are recorded

The three proposals are written into `DECISIONS.md` by `decisions.patch`, each marked "awaiting steward, not in force".
No intent document is changed by any patch.

---

## Lifecycle, shape and repositories

- **Lifecycle: active.** `README.md:5` says "actively used, actively refined", and `README.md:121` says "Actively
  evolving". `TODO.md` "Next Up" has three open items. The newest dated artifact is from 2026-05-11. When the last
  commit was made cannot be seen.
- **Shape: A, docs-first planning.**
  - Markdown is the only artifact, and the skills are markdown too.
  - `DECISIONS.md`, `TODO.md` and `AGENTS.md` carry the state.
  - Work happens in repeated agent sessions: the transcripts in `explorations/` show Claude and OpenCode sessions.
  - The repo describes itself as "documentation-as-system" (`DECISIONS.md:57`).
  - D (workflow-heavy) also fits, because the repo exports a way of working and runs a pre-commit ritual. A was taken
    as the riskier, because the top risks are docs-to-docs drift and intent drift. Workflow is covered by the loop map
    and by R4.
- **Repositories:** one. The sibling repo `entropy-immune-system` is a separate project, not part of this system's
  work, and was not available. GitHub issues on `justinphilpott/entropy-guard` are a second place where work is
  tracked, outside the repo, and were not inspected (F15).

## Planning horizon

- **Settled:**
  - the router and the docs-first path;
  - theory farmed out to the sibling repo;
  - one local guard;
  - the external-to-prompted maturity path;
  - the `skills/` and `skills/local/` split;
  - the agentskills.io format.
- **Active:**
  - the validation batch (declared);
  - `session-coherence-skill-generator` (the newest work).
- **Exploratory:**
  - the guard runner and the evaluator (`INTENT.md:86-96`, `TODO.md:18`);
  - multi-domain validation (`TODO.md:17`);
  - meaning-layer checks (`LEARNINGS.md:137-143`);
  - just-in-time generation, now the sibling repo's subject.

## Truth map

| Concept | Canonical home | Also stated in | State |
|---|---|---|---|
| Purpose and scope | `INTENT.md`, with `DECISIONS.md` "Farm..." and "Specialize..." | `README.md` "Project status", `AGENTS.md` "Project Constraints" | Summaries agree, apart from the validation loop |
| Validation loop and its measure | none | `INTENT.md:122-135`, `README.md:121-125`, `TODO.md:11-13`, `DECISIONS.md:26` | Parallel truth, already diverged (F5) |
| Entropy model: dimensions, enforcement depth, inter-domain drift | `INTENT.md` | `README.md` links to it; `guards-integrator` Step 3 elaborates depth locally | Sound |
| Skill roles and the guard lifecycle | `INTENT.md` "four distinct tools" | `README.md` skill tables, `AGENTS.md` Key Files, `DECISIONS.md`, each skill's description | Diverged (F6, F7) |
| Skill contracts: inputs, outputs, handoffs | each `SKILL.md`, a product artifact | the skills that hand to it | One stale handoff (F7) |
| Working practices | `AGENTS.md` | `README.md` "Contributing" (a summary), `.githooks/pre-commit`, guard check 4 | Sound |
| Decisions | `DECISIONS.md` | none | Undated (F2); supersession incomplete (F9) |
| Learnings | `LEARNINGS.md` | `PHILOSOPHY.md` repeats its theory entries | Theory sits in a tactical log (F11) |
| Current state | `TODO.md` | GitHub issues, outside the repo | Thin and split (F15) |
| The local guard | `skills/local/entropy-guard/SKILL.md` | `README.md`, `AGENTS.md`, the hook | Sound pointers |

Each main document's role:

- **Canonical:** `INTENT.md`, `DECISIONS.md`, `AGENTS.md` (for practice), `LEARNINGS.md`. `README.md` is canonical
  for how to use the repo and is a summary everywhere else.
- **Current state:** `TODO.md`.
- **Product artifacts:**
  - the four exported skills;
  - the two local skills;
  - `.githooks/pre-commit`.
- **Historical or imported:**
  - `explorations/`: 4 files, 17,387 words, which seeded the sibling repo (F10);
  - `PHILOSOPHY.md`, a free reflection space;
  - the superseded entries in `DECISIONS.md` (F9);
  - the FlowBook residue in `session-coherence-skill-generator` (F8).
- **Scaffold residue:** `.gitignore`, `.editorconfig`, `AGENTS.md:21` (F16).

## Loop map

This is the documented loop. No commit history was available to show the real one.

1. A fresh session reads `AGENTS.md`, then writes its task into `TODO.md` "Doing Now" (`AGENTS.md:22`).
2. The work is done. Decisions and learnings are meant to be captured at guard time.
3. Before committing, the contributor runs `skills/local/entropy-guard/SKILL.md`. The non-blocking
   `.githooks/pre-commit` reminds them, if it was enabled by symlink.
4. The commit message carries "entropy check clean" or what the guard changed, and "Doing Now" is cleared.
5. The handoff is the commit. Pull requests are used sometimes (`LEARNINGS.md:152`).
6. Upstream feedback goes to GitHub issues.

The transcripts show sessions that ran in plan mode and asked the steward before writing. The 2026-03-24 session
ends without mentioning the guard
(`explorations/2026-03-24-entropy-immune-system-conversation.md:700-745`), which is weak evidence that the guard is
not always run.

---

## Findings

This is the one findings list. Other sections and files refer to these ids.

- **F1. No core document names the steward.**
  - Evidence: `README.md`, `INTENT.md`, `AGENTS.md` and `DECISIONS.md` name no one. `LICENSE:3` says "Copyright (c)
    2026 entropy-guard".
  - The evidence that settles it is in the Intent section above: Justin Philpott.
  - Condition: missing. Proposed fix: name the steward in `AGENTS.md`. That is a proposal, not patched.
- **F2. The decisions carry no date or attribution, and their order is inconsistent.**
  - Evidence: none of the 17 entries in `DECISIONS.md` has either.
  - The order is mostly newest first, but `DECISIONS.md:105` points "below" to the entry that supersedes it, while
    `:131` points "above".
  - Condition: missing. The refined guard's check 1 asks for a date and a decider on new entries. That is a proposal
    embedded in the guard, and the steward may strike it.
- **F3. Five instructions let intent be edited to match the work.**
  - `INTENT.md:3`: "refined collaboratively — by humans and AI agents... When you update it, note the date".
  - `INTENT.md:139`: "add it".
  - `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
  - `AGENTS.md:32`: "Prefer updating the core knowledge docs (`README.md`, `INTENT.md`, ...) in the same change".
  - `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated note".
  - Measured against the intent-change rule, each one is a path for unauthorised drift.
  - Condition: conflict with the steward's "the 'question intent' signal is actually rare" (conversation, line 543).
    This is Q1. The text is left unchanged.
- **F4. The current guard says "update both".**
  - Evidence: `skills/local/entropy-guard/SKILL.md:88`: "Did you change something that another doc also describes?
    If so, update both."
  - That keeps two copies of one truth alive. It is replaced in the refined guard by check 5.
- **F5. Two measures of the validation loop disagree, and four files state the loop.**
  - `DECISIONS.md:26` measures "more merged PRs" on "open source projects".
  - `INTENT.md:131-135`, `README.md:125` and `TODO.md:11-13` measure session recovery and fewer reintroduced stale
    ideas, on docs-first repos.
  - `DECISIONS.md:18` settles which repos, not the measure.
  - Condition: conflict, which is Q2. It is also parallel truth (R2).
- **F6. Two skills write guards, and no decision sets their roles.**
  - `docs-first-planning-assessment` Phase 2 (`:132-202`) writes guards, and so does `session-coherence-skill-generator`.
  - `INTENT.md:86-88` gives the generator role to the assessment workflow and never mentions
    `session-coherence-skill-generator`.
  - `DECISIONS.md:7-11` extends the generator without placing it.
  - Condition: missing, which is Q3.
- **F7. `guards-integrator` hands off to the wrong skill.**
  - `skills/guards-integrator/SKILL.md:20`: "After `entropy-assessment` generates one or more guards". Also `:221` and
    `:227`.
  - `entropy-assessment` no longer generates guards (`DECISIONS.md:18`; `skills/entropy-assessment/SKILL.md:12`).
  - Condition: stale description. Corrected in `cleanup.patch` with wording that names no generator, so Q3 is left
    open.
- **F8. `session-coherence-skill-generator` carries vocabulary from another project.**
  - Evidence: "FlowBook" at `skills/session-coherence-skill-generator/SKILL.md:22` and `:193`.
  - Its metadata convention (`:4-13`: generated, last_updated, skill_version) differs from every other skill
    (`metadata.version`).
  - Condition: imported residue. The FlowBook lines are fixed in `cleanup.patch`. The metadata is only a
    recommendation.
- **F9. Superseded decisions are not fully marked.**
  - `DECISIONS.md:39-43`, `:47-51` and `:113-117` describe a Phase 2, Steps 5 to 8, and appendices in
    `entropy-assessment`. Version 0.6.0 of that skill has none of them, and none of these entries is marked.
  - `:131` says "partially superseded" without saying which part.
  - Condition: stale. Markers citing `DECISIONS.md:15-19` are added in `decisions.patch`.
- **F10. `explorations/` sits beside live truth without being marked as historical.**
  - It holds 4 files and 17,387 words, kept after `DECISIONS.md:26` seeded the sibling repo with them.
  - Neither `README.md` "What's here" nor `AGENTS.md` "Key Files" lists it.
  - `LEARNINGS.md:122` and `PHILOSOPHY.md:45` cite it.
  - Fixed in `cleanup.patch`, which lists the folder as historical. Whether to delete it is the steward's call; it is
    not recommended.
- **F11. Three theory entries sit in the tactical learnings log.**
  - `LEARNINGS.md:117-143` holds three entries whose only validation is "the 2026-03-19 philosophical conversation".
    That is against `LEARNINGS.md:3` ("what you validated, not just opinions") and `DECISIONS.md:139-143`.
  - `LEARNINGS.md:123` says "the mature form collapses assess → fix with no persistent guard artifact". Current
    practice keeps a guard file.
  - The same content also appears in `PHILOSOPHY.md:93-117`.
  - Recommendation for the steward: move these entries to `entropy-immune-system`, or mark them exploratory. Not
    patched.
- **F12. A ritual described as mandatory has no enforcement.**
  - `AGENTS.md:19` calls the ritual "non-negotiable", and `AGENTS.md:41` calls it a "mandatory pre-commit ritual".
  - The hook exits 0 (`.githooks/pre-commit:9`), is enabled only by a manual symlink (`README.md:140`), and nothing
    records that the guard ran beyond the commit-message convention.
  - The non-blocking design is a recorded decision (`DECISIONS.md:31-35`), and the guard's metadata describes it
    honestly (`:22`). Nothing claims the hook blocks.
  - Enforcement would sit in a commit-msg hook that looks for the guard note. That is not recommended until missed
    runs are shown.
- **F13. Nothing triggers the periodic re-evaluation.**
  - `INTENT.md:82` says "It should be run on this project periodically", and the guard says the same at `:139`.
  - The guard was last evaluated 2026-04-07 (`:21`), before `session-coherence-skill-generator` arrived
    (2026-05-10), and no re-evaluation followed.
  - Fixed in the refined guard by an event trigger in check 3.
- **F14. Two references point at skills that do not exist.**
  - `skills/local/entropy-guard/SKILL.md:33` and `:137` name `doc-health-check`, which does not exist. It is tracked,
    honestly, at `TODO.md:20`.
  - `LEARNINGS.md:63` says "Led to the distill-article skill", which is not in this repo. It may live in the writing
    repo; that was not verified.
  - The pointer is dropped in the refined guard. The `TODO.md:20` follow-up is listed in `state-file.patch`.
- **F15. The state file is thin, and the work is split with GitHub issues.**
  - `TODO.md` has no stage, no open questions, and no pointer to the GitHub issues: #9 to #12 are cited at
    `DECISIONS.md:17`, and the feedback skill files more.
  - `TODO.md:3` talks of graduating to an issue tracker "once the project has momentum", yet one is already in use.
  - Fixed in `state-file.patch`.
- **F16. Seed scaffolding residue that fits a code project.**
  - `AGENTS.md:21` says "Working code with tests beats perfect code", in a repo with no code or tests
    (`AGENTS.md:51`, `:57`).
  - `.gitignore` has a Go section, and `.editorconfig` has Python, Go and Makefile rules.
  - Low priority. Recommend pruning, and feeding it back to seed (`AGENTS.md:66-68`). Not patched.
- **F17. The current guard did not catch F7.**
  - Its only skill check is "Do skill files reference each other correctly?" (`skills/local/entropy-guard/SKILL.md:86`).
  - It names no trigger and no handoff, so F7 got through.
  - Replaced in the refined guard by the skill-contracts check (check 3).
- **F18. A recorded requirement was lost in a restructure.**
  - `DECISIONS.md:42` requires "bootstrap actions to be verified against the current artifact before they are
    written", validated at `LEARNINGS.md:27-33`.
  - No current skill says it: `grep -rni verif skills/` finds only unrelated uses.
  - Condition: unauthorised drift, so the work is fixed. `cleanup.patch` restores it in docs-first Step 5.

## Ranked risks

Ranked by decay rate times recovery cost.

1. **R1. Intent moving without recorded decisions** (F3, F5, F6, F1, F2).
   - Decay: slow.
   - Recovery: very costly, because nobody can tell drift from an approved change.
   - Symptoms: the measure diverged; a generator was added that `INTENT.md` does not know about.
   - Anchor: `DECISIONS.md` and the steward.
   - Guard: the Intent rule.
2. **R2. Parallel truth about skill roles and the validation loop** (F5, F6, F7, F17).
   - Decay: fast, since every skill change can cause it.
   - Recovery: moderate.
   - Anchors: `INTENT.md` "four distinct tools" for roles, each `SKILL.md` for its own contract, `DECISIONS.md` for
     the measure.
   - Guard: checks 3 and 5.
3. **R3. Superseded material nearby** (F9, F10, F11, F8, F18).
   - Decay: slow.
   - Recovery: moderate to high. F18 shows a validated requirement already lost in one restructure, and a fresh
     session can pick up "no persistent guard" or "entropy-assessment Phase 2" as current.
   - Anchor: `DECISIONS.md`.
   - Guard: check 8, and check 1's supersession marking.
4. **R4. Workflow drift and prose controls** (F12, F13, F4).
   - Decay: moderate.
   - Recovery: low to moderate.
   - Anchors: `AGENTS.md` and `.githooks/pre-commit`.
   - Guard: check 6, and check 3's re-evaluation trigger.
5. **R5. A dishonest or split state file** (F15, F14).
   - Decay: fast.
   - Recovery: cheap.
   - Anchor: `TODO.md`.
   - Guard: check 9.

## Recommendations

- **Consolidate:**
  - the validation loop into one `DECISIONS.md` entry once Q2 is answered, with the other three files linking to it;
  - skill roles into `INTENT.md` "four distinct tools" once Q3 is answered, with `README.md` and `AGENTS.md` keeping
    one-line descriptions.
- **Mark historical:**
  - `explorations/` (F10, patched);
  - the superseded decisions (F9, patched);
  - the three theory entries in `LEARNINGS.md` (F11). This one is a proposal, because it is the steward's content.
- **Demote:** "mandatory" and "non-negotiable" in `AGENTS.md:19` and `:41` could say "expected; reminded by a
  non-blocking hook" (F12). This is a proposal, not patched.
- **Prune:** the seed residue (F16). This is a proposal.

## One-time cleanup

Each item was checked against the current file on 2026-10-07.

| Item | File and line, as checked | Delivered in |
|---|---|---|
| Neutral handoff wording in `guards-integrator` (F7) | `skills/guards-integrator/SKILL.md:20`, `:221`, `:227` | `cleanup.patch` |
| Remove FlowBook (F8) | `skills/session-coherence-skill-generator/SKILL.md:22`, `:193` | `cleanup.patch` |
| Restore bootstrap verification (F18) | `skills/docs-first-planning-assessment/SKILL.md:114` | `cleanup.patch` |
| List `explorations/` as historical (F10) | `README.md:107`, `AGENTS.md:47` | `cleanup.patch` |
| Supersession notes (F9) | `DECISIONS.md:39`, `:47`, `:113`, `:131` | `decisions.patch` |
| Proposals Q1 to Q3, awaiting steward | `DECISIONS.md:5`, inserted at the top | `decisions.patch` |
| Drop `doc-health-check` from `TODO.md:20` once the guard is replaced (F14) | `TODO.md:20` | listed in `state-file.patch` "Next Up" |

`decisions.patch` and `cleanup.patch` go together: the note on `DECISIONS.md:39` says the bootstrap-verification rule
"is restored" in docs-first Step 5.

## State-file update

The update is in `state-file.patch`, which changes the existing `TODO.md`. It does not create a competing summary. It
adds two sections:

- **"Current State":**
  - the stage, with its source and the date it was checked;
  - the documents to trust first;
  - the settled decisions, linked to `DECISIONS.md`;
  - the misleading material nearby;
  - the GitHub issues, marked as not inspected.
- **"Open Questions":** Q1 to Q3.

It also adds three "Next Up" actions. A comment states what makes the file stale and who refreshes it. The existing
Next Up items, which Q2 is about, are left word for word.

## Guard surfaces

Classified under docs-first Step 7.1:

- `skills/local/entropy-guard/SKILL.md`: **amend**, by refining it in place. The draft is `guard/SKILL.md`.
- `AGENTS.md` Working Practices: **keep**. Lines 27 and 32 wait on Q1. The "mandatory" wording is a proposal (F12).
- `.githooks/pre-commit`: **keep** non-blocking, as `DECISIONS.md:31-35` decided. Printing the link check from it is a
  Next item in `integration.md`.
- `README.md` "Contributing": **keep**.
- `TODO.md`: **amend** (`state-file.patch`).
- `DECISIONS.md`: **amend** (`decisions.patch`).
- `skills/local/entropy-guard-feedback/SKILL.md`: **keep**.
- `explorations/`: **demote** (`cleanup.patch`).

## Guard generation report

This is the output of `session-coherence-skill-generator`.

**Inputs supplied:**

- the steward (F1);
- the intent documents: `INTENT.md`, `README.md` "Project status", `AGENTS.md` "Project Constraints";
- the decision surface, `DECISIONS.md`, and the open questions Q1 to Q3;
- the state file, `TODO.md`, refreshed by whoever runs the guard;
- rules the repo does not own: the agentskills.io format and the seed scaffolding;
- user-wide instruction files: none in the snapshot, and anything outside it was not inspected;
- verification commands: none exist (`AGENTS.md:51`), and nothing runs by itself except the reminder hook;
- code areas: none. The product is the skills, which `README.md`, `AGENTS.md` and `INTENT.md` describe;
- live state: `entropy-guard-feedback` creates public GitHub issues. That skill governs the write, so the guard has no
  check for it. There is no spend;
- the findings, by id.

**Mode and path.**

- Plan mode, because the target is read-only.
- Generator step 1, recording the work in `TODO.md`, was not done. Build mode would add a "Doing Now" line and clear it
  at commit.
- The draft is `guard/SKILL.md`, which replaces `skills/local/entropy-guard/SKILL.md` in place.
- The name stays `entropy-guard`, because agentskills.io requires the name to match the directory
  (`DECISIONS.md:79-83`).

**Size.** 932 words, counted with `wc -w` including front matter. The budget is 450 + 36 × J + S + C:

- J = 9 checks;
- S = 91 words of pointers;
- C = 39 words of commands.

That gives about 904 words, so the guard is 28 words (3%) over. The excess is roughly the line pointing at the Q1
proposal, which goes once Q1 is answered. The guard it replaces is 1,400 words.

**Changes from v0.2.3:**

- An Intent section carrying a copy of entropy-guard's intent-change rule v2, provisional on Q1 (F3).
  - `intent-change-rule.md` says a guard inside entropy-guard should point to the rule rather than copy it.
  - This snapshot has no such file, so a pointer would be broken.
- Check 3's "update INTENT.md" replaced by the rule (F3).
- "Update both" replaced by one owner per truth (F4).
- A skill-contracts check, with an event trigger for re-evaluation (F17, F7, F13).
- The superseded-material check widened to `explorations/`, `PHILOSOPHY.md` and the theory entries in `LEARNINGS.md`
  (F10, F11).
- The decisions check now asks for a date, a decider and supersession marking (F2, F9).
- The `doc-health-check` pointer removed (F14).
- State that had been copied into the guard removed, leaving pointers only: the system snapshot, the "generated by"
  line, and the rationale paragraphs.
- Stale placeholders folded into the state check.
- A link-check command added. It was tested 2026-10-07 in a scratch git copy of the snapshot and caught a planted
  broken link. The snapshot itself has no broken relative links.

**It holds under any answer to Q3.** Every checklist area in the target's own docs-first Step 7 is covered:

| Docs-first Step 7 area | Guard check |
|---|---|
| Canonical ownership | 5 |
| Local implications | 5 |
| Supersession | 8 |
| Cross-references | 7 |
| Decisions and learnings | 1 and 2 |
| State honesty | 9 |
| Workflow alignment | 6 |
| Guard-induced entropy | 6 |

**Review before handover.**

- Every patch was checked against Q1 to Q3:
  - none edits `INTENT.md`, `AGENTS.md:27`, `AGENTS.md:32`, the existing Next Up items, or `INTENT.md:86-88`;
  - the wording in `guards-integrator` names no generator;
  - the guard's dependence on Q1 is marked.
- Every repair instruction was checked against the authorised intent, and agrees with `DECISIONS.md:31-35`, `:58` and
  `:139-143`, and with `INTENT.md` on enforcement depth.
- The size is as reported above.

**Doc references added:** none were needed. `AGENTS.md:19` and `:41`, `README.md:137` and the hook already name the
path.

**Validation:**

- `git diff --check` could not run, because the snapshot has no `.git`.
- The outputs contain no trailing whitespace.
- The patches dry-run cleanly.

**Left visible:** Q1. **Handoff:** `integration.md`.

## Next step

1. The steward answers Q1 to Q3 (`questions.md`).
2. Apply `decisions.patch`, `cleanup.patch` and `state-file.patch`. They settle no open question.
3. Once Q1 is answered, install `guard/SKILL.md`, then run the adoption checks in `integration.md`.

## Not covered, and uncertainties

- **Commit history:** none, so enacted intent and the real loop are inferred from dated metadata and transcripts.
- **GitHub issues:** not inspected, because no web access was allowed in this run.
- **The sibling repo `entropy-immune-system`:** not available, so whether `explorations/` duplicates it was not
  checked.
- **The `explorations/` transcripts:** only the steward's lines and the closing section were read. The other roughly
  14,000 words were skimmed by their headers.
- **`PHILOSOPHY.md`:** only its headings and two sections were read.
- **Steward identity:** rests on evidence (F1), with no explicit statement. If anyone else holds authority over
  `INTENT.md`, Q1 needs to cover them.
- **Shape A over D:** a judgment. Under D, the route would have been `mixed-profile.md`, which was not read.
