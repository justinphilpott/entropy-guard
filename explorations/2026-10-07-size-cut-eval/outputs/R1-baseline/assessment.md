# Entropy assessment: ORC and the orchestration-lab Scope

Assessed 2026-10-07 by an agent following entropy-guard's `entropy-assessment` (v0.7.0) route, from read-only
snapshots of the two repositories taken on 2026-10-04 (no `.git`, no live services, no GitHub):

- **ORC**, `orchestrator/` (checked out on the steward's machine at `~/pro/orchestrator`): a TypeScript orchestration
  system, 117 source files, 71 test files, 15 Markdown files at its root.
- **The lab**, `scope-orchestration-lab/` (at `~/scopes/scope-orchestration-lab`): the Scope that manages ORC's work.
  Markdown state, decisions, memory, reports and a friction log, plus three small Node tools.

Route taken: **shape B (mixed docs and code), one system across two repositories.** Step 4's profile for the whole
system, plus docs-first Steps 2, 3 and 5 for the lab, which is a docs-first member. Then the guard generator (build
mode, written to this output folder only) and the guards integrator.

Every claim below names its file and line in the snapshot. Nothing about live services was read; any live fact is
quoted from a file, with that file's own time, and labelled as recorded.

---

## Findings

One list. The sections after it refer to findings by id.

| Id | Finding | Evidence |
|---|---|---|
| F1 | The lab's `STATE.md` is 99 lines, 87 of them non-blank. The lab's `AGENTS.md` caps it at "about forty content lines"; `STATE.md`'s own header says "Target: sixty lines". It has overrun before: 118 lines on 13 Sep, 405 on 23 Sep. | lab `AGENTS.md:33-36`; lab `STATE.md:3-4`; `FRICTION.md:1222`, `:536-540` |
| F2 | `STATE.md` contradicts itself on live facts. The running ORC build is `8cee662`, restarted 14:48:27 on 4 Oct (`:35`), and also `369628b` since 22:12:47 (`:58`, `:88`). Moving Stillness `main` is `fc830aa` (`:32`) and also `c759f96` (`:91`). Standing grant `e9675bd9` "covers the test entry until 1 Oct 18:00Z" (`:94`), stated in the present three days after it ended. The same file was found wrong twice before. | lab `STATE.md` lines cited; `FRICTION.md:621-626` (22 Sep), `:866-869` (12 Sep) |
| F3 | Justin's decisions live only in `STATE.md`, which `AGENTS.md` says is overwritten at each verified event: the 4 Oct interview (the lab's role, where issues live, the nine processes kept, #166 first, this assessment), three 3 Oct decisions, the north star (25 and 26 Sep), and the merge rule (25 Sep). The lab's `decisions/` folder holds one file, from 17 Sep, and no entry document mentions it. | lab `STATE.md:8-11`, `:17`, `:38-58`; `decisions/` listing; `grep decisions/` over `AGENTS.md`, `SCOPE.md`, `README.md`, `STATE.md` finds nothing |
| F4 | The one formal record of a decision about ORC's architecture sits in the lab (`decisions/2026-09-17-async-work-architecture.md`), while the lab's `SCOPE.md` says facts about ORC belong in ORC's repository. ORC has no decision log; its standing rules carry Justin's dated words inline in `AGENTS.md`. | lab `SCOPE.md:19-21`; ORC `AGENTS.md:33-37`, `:117` |
| F5 | ORC's `AGENTS.md` says "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client". The file does not exist, and ORC's architecture test asserts that no Bookwhen client is a dependency and no Bookwhen implementation is in ORC's source. | ORC `AGENTS.md:102-103`; `test/architecture.test.ts:1295-1321` |
| F6 | ORC's `AGENTS.md` lists three modules with subprocess access. The architecture test permits four, adding `src/adapters/orc-service.ts` (#101), which the restart-card instruction in the same `AGENTS.md` relies on. | ORC `AGENTS.md:92-96`, `:136`; `test/architecture.test.ts:822-835`; `src/adapters/orc-service.ts:1-7` |
| F7 | ORC's `README.md` is stale against recorded decisions and enforced tests: Bookwhen as ORC's own data paths (`:5-7`); `ORCHESTRATOR_BOOKWHEN_API_TOKEN` through `@jphil/bookwhen-client@0.6.1` (`:76-79`), which the test forbids as a dependency; the Moving Stillness agent plans "without applying it" (`:146-147`), though the apply runs as approved durable work; "scheduling" deliberately absent (`:152-154`), though Justin decided on 17 Sep that ORC owns async work including schedules, and recurring schedules are built. Reported on 1 Oct as review item 7, "small cleanups, on your word"; unchanged on 4 Oct. | ORC `README.md` lines cited; lab `decisions/2026-09-17-async-work-architecture.md:19-30`; ORC `src/core/async/types.ts:64-72`; lab `reports/2026-10-01-review-synthesis.md:43-44`, `:95` |
| F8 | The core-ties ratchet is described as one-way ("a count may only fall"), but the Scope-tie allowance for `config/installation.ts` rose 28 → 51 → 64 → 70 between 28 Sep and 2 Oct, each rise explained in a comment that points at #152. The test enforces exact counts, not direction. No recorded decision of Justin's permits a rise. | ORC `AGENTS.md:47-48`; `test/core-ties.ts:6-7`, `:41-48`; `test/architecture.test.ts:566-568` |
| F9 | Nothing runs the tests automatically. ORC's only workflow, `danger.yml`, runs Danger. The merge rule ("Claude merges a PR once review and tests pass", Justin, 25 Sep) rests on agents running suites by hand. ORC's end-to-end suite was red on `main` for a week in September without anyone noticing. Justin kept "tests on every PR (#144)" on 4 Oct; the mechanism is still his to choose. | ORC `.github/workflows/danger.yml`; lab `STATE.md:17`, `:45`, `:69-70`; `FRICTION.md:396-400` |
| F10 | "Entropy guard at session end" is one of the processes Justin kept on 4 Oct. Neither repository contains a guard: the lab's `skills/` holds only `.gitkeep`, and ORC has none. | lab `STATE.md:49`; lab `skills/` listing |
| F11 | The scheduled processes Justin kept on 4 Oct (daily diary, weekly adversarial review, monthly FRICTION into rules #60, branch cleanup #70, `/tmp` cleanup #182) have no scheduler yet; #166 is to be built first. The daily diary calls itself "the nightly job", but its snapshots stop at 2 Oct and skip 8 to 28 Sep. | lab `STATE.md:43-53`; `tools/report.mjs:56`; `reports/*.json` listing |
| F12 | The lab's diary collector reads ORC's internals directly and fails silently. It runs SQL against ORC's `tasks` and `events` tables, hard-codes the state directory `~/.local/share/orchestrator-proof` (ORC's default is `~/.local/share/orchestrator`), and reads agent front matter from ORC's `src/core/*.md`. Every reader returns null on failure. The columns match today. The diary's predecessor stopped for three weeks because its readers pointed at ORC paths that had moved. | lab `tools/collect.mjs:1-7`, `:16`, `:123-146`, `:164-189`; ORC `src/runtime.ts:190`; ORC `src/adapters/async-store/sqlite.ts:52-79`; `FRICTION.md:323` (28 Sep) |
| F13 | ORC's root holds eight branch-session reports beside its living documents, and nothing says which is which. `REWORK.md` says "Nothing committed, nothing pushed" and records 667 tests; `SEAM.md` 690; `OPERATOR.md` 716; ORC had 970 on 4 Oct. The other five are `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`, `GRANTS-E2E.md` and `CLASSIFY.md`. Seven code paths named in ORC's root documents no longer exist. Stale material has been copied into new work before. | ORC root listing; `REWORK.md:3`, `:21`; path check below; `FRICTION.md:1288-1293` (17 Sep), `:414-421` (27 Sep) |
| F14 | The lab's `reports/` holds 78 files from 31 days, 13 of them from 1 Oct. One of them, `reports/2026-09-17-async-review-critical.md`, is an 832 KB raw agent transcript (126 JSON lines), not a report. "Write fewer reports" was proposed on 25 Sep, not decided. | `reports/` listing; `reports/2026-09-25-direction-review.md:183` |
| F15 | The lab's pace rule says `HOW_NOT_TO_PLAN.md` governs: "one scored real use must come first". On 21 Sep Justin relaxed proof-first restraint to "what is naturally needed given where we are and what's likely coming next". The lab's `AGENTS.md` was not updated. | lab `AGENTS.md:27-29`; `reports/2026-09-22-pushback-analysis.md:126-134` |
| F16 | `FRICTION.md` says "Newest first", but its last eight sections (11 to 19 Sep) run oldest first, after 3 Sep. | `FRICTION.md:3`, `:1153-1402` |
| F17 | The lab's README says the diary with tests takes "~10s". The tool itself says ten seconds is the `--no-tests` time, and the full run takes about two minutes. | lab `README.md:16`; `tools/report.mjs:10` |
| F18 | `AGENT_IDEAS.md` lists the invoice agent and the goal tree tool as ideas, with no status. Invoicing runs through ORC, and the map of work (#140) is built. | `AGENT_IDEAS.md:37`, `:212`; lab `STATE.md:72` |
| F19 | Labels and the map are two ways of sorting the same issues. 32 issues carry `needs-a-goal`, though every issue now sits on the map, and 34 of ORC's 113 open issues have no label. Already owned: the type-label proposal waits on Astra's revisions. | lab `reports/2026-10-04-issue-map-overview.md:66-81`; lab `STATE.md:55` |
| F20 | Both repositories commit a non-blocking `.githooks/pre-push` that prints a summary from a script in `local-config`. The snapshot cannot show whether either is enabled. A Moving Stillness hook once went unrun for this reason. | both `.githooks/pre-push`; `FRICTION.md:541-544` |
| F21 | ORC's pull-request template prompts for `## Security review` only. Danger also fails a pull request that changes the package API report without a `## Package API` section. | ORC `.github/pull_request_template.md`; `dangerfile.js:50-57` |
| F22 | The lab's `memory/slots-run-walkthrough.md` names `src/adapters/browser/service.ts` and `mcp.ts`, both removed when ORC moved its browser onto Playwright's library on 3 Oct. As a dated trace of 28 Sep it is still correct, but it pins no commit. | `memory/slots-run-walkthrough.md:35`; ORC `MCP.md:3-5` |
| F23 | The steward is named: `steward: justin` in the lab's `scope.yaml`, whose project `orchestrator` is ORC. ORC's own repository names no steward, but every rule in it quotes Justin's dated words. Settled by evidence. | lab `scope.yaml:6`, `:11-20` |

**Path check behind F13 and F5.** This counted the backticked repository paths in each document and checked that
each exists. Run on 7 Oct, on the snapshot:

- ORC `AGENTS.md` names `src/bookwhen.ts`, which does not exist.
- ORC `MCP.md`: `src/core/ports/browser.ts` and `test/browser-service.test.ts`.
- ORC `POLICY-STORE.md`: `src/core/policies.ts`. The module is now `src/core/agents/policies.ts`.
- ORC `REWORK.md`: `src/adapters/async-store/store.ts` and `test/async-store.test.ts`.
- ORC `CLASSIFY.md`, `GRANTS.md` and `SLICE1.md`: `src/adapters/browser/service.ts`, and in `CLASSIFY.md` also
  `mcp.ts`.
- ORC `README.md`, `SECURITY-REVIEW.md`, `TURN-RECORD.md` and `VISIBILITY.md`: every path exists.

---

## Intent

Produced by the intent pass (`intent-pass.md`).

**Steward:** Justin (F23).

**Authorised intent, in short.** Each item is Justin's recorded decision unless marked otherwise.

- **ORC's purpose.** ORC is his ChatGPT replacement, daily tool, agentic development test ground and eventual work
  showpiece (Justin, 25 Sep). Once the six slots work, the aim is "a point of consolidation" (Justin, 26 Sep). Both are
  recorded only in lab `STATE.md:8-11`, an overwritten file (F3). Described, not decided, in ORC `README.md:9-23`:
  Iris is the front door, ADA creates agents, and every agent belongs to a Scope.
- **Core ships with no specific Scope, model, owner or agent** (Justin, 12 and 13 Sep; ORC `AGENTS.md:30-37`).
- **Boundaries are enforced, never prompted** (ORC `AGENTS.md:16-18`, `:68-80`; a standing directive, undated). This
  covers the lethal trifecta, and approval asked for in a prompt is not a control.
- **Durable async work is part of ORC** (Justin, 17 Sep; lab `decisions/2026-09-17-async-work-architecture.md`).
  - Delivery is declared per task type.
  - Each agent's facade lives in its Scope's package.
  - Schedules are included.
- **The map of work, orchestrator#140, is the reference point for all work** (Justin, 2 Oct; both repositories'
  `AGENTS.md`).
- **Danger checks security-review sections on GitHub** (Justin, 2 Oct, "B"; ORC `dangerfile.js:7`).
- **Claude merges a pull request once review and tests pass** (Justin, 25 Sep; lab `STATE.md:17` only).
- **Decided in the 4 Oct interview** (lab `STATE.md:38-55` only):
  - The lab is the central Scope for project management, core issue tracking, code quality and security.
  - Nine processes are kept, and scheduling (#166) is built first.
  - Astra runs entropy-guard's assessment on ORC and the lab together.
- **Pace** is contested (F15), between lab `AGENTS.md:27-29` (undated) and Justin's statement of 21 Sep.

**Declared, enacted, authorised.** The work recorded in the snapshot's last week fits the authorised intent. It
covers security hardening and moving domain work into Scope packages:

- resolve-before-acting, #193;
- ORC driving the browser itself, #76 and #197;
- one package API version, #201;
- availability logging, #199;
- the invoicing agent, the map, and Danger.

The gaps are in the descriptions and in the controls, not in the direction.

**Gaps, grouped by condition:**

- **Stale description** (corrected from a recorded decision; ask nothing):
  - F5 and F7. Bookwhen is out of ORC's core under Justin's rule of 12 and 13 Sep, and the architecture test enforces
    it.
  - F7. Scheduling was decided on 17 Sep.
  - F6. The fourth subprocess module serves the restart card that ORC's own `AGENTS.md:136` instructs agents to use.
  - The corrections are drafted in `patches/orc-readme-agents.patch`. `AGENTS.md` is a guarded path, so its pull
    request needs a `## Security review` section, such as "No new authority; documentation corrected to match
    enforced boundaries".
- **Conflict:**
  - F1, the state-file cap: 40 lines in `AGENTS.md` against 60 in `STATE.md`'s header. Settled by the system's own
    precedence: the instruction file, which Claude loads as `CLAUDE.md`, outranks a state file's description of
    itself. The proposed current-state update meets both numbers. Not asked.
  - F15, the pace rule. Not asked, because the guard does not check pace.
  - F4, where decisions about ORC live. Asked as **Q1**.
- **Missing:** the decision surface is named in no entry document (F3). Evidence settles it for the lab's own
  concerns: `decisions/` exists and already holds one of Justin's decisions. For ORC it is Q1.
- **Ambiguous:**
  - "Entropy guard at session end" (F10): which guard, for which repositories, run in whose sessions. Asked as **Q2**.
  - Whether ORC's root reports are living documents (F13). Asked as **Q4**.
- **Unauthorised drift:** F8. Rises in the core-ties allowances move away from the rule of 12 and 13 Sep, and no
  decision covers them. Recorded as a proposed intent change in **Q3**, not settled by editing anything.
- **Prose control.** Four rules are written as if something enforced them:

  | Rule | What cites it as a control | Where enforcement would sit |
  |---|---|---|
  | F1, the state-file cap | Nothing | A guard check now; a line count in the scheduled diary later |
  | F8, "may only fall" | ORC `AGENTS.md:47-48`, as the enforcement of the open-source rule | A Danger rule comparing `test/core-ties.ts` with the base branch |
  | F9, tests before merge | The merge rule, `STATE.md:17`, as its condition | #144 |
  | F10, the entropy guard | `STATE.md:49`, as a kept process | The guard in this output, and pointers to it in both `AGENTS.md` files |

**Questions for the steward:** four, in `questions.md`, each with a recommended answer.

**Proposed intent changes:** one, Q3's recommended answer: allowances may rise only in `config/installation.ts`, only
when installing a Scope agent, until #152. On Justin's answer it belongs in the lab's `decisions/` (or wherever Q1
puts ORC decisions), marked proposed until he decides. The snapshot is read-only, so it was recorded in
`questions.md` only.

**Decisions copied, not re-decided.** F3's decisions are drafted as two new files in the lab's `decisions/`
(`patches/lab-decisions.patch`), each keeping its source line and date, before `STATE.md` overwrites them. This
records existing decisions; it settles none of Q1 to Q4.

---

## Lifecycle status

**Both repositories are active.**

- `scope.yaml:7` and `:14` say `status: active`.
- `STATE.md` was updated on 4 Oct at 17:31.
- ORC's files are dated 4 Oct, and five ORC restarts are recorded on 4 Oct alone.

The lab's second project, `status-tracker`, is archived reference material (`scope.yaml:22-31`), and outside this
assessment.

## System shape

**Shape B, mixed docs and code, across two repositories assessed as one system.** It is close to D, workflow-heavy:
the process list, the map, Danger, the hooks and the review cadence are a large surface. B was chosen because the
costliest current risks sit between documents and code (F5 to F7), and between the lab's state and ORC's reality (F2,
F12). ORC on its own is code-first with a large document surface. The lab is docs-first, with three small tools.

## Domain and ownership map

**Domains (Step 4a):**

| Domain | Present, and actively changed? |
|---|---|
| Code | ORC: yes, daily. The lab: `tools/*.mjs`, rebuilt 29 Sep and given the map on 2 Oct. |
| Documentation | Both: yes, daily (`STATE.md`, `FRICTION.md`, reports, ORC's `AGENTS.md`). |
| Tests | ORC: 71 files, a Playwright end-to-end suite, 970 + 5 tests on 4 Oct. The lab's tools have no tests. |
| API and data contracts | ORC: the package API (`src/package-api.ts`, its API Extractor report, a test and a Danger rule), Scope package manifests, approval card templates, and the SQLite schema the lab reads (F12). Active: #201 on 4 Oct. |
| Workflow and process | Both: the map #140, Danger, hooks, the processes kept on 4 Oct, the instance-or-missing-system classification in FRICTION, and Astra reviews. Active. |
| Live operational state | `orc.service` on athena; the state directory; `~/.config/orchestrator/env`; Scope credentials; standing grants; the ntfy topic; the GitHub Project. Active, and not readable from the snapshot. |

**Ownership (Step 4b).**

- **Who owns what, by the lab's `SCOPE.md:17-24`:**
  - Facts about ORC belong in ORC.
  - Facts about the generic Scope model belong in `~/pro/scope`.
  - Facts about the relationship between them belong in the lab.
  - Open work belongs in GitHub issues under #140, in both repositories' `AGENTS.md`.
- **Concepts with two or more homes:**
  1. **Steward decisions** are spread across:
     - lab `STATE.md`, which is overwritten;
     - lab `decisions/`, which holds one file;
     - ORC `AGENTS.md`, inline;
     - the headers of `dangerfile.js` and `test/core-ties.ts`;
     - `memory/authority-rules-step-1.md`;
     - `FRICTION.md`;
     - GitHub issues.

     No concern has one home (F3, F4).
  2. **What ORC is running:** recorded in `STATE.md`, twice and differently (F2), against `pnpm service:status`, which
     is live.
  3. **ORC's boundary allow-lists:** described in ORC `AGENTS.md`, enforced in `test/architecture.test.ts` (F5, F6).
     `AGENTS.md` is the statement of intent and the test is the enforcement: two independent pieces of evidence,
     which should agree, not be merged.
  4. **ORC's durable-work schema and state directory:** defined in ORC's `sqlite.ts`, `runtime.ts` and the env file,
     and read again in the lab's `tools/collect.mjs` (F12).
  5. **Open work:** the issues under #140 own it. `STATE.md`'s "Next" and "Waiting on Justin" lists, the labels (F19)
     and `reports/2026-10-01-issue-tree.md` all copy parts of it.
  6. **Test counts:** `STATE.md`, the diary snapshots, and the root reports (F13).
  7. **The state-file cap:** `AGENTS.md` and `STATE.md`'s header (F1).

## Top entropy risks

Ranked by how fast each decays times what it costs to recover.

| Rank | Risk | Findings | Decay | Recovery cost | Anchor for the fix |
|---|---|---|---|---|---|
| 1 | **The lab's state file is not honest, and it holds decisions that overwriting will delete** | F1, F2, F3 | Daily: overwritten at every verified event, with five restarts on 4 Oct alone | High: confident wrong answers to Justin (22 Sep), and Justin's decisions lost on the next overwrite | `decisions/` for decisions; `pnpm service:status` for live facts; the cap in `AGENTS.md` |
| 2 | **Rules written as controls that nothing runs** | F8, F9, F10, F11 | Every merge | High: a red suite went unseen for a week; the open-source tie count rose two and a half times in four days while the check stayed green | #144, #166, #152, Q3 |
| 3 | **ORC's agent-facing boundary text disagrees with its enforced tests** | F5, F6, F7 | Every boundary change: two in September (the Bookwhen move on 28 Sep, the restart card in #101) | Medium to high: security reviews reason from `AGENTS.md`'s lists (`SECURITY-REVIEW.md` asks "which legs does it add?"), and a newcomer is told to set a token ORC no longer reads | `test/architecture.test.ts` says what is enforced; Justin's recorded decisions say what is authorised |
| 4 | **The lab's diary reads ORC's internals and fails silently** | F12 | Every refactor of ORC's store or state | Medium: the diary goes blank rather than raising an error; its predecessor stopped for three weeks | ORC's own operator commands, such as `pnpm list:async-work`, as the owner's surface for reading |
| 5 | **Superseded material sits beside live truth** | F13, F14, F22 | Slow | Medium: an agent copies a stale fact into a brief (17 Sep, 27 Sep) | ORC's living documents and the lab's `decisions/` |

## Guard surfaces (Step 4d)

**Runs by itself:**

- **Danger on GitHub.** It fails a pull request that touches a guarded path without `## Security review`, or changes
  the package API report without `## Package API`. Recorded as proven on GitHub on 2 Oct (`STATE.md:79-82`); not
  re-observed. An independent test keeps its guarded-path list honest (`test/architecture.test.ts:723`).
- **ORC's package-build and restart cards.** ORC raises them by itself, and Justin's click is required before a
  rebuilt package loads (ORC `AGENTS.md:134-136`).

**Exists, but runs only by hand:**

- **In ORC:**
  - `pnpm typecheck`;
  - `pnpm test`, which includes the architecture test: boundaries, core-ties, TSDoc headers, the cause-discard
    ratchet and the tool surface;
  - `pnpm test:e2e`;
  - `pnpm api:report` and its test;
  - `pnpm pi:check`;
  - the `SECURITY-REVIEW.md` checklist.
- **In the lab:**
  - `node tools/map.mjs --check`;
  - `node tools/report.mjs`, the diary;
  - FRICTION entries;
  - Astra reviews.

**Decided, not yet built:**

- tests on every pull request (#144);
- scheduling (#166), for the diary, the weekly review, FRICTION into rules (#60), branch cleanup (#70) and `/tmp`
  cleanup (#182);
- type labels and a label check (`reports/2026-10-04-labels-review-astra.md`);
- a test across ORC's and the packages' connector setting names (#198);
- packages tested against ORC's real parts (#202);
- Scopes loaded by card (#152), which would let the core-ties counts fall.

**Declared, but missing:**

- the session-end entropy guard (F10);
- the state-file cap (F1);
- "a count may only fall" (F8);
- "tests pass" as a merge condition (F9).

**Unknown:**

- whether either `pre-push` hook is enabled (F20);
- GitHub branch protection, and whether Danger is a required check;
- the rules in #140's description.

## Mechanical checks belong to tools (Step 4e)

These are recommended in place of hand checks:

- ORC's own suites, once #144 makes them run on every pull request.
- **lychee**, for links in both repositories' Markdown.
- **ast-grep**, or the path check above, for code paths and identifiers named in prose. It found F5 in one command.
- **agnix or ctxlint**, for both `AGENTS.md` files.
- **A Danger rule** for a rise in a core-ties allowance, once Q3 is answered.

---

## Docs-first steps for the lab (Steps 2, 3 and 5)

### Canonical truth map

| Concept | Canonical home | Other mentions, and their state |
|---|---|---|
| The lab's purpose and authority | `SCOPE.md`; `scope.yaml` (inventory, steward) | `README.md` summarises it; fine |
| ORC's direction | ORC `README.md` "Direction"; the north star from Justin's words | The north star sits only in `STATE.md` (F3) and should move to `decisions/` |
| ORC's rules and boundaries | ORC `AGENTS.md` (intent), `test/architecture.test.ts` and `test/core-ties.ts` (enforcement) | Disagreements in F5, F6 and F8 |
| Open work | GitHub issues under #140 | Partly copied into `STATE.md` lists; labels (F19); `reports/2026-10-01-issue-tree.md` is historical, superseded by #140 |
| Current state | `STATE.md`; for what ORC runs, `pnpm service:status` | F1, F2 |
| Justin's decisions | Lab `decisions/` (by evidence, for lab concerns); ORC's home is Q1 | Scattered (ownership item 1) |
| What broke in real use | `FRICTION.md` | Its order is broken (F16) |
| Facts about the relationship | `memory/` | The walkthrough pins no commit (F22) |
| Agent ideas | `AGENT_IDEAS.md` | No status (F18) |
| Rules owned elsewhere | `~/pro/local-config/home/AGENTS.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`; `~/pro/scope/docs/MODEL.md`; #140's description | Outside the snapshot; not read |
| Historical material | `reports/`, ORC's root session reports, `MCP.md`'s browser sections, `status-tracker` | Nothing demotes the ORC root reports (F13); one report is a raw transcript (F14) |

### Loop map, as the files show it

- **A fresh session starts:**
  - in the lab: `AGENTS.md` (also loaded as `CLAUDE.md`), then `STATE.md`, then `SCOPE.md`, then #140;
  - in ORC: `AGENTS.md`, then `README.md`, then `test/architecture.test.ts`.
  - Agents work in worktrees (`.worktrees/`, or `/tmp` per #196).
- **Active work is tracked** as issues under #140, marked with `node tools/map.mjs working <ref> --agent <name>`, and
  in `STATE.md`'s "Where we are now".
- **Decisions are captured** mostly in `STATE.md` and chat (F3), and sometimes in `decisions/`, ORC `AGENTS.md`, a
  code header or an issue.
- **Learnings go** to `FRICTION.md` per incident, each classed as an instance or a missing system, and to `memory/` for
  relationship facts.
- **Coherence pauses:** none is defined (F10). Reviews are ad hoc, with Astra and Claude reports and the six-review
  synthesis of 1 Oct.
- **The handoff** runs: branch, pull request, Danger, review, suites run by hand, Claude merges, the restart card,
  Justin approves, `STATE.md` is overwritten. After 22:00, work stays on branches.

### The current-state update

Drafted as `patches/lab-STATE.md.patch`. It:

- moves Justin's decisions into `decisions/` (`patches/lab-decisions.patch`);
- keeps one value for each live fact: the latest recorded, with its time, labelled not re-read;
- drops history, which `git log` and `FRICTION.md` keep;
- lists the documents likely to mislead;
- names who refreshes the file and what makes it stale;
- comes to 37 non-blank lines, which meets both caps (F1).

**It is stale on arrival.** The live file has certainly moved since 4 Oct. Apply its shape and rules to the live file
rather than applying the diff blindly.

## Bootstrap actions

One-time cleanup before a recurring guard makes sense. Each was checked against the snapshot file named.

| Id | Action | Settled by | Artifact |
|---|---|---|---|
| B1 | Copy the decisions held only in `STATE.md` into `decisions/` | Evidence; intent-pass §5 | `patches/lab-decisions.patch` |
| B2 | Rewrite `STATE.md` to current state within the cap | Docs-first Step 5 | `patches/lab-STATE.md.patch` |
| B3 | Correct ORC's `README.md` and `AGENTS.md` (F5, F6, F7) | Justin's decisions of 12, 13 and 17 Sep; enforced tests | `patches/orc-readme-agents.patch` |
| B4 | Add a "decisions" row to the lab's `AGENTS.md` "Where a learning goes" table | Evidence (F3) | `patches/lab-agents.patch` |
| B5 | Demote or remove ORC's root session reports, and the raw transcript in the lab's reports | **Q4** | none until answered |
| B6 | Put `FRICTION.md`'s last eight sections in date order (F16); fix the README timing (F17); add status lines to `AGENT_IDEAS.md` (F18) | Plain fixes | not drafted, about 5 minutes |
| B7 | Track B1 to B6 in one issue under Map A (#141) on #140 | The loop map | not filed: the snapshot is read-only |

## Recommended next step

Hand to the generator with the intent section, this profile and the ranked risks. That was done: a guard was built
(`guard/SKILL.md`) and given integration advice (`integration.md`). Its home, and three of its checks, are provisional
on Q1 to Q4. No existing guard was found to refine.

## Questions for the steward

Four, in `questions.md`:

- **Q1:** where decisions about ORC live;
- **Q2:** the guard's home and coverage;
- **Q3:** whether core-ties allowances may rise;
- **Q4:** ORC's root reports.

## Uncertainties

- **Live state was not read.** Every live fact is quoted from a file, with that file's time.
- **The snapshot has no `.git`**, so there is no history, no hook configuration and no recent commits beyond what the
  documents record. "Enacted" comes from `STATE.md`, `FRICTION.md` and file contents.
- **GitHub was not read:** issue #140's rules, #144, #152, branch protection and Danger's runs.
- **Rules owned elsewhere were not read:** `local-config/home/AGENTS.md`, `HOW_NOT_TO_PLAN.md` and the Scope
  `MODEL.md` lie outside the snapshot.
- **Moving Stillness, the Bookwhen ops tool and Finance** are named across both repositories but are outside this
  assessment.
- **Claude Code's discovery path in ORC is unknown.** ORC has `AGENTS.md` but no `CLAUDE.md` in the snapshot.

---

## Guard generation report

The generator's Output section, for this run.

- **Context-preservation structures found:**
  - intent: ORC `README.md` and `AGENTS.md`; the lab's `SCOPE.md`, `scope.yaml` and the north star (in `STATE.md`);
  - state: the lab's `STATE.md`;
  - decisions: scattered (F3, F4);
  - learnings: `FRICTION.md` and `memory/`;
  - verification: ORC's suites run by hand, and Danger;
  - work tracking: #140 and `tools/map.mjs`.
- **Mode:** build mode, written only to this output folder. Bootstrap mode did not apply: the system has a repeated
  daily handoff loop and recurring drift (F1, F2), so the readiness verdict is **ready now**.
- **Guard created:** `guard/SKILL.md`, proposed for the lab at `skills/session-coherence-guard/SKILL.md` (Q2). No
  existing guard was found.
- **Doc references proposed:** pointers in both repositories' `AGENTS.md`. The text is in `integration.md`;
  provisional on Q2.
- **Validation run on 7 Oct.** All of it ran on scratch copies of the snapshot, each given a throwaway one-commit
  git history; the targets were never touched.
  - Every patch passed `git apply --check`, was applied, and `git diff --check` over the result was clean.
  - The guard's shell commands ran under both bash and zsh: the per-repository change listing, the path check, the
    `STATE.md` line count and the core-ties diff.
    - The path check reported `src/bookwhen.ts` (F5) on the original `AGENTS.md`, and nothing on the patched one.
    - The line count reported 87 on the original `STATE.md` and 37 on the patched one.
    - The core-ties diff reported a deliberately raised allowance in the scratch copy (70 to 74).
  - Not run:
    - ORC's suites, which would need a `pnpm install`;
    - `node tools/map.mjs --check`, which needs GitHub;
    - the operational-state commands, which need the live machine.
- **Open questions the guard leaves visible:** Q1 (its decision surface for ORC), Q2 (its home), Q3 (its core-ties
  check) and Q4 (its check on where reports go). They are listed in the guard's "Provisional" section.
- **Handoff:** to `guards-integrator`; the brief is `integration.md`.
