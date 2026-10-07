# Entropy assessment: entropy-guard snapshot `447da9a`

- **Target:** `eval/targets/entropy-guard-447da9a`, a read-only snapshot of an older entropy-guard repository, with
  no `.git` directory.
- **Date:** 2026-10-07.
- **Route:** `entropy-assessment` 0.9.0, shape A, which called `docs-first-planning-assessment` 0.3.0 and returned
  to Step 3. The guard decision was `update`, handed to `session-coherence-skill-generator` 0.5.0 and then to
  `guards-integrator` 0.4.0.
- **Mode:** plan for the target. Nothing in it was edited. Every proposed change is a patch in this folder.
- **Steward:** absent. Questions are in `questions.md`, each with a recommended answer. Work that depends on an
  answer is drafted as provisional only.

**Outputs in this folder:**
- `assessment.md`: this file.
- `questions.md`: five questions for the steward.
- `guard/SKILL.md`: the updated guard.
- `integration.md`: the integration brief.
- `patch-settled.diff`: changes that touch no open question.
- `patch-provisional.diff`: changes that wait for the steward's answers.
- `upstream-feedback.md`: feedback on entropy-guard's own skills.
- `read-log.md`: the files opened in the skills folder.

**Coverage.** I read 17 of the target's 21 files in full: every top-level document, all six `SKILL.md` files, the
hook, `.gitignore`, `.editorconfig`, and `LICENSE` (its opening lines).

These parts were read only partly:
- `PHILOSOPHY.md`: lines 1-60 of 126.
- The four `explorations/` files (1,467 lines in all): their front matter and opening sections only.

These were not covered:
- **Git history.** There is none, so commits, commit messages and the hooks path could not be read.
- **The GitHub issues** that `DECISIONS.md` cites (#9-#12), and the `agent-feedback` issues. They are outside the
  permitted scope.
- **The sibling `entropy-immune-system` repo.** Also outside the permitted scope.

## 1. Intent

### Steward

**Nothing names the steward.** This is finding F1. The evidence points to Justin Philpott: he owns the GitHub
repository `justinphilpott/entropy-guard`, and he is named in `PHILOSOPHY.md` line 43 and in the `explorations/`
front matter. No file records him as the one who decides. This is question Q1.

### Statements gathered

| Id | Where | Kind | Authority | Date |
|---|---|---|---|---|
| S1 | `INTENT.md` (whole; "north star", line 3) | description of purpose, with directives | dated, not attributed | last revised 2026-04-07 (line 5) |
| S2 | `INTENT.md` lines 3, 139 | directive: humans and AI agents refine it directly | as S1 | as S1 |
| S3 | `INTENT.md` lines 122-135 | directive: next validation loop on docs-first repos, with its measures | as S1 | as S1 |
| S4 | `INTENT.md` lines 84-96 | description: four-tool guard lifecycle; generator role "carried by" `entropy-assessment` and `docs-first-planning-assessment` | as S1 | as S1 |
| S5 | `README.md` lines 119-125 | description: status and next phase | neither | none |
| S6 | `AGENTS.md` lines 17-34 | standing instructions and project constraints | neither | none |
| S7 | `DECISIONS.md`, 17 entries | decisions | neither, on every entry | none; newest first, inferred from content |
| S8 | `DECISIONS.md` lines 23-27, "Farm broader…" | decision: practical scope; validation on open-source projects measured by merged PRs | neither | none |
| S9 | `DECISIONS.md` lines 15-19, "Specialize first…" | decision: front door routes; docs-first specialisation | neither | none (matches `INTENT.md` 2026-04-07) |
| S10 | `DECISIONS.md` lines 7-11, "Session-coherence generation should bootstrap…" | decision: bootstrap mode in `session-coherence-skill-generator` | neither | none (newest entry) |
| S11 | `DECISIONS.md` lines 63-67, "Upstream feedback…" | decision: use the feedback helper "when available" | neither | none |
| S12 | `DECISIONS.md` lines 87-91, "Guards need closed-loop integration…" | decision: generators produce guards with integration instructions | neither | none |
| S13 | `skills/session-coherence-skill-generator/SKILL.md` lines 4-7 | observation: generated 2026-05-10, updated 2026-05-11 | dated | 2026-05-10/11 |
| S14 | `skills/local/entropy-guard/SKILL.md` lines 18-22 | description: guard generated 2026-03-19, last evaluated 2026-04-07 | dated | as stated |
| S15 | `explorations/2026-03-19-autopoiesis.md` opening | observation: Justin Philpott evaluating the assessment skill and setting its direction | attributed and dated | 2026-03-19 |
| S16 | `TODO.md` lines 9-20 | open work | neither | none |

### Three readings

- **Declared:** a practical, markdown-first project for entropy guards. Its strongest path is docs-first planning
  repos, its next phase is external validation on a batch of them, and the broader theory has moved to a sibling
  repo (S1, S3, S5, S6).
- **Enacted:** there are no commits to read. The open work in `TODO.md` is the validation batch (S16). The newest
  dated work is different: a generic guard generator with a bootstrap mode, written for "a coding session" and "the
  codebase" (`session-coherence-skill-generator` lines 18-20), and carrying another project's name, "FlowBook"
  (S10, S13). The snapshot holds no record of a validation batch having started.
- **Authorised:** the decisions in `DECISIONS.md` (S7-S12). None is attributed, so none can be shown to be the
  steward's own. Justin Philpott's words survive only in the conversation transcripts (S15), which record views,
  not decisions, in the parts read.

### Gaps by condition

- **Missing:**
  - No steward is named (F1, Q1).
  - No decision adopts `session-coherence-skill-generator` or says how it relates to the guard generation in
    `docs-first-planning-assessment` Phase 2 (F4, F5, Q3).
  - Decisions carry no dates or authors (F3).
- **Conflict:**
  - The validation measure: merged PRs in S8, against session-recovery measures in S3 and `README.md` line 125.
    S9 is later, but it does not plainly settle the measure (F9, Q4).
  - Two skills define what a generated guard holds (F4, Q3).
- **Ambiguous:**
  - `INTENT.md` line 3 is either a standing authorisation for any session to revise intent, or an invitation to
    propose. Where the readings diverge is in Q2 (F2).
  - "Use the local helper when available" (S11): the feedback helper may run only inside this repo, or wherever it
    is reachable (F10, Q5).
- **Unauthorised drift:** `session-coherence-skill-generator`'s guard template has no integration instructions,
  and the generator does not hand to `guards-integrator`. S12 and `DECISIONS.md` lines 95-99 say generators must
  produce integration guidance, and no decision covers the omission (F6). The response is to fix the work. Which
  skill to fix depends on Q3, so it is provisional.
- **Stale description:**
  - `guards-integrator` lines 20 and 221 say `entropy-assessment` generates guards. S9 changed it to "triage and
    routing", which settles this, and the settled patch corrects it (F7).
  - Four older `DECISIONS.md` entries describe `entropy-assessment` structure that S9 replaced, without a
    supersession mark. The settled patch marks them (F7).
  - `INTENT.md` lines 86-88 omit the session-coherence generator. S10 does not plainly settle how `INTENT.md`
    should name it, so this stays open under Q3 (F5).
- **Prose control:** `AGENTS.md` line 19 calls the pre-commit guard "non-negotiable" and line 41 "mandatory".
  - **Where enforcement would sit:** in `.githooks/pre-commit`, which only prints a reminder and exits 0, and only
    in clones where it has been linked (`README.md` line 140).
  - **What cites it:** `README.md` line 78 states the ritual as a fact: it "runs … before every commit" (F12).
  - **Size:** small. The same lines say the hook is non-blocking.

### The existing guard's repair instructions, read against the intent-change rule

- **Intent flag:** `skills/local/entropy-guard/SKILL.md` line 68: "if INTENT.md itself needs revision, update it
  with a dated note explaining what prompted the change." This is a path for unauthorised drift. The same path is
  in `AGENTS.md` line 27 ("update INTENT.md and note why") and in `INTENT.md` lines 3 and 139 (F2).
- **Ownership flag:** line 88: "Did you change something that another doc also describes? If so, update both."
  This keeps two definitions in step, and it pulls against line 87, which asks for "one obvious canonical home"
  (F11).
- **Line 99:** keeps `AGENTS.md` "Key Files" and the `README.md` tables correct. Those are summaries, so this is
  allowed. Its table name is stale (F11).

### Questions and proposals

There are five questions, in `questions.md`. They are also listed in the `TODO.md` "Current state" section of the
settled patch.

Two of them are recorded as proposed changes, marked "Proposed, awaiting the steward" at the top of `DECISIONS.md`
in the settled patch:
- **Q2:** intent documents change only by the steward's recorded decision.
- **Q3:** one skill owns guard generation.

They are proposals, not decisions. Nothing in this run edits an intent document, except in the provisional patch.

## 2. Lifecycle, shape and repositories

- **Lifecycle: active, as of the snapshot.** The evidence:
  - `README.md` line 119 says "Actively evolving".
  - `TODO.md` has three Next Up items.
  - The newest artifact is dated 2026-05-11 (S13).
  - Without git, I cannot tell whether work has continued since.
- **Shape: A, docs-first planning.** Markdown is the primary artifact. `TODO.md`, `DECISIONS.md` and `AGENTS.md`
  carry state, and work happens in repeated agent sessions (`AGENTS.md` lines 17-27).
  - **D, workflow-heavy, also fits.** The repo exports a way of working: a guard ritual, a hook and a feedback loop
    (`DECISIONS.md` lines 55-59).
  - **A was taken as the riskier,** because the top risks below are about which document or skill owns which
    truth, and the repo's own guard names internal consistency as its "primary entropy vector" (line 90).
  - **B was ruled out:** the only executable file is the 9-line hook.
- **Repositories:** one. `../entropy-immune-system/` (`AGENTS.md` lines 15, 47) is a separate research repo spun
  out of this one, not a repo that manages this one's work, and was not read.

## 3. Findings

- **F1 – No steward named.** No file says who decides what the project is for. `INTENT.md` line 3 invites "humans
  and AI agents" to refine it. The ownership evidence points to Justin Philpott (see section 1). Source: intent
  pass. → Q1.
- **F2 – Intent documents invite direct edits by any session.** The evidence: `INTENT.md` line 3 ("When you
  update it, note the date…"), `INTENT.md` line 139 ("add it"), `AGENTS.md` line 27, and guard line 68. Under the
  intent-change rule these are paths for unauthorised drift. Whether line 3 is itself the steward's standing
  authorisation is ambiguous. Source: intent pass. → Q2.
- **F3 – Decisions are undated and unattributed.** None of the 17 `DECISIONS.md` entries has a date or a name.
  Their order looks newest-first, but the file does not say so. When two entries conflict, as in F9, only their
  position says which came later. Source: intent pass.
- **F4 – Guard generation is defined twice.**
  - `docs-first-planning-assessment` Phase 2 (lines 132-202) designs and outputs "the refined or generated guard",
    with its own checklist areas.
  - `session-coherence-skill-generator` (lines 198-231 and its template, lines 268-315) generates a guard at
    `skills/session-coherence-guard/SKILL.md`, with required modes, mechanical commands and safety rules.
  - Neither mentions the other. I searched each file for the other's name.
  - **The effect on this repo's own guard:** `README.md` line 78 calls it "a concrete example of what the generator
    produces". It fits docs-first Step 7, and lacks every section the session-coherence generator requires.
  - Source: docs-first Step 2. → Q3.
- **F5 – The account of who generates guards is incomplete.** `INTENT.md` lines 86-88 say "the generator" role is
  "carried by" `entropy-assessment` and `docs-first-planning-assessment`. `session-coherence-skill-generator`,
  dated 2026-05-10, after `INTENT.md`'s 2026-04-07 revision, is not named.
  - I checked the full scope of that claim. Guards are written by docs-first Phase 2 and by the session-coherence
    generator. `entropy-assessment` 0.6.0 only recommends a guard (Step 4d). `guards-integrator` and the local guard
    write none.
  - The front door's Steps 2-3 have no route to the generator or its bootstrap mode (S10).
  - `README.md` "How to use this repo" (lines 21-66) never mentions it.
  - Source: docs-first Steps 2-3. Correcting it touches Q3.
- **F6 – The session-coherence generator carries imported residue and skips integration.**
  - It names "FlowBook", a project mentioned nowhere else in the repo (lines 22, 193).
  - Its metadata keys (`generated`, `last_updated`, `skill_version`) differ from the `version` key that the other
    five skills use.
  - Its template has no integration section, and its Output does not hand to `guards-integrator`, against
    `DECISIONS.md` lines 89-90 and 98.
  - Source: docs-first Step 4, "Standalone residue"; intent pass, unauthorised drift. The fix depends on Q3.
- **F7 – Superseded material sits nearby without a mark.**
  - Four `DECISIONS.md` entries describe `entropy-assessment` structure it no longer has: Phase 2, domain
    appendices, Steps 5-8. They are at lines 39-43, 47-51, 95-99 and 113-117. Only two entries carry supersession
    marks (lines 105, 131).
  - Implications in `LEARNINGS.md` refer to the same removed structure: line 33 (Steps 5, 7), line 52 (Phase 2),
    line 93 ("porting Step 0 back to the entry point", from the four domain generators that `DECISIONS.md` line 134
    deleted) and line 112 (Step 8).
  - `guards-integrator` lines 20 and 221 say `entropy-assessment` generates guards.
  - **The risk:** a fresh session restores Phase 2 or the appendices to `entropy-assessment`.
  - Source: docs-first Step 4, "Superseded material nearby".
- **F8 – The explorations stay after the farm-out, unmarked.** `explorations/` holds four files, 1,467 lines. The
  farm-out decision (`DECISIONS.md` lines 23-27, `README.md` line 7, `INTENT.md` line 127, `AGENTS.md` line 34)
  moved that line of work to the sibling repo.
  - The two 2026-03-24 digests are `status: draft`.
  - The folder is not listed in `README.md` "What's here" or in `AGENTS.md`.
  - `LEARNINGS.md` line 122 and `PHILOSOPHY.md` line 45 cite the 2026-03-19 file.
  - Source: docs-first Steps 2 and 4.
- **F9 – The validation target and its measure conflict.** `DECISIONS.md` line 26 says open-source projects,
  measured by merged PRs. `INTENT.md` lines 129-135 and `README.md` line 125 say docs-first planning repos, measured
  by session recovery and fewer revived stale ideas. `TODO.md` line 12 says "track what changes prove useful".
  Source: intent pass. → Q4.
- **F10 – Skills disagree about when the feedback helper may reach GitHub.**
  - `entropy-assessment` line 150, docs-first line 217 and `AGENTS.md` line 72 say "when working inside this repo".
  - `guards-integrator` line 174 adds "or whenever the local feedback helper is available", and `DECISIONS.md`
    line 66 says "when available".
  - The helper calls itself "entirely optional" (line 12). It runs `gh issue create --repo
    justinphilpott/entropy-guard` with the assessed project's context in the issue body (lines 42, 45-51, 67-68).
  - **The full reach, checked:** a search of the skills, the hook, `AGENTS.md` and `README.md` for `gh`, `curl`,
    `wget`, `git push`, package managers and `docker` found external commands only in the helper. Three exported
    skills delegate to it. `AGENTS.md` line 68 separately asks contributors to "feed back to the seed project", and
    names no mechanism for doing so.
  - Source: the reach rule in "Rules along the whole route". → Q5.
- **F11 – The existing guard's defects.** Each is in `skills/local/entropy-guard/SKILL.md`:
  - **(a)** Line 68 repairs by editing intent (F2).
  - **(b)** Line 88 says "update both".
  - **(c)** Line 99 names "README.md (Key Documents table)". `README.md` has no such table; its tables are under
    "What's here".
  - **(d)** Line 33 sends the reader to `doc-health-check`, which does not exist. Line 137 and `TODO.md` line 20
    disclose this.
  - **(e)** Lines 18-22 copy system state into the guard: a snapshot, skill counts and a "last evaluated" date of
    2026-04-07, which predates the session-coherence generator.
  - **(f)** Lines 62-66 copy `INTENT.md`'s principles rather than pointing to them.
  - **(g)** There are no modes, no safety rules and no baseline for "this session's change".
  - Source: intent pass, and docs-first Step 7.
- **F12 – The run-before-commit rule is enforced by a reminder only.**
  - `README.md` line 78 says the project "runs its own entropy guard before every commit". `AGENTS.md` line 19
    says to skip it for trivial changes.
  - `AGENTS.md` calls the rule "non-negotiable" (line 19) and "mandatory" (line 41). It is backed by a hook that
    prints a reminder and exits 0. I ran the hook by hand on 2026-10-07 to confirm this.
  - The hook is active only where linked. The only record of a run is an optional commit-message note
    (`README.md` line 138), which this snapshot cannot show.
  - Source: intent pass, prose control. The size is small.
- **F13 – The state file holds only task lists.** `TODO.md` has no stage, no open questions and no date, and does
  not mention the session-coherence generator work that the newest decision records.
  - `TODO.md` line 3 says it should "graduate to an issue tracker once the project has momentum". GitHub issues
    already drive work: `DECISIONS.md` line 17 cites #9-#12. That is a second work surface, and this assessment
    could not read it.
  - Source: docs-first Step 5, "State dishonesty".
- **F14 – Seed-scaffold residue.** `AGENTS.md` line 21 says "Working code with tests beats perfect code in
  progress", in a repo with no code or tests (`AGENTS.md` lines 31, 51, 57). `.gitignore` lines 17-25 (Go) and
  `.editorconfig` lines 11-18 (Python, Go, Makefile) are the same residue. The size is low. Source: docs-first
  Step 4, "Workflow drift".
- **F15 – LEARNINGS.md holds conceptual entries.** Three entries are "validated by" the 2026-03-19 conversation
  alone (lines 117-143). `DECISIONS.md` lines 139-143 keep `LEARNINGS.md` tactical, and the farm-out decision moved
  that theory to the sibling repo.
  - One implication runs against current practice: line 123, "The mature form collapses assess → fix with no
    persistent guard artifact".
  - `LEARNINGS.md` line 63 cites a "distill-article skill" that is not in this repo. It may be in the `writing`
    repo; not verified.
  - Source: docs-first Step 4.
- **F16 – Two stable invariants can be checked mechanically, and none is.** `AGENTS.md` lines 51-58 list no
  commands.
  - **Relative markdown links resolve:** 49 of 49 in the snapshot, checked 2026-10-07.
  - **Every `SKILL.md` `name` matches its folder,** the agentskills.io rule adopted at `DECISIONS.md` lines 79-83:
    6 of 6.
  - Both commands were tested against a planted failure, and each reported it.
  - Source: docs-first Step 4, "Brittle automation", whose advice is to automate only stable invariants.

## 4. Truth map

**What each document is.** Each document's role:

| Document | Role |
|---|---|
| `INTENT.md` | canonical: purpose, guard principles, enforcement depth, lifecycle, scope boundary |
| `DECISIONS.md` | canonical: settled decisions (newest first; undated) |
| `LEARNINGS.md` | canonical: validated learnings (with three conceptual entries, F15) |
| `AGENTS.md` | canonical: working practices and project constraints; index of key files |
| `TODO.md` | current state |
| `README.md` | summary and index for users |
| `skills/entropy-assessment`, `docs-first-planning-assessment`, `guards-integrator`, `session-coherence-skill-generator` | product artifacts (exported); names, paths, inputs and hand-offs are contracts |
| `skills/local/entropy-guard` | product artifact (this repo's guard, and the README's "reference example") |
| `skills/local/entropy-guard-feedback` | product artifact (local helper; the only external command) |
| `.githooks/pre-commit` | reminder (prompted depth) |
| `PHILOSOPHY.md` | free reflection; canonical for nothing |
| `explorations/` | historical, farmed out (F8) |
| `.gitignore`, `.editorconfig` | template residue (F14) |

**Where each concept lives.** For each concept, its one owner and the documents that summarise it or compete with
it:

| Concept | Owner | Summaries or links | Competing |
|---|---|---|---|
| Purpose and scope | `INTENT.md` | `README.md` lines 1-17, 119-125; `AGENTS.md` lines 3, 34 | none |
| Next validation loop | `INTENT.md` lines 122-135 | `README.md` line 125; `TODO.md` Next Up | `DECISIONS.md` line 26 (F9) |
| What each skill does | the skill's own frontmatter `description` | `README.md` "What's here"; `AGENTS.md` "Key Files" (both consistent today) | none |
| Who generates guards, and what a guard holds | none | `INTENT.md` lines 86-88; `README.md` line 52 | docs-first Phase 2 and `session-coherence-skill-generator` (F4, F5) |
| Enforcement depth | `INTENT.md` lines 98-109 | `guards-integrator` Step 3; docs-first Step 8 (local elaborations) | none |
| Working loop | `AGENTS.md` lines 17-27 | `README.md` lines 131-140; the hook's text; guard check 4 | none |
| Upstream feedback | `skills/local/entropy-guard-feedback` | `DECISIONS.md` lines 63-67 | its trigger, stated four ways (F10) |
| Settled decisions | `DECISIONS.md` | none | older entries unmarked (F7) |

## 5. Loop map

The real loop could not be observed, because there is no git history. This is the documented loop:

- **A session starts:** an agent reads `AGENTS.md`, its Quick Links and `README.md`. `README.md` "Contributing"
  step 1 sends it to `TODO.md`. `INTENT.md` is read before significant choices (`AGENTS.md` line 27).
- **During work:** the agent writes "Doing Now" in `TODO.md` (`AGENTS.md` line 22). Feedback about the skills goes
  to GitHub issues through the helper.
- **Session end and before commit:** run `skills/local/entropy-guard/SKILL.md`. It captures decisions and learnings
  into `DECISIONS.md` and `LEARNINGS.md`. Then clear "Doing Now".
- **Handoff:** a commit whose message carries the guard's result (`README.md` line 138). If the hook is linked, it
  prints a reminder at commit time. Pull requests exist: `LEARNINGS.md` line 152 mentions PR review feedback. Their
  place in the loop is not documented.

**A fresh-agent check** on 2026-10-07: an agent with no context read `README.md`, `TODO.md`, `AGENTS.md`, the hook
and the guard. It named the guard's path and the clearing of "Doing Now" as its before-commit steps. Details are in
`integration.md`.

## 6. Ranked risks

1. **One concept, two generators: F4, F5, F6.**
   - **Decay:** medium. Each edit to either skill widens the gap, and each repo that receives a guard gets one
     shape or the other.
   - **Recovery:** high. Guards already exported to other repos cannot be recalled.
   - **Symptoms:** the local guard is "an example of what the generator produces" yet fits only one of the two
     shapes; `INTENT.md` names one generator; the front door cannot reach bootstrap mode.
   - **Anchor:** the answer to Q3, then the owning skill.
2. **Intent can be rewritten by any session: F2, F1, F3.**
   - **Decay:** slow.
   - **Recovery:** very high. A drift in the north star leaves no attribution and no date to trace back.
   - **Symptoms:** four surfaces license direct edits to `INTENT.md`; no steward is named; no decision is
     attributed.
   - **Anchor:** the answers to Q1 and Q2, recorded in `DECISIONS.md`.
3. **Superseded material nearby: F7, F8, F15.**
   - **Decay:** fast. Every fresh session meets it.
   - **Recovery:** medium.
   - **Symptoms:** four unmarked decision entries, four stale learning implications, two stale lines in
     `guards-integrator`, and draft explorations with no banner.
   - **Anchor:** the "Specialize first…" and "Farm broader…" entries in `DECISIONS.md`.
4. **State dishonesty and unresolved conflicts: F13, F9, F10.**
   - **Decay:** medium.
   - **Recovery:** medium.
   - **Symptoms:** `TODO.md` gives a fresh session no stage and no open questions; the validation measure and the
     feedback reach are each stated two ways.
   - **Anchor:** the "Current state" section of `TODO.md`.
5. **Workflow drift and prose control: F12, F14, F11(d).**
   - **Decay:** slow.
   - **Recovery:** low.
   - **Anchor:** `AGENTS.md` "Working Practices".

## 7. Recommendations

- **Consolidate:**
  - Give guard generation one owner (Q3; the recommendation is `session-coherence-skill-generator`).
  - Keep `README.md` "What's here" and `AGENTS.md` "Key Files" as summaries, and correct them against each skill's
    frontmatter, which owns its description.
- **Mark historical:**
  - `explorations/`, with a banner in each file and an index entry. Settled.
  - Four `DECISIONS.md` entries, marked "Partially superseded". Settled.
  - Leave the `LEARNINGS.md` implications as historical records. The new guard's supersession check covers them.
- **Demote or move:** the three conceptual entries in `LEARNINGS.md` (F15). This is a backlog item, not decided
  here, because "LEARNINGS.md stays tactical" does not plainly say these entries are non-tactical.
- **Record:**
  - The steward (Q1).
  - A date and the decider on every future decision. This is in the new guard's decision check.
- **Reword:** the seed residue in `AGENTS.md` line 21 (F14). This is a backlog item.

## 8. Proposed changes, sorted

### Settled: `patch-settled.diff`

These changes touch no open question. Each item was verified against the current file and applies cleanly with
`patch -p1` and `git apply --check`.

| Change | Finding | Settled by |
|---|---|---|
| `TODO.md`: "Current state" section; two cleanup items in Backlog | F13, F14, F15 | docs-first Step 5; it lists the questions without answering them |
| `DECISIONS.md`: two entries marked "Proposed, awaiting the steward" (Q2, Q3) | F2, F4 | intent pass §5: proposals are recorded with the decision owner, marked as awaiting |
| `DECISIONS.md`: "Partially superseded" marks on the four entries at lines 39, 47, 95 and 113 | F7 | "Specialize first…" and `entropy-assessment` 0.6.0's text; the marks follow the file's own convention (lines 105, 131) |
| `guards-integrator` lines 20 and 221: neutral wording ("guards are generated") | F7 | "Specialize first…" ("triage and routing"); the new wording names no owner, so it leaves Q3 open |
| `skills/local/entropy-guard/SKILL.md` line 99: "What's here" tables | F11(c) | the current `README.md` |
| Banners in the four `explorations/*.md` files; `README.md` and `AGENTS.md` index entries | F8 | "Farm broader…"; `README.md` line 7; `INTENT.md` line 127 |
| `README.md` line 78: "before committing meaningful work" | F12 | `AGENTS.md` line 19 |

### Provisional: `patch-provisional.diff`

This patch applies on top of the settled one. **Do not apply it until the steward answers.**

| Change | Waits for |
|---|---|
| `AGENTS.md` "Steward" line | Q1 |
| `AGENTS.md` line 27; `INTENT.md` lines 3 and 139; replacing the local guard with `guard/SKILL.md` | Q2 |
| `INTENT.md` "Guard generator" paragraph: the session-coherence generator writes guards | Q3 |
| `guards-integrator` Step 7: file issues only inside entropy-guard | Q5 |

### Provisional, not drafted

These depend on the direction of an answer:

- **Q3:**
  - `docs-first-planning-assessment` Phase 2 becomes a hand-off of checks to the generator.
  - `session-coherence-skill-generator` hands each guard to `guards-integrator` (F6), drops its "FlowBook"
    references, and uses the shared `version` metadata key.
  - `entropy-assessment` routes young repos to bootstrap mode.
  - `README.md` "How to use this repo" names the generator.
  - The FlowBook and metadata edits do not touch Q3 by the rule's definition. They are held because Q3 may reshape
    or retire the file.
- **Q4:**
  - Record the decided measure in `DECISIONS.md`, and mark the measure in the "Farm broader…" entry as superseded.
  - Name the measure in `TODO.md` Next Up item 2.
- **Q5:** record the decision in `DECISIONS.md`, replacing "when available" at line 66.
- **When applying Q2 or Q3:** turn the matching proposal into a dated, attributed decision, and update
  `INTENT.md`'s "Last revised" line.

## 9. State-file update

The state file is `TODO.md`. It is the file the loop sends a session to first: `README.md` "Contributing" step 1,
and `AGENTS.md` line 22. The update is in `patch-settled.diff`. It adds a "Current state" section holding:
- the stage;
- the documents to trust first;
- the settled decisions, each linked to its `DECISIONS.md` entry;
- the active fronts;
- the five open questions;
- the superseded material nearby;
- the next actions.

It says when it was checked (2026-10-07, against snapshot `447da9a`), what makes it stale, and who refreshes it.
No competing summary file was added.

## 10. Guard inputs and the guard decision (docs-first Step 7)

**Existing guard surfaces:**

- **Amend:**
  - `skills/local/entropy-guard/SKILL.md`: update it to the guard contract.
  - `TODO.md`.
  - `DECISIONS.md`.
  - `README.md` line 78.
  - `guards-integrator` "When to Run", Step 7 and Output (lines 20, 174, 221).
  - `AGENTS.md` lines 21 and 27. Line 27 is provisional, under Q2.
  - `INTENT.md` lines 3 and 139. Provisional, under Q2.
- **Keep:**
  - `.githooks/pre-commit`. Next step: add the mechanical checks, still non-blocking (`integration.md`).
  - `README.md` "Contributing".
  - `skills/local/entropy-guard-feedback/SKILL.md`. Its callers disagree, which is Q5.
  - The "Upstream Feedback Check" sections of the exported skills.
- **Demote:** `explorations/`.
- **Replace:** none.

**What became of each check in the old guard**, carried into `guard/SKILL.md`:

| Old guard | Updated guard |
|---|---|
| 1 Decisions | "chose between approaches … dated and naming who decided" (F3) |
| 2 Learnings | "validated or invalidated something non-obvious" |
| 3 Skill / intent alignment | the Intent section, carrying the intent-change rule v2 (F2, Q2); "does it still meet `INTENT.md`…", which points rather than copies (F11(f)) |
| 4 Workflow alignment | the hook check and the fresh-agent check (F12, F14) |
| 5 Internal consistency | the skill hand-off check and the overlap check (F4, F5, F7); the one-owner repair, which replaces "update both" (F11(b)) |
| 6 Key files | the index check (F8) |
| 7 Cross-references | the index check's search for old names; the link command (F16); the supersession check (F7, F8) |
| 8 Stale placeholders | dropped. No current finding supports it, and `AGENTS.md` "Prune ruthlessly" already carries it |
| 9 `TODO.md` | the `TODO.md` check and the standing state-claim check (F13) |
| new | the feedback-reach consistency check (F10); the SKILL.md name command (F16) |
| metadata block, `doc-health-check` pointer | removed (F11(d), F11(e)). Current state lives in `TODO.md` |

**Guard decision: `update`.** A guard exists, and the loop needs one, as the run-before-commit practice in
`AGENTS.md` line 19 shows. The existing guard needs amending for F11(a) to F11(g), and it lacks checks for F4, F7,
F8, F10 and F16. Its path stays `skills/local/entropy-guard/SKILL.md` and its name stays `entropy-guard`, so
`AGENTS.md` lines 19 and 41, the hook, and `README.md` lines 78, 97 and 137 need no change.

## 11. Generator inputs

- **Steward:** unresolved (F1, Q1). The guard points at `AGENTS.md` and does not copy a name.
- **Intent documents:** `INTENT.md`; `AGENTS.md` "Project Constraints"; `README.md` "Project status"; the scope
  decisions in `DECISIONS.md`.
- **Decision surface:** `DECISIONS.md`.
- **Open intent questions:** Q1 to Q5. Q2 bears most on the guard.
- **Current-state file:** `TODO.md`. It is refreshed by whoever runs the guard at the end of a session
  (`AGENTS.md` line 22, and the guard's `TODO.md` check).
- **Rules bound but not owned:**
  - The agentskills.io specification (`DECISIONS.md` lines 79-83).
  - Seed scaffolding (`AGENTS.md` lines 66-68). It asks for feedback and binds no rule.
  - **Unresolved:** any user-wide instructions file that contributors run under. None is in the snapshot, and
    nothing outside it was read.
- **Verification commands:** none exist (`AGENTS.md` lines 51-58), and none run by themselves: there is no CI, and
  the hook only prints. The guard adds three: `git diff --check`, the SKILL.md name check and the link check.
- **Code areas and the docs that describe them:**
  - `.githooks/pre-commit`: `AGENTS.md` "Working Practices" and "Key Files"; `README.md` "Adapt the project's own
    guard" and "Contributing".
  - The skills: `README.md` "How to use this repo" and "What's here"; `AGENTS.md` "Key Files"; `INTENT.md` "The
    guard lifecycle".
  - There are no tests.
- **Live state or spend:** none. The one outbound action is GitHub issues, through the feedback helper (F10).
- **Findings:** F1 to F16.

## 12. Generator result

- **Guard:** `guard/SKILL.md`, for `skills/local/entropy-guard/SKILL.md`, updated in place, version 0.3.0. Applying
  it is part of the provisional patch (Q2).
- **Size:** 1,130 words by `wc -w`. **The budget is 1,188**, made of four terms:
  - **The common contract:** 706 words. Re-measured today: the generator's template, lines 49-117, with the rule
    quoted in, came to 706.
  - **Checks:** 10 repo-specific checks beyond the two standing ones, at 36 words each: 360. The actual 10 checks
    total 263 words.
  - **Pointers:** 46 words.
  - **Commands:** 76 words.
  - The guard is within its budget, so nothing needed explaining.
- **Review before handing over:**
  - The guard carries "Modes and safety".
  - It binds its baseline: `<start>`, else `@{upstream}`, with coverage reported.
  - The patches are sorted, and the settled patch touches no question.
  - No repair instruction edits an intent document or says "update both".
- **Operator docs:** no change needed. The path is unchanged.
- **Validation run:**
  - `git diff --no-index --check`, comparing the old and new guard and comparing the snapshot with each patched
    copy, found no whitespace errors.
  - Both patches apply in order, and the result matches the drafted tree.
  - On the fully patched copy, the name check passes for 6 of 6 skills and the link check for 52 of 52 links.
- **Plan-mode note:** build mode would also write "Update skills/local/entropy-guard/SKILL.md to the guard contract
  (assessment 2026-10-07)" into "Doing Now" in `TODO.md` at the start, and clear it at commit.
- **Open questions the guard leaves visible:** the steward (Q1). Its intent section depends on Q2.
- **Hand-off:** `integration.md`.

## 13. Uncertainties and what was not covered

- **Without git, these are unknown:**
  - the enacted intent beyond file dates and `TODO.md`;
  - whether guard runs were ever recorded in commit messages;
  - the effective hooks path;
  - whether `DECISIONS.md` is truly newest-first.
- **GitHub issues** (#9-#12, `agent-feedback`) and the **sibling repo** were not read. They may hold decisions
  this assessment reports as missing.
- **Partly read:** `explorations/` (opening sections only) and `PHILOSOPHY.md` (lines 1-60). A steward decision in
  the unread parts of the transcripts would change F1 or F2.
- **The intent-change rule was copied into the guard,** not pointed to. The target lacks
  `skills/entropy-assessment/intent-change-rule.md`. If the repo later takes in a version of the skills that has
  it, the rule's own note says a guard inside entropy-guard should point there instead.
- **Two facts are unverified:** whether `justinphilpott/entropy-guard` is public, which bears on the size of F10,
  and whether the "distill-article skill" exists in the `writing` repo (F15).
