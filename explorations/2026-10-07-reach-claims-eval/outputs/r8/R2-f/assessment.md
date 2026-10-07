# Entropy assessment: entropy-guard, snapshot 447da9a

Assessed 2026-10-07 with entropy-guard's skills (`entropy-assessment` v0.9.0, route A through
`docs-first-planning-assessment` v0.3.0, then `session-coherence-skill-generator` v0.5.0 and `guards-integrator`
v0.4.0).

**Mode.** Build, with every change delivered as files in this folder. The target is a read-only snapshot with no
`.git`, so nothing in it was edited. The files build mode would change are listed under "Patches" below.

**Evidence limits, kept visible.**
- No git history: the "enacted" reading uses artifact dates and `TODO.md` only, and nothing can show whether the
  reminder hook is enabled or what commit messages record.
- Every file in the snapshot carries the same timestamp, 2026-05-11 21:50, so file dates show when the snapshot was
  written, not when each file changed.
- Not read: the sibling `../entropy-immune-system` repo, the `writing` repo, and the GitHub issues cited in
  `DECISIONS.md` line 17 (`#9`-`#12`). These are outside the permitted scope; claims about them are unverified.

---

## 1. Intent

**Steward.** Not named anywhere in the repo (F1). Justin Philpott is inferred from these three facts:
- He owns `justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md` line 10).
- He owns the seed project the repo was scaffolded from (`AGENTS.md` line 68).
- He directs the work in the preserved conversations, for example
  `explorations/2026-03-24-entropy-immune-system-conversation.md` line 713.

`LICENSE` line 3 names "entropy-guard", not a person.

**Authorised intent, with the source of each part.** Only the 2026-03-24 conversation lines are both attributed to the
steward and dated. Every `DECISIONS.md` entry is a recorded decision with no date and no author (F2).

| Part | Source | Kind and authority |
|---|---|---|
| Practical guards that keep iterated, AI-assisted systems coherent: low-burden, delta-scoped, minimum viable, self-applying | `INTENT.md` lines 9-65, 113-118; `README.md` lines 3, 13-15 | intent document; unattributed; revised 2026-04-07 |
| Keep entropy-guard practical; the broader entropic-immunity theory lives in the sibling repo | `DECISIONS.md` lines 23-27; steward, 2026-03-24 conversation lines 86 and 713 | decision (undated), plus steward statements (attributed, dated) |
| `entropy-assessment` is the single front door and router; docs-first planning is the deepest specialization | `DECISIONS.md` lines 15-19; `INTENT.md` line 5 | decision (undated); intent note (2026-04-07) |
| Next phase: external validation on a batch of docs-first planning repos | `INTENT.md` lines 122-135; `TODO.md` lines 11-13; `README.md` line 125 | intent document and state; measure in conflict (F5) |
| Guard adoption matures External, then Prompted, then deeper embedding | `DECISIONS.md` lines 31-35 | decision (undated) |
| Invest in guard-creation skills, not a guard library | `DECISIONS.md` lines 121-125 | decision (undated) |
| Exportable skills under `skills/`, local ones under `skills/local/`; agentskills.io `SKILL.md` format | `DECISIONS.md` lines 71-83; `AGENTS.md` line 33 | decisions (undated) |

**Enacted.** The newest dated work is `skills/session-coherence-skill-generator/` (metadata: generated 2026-05-10,
updated 2026-05-11) and the bootstrap entry at the top of `DECISIONS.md`. The declared next phase, external
docs-first validation, has no recorded results. `INTENT.md` and the local guard were last revised or evaluated on
2026-04-07, before the generator arrived. This is not established as unauthorised drift, because a decision entry exists
for the generator's bootstrap mode, but its adoption and role were never decided (F3, Q1).

**Gaps, by condition.**
- **Missing:**
  - the steward (F1);
  - a decision adopting `session-coherence-skill-generator` and dividing guard building between it and docs-first
    (F3, Q1).
- **Conflict:**
  - who may change `INTENT.md` (F4, Q2);
  - what the validation loop measures (F5, Q4).
- **Ambiguous:**
  - the status of `explorations/` and the autopoiesis-derived `LEARNINGS.md` entries after the farm-off (F6, Q3);
  - `INTENT.md` line 80 against line 65 on whether every guard is a skill file (F18; low, not asked).
- **Prose control:**
  - the "non-negotiable" guard run, enforced only by an opt-in, non-blocking reminder (F7);
  - periodic self-assessment with no trigger (F8).
- **Stale description:** three `DECISIONS.md` entries still describe `entropy-assessment` as carrying Phase 2 and
  appendices, which "Specialize first…" plainly ended (F10). They are corrected in the settled patch, citing that
  decision.
- **Unauthorised drift:** none established.

**Repair instructions read against the intent-change rule.** Quoted from the existing guard,
`skills/local/entropy-guard/SKILL.md`:
- **Intent:** line 68, "if INTENT.md itself needs revision, update it with a dated note explaining what prompted the
  change." This is a path for unauthorised drift. The same instruction sits in `AGENTS.md` line 27, "update INTENT.md
  and note why", and in `INTENT.md` lines 3 and 139 (F4).
- **Ownership:** line 88, "Did you change something that another doc also describes? If so, update both." It pulls
  against line 87 of the same check, which asks for one canonical home (F13). Line 99's list of `AGENTS.md` and README
  structure tables is not a violation: those are indexes, which are summaries.

**Questions:** Q1 to Q4, in `questions.md`, each with its recommended answer.

**Proposed changes, and where they are recorded.** All four questions are recorded in `DECISIONS.md` under a new
"Proposed, awaiting the steward" section, which is the decision owner, and summarised in `TODO.md`. Both edits are in
`patches/settled.patch`. Nothing is decided by recording them.

---

## 2. Lifecycle, shape and repositories

**Lifecycle: active.** The evidence:
- `README.md` lines 5 and 119: "Actively evolving".
- `TODO.md` lines 11-13: three open Next Up items.
- The newest artifact date is 2026-05-11, in the generator's metadata.

Commit cadence cannot be checked without git.

**Shape: A, docs-first planning, with D (workflow-heavy) overlapping.** The evidence:
- The repo has no application code: `AGENTS.md` lines 31, 51 and 57. Its files are 17 markdown files, one hook
  script and three configuration files.
- `TODO.md`, `DECISIONS.md` and `AGENTS.md` carry the state.
- Work happens in repeated human and agent sessions (`AGENTS.md` lines 19-27).
- The overlap with D: `DECISIONS.md` lines 57-59 treat workflow as part of the artifact.

A was taken because the top risks are docs-to-docs, among skills that are product artifacts (F3, F9, F10).
Docs-first's risk matrix also covers workflow drift.

**Repositories: one.**
- The sibling `entropy-immune-system` repo is a separate system that took over the broader theory. It does not manage
  this repo's work.
- Some work items live in GitHub issues on this same repo. They were not read.

---

## 3. Findings

One list, referred to by id everywhere else. Each finding is classed by the docs-first risk it belongs to.

| Id | Finding | Evidence | Class |
|---|---|---|---|
| F1 | No document names the steward. | Searched all files for "steward", "owner" and "maintainer"; none names one. Inferred from the three sources in section 1. | missing |
| F2 | `DECISIONS.md` entries carry no dates or authors, and their order is mixed: the top is newest-first, but "Consolidate…" (line 129), newer than "Two-layer…" (line 103), sits at the bottom. | `DECISIONS.md` throughout | state, decisions |
| F3 | Two definitions of how a guard is generated, with different required contents, and no decision adopting the second. `INTENT.md` names only the assessment workflow. The repo's reference guard follows neither definition fully. | docs-first `SKILL.md` lines 132-202; generator `SKILL.md` lines 198-231, 268-315; `INTENT.md` lines 86-88; `DECISIONS.md` lines 7-11 | parallel truth (product artifacts) |
| F4 | Agents are told to revise `INTENT.md` themselves, which conflicts with intent being "the most protected" element. | `INTENT.md` lines 3, 139; `AGENTS.md` line 27; guard line 68; `LEARNINGS.md` line 133 | intent |
| F5 | The validation loop's batch and measure differ: open-source projects and merged PRs, against docs-first repos and session-recovery measures. | `DECISIONS.md` line 26; `INTENT.md` lines 129-135; `README.md` line 125; `TODO.md` lines 11-13 | intent, state |
| F6 | After the farm-off, `explorations/` (4 files) has no status here and is not listed in README or `AGENTS.md`. Three `LEARNINGS.md` entries "validated by" a philosophical conversation prescribe ephemeral, non-persisted guards, against the persistent-guard practice. | `DECISIONS.md` lines 23-27; `LEARNINGS.md` lines 117-143 (header line 3: "Focus on what you validated"); working-conclusions file lines 18-20 | superseded material nearby |
| F7 | The guard run is called "non-negotiable" and "mandatory". Its only mechanism is a non-blocking hook (`exit 0`) that each clone must enable, and the snapshot cannot show whether it is enabled. Nothing cites it as a hard control: the guard's metadata (line 22) and README line 137 describe it honestly. | `AGENTS.md` lines 19, 41; `.githooks/pre-commit` line 9; `README.md` line 140 | prose control, workflow |
| F8 | "It should be run on this project periodically" has no trigger. The guard was last evaluated on 2026-04-07, before the generator (2026-05-10) and the top `DECISIONS.md` entry. | `INTENT.md` line 82; guard lines 21, 139 | prose control, state |
| F9 | Skill handoffs do not connect. (a) The front door has no route to the generator or to young repos, although README line 31 says to start there. (b) `guards-integrator` expects `entropy-assessment` to generate guards, which v0.6.0 does not. (c) The generator never hands on to `guards-integrator`, against "Guards need closed-loop integration". | (a) `entropy-assessment` lines 42-71, 118-124; README lines 31, 91. (b) integrator lines 20, 221. (c) generator `SKILL.md` (no mention); `DECISIONS.md` lines 87-91 | parallel truth (product contracts) |
| F10 | Three decision entries still describe `entropy-assessment` holding Phase 2 or domain appendices, with no supersession marker. "Consolidate…" claims to supersede "Exportable vs local", which the later "Specialize…" made moot. | `DECISIONS.md` lines 39-43, 47-51, 95-99, 134; `entropy-assessment` v0.6.0 | superseded material nearby |
| F11 | `LEARNINGS.md` implications point at structures that no longer exist: Step 0 and the domain generators, old Steps 5, 7 and 8, and a `distill-article` skill not in this repo. | `LEARNINGS.md` lines 33, 63, 87-93, 112 | stale references |
| F12 | The state file `TODO.md` has no current-state block, and the newest work (the generator, the bootstrap decision) leaves no trace in it or in `INTENT.md`. | `TODO.md` lines 1-20 | state dishonesty |
| F13 | The existing guard has stale or flagged lines. Line 33 sends readers to `doc-health-check`, which does not exist (line 137 and `TODO.md` line 20 admit this). Line 92 says "20+ markdown files"; the snapshot has 17, counted 2026-10-07. Line 99 cites a README "Key Documents table"; README has "What's here" tables. Lines 68 and 88 are flagged in section 1. | guard `SKILL.md` | stale references, workflow |
| F14 | The generator carries imported residue. It names "FlowBook" (lines 22, 193), a project nowhere in this repo. Its metadata scheme (`generated`, `last_updated`, `skill_version`) differs from every other skill's `metadata.version`. It is framed for "a coding session". | generator `SKILL.md` lines 4-13, 18-24, 193 | superseded/imported material |
| F15 | The commit-note convention differs. README says always note the result ("or 'entropy check clean'"); the guard says note it "if anything changed". | `README.md` line 138; guard line 131 | workflow |
| F16 | The enforcement-depth spectrum is restated in full in two skills, one under different names: "Narrative" for "External". | `INTENT.md` lines 98-109 (owner); `guards-integrator` lines 92-99; docs-first lines 177-182 | parallel truth (low) |
| F17 | Seed-scaffolding residue in a repo with no code. | `AGENTS.md` line 21 ("Working code with tests…"); `.gitignore` lines 17-25 (Go); `.editorconfig` lines 11-18 | stale scaffolding (low) |
| F18 | `INTENT.md` says "Each guard is a skill file ready to be placed…" (line 80) and also that a guard is not "Always a skill file" (line 65). | `INTENT.md` | ambiguity (low) |

**Checked and found sound:**
- Every relative markdown link resolves, by a link check run on 2026-10-07.
- `AGENTS.md` "Key Files" and README "What's here" list the same 6 skills.
- The exportable and local split matches `AGENTS.md` line 33.
- The reminder hook's text matches the guard's path.
- `TODO.md` "Doing Now" is cleared.

---

## 4. Truth map

| Concept | Canonical home | Also stated in | Status |
|---|---|---|---|
| Purpose, entropy definition, guard principles, enforcement depth, guard lifecycle | `INTENT.md` | README (summary), `AGENTS.md` line 3 (summary), integrator and docs-first (restated, F16) | lifecycle section stale (F3) |
| Scope and the sibling repo | `DECISIONS.md` "Farm…" | `INTENT.md` lines 122-127, README lines 7 and 123, `AGENTS.md` line 34 (summaries) | sound |
| Next validation loop | `INTENT.md` lines 129-135 | `TODO.md` lines 11-13 (state), README line 125 (summary), `DECISIONS.md` line 26 (differs) | conflict (F5) |
| Working practices | `AGENTS.md` "Working Practices" | README "Contributing" (summary), hook text (summary), guard check 4 | commit note differs (F15) |
| Decisions | `DECISIONS.md` | — | undated (F2), unmarked supersessions (F10) |
| Learnings | `LEARNINGS.md` | — | theory mixed in (F6), stale implications (F11) |
| Current state | `TODO.md` | README "Project status" (summary) | thin (F12) |
| How a guard is generated | **two homes**: docs-first Phase 2, generator | `INTENT.md` lines 86-88 | parallel truth (F3, Q1) |
| Guard placement and integration | `skills/guards-integrator/` | docs-first Step 8 (short, delegates) | handoff stale (F9) |
| Repo file index | `AGENTS.md` "Key Files" | README "What's here" | sound (both are indexes) |
| This repo's guard | `skills/local/entropy-guard/SKILL.md` | — | product artifact and local ritual; amend |
| Product artifacts (skills as contracts) | each `skills/*/SKILL.md` | README and `AGENTS.md` descriptions | handoffs broken (F9) |
| Historical or imported material | `explorations/` (4 files), generator FlowBook text | PHILOSOPHY autopoiesis section (reflection, fine) | undemoted (F6, F14) |

## 5. Loop map

This is the loop as documented. No git history was available to check practice against it.

1. **Start.** An agent loads `AGENTS.md`, the only instruction file in the snapshot, then `TODO.md` and writes "Doing
   Now" (`AGENTS.md` line 22). It consults `INTENT.md` for significant choices (line 27).
2. **Work tracking.** `TODO.md` holds it, plus GitHub issues: `#9`-`#12` are cited, and the feedback helper files
   `agent-feedback` issues.
3. **Capture.** Decisions and learnings are recorded at session end through guard checks 1 and 2.
4. **Handoff.** At the end of a meaningful session, before commit, the contributor runs
   `skills/local/entropy-guard/SKILL.md` and notes the result in the commit message. The reminder hook nudges, if it is
   enabled.
5. **Review.** Pull requests sometimes: `LEARNINGS.md` line 152 cites PR review feedback. There is no CI and no PR
   template.
6. **Lost follow-up.** Periodic re-assessment (F8), and records that only the GitHub issues hold.

A context-free agent session given only the snapshot found the guard step on 2026-10-07. It read `README.md` and
`AGENTS.md` and cited `AGENTS.md` line 19 and README lines 137-138 (`integration.md`).

## 6. Ranked risks

| Rank | Risk | Findings | Decay | Recovery cost | Anchor for the fix |
|---|---|---|---|---|---|
| 1 | Parallel truth in the product: two guard builders and broken skill handoffs. Users get differently shaped guards depending on the door they enter. | F3, F9, F16 | fast: each skill edit can diverge | high: every assessed repo's guard inherits it | a `DECISIONS.md` entry naming one builder (Q1) |
| 2 | Intent edited by the work it should govern | F4 | slow | catastrophic: intent entropy, per `INTENT.md` line 33 | `DECISIONS.md` (Q2), then `AGENTS.md` line 27 and the guard |
| 3 | Superseded and imported material sitting next to live truth | F6, F10, F11, F14 | medium | medium | `DECISIONS.md` supersession markers; Q3 |
| 4 | The state file falling behind the work | F12, F8, F5 | fast | low if caught in one session | `TODO.md` "Current state" |
| 5 | Workflow drift around the guard run | F7, F13, F15 | fast | low | `AGENTS.md` "Working Practices" and the guard |

## 7. Recommendations

- **Consolidate:**
  - guard generation into one builder (Q1; provisional patch Q1);
  - the enforcement-depth restatements in `guards-integrator` and docs-first into links to `INTENT.md` plus local
    implications (F16; not patched, because it is a product-content change best made with Q1).
- **Demote or mark historical:**
  - the three superseded `DECISIONS.md` entries (F10; settled patch);
  - `explorations/` and the three `LEARNINGS.md` theory entries (F6; provisional patch Q3).
- **Record:**
  - the steward, in `AGENTS.md` or `INTENT.md` (F1). That edits an intent-bearing document, so it is the steward's to
    make; not patched;
  - dates and the decider on new `DECISIONS.md` entries (F2). The updated guard asks for this.
- **Prune:** the seed residue (F17) and the stale `LEARNINGS.md` implications (F11), with one dated note each. These
  are low priority, so they are left as recommendations.

**One-time cleanup, each item checked against the current file on 2026-10-07:**
- The guard's lines 33, 88, 92, 99 and 131 (F13, F15). The quoted text is present; settled patch.
- `guards-integrator` lines 20 and 221 (F9b). Present; settled patch.
- The generator's "FlowBook" text, lines 22 and 193 (F14). Present; settled patch.
- `DECISIONS.md` supersession markers (F10). The three headings are present and unmarked; settled patch.

## 8. Patches

All patches are in `patches/`. Each applies with `patch -p1` from the repo root. The settled patch was checked against
the snapshot, and each provisional patch against the settled result, alone and all four in sequence. `git diff
--check` found no whitespace errors, and the link check found no broken links in any resulting tree.

| Patch | Touches an open question? | Files build mode would change |
|---|---|---|
| `settled.patch` | none | `TODO.md` (current-state block, F12), `DECISIONS.md` (proposals Q1 to Q4; markers, F10), `skills/local/entropy-guard/SKILL.md` (F13, F15), `skills/guards-integrator/SKILL.md` (F9b), `skills/session-coherence-skill-generator/SKILL.md` (F14) |
| `provisional-Q1.patch` | Q1 (and edits `INTENT.md`) | `INTENT.md`, `README.md`, `skills/entropy-assessment/SKILL.md`, `skills/docs-first-planning-assessment/SKILL.md`, `skills/session-coherence-skill-generator/SKILL.md` |
| `provisional-Q2.patch` | Q2 (and edits `INTENT.md`) | `AGENTS.md`, `INTENT.md`, `skills/local/entropy-guard/SKILL.md` (installs `guard/SKILL.md`) |
| `provisional-Q3.patch` | Q3 | 4 files in `explorations/`, `LEARNINGS.md`, `README.md` |
| `provisional-Q4.patch` | Q4 (and edits `INTENT.md`) | `DECISIONS.md`, `INTENT.md`, `TODO.md` |

The state-file update required by docs-first Step 5 is the `TODO.md` hunk of `settled.patch`. Its open questions point
to `DECISIONS.md` rather than restating them, and it states that it goes stale and who refreshes it.

## 9. Guard inputs and decision

**Guard surfaces.**
- `skills/local/entropy-guard/SKILL.md`: **amend**, by update in place to the generator's contract.
- `.githooks/pre-commit`: **keep**. Its text still names the right path.
- `AGENTS.md` "Working Practices": **amend** line 27, provisional on Q2. **Keep** line 19.
- README "Contributing": **keep**. The updated guard adopts its commit note.
- `TODO.md`: **amend** (state block).
- `DECISIONS.md`: **amend** (markers and proposals).
- The four exportable skills: **amend** handoffs. Partly settled; the rest waits on Q1.
- `explorations/`: **demote**, provisional on Q3.

**Guard decision: `update`.** An existing guard is in use and sound in scope (one combined docs and workflow guard at
session end, per `DECISIONS.md` lines 55-59). It needs amendment for F4, F13 and F15, the missing skill-contract and
state checks, and the generator's contract.

**Generator inputs.**
- **Steward:** unresolved, inferred as Justin Philpott (F1).
- **Intent documents:** `INTENT.md`; `AGENTS.md` "Project Constraints"; README "Project status" as a summary.
- **Decision surface:** `DECISIONS.md`.
- **Open intent questions:** Q1 to Q4.
- **Current-state file:** `TODO.md`, refreshed by whoever runs the guard at session end (`AGENTS.md` line 22).
- **Rules bound by but not owned:**
  - the agentskills.io format (`DECISIONS.md` lines 79-83);
  - the seed scaffolding (`AGENTS.md` lines 66-68);
  - the GitHub `agent-feedback` label convention (feedback skill line 49).

  No user-wide instructions file is visible in the snapshot.
- **Verification commands:** none declared (`AGENTS.md` lines 49-52). The repo implies `git diff --check`
  (`.editorconfig` trims trailing whitespace), a search for old names, and a link check. None runs by itself: there is
  no CI and the hook only prints.
- **Code areas:** none. The product artifacts are `skills/*/SKILL.md`, described by README "What's here", `AGENTS.md`
  "Key Files" and `INTENT.md`'s guard lifecycle.
- **Live operational state or spend:** no spend. One external side effect: `skills/local/entropy-guard-feedback/`
  creates GitHub issues with `gh issue create`.
- **Findings:** F1 to F18 above.

## 10. Generator output

- **Supplied:** this assessment's findings and inputs. No input was guessed. The steward is marked as inferred in the
  guard.
- **Guard:** `guard/SKILL.md`, an update in place of `skills/local/entropy-guard/SKILL.md`. It keeps the name
  `entropy-guard` so the name matches its directory (`DECISIONS.md` "Skill format"), rather than the contract's default
  `session-coherence-guard`.
- **Install:** provisional on Q2, because its Intent section carries the intent-change rule and `AGENTS.md` line 27
  currently says otherwise. Until then, the settled patch corrects the existing guard's stale lines.
- **The rule is copied, not linked.** The rule file says a guard inside entropy-guard points to
  `skills/entropy-assessment/intent-change-rule.md` instead of copying it. This snapshot has no such file, so the rule
  is copied, as for any other target.
- **Size:** 1,073 words, measured with `wc -w`, against a budget of 1,066. The budget's terms:
  - the common contract: 706 (re-measured 2026-10-07; matches the generator's figure);
  - 7 checks beyond the template's two standing ones, at 36 each: 252;
  - pointers: 61;
  - commands: 47.

  The 7-word excess is the visible "Unresolved, Q2" paragraph (38 words). It goes when Q2 is answered.
- **Doc references:** none added. `AGENTS.md` lines 19 and 41 and README line 137 already name the same path.
- **Validation:** `git diff --check` is clean on the guard and every patch. The guard's link-check command was run
  against the snapshot (silent) and against a scratch file with a known broken link (reported it).
- **Open questions left visible in the guard:** the steward (F1) and Q2.
- **Handoff:** `integration.md`.

## 11. Uncertainties

- The steward is inferred, not recorded.
- No commit history, so the following are all unverified:
  - whether the guard actually runs before commits;
  - whether commit messages carry its note;
  - whether the hook is enabled.
- The GitHub issues and the sibling repo were not read. Statements about them come from this repo's own text.
- Whether the repo's agents load `AGENTS.md` automatically was not checked. The discovery test used a context-free
  session pointed at the snapshot, not the repo's real agent setup.
- Feedback on the skills themselves, from this run, is in `feedback.md`.
- Every recommended answer in `questions.md` is a recommendation, not a decision. If the steward chooses differently,
  the matching provisional patch is redrafted, not applied.
