# Entropy assessment: ORC and the orchestration-lab Scope, as one system

Assessed 2026-10-07, using entropy-guard's `entropy-assessment` v0.9.0, with `docs-first-planning-assessment` v0.3.0,
`session-coherence-skill-generator` v0.5.0 and `guards-integrator` v0.4.0.

The two repositories assessed:
- **ORC**, `orchestrator/`: a TypeScript orchestration system. 117 source files and 71 test files.
- **The lab**, `scope-orchestration-lab/`: the Scope that manages ORC's work. It holds the state file, the friction
  log, about 80 reports, one decision record and three Node tools.

The snapshots are read-only, have no `.git`, and their files are dated 4 October 2026, so "now" in this document
means the snapshot. Nothing live was read: no GitHub issue, no running ORC, no test run, since `node_modules` is
absent.

**Mode of this run.**
- Build mode for this output folder.
- Plan mode for the targets: every change to them is a patch in `patches/`, and none is applied.
- No steward was available. `questions.md` holds four questions, each with a recommended answer, and work that
  depends on them is drafted as provisional.

**Route taken.** I ran the route below and kept one assessment for all of it:
1. `entropy-assessment` Step 1, the intent pass (`intent-pass.md`, `intent-change-rule.md`).
2. Step 2: active, shape B with D, two repositories (`mixed-profile.md`).
3. `docs-first-planning-assessment` Steps 2, 3, 5 and 7 on the lab, because it is a docs-first member.
4. Step 3: guard decision `create`.
5. Step 4: hand to `session-coherence-skill-generator`, which wrote `guard/SKILL.md`.
6. `guards-integrator`, which wrote `integration.md`.

---

## 1. Intent

### Steward

**Justin.** The evidence is `scope-orchestration-lab/scope.yaml:6` (`steward: justin`) and `:35-37` (`members`, role
`admin`). ORC is a resource of that Scope (`scope.yaml:10-20`). ORC's own files name no steward, but they quote
Justin's directives throughout `AGENTS.md`.

### Authorised intent, and where each part comes from

Each statement below is listed by its kind and by its evidence of authority. "Attributed and dated" means the text
names Justin and a date.

| Statement | Where | Kind | Authority |
|---|---|---|---|
| Purpose: "Develop and operate Justin's local orchestration platform and its reusable Scope-owned agents." | lab `scope.yaml:5` | directive (inventory) | in the steward's Scope file; undated |
| Authority: facts about ORC live in its repository; facts about the relationship live in the lab | lab `SCOPE.md:17-24` | directive | unattributed, undated |
| North star: ORC as Justin's "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece" | lab `STATE.md:8-10`; also `reports/2026-09-30-priorities.md:7` | decision | attributed and dated (25 Sep) |
| "once the six slots work, work towards a point of consolidation" | lab `STATE.md:10-11` only | decision | attributed and dated (26 Sep) |
| Iris as front door, ADA creates agents, every agent belongs to a Scope, candidates cannot grant themselves authority | ORC `README.md:9-23` | description and directive | unattributed, undated |
| Core ships with no specific Scope, model, owner or agent | ORC `AGENTS.md:30-55` | directive | attributed and dated (12–13 Sep) |
| The lethal trifecta rule; approval in a prompt is not a control; standing grants only for `grantable` work | ORC `AGENTS.md:68-90` | directive | issue-backed (#20, #67); undated |
| Approval cards are drawn from a fixed set of blocks | ORC `AGENTS.md:114-128` | directive | the operator, 26 Sep |
| Security review through Danger on every PR | ORC `AGENTS.md:138-143`, `dangerfile.js:7` | decision | attributed and dated (2 Oct, "B") |
| The map of work is orchestrator#140 | both `AGENTS.md` files (lab `:7-10`, ORC `:7-12`) | directive | attributed and dated (2 Oct) |
| ORC owns a general async-work capability; Moving Stillness's apply is its first user | lab `decisions/2026-09-17-async-work-architecture.md` | decision | attributed and dated (17 Sep) |
| Authority rules 1, 2, 4 and 5 affirmed; rules 3 and 6 open | lab `memory/authority-rules-step-1.md` | decision | attributed and dated (1 Oct) |
| The lab is the central Scope; where issues live; the processes kept, including "entropy guard at session end"; #166 built first | lab `STATE.md:38-55` only | decision | attributed and dated (4 Oct) |
| Claude merges a PR once review and tests pass | lab `STATE.md:17-18` only | decision | attributed and dated (25 Sep) |
| Pace: "one scored real use must come first" | lab `AGENTS.md:25-29` | directive | unattributed, undated |
| "what is naturally needed given where we are and what's likely coming next" | lab `reports/2026-09-22-pushback-analysis.md:127-133` | decision (quoted) | attributed and dated (21 Sep) |

**Not read:** the rules ORC and the lab are bound by but live outside both repositories, because this run may read
only the two targets. They are named here as rules owned elsewhere:
- `~/pro/local-config/home/AGENTS.md`, the user-wide rules, linked as every tool's rules file
  (`reports/2026-09-30-skills-one-home.md:16-26`);
- `/home/justin-philpott/pro/agentic/HOW_NOT_TO_PLAN.md`;
- `pro/agentic/agentic-architecture/MODEL.md`;
- `/home/justin-philpott/pro/scope/docs/MODEL.md`;
- #140's description.

### Declared, enacted and authorised, compared

- **Declared.** ORC's `README.md` was last edited on 13 Sep, 142 commits before 1 Oct
  (`reports/2026-10-01-design-review.md:175`). It declares:
  - a read-only system reaching Bookwhen and Jina;
  - a plan without an apply;
  - scheduling as deliberately absent.
- **Enacted.** The work from 17 Sep to 4 Oct, from `STATE.md`, `FRICTION.md` and the code, built:
  - a durable-work engine with recurrence;
  - a Playwright browser that acts on Bookwhen admin pages;
  - package connectors for mail, client records and phone notices;
  - a restart card that builds and restarts ORC;
  - the map of work.
- **Authorised.** Most of what was enacted traces to recorded decisions:
  - the async decision of 17 Sep;
  - #76 for the browser, "decided 3 Oct" (`src/adapters/browser/playwright.ts:9-11`);
  - package build cards approved by Justin (`STATE.md:91-92`);
  - the 4 Oct interview.

  The gap is mostly between declared and authorised: the documents did not follow the decisions. The exception is
  three boundary statements (F7), where neither a document nor a visible decision says the widening was approved.

### Gaps, by condition

| Condition | Findings |
|---|---|
| Stale description (a recorded decision settles it, so it is corrected in `patches/orc-docs-settled.patch`) | F4, F5, F6, F9 |
| Conflict (two sources prescribe incompatible things) | F3 (pace), F11 (the state file's size), F7 (the ntfy sentence against the phone connector) |
| Missing | F2 (no decision owner per concern) |
| Ambiguous | F8 (what "external data paths" and "deliberately absent" cover now that Scope packages hold connectors) |
| Unauthorised drift, or a correct description of approved work (cannot tell) | F7 (the subprocess and network lists): recorded as Q2 and drafted as a proposal, not corrected |
| Prose control | F7 (the architecture test is cited as enforcing the network boundary and misses the browser); F11 (the forty-line cap is enforced by nothing) |
| A steward decision only in an overwritten state file | F1: copied to the durable record, as intent-pass §5 requires |

### Existing guards' repair instructions, read against the intent-change rule

Neither repository has an entropy guard. Its nearest equivalents are:
- the instruction files;
- `SECURITY-REVIEW.md`;
- `dangerfile.js`;
- the ratchets in `test/core-ties.ts`.

None tells a session to update an intent document to match the work, so I found no path for unauthorised drift.
- `test/core-ties.ts:6-7` and ORC `AGENTS.md:47-48` say an allowance must fall "in the same change". That keeps an
  enforced count and its allowance in step, and is a ratchet, not two definitions of one concept.
- `pnpm api:report` regenerates `src/package-api.api.md`, a generated projection.

Neither is flagged.

### Questions for the steward

There are four, in `questions.md`, each with a recommended answer:
- **Q1:** the decision owner per concern;
- **Q2:** whether the boundary documents describe the browser, the restart service and package notices;
- **Q3:** which pace rule governs;
- **Q4:** a forty-line or a sixty-line cap for `STATE.md`.

### Proposed changes, and where they are recorded

- **Copied, not decided again:** the decisions found only in `STATE.md` go to the lab's
  `decisions/2026-10-04-copied-from-state.md`.
- **Recorded as proposals awaiting Justin:** Q1 to Q4 go to `decisions/2026-10-07-proposals-from-entropy-assessment.md`.

Both are in `patches/lab-state-and-decisions.patch`. Using `decisions/` touches Q1; the patch says so.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** The evidence:
  - `scope.yaml:7` and `:14` (`status: active`);
  - `STATE.md:3` (updated 4 Oct 17:31);
  - four ORC restarts onto merged work on 4 Oct (`STATE.md:31-36`);
  - `FRICTION.md` entries every day from 17 Sep to 4 Oct.
- **Shape: B, mixed docs and code, with D, workflow-heavy.**
  - Both have meaningful code: ORC's TypeScript and the lab's `tools/*.mjs`.
  - Both have meaningful documents.
  - The risk sits between them (§3).
  - Much of the entropy surface is process: cards, the map, Danger, Astra reviews, worktrees and the state file.
  - B and D both route to `mixed-profile.md`, so the analysis is the same.
- **One system, two repositories.** `scope.yaml:10-20` makes ORC the lab's `orchestrator` project, and `SCOPE.md:17-21`
  divides authority between them. The lab is docs-first, so docs-first Steps 2, 3, 5 and 7 were run on it (§6).

### Which repository owns each concept

| Concept | Owner | Second home or seam |
|---|---|---|
| ORC's code, boundaries, rules | ORC (`AGENTS.md`, `test/architecture.test.ts`) | ORC `README.md` "Boundary" restates the boundary (F8) |
| Current state, including ORC's live state | lab `STATE.md` | none in ORC, and ORC's `AGENTS.md` does not point to it (F16) |
| Decisions | none named (F2) | see F2 |
| Map of work | GitHub #140; `tools/map.mjs` holds the one copy of its number | — |
| What broke in real use | lab `FRICTION.md` | — |
| Connector setting names | ORC and each package manifest | two homes, no test across them (F13, orchestrator#198) |
| Bookwhen vocabulary and apply path | Moving Stillness and the ops tool (outside this system) | two apply paths (ms#11) |

---

## 3. Findings

One list. Every later section refers to these ids.

**F1. Steward decisions held only in an overwritten state file.** Lab `AGENTS.md:33` has `STATE.md` overwritten at
each verified event. `STATE.md` alone holds:
- the 4 Oct interview (`:38-55`), including "entropy guard at session end";
- Justin's 26 Sep consolidation line (`:10-11`);
- the merging rule (`:17-18`);
- MS paused (`:33`);
- three 3 Oct decisions for other repositories (`:57-58`).

The 25 Sep north-star quote has a second copy in `reports/2026-09-30-priorities.md:7`. *Source: lab.*

**F2. No decision owner per concern.** Decisions are spread across eight kinds of place (`questions.md` Q1):
- `STATE.md`;
- `decisions/`, one file, of 17 Sep;
- `memory/`;
- quotations in ORC's `AGENTS.md`;
- code comments (`dangerfile.js:7`, `playwright.ts:9`);
- reports;
- GitHub issues;
- `~/.claude/plans/agile-booping-waffle.md` (`memory/authority-rules-step-1.md:5`), which only Claude sessions reach.

A sign of the cost: `reports/2026-09-30-skills-one-home.md:3-14` opens by listing four earlier rounds of the same
discussion. *Source: both.*

**F3. Two pace rules conflict.** Lab `AGENTS.md:25-29` says "one scored real use must come first". Justin, 21 Sep
(`reports/2026-09-22-pushback-analysis.md:127-133`), says relax to "what is naturally needed…". No recorded decision
reconciles them. `HOW_NOT_TO_PLAN.md` and the user-wide rules were not read. *Source: lab.*

**F4. ORC `README.md:152-154` lists "scheduling" as deliberately absent.** The decision of 17 Sep
(`decisions/2026-09-17-async-work-architecture.md:19-27, 54`) made it part of ORC's async capability, and the engine
owns recurrence (`src/app/async/engine.ts:3`, `src/app/async/calendar.ts:1-5`). Stale description, settled. The
other absences listed ("reminders", "additional external data sources", "workflow execution", "file edits") are not
plainly settled and stay open (F8). *Source: ORC.*

**F5. ORC `README.md:146-147` says the Moving Stillness specialist plans "without applying it".** The same decision's
"Consequences" (`:171-177`) makes the apply durable work with approval required, and it ran live (`STATE.md:23-33`;
`memory/slots-run-walkthrough.md`). Stale description, settled. *Source: ORC.*

**F6. ORC's README and AGENTS.md still describe a Bookwhen client inside ORC.**
- What they say:
  - `README.md:76-79` tells the reader to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN`, used through "exact-pinned
    `@jphil/bookwhen-client@0.6.1`";
  - `AGENTS.md:102-103` says "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client".
- What is true:
  - nothing in `src/`, `config/` or `scripts/` reads the variable;
  - `src/bookwhen.ts` does not exist;
  - the dependency is absent from `package.json`;
  - `test/architecture.test.ts:1314-1321` asserts no Bookwhen client and no Bookwhen code;
  - `AGENTS.md:39-42` (Justin, 12–13 Sep) puts Bookwhen code in its Scope.

Stale description, settled. Already reported in `reports/2026-10-01-design-review.md:175-178` and in
`reports/2026-10-01-review-synthesis.md` item 7, which waits on Justin's word (`:95`). *Source: ORC.*

**F7. ORC `AGENTS.md`'s boundary "only" lists are incomplete, and so is the network check that enforces them.**
- **Subprocess list** (`:92-96`). It omits `src/adapters/orc-service.ts` (`execFile` for `systemctl`, `pnpm install`
  and the build; `orc-service.ts:3-4, 102, 128`), which `test/architecture.test.ts:828-835` allows. It also omits
  Playwright's Chromium launch (`src/adapters/browser/playwright.ts:16`).
- **Network list** (`:98-104`, "Direct network access exists only in…"). It omits `playwright.ts`, which imports
  `lookup` from `node:dns/promises` (line 14) and drives Chromium to approved hosts. The test "limits core network I/O
  to the approved modules" (`test/architecture.test.ts:1295-1312`) has no pattern for `node:dns` or `playwright`, so
  it passes. A second module importing `chromium` would also pass it. The browser's own host confinement is tested
  separately (`test/browser-connector.test.ts:450, 485, 762, 783`), so this is a gap in the architecture-level check,
  not an open path.
- **The ntfy sentence.** "No model or agent reaches the ntfy transport" (`AGENTS.md:100`, repeated in the comment at
  `test/architecture.test.ts:63`). But `src/adapters/phone/index.ts:1-8` gives Scope packages ORC's ntfy sender since
  #184, with the topic fixed by the installation.

These are prescribed boundaries. Observed code does not authorise rewriting them, so they are Q2 and drafted only in
`patches/orc-boundary-provisional.patch`. *Source: ORC.*

**F8. ORC's README makes an "only" claim about external paths that the connectors outgrow, and the boundary has two
documents.**
- `README.md:5-7` lists ORC's "read-only external data paths" as Bookwhen and Jina only.
- `README.md:145-150` says what the model "cannot" reach.
- `config/installation.ts` binds Scope packages to:
  - a browser with page actions on `movingstillness.bookwhen.com` (`:128-134`);
  - an SMTP mail connector (`:159-168`);
  - client records (`:156`);
  - a calendar API token (`:121`);
  - phone notices (`:86`).
- The boundary is defined in two documents, `README.md` "Boundary" and `AGENTS.md` "Boundaries", plus the test.

Ambiguous, and an ownership finding: one document should own the list (Q2). *Source: ORC.*

**F9. ORC `AGENTS.md:47` understates what the core-ties ratchet scans.** It says the ratchet runs over "`src/` and
`web/src/`". `test/architecture.test.ts:319-325` also scans `config/` ("Installation policy moved out of src/ is still
shipped code"), and `test/core-ties.ts` gives `config/installation.ts` allowances of 70, 2, 1 and 4. The description is
narrower than the check, and Justin's open-source directive (`AGENTS.md:32-37`) covers the wider reading. Stale
description, settled. *Source: ORC.*

**F10. Lab `STATE.md` contradicts itself on live facts.**
- **#193.** `:23` says it is "built and in review, not merged"; `:31` says "#193 is live: #200 merged as `3989cdb`".
- **The running build.** `:31-36` records restarts onto `3989cdb`, `adaa127`, `6d89ce7` and `8cee662`, the last at
  14:48:27 on 4 Oct. But `:56` says "ORC came back by itself on 369628b", `:58` says "ORC live: 369628b since
  22:12:47", and `:88` says the main process started on 3 Oct at 22:12:47 on `369628b`.
- **Moving Stillness `main`.** `:91` gives `c759f96`, after `:33` records MS #53 merged as `fc830aa`.
- **Grant `e9675bd9`.** `:94` says it covers the test entry "until 1 Oct 18:00Z", in a file updated 4 Oct.

The same failure was logged twice before: `FRICTION.md:866` (12 Sep) and `:621` (22 Sep, "contained two false
statements"). *Source: lab.*

**F11. The state file has two size rules and is being appended to.**
- Lab `AGENTS.md:34` says `STATE.md` is "capped at about forty content lines"; `STATE.md:4` says "Target: sixty lines".
- The file has 87 non-blank lines.
- `:55-58` mixes 3 Oct and 4 Oct material in one paragraph, against "do not append" (`:4`).

Nothing enforces either number. *Source: lab.*

**F12. Tests run only by hand.**
- CI runs Danger and nothing else (`.github/workflows/danger.yml:16-33`).
- `STATE.md:17` has Claude merge "once review and tests pass", and a merge leads, by card, to a live restart.
- The E2E suite was red on `main` for a week unnoticed (`FRICTION.md:396`).

Tracked as #144: a process Justin kept on 4 Oct, with the mechanism still undecided (`STATE.md:45, 69`). *Source:
ORC.*

**F13. Names cross repository seams with no test across them.**
- Connector setting names are defined in ORC and again in each package manifest. When #197 renamed one, both Moving
  Stillness agents were unavailable for about an hour (`FRICTION.md:63-69`; orchestrator#198).
- A dead tool name sat in agent-facing text (`FRICTION.md:414`; ms#25).
- There are two apply paths (ms#11).
- Package tests cannot use ORC's real parts (#202, #124).

Partly outside this system, in Moving Stillness. Tracked. *Source: both, plus Moving Stillness.*

**F14. Processes Justin kept on 4 Oct do not run.**
- **Daily diary:**
  - `tools/report.mjs` runs by hand;
  - snapshots in `reports/*.json` stop at 2 Oct;
  - `status.html` says "generated 08:45 UTC" on 2 Oct, while lab `README.md:12` says it "shows what ORC is today";
  - the diary once stopped for the same reason (`tools/report.mjs:11-12`, orchestrator#64).
- **Entropy guard at session end:** none exists in either repository.
- **Weekly review, FRICTION into rules (#60), cleanups (#70, #182):** run by hand or not built.

#166 is to run them (`STATE.md:53`). Decided, not built. *Source: lab.*

**F15. Superseded material sits beside live truth.**
- **ORC's root reports.** Twelve one-off run reports sit at the root: `CLASSIFY`, `FIXES`, `GRANTS-E2E`, `GRANTS`,
  `MCP`, `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`, `TURN-RECORD`, `VISIBILITY`. Ten mentions in them
  name seven paths that no longer exist (my scan, below). Already in `reports/2026-10-01-design-review.md:171-174`,
  which recommends moving any fact found nowhere else into `AGENTS.md`, then deleting them.
- **The 17 Sep decision.** `decisions/2026-09-17-async-work-architecture.md:47` defines `idempotency: natural |
  keyed | none`. The code has `repeatEffect` and `submissionKey` (`src/core/async/types.ts:142-144`), from "the
  approved split" (ORC `FIXES.md:138`; approver not named). The decision is not marked as amended.
- **A raw transcript.** `reports/2026-09-17-async-review-critical.md` is an 832 KB raw agent transcript of 126 JSONL
  lines, not a report.
- **FRICTION's order.** `FRICTION.md:3` says "Newest first", but `:1153-1402` holds 11–19 Sep entries, oldest first,
  after 3 Sep, and 12 Sep and 17 Sep each have two headings. `:1149-1151` notes a copy in `~/pro/build-loop/FRICTION.md`
  "awaiting a decision".

*Source: both.*

**F16. ORC's instructions do not lead to the system's state file.** ORC `AGENTS.md:3-12` sends a session to
`README.md`, the architecture test and #140. Nothing in ORC points to the lab's `STATE.md`, which records which ORC
build runs and its test counts. A worker session started in an ORC worktree misses it. *Source: ORC.*

**F17. ORC's restart procedure is stated in two places, for different readers.** `README.md:128-129` lets the operator
run `systemctl --user restart orc.service`. `AGENTS.md:136`, filed under "Security review", says "Never stop, start or
build ORC's `dist` by hand". An agent reading the README alone could restart without a card; `FRICTION.md:287`
records a wrong restart claim. Low. *Source: ORC.*

**F18. The pull request template prompts for "Security review" only.** `dangerfile.js:50-57` also fails a pull
request that changes `src/package-api.api.md` without a `## Package API` section, and
`.github/pull_request_template.md` does not prompt for it. Low and mechanical. *Source: ORC.*

**F19. Whether the committed pre-push hooks run is unknown.** Both `.githooks/pre-push` files only print a push summary
from `~/pro/local-config/scripts/push-summary`, outside both repositories. Whether they are enabled cannot be
seen without `.git`. *Source: both.*

**F20. The MCP client is not composed in production.**
- `MCP.md:3-5` says "The MCP client below still serves Pi's MCP tools", and ORC `AGENTS.md:94-95` lists it as a
  subprocess path.
- But no production module imports `src/backends/pi/mcp-tools.ts`, or calls `createMcpClient` or `createPiMcpTools`.
  Only tests do.

It is a description of a path that no longer runs, or dead code. Connect it to the dead-code list in
`reports/2026-10-01-design-review.md`. *Source: ORC.*

**F21. Lab `AGENT_IDEAS.md` has a duplicate and an entry overtaken by later work.** Product search has two entries
(`:164`, `:173`). The "Goal tree tool" entry (`:212`) does not mention the map of work (#140), which addresses part
of its stated problem. Whether the map supersedes it is not recorded. Low. *Source: lab.*

Paths named in ORC's docs that no longer exist, from my scan of every backticked `src/`, `scripts/`, `test/`,
`config/` and `web/` path in ORC's root `*.md`:

| Document | Missing paths |
|---|---|
| `AGENTS.md` | `src/bookwhen.ts` |
| `CLASSIFY.md` | `src/adapters/browser/mcp.ts`, `src/adapters/browser/service.ts` |
| `GRANTS.md` | `src/adapters/browser/service.ts` |
| `MCP.md` | `src/core/ports/browser.ts`, `test/browser-service.test.ts` |
| `POLICY-STORE.md` | `src/core/policies.ts` |
| `REWORK.md` | `src/adapters/async-store/store.ts`, `test/async-store.test.ts` |
| `SLICE1.md` | `src/adapters/browser/service.ts`, `test/browser-service.test.ts` |

`README.md` had none.

---

## 4. Ranked risks (decay rate × recovery cost)

1. **The state file misleads the next session** (F10, F11, F1).
   - **Decay:** fast. The file is overwritten many times a day and carries live facts.
   - **Recovery:** high. Confident wrong statements to Justin about live services (`FRICTION.md:621`, `:287`), and
     decisions lost at the next overwrite.
   - **Anchor:** `AGENTS.md` "Keeping state", plus the decision owner from Q1.
2. **Boundary documents drift from what the code reaches and what the tests enforce** (F7, F8, F6, F9, F20).
   - **Decay:** every authority change. There were three in three days: #184 on 2 Oct, the restart card on 2 Oct,
     and #76 and #197 on 3 Oct.
   - **Recovery:** medium to high. Security reviews are written against these lists, and `README.md:134-136` cites
     the test as enforcement.
   - **Anchor:** ORC `AGENTS.md` "Boundaries" as the one owner, with `test/architecture.test.ts` as the independent
     check.
3. **Merges are verified only by tests run by hand** (F12).
   - **Decay:** every merge. **Recovery:** high, because a merge becomes a live restart. The precedent is a week of
     red E2E.
   - **Anchor:** #144. This is mechanical, so it belongs to CI rather than to the guard; until then the guard asks
     for the run.
4. **Decisions are re-litigated or lost** (F2, F3, F1).
   - **Decay:** medium. **Recovery:** high, with four rounds of one discussion as the precedent.
   - **Anchor:** the decision owner from Q1, and the pace rule from Q3.
5. **Names drift across repository seams** (F13).
   - **Decay:** every rename. **Recovery:** about an hour of an unavailable agent, the last time.
   - **Anchor:** orchestrator#198 for a test across the seam; until then, a search in the guard.

---

## 5. Existing guard surfaces, sorted by whether they execute

| Surface | Runs | Evidence |
|---|---|---|
| Danger: security-review and package-API sections (`.github/workflows/danger.yml`, `dangerfile.js`) | **by itself**, on every PR | Configuration read. Execution is recorded by `STATE.md:79-81` ("proven on GitHub (pass, fail with the section removed, pass restored)"); I did not see it run |
| `pnpm typecheck`, `pnpm test`, including `test/architecture.test.ts` and `test/core-ties.ts` | **by hand only** | Not in CI (F12) |
| `pnpm test:e2e` | **by hand only** | Was red for a week unnoticed (`FRICTION.md:396`) |
| `pnpm api:report` and its test | by hand (test), plus Danger | `AGENTS.md:132` |
| `node tools/map.mjs --check` | **by hand only** | Lab `AGENTS.md:10` |
| `node tools/report.mjs`, the daily diary | **by hand only** | Last run 2 Oct (F14) |
| `SECURITY-REVIEW.md` checklist | by hand (a person or agent writes the section) | Danger checks only that the section is present (`dangerfile.js:6`) |
| Restart card and package-approval cards | by itself, with a person deciding | `README.md:123-129`, `AGENTS.md:134-136` |
| Pre-push hooks (both repositories) | **unknown** | No git config in the snapshot (F19); they only print, never check |
| Tests on every PR (#144) | **decided, not built** | `STATE.md:45, 69` |
| Entropy guard at session end | **decided, not built** | `STATE.md:49`; no guard in either repository (F14) |
| Weekly adversarial review, FRICTION into rules (#60), branch and `/tmp` cleanup (#70, #182) | **decided, not built** as scheduled work; by hand today | `STATE.md:47-52`, waiting on #166 |
| `STATE.md`'s cap of forty or sixty lines | **declared, but missing** | Nothing checks it (F11) |
| "test/architecture.test.ts enforces the boundaries below" (`README.md:135`) | runs by hand, but **partly declared, not enforced** | Misses the browser and DNS (F7) |

Each gap already tracked is connected to its work rather than given a parallel project: #144 (F12), #166 (F14),
#198 and #202 (F13), and the design review's cleanup (F6, F15, F20).

**Mechanical checks belong to tools** (`mixed-profile.md`):
- **lychee:** relative links in both repositories' Markdown.
- **ast-grep, or a test:** each `ORCHESTRATOR_*` variable and `src/` path named in ORC's `README.md` and `AGENTS.md`
  must exist in the code. My scan above is the hand-run version.
- **ORC's own tests:** extend `test/architecture.test.ts` for `playwright` and `node:dns` (F7), and add #198's test
  across the seam.
- **The pull request template:** add a `## Package API` prompt (F18).

Whether lychee or ast-grep is installed on athena was not checked, since that lies outside this run's read scope.
Check it before the guard depends on either.

---

## 6. The lab Scope, docs-first Steps 2, 3, 5 and 7

### Step 2: the truth map

| Document | Role | Notes |
|---|---|---|
| `scope.yaml` | canonical | identity, steward, resources |
| `SCOPE.md` | canonical | purpose, authority split; `README.md` summarises it |
| `AGENTS.md` (`CLAUDE.md` is a symlink to it) | canonical | how to work here, where learnings go, state rules, pace |
| `decisions/` | canonical | decisions; one file today (F2) |
| GitHub #140 (outside the snapshot) | canonical | the map of work and its rules |
| `STATE.md` | current state | read first; also carries ORC's live state |
| `memory/` | local elaboration | relationship facts: authority rules step 1, a run walkthrough |
| `FRICTION.md` | canonical log | what broke in real use; its order is broken (F15) |
| `AGENT_IDEAS.md` | backlog | "prompts for a conversation, not approved designs" (`:3`); see F21 |
| `tools/map.mjs`, `tools/report.mjs`, `tools/collect.mjs` | product artifact | their commands and `REPOS` are contracts named by `AGENTS.md`, `README.md` and the guard |
| `status.html`, `reports/*.json` | generated projection | stale since 2 Oct (F14) |
| `reports/*.md`, `research/` | historical | dated observations; three are named "of record" by `STATE.md:96-99`; one is a raw transcript (F15) |
| `skills/`, `workflows/` | empty placeholders (`.gitkeep`) | `skills/` is where the guard goes |

**The one home of each concept:**
- **Purpose:** `scope.yaml`.
- **Direction:** Justin's dated words, which today sit only in `STATE.md` (F1). Moved to `decisions/`.
- **Processes kept:** `STATE.md` only (F1). Moved.
- **State-file rules:** `AGENTS.md`, with `STATE.md`'s header disagreeing (F11).
- **ORC facts:** ORC.
- **Live ORC facts:** `pnpm service:status` is the source; `STATE.md` holds a dated observation of it.

### Step 3: the loop as it actually runs

- **Start.** A lead session (Claude Code, and Codex or opencode through the same user-wide rules) opens the lab.
  It reads `AGENTS.md`, then `STATE.md`, then `SCOPE.md`, then #140 through `node tools/map.mjs`.
- **Marking work.** It marks an issue with `map.mjs working`.
- **ORC work.** It works on ORC in worktrees (`.worktrees/` in ORC's `.gitignore`, `/tmp` worktrees per
  `FRICTION.md:59`), and delegates:
  - reviews to Astra through `opencode run`, written back as `reports/*-astra.md`;
  - builds to workers in ORC worktrees.
- **Handing work into ORC.** A pull request in ORC, then Danger, then a merge by Claude, then a restart card that
  Justin clicks, then verification by process start time.
- **Decisions** land in `STATE.md`'s "Decided by Justin" blocks or a report.
- **Learnings** land in `FRICTION.md` (daily, newest first), ORC's docs, or the user-wide rules.
- **Handoff.** `STATE.md` is overwritten and the lab committed. There is no session-end check, and the 22:00 rule
  keeps late work on branches.

**Where follow-up is lost:**
- the `STATE.md` overwrite (F1, F10);
- reports nobody links;
- ORC sessions that never see `STATE.md` (F16).

### Step 5: the current-state file brought up to date

The update is `STATE.md` in `patches/lab-state-and-decisions.patch`, a patch because the target is read-only. It
holds the items Step 5 asks for:
- the canonical documents to trust first;
- settled decisions, linked;
- the state as recorded on 4 Oct, labelled as not re-read;
- what is waiting on Justin, with Q1 to Q4;
- misleading material nearby;
- three next actions;
- what makes the file stale, and who refreshes it.

**Corrections, each limited by its evidence:**
- drops the contradicted live values: #193 "in review", the three claims that ORC runs `369628b`, and Moving Stillness `main` `c759f96` (F10);
- states the grant's end date as ended "unless renewed";
- copies the decisions out before removing them (F1).

**Unchanged, because each is an open question:** the "Target: sixty lines" text (Q4), and `AGENTS.md`'s "Pace" (Q3).

**Result:** 55 non-blank lines, down from 87.

**What could not be done:** no live fact was freshly observed. Each is labelled as recorded on 4 Oct, and the guard's
live-fact check asks the next session to read `pnpm service:status` before stating what runs.

### Step 7: guard inputs

1. **Existing surfaces:**
   - keep Danger;
   - keep `test/architecture.test.ts`, and amend it for the browser and DNS (F7);
   - amend ORC `AGENTS.md` with the settled corrections now and the boundary lists after Q2;
   - amend lab `AGENTS.md` with a "Before handing off" pointer;
   - demote ORC's twelve root reports to history, then delete them as the design review proposes (F15);
   - no existing guard to refine.
2. **The matrix's checks against this system's files** are the guard's Checks section, `guard/SKILL.md`.
3. **The guard decision** is §8.

**Cleanup is tracked in `STATE.md` and the patches, never in the guard.**

---

## 7. Recommendations

**Consolidate:**
- **The boundary:** one owner, ORC `AGENTS.md` "Boundaries"; `README.md` "Boundary" becomes a summary with a link (F8,
  Q2).
- **Decisions:** one owner per concern (Q1).
- **The state-file cap:** stated once (Q4).

**Demote, or mark historical:**
- ORC's twelve root reports (F15). Already proposed by `reports/2026-10-01-design-review.md:254`.
- `MCP.md`'s claim that the MCP client still serves Pi (F20).

**Amend:**
- **The 17 Sep decision:** add an "Amended" line pointing at the `repeatEffect` and `submissionKey` split. The record
  itself stays as it is (F15).

**One-time cleanup, each item checked against the current file in the snapshot:**

| Item | Checked against | Finding |
|---|---|---|
| Apply `patches/orc-docs-settled.patch` on Justin's word | `README.md:76-79, 146-147, 152-154`; `AGENTS.md:47, 102-103`, as read | F4, F5, F6, F9 |
| Apply `patches/lab-state-and-decisions.patch` | `STATE.md` as read (87 non-blank lines) | F1, F10 |
| Move the authority-rules plan out of `~/.claude/plans/` into `memory/` or #149 | `memory/authority-rules-step-1.md:5` | F2 |
| Replace `reports/2026-09-17-async-review-critical.md` with the review's final text, or rename it `.jsonl` | the file is 126 JSONL lines | F15 |
| Restore newest-first order in `FRICTION.md`, merging the second 12 Sep and 17 Sep headings | `FRICTION.md:1153-1402` | F15 |
| Decide the `~/pro/build-loop/FRICTION.md` copy | `FRICTION.md:1149-1151` (outside the snapshot) | F15 |
| Remove the duplicate product-search entry from `AGENT_IDEAS.md`, and note the map beside "Goal tree tool" | `AGENT_IDEAS.md:164, 173, 212` | F21 |
| Add `## Package API` to `.github/pull_request_template.md` | template as read | F18 |
| Decide whether the MCP client and `src/backends/pi/mcp-tools.ts` stay | no importer found | F20 |
| Move the 3 Oct decisions for other repositories to their owners | `decisions/2026-10-04-copied-from-state.md`, last section | F1 |

---

## 8. The guard decision, and the generator's inputs

**Decision: `create`.**
- No session-end guard exists in either repository (F14).
- Justin kept "entropy guard at session end" as a process on 4 Oct (`STATE.md:49`).
- The loop loses state, decisions and live facts at exactly that point (§4, risks 1 and 4).

**Placement: the lab, at `skills/session-coherence-guard/SKILL.md`.**
- The lab is "the central Scope for … code quality and security" (`STATE.md:39-40`).
- A Scope's `skills/` is where one Scope's skills live (`reports/2026-09-30-skills-one-home.md:84-86`).
- One guard covers both repositories, run by the lead session.

This is an adaptation within existing authorisation, recorded in the proposals file.

**The generator's inputs** (`session-coherence-skill-generator`, "Inputs, and the guard decision"):

- **Steward:** Justin (`scope.yaml:6`).
- **Documents holding authorised intent:**
  - the lab's `scope.yaml`, `SCOPE.md` and `decisions/`, which receive Justin's words from `STATE.md` (F1);
  - ORC's `README.md` "Direction" and "Boundary";
  - the rules in ORC's `AGENTS.md`.
- **Decision surface: unresolved (Q1).** Provisionally the lab's `decisions/` and the issue that owns an ORC design
  question.
- **Open intent questions:** Q1 to Q4.
- **Current-state file:** the lab's `STATE.md`. The session that causes a verified event rewrites it (lab
  `AGENTS.md:33`), and the guard checks it.
- **Rules bound but not owned:**
  - `~/pro/local-config/home/AGENTS.md`, which includes the spending rule;
  - #140's description;
  - `HOW_NOT_TO_PLAN.md`;
  - the Scope model;
  - ORC's `SECURITY-REVIEW.md` and `dangerfile.js`, owned within the system by ORC.
- **Verification commands:**
  - ORC: `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report`, `pnpm service:status`;
  - lab: `node tools/map.mjs --check`, `node tools/report.mjs --no-tests`;
  - **running by themselves:** only Danger's two section checks.
- **Code areas, with the docs and tests that describe them:**

  | Code area | Docs | Tests |
  |---|---|---|
  | `src/core/research-tools.ts`, `src/adapters/notifications/`, `src/adapters/phone/`, `src/adapters/browser/`, `src/adapters/orc-service.ts`, `src/core/child-agent-process.ts`, `src/core/analysis-tools.ts`, `src/adapters/mcp/` | `AGENTS.md` "Boundaries", `README.md` "Boundary" | `test/architecture.test.ts`, `test/browser-connector.test.ts`, `test/orc-restart.test.ts`, `test/ntfy-notifications.test.ts`, `test/phone-connector.test.ts` |
  | `src/app/async/`, `src/core/async/` | lab `decisions/2026-09-17-async-work-architecture.md` | `test/async-*.test.ts` |
  | `src/core/agents/package.ts`, `src/package-api.ts` | `AGENTS.md` "Security review", `src/package-api.api.md` | `test/package-api-report.test.ts` |
  | `config/installation.ts` | `AGENTS.md` core ties | `test/core-ties.ts` |
  | `src/core/iris.ts`, `src/tools.ts` | `AGENTS.md` parent tool list | the architecture test's tool surface |
  | `scripts/`, `package.json` scripts | `README.md` "Run", "As a service", "Verify" | — |
  | lab `tools/*.mjs` | lab `README.md`, `AGENTS.md` | — |

- **Live state and spend a session can change:**
  - ORC's running build, through the restart card;
  - package approvals and standing grants;
  - Bookwhen entries, through Moving Stillness;
  - ntfy notices;
  - GitHub Project marks and labels;
  - finance mail, which is parked;
  - paid model and API calls, governed by the user-wide spending rule.
- **Findings by id:** F1 to F21 above.

---

## 9. Generator output

- **Supplied or found:** the inputs in §8. No existing guard. Q1, Q3 and Q4 stay visibly unresolved in the guard.
- **Guard decision:** `create`.
- **Path:** `guard/SKILL.md`, to be placed at the lab's `skills/session-coherence-guard/SKILL.md`. The lab patch
  carries an identical copy.
- **Size against budget.** Actual size: **1,317 words** (`wc -w`). Budget: **1,193 words**. The budget terms:
  - common contract, as measured by the generator on 2026-10-07: 706;
  - checks: 9 repo-specific checks beyond the two standing ones, × 36 = 324. Measured, they total 304 words;
  - pointers: the filled "Where things live" values, 67 words (95 in the section, less the template's 28 placeholder
    words);
  - commands: the repo-specific commands, 96 words (104, less the template's 8-word placeholder).
- **Why it is 124 words over:**

  | Excess | Words | Why |
  |---|---|---|
  | The first standing check, filled with this system's five code-area-to-document mappings | +47 | F4 to F9 |
  | Pace left visible as unresolved | +33 | Q3; the generator says an unresolved input stays visible |
  | The live changes a session here can make | +24 | The template's comment asks for them |
  | The sentence running the change block in each repository | +16 | Two repositories |
  | The intent-change rule's placeholders, filled with longer names | about +19 | — |
  | Checks under the planning average | −20 | — |

  Duplication was removed first: the live-changes line went from 41 words to 24. Nothing else is required coverage
  repeated.
- **Review before handover** (generator Step 4):
  - the guard carries "Modes and safety", and binds its baseline per repository;
  - every patch was checked against Q1 to Q4. Each patch names the questions it touches and leaves their text
    unchanged, and the Q2 hunks are in their own provisional patch;
  - the repair instructions are the template's, with nothing telling a session to edit intent to match work;
  - the size is reported above.
- **Doc references added:** the lab `AGENTS.md` gets a "Before handing off" section (in the lab patch). ORC
  `AGENTS.md` gets a pointer; `integration.md` gives its text and why it goes in a separate pull request.
- **Validation:**
  - all three patches apply cleanly with `git apply --check` to copies of the snapshots;
  - the provisional patch applies after the settled one;
  - `git diff --no-index --check` reported no whitespace errors in any of them;
  - the guard's repository-list command
    (`node --input-type=module -e 'import { REPOS } from "./tools/collect.mjs"; …'`) printed the six repository
    paths when run on a patched copy;
  - the guard's other commands were not run, because they need GitHub, a running ORC or `node_modules`.
- **Handoff to `guards-integrator`:** `integration.md`.

---

## 10. Uncertainties, and what was not covered

- **Nothing outside the two repositories was read:**
  - GitHub (#140's rules, the PRs' security-review sections, whether issues named in `STATE.md` are open);
  - the user-wide rules;
  - `HOW_NOT_TO_PLAN.md`;
  - Moving Stillness and the other Scopes.

  Q2's "was each approved" and F13's far side depend on them.
- **No test, typecheck or command was run against ORC.** The snapshot has no `node_modules`. Claims about what tests
  check come from reading them.
- **Whether hooks are enabled is unknown** (F19). The same goes for whether `skills/` is loaded by any tool in the lab.
  The guard is reached through a pointer in `AGENTS.md` in either case.
- **The decision-owner choice (Q1) is provisional** throughout the patches.
- **Not covered:**
  - `web/src` beyond its listing;
  - most of `src/` beyond the boundary, async, package-API and adapter files named above;
  - 70 of the roughly 80 lab reports, read only by title or by search;
  - `research/`.
- **The cost counterfactual.** The guard adds a session-end step of about 5 to 10 minutes. Those minutes could have gone
  into the mechanical fixes (#144, the architecture test, #198), which would close F12, F7 and F13 without anyone
  remembering anything. The evidence cannot settle which pays back sooner. The integration brief therefore moves each
  mechanical part to tooling as soon as it exists.

Feedback on the entropy-guard skills themselves: `feedback.md`.
