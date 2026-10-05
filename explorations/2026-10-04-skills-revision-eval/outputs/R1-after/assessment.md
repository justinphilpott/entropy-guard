# Entropy assessment: ORC and the orchestration-lab Scope, assessed as one system

Run on 2026-10-04 by following `skills/entropy-assessment/SKILL.md` (v0.7.0) and the skills it routes to.

**What was read, and when.** Read-only snapshots of two repositories, with no `.git` and no `node_modules`:

- **ORC**: a snapshot of `~/pro/orchestrator`, written below as `orchestrator/`.
- **The lab**: a snapshot of `~/scopes/scope-orchestration-lab`, written below as `lab/`. Its `STATE.md` header says
  "Updated 2026-10-04 17:31".

Nothing live was read. That covers `orc.service`, GitHub issues and PRs, the GitHub Project, ORC's database and git
history. Every statement below about a live service is a quotation from a snapshot file, with its line number. None
of them is a fresh reading. No test was run, because the snapshot has no `node_modules`.

**Route taken.** Front door, Step 1 (intent pass) → Step 2 (shape B, mixed docs and code, spanning two repositories)
→ Step 4 (profile) → Step 5 (hand to `session-coherence-skill-generator`, build mode, new guard) →
`guards-integrator`. The guard is in `guard/SKILL.md` and the integration brief in `integration.md`.

**Output provisional on the steward.** Everything that depends on questions Q1 to Q4 in `questions.md` is
provisional. No steward was available, so each question carries a recommended answer and this run continued on it.

---

## 1. Intent

### Steward

**Justin.** `lab/scope.yaml:6` says `steward: justin`. `lab/scope.yaml:35-37` makes him the only member, as `admin`.
Every steward decision found in either repository is attributed to him. ORC itself names no steward. Its
`AGENTS.md` quotes Justin directly ("Justin, 2026-09-13: …"), which serves the same purpose.

### Statements gathered

| Where | Kind | When | What it says |
|---|---|---|---|
| `lab/scope.yaml:5`, `lab/SCOPE.md:3-7` | description | — | The lab exists to develop and operate ORC and its reusable Scope-owned agents. |
| `lab/SCOPE.md:17-24`, `lab/AGENTS.md:12-23` | description | — | Facts about ORC belong in ORC's repository, facts about the Scope model in `~/pro/scope`, and facts about their relationship here. |
| `lab/STATE.md:8-11` | steward decision | 2026-09-25, 2026-09-26 | ORC is Justin's "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece". Once the six slots work, "work towards a point of consolidation". |
| `lab/STATE.md:17-19` | steward decision | 2026-09-25 | Claude merges a PR once review and tests pass. |
| `lab/STATE.md:33` | steward decision | 2026-10-04 | Moving Stillness is paused. |
| `lab/STATE.md:38-55` | steward decision | 2026-10-04, from an interview | The lab is the central Scope for project management, core issue tracking, code quality and security. Nine processes are kept, including "entropy guard at session end" and "tests on every PR (#144)". ORC scheduling (#166) is built first, and the scheduled processes run through it. Astra runs this assessment. |
| `lab/AGENTS.md:7-10`, `orchestrator/AGENTS.md:7-12` | steward decision | 2026-10-02 | orchestrator#140 is "the map of work", and the reference point for all work. |
| `lab/decisions/2026-09-17-async-work-architecture.md` | steward decision | 2026-09-17 | ORC owns a general async work capability, with schedules that run now, at a time, or recurring. Policy is declared per task type. |
| `lab/memory/authority-rules-step-1.md` | steward decision | 2026-10-01 | Authority rules 1, 2, 4 and 5 are affirmed. Rules 3 and 6 are open. |
| `orchestrator/AGENTS.md:30-45` | steward decision | 2026-09-12, 2026-09-13 | Core ships with no specific Scope, model, owner or agent: "There shouldn't be the tiniest hint of scope specific code inside the core." |
| `orchestrator/AGENTS.md:116-118` | steward decision | 2026-09-26 | Approval cards are structured, built from declared blocks. |
| `orchestrator/dangerfile.js:7`, `lab/STATE.md:79` | steward decision | 2026-10-02 | Security reviews are checked by Danger on GitHub. |
| `lab/AGENTS.md:25-29` | inference: unattributed, cites `~/pro/agentic/HOW_NOT_TO_PLAN.md` | — | Pace: one scored real use comes before new design work, and documentation is retrospective. |
| `lab/AGENTS.md:31-36` | inference: unattributed | — | `STATE.md` holds current state only, is overwritten and never appended, and is capped at about 40 content lines. |
| `orchestrator/README.md:9-23`, `:138-154` | description | — | ORC's direction and boundary, including a list of capabilities that are "deliberately absent". |
| `orchestrator/src/adapters/browser/playwright.ts:9-11` | description | 2026-10-03 | The browser runs on Playwright's library rather than MCP (orchestrator#76). The decision is not attributed to anyone. |

### Three readings

- **Declared.** The documents say ORC is a local-first personal agent platform. Iris is its front door. Agents are
  owned by Scopes. Core is free of any one Scope, and the boundaries are enforced in code. The lab manages this work.
- **Enacted.** In the two days before the snapshot (`lab/STATE.md:23-37`, `lab/FRICTION.md:20-75`), work went into:
  - resolve-before-acting for the browser (orchestrator #193/#200, Moving Stillness #53), then reviewed and merged;
  - a single package API version (#201), plus #199 and #195;
  - Danger's security-review check;
  - the issue map and a review of the labels.

  The next planned piece is ORC scheduling (#166).
- **Authorised.** The steward decisions in the table above. The enacted work fits them: browser hardening on the
  one real job, consolidating processes, and scheduling first.

### Gaps, by condition

**Stale description.** Correct each from the decision named, citing it. These are not questions. The patches are in
`proposed-corrections.md`, because the targets are read-only.

1. `orchestrator/README.md:152-154` lists scheduling as "deliberately absent".
   - **The decision it contradicts:** `lab/decisions/2026-09-17-async-work-architecture.md`, under which ORC owns async
     work with recurring schedules.
   - **What the code shows:** a `schedules` table in `src/adapters/async-store/sqlite.ts:41`, and recurrence in
     `src/app/async/calendar.ts`.
2. The ORC README still describes Bookwhen as part of core:
   - `orchestrator/README.md:4-7` lists the core's data paths as "published Bookwhen events, fixed Bookwhen admin
     inspection";
   - `:76-79` says to "Set `ORCHESTRATOR_BOOKWHEN_API_TOKEN` … `@jphil/bookwhen-client@0.6.1`";
   - `:145-147` describes the Moving Stillness specialist's Bookwhen reads.

   These contradict Justin's decisions of 2026-09-12 and 2026-09-13 (`orchestrator/AGENTS.md:33-37`). Three things
   in the code confirm the decision was carried out:
   - `test/architecture.test.ts:1315-1320` asserts there is no Bookwhen client and no Bookwhen implementation in ORC
     source;
   - no source, script or config file reads `ORCHESTRATOR_BOOKWHEN_API_TOKEN`;
   - `package.json` has no `@jphil/bookwhen-client`.
3. `orchestrator/AGENTS.md:102-103` says "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen
   client". That file does not exist. It is stale against the same decisions and the same test.

**Conflict.** Two sources disagree, and no recorded decision settles which wins.

1. **The cap on `STATE.md`.** `lab/AGENTS.md:34` caps it at "about forty content lines". `lab/STATE.md:4` says
   "Target: sixty lines". The file has 99 lines, 87 of them non-blank. → Q4.

**Missing.** Something the work depends on is stated nowhere.

1. **No durable home for steward decisions.** They are spread across:
   - `lab/decisions/`: one file, from 2026-09-17;
   - `lab/memory/`: the authority rules;
   - `lab/STATE.md:38-58`: the decisions of 3 and 4 October. That file is "overwritten at each verified event; do not
     append" (`lab/STATE.md:3-4`), so these decisions are one overwrite from being lost;
   - quotations in `orchestrator/AGENTS.md`;
   - the description of orchestrator#140;
   - `~/pro/local-config/home/AGENTS.md`.

   The guard's intent-change rule needs one decision surface to name. → Q1.
2. **"Entropy guard at session end" has nothing behind it** (`lab/STATE.md:49`). Neither repository has a guard: the
   lab's `skills/` holds only `.gitkeep`, and ORC has no `skills/`. Nothing records whose sessions it covers. → Q2.
   This run builds the guard.

**Ambiguous.** A statement admits readings that lead to different work.

1. **"Entropy guard at session end".** It could mean lab sessions only, or any session that changes ORC or the lab.
   - **Where the readings diverge:** a session that implements #195 in an ORC worktree and never touches the lab. Under
     the first reading, nothing checks whether `orchestrator/AGENTS.md` still describes the boundary that session
     changed.
   - → Q2.
2. **Where a decision about ORC belongs.** "Facts about ORC belong in its repository" (`lab/SCOPE.md:19`) sits beside
   ORC's architecture decision of 2026-09-17, which lives in `lab/decisions/`. An agent that starts from
   `orchestrator/AGENTS.md` ("The code supplies any further context") never reaches it. → folded into Q1.
3. **"Workflow execution"** in the README's list of what is deliberately absent (`orchestrator/README.md:153`).
   - **The two readings:** it may mean a general workflow engine, which is still absent. Or it may mean any executed
     task, which durable work now does.
   - **Effect:** the guard does not depend on it. The correction is flagged for Justin in `proposed-corrections.md`
     and not changed.

**Unauthorised drift.** Recorded as a proposal, not as an edit.

1. **The async decision's vocabulary has moved.**
   - **What the decision declares:** `idempotency: natural | keyed | none`
     (`lab/decisions/2026-09-17-async-work-architecture.md:47`).
   - **What ORC enacted instead:** `repeatEffect` and `submissionKey` (`orchestrator/FIXES.md:13`, commit `79a33ef`,
     which came from the adversarial review of 17 Sep).
   - **What covers the change:** no steward record.
   - **Proposal:** P3 in `proposed-decisions.md` adds a "superseded in part" note to the decision record. The record
     itself is not edited.

**Prose control.** A rule is written as if something enforces it, and nothing does.

1. **"Claude merges a PR once review and tests pass"** (`lab/STATE.md:17`).
   - **What actually checks a PR:** only Danger (`orchestrator/.github/workflows/danger.yml`). Tests are run by hand.
   - **Where it has already failed:** `lab/FRICTION.md:396-400` records ORC's end-to-end suite red on `main` for a week,
     unnoticed.
   - **Where enforcement belongs:** a test job on pull requests, which #144 already covers.
2. **ORC's boundary map.** `orchestrator/AGENTS.md:92-104` reads as enforced:
   - "Subprocess access exists in" three modules;
   - "Direct network access exists only in" `research-tools.ts` and `ntfy.ts`.

   The test it relies on (`test/architecture.test.ts:828-860`, `:1295-1317`) enforces four subprocess modules: it adds
   `src/adapters/orc-service.ts`. Since 3 Oct (#76), `src/adapters/browser/playwright.ts` also launches Chromium in
   ORC's own process (`chromium.launch`, line 55), and that browser reaches the hosts its grant approves. The test's
   patterns (`child_process`, `fetch`, `http`/`net` imports) do not catch a Playwright launch.

   This is not a known security hole: the browser has its own host grant (`connector.ts`, `insideHostGrant`). It is a
   stale boundary map, in a guarded file, that security reviews are answered from. The enforcement belongs in
   `test/architecture.test.ts`.
3. **The `STATE.md` cap and overwrite rule** (`lab/AGENTS.md:33-36`). Nothing checks either. The file is over both
   stated caps, and its "Next" section accumulates history.
4. **Danger's security-review check reports and warns, but does not block.** `orchestrator/SECURITY-REVIEW.md:52-55`
   says so honestly: "without GitHub Pro a failed check warns rather than blocks a merge", and direct pushes to `main`
   are not checked. It counts as a check that runs, not an enforced invariant.

### Questions for the steward

Four questions. They are written out in `questions.md`, each with its readings, a concrete case and a recommended
answer:

- Q1: where steward decisions live;
- Q2: where the guard lives and whose sessions it covers;
- Q3: what happens to ORC's branch reports at the repository root;
- Q4: the cap on `STATE.md`.

### Proposed intent changes

None that changes intent. P3 in `proposed-decisions.md` is a proposal about the vocabulary drift. Draft entries
recording the answers to Q1 to Q4, and moving the 4 October decisions out of `STATE.md`, are in the same file. They
are drafts for `lab/decisions/`, pending Q1.

---

## 2. System shape

- **Chosen shape: B, mixed docs and code, spanning two repositories.**
  - **ORC** is code-first: about 111 TypeScript source files under `src/`, 62 test files plus 8 web tests, and an E2E
    suite with 5 specs. It has a large documentation surface: `README.md`, `AGENTS.md`, `SECURITY-REVIEW.md`, and 12
    further reports at the repository root.
  - **The lab** is documentation-first and workflow-heavy:
    - its state and handoff files: `STATE.md`, `FRICTION.md` (1,402 lines), `AGENT_IDEAS.md`, 78 files in `reports/`,
      `decisions/` and `memory/`;
    - three Node tools that read ORC and GitHub: `tools/map.mjs`, `tools/report.mjs` and `tools/collect.mjs`.
- **The other shapes considered.**
  - **D (workflow-heavy)** fits the lab nearly as well: nine kept processes, a map of work, cards and hooks.
  - **A (docs-first)** fits the lab taken alone.

  The highest current risks sit between the two repositories, and between the documents and the code or live state,
  so B was chosen. B and D both route to Step 4, so the ambiguity does not change the route. The docs-first route was
  not taken, because the system is assessed as one. See `feedback.md` on what this cost.
- **Other repositories the system reaches.** None was read. ORC's issue map and the lab's tools also cover:
  - `scope-moving-stillness`;
  - `moving-stillness-bookwhen-ops`;
  - `scope`;
  - `scope-finance`;
  - `local-config`, which owns the cross-agent rules and the `push-summary` hook body.

## 3. Domain and ownership map

### Domains (Step 4a)

Each domain is present in the system, and each is actively changing.

| Domain | Where | How it is changing |
|---|---|---|
| Code | ORC's `src/` and `web/`; the lab's `tools/*.mjs` | Several merged PRs a day (`lab/STATE.md:23-37`) |
| Documentation | ORC's root `*.md`; the lab's `STATE.md`, `FRICTION.md`, `reports/` and `decisions/` | `STATE.md` is rewritten several times a day |
| Tests | ORC's vitest suite (970 tests, per `lab/STATE.md:30`, not re-run), its E2E suite (`pnpm test:e2e`), and the ratchets in `test/architecture.test.ts` and `test/core-ties.ts` | Grows with each PR. The lab has no tests |
| API and data contracts | The package API report `src/package-api.api.md`, guarded by a test and Danger; `ORC_PACKAGE_API_VERSION` in `src/core/agents/package.ts`; the SQLite schema at `user_version` 3; task-type declarations and approval-card templates | #201 changed these on 4 Oct |
| Workflow and process | The map of work (#140, `tools/map.mjs`, GitHub Project 4); Danger; pre-push hooks; restart and build cards; the STATE discipline; FRICTION; Astra reviews; the diary | Nine processes kept on 4 Oct |
| Live operational state | `orc.service` on athena (port 5173, tailnet URL); `dist/`; ORC's state directory; `~/.config/orchestrator/env`; the ntfy topic; approval grants with expiry; package build approvals; the Bookwhen login | Restarted four times on 4 Oct, per `lab/STATE.md:31-35` |

### Which repository owns which concept (Step 4b)

| Concept | Its home |
|---|---|
| What ORC does, and its boundaries | ORC: `README.md`, `AGENTS.md` and `test/architecture.test.ts`, which is the enforced one |
| Security review | ORC: `SECURITY-REVIEW.md`, and `dangerfile.js`, which enforces it |
| Package API | ORC: `src/package-api.ts`, `src/package-api.api.md` and `ORC_PACKAGE_API_VERSION` |
| Current state of all work | The lab's `STATE.md`. Who is working on what is in the GitHub Project |
| Open work | GitHub issues under #140, across six repositories |
| Cross-agent rules | `~/pro/local-config/home/AGENTS.md`, outside both repositories |
| The Scope model | `~/pro/scope/docs/MODEL.md`, outside both repositories |
| Steward decisions | Several homes; see the next table and Q1 |

### Concepts with two or more homes (Step 4b)

These are the costliest seams, because each side looks correct on its own.

| Concept | Its homes | Which should own it |
|---|---|---|
| ORC's boundary map: subprocess, network, Bookwhen | `test/architecture.test.ts`, the enforced one; prose in `orchestrator/AGENTS.md:92-104`; `orchestrator/README.md:1-7`, `:138-154`. The three disagree | The test. The prose should state only what the test enforces, and name the test |
| The list of guarded paths | `dangerfile.js` `GUARDED`, which has 14 patterns; `SECURITY-REVIEW.md:177-181`, which names a subset in prose; `test/architecture.test.ts:723-740`, which asserts 12 of the 14 and omits `^config\/` and `^AGENTS\.md$` | `dangerfile.js` |
| ORC's live state directory | `src/runtime.ts:190` defaults to `~/.local/share/orchestrator`; ORC's env file, which is not read here; the lab's `tools/collect.mjs:16`, which hardcodes `orchestrator-proof`; `lab/memory/slots-run-walkthrough.md:19`. `lab/FRICTION.md:360-366` records this confusion three times, and ORC #62 records the missing system | ORC's env file, reached through `scripts/orc-env.sh` |
| The durable-work schema | `orchestrator/src/adapters/async-store/sqlite.ts`, the owner, which "exclusively opens… migrates"; the lab's `tools/collect.mjs:123-140`, which queries `events` and `tasks` by column name and returns `null` silently on any failure | ORC. `pnpm list:async-work` already prints JSON lines |
| Steward decisions | Six homes, listed under "Missing" above | Q1 |
| Which ORC build is live | ORC itself (`pnpm service:status`, `build.json`); `lab/STATE.md` lines 31-35, 58 and 88, which contradict each other | ORC, read live, with the time of reading |
| Where work is now | The `**Where we are now:**` line in `lab/STATE.md:23`, parsed by `tools/map.mjs:182-191`; the GitHub Project's "In Progress" marks | Both are used. The line's format is now a contract |
| How issues are categorised | The map under #140; ORC's 17 labels. `lab/reports/2026-10-04-issue-map-overview.md:66-81` finds the labels stale | Already in hand: the labels review waits on Astra's revisions |

## 4. Top entropy risks

Ranked by decay rate times recovery cost. Line numbers refer to the snapshot.

### R1. The lab's `STATE.md` is not honest about the live system

- **Decay:** very fast. It is rewritten at each verified event, by several agents.
- **Cost of recovery:** high. It is the file every session reads first, so an error in it reaches Justin as a
  confident wrong answer about what is running.
- **Evidence now:**
  - It contradicts itself about which ORC build is live:
    - "ORC live: 369628b since 22:12:47" at `:58`, and again in "ORC: … started 2026-10-03 22:12:47 on `369628b`" at
      `:88`;
    - "#195 live (`8cee662`, restarted 14:48:27, verified)" at `:35`, after restarts at 13:36:37, 14:03:34 and 14:26:04;
    - the 11:41 power cut, after which ORC came back on 369628b (`:56`).
  - It contradicts itself about Moving Stillness: "`main` `c759f96` … both agents available" at `:91`, against "MS #53
    merged as `fc830aa`" at `:32` and "MS is paused" at `:33`.
  - It states an expired grant in the present tense: "Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z" at
    `:94`.
  - It has 99 lines against caps of 40 (`AGENTS.md`) and 60 (its own header).
  - The "Next" paragraph (`:23-37`) appends dated history, which its own rule forbids.
- **Evidence it has happened before:**
  - `FRICTION.md:866-869` (12 Sep): STATE described finished work as missing.
  - `FRICTION.md:621-626` (22 Sep): "STATE.md contained two false statements, both found by being asked a direct
    question".
- **What should anchor the fix:** `pnpm service:status`, read at the moment of writing; the rule in `lab/AGENTS.md`
  "Keeping state"; and the live-service rule in `~/pro/local-config/home/AGENTS.md`, which `lab/STATE.md:16` cites.

### R2. ORC's prose about its security boundary has drifted from what is enforced

- **Decay:** every change to what an agent can reach. That happened with #76 on 3 Oct, #193 and #201 on 4 Oct, and
  the Bookwhen move before them.
- **Cost of recovery:** medium to high. `SECURITY-REVIEW.md` question 2 ("Which legs does it add?") is answered from
  this map.
- **Concrete case:** a PR that adds a page action to `src/adapters/browser/playwright.ts`. Its reviewer reads
  "Direct network access exists only in `research-tools.ts` and `ntfy.ts`", and the test named "limits core network
  I/O to … Jina reads and ntfy notices". Both say the browser module reaches no network, and it does.
- **Evidence:** the stale-description and prose-control findings in the Intent section, plus three smaller ones:
  - `orchestrator/AGENTS.md:47` names the core-ties scan roots as `src/` and `web/src/`, but `test/core-ties.ts:8` also
    scans `config/`;
  - seven code paths named in ORC's root reports no longer exist (R5);
  - every TSDoc header carries a "Today:" line, which the architecture test requires but whose truth nothing checks.
- **What should anchor the fix:** `test/architecture.test.ts` as the enforced record, with the prose reduced to it.

### R3. Processes kept by decision that do not run

- **The decision:** Justin kept nine processes on 4 Oct (`lab/STATE.md:43-52`).
- **What runs by itself:** only Danger, on ORC's PRs.
- **What does not run:**
  - **Tests on every PR (#144):** not built, and `:69-70` shows the mechanism is still waiting on Justin. The cost of
    not having it: E2E red on `main` for a week (`FRICTION.md:396-400`).
  - **The daily diary:** `lab/README.md:22-24` says "One snapshot per day is kept in `reports/`". There are none for 3
    or 4 Oct, and none between 7 and 29 Sep. `tools/report.mjs:12-13` says it had already died once "because nothing
    ran it each day (orchestrator#64)".
  - **The entropy guard at session end:** none exists.
  - **The weekly review, the monthly FRICTION-to-rules pass (#60), and the cleanups (#70, #182):** these wait on
    scheduling (#166).
- **Decay:** steady; every merge goes in without CI tests.
- **Cost of recovery:** medium to high.
- **What should anchor the fix:** #144 and #166, which already exist, rather than a parallel project.

### R4. Steward decisions with no durable home

- **Decay:** each overwrite of `STATE.md` can drop one.
- **Cost of recovery:** high. A lost decision gets relitigated, and "do not reopen a recorded decision" cannot be
  honoured once the record is gone.
- **Evidence:**
  - The 3 and 4 October decisions exist only in `lab/STATE.md:38-58`.
  - `lab/decisions/` has had no entry since 17 Sep.
  - `lab/memory/authority-rules-step-1.md` holds steward decisions in a folder named for relationship facts.
- **What should anchor the fix:** Q1.

### R5. The lab's tools re-encode ORC's internals, and fail silently

- **Decay:** slow; schema and path changes are rare.
- **Cost of recovery:** medium. The diary shows wrong or empty numbers and says nothing.
- **Evidence:**
  - `tools/collect.mjs:16` hardcodes the state directory, and `:123-140` queries the schema directly. Its readers
    "return null … so one missing tool never takes the whole diary down" (`:1-4`).
  - `friction()` (`:150-161`) uses the regex `^## (\d{4}-\d{2}-\d{2})\s*[—-]`. Three headings fail it:
    `FRICTION.md:635`, `:665` and `:684` ("2026-09-21 night", "late" and "evening"). Their findings are silently
    counted under the section above.
  - `whereWeAre()` returns `null` if the phrase in `STATE.md` changes.
  - Related: ORC's root holds 7 one-off branch reports with superseded paths. These are `REWORK.md`, `SEAM.md`,
    `OPERATOR.md`, `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md` and `GRANTS-E2E.md`. Several begin "Branch
    `feat/async-work-capability` … Nothing is pushed". Between them they name `src/adapters/browser/service.ts`,
    `src/core/policies.ts` and `src/adapters/async-store/store.ts`, none of which exists. They sit beside `README.md`
    with nothing to mark them as history. `FRICTION.md:414-421` shows agents copying dead names out of prose.
- **What should anchor the fix:** ORC's operator commands as the supported read (`pnpm list:async-work`); a format
  check on FRICTION headings; Q3 for the root reports.

Noted, not ranked:

- **Labels against the map:** already in hand through the labels review.
- **`FRICTION.md` breaks its own "Newest first" rule:** the entries for 11-19 Sep sit at the bottom
  (`:1153-1402`). This is minor.
- **The lab README's timing:** "(~10s)" for a full `report.mjs` run. `report.mjs:10` says about two minutes, and ten
  seconds only with `--no-tests`.

## 5. Guard surfaces (Step 4d)

**Runs by itself**

- **Danger, on every ORC pull request** (`orchestrator/.github/workflows/danger.yml`, `dangerfile.js`). It requires a
  `## Security review` section when a guarded path changes, and a `## Package API` section when
  `src/package-api.api.md` changes. It is a check that runs, not an enforced invariant: it warns rather than blocks
  without GitHub Pro, and it does not see direct pushes to `main`.
- **ORC's own cards** for a restart and a package build. ORC raises them within a minute. They are operational
  controls, not coherence checks.
- **The pre-push hooks** in both repositories (`.githooks/pre-push`). They print `push-summary` and never block.
  Whether they are enabled could not be checked (no `.git`), so they are listed as unknown.

**Exists, but runs only by hand**

- **ORC's checks:**
  - `pnpm typecheck` and `pnpm test`, which include `test/architecture.test.ts`, the core-ties and
    cause-discard ratchets, the source-header test and the package API report test;
  - `pnpm test:e2e`, which vitest excludes;
  - `pnpm api:report`, `pnpm pi:check`, `pnpm codemap` and `pnpm service:status`.
- **The lab's tools:** `node tools/map.mjs --check`, and the diary `node tools/report.mjs`, which also runs both test
  suites.
- **Astra's adversarial reviews,** written into `lab/reports/`.

**Decided, not yet built**

- Tests on every PR (#144), waiting on Justin's choice of mechanism.
- ORC scheduling (#166). The diary, the weekly review, FRICTION into rules (#60), worktree cleanup (#70) and `/tmp`
  cleanup (#182) are to run through it.
- Tying operator commands to the running ORC's state directory (ORC #62; `FRICTION.md:360-366`).
- The type-label proposal, waiting on Astra's revisions.

**Declared, but missing**

- **The entropy guard at session end** (`lab/STATE.md:49`). This run builds it.
- **The daily diary as a daily habit.** `lab/README.md:22` says a snapshot is kept each day. The tool exists, but
  nothing runs it daily.
- **The `STATE.md` cap and its overwrite rule** (`lab/AGENTS.md:33-36`). Nothing checks either.

## 6. Mechanical checks that belong to tools (Step 4e)

- **lychee,** for markdown links in both repositories. The lab's reports link to ORC paths, and ORC's root reports
  link to lab reports.
- **ast-grep, or a small vitest test in ORC,** for code identifiers and paths named in prose. This is the same idea as
  scope-moving-stillness#25 for tool names. Seven dead paths exist today.
- **ctxlint or agnix,** for the two `AGENTS.md` files.
- **ORC's own tests:**
  - extend `test/architecture.test.ts` so that `from "playwright"` and `chromium.launch` are allowed only in
    `src/adapters/browser/playwright.ts`, and the boundary prose can name that test;
  - add `^config\/` and `^AGENTS\.md$` to the guarded-path assertion.
- **The lab's tools:** have `tools/map.mjs --check`, or the diary, fail loudly on these:
  - a missing `**Where we are now:**` line;
  - an unparseable FRICTION heading;
  - an unreadable ORC database;

  and stop returning `null` in silence.
- **Tests on PRs:** through #144, not through the guard.

## 7. Recommended next step

Hand to `session-coherence-skill-generator` in build mode, to build one new guard. This was done:
`guard/SKILL.md`, with the generator's report in `generator-report.md`. `guards-integrator` placed it:
`integration.md`. The one-time corrections the guard should not have to carry every session are listed separately,
in `proposed-corrections.md` and `proposed-decisions.md`. They are:

- the stale ORC docs;
- the contradictions in `STATE.md`;
- the decisions held in `STATE.md`.

## 8. Uncertainties

- Nothing live was read: ORC's running build, GitHub issues, PR states, the Project, or whether the hooks are enabled.
- Tests were not run, and the guard's commands were not executed. Its paths were checked against the snapshot, and
  its commands come from `package.json` and the tools' own usage lines.
- The live value of ORC's state directory comes from lab files only. ORC's env file was not read, by rule.
- `~/pro/local-config/home/AGENTS.md`, `HOW_NOT_TO_PLAN.md`, the description of #140, and the Scope model were not
  readable. The guard links to them and does not restate them.
- Whether lab work happens on branches or directly on `main` is not visible.
- Moving Stillness, the ops tool, scope and finance are outside this assessment, although the map spans them. Paired
  changes, such as ORC #200 with MS #53, are seen only from ORC's side.

## 9. Handoff to the generator

These were handed to the generator:

- the Intent section (§1);
- the profile (§§2, 3, 5 and 6);
- the ranked risks (§4).

The generator was asked for a new guard, because none exists. The ranked risks map onto the guard's checks like
this:

| Risk | Checks in the guard |
|---|---|
| R1 | State honesty |
| R2 | ORC docs against the code |
| R3 | Workflow |
| R4 | Intent, and decision capture |
| R5 | Cross-repo seams |
