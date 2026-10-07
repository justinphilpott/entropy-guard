# Entropy assessment: entropy-guard, snapshot 447da9a

Assessed 2026-10-07. Every line reference below is to the read-only snapshot at
`eval/targets/entropy-guard-447da9a`, which has no `.git`.

**Route taken.** `entropy-assessment` (intent pass, lifecycle, shape) → shape A, docs-first planning →
`docs-first-planning-assessment` run as a called skill (Steps 1 to 7) → guard decision `update` →
`session-coherence-skill-generator` (guard written to its contract) → `guards-integrator` (`integration.md`).

**Mode.** Build, as the caller asked, with every write delivered as a file or an applicable patch in this folder,
because the target is read-only. No steward was available: each question is in `questions.md` with a recommended
answer, and work that depends on an answer is marked provisional.

**Coverage.** I read all 21 files in the snapshot in full, except the four files in `explorations/` (1,467 lines),
of which I read the front matter and opening and searched for every cross-reference. Not covered: git history (there
is none in the snapshot), the sibling repositories `entropy-immune-system`, `writing` and `seed`, the GitHub issues on
`justinphilpott/entropy-guard` (issues #9 to #12 are cited at `DECISIONS.md:17`), and whether any hook is enabled.

---

## 1. Intent

### Steward

No file names a steward or owner (F1). The evidence points to **Justin Philpott**, as an inference:

- `skills/local/entropy-guard-feedback/SKILL.md:10` files issues on `justinphilpott/entropy-guard`;
- `AGENTS.md:68` and `DECISIONS.md:142` link to other repositories under `github.com/justinphilpott`;
- `PHILOSOPHY.md:43` attributes a section to "Justin Philpott and Claude Sonnet 4.6";
- `explorations/2026-03-24-entropy-immune-system-conversation.md:125` records Justin setting the intent of the
  derived project.

The guard names him as steward, marked unconfirmed (question Q4).

### Authorised intent, with sources

No statement in the repo is both attributed and dated as the steward's. All 17 `DECISIONS.md` entries are recorded
decisions with neither author nor date. The authorised intent below therefore rests on recorded decisions and
directives of unknown author, ranked over descriptions as the intent pass directs.

| Part of the intent | Source | Kind | Authority |
|---|---|---|---|
| Practical entropy protection: assessment, guard generation or refinement, integration, validation on real projects | `DECISIONS.md:23-27` ("Farm broader..."); `INTENT.md:124-127` | decision; directive | unattributed, undated; `INTENT.md` revised 2026-04-07 (`INTENT.md:5`) |
| Broader entropic-immunity theory lives in the sibling `entropy-immune-system` repo | `DECISIONS.md:26`; `README.md:7`; `AGENTS.md:34` | decision; descriptions | unattributed, undated |
| `entropy-assessment` is the single front door and a router; docs-first planning is the first specialised track | `DECISIONS.md:15-19` ("Specialize first...") | decision | unattributed, undated; matches the `INTENT.md` revision of 2026-04-07 |
| Guards are delta-scoped, low-burden, not a blocker, evolve; minimum viable intervention; self-applying | `INTENT.md:47-118` | directive (north star) | unattributed |
| One local guard covering docs and workflow, run at session end or before commit | `DECISIONS.md:55-59` | decision | unattributed, undated |
| Judgment-heavy guards mature External → Prompted → embedded; the local hook stays non-blocking | `DECISIONS.md:31-35` | decision | unattributed, undated |
| Generators produce guards with integration instructions | `DECISIONS.md:87-91` | decision | unattributed, undated |
| Bootstrap actions verified against the current artifact; completion tracked outside the guard | `DECISIONS.md:39-43` | decision | unattributed, undated |
| Exportable skills under `skills/`, local under `skills/local/`; agentskills.io format | `DECISIONS.md:71-83` | decisions | unattributed, undated |
| `LEARNINGS.md` stays tactical; articles in the `writing` repo | `DECISIONS.md:139-143` | decision | unattributed, undated |
| Next phase: validate on a larger batch of repos | `DECISIONS.md:26`; `INTENT.md:129-135`; `README.md:125`; `TODO.md:11-13` | decision; directive; descriptions; state | they disagree on which repos and which signal (F5, Q2) |

### Three readings

- **Declared:** a practical, markdown-first toolkit of skills for keeping iterated systems coherent, strongest on
  docs-first planning repos, whose next step is external validation (`README.md:3-7`, `README.md:119-125`,
  `INTENT.md:122-135`).
- **Enacted:** with no git history, only dated artifacts show recent work. The newest is
  `skills/session-coherence-skill-generator/SKILL.md` (metadata `generated: 2026-05-10`, `last_updated: 2026-05-11`)
  and the decision that gave it a bootstrap mode (`DECISIONS.md:7-11`). The validation batch named as next in
  `TODO.md:11-13` shows no recorded progress. The enacted work added a second guard writer (F4) rather than starting
  the validation batch.
- **Authorised:** the table above. No decision records adding `session-coherence-skill-generator` or giving it the
  guard-writing role; one decision assumes it exists.

### Existing guard repair instructions, read against the intent-change rule

- **Intent flag (F2).** `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with
  a dated note explaining what prompted the change." Also the standing instruction at `AGENTS.md:27`: "If a decision
  refines or challenges the intent, update INTENT.md and note why." Both let the session that drifted rewrite the
  intent.
- **Ownership flag (F3).** `skills/local/entropy-guard/SKILL.md:88`: "Did you change something that another doc also
  describes? If so, update both." This keeps two descriptions in step instead of choosing an owner.
- **Not flagged.** `skills/local/entropy-guard/SKILL.md:99` asks that `AGENTS.md` "Key Files" and the `README.md`
  tables reflect structure changes. Those are summaries of the skills' own descriptions, which the one-owner rule keeps
  and keeps correct. Its reference to a "Key Documents table" is stale (F13).

### Gaps by condition

| Condition | Gap | Findings | Response |
|---|---|---|---|
| Missing | No steward is named; no decision is attributed or dated | F1 | Q4 |
| Missing | No decision says which skill writes guards | F4 | Q1; proposal recorded |
| Conflict | Validation batch: "open source projects" and "more merged PRs" (`DECISIONS.md:26`) against docs-first planning repos and "clearer session recovery, fewer reintroduced stale ideas" (`INTENT.md:131-135`, `README.md:125`) | F5 | Q2 |
| Conflict | `INTENT.md:3` and `INTENT.md:139` invite anyone, agents included, to refine the intent directly; the intent-change rule the guard contract requires forbids that without a recorded steward decision | F2 | Q3; proposal recorded; the guard is provisional |
| Unauthorised drift | The decided requirement to verify bootstrap actions against the current artifact (`DECISIONS.md:42`) is in no current skill | F6 | Fix the work: `patches/cleanup.patch` |
| Prose control | "non-negotiable" (`AGENTS.md:19`) and "mandatory" (`AGENTS.md:41`) for a ritual whose only enforcement is a non-blocking reminder hook that runs only if linked by hand | F14 | Enforcement would sit at `.githooks/pre-commit`; it is non-blocking by decision (`DECISIONS.md:31-35`), and nothing cites the rule as a blocking control. No change proposed. |

No gap qualified as a stale description: no later recorded decision plainly contradicts a document's wording, apart
from the `DECISIONS.md` entries that "Specialize first..." partially superseded, which are marked in
`patches/decisions.patch` (F7).

### Questions

Four, in `questions.md`, each with readings, a divergence case from this repo, and a recommended answer:

- **Q1:** which skill writes guards? Recommended: `session-coherence-skill-generator` alone, fed by the
  assessments.
- **Q2:** which repos and which signal does the validation batch use? Recommended: docs-first planning repos first,
  recording both the session signals and merged PRs.
- **Q3:** may agents edit `INTENT.md` directly? Recommended: no; they propose in `DECISIONS.md`, and the steward
  decides.
- **Q4:** who is the steward? Recommended: Justin Philpott, recorded in `DECISIONS.md` and named in `AGENTS.md`.

### Proposed changes, and where they are recorded

Q1 and Q3 would each change `INTENT.md`, so their proposals are recorded in the decision owner, `DECISIONS.md`,
marked as awaiting the steward (`patches/decisions.patch`). All four questions are listed in `TODO.md`
(`patches/state-TODO.patch`). No intent document is edited.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** `README.md:5` ("actively used, actively refined"), `README.md:119` ("Actively evolving"),
  three open "Next Up" items (`TODO.md:11-13`), and the newest dated artifact is from 2026-05-11. The snapshot's own
  date is unknown, so "active" describes the snapshot, not the live repository today.
- **Shape: A, docs-first planning.** Markdown is the product (`AGENTS.md:31`: "no application runtime"); decisions,
  learnings, `TODO.md` and `AGENTS.md` carry state; work happens in repeated human and agent sessions
  (`INTENT.md:117`). **D, workflow-heavy, also fits**: the repo treats its own workflow as part of the product
  (`DECISIONS.md:57-59`). I took A as the riskier: the top-ranked risks (R1, R3) are document-to-document drift
  between skills, decisions and learnings, and the docs-first risk matrix also covers workflow drift, so D's main
  risk is not lost.
- **Repositories: one.** `entropy-immune-system` is a separate inquiry, not a repository that manages this one's work
  (`DECISIONS.md:26-27`). The GitHub issues on `justinphilpott/entropy-guard` are a work intake (`DECISIONS.md:17`),
  not available to this run.

**Planning horizon.**
- **Settled:** the decisions in `DECISIONS.md`, as marked in `patches/decisions.patch`.
- **Active:** the external validation batch (`TODO.md:11-13`), and where the new generator fits (Q1).
- **Exploratory:** the guard runner (`TODO.md:18`, `INTENT.md:92`), the guard evaluator (`INTENT.md:94`), further
  tracks (`TODO.md:19`), and layer 1 and 2 guards (`LEARNINGS.md:137-143`). Broader theory has moved to the sibling
  repo.

---

## 3. Findings

One list; other sections refer to these ids.

- **F1. No steward is named, and no decision is dated or attributed.** None of `README.md`, `INTENT.md`, `AGENTS.md`
  or `DECISIONS.md` names an owner. All 17 entries in `DECISIONS.md` (headings at lines 7-139) lack a date and an
  author. Without dates, their order is ambiguous: the top reads newest first, but `DECISIONS.md:105` says "Two-layer
  generator architecture" is superseded by "Consolidate..." *below* it. Source: the files named.
- **F2. Agents are told to change the intent directly.** `INTENT.md:3` ("meant to be refined collaboratively — by
  humans and AI agents ... When you update it, note the date"), `INTENT.md:139` ("add it"), `AGENTS.md:27`, and
  `skills/local/entropy-guard/SKILL.md:68`, all quoted in section 1. The rule the guard contract requires says not to
  edit intent documents without the steward's recorded decision. Q3.
- **F3. The guard's repair keeps two descriptions in step.** `skills/local/entropy-guard/SKILL.md:88` ("update
  both"), quoted in section 1.
- **F4. Guard writing is defined in parallel, and no decision assigns it.**
  - `INTENT.md:88` gives the generator role to `entropy-assessment` and `docs-first-planning-assessment`;
    `INTENT.md:86` says the generator and integrator exist as explicit skills.
  - `skills/docs-first-planning-assessment/SKILL.md:132-202` (Phase 2) writes or refines guards.
  - `skills/session-coherence-skill-generator/SKILL.md:16-31, 198-231` writes guards to
    `skills/session-coherence-guard/SKILL.md`, with its own required sections; `README.md:91` and `AGENTS.md:46`
    describe it as generating guards.
  - Neither `skills/entropy-assessment/SKILL.md:66-126` nor the docs-first skill routes to it; `INTENT.md` (revised
    2026-04-07) predates it (generated 2026-05-10) and never names it.
  - Its required guard contents (`SKILL.md:213-227`) include no integration instructions, which
    `DECISIONS.md:90` requires of generators; it never mentions `guards-integrator` (searched: no match for
    "integrat" or "hook").
  - The local guard calls itself "a reference example of what the guard generators produce"
    (`skills/local/entropy-guard/SKILL.md:3`; `README.md:78`, "what the generator produces"), without saying which.
  - Q1.
- **F5. The next phase is stated in four places, and they disagree.** `DECISIONS.md:26`: "assess a larger set of
  open source projects ... track whether that produces more merged PRs". `INTENT.md:129-135`, `README.md:125` and
  `TODO.md:11-13`: docs-first planning repos, with "clearer session recovery, fewer reintroduced stale ideas, more
  coherent docs". The later decision `DECISIONS.md:15-19` specialises the export but does not restate the batch or its
  signal. Q2.
- **F6. A decided requirement was lost in a restructure.** `DECISIONS.md:42` requires that bootstrap actions "be
  verified against the current artifact before they are written", and a "no-existing-loop bootstrap integration
  pattern". `LEARNINGS.md:27-33` records why. In the current skills:
  - Verification: absent. I searched `entropy-assessment`, `docs-first-planning-assessment` and `guards-integrator`
    for "verif", "current artifact" and "evidence"; the docs-first skill only lists "Bootstrap actions" at
    `SKILL.md:114`.
  - Tracking completion outside the guard: present (`docs-first-planning-assessment/SKILL.md:202`).
  - No-existing-loop pattern: only partly present (`guards-integrator/SKILL.md:107`, "No automation exists yet").
    Left open.
  - No later entry revokes these requirements. Condition: unauthorised drift. Fixed in the work by
    `patches/cleanup.patch`.
- **F7. Superseded decisions are not all marked.** These entries describe a structure of `entropy-assessment` that
  "Specialize first..." (`DECISIONS.md:18`, "change its role to triage and routing rather than carrying all deep
  guidance itself") replaced, and none is marked:
  - `DECISIONS.md:39-43` (guard refinement, bootstrap design);
  - `DECISIONS.md:47-51` (workflow appendix);
  - `DECISIONS.md:95-99` (Step 8 integration plan);
  - `DECISIONS.md:113-117` (two-phase structure).

  `DECISIONS.md:129-131` is marked, which shows the repo's convention. Patched by `patches/decisions.patch`.
- **F8. The state file holds no current state, and missed the latest work.**
  - `TODO.md` is a task list only: no stage, nothing to trust first, no open questions, no warning about nearby
    superseded material. The repo's own learning says docs-first repos need that at session start
    (`LEARNINGS.md:7-13`), and its own skill produces it for others
    (`docs-first-planning-assessment/SKILL.md:116-126, 186`).
  - `TODO.md` never mentions the session-coherence generator work (F4).
  - Patched by `patches/state-TODO.patch`.
- **F9. Stale and out-of-place entries in `LEARNINGS.md`.**
  - Step references name the old structure of `entropy-assessment`: `LEARNINGS.md:33` ("Step 5", "Step 7"),
    `LEARNINGS.md:87-93` ("Step 0", "Step 1") and `LEARNINGS.md:112` ("Step 8").
  - `LEARNINGS.md:63` cites "the distill-article skill", which is not in this repo; it may live in the `writing`
    repo, not checked.
  - The last three entries (`LEARNINGS.md:117-143`) are "Validated by: The 2026-03-19 philosophical conversation".
    That goes against the file's header (`LEARNINGS.md:3`, "Focus on what you validated, not just opinions") and
    "LEARNINGS.md stays tactical" (`DECISIONS.md:139-143`).
  - The Farm decision does not plainly say that existing entries move, so this is left as a recommendation.
- **F10. `explorations/` sits beside live truth without demotion.** There are 4 files, 1,467 lines, none listed in
  `README.md` "What's here" or `AGENTS.md`. `explorations/2026-03-24-entropy-immune-system-conversation.md:743` calls
  them "seed material for the future `entropy-immune-system` repo", and `DECISIONS.md:26` says the sibling was seeded
  with them. They are still cited as live sources (`LEARNINGS.md:122`, `PHILOSOPHY.md:45`). I did not check whether
  the sibling holds copies.
- **F11. Stale references in the exported skills.**
  - `skills/guards-integrator/SKILL.md:20` ("After `entropy-assessment` generates one or more guards") and `:227`
    are wrong for `entropy-assessment` v0.6.0, which routes rather than generates (`SKILL.md:12`). This touches Q1,
    so it is left until Q1 is answered.
  - `skills/session-coherence-skill-generator/SKILL.md:22` and `:193` name "FlowBook", another repository. Patched by
    `patches/cleanup.patch`.
- **F12. Seed scaffolding residue.**
  - `AGENTS.md:21` ("Working code with tests beats perfect code in progress"), when `AGENTS.md:51` and `AGENTS.md:57`
    say there is no code and no tests. Patched.
  - `.gitignore:17-25` (a Go block) and `.editorconfig:11-18` (Python, Go and Makefile rules) are harmless, so left.
  - Worth feeding back to `seed`, as `AGENTS.md:66-68` asks.
- **F13. Defects in the local guard (`skills/local/entropy-guard/SKILL.md`, v0.2.3).**
  - Line 99 refers to a "Key Documents table" in `README.md` that does not exist. Its tables are under "What's here",
    `README.md:82-115`.
  - Line 14 says the guard was generated by the docs-first assessment, but line 19 says "Generated: 2026-03-19",
    before that skill existed (`INTENT.md:5`). Line 21 shows it was only evaluated against it on 2026-04-07.
  - Lines 12 and 24-34 scope the guard to "this session" but give no way to find the session's start.
  - Lines 33 and 137 point to `doc-health-check`, which does not exist; it is tracked at `TODO.md:20`.
  - Line 131 says to note the result in the commit message "if anything changed", but `README.md:138` says to note
    it always, or "entropy check clean".
- **F14. A prose control.** The guard is called "non-negotiable" (`AGENTS.md:19`) and a "mandatory pre-commit ritual"
  (`AGENTS.md:41`). Its only enforcement is `.githooks/pre-commit`, which prints a reminder, exits 0, and runs only
  after a manual symlink (`README.md:140`). Being non-blocking is decided (`DECISIONS.md:31-35`), and nothing cites
  the ritual as a blocking control. Low.
- **F15. No evidence that the guard runs or is re-evaluated.**
  - The snapshot has no git history, so no commit message shows a guard result, and no hook configuration can be
    read.
  - The guard was last evaluated on 2026-04-07 (`skills/local/entropy-guard/SKILL.md:21`), although
    `INTENT.md:82` says the assessment "should be run on this project periodically", and a guard writer was added a
    month later (F4).

---

## 4. Truth map

Document roles:
- **Canonical:** `INTENT.md` (purpose, principles, entropy model), `DECISIONS.md` (settled choices), `AGENTS.md`
  (working practices), `LEARNINGS.md` (validated learnings), and `README.md` (entry and usage prompts).
- **Current state:** `TODO.md`.
- **Product artifacts:** the four exportable skills, the two local skills, and `.githooks/pre-commit`. Their names,
  paths, inputs and handoffs are contracts.
- **Historical or imported:** `explorations/` (F10), and `PHILOSOPHY.md`, which is a free space, partly a
  distillation of `explorations/2026-03-19-autopoiesis.md`.
- **Scaffolding:** `.editorconfig`, `.gitignore`, `LICENSE`, from `seed`.

| Concept | Canonical home | Other mentions (summary or link) | Status |
|---|---|---|---|
| Purpose and scope | `INTENT.md` | `README.md:3-7, 119-123`; `AGENTS.md:3, 29-34` | Summaries agree |
| Entropy model, enforcement depth | `INTENT.md:9-109` | `README.md:68-74` links; `PHILOSOPHY.md` reflects | Fine |
| Guard lifecycle roles | `INTENT.md:84-96` | `README.md:84-91`; `AGENTS.md:43-46`; the docs-first skill's Phase 2; the generator skill | **Parallel truth on the generator role (F4)** |
| Each skill's purpose and steps | its `SKILL.md` | `README.md:21-66, 84-98`; `AGENTS.md:41-46` | Summaries agree, except stale handoffs (F11) |
| Working practices | `AGENTS.md:17-27` | `README.md:131-140`; the guard's check 4; the hook | Agree, apart from F12 and F13 (commit note) |
| Session-end guard | `skills/local/entropy-guard/SKILL.md` | `AGENTS.md:19, 41`; `README.md:76-78, 97, 137`; `.githooks/pre-commit:4` | Pointers are correct |
| Settled decisions | `DECISIONS.md` | `TODO.md` (after the patch) links them | Supersession incomplete (F7); undated (F1) |
| Validated learnings | `LEARNINGS.md` | none | Stale references, and theory (F9) |
| Next steps and current work | `TODO.md` | `README.md:125`; `INTENT.md:129-135`; `DECISIONS.md:26` | Restated in four places; one differs (F5, F8) |
| Broader theory | sibling `entropy-immune-system` | `explorations/`; `PHILOSOPHY.md:41-126`; `LEARNINGS.md:117-143` | Residue not demoted (F9, F10) |
| Skill format | agentskills.io specification (external) | `DECISIONS.md:79-83` | Every skill's `name` matches its folder (checked) |
| Upstream feedback | `skills/local/entropy-guard-feedback/` | `DECISIONS.md:63-67`; the check at the end of each of 3 exportable skills; `AGENTS.md:70-72` | Fine |

---

## 5. Loop map

This is the documented loop. The real one cannot be observed, because the snapshot has no history.

- **Session start:** an agent loads `AGENTS.md` if its tooling does. The agents named in `explorations/` front matter
  are Claude Sonnet 4.6 and OpenCode (gpt-5.4); I did not check whether either loads `AGENTS.md` automatically. The
  agent consults `INTENT.md` for significant choices (`AGENTS.md:27`) and writes "Doing Now" in `TODO.md` before work
  (`AGENTS.md:22`). Nothing gives current state at the start (F8).
- **Work:** skills and docs are edited together (`AGENTS.md:23`). Work arrives from `TODO.md` and from upstream
  feedback issues (`DECISIONS.md:17`).
- **Capture:** decisions and learnings are recorded when they are found (`AGENTS.md:25`), and again by the guard's
  checks 1 and 2.
- **Pause:** the local guard runs before commit (`AGENTS.md:19`). `.githooks/pre-commit` reminds at `git commit`, if
  it is linked.
- **Handoff:** the commit, with a note of the guard's result (`README.md:138`). Pull requests are used at least
  sometimes (`LEARNINGS.md:152`, "the `guards-integrator` PR").
- **Where follow-up gets lost:** the May work on the generator left no trace in `TODO.md` and no re-evaluation of the
  guard (F8, F15).

---

## 6. Ranked risks

| Rank | Risk | Findings | Decay | Recovery | Symptoms | Anchor for the fix |
|---|---|---|---|---|---|---|
| R1 | Parallel truth about who writes guards | F4, F11 | Medium-fast: every edit to either writer widens the gap, and the next phase (`TODO.md:12`, "Generate or refine guards for those projects") will use one of them on external repos | High: guards placed in other repos keep whichever shape they got | Two writers, two guard shapes, two paths; `INTENT.md` names neither the newer one nor its role | Q1, recorded in `DECISIONS.md`, then `INTENT.md` "The guard lifecycle" |
| R2 | The intent can be rewritten by the session that drifted from it | F2, F1 | Slow | Catastrophic, in the repo's own words (`INTENT.md:33`) | Three standing instructions to edit `INTENT.md` directly; no named steward | Q3 and Q4, recorded in `DECISIONS.md` |
| R3 | Superseded or lost material near live truth | F6, F7, F9, F10 | Medium: each of the four restructures so far (two-layer, consolidate, rename, specialise) left residue | Medium; F6 shows a decided requirement already lost once | Unmarked superseded decisions; stale step numbers; theory in the learnings log; undemoted explorations | `DECISIONS.md` supersession notes; `TODO.md` "Misleading material nearby" |
| R4 | The state file is dishonest or missing | F8, F5 | Fast | Cheap now | No current state; the newest work is untracked; the next phase is stated four ways | `TODO.md` |
| R5 | Stale references | F11, F12, F13 | Fast | Cheap within one session | A missing table, a missing skill, another repo's name, scaffolding text | the files themselves; the guard's search check |

---

## 7. Recommendations

- **Consolidate:**
  - Give one skill the job of writing guards (F4), after Q1.
  - Make `TODO.md` the owner of next steps (F5, F8). Keep `README.md:125` and `INTENT.md:129-135` as summaries that
    agree with it.
  - After Q2, mark `DECISIONS.md:26`'s validation clause as superseded if the steward chooses the docs-first batch.
- **Demote or mark historical:**
  - Mark `explorations/` as historical and keep the files, which are cited (F10).
  - Relabel or move the three theory entries in `LEARNINGS.md` (F9).
  - Mark the superseded decisions (F7; patched).
- **Restore:** the verification of bootstrap actions (F6; patched).
- **Record:**
  - Record the steward (F1, Q4).
  - Date and attribute every new `DECISIONS.md` entry; the updated guard asks for a date.

## 8. One-time cleanup

Each item was checked against the current file in the snapshot.

| Item | Verified at | Delivered as | Depends on |
|---|---|---|---|
| Add verification to "Bootstrap actions" | `skills/docs-first-planning-assessment/SKILL.md:114` | `patches/cleanup.patch` | none |
| Remove the two FlowBook references | `skills/session-coherence-skill-generator/SKILL.md:22, 193` | `patches/cleanup.patch` | none |
| Drop "Working code with tests beats perfect code in progress" | `AGENTS.md:21` | `patches/cleanup.patch` | none |
| Mark four decisions partially superseded | `DECISIONS.md:39, 47, 95, 113` | `patches/decisions.patch` | none (the notes state where things sit now) |
| Mark `explorations/` historical | `README.md:82-115` lists no `explorations/` | `TODO.md` backlog item | none |
| Relabel the theory entries in `LEARNINGS.md` | `LEARNINGS.md:117-143` | `TODO.md` backlog item | none |
| Fix the stale guard reference and provenance | `skills/local/entropy-guard/SKILL.md:14, 99` | `guard/SKILL.md` | Q3, Q4 (install timing) |
| Fix "entropy-assessment generates guards" | `skills/guards-integrator/SKILL.md:20, 227` | `TODO.md` backlog item | Q1 |

## 9. State-file update

`TODO.md` is the existing state file, and the loop map shows it is read first. `patches/state-TODO.patch` adds a
"Current state" section holding:
- the stage, with its source and the date checked;
- the documents to trust first;
- the settled decisions, linked to their entries;
- Q1 to Q4;
- the misleading material nearby;
- three next actions.

It also adds the cleanup items to "Backlog". It leaves "Next Up" unchanged, and it creates no competing summary.

---

## 10. Guard inputs (docs-first Step 7)

### Existing guard surfaces

| Surface | What it is | Does it execute? | Decision |
|---|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | the guard | No; run by hand | **Amend**, into `guard/SKILL.md` (F2, F3, F13) |
| `AGENTS.md:19` and `:41` standing instruction | prompt to agents | Only where an agent loads `AGENTS.md` | Keep |
| `AGENTS.md:27` "update INTENT.md and note why" | standing instruction | No | Amend after Q3 (provisional) |
| `.githooks/pre-commit` | reminder, exit 0 | Only if linked by hand; unverified | Keep |
| `README.md:131-140` "Contributing" | human instructions | No | Keep |
| `TODO.md` "Doing Now" discipline | state ritual | No | Keep; content amended by the state patch |
| `DECISIONS.md`, `LEARNINGS.md` | logs | No | Keep; supersession marks |
| The upstream feedback check in each exportable skill, and the feedback helper | prompts | No | Keep |
| CI, PR templates | none exist | none | none |

### The matrix's checks, written against this repo's files

| Risk | Check in the updated guard | Files |
|---|---|---|
| Parallel truth | standing check 1, and the one-owner repair | `README.md` "How to use this repo" and "What's here", `AGENTS.md` "Key Files", `INTENT.md` "The guard lifecycle", the handing skills |
| Superseded material nearby | supersession check | `DECISIONS.md`, `LEARNINGS.md`; pointer to `explorations/` and `PHILOSOPHY.md` as historical |
| Stale references | the search check and its command | the whole tree outside `.git` |
| Lost decisions and learnings | decisions and learnings check | `DECISIONS.md` (dated), `LEARNINGS.md`, `PHILOSOPHY.md` for theory |
| State dishonesty | standing check 2, and the `TODO.md` check | `TODO.md`, `README.md` "Project status", `INTENT.md` "Scope boundary..." |
| Workflow drift | workflow check | `AGENTS.md` "Working Practices", `README.md` "Contributing", `.githooks/pre-commit` |
| Brittle automation | only the skill-name check is automated, a stable invariant from agentskills.io | `skills/**/SKILL.md` |
| (intent) | the Intent section, with the intent-change rule | `INTENT.md`, `README.md` "Project status", `AGENTS.md` "Project Constraints" |

### Guard decision: `update`

The existing guard is sound in coverage and well placed, but it carries the two flagged repairs (F2, F3), a stale
reference (F13), and no baseline. So I updated it in place rather than replacing it. The intent section depends on
Q3 and the steward's name on Q4, so the update is **provisional** until both are answered.

## 11. Inputs handed to the generator

| Input | Value | Status |
|---|---|---|
| Steward | Justin Philpott | inferred, unconfirmed (F1, Q4) |
| Documents holding authorised intent | `INTENT.md`; `README.md` "Project status"; `AGENTS.md` "Project Constraints"; `DECISIONS.md` | resolved |
| Decision surface | `DECISIONS.md` | resolved |
| Open intent questions | Q1 to Q4 | unresolved, and visible through `TODO.md` |
| Current-state file, and who refreshes it | `TODO.md`; whoever runs the guard at session end (`AGENTS.md:22`) | resolved |
| Rules bound by but not owned | agentskills.io specification (`DECISIONS.md:79-83`) | resolved; nothing else is recorded in the repo, and a user-wide instructions file was not visible |
| Verification commands, and which run by themselves | none (`AGENTS.md:49-52`); no CI | resolved: the guard adds two commands |
| Code areas, with their docs and tests | the "code" is `skills/` (product artifacts), described in `README.md`, `AGENTS.md` and `INTENT.md`; no tests | resolved |
| Live state or spend a session can change | GitHub issues on `justinphilpott/entropy-guard`, via the feedback helper (`gh issue create`); no spend | resolved: the guard reports issues filed |
| Findings | F1 to F15 | resolved |

## 12. Generator report

- **Guard:** `guard/SKILL.md`. Its path in the target is `skills/local/entropy-guard/SKILL.md`, updated in place.
  The `name: entropy-guard` is kept because the name must match the folder (`DECISIONS.md:81-82`).
- **Size: 1,127 words** (`wc -w`), against a budget of **1,013**, made of:
  - 706 for the common contract;
  - 216 for 6 repo-specific checks at 36 each (decisions and learnings, supersession, workflow, stale-reference
    search, skill name, `TODO.md`);
  - 64 for pointers;
  - 27 for commands.

  I removed one duplicate line (a pointer to a full audit). The excess of 114 is justified coverage, kept:
  - the two standing checks filled with this repo's 4 description surfaces and 2 state restatements (F4, F5), about
    55;
  - the skill-change pointer in the Intent section, carried over from the old check 3, about 20;
  - the report's commit-message convention (`README.md:138`), workflow-drift flag (`DECISIONS.md:55-59`), escalation
    to `TODO.md`, and issue links (live state), about 25;
  - the skip-trivial line (`AGENTS.md:19`), about 15.
- **Where the old 9 checks went:**
  - 1 and 2 → the decisions and learnings check;
  - 3 → the Intent section, where the intent-change rule replaces "update INTENT.md";
  - 4 → the workflow check;
  - 5 and 6 → standing check 1 plus the one-owner repair, which replaces "update both";
  - 7 → the supersession and search checks;
  - 8 and 9 → the `TODO.md` check and standing check 2.
  - New: the baseline section, the skill-name check, the historical pointers, and issue reporting.
- **Review before handover:**
  - "Modes and safety" is present, and the baseline is bound, falling back to `git merge-base HEAD origin/HEAD`.
  - Each patch's header names the questions it touches; none settles one.
  - The repair instructions follow authorised intent, provided Q3 is answered as recommended.
  - The size is reported above.
- **Operator docs:** the path is unchanged, and `AGENTS.md:19, 41`, `README.md:78, 97, 137` and
  `.githooks/pre-commit:4` already point to it. No reference was added.
- **Validation run:**
  - `git diff --no-index --check` on the guard and on all five patched files: clean.
  - `git apply` of the three patches onto a copy of the snapshot: all applied.
  - The guard's two commands, run on the patched copy with the new guard in place: every skill name matches its
    folder. The search for the old names finds only the `TODO.md` item that tracks their removal.
- **Questions the guard leaves visible:** the steward is marked unconfirmed; it points to `TODO.md` for the open
  intent questions.
- **Handoff:** to `guards-integrator`; see `integration.md`.

## 13. Uncertainties

- The steward is inferred (F1).
- Enacted intent comes from dated artifacts only, with no commit history. The date of the snapshot is unknown.
- Whether `.githooks/pre-commit` is linked anywhere, or whether the guard has ever run (F15).
- Whether the agents used here load `AGENTS.md` automatically.
- Whether `entropy-immune-system` holds copies of `explorations/`, and whether the `distill-article` skill lives in
  `writing`.
- `origin/HEAD` as the guard's fallback baseline assumes the remote is named `origin`.
- `intent-change-rule.md` says a guard *inside entropy-guard* points to it rather than copying it. This target is an
  older entropy-guard without that file, so, as instructed, I treated it as any other target and copied the rule. If
  the steward wants the in-repo pointer instead, add the rule file first (`feedback.md`, note 2).

Notes on the skills themselves are in `feedback.md`.
