# Entropy assessment: entropy-guard (snapshot 447da9a)

- **Target:** `entropy-guard-447da9a`, an older snapshot of the entropy-guard repository. Read-only, no `.git`.
- **Date:** 2026-10-07.
- **Mode:** build was asked for, but the target cannot be edited, so every change is delivered as a patch: plan mode
  for the target.
- **Steward present:** no. Questions are in `questions.md`, each with a recommended answer.
- **Route taken:**
  1. `entropy-assessment` Step 1, the intent pass.
  2. Step 2: active lifecycle, shape **A, docs-first planning**.
  3. `docs-first-planning-assessment`, run as a called skill (its Steps 2–7). Its result is this assessment, with
     intent and lifecycle added.
  4. `entropy-assessment` Step 3, guard decision **`update`**.
  5. `session-coherence-skill-generator`, which updated the guard.
  6. `guards-integrator`.

**Files produced:**
- `assessment.md`: this file.
- `guard/SKILL.md`: the updated guard, which replaces `skills/local/entropy-guard/SKILL.md`.
- `integration.md`: the integration brief.
- `questions.md`: three questions for the steward.
- `patches/settled.diff`: safe to apply now.
- `patches/provisional-q1.diff`, `-q2.diff`, `-q3.diff`: not to be applied until the steward answers that question.
- `feedback.md`: notes on entropy-guard's own skills.
- `read-log.md`: the skill files read, in order.

---

## 1. Intent

### Steward

**Justin Philpott, inferred.** Nothing in the target names who decides what it is for (finding F1). The evidence:
- the repository slug `justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md:10,47`);
- his links to his own `seed` and `writing` repositories (`AGENTS.md:68`, `DECISIONS.md:142`);
- the conversations in which he sets this repo's scope (`explorations/2026-03-24-entropy-immune-system-conversation.md:86,713`).

`LICENSE:3` names "entropy-guard" as copyright holder, which says nothing about who decides.

### Statements gathered

Each statement is recorded with its location, its kind, the evidence of its authority, and its date.

| Where | Kind | Authority | Date |
|---|---|---|---|
| `explorations/2026-03-24-entropy-immune-system-conversation.md:86` "use this repo as a base and keep it operating within its current structure, but to start a new project" | steward directive | attributed (Justin), dated | 2026-03-24 |
| same file `:713` "let's keep them in explorations, as I want to preserve the entropy-guard project and really farm this new evolution off into its own repo" | steward decision | attributed, dated | 2026-03-24 |
| `explorations/2026-03-19-autopoiesis.md:22` guards whose fixes were "merged within minutes" | steward observation | attributed, dated | 2026-03-19 |
| `DECISIONS.md` 14 entries, e.g. `:15-19` "Specialize first...", `:23-27` "Farm broader...", `:7-11` bootstrap mode, `:87-91` closed-loop integration, `:139-143` LEARNINGS tactical | decisions | neither attributed nor dated | none |
| `INTENT.md:3`, `:139`: refined collaboratively "by humans and AI agents"; "add it" | directive | neither | undated |
| `INTENT.md:5` "Last revised: 2026-04-07 — specialized ... around docs-first planning repos" | description | dated, unattributed | 2026-04-07 |
| `INTENT.md:84-96` four-tool lifecycle; `:88` generator role = assessment workflow | description | dated by `:5` | 2026-04-07 |
| `INTENT.md:113-118` guiding principles; `:122-135` scope boundary and next validation loop | directives | dated by `:5` | 2026-04-07 |
| `README.md:119-125` project status and next phase | description | neither | none |
| `AGENTS.md:17-27` working practices (guard "non-negotiable"; "update INTENT.md and note why"); `:29-34` constraints | directives | neither | none |
| `skills/local/entropy-guard/SKILL.md:18-22` guard metadata | description | dated | 2026-03-19, 2026-04-07 |
| `skills/session-coherence-skill-generator/SKILL.md:4-13` metadata | description | dated | 2026-05-10, 2026-05-11 |
| `TODO.md:9-20` open work | state | neither | none |
| `LEARNINGS.md:117-143` three entries "Validated by: The 2026-03-19 philosophical conversation" | agent inference | neither | 2026-03-19 source |

The decision log is unattributed and undated, and its order cannot be relied on (F18). I treated it as the repo's
decision record. Where an entry agrees with Justin's attributed words, as "Farm broader..." does, it carries more
weight.

### Existing guard repair lines, read against the intent-change rule (v2)

The old guard is `skills/local/entropy-guard/SKILL.md`. Its repair lines raise these flags:
- **Intent:** `:68` "If misaligned: update the skill, or if INTENT.md itself needs revision, update it with a dated
  note explaining what prompted the change." This treats the work as permission to change intent (F2).
- **Intent:** `:78` "If not: update the workflow docs now." This rewrites `AGENTS.md`'s standing instructions to
  match the session without first establishing which of them is wrong (F17).
- **Ownership:** `:88` "Did you change something that another doc also describes? If so, update both." This keeps two
  independent definitions in step, and contradicts the guard's own `:87` (F3).
- The other repair lines (`:46`, `:56`, `:99`, `:108`, `:116`, `:125`, `:138`) raise no flag.

### Three readings

- **Declared:** a practical toolkit for keeping iterated, AI-assisted systems coherent. It covers assessment, guard
  generation and refinement, and integration. Its strongest path is docs-first planning repos, and its next step is an
  external validation batch judged by session recovery (`README.md:3-7,119-125`, `INTENT.md:122-135`,
  `AGENTS.md:34`).
- **Enacted:** with no commit history, only dated artifacts show what was done. The newest is a second, generic guard
  writer: `session-coherence-skill-generator`, generated 2026-05-10 and updated 2026-05-11. It came from another
  repository ("FlowBook", F11), gained a bootstrap mode (`DECISIONS.md:7-11`), and has no route into the front door.
  The declared next step, the validation batch, has not started: `TODO.md:11` is unchecked and "Doing Now" is empty.
- **Authorised:** Justin's attributed words keep entropy-guard as the practical project and move the broader theory
  out (conversation `:86`, `:713`). The decision log adds the following:
  - `entropy-assessment` is the single front door, and docs-first is the deepest path (`:18`);
  - the broader theory moves to the sibling repo, and the next loop is open source projects judged by merged PRs
    (`:26`);
  - the repo keeps one combined local guard, run at session end (`:58`);
  - guards carry their own integration (`:90`);
  - the meta-skill is the product, not a library of guards (`:124`);
  - `LEARNINGS.md` stays tactical (`:142`).
- **Precedence used:** Justin's attributed words, then decision entries, then descriptions. A newer file was not
  treated as more authoritative.

### Gaps, by condition

| Condition | Gap | Finding |
|---|---|---|
| Missing | No named steward | F1 |
| Missing | No decision on which skill writes guards; two skills each define it | F5 (Q1) |
| Ambiguous | Whether `INTENT.md:3`, `AGENTS.md:27` and old guard `:68` are the steward's permission for anyone to revise intent | F2 (Q2) |
| Conflict | Validation batch: open source projects and merged PRs (`DECISIONS.md:26`) against docs-first repos and session recovery (`INTENT.md:129-135`) | F4 (Q3) |
| Stale description | `guards-integrator` says `entropy-assessment` generates guards | F6 |
| Stale description | Four decision entries describe `entropy-assessment`'s Phase 2 as current | F7 |
| Stale description or drift (order unknown) | `LEARNINGS.md` holds conversation theory that `DECISIONS.md:139-143` places elsewhere | F9 |
| Unauthorised drift | The generator's guard template has no integration section, which `DECISIONS.md:87-91` requires | F15 |
| Prose control | "non-negotiable" guard run; nothing enforces it | F13 |

### Questions

Three, in `questions.md`, each with its statement, readings, a case from this repo where the readings diverge, and a
recommended answer: Q1 (F5), Q2 (F2), Q3 (F4).

### Proposed changes, and where they are recorded

- The three questions are recorded as **proposals awaiting Justin Philpott** at the top of the target's
  `DECISIONS.md` (in `patches/settled.diff`). Each is dated 2026-10-07 and says "Not a decision".
- Every edit that depends on an answer is in `patches/provisional-q1.diff`, `-q2.diff` or `-q3.diff`. None changes
  `INTENT.md` before his recorded decision.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.**
  - Evidence: `README.md:5` says "actively used, actively refined", and `:119` "Actively evolving". `TODO.md:9-13`
    holds open items. The newest dated change is 2026-05-11 (generator metadata).
  - The full route was allowed.
- **Shape: A, docs-first planning.**
  - Evidence: "markdown-first and workflow-focused; there is no application runtime" (`AGENTS.md:31`). All 17
    content files are markdown; the rest is a hook and two config files. State is carried in `TODO.md`,
    `DECISIONS.md`, `LEARNINGS.md` and `AGENTS.md`. Work happens in repeated human and agent sessions (`AGENTS.md:22`,
    `INTENT.md:3`).
  - **D, workflow-heavy, also fits in part:** the repo exports ways of working, and its own loop is a ritual
    (`DECISIONS.md:55-59`).
  - **Why A:** A is the riskier fit here. Docs-first Step 2 treats skills as product artifacts whose names, paths,
    inputs and handoffs are contracts, and its matrix includes workflow drift, so A's analysis covers D's surface. The
    highest-ranked risks (F5, F7–F9) are also docs-to-docs.
- **Repositories: one.** None of these is a member of this system:
  - the sibling `entropy-immune-system` (`AGENTS.md:15`) is a separate project that was spun out
    (`DECISIONS.md:23-27`), not one that holds or manages this repo's work;
  - the `writing` repo (`DECISIONS.md:142`) and `seed` (`AGENTS.md:68`) are related repositories.

  None was available, and none was assessed.

---

## 3. Findings

Each finding carries the claim, its evidence, the source of the evidence, and the fix with the patch that carries it.
"Settled" means `patches/settled.diff`.

- **F1. No named steward.** Missing.
  - Evidence: no file says who decides what entropy-guard is for. `INTENT.md:3` makes refinement collaborative "by
    humans and AI agents". No `DECISIONS.md` entry has an author. The inference to Justin Philpott is in §1.
  - Source: intent pass.
  - Fix (settled): add an owner line to `AGENTS.md`.
- **F2. Anyone may rewrite the intent, on the repo's own instructions.** Ambiguous, and an intent flag on a guard
  repair line.
  - Evidence: `INTENT.md:3`, `:139`; `AGENTS.md:27` "update INTENT.md and note why"; old guard `:68` (quoted in §1).
    Who authorised this is not recorded.
  - Source: intent pass.
  - Fix: Q2. Settled: the new guard carries the rule, keeps today's instruction for `INTENT.md` edits, and shows the
    question as open. The rest is in `provisional-q2`.
- **F3. The guard repairs drift by keeping two copies in step.** Ownership flag.
  - Evidence: old guard `:88` "If so, update both", against `:87`, "one obvious canonical home".
  - Source: intent pass.
  - Fix (settled): the new guard's repair is "One owner per concept".
- **F4. The validation batch is defined two ways.** Conflict.
  - Evidence: `DECISIONS.md:26` names "open source projects" and "more merged PRs". `INTENT.md:129-135`,
    `README.md:125` and `TODO.md:11-12` name docs-first planning repos and session-recovery measures. No decision
    records the change, and "Specialize first" (`:15-19`) names neither batch nor measure. Justin's words cite merged
    changes (§1).
  - Source: intent pass.
  - Fix: Q3; `provisional-q3`.
- **F5. Guard writing is defined in full by two skills, and one of them has no route in.** Missing decision, and
  parallel truth.
  - Evidence:
    - Two skills define it: `docs-first-planning-assessment` Phase 2 (`:132-202`) and
      `session-coherence-skill-generator` (`:198-315`), with different required contents (listed under Q1 in `questions.md`).
    - `INTENT.md:88` gives the generator role to the assessment workflow only.
    - Nothing routes to the generator: `README.md:21-66` does not route to it, and neither do `entropy-assessment`
      or `docs-first`.
    - `entropy-assessment:122` recommends "a lightweight general post-work guard" with no writer named.
    - No decision adopts the generator (`DECISIONS.md:9` calls it "the previous session-coherence-skill-generator").
    - `INTENT.md:80,94` say a guard carries a rationale and a system snapshot. The generator's template metadata
      holds only `generated` and `source` (`:274-280`).
    - The repo's own guard follows neither template.
  - Source: docs-first Steps 2 and 4.
  - Fix: Q1; `provisional-q1`.
- **F6. `guards-integrator` still says `entropy-assessment` generates guards.** Stale description.
  - Evidence: `skills/guards-integrator/SKILL.md:20`, against `DECISIONS.md:18`, which says `entropy-assessment` is
    now "triage and routing". `entropy-assessment` v0.6.0 generates nothing (`:30-159`).
  - Source: docs-first Step 2.
  - Fix (settled): "After one or more guards are generated or refined".
- **F7. Four decision entries describe a superseded `entropy-assessment` as current, unmarked.** Superseded material
  nearby.
  - Evidence: the entries at `DECISIONS.md:39-43`, `:47-51`, `:95-99` and `:113-117` describe its Phase 2, Steps 5–8
    or appendices, and their Impact lines are written in the present tense. The current skill has Steps 1–4 only.
    Only `:105` and `:131` carry supersession notes.
  - Source: docs-first Step 4.
  - Fix (settled): a "Partially superseded" note on each, citing "Specialize first".
- **F8. `explorations/` sits beside live truth, unlisted.** Superseded material nearby.
  - Evidence:
    - 4 files from March 2026; two have `status: draft` in their front matter.
    - They are absent from `README.md` "What's here" (`:82-115`) and `AGENTS.md` "Key Files" (`:36-47`).
    - They are linked from `LEARNINGS.md:122,132` and `PHILOSOPHY.md:45`.
    - `DECISIONS.md:26` says the sibling repo was "seeded with the exploration documents".
  - Source: docs-first Step 2. The files were read at their headers and Justin's lines only.
  - Fix (settled): list them as historical in both indexes.
- **F9. `LEARNINGS.md` restates conversation theory that `PHILOSOPHY.md` already explains.** Parallel truth, against
  a decision.
  - Evidence:
    - `LEARNINGS.md:117-143` (just-in-time generation, the four-component hierarchy, the layer hierarchy) repeats
      `PHILOSOPHY.md:73-114` in full.
    - `DECISIONS.md:139-143` places conceptual work from conversations outside `LEARNINGS.md`, and Justin farmed this
      line of work off (conversation `:713`).
    - `:123` reads as live direction: "The mature form collapses assess → fix with no persistent guard artifact".
      No decision adopts it.
  - Source: docs-first Steps 2 and 4.
  - Fix (settled): one pointer entry to `PHILOSOPHY.md`.
- **F10. The old guard has stale references.**
  - Evidence:
    - `:99` "README.md (Key Documents table)": `README.md` has no such table.
    - `:33` "use doc-health-check for that": no such skill exists (`TODO.md:20`).
    - `:92` "20+ markdown files": the snapshot has 17, counted with `find` on 2026-10-07.
    - `:21` "Last evaluated: 2026-04-07", which predates the generator's arrival on 2026-05-10.
  - Source: docs-first Step 7.
  - Fix (settled): the guard is rewritten, and the `TODO.md:20` wording is updated.
- **F11. The second generator carries residue from the repository it came from.**
  - Evidence: `session-coherence-skill-generator:22,193` name "FlowBook", which nothing else in this repo defines.
    Its metadata scheme (`:4-13`) differs from the other five skills' `metadata.version`.
  - Source: docs-first Step 4 ("Standalone residue").
  - Fix (settled): neutral wording. The metadata scheme is left alone; no decision governs it.
- **F12. Leftover scaffolding from the `seed` template.**
  - Evidence:
    - `AGENTS.md:21` "Working code with tests beats perfect code in progress", in a repo with no runtime (`:31`) and
      no tests (`:57`).
    - `.gitignore:17-25` covers Go, and `.editorconfig:11-18` covers Python, Go and Makefiles.
  - Source: docs-first Step 2.
  - Fix (settled): `AGENTS.md:21` only. The config entries have no effect and are left.
- **F13. A prose control.**
  - Evidence:
    - `AGENTS.md:19` "This is non-negotiable" and `:41` "mandatory". Nothing enforces either.
    - `.githooks/pre-commit` ends `exit 0` (`:9`), and it is enabled only by linking it into each clone
      (`README.md:140`).
    - The commit-note convention (`README.md:138`) is checked by nothing.
    - The guard cites the hook as its integration (`:22`), and `README.md:78` describes it honestly as
      non-blocking.
  - Enforcement would sit in the hook's enablement in each clone, or in a commit-message check, which would need
    Justin's decision.
  - Source: intent pass.
  - Fix: `integration.md`; the commit note is now a guard check.
- **F14. The state file cannot orient a fresh session, and it lags the newest work.** State dishonesty.
  - Evidence:
    - `TODO.md`, the state file (`AGENTS.md:22`), has no stage, no trusted documents, no settled decisions, no open
      questions and no warning about misleading material. Those are what `LEARNINGS.md:7-13` says docs-first repos
      need.
    - The generator's arrival (2026-05) is in no item.
    - `TODO.md:3` points at a future issue tracker, while issues are already in use (`#9`–`#12` at `DECISIONS.md:17`;
      `agent-feedback` issues from `entropy-guard-feedback:44-51`). `TODO.md` does not link them.
  - Source: docs-first Steps 3 and 5.
  - Fix (settled): a "Current state" section; §9.
- **F15. The generator's guards would carry no integration, against a recorded decision.** Unauthorised drift, so the
  work is fixed.
  - Evidence: `DECISIONS.md:90` says "Generators must produce guards that include integration instructions... The
    guard output should specify its own enforcement mechanism". The required contents of
    `session-coherence-skill-generator` (`:213-227`) and its template (`:273-315`) have no integration section.
  - Source: intent pass.
  - Fix (settled): add the requirement and a template section.
- **F16. `LEARNINGS.md` names things that are gone.**
  - Evidence: `:63` "Led to the distill-article skill", which is not in this repo; where it lives was not verified.
    `:87-93` builds on "all four domain generators", which were deleted (`DECISIONS.md:134`).
  - Source: docs-first Step 4.
  - Fix (settled): notes on both.
- **F17. The guard's workflow check repairs by rewriting instructions.** Intent flag.
  - Evidence: old guard `:78` "If not: update the workflow docs now". It never establishes whether the practice or
    the instruction is wrong.
  - Source: intent pass.
  - Fix (settled): the new workflow check, the Repairs section, and the rule's step 6.
- **F18. The decision log cannot be put in order.**
  - Evidence: the entries carry no dates or authors. The order is mostly newest first (`:131` refers to "above"), yet
    "Two-layer generator architecture" (`:103`) sits above the "Consolidate" entry that supersedes it (`:105` says
    "below"). Staleness can be judged only from cross-references.
  - Source: intent pass.
  - Fix: recommendation only (§7). The three proposals added are dated and attributed.

---

## 4. Truth map

| Concept | Canonical home | Other places (link, summary, or problem) |
|---|---|---|
| What the repo is for, its scope | `INTENT.md` + Justin's recorded words | summaries: `README.md:3-7,119-125`, `AGENTS.md:3,34` |
| Entropy dimensions, enforcement depth | `INTENT.md:21-109` | linked from `README.md:73`; applied in docs-first Step 8 and integrator Step 3 |
| Next validation loop | **conflict**: `DECISIONS.md:26` against `INTENT.md:122-135` (F4) | `README.md:125`, `TODO.md:11-13` |
| Front-door routing | `skills/entropy-assessment/SKILL.md` | summaries: `README.md:25-48`, `INTENT.md:71`, `AGENTS.md:43`; decision `DECISIONS.md:15-19` |
| How a guard is written | **two homes**: docs-first Phase 2 and `session-coherence-skill-generator` (F5) | `INTENT.md:75-96` names only the first |
| Guard integration | `skills/guards-integrator/SKILL.md` | `INTENT.md:90`, `README.md:60` |
| This repo's ritual | `skills/local/entropy-guard/SKILL.md` | pointers: `AGENTS.md:19,41`, `README.md:76-78,137`, the hook |
| Working practices | `AGENTS.md` | summary: `README.md:131-140` |
| Upstream feedback | `skills/local/entropy-guard-feedback/SKILL.md` | `AGENTS.md:72`, closing sections of three skills, `DECISIONS.md:63-67` |
| Just-in-time and temporal theory | `PHILOSOPHY.md:41-126` (per `DECISIONS.md:139-143`) | **full restatement** in `LEARNINGS.md:117-143` (F9); source conversation in `explorations/` |
| Decisions / tactical learnings | `DECISIONS.md` / `LEARNINGS.md` | — |
| Live work | `TODO.md` | GitHub issues, not linked (F14) |

Each document's role:
- **Canonical:** `INTENT.md`, `DECISIONS.md`, `AGENTS.md`, `LEARNINGS.md`.
- **Current state:** `TODO.md`.
- **Summary:** `README.md`.
- **Product artifacts:** the four exportable skills, the two local skills, and `.githooks/pre-commit`.
- **Reflections:** `PHILOSOPHY.md`.
- **Historical:** `explorations/`.
- **Imported:** traces from FlowBook in the generator.
- **Template residue:** `.gitignore`, `.editorconfig`.
- **Local elaborations:** none.

## 5. Loop map

As documented; the real loop could not be observed, because the snapshot has no history.
- **Session start:** the agent loads `AGENTS.md`, follows Quick Links to `README.md` and `INTENT.md`, then reads
  `TODO.md`. "Doing Now" is empty, and there was no current-state section before this patch.
- **During work:** the agent writes "Doing Now" before starting (`AGENTS.md:22`). Upstream feedback becomes GitHub
  issues (`entropy-guard-feedback`), not `TODO.md` items.
- **Capture:** decisions go to `DECISIONS.md` and learnings to `LEARNINGS.md`, prompted by the guard at session end.
- **Coherence pause:** the local guard runs after meaningful work, before commit (`AGENTS.md:19`). The hook reminds
  only if it is enabled in that clone.
- **Handoff:** the commit. Its message is derived from "Doing Now" and carries the guard's note (`README.md:138`);
  then "Doing Now" is cleared. No PR template and no CI exist.
- **Periodic:** `INTENT.md:82` asks for the assessment to be re-run on this repo. The last recorded run was
  2026-04-07 (old guard `:21`); this assessment is the next.

## 6. Ranked risks

- **R1. Parallel truth in guard writing** (F5, F15).
  - Decay: medium; each edit to either skill widens the gap.
  - Recovery: high. Guards generated from two templates spread into other repos, and reconciling them later means
    regenerating guards in the field.
  - Symptoms: two templates with different required sections; `INTENT.md` and `README.md` name one route; the
    repo's own guard follows neither.
  - Anchor: a recorded answer to Q1, then `INTENT.md` "The guard lifecycle".
- **R2. Any session may rewrite the intent** (F2, F17).
  - Decay: slow.
  - Recovery: very high. `INTENT.md:33` calls intent entropy "catastrophic to recover".
  - Symptoms: three instructions tell contributors to update `INTENT.md` or the workflow documents to match their
    work, and no one is named to decide.
  - Anchor: a recorded answer to Q2.
- **R3. Superseded material beside live truth** (F7, F8, F9, F16).
  - Decay: slow to medium.
  - Recovery: medium.
  - Symptoms: decisions that describe a removed Phase 2 in the present tense; a learning that directs the product
    toward no persistent guard; unlisted draft explorations.
  - Anchor: `DECISIONS.md` "Specialize first", "Farm broader", and "LEARNINGS.md stays tactical".
- **R4. The state file does not orient a session** (F14, F4).
  - Decay: fast.
  - Recovery: low to medium.
  - Symptoms: no stage or open questions in `TODO.md`; the newest work is absent from it; the validation measure is
    in conflict.
  - Anchor: `TODO.md`.
- **R5. The guard's own drift and adoption** (F10, F3, F13).
  - Decay: medium.
  - Recovery: low.
  - Symptoms: stale names, an "update both" repair, and an adoption that cannot be verified.
  - Anchor: the guard and `AGENTS.md` "Working Practices".

## 7. Recommendations

- **Consolidate:** one guard writer, once Q1 is answered (`provisional-q1`).
- **Demote:** the three theory entries in `LEARNINGS.md` become a pointer to `PHILOSOPHY.md` (F9).
- **Mark historical:**
  - `explorations/` (F8);
  - the four `DECISIONS.md` entries (F7);
  - the "Step 0" learning (F16).
- **Guard:** update in place (§10, §11).
- **Proposal, not applied:** date and attribute each new `DECISIONS.md` entry, so that staleness can be judged by date
  (F18). This changes a convention, so it is Justin's call. Its stakes are low, so it is not one of the questions.
- **Integration:** verify that the hook is enabled, then show one real guard run (`integration.md`, F13).

## 8. One-time cleanup

Every item in `patches/settled.diff` was checked against the current file at the line cited:
- `AGENTS.md`: `:3` gets the owner line (F1); `:21` (F12); `:47` gets explorations (F8).
- `DECISIONS.md`: three proposals at the top (F2, F4, F5); supersession notes at `:39`, `:47`, `:95`, `:113` (F7).
- `LEARNINGS.md`: `:63` and `:87` (F16); `:117-143` become one pointer entry (F9).
- `README.md`: a "Historical" table after `:115` (F8).
- `TODO.md`: "Current state", the new Next Up item, and `:20` (F14, F10).
- `skills/guards-integrator/SKILL.md:20` (F6).
- `skills/session-coherence-skill-generator/SKILL.md`: `:22-23` and `:193-194` (F11); after `:224-225`, plus a template
  section before the template's `## Output` at `:309` (F15).
- `skills/local/entropy-guard/SKILL.md`: replaced by `guard/SKILL.md` (F2, F3, F10, F17).

Tracked in `TODO.md`, not in the guard: the Next Up item "Justin answers the three open questions above".

## 9. State-file update

The update is to `TODO.md`, the existing state file (`AGENTS.md:22`); no new summary file was added. The patch is in
`patches/settled.diff`. It adds a "Current state" section with these parts:
- a line saying what makes it stale, and who refreshes it;
- the stage, sourced;
- the documents to trust first;
- three settled decisions, by `DECISIONS.md` entry;
- the three open questions, pointing at their proposals;
- misleading material nearby (`explorations/`, `PHILOSOPHY.md`);
- where upstream feedback lives, stating that open issues were not checked;
- one next action at the top of Next Up.

Claims that may change carry 2026-10-07 as the date they were checked. "Doing Now" is left empty, as a finished
session would leave it.

---

## 10. Guard inputs (docs-first Step 7) and the guard decision

**Existing guard surfaces:**

| Surface | Verdict | Why |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | amend: rewritten in place to the generator's contract | F2 F3 F10 F17; path, name and the one-guard design kept (`DECISIONS.md:55-59`) |
| `AGENTS.md` "Working Practices" | amend | F1, F12; `:27` waits on Q2 |
| `.githooks/pre-commit` | keep | its text names the guard and "Doing Now" correctly (`:4,6`); enabling it is integration (F13) |
| `README.md` "Contributing" | keep | accurate summary; its step 4 is now a guard check |
| `TODO.md` | amend | F14 |
| `DECISIONS.md`, `LEARNINGS.md` | amend | F7 F9 F16, plus the proposals |
| `skills/local/entropy-guard-feedback/` | keep | — |
| CI, PR templates | none exist | — |

**The matrix's checks, written against this repo's files** (the lines are in `guard/SKILL.md` "Checks"):
- **Parallel truth:** "is it still explained in one home only (see 'Homes')"; and the "One owner per concept" repair.
- **Local-global inversion:** not applicable; there are no component notes.
- **Superseded nearby:** "Before restoring ... does `DECISIONS.md` or `TODO.md` record that it was superseded?"
- **Stale references:** "do `AGENTS.md` 'Key Files' and `README.md` 'What's here' list it correctly? Grep each old
  name, and run the link check".
- **Lost decisions and learnings:** the `DECISIONS.md` / `LEARNINGS.md` check, with theory routed to `PHILOSOPHY.md`.
- **State dishonesty:** the standing `TODO.md` check, plus "Doing Now" and the "Current state" staleness line.
- **Workflow drift:** "would a fresh agent starting from `AGENTS.md` do what this session did"; the issue-URL check;
  the commit-message check.
- **Brittle automation:** only whitespace and relative links are automated.
- **Product artifacts** (docs-first Step 2): the standing skill check (role, inputs, handoffs) and the skill/intent
  check.

**Guard decision: `update`.** A guard exists and is in use. It needs these amendments:
- its repairs (F2, F3, F17);
- its stale references (F10);
- the contract's missing sections: modes and safety, a bound baseline, and commands.

**The generator's inputs:**
- **Steward:** Justin Philpott (inferred, F1).
- **Authorised intent:** `INTENT.md`; `README.md` "Project status"; `AGENTS.md` "Project Constraints"; Justin's words
  in `explorations/2026-03-24-...:86,713`.
- **Decision surface:** `DECISIONS.md`.
- **Open intent questions:** Q1–Q3.
- **Current-state file:** `TODO.md`. Whoever completes the work refreshes it (`AGENTS.md:22`, and the new staleness
  line).
- **Rules bound but not owned:** the agentskills.io skill format (`DECISIONS.md:79-83`). Any user-wide agent
  instructions: **unresolved**, because none is visible in the snapshot.
- **Verification commands:** none exist (`AGENTS.md:49-58`), and none runs by itself, since there is no CI. Added to
  the guard: whitespace, grep, and the link check.
- **Code areas:** **inapplicable**, as there is no code. The product areas are the skills, mapped to `README.md`,
  `AGENTS.md` and `INTENT.md` in the standing check.
- **Live state or spend:** none is billed. The only live effect is GitHub issues filed by `entropy-guard-feedback`,
  which is now a guard check.
- **Findings:** F1–F18.

## 11. Guard generation (from `session-coherence-skill-generator`)

- **Supplied:** this assessment and its inputs (§10). **Found in addition:** nothing.
- **Decision:** `update`.
- **Path:** `skills/local/entropy-guard/SKILL.md`, updated in place. The delivered copy is `guard/SKILL.md`.
- **Name:** kept as `entropy-guard`, because it must match its folder (`DECISIONS.md:81`).
- **Size: 1,175 words** (`wc -w`), against a **budget of 1,153** words. The budget's terms:
  - common contract: 706. I re-measured it on 2026-10-07: the template is 558 words, minus the 16-word rule
    placeholder, plus the 164-word rule;
  - checks: 9 repo-specific checks beyond the template's two, at 36 words each, which makes 324. Their actual size is
    267;
  - pointers: 57 words of filled-in "Where things live" values;
  - commands: 66 words.
- **The excess** of 22 words is the 57-word "Open, awaiting Justin Philpott" paragraph in the Intent section. It is an
  unresolved input that must stay visible, and it has no budget term (`feedback.md` item 2). `provisional-q2`
  removes it, which brings the guard to 1,118 words, under budget. Nothing required was cut.
- **Review before handover:**
  - the guard carries "Modes and safety", and it binds its baseline ("What changed this session");
  - every proposed change is sorted (§12);
  - no repair instruction edits authorised intent to match the work. The one existing path (F2) is kept as it stands
    and shown as open, not enforced in either direction;
  - the size was compared with the budget, above.
- **Doc references:** none added, because the path is unchanged. `AGENTS.md:19,41`, `README.md:78,97,137` and
  `.githooks/pre-commit:4` already name it.
- **Validation run on 2026-10-07:**
  - `patches/settled.diff` applies cleanly to a fresh copy of the target with `patch -p1`, and the result matches the
    intended tree;
  - each provisional patch applies cleanly on top of it, alone, and all three apply in sequence;
  - `git diff --no-index --check` reports no whitespace errors in the settled or the provisional changes;
  - the guard's link check finds no broken links in the patched tree (under `sh`, on a scratch git copy) and catches a
    planted broken link.
  - Generator Step 1 (record the work in `TODO.md` "Doing Now") was not possible on a read-only target.
- **Open questions the guard leaves visible:** Q2, in its Intent section, and all three questions through its
  "Decisions" pointer.
- **Handoff:** to `guards-integrator`, in `integration.md`.

## 12. Patches, sorted

- **`patches/settled.diff`** touches no open question: F1 F3 F6 F7 F8 F9 F10 F11 F12 F14 F15 F16 F17. It also records
  Q1–Q3 as dated proposals, which decides nothing, because `intent-pass.md` step 5 prescribes recording them.
- **`patches/provisional-q1.diff`** waits for Q1. It edits `INTENT.md:88,94`, `README.md:52,89,91`, `AGENTS.md:46`,
  `entropy-assessment:122`, `docs-first-planning-assessment:3,17,132-134,196`, and the generator's opening (`:16-20`).
- **`patches/provisional-q2.diff`** waits for Q2. It edits `INTENT.md:3,139` and `AGENTS.md:27`, and removes the
  guard's open-question paragraph.
- **`patches/provisional-q3.diff`** waits for Q3. It edits `INTENT.md:131,135`, `README.md:125` and `TODO.md:12`.
- Line numbers are the original target's. Each provisional patch applies on its own after `settled.diff`.

## 13. Not covered, and uncertainties

- **No `.git`:** enacted intent comes from dated metadata only. The real loop (guard runs, commit messages) and
  whether the hook is enabled could not be observed.
- **Not read:**
  - GitHub issues `#9`–`#12` and the `agent-feedback` issues, because there was no web access;
  - the sibling `entropy-immune-system`, and the `writing` and `seed` repositories, so I did not check whether the
    explorations or `distill-article` live there;
  - the `explorations/` files beyond their headers and Justin's lines.
- **Unattributed decisions:** the `DECISIONS.md` entries are treated as decisions, but whose they are is unknown
  (F18). The steward is inferred (F1).
- **Rationale:** `INTENT.md:80` says a good guard comes "with rationale". The rewritten guard, following the contract,
  carries none per check; the rationale is in this file's findings. Whether that satisfies `INTENT.md:80` is part of
  what Q1 settles.
- **The rule's source:** the guard's copy of the intent-change rule names entropy-guard's
  `skills/entropy-assessment/intent-change-rule.md`, which does not exist in this older snapshot (`feedback.md`
  item 3).
- **Shape:** D also fits in part (§2).
