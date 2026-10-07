# Entropy assessment: entropy-guard snapshot 447da9a

- **Target:** `entropy-guard-447da9a`, a read-only snapshot of the entropy-guard repository with no `.git`. Paths below
  are relative to it.
- **Date:** 2026-10-07.
- **Route:** `entropy-assessment` (v0.9.0) took shape A, docs-first planning. It ran `docs-first-planning-assessment`
  (v0.3.0) as a called skill, made the guard decision `update`, and handed to `session-coherence-skill-generator`
  (v0.5.0), which handed to `guards-integrator` (v0.4.0).
- **Mode:** build, with every output written outside the target. Nothing in the target was edited. Its changes are
  delivered as two patches and a replacement guard.
- **Steward:** absent. Questions with recommended answers are in `questions.md`. Work that depends on them is drafted
  as provisional.

Outputs that sit beside this file:
- `guard/SKILL.md`: the updated guard.
- `integration.md`: the integration brief.
- `patches/settled.patch`: changes that touch no open question. It applies cleanly to the snapshot (`patch -p1`).
- `patches/provisional.patch`: changes that wait for Q2 and Q4. It applies cleanly after the settled patch.
- `feedback.md`: upstream feedback on entropy-guard itself.

---

## 1. Intent

### Steward
No file says who decides what this repository is for (F1). The evidence points to Justin Philpott:
- The repository is `github.com/justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md:10`, `:46-47`).
- It was scaffolded from `justinphilpott/seed` (`AGENTS.md:68`).
- He is the human participant who sets the direction in each exploration transcript (`explorations/2026-03-19-autopoiesis.md:5`, `:19`).
- `LICENSE:3` names "entropy-guard", not a person.

This is open question Q1, and is treated as unresolved in the guard.

### Authorised intent, with sources
None of the statements below is attributed to the steward or dated, except where noted. Under the intent pass's
precedence, a recorded decision outranks a description.

| Part | Source | Kind | Authority |
|---|---|---|---|
| Practical entropy guards for iterated, AI-assisted systems: assess, generate or refine, integrate, validate | `DECISIONS.md:26` "Farm broader…"; `INTENT.md:126` | decision; directive | unattributed, undated; INTENT revised 2026-04-07 |
| Broader entropic-immunity theory continues in the sibling repo `entropy-immune-system`, not here | `DECISIONS.md:26`; `README.md:7`; `AGENTS.md:34` | decision | unattributed, undated |
| Specialise first in docs-first planning repos, with `entropy-assessment` kept as the single front door | `DECISIONS.md:18` | decision | unattributed, undated (it postdates the "Farm" decision: it cites issues #9 to #12, and INTENT's 2026-04-07 revision records it) |
| What a guard preserves and must not be: delta-scoped, low burden, enforcement depth | `INTENT.md:47-65`, `:98-109` | directive (north star) | unattributed; revised 2026-04-07 |
| Next step: validate on more docs-first repos, not widen the philosophy | `INTENT.md:129-135` | directive | as above; conflicts with `DECISIONS.md:26` on what is measured (F7) |
| Bootstrap young repos before generating guards, in `session-coherence-skill-generator` | `DECISIONS.md:10` | decision | unattributed, undated; the skill's metadata is dated 2026-05-11 |

- **Declared:** `README.md:3-7` and `:119-125`, and `INTENT.md` throughout.
- **Enacted:** there is no commit history to read. The open work is `TODO.md:11-20`, all unchecked. The newest dated
  artifact is `skills/session-coherence-skill-generator/SKILL.md` (metadata `last_updated: 2026-05-11`), together with
  the top entry in `DECISIONS.md`. So the most recent visible work extended a guard writer for young repos, and the
  validation batch has not started. A recorded decision covers that work (`DECISIONS.md:10`), so it is not
  unauthorised drift.
- **Authorised:** the steward's own words appear only in the exploration transcripts, and they direct exploration, not
  this repository's scope.

### Gaps by condition
- **Missing:** who the steward is (F1).
- **Conflict:**
  - Self-editable intent against the intent-change rule that every generated guard carries (F2).
  - Two guard writers (F4).
  - Two definitions of what the validation measures (F7).
- **Stale description:** several entries in `DECISIONS.md`, and the handoff lines in `guards-integrator`, still
  describe `entropy-assessment` as generating guards. The later decision at `DECISIONS.md:18` changed its role to
  "triage and routing" (F6, F13). Only what that decision plainly covers is corrected.
- **Prose control:** the guard run is "non-negotiable" but nothing checks that it ran. "Run periodically" has no
  trigger (F9).
- **Unauthorised drift:** none found. The evidence is limited, because there is no commit history.

### Guard repair instructions, read against the intent-change rule
- **Intent path:** `skills/local/entropy-guard/SKILL.md:68` says "if INTENT.md itself needs revision, update it with
  a dated note explaining what prompted the change." That treats the session's work as permission to change
  authorised intent. The same path is in `AGENTS.md:27`, "update INTENT.md and note why", and in `INTENT.md:3` and
  `:139` (F2).
- **Ownership:** `skills/local/entropy-guard/SKILL.md:88` says "Did you change something that another doc also
  describes? If so, update both." That keeps parallel definitions in step. `:99` ("Update if not") applies to the
  README and AGENTS.md structure lists, which are summaries, so keeping them correct is right (F3).

### Questions and proposed changes
Q1 to Q4 are in `questions.md`. The settled patch records Q2 to Q4 as proposals awaiting the steward at the top of
`DECISIONS.md`, and lists all four in `TODO.md` "Current state".

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** Evidence:
  - `README.md:5` says "actively used, actively refined", and `README.md:119` says "Actively evolving".
  - `TODO.md:11-20` holds open Next Up and Backlog items.
  - The newest skill metadata is dated 2026-05-11.
- **Shape: A, docs-first planning.** Evidence:
  - The repo is markdown only. Its four non-markdown files are `LICENSE`, `.gitignore`, `.editorconfig` and a 9-line
    reminder hook.
  - It says so itself: "markdown-first and workflow-focused; there is no application runtime" (`AGENTS.md:31`).
  - The skills are the product.
  - `TODO.md`, `DECISIONS.md`, `LEARNINGS.md` and `AGENTS.md` carry state across repeated human and agent sessions.
- **Shape D, workflow-heavy, also fits.** The repo exports a way of working, and its own guard ritual is part of the
  product (`DECISIONS.md:57`, `README.md:97`). A is the riskier shape: the most damaging drift is between documents and
  between skills (F2, F4, F6, F7), and A's risk matrix already covers workflow drift.
- **Repositories: one.**
  - The sibling `../entropy-immune-system` is a separate inquiry (`DECISIONS.md:26-27`), not a member of this system.
    It was not read.
  - The GitHub issue tracker is an input surface (`DECISIONS.md:17` cites #9 to #12, and the feedback skill files
    issues there). It was not read, because the web was out of scope for this run.

---

## 3. Findings

Each finding has an id, its evidence and its source. Other sections refer to these ids.

| Id | Finding | Evidence | Condition / risk |
|---|---|---|---|
| F1 | No file names the steward. All 17 `DECISIONS.md` entries and the `INTENT.md` revision note are unattributed, and every decision is undated. Precedence between decisions rests on "above/below" wording in a file whose order is mixed. | `DECISIONS.md:7-143`; `INTENT.md:5`; `LICENSE:3` | Missing |
| F2 | Any contributor, human or agent, is invited to edit the north star when work "refines or challenges" it. That conflicts with the intent-change rule every generated guard must carry. | `INTENT.md:3`, `:139`; `AGENTS.md:27`; guard `:68` | Conflict; a path for unauthorised drift |
| F3 | The guard's repair "If so, update both" keeps two definitions in step instead of choosing an owner. The README and AGENTS.md structure lists are summaries and are fine; the next-validation plan (F7) is a real parallel definition. | guard `:88`, `:99`; `README.md:82-115`; `AGENTS.md:36-47` | Ownership |
| F4 | Two exported skills write guards, with different templates: `docs-first-planning-assessment` Phase 2 (`SKILL.md:132-202`) and `session-coherence-skill-generator` (`SKILL.md:198-315`). Each is backed by a recorded decision (`DECISIONS.md:18`, `:10`), and neither decision reconciles them. `INTENT.md:88` gives the generator role to the assessment workflow only. | as cited | Conflict; parallel truth |
| F5 | `session-coherence-skill-generator` is reached by no route: no other skill names it. A search for `session-coherence` hits only `README.md:91`, `AGENTS.md:46`, `DECISIONS.md:9-10` and the skill itself. Its bootstrap mode for young repos (`DECISIONS.md:10`) therefore cannot be reached from the front door, which has no young-repo shape (`skills/entropy-assessment/SKILL.md:38-64`). It also carries residue from another project: "FlowBook" (`:22`, `:193`), and a metadata format unlike the other skills' (`:4-13`). | as cited | Parallel truth; leftover imported material |
| F6 | Four decisions describe `entropy-assessment` Phase 2, its domain appendices, or its Steps 5 to 8. The current `entropy-assessment` (v0.6.0) has Steps 1 to 4, no Phase 2 and no appendices. The later decision at `DECISIONS.md:18` made it "triage and routing". The four entries are not marked: only "Consolidate…" is (`:131`). `LEARNINGS.md:33`, `:93` and `:112` cite the old step numbers. | `DECISIONS.md:39-43`, `:47-51`, `:95-99`, `:113-117`; `skills/entropy-assessment/SKILL.md:30-126` | Stale description; superseded material nearby |
| F7 | The next validation loop is stated in full in three places, and a fourth disagrees. `DECISIONS.md:26` says to assess "open source projects" and track "more merged PRs". `INTENT.md:131-135` and `README.md:125` say to assess docs-first planning repos and track session recovery and reintroduced stale ideas. `TODO.md:11-13` holds the tasks. | as cited | Conflict; parallel truth |
| F8 | The guard names `doc-health-check`, which does not exist (`TODO.md:20` tracks it), and a "README.md (Key Documents table)" that does not exist: the README has "What's here" tables. | guard `:33`, `:99`, `:137`; `README.md:82` | Stale references |
| F9 | `AGENTS.md:19` calls the guard run "non-negotiable", and `AGENTS.md:41` calls it a "mandatory pre-commit ritual". The only mechanism is `.githooks/pre-commit`, which prints a reminder and exits 0, and runs only if someone links it into `.git/hooks/` by hand (`README.md:140`). Nothing checks the commit-message note asked for in `README.md:138`. `INTENT.md:82` and guard `:139` say the guard should be re-evaluated periodically, and nothing triggers that. No document cites the hook as more than a reminder (`DECISIONS.md:34`, `README.md:78`). | as cited | Prose control |
| F10 | `explorations/` (4 files, 1,467 lines) is still here, although broader exploration "continues in the sibling repo", which was "seeded with the exploration documents" (`DECISIONS.md:26`). It is not listed in README "What's here" or AGENTS.md "Key Files". Three `LEARNINGS.md` entries are "validated by" a philosophical conversation (`:122`, `:132`, `:142`), against `LEARNINGS.md:3` ("what you validated, not just opinions"). | as cited | Superseded material nearby |
| F11 | Scaffolding residue from the seed template in a markdown-only repo: "Working code with tests" (`AGENTS.md:21`), "agree … with the code" (`AGENTS.md:24`), a Go section in `.gitignore:17-25`, and Python, Go and Makefile rules in `.editorconfig:11-18`. | as cited | Low; consistency |
| F12 | The guard predates the current guard contract. Its metadata says it was generated on 2026-03-19 and last evaluated on 2026-04-07 (guard `:19-21`). It has no baseline step, no modes or safety section, and no intent-change rule. It copies state that drifts, such as the skill counts in its system snapshot (`:20`). | guard `:18-22` | Workflow drift; reason for `update` |
| F13 | `guards-integrator` says it runs "After `entropy-assessment` generates one or more guards" (`:20`) and tells readers to use `entropy-assessment` "to decide what guards are needed" (`:227`). Since `DECISIONS.md:18`, `entropy-assessment` routes rather than generates. | as cited | Stale description |
| F14 | `TODO.md` has no current-state summary: no stage, no documents to trust first, and no open questions. "Doing Now" is empty, as it should be between sessions. | `TODO.md:1-20` | State honesty |
| F15 | Claims of everything of a kind: "no application runtime" (`AGENTS.md:31`), "No build, test, or runtime commands" (`AGENTS.md:51`) and "no application code/tests/API" (guard `:20`). The search below is consistent with them. The system does reach GitHub, through `gh` in the feedback skill, and git launches the hook. No document lists that reach, and none claims it is the only reach. | search record below | Consistent, with the search recorded |

### Search record for F15
The searches ran on 2026-10-07 with ripgrep 14.1.1 over the whole snapshot, hidden files included.

| Pattern | Paths | Hits, with the process that runs each one |
|---|---|---|
| Network: `\bgh (issue\|pr\|api\|repo\|auth)\b`, `\bcurl\b`, `\bwget\b`, `\bfetch\(`, `\bgit (push\|fetch\|pull\|clone)\b`, `https?://` | all files except `LICENSE` | `skills/local/entropy-guard-feedback/SKILL.md:46` (`gh issue create`) and `:77` (`gh issue list`): run by an agent following the feedback skill. They reach GitHub with `gh`'s stored login and write live issues. The other hits are plain URLs in prose (`AGENTS.md:68`, `DECISIONS.md:81`, `:142`, the feedback skill `:10`, `:53`). |
| Launch: `npx\|pnpm\|npm\|node\|python3?\|docker\|playwright\|puppeteer\|chromium\|bash -c\|sh -c\|exec\|spawn\|subprocess` | all files | none |
| Credentials: `token\|secret\|password\|api key\|credential\|GH_TOKEN\|GITHUB_TOKEN\|auth…`, and `\.env` | all files | `.gitignore:6-8` ignores `.env*`; the feedback skill `:53` ("not authenticated", meaning `gh`'s own login); the generator `:322` (a rule not to read secrets). No file reads a credential. |
| Executables: `find -perm -u+x`, plus shebangs | all files | `.githooks/pre-commit`, a `#!/bin/sh` script run by git at pre-commit if enabled. It writes only to stderr (`:3-7`). |
| Shell code blocks: ` ```bash`, `sh` and similar | all `*.md` | `skills/session-coherence-skill-generator/SKILL.md:305`, a template placeholder; the feedback skill `:45`, an indented block holding the `gh` call above. |

---

## 4. Truth map (docs-first Step 2)

| Concept | Canonical home | Other places, and their role |
|---|---|---|
| Purpose and scope | `INTENT.md` | `README.md:3-7` and `:119-123`, and `AGENTS.md:3` and `:34`: summaries. `DECISIONS.md:26` and `:18`: the decisions behind it. |
| Entropy dimensions, enforcement depth, guard lifecycle | `INTENT.md:21-109` | The skills restate depth for their own use (product artifacts; versioned copies are fine). `README.md:70-74`: links. |
| Who writes guards | **No single owner (F4).** | `docs-first-planning-assessment` Phase 2; `session-coherence-skill-generator`; `INTENT.md:88`; `README.md:89-91`. |
| Next validation loop and its measure | **No single owner (F7).** | `INTENT.md:129-135`; `README.md:125`; `DECISIONS.md:26` (disagrees); `TODO.md:11-13` (the tasks). |
| Skill catalogue | each skill's `SKILL.md` frontmatter | README "What's here" and AGENTS.md "Key Files": summaries, to be kept correct. |
| Working practices | `AGENTS.md` "Working Practices" | README "Contributing": summary. `.githooks/pre-commit`: reminder text. Guard check 4: verification. |
| Current state | `TODO.md` | README "Project status": partly restates it. The settled patch adds a "Current state" section. |
| Decisions | `DECISIONS.md` | none |
| Learnings | `LEARNINGS.md` | `PHILOSOPHY.md`: free-form reflections, by `DECISIONS.md:142`. |
| Broader theory | sibling `entropy-immune-system` | `explorations/`: historical (F10). |

**Roles of the documents:**
- canonical: `INTENT.md`, `DECISIONS.md`, `AGENTS.md`;
- current state: `TODO.md`;
- product artifacts: everything under `skills/`;
- historical: `explorations/`;
- free space: `PHILOSOPHY.md`;
- summary: `README.md`.

## 5. Loop map (docs-first Step 3)

1. **Session start.** The agent reads `AGENTS.md`. On 2026-10-07 a fresh session with no context chose it first and
   found the guard instruction at `AGENTS.md:19`. Humans enter through README "Contributing" and then `TODO.md`.
2. **Active work.** It goes in `TODO.md` "Doing Now" (`AGENTS.md:22`).
3. **Upstream input.** GitHub issues, some labelled `agent-feedback` (feedback skill `:49`).
4. **Session end.** The local guard captures decisions and learnings into `DECISIONS.md` and `LEARNINGS.md`, then
   checks consistency.
5. **Handoff.** A commit whose message carries the entropy note (`README.md:138`). Pull requests sometimes happen
   (`LEARNINGS.md:152`). There is no CI, because there is no `.github/`.
6. **Real against documented.** This cannot be observed, because there is no history. Whether the hook is enabled is
   unknown.

## 6. Ranked risks (docs-first Step 4)

| # | Risk | Findings | Decay | Recovery cost | Anchor for the fix |
|---|---|---|---|---|---|
| 1 | Intent drift through a north star any session may edit, with no named steward | F1, F2 | slow | very high: `INTENT.md:33` calls intent entropy catastrophic to recover | the steward's recorded decision in `DECISIONS.md` |
| 2 | Parallel truth in the product: two guard writers, one of them unreachable, and stale handoffs between skills | F4, F5, F13 | medium: every skill edit | high: users of the product get conflicting guards | the answer to Q3, then `INTENT.md` "The guard lifecycle" |
| 3 | Superseded material nearby: Phase 2 and the appendices in decisions, and broader theory in explorations and learnings | F6, F10 | slow | medium: a session may bring back deleted structure | supersession markers in `DECISIONS.md`, and `TODO.md` "Current state" |
| 4 | Workflow drift and prose control: a guard run nobody can verify, an opt-in hook, a guard older than its contract, "update both" | F3, F9, F12 | fast | low if caught in one session | `AGENTS.md` "Working Practices" and the updated guard |
| 5 | Validation plan defined in several places | F7 | medium | medium: validation work measures the wrong thing | the answer to Q4 |

## 7. Recommendations (consolidate, demote, mark historical)

- **Consolidate (after Q3).** Make one skill the guard writer and have the other supply checks to it. Route young repos
  from `entropy-assessment` to the bootstrap mode. Reduce `INTENT.md:88` and `README.md:89-91` to match (F4, F5).
- **Consolidate (after Q4).** Make one statement of the validation loop and its measure. README keeps a link
  (provisional patch, F7).
- **Mark historical (settled).** Add partial-supersession markers on the four decisions in F6, and list
  `explorations/` as historical in README and AGENTS.md (F10).
- **Demote (recommendation only).** The three conversation-validated entries in `LEARNINGS.md` could move to the
  sibling repo or be labelled exploratory. That is not plainly settled by `DECISIONS.md:26`, because the
  just-in-time-generation entry (`LEARNINGS.md:117-123`) is about this repo's guard design. Left for the steward.
- **Low priority.** Trim the seed residue in F11 when `AGENTS.md` is next edited. Date new `DECISIONS.md` entries from
  now on (F1). Do not invent dates for the old ones.

## 8. One-time cleanup, each verified against the current file

Every edit in `patches/settled.patch` was applied by exact-string replacement. Each replacement asserted exactly one
match in the snapshot, and the patch then applied cleanly with `patch -p1 --dry-run`.

| Item | Findings | File | Verified |
|---|---|---|---|
| Partial-supersession markers | F6 | `DECISIONS.md` | headings at `:39`, `:47`, `:95`, `:113` |
| Proposals awaiting the steward | Q2, Q3, Q4 | `DECISIONS.md` | inserted above `:7` |
| `explorations/` listed as historical | F10 | `README.md` | after `:107` |
| `explorations/` listed as historical | F10 | `AGENTS.md` | after `:46` |
| Neutral handoff wording | F13 | `skills/guards-integrator/SKILL.md` | `:20`, `:227` |
| "FlowBook" residue removed | F5 | `skills/session-coherence-skill-generator/SKILL.md` | `:22-23`, `:193-194` |
| Stale references fixed in the current guard, so it is correct until the update is installed | F8 | `skills/local/entropy-guard/SKILL.md` | `:33`, `:99` |
| "Current state" section | F14 | `TODO.md` | added above `:5` |

## 9. State-file update (docs-first Step 5)

The settled patch adds a "Current state" section to `TODO.md`, the repo's existing state file. It is about 330 words
and holds:
- the stage;
- the documents to trust first;
- the settled decisions, each with its source;
- Q1 to Q4 with their recommended answers;
- the misleading material nearby;
- three next actions.

It says when it was checked (2026-10-07), what makes it stale, and who refreshes it: the session that changes a claim,
checked by the guard.

---

## 10. Guard inputs and decision (docs-first Step 7)

### Existing guard surfaces

| Surface | Verdict | Why |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | amend: update in place, keeping its name and path | sound checks, but it predates the contract and has F2, F3, F8 and F12. `AGENTS.md:19`, `:41`, `README.md:78`, `:137` and the hook all point at this path. |
| `.githooks/pre-commit` | keep | the reminder text is still accurate. Running the mechanical checks from it is a Next step in `integration.md`. |
| `AGENTS.md` "Working Practices" | amend | `:27` changes provisionally under Q2. Key Files gains `explorations/` (settled). |
| `TODO.md` | amend | "Current state" (settled). |
| `DECISIONS.md` | amend | markers and proposals (settled). |
| README "Contributing" | keep | — |

### Checks written against this repo's files
These are the ten checks in `guard/SKILL.md` "Checks". Each maps to the matrix:
- one owner per concept: F3, F4, F7;
- superseded material: F6, F10;
- stale references: F8, with a link check and an old-name search;
- lost decisions and learnings;
- state honesty: F14;
- workflow drift: F9, F12;
- brittle automation: only the stable invariants are scripted, namely relative links and frontmatter `name` against
  the folder.

### Guard decision: `update`
An existing guard serves a real repeated loop and needs amending (F2, F3, F8, F12).

### Generator inputs

| Input | Value |
|---|---|
| Steward | **unresolved (Q1)**; recommended answer: Justin Philpott |
| Documents holding authorised intent | `INTENT.md`; the scope decisions in `DECISIONS.md` (`:15-19`, `:23-27`). `README.md` "Project status" is a summary. |
| Decision surface | `DECISIONS.md` |
| Open intent questions | Q1 to Q4 (`questions.md`) |
| Current-state file, and who refreshes it | `TODO.md` "Current state"; refreshed by the session that changes a claim, and checked by the guard |
| Rules the repo is bound by but does not own | the agentskills.io SKILL.md format (`DECISIONS.md:79-83`); seed scaffolding (`AGENTS.md:66-68`). A user-wide instructions file may exist outside the repo; it was not readable in this run. |
| Verification commands | none in the repo (`AGENTS.md:49-58`). The guard adds a link check and a name check, both tested on the snapshot. None runs by itself: there is no CI, and the hook only prints. |
| Code areas, and the docs that describe them | `skills/*` is described by README "What's here", AGENTS.md "Key Files" and `INTENT.md` "The guard lifecycle". `.githooks/pre-commit` is described by `README.md:78`, `:114`, `:140` and `AGENTS.md:19`, `:40`. There are no tests. |
| Live operational state or spend | GitHub issues created through the feedback skill (F15). There is no spend. |
| Findings | F1 to F15 |

---

## 11. Generator output

- **Guard:** `guard/SKILL.md`. Install it by copying it over `skills/local/entropy-guard/SKILL.md`. It keeps the name
  `entropy-guard` and the path, so no reference breaks.
- **Waits for Q1 and Q2.** Its Intent section enforces the intent-change rule against the current directive in
  `INTENT.md:3`, and its steward pointer is unresolved. Do not install it until both are answered (see
  `integration.md`).
- **Size:** 1,126 words, against a budget of 1,180, so 54 words under. The current guard is 1,400 words. The budget
  terms are:
  - common contract: 724 (the generator's measurement of 2026-10-07);
  - checks: 8 repo-specific checks beyond the template's 2 standing ones, at 36 each, so 288;
  - pointers: 61 (the "Where things live" body, measured with `wc -w`);
  - commands: 107 (the "Checks" bash block, measured with `wc -w`).

  Four repo-specific lines outside those terms are counted inside the actual total: the scope line, the GitHub-issue
  safety line, the escalation line and the commit-message line.
- **Review before handover:**
  - It carries "Modes and safety".
  - It binds its baseline: `<start>`, or the remote default branch with "coverage incomplete".
  - No settled change touches Q1 to Q4.
  - Its repairs no longer carry "update INTENT.md" or "update both".
- **Validation:**
  - `git diff --no-index --check` printed no whitespace errors.
  - Both mechanical commands printed nothing on the snapshot, and caught a planted broken link and a planted name
    mismatch in a scratch copy.
- **Operator docs:** `AGENTS.md:19` and `:41` already document this guard at this path, so no change is needed.
- **Open questions it leaves visible:** "Steward: unresolved; see `TODO.md` 'Current state'".
- **Handoff:** to `guards-integrator`, in `integration.md`.

## 12. Questions for the steward
Q1 to Q4 are in `questions.md`.

## 13. Uncertainties

- **Enacted intent and the real loop.** There is no `.git`, so no commits, messages or hook configuration could be
  read. Whether `.githooks/pre-commit` is enabled anywhere is unknown.
- **Unread sources.** GitHub issues #9 to #12, the sibling repo, and any user-wide agent instructions were not read.
- **Decision order.** Decisions are undated (F1). The order "Farm" before "Specialize first" before "Session-coherence
  bootstrap" is inferred from the cross-references and the metadata dates.
- **How agents load instructions.** The fresh-session test was one session, of one agent type, choosing to read
  `AGENTS.md`. Agents that auto-load only `CLAUDE.md` have no file to load here; the snapshot has none.
- **Proposal entries.** Recording Q2 to Q4 as proposals in `DECISIONS.md` was put in the settled patch, on the reading
  that a proposal marked "awaiting the steward" states nothing as fact. `feedback.md` notes this choice.
