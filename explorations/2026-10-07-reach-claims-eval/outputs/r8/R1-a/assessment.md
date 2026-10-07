# Entropy assessment: ORC and the orchestration-lab Scope, as one system

Run on 2026-10-07 with entropy-guard's `entropy-assessment` (v0.9.0), on read-only snapshots taken on 4 October 2026:
- `orchestrator`: ORC's repository. Its files are dated 4 Oct 14:44, and it has no `.git`.
- `scope-orchestration-lab`: the lab, the Scope that manages ORC's work. Its files are dated 4 Oct 17:31, and it has
  no `.git`.

**Mode.** The run builds into its output folder only. The targets could not be edited, so every change to them is a
proposal, delivered as `patch-settled.diff` (it touches no open question) and `patch-provisional.diff` (it waits on
`questions.md`). Nothing was committed or pushed. No live service was read: every fact below about the running
system is quoted from the snapshot, with its date.

**Route.**
- Step 1: the intent pass.
- Step 2: lifecycle and shape. The shape is **B, mixed docs and code**, across two repositories, so `mixed-profile.md`
  applies.
- Docs-first Steps 2, 3, 5 and 7 run on the lab, the docs-first member.
- Step 3 decides **`create`**.
- `session-coherence-skill-generator` writes `guard/SKILL.md`.
- `guards-integrator` writes `integration.md`.

## 1. Intent

**Steward: Justin.** `scope.yaml` line 6 says `steward: justin`, and both repositories quote him by name and date.

### Authorised intent, and where each part comes from

Each of these is Justin's own recorded words, or a decision attributed to him:

| Part | Source | Kind and authority |
|---|---|---|
| What ORC is for. Per `STATE.md`, it is "the UX surface to Justin's own agentic system". Justin, 2026-09-25: "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece". Justin, 2026-09-26: "once the six slots work, work towards a point of consolidation" | lab `STATE.md` lines 8–11 | Directive, attributed and dated. It sits in an overwritten file (F9). The first sentence is unattributed |
| Core ships with nothing tying it to a Scope, model, owner or agent. Justin, 2026-09-12: "There shouldn't be the tiniest hint of scope specific code inside the core". 2026-09-13: the open-source test | ORC `AGENTS.md` lines 30–42 | Directive, attributed and dated |
| ORC owns a general durable-work capability, scheduling included (now, at, recurring). Moving Stillness's `apply_slots` is its first user, with approval required | lab `decisions/2026-09-17-async-work-architecture.md` | Decision, attributed ("Decided by Justin on 2026-09-17, written by Claude") |
| The map of work is orchestrator#140, "the reference point for every agent" | both `AGENTS.md` files | Directive, attributed (Justin, 2 Oct) |
| The lab is the central Scope for project management, core issue tracking, code quality and security. A Scope's issues stay in its repository, on one map. The processes are kept (listed in F14). Scheduling (#166) is built first. Astra runs this assessment on both repositories. Moving Stillness is paused | lab `STATE.md` lines 33–34 and 38–55 | Decisions, attributed and dated 4 Oct, in an overwritten file (F9) |
| Claude merges a pull request once review and tests pass | lab `STATE.md` line 17 | Directive, attributed and dated 25 Sep, in an overwritten file (F9) |
| Security reviews are checked by Danger ("B", 2 Oct) | ORC `dangerfile.js` line 7, `AGENTS.md` lines 138–143 | Decision, attributed and dated |
| Scope logins are not centralised ("should DEFINITELY NOT be centralised") | ORC `src/adapters/scope-credentials.ts` lines 14–16 | Directive, attributed to "the operator" and dated 2026-09-28 |
| The browser runs through Playwright's library, not MCP | ORC `src/adapters/browser/playwright.ts` line 10 ("orchestrator#76, decided 3 Oct 2026"); lab `reports/2026-10-03-browser-stack-prior-art.md` ("It is Justin's decision, under #76") | Decision, dated. **Who made it is not recorded in the snapshot** |
| Approval cards are drawn from fixed blocks. "There are different classes of approval ..." | ORC `AGENTS.md` lines 114–128 | Directive, attributed to the operator and dated 2026-09-26 |

**Declared purpose**, which describes and does not decide:
- ORC's `README.md`, "Direction" and "Boundary";
- the lab's `SCOPE.md` and `scope.yaml` `purpose`.

**What the work actually pursued**, from `STATE.md` and the code (no git history was available):
- the browser stack: #76 and #193, resolve before acting;
- restart cards (#101);
- the package API version (#201);
- phone notices;
- invoicing through the Finance Scope;
- Moving Stillness writing to Bookwhen through an approved plan;
- reviews on request.

All of these sit within the authorised intent above. **No unauthorised drift was found.** The gaps are in how that
intent is written down.

### Gaps, by condition

- **Stale description:**
  - F3: ORC's Bookwhen client is described as present. Settled by the core-ties decision of 2026-09-12.
  - F4: the credentials claim. Settled by the operator's decision of 2026-09-28.
  - F5: scheduling is described as "deliberately absent", and Moving Stillness as planning "without applying it".
    Both are settled by the decision of 2026-09-17.
  - F1: the subprocess list leaves out the restart adapter (orchestrator#101) and Chromium (#76).
  - Each correction covers only what its decision plainly covers. In `README.md` lines 152–154, "reminders" and
    "workflow execution" are **not** plainly settled by the 2026-09-17 decision, so they are left as they are and
    noted here as open. Nobody is asked about them, because the answer changes neither a build nor a check.
- **Conflict:** F10. Two definitions of the state-file cap, forty against sixty (Q3).
- **Ambiguous:**
  - F2: whether "Direct network access exists only in" covers reach a library performs for ORC (Q1).
  - F16: the retrospective-documentation instruction.
  - F17: whether `config/installation.ts` counts as "core".
- **Missing:**
  - F9: there is no durable record for the decisions held in `STATE.md`.
  - Q2: the steward has not said where the guard he asked for lives.
- **Prose control:**
  - F12: "Claude merges a PR once review and tests pass", while nothing runs tests on a pull request. Enforcement
    would sit in CI (#144). `STATE.md` cites this rule as the merge condition.
  - F13: the map check, described as able to fail, passes falsely in two known cases.
- **Unauthorised drift:** none found.

**Existing guards' repair instructions, read against the intent-change rule.** Neither repository has a session guard.
The standing instructions that act as guards were read instead:
- `AGENTS.md` in both repositories;
- `SECURITY-REVIEW.md`, `dangerfile.js`, both pre-push hooks, and the ratchet rule in `test/core-ties.ts` as
  `AGENTS.md` describes it.

None of them says to edit intent to match the work. Two results:
- **Ownership: one repair keeps two places in step, and it is not flagged.** The lab's `AGENTS.md` line 19, for a
  resource that joined or left: "`scope.yaml`, then one line in `SCOPE.md`". `SCOPE.md` line 23 calls `scope.yaml`
  "the formal resource inventory", so `SCOPE.md` is a summary of it, not a competing definition.
- **Intent: one instruction is flagged, at low size (F16).** ORC's `AGENTS.md` lines 154–155: "Keep documentation
  concise and retrospective: record only what the implementation and real use established". It can be read as
  licence to rewrite a prescribed boundary, such as the reach lists, to match the code. Rule 6 in the guard's copy of
  the intent-change rule covers this.

**Questions:** Q1, Q2 and Q3, in `questions.md`, each with a recommended answer. **Proposed changes and where they are
recorded:**
- The decisions found only in `STATE.md` are copied, not decided again, to a new lab record,
  `decisions/2026-10-04-steward-decisions-from-state.md` (settled patch).
- No change of intent is proposed.

## 2. Lifecycle, shape, repositories

- **Lifecycle: active.** The evidence:
  - `scope.yaml` has `status: active`;
  - `STATE.md` was updated on 4 Oct 17:31;
  - four restarts onto newly merged work are recorded on 4 Oct;
  - ORC runs as `orc.service`.
- **Shape: B, mixed docs and code.** The evidence:
  - ORC has 178 TypeScript files in `src/` and `test/` (111 in `src/`), with 970 tests recorded on 4 Oct, and 15 Markdown files at its top
    level, three of them live rules (`README.md`, `AGENTS.md`, `SECURITY-REVIEW.md`);
  - the lab is docs-first, about 100 files with no product code, and holds state, decisions and reviews.
- **D, workflow-heavy, also fits.** The issue map, cards, Danger and the restart flow are all workflow. B was taken as
  the riskier of the two, because the costliest drift found runs between docs and code (F1–F4). The mixed profile's
  workflow checks cover D.
- **Repositories: two, assessed as one system.** The lab manages ORC's work (`SCOPE.md`, and the decision of 4 Oct),
  and its tools read ORC's checkout and its state directory.
- **Outside the snapshot, and not read:**
  - the Moving Stillness and Finance Scope repositories;
  - the Bookwhen ops tool;
  - local-config, with the user-wide `AGENTS.md`;
  - `~/pro/scope`;
  - `~/pro/agentic/HOW_NOT_TO_PLAN.md`;
  - GitHub issues, including #140's rules.

**Planning horizon, for docs-first Step 1:**
- **Settled:**
  - core ties;
  - the durable-work architecture (17 Sep);
  - the map, #140;
  - security review by Danger;
  - the browser through Playwright's library (#76).
- **Active:**
  - the browser stack: #193 is live, and Moving Stillness is paused;
  - scheduling, #166, first;
  - authority rules, one step at a time (#149);
  - type labels;
  - the package API version.
- **Exploratory:**
  - Iris's role and the handover experience, open in `memory/authority-rules-step-1.md`;
  - ADA (#23);
  - `AGENT_IDEAS.md`.

**Domains present and actively changed:**
- code;
- documentation;
- tests;
- contracts: the package API report;
- workflow: the map, Danger, cards;
- live operational state: `orc.service` on athena, cards and grants, Scope credentials, the Bookwhen site through the
  browser, the ntfy topic, the GitHub Project.

**Ownership across the two repositories:**
- **ORC's repository owns** its code, its boundaries and rules (`AGENTS.md`), the security review, the package API
  and approval cards.
- **The lab owns** current state, process decisions, the friction log, reviews and the map tooling.
- **GitHub owns** open work: issues on #140.
- **Concepts with two or more homes:** ORC's live state directory (F11); decisions (F9); the state-file cap (F10);
  the list of repositories in the system (F13, F19); one-off reports about ORC, kept in both repositories (F7); and
  Scope-specific settings kept in ORC's `config/installation.ts` (F17).

## 3. Findings

One list. The other sections refer to these by id.

**F1. ORC's subprocess list is incomplete.**
- **The claim.** ORC's `AGENTS.md` lines 92–96 name three modules that launch processes: `child-agent-process.ts`,
  `analysis-tools.ts` and `mcp/client.ts`.
- **What the code and test show.**
  - The code and `test/architecture.test.ts` lines 822–836 have a fourth: `src/adapters/orc-service.ts`, from
    orchestrator#101. It runs git reads, `systemctl --user restart orc.service`, `node scripts/build.mjs` and
    `pnpm install --frozen-lockfile`.
  - Neither the document nor the test lists Chromium, launched through Playwright's library at
    `src/adapters/browser/playwright.ts:55` since #76, decided 3 Oct 2026.
- **Source:** the reach record in section 4.
- **Status:** corrected in the settled patch, which also adds the browser-launch assertion to the test. The test
  change was not run.

**F2. ORC's network "only" list is incomplete.**
- **The claim.** `AGENTS.md` lines 98–101 and the test at lines 1295–1312 agree on two modules: `research-tools.ts`
  (Jina) and `ntfy.ts`.
- **Not listed, under any reading:** ORC's own DNS lookups at `playwright.ts:14` and `:520`. The test's patterns
  omit `dns`.
- **Not listed, if "direct" includes reach a library performs for ORC:**
  - Chromium sessions to approved hosts, carrying the Scope's stored login (`playwright.ts:55`, `:69`, `:215`;
    hosts in `config/installation.ts`);
  - Pi's calls to the model provider (`runtime.ts:343`, `:373`, `:510`, `:536`; `app/conversations.ts:98`;
    `backends/pi/task-execution.ts:81`, `:279`; and the researcher child);
  - registry access by `pnpm install` on a restart card (`orc-service.ts:128`);
  - the reach of declared MCP servers (`mcp/client.ts:60`);
  - approved Scope package code imported into `orc.service` (`app/agent-packages.ts:444`), with connectors such as
    SMTP to `smtp.protonmail.ch:587` and the Bookwhen calendar token (`config/installation.ts`).
- **A document and a test agreeing is not completeness.** This is Q1.
- **Status:** the settled patch marks the list incomplete; the provisional patch rewrites it.

**F3. ORC's README and AGENTS.md name a Bookwhen client that does not exist.**
- **The claims.**
  - `README.md` lines 76–79: `ORCHESTRATOR_BOOKWHEN_API_TOKEN` and `@jphil/bookwhen-client@0.6.1`.
  - `AGENTS.md` lines 102–103: "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client".
- **What the code shows.**
  - Nothing reads the variable: an environment search of `src`, `scripts` and `config`.
  - `package.json` has no such dependency.
  - `src/bookwhen.ts` is absent.
  - The test at lines 1314–1315 asserts that the client is absent.
- **Decision that settles it:** Justin's, 2026-09-12 (core ties).
- **Found before, and still unfixed on 4 Oct:**
  - `reports/2026-09-29-backlog-inventory.md` line 212;
  - `reports/2026-10-01-design-review.md` lines 175–178;
  - `reports/2026-10-01-review-synthesis.md` item 7.
- **Status:** corrected in the settled patch.

**F4. ORC's README credential claim is false.**
- **The claim.** `README.md` lines 103–104: "A credential is read in exactly one place, `src/runtime.ts` ... No
  subprocess ORC launches receives one."
- **What the code shows.**
  - Scope credentials are read by `src/adapters/scope-credentials.ts` lines 43–60, through
    `app/agent-packages.ts:466`, per the operator's decision of 2026-09-28.
  - The web token is read by `src/web-cli.ts:625`.
  - The env file is read by `scripts/orc-env.sh`.
  - Chromium receives the Scope's stored login (`playwright.ts:57`, `:69`).
- **Not checked:** whether the researcher child's `PI_CODING_AGENT_DIR` (`child-agent-process.ts:372`) or an MCP
  server's declared environment carries a credential. Pi and the MCP SDK are not in the snapshot.
- **Also:** `README.md` is not a Danger-guarded path (`dangerfile.js` lines 11–26), so a pull request that changes
  these security claims is not asked for a review.
- **Status:** corrected in the settled patch, which marks the unverified part.

**F5. ORC's README describes scheduling as absent and the Bookwhen write as not happening.**
- **The claims, all against the decision of 2026-09-17:**
  - `README.md` lines 152–154 list scheduling as "deliberately absent";
  - lines 146–147 say Moving Stillness plans "without applying it";
  - lines 4–7 call the external paths "read-only".
- **What exists:** the browser writes to Bookwhen's admin pages through approved plans (`granted-actions` in
  `config/installation.ts` includes `click`, `replace` and `select`).
- **Status:** corrected in the settled patch. "Reminders" and "workflow execution" are left open.

**F6. The lab's README describes options and timings the tool does not have.**
- **The claims.** `README.md` line 18 documents `node tools/report.mjs --serve`, and line 16 gives the full run as
  "~10s".
- **What the code shows.**
  - `report.mjs` has no `--serve`, and says "nothing is served" (line 13).
  - Its own figure is about two minutes with tests, and ten seconds without (lines 8–9).
  - The README also omits that each run writes to the GitHub Project (`syncProject`, `report.mjs:56`).
- **Status:** corrected in the settled patch.

**F7. Superseded material sits at ORC's top level.**
- **What is there.** Twelve one-off reports, unmarked except `MCP.md`: `CLASSIFY`, `FIXES`, `GRANTS-E2E`, `GRANTS`,
  `MCP`, `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`, `TURN-RECORD` and `VISIBILITY`.
- **Files they name that have moved:**
  - `SLICE1.md` lines 7 and 24 name `src/adapters/browser/service.ts`;
  - `POLICY-STORE.md` line 13 names `src/core/policies.ts`, which is now `src/core/agents/policies.ts`.
- **A live pointer into one of them.** The systemd unit's `Documentation=` points at `OPERATOR.md`
  (`scripts/orc-service.ts:41`), a branch report about approval cards.
- **Already proposed:** design-review target 4 (30 Sep) proposes "harvest, then delete", on Justin's word.
- **Status:** the settled patch adds a README note and repoints `Documentation=`. Deletion is left to target 4.

**F8. The lab's `STATE.md` is dishonest about the current state.**
- **It contradicts itself on which ORC build runs.**
  - Lines 58 and 88: `369628b` since 3 Oct 22:12:47.
  - Lines 31–36: restarts on 4 Oct onto `3989cdb`, `adaa127`, `6d89ce7` and `8cee662`, the last at 14:48:27.
- **It contradicts itself on Moving Stillness.** Line 91 gives `c759f96` and the 3 Oct cards; line 32 gives MS #53 as
  `fc830aa`, with cards approved 4 Oct 13:40:50.
- **It lists a grant as current that had expired.** Line 94: grant `e9675bd9` "until 1 Oct 18:00Z", in a file updated
  4 Oct.
- **It is over both caps.** It has 87 non-blank lines.
- **It holds durable rules.** "How we work" and the map's usage instructions belong elsewhere.
- **Prior instances:** `FRICTION.md` entries of 2026-09-12, 2026-09-22 and 2026-09-23.
- **Status:** the settled patch rewrites the file from its own latest entries, keeping line 4 because Q3 quotes it.

**F9. Justin's decisions are held only in an overwritten file.**
- **The decisions:** the 4 Oct interview, the north star (25 and 26 Sep), the merge rule (25 Sep) and the pause of
  Moving Stillness (4 Oct).
- **Where they are:** only in `STATE.md`, which `AGENTS.md` line 33 says is overwritten at each verified event.
  `decisions/` holds a single record, from 2026-09-17.
- **Also outside both repositories:** `memory/authority-rules-step-1.md` line 5 points to a plan held at
  `~/.claude/plans/agile-booping-waffle.md`, in one vendor's folder outside both repositories.
- **Status:** the settled patch copies the decisions to `decisions/` and adds the rule to `AGENTS.md`.

**F10. Two definitions of the state-file cap.**
- **The lab's `AGENTS.md`** lines 33–34: "about forty content lines".
- **`STATE.md`** line 4: "Target: sixty lines".
- **Status:** this is Q3. The provisional patch makes `AGENTS.md` the one owner.

**F11. ORC's live state directory has three homes.**
- **ORC's default:** `~/.local/share/orchestrator` (`src/runtime.ts:190`).
- **The running service's:** the value in its env file. Only `scripts/orc-service.ts` lines 131–134 resolve it.
- **The other operator scripts** (`async-work`, `approval-grants`, `approve-agent-package`, `execution-policies`,
  `activate-research-agent`, `timeline`) use the default unless the shell sets `ORCHESTRATOR_STATE_DIR`.
- **The lab's `tools/collect.mjs:16`** hard-codes `~/.local/share/orchestrator-proof`.
- **Cost recorded:** `FRICTION.md` 2026-09-28 records three confusions and wrong claims.
- **Already tracked:** design-review target 5 and #62.
- **Status:** the settled `STATE.md` names it under "misleading nearby". The guard checks it.

**F12. A rule is written as if enforced: tests before merge.**
- **The rule.** `STATE.md` line 17: "Claude merges a PR once review and tests pass".
- **What enforces it.** The only CI is `.github/workflows/danger.yml`, which checks the sections of the pull
  request's description. Nothing runs `pnpm typecheck` or `pnpm test` on a pull request.
- **The same gap elsewhere.** `README.md` line 135 says `test/architecture.test.ts` "enforces the boundaries", which
  holds only when someone runs it.
- **Already tracked:** #144, with the mechanism not yet chosen.

**F13. The map check passes falsely.**
- **The check.** The lab's `AGENTS.md` line 10 relies on `node tools/map.mjs --check`.
- **Two false passes**, confirmed on 4 Oct in `reports/2026-10-04-labels-review-astra.md`:
  - a failed repository read becomes an empty list;
  - `collect.mjs` reads 6 repositories, while the map spans 9.
- **Part of the kept process is missing.** "Map and label check" was kept on 4 Oct, and `map.mjs` has no label
  check.

**F14. Some processes are declared but missing, or decided but not built.**
- **Declared but missing:** "Entropy guard at session end" was kept on 4 Oct, and neither repository has a guard. The
  lab's `skills/` holds only `.gitkeep`.
- **Decided, not built:**
  - the daily diary;
  - the weekly adversarial review;
  - FRICTION into rules, monthly (#60);
  - branch cleanup (#70);
  - `/tmp` cleanup (#182).

  All of them wait on #166.
- **Evidence the diary is not running daily:** its snapshots stop at `reports/2026-10-02.json`.

**F15. Both pre-push hooks print a summary and never block.**
- **What they do:** `.githooks/pre-push` in each repository prints a summary of worktrees and branches.
- **Whether they run cannot be read from the snapshot:** there is no git configuration to show `core.hooksPath`.
- **Precedent:** `FRICTION.md` 2026-09-23 records a committed hook in Moving Stillness that never ran.
- **ORC's `AGENTS.md` lines 145–150 describe the hook correctly.**

**F16. Ambiguous: the retrospective-documentation instruction.**
- **The instruction.** ORC's `AGENTS.md` lines 154–155 and `README.md` lines 22–23 say documentation records "only
  what the implementation and real use established".
- **The second reading.** It could be taken as licence to make boundary statements follow the code (see F1 and F2).
- **Size:** low. Rule 6 in the guard covers it.

**F17. Ambiguous: is `config/installation.ts` part of "core"?**
- **What is there.** ORC's `config/installation.ts` carries 46 references to Moving Stillness, Finance and Bookwhen,
  and a default model (`gpt-5.6-sol`).
- **Why it matters.** The core-ties ratchet scans only `src/` and `web/src/`, while `AGENTS.md` lines 30–42 test
  "core" against open-sourcing.
- **Already tracked:** design-review target 1, map B6 (#154), and #62. Not asked again.

**F18. Review findings do not close.**
- **The case.** The README's stale facts (F3) were reported on 29 Sep, 30 Sep and 1 Oct, and the file was unchanged
  on 4 Oct.
- **Where review output goes.** Reviews land as files in the lab's `reports/` (68 Markdown files). Code findings
  get issues (`reports/2026-10-01-review-synthesis.md`). Cleanups wait on "your word", and no issue for the README
  was seen in the 4 Oct map overview.
- **Not checked:** GitHub itself.

**F19. The lab's `scope.yaml` does not record the repositories the lab now manages.**
- **What it lists.** `scope.yaml` lists only `orchestrator` and `status-tracker`, with `uses: {}`.
- **What the lab now does.** The 4 Oct decision makes it the central Scope across ORC's Scopes, and `collect.mjs`
  reads 6 repositories.
- **Uncertain:** whether `uses` should record them depends on `~/pro/scope/docs/MODEL.md`, which was not read.
- **Size:** low.

## 4. Reach record (for F1, F2 and F4)

**Paths searched:**
- in `orchestrator/`: `src/`, `scripts/`, `config/`, `e2e/`, `web/src/` and `playwright.config.ts`, with test files
  excluded unless named;
- in `scope-orchestration-lab/`: `tools/`.

**Not searched:**
- Scope package code (Moving Stillness, Finance), which is outside the snapshot;
- `node_modules`, which is absent, so the internals of Pi, Playwright and the MCP SDK were not read;
- the Bookwhen ops tool;
- local-config's `push-summary`, which the hooks call.

**Tools.** The searches used ripgrep 14.1.1. ast-grep and Semgrep are not installed on the machine this ran on;
checked with `which` on 2026-10-07.

**The searches, in order:**
1. Network: `\bfetch\(`, `https?\.request`, `net\.connect`, `new WebSocket`, `undici`, `axios`, `XMLHttpRequest`,
   `EventSource`, and `from "node:(http|https|net|dns|tls)"`. Then the whole word `fetch`, and `globalThis\.fetch`.
   Then `node:dns`, `\blookup\(` and `resolve4|resolve6`.
2. Subprocesses: `child_process`, `\bspawn\(`, `\bspawnSync\(`, `\bexecFile(Sync)?\(`, `\bexecSync\(`, `\bfork\(`,
   `StdioClientTransport` and `execa`.
3. Browser launch: `chromium`, `firefox`, `webkit`, `\.launch\(`, `launchPersistentContext`, and imports from
   `playwright` or `@playwright`.
4. Environment and credentials: `process\.env`, `\benv\[`, `env\.ORCHESTRATOR`, `ORCHESTRATOR_[A-Z_]+` and
   `ORC_[A-Z_]+`, then reading `scope-credentials.ts`.
5. Loading code into the process: `await import\(`.
6. The model runtime: `createAgentSession`, `AuthStorage`, `ModelRegistry`, `getAgentDir`, and imports of
   `@earendil-works/`.
7. Storage: `DatabaseSync` and `node:sqlite`; files containing `writeFile`, `appendFile`, `mkdir` or `rename(`.

Each row below is one hit: the reach, the code that does it, the process that runs it, and whether ORC's `AGENTS.md`
list of 4 October and `test/architecture.test.ts` cover it.

| Reach | Code | Process that runs it | `AGENTS.md` list (4 Oct) | Architecture test |
|---|---|---|---|---|
| Jina Reader over HTTPS (`r.jina.ai`) | `src/core/research-tools.ts:8`, `:35` | Researcher child, spawned by `child-agent-process.ts:532` | Network: yes | Yes |
| ntfy publish | `src/adapters/notifications/ntfy.ts:84`, `:120`; reached from `src/adapters/phone/index.ts:14` | `orc.service` | Network: yes | Yes (`phone` passes `fetch` as a value, which no pattern matches) |
| Headless Chromium, its navigation, and the request handler, with the Scope's login | `src/adapters/browser/playwright.ts:16`, `:55`, `:57`, `:69`, `:86`, `:215` | A Chromium child of `orc.service`, one per session | Neither list | Neither check |
| DNS lookups of the approved hosts | `playwright.ts:14`, `:520` | `orc.service` | No | No (the patterns omit `dns`) |
| The model provider, through Pi | `src/runtime.ts:16–19`, `:343`, `:373`, `:510`, `:536`; `src/app/conversations.ts:98`; `src/backends/pi/task-execution.ts:81`, `:279` | `orc.service`, and the researcher child (`PI_CODING_AGENT_DIR`, `child-agent-process.ts:372`) | No | The test confines which modules use the model runtime, not where it connects |
| git reads; `systemctl --user restart`; `node scripts/build.mjs` (which runs git and node, `build.mjs:17–18`); `pnpm install --frozen-lockfile`, which uses the registry when a package is missing | `src/adapters/orc-service.ts:71`, `:102`, `:107`, `:128` | `orc.service`, on an approved restart card | Subprocess: no. Network: no | Subprocess: yes (#101). Network: no |
| `git log` for the analyst | `src/core/analysis-tools.ts:300` | Not determined | Yes | Yes |
| The Pi researcher child | `src/core/child-agent-process.ts:532` | A child of `orc.service` | Yes | Yes |
| A declared MCP server | `src/adapters/mcp/client.ts:60` | The server, a child of `orc.service` | The launch: yes. Its reach: no | Yes |
| Approved Scope package code, imported into the process | `src/app/agent-packages.ts:444` | `orc.service` | Only as a class ("Approved Scope packages may implement ...") | No: it is outside `src/` |
| Scope connectors bound by the installation: calendar token; ops tool; browser; advert files; client records; mail to `smtp.protonmail.ch:587` | `config/installation.ts`, roughly lines 115–168 | `orc.service`, in the package's code | Only as a class | No |
| Scope credential files | `src/adapters/scope-credentials.ts:43–60`, through `app/agent-packages.ts:466` | `orc.service` | `README.md` says "exactly one place, `src/runtime.ts`": contradicted | — |
| The web token | `src/web-cli.ts:625` | `orc.service` | `README.md`: contradicted | — |
| Inbound HTTP on `127.0.0.1` (listening, not reach) | `src/web-cli.ts:43`, `:486`; `src/web-server.ts:8` | `orc.service` | — | — |
| Local abstract sockets for file locks (not network) | `src/file-lock.ts:2`, `:174` | `orc.service` | — | — |
| SQLite storage | `src/adapters/async-store/sqlite.ts:9`, `:106` | `orc.service` | — | — |

**Run by hand, outside the service:**
- ORC's `scripts/build.mjs`, which runs node and git;
- `scripts/dev-web.mjs:89`, which spawns the development servers;
- `scripts/update-pi.mjs:32`, which runs pnpm and so reaches the registry;
- `scripts/orc-service.ts`, which runs systemctl and git and reads the env file;
- the operator scripts, which open the SQLite store directly.

**The lab's tools, also run by hand:**
- `collect.mjs:33` runs commands through `execFileSync`;
- `collect.mjs` lines 71–100 call `gh`, reading the GitHub API;
- `collect.mjs:192` runs `bash -c "cd … && pnpm -s exec vitest run"` in ORC's and Moving Stillness's checkouts;
- `map.mjs` lines 48–162 call `gh`, writing to the GitHub Project with `item-add` and field edits;
- `report.mjs:56` runs `syncProject`, another write to the GitHub Project, and writes `status.html` and
  `reports/<date>.json`.

## 5. The lab: truth map and loop map (docs-first Steps 2 and 3)

**Truth map.** For each major concept, its one canonical home, and the documents that only restate or summarise it:

| Concept | Canonical home | Restated or summarised in |
|---|---|---|
| Scope identity, steward, purpose, projects | `scope.yaml` | `SCOPE.md`, as a summary, and `README.md` |
| The split of authority between ORC, the Scope model and the lab | `SCOPE.md` | `AGENTS.md`, "Where a learning goes" |
| Working rules for this Scope | `AGENTS.md`; `CLAUDE.md` is a symlink to it | `STATE.md`, "How we work" (F8). Its rules come from user-wide rules owned in local-config |
| Decisions | `decisions/`, which holds one record | `STATE.md` (F9); `memory/authority-rules-step-1.md` (Justin's answers of 1 Oct); code comments; issue descriptions |
| Current state | `STATE.md` | `status.html` and `reports/<date>.json`, generated projections |
| Open work | GitHub issues on the map, #140 | `STATE.md`, "Waiting on Justin" |
| What broke in real use | `FRICTION.md`, a dated log, newest first | — |
| Ideas | `AGENT_IDEAS.md`, a log | — |
| Reviews, designs and prior art | `reports/*.md`, `research/`: historical, dated | — |
| The state-file cap | Conflicting, F10 | — |
| The repositories in the system | Conflicting: `scope.yaml` lists 2, `collect.mjs` 6, the map 9 (F13, F19) | — |
| ORC's live state directory | Conflicting, F11 | — |

**The roles of the other documents:**
- **Product artifacts:** `tools/*.mjs`, whose command names and options are contracts.
- **Template:** none.
- **Empty:** `skills/` and `workflows/`, which hold only `.gitkeep`.

**Loop map, the real loop, read from the files.**
1. **Start.** An agent loads `AGENTS.md`.
   - In the lab, through the `CLAUDE.md` symlink. It then reads `STATE.md`, then `SCOPE.md`, then #140 through
     `node tools/map.mjs`.
   - In ORC, through `AGENTS.md`. ORC has no `CLAUDE.md`. It then reads `README.md`, the architecture test and #140.
2. **Tracking.** Issues are placed on #140. An agent marks one with `map.mjs working` and clears it with
   `map.mjs stopped`. GitHub Project 4 shows the marks.
3. **A change to ORC.** It is made on a branch or worktree, with tests run by hand. A pull request follows, and Danger
   checks its description for `## Security review` and `## Package API`. Reviews come from Astra or Claude, and their
   reports go to the lab's `reports/`. Claude merges (rule of 25 Sep). The checkout is pulled, and ORC raises a
   "Restart ORC onto <commit>" card. Justin approves it, and ORC builds the commit, swaps it in and restarts.
   `pnpm service:status` then says what runs.
4. **Decisions** are captured mostly in `STATE.md`, which is overwritten. Occasionally they go to `decisions/`, a
   code comment or an issue.
5. **Learnings** go to `FRICTION.md`, `memory/` and `AGENT_IDEAS.md`.
6. **Handoff.** `STATE.md` is overwritten at each verified event, then the work is committed. There is no session-end
   check.
7. **The daily diary** (`report.mjs`) is run by hand. Reviews run on request. Scheduled work waits on #166.

**Where follow-up gets lost:**
- decisions recorded only in `STATE.md` (F9);
- review findings that wait on a yes (F18);
- the map follow-ups listed in `STATE.md` that may not be issues.

## 6. Ranked risks

Ranked by decay rate times recovery cost, from highest:

1. **The reach inventory is incomplete while the document and the test agree (F1, F2, F4).**
   - **Decay: fast.** Each browser or connector change moves it; there were two in two days (#76 on 3 Oct, #193 on
     4 Oct).
   - **Recovery: high.** Security reviews (`SECURITY-REVIEW.md` question 2) and the trifecta rule reason from these
     lists, and the channel they leave out is a logged-in browser on a live business site.
   - **The fix is anchored in** `AGENTS.md`, "Boundaries", and the architecture test.
2. **Decisions and live facts sit in an overwritten state file (F8, F9, F10).**
   - **Decay: every event.** Each verified event overwrites the file.
   - **Recovery: high.** A lost decision can only be recovered by digging through git history. Wrong live claims
     have already reached Justin (`FRICTION.md`, 12, 22 and 23 Sep).
   - **The fix is anchored in** `decisions/` and `AGENTS.md`, "Keeping state".
3. **ORC's live state directory has three homes (F11).**
   - **Decay: medium.** Every new script or tool picks a directory.
   - **Recovery: medium-high.** Wrong claims about live durable work have been made three times.
   - **The fix is anchored in** design-review target 5 and #62.
4. **Checks that do not run by themselves, or pass falsely (F12, F13, F14, F15).**
   - **Decay: continuous.**
   - **Recovery: medium.** The fixes are #144, the follow-ups to the labels review, and #166.
5. **Stale entry documents and superseded reports, with findings that do not close (F3, F5, F6, F7, F18).**
   - **Decay: slow.**
   - **Recovery: low for each item.** But each review rediscovers them.

## 7. Existing guard surfaces, sorted by whether they execute

- **Runs by itself:**
  - Danger's security-review and package-API checks on every ORC pull request. They were proven on GitHub on 2 Oct
    (pass, fail with the section removed, pass restored), according to `STATE.md` lines 79–81; this was not
    re-checked. A direct push to `main` is not checked.
  - The restart card's watcher, which raises a card within a minute of the checkout moving past the running build.
    It builds; it does not test.
- **Runs only by hand:**
  - `pnpm typecheck`, `pnpm test` (the architecture test, the core-ties ratchet), `pnpm test:e2e` and
    `pnpm api:report`;
  - `SECURITY-REVIEW.md`;
  - `node tools/map.mjs --check` (F13);
  - `tools/report.mjs`.
- **Decided, not built:**
  - tests on every pull request (#144);
  - the daily diary, the weekly adversarial review, FRICTION monthly (#60), branch cleanup (#70) and `/tmp` cleanup
    (#182), all through #166;
  - the label check.
- **Declared, but missing:** the entropy guard at session end (F14).
- **Unknown:** both pre-push hooks. They only remind, and whether they are enabled cannot be read from the snapshot
  (F15).

**Keep, amend, replace or demote, for docs-first Step 7:**
- **Keep:** Danger; the restart card; the architecture test; `SECURITY-REVIEW.md`; both hooks, as reminders.
- **Amend:**
  - the lab's `AGENTS.md` "Keeping state" (settled patch);
  - the pointers in both `AGENTS.md` files (provisional, Q2);
  - `map.mjs --check` (F13);
  - ORC's pull-request template, with a guard-report line (`integration.md`);
  - the architecture test (settled, and provisional on Q1).
- **Replace or demote:** nothing. A sound guard surface is refined rather than replaced, and none of them competes
  with the new guard.

**Mechanical checks belong to tools.**
- **Links:** lychee, which is not installed here.
- **Instruction files:** ctxlint or agnix, neither installed.
- **Identifiers and launches named in prose:** ast-grep or Semgrep, neither installed. ripgrep is installed, and the
  guard uses it.
- **Reach:** the project's own architecture test, extended by the provisional patch.

Check that each tool is installed before any guard depends on it.

## 8. Recommendations and one-time cleanup

Each item was checked against the file as it stands in the snapshot.

**Consolidate:**
- Decisions go to `decisions/` (settled patch, F9).
- The state-file cap goes to `AGENTS.md` (provisional, Q3).
- One owner for ORC's live state directory: the running ORC publishes where it is (design-review target 5 and #62,
  F11). This is not patched, because it is code work already tracked.

**Demote to links:** `STATE.md`'s "How we work" section and the map's usage instructions, which `AGENTS.md`, #140 and
the user-wide rules own (settled patch, F8).

**Mark as historical:** ORC's top-level reports, through a note in the README (settled patch). Harvesting and
deleting them is design-review target 4, on Justin's word (F7).

**One-time cleanup, all in the settled patch:**
- the contradictions in `STATE.md` and its expired grant (F8);
- the README's Bookwhen, credentials, scheduling and apply statements (F3, F4, F5);
- the lab README's `--serve` and timings (F6);
- the systemd `Documentation=` line (F7).

**Not patched, and recommended:**
- Add `README.md` to Danger's guarded paths, because it carries security claims (F4). This is a guarded change and
  needs its own pull request with a security review.
- Fix `map.mjs`'s two false passes (F13).
- Move the authority-rules plan out of `~/.claude/plans/` into the lab (F9).

## 9. The state file and the patches

**State file (docs-first Step 5).** The settled patch rewrites the lab's `STATE.md` from its own latest entries.
- **Size:** 38 content lines, 44 non-blank lines with headings.
- **What it now holds:**
  - the stage;
  - the documents to trust first;
  - links to the decisions;
  - live facts marked "as recorded on 4 Oct (not re-read since)";
  - the items waiting on Justin, including Q1–Q3;
  - the misleading material nearby;
  - three next actions;
  - what makes it stale, and who refreshes it.
- **No live fact was re-read.** The latest recorded value of each was kept, and older values of the same fact were
  removed.

**Every hunk of both patches was read against the findings and the open questions** before delivery. The patch files'
headers map each hunk to its findings or question. The checks:
- **No settled hunk edits text a question quotes.**
  - `STATE.md` line 4 ("Target: sixty lines", quoted by Q3) is kept verbatim.
  - The sentence of ORC's `AGENTS.md` that Q1 quotes is untouched. The settled patch only adds a note after its
    paragraph, and changes the separate Bookwhen sentence beside it.
- **No settled hunk states as fact what a question asks.**
  - The README and `AGENTS.md` describe what Chromium does, which is code fact. They do not say whether the network
    inventory includes reach performed through a library.
  - The guard's path appears only in the provisional patch.
- **Every hunk that restates a list a finding calls incomplete either completes it or marks it.**
  - The README's reach paragraph is marked "not a complete inventory".
  - The credentials paragraph names what was not checked.
  - The subprocess list is completed for ORC's own code, per the reach record; package code is described as running
    in-process, outside the test's scan.
- **No settled hunk contradicts a finding.**

**Validation.**
- Both patches apply cleanly to the snapshots, in order, and `git diff --check` reports nothing (2026-10-07).
- The test changes were **not run**, because the snapshot has no `node_modules`.

## 10. The guard decision and the generator's inputs

**Decision: `create`.** No guard exists in either repository, and Justin decided on 4 Oct that an entropy guard runs
at session end (F14).

**The generator's inputs:**
- **Steward:** Justin.
- **Authorised intent:** the lab's `SCOPE.md` and `scope.yaml` `purpose`; ORC's `README.md` "Direction"; ORC's
  `AGENTS.md`, its core-ties and boundary sections; the lab's `decisions/`.
- **Decision surface:** the lab's `decisions/`, or the issue that owns the concern on #140.
- **Open intent questions:** Q1. Two phrases stay open without a question: "reminders" and "workflow execution", in
  `README.md` lines 152–154.
- **Current-state file:** the lab's `STATE.md`. The agent that saw a verified event refreshes it. Its cap is
  **unresolved** (Q3).
- **Rules owned elsewhere:**
  - `~/pro/local-config/home/AGENTS.md` (not read);
  - `HOW_NOT_TO_PLAN.md` (not read);
  - `~/pro/scope/docs/MODEL.md` (not read);
  - ORC's `SECURITY-REVIEW.md` and `dangerfile.js`;
  - #140's rules (not read);
  - the merge rule, now in the decisions record.
- **Verification commands:** `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report` and
  `node tools/map.mjs --check`, all **by hand**. Only Danger runs by itself.
- **Code areas, with the docs and tests that describe them:**

  | Code area | Described by |
  |---|---|
  | Reach and credentials | `AGENTS.md` "Boundaries", `README.md` "Run" and "Boundary", the architecture test |
  | Service and restart | `README.md` "As a service" |
  | Package API | `src/package-api.api.md`, Danger |
  | Durable work, cards and grants | the 2026-09-17 decision, `AGENTS.md` "Approval cards" |
  | Pi | `README.md` "Pi" |
  | Lab tools | the lab's `README.md` |

- **Live operational state a session can change:**
  - `orc.service` on athena;
  - restart, package and grant cards;
  - Scope credentials;
  - the Bookwhen site, through the browser (Moving Stillness is paused);
  - the ntfy topic;
  - the GitHub Project, written by `map.mjs` and `report.mjs`;
  - mail, which is parked behind #137.
- **Spend:** none identified in the snapshot.
- **Findings:** F1–F19.
- **The guard's placement:** **unresolved** (Q2).

## 11. What the generator produced

- **The guard:** `guard/SKILL.md`. Its recommended path is `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`,
  provisional on Q2.
- **What it leaves visible:** Q1–Q3, as an "Unresolved" pointer.
- **Size: 1,229 words** (`wc -w`), against a **budget of 1,202 words**. The budget's terms:
  - the common contract: 724;
  - eight repo-specific checks at 36 words each: 288;
  - the "Where things live" values: 110;
  - repo-specific commands: 80.
- **The excess is 27 words, about 2%.** It comes from two things, both needed because the system spans two
  repositories:
  - the "What changed" step tells the agent to run in each repository touched;
  - the first standing check maps each of ORC's code areas to its document.

  There was no duplicate to remove.
- **Review before handover:**
  - the guard carries "Modes and safety";
  - it binds a baseline per repository, falling back to `origin/main`;
  - its repairs never route work into intent documents;
  - the copied intent-change rule is v2, filled in.
- **Mentions in operator documents:** the "Before handing off" pointers in both `AGENTS.md` files. They are
  provisional on Q2.
- **Handoff:** to `guards-integrator`, in `integration.md`.

## 12. Questions, uncertainties, and what was not covered

**Questions:** Q1–Q3 in `questions.md`. Asks already put to Justin by earlier work are listed there too, and not
repeated.

**Not covered:**
- live services: no read of ORC, Bookwhen, GitHub or ntfy;
- git history and commit messages, which the snapshots lack;
- GitHub issues, including #140's rules and the issues numbered here;
- the repositories and files outside the snapshot listed in section 2;
- Pi, Playwright and MCP SDK internals;
- whether any test passes.

**Uncertain:**
- whether Pi's agent directory or an MCP server's environment carries credentials (F4);
- who decided #76;
- whether the hooks are enabled (F15);
- whether Claude Code sessions in ORC load its `AGENTS.md`, since ORC has no `CLAUDE.md`;
- whether the map follow-ups in `STATE.md` are already filed as issues;
- what `uses` means in `scope.yaml` (F19).

**The difference between proposal and decision:**
- Everything in both patches, and the guard, is a proposal. The patches are not applied, and the guard is not
  installed.
- The decisions record only copies Justin's existing decisions.
- Nothing here decides an open question.
