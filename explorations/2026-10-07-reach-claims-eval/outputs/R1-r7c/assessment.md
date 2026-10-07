# Entropy assessment: ORC and the orchestration lab, as one system

Run on 2026-10-07 by an agent following entropy-guard's `entropy-assessment` (v0.9.0), in build mode, on read-only
snapshots of the two repositories, with no git metadata (`orchestrator` files dated 4 Oct 14:44, `scope-orchestration-lab`
4 Oct 17:31). No steward was available. Nothing in the targets was edited. Changes are offered as two patches:
`patch-settled.diff` and `patch-provisional.diff`.

Paths below are relative to each repository: **ORC** is `orchestrator/`, **the lab** is `scope-orchestration-lab/`.

## Route taken

1. Intent pass (`intent-pass.md`), with the intent-change rule (`intent-change-rule.md`).
2. Lifecycle: **active**. Shape: **B, mixed docs and code**, across two repositories assessed as one system. D,
   workflow-heavy, also fits; both lead to `mixed-profile.md`.
3. The lab is a docs-first member, so docs-first Steps 2, 3, 5 and 7 were run on it and folded in here.
4. Guard decision: **`create`**. The generator wrote `guard/SKILL.md`; the integrator wrote `integration.md`.

## 1. Intent

**Steward:** Justin. The lab's `scope.yaml` line 6 says `steward: justin`. ORC names no steward, but its `AGENTS.md`
quotes Justin as the one who decides (lines 33-37). In ORC's code comments, "the operator" means Justin:
`config/installation.ts` labels operator notes "Justin said".

**Governing statements gathered.** Each has its place, its kind, its evidence of authority, and its date. "Attributed"
means it names Justin.

| Id | Statement | Where | Kind | Authority | Date |
|---|---|---|---|---|---|
| S1 | The lab's purpose: develop and operate ORC and its reusable Scope-owned agents | lab `SCOPE.md` 5-7, `scope.yaml` 5 | directive | neither | none |
| S2 | North star: ChatGPT replacement, daily tool, test ground, showpiece; then consolidation | lab `STATE.md` 6-11 | decision | attributed | 25-26 Sep |
| S3 | ORC core carries no Scope, model, owner or agent | ORC `AGENTS.md` 30-55 | directive | attributed | 12-13 Sep |
| S4 | ORC owns a general async work capability, including recurring schedules | lab `decisions/2026-09-17-async-work-architecture.md` | decision | attributed | 17 Sep |
| S5 | Approval cards are classes built from fixed blocks | ORC `AGENTS.md` 114-128 | decision | attributed ("the operator") | 26 Sep |
| S6 | Scope logins are not centralised: Scope credentials stay in the Scope | `src/adapters/scope-credentials.ts` 15-16, `config/installation.ts` 77-79 | decision quoted in code | attributed | 28 Sep |
| S7 | Claude merges a PR once review and tests pass | lab `STATE.md` 17 | decision | attributed | 25 Sep |
| S8 | The map of work, orchestrator#140, is the reference point for all work | ORC `AGENTS.md` 7-12, lab `AGENTS.md` 7-10, `tools/map.mjs` 3 | directive | attributed | 2 Oct |
| S9 | Security reviews are checked by Danger on GitHub ("B") | `dangerfile.js` 6 | decision | attributed | 2 Oct |
| S10 | The browser runs through Playwright's library in ORC's process | `src/adapters/browser/playwright.ts` 10-12 ("orchestrator#76, decided 3 Oct") | decision | dated only | 3 Oct |
| S11 | The lab is the central Scope; the processes kept; scheduling (#166) first; Astra runs this assessment | lab `STATE.md` 38-55 | decision | attributed | 4 Oct |
| S12 | MS is paused; browser-stack work touching it waits | lab `STATE.md` 33-34 | decision | attributed | 4 Oct |
| S13 | Boundary lists: subprocess, network, Bookwhen, credentials | ORC `AGENTS.md` 92-108; README 3-7, 103-104, 138-154 | directive or description | neither | none |
| S14 | The core-ties ratchet: "a count may only fall" | ORC `AGENTS.md` 47-48 | directive | neither | baseline 13 Sep |
| S15 | `STATE.md` is capped at about forty content lines, and overwritten | lab `AGENTS.md` 33-36 | directive | neither | none |
| S16 | `STATE.md` target: sixty lines | lab `STATE.md` 3-4 | directive | neither | none |
| S17 | Pace: one scored real use before new design | lab `AGENTS.md` 27-29 (`~/pro/agentic/HOW_NOT_TO_PLAN.md`, not read) | directive | neither | none |

**Three readings.**
- **Declared:** ORC is Justin's local-first personal agent. Iris is the front door. Agents are owned by Scopes. Its
  hands are narrow and read-only: README 3-7 and 138-154 list a short set of reach and much that is "deliberately
  absent". The lab develops and operates ORC (S1).
- **Enacted:** recent work, from `STATE.md` and the code:
  - the browser stack (#193, resolve before acting);
  - phone notices through ntfy, including ones a Scope package sends (#184);
  - the systemd service and its restart card (#195, #199, #201);
  - one package API version (#201);
  - invoices sent through a finance package (an SMTP connector);
  - an advert agent;
  - the map of work and its tooling;
  - Danger checks.
- **Authorised:** S2-S12. These authorise the async capability (with scheduling), Scope-owned credentials, the
  in-process browser (dated, unattributed), the map, Danger, and the lab's widened role.

**Existing guard repair instructions read against the intent-change rule.** Searched: "to match", "update both",
"in step", "in sync", "same change". Paths: both `AGENTS.md`, ORC `README.md`, `SECURITY-REVIEW.md`, `dangerfile.js`,
`test/core-ties.ts`, both `.githooks/`, `.github/`, the lab's `STATE.md`, `SCOPE.md` and `README.md`. The search found
only the ratchet's "its allowance falls in the same change". The allowance is an independent test of the count, not a
competing definition. No repair instruction treats work as permission to change intent, and none keeps two
definitions of one concept in step.

**Gaps, by condition:**
- **Stale description**, corrected in the settled patch with the decision cited:
  - F3: S12 settles `STATE.md` line 59.
  - F9: S3 and S6 settle the Bookwhen claims.
  - F8, in part: S6 settles the credential claim.
  - F10, scheduling only: S4.
  - F26: S11 settles `SCOPE.md`.
- **Conflict:** F5, two caps for one state file (S15 against S16). This is Q5.
- **Missing:**
  - where the session-end guard lives (F22, Q4);
  - whether a package may choose the address a phone notice's tap opens (part of Q1).
- **Ambiguous:**
  - F10: what README's "Deliberately absent" bounds (Q2);
  - F24: where product friction is recorded.
- **Unauthorised drift, provisionally:**
  - F11: the ratchet rose (Q3).
  - F6 and F7: reach beyond the boundary lists (Q1). This may instead be stale description; the answer decides.
  - No decision covering either was found in the two repositories. GitHub issues were not read.
- **Prose control:** F13 (guarded changes go through a PR), F23 (grantable types need an independent read), F5 (the
  state cap).

**Questions:** five, in `questions.md`, each with a recommendation. Q1 reach, Q2 the scope of "Deliberately absent", Q3
the ratchet, Q4 the guard's home, Q5 the state cap.

**Proposed changes, and where they were recorded.** Q1-Q3 are proposed intent changes, recorded as awaiting Justin in
a new lab file, `decisions/2026-10-07-proposed-boundary-questions.md`, in the settled patch. Q4 and Q5 are operational,
and are listed in `STATE.md`'s "Open questions". Decisions found only in `STATE.md` are copied into four `decisions/`
files, also in the settled patch.

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** Evidence:
  - `scope.yaml` 7 (`status: active`) and 13 (project `orchestrator` active);
  - `STATE.md` updated 2026-10-04 17:31;
  - restarts and merges recorded on 4 Oct.
  - The `status-tracker` project is archived (`scope.yaml` 22-31) and is out of scope.
- **Shape B, mixed docs and code.** Evidence:
  - ORC has 117 files under `src/`, 70 test files and a CI workflow, beside 15 top-level Markdown documents (about
    230 KB).
  - The lab is docs-first: `STATE.md`, `SCOPE.md`, `AGENTS.md`, a 120 KB `FRICTION.md`, 78 reports, `decisions/` and
    `memory/`, with 3 scripts.
  - Shape D, workflow-heavy, fits too: the map, Danger, restart cards and nine kept processes.
- **Repositories:** these two, assessed as one system.
  - The system reaches further than these two. Moving Stillness's and Finance's package code runs inside ORC's
    process.
  - The lab's own `tools/collect.mjs` lists six repositories in its `REPOS` (lines 19-26).
  - `memory/slots-run-walkthrough.md` names three codebases in one run: ORC, the Moving Stillness package and the
    Bookwhen ops tool.
  - None of the others was available, so none was assessed.

## 3. Domains

All six domains are present and actively changing:
- **code:** ORC's `src/`, `config/` and `scripts/`, and the lab's `tools/`;
- **documentation:** both repositories;
- **tests:** ORC's `test/`, `web/src/*.test.tsx` and `e2e/`; the lab has none;
- **contracts:** `src/package-api.api.md` and `ORC_PACKAGE_API_VERSION`, task-type declarations, and the durable-work
  SQLite schema, which the lab reads;
- **workflow:** the map, Danger, restart cards, Astra reviews and the kept processes;
- **live operational state:**
  - `orc.service`;
  - durable work, grants and package approvals in ORC's state directory;
  - GitHub Project 4;
  - ntfy notices;
  - Bookwhen through Moving Stillness, now paused;
  - mail through Finance;
  - model spend through Pi's provider.

## 4. Who owns which concept

Each concept and its owner. Seams with two homes are marked.
- **ORC's behaviour, reach and boundaries:** ORC. `AGENTS.md` "Boundaries" holds the prose, and
  `test/architecture.test.ts` enforces part of it. The README "Boundary" section summarises it, and has drifted (F6,
  F7, F10).
- **The system's current state:** the lab's `STATE.md`, its only state file. ORC has none, and ORC's `AGENTS.md` does
  not point to it (F21).
- **Open work:** GitHub issues under orchestrator#140. `tools/map.mjs` reads them, and GitHub Project 4 shows them live.
- **Decisions:** the lab's `decisions/` holds one file, which is about ORC (2026-09-17). Other decisions sit in
  `STATE.md`, in code comments and in ORC's `AGENTS.md` quotes (F1).
- **Guarded paths for security review:** `dangerfile.js` (`GUARDED`). `SECURITY-REVIEW.md` restates the list
  incompletely (F12).
- **Two homes: where ORC's state lives.** ORC's env file and `src/runtime.ts` own it. The lab's `tools/collect.mjs` 16
  hard-codes it (F15).
- **Two homes: the durable-work store's schema.** `src/adapters/async-store/sqlite.ts` owns it. The lab's
  `collect.mjs` 124-142 reads its tables directly, although ORC offers `pnpm list:async-work` (F15).
- **Two homes: which agents exist.** ORC's `src/agent-discovery.ts` (`ORCHESTRATOR_SCOPE_DIRECTORIES`) owns it. The
  lab's `collect.mjs` 164-189 implements it again by scanning every `~/scopes/*/agents/` (F16).
- **Friction from real use:** the lab's `FRICTION.md`. Product defects also go to issues, with mixed practice (F24).

## 5. Truth map (docs-first Step 2)

**The lab:**
- **Canonical:**
  - `SCOPE.md`: purpose, authority;
  - `scope.yaml`: inventory, steward;
  - `AGENTS.md`: conventions;
  - `decisions/`: decisions;
  - `FRICTION.md`: the log of real use.
- **Current state:** `STATE.md`.
- **Local elaboration:** `memory/`, holding facts about the relationship between ORC and its Scopes.
- **Exploratory register:** `AGENT_IDEAS.md`, whose ideas are "prompts for a conversation, not approved designs".
- **Product artifacts**, whose commands are contracts named in `AGENTS.md` and `README.md`: `tools/map.mjs`,
  `tools/report.mjs`, `tools/collect.mjs`.
- **Generated:** `status.html` and `reports/<date>.json`.
- **Historical:** `reports/*.md` (dated reviews and research) and `research/`.

**ORC:**
- **Canonical:**
  - `README.md`: run, operate, direction, boundary;
  - `AGENTS.md`: rules;
  - `SECURITY-REVIEW.md`: the review questions;
  - `test/architecture.test.ts`: enforced rules;
  - `dangerfile.js`: guarded paths.
- **Local elaboration:** `GRANTS.md`, a design from 20 Sep that names a removed module (F20).
- **Historical, not marked:** `CLASSIFY.md`, `FIXES.md`, `GRANTS-E2E.md`, `OPERATOR.md`, `POLICY-STORE.md`, `REWORK.md`,
  `SEAM.md`, `SLICE1.md`, `TURN-RECORD.md`, `VISIBILITY.md` (F20).
- **Historical, marked:** `MCP.md`'s browser sections. Its banner is the model to copy.
- **Generated:** `src/package-api.api.md`.

**Concepts with one home, and their summaries:**
- **Map rules:** owned by #140's description. Both `AGENTS.md` files, `STATE.md` and `map.mjs`'s header summarise
  and link.
- **Restart procedure:** owned by README "As a service". ORC `AGENTS.md` 136 is a directive summary, filed under
  "Security review" (F27).
- **Async design:** owned by `decisions/2026-09-17`. `src/core/async/` builds it.

## 6. The real loop (docs-first Step 3)

1. **Start.**
   - In the lab, Claude Code loads `CLAUDE.md`, a symlink to `AGENTS.md`. That says: read `STATE.md`, then `SCOPE.md`,
     then #140.
   - In ORC, `AGENTS.md` says: read `README.md`, the architecture test, then #140. Codex and opencode load
     `AGENTS.md`. ORC has no `CLAUDE.md`, so whether Claude Code loads it is unknown.
   - Nothing sends an ORC session to `STATE.md` (F21).
2. **Track.** Issues on #140. A session marks one with `node tools/map.mjs working <ref> --agent <name>` and clears
   it with `stopped`.
3. **Change.** A branch or worktree, then commits, then a PR.
   - Danger requires a `## Security review` or `## Package API` section where it applies.
   - Tests run by hand.
   - Astra reviews complex changes.
   - Claude merges once review and tests pass (S7).
   - The ORC checkout is pulled. ORC raises a restart card, Justin approves it, and ORC restarts.
4. **Record.** `STATE.md` is overwritten "at each verified event". Decisions land in `STATE.md` far more often than in
   `decisions/`. Friction goes to `FRICTION.md`, ideas to `AGENT_IDEAS.md`.
5. **Handoff.** `STATE.md` is the handoff. No session-end step exists, although one was decided on 4 Oct (F22).
6. **Periodic.** The diary and reviews run by hand. Their scheduled versions wait on #166 (F19).

**Where follow-up gets lost:** decisions held in an overwritten file (F1); ORC sessions that never touch `STATE.md`
(F21); a diary that stops when nobody runs it (F19).

## 7. Findings

One list. Severity is high, medium or low. "Patch" names where a correction is drafted.

**F1. Steward decisions are held only in an overwritten state file.** High. Patch: settled.
- These decisions sit in `STATE.md` and nowhere else in the two repositories:
  - 6-11: the north star (S2);
  - 17: the merge rule (S7);
  - 33-34: MS paused (S12);
  - 38-55: the 4 Oct interview (S11);
  - 56-58: the 3 Oct decisions.
- Lab `AGENTS.md` 33 says `STATE.md` "is overwritten at each verified event". The decision surface, `decisions/`,
  holds one file.
- Under intent-pass §5, a decision found only in an overwritten state file is copied to its owner's durable record.
  The settled patch adds `decisions/2026-09-25-north-star.md`, `2026-09-25-claude-merges-after-review.md`,
  `2026-10-03-preview-items-194.md` and `2026-10-04-lab-role-and-kept-processes.md`, copied verbatim and cited.
- The 3 Oct Moving Stillness decisions belong in that Scope's `DECISIONS.md`, which is outside this run. They stay in
  `STATE.md` as "held only here until copied".
- The 2 Oct git-cleanup decision is said to be recorded in local-config, which was not read.

**F2. `STATE.md` contradicts itself on which build ORC runs.** High. Patch: settled.
- Line 88 says the "main process started 2026-10-03 22:12:47 on `369628b`". Line 58 says "ORC live: 369628b since
  22:12:47".
- Line 56 records a power cut at 11:41 on 4 Oct.
- Lines 31-35 record verified restarts on 4 Oct: 13:36:37 (`3989cdb`), 14:03:34 (`adaa127`), 14:26:04 (`6d89ce7`),
  14:48:27 (`8cee662`).
- The file's own later records supersede lines 58 and 88. The patch keeps only "last recorded: 4 Oct 14:48:27 onto
  `8cee662`", labels it as a recorded value, and says to read `pnpm service:status` before stating what runs now.
- Not re-observed in this run.

**F3. A next step in `STATE.md` contradicts a later decision.** Medium. Patch: settled.
- Line 59: "Next on the browser stack: #118, then #52".
- Lines 33-34: "MS is paused (Justin, 4 Oct): browser-stack work that touches it (#118, #52, MS #52) waits."
- The patch keeps the order as "when it resumes".

**F4. `STATE.md` lists an expired grant as current.** Low. Patch: settled.
- Line 94: "Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z". The file is dated 4 Oct.

**F5. `STATE.md` has two caps and has grown past both.** Medium. Q5; header change provisional.
- Lab `AGENTS.md` 34 says "capped at about forty content lines". `STATE.md` 4 says "Target: sixty lines". The file is
  99 lines.
- History has accumulated in it: "Phone (closed 3 Oct)", "Git cleanup moved…", "#201 live…".
- Nothing enforces the cap.
- FRICTION records the cost twice: 2026-09-12, "STATE described finished work as missing", and 2026-09-22,
  "`STATE.md` contained two false statements".
- The settled rewrite has 40 content lines, which meets both caps. Choosing which cap owns the file is Q5.

**F6. Claims about what ORC launches are incomplete.** High. Q1; patch provisional.
- **Claims:**
  - ORC `AGENTS.md` 92-96 lists subprocess access in three modules.
  - README 4-5: "launches one isolated fixed researcher child for each public-web research invocation".
- **Search record.** Patterns, `rg` 14.1.1:
  - `node:child_process|from ['"]child_process['"]|\bspawn\(|\bspawnSync\(|\bexecFile\(|\bexecFileSync\(|\bexecSync\(|\bfork\(|StdioClientTransport|\.launch\(|launchPersistentContext|chromium|firefox\b|webkit`;
  - then `esbuild|execFile\(|"systemctl"|"git"|"pnpm"|"node"`.
- **Paths searched:** `src`, `web/src`, `config`, `scripts`, `e2e`, `package.json`, and the lab's `tools`.
- **Hits, with the process that runs each:**
  - `src/core/child-agent-process.ts` 532, `spawn(process.execPath, …)`, in the ORC server: the researcher, the
    analyst (`local-file-child`, `src/runtime.ts` 808) and Scope agents placed in a child (`config/installation.ts`
    `DEFAULT_SCOPE_AGENT_BINDING`).
  - `src/core/analysis-tools.ts` 300, `spawn("git", …)`: the analyst's history tool.
  - `src/adapters/mcp/client.ts` 60, `StdioClientTransport`: MCP servers.
  - **Not listed:** `src/adapters/orc-service.ts` 71, 102, 106, 128. It runs `git`, `systemctl --user --no-block
    restart orc.service`, `node scripts/build.mjs` and `pnpm install --frozen-lockfile`, in the ORC server, for an
    approved restart card.
  - **Not listed:** `src/adapters/browser/playwright.ts` 55, `chromium.launch(...)`. Playwright's library starts
    Chromium in the ORC server for each browser session.
  - Operator scripts, not the server: `scripts/build.mjs` 17-18 (node, git), `scripts/dev-web.mjs` 89, `scripts/orc-service.ts`
    (systemctl), `scripts/update-pi.mjs` 32-79 (`pnpm view`, `pnpm install`, `pnpm test`).
  - Lab: `tools/collect.mjs` 33 (`gh`, `git`, `bash -c "… pnpm -s exec vitest run"`).
- **The test.** `test/architecture.test.ts` 828-858 names four approved modules, including `orc-service`. Its pattern
  is `node:child_process|child_process|execSync|spawnSync`, which cannot see a library that launches, so Chromium
  passes unseen. The document and the test agree, and both are incomplete.

**F7. Claims about what ORC reaches over the network are incomplete.** High. Q1; patch provisional.
- **Claims:**
  - ORC `AGENTS.md` 98-102: "Direct network access exists only in `src/core/research-tools.ts` … and in
    `src/adapters/notifications/ntfy.ts`" and "No model or agent reaches the ntfy transport".
  - README 5-7: "Its read-only external data paths are…".
- **Search record.** Patterns:
  - `\bfetch\(|globalThis\.fetch|from ['"]node:(http|https|net|tls|dns|dgram)['"]|from ['"](http|https|net|tls|dns|undici|ws|axios|node-fetch)['"]|new WebSocket|EventSource\(|OTLP|otlp|exporter|@opentelemetry/sdk-node|auto-instrumentations|\.goto\(|createServer\(|\.listen\(`;
  - then `-w fetch` and `node:dns|from ['"]dns['"]`.
- **Paths searched:** `src`, `config`, `scripts`, `web/src`, and the lab's `tools`.
- **Hits, with the process that runs each:**
  - `src/core/research-tools.ts` 8, `node:https`: in the researcher child.
  - `src/adapters/notifications/ntfy.ts` 84-97, `fetch`: in the ORC server.
  - **Not listed:** `src/adapters/phone/index.ts` 14 passes `fetch` to `publishNtfy`, so a Scope package's tool
    publishes a title, text, up to five tags and an http or https tap address it chooses (lines 38, 47-52). This
    contradicts "no model or agent reaches the ntfy transport".
  - **Not listed:** `src/adapters/browser/playwright.ts` 14 and 520, `lookup` from `node:dns/promises`, and 215,
    `page.goto`. Chromium reaches a session's approved hosts.
  - **Not listed:** model calls, made by Pi's library in the server and in each child. The default provider is
    `openai-codex` (`config/installation.ts` 17-21).
  - **Not listed:** `pnpm install` from `orc-service.ts`, which reaches the package registry.
  - Inbound only: `src/web-server.ts` and `src/web-cli.ts` 486 listen on loopback. `src/file-lock.ts` 158-174 uses a
    local socket for locking. OpenTelemetry exports to Pino, not the network (`src/diagnostics.ts` 5).
  - Through Scope packages' connectors, bound in `config/installation.ts`: Bookwhen hosts for the browser (134),
    `smtp.protonmail.ch:587` for mail (168). Writes go through `apply_moving_stillness_slots` and `send_client_invoice`
    (44, 46). This is the README "read-only" divergence (Q2).
  - Lab: `tools/map.mjs` and `collect.mjs` call `gh`, which reads GitHub and writes Project items: `map.mjs` 81 and
    133; `report.mjs` 57 runs this sync on every diary run.
- **The test.** `test/architecture.test.ts` 1295-1317 matches `fetchImpl|fetch\s*\(`. It does not match `fetch`
  passed as a value, `node:dns`, or connections a library makes.
- **Not covered:** the package code of Scope connectors, and Pi's and Playwright's own sources (no `node_modules` in
  the snapshot).

**F8. Claims about credential reads and what launched processes receive are wrong.** High. The first sentence is in
the settled patch; the rest is provisional under Q1.
- **Claims:** README 103-104: "A credential is read in exactly one place, `src/runtime.ts` … No subprocess ORC launches
  receives one."
- **Search record.** Patterns:
  - `process\.env`;
  - case-insensitive `credential`, listing files only;
  - `apiKey|AuthStorage|auth\.json|getEnvApiKey|ModelRegistry`;
  - `_API_KEY|oauth|getAgentDir|authStorage|login`;
  - `env\b|env:|environment` in the restart adapter.
- **Paths searched:** `src`, `config`, `scripts/orc-env.sh`, `scripts/orc-service.ts`.
- **Hits, with where each runs:**
  - `src/web-cli.ts` 625 reads `ORCHESTRATOR_WEB_TOKEN`.
  - `src/app/agent-packages.ts` 766-779 reads a connector's credentials, from `ORCHESTRATOR_*` environment names or
    `scope:` references.
  - `src/adapters/scope-credentials.ts` 40 reads files under `~/.config/scopes/<scope>/credentials/`.
  - `src/runtime.ts` reads no credential. Its environment reads are state, Scope and analyst paths (190, 204, 477,
    491, 998-1006), and its header line 3, "Owns: Credential reads", is stale.
  - `scripts/orc-env.sh` loads the env file, "ORC's credentials", into ORC's environment.
  - `src/adapters/orc-service.ts` `run` is `promisify(execFile)`, called with no `env` (71, 102, 106, 128). Node's
    default is then to inherit `process.env`, so the restart's git, systemctl, pnpm install and build receive every
    credential in the env file.
  - `src/core/child-agent-process.ts` 372-382 builds the child's environment and passes `PI_CODING_AGENT_DIR`.
- **Concrete case:** `pnpm install --frozen-lockfile` during an approved restart runs dependency install scripts
  with `ORCHESTRATOR_WEB_TOKEN` in their environment, whenever the env file pins the token.
- **Size, stated plainly:** `SECURITY-REVIEW.md` ("What these boundaries are not") already says that environment
  narrowing is not containment, because a same-user process can read the files anyway. So this is a documentation
  error with a real example, not a new hole.
- **Settled:** S6 and the code settle the credential-read sentence.
- **Provisional (Q1):** the subprocess sentence.
- **Not verified:** Playwright's Chromium likely inherits the environment too, by Playwright's documented default for
  `env`, but its source is not in the snapshot. Pi's model login is read by Pi from its agent directory; this is
  inferred, not inspected.

**F9. The Bookwhen claims are stale.** Medium. Patch: settled.
- ORC `AGENTS.md` 102-103: "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client". No such
  file exists.
- README 76-79 says to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN`, used "through exact-pinned `@jphil/bookwhen-client@0.6.1`".
  `src/` never reads that variable (`rg` finds it only in 3 tests), and `package.json` has no such dependency.
- `test/architecture.test.ts` 1313-1314 asserts the client is absent. The calendar credential is
  `scope:calendar.api-token` (`config/installation.ts` 121).
- S3 and S6 settle this.

**F10. README's "Deliberately absent" list includes scheduling.** Medium. Patch: settled for scheduling; Q2 for the
rest.
- README 152-154 lists scheduling and workflow execution as absent.
- S4 (17 Sep) decided an async capability whose `schedule` is `now`, `at` or `recurring`, and the code has it:
  `src/core/async/types.ts` 64-72, `src/app/async/calendar.ts`, and the `*:async-series` scripts.
- The decision plainly covers scheduling, and only that.
- README 147, "without applying it", against `apply_moving_stillness_slots` in `config/installation.ts` 44, depends
  on Q2.

**F11. The core-ties ratchet rose, against "a count may only fall".** Medium. Q3; patch provisional.
- `test/core-ties.ts` 41-49: the allowance for `config/installation.ts` went 28 → 51 (30 Sep) → 64 → 70 (2 Oct), with
  reasons, tied to #152.
- Also stale: `AGENTS.md` 47 says the ratchet scans `src/` and `web/src/`, but it scans `config/` too
  (`architecture.test.ts` 324; `core-ties.ts` 9). That part is in the settled patch.

**F12. The guarded-path list is stated twice, once incompletely.** Low. Patch: settled.
- `dangerfile.js` `GUARDED` has 14 patterns, including `config/`, `package.json`, `pnpm-lock.yaml`,
  `scripts/approve-agent-package.ts`, `scripts/async-work.ts`, `test/core-ties.ts` and `scripts/source-headers.js`.
- `SECURITY-REVIEW.md` 176-179 lists fewer. The PR template already links to `dangerfile.js`.
- The patch reduces `SECURITY-REVIEW.md` to a link to the one owner.

**F13. The rule that guarded changes go through a PR is partly prose.** Medium. No patch; guard check.
- ORC `AGENTS.md` 140-143: "guarded changes go through a pull request: a direct push to `main` is not checked."
- `SECURITY-REVIEW.md` "Recording it": "without GitHub Pro a failed check warns rather than blocks a merge."
- `STATE.md` 79-82 cites the Danger check as the control, and recorded four open PRs without the section on 2 Oct.
- Enforcement would sit in branch protection, or in a pre-push refusal for guarded paths on `main`. The documents
  are honest about the limits, so the guard checks it.

**F14. Tests run only by hand.** Medium. No patch; linked to #144.
- `.github/workflows/danger.yml` runs only Danger.
- `pnpm test` (architecture, core-ties, the package-API report test) and `pnpm typecheck` run by hand.
- #144 was kept on 4 Oct; how it runs is waiting on Justin.

**F15. The lab tooling hard-codes ORC's state directory and reads its store schema.** Medium. No patch; recommendation.
- `tools/collect.mjs` 16 sets `~/.local/share/orchestrator-proof`. ORC's default is `~/.local/share/orchestrator`
  (`src/runtime.ts` 190), overridden by `ORCHESTRATOR_STATE_DIR` in its env file (`scripts/orc-service.ts` 132-133).
- `collect.mjs` 124-142 queries the `events` and `tasks` tables directly. Every reader returns `null` when it fails
  (lines 2-4).
- FRICTION 2026-09-28: "operator commands read a different ORC than the one running".
- The comment at `collect.mjs` 6-7 records one rebuild already, for ORC paths that moved.

**F16. The lab tooling re-implements agent discovery.** Low. No patch.
- `collect.mjs` 164-189 scans ORC's `src/core/*.md` and every `~/scopes/*/agents/*.md`. ORC discovers only from
  `ORCHESTRATOR_SCOPE_DIRECTORIES` and approvals.

**F17. The FRICTION parser drops sections.** Low. Patch: settled.
- The pattern in `collect.mjs` 156 drops 3 of FRICTION's 34 dated sections. Verified by running it: "2026-09-21 night
  —", "late —" and "evening —" fail.
- The patched pattern matches all 34.
- `FRICTION.md` also breaks its own "Newest first" after line 1079. That is listed under cleanup.

**F18. The lab README describes report flags that do not exist.** Low. Patch: settled.
- README 16-18 and 21-22 describe `node tools/report.mjs --serve`. `report.mjs` 13 says "nothing is served", and it
  handles only `--no-tests`.
- The README times the default run at "~10s". `report.mjs` 10 says about two minutes with the suites.
- The README does not say that each run writes to GitHub Project 4 (`report.mjs` 57).

**F19. The daily diary is not daily.** Low. No patch; linked to #64 and #166.
- `reports/*.json` snapshots exist for 09-03, 09-07, 09-29, 09-30, 10-01 and 10-02. None exists for 3 or 4 Oct.
- The diary is a kept process (S11) that runs by hand, and `report.mjs` calls itself "the nightly job".

**F20. Superseded material sits beside live documents in ORC.** Medium. No patch; cleanup.
- Ten top-level reports describe September branches: REWORK 3, "Nothing committed, nothing pushed"; SEAM and OPERATOR,
  "Nothing is pushed".
- They name removed files: `src/adapters/browser/service.ts` (also in `GRANTS.md`), `src/adapters/browser/mcp.ts`,
  `src/core/ports/browser.ts`, `src/core/policies.ts`, `src/adapters/async-store/store.ts`,
  `test/browser-service.test.ts`, `test/approve-agent-package.test.ts`, `scripts/chmod-cli.mjs`,
  `test/apply-seam.test.ts`.
- Only `MCP.md` carries a history banner. A script checked every backticked path in each document.

**F21. ORC's instructions do not send a session to the system's state file.** Medium. Q4; patch provisional.
- ORC `AGENTS.md` names no state file and no session-end step.
- ORC has no `CLAUDE.md`. The lab has `CLAUDE.md`, a symlink to `AGENTS.md`.

**F22. The kept "entropy guard at session end" does not exist.** High. Guard decision `create`.
- `STATE.md` 49 lists it among the processes kept (S11).
- A case-insensitive search of both repositories for `entropy|session-coherence|session end|end of … session` found
  only that line and line 54.

**F23. "A new grantable type should not be declared without one" is prose.** Low. Guard check.
- ORC `AGENTS.md` 88-90, #74: nothing enforces the independent read.

**F24. Where product friction goes is ambiguous.** Low. No question.
- Lab `AGENTS.md` 12-21 says facts true of ORC belong in ORC's repository. `FRICTION.md` 5-17 holds product friction
  by design, and mines it monthly (#60).
- The guard's check fits either reading: `FRICTION.md` plus an issue on the map.

**F25. A plan is held where only Claude reaches it.** Low.
- `memory/authority-rules-step-1.md` 4: "plan: `~/.claude/plans/agile-booping-waffle.md`, held until the steps are
  agreed".
- The open work on authority rules (#149) depends on a file in a vendor-specific folder.

**F26. `SCOPE.md` does not carry the lab's 4 Oct role.** Low. Patch: settled, citing S11.
- "What else it covers" stays open.
- `scope.yaml`'s `purpose` was left alone, because the decision does not plainly rewrite it.

**F27. Running ORC is filed under "Security review" in ORC's `AGENTS.md`.** Low. Cleanup.
- Lines 130-136 hold the package-API, package-approval and restart instructions under that heading.

## 8. Drift between domains

How the findings fall across the profile's six checks.
- **Docs against implementation:** F6, F7, F8, F9, F10, F11, F18, F20; also the stale header of `src/runtime.ts`
  (F8).
- **Docs against docs:** F2, F3, F4, F5, F12, F26.
- **Tests against implementation:**
  - F6 and F7: the architecture test checks a narrower representation of reach than the code has.
  - F17: the diary's parser.
  - No test exists that never runs. The `vitest` config excludes only `e2e/**`, which `playwright.config.ts` runs.
- **Contracts against implementation:** `ORC_PACKAGE_API_VERSION` is defined once (`src/core/agents/package.ts` 21),
  which agrees with #201. The durable-work schema has a second reader (F15).
- **Workflow against reality:** F14, F19, F22. Both `.githooks/pre-push` files only print a summary and never block;
  whether they are enabled is unknown.
- **Rules against enforcement:** F5, F13, F23.

## 9. Ranked risks (decay rate × recovery cost)

1. **A dishonest state file (F1-F5).** It decays fast: rewritten several times a day. Recovery is costly: confident
   wrong statements about a live service, recorded twice in FRICTION. Anchor: lab `AGENTS.md` "Keeping state" and
   `decisions/`.
2. **Boundary documents that understate reach (F6-F8, F13).** Medium decay: every new adapter. High recovery cost:
   security reviews and the lethal-trifecta rule reason from these lists, and the test agrees with them. Anchor: ORC
   `AGENTS.md` "Boundaries", and `test/architecture.test.ts`, widened.
3. **Decisions with no durable home (F1, F25).** Fast decay. High recovery cost: a decision lost in an overwrite is
   decided twice. Anchor: lab `decisions/`.
4. **Lab tooling coupled to ORC's internals (F15-F17).** Medium decay. Medium recovery cost: silent `null`s in the
   diary. Anchor: ORC's own operator commands (`pnpm list:async-work`, `pnpm service:status`).
5. **Superseded material nearby (F20, F9, F10).** Slow decay. Medium recovery cost: an agent revives the MCP browser
   path or `service.ts`. Anchor: README and `AGENTS.md`, with banners in the style of `MCP.md`.

## 10. Existing guard surfaces, by whether they execute

- **Runs by itself:** Danger on every PR (`.github/workflows/danger.yml`, `dangerfile.js`). It checks the Security
  review and Package API sections, and it warns rather than blocks without GitHub Pro. It was proven on 2 Oct by
  STATE's record; not re-observed here.
- **Runs only by hand:**
  - `pnpm test`, which includes the architecture test, the core-ties ratchet and the package-API report test;
  - `pnpm typecheck` and `pnpm test:e2e`;
  - `pnpm api:report` and `pnpm pi:check`;
  - `node tools/map.mjs --check` and `node tools/report.mjs`;
  - Astra reviews.
  - Keep all of these. Widen the architecture test after Q1.
- **Decided, not built:**
  - tests on every PR (#144);
  - the label check, which waits on Astra;
  - a scheduled diary, weekly review, monthly FRICTION mining (#60), worktree cleanup (#70) and `/tmp` cleanup (#182),
    all through #166;
  - an independent read for grantable types (#74).
- **Declared, but missing:** the entropy guard at session end (F22).
- **Unknown:** both `.githooks/pre-push` files, which need `core.hooksPath`, absent from the snapshot; and whether
  Claude Code loads ORC's `AGENTS.md`.
- **Prompted:** the PR template's `## Security review` section, and both `AGENTS.md` files.

**Tools.** `lychee`, `ast-grep`, `semgrep`, `ctxlint` and `agnix` are not installed here. `/usr/bin/sg` is the Unix
`sg`, not ast-grep. There is no standalone `rg`; it exists only as Claude Code's shell function. So the guard's search
uses `git grep`. Mechanical reach checks belong in ORC's own architecture test.

## 11. Recommendations and one-time cleanup

Each item was verified against the current file.
- **Consolidate:**
  - Steward decisions go to `decisions/`, with `STATE.md` linking (F1; settled patch).
  - The guarded-path list belongs in `dangerfile.js` (F12; settled).
  - The lab's ORC readers should call ORC's commands instead of its SQLite file, and take the state directory from
    ORC's env file the way `scripts/orc-service.ts` does (F15, F16). This is a code change for the lab's maintainer;
    no patch.
- **Mark historical:** add an `MCP.md`-style banner to the ten ORC reports named in F20 and to `GRANTS.md`'s
  `service.ts` reference. Moving them into a folder is a structural change and needs Justin's yes.
- **Cleanup:**
  - `FRICTION.md`: move the oldest-first block (lines 1153-1402, 2026-09-11 to 2026-09-19) into date order (F17).
  - `src/runtime.ts` 3: drop "Credential reads" from "Owns" (F8). This is a guarded path, so it needs a PR with a
    Security review section.
  - ORC `AGENTS.md`: give lines 132-136 their own heading, such as "## Running ORC" (F27).
  - Record F25's plan where any agent can read it.
- **Widen the architecture test** after Q1: catch `fetch` passed as a value, `node:dns`, and imports of `playwright`
  and other libraries that launch or connect (F6, F7).

## 12. State-file update (docs-first Step 5)

`patch-settled.diff` rewrites the lab's `STATE.md` from its 4 Oct form:
- 57 lines, of which 40 are content lines;
- it states its stage, the documents to trust first, and the settled decisions as links;
- where-we-are is labelled "as recorded on 4 Oct; not re-read";
- it lists waiting items, decisions not yet in their owner, the open questions Q1-Q5, misleading material nearby, and
  three next actions;
- it says what makes it stale and who rewrites it.

Live facts are given as last-recorded values with their dates, never as fresh ones. Nothing was dropped unless it is
recorded elsewhere: in git, an issue, `FRICTION.md`, `dangerfile.js` or the new decision files. That was checked line
by line against the 4 Oct file. The cap wording in the header is left as "Target: sixty lines" until Q5 is answered.

## 13. Patches, sorted (intent-pass §4; "Rules along the whole route")

**`patch-settled.diff`** touches no open question:
- lab: `STATE.md`, `SCOPE.md`, `README.md`, `tools/collect.mjs`;
- lab: five new `decisions/` files;
- ORC: `AGENTS.md`, for the Bookwhen sentence and the ratchet's scanned roots;
- ORC: `README.md`, for the Bookwhen token, the credential-read sentence, and scheduling in "Deliberately absent";
- ORC: `SECURITY-REVIEW.md`, for the guarded list.

It applies cleanly with `patch -p1`, tested on a copy.

One choice was made here. The new `decisions/2026-10-07-proposed-boundary-questions.md` records Q1-Q3 as proposals
awaiting Justin, as intent-pass §5 requires. It is in the settled patch because recording a proposal settles nothing.
Read literally, though, the sorting rule ("edits the question's text") could put it in the provisional patch. This is
noted in `feedback.md`.

**`patch-provisional.diff`** must not be applied until Justin answers. Each hunk is marked with its question:
- Q1: the subprocess, network and credential-inheritance text;
- Q2: README's opening, "Boundary" and "Deliberately absent from core";
- Q3: the ratchet exception;
- Q4: "Before handing off" pointers in both `AGENTS.md` files;
- Q5: the `STATE.md` header deferring to `AGENTS.md`.

It applies cleanly after the settled patch.

## 14. Guard decision and the generator's inputs

**Decision: `create`.** No guard exists (F22), and the loop needs one: the steward kept "entropy guard at session end"
on 4 Oct (S11).

**Inputs:**
- **Steward and intent:**
  - Steward: Justin.
  - Intent documents: the lab's `SCOPE.md`, `scope.yaml` and `decisions/`, and the north star once moved there; ORC's
    `README.md` "Direction" and "Boundary", and `AGENTS.md` "Boundaries" and "Core ships with…".
  - Decision surface: the lab's `decisions/`.
  - Open intent questions: Q1-Q3. Q4 and Q5 are operational.
- **Current-state file:** the lab's `STATE.md`, rewritten by the agent whose work caused a verified event (lab
  `AGENTS.md` 33). Unresolved: no rule tells an ORC session to do so (F21, Q4).
- **Rules owned elsewhere:**
  - ORC's `SECURITY-REVIEW.md` and `dangerfile.js`;
  - #140's rules;
  - `~/pro/local-config/home/AGENTS.md`, `~/pro/agentic/HOW_NOT_TO_PLAN.md` and `~/pro/scope/docs/MODEL.md`. These
    three were not read; they are outside the two targets.
- **Verification commands:**
  - In ORC: `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report`.
  - In the lab: `node tools/map.mjs --check`, and `node tools/report.mjs --no-tests`, which also writes to GitHub
    Project 4.
  - Only Danger runs by itself.
- **Code areas, and the docs and tests describing them:**
  - Reach: `src/`, `config/` ↔ `AGENTS.md` "Boundaries", README ↔ `test/architecture.test.ts`.
  - Package API: `src/package-api.ts` ↔ `.api.md`, its test and `AGENTS.md`.
  - Ties: `config/`, `src/`, `web/src/` ↔ `test/core-ties.ts` and `AGENTS.md`.
  - Restart: `src/adapters/orc-service.ts`, `src/app/orc-restart.ts`, `scripts/orc-service.ts` ↔ README "As a service".
  - Durable work: `src/core/async/` and the async store ↔ `decisions/2026-09-17` and the lab's `collect.mjs`.
  - Lab tools ↔ lab README.
- **Live state and spend a session can change:**
  - `orc.service`, through its card only;
  - durable work, grants and package approvals in ORC's state directory;
  - GitHub issues and Project 4 marks;
  - ntfy;
  - Bookwhen through Moving Stillness, which is paused;
  - mail through Finance;
  - model spend through Pi.
  - No spending policy was found in the two repositories.
- **Findings:** F1-F27 above.

**Generator output.**
- **The guard:** `guard/SKILL.md`, to be installed in the lab at `skills/session-coherence-guard/SKILL.md` (Q4).
- **Size:** 1,109 words (`wc -w`), against a budget of 1,204:
  - 724 for the common contract;
  - 360 for 10 checks beyond the two standing ones, at 36 each (they average 28.5);
  - 54 for the pointers;
  - 66 for the commands, including a read-only probe of the diary's readers. `report.mjs` was not used for this,
    because it writes to GitHub Project 4.
  - It also carries an extra two-repository sentence of about 18 words.
- **Validation:**
  - `git diff --no-index --check` on the guard: clean. Its probe command ran against a stub module.
  - Neither patch adds trailing whitespace.
  - Both patches apply with `patch -p1`.
  - The repositories' own checks could not run: there are no `node_modules` and no git in the snapshot, and the
    network is off.
- **Open questions the guard leaves visible:** Q3, in the ratchet check, and Q5, in the state check.
- **Handover:** to `guards-integrator`; see `integration.md`.

## 15. Uncertainties, and what was not covered

- The snapshots carry no git metadata. So the following are unknown:
  - commit history, and whether the ORC reports are tracked;
  - the effective `core.hooksPath`;
  - each session's baseline.
- GitHub (#140 and every issue and PR cited), the Moving Stillness and Finance Scopes, the Bookwhen ops tool,
  local-config, `~/pro/agentic` and `~/pro/scope` were not read. Any of them may hold decisions that settle Q1-Q3.
- No live service was read. Every live fact here is a value recorded in `STATE.md`, with its date.
- Pi's, Playwright's and the MCP SDK's own sources were not available, so library-mediated reach and environment
  inheritance are stated from ORC's call sites and the libraries' documented defaults.
- The 78 reports, `AGENT_IDEAS.md` and most of `FRICTION.md` were sampled, not read in full: headings, the entries
  about state and rules, and the lines cited.
