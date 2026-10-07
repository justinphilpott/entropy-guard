# Entropy assessment: entropy-guard, snapshot 447da9a

Run on 2026-10-07 against the read-only snapshot at `eval/targets/entropy-guard-447da9a` (no `.git`). The route was
`entropy-assessment`, then `docs-first-planning-assessment` for shape A, then `session-coherence-skill-generator`
in plan mode, then `guards-integrator`. Following `entropy-assessment` Step 3, this is the docs-first assessment,
with the front door's intent section and lifecycle status added. There is no second report.

Line references (`FILE:N`) are to the snapshot. Findings have ids (F01 to F16), and every other section refers to
them by id.

**Evidence base and what it excludes.** I read every file in the snapshot. I read the four `explorations/` files in
part: their headings, frontmatter, every turn by Justin, and the closing sections. The snapshot has no git history,
so nothing here comes from commits, recency or real practice (for example whether the guard is actually run, or
whether commit messages carry "entropy check clean"). The sibling `entropy-immune-system` repo, the `writing` repo
and GitHub issues were outside this run's permitted reading, so I made no claim about their contents.

---

## Lifecycle status

**Active** as of the snapshot. The evidence for that:

- `TODO.md:11-13` has three open "Next Up" items.
- `INTENT.md:129` names "the next major step".
- `README.md:121` says "Actively evolving".
- The newest dated content is `skills/session-coherence-skill-generator/SKILL.md:5-6` (generated 2026-05-10, updated
  2026-05-11).

Without git history I cannot say whether work continued after May 2026.

## System shape and route

**Shape A, docs-first planning.** Every A criterion holds:

- The repo is markdown-first with no runtime (`AGENTS.md:31,51,57`).
- The skills and the documents are the product.
- `TODO.md`, `DECISIONS.md`, `LEARNINGS.md` and `AGENTS.md` carry state.
- The loop is repeated human and AI sessions ending in a pre-commit ritual.
- The drift is docs-to-docs and workflow drift.

Shape D (workflow-heavy) also fits, because the repo exports a way of working. I chose A because the
highest-ranked risks (R1 to R3 below) are drift between documents. The repo's own guard also calls itself a
docs-first output (`skills/local/entropy-guard/SKILL.md:14`).

**One repository.** The sibling `entropy-immune-system` repo is a spin-off inquiry (`DECISIONS.md:23-27`), and
`writing` is where articles go (`DECISIONS.md:139-143`). Neither takes part in this repo's loop, so this is not a
multi-repository system.

**A guard is warranted.** The system is active, and it already has a guard that has fallen behind (F12). The right
move is to refine that guard, not build a new one.

---

## Intent

### Steward

No file names who decides what this project is for (F01). The evidence points to **Justin Philpott**:

- His dated, attributed scope decisions in `explorations/2026-03-24-entropy-immune-system-conversation.md:86,713`
  and `explorations/2026-03-19-autopoiesis.md:22`.
- The repository's home, `github.com/justinphilpott/entropy-guard`
  (`skills/local/entropy-guard-feedback/SKILL.md:10`).
- `LICENSE:3` names "entropy-guard", not a person.

I use him as steward, provisionally, and question Q1 asks him to confirm where that is recorded.

### Authorised intent, in short

Most sources carry weak authority. Only the exploration transcripts are both attributed and dated. `INTENT.md` is
dated but not attributed. No `DECISIONS.md` entry carries either (F02).

- **The repo is the practical guard project.** It covers assessment, guard generation or refinement, integration,
  and validation on real projects. The broader theory goes to `entropy-immune-system`.
  - Sources: `INTENT.md:122-127`, dated 2026-04-07; `DECISIONS.md:23-27`, undated.
  - Steward's words, 2026-03-24: "keep it operating within its current structure" (conversation `:86`), and "let's
    keep them in explorations, as I want to preserve the entropy-guard project and really farm this new evolution
    off into its own repo" (`:713`).
- **`entropy-assessment` is the single front door, and docs-first planning repos are the specialised path.**
  Sources: `DECISIONS.md:15-19` (undated) and `INTENT.md:5,69-73` (2026-04-07).
- **Guard principles.** Guards are delta-scoped, low-burden and minimum-viable, and the project applies them to
  itself (`INTENT.md:59-66,113-118`). Judgment-heavy guards mature from External to Prompted before deeper
  automation (`DECISIONS.md:31-35`).
- **Next: an external validation batch on docs-first planning repos** (`INTENT.md:129-135`). What it measures is
  contested (F08).

**Planning horizon** (docs-first Step 1):

- **Settled:** the items above, plus the skill format (`DECISIONS.md:79-83`) and one local guard
  (`DECISIONS.md:55-59`).
- **Active:** the validation batch. No results are recorded.
- **Exploratory:**
  - the guard runner and the guard evaluator (`INTENT.md:86,92-94`; `TODO.md:18`);
  - further specialised tracks (`TODO.md:19`);
  - just-in-time guard generation and guards at the level of meaning (`LEARNINGS.md:117-143`).

**Declared, enacted, authorised.** What was enacted most recently is a new exported skill,
`session-coherence-skill-generator`, with a bootstrap mode (`DECISIONS.md:7-11`). It came after the last revision of
`INTENT.md`, which never mentions it. No validation-batch results appear anywhere. So the work enacted since April
grew the skill set, while the declared next step was validation. No decision covers the generator's place in the
product. I record this as conflict F04 rather than as drift, because `DECISIONS.md:7-11` does accept that the
generator exists.

### Gaps, by condition

| Condition | Findings | Response |
|---|---|---|
| Missing | F01 (no steward recorded); F02 (decisions undated and unattributed) | Q1 asks the steward to record himself as steward. The patch adds the source and date to the one decision whose steward words exist (patch 02). The guard asks for a date and decider on new entries. |
| Ambiguous | F03 (who may change `INTENT.md`); F16 (is every guard a skill file?) | F03 becomes Q1. The evidence settles F16 in favour of `INTENT.md:65`; not asked. |
| Conflict | F04 (two skills write guards); F08 (what the validation batch measures) | Q2 and Q3. The dependent edits are left unpatched. |
| Unauthorised drift | F06 (recorded requirements lost when the skills were restructured) | Fix the work: patch 04 restores verification of bootstrap actions. |
| Stale description | F07 (decision entries describe removed structure); F11 in part (`README.md:78`); F12 in part (guard references) | Corrected from later recorded decisions, citing them (patches 02 and 03, and the guard). |
| Prose control | F11 (the guard run is "non-negotiable", but only a reminder stands behind it) | Report only. Enforcement would have to be a blocking hook or CI, which `DECISIONS.md:31-35` declined. The `README.md` wording is corrected. |

These findings do not depend on intent and are fixed or recommended directly: F05, F09, F10, F13, F14, F15.

### Questions for the steward

There are 3, in `questions.md`, each with a recommended answer:

- **Q1:** who may change `INTENT.md` (F01, F03).
- **Q2:** which skill writes guards (F04).
- **Q3:** what the validation batch measures (F08).

### Proposed intent changes, and where they are recorded

P1 to P3 match Q1 to Q3. They go into `DECISIONS.md` under a new heading, "Proposed — awaiting Justin Philpott"
(`patches/02-DECISIONS-proposals-and-supersession.patch`). This uses the existing decision surface rather than a new
register. Nothing in `INTENT.md` is edited.

---

## Findings

**F01. No steward is recorded.** No file says who decides intent, and `grep -i 'steward\|maintainer'` finds nothing
outside generic skill text. `INTENT.md:3` says intent is "refined collaboratively — by humans and AI agents".
`LICENSE:3` names "entropy-guard". The evidence for Justin Philpott is listed under Steward above.

**F02. The decision log carries no dates or authors.** None of the 17 entries in `DECISIONS.md` is dated or
attributed, and only their position suggests newest-first order. The one decision with the steward's own recorded
words, keeping `explorations/` here and moving the theory to a sibling repo
(`explorations/2026-03-24-entropy-immune-system-conversation.md:713`), appears at `DECISIONS.md:23-27` without
citing them.

**F03. It is unclear who may change `INTENT.md`.** Three places tell any contributor, including an agent, to edit
`INTENT.md` directly with a dated note:

- `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `INTENT.md:3,139`.
- `skills/local/entropy-guard/SKILL.md:68`.

`INTENT.md:5` keeps a single "Last revised" line, so the reasons for every earlier revision are already lost. The
reading matters: one reading makes this a standing delegation from the steward, the other a habit that predates
recording proposals. See Q1.

**F04. Two skills write guards, and the contracts between the skills have drifted apart.** Two paths write guards:

- `skills/docs-first-planning-assessment/SKILL.md:132-202`, "Phase 2: Guard Generation / Refinement". `README.md:52-58`
  sends guard generation here.
- `skills/session-coherence-skill-generator/SKILL.md`, listed at `README.md:91` and `AGENTS.md:46`, whose bootstrap
  mode is the newest decision (`DECISIONS.md:7-11`).

Around them:

- `INTENT.md:84-88` names only the assessment workflow as the guard generator.
- No decision records adding the generator, or how it relates to the assessments.
- Neither `entropy-assessment` nor `docs-first-planning-assessment` mentions it.
- `skills/guards-integrator/SKILL.md:20,227` says `entropy-assessment` generates guards and decides which are needed.
  The snapshot's `entropy-assessment` now mostly routes; its Step 4d still offers "refine an existing guard" and "add
  a lightweight general post-work guard" (`:121-122`).
- The front door has no route for young repos, though the generator's bootstrap mode exists for them.

This is the duplicated-generator problem that `DECISIONS.md:129-135` removed once already. See Q2.

**F05. The generator still carries text from the repo it came from.** It names "FlowBook" twice
(`skills/session-coherence-skill-generator/SKILL.md:22,193`). Its frontmatter also differs from every other skill:
it uses `generated`, `last_updated` and `skill_version` where the others use `metadata.version` (`:4-13`). This is
residue from a standalone origin. Patch 04 removes the FlowBook references. The frontmatter difference is recorded
here only, because it does no harm until a tool reads the field.

**F06. Recorded requirements were lost when the skills were restructured.** `DECISIONS.md:42` requires two things:

- bootstrap actions "verified against the current artifact before they are written";
- "an explicit no-existing-loop bootstrap integration pattern".

In the snapshot, `docs-first-planning-assessment` lists bootstrap actions with no verification
(`skills/docs-first-planning-assessment/SKILL.md:114`), and a search for `verif` finds no such requirement in any
skill. `guards-integrator` has no no-loop pattern; the nearest is `:107`, "No automation exists yet". No decision
removed either requirement, and `LEARNINGS.md:27-33` records the failure that motivated them. Patch 04 restores the
verification requirement. Where the no-loop pattern should live depends on Q2, because the generator's bootstrap
mode partly covers it.

**F07. Decision entries describe structure that was later removed, without saying so.** Four entries describe
`entropy-assessment` as having a Phase 2, domain appendices and a two-phase structure: `DECISIONS.md:39-43`,
`:47-51` and `:113-117`. The later "Specialize first" entry (`DECISIONS.md:15-19`) replaced all of that.
Separately, `DECISIONS.md:71-75` is partially superseded according to `:134`, but carries no marker. Only `:105`
and `:131` carry markers. Patch 02 adds markers to the four entries, using the existing marker style.

**F08. The next validation loop is stated in four places, and one disagrees.**

- `DECISIONS.md:26` says "assess a larger set of open source projects … track whether that produces more merged PRs".
- `INTENT.md:129-135`, `README.md:125` and `TODO.md:11-13` say docs-first planning repos, measured by "clearer
  session recovery, fewer reintroduced stale ideas, more coherent docs".
- `DECISIONS.md:15-19` narrowed the set of target repos but said nothing about the measure.
- The steward's own first evidence of value was fixes "merged within minutes"
  (`explorations/2026-03-19-autopoiesis.md:22`).

See Q3.

**F09. `LEARNINGS.md` points at material that no longer exists.**

- `LEARNINGS.md:33` refers to "Step 5" and "Step 7", and `:112` to "Step 8 of `entropy-assessment`". Neither step
  exists in that form now.
- `LEARNINGS.md:93` proposes "porting Step 0 back to the entry point" from domain generators that were deleted
  (`DECISIONS.md:134`).
- `LEARNINGS.md:63` cites a "distill-article skill" that is not in this repo.
- Three entries (`:117-143`) are "validated by" a conversation only, against the rule at `LEARNINGS.md:3`, and
  their theory now belongs to the sibling repo.

A fresh agent could act on any of these implications. Patch 03 adds notes and status lines.

**F10. `explorations/` sits beside live documents without being marked as history.** It holds 4 files, 1,467
lines. It is missing from `README.md` "What's here" (`:82-115`) and `AGENTS.md` "Key Files" (`:36-47`). Two of the
2026-03-24 files orient a different repo (`explorations/2026-03-24-entropic-immunity-systems.md:201`, "A provisional
orientation for a new repo"). The steward decided to keep the files here (`:713`), so the fix is to mark them as
history, not to remove them. Patch 03 adds one line to each list.

**F11. The guard run is described as enforced, but only a reminder stands behind it.**

- `AGENTS.md:19` calls running the guard "non-negotiable".
- `README.md:78` says "This project runs its own entropy guard before every commit."

The only mechanism is `.githooks/pre-commit`. It always exits 0 (`:9`) and runs only in clones that link it
(`README.md:140`). Whether any clone has it enabled is **unknown**, because the snapshot has no `.git`. The
commit-message note convention (`README.md:138`) cannot be checked without history. Patch 03 rewrites
`README.md:78` to describe a reminder, citing `DECISIONS.md:31-35`.

**F12. The local guard is stale and falls short of what the generator requires.** Stale content:

- `:33,137` cite `doc-health-check`, which does not exist.
- `:99` cites a "README.md (Key Documents table)" that does not exist.
- `:92` says "20+ markdown files"; there are 17.
- `:3` refers to plural "guard generators", which were the deleted domain generators.
- `:68` says to edit `INTENT.md` (F03).
- "Last evaluated: 2026-04-07" (`:21`) predates the generator, so the guard never checks the contracts between the
  skills (F04).

It also lacks these generator requirements:

- a pointer to the steward;
- the intent-change rule;
- a definition of what changed in the session;
- exact commands;
- modes;
- a report shape;
- safety rules.

This is refined in `guard/SKILL.md`.

**F13. Two lists of the repo's files are maintained by hand.** `AGENTS.md` "Key Files" (`:36-47`) and `README.md`
"What's here" (`:82-115`) both list the skills and core documents, each with its purpose. The local guard (`:99`)
asks contributors to update both. They agree today. The recommendation is to keep one and reduce the other to a
link; this is not patched, because which one to keep is the maintainer's choice.

**F14. Scaffolding from `seed` was never pruned.**

- `AGENTS.md:21` says "Working code with tests beats perfect code", in a repo with no code or tests
  (`AGENTS.md:51,57`).
- `.gitignore` has a Go block.
- `.editorconfig` has rules for Python, Go and Makefiles.

The risk is low. Prune it, and report it to `seed` as `AGENTS.md:66-68` asks.

**F15. Work is tracked in two places.** `TODO.md:3` defers an issue tracker "once the project has momentum", but
GitHub issues already carry work: the issue cluster #9 to #12 (`DECISIONS.md:17`) and agent feedback filed by
`skills/local/entropy-guard-feedback`. `TODO.md` does not point at them, and their state is unknown to this run.
Patch 01 adds a pointer.

**F16. `INTENT.md` disagrees with itself about whether every guard is a skill file.** `INTENT.md:80` says "Each
guard is a skill file ready to be placed in the target system". `:65` says a guard is not "always a skill file",
and the enforcement-depth spectrum (`:98-109`) agrees with `:65`.

- Concrete case: the link check proposed here belongs in a hook or CI under `:65`, but would have to be a skill
  check under `:80`.
- The evidence settles this in favour of `:65`, together with `DECISIONS.md:31-35`.
- The one-line correction to `:80` is not patched, because it edits `INTENT.md` while Q1 is open.

---

## Canonical truth map

| Concept | Canonical home | Other mentions, and their status |
|---|---|---|
| Purpose, scope boundary, entropy model, guard principles | `INTENT.md` | `README.md:3-17,119-125` and `AGENTS.md:3,31-34` summarise it, acceptably. `README.md:119-125` comes close to a second full statement. |
| What a guard is: skill file or not | `INTENT.md:59-66,98-109` | `INTENT.md:80` disagrees (F16) |
| Guard lifecycle (generator, integrator, runner, evaluator) | `INTENT.md:84-96` | Stale: it omits `session-coherence-skill-generator` (F04) |
| Who writes guards | **Contested** (F04, Q2) | docs-first Phase 2; the generator; `README.md:52-58`; `guards-integrator:20` |
| Routing and system shapes | `skills/entropy-assessment/SKILL.md` | `README.md:25-42` and `INTENT.md:71` summarise it |
| Working practice | `AGENTS.md:17-27` | `README.md:131-140` summarises it; the local guard's check 4 and the hook's message repeat parts |
| Who decides intent | **None** (F01) | Inferred from the explorations |
| Decisions | `DECISIONS.md` | Undated (F02); four entries describe removed structure (F07) |
| Learnings, and the boundary with articles | `LEARNINGS.md`; `DECISIONS.md:139-143` | Several entries are stale or exploratory (F09) |
| Current state and next work | `TODO.md` | The next step is restated in `INTENT.md:129-135`, `README.md:125` and `DECISIONS.md:26`, which disagrees (F08). GitHub issues are not linked (F15). |
| Inventory of files and skills | `AGENTS.md` "Key Files" and `README.md` "What's here" | Two hand-kept lists (F13) |
| Product artifacts: the exported skills | `skills/*/SKILL.md` | Their stated handoffs disagree (F04, F06) |
| Historical material | `explorations/` | Not marked as history (F10). Cited legitimately from `PHILOSOPHY.md:45` and `LEARNINGS.md:122`. |

## Loop map

This is the real loop as far as a snapshot without history can show it.

- **Session start.** A human or agent opens a clone. `AGENTS.md` is the only agent instruction file; there is no
  `CLAUDE.md` or similar. Its Quick Links lead to `TODO.md`. Before significant design work, the contributor
  consults `INTENT.md` (`AGENTS.md:27`).
- **During work.** The contributor writes the task under "Doing Now" (`AGENTS.md:22`) and updates documents in the
  same change (`AGENTS.md:23,32`).
- **Capture.** Decisions and learnings are captured through the local guard's checks 1 and 2, at the end of the
  session.
- **Coherence pause.** The contributor runs `skills/local/entropy-guard/SKILL.md` before committing
  (`AGENTS.md:19`). The reminder hook prompts for it only if the clone enabled it, which is unknown (F11).
- **Handoffs.** The main handoff is the local commit, which should carry "entropy check clean" or a note
  (`README.md:138`). Pull requests exist ("the `guards-integrator` PR", `LEARNINGS.md:152`), but whether every
  change goes through one is unknown.
- **Automated gates.** None: there is no CI and there are no tests (`AGENTS.md:49-58`).
- **Feedback.** Upstream feedback becomes GitHub issues through `skills/local/entropy-guard-feedback` (`gh`).

## Entropy profile

The top risks, ranked by decay rate times recovery cost.

| Rank | Risk | Findings | Decay | Recovery | Current symptom | Anchor for the fix |
|---|---|---|---|---|---|---|
| R1 | Parallel guard writers, and contracts between the skills drifting apart | F04, F05, F06 | Fast: every skill edit widens the gap | High: users of the product get contradictory routes, and consolidating needs a decision | `README.md` sends guard generation to docs-first while listing the generator. `guards-integrator` assumes `entropy-assessment` generates guards. A recorded requirement vanished. | Q2, then `INTENT.md` "The guard lifecycle" |
| R2 | Undefined authority over intent | F01, F02, F03 | Slow | Catastrophic (`INTENT.md:33`): revision reasons are already overwritten | Any agent may rewrite `INTENT.md`. No decision is attributable. | Q1, then `AGENTS.md` and the `INTENT.md` header |
| R3 | The decision log and the product disagree | F06, F07, F08 | Medium | High: archaeology across 17 undated entries | Decisions describe removed phases and appendices, and two statements of the next step conflict | `DECISIONS.md` markers (patch 02); Q3 |
| R4 | Superseded material sitting next to live truth | F09, F10, F16 | Slow to medium | Medium | Stale step references and conversation-only learnings; `explorations/` not marked as history | `LEARNINGS.md` notes and the history lines (patch 03) |
| R5 | Workflow claims ahead of practice, and a stale guard | F11, F12, F14, F15 | Medium | Low to medium | "Non-negotiable" rests on an opt-in reminder. The guard cites things that do not exist. | The refined guard and patch 03 |

## Recommendations

- **Consolidate.** Make one skill the guard writer (Q2), then correct `INTENT.md` "The guard lifecycle",
  `README.md:52-58`, `guards-integrator:20,227` and the front door's routes, including a route for young repos.
  Reduce `AGENTS.md` "Key Files" or `README.md` "What's here" to a link to the other (F13).
- **Demote, or mark as history.**
  - `explorations/` (F10).
  - The three conversation-only learnings, and the stale step references (F09).
  - The decision entries now partly superseded (F07).
- **Correct, citing recorded decisions.**
  - `README.md:78` (F11).
  - Restore verification of bootstrap actions in docs-first (F06).
  - Remove the FlowBook residue (F05).
  - Add the steward's source to the "Farm" entry (F02).
- **Guard.** Refine `skills/local/entropy-guard/SKILL.md` in place (F12). The draft is `guard/SKILL.md`.
- **Leave to the steward.** `AGENTS.md:27` (Q1); the guard-writer routing (Q2); the validation measure (Q3);
  `INTENT.md:80` (F16, after Q1).

## Bootstrap actions

Each action was verified against the snapshot on 2026-10-07. Completion is tracked in the `TODO.md` "Coherence
cleanup" list (patch 01), never in the guard.

| Id | Action | Verified by | Patch |
|---|---|---|---|
| B1 | Add supersession markers to 4 entries in `DECISIONS.md` | grep: markers exist only at `:105` and `:131` | 02 |
| B2 | Add the steward's source and date to the "Farm" entry | `explorations/…conversation.md:713` | 02 |
| B3 | Record P1 to P3 as proposals awaiting the steward | `DECISIONS.md` has no proposal section | 02 |
| B4 | Restore verification of bootstrap actions in docs-first | `docs-first-planning-assessment/SKILL.md:114`; no `verif` in any skill | 04 |
| B5 | Remove the FlowBook residue from the generator | `:22,193` | 04 |
| B6 | Describe the hook as a reminder in `README.md:78` | `.githooks/pre-commit:9` is `exit 0` | 03 |
| B7 | List `explorations/` as history in `README.md` and `AGENTS.md` | absent from both lists | 03 |
| B8 | Add notes to stale and conversation-only learnings | `LEARNINGS.md:33,63,93,117-143` | 03 |
| B9 | Add a current-state section to `TODO.md`, and correct the false clause in backlog item `:20` | `TODO.md:5-20` | 01 |
| B10 | Replace the local guard with the refined guard, after Q1 | `guard/SKILL.md` | none (draft) |
| B11 | Prune the seed residue | `AGENTS.md:21`; `.gitignore`; `.editorconfig` | none (listed in `TODO.md`) |

## Current-state update

`TODO.md` is the file a fresh session reads first (`AGENTS.md:7-10,22`), so the update goes there rather than into
a new file: `patches/01-TODO-current-state.patch`. It adds a "Current state" section, about 35 lines. The section
covers:

- the stage, with its source and the date it was last checked;
- the documents to trust first;
- the settled decisions, each linked by title;
- open questions P1 to P3;
- misleading nearby material;
- a pointer to GitHub issues;
- three next actions;
- what makes the section stale, and who refreshes it: whoever runs the local guard before committing.

The patch also corrects `TODO.md:20` and adds the one-time "Coherence cleanup" checklist. "Next Up" is unchanged,
because it depends on Q3.

## Patches compared with the open questions

| Patch | Settles an open question? |
|---|---|
| 01 `TODO.md` | No. It lists P1 to P3 as open and leaves "Next Up" unchanged. |
| 02 `DECISIONS.md` | No. P1 to P3 are marked as proposals. The supersession markers come from later recorded decisions. The "Farm" note quotes the steward and explicitly leaves the validation sentence under P3. |
| 03 `README.md`, `AGENTS.md`, `LEARNINGS.md` | No. The `README.md:78` wording follows `DECISIONS.md:31-35`. The history lines follow the steward's `:713`. Nothing touches `INTENT.md`, `AGENTS.md:27` or the guard-writer routes. |
| 04 skills | No. The verification restored follows `DECISIONS.md:42`. Removing FlowBook does no harm under any answer to Q2. |
| Guard draft | Provisional on Q1, which is marked in its header comment and in its Intent section. It names the skills that hand to one another without saying which writes guards (Q2), and it says nothing about the validation measure (Q3). |

Left unpatched until the steward answers:

- `AGENTS.md:27` (Q1);
- `INTENT.md:84-88`, `README.md:52-58`, `guards-integrator:20,227` and the routes in `entropy-assessment` Step 3
  (Q2);
- the validation sentence at `DECISIONS.md:26`, and `TODO.md` "Next Up" item 2 (Q3);
- `INTENT.md:80` (F16).

The patches apply cleanly to a fresh copy of the snapshot with `git apply`. `git diff --cached --check` reports
nothing (2026-10-07). Patch 03's status line for `LEARNINGS.md:33` assumes patch 04 is applied.

---

## Phase 2: input to the guard generator

### Step 7: existing guard surfaces

| Surface | Classification | Why |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | amend, in place | Mostly sound, but stale and short of the generator's requirements (F12) |
| `.githooks/pre-commit` | keep as-is | A non-blocking reminder by design (`DECISIONS.md:31-35`). It names the guard's path, which stays the same. |
| `AGENTS.md` "Working Practices" | amend | `:27` after Q1; `:21` seed residue (F14). The rest stays. |
| `README.md` "Adapt the project's own guard" and "Contributing" | amend | `:78` wording (F11) |
| `TODO.md` | amend | Current-state section (patch 01) |
| `DECISIONS.md`, `LEARNINGS.md` | amend | Proposals, markers and notes (patches 02 and 03) |
| `explorations/` | demote to historical context | F10 |
| Upstream feedback checks in the exported skills, and `skills/local/entropy-guard-feedback` | keep as-is | Working as designed (`DECISIONS.md:63-67`) |

### Step 8: docs-first checks, written against this repo

These are carried into the guard's "Judgment checks":

- one canonical home, with a map of concepts to homes;
- one owner, not two copies;
- supersession, pointing at the markers in `DECISIONS.md` and the list of misleading material in `TODO.md`;
- the contracts between the skills (new, from F04 and F06);
- capture of decisions and learnings;
- honest state in `TODO.md`, plus agreement between "Next Up" and its restatements;
- workflow alignment across `AGENTS.md`, `README.md`, the hook and the guard;
- claims about practice (from F11);
- entropy the guard itself might introduce.

**Ready for tooling now:**

- relative links resolve;
- every skill's `name` matches its folder, and it has a `description` (`DECISIONS.md:79-83`);
- whitespace.

All three are durable invariants. **Kept as judgment:** everything that depends on wording or on the structure of the
skills, which is still moving (Q2).

### Step 9: handed to `session-coherence-skill-generator`

The generator received the Intent section, the canonical truth map, the loop map, the Step 8 checks and the Step 7
surfaces above.

### Generator report

The generator ran in plan mode, because the target is read-only; it edited nothing in the target.

- **Structures found.**
  - Purpose: `INTENT.md` and `README.md`.
  - Current state: `TODO.md`, with GitHub issues unlinked.
  - Decisions and learnings: `DECISIONS.md` and `LEARNINGS.md`.
  - Operator instructions: `AGENTS.md`.
  - Guard: `skills/local/entropy-guard/SKILL.md`, plus `.githooks/pre-commit`.
  - Rules owned elsewhere: `seed` scaffolding (`AGENTS.md:66-68`).
  - Absent: no CI, no tests, no live services, no spending.
- **Bootstrap mode does not apply.** The repo has a repeated loop and every memory surface on the generator's
  ladder.
- **Guard:** refined in place. The draft is `guard/SKILL.md`, for `skills/local/entropy-guard/SKILL.md`. It keeps
  the `skills/local/` convention, with `name` matching the folder. Build mode would change that file and apply
  patches 01 to 04. `AGENTS.md:19`, `README.md:137` and the hook already name the path, so no new reference to the
  guard is needed.
- **Generator step 1, recording the work in `TODO.md` "Doing Now",** was not possible: the target is read-only.
- **Validation, run on 2026-10-07 in scratch git copies under `.work/`** (since removed):
  - The guard's "What changed" block, run as written under `sh` and `bash`, reported staged, unstaged and untracked
    changes separately. It printed "coverage incomplete" and fell back to `HEAD` when no start point or upstream
    existed. With an upstream set, it listed the session's commits.
  - The mechanical checks, run as written, caught a planted broken link, a mismatched skill `name`, a missing
    `description` and a trailing-whitespace error. They ignored a link inside a fenced code block.
  - On the snapshot with all patches applied and the guard installed, they reported nothing.
  - `git diff --cached --check` on that copy reported nothing.
- **Open questions the guard leaves visible:** P1 (in its header comment and Intent section). P2 and P3 are listed
  in the `TODO.md` current-state section.
- **Handed to `guards-integrator`:** `integration.md`.

---

## Uncertainties and gaps in coverage

- No git history, so no claims about recency, commit practice, whether the guard is actually run, or whether the
  hook is enabled in any real clone.
- GitHub issues (#9 to #12, and agent feedback), the sibling `entropy-immune-system` repo and the `writing` repo
  were not read, so their state is unknown. The "distill-article" skill may live in one of them.
- The steward is inferred, not recorded (F01).
- The `explorations/` transcripts were read in part. A steward statement elsewhere in them could bear on Q2 or Q3.
- The refined guard is 202 lines against the old guard's 139. Whether it still fits the 2 to 5 minutes that
  `AGENTS.md:19` promises is unknown until it has been run a few times (see `integration.md`).
- The target is itself a copy of entropy-guard, without `intent-pass.md`. I treated it as any other target, so
  the guard carries a filled-in copy of the intent-change rule rather than pointing to the rule's source file.

## Upstream feedback check

Yes: two reusable points about the skills used in this run. They are drafted in `feedback.md` in the feedback
helper's issue format, and not filed, because this run has no network access.
