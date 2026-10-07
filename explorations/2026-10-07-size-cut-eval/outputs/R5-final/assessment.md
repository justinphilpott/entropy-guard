# Assessment: entropy-guard snapshot `entropy-guard-447da9a`

Run on 2026-10-07 in **plan mode**, by `skills/entropy-assessment/SKILL.md` called for analysis only by
`skills/session-coherence-skill-generator/SKILL.md`. Shape A, so the analysis is
`skills/docs-first-planning-assessment/SKILL.md` run as a called skill. Nothing in the target was edited. Line numbers
refer to the target snapshot. The snapshot has no `.git`, so no commit history was available (see Uncertainties).

This file holds the one findings list (F1 to F16). Other output files refer to findings by id.

## Intent (intent pass)

**Steward.** Not named in any file (F1). The evidence points to Justin Philpott: he is a participant in every
`explorations/*.md` front matter, and the feedback helper files issues on `github.com/justinphilpott/entropy-guard`
(`skills/local/entropy-guard-feedback/SKILL.md:10`). `LICENSE:3` names only "entropy-guard". Q1.

**Authorised intent, with sources.** No statement carries both an attribution and a date, so every source below has
evidence of authority "neither" unless a date is noted. They are still decisions and directives, recorded as such.

| Part | Source | Kind | Date |
|---|---|---|---|
| Purpose: practical entropy guards (assessment, guard generation and refinement, integration, validation) | `INTENT.md:122-127`; `DECISIONS.md:23-27` | directive; decision | INTENT revised 2026-04-07 |
| Scope: broader entropic-immunity theory lives in the sibling `entropy-immune-system` repo | `DECISIONS.md:23-27`; `AGENTS.md:34`; `README.md:7` | decision; directive; description | none |
| Focus: docs-first planning repos first, `entropy-assessment` stays the front door | `DECISIONS.md:15-19`; `INTENT.md:5`, `:129` | decision; directive | 2026-04-07 |
| Next step: external validation on a batch of docs-first planning repos | `INTENT.md:129-135`; `TODO.md:11-13`; `README.md:125` | directive; state; description | 2026-04-07 |
| Guard principles: delta-scoped, low burden, not a blocker, enforcement depth matched to the vector | `INTENT.md:59-66`, `:98-109`, `:113-118` | directive | 2026-04-07 |
| Repo conventions: markdown-first, skills in `skills/` and `skills/local/`, agentskills.io format | `AGENTS.md:29-34`; `DECISIONS.md:71-83` | directive; decision | none |
| One local guard covering docs and workflow, at session end / before commit | `DECISIONS.md:55-59` | decision | none |
| Guards mature External then Prompted then deeper | `DECISIONS.md:31-35` | decision | none |

**Readings.** Declared: the README and INTENT say the next phase is docs-first validation. Enacted: the newest dated
artifact is `skills/session-coherence-skill-generator/SKILL.md` (front matter `generated: 2026-05-10`,
`last_updated: 2026-05-11`), which no state claim mentions (F9). Authorised: the decisions above; the generator's
bootstrap mode is covered by `DECISIONS.md:7-11`, but its place beside docs-first guard generation is not (F4).

**Gaps by condition.**
- Missing: who the steward is (F1); a decision on which skill writes guards (F4).
- Conflict: the repo's own directives that let a session edit `INTENT.md` against the intent-change rule every
  generated guard must carry (F2); two skills that each generate guards (F4).
- Unauthorised drift, or missing decision: the validation measure changed from merged PRs to session recovery with no
  recorded decision (F10).
- Prose control: none cited as a control. The guard's "skip only for trivial changes" and the hook are reminders and
  say so (`.githooks/pre-commit:9` exits 0).

**Existing guard repair instructions read against the intent-change rule.**
- Intent: `skills/local/entropy-guard/SKILL.md:68` "if INTENT.md itself needs revision, update it with a dated note
  explaining what prompted the change." Also `AGENTS.md:27` "If a decision refines or challenges the intent, update
  INTENT.md and note why." Both are paths for unauthorised drift (F2).
- Ownership: `skills/local/entropy-guard/SKILL.md:88` "Did you change something that another doc also describes? If
  so, update both." This keeps two definitions in step, and contradicts line 87 of the same check (F3).

**Questions.** Five, in `questions.md` (Q1 to Q5), each with a recommended answer.

**Proposed changes, and where recorded.** Two proposals awaiting the steward, drafted for `DECISIONS.md` in
`patches/DECISIONS.md.patch` (for Q2 and Q3). Not applied: plan mode.

## Lifecycle, shape and repositories

- **Lifecycle: active.** `README.md:5` "actively used, actively refined"; `README.md:121` "Actively evolving";
  `TODO.md:11-13` carries live Next Up items; newest skill update dated 2026-05-11.
- **Shape: A, docs-first planning.** Markdown is the product (`AGENTS.md:31`, `:51`); `TODO.md`, `DECISIONS.md`,
  `LEARNINGS.md` and `AGENTS.md` carry state; work is repeated human and agent sessions (`AGENTS.md:19-27`).
  Shape D (workflow-heavy) also fits: the repo exports a way of working (`DECISIONS.md:55-59`). A was taken because
  its analysis already covers D's risk ("Workflow drift" row of the docs-first matrix), and the exported skills are
  product artifacts whose contracts are the higher-cost drift (F4, R1).
- **Repositories: one.** `entropy-immune-system` is a sibling for spun-out theory, not a repo that manages this
  one's work (`DECISIONS.md:26`). `seed` and the `writing` repo are upstream or elsewhere, not members.
- **Planning horizon.** Settled: the scope split, docs-first focus, skill format and placement, one local guard,
  External-to-Prompted maturity. Active: the external validation batch; the session-coherence generator's bootstrap
  mode. Exploratory: guard runner and evaluator (`INTENT.md:86`, `TODO.md:18`), further specialised tracks
  (`TODO.md:19`), layer 1-2 guarding and just-in-time generation (`LEARNINGS.md:117-143`).

## Findings

| Id | Finding | Evidence | Source |
|---|---|---|---|
| F1 | No file names the steward. Every `DECISIONS.md` entry is unattributed and undated. | `INTENT.md:3`; `DECISIONS.md` (all entries); `LICENSE:3` | intent pass |
| F2 | Three directives let a session edit `INTENT.md` to fit its work, without a recorded steward decision. | `skills/local/entropy-guard/SKILL.md:68`; `AGENTS.md:27`; `INTENT.md:3` "meant to be refined collaboratively — by humans and AI agents" | intent pass |
| F3 | The guard's consistency check tells the session to "update both" when two docs describe one thing, one line after asking for one canonical home. | `skills/local/entropy-guard/SKILL.md:87-88` | intent pass (ownership) |
| F4 | Two exported skills write guards. INTENT gives the role to the assessment workflow, including `docs-first-planning-assessment`, and does not mention the generator. `docs-first-planning-assessment` has "Phase 2: Guard Generation / Refinement"; `session-coherence-skill-generator` writes `skills/session-coherence-guard/SKILL.md`. README describes both. No decision records the generator's adoption or how the two relate. | target `skills/docs-first-planning-assessment/SKILL.md:3`, `:132`; target `skills/session-coherence-skill-generator/SKILL.md:3`, `:200-206`; `INTENT.md:86-88`; `README.md:52`, `:91`; `DECISIONS.md:7-11` ("The previous `session-coherence-skill-generator`") | docs-first Step 2 |
| F5 | The existing guard has no baseline: it says "what changed in this session" (`:12`) but never how to find it. It has no modes or safety rules. | `skills/local/entropy-guard/SKILL.md:12`, whole file | generator contract |
| F6 | The guard points at a "Key Documents table" in the README. There is none; the structure lists are under "What's here". | `skills/local/entropy-guard/SKILL.md:99`; `README.md:82` | docs-first Step 4 (stale references) |
| F7 | The guard sends full audits to `doc-health-check`, which does not exist. Already tracked. | `skills/local/entropy-guard/SKILL.md:33`, `:137`; `TODO.md:20` | pre-existing |
| F8 | The guard copies current state into itself ("4 exportable skills, 2 local skills", "Last evaluated: 2026-04-07"). | `skills/local/entropy-guard/SKILL.md:18-22` | generator contract |
| F9 | `TODO.md` has no dates, no staleness rule, no open questions, no list of what to trust first and no warning about superseded material; the newest enacted work (generator, 2026-05) appears in no state claim. The next phase is stated in three places. | `TODO.md:1-20`; `INTENT.md:129-135`; `README.md:125` | docs-first Step 5 |
| F10 | The validation target changed from "open source projects ... more merged PRs" to docs-first repos and "clearer session recovery, fewer reintroduced stale ideas"; the later decision covers the repo shape, not the measure. | `DECISIONS.md:26`; `DECISIONS.md:15-19`; `INTENT.md:135`; `README.md:125` | intent pass |
| F11 | An exported skill names another project's files ("FlowBook"). | target `skills/session-coherence-skill-generator/SKILL.md:22`, `:193` | docs-first Step 4 (imported material) |
| F12 | Superseded material sits beside live truth: decision and learning entries describe an `entropy-assessment` with "Phase 1/Phase 2", "Step 8" and domain appendices, which v0.6.0 no longer has; `explorations/` is historical; `distill-article` is named but not here. Logs are history and stay; the risk is revival. | `DECISIONS.md:41-51`, `:103-135`; `LEARNINGS.md:52`, `:63`, `:112`; target `skills/entropy-assessment/SKILL.md:5` | docs-first Step 4 (superseded nearby) |
| F13 | Seed boilerplate in the working practices: "Working code with tests beats perfect code" in a repo with no code or tests. Low. | `AGENTS.md:21`; `AGENTS.md:51`, `:57` | docs-first Step 4 (workflow drift) |
| F14 | A session can change live public state the diff does not show: the feedback helper files GitHub issues. Nothing records them at session end. | `skills/local/entropy-guard-feedback/SKILL.md:44-51` | generator input (live state) |
| F15 | Rules the repo is bound by but does not own: the agentskills.io specification and seed's scaffolding. No user-wide instructions file is named. | `DECISIONS.md:79-83`; `AGENTS.md:66-68` | generator input |
| F16 | No CI and no scripted checks. Link integrity and skill-name-matches-folder are stable invariants left to judgment; the guard itself says link checking "could eventually be mechanized". Both were scripted and run in this assessment: zero hits on the target, and both caught a deliberate break in a scratch repository. | `AGENTS.md:49-58`; `skills/local/entropy-guard/SKILL.md:110`; `DECISIONS.md:81` | docs-first matrix (stale references) |

## Truth map (docs-first Step 2)

Roles: canonical: `INTENT.md`, `DECISIONS.md`, `AGENTS.md` (practice). Current state: `TODO.md`. Product artifacts:
`skills/*/SKILL.md`, `skills/local/*/SKILL.md`, `.githooks/pre-commit`. Local elaboration and summaries: `README.md`,
`AGENTS.md` "Key Files". Historical: `explorations/`, `PHILOSOPHY.md` (free-form), superseded `DECISIONS.md` entries.

| Concept | Canonical home | Summaries and links |
|---|---|---|
| Purpose and scope | `INTENT.md`; scope decision `DECISIONS.md:23-27` | `README.md:1-7`, `:119-127`; `AGENTS.md:3`, `:29-34` |
| Next phase | `TODO.md` "Next Up" for work; `INTENT.md:122-135` for direction | `README.md:125` (links to TODO) |
| Which skill writes guards | **Conflict** (F4) | `INTENT.md:84-96`; `README.md:52`, `:91`; both skills |
| Each skill's contract (name, inputs, handoffs) | that skill's `SKILL.md` | `README.md` "What's here"; `AGENTS.md` "Key Files"; callers |
| Skill format and placement | `DECISIONS.md:71-83` | `AGENTS.md:33` |
| Working practice and the guard trigger | `AGENTS.md` "Working Practices" | `README.md` "Contributing"; `.githooks/pre-commit` |
| Guard principles, enforcement depth | `INTENT.md:47-109` | `LEARNINGS.md`, `DECISIONS.md:31-35` |
| Decisions; learnings | `DECISIONS.md`; `LEARNINGS.md` (tactical; articles in the `writing` repo, `DECISIONS.md:139-143`) | |

## Loop map (docs-first Step 3)

Documented loop: a session starts from `AGENTS.md`, writes its task into `TODO.md` "Doing Now" (`AGENTS.md:22`),
consults `INTENT.md` for significant choices, runs `skills/local/entropy-guard/SKILL.md` before committing
(`AGENTS.md:19`), clears "Doing Now", and notes the guard's result in the commit message (`README.md:138`). The
reminder is `.githooks/pre-commit`, opt-in by symlink and non-blocking. Upstream feedback goes to GitHub issues. No
CI, no PR template. The real loop could not be compared with the documented one: no commit history in the snapshot.

## Ranked risks (docs-first Step 4)

| Rank | Risk | Decay | Recovery cost | Symptoms | Anchor |
|---|---|---|---|---|---|
| R1 | Parallel truth about guard writing across exported skills | slow | high: external users get two generators and two templates | F4, F11 | a `DECISIONS.md` entry (Q3) |
| R2 | Intent edited to fit work | slow | very high (intent entropy) | F2 | steward decision (Q2); intent-change rule |
| R3 | Stale references and skill-contract drift across README, AGENTS, INTENT and skills | fast | low if caught in one session | F6, F7, F12 | each `SKILL.md`; scripted link and name checks (F16) |
| R4 | State dishonesty in `TODO.md` | medium | medium | F9, F10 | `TODO.md` |
| R5 | The guard cannot bound "this session" | per session | medium: missed or over-broad checks | F5, F14 | the guard's baseline section |

## Recommendations

- Consolidate: one owner of guard writing (Q3), then reduce the other skill and `INTENT.md:84-96` to links, after the
  steward's decision.
- Demote: the guard's metadata snapshot (F8) to nothing; state lives in `TODO.md`.
- Mark historical: nothing edited in the logs; `TODO.md` names the misleading material instead (F12).

## One-time cleanup (each verified against the current file on 2026-10-07)

- Remove "FlowBook" from target `skills/session-coherence-skill-generator/SKILL.md:22` and `:193` (F11). Present.
- Drop the stale parenthetical at `TODO.md:20` once the guard no longer names `doc-health-check` (F7). Present.
- Replace seed boilerplate at `AGENTS.md:21` with practice that fits a markdown repo (F13). Present. Low.

These are tracked in `patches/TODO.md.patch`, not in the guard.

## State-file update (docs-first Step 5)

`patches/TODO.md.patch`, against the existing `TODO.md`. No competing summary added.

## Guard surfaces (docs-first Step 7)

| Surface | Verdict |
|---|---|
| `skills/local/entropy-guard/SKILL.md` | amend: update in place to the generator's contract (F2, F3, F5, F6, F7, F8, F14, F16) |
| `.githooks/pre-commit` | keep: its path still holds, since the guard is updated in place |
| `AGENTS.md` "Working Practices" | keep; line 27 to be amended only after Q2 is answered |
| `README.md` "Contributing" | keep |
| `TODO.md` | amend (state file) |
| `DECISIONS.md` | amend: two proposals awaiting the steward |
| `skills/local/entropy-guard-feedback/SKILL.md` | keep |

## Guard decision

**`update`.** A guard exists and is run at the right point (`AGENTS.md:19`, `DECISIONS.md:55-59`), but it carries
intent and ownership repair paths (F2, F3), no baseline or safety rules (F5), stale references (F6, F7), copied state
(F8), and misses live state (F14) and the scriptable invariants (F16).

## Generator inputs

| Input | Value | Status |
|---|---|---|
| Steward | not named | **unresolved** (Q1) |
| Authorised intent documents | `INTENT.md`; `README.md` "Project status"; `AGENTS.md` "Project Constraints"; scope entries in `DECISIONS.md` | resolved |
| Decision surface | `DECISIONS.md` (newest first) | resolved |
| Open intent questions | Q1 to Q5 | open |
| Current-state file, and who refreshes it | `TODO.md`; whoever runs the session, at start ("Doing Now") and end (the guard) | resolved |
| Rules owned elsewhere | agentskills.io spec; seed; GitHub issues on `justinphilpott/entropy-guard`; intent-change rule v2 | partly **unresolved**: any user-wide instructions file (Q4) |
| Verification commands; which run by themselves | none in the repo; nothing runs by itself (the hook only prints) | resolved; two checks scripted for the guard (F16) |
| Code areas and their docs and tests | exported skills ↔ README "What's here", AGENTS "Key Files", INTENT "The guard lifecycle", their callers; local skills ↔ README, AGENTS; hook ↔ AGENTS "Working Practices", README "Contributing". No tests. | resolved |
| Live state or spend a session can change | GitHub issues via the feedback helper; no spend | resolved |
| Findings | F1 to F16 | |
| Upstream branch for the baseline fallback | no `.git` in the snapshot | **unresolved**; the guard resolves it at run time with `@{upstream}` |

## Uncertainties

- No commit history: enacted intent was read from file dates only, and the real loop could not be checked.
- Whether a user-wide instructions file binds the repo is unknown (Q4).
- The steward's identity is inferred, not recorded (Q1).
