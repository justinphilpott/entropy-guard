# Entropy assessment: ORC and the orchestration lab, as one system

- **Assessed:** 2026-10-07, in build mode against read-only snapshots, so every repair is a patch in this folder and
  nothing in the targets was changed.
- **Targets:** `orchestrator` (ORC, TypeScript) and `scope-orchestration-lab` (the lab Scope). Both snapshots were
  taken on 4 Oct 2026; neither has a `.git` directory.
- **Line numbers** refer to the snapshot files unless a patch is named.
- **The steward was not available.** Questions and recommended answers are in `questions.md`; work that depends on
  them is in the provisional patches.

## Route taken

1. `entropy-assessment` Step 1 ran the intent pass (`intent-pass.md`, with `intent-change-rule.md`).
2. Step 2 found the lifecycle **active** and the shape **B, mixed docs and code**, over two repositories assessed as
   one system. B, C and D all fit, and B is the riskiest: the costliest drift found sits between documents and code,
   across the two repositories. This step read `mixed-profile.md`.
3. Because the lab is a docs-first member repository (it manages ORC's work and holds no product code beyond three
   report scripts), docs-first Steps 2, 3, 5 and 7 also ran on it. Their results are folded in below.
4. Step 3's guard decision is **`create`**. Step 4 handed on to `session-coherence-skill-generator`, which wrote
   `guard/SKILL.md` and handed on to `guards-integrator` (`integration.md`).

## Intent

**The steward is Justin.** `scope.yaml` line 6 records `steward: justin`, and line 36 makes him the only member, as
admin. ORC's `AGENTS.md` quotes him by name and date (lines 34–37).

### Authorised intent, with sources

| Statement | Where | Kind | Authority | Date |
|---|---|---|---|---|
| The lab is "Justin's Scope for developing and operating ORC and its reusable Scope-owned agents"; facts about ORC belong in ORC's repository, facts about the relationship belong in the lab | lab `SCOPE.md` 5–7, 19–21 | directive | neither attributed nor dated | none |
| `purpose`, `steward`, `status: active` | lab `scope.yaml` 5–7 | directive (formal inventory) | names the steward | created 2026-07-11 |
| North star: his "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; then "work towards a point of consolidation" | lab `STATE.md` 8–11 (also `reports/2026-09-30-priorities.md` 7) | decision | attributed and dated | 2026-09-25, 2026-09-26 |
| The lab is the central Scope; where issues live; the nine processes kept; scheduling (#166) first; Astra assesses ORC and the lab together | lab `STATE.md` 38–54 | decision | attributed and dated | 2026-10-04 |
| Claude merges a PR once review and tests pass | lab `STATE.md` 17 | decision | attributed and dated | 2026-09-25 |
| ORC owns a general async work capability; timing included | lab `decisions/2026-09-17-async-work-architecture.md` | decision | attributed and dated | 2026-09-17 |
| Authority rules 1, 2, 4 and 5 affirmed; 3, 6, chat handling and Iris's role open | lab `memory/authority-rules-step-1.md` | decision | attributed and dated | 2026-10-01 |
| The map of work, orchestrator#140, is the reference point | ORC `AGENTS.md` 9–12; lab `AGENTS.md` 6–8 | directive | attributed and dated | 2026-10-02 |
| Core ships with no specific Scope, model, owner or agent; domain code such as a Bookwhen connector belongs to the Scope | ORC `AGENTS.md` 30–55 | decision | quotes Justin, dated | 2026-09-12, 2026-09-13 |
| Boundaries: lethal trifecta; reach lists; "Any new authority requires an explicit human choice" | ORC `AGENTS.md` 14–112 | directive | not attributed | none |
| Scope logins "should DEFINITELY NOT be centralised" | ORC `config/installation.ts` 78–79; `src/adapters/scope-credentials.ts` 14–15 | decision | attributed ("the operator") and dated | 2026-09-28 |
| A package's phone topic is named `<scope short>-<connector id>` | ORC `config/installation.ts` 98–102 | decision | attributed ("the operator") and dated | 2026-10-02 |
| Security reviews are checked by Danger on GitHub | ORC `dangerfile.js` 7; lab `STATE.md` 79–82 | decision | attributed and dated | 2026-10-02 |
| Direction: Iris is the front door; ADA creates agents; every agent belongs to a Scope | ORC `README.md` 9–23 | description | neither | none |
| New design work follows `HOW_NOT_TO_PLAN.md` | lab `AGENTS.md` 27–29 | directive | neither | none (the file is outside the snapshot and was not read) |

### Three readings

- **Declared:** a local-first personal agent platform with Iris as its front door, Scope-owned agents, and narrow,
  enforced boundaries (ORC `README.md`, `AGENTS.md`; lab `SCOPE.md`).
- **Enacted,** 28 Sep to 4 Oct, from `STATE.md`, `FRICTION.md` and dated code headers:
  - the browser stack: Playwright in ORC's own process (#76) and resolve-before-acting (#193);
  - the restart card (#101);
  - phone notices, including a connector for packages (#184);
  - invoicing and an advert agent, as Scope packages;
  - the map of work and its tools;
  - Danger security reviews;
  - Scope-specific connector bindings accumulating in ORC's `config/installation.ts` (F9).
- **Authorised:** the table above. The enacted work is mostly inside it. The exceptions are the gaps below.

### Gaps, by condition

- **Stale description**, where a later recorded decision settles the correction:
  - F5: the Bookwhen client and token in ORC, settled by the 12–13 Sep and 28 Sep decisions;
  - F4 in part: Scope credentials, settled by the 28 Sep decision;
  - F6 in part: "scheduling" listed as absent, settled by `decisions/2026-09-17`;
  - F10 (c): the next browser-stack step, settled by the 4 Oct pause.

  The patch corrects only what each decision plainly covers.
- **Conflict:** F11, the size cap on `STATE.md`. It becomes Q3.
- **Ambiguous:** F8, whether `config/` counts as core for the ratchet. It becomes Q2.
- **Unauthorised drift, or an approval that went unrecorded:** F1, F2 and F3. ORC reaches places its prescribed
  boundary lists do not name, and only some of those reaches have a recorded approval. Nothing was edited to match.
  Q1 asks.
- **Prose control:**
  - F13: the architecture test "enforces the boundaries", but only when someone runs it;
  - F14: the map check fails open;
  - F8: "a count may only fall" binds only through review.
- **Missing:** F16. Nothing tells a session that works only in ORC where its work's state is kept.

### Existing guards' repair instructions, read against the intent-change rule

- **No session guard exists** in either repository (F17).
- **Intent:** no repair instruction was found that treats work as permission to change intent. Neither repository
  has an instruction such as "update the intent document to match".
- **Ownership, one finding:** `scripts/update-pi.mjs` (`pnpm pi:update`) keeps the four Pi pins in step. That is a
  mechanised projection of one version, so it is kept. ORC `README.md` line 165 is a fifth copy that the script does
  not update (F20).
- **Not ownership findings:** `STATE.md` "Overwrite at each verified event" and ORC `AGENTS.md`'s ratchet rule keep no
  second definition in step.

### Questions, and proposed changes

- **Questions:** Q1 to Q3 in `questions.md`, each with a recommended answer. Two further approvals are asked there
  (A1, A2); they are not intent questions.
- **Proposed changes:** none was recorded as a proposed intent change. The open points are questions, not proposals.
- **Steward decisions copied:** decisions held only in the overwritten `STATE.md` are copied to the lab's
  `decisions/` by `settled.patch`. Recording them is not deciding them again (F12).

## Lifecycle, shape, repositories

- **Lifecycle: active.** The evidence:
  - `scope.yaml` line 7 reads `status: active`, and so does the orchestrator project (line 14);
  - `STATE.md` was updated on 2026-10-04 at 17:31, with four ORC restarts recorded that day;
  - the newest reports are dated 2026-10-04.
- **Shape: B**, with features of C and D. The evidence:
  - ORC is substantial code: 158 source files in `src/` and `web/`, 70 test files (62 in `test/`, 8 in `web/src/`), and a CI job;
  - both repositories carry a heavy documentation and planning surface: 14 top-level documents in ORC, and in the
    lab `STATE.md`, `decisions/`, a 1,402-line `FRICTION.md` and 80 reports;
  - the costliest drift sits between the two (F1 to F6, F10).
- **The repositories:**
  - **ORC** owns the product, its rules and its enforced checks (lab `SCOPE.md` 19).
  - **The lab** owns the relationship: current state, the map tooling, friction, ideas, reviews, and decisions about
    the system.
  - Both point at material outside the snapshot, which was not read: orchestrator#140 and the GitHub Project; the
    Moving Stillness and finance Scopes, whose packages run inside ORC; local-config (`AGENTS.md`, `push-summary`);
    `pro/scope/docs/MODEL.md`; `pro/agentic/...`.

## Domains present

All of the following are present and actively changed.

- **Code:**
  - ORC's `src/`, `web/`, `config/` and `scripts/`;
  - the lab's `tools/*.mjs`.
- **Documentation:**
  - ORC's `README.md`, `AGENTS.md` and 12 other top-level documents;
  - the lab's `STATE.md`, `SCOPE.md`, `AGENTS.md`, `FRICTION.md` and `reports/`.
- **Tests:**
  - ORC's Vitest suites (70 test files, with `architecture.test.ts` reading the ratchet in `core-ties.ts`);
  - ORC's Playwright end-to-end suite (`e2e/`);
  - the lab has none.
- **Contracts:**
  - `src/package-api.ts` and its API Extractor report `src/package-api.api.md`;
  - `ORC_PACKAGE_API_VERSION`;
  - the SQLite schema in `src/adapters/async-store/sqlite.ts`;
  - task-type card templates;
  - the `**Where we are now:** #n` line in `STATE.md`, which `tools/map.mjs` parses.
- **Workflow:**
  - the map of work, with its working and stopped marks;
  - Danger;
  - the pull request template;
  - the pre-push hooks;
  - restart and package cards;
  - the overwrite rule for `STATE.md`;
  - `FRICTION.md` and `AGENT_IDEAS.md`;
  - the daily diary;
  - the kept processes (4 Oct).
- **Live operational state:**
  - `orc.service` and its built `dist`;
  - the SQLite policy store, standing grants and package approvals;
  - Scope credential files under `~/.config/scopes/`;
  - ntfy topics;
  - GitHub Project 4;
  - live Bookwhen entries, through Moving Stillness.

## Repositories and ownership

| Concept | Owner | Other homes |
|---|---|---|
| What ORC reaches, launches and reads credentials from | ORC `AGENTS.md` "Boundaries" | `README.md` summarises it; `test/architecture.test.ts` is its independent test. All three disagree with the code (F1 to F4) |
| Current state of the work on ORC | lab `STATE.md` | `status.html` and `reports/<date>.json` are generated projections. ORC `README.md` 165 holds a version copy (F20) |
| Steward decisions | per concern: lab `decisions/`, issues on #140, ORC `AGENTS.md` quotes | lab `STATE.md`, which is overwritten, held several of them alone (F12) |
| Each Scope's connector bindings, hosts, topics and mail server | the Scope (lab `SCOPE.md`; ORC `AGENTS.md` 39–42) | ORC `config/installation.ts`, until orchestrator#152 (F9) |
| The repositories the work spans | the map of work (9 repositories) | `tools/collect.mjs` `REPOS` lists 6 (F14) |
| ORC's state directory | ORC's environment file (`scripts/orc-service.ts` 128–133) | `tools/collect.mjs` 16 hard-codes `~/.local/share/orchestrator-proof`. That matches `memory/slots-run-walkthrough.md` (28 Sep), so this is a seam, not a defect |
| The rule for `STATE.md`'s size | lab `AGENTS.md` 31–36 ("Keeping state") | `STATE.md` 4 restates it with a different number (F11) |

## Findings

One list. Every other section, and `integration.md`, refers to these ids.

### Reach claims: docs and test against the code

**F1. The subprocess list is incomplete, and the doc and the test disagree.**
- ORC `AGENTS.md` 92–96 names three modules: `child-agent-process.ts`, `analysis-tools.ts` and `mcp/client.ts`.
- `test/architecture.test.ts` 823–836 approves a fourth, `adapters/orc-service.ts`, "from orchestrator#101".
- Neither names Playwright's Chromium launch (`src/adapters/browser/playwright.ts` 55, orchestrator#76).
- ORC `AGENTS.md` 136 and `README.md` 123–129 do describe the restart card's behaviour, outside the list.
- Search record: S1 and N2 below. Disposition: Q1, `provisional-Q1.patch`.

**F2. The network list is incomplete.**
- ORC `AGENTS.md` 98–104 says "Direct network access exists only in" `research-tools.ts` and `ntfy.ts`.
  `test/architecture.test.ts` 1295–1312 says the same.
- The code also reaches the network in four places:
  - Chromium reaches a session's approved hosts, and `playwright.ts` makes its own DNS lookups (lines 14 and 55).
    ORC `AGENTS.md` 73 itself counts "a DNS lookup" as an outbound channel.
  - Pi's model-provider calls go out from ORC's own process (`runtime.ts` 343, 373, 510 and 536;
    `app/conversations.ts` 98; `backends/pi/task-execution.ts` 81, 88, 279 and 293) and from its Pi children.
  - The restart card's `pnpm install --frozen-lockfile` downloads any package a release adds (`orc-service.ts` 128;
    the comment at 32–38 says so).
- The test's patterns cannot see `node:dns`, a library that connects, or `fetch` passed as a value.
- Search record: N1 and N2 below. Disposition: Q1, `provisional-Q1.patch`; the test change is under
  Recommendations.

**F3. "No model or agent reaches the ntfy transport" is contradicted by the code.**
- The claim is in ORC `AGENTS.md` 101, and the architecture test repeats it in its comment at line 63.
- ORC's built-in phone connector (`src/adapters/phone/index.ts`, from #184, 2 Oct) sends a Scope package agent's
  notices through `publishNtfy`. A notice carries the package's title, text and tags, and an optional tap address that
  `phone/index.ts` 50 accepts for any http or https URL.
- The topic naming has a recorded decision (`config/installation.ts` 98–102, the operator, 2026-10-02).
- No record was found approving a tap address the package chooses. By ORC `AGENTS.md` 72–73 ("a generated link ...
  is one") that address is an outbound channel.
- Disposition: Q1. The correction is held in `provisional-Q1.patch`, because it states that reach as fact.

**F4. "A credential is read in exactly one place, `src/runtime.ts`" is not true.**
- The claim is ORC `README.md` 103. Search C1 below found these reads instead:
  - `scripts/orc-env.sh` 16 reads `~/.config/orchestrator/env` into ORC's process;
  - `src/web-cli.ts` 625 reads `ORCHESTRATOR_WEB_TOKEN`;
  - `src/app/agent-packages.ts` 776 calls `src/adapters/scope-credentials.ts` 40, which reads each Scope's credential
    files.
- `src/runtime.ts` reads no credential (search C2). It passes Pi its agent directory (line 512), as does
  `child-agent-process.ts` 372.
- The 28 Sep decision ("logins ... DEFINITELY NOT be centralised") settles the Scope-credential part, and the web
  token is documented in `README.md` 66–69. Disposition: `settled.patch` rewrites that sentence.
- Pi's own credential reading is left visibly open (U1). The header of `src/runtime.ts` (line 3, "Owns: Credential
  reads") is stale code commentary and was left alone: it is a guarded source file, and the claim may refer to the Pi
  agent directory.

**F5. The Bookwhen client and token are described as ORC's.**
- ORC `README.md` 76–79 describes `ORCHESTRATOR_BOOKWHEN_API_TOKEN` and `@jphil/bookwhen-client@0.6.1`.
- ORC `AGENTS.md` 102–103 says "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client".
- The code contradicts both:
  - there is no `src/bookwhen.ts`;
  - `package.json` has no Bookwhen dependency;
  - `test/architecture.test.ts` 1315–1320 asserts that both are absent;
  - the token is read only in tests.
- Recorded decisions settle it: Justin, 2026-09-12 and 2026-09-13, that domain code such as a Bookwhen connector
  belongs to the Scope (`AGENTS.md` 32–42); and the operator, 2026-09-28, on credentials. Disposition: `settled.patch`.

**F6. README's Boundary section is out of date.**
- `README.md` 152–154 lists "scheduling" as deliberately absent. `decisions/2026-09-17` decided it, and
  `src/app/async/calendar.ts` implements daily and weekly recurrence. Disposition: `settled.patch` removes that word
  and cites the decision.
- The rest of the paragraph and lines 145–148 are also out of date, but no recorded decision settles them:
  - "calculate a slot-change plan without applying it": `config/installation.ts` 44 grants the specialist
    `apply_moving_stillness_slots`;
  - "additional external data sources" and "file edits" are absent, yet packages bind SMTP mail
    (`config/installation.ts` 159–168), write advert files (123–126) and write memory files.
- The opening lines (3–7, "read-only external data paths") are out of date in the same way. Disposition for the
  unsettled parts: Q1, `provisional-Q1.patch`.

**F7. The MCP client has no production caller.**
- `createMcpClient` and `createPiMcpTools` are used only by `test/mcp-client.test.ts`. The search covered
  `createMcpClient(` and `createPiMcpTools` in `src`, `test` and `scripts`. `src/package-api.ts` exports no MCP.
- Three documents still treat it as live:
  - `MCP.md` 7 says it "still serves Pi's MCP tools";
  - `AGENTS.md` 94–96 lists it as subprocess access;
  - the architecture test pins `StdioClientTransport` to it.
- This is a test of code that is not used in practice. Disposition: `settled.patch` corrects `MCP.md`; whether to
  delete the code is A1 in `questions.md`.

#### Search record for F1, F2, F4 and F7

The search was run with ripgrep 14.1.1 on 7 Oct, over the ORC snapshot, with `*.test.*` excluded. It covered
`src/`, `config/`, `scripts/` and `web/src/`.

- **N1, outbound network primitives.** Patterns: `\bfetch\b`; `from '(node:)?(http|https|http2|net|tls|dgram|dns)(/promises)?'`; `from '(undici|axios|got|ws|node-fetch)'`; `new WebSocket`. Hits, with the process that runs each:
  - `web/src/api.ts` 243, 271, 396, 435: the operator's browser calling ORC's own API, same origin;
  - `scripts/dev-web-readiness.ts` 7, `scripts/orc-service.ts` 17, `scripts/dev-web.mjs` 3: operator commands probing
    local ports;
  - `src/adapters/browser/playwright.ts` 14 and 15: the ORC service, which makes DNS lookups during a package's
    browser session;
  - `src/adapters/notifications/ntfy.ts` 84 and 120: the ORC service, publishing notices;
  - `src/adapters/phone/index.ts` 14: the ORC service, publishing a package's notice through `publishNtfy` with
    `fetch` passed as a value;
  - `src/core/research-tools.ts` 7–9: the researcher child, which `child-agent-process.ts` 251 loads it into, making
    GET requests to `r.jina.ai` (line 143);
  - `src/web-cli.ts` 12, `src/web-server.ts` 8: the ORC service listening, inbound;
  - `src/file-lock.ts` 19: the ORC service's local lock socket;
  - `src/core/research-budget.ts` 8, 11, 14: comments only.
- **N2, libraries that connect or launch.** Patterns: `from 'playwright'`; `chromium.launch`;
  `createAgentSession(Services|FromServices|Runtime)(`; `from '@modelcontextprotocol/sdk`. Hits:
  - `playwright.ts` 16 and 55: the ORC service launches headless Chromium for each browser session;
  - `mcp/client.ts` 7–10: no production caller (F7);
  - `runtime.ts` 343, 373, 510, 536; `app/conversations.ts` 98; `backends/pi/task-execution.ts` 81, 88, 279, 293:
    Pi sessions in the ORC service, which call the model provider (`openai-codex` in `config/installation.ts` 18).
- **S1, subprocesses.** Patterns: `node:child_process`; `'child_process'`;
  `\b(spawn|execFile|fork|execFileSync|execSync|spawnSync)\(`; `StdioClientTransport(`; `run("git|systemctl|pnpm"`;
  `run(process.execPath`. Hits:
  - `src/core/child-agent-process.ts` 532: the ORC service launches the Pi child;
  - `src/core/analysis-tools.ts` 300: the analyst child runs `git`;
  - `src/adapters/orc-service.ts` 71, 102, 107, 128: the ORC service, on an approved restart card, runs git reads,
    `systemctl --user restart`, `node scripts/build.mjs` and `pnpm install --frozen-lockfile`;
  - `src/adapters/mcp/client.ts` 60: no production caller;
  - `scripts/build.mjs` 17–18, `scripts/orc-service.ts` 94 and 107, `scripts/update-pi.mjs` 32–79,
    `scripts/dev-web.mjs` 89: operator commands, run by hand or by the restart.
- **C1, credential reads.** Patterns: `process.env.[A-Z_]*(TOKEN|KEY|SECRET|PASSWORD)`; `readScopeCredential(`;
  `ENV_FILE=`; `PI_CODING_AGENT_DIR`; `getAgentDir(`. Hits:
  - `scripts/orc-env.sh` 16: the systemd unit and dev launcher read the env file;
  - `scripts/dev-web.mjs` 13: the dev launcher reads the web token;
  - `src/web-cli.ts` 625 and 753: the ORC service reads the web token;
  - `src/app/agent-packages.ts` 776 and `src/adapters/scope-credentials.ts` 40: the ORC service, at package
    activation;
  - `src/runtime.ts` 512 and `src/core/child-agent-process.ts` 372: Pi's agent directory, handed to Pi and to the
    child.
  - **C2,** `process.env|credential` in `src/runtime.ts`, found only state, analyst-root and Scope-directory settings.
- **Stores.** `node:sqlite|DatabaseSync|better-sqlite3` found only `src/adapters/async-store/sqlite.ts`, which agrees
  with `POLICY-STORE.md`.
- **Workflow modules.** `node:(fs|https?|net|child_process|dns|dgram|tls)|fetch|playwright|@earendil` in
  `src/workflows` found nothing, which agrees with ORC `AGENTS.md` 104.
- **Not searched:**
  - Scope package code, which runs in ORC's process but is not in the snapshot. One example is the Bookwhen ops tool
    that the Moving Stillness package launches (`memory/slots-run-walkthrough.md` 14–15).
  - Pi's own source.
  - `node_modules`, which is absent.

`guard/SKILL.md` carries a repeatable form of this search. It uses `git grep`, because the only ripgrep on this machine is the one inside Claude Code (checked 7 Oct: `/usr/bin/rg` is absent, and
`rg` is a shell function).

### Rules and checks against what runs

**F8. The core-ties ratchet rule and the ratchet disagree.**
- ORC `AGENTS.md` 47–48: "ratchets all four ties in `src/` and `web/src/` ... a count may only fall, and its
  allowance falls in the same change".
- `test/core-ties.ts` 8 also scans `config/`. Its allowance for `config/installation.ts` rose from 28 to 51, 64 and
  70 between 28 Sep and 2 Oct (lines 41–48), each rise with a comment and orchestrator#152 as the way out.
- The test checks exact counts. Danger requires a `## Security review` section when `core-ties.ts` changes, but
  nothing checks which direction a count moved.
- `AGENTS.md` 42 ("belong to that owner's Scopes and config") allows a reading in which `config/` is not core.
- No steward decision on the rises was found; the search covered "core-ties", "ratchet" and "#152" in both
  repositories. Disposition: Q2, `provisional-Q2.patch`.

**F9. Scope decisions are held in ORC's source.**
- `config/installation.ts` names two Scopes and their connectors: hosts, an SMTP server, phone topics and folders. The
  scope tie count there is 70.
- The comment at `core-ties.ts` 45–46 says that "every agent installed still needs this file edited, until Scopes
  load by card (orchestrator #152)".
- This is a concept with two homes. Disposition: it is linked to #152 and to the design review of 30 Sep, and no
  parallel work is proposed.

**F13. ORC's tests run only by hand.**
- `.github/workflows/danger.yml` is ORC's only workflow, and it runs Danger alone.
- `README.md` 135 says `pnpm test` "enforces the boundaries". That holds only when someone runs it.
- `FRICTION.md` 396–401: the end-to-end suite failed on `main` for a week because "nothing runs the E2E suite before a
  merge".
- Disposition: it is linked to #144, kept by Justin on 4 Oct and waiting on his choice of mechanism.

**F14. The map check fails open and covers too few repositories.**
- `tools/map.mjs` 176 turns a failed `gh` read into an empty list (`issues(repo) ?? []`), so `--check` passes.
- `tools/collect.mjs` `REPOS` lists 6 repositories; the map spans 9.
- Lab `AGENTS.md` 10 presents `--check` as failing when an open issue is outside the map.
- Both defects are confirmed in `reports/2026-10-04-labels-review-astra.md` 12–16. Disposition: linked to that review's
  follow-up.

**F15. The daily diary runs by hand and was skipped.**
- `reports/*.json` snapshots exist for 3 Sep, 7 Sep, 29 Sep, 30 Sep, 1 Oct and 2 Oct, and for neither 3 nor 4 Oct.
  `STATE.md` and `FRICTION.md` record work on both of those days.
- The diary is a kept process (4 Oct) that waits on #166.

**F18. The hooks never block, and whether they are enabled cannot be read.**
- Both repositories' `.githooks/pre-push` print `push-summary` and exit 0.
- Neither snapshot has `.git`, so `core.hooksPath` cannot be read: unknown.
- ORC `AGENTS.md` 143 already says a direct push to `main` is not checked.

### State, decisions and the loop

**F10. The lab's `STATE.md` contradicts itself in five places.**
- (a) Which build ORC runs: lines 58 and 88 give `369628b` since 3 Oct 22:12:47. Lines 31–36 record restarts on 4 Oct
  onto `3989cdb`, `adaa127`, `6d89ce7` and finally `8cee662` at 14:48:27, each verified.
- (b) #193: line 23 says "built and in review, not merged"; line 31 says "#193 is live".
- (c) Line 59 gives "Next on the browser stack: #118, then #52", while lines 33–34 say Moving Stillness is paused
  (Justin, 4 Oct) and #118 and #52 wait.
- (d) Line 91 gives Moving Stillness `main` as `c759f96`; line 32 says MS #53 merged as `fc830aa`.
- (e) Line 94 gives grant `e9675bd9` "until 1 Oct 18:00Z", in a file dated 4 Oct.
- The later recorded observations and Justin's 4 Oct decision settle each one. No live value was re-read.
  Disposition: the state-file update in `settled.patch`.

**F11. Two caps for `STATE.md`.**
- Lab `AGENTS.md` 34 says "capped at about forty content lines"; `STATE.md` 4 says "Target: sixty lines".
- The file was 99 lines, 87 of them non-blank. No recorded decision settles which cap applies.
- Disposition: Q3. The settled update holds 40 content lines, which meets both readings, and leaves line 4 unchanged.

**F12. Steward decisions are held only in the overwritten `STATE.md`.**
- The north star (lines 6–11), the merge rule (line 17), the 4 Oct interview decisions (lines 38–54), and the 3 Oct
  decisions on #194 and MS #52 (lines 57–58).
- The search covered the north-star words, "central Scope", "Claude merges", "#194" and "failure-verdicts" in both
  repositories. It found the 25 Sep quote again only in `reports/2026-09-30-priorities.md`, and the
  `failure-verdicts` decision in `reports/2026-10-03-branch-cleanup.md` 40.
- Disposition: `settled.patch` copies them into two files in `decisions/`. The 3 Oct issue decisions stay in
  `STATE.md`, marked to be copied to their issues, which were not reachable.

**F16. A session that works only in ORC is never pointed at the state of its work.**
- ORC `AGENTS.md` 3–12 points at `README.md`, the architecture test and #140. Lab `AGENTS.md` 3 points at `STATE.md`.
- The user-wide `AGENTS.md` was not read, and it may cover this.
- `FRICTION.md` 866–869 (12 Sep) and 621–626 (22 Sep) record `STATE.md` lagging the work.
- Disposition: `settled.patch` adds the pointer to ORC `AGENTS.md`.

**F17. No session-end guard exists, although Justin kept one.**
- "entropy guard at session end" is one of the processes he kept on 4 Oct (`STATE.md` 49).
- A search for `entropy|session-coherence|session end` across both repositories found only `STATE.md` 49 and 54.
- Disposition: `create`; see `guard/SKILL.md`.

### Superseded material and smaller items

**F19. ORC's root holds ten September branch and slice reports beside its live documents.** They are not linked from
`README.md`, `AGENTS.md` or `SECURITY-REVIEW.md`; a search found no reference.
- The reports: `REWORK.md` (line 3, "Nothing committed, nothing pushed"), `SEAM.md` (12), `OPERATOR.md` (12),
  `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`, `GRANTS-E2E.md` (line 11 cites a `POLICY-SOURCE.md` that does not
  exist), `CLASSIFY.md`, `TURN-RECORD.md` and `VISIBILITY.md`.
- `GRANTS.md` (a design of 20 Sep) is close to them.
- Only `MCP.md` carries a history banner.
- Some of them may still describe current mechanisms, such as `VISIBILITY.md` on `src/diagnostics.ts`. Disposition:
  A2 in `questions.md`; nothing was patched.

**F20. A second copy of the Pi version.** `README.md` 165 ("Currently on Pi Coding Agent `0.82.1`") restates
`package.json`, and `scripts/update-pi.mjs` does not update it (it does not mention the README). Disposition:
`settled.patch` turns the line into a pointer.

**F21. `FRICTION.md` is out of order.** It says "Newest first", but its entries for 11 to 19 Sep sit after 3 Sep, at
lines 1153–1365. This is small, and goes under one-time cleanup.

## Truth map

These are docs-first Step 2 for the lab, with ORC's documents included because the system is one.

| Document | Role | Notes |
|---|---|---|
| lab `SCOPE.md`, `scope.yaml` | canonical | purpose, authority, resource inventory, steward |
| lab `AGENTS.md` | canonical | working conventions, including the rule for `STATE.md` (owner of the cap, F11) |
| lab `decisions/` | canonical | one file before this run; two added by `settled.patch` (F12) |
| lab `memory/authority-rules-step-1.md` | canonical | Justin's 1 Oct answers |
| lab `memory/slots-run-walkthrough.md` | local elaboration, historical | one traced run of 28 Sep |
| lab `STATE.md` | current state | its `**Where we are now:** #n` line is also a product contract read by `tools/map.mjs` 181–190 |
| lab `status.html`, `reports/<date>.json` | generated projection | built by `tools/report.mjs` |
| lab `tools/*.mjs` | product artifact | the map and diary tools; `MAP_ROOT` is "the one place its number is written in code" |
| lab `FRICTION.md` | canonical log | what broke in real use; F21 |
| lab `AGENT_IDEAS.md` | local elaboration | its own header says "prompts for a conversation, not approved designs" |
| lab `reports/`, `research/` | historical | dated reviews, proposals and research |
| ORC `README.md` | canonical | direction, how to run, boundary summary |
| ORC `AGENTS.md` | canonical | rules and boundaries, the owner of reach (F1 to F5) |
| ORC `SECURITY-REVIEW.md`, `dangerfile.js` | canonical, product artifact | the review questions; `GUARDED` is the guarded-path list |
| ORC `test/architecture.test.ts`, `test/core-ties.ts` | product artifact | independent tests of `AGENTS.md`'s boundaries |
| ORC `src/package-api.api.md` | generated projection | API Extractor report |
| ORC `MCP.md` | historical, partly live | banner present; F7 |
| ORC `GRANTS.md` and the ten reports of F19 | historical | September designs and branch reports, unmarked |

**Planning horizon:**
- **Settled:** async work (17 Sep), the core rule (12–13 Sep), the map (2 Oct), Danger (2 Oct), and the lab's role
  and processes (4 Oct).
- **Active:** #193 waiting on a real-Bookwhen try, #166 scheduling, and the label proposal.
- **Exploratory:** authority rules 3 and 6 and Iris's role (`memory/authority-rules-step-1.md`), and
  `AGENT_IDEAS.md`.

## Loop map

These are docs-first Step 3, the real loop rather than the documented one.

- **Session start in the lab:**
  - `AGENTS.md`, which `CLAUDE.md` symlinks to;
  - then `STATE.md` and `SCOPE.md`;
  - then #140 and `node tools/map.mjs`.
- **Session start in ORC:**
  - `AGENTS.md`, `README.md` and the architecture test;
  - there is no `CLAUDE.md` link, and no pointer to the lab's `STATE.md` (F16).
  - The user-wide rules file is linked into every tool's own location: Claude Code, Codex, opencode and Pi
    (`reports/2026-09-30-skills-one-home.md` 17–25, read 30 Sep).
- **Tracking:**
  - GitHub issues under #140;
  - `map.mjs working` and `stopped` marks in Project 4;
  - `STATE.md`'s "Where we are now".
- **Change:**
  1. A worktree branch, then a pull request.
  2. Danger checks for the Security review and Package API sections.
  3. Astra reviews by complexity.
  4. Claude merges (25 Sep rule).
  5. The checkout is pulled, and ORC raises "Restart ORC onto <commit>".
  6. Justin approves, and the restart is verified by start time, `build.json` and health.
  - Tests run by hand (F13).
- **Decisions are captured** in `STATE.md` (overwritten), `decisions/` (rarely: one file in three weeks),
  `memory/`, issues, quotes in ORC's `AGENTS.md`, and code comments that quote "the operator" (F12).
- **Learnings go to** `FRICTION.md`, ORC's documents and `memory/`, following lab `AGENTS.md`'s table.
- **Handoff:** the `STATE.md` overwrite "at each verified event", commits, and the diary when someone runs it (F15).
  Follow-up is lost where `STATE.md` keeps a superseded line (F10) or a decision lives only there (F12).

## Ranked risks

Ranked by decay rate times recovery cost.

1. **The reach inventory drifts from the code** (F1, F2, F3, F6, F7, with F13).
   - **Decay: fast.** Three reach paths arrived on 2 and 3 Oct (#101, #184, #76), and none reached the lists in
     `AGENTS.md`.
   - **Recovery: high.** Security reviews (`SECURITY-REVIEW.md`, Danger) and agents treat these lists as the boundary,
     so a review can pass on a false premise.
   - **Anchor:** ORC `AGENTS.md` "Boundaries", with `test/architecture.test.ts` as its independent test.
2. **`STATE.md` is dishonest** (F10, F11, F16).
   - **Decay: fast.** It is rewritten several times a day, and one version held five contradictions.
   - **Recovery: medium to high.** Justin is given confident wrong answers (`FRICTION.md` 12 Sep, 22 Sep, 29 Sep).
   - **Anchor:** `STATE.md`, plus live reads (`pnpm service:status`).
3. **Steward decisions are lost when `STATE.md` is overwritten** (F12).
   - **Decay:** the next overwrite.
   - **Recovery: high.** Only git history would hold them.
   - **Anchor:** lab `decisions/`.
4. **Checks do not run by themselves** (F13, F14, F15, F18).
   - **Decay:** every merge.
   - **Recovery:** a week of unverified merges once (27 Sep).
   - **Anchor:** #144 and #166.
5. **Scope decisions accumulate in ORC's config, and the ratchet rises** (F8, F9).
   - **Decay:** 42 ties in 4 days.
   - **Recovery:** grows with every agent installed.
   - **Anchor:** ORC `AGENTS.md`'s core rule, and #152.

## Guard surfaces, by whether they execute

- **Runs by itself:**
  - Danger's Security review and Package API checks (`.github/workflows/danger.yml`, `dangerfile.js`). `STATE.md`
    79–82 records them proven on GitHub on 2 Oct; that was not re-observed here.
- **Runs only by hand:**
  - `pnpm typecheck`;
  - `pnpm test`, including the architecture, core-ties and package-API report tests;
  - `pnpm test:e2e`, `pnpm api:report` and `pnpm pi:check`;
  - `node tools/map.mjs --check` (F14);
  - `node tools/report.mjs` (F15);
  - verifying a restart.
- **Decided, not built:**
  - tests on every PR (#144);
  - the session-end entropy guard (F17; no issue found);
  - the scheduled diary, weekly adversarial review, FRICTION into rules (#60), branch cleanup (#70) and `/tmp` cleanup
    (#182), all waiting on #166;
  - binding approvals to builds (#137);
  - an independent read for grantable types (#74);
  - Scopes loading by card (#152).
- **Declared, but missing:** lab `AGENTS.md` 40–42, "Commit each newly recorded idea immediately". Nothing checks it.
- **Unknown:**
  - whether either `.githooks/pre-push` is enabled (F18);
  - branch protection on `main`;
  - the lab's `.claude/settings.json` declares no hooks.
- **Keep, amend, replace or demote:**
  - Keep Danger.
  - Amend the map check to fail closed (F14).
  - Amend the architecture test's reach checks after Q1.
  - Keep the hooks as reminders.

## Recommendations

- **Consolidate:**
  - Steward decisions go to `decisions/` (done in `settled.patch`).
  - `STATE.md` points to rules rather than restating them (done).
  - Keep one owner for the reach inventory, ORC `AGENTS.md`, with `README.md` summarising it and pointing there (in
    `provisional-Q1.patch`).
- **Mark as history:** ORC's root reports (F19), one banner each, after checking each against the code. This needs
  Justin's yes (A2).
- **Demote or delete:** the unused MCP client and its test (F7, A1).
- **After Q1 is answered, widen the reach checks in `test/architecture.test.ts`.** They should see:
  - `node:dns`;
  - imports of `playwright`;
  - `fetch` passed as a value;
  - Pi session construction.

  Then list the approved modules. Verify the change by running `pnpm test` and by breaking it on purpose: add a stray
  `import "node:dns"` and see the test fail. This could not be run here, because `node_modules` is absent.
- **Fix the map check** to fail when a `gh` read fails, and read the map's repository list from one place (F14,
  following the labels review).
- **Check Pi's credential path** on the machine (U1) before relying on `README.md` 104.

## One-time cleanup

Each item was verified against the current snapshot file.

- `FRICTION.md` 1153–1365: move the 11 to 19 Sep entries into date order (F21). Not patched: the move is large and
  mechanical, and this file is the lab's main log.
- Lab `STATE.md`: superseded lines were removed by the settled update (F10).
- ORC `MCP.md` 7, `README.md` 76–79, 103, 152–154 and 165, and `AGENTS.md` 102–103: corrected in `settled.patch`.

## The state-file update

The update is in `settled.patch` (lab `STATE.md`). It follows docs-first Step 5:

- It holds the current stage, the documents to trust first, settled decisions linked to `decisions/`, the active
  fronts and open questions (including Q1 to Q3), misleading nearby material, and the next actions.
- It says what makes it stale and who refreshes it.
- Its live facts (the ORC build, tests, the Bookwhen login, the grant) carry when they were recorded, and say they
  were not re-read.
- It keeps the `**Where we are now:** #193` form; `tools/map.mjs`'s regular expression still parses it (checked).
- It has 40 content lines (non-blank, non-heading), and line 4 is unchanged.

## The guard decision, and the generator's inputs

**Decision: `create`.** No guard exists, Justin kept "entropy guard at session end" on 4 Oct, and risks 2 and 3 are
failures at the end of a session.

- **Steward:** Justin. **Intent documents:** lab `SCOPE.md`, `scope.yaml`, `decisions/` and
  `memory/authority-rules-step-1.md`; ORC `README.md` "Direction" and `AGENTS.md` "Boundaries" and its core rule.
  **Decision surface:** lab `decisions/`; issues on #140 for single-issue decisions. **Open intent questions:** Q1 to
  Q3.
- **Current-state file:** lab `STATE.md`, refreshed by the agent that caused the event (lab `AGENTS.md` "Keeping
  state").
- **Rules the system is bound by but does not own:** `~/pro/local-config/home/AGENTS.md`, which was not read; ORC's
  `SECURITY-REVIEW.md` and Danger; the rules in #140's description, not read; the merge rule of 25 Sep; and
  `HOW_NOT_TO_PLAN.md`, not read.
- **Verification commands:**
  - Danger runs by itself.
  - By hand: `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `node tools/map.mjs --check` and `git diff --check`.
- **Code areas, and the documents and tests that describe them:**
  - reach (`src/adapters`, `src/core`, `src/app/agent-packages.ts`, `config/installation.ts`): `AGENTS.md`
    "Boundaries", `README.md` "Credentials" and "Boundary", and `test/architecture.test.ts`;
  - the package API: `src/package-api.api.md`, its test, and Danger;
  - the restart: `README.md` "As a service" and `AGENTS.md` 136;
  - the lab tools: lab `README.md` and `AGENTS.md`.
- **Live state a session can change:** ORC's running build (through cards), grants, package approvals, Scope
  credentials, map marks in Project 4, and live Bookwhen entries (paused). The default model,
  `openai-codex/gpt-5.6-sol`, is billed per call.
- **Findings:** F1 to F21.

## Guard generation

This is the `session-coherence-skill-generator` output.

- **Supplied:** this assessment, as the generator's inputs.
- **Guard:** `guard/SKILL.md`. Its intended path is the lab's `skills/session-coherence-guard/SKILL.md`. The lab
  already has a `skills/` folder, and Justin made the lab the central Scope for code quality on 4 Oct.
- **Size: 1,224 words** (`wc -w`), against a budget of 1,221. The budget's terms:
  - the common contract, 724 words;
  - 11 checks beyond the 2 standing ones, at 36 each, 396 words;
  - the filled pointers, 60 words;
  - the repository commands, 41 words.

  The excess is 3 words. Three pieces of content have no budget term of their own:
  - the line saying the guard covers two repositories, 23 words;
  - the open questions Q1 to Q3, kept visible as the generator requires, 57 words;
  - the instruction to run the commands in each repository, with the live-build read, 29 words.

  The 11 checks average under 36 words, which absorbs most of that.
- **Documentation references added,** both in `settled.patch`:
  - lab `AGENTS.md` "Keeping state";
  - a new section in ORC `AGENTS.md`, "Where the work stands, and the end of a session".
- **Validation run:**
  - every patch applies cleanly with `patch -p1`, alone and in sequence, to a copy of the snapshots;
  - no added line has trailing whitespace (the `git diff --check` equivalent);
  - the guard's `git grep` reach search was run against a git copy of ORC's `src`, `config` and `scripts`, and found
    the hits in the search record;
  - `map.mjs`'s regular expression parses the updated `STATE.md`.
  - The tests could not be run, because `node_modules` is absent.
- **Review before handover:**
  - The guard carries "Modes and safety" and binds its baseline to `<start>`, falling back to `origin/main`.
  - The patches are sorted: nothing in `settled.patch` touches Q1, Q2 or Q3.
  - The repair instructions were checked against authorised intent.
  - The size was checked against the budget.
- **Open questions the guard leaves visible:** Q1 to Q3.
- **Handoff:** to `guards-integrator`, in `integration.md`.

## Not covered

- GitHub (#140's rules, issue and PR state, branch protection, Danger runs).
- The live service and its SQLite policy store.
- Scope package code.
- Pi's source.
- The user-wide `AGENTS.md`, `HOW_NOT_TO_PLAN.md` and both `MODEL.md` files.
- The bodies of the 80 lab reports: only their headings, and the parts cited above, were read.
- `FRICTION.md`: only its headings and five entries were read.

## Uncertainties

- **U1.** `child-agent-process.ts` 372 gives the researcher child `PI_CODING_AGENT_DIR`. If Pi reads provider sign-in
  from that directory, a child that reads attacker-authored pages can read a credential file. In that case
  `README.md` 104 ("No subprocess ORC launches receives one") is true of its environment only. This was not checked:
  Pi's source is not in the snapshot.
- **U2.** Whether Claude Code sessions in ORC load ORC's `AGENTS.md`. There is no `CLAUDE.md` link, unlike the lab.
- **U3.** Whether the 3 Oct decisions are already on #194 and MS #52.
- **U4.** Whether Moving Stillness holds live apply authority now. The seed binding grants no operations
  (`config/installation.ts` 57–58); the live policy store was not read.
- **U5.** Whether `~/.local/share/orchestrator-proof` is still ORC's state directory. It was recorded on 28 Sep.
