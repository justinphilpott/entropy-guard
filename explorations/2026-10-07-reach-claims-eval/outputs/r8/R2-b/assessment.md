# Entropy assessment: entropy-guard snapshot `447da9a`

- **Target:** `scratchpad/eval/targets/entropy-guard-447da9a`, a read-only snapshot of the entropy-guard repository with
  no `.git`. Read in full on 2026-10-07, except `explorations/`, which was read through its headers and by searching
  for steward statements and for links.
- **Route:** `entropy-assessment` (intent pass) → shape A → `docs-first-planning-assessment` as a called skill, Steps
  1–7 → guard decision `update` → `session-coherence-skill-generator` → `guards-integrator`.
- **Mode:** build for this output folder. The target cannot be edited, so every change to it is delivered as a patch,
  and the generator's Step 5, "Mention the guard in the operator docs", ran in plan mode.
- **Other outputs:** `questions.md` holds Q1–Q4. `patches/settled.patch` can be applied now. `patches/provisional.patch`
  waits for the steward's answers. `guard/SKILL.md` is the updated guard, `integration.md` the integration brief, and
  `feedback.md` an upstream note on entropy-guard.

## 1. Intent

**Steward.** No document names one (F1). The evidence points to Justin Philpott:
- the feedback skill files issues on the GitHub repository `justinphilpott/entropy-guard`
  (`skills/local/entropy-guard-feedback/SKILL.md:10,47`);
- he makes scope decisions in his own words in `explorations/2026-03-24-entropy-immune-system-conversation.md:86,713`.

This is an inference, and it is held open as Q4.

**Authorised intent, and the source of each part.** None of these sources is attributed to the steward, and only
INTENT.md is dated. The steward's own words survive only in the exploration transcripts.

| Part | Source | Kind | Authority |
|---|---|---|---|
| Purpose: skills and frameworks that keep iterated systems coherent; guards are delta-scoped, low-burden and not audits | `INTENT.md:9-119`, `README.md:3,11-15` | directive (north star, per `AGENTS.md:8,38`) | dated 2026-04-07 (INTENT.md:5), unattributed |
| Scope: stay practical; the broader theory goes to the sibling `entropy-immune-system` repo | `DECISIONS.md:23-27`; steward, conversation:713 ("let's keep them in explorations, as I want to preserve the entropy-guard project and really farm this new evolution off into its own repo") | decision; steward statement | decision neither attributed nor dated; statement attributed and dated 2026-03-24 |
| `entropy-assessment` is the front door and router; docs-first planning is the specialized path | `DECISIONS.md:15-19`, `INTENT.md:71,129` | decision | neither |
| One combined local guard; maturity runs External → Prompted | `DECISIONS.md:31-35,55-59` | decision | neither |
| Next phase: an external validation batch | `INTENT.md:122-135`, `README.md:125`, `TODO.md:11-13`, `DECISIONS.md:26` | directive and decision | the success measure is in conflict (F5) |
| What the work is valued for: changes suggested to unfamiliar systems that get merged | steward, autopoiesis:22 (2026-03-19); conversation:86 (2026-03-24) | steward statement | attributed and dated |

**Three readings.**
- **Declared:** as in the table above.
- **Enacted:** there is no commit history, so this is read from dates in the files. The newest dated work is
  `session-coherence-skill-generator`, with metadata of 2026-05-10 and 2026-05-11; its bootstrap mode is covered by
  `DECISIONS.md:7-11`. The validation batch in TODO.md's Next Up has no recorded results, so it shows no sign of having
  started.
- **Authorised:** the steward's recorded words agree with the declared scope. They value merged changes more than the
  measures the declared documents list (F5).

**Gaps, by condition.** Evidence for each is in its finding.

| Condition | Gap |
|---|---|
| Missing | F1: no steward is named |
| Ambiguous | F2: whether INTENT.md's invitation to "refine" it lets agents change the direction of intent |
| Conflict | F4: who writes guards. F5: what the validation batch measures |
| Stale description | F6: decision entries describe a structure that a later decision replaced. F12: the integrator says entropy-assessment generates guards |
| Prose control | F11 |

Flags from reading the existing guard against `intent-change-rule.md`:
- **Intent:** `skills/local/entropy-guard/SKILL.md:68`, "if INTENT.md itself needs revision, update it with a dated
  note explaining what prompted the change". This repair gives a path for unauthorised drift; see F2.
- **Ownership:** the same file, line 88, "Did you change something that another doc also describes? If so, update
  both."; see F3.

**Questions:** Q1–Q4 in `questions.md`, each with a recommended answer.

**Proposed changes and where they are recorded.** Q1–Q3 are recorded as "Proposed, awaiting the steward" entries at
the top of DECISIONS.md (in the settled patch). TODO.md's new "Current state" section links to them and to Q4. The work
that depends on the answers is in the provisional patch.

## 2. Lifecycle, shape, repositories

- **Lifecycle: active.**
  - `README.md:5` says "actively used, actively refined", and `README.md:119` says "Actively evolving".
  - TODO.md's Next Up holds three open items (`TODO.md:11-13`).
  - The newest dated change is from 2026-05-11. Its recency against today cannot be judged without history.
- **Shape: A, docs-first planning.** D, workflow-heavy, also fits; I took A as the riskier of the two.
  - It is markdown-first, with no application runtime (`AGENTS.md:31,51`). 17 of its 21 files are markdown.
  - State is carried by `TODO.md`, `DECISIONS.md` and `AGENTS.md`, and work happens in repeated sessions.
  - The product is itself markdown: skills whose names, paths and handoffs act as contracts.
  - D fits because the exported product is a way of working. But the workflow surface is thin: one 9-line hook that
    only reminds, and one standing instruction. The observed drift is docs-to-docs (F4–F8).
- **Repositories: one.** It refers to three other places, none of which manages this repository's work:
  - the sibling `../entropy-immune-system/`, a spin-off holding the theory, outside scope and not read;
  - `justinphilpott/seed` (the scaffolding source) and `justinphilpott/writing` (articles);
  - GitHub issues on `justinphilpott/entropy-guard`, which feed decisions (`DECISIONS.md:17` cites #9–#12). These
    were not read, because no web access was allowed.

**Planning horizon.**
- **Settled:** the front door and the docs-first specialization; one local guard; External → Prompted; the theory
  farmed out; the agentskills.io skill format; the `skills/` versus `skills/local/` split.
- **Active:** the validation batch; refining the docs-first method.
- **Exploratory:**
  - a guard runner (`TODO.md:18`);
  - more specialized tracks (`TODO.md:19`);
  - `doc-health-check` (`TODO.md:20`);
  - validation on a repository with several domains (`TODO.md:17`);
  - layer 1–2 and just-in-time guarding (`LEARNINGS.md:117-143`, now the sibling repo's subject).
- **Open:** Q1–Q4.

## 3. Findings

All line numbers refer to the snapshot as read on 2026-10-07.

- **F1. No steward is named.** `README.md`, `INTENT.md`, `AGENTS.md` and `DECISIONS.md` name no decision-maker, and
  no DECISIONS.md entry has an author. `LICENSE:3` reads "Copyright (c) 2026 entropy-guard". The indications are in
  §1. *Source: intent pass §1.* Open: Q4.

- **F2. The intent documents invite agents to change intent directly.** The sources:
  - `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents — … When you update it, note
    the date and what prompted the revision."
  - `INTENT.md:139`: "If you find something missing, imprecise, or worth expanding — add it."
  - `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
  - `skills/local/entropy-guard/SKILL.md:68`, quoted in §1.

  Against these, the steward endorsed escalation over "autonomous overreach" (conversation:540-543, 2026-03-24). That
  was in a discussion of the sibling project's ideas, not a directive about INTENT.md. *Ambiguous* (readings in Q1).
  This carries the highest recovery cost in the repo: INTENT.md:33 itself says intent entropy is "catastrophic to
  recover". Open: Q1.

- **F3. A guard repair keeps two definitions in step.** `skills/local/entropy-guard/SKILL.md:88` says "If so, update
  both", one line after its own check for "one obvious canonical home" (line 87). *Source: ownership flag.* Fixed in
  the settled patch.

- **F4. Two skills write guards, and the catalogue documents disagree about which.**
  - `docs-first-planning-assessment` Phase 2 (lines 132-202) and `session-coherence-skill-generator` (lines 198-231
    and its template, 268-315) each define what a guard holds, differently. Only the generator requires modes and
    safety rules (lines 213-227). Only docs-first requires supersession and canonical-ownership checks (lines
    160-168). Neither mentions the other.
  - `INTENT.md:86-88` gives the generator role to the assessment skills. `README.md:91` and `AGENTS.md:46` give it to
    `session-coherence-skill-generator`. `guards-integrator:20,221` says `entropy-assessment` generates guards (F12).
  - The `entropy-assessment` fallback (Step 4d, `SKILL.md:121`) can recommend a new guard but names no skill to write
    it.
  - By the generator's own requirements, this repo's reference guard does not conform: it has no modes and no safety
    rules.

  *Conflict; parallel truth.* Open: Q3.

- **F5. Two different success measures for the validation batch.** `DECISIONS.md:26` says "track whether that
  produces more merged PRs". `INTENT.md:135`, `README.md:125` and `TODO.md:12` say clearer session recovery, fewer
  reintroduced stale ideas and more coherent docs. The steward's own words value merged changes (autopoiesis:22;
  conversation:86). The next phase is stated in four places. *Conflict.* Open: Q2.

- **F6. Decision entries describe a structure that no longer exists, and are not marked.** Four entries describe
  `entropy-assessment` as generating guards (Phase 2) or as holding domain appendices:
  - "Entropy assessment should support guard refinement…" (`DECISIONS.md:39-43`);
  - "Add workflow/process as a first-class assessment domain" (47-51);
  - "Guard generation should produce immediate integration advice…" (95-99);
  - "Rename entry point…" (113-117).

  The later "Specialize first…" decision (15-19) made `entropy-assessment` "triage and routing", and the skill itself
  (`skills/entropy-assessment/SKILL.md:12,73-126`) has no Phase 2 and no appendices. *Stale description.* Markers
  added in the settled patch.

  Left as they are: `LEARNINGS.md:33,93,112` cite the old step numbers. They record what was learned at the time.

- **F7. DECISIONS.md has no dates and no consistent order.** "Two-layer…" (line 103) is "Superseded by
  'Consolidate…' below" (129), and "Consolidate…" is "Partially superseded by 'Specialize first…' above" (15). So a
  newer entry can sit above or below an older one, and position does not show precedence. The guard's supersession
  check depends on these notes. Fixed in the settled patch: a header note, and a rule that new entries carry a date
  and who decided.

- **F8. Superseded or foreign material sits near live truth.** Fixed in the settled patch.
  - `explorations/` holds four files, two marked `status: draft`. It is not listed in `README.md` "What's here" or in
    AGENTS.md's Quick Links or Key Files, yet the thread "now continues" in the sibling repo (`README.md:7`,
    `DECISIONS.md:26`). The steward chose to keep the files here (conversation:713), so they are labelled, not moved.
  - `session-coherence-skill-generator:22,193` refers to "FlowBook", which nothing in the repo introduces.
  - `LEARNINGS.md:63` cites a "distill-article skill" that is not in the repository.

- **F9. The guard itself has stale references.** Fixed in the settled patch, and absent from `guard/SKILL.md`.
  - `skills/local/entropy-guard/SKILL.md:99` names a "README.md (Key Documents table)". The README has no such table;
    it has the "What's here" tables.
  - `:33` says "use doc-health-check for that", but `doc-health-check` does not exist (`TODO.md:20`).
  - `:92` says "20+ markdown files"; there are 17.

- **F10. The guard has no baseline, no modes or safety rules, no intent-change rule, and no coverage report.**
  - "Work through each question in the context of what you just did" (`:38`) sets no starting point for what
    changed.
  - Its "Guard metadata" block (`:18-22`) holds state that belongs in the state file.

  This is what makes the guard decision `update`.

- **F11. A prose control.** `AGENTS.md:19` calls running the guard before committing "non-negotiable". The only
  mechanism is `.githooks/pre-commit`, which prints a reminder and always exits 0 (line 9), and only in clones that
  link it (`README.md:140`, `AGENTS.md:19`). `README.md:78` states as fact that the project "runs its own entropy
  guard before every commit", which also contradicts AGENTS.md:19's exception for trivial changes.
  - **Where enforcement would sit:** nothing can enforce a judgment ritual. The prompt is the hook, and the evidence is
    the result line in the commit message (`README.md:138`).
  - **Cited as a control:** yes, by `README.md:78`. Reworded in the settled patch.
  - **Not checkable here:** whether the hook is enabled, or whether the guard is actually run (no `.git`).

- **F12. The integrator gives `entropy-assessment` a role it no longer has.** `skills/guards-integrator/SKILL.md:20`
  says "After `entropy-assessment` generates one or more guards", and `:221` says "If the assessment skill generated
  the guards…". This contradicts `DECISIONS.md:18`. *Stale description.* The settled patch rewords both neutrally,
  without naming a writer, because that is Q3.

## 4. Truth map

These are the document roles, from docs-first Step 2:

- **Canonical:** `INTENT.md` (purpose, scope, guard principles), `DECISIONS.md` (settled choices), `AGENTS.md`
  (working practice).
- **Current state:** `TODO.md`.
- **Product artifacts:** `skills/*/SKILL.md` and `skills/local/*/SKILL.md`.
- **Elaboration:** `LEARNINGS.md` (canonical for learnings) and `PHILOSOPHY.md` (free-form, not a source of truth).
- **Historical:** `explorations/`.
- **Scaffold residue, harmless:** `.gitignore` (Go entries) and `.editorconfig`.

| Concept | Canonical home | Other mentions (role) | State |
|---|---|---|---|
| Purpose, scope, guard principles | INTENT.md | README.md:3-23,119-127; AGENTS.md:3,29-34 (summaries) | agree |
| Settled decisions | DECISIONS.md | INTENT.md, README.md (summaries) | F6, F7 |
| Current state and next work | TODO.md | INTENT.md:122-135, README.md:121-127, DECISIONS.md:26 | four statements of the next phase; F5 |
| Working practice, guard trigger | AGENTS.md "Working Practices" | README.md:131-140 (summary); `.githooks/pre-commit` (reminder); guard §4, §9 | agree; F11. Hook enablement is stated in full twice (AGENTS.md:19, README.md:140), which is consistent and low risk |
| Who writes guards, and what a guard holds | **none: two definitions** | docs-first Phase 2; the generator; INTENT.md:86-88; README.md:52,91; AGENTS.md:46; integrator:20,221 | F4, F12 |
| Skill catalogue | each skill's frontmatter `description` | README.md "What's here", AGENTS.md "Key Files", INTENT.md "The guard lifecycle" (summaries) | disagree on the generator (F4) |
| Broader theory | the sibling `entropy-immune-system` | `explorations/` (historical), PHILOSOPHY.md | F8 |
| Upstream feedback | `skills/local/entropy-guard-feedback/` | entropy-assessment:140-150, docs-first:206-217, integrator:163-175, AGENTS.md:70-72 | agree |

## 5. Loop map

The documented loop, as far as the evidence allows; there is no history to compare it with:

1. A fresh session starts at `AGENTS.md`, the seed-scaffolded instructions. It reads `INTENT.md` before significant
   design (AGENTS.md:27,38) and `TODO.md`.
2. Work is tracked in TODO.md's "Doing Now", written before starting and cleared at commit (AGENTS.md:22, and the
   hook's text).
3. Decisions and learnings are captured during the guard run (guard §1–2).
4. Coherence pause: the guard runs before commit (AGENTS.md:19), with a reminder from the hook if the clone has linked
   it.
5. Handoff: the commit, whose message carries the guard's note (README.md:138). There is no PR template and no CI.
6. Feedback on entropy-guard itself goes to GitHub issues, through the feedback helper.

"Doing Now" reads `[empty]`, which matches the documented clearing. Nothing else about the real loop can be observed.

## 6. Ranked risks

| # | Risk | Findings | Decay | Recovery cost | Anchor for the fix |
|---|---|---|---|---|---|
| 1 | Intent changed by agents with no recorded decision | F2, F1 | slow | very high (INTENT.md:33) | Q1, then DECISIONS.md |
| 2 | Parallel truth about who writes guards | F4, F12 | medium: the generator gained bootstrap mode within a day (2026-05-10 to 11) with no docs-first counterpart | high: exported, so other repos get differently shaped guards | Q3, then one DECISIONS.md entry |
| 3 | Superseded material nearby | F6, F7, F8 | medium | medium: a fresh session can revive "Phase 2" or treat draft explorations as live | DECISIONS.md "Specialize first…" |
| 4 | Parallel truth about the next phase and its measure | F5 | medium | low to medium | Q2, then INTENT.md "Scope boundary" |
| 5 | Stale references and prose control in the guard and its docs | F3, F9, F10, F11 | fast | cheap now | the guard update and the settled patch |

## 7. Recommendations and one-time cleanup

These are the docs-first Step 6 recommendations:
- **Consolidate:** guard writing under one owner (Q3), and the next-phase statement under INTENT.md "Scope boundary",
  with README.md and TODO.md as summaries (Q2).
- **Mark as historical:** the four DECISIONS.md entries (F6) and `explorations/` (F8).
- **Demote:** nothing.
- **Remove:** the FlowBook residue.

**One-time cleanup.** Every hunk was verified against the current file on 2026-10-07 and is in
`patches/settled.patch`. Its header maps each hunk to a finding. The patch applies with `patch -p1` to the snapshot.

**State-file update (docs-first Step 5).** TODO.md gains a "Current state" section, which is the first hunk of the
settled patch. It holds:
- the stage;
- the documents to trust first;
- the settled decisions, by pointer;
- the open questions, by pointer;
- the misleading material nearby;
- two next actions;
- a check date, what makes it stale, and who refreshes it.

It answers no question, and states nothing beyond what the cited files show.

## 8. Guard surfaces and guard inputs (docs-first Step 7)

| Surface | Verdict |
|---|---|
| `skills/local/entropy-guard/SKILL.md` | **amend**: update in place to the generator's contract (`guard/SKILL.md`). Its checks on decisions, learnings, workflow, supersession, cross-references and TODO.md are kept |
| `AGENTS.md:19` standing instruction | keep |
| `AGENTS.md:27` | amend, provisional on Q1 |
| `.githooks/pre-commit` | keep; integration.md proposes stable mechanical warnings for later |
| `README.md` "Contributing" | keep |
| `TODO.md` | keep; add "Current state" |
| `DECISIONS.md`, `LEARNINGS.md` | keep; header note and supersession markers |
| `entropy-guard-feedback` | keep. It is not a guard |

The docs-first checks, as they apply to this repo's files, each map to a check in `guard/SKILL.md`:

| Docs-first risk | Guard check | Findings |
|---|---|---|
| Parallel truth | catalogue agreement; one-owner repair | F4 |
| Superseded material nearby | supersession check before revival | F6–F8 |
| Stale references | skill-contract search, link and frontmatter commands | F9, F12 |
| Lost decisions and learnings | DECISIONS.md and LEARNINGS.md capture, with date and decider | F7 |
| State dishonesty | TODO.md claims and hygiene | |
| Workflow drift | the AGENTS.md-alone check; the hook check | F11 |
| Brittle automation | only links, frontmatter names and whitespace are scripted; the rest stays judgment | |

Two checks come from the old guard's skill-and-intent and placeholder checks, and one, "changed text claiming a
check runs", comes from F11.

**Guard decision: `update`.** An existing guard needs amendment (F3, F9, F10, and the intent flag in F2).

**Generator inputs:**
- **Steward:** unresolved (F1, Q4).
- **Intent documents:** `INTENT.md`; `README.md` "Project status"; `AGENTS.md` "Project Constraints".
- **Decision surface:** `DECISIONS.md`.
- **Open intent questions:** Q1–Q3.
- **Current-state file:** `TODO.md`, refreshed by whoever closes the session (AGENTS.md:22, and the guard).
- **Rules owned elsewhere:** the agentskills.io skill format (`DECISIONS.md:79-83`). No user-wide instructions,
  security or spending policy, or merge rules are visible in the snapshot; anything beyond it is unknown.
- **Verification commands:** there are none (`AGENTS.md:49-52`), and nothing runs by itself: there is no CI, and the
  hook exits 0. The guard adds four commands.
- **Code areas:** `.githooks/pre-commit`, described by `README.md:114,140` and `AGENTS.md:19,40`. There are no tests.
  The skills are product artifacts, described by the catalogues in §4.
- **Live state and spend:** no spend was found. There is one external write: `gh issue create` on
  `justinphilpott/entropy-guard` (`entropy-guard-feedback/SKILL.md:44-51`), reached from entropy-assessment:150,
  docs-first:217, integrator:174 and AGENTS.md:72.
  - **Searched:** `grep` across every `*.md` outside `explorations/` for `gh`, `curl`, `wget`, `http(s)://`,
    `git push|commit|config`, package managers and bash blocks; the hook read in full; `explorations/` searched for
    `gh issue`, `git push` and `curl`, which found nothing.
  - **Incomplete:** when the exported skills are run against another repository they read and write that repository.
    That delegated reach is not enumerated here.
- **Findings:** F1–F12.

## 9. Generator output

- **Guard:** `guard/SKILL.md`, to be installed in place at `skills/local/entropy-guard/SKILL.md`. It keeps the name
  `entropy-guard`, because agentskills.io ties the name to the folder (DECISIONS.md:79-83).
  - The intent-change rule is copied in rather than linked: the snapshot has no `intent-change-rule.md` to point at.
    See `feedback.md`.
- **Size: 1,239 words, against a budget of 1,270.** The budget's terms:
  - common contract: 724, which I re-measured from the template with the rule copied in and got the same figure;
  - checks: 10 beyond the two standing ones, × 36 = 360;
  - pointers: 71, which is the 86-word "Where things live" section minus the 15 label words already in the contract;
  - commands: 115.
  - Nothing was cut to fit.
- **Doc references:** none added. AGENTS.md:19,41 and README.md:78,97,137 already point at the same path.
- **Validation:**
  - Both patches apply in order with `patch -p1` to a fresh copy of the snapshot.
  - `git diff --check` is clean over the settled patch, and over both patches plus the guard.
  - The guard's frontmatter and link commands pass on the patched tree under sh, bash and zsh. 48 links were scanned.
  - Broken on purpose, each check fired: a renamed `name:`, two broken links, and trailing whitespace. Valid links,
    `#anchors` and `https://` links were not flagged.
  - The first version of the link check flagged every `https://` link. Only running it showed that; it is fixed.
- **Left visible in the guard:** the steward is unresolved, and the open intent questions are pointed to in TODO.md.
- **Build mode would also have changed** `TODO.md` "Doing Now": the generator's Step 1 records the work there, and the
  section is cleared at commit.
- **Handoff:** to `guards-integrator`, in `integration.md`.

## 10. Patches, sorted and checked

- **`patches/settled.patch`:** 16 hunks across 8 files. I read each hunk against F1–F12 and Q1–Q4:
  - None edits text a question quotes. Q1 quotes INTENT.md:3,139, AGENTS.md:27 and guard:68. Q2 quotes
    DECISIONS.md:26, INTENT.md:135, README.md:125 and TODO.md:12. Q3 quotes the two guard definitions and
    INTENT.md:86-88. Q4 quotes no document text.
  - None states an answer. The proposal entries are marked "not decided", and the integrator wording names no writer.
  - None contradicts a finding.
  - F8 says the listings omit `explorations/`. Both listings that the patch touches, AGENTS.md Quick Links and
    README.md "What's here", now include it.
- **`patches/provisional.patch`:** 12 hunks across 7 files, each listed in the header under Q1–Q4. Not to be applied
  until the steward answers.
- **Installing `guard/SKILL.md` is provisional on Q1.** Its Intent rule replaces guard:68's "update INTENT.md" repair,
  which is text that Q1 is about. Whichever way Q1 is answered, the rule defers to what the steward records, so
  integration.md offers installing it early as the steward's choice.

## 11. Uncertainties

- There is no git history. The enacted intent, the real loop, whether the hook is enabled and whether guards run were
  all inferred from dated files.
- GitHub issues (#9–#12 and later) and the sibling repo were not read.
- The guard's metadata says "Last evaluated: 2026-04-07" and gives a snapshot of four exportable skills, while the
  generator's metadata is dated 2026-05-10. Either the snapshot line was edited later or the dates mean something else.
  This cannot be resolved without history, and the updated guard drops the block.
- Whether `doc-health-check` is still wanted (`TODO.md:20`) is left to the backlog. The new guard does not refer to
  it.
- Choosing shape A over D was a judgment call; see `feedback.md`.
