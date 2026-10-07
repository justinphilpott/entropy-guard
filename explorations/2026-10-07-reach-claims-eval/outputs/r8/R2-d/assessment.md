# Entropy assessment: entropy-guard snapshot 447da9a

- **Date:** 2026-10-07.
- **Target:** `scratchpad/eval/targets/entropy-guard-447da9a`, a read-only copy of the entropy-guard repository with no
  `.git`. Every file in it was last written 2026-05-11 21:50, which is taken as the snapshot date.
- **Skills used:** `entropy-assessment` v0.9.0, its `intent-pass.md` and `intent-change-rule.md` (v2),
  `docs-first-planning-assessment` v0.3.0, `session-coherence-skill-generator` v0.5.0, `guards-integrator` v0.4.0.
- **Route:** front door, then shape A, docs-first. The docs-first assessment was run as a called skill and returned to
  front-door Step 3. The guard decision was `update`, so the guard went to the generator, and the generator handed it to
  the integrator (`integration.md`).
- **Mode:** build, with every write redirected to this output folder. Nothing in the target was edited. Changes to the
  target are delivered as `settled.patch` and `provisional.patch`, and the updated guard as `guard/SKILL.md`. Nothing
  was committed, and nothing was sent to GitHub.
- **Steward:** not available. The questions are in `questions.md`, and work that depends on them is provisional.

## Intent

### Steward

No file names the steward (F2). The evidence points to **Justin Philpott**, which is inferred, not recorded:

- the feedback helper files issues on `justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md:10`);
- `DECISIONS.md:142` and `AGENTS.md:68` link to his other repositories;
- he is the named author of the directives in `explorations/`, for example
  `explorations/2026-03-24-entropy-immune-system-conversation.md:125`: "The above (my last para) in distillation should
  be the intent of the new derived project."

This is Q2.

### Statements gathered

| Where | Kind | Authority | Date |
|---|---|---|---|
| `INTENT.md:3` "meant to be refined collaboratively — by humans and AI agents … When you update it, note the date" | standing directive | neither | none (file revised 2026-04-07) |
| `INTENT.md:5` revision line, docs-first specialization | description | dated, unattributed | 2026-04-07 |
| `INTENT.md:84-96` four-tool lifecycle; the generator role belongs to `entropy-assessment` + `docs-first-planning-assessment` | description | neither | 2026-04-07 |
| `INTENT.md:122-135` scope boundary; validation wedge = docs-first repos; measures | directive | neither | 2026-04-07 |
| `README.md:119-127` Project status | description of direction | neither | none |
| `AGENTS.md:19` "Run entropy-guard before committing … non-negotiable" | standing instruction | neither | none |
| `AGENTS.md:27` "update INTENT.md and note why" | standing instruction | neither | none |
| `AGENTS.md:29-34` Project Constraints | standing instruction | neither | none |
| `DECISIONS.md`, 17 entries | decisions | none of them dated or attributed | none |
| `DECISIONS.md:26` (Farm) validation loop: "open source projects … track whether that produces more merged PRs" | decision | neither | none (March 2026 by its context) |
| `DECISIONS.md:18` (Specialize first) `entropy-assessment` becomes a router | decision | neither | none (matches the 2026-04-07 revision) |
| `DECISIONS.md:10` bootstrap mode in `session-coherence-skill-generator` | decision | neither | none (the skill's metadata gives 2026-05-10/11) |
| `DECISIONS.md:66` file feedback "when available" | decision | neither | none |
| `DECISIONS.md:142` LEARNINGS.md stays tactical | decision | neither | none |
| `explorations/…-conversation.md:125` Justin names the sibling project's intent | steward directive, quoted | attributed and dated | 2026-03-24 |
| `explorations/2026-03-19-autopoiesis.md:22` Justin values work "merged within minutes" | steward statement | attributed and dated | 2026-03-19 |

No git history was available, so commit messages could not be searched for steward quotes. That search was not covered.

### Three readings

- **Declared.** The project is a practical set of skills (assessment, guard generation or refinement, integration)
  for keeping AI-iterated systems coherent. It is validated mainly on docs-first planning repos. Its next phase is an
  external validation batch. The broader theory lives in the sibling `entropy-immune-system` repo (`README.md:3-7`,
  `:119-127`; `INTENT.md:122-135`; `AGENTS.md:34`).
- **Enacted.** This is read from dated artifacts, since there is no git history:
  - March 2026: the explorations and the farm-off decision.
  - 2026-04-07: the docs-first specialization, the `INTENT.md` revision, and the guard's last evaluation.
  - 2026-05-10 to 05-11: `session-coherence-skill-generator`, with its bootstrap mode and a `DECISIONS.md` entry.
    README and AGENTS were updated for it; `INTENT.md` and the local guard were not.
  - The validation batch in `TODO.md` "Next Up" has not started.
- **Authorised.** No steward decision is attributed. `DECISIONS.md` is the decision record, and its authority is
  unestablished (F2). The direction it records agrees with the declared reading, except for the validation measure
  (F15) and the role of the newest skill (F3).

### Gaps by condition

- **Stale description:**
  - F5: `guards-integrator` against `DECISIONS.md` "Specialize first".
  - F6: earlier DECISIONS entries against the same decision.
  - F7: LEARNINGS entries against "LEARNINGS.md stays tactical" and "Farm". Each was corrected only as far as the
    later decision plainly covers.
- **Conflict:**
  - F11: when an upstream issue may be filed.
  - F15: what the validation batch measures.
- **Missing:**
  - F2: who the steward is.
  - F3: which skill owns guard generation.
- **Ambiguous:**
  - F1: whether `INTENT.md:3` lets agents change intent.
  - F19: whether every guard is a skill file.
  - F20: where a "current-state packet" lives.
- **Unauthorised drift:** none found with certainty. Adding `session-coherence-skill-generator` was recorded
  (`DECISIONS.md:7-11`), but its role was not (F3).
- **Prose control:**
  - F13: the guard is "non-negotiable", but nothing records or enforces a run.
  - F17: "run periodically" has no trigger.

### Existing guard's repair instructions, read against the intent-change rule

- **Intent:** `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated
  note explaining what prompted the change". This treats the work as permission to change authorised intent. The same
  path appears in `AGENTS.md:27`: "update INTENT.md and note why". (F1)
- **Ownership:** `skills/local/entropy-guard/SKILL.md:88`: "Did you change something that another doc also describes?
  If so, update both." `:99` keeps "AGENTS.md (Key Files section), README.md (Key Documents table)" in step. (F10)

### Questions and proposed changes

There are five questions, all in `questions.md`, each with a recommended answer:

- **Q1 (F1):** may agents change `INTENT.md`? Recommended: propose only.
- **Q2 (F2):** the steward. Recommended: Justin Philpott.
- **Q3 (F3, F4):** the single guard builder. Recommended: `session-coherence-skill-generator`.
- **Q4 (F15):** what the validation batch tracks. Recommended: both sets of measures.
- **Q5 (F11):** filing issues from other projects. Recommended: only when working in entropy-guard.

The proposed changes of intent and the missing decisions are recorded, marked as awaiting the steward, in a new
`DECISIONS.md` section "Proposed, awaiting the steward" (`settled.patch`). `TODO.md` names the questions and points
there.

## Lifecycle, shape, repositories

- **Lifecycle: active as of 2026-05-11.** Evidence: `README.md:5` "actively used, actively refined", `:119` "Actively
  evolving", `TODO.md` "Next Up", and dated work through 2026-05-11. Whether it is still active on 2026-10-07 cannot be
  told from the snapshot.
- **Shape: A, docs-first planning.** The repo is markdown only, with no application runtime (`AGENTS.md:31`).
  `DECISIONS.md`, `TODO.md` and `AGENTS.md` carry state, and work happens in repeated sessions (`AGENTS.md:22`).
- **Shape D, workflow-heavy, also fits.** The exported product is workflow instructions, and `DECISIONS.md:55-59`
  treats workflow drift as first-class. A was taken as the riskiest fit for two reasons:
  - the top risks (F1 to F8) are drift between documents;
  - the docs-first matrix already covers workflow drift.

  The only executing parts are a 9-line reminder hook and a `gh` call, so the executes / does-not-execute sort of
  routes B to D adds little.
- **Repositories: one.** The sibling `../entropy-immune-system`, and the `seed` and `writing` repos, are referenced but
  hold separate scope (`DECISIONS.md:23-27`, `:139-143`). They do not manage this repo's work, and they were not read.

## Planning horizon

- **Settled:**
  - one front door, routing docs-first repos to the specialized track;
  - the theory farmed out to the sibling repo;
  - External, then Prompted, as the guard maturity path;
  - bootstrap before guards for young repos;
  - the agentskills.io format;
  - `skills/` for exported skills and `skills/local/` for local ones.
- **Active:** the external validation batch (`TODO.md:11-13`).
- **Exploratory:**
  - the guard runner and evaluator (`INTENT.md:86`, `TODO.md:18`);
  - more specialized tracks (`TODO.md:19`);
  - `doc-health-check` (`TODO.md:20`).

## Findings

One list. Other sections refer to these ids.

| Id | Finding | Evidence | Risk / condition | Severity |
|---|---|---|---|---|
| F1 | Contributors, agents included, are told to revise `INTENT.md` themselves. | `INTENT.md:3`; `AGENTS.md:27`; `skills/local/entropy-guard/SKILL.md:68` | Ambiguous intent authority; an intent-drift path. Q1 | high |
| F2 | No file names the steward. All 17 `DECISIONS.md` entries are undated and unattributed. | grep for steward, owner, maintainer and author: no file names one for this repo; `DECISIONS.md` headings | Missing. Q2 | high |
| F3 | Two product skills generate guards, with different templates, paths and metadata: `docs-first-planning-assessment` Phase 2, and `session-coherence-skill-generator` (default `skills/session-coherence-guard/SKILL.md`). `INTENT.md:86-88` names only the first as the generator role; `README.md:91` and `AGENTS.md:46` call the second a generator. | `skills/docs-first-planning-assessment/SKILL.md:132-202`; `skills/session-coherence-skill-generator/SKILL.md:198-315`; `INTENT.md:88`; `DECISIONS.md:7-11` | Parallel truth; Missing decision. Q3 | high |
| F4 | Nothing hands work to `session-coherence-skill-generator`. The front door has no young-repo shape, so the bootstrap mode required by `DECISIONS.md:10` cannot be reached from where `README.md:31` says to start. | search: `session-coherence` appears outside its own file only in `README.md:91`, `AGENTS.md:46` and `DECISIONS.md:9-10`; `skills/entropy-assessment/SKILL.md:38-71` | Product contract (handoffs). Depends on Q3 | medium-high |
| F5 | `guards-integrator` expects `entropy-assessment` to generate guards, which it no longer does. | `skills/guards-integrator/SKILL.md:20`, `:221`; `skills/entropy-assessment/SKILL.md:116-124` (Step 4d only recommends); `DECISIONS.md:18` | Stale description | medium |
| F6 | Four `DECISIONS.md` entries place Phase 2, Steps 5-8 or domain appendices in `entropy-assessment`, and are not marked superseded; only "Consolidate …" is. `LEARNINGS.md:33` and `:92-93` refer to the same old structure. | `DECISIONS.md:39-43`, `:47-51`, `:95-99`, `:113-117`, `:131`; current `skills/entropy-assessment/SKILL.md` has Steps 1-4 and no appendices | Superseded material nearby | medium |
| F7 | Three `LEARNINGS.md` entries are "validated by" a philosophical conversation. One says "the mature form collapses assess → fix with no persistent guard artifact", against current practice. | `LEARNINGS.md:117-143`, `:3`; `DECISIONS.md:139-143`, `:23-27` | Stale description; superseded nearby | medium |
| F8 | `explorations/` (4 files, 1,467 lines) is listed nowhere and carries no historical marker. The 2026-03-24 files are seed material for the sibling repo. `…-conversation.md:691` names a missing file, `2026-03-24-entropic-immune-systems.md`. | `README.md:82-115`, `AGENTS.md:36-47` (not listed); `…-conversation.md:743`; `DECISIONS.md:26` | Superseded material nearby | medium |
| F9 | The local guard has stale references. | `:33`, `:137` point to `doc-health-check`, which does not exist (`TODO.md:20`); `:99` names a "Key Documents table" (README has "What's here"); `:92` says "20+ markdown files" (17); `:14` says it was "Generated by" docs-first, but `:19` says entropy-assessment v0.4.0 on 2026-03-19 | Stale references | medium |
| F10 | The local guard keeps two lists of the same files in step ("update both"). `README.md` "What's here" and `AGENTS.md` "Key Files" each describe every skill, in different words. | guard `:88`, `:99`; `README.md:82-115`; `AGENTS.md:36-47`, `:60-64` | Parallel truth (ownership flag) | medium |
| F11 | Three exported skills route to a helper that runs `gh issue create` on the public `justinphilpott/entropy-guard`, with the assessed project's context and no confirmation step. Their triggers differ: "whenever the local feedback helper is available" in one, "when working inside this repo" in the others. | `skills/local/entropy-guard-feedback/SKILL.md:42-51`, `:68`; `skills/guards-integrator/SKILL.md:174-175`; `skills/entropy-assessment/SKILL.md:150`; `skills/docs-first-planning-assessment/SKILL.md:217`; `AGENTS.md:72`; `DECISIONS.md:66` | Conflict over the authorised reach to a live service. Q5 | medium |
| F12 | `AGENTS.md:51` "No build, test, or runtime commands yet" omits the commands the workflow runs: `gh issue list`, `gh issue create`, and the hook link. | search recorded under "Reach and exhaustive claims" below | Incomplete exhaustive claim | low |
| F13 | Running the guard is "non-negotiable", and `README.md:78` says it runs "before every commit". Nothing records a run: clean runs leave no trace (guard `:131`), the hook only reminds, and it works only in clones where someone linked it. | `AGENTS.md:19`; `README.md:78`, `:140`; `.githooks/pre-commit`; `DECISIONS.md:34` (non-blocking by decision) | Prose control: cited as the project's practice, with no record | medium |
| F14 | The report rule differs. `README.md:138` puts a note in every commit ("or 'entropy check clean'"); the guard `:131` only "if anything changed". | as cited | Workflow conflict (not about intent); fixed as usual by following README | low |
| F15 | The validation loop's batch and measures differ between the Farm decision (open source projects, merged PRs) and `INTENT.md:129-135`, `README.md:125` and `TODO.md:11-13` (docs-first repos; session recovery and similar). | as cited | Conflict. Q4 | medium |
| F16 | `session-coherence-skill-generator` carries residue from another project. It names "FlowBook" (`:22`, `:193`), which is not in this repo, and records its version as `skill_version: session-coherence-generator v0.2.0`, a second name and a different form from the other skills' `metadata.version`. | as cited; grep "FlowBook" | Imported residue; consistency | low |
| F17 | The local guard has no baseline commands, modes, safety rules, intent-change rule or mechanical checks. It was last evaluated on 2026-04-07, before `session-coherence-skill-generator` (2026-05-10) arrived, and does not know that skill's contract. "Run periodically" has no trigger. | guard `:18-22`; `INTENT.md:82`; guard `:139` | Guard stale; prose control | medium |
| F18 | Seed scaffolding speaks of code and tests in a repo with neither: "Working code with tests …", "Docs travel with code"; plus Go and Python entries in `.gitignore` and `.editorconfig`. | `AGENTS.md:21`, `:23`; `.gitignore:17-25`; `.editorconfig:11-15` | Workflow drift, harmless | low |
| F19 | `INTENT.md:65` says a guard is not "always a skill file"; `:79` says "each guard is a skill file". | as cited | Ambiguous; does not change this guard, so no question | low |
| F20 | Docs-first asks for a "current-state packet" without tying it to the repo's existing state file. In an assessed repo, that can become a second current-state surface beside `TODO.md`. This repo has none besides `TODO.md`. | `skills/docs-first-planning-assessment/SKILL.md:116-126`; `README.md:40`; `INTENT.md:73`; `DECISIONS.md:18` | Product: parallel truth risk; Ambiguous | low |

## Truth map

| Concept | Canonical home | Other places, and what they should be |
|---|---|---|
| Purpose, entropy model, guard lifecycle | `INTENT.md` | `README.md:11-17` summary (fine) |
| Who decides | none (F2) | proposed: an `INTENT.md` header line (Q2) |
| Settled decisions | `DECISIONS.md` | `TODO.md` "Settled" links (added) |
| Current state, next steps | `TODO.md` | `README.md:119-127`, `INTENT.md:122-135` hold direction; they should agree (guard check 2) |
| Working practices | `AGENTS.md` "Working Practices" | `README.md:131-140` summary; the guard's report rule follows it (F14) |
| Skill catalogue | `README.md` "What's here" | `AGENTS.md` "Key Files" is a summary for agents (F10) |
| Guard generation process | two homes (F3) | one builder, pending Q3 |
| Upstream feedback procedure | `skills/local/entropy-guard-feedback/SKILL.md` | triggers in 3 skills, `AGENTS.md:72` and `DECISIONS.md:66` disagree (F11) |
| Validation loop | `DECISIONS.md` (Farm) vs `INTENT.md:122-135` (F15) | pending Q4 |
| Theory (autopoiesis, immunity) | sibling `entropy-immune-system`; articles in `writing` | `explorations/`, `PHILOSOPHY.md` and three LEARNINGS entries are historical or reflective (F7, F8) |

Document roles:

- **Canonical:** `INTENT.md`, `DECISIONS.md`, `AGENTS.md`, `README.md`.
- **Current state:** `TODO.md`.
- **Product artifacts:** the four exported skills, plus `skills/local/entropy-guard-feedback` (whose `gh` command is a
  contract), plus `skills/local/entropy-guard`, which is both this repo's guard and a reference example.
- **Historical or imported:** `explorations/`, `PHILOSOPHY.md` (free-form, not normative), the superseded
  `DECISIONS.md` entries, and the FlowBook residue.
- **Templates:** none, apart from seed scaffolding.

## Loop map

What the documents prescribe. The real loop cannot be observed, because there is no git history.

1. A fresh session loads `AGENTS.md`, if the agent's tool reads it. There is no `CLAUDE.md` or vendor file.
2. It reads `TODO.md` (`README.md:135`) and writes "Doing Now" (`AGENTS.md:22`).
3. It works in markdown, consulting `INTENT.md` for significant choices (`AGENTS.md:27`).
4. Before committing, it runs `skills/local/entropy-guard/SKILL.md` (`AGENTS.md:19`), which captures decisions and
   learnings.
5. `.githooks/pre-commit` prints a reminder, if linked.
6. It commits with an entropy note (`README.md:138`) and clears "Doing Now".

Pull requests sometimes follow (`LEARNINGS.md:152`). External feedback arrives as GitHub issues (`DECISIONS.md:17`,
issues #9-#12).

The smallest handoff is the commit.

Evidence of practice: "Doing Now" is empty, and the May generator change got a DECISIONS entry. But neither
`INTENT.md` nor the guard was updated, which suggests the guard ran without catching an added product skill (F17).

## Ranked risks

| # | Risk | Findings | Decay | Recovery cost | Anchor for the fix |
|---|---|---|---|---|---|
| 1 | Intent can change through an agent's edit, with no named steward | F1, F2 | slow | catastrophic (`INTENT.md:33`) | steward answers to Q1, Q2 in `DECISIONS.md` |
| 2 | Parallel truth in the product skills: two guard builders, stale and missing handoffs | F3, F4, F5, F16, F20 | fast (every skill edit) | high: users get differently shaped guards | `DECISIONS.md` answer to Q3, then `INTENT.md:84-96` |
| 3 | Superseded material beside live truth | F6, F7, F8 | slow, compounding | medium | `DECISIONS.md` supersession notes; `TODO.md` "Misleading nearby" |
| 4 | Guard runs unrecorded, and the guard stale against the skills | F9, F10, F13, F14, F17 | medium | cheap if caught within one iteration | the guard; `README.md` "Contributing" |
| 5 | Unconfirmed public writes from other projects' sessions | F11 | per use | high: public disclosure | answer to Q5 |

## Recommendations

- **Consolidate guard building** (provisional, Q3). On the recommended answer, these changes follow:
  - `session-coherence-skill-generator` becomes the one builder, with its metadata in the common form (F16).
  - The front door routes young repos to its bootstrap mode (F4).
  - Docs-first Phase 2 hands its checks to the builder instead of building the guard itself.
  - `INTENT.md:84-96`, `README.md:52`, `:89`, `:91` and `:97`, `AGENTS.md:44` and `:46`, and the integrator's handoff
    name it.
- **Demote** (done in `settled.patch`):
  - a historical banner on the three 2026-03-24 explorations (F8);
  - status lines on three LEARNINGS entries (F7);
  - "partially superseded" notes on four DECISIONS entries (F6).

  Whether to delete `explorations/` is the steward's choice; it is listed in TODO.
- **One owner for the catalogue.** `README.md` "What's here" owns it, and `AGENTS.md` "Key Files" is a summary kept
  correct. The guard's check 1 says so (F10).
- **Record guard runs.** Always put the note in the commit message (F14), and see `integration.md` for a reminder that
  checks for it (F13).
- **Product:** docs-first should write its current-state content into the repo's existing state file rather than a
  new packet (F20). This is a methodology change, so it is left to Q3's restructure or a later decision.

## One-time cleanup

Each item was verified against the current file on 2026-10-07.

- **Done in `settled.patch`:**
  - F5: `guards-integrator:20` and `:221`.
  - F9: guard `:33`, `:92`, `:99`.
  - F10 and F14: guard `:88`, `:131`.
  - F12: `AGENTS.md:51`.
  - F16: generator `:22` and `:193`.
  - F6, F7, F8: the markers listed under "Recommendations".
- **Tracked in `TODO.md` Backlog** (added by `settled.patch`):
  - point `LEARNINGS.md:33` and `:92-93` at the current skills;
  - decide on `explorations/`, and fix the broken path at line 691 if it stays;
  - the generator's metadata form.

## State-file update

`TODO.md` is the state file the loop reads first. The update is in `settled.patch`. It adds:

- a staleness and refresh line;
- the current stage, with its source and check date;
- what to read first;
- the settled decisions, each linked to its `DECISIONS.md` entry;
- the five open questions;
- the misleading material nearby;
- three cleanup items.

The existing "Next Up" items stand as the next actions.

The "Doing Now" entry the generator asks for at the start of the work (its Step 1) was not written, because the target
is read-only. In a live repo it would read "entropy assessment and guard update", and be cleared before the commit.

## Guard inputs (docs-first Step 7)

### Existing guard surfaces

| Surface | Verdict |
|---|---|
| `skills/local/entropy-guard/SKILL.md` | **amend in place**: small fixes now (settled); full update to the contract in `guard/SKILL.md` (provisional on Q1, Q2, Q5) |
| `.githooks/pre-commit` | keep (reminder; non-blocking by `DECISIONS.md:31-35`) |
| `AGENTS.md` "Working Practices" | amend: `:51` settled; `:27` provisional (Q1) |
| `README.md` "Contributing" | keep; it owns the commit-note rule |
| `TODO.md` | amend (state update, settled) |
| `DECISIONS.md` | amend (proposals, supersession notes; settled) |
| feedback steps in 3 skills, and the helper | amend, provisional (Q5) |

### The matrix's checks, written against this repo

| Matrix risk | Check in `guard/SKILL.md` | Files |
|---|---|---|
| Parallel truth | check 1; the one-owner repair | `README.md` "What's here", `AGENTS.md` "Key Files", `INTENT.md` lifecycle, each skill |
| Local-global inversion | not needed: no component notes exist | none |
| Superseded material nearby | check 5 | `DECISIONS.md`, `TODO.md` "Misleading nearby", `explorations/` |
| Stale references | check 8 and the reference-check commands | all `*.md` |
| Lost decisions and learnings | check 4 | `DECISIONS.md`, `LEARNINGS.md` |
| State dishonesty | check 2 | `TODO.md`, `README.md` "Project status", `INTENT.md` scope |
| Workflow drift | check 6 | `AGENTS.md`, `README.md` "Contributing", `.githooks/pre-commit` |
| Brittle automation | only stable invariants are scripted: links, backticked paths, skill name = folder | none |
| (repo-specific) product handoffs | check 3 | `skills/entropy-assessment/SKILL.md`, each skill |
| (repo-specific) live service | check 7 | the feedback helper |

### Guard decision: `update`

The repo is active and has a guard. That guard has stale references (F9), an intent-edit repair (F1), an ownership
repair (F10), and no baseline, modes or safety rules (F17), and it was not re-evaluated when a product skill was added
(F17).

## Generator inputs

| Input | Value | Status |
|---|---|---|
| Steward | Justin Philpott | **unresolved** (Q2), visible in the guard |
| Intent documents | `INTENT.md`, `README.md` "Project status", `AGENTS.md` "Project Constraints" | resolved |
| Decision surface | `DECISIONS.md` | resolved |
| Open intent questions | Q1 to Q5 | open; visible in the guard where they touch it (Q1, Q2, Q5) |
| Current-state file | `TODO.md`, refreshed by whoever ends a session (`AGENTS.md:22`, guard check 2) | resolved |
| Rules not owned | the agentskills.io skill format (`DECISIONS.md:79-83`); the feedback helper's issue rules. No user-wide instruction file in the snapshot; any outside it are unknown | partly unknown |
| Verification commands | none in the repo (`AGENTS.md:51`); none run by themselves (no CI). The guard adds `git diff --check` and three reference checks | resolved |
| Code areas, and the docs and tests describing them | no code; the product skills are described by `README.md` "What's here", `AGENTS.md` "Key Files" and `INTENT.md:84-96`; no tests | resolved |
| Live state a session can change | GitHub Issues on `justinphilpott/entropy-guard` via the feedback helper; no spend | resolved; when it may be used is open (Q5) |
| Findings | F1 to F20 | resolved |

## The guard built

- **Path:** `skills/local/entropy-guard/SKILL.md`, updated in place and delivered as `guard/SKILL.md`. The name
  `entropy-guard` is kept for two reasons:
  - `AGENTS.md:19` and `:41`, `README.md:78`, `:97` and `:137`, and `.githooks/pre-commit` all name that path;
  - the agentskills.io format requires the name to match the folder.
- **The intent-change rule is copied in, not pointed to.** The skills say a guard inside entropy-guard points at
  `intent-change-rule.md`, but this snapshot has no such file.
- **Size: 1,149 words** (`wc -w`), against a **budget of 1,128**:
  - common contract: 724 words, re-measured on 2026-10-07 with the template and the rule copied in;
  - checks: 6 beyond the two standing ones, at 36 words each, so 216;
  - pointers: 58;
  - commands: 130 (the 126-word command block, plus the 4-word `grep` in check 8).

  The 21-word excess is not checks. It is two lines the contract or the repo requires:
  - the 30-word marker for open question Q1 ("any input marked unresolved stays visible");
  - the 31-word commit-message rule from `README.md` "Contributing" (F14).

  Duplication was removed first: the Intent question now points at "the authorised intent listed above", and the
  description was shortened.
- **The commands were tested on 2026-10-07:**
  - on the original snapshot, under `sh`;
  - on the patched copy, under `zsh`;
  - on a deliberately broken copy, where they caught a broken link and a wrong `name`.

  On the snapshot they flag three paths: two output paths or globs inside the generator's own instructions, which are
  legitimately absent, and the broken path at `…-conversation.md:691` (F8).
- **Review before handover:**
  - "Modes and safety" is present;
  - the baseline is bound to `<start>`, falling back to `@{upstream}`;
  - no repair edits intent: rule steps 4-5, and check 2's other mentions in intent documents, lead to proposals;
  - the size is reported above;
  - the patches were checked as described below.
- **Operator docs** already name the guard's path. `README.md:78` summarises what the guard checks, and is updated in
  `provisional.patch` along with the guard.
- **Validation:** `git diff --no-index --check` between the original and patched copies found no whitespace errors.
  Both patches applied cleanly in sequence to a fresh copy.

## Patches, and their review

**`settled.patch`** touches none of Q1 to Q5:

| Hunk | Findings | Review |
|---|---|---|
| `AGENTS.md` commands line | F12 | describes the `gh` reach only "when working here" (settled by `AGENTS.md:72`), not from other projects (Q5); the list is complete for the search below |
| `DECISIONS.md` "Proposed, awaiting the steward" | F1, F2, F3, F11, F15 | records proposals; states nothing a question asks as fact |
| `DECISIONS.md` four "partially superseded" notes | F6 | says what left `entropy-assessment`, not who builds guards (Q3) |
| `explorations/2026-03-24-*` banners | F8 | settled by the Farm decision and `README.md:7`; deletion left open |
| `LEARNINGS.md` status lines | F7 | "continues outside this repo"; does not choose between the writing repo and the sibling repo |
| `guards-integrator:20`, `:221` | F5 | names no builder (Q3); line 174 (Q5) untouched |
| old guard `:33`, `:88`, `:92`, `:99`, `:131` | F9, F10, F14 | line 68, which Q1 quotes, is untouched |
| generator FlowBook lines | F16 | none |
| `TODO.md` | state update | names the questions without changing their text; its "Settled" items say nothing about which skill builds guards |

**`provisional.patch`** applies after settled, and each hunk names its question:

- `AGENTS.md:27`: Q1.
- the `INTENT.md` preamble: Q1, Q2.
- `README.md:78`: goes with the guard.
- `guards-integrator:174-175` and the feedback helper: Q5.
- `TODO.md` "Next Up": Q4.
- the guard replacement (`guard/SKILL.md`): Q1, Q2, Q5.

Q3 has no hunk; see "Recommendations".

## Reach and exhaustive claims

These searches were run on 2026-10-07 over the whole snapshot, excluding `explorations/` for commands:

- URLs: `grep -rnoE 'https?://…'`;
- commands: `grep -rnE '(gh|git|npm|pnpm|npx|curl|wget|python|node|make|bash|sh) '`, and code fences;
- paths outside the repo: `grep -rnE '\.\./'`;
- every feedback trigger: `grep -rni feedback`.

What the repo reaches:

- **It writes to** GitHub Issues on `justinphilpott/entropy-guard`, through `gh issue create`, after checking with
  `gh issue list`.
- **It reads or links to:**
  - `github.com/justinphilpott/seed` (feedback by hand, with no command);
  - `github.com/justinphilpott/writing`;
  - `agentskills.io/specification`;
  - `../entropy-immune-system`.
- **Locally**, the git hook only prints.
- **Through its exported skills**, when they are used, it writes guards and files into the projects they assess. That
  is the product's purpose, and it is outside this repo's own session loop.

No other network, process or spend reach was found.

## Uncertainties and what was not covered

- No git history, so none of these could be read:
  - the real loop;
  - the commit-note practice;
  - whether the hook is linked;
  - how often the guard runs;
  - activity after 2026-05-11.
- The steward is inferred (Q2).
- Which agents work here, and whether they load `AGENTS.md`, is unknown.
- `explorations/` was read only in part: frontmatter, openings, status lines, and grep for references and status. The
  2026-03-19 and 2026-03-24 transcripts were not read in full.
- The sibling, seed and writing repositories, and any user-wide instruction files, were outside the permitted reading.
- The guard follows the entropy-guard tools' generator contract (v0.5.0). The target's own
  `session-coherence-skill-generator` (v0.2.0) would give a different shape (Q3).
- Feedback on the skills themselves is in `feedback.md`.
