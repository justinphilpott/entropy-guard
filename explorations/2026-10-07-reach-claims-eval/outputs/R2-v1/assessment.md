# Entropy assessment: entropy-guard, snapshot 447da9a

- **Target:** `eval/targets/entropy-guard-447da9a`, a read-only copy of an older entropy-guard repository, with no
  `.git`. Line references below are to that snapshot.
- **Date:** 2026-10-07.
- **Skills followed:** `entropy-assessment` v0.9.0, `intent-pass.md`, `docs-first-planning-assessment` v0.3.0,
  `session-coherence-skill-generator` v0.5.0, `guards-integrator` v0.4.0 (from the `tool-r7` skills folder).
- **Mode:** build, with every write redirected to this output folder, because the target cannot be edited. Nothing in
  the target was changed. The files build mode would change are in `settled.diff` and `provisional.diff`.
- **Steward:** absent. Questions and recommended answers are in `questions.md`.

## Route taken

1. `entropy-assessment` Step 1: the intent pass (`intent-pass.md`).
2. Step 2: lifecycle **active**; shape **A, docs-first planning**; one repository.
3. Shape A runs `docs-first-planning-assessment` as a called skill, Steps 1 to 7. Its assessment is this assessment,
   with intent and lifecycle added.
4. Step 3 guard decision: **`update`**. The existing guard, `skills/local/entropy-guard/SKILL.md`, needs amendment.
5. Step 4: hand to `session-coherence-skill-generator`, which updated the guard in place (`guard/SKILL.md`) and handed
   to `guards-integrator` (`integration.md`).

`mixed-profile.md` and `bootstrap.md` were not needed: the route is A, and the repo already has a state file and a
decision log.

---

## Intent

### Steward

Nobody is named as steward in any file (finding F3). Inferred: **Justin Philpott**, from the GitHub owner
`justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md:10`, `AGENTS.md:68`) and his recorded
scope decisions in `explorations/2026-03-24-entropy-immune-system-conversation.md:86`, `:125` and `:713`. The
inference is kept visible in the guard and in the proposals written to `DECISIONS.md`.

### Statements gathered

| Id | Where | Kind | Authority | Date |
|---|---|---|---|---|
| S1 | `INTENT.md` (whole), "north star" | directive (intent document) | neither attributed nor signed; revision dated | last revised 2026-04-07 (`:5`) |
| S2 | `INTENT.md:3`, `:139`: refined "by humans and AI agents"; "add it" | directive | neither | 2026-04-07 (document date) |
| S3 | `AGENTS.md:27`: "update INTENT.md and note why" | standing instruction | neither | none |
| S4 | `DECISIONS.md:15-19`, "Specialize first…" | decision | neither | undated; `INTENT.md:5` ties the change to 2026-04-07 |
| S5 | `DECISIONS.md:23-27`, "Farm broader…": open source projects, "more merged PRs" | decision | neither | undated |
| S6 | `explorations/2026-03-24-entropy-immune-system-conversation.md:713`: "I want to preserve the entropy-guard project and really farm this new evolution off into its own repo" | decision | attributed to Justin and dated | 2026-03-24 |
| S7 | same file `:86`: the existing project "can go in a suggest changes which then get merged within a short space of time" | steward's description of success | attributed and dated | 2026-03-24 |
| S8 | `DECISIONS.md:7-11`, bootstrap mode for `session-coherence-skill-generator` | decision | neither | undated; the skill's metadata says 2026-05-10 and 2026-05-11 |
| S9 | `DECISIONS.md:139-143`, "LEARNINGS.md stays tactical" | decision | neither | undated |
| S10 | `README.md:119-125`, "Project status" | description | neither | none |
| S11 | `TODO.md:9-13`, "Next Up" | current state | neither | none |
| S12 | `LEARNINGS.md:117-143`, three theory entries | agent inference, validated by a conversation | neither | 2026-03-19 (by reference) |

None of the 17 entries in `DECISIONS.md` carries a date or an author (F4). They are still recorded decisions and are
treated as such; their missing attribution is kept visible.

### Existing guard repair instructions, read against the intent-change rule

- **Intent:** `skills/local/entropy-guard/SKILL.md:68`: "If misaligned: update the skill, or if INTENT.md itself needs
  revision, update it with a dated note explaining what prompted the change." This lets the session's work become
  permission to change authorised intent, and is a path for unauthorised drift. The standing instructions `AGENTS.md:27`,
  `INTENT.md:3` and `INTENT.md:139` open the same path. (F2)
- **Ownership:** `skills/local/entropy-guard/SKILL.md:88`: "Did you change something that another doc also describes?
  If so, update both." This keeps two descriptions in step instead of naming an owner, and contradicts the check one
  line above it (`:87`). `:99` asks for `AGENTS.md` "Key Files" and the `README.md` table to be updated: those are
  summaries of each skill's own `description`, so keeping them correct is right, not a competing definition; but the
  table it names does not exist (F8c).

### Three readings

- **Declared** (`INTENT.md`, `README.md`): a practical entropy-guard project (assessment, guard generation and
  refinement, integration), with docs-first planning repos as its strongest track, and next a larger validation batch
  on such repos.
- **Enacted:** cannot be read from commits, because the snapshot has no history. The newest dated work is the
  `session-coherence-skill-generator` and its bootstrap decision (S8, May 2026); no results from the validation batch
  are recorded anywhere (`TODO.md:11-13` unchecked, nothing in `LEARNINGS.md`).
- **Authorised:** in the steward's recorded words, keep entropy-guard as the practical project and farm the new
  "entropy immune system" line off into its own repo (S6); success includes outside changes getting merged (S7).
  Beyond that, the repo's own precedence makes `INTENT.md` the north star (`AGENTS.md:8`, `:38`) and `DECISIONS.md`
  the record, both unattributed.

### Gaps, by condition

| Condition | Gap | Finding | Response |
|---|---|---|---|
| Stale description | `skills/guards-integrator/SKILL.md:20`, `:221`, `:227` say `entropy-assessment` generates guards; "Specialize first…" (`DECISIONS.md:18`) made it a router | F9 | Corrected in `settled.diff`, citing that decision |
| Stale description | Five `DECISIONS.md` entries describe an `entropy-assessment` Phase 2 or a superseded skill split without a marker | F10 | Markers added in `settled.diff`, citing `DECISIONS.md:18` and `:134` |
| Conflict | Two skills write guards to two templates; `INTENT.md:88` names one | F1 | Both presented; Q2 |
| Conflict | Validation population and measure: `DECISIONS.md:26` against `INTENT.md:129-135` | F5 | Both presented; Q3 |
| Missing | Who may change authorised intent, and who the steward is | F2, F3 | Q1 |
| Ambiguous | Three theory entries in `LEARNINGS.md` | F6 | Q4 |
| Ambiguous | `INTENT.md:80` "Each guard is a skill file" against `INTENT.md:65` "not ... Always a skill file". Diverging case: a link check written as a guard checklist item or as a script | F15 | Not asked: no CI exists, so the answer changes nothing built now |
| Unauthorised drift | None found. Without commit history, enacted work could only be read from dated artifacts | — | Recorded as not covered |
| Prose control | None found. `AGENTS.md:19` calls the guard "non-negotiable", but `README.md:137` says the hook "nudges, but does not block", and nothing cites the guard as a blocking control | — | — |

### Questions and proposed changes

Four questions, Q1 to Q4, are in `questions.md` with recommended answers. They are also written into the target's
decision log as one entry, "Awaiting Justin Philpott: four proposals from the 2026-10-07 entropy assessment", at the
top of `DECISIONS.md` (in `settled.diff`). `TODO.md`'s new "Current state" section links to that entry rather than
restating it.

---

## Lifecycle, shape and repositories

- **Lifecycle: active.** `README.md:5` "actively used, actively refined"; `README.md:121` "Actively evolving";
  open "Next Up" work in `TODO.md:11-13`; the newest artifact is dated 2026-05-11
  (`skills/session-coherence-skill-generator/SKILL.md:6`). Recency could not be checked against commits.
- **Shape: A, docs-first planning.** Markdown is the product: 17 of the 21 files are markdown, and the only executable
  is a 9-line reminder hook. `TODO.md`, `DECISIONS.md`, `LEARNINGS.md` and `AGENTS.md` carry state, and work happens in
  repeated human and agent sessions (`AGENTS.md:17-27`; the explorations record sessions with Claude Sonnet 4.6 and
  OpenCode gpt-5.4).
- **Also fits: D, workflow-heavy,** because the repo exports a way of working (skills, a ritual, a hook). A was taken
  as the riskier fit: the largest risks found are between documents (F1, F2, F10), and the docs-first matrix covers
  workflow drift as one of its rows.
- **Repositories: one.** The sibling `../entropy-immune-system/` (`AGENTS.md:15`) has its own intent and does not
  manage this repo's work; it was not read (outside this run's allowed sources).

---

## Findings

One list. Other sections refer to these ids.

**F1. Two skills write guards, to different templates, and no decision says which owns guard generation.**
`skills/docs-first-planning-assessment/SKILL.md:132-202` (Phase 2: a combined docs and workflow guard);
`skills/session-coherence-skill-generator/SKILL.md:198-315` (a guard at `skills/session-coherence-guard/SKILL.md`,
with modes, mechanical checks and safety rules). `INTENT.md:88` gives the generator role to the assessment workflow and
never mentions the session coherence generator; `DECISIONS.md:7-11` invests in it. The front door's fallback
(`skills/entropy-assessment/SKILL.md:122`, "add a lightweight general post-work guard") names no writer, and the front
door has no route to the generator's bootstrap mode for young repos. `README.md:52`, `:78` ("what the generator
produces") and `:91` leave it to the reader which one is meant. Condition: conflict. Q2.

**F2. Standing instructions let any contributor, including an agent, revise `INTENT.md`.** `INTENT.md:3`,
`INTENT.md:139`, `AGENTS.md:27`, and the guard's repair at `skills/local/entropy-guard/SKILL.md:68` (quoted above).
The one recorded revision (`INTENT.md:5`) has a date and no author. Condition: missing decision on who authorises
intent changes. Q1.

**F3. No file names the steward.** `LICENSE:3` says "Copyright (c) 2026 entropy-guard". The steward is inferred from
`skills/local/entropy-guard-feedback/SKILL.md:10`, `AGENTS.md:68` and the explorations (see Intent).

**F4. `DECISIONS.md` has 17 entries, none dated or attributed, in mixed order.** Newest-first at the top (the bootstrap
entry from May 2026 above "Specialize first…" from April), oldest-first at the bottom ("Two-layer generator
architecture", `:103-105`, is "Superseded by … below" by `:129`). Consequence: whether "Specialize first…" overrides the
measure in "Farm broader…" cannot be settled by date (F5). The updated guard asks for new entries to be dated and
attributed; old entries cannot be dated from this snapshot.

**F5. The validation loop has two populations and two measures.** `DECISIONS.md:26`: open source projects, "more merged
PRs". `INTENT.md:129-135`, `README.md:125`, `TODO.md:11-13`: docs-first planning repos; session recovery, stale ideas,
doc coherence. Condition: conflict. Q3.

**F6. Three `LEARNINGS.md` entries are theory, validated only by a conversation, and point at a different guard design.**
`LEARNINGS.md:117-143`; `:123` "The mature form collapses assess → fix with no persistent guard artifact". Against
`LEARNINGS.md:3` and `explorations/2026-03-24-entropy-immune-system-working-conclusions.md:20-22`. Condition:
ambiguous. Q4.

**F7. `explorations/` is not demoted.** Four files, 1,467 lines, two marked `status: draft`; listed in neither
`README.md` "What's here" nor `AGENTS.md` "Key Files". "Farm broader…" (`DECISIONS.md:25-26`) says these documents
seeded the sibling repo, where that line continues. `PHILOSOPHY.md:45` and `LEARNINGS.md:122` link into the folder, so
it stays. Fix in `settled.diff`: a `README.md` row marking it historical, citing that decision.

**F8. The existing guard, `skills/local/entropy-guard/SKILL.md` (v0.2.3, 1,400 words), has six defects.**
- F8a. No baseline: "Scope: what changed in *this session*" (`:12`), with no way given to find the change.
- F8b. "update both" (`:88`), contradicting its own one-owner check (`:87`).
- F8c. Points at "README.md (Key Documents table)" (`:99`); the README has no such table. Its tables are under "What's
  here" (`README.md:82`).
- F8d. "use doc-health-check for that" (`:33`); that skill does not exist (`TODO.md:20`).
- F8e. No check for the one live thing a session can change: GitHub issues created through the feedback helper (F14).
- F8f. "Last evaluated: 2026-04-07" (`:21`), before the generator and its bootstrap decision (May 2026). `INTENT.md:82`
  says the assessment "should be run on this project periodically", with no trigger; this run is that re-evaluation.

**F9. `skills/guards-integrator/SKILL.md` still says `entropy-assessment` generates guards.** `:20` "After
`entropy-assessment` generates one or more guards"; `:221` "If the assessment skill generated the guards"; `:227`
"use that to decide what guards are needed". Since "Specialize first…" (`DECISIONS.md:18`) the front door triages and
routes (`skills/entropy-assessment/SKILL.md:12`, `:66-126`). Condition: stale description. The correction in
`settled.diff` avoids naming a writer, so it does not touch Q2.

**F10. Five `DECISIONS.md` entries lack supersession markers.** "Entropy assessment should support guard refinement…"
(`:39`), "Add workflow/process…" (`:47`), "Guard generation should produce immediate integration advice…" (`:95`) and
"Rename entry point…" (`:113`) describe an `entropy-assessment` Phase 2, Steps 5-8 or appendices that the current skill
does not have, by "Specialize first…" (`:18`). "Exportable skills vs local skills" (`:71`) is superseded for the
generator skills by `:134`, which says so, but it carries no marker. The repo already uses such markers (`:105`, `:131`).
`LEARNINGS.md:33` also cites old step numbers; it records what was learnt then and is left alone.

**F11. The repo does not practise its own session-start step.** `README.md:125`, `INTENT.md:73` and `:133` say fresh
sessions read a current-state packet; the repo has none, and its loop (`AGENTS.md:17-27`) does not mention one.
`TODO.md` holds task lists only. Fix in `settled.diff`: a short "Current state" section in `TODO.md`, the existing
state file, rather than a new one.

**F12. The session coherence generator carries residue from another repo.** "FlowBook" at
`skills/session-coherence-skill-generator/SKILL.md:22` and `:193`, never explained in this repo; its metadata keys
(`generated`, `last_updated`, `skill_version`, `:5-7`) differ from every other skill's `version`. The FlowBook lines are
corrected in `settled.diff`; the metadata keys are left (cosmetic).

**F13. Scaffolding residue from seed.** `AGENTS.md:21` "Working code with tests beats perfect code in progress" in a
repo with no code or tests (`AGENTS.md:51`, `:57`); a Go block in `.gitignore:17-25`; Python, Go and Makefile rules in
`.editorconfig:11-18`. Low. `AGENTS.md:26` ("Stale scaffolding is worse than no scaffolding") covers it; optional
cleanup, not patched.

**F14. Claims about what the repo runs and reaches: checked against the files, consistent.** Claims:
`AGENTS.md:31` "there is no application runtime in this project yet"; `AGENTS.md:51` "No build, test, or runtime
commands yet"; the guard's snapshot line, "no application code/tests/API" (`skills/local/entropy-guard/SKILL.md:20`).
The search, run 2026-10-07 over the whole snapshot including hidden files and markdown (skills are instructions agents
execute, so markdown counts as code here):

| Pattern (ripgrep) | Hits | What runs it |
|---|---|---|
| `rg --files --hidden -g '!*.md'` and `find -perm -u+x` | `.githooks/pre-commit` (only executable), `.gitignore`, `.editorconfig`, `LICENSE` | git, at commit, only if the hook is linked |
| `'^#!'` | `.githooks/pre-commit:1` (`#!/bin/sh`); it runs `printf` four times, then `exit 0` | same |
| `\bgh (issue\|pr\|api\|repo\|auth)\b`, `\bcurl\b`, `\bwget\b`, `\bssh\b`, `git (push\|fetch\|clone\|pull)` | `skills/local/entropy-guard-feedback/SKILL.md:46` `gh issue create`; `:77` `gh issue list` | an agent session's shell, when it follows the feedback helper; reached from `skills/entropy-assessment/SKILL.md:150`, `skills/docs-first-planning-assessment/SKILL.md:217`, `skills/guards-integrator/SKILL.md:174`, `AGENTS.md:72` |
| `https?://…` | `AGENTS.md:68`, `DECISIONS.md:81`, `:142`, `skills/local/entropy-guard-feedback/SKILL.md:10`, `:53` | links only; nothing fetches them |
| `-i '\b(npx\|pnpm\|npm\|pip\|python3?\|node\|docker\|playwright\|puppeteer\|chromium\|selenium\|spawn\|subprocess)\b'` | none | — |
| `-i '\b(token\|secret\|password\|credential)s?\b'`, `'\.env\b'`, `'api[_ -]?key'`, `authenticated` | `.gitignore:6-8` (ignores `.env*`; none present); safety text in the generator; `skills/local/entropy-guard-feedback/SKILL.md:53` | `gh` uses the user's stored GitHub login |

Result: the "no runtime" claims hold. The one network reach is a write to a public service, an issue on
`justinphilpott/entropy-guard`, made by an agent session; no spend. `README.md:98` and `AGENTS.md:42` describe it. It
was missing from the guard (F8e).

**F15. `INTENT.md` is ambiguous on whether every guard is a skill file.** `:80` against `:65`. Not asked (see Gaps).

### Checks run on the target, 2026-10-07

- Relative markdown links: 49 checked, none broken. A planted broken link in a scratch copy was reported.
- Placeholders: only `TODO.md:7` `[empty]`, which is intended.

---

## Truth map

| Concept | Canonical home | Mentioned elsewhere as | Note |
|---|---|---|---|
| Purpose, scope, entropy model, four tools, enforcement depth | `INTENT.md` | `README.md:3-17`, `:70-74`, `:119-125` (summary); `AGENTS.md:3`, `:34` | Who may change it: open (F2, Q1) |
| Decisions | `DECISIONS.md` | `TODO.md` "Current state" (links, after patch) | Undated (F4); markers missing (F10) |
| Learnings | `LEARNINGS.md` | — | Three theory entries open (F6, Q4) |
| Theory fragments and articles | `PHILOSOPHY.md`; the `writing` repo (`DECISIONS.md:142`) | — | — |
| Entropic-immunity line | sibling `entropy-immune-system` | `explorations/` (historical seed copies) | F7 |
| Current work and next steps | `TODO.md` | `README.md:125`, `INTENT.md:129-135` (direction summaries) | Measure open (F5, Q3) |
| Working practices and loop | `AGENTS.md` "Working Practices" | `README.md:131-140` (summary); `.githooks/pre-commit` text | — |
| Each skill's purpose | its `SKILL.md` frontmatter `description` | `README.md:84-98`, `AGENTS.md:41-46` (summaries) | Keep summaries correct |
| Product artifacts (contracts) | the four exported skills under `skills/` | each other's handoffs; `INTENT.md:84-96` | Guard generation has two owners (F1, Q2) |
| This repo's guard | `skills/local/entropy-guard/SKILL.md` | `AGENTS.md:19`, `:41`; `README.md:78`, `:97`, `:137`; the hook | — |
| Skill file format | agentskills.io specification (external) | `DECISIONS.md:79-83` | Rule owned elsewhere |

## Loop map

- **Session start:** the agent loads `AGENTS.md` (if its tool loads that file; not verified), consults `INTENT.md` for
  significant choices, and writes its task into `TODO.md` "Doing Now" (`AGENTS.md:22`).
- **During work:** markdown edits; decisions to `DECISIONS.md`, learnings to `LEARNINGS.md` (`AGENTS.md:25`).
- **Session end, before commit:** run `skills/local/entropy-guard/SKILL.md` (`AGENTS.md:19`); clear "Doing Now"; put
  the result in the commit message (`README.md:138`).
- **Commit:** `.githooks/pre-commit` prints a reminder and exits 0, but only after it is symlinked to
  `.git/hooks/pre-commit` (`AGENTS.md:19`, `README.md:140`).
- **Upstream feedback:** the exported skills end with a feedback check that can run `gh issue create`.
- **Absent:** CI, PR templates, tests.
- **Real loop:** cannot be confirmed: the snapshot has no commits to show whether guard results reach commit
  messages. The explorations show sessions run in plan mode and with two agent tools.

## Ranked risks

Ranked by decay rate times recovery cost.

1. **Intent governance** (F2, F3, F4). Slow decay, and per `INTENT.md:33` catastrophic to recover. Symptoms: an
   unattributed `INTENT.md` revision, 17 undated decisions, and an open invitation for agents to edit intent. Anchor:
   `DECISIONS.md` proposal 1, then `INTENT.md:3`.
2. **Parallel truth: two guard writers** (F1). Decays with every edit to either skill; costly to recover because other
   repos' guards are built from these templates. Anchor: `DECISIONS.md` proposal 2, then `INTENT.md:84-96`.
3. **Superseded material nearby** (F6, F7, F10). Medium decay, medium recovery. Symptoms: five decisions describing a
   Phase 2 that no longer exists, 1,467 unlisted lines of exploration, and theory filed as learnings. Anchor:
   `DECISIONS.md` "Specialize first…" and "Farm broader…".
4. **Stale references in product artifacts** (F8, F9, F12). Fast decay, cheap now. Anchor: each skill file.
5. **State dishonesty** (F11, F5). No session-start state; the active front's measure is unclear. Anchor: `TODO.md`.

## Recommendations

- **Consolidate:** one guard writer (F1), once Q2 is answered.
- **Demote or mark historical:** `explorations/` (F7, settled); the five `DECISIONS.md` entries (F10, settled); the
  three `LEARNINGS.md` entries (F6, provisional on Q4).
- **Keep:** `README.md` and `AGENTS.md` skill lists as summaries of each skill's `description`, kept correct by the
  guard's first check.

## One-time cleanup

Each item was checked against the current file; each `settled.diff` hunk applies cleanly to the snapshot.

- `skills/local/entropy-guard/SKILL.md`: rebuilt to the generator's contract (F8a-F8f), keeping its current Intent
  repair until Q1 is answered.
- `skills/guards-integrator/SKILL.md:20`, `:221`, `:227` (F9).
- `DECISIONS.md`: proposals entry at the top (F2-F6); five supersession markers (F10).
- `README.md` "Frameworks and thinking": a row for `explorations/` (F7).
- `skills/session-coherence-skill-generator/SKILL.md:22`, `:193` (F12).
- `TODO.md`: "Current state" section (F11), and the `doc-health-check` backlog item's reason, which pointed at the line
  removed from the guard.
- Optional, not patched: seed residue (F13).

## State-file update

`TODO.md` is the state file the loop reads (`AGENTS.md:22`). The update adds a "Current state" section above "Doing
Now" (in `settled.diff`). It holds the stage, the documents to trust first, settled decisions linked to `DECISIONS.md`,
the open questions by link, misleading material nearby, and two next actions. It says who refreshes it (whoever runs the
guard at session end) and what makes it stale, and dates its one changing claim. "Doing Now" stays empty: this run
could not write the target, and the loop requires it cleared at commit.

---

## Guard inputs (docs-first Step 7)

### Existing guard surfaces

| Surface | Verdict | Why |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | amend | Sound and in use by instruction; F8 |
| `AGENTS.md:19` (run before commit) | keep | The entry point agents meet |
| `AGENTS.md:27` (update `INTENT.md`) | amend, provisional | F2, Q1 |
| `.githooks/pre-commit` | keep | Reminder works as designed; adding the link check is "Next" in `integration.md` |
| `README.md:131-140` "Contributing" | keep | Summary of the loop |
| `TODO.md` | amend | F11 |
| `DECISIONS.md`, `LEARNINGS.md` | keep, with markers | F10; F6 provisional |
| Feedback checks in the three exported skills | keep | Covered by the guard's live-reach check |

### The matrix, written against this repo

| Risk | Check in the updated guard |
|---|---|
| Parallel truth | Repairs: one owner per concept; first check (skill contracts and their summaries); temporary check on the two guard templates (F1) |
| Superseded material nearby | Before reviving from `explorations/` or a superseded `DECISIONS.md` entry, look for its supersession |
| Stale references | Search for old names; the link check command |
| Lost decisions and learnings | Two checks, pointing at `DECISIONS.md` and `LEARNINGS.md` and where theory goes instead |
| State dishonesty | `TODO.md` claims and their other mentions; "Doing Now" cleared |
| Workflow drift | Would a fresh agent following `AGENTS.md` do what this session did; do the hook and `README.md` agree |
| Brittle automation | Only the link check and `git diff --check` are commands; everything else stays judgment |

### Guard decision: `update`

The guard exists and its loop is real by instruction, but it has six defects (F8) and an intent repair that opens a path
for drift (F2).

## Generator inputs

- **Steward:** Justin Philpott, inferred (F3).
- **Authorised intent:** `INTENT.md`; the scope decisions "Specialize first…" and "Farm broader…" in `DECISIONS.md`;
  `README.md` "Project status" as a summary.
- **Decision surface:** `DECISIONS.md`.
- **Open intent questions:** Q1 to Q4.
- **Current-state file:** `TODO.md`; refreshed by whoever runs the guard at session end.
- **Rules bound but not owned:** the agentskills.io skill format (`DECISIONS.md:79-83`). A user-wide agent instructions
  file: **unresolved**; none is named in the repo.
- **Verification commands:** none exist (`AGENTS.md:49-52`); none run by themselves (no CI). Added: a link check
  (tested in zsh, bash and sh) and `git diff --check`.
- **Code areas and their docs:** the only code is `.githooks/pre-commit`, described by `AGENTS.md:19`, `:40` and
  `README.md:78`, `:114`, `:140`. The product artifacts are the skills, described by `README.md:84-98`,
  `AGENTS.md:41-46` and `INTENT.md:84-96`. No tests.
- **Live state or spend a session can change:** GitHub issues on `justinphilpott/entropy-guard` (F14). No spend.
- **Findings:** F1 to F15.

## Generator output

- **Guard:** `skills/local/entropy-guard/SKILL.md`, updated in place (the generator's rule for an existing guard), so
  the name `entropy-guard` and every reference to its path stay valid. Full proposed text: `guard/SKILL.md`.
- **Size: 1,063 words, against a budget of about 1,114.** The guard holds the common contract, eight repo-specific
  checks beyond the template's two standing ones, its pointers and two commands.
  - Common contract: 724 words. The generator's figure; this run reproduced it, with `wc -w` on the template with the
    rule copied in.
  - Checks: 8 × 36 = 288 words budgeted; the eight use 204.
  - Pointers: about 46 words (the "Where things live" values, measured with their labels removed).
  - Commands: 56 words.
  - The settled version, with the current Intent repair in place of the rule, is 932 words. The old guard was 1,400.
- **Review before handing over:**
  - The guard carries "Modes and safety" and binds its baseline: `<start>`, else `@{upstream}`.
  - Patches are sorted: nothing in `settled.diff` touches Q1 to Q4.
  - Repair instructions were checked against authorised intent. The rule is in the full guard; the settled version
    keeps today's repair with a visible note naming proposal 1.
  - Size is within the budget.
- **Operator docs:** already name the guard at this path (`AGENTS.md:19`, `:41`; `README.md:78`, `:97`, `:137`). No
  change needed.
- **Validation:**
  - `git diff --check` could not run (no `.git`). Instead, the lines both patches add were scanned for trailing
    whitespace: none.
  - Both patches apply in order to a pristine copy with `patch -p1`, and give exactly the intended tree.
  - The link check passes on the original, settled and final trees under zsh, bash and sh.
  - The first draft of the link-check command failed under zsh and matched its own text. It was caught by running it,
    and replaced before the patches were made.
- **Handoff:** `integration.md`.

## Patches

### `settled.diff` (touches no open question)

It holds every item in "One-time cleanup" above, including the updated guard without the intent-change rule. Apply it
from the repo root with `patch -p1 < settled.diff`.

### Provisional patch (do not apply until the steward answers)

- **`provisional.diff`, Q1:** the guard's Intent section becomes the intent-change rule (the result equals
  `guard/SKILL.md`); also `AGENTS.md:27`, `INTENT.md:3` and `INTENT.md:139`. Apply after `settled.diff`.
- **`provisional.diff`, Q4:** status lines on the three `LEARNINGS.md` entries.
- **Q2, change list only** (its shape depends on the answer). For answer B:
  - docs-first Phase 2 hands its checks to the generator;
  - `INTENT.md:71` and `:88` name the generator;
  - `README.md:52`, `:78` and `:91` say which skill writes guards;
  - `skills/entropy-assessment/SKILL.md:116-126` routes "add a lightweight general post-work guard", and young repos,
    to the generator;
  - the guard's temporary two-templates check is removed.
- **Q3, change list only:**
  - `INTENT.md:135` names the measures;
  - `TODO.md` "Next Up" item 2 names what is tracked;
  - "Farm broader…" gets a marker if its measure is replaced.
- **After Q1 is answered:** the guard's steward line, "inferred", should cite the recorded answer.

## Uncertainties and what was not covered

- **No git history.** Enacted intent, the real loop, whether guard results reach commit messages, and whether the hook
  is linked could not be checked.
- **Not read:** the sibling `entropy-immune-system` repo, GitHub issues #9-#12 (cited in `DECISIONS.md:17`), and any
  user-wide agent instructions. All are outside this run's allowed sources.
- **Explorations:** read via their frontmatter, headings, every turn by Justin, and the closing exchange; not every
  assistant turn.
- **The intent-change rule says a guard "inside entropy-guard points here instead".** This target is an entropy-guard
  copy but lacks `intent-change-rule.md`, so the guard carries a copy. A pointer would be a broken link.
- **The steward identity is an inference** (F3).
