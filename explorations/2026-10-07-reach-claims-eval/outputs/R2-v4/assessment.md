# Entropy assessment: entropy-guard snapshot 447da9a

- **Target:** `scratchpad/eval/targets/entropy-guard-447da9a`, a read-only snapshot of the entropy-guard repository
  with no `.git`. Read on 2026-10-07. Its newest dated content is `skills/session-coherence-skill-generator/SKILL.md`,
  `last_updated: 2026-05-11`.
- **Route taken:** `entropy-assessment` Step 1 (intent pass) and Step 2 (shape A, docs-first planning), then
  `docs-first-planning-assessment` Phases 1 and 2, then `session-coherence-skill-generator` (refine the existing
  guard, plan mode), then `guards-integrator`. Per Step 3 route A, this document is the docs-first assessment with the
  intent section and lifecycle status added; there is no second report.
- **Mode:** plan mode. The target was not edited. Proposed edits are applicable patches in `patches/`; the refined
  guard is `guard/SKILL.md`; integration advice is `integration.md`; steward questions are `questions.md`.
- **Line references** are to the snapshot as read. "DECISIONS.md:15" means the entry whose heading is on line 15.

---

## 1. Intent

**Steward.** No document names one (F1). The repository owner is Justin Philpott: the feedback helper files issues
on `justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md:10`), and he is the attributed
human in every dated transcript. This assessment treats him as steward and asks him to confirm (Q1).

**Authorised intent, in short.**

| Part | Source | Kind and authority |
|---|---|---|
| Keep iterated, AI-assisted systems coherent through lightweight, delta-scoped guards that preserve intent, consistency, knowledge, legibility and honest state | `INTENT.md:9-65`; `README.md:3`, `:11-15` | Description with directive force ("north star", `AGENTS.md:38`); dated 2026-04-07, unattributed |
| This repo stays practical (assessment, guard building, integration, validation); theory goes to the sibling `entropy-immune-system` repo; the exploration docs stay in `explorations/` | `DECISIONS.md:23`; `INTENT.md:122-127`; Justin, 2026-03-24, `explorations/2026-03-24-entropy-immune-system-conversation.md:86`, `:125`, `:713` | Decision (undated, unattributed) backed by the only steward-attributed, dated statements in the repo |
| `entropy-assessment` is the single front door and router; docs-first planning repos are the deepest specialised path | `DECISIONS.md:15`; `INTENT.md:69-73` | Decision, undated, unattributed |
| Principles: minimum viable intervention, low burden, collaborative, self-applying | `INTENT.md:113-118` | Directive, dated 2026-04-07 |
| Next step: an external validation batch | `INTENT.md:129-135`; `DECISIONS.md:26`; `TODO.md:11-13` | The sources disagree on population and measure (F8) |

**Enacted.** No commit history was available. The newest dated work is `session-coherence-skill-generator` and its
bootstrap mode (skill metadata 2026-05-10 and 2026-05-11; top entry `DECISIONS.md:7`). No validation results are
recorded anywhere in the repo.

**Gaps, by condition.**

- **Stale description** (corrected from a recorded decision, no question): F5, F7, F13, F17.
- **Conflict:** F3, who builds guards (Q2); F8, what the validation loop measures (Q3).
- **Missing:** F1, a named steward (Q1); F2, dates and deciders on decisions; the decision adopting
  `session-coherence-skill-generator` into the skill flow (part of F3).
- **Ambiguous, settled by evidence:** `LEARNINGS.md:123` says "the mature form collapses assess → fix with no
  persistent guard artifact". Read as a live directive, it argues against building any persistent-guard builder;
  read as an aspiration, it belongs to the theory now owned by `entropy-immune-system`. `DECISIONS.md:26` and Justin's
  2026-03-24 statements (`:86` "keep it operating within its current structure", `:713`) settle it as the second
  reading. Recorded under F11; not asked.
- **Unauthorised drift:** F6. A requirement in `DECISIONS.md:42` was dropped by a later restructure that no decision
  covers. Response: fix the work (`patches/skills.patch`).
- **Prose control:** F14. Stated at its real size: nothing cites the rule as a safety control.

**Questions for the steward:** three, in `questions.md` (Q1 steward and who may edit `INTENT.md`; Q2 one guard
builder; Q3 the validation loop). **Proposed intent changes:** the same three, recorded as "Proposed:" entries at
the top of `DECISIONS.md` (`patches/DECISIONS.md.patch`), the repo's existing decision surface. No new register.

## 2. Lifecycle status

**Active.** `README.md:121` "Actively evolving"; `INTENT.md:5` revised 2026-04-07; skill metadata 2026-05-11;
open items in `TODO.md:9-20`; no archive or retirement marker anywhere.

## 3. System shape

**A, docs-first planning,** with D (workflow-heavy) also fitting. Four of the five A signals hold: no runtime
(`AGENTS.md:31`, `:51`); `TODO.md`, `DECISIONS.md` and `AGENTS.md` carry state; the loop is repeated human and AI
sessions; the drift is docs-to-docs and workflow. The fifth holds partly: the primary artifacts are methodology
documents (skills and `INTENT.md`) rather than plans. D fits because the repo exports a way of working
(`DECISIONS.md:55`). A was chosen because the highest current risk (R1) is parallel truth between documents, and
docs-first's workflow-alignment check covers D's concern.

- **Domains:** documentation and workflow are present and active. Code, tests, API contracts and live operational
  state are absent.
- **Repositories:** one. The adjacent surfaces were not assessed as members: GitHub issues on this repo (cited at
  `DECISIONS.md:17`, filed by the feedback helper; not readable here), the sibling repos `entropy-immune-system`
  (theory), `writing` (articles, `DECISIONS.md:139`) and `seed` (scaffolder, `AGENTS.md:66-68`).

**Planning horizon.**

- **Settled:** the front door and docs-first specialisation; the sibling split; one local guard; External, then
  Prompted, then deeper adoption; the `skills/` and `skills/local/` split; the agentskills.io format; guard-creation
  skills over guard libraries; `LEARNINGS.md` stays tactical.
- **Active:** the external validation batch; `session-coherence-skill-generator` and its bootstrap mode.
- **Exploratory:** a guard runner and a guard evaluator (`INTENT.md:92-94`, `TODO.md:18`); further specialised
  tracks; `doc-health-check`; meaning-level guards (`LEARNINGS.md:143`, now theory for the sibling repo).

## 4. Canonical truth map

| Role | Documents |
|---|---|
| Canonical system-wide truth | `INTENT.md` (purpose, model, principles, tool lifecycle); `DECISIONS.md` (settled choices); `AGENTS.md` "Working Practices" (contributor workflow) |
| Current state and handoff | `TODO.md` (no current-state view yet: F12) |
| Product artifacts, read as contracts | exportable `skills/entropy-assessment`, `docs-first-planning-assessment`, `session-coherence-skill-generator`, `guards-integrator`; local `skills/local/entropy-guard`, `entropy-guard-feedback`; `.githooks/pre-commit` |
| Summaries and knowledge | `README.md` (overview, plus "How to use" prompts, which are contracts too); `LEARNINGS.md` |
| Templates | two guard templates: `docs-first-planning-assessment` Steps 7 and 8, and `session-coherence-skill-generator` "Generated Guard Checklist Template" (F3) |
| Historical, superseded or imported | `explorations/` (4 files, 111,441 of the snapshot's 241,765 bytes); the autopoiesis section of `PHILOSOPHY.md`; `LEARNINGS.md:117-143`; `DECISIONS.md:39`, `:47`, `:95`, `:113` (F7); the FlowBook residue in `session-coherence-skill-generator` (F4); seed scaffolding residue (F16) |

| Concept | Canonical home | Other mentions | Problem |
|---|---|---|---|
| Purpose and principles | `INTENT.md` | `README.md:11-17`, `AGENTS.md:3` | none; the others summarise |
| Who builds guards | none | `INTENT.md:88`, `README.md:52`, `:91`, `AGENTS.md:46`, `DECISIONS.md:7`, `:18`, both builder skills, `guards-integrator:20` | F3, F5 |
| Skill catalogue | none; three peers | `README.md:84-98`, `AGENTS.md:36-47`, `INTENT.md:86-90`, guard metadata `:20` | F9 |
| Next validation loop | none; four peers | `INTENT.md:129-135`, `DECISIONS.md:26`, `README.md:125`, `TODO.md:11-13` | F8 |
| Contributor workflow | `AGENTS.md:17-27` | `README.md:131-140`, `.githooks/pre-commit`, local guard checks 4 and 9 | consistent; enablement unknown (F14) |
| Feedback note format | `entropy-guard-feedback:37-72` | `guards-integrator:168-175` | F10 |
| Theory (JIT guards, immunity) | `entropy-immune-system`, per `DECISIONS.md:26` | `explorations/`, `PHILOSOPHY.md:41-`, `LEARNINGS.md:117-143` | F11 |

## 5. Loop map

- **Session start:** an agent loads `AGENTS.md`; its Quick Links send it to `README.md`, `INTENT.md` and `TODO.md`.
  Nothing says which to read first, and there is no current-state view (F12).
- **Active work:** `TODO.md` "Doing Now", written before work and cleared before commit (`AGENTS.md:22`,
  `.githooks/pre-commit:6`).
- **Decisions and learnings:** captured at session end through the local guard's checks 1 and 2.
- **Coherence pause:** the local guard before commit (`AGENTS.md:19`), prompted by a non-blocking hook if a clone
  has enabled it (unknown: F14).
- **Handoff:** the commit, with the guard's note in the message (`README.md:138`). Pull requests happen at least
  sometimes (`LEARNINGS.md:152`). There is no CI.
- **Upstream:** feedback goes to GitHub issues through `entropy-guard-feedback`.

## 6. Findings

One list. Every later section refers to these ids.

- **F1. No steward is named, and any contributor may edit the intent.** `INTENT.md:3` invites humans and agents to
  refine it; `AGENTS.md:27` tells an agent to "update INTENT.md and note why"; the local guard says the same
  (`skills/local/entropy-guard/SKILL.md:68`). `INTENT.md:5` records a date and a reason, not who approved. The rule
  the generated guard must carry says the opposite (Q1).
- **F2. No decision carries a date or a decider.** None of the 17 entries in `DECISIONS.md` does. Position is no
  substitute: the top entries read newest first, but "Two-layer generator architecture" (`:103`) is superseded by
  "Consolidate domain generators…" below it (`:105`, `:129`). Authority cannot be told apart from an agent's choice.
- **F3. Two skills build guards, and no document says which owns it.** `docs-first-planning-assessment` Phase 2
  (`:132-202`) and `session-coherence-skill-generator` (`:198-315`) each build a session-end guard from different
  templates, to different default paths. `INTENT.md:84-96` names only the assessment skills as generator;
  `README.md:91` and `AGENTS.md:46` name `session-coherence-skill-generator`; `DECISIONS.md:7` adds bootstrap mode to
  it, but no entry adopts it or places it beside docs-first Phase 2. `entropy-assessment:118-124` can recommend "add a
  lightweight general post-work guard" with no skill named to build it.
- **F4. `session-coherence-skill-generator` is unreachable, and carries an earlier project's residue.** No skill and
  no `README.md` prompt routes to it, so the young-repo bootstrap decided at `DECISIONS.md:7` has no entry point. It
  does not hand on to `guards-integrator`. It names "FlowBook" (`:22`, `:193`), which appears nowhere else. Its guard
  template has no integration or enforcement section, which `DECISIONS.md:90` requires of every generator ("The guard
  output should specify its own enforcement mechanism"). Its metadata keys differ from the other skills' `version`.
- **F5. `guards-integrator` expects a generator that no longer generates.** "After `entropy-assessment` generates
  one or more guards" (`:20`), and also `:221` and `:227`. `entropy-assessment` became a router at `DECISIONS.md:18`.
  The removal is settled; the replacement name waits on Q2.
- **F6. A decided requirement was lost in the restructure.** `DECISIONS.md:42` requires bootstrap actions "to be
  verified against the current artifact before they are written", validated by dogfooding (`LEARNINGS.md:27-33`).
  When generation moved to `docs-first-planning-assessment`, that requirement did not move: its bootstrap actions
  (`:114`) carry no verification, and a search for "verif" in that skill finds nothing.
- **F7. Four superseded decisions are not marked.** `DECISIONS.md:39`, `:47`, `:95` and `:113` describe
  `entropy-assessment`'s Phase 2, Steps 5 to 8 and domain appendices, none of which exist in its v0.6.0. The log marks
  supersession elsewhere (`:105`, `:131`), so an unmarked entry reads as current.
- **F8. The next validation loop has four homes, and they disagree.** `DECISIONS.md:26` says "a larger set of open
  source projects" and "track whether that produces more merged PRs". `INTENT.md:129-135` says docs-first planning
  repos, measured by session recovery, fewer reintroduced stale ideas, more coherent docs and sharper feedback.
  `README.md:125` and `TODO.md:11-13` follow `INTENT.md` (Q3).
- **F9. The skill catalogue is kept in three or more places.** `README.md` "What's here", `AGENTS.md` "Key Files",
  the `INTENT.md` lifecycle and the guard's snapshot line. `INTENT.md` already omits `session-coherence-skill-generator`.
- **F10. The feedback note format is written twice:** in `entropy-guard-feedback:37-72` and `guards-integrator:168-175`.
  They agree today.
- **F11. Theory sits beside live truth without a label.** `explorations/` holds 46% of the snapshot's bytes and says
  nowhere that it is seed material for the sibling repo; `README.md` "What's here" and `AGENTS.md` "Key Files" do not
  list it. Three `LEARNINGS.md` entries (`:117`, `:127`, `:137`) are "validated by" a conversation, against the file's
  own rule (`:3` "Focus on what you validated, not just opinions").
- **F12. The repo does not keep the session-start view it prescribes.** `INTENT.md:73`, `README.md:40` and
  `LEARNINGS.md:7-13` say docs-first repos need a current-state packet read at session start. The local guard calls
  itself a reference example of docs-first output (`:14`), yet the repo has no such view (`INTENT.md:118`
  "Self-applying").
- **F13. The local guard is stale in places, and lacks parts.** It cites "README.md (Key Documents table)" (`:99`;
  no such table exists), "20+ markdown files" (`:92`; there are 17), and "use doc-health-check" (`:33`; not built).
  It has no definition of the session's change, no intent-change rule, and no report shape beyond one line.
- **F14. Guard runs are stated as fact, and nothing shows them.** `README.md:78` says "runs its own entropy guard
  before every commit" and `AGENTS.md:19` calls it "non-negotiable". The mechanism is a reminder that exits 0
  (`.githooks/pre-commit:9`), as `DECISIONS.md:34` chose. Whether any clone enables it, by symlink
  (`AGENTS.md:19`, `README.md:140`), is unknown from this snapshot, and the guard's notes live only in commit
  messages, which were not available.
- **F15. Two places track work, with no rule between them.** `TODO.md:3` says "graduate to an issue tracker";
  GitHub issues already drive decisions (`DECISIONS.md:17`, issues #9 to #12) and receive feedback. The evidence
  (`AGENTS.md:22`, `.githooks/pre-commit:6`) makes `TODO.md` the owner; issues are inputs. Not asked.
- **F16. Seed scaffolding residue.** `.gitignore:17-25` lists Go artifacts, `.editorconfig` has Python, Go and
  Makefile sections, and `AGENTS.md:21` says "Working code with tests beats perfect code" in a repo with neither.
  Low.
- **F17. A pointer to a skill that is not here.** `LEARNINGS.md:63`: "Led to the distill-article skill",
  presumably in the `writing` repo (`DECISIONS.md:142`). Low.

## 7. Entropy profile: top risks

Ranked by decay rate times recovery cost.

| Rank | Risk | Findings | Decay | Recovery | Anchor for the fix |
|---|---|---|---|---|---|
| R1 | Parallel truth in the product: two guard builders, broken skill handoffs, a decided requirement dropped | F3, F4, F5, F6, F9 | Fast: each edit to either builder widens the gap, and the active front (external validation) runs through these skills | High: guards of two shapes would land in external repos and confound the validation evidence | A decision on Q2 in `DECISIONS.md`, then the `INTENT.md` lifecycle |
| R2 | Intent authority: no steward, undated decisions, unmarked supersession | F1, F2, F7 | Slow | Severe: `INTENT.md:33` calls intent entropy "catastrophic to recover" | Q1, recorded in `DECISIONS.md` |
| R3 | The next validation loop restated four ways | F8, F15 | Medium | Medium: it decides which repos are assessed and what counts as success | `INTENT.md`, after Q3 |
| R4 | Theory and superseded material read as current | F11, F7, F17 | Slow | Medium: a fresh session can rehydrate "no persistent guards" or the old Phase 2 | `DECISIONS.md:26`; Justin, 2026-03-24, `:713` |
| R5 | The repo does not practise its own lifecycle | F12, F13, F14 | Medium | Low to medium | `TODO.md` current state; the refined guard |

## 8. Recommendations

- **Consolidate:** one guard builder (Q2), then fix its consumers (F5, `entropy-assessment` Steps 3 and 4d,
  `README.md` "How to use", `INTENT.md:84-96`). The skill catalogue's purposes live in `README.md` "What's here";
  `AGENTS.md` "Key Files" keeps paths and links; the `INTENT.md` lifecycle names roles, not a file list (F9). One
  statement of the validation loop in `INTENT.md` (Q3). `guards-integrator` Step 7 links to the feedback helper's
  format instead of restating it (F10).
- **Mark as historical:** the four entries in F7 (patched); a one-line label at the top of each `explorations/` file
  naming `entropy-immune-system` and `DECISIONS.md:23`; a short "exploration, not validated in use" note on
  `LEARNINGS.md:117`, `:127` and `:137` (F11).
- **Correct:** `README.md:78` to "is meant to run before every meaningful commit; a non-blocking hook reminds" (F14,
  settled by `DECISIONS.md:31`); point `LEARNINGS.md:63` at the `writing` repo (F17).
- **Guard:** refine the local guard in place (`guard/SKILL.md`), not a new one.
- **Optional:** remove the seed residue (F16).

## 9. Bootstrap actions

Each was checked against the snapshot on 2026-10-07.

| # | Action | Verified by | Delivered as |
|---|---|---|---|
| B1 | Add "Current state (read first)" to `TODO.md` | `TODO.md:1-20` has no such section | `patches/TODO.md.patch` |
| B2 | Mark F7's four entries as partially superseded | none of the four headings has a marker; `skills/entropy-assessment/SKILL.md` contains no "Phase 2", "Step 8" or "appendi" | `patches/DECISIONS.md.patch` |
| B3 | Record Q1 to Q3 as "Proposed:" entries | `DECISIONS.md` has no steward entry and no proposed entry | `patches/DECISIONS.md.patch` |
| B4 | Add a session-start instruction to `AGENTS.md` "Working Practices" | `AGENTS.md:17-27` has none | `patches/AGENTS.md.patch` |
| B5 | Restore verified bootstrap actions in `docs-first-planning-assessment` (F6) | `:114` has no verification | `patches/skills.patch` |
| B6 | Remove the FlowBook residue (F4) | "FlowBook" occurs only at `session-coherence-skill-generator:22`, `:193` | `patches/skills.patch` |
| B7 | Replace `skills/local/entropy-guard/SKILL.md` with the refined guard | the stale references in F13 at `:33`, `:92`, `:99` | `guard/SKILL.md`; its Intent section waits on Q1 |
| B8 | Fix the handoffs in F3 and F5 | `guards-integrator:20`, `:221`, `:227`; `entropy-assessment:66-71`, `:118-124` | not patched: waits on Q2 |

The current-state update is B1. Bootstrap progress is tracked in `TODO.md`, never in the guard.

## 10. Phase 2: inputs to the guard generator

**Guard surfaces.** Sorted by whether they execute, each marked keep, amend, replace or demote:

- **Runs by itself:** none. There is no CI, and hook enablement is unknown.
- **Exists, but runs only by hand:**
  - `skills/local/entropy-guard/SKILL.md`: amend (B7).
  - The four exportable skills when run on this repo (`INTENT.md:82`): keep, with B5, B6 and B8.
  - `AGENTS.md` "Working Practices": amend (B4); line 27 waits on Q1.
  - `TODO.md`: amend (B1).
  - `DECISIONS.md`: amend (B2, B3).
  - `LEARNINGS.md`: keep, but demote the three entries in F11.
  - `README.md` "Contributing": keep.
- **Decided, not yet built:** a guard runner (`DECISIONS.md:91`, `TODO.md:18`); a guard evaluator
  (`INTENT.md:94`). Integration links to these and starts no parallel work.
- **Declared, but missing:** `doc-health-check` (`TODO.md:20`); this repo's own current-state view (F12, fixed by
  B1).
- **Unknown:** whether any clone has enabled `.githooks/pre-commit` (F14). It is kept as is.

**Docs-first checks, written against this repo.** Each lands in the guard as follows:

- canonical ownership, and one owner rather than two copies: guard section 2, with an owner table built from the
  truth map;
- supersession: section 4;
- cross-reference integrity: section 8, plus the mechanical link check;
- decision and learning capture: section 5, which adds date and decider (F2) and the validated-in-use rule (F11);
- state honesty: section 7;
- workflow alignment: section 6.

Added for this repo: section 3, "skills are contracts" (F3 to F6, F9). The checks stable enough for tooling now run
as commands in the guard: the relative-link check, skill frontmatter name against folder, and `git diff --check`.
Ownership, supersession, intent and step-number references stay judgment checks, because they depend on wording that
still moves.

**Handed to the generator:** sections 1, 4, 5 and 10 of this document.

## 11. Generator report (`session-coherence-skill-generator`)

- **Mode:** plan mode, because the target is read-only. Not bootstrap: the repo has a repeated session-and-commit
  loop and a guard.
- **Guard:** updated in place at `skills/local/entropy-guard/SKILL.md`, following the repo's `skills/local/`
  convention (`DECISIONS.md:71`) rather than the default `skills/session-coherence-guard/`. The draft is
  `guard/SKILL.md`, version 0.3.0.
- **Doc references added:** the session-start bullet in `AGENTS.md` (B4). The guard is already named at
  `AGENTS.md:19`, `:41` and `README.md:78`, `:97`, `:137`.
- **Validation run on 2026-10-07, on a scratch copy of the snapshot (since deleted):**
  - all four patches pass `patch -p1 --dry-run` and apply cleanly;
  - `git diff --no-index --check` between the original and the patched copy shows no whitespace errors;
  - the guard's own mechanical checks print nothing on the patched copy with the guard installed;
  - the link check found all 49 relative links in the snapshot resolve; it caught a planted broken link and ignored
    one inside a code fence;
  - all 6 skill names match their folders.
- **Checked against the open questions (generator Step 6):**
  - the `TODO.md` and `AGENTS.md` patches settle none of them, and `AGENTS.md:27` is left untouched;
  - the `DECISIONS.md` patch records each question with an alternative, marked "not in force";
  - B5 is settled by `DECISIONS.md:42`, and B6 does not depend on any question;
  - in the guard, rule 4 is marked provisional with the current-practice wording beside it, and the owner row for
    guard building points to the decision record without naming a skill;
  - no repair instruction makes a skill's text the authority over `INTENT.md` or `DECISIONS.md`.
- **Left visible on purpose:** Q1, in guard section 1; Q2, in guard section 2's owner table.
- **Handed to `guards-integrator`:** see `integration.md`.

## 12. Uncertainties and what was not covered

- With no `.git`, the following could not be seen: commit history and messages (and so any record of guard runs),
  hook configuration, the default branch (the guard falls back to `main`), and pull-request history.
- GitHub issues (#9 to #12, the `agent-feedback` label) were not read: no web access in this run.
- The sibling repos `entropy-immune-system`, `writing` and `seed` were not read. Whether the exploration docs now
  have a second copy there is unknown.
- The steward's identity is inferred (F1, Q1).
- `explorations/` was read in part: front matter, headings, and the steward's exchanges in both transcripts.
  `PHILOSOPHY.md` was read to line 80, plus its headings.
- The intent-change rule says a guard inside the entropy-guard repository should point to `intent-pass.md` rather
  than copy it. This snapshot has no `intent-pass.md` and is treated as any other target, so the guard carries a copy
  that names its upstream source.
- No rules owned outside the repo (user-wide instructions, security, spending or merge policy) are referenced from
  it, and none were looked for outside it.

## 13. Upstream feedback check

- **Routing:** the front door routed correctly; docs-first was the right track.
- **Feedback:** two reusable frictions were found, both in the skills rather than the target. They are formatted as
  issues in `feedback.md`. They were not filed: this run has no web access.
