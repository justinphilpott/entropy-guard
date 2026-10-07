# Entropy assessment: entropy-guard, snapshot 447da9a

- **Target:** a read-only snapshot of the entropy-guard repository, without `.git`:
  `…/scratchpad/eval/targets/entropy-guard-447da9a`.
- **Assessed:** 2026-10-07. Every line reference below is to that snapshot.
- **Route:** `entropy-assessment` (intent pass, lifecycle status and shape) → shape **A, docs-first planning** →
  `docs-first-planning-assessment` Phases 1 and 2 → `session-coherence-skill-generator` in plan mode → `guards-integrator`.
  - On route A, the docs-first assessment is the assessment. This file is that assessment, plus the front door's
    intent section and lifecycle status. It is not a second report.
  - The generator ran in plan mode because the target cannot be edited. Its build-mode edits are delivered as
    `guard/SKILL.md` and the files in `patches/`.
- **Other files:**
  - `guard/SKILL.md`: the refined guard;
  - `integration.md`: the integration brief;
  - `questions.md`: the questions for the steward;
  - `patches/TODO.md.patch`: the current-state update;
  - `patches/DECISIONS.md.patch`: the proposals and supersession markers;
  - `feedback.md`: upstream feedback on the skills;
  - `read-log.md`: the skill files opened, in order.

**Not covered:**

- git history. There is no `.git`, so the "enacted" reading below rests on dates written inside the files, not on
  commits.
- GitHub issues. `DECISIONS.md:17` cites issues #9 to #12, but issues were out of bounds, as was the web.
- The sibling repositories `../entropy-immune-system/` and the writing repo.
- Any live clone, its hook configuration, or its commit messages.

The four `explorations/` files were read only at their headings, front matter and closing sections, about 1,460 lines
in all. `PHILOSOPHY.md` was read in full.

---

## Findings

One list. Every later section refers to these ids rather than repeating the evidence.

Severity is a rough product of decay rate and recovery cost: **H** high, **M** medium, **L** low.

### F1 (H): No steward is named, and any contributor, agent included, may rewrite the intent document

- `INTENT.md:3` reads "refined collaboratively — by humans and AI agents… When you update it, note the date".
- `AGENTS.md:27` reads "If a decision refines or challenges the intent, update INTENT.md and note why".
- `skills/local/entropy-guard/SKILL.md:68` says the same.
- No file says who decides intent. `LICENSE:3` reads "Copyright (c) 2026 entropy-guard". The only person named
  anywhere is Justin Philpott: `PHILOSOPHY.md:43`, the explorations' front matter, and the GitHub owner in
  `skills/local/entropy-guard-feedback/SKILL.md:10`.
- None of the 14 `DECISIONS.md` entries carries a date or an author.
- Entry order is not a guide to age either. `DECISIONS.md:105` says "Superseded by … below", while
  `DECISIONS.md:131` says "Partially superseded by … above".
- `INTENT.md:5` keeps only the latest revision note. Earlier notes, which `INTENT.md:3` asks for, were overwritten.
- Intent-pass condition: **Missing**, asked as Q1.

### F2 (H): Two skills build guards, with different output shapes, and the lifecycle names only one

- `skills/docs-first-planning-assessment/SKILL.md:132-202`: Phase 2 designs and outputs "the refined or generated
  guard".
- `skills/session-coherence-skill-generator/SKILL.md:198-231`: writes `skills/session-coherence-guard/SKILL.md` from
  its own template.
- `INTENT.md:86-88` gives the generator role to `entropy-assessment` and docs-first only.
- `skills/entropy-assessment/SKILL.md:116-124`, the front door's next moves, never routes to
  `session-coherence-skill-generator`.
- `skills/guards-integrator/SKILL.md:20` says it runs "After `entropy-assessment` generates one or more guards", but
  the front door no longer generates guards since "Specialize first…" (`DECISIONS.md:18`).
- `README.md:52` says the docs-first assessment "continues into guard generation". `README.md:91` says the generator
  "Generates repo-specific session handoff guards".
- `DECISIONS.md:7-11` extends the generator, but no entry places it in the lifecycle.
- Vector: **parallel truth**. Intent-pass conditions:
  - **Conflict** over which skill builds guards, asked as Q2;
  - **Stale description** at `guards-integrator:20`, against `DECISIONS.md:18`.

### F3 (M): The guard generator carries residue from another project

- `skills/session-coherence-skill-generator/SKILL.md:22` and `:193` name "FlowBook".
- Its metadata (`generated`, `last_updated`, `skill_version: session-coherence-generator v0.2.0`, `system_snapshot`,
  at `:4-13`) differs from the `metadata.version` that the other five skills use.
- It is the only exportable skill with no step that hands to the next skill, and no upstream feedback check.
  `DECISIONS.md:66` requires that check only of the front door and the integrator, so its absence breaks no
  decision.
- Vector: **standalone residue**. It does not depend on intent, so it is fixed as usual. How far to wire the
  generator into the flow depends on Q2.

### F4 (M): Decision entries still describe the front door's retired Phase 2, without supersession markers

These entries describe `entropy-assessment` with a Phase 2, Steps 5 to 8, and domain appendices:

- `DECISIONS.md:39-43` (refinement in Phase 2; "Step 5", "Step 7");
- `DECISIONS.md:47-51` (the workflow appendix);
- `DECISIONS.md:95-99` ("Step 8");
- `DECISIONS.md:113-117` (Phase 1 is Steps 1 to 4, Phase 2 is Steps 5 to 8).

The current `skills/entropy-assessment/SKILL.md` (v0.6.0) has Steps 1 to 4 only. Only `DECISIONS.md:131` carries a
marker. `LEARNINGS.md:33`, `:93` and `:112` also point at the old steps and at the deleted domain generators.

- Vector: **superseded-nearby interference**. A fresh agent reading `DECISIONS.md:42`, "Step 7 should require an
  explicit output location", could rebuild guard generation into the front door.
- Condition: **Stale description**, corrected from "Specialize first…" (`DECISIONS.md:15-19`), citing it, in
  `patches/DECISIONS.md.patch`.
- Caveat: that entry is unattributed, like every entry (F1). It is treated as the system's recorded decision, as the
  intent pass directs for decisions of unknown authorship.

### F5 (M): The next validation loop is stated in four places, and one gives a different success measure

The loop appears in:

- `TODO.md:11-13`;
- `README.md:125`;
- `INTENT.md:129-135`;
- `DECISIONS.md:26`.

Only `DECISIONS.md:26` measures "more merged PRs". `INTENT.md:135` and `README.md:125` measure session quality and
"useful changes in the wild".

- Vector: **registry duplication drift**. Condition: **Ambiguous**, asked as Q3.

### F6 (M): The repo does not apply its own docs-first lifecycle; there is no current-state view for session start

- `INTENT.md:73` defines the docs-first lifecycle as including "a compact current-state packet for fresh sessions".
- `INTENT.md:118` reads "Self-applying".
- `LEARNINGS.md:7-13` says docs-first repos need session-start orientation.
- The local guard calls itself "a reference example of the docs-first planning output"
  (`skills/local/entropy-guard/SKILL.md:14`), and says it was last evaluated against docs-first v0.1.0 (`:21`).
- Yet `TODO.md` holds only Doing Now (`[empty]`), Next Up and Backlog. Nothing at session start says what is
  settled, what is superseded nearby, or what is open.
- Vector: **state entropy**. Condition: **Unauthorised drift** between the declared self-application and what was
  enacted. Response: fix the work, by `patches/TODO.md.patch`.

### F7 (M): A rule written as enforced has only an unverified reminder behind it, and the README states it as practice

- `AGENTS.md:19` reads "This is non-negotiable". `AGENTS.md:41` reads "mandatory pre-commit ritual".
- `README.md:78` reads "This project runs its own entropy guard before every commit".
- `.githooks/pre-commit:3-9` prints a reminder and then `exit 0`.
- Enabling the hook takes a manual symlink, and the instruction appears twice: `README.md:140` and `AGENTS.md:19`.
- Whether the hook is enabled in any clone is **unknown**: the snapshot has no `.git`, so neither `core.hooksPath`
  nor `.git/hooks/` can be read. There is no CI (`.github/` is absent).
- The non-blocking design is deliberate (`DECISIONS.md:31-35`).
- Condition: **Prose control**, of two kinds:
  - **Where enforcement would sit:** a hook, or a check on the commit message for the "entropy check" note that
    `README.md:138` asks for.
  - **Whether anything cites it as a control:** `README.md:78` cites it as fact. The guard's integration line
    (`skills/local/entropy-guard/SKILL.md:22`) cites the hook.

### F8 (M): The existing guard has stale references, and lacks parts the generator requires

Stale references:

- `skills/local/entropy-guard/SKILL.md:33` reads "use doc-health-check for that". That skill does not exist; `:137`
  says so, and `TODO.md:20` tracks it.
- `:99` refers to "README.md (Key Documents table)". `README.md` has no such table; its tables sit under
  "What's here" (`README.md:82-115`).
- `:92` says "20+ markdown files". The snapshot has 17.
- `:3` speaks of "the guard generators". The domain generators were deleted (`DECISIONS.md:134`).
- `:20` gives a system snapshot as a skill count, a changing fact.

Missing parts the generator requires:

- a definition of what changed in a session, with commands;
- the intent-change rule. `:68` tells contributors to edit `INTENT.md` directly, which is F1;
- pointers to where things live;
- a report that separates findings caused by this session from problems already there.

Response: refine the guard in place (`guard/SKILL.md`).

### F9 (L): The integrator's hook discovery misses tracked hook folders

`skills/guards-integrator/SKILL.md:46` lists `.git/hooks/ (if visible)` but not `.githooks/`, where this repo's own
hook lives. An agent running the integrator on a fresh clone, or on a snapshot like this one, would not find the
hook. Vector: a product contract.

### F10 (M): `explorations/` sits beside live truth without being demoted

- Two of its files are drafts aimed at a new repo:
  - `explorations/2026-03-24-entropic-immunity-systems.md:201`, "A provisional orientation for a new repo";
  - `explorations/2026-03-24-entropy-immune-system-working-conclusions.md:155`, "Near-term direction for the
    derived project". Both carry `status: draft`.
- `DECISIONS.md:26` says the sibling repo was "seeded with the exploration documents", so these files may now have
  two homes. The sibling was not read.
- `explorations/` is not listed in `README.md` "What's here" or in `AGENTS.md` "Key Files".
- Only `explorations/2026-03-19-autopoiesis.md` is cited, by `PHILOSOPHY.md:45` and `LEARNINGS.md:122`.
- Vector: **standalone residue**, and **superseded-nearby interference**.

### F11 (L): Three learnings are conceptual proposals, and duplicate `PHILOSOPHY.md`

- `DECISIONS.md:139-143` keeps `LEARNINGS.md` "for tactical insights". Fragments go to `PHILOSOPHY.md`, and articles
  to the writing repo.
- `LEARNINGS.md:117-143` holds three conceptual entries, each "validated by" one conversation:
  - just-in-time generation;
  - the four-component hierarchy;
  - guards working at the wrong layer.
- Each restates a section of `PHILOSOPHY.md`: `:93`, `:103` and `:73`.
- Their implications read like design directives that no decision adopted. One reads "Entropy-assessment should be
  designed as a generator invoked fresh at each handoff, not a template that's maintained between uses"
  (`LEARNINGS.md:123`).
- The enacted work went the other way, towards persistent guard files: `DECISIONS.md:31-35`, and the generator's
  `skills/session-coherence-guard/SKILL.md`.
- `LEARNINGS.md:63` reads "Led to the distill-article skill". No such skill exists in this repo.
- Condition: **Unauthorised drift** against `DECISIONS.md:139-143`. Response: fix the work by reducing the three
  entries to links (Bootstrap action B4).

### F12 (L): Scaffolding residue and an outdated note on tracking work

- `AGENTS.md:21` reads "Working code with tests beats perfect code", in a repo with no code or tests
  (`AGENTS.md:51`, `:57`).
- `.gitignore:17-25` has a Go block, and `.editorconfig:11-18` has Python, Go and Makefile rules.
- `TODO.md:3` reads "Graduate to an issue tracker… once the project has momentum". GitHub issues are already in use:
  `DECISIONS.md:17`, and the feedback skill. So work is tracked in two places, and only `TODO.md` was readable.
- Vector: **frayed edges**.

### F13 (L): The assessment is to be re-run "periodically", but nothing schedules it

- `INTENT.md:82` reads "It should be run on this project periodically". `INTENT.md:94` defines the evaluator role
  as future work.
- The local guard was last evaluated on 2026-04-07 (`skills/local/entropy-guard/SKILL.md:21`). That is before the
  generator's metadata (2026-05-10) and before the decision on bootstrap mode.
- Condition: **Prose control**. The gap is already tracked through the guard-runner item in the `TODO.md:18`
  backlog and the evaluator in `INTENT.md:94`, so no parallel work is proposed. This run is such a re-evaluation.

### Checked and clean

- All 49 relative markdown links resolve.
- All 6 skills' front matter `name` matches the folder.
- These required files exist: `README.md`, `AGENTS.md`, `INTENT.md`, `DECISIONS.md`, `LEARNINGS.md`, `TODO.md`,
  `.githooks/pre-commit` and the local guard.
- How these were checked: the shell loops in `guard/SKILL.md`, run on the snapshot on 2026-10-07. Both loops also
  caught a broken link and a name mismatch planted in a scratch copy.

---

## Intent

**Steward:** none is named in the repo (F1). The likely steward is Justin Philpott, inferred and not recorded.
Q1 asks.

**Authorised intent, in short, with sources.** The sources are recorded decisions and the intent document. Their
evidence of authority:

- Every `DECISIONS.md` entry is neither attributed nor dated.
- `INTENT.md` is dated (2026-04-07) but not attributed.

They are treated as the system's decisions. Missing attribution does not make them inferences.

1. **Purpose.** Practical entropy protection: assessment, guard generation and refinement, integration, and
   iterative validation on real projects. Sources: `DECISIONS.md:26` (decision) and `INTENT.md:126`.
2. **Scope boundary.** Broader entropic-immunity theory lives in the sibling repo `entropy-immune-system`. Sources:
   `DECISIONS.md:26`, `INTENT.md:127`, `AGENTS.md:34`.
3. **Routing.** One front door that routes; docs-first is the specialised path; the integrator is separate. Source:
   `DECISIONS.md:18`.
4. **First validation wedge.** Docs-first planning repos. Sources: `DECISIONS.md:15-19`, `INTENT.md:129`.
5. **Guard principles.**
   - delta-scoped, taking 2 to 10 minutes;
   - not a blocker;
   - judgment in skills, mechanics in tooling;
   - self-applying.

   Sources: `INTENT.md:59-66` and `:113-118`.
6. **Adoption.** Guards mature from External to Prompted before deeper automation. Source: `DECISIONS.md:31-35`.
7. **Product.** The meta-skill is the product: a few exemplary guards, not a library. Source: `DECISIONS.md:121-125`.
8. **Young repos.** Bootstrap them before building guards. Source: `DECISIONS.md:7-11`.
9. **Layout and format.** `skills/` for exportable skills and `skills/local/` for local ones; `SKILL.md` with front
   matter. Sources: `DECISIONS.md:71-83`, `AGENTS.md:33`.

**The three readings**

- **Declared:** `README.md` and `AGENTS.md` describe four exportable skills, a docs-first lifecycle with a
  current-state packet, and the local guard run before every commit.
- **Enacted:** this reading comes from in-file dates only, since there is no history.
  - The latest work is the generator v0.2.0 (2026-05-10 and 2026-05-11) with its bootstrap decision.
  - Before that came docs-first v0.1.0 and the "Specialize first…" decision (2026-04-07, from `INTENT.md:5`), and
    the guard's re-evaluation on the same date.
- **Authorised:** items 1 to 9 above.

**Gaps, grouped by condition**

| Condition | Gaps |
|---|---|
| Stale description | F4 (corrected in the patch); F2, at `guards-integrator:20`; F8, at the guard's line 3 |
| Conflict | F2: which skill builds guards (Q2) |
| Missing | F1: steward and intent-change authority (Q1); F2: the generator's place in the lifecycle (Q2) |
| Ambiguous | F5: what validation measures (Q3) |
| Unauthorised drift | F6: no self-applied current-state view; F11: conceptual entries in `LEARNINGS.md` |
| Prose control | F7: guard "non-negotiable", backed by a reminder only; F13: "periodically", with no schedule |

**Questions for the steward** (in full in `questions.md`)

- **Q1.** Who is the steward, and may agents edit `INTENT.md` directly? Recommended: Justin Philpott is steward, and
  intent changes need his recorded decision.
- **Q2.** Which skill owns guard building? Recommended: `session-coherence-skill-generator` only; docs-first Phase 2
  supplies checks to it.
- **Q3.** What does the validation batch measure? Recommended: both merged PRs and session quality.

**Proposed intent changes.** Each recommendation is recorded in `patches/DECISIONS.md.patch` as an entry titled
"Proposed: …", marked "Awaiting the steward; not in effect". `INTENT.md` is not edited.

---

## Lifecycle status

**Active**, as of the snapshot. The evidence:

- `TODO.md:9-13` has open items in Next Up.
- The newest decision (`DECISIONS.md:7-11`) and the generator's `last_updated: "2026-05-11"`.
- `README.md:121` reads "Actively evolving".

What the current repository looks like today was not checked; it was out of bounds. The full route applies.

## System shape

**Shape A, docs-first planning**, chosen over D, workflow-heavy. The case for A:

- the repo is markdown-first, with no runtime (`AGENTS.md:31`);
- design documents and skills are the product;
- `TODO.md`, `DECISIONS.md` and `AGENTS.md` carry state;
- the loop is repeated human and AI sessions;
- the top drift is docs-to-docs (F2, F4, F5).

D fits too, because the product is workflow guidance and the repo has rituals and a hook. A was chosen because the
highest current risks (F1, F2) sit between documents, which docs-first's truth map and product-artifact role cover.

**Repositories.** One was assessed. Three related repositories are kept outside the system by recorded decisions:

- `../entropy-immune-system/` (`DECISIONS.md:26`);
- the writing repo (`DECISIONS.md:142`);
- seed, the scaffolding upstream (`AGENTS.md:68`).

GitHub issues on `justinphilpott/entropy-guard` are a second place where this system tracks work (F12). They were
not readable here.

---

## Canonical truth map

| Concept | Canonical home | Other mentions, and how they behave |
|---|---|---|
| Purpose, entropy model, enforcement depth | `INTENT.md:9-109` | `README.md:11-17` and `:68-74` summarise and link: fine |
| Scope boundary (practical here, theory in the sibling) | `INTENT.md:122-127`, `DECISIONS.md:23-27` | `README.md:7` and `:123`, `AGENTS.md:34`: summaries, consistent |
| Guard lifecycle (generator, integrator, runner, evaluator) | `INTENT.md:84-96` | Contradicted by the skills set: **F2** |
| Who builds guards | **Two homes**: docs-first Phase 2, and `session-coherence-skill-generator` | `README.md:52` and `:91`, `AGENTS.md:44-46`: **F2** |
| Assessment routing | `skills/entropy-assessment/SKILL.md` (product artifact) | `README.md:25-66` restates it, with two near-identical prompts (`:44-48`, `:54-58`) |
| Current-state view | none (**F6**); `TODO.md` after the patch | `README.md:125`, `INTENT.md:129-135`, `DECISIONS.md:26`: **F5** |
| Settled decisions | `DECISIONS.md`, with mixed order and partial supersession marking | `LEARNINGS.md` implications cite old steps: **F4** |
| Working practices and hook enablement | `AGENTS.md:17-27` | `README.md:131-140` summarises; the hook instruction is stated twice: **F7** |
| This repo's guard | `skills/local/entropy-guard/SKILL.md` | `README.md:78` and `:97`, `AGENTS.md:19` and `:41`, `.githooks/pre-commit:4` |
| Learnings (tactical) | `LEARNINGS.md` | Three conceptual entries duplicate `PHILOSOPHY.md`: **F11** |
| Reflections | `PHILOSOPHY.md` (free space) | |
| Historical and imported | `explorations/` (4 files), and the superseded `DECISIONS.md` entries | Not demoted: **F10**, **F4** |
| Templates | the guard template inside `session-coherence-skill-generator`; the scaffolds in `guards-integrator` | |
| Rules owned elsewhere | none found | |

Product artifacts are checked as contracts: names, paths, inputs and handoffs.

- All six skills' names match their folders.
- Every relative link resolves.
- **Handoff defects:** `guards-integrator` → "after entropy-assessment generates" is stale (F2). The front door has no
  route to `session-coherence-skill-generator` (F2). The integrator's discovery misses `.githooks/` (F9).

## Loop map

The real loop, so far as a snapshot without history can show it:

- **Session start:** an agent reads `AGENTS.md`, its standing instructions. A human reads `README.md`, then
  `AGENTS.md` and `TODO.md` (`README.md:133-138`). `INTENT.md` is read "before any substantial design… choice"
  (`AGENTS.md:27`). Nothing orients the session on what is settled or superseded (F6).
- **Active work:** tracked in `TODO.md` "Doing Now", written before work starts (`AGENTS.md:22`). Feedback goes to
  GitHub issues (F12).
- **Capture:** decisions and learnings are captured at session end, through checks 1 and 2 of the local guard.
- **Coherence pause:** before commit, the local guard is run by hand. The hook reminds, if it was enabled; unknown
  (F7).
- **Handoff:** a local commit, with a note on what the entropy check found (`README.md:138`). Pull requests happen at
  least sometimes (`LEARNINGS.md:152`). There is no PR template and no CI.
- **Unknown:** whether commits actually carry the entropy-check note. There was no history to check.

---

## Entropy profile: top risks, ranked by destructive potential

| # | Risk | Findings | Decay | Recovery cost | Current symptoms | Anchor for the fix |
|---|---|---|---|---|---|---|
| 1 | Two guard builders, with lifecycle docs naming one | F2, F3 | Each skill edit picks a side | High once batch repos hold guards of two shapes | `INTENT.md:86-88` vs `README.md:91`; the integrator's stale trigger | A `DECISIONS.md` decision (Q2), then `INTENT.md` |
| 2 | Intent rewritable by any contributor; no steward; undated decisions | F1 | Slow | Catastrophic (`INTENT.md:33`) | `AGENTS.md:27`; 14 undated entries; mixed order | Q1, then `AGENTS.md`, the guard's intent rule |
| 3 | Superseded designs nearby, unmarked | F4, F10, F11 | Each fresh session | Medium: rebuilding a retired Phase 2 or importing theory | 4 unmarked entries; drafts for a "new repo" | "Specialize first…" and "Farm broader…" entries |
| 4 | No session-start state; next loop in 4 places | F6, F5 | Fast | Low to medium | Empty "Doing Now", no settled or superseded list; one diverging measure | `TODO.md` "Current state" (patch); Q3 |
| 5 | Guard claimed as practice, backed by an unverified reminder; stale guard text | F7, F8, F13 | Fast (forgetting) | Low per lapse; trust in the guard itself | "non-negotiable"; hook state unknown; dead references in the guard | The refined guard; hook enablement in `AGENTS.md` |

---

## Recommendations

**Consolidate:**

- Guard building, under one skill, after Q2 (F2).
- The validation-loop statement, into `INTENT.md` with links, after Q3 (F5).
- Hook enablement, into `AGENTS.md`, with `README.md:140` linking to it (F7).

**Demote, or mark as historical:**

- `DECISIONS.md` entries on Phase 2 (F4): done in the patch.
- `explorations/` (F10): add a `README.md` "What's here" row saying the folder holds historical conversation records,
  that broader work continues in `../entropy-immune-system/`, and that it is not this repo's direction.
- The three conceptual `LEARNINGS.md` entries (F11): reduce each to a link to its `PHILOSOPHY.md` section.

**Guard:**

- Refine `skills/local/entropy-guard/SKILL.md` in place: `guard/SKILL.md` (F8).
- Adopt it only after Q1 is answered, because its intent-change rule depends on it.

**Reword:**

- `README.md:78`, "runs its own entropy guard before every commit", to describe the reminder honestly. Or capture
  evidence: the entropy-check notes in commit messages.
- The prose-control finding does not by itself change `AGENTS.md:19`, which is a standing directive.

## Bootstrap actions

One-time cleanup, each checked against the snapshot. Their completion is tracked in `TODO.md` (patch), not in the
guard.

- **B1.** Mark the four `DECISIONS.md` entries superseded in part (F4). The entries are at lines 39, 47, 95 and 113,
  and none has a marker. Done in `patches/DECISIONS.md.patch`.
- **B2.** Add a "Current state" section to `TODO.md` (F6). The current `TODO.md:1-20` has no such section. Done in
  `patches/TODO.md.patch`.
- **B3.** Add an `explorations/` row to `README.md` "What's here" (F10). No row exists (`README.md:82-115`).
- **B4.** Reduce `LEARNINGS.md:117-143` to three one-line links to `PHILOSOPHY.md:73`, `:93` and `:103` (F11). Drop
  the "distill-article" reference at `LEARNINGS.md:63`, or name where that skill lives (F11).
- **B5.** In the generator's `SKILL.md`, remove "FlowBook" (`:22`, `:193`), and align its metadata to
  `metadata.version` (F3).
- **B6.** Reword the "with tests" clause at `AGENTS.md:21`, and delete the Go block at `.gitignore:17-25` (F12).
- **B7.** Add tracked hook folders (`.githooks/`) and `git config core.hooksPath` to the hook locations at
  `skills/guards-integrator/SKILL.md:46` (F9).

B3 to B7 are listed as one Backlog item in `patches/TODO.md.patch`.

## Current-state update

`patches/TODO.md.patch` adds `## Current state` to `TODO.md`, the file a session reads first (`AGENTS.md:22`). It
holds:

- the stage;
- the docs to trust first;
- 5 settled decisions, each named by its `DECISIONS.md` title;
- the superseded designs nearby;
- the 3 open questions;
- the next actions.

Each changing claim carries its source and "checked 2026-10-07". The section lists its own staleness triggers: any
change to `INTENT.md`, `DECISIONS.md`, `README.md` "Project status", or the skills set. It names its refresher, the
guard's TODO check.

The patch also adds two Next Up items (the steward's decisions, and adopting the guard after Q1) and one Backlog item
for B3 to B7. Every claim it changed was checked against the file's other mentions:

- the existing Next Up items still agree with "Stage";
- the `doc-health-check` item is still accurate, because the refined guard still names that missing skill.

The patch applies cleanly to the snapshot, checked with `git apply --check` and with `patch`.

---

## Phase 2: inputs handed to the generator

**Guard surfaces** (docs-first Step 7):

| Surface | Runs? | Classification |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | By hand only | **Amend**: refined in `guard/SKILL.md` (F8) |
| `.githooks/pre-commit` | Unknown: no `.git` in the snapshot | **Keep** the text, since its path is unchanged. **Amend** the enablement instruction to one home in `AGENTS.md` (F7) |
| `AGENTS.md` "Working Practices" | Instruction | **Amend**: a session-start read of `TODO.md` "Current state". The line-27 intent rule depends on Q1 |
| `README.md` "Contributing" and line 78 | Instruction | **Amend**: link to `AGENTS.md` for enablement; honest wording (F7) |
| `TODO.md` | By hand | **Amend**: current-state section (patch) |
| `DECISIONS.md` | By hand | **Amend**: markers and proposals (patch) |
| `LEARNINGS.md` | By hand | **Amend**: B4 |
| `skills/local/entropy-guard-feedback/SKILL.md` | By hand | **Keep** |
| `explorations/` | n/a | **Demote** to historical context (B3) |

**Docs-first checks** (Step 8), written against this repo's files:

- **Canonical ownership, and one owner rather than two copies.** Uses the ownership list in the truth map.
- **Supersession.** Checks the `DECISIONS.md` markers and the "Superseded nearby" line in `TODO.md`.
- **Cross-reference integrity.**
- **Decision and learning capture.** New entries carry a date and who decided.
- **State honesty.** Against `TODO.md` "Current state".
- **Workflow alignment.** Across `AGENTS.md`, `README.md` "Contributing", `TODO.md` and the hook.
- **Skill contracts.** The product-artifact role: names, paths, inputs and handoffs between skills.

**Which checks can move into tooling:**

- Stable enough now: link integrity (lychee offline, or the shell loop), front matter `name` matching the folder (a
  durable invariant under `DECISIONS.md:79-83`), and the presence of required files.
- Kept as judgment: canonical ownership, supersession, workflow alignment and state honesty. They depend on wording
  and on structure that is still moving.

## Generator report (plan mode)

- **Structures found:**
  - intent: `INTENT.md`, with no steward;
  - state: `TODO.md`;
  - decisions: `DECISIONS.md`;
  - learnings: `LEARNINGS.md`;
  - reflections: `PHILOSOPHY.md`;
  - operator instructions: `AGENTS.md`, plus `README.md` "Contributing";
  - a reminder hook: `.githooks/pre-commit`;
  - existing guard: `skills/local/entropy-guard/SKILL.md`.

  Not present: tests, CI, live services, credentials, spend, and vendor agent folders. Rules owned elsewhere: none
  found.
- **Bootstrap:** not applicable. The repo has a repeated loop and an existing guard.
- **Guard:** the existing guard is updated in place at `skills/local/entropy-guard/SKILL.md`, delivered as
  `guard/SKILL.md`, 180 lines. These are its changes:
  - Added: "Where things live", a definition of what changed with git commands, the intent-change rule (v2), a skill
    contract check, a map of dependent documents, the session-versus-pre-existing report, mechanical commands, modes
    and safety rules.
  - Removed: the per-check rationale paragraphs and the skill-count snapshot, to keep the guard short enough to read
    in full. A maintainer may want a rationale back for its role as reference example (`README.md:97`).
  - Fixed: the F8 references.
- **Doc references to add, in build mode:**
  - `AGENTS.md` "TODO.md as live context": "At session start, read `TODO.md` 'Current state' first."
  - No new path, because the guard stays where `AGENTS.md`, `README.md` and the hook already point.
- **Validation:**
  - The guard's non-git commands were run on the snapshot: links 0 broken, names 0 mismatched, Doing Now
    `[empty]`.
  - Planted failures were caught.
  - Both patches apply cleanly. There is no trailing whitespace in the outputs.
  - `git diff --check` and the "what changed" git commands could not run: the snapshot has no `.git`.
- **Patches against open questions:**
  - The `TODO.md` patch lists Q1 to Q3 as open, and names the builder skills without choosing one.
  - The `DECISIONS.md` patch records the answers only as "Proposed… not in effect".
  - The guard names the steward only as "proposed: Justin Philpott". Its intent-change rule assumes reading (b) of
    Q1, so it is not to be installed until Q1 is answered (see `integration.md`).
  - The guard's skill-contract check says to record a proposal, not choose, when guard-building ownership is
    undecided (Q2).
  - No patch edits `INTENT.md`.
  - No repair instruction makes a skill or a check the authority over a documented constraint.
- **Open questions the guard leaves visible:** Q1, through the steward pointer; Q2, through check 4.
- **Handoff:** to `guards-integrator`, in `integration.md`.

---

## Uncertainties

- The "enacted" reading rests on in-file dates. Commits could show work that was enacted but not recorded, or the
  reverse.
- Whether `.githooks/pre-commit` is enabled anywhere, and whether commits carry entropy-check notes: unknown (F7).
- Whether the sibling repo holds copies of the 2026-03-24 explorations: not read (F10).
- What GitHub issues #9 to #12, and any later issues, record. They may already settle Q2 or Q3, or track B-items.
- The steward was inferred from naming, not from any statement of authority (F1).
- The refined guard's git commands are standard, but were not run against this repo.
- The `TODO.md` patch's Next Up item refers to the refined guard from this assessment. That guard has to travel with
  the patch.

## Upstream feedback check

Yes: the run hit reusable friction in the skills themselves. Formatted notes are in `feedback.md`. They were not
filed, because filing needs `gh` and the web, both out of bounds for this run.
