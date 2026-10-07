# Entropy assessment: entropy-guard, snapshot 447da9a

- **Target:** `eval/targets/entropy-guard-447da9a`, a read-only snapshot with no `.git`. Read 2026-10-04. Its newest
  internal date is 2026-05-11 (`skills/session-coherence-skill-generator/SKILL.md` metadata).
- **Skills followed:** `entropy-assessment` v0.7.0 with `intent-pass.md`, then `docs-first-planning-assessment` v0.2.0,
  then `session-coherence-skill-generator` v0.3.0, then `guards-integrator` v0.3.0.
- **Mode:** plan mode. The target cannot be edited, so every change is delivered as a draft or a patch in this folder.
- **Line numbers** refer to the snapshot.
- **"Provisional"** marks anything resting on a recommended answer in `questions.md` that the steward has not given.

## Route taken

1. `entropy-assessment` Step 1: the intent pass.
2. Step 2: the shape is **A, docs-first planning**, with D (workflow-heavy) also fitting.
3. Step 3: routed to `docs-first-planning-assessment`, which reused the intent pass.
4. Phase 1: truth map, loop map, risks, current-state update.
5. Phase 2: guard-surface inventory and docs-first checks, handed to `session-coherence-skill-generator`. The generator
   refined the existing guard `skills/local/entropy-guard/SKILL.md` in place, as its "update an equivalent guard in
   place" rule requires, rather than creating `skills/session-coherence-guard/`.
6. `guards-integrator`, which wrote `integration.md`.

---

## 1. Intent

### Steward

**Justin Philpott, inferred; no document names him.** The evidence:

- the GitHub links in `skills/local/entropy-guard-feedback/SKILL.md` line 10 and `DECISIONS.md` line 142
  (`justinphilpott/...`);
- direction-setting words attributed to him in `PHILOSOPHY.md` line 43 and in
  `explorations/2026-03-24-entropy-immune-system-conversation.md` line 22.

`LICENSE` names "entropy-guard", not a person. The finding is that **no document says who decides intent**. Instead,
`INTENT.md` line 3 and `AGENTS.md` line 27 invite any contributor, human or AI, to revise `INTENT.md`.

### Statements gathered

| Source | Kind | Date |
|---|---|---|
| `INTENT.md` lines 9-135: entropy model, what guards preserve and must not be, the four-tool lifecycle, the enforcement ladder, principles, scope and validation loop | description; not attributed | "Last revised 2026-04-07" (line 5) |
| `INTENT.md` line 3; `AGENTS.md` line 27: anyone may refine `INTENT.md` with a dated note | rule; not attributed | none |
| `README.md` lines 3-7, 23, 119-127: purpose, scope, next phase | description | none |
| `AGENTS.md` lines 19-34: working practices and constraints, including "non-negotiable" guard runs | rule | none |
| `DECISIONS.md`: 17 entries, newest at the top (inferred from content) | decision log, **none dated or attributed** | none |
| `LEARNINGS.md`: 15 entries. Three (lines 115-143) are "validated by" a 2026-03-19 conversation | observation / inference | partial |
| `PHILOSOPHY.md` line 43 and `explorations/`: Justin's own exploratory words | steward statements, exploratory, not decisions | 2026-03-19, 2026-03-24 |
| `TODO.md`: Next Up and Backlog | state | none |

In the intent pass's strict sense ("attributed to the steward with a date"), **the target holds no steward
decisions**. The authorised reading below therefore treats `DECISIONS.md` as Justin's log, provisional on Q2.

### Three readings

- **Declared:** `INTENT.md` plus `README.md` describe a practical guard toolkit: assessment, then guard generation or
  refinement, then integration, then validation. It is strongest on docs-first planning repos. Theory has moved to the
  sibling `entropy-immune-system` repo. Guards stay low-burden and delta-scoped. The toolkit applies itself to this
  repo. In the four-tool lifecycle, the generator role belongs to the assessment workflows (`INTENT.md` line 88).
- **Enacted** (no git history is available, so this comes from dated artifacts):
  - The newest work is `skills/session-coherence-skill-generator/`, dated 2026-05-10 and 2026-05-11 in its metadata,
    and its bootstrap mode (the top `DECISIONS.md` entry).
  - Before that came the docs-first specialization and the prompted reminder hook (`INTENT.md` revised 2026-04-07; the
    local guard was last evaluated 2026-04-07).
  - The declared next step, the external validation batch in `TODO.md` lines 11-13, shows no sign of having started.
- **Authorised (provisional, Q2):** the 17 `DECISIONS.md` entries. Practical focus with theory farmed out. Front door
  plus docs-first specialization. A separate integrator. External-to-prompted maturity. One local guard. Upstream
  feedback built into the skills. agentskills.io format. `skills/` versus `skills/local/`. Bootstrap mode for the
  generator.

### Gaps, grouped by condition

**Stale description** (provisional, Q2). Each is corrected from the "Specialize first..." entry (`DECISIONS.md`
lines 15-19), with no question needed:

- "Rename entry point..." (lines 113-117) still describes Phase 1 and Phase 2.
- "Add workflow/process..." (lines 47-51) describes a workflow appendix.
- "Entropy assessment should support guard refinement..." (lines 39-43) says `skills/entropy-assessment/SKILL.md`
  "now fits existing-guard systems better".

None of those structures exists in `entropy-assessment` v0.6.0, which has Steps 1-4 and no appendices. Supersession
notes are in `proposed-decisions.patch`.

**Conflict:**

- **C1. Who may revise `INTENT.md`.** `INTENT.md` line 3, `AGENTS.md` line 27 and the current guard (line 68) say any
  contributor may. The intent-change rule this run must write into the guard says only the steward. The guard depends
  on this, so it is asked as **Q1**.
- **C2. Two guard builders.** `docs-first-planning-assessment` Phase 2 (Step 7, lines 154-173; Output line 196) and
  `session-coherence-skill-generator` (lines 198-315) each build guards, from different templates. No decision says
  which wins. Asked as **Q3**.

**Missing:**

- **M1. No named steward.** The evidence settles it by inference, so it is not asked separately. Naming him in
  `INTENT.md` is folded into Q1's recommendation.
- **M2. `DECISIONS.md` cannot tell the steward's decisions from agents' choices.** The entries carry no attribution or
  dates, and the current guard (lines 40-46) has every session add its own. Asked as **Q2**.
- **M3. No current-state view.** `TODO.md` is a task list with no stage, no list of docs to trust first, and no list
  of misleading material. This does not depend on intent and is fixed by `current-state-update.patch`.

**Ambiguous:**

- **A1. The validation target.** `DECISIONS.md` line 26 says open-source projects judged by merged PRs. `INTENT.md`
  lines 129-135 say docs-first planning repos judged by session recovery. `README.md` line 125 blends the two. This
  changes the next piece of work, so it is asked as **Q4**, last, because the guard does not depend on it.

**Unauthorised drift:**

- **U1. The session-coherence generator was adopted without a recorded decision.** It is listed as an exported skill
  (`README.md` line 91, `AGENTS.md` line 46). Yet no entry adopts it, `INTENT.md`'s lifecycle (lines 84-96) omits it,
  the front door never routes to it, and it carries another project's residue ("FlowBook", lines 22 and 193).
  Response: a proposed intent change is recorded as a `Proposed:` entry in `proposed-decisions.patch`. `INTENT.md` is
  not edited.
- **U2. Lost decision content.** `DECISIONS.md` line 42 requires "bootstrap actions to be verified against the current
  artifact before they are written". No skill in the target carries this now: searching `skills/` for "verif" finds
  only unrelated hits. Response: fix the work (bootstrap action B4).
- **U3. The generator emits no integration advice.** `DECISIONS.md` lines 95-99 say guard generation "always includes
  immediate adoption guidance". The target generator's output (lines 330-340) has no adoption guidance and no handoff
  to `guards-integrator`. Response: fix the work (B6, tied to Q3).

**Prose control:**

- **P1. The guard run is a rule nothing enforces.** `AGENTS.md` line 19 calls running the guard "non-negotiable", and
  `README.md` line 78 states as fact that "This project runs its own entropy guard before every commit".
  - The only mechanism is a reminder hook. It is off in every fresh clone (verified, `scratch/hook-verification.log`,
    case D).
  - The enable instruction in `README.md` line 140, followed literally, creates a broken symlink. Commits then land
    with no reminder and no warning (verified, case A).
  - The rule is cited as working: `LEARNINGS.md` line 22 says the hook "improved the workflow".
  - Where enforcement would have to sit: `core.hooksPath` set in each clone, which can only ever be a reminder. The
    judgment checks themselves cannot be enforced.

**Gaps that do not depend on intent** (report and fix as usual):

- **N1.** `skills/guards-integrator/SKILL.md` lines 20 and 221 say entropy-assessment generates guards. It does not.
- **N2.** The current guard (line 99) points at a "Key Documents table" in `README.md`. The README's tables are under
  "What's here" (lines 82-115).
- **N3.** The current guard (lines 33 and 137) sends readers to `doc-health-check`, which does not exist (`TODO.md`
  line 20 says so).
- **N4.** `LEARNINGS.md` line 63 names a "distill-article skill" that is not in this repo. It may be in the `writing`
  repo; that was not verified.
- **N5.** Enforcement-ladder vocabulary: `docs-first-planning-assessment` line 179 says "Narrative / judgment-heavy"
  where `INTENT.md` line 102 and `guards-integrator` line 94 say "External".
- **N6.** The current guard contradicts itself. Line 87 wants one canonical home, and line 88 says "update both".
- **N7.** Seed-template residue in a repo with no code: `AGENTS.md` line 21 ("Working code with tests"), the Go block
  in `.gitignore` (lines 17-25), and the Python, Go and Makefile rules in `.editorconfig`. Low cost; listed for
  completeness.

### Proposed intent changes, and where they are recorded

- **P-1:** `session-coherence-skill-generator` becomes the only guard builder, and `INTENT.md`'s lifecycle names it.
  Recorded as a `Proposed:` entry at the top of `DECISIONS.md` (`proposed-decisions.patch`), awaiting Justin.
- Q1's recommendation (only Justin changes `INTENT.md`) also amounts to an intent change. It stays in `questions.md`
  until he answers.

### Planning horizon

- **Settled:** practical focus; front door plus docs-first track; separate integrator; the skill layout and format;
  external-to-prompted maturity; one local guard.
- **Active:** the session-coherence generator and its bootstrap mode; the external validation batch (declared, not
  started).
- **Exploratory:** guard runner, guard evaluator, further specialized tracks, `doc-health-check`, and
  just-in-time/ephemeral guards (theory, now in the sibling repo).

---

## 2. System shape

- **Shape A, docs-first planning.** All five of A's signals hold:
  - the repo is markdown only;
  - design and methodology docs are the product, since the exported skills are markdown;
  - `TODO.md`, `DECISIONS.md` and `AGENTS.md` carry state;
  - the loop is repeated human and AI sessions;
  - drift is docs-to-docs and workflow drift.
- **D, workflow-heavy, also fits.** The repo exports a way of working, and its own guard calls it a "docs + workflow"
  repo. A was chosen because the highest current risk, two homes for guard building, is docs-to-docs parallel truth.
- **Repositories:** one repository is assessed. It touches others:
  - `entropy-immune-system`, which holds the theory; the seam is `explorations/`, which per `DECISIONS.md` line 26
    seeded that repo and still sits here;
  - `seed`, which scaffolded this repo;
  - `writing`, which holds articles;
  - consumer repos, which run the exported skills and send issues back.

  None of these could be read, so they are not assessed as one system.

### Domain and ownership map

| Domain | Present? | Actively changed? |
|---|---|---|
| Code | no | — |
| Documentation | yes; it is the product | yes |
| Tests | no | — |
| API and data contracts | yes, as an interface: skill directory names, paths and skill-to-skill handoffs used by consumer repos and by the copy-paste prompts in `README.md` lines 35-66 | yes |
| Workflow and process | yes: `AGENTS.md`, `TODO.md` discipline, the local guard, the reminder hook, the upstream feedback loop | yes |
| Live operational state | none: no services, credentials or spend. GitHub issues on `justinphilpott/entropy-guard` are an external state surface, not read in this run | — |

---

## 3. Canonical truth map

| Concept | Canonical home | Other mentions | Status |
|---|---|---|---|
| Purpose, scope, entropy model | `INTENT.md` | `README.md` lines 3-17 and 119-125; `AGENTS.md` lines 3 and 34 | OK. Mentions summarise, though `README.md` line 125 restates the next phase in full |
| Enforcement-depth ladder | `INTENT.md` lines 98-109 | restated in full in `guards-integrator` lines 92-99, `docs-first` lines 175-182, `DECISIONS.md` lines 31-35, `LEARNINGS.md` lines 17-23 | Restating in exported skills is defensible because they must stand alone. The vocabulary has drifted (N5) |
| Guard lifecycle (four tools) | `INTENT.md` lines 84-96 | `DECISIONS.md` lines 87-99; `TODO.md` line 18 | Omits the session-coherence generator (U1) |
| **Building guards** | **two homes:** `docs-first` Phase 2, and `session-coherence-skill-generator` | `README.md` lines 52, 89 and 91; `INTENT.md` line 88 | **Parallel truth (C2), the top risk** |
| Routing a target to a workflow | `skills/entropy-assessment/SKILL.md` | `README.md` lines 25-58 | OK, but it never routes to the generator or to young repos |
| Placing and adopting guards | `skills/guards-integrator/SKILL.md` | `docs-first` lines 175-190 | Mostly links. Lines 20 and 221 are stale (N1) |
| Settled decisions | `DECISIONS.md` | `LEARNINGS.md` (rationale) | Unattributed (M2); three entries stale |
| Current state and next steps | `TODO.md` | `README.md` lines 119-127; `INTENT.md` lines 122-135 | Three peers for "what's next"; `TODO.md` holds the least about the current state |
| Working practices | `AGENTS.md` | `README.md` lines 131-140; `.githooks/pre-commit`; the local guard | Hook enablement wrong in both `AGENTS.md` and `README.md` (P1) |
| Theory (autopoiesis, immunity) | the sibling `entropy-immune-system` repo | `explorations/` (4 files, 1,467 lines, 2 marked `status: draft`); `PHILOSOPHY.md` lines 41-126; `LEARNINGS.md` lines 115-143 | Historical residue here, not demoted |
| Skill format | the agentskills.io specification (owned elsewhere) | `DECISIONS.md` lines 79-83 | OK: every `name` matches its directory (checked) |

---

## 4. Loop map

This is the real loop, inferred from the docs; there is no git history to confirm it.

- **Session start:** an agent loads `AGENTS.md`, then `TODO.md` (`README.md` line 135). `TODO.md` has tasks only, so
  current truth is rebuilt from `INTENT.md`, `README.md` and `DECISIONS.md`. The docs-first lifecycle's "current-state
  packet at session start" (`INTENT.md` line 133) has no instance in this repo.
- **Active work:** `TODO.md` "Doing Now", cleared at commit. Inbound feedback arrives as GitHub issues, a second state
  surface (`DECISIONS.md` line 17 cites issues #9-#12).
- **Decision and learning capture:** at session end, done by the agent directly into `DECISIONS.md` and
  `LEARNINGS.md` (current guard checks 1-2).
- **Coherence pause:** before commit, using the local guard by hand. The reminder hook prompts only in clones where it
  was enabled correctly (P1).
- **Handoff:** commit, sometimes a PR (`LEARNINGS.md` line 152 mentions PR review feedback), then merge. There is no
  CI and no PR template.
- **Outward loop:** consumer repos run the exported skills, and their feedback-check notes come back as issues.

---

## 5. Top entropy risks

Ranked by decay rate times recovery cost.

| # | Vector | Decay | Recovery | Symptoms | Anchor for the fix |
|---|---|---|---|---|---|
| 1 | **Parallel truth: guard building has two homes** (C2, U1, U3, N1) | High: every session touching guard design edits one template | High: guards already issued to consumer repos cannot be recalled | Two templates; `INTENT.md` names neither the generator nor two builders; the front door reaches only one; the integrator credits a third (entropy-assessment); FlowBook residue | One decision (Q3, P-1), then `INTENT.md` line 88 |
| 2 | **Intent and decision authority unrecorded** (M1, M2, C1) | Slow, but compounds | Very high: it cannot be reconstructed later which entries were the steward's | 17 entries with no attribution or dates; `INTENT.md` and `AGENTS.md` invite agent edits to intent | Q1 and Q2, recorded in `DECISIONS.md` |
| 3 | **Workflow drift and prose control around the guard's own run** (P1) | Fast: every fresh clone or worktree | Medium: unguarded commits pass unnoticed | Off by default; the literal enable step fails silently (verified); `README.md` claims the guard runs on every commit | `AGENTS.md` line 19 and `README.md` line 140: `git config core.hooksPath .githooks` |
| 4 | **Restructure residue and lost decisions** (stale descriptions, U2, N2, N3) | Medium: each restructure leaves some | Medium-high: lost requirements come back as misfires, as `LEARNINGS.md` lines 27-33 records once already | Three decisions describe removed structure; one decision's requirement is gone; the guard points at things that do not exist | `DECISIONS.md` supersession notes; `docs-first` Step 5 |
| 5 | **Superseded-nearby interference** (`explorations/`, theory learnings) | Slow | Medium: a session could redesign around "no persistent guard artifact" (`LEARNINGS.md` line 123) | 1,467 lines of theory, unlisted and unmarked, sitting next to live docs | The current-state file's historical list; `DECISIONS.md` "Farm..." |

---

## 6. Guard surfaces

### In the four groups of entropy-assessment Step 4d

- **Runs by itself:** nothing. There is no CI, and the hook is off by default. `core.hooksPath` cannot be read from a
  snapshot with no `.git`.
- **Exists, but runs only by hand:**
  - the local guard `skills/local/entropy-guard/SKILL.md`;
  - the reminder hook, once enabled in a clone;
  - `skills/local/entropy-guard-feedback/`;
  - self-application of the exported skills (`INTENT.md` line 82).
- **Decided, not yet built:**
  - the guard runner (`INTENT.md` line 92; `TODO.md` line 18);
  - the guard evaluator (`INTENT.md` line 94);
  - `doc-health-check` (`TODO.md` line 20);
  - a mechanised link check (current guard line 110);
  - moving to an issue tracker (`TODO.md` line 3).
- **Declared, but missing:**
  - "runs its own entropy guard before every commit" (`README.md` line 78);
  - a "current-state packet at session start" for this repo (`INTENT.md` line 133);
  - `doc-health-check`, offered as an alternative in the guard's "When NOT to Run";
  - the "distill-article skill" (`LEARNINGS.md` line 63).

### Per docs-first Step 7

| Surface | Verdict |
|---|---|
| `skills/local/entropy-guard/SKILL.md` | **amend** → `guard/SKILL.md` |
| `.githooks/pre-commit` | keep its content; amend its enablement docs (`operator-docs.patch`) |
| `AGENTS.md` "Working Practices" | amend: line 19 now (patch); line 27 after Q1 |
| `README.md` "Contributing" | amend line 140 (patch) |
| `TODO.md` | amend: add "Current state" (`current-state-update.patch`) |
| `DECISIONS.md` | amend: supersession notes and the proposed entry (`proposed-decisions.patch`); attribution convention after Q2 |
| `LEARNINGS.md`, `PHILOSOPHY.md` | keep, as historical logs |
| `explorations/` | **demote to historical context**, through the list in `TODO.md`. No files are moved or renamed without the steward's say-so |
| `skills/local/entropy-guard-feedback/` | keep |

---

## 7. Recommendations

- **Consolidate:** one guard builder (Q3). Make "what's next" owned by `TODO.md`, with `README.md` line 125 reduced to
  a link.
- **Demote or mark historical:** `explorations/`; the theory learnings; the three stale `DECISIONS.md` entries.
- **Guard:** the refined local guard (`guard/SKILL.md`). The new checks are one owner per concept, exported-skill
  handoffs, prose cross-references, proposal-style decision capture, and a hook-active check.
- **Tooling:** markdown link check and skill-name check, now as commands in the guard and later in the hook and CI
  (`integration.md`).

## 8. Bootstrap actions

Each was verified against the current artifact on 2026-10-04. Completion is tracked in `TODO.md` "Bootstrap cleanup"
(in the patch), never in the guard.

| # | Action | Verified by |
|---|---|---|
| B1 | Install the refined guard at `skills/local/entropy-guard/SKILL.md` | the current file has no what-changed commands, no intent rule and no mechanical checks; lines 33, 88, 99 and 137 hold the defects listed above |
| B2 | Hook enable command in `README.md` line 140 and `AGENTS.md` line 19 | `scratch/hook-verification.log`, cases A to D |
| B3 | Fix `guards-integrator` lines 20 and 221 | `entropy-assessment` v0.6.0 Steps 1-4 produce no guard |
| B4 | Restore "verify each bootstrap action against the current artifact" in `docs-first` Step 5 | no skill contains the requirement (search for "verif") |
| B5 | Supersession notes on 3 `DECISIONS.md` entries (provisional, Q2) | `proposed-decisions.patch` applies cleanly |
| B6 | After Q3: one builder; route shapes B, C, D and young repos to it; generator hands to the integrator; remove FlowBook | `entropy-assessment` lines 66-71 and 116-126; generator lines 22, 193 and 330-340 |
| B7 | Align "Narrative / judgment-heavy" with "External" in `docs-first` line 179 | `INTENT.md` line 102; `guards-integrator` line 94 |

## 9. Current-state update

`current-state-update.patch` adds a "Current state" section to `TODO.md`, which is the repo's existing current-state
file; no second summary is created. It holds:

- the stage;
- the docs to trust first;
- the settled decisions, each one a `DECISIONS.md` entry;
- the active front;
- the GitHub-issues state surface;
- Q1-Q4, each with its recommendation;
- the historical material likely to mislead;
- three next actions.

Every volatile claim carries its source and the date it was checked, and the section says what makes it stale. A
"Bootstrap cleanup" list tracks B1-B7.

---

## 10. Phase 2: inputs handed to the generator

- **The intent section:** §1 above.
- **The truth map and loop map:** §3 and §4.
- **The guard surfaces:** §6.
- **The docs-first checks** (docs-first Step 8), written against this repo:
  - canonical ownership, with a concept-to-home table drawn from §3;
  - one owner, not two copies, which also fixes N6;
  - supersession, by searching `DECISIONS.md` and the historical list in `TODO.md`;
  - cross-reference integrity, both mechanical and prose;
  - decision and learning capture, using the Q2 convention;
  - state honesty in `TODO.md`;
  - workflow alignment across `AGENTS.md`, `README.md`, the hook and the guard;
  - **a repo-specific addition: exported-skill handoffs**, because skills are this repo's interface.
- **Ready for tooling now:**
  - relative markdown links;
  - skill `name` matching its directory;
  - whitespace;
  - whether the hook is active.
- **Kept as judgment:** prose names such as skill names, "Step N" and table names, because they encode volatile wording
  (docs-first's warning about phrase-encoded automation).

## 11. Generator report (plan mode)

- **Context structures found:**
  - purpose in `INTENT.md`;
  - active state in `TODO.md`;
  - decisions and learnings in `DECISIONS.md` and `LEARNINGS.md`;
  - operator memory in `AGENTS.md`;
  - one guard, `skills/local/entropy-guard`, with a reminder hook.

  The repo is mature, so bootstrap mode does not apply.
- **Guard:** the existing guard is **updated in place**. The draft is `guard/SKILL.md`, for
  `skills/local/entropy-guard/SKILL.md`. It keeps the repo's name, `entropy-guard`, and its version key.
  - Added: the "Where things live" pointers, the what-changed commands, the intent-change rule filled in, the
    mechanical checks, and the report shape.
  - Removed: current-state content, and the dangling `doc-health-check` and "Key Documents table" references.
- **Doc references:** `AGENTS.md` line 19 and `README.md` lines 78 and 137 already name the guard. The only change
  proposed is the hook command (`operator-docs.patch`).
- **Files that build mode would change:**
  - `skills/local/entropy-guard/SKILL.md`
  - `TODO.md`
  - `DECISIONS.md`
  - `README.md`
  - `AGENTS.md`
- **Validation run on 2026-10-04,** in scratch copies under `scratch/`:
  - The guard's mechanical block, run verbatim under bash, sh and zsh, was clean on the snapshot.
  - It caught a deliberately renamed `PHILOSOPHY.md`, reporting 3 broken links, and a deliberately mismatched skill
    name.
  - The hook check correctly reported active, inactive and broken-symlink states.
  - The what-changed commands were run with and without an upstream. Without one, `@{upstream}` fails loudly, as the
    guard's fallback text expects.
  - All three patches pass `git apply --check` against a pristine copy.
  - The patches and the guard have no trailing whitespace.
  - Logs: `scratch/hook-verification.log` and `scratch/guard-command-verification.log`.
- **Open questions the guard leaves visible:** Q1 and Q2, which shape its Intent section and check 1, and Q3, which
  shapes its "Building guards" row.
- **Handoff:** `integration.md`.

## 12. Recommended next step

1. Answer Q1-Q3 and record them in `DECISIONS.md`.
2. Apply B1 and B2, which need no answers.
3. Apply B3-B7 as their questions are settled.

## 13. Questions for the steward

Four questions, in `questions.md`:

- **Q1:** may anyone edit `INTENT.md`?
- **Q2:** do the `DECISIONS.md` entries carry the steward's authority, and how are new ones recorded?
- **Q3:** which one skill builds guards?
- **Q4:** what are the validation batch and its measure?

## 14. Uncertainties

- There is no git history. "Enacted" comes from dated artifacts. Whether commits carry the "entropy check" line
  (`README.md` line 138) cannot be checked.
- Whether Justin's real clones have the hook enabled is unknown.
- GitHub issues (#9-#12 and `agent-feedback`) were not read.
- The sibling, `seed`, `writing` and consumer repos were not read. The `explorations/` seam is judged from this side
  only.
- How often PRs are used is unknown; there is a single mention.

## 15. Upstream feedback

Three notes are in `upstream-feedback.md`. They are formatted for the feedback helper; no web access was available, so
no issue was filed.
