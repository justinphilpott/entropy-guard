# Entropy assessment: ORC and the orchestration-lab Scope, as one system

Run on 2026-10-07 with entropy-guard's skills (`entropy-assessment` 0.9.0, `docs-first-planning-assessment` 0.3.0,
`session-coherence-skill-generator` 0.5.0, `guards-integrator` 0.4.0), against read-only snapshots of two repositories
taken on 2026-10-04:

- **ORC**, `orchestrator/`: Justin's TypeScript orchestration system (278 files outside `node_modules`, 67 test files).
- **The lab**, `scope-orchestration-lab/`: the Scope that manages ORC's work (state, decisions, friction log, reviews,
  and two small tools that draw the map of work and the daily diary).

**Route taken.** Step 1 intent pass; Step 2 lifecycle `active`, shape **B (mixed docs and code)** across two
repositories, with the lab treated as a docs-first member, so docs-first Steps 2, 3, 5 and 7 were run on it and folded
in here; `mixed-profile.md` for the whole system; Step 3 guard decision **`create`**; Step 4 handover to the generator,
which wrote `guard/SKILL.md` and handed to the integrator (`integration.md`).

**Mode.** Build, with every output written to this run's output folder and nothing applied to either repository (the
snapshots are read-only, and the generator's default for changes that cross repositories or touch policy is
discuss-first). No steward was available: each question is in `questions.md` with a recommended answer, and every
proposed change is sorted into `patches/settled.diff` or `patches/provisional.diff`.

**Not covered**, and so not claimed: GitHub (issues, orchestrator#140's description, pull requests, the Project), git
history and hook configuration (the snapshots have no `.git`), any live service (ORC, ntfy, Bookwhen), files outside the
two snapshots (the user-wide `~/pro/local-config/home/AGENTS.md`, `~/pro/agentic/HOW_NOT_TO_PLAN.md`,
`~/pro/scope/docs/MODEL.md`, the Moving Stillness package, local-config's `push-summary`), library source (no
`node_modules`, so Pi's, Playwright's and the MCP SDK's own behaviour is not verified), `web/` beyond the token-storage
claim, `e2e/`, `research/`, `status.html`, and most of the 78 entries in the lab's `reports/`. ORC's tests were not run.

---

## 1. Intent

### Steward

**Justin.** Lab `scope.yaml:6` (`steward: justin`) and `:35-37` (`members: justin, role: admin`); the lab's
`scope.yaml:10-20` lists ORC's repository as the `orchestrator` project's application resource, so the steward covers
both repositories. ORC's own repository names no steward, but quotes Justin as the one deciding (`AGENTS.md:33-37`).

### Authorised intent, with sources

| Part | Source | Kind and authority |
|---|---|---|
| Purpose: develop and operate Justin's local orchestration platform and its reusable Scope-owned agents | lab `scope.yaml:5,13`; `SCOPE.md:5-7` | Directive; steward named in the same file, undated |
| Authority split: ORC facts in ORC's repo, Scope-model facts in `pro/scope`, their relationship in the lab | lab `SCOPE.md:17-24`; `AGENTS.md:12-23` | Directive, undated |
| North star: ORC as his ChatGPT replacement, daily tool, agentic development test ground and eventual work showpiece; after the six slots, work towards a point of consolidation | lab `STATE.md:8-11` | Steward, dated 2026-09-25 and 2026-09-26; held only in an overwritten state file (F1) |
| Core carries nothing tying it to a Scope, model, owner or agent | ORC `AGENTS.md:30-55` | Steward, dated 2026-09-12 and 2026-09-13 |
| No agent holds private data, attacker-authored content and an outbound channel at once; new authority needs an explicit human choice | ORC `AGENTS.md:68-80,110-112` | Directive, undated; sources in issue #20 (not read) |
| Approval cards drawn from fixed blocks | ORC `AGENTS.md:114-128` | Operator (Justin), 2026-09-26 |
| ORC owns a general async-work capability; scheduling is a declared property; apply_slots is its first user | lab `decisions/2026-09-17-async-work-architecture.md` | Steward, dated 2026-09-17 |
| Authority rules 1, 2 (amended), 4, 5 affirmed; 3, 6, chat handling and Iris's role open | lab `memory/authority-rules-step-1.md` | Steward, dated 2026-10-01 |
| Scope logins are not centralised | ORC `src/adapters/scope-credentials.ts:14` | Operator (Justin), dated 2026-09-28, quoted in code |
| The map of work, orchestrator#140, is the reference point for all agents | ORC `AGENTS.md:7-12`; lab `AGENTS.md:7-10`; `tools/map.mjs:4` | Steward, dated 2026-10-02; the rules themselves are in #140 (not read) |
| The lab is the central Scope for project management, issue tracking, code quality and security; all listed processes kept, including "entropy guard at session end"; scheduling (#166) first | lab `STATE.md:38-55` | Steward, dated 2026-10-04; held only in an overwritten state file (F1) |
| Pace: one scored real use before new design | lab `AGENTS.md:25-29`, pointing at `HOW_NOT_TO_PLAN.md` | Directive; the governing file is outside the snapshot |
| Direction: Iris front door, ADA to create agents (not working, #23), every agent belongs to a Scope, documentation concise and retrospective | ORC `README.md:9-23` | Description, undated |

### Three readings

- **Declared:** the README's direction and boundary, the lab's purpose, the core-ties rule.
- **Enacted** (from `STATE.md`, `FRICTION.md` and the reports, since there is no git history in the snapshots):
  the resolve-before-acting browser work (#193), ORC driving Playwright itself (#76, #197), phone notices (closed
  3 Oct), invoicing through ORC, the package API version (#201), the map of work and its tools.
- **Authorised:** the table above.

No gap between enacted and authorised work was found that the evidence can show; the consolidation front named on
26 Sep is tracked as front F in `reports/2026-09-30-priorities.md`. Without git history, this is a limit of the
evidence, not a finding of agreement.

### Gaps, by condition

- **Stale description:** F3 (scheduling listed as deliberately absent), F4 (ORC's Bookwhen published-events
  connector), part of F7 (credential reading points).
- **Conflict:** F12 (the state file's cap: forty content lines or sixty lines).
- **Missing:** F1 (no durable record for the 4 Oct and earlier decisions held only in `STATE.md`); F18 (no
  session-end guard although one was kept).
- **Ambiguous:** F6 ("Direct network access exists only in"), F7 ("credentials are read in one place").
- **Unauthorised drift:** none shown by the evidence (see above).
- **Prose control:** F9 ("guarded changes go through a pull request").

### Existing guards' repair instructions, read against the intent-change rule

There is no entropy guard in either repository (F18). The other instructions that tell an agent how to repair:

- **Intent:** none found that treats work as permission to change authorised intent.
- **Ownership:** ORC `README.md:158,162`: "Pi is pinned in four places — the dependency plus three pnpm overrides",
  and "`pnpm pi:update` # moves all four". This keeps four declarations of one version in step. `scripts/update-pi.mjs`
  sets all four from one value, which makes them closer to a generated projection than four definitions; no change
  proposed. `README.md:165` ("Currently on Pi Coding Agent `0.82.1`") is a fifth, hand-kept copy; it matches
  `package.json` today (F20).

### Questions and proposed changes

Five questions, Q1 to Q5, each with a recommended answer, are in `questions.md`. Proposed intent-adjacent changes are
recorded as follows: the decisions found only in `STATE.md` are copied into a new lab decision record (settled patch,
F1); no intent document is edited to match the work.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** Lab `scope.yaml:7,14` (`status: active` for the Scope and the `orchestrator` project);
  `STATE.md:3` updated 2026-10-04 17:31; `FRICTION.md` and `reports/` have entries dated 2026-10-04.
- **Shape: B, mixed docs and code,** chosen as the riskiest of the shapes that fit:
  - ORC is code-first (C): `src/` with 111 TypeScript files, a 1,322-line architecture test, an API report, but also 15
    top-level Markdown files.
  - The lab is docs-first (A): state, decisions, friction, ideas and reviews in Markdown, plus three small tools.
  - The whole is also workflow-heavy (D): the map of work, Danger, restart and approval cards, nine kept processes.
  - The costliest drift found sits between docs and code (F4 to F8) and in the state file (F11), which is B's
    territory.
- **Repositories: two, assessed as one system.** ORC holds the implementation; the lab holds its current state,
  decisions and process. Other repositories appear only at the seam (the Moving Stillness package, the Bookwhen ops
  tool, `pro/scope`, scope-finance) and were not read.

---

## 3. Findings

One list. Every other section refers to these ids.

**F1. Steward decisions held only in an overwritten state file.** Lab `STATE.md` is "overwritten at each verified
event" (`AGENTS.md:33`), yet it is the only record found, in either snapshot, of: the north star (Justin, 25 and
26 Sep, `STATE.md:8-11`); the merge rule (Justin, 25 Sep, `:17-18`); Moving Stillness paused (Justin, 4 Oct, `:33`);
the 4 Oct interview (`:38-55`); three 3 Oct issue-level decisions (`:57-58`). `decisions/` holds one file
(2026-09-17). The lab `AGENTS.md:12-23` table says where learnings go and has no row for decisions. Intent-pass §5
requires copying them to a durable record; the settled patch does that and adds the row. GitHub was not read, so some
may also be on their issues. Source: listed lines.

**F2. A plan for open authority work lives in a Claude-only folder.** `memory/authority-rules-step-1.md:5`: "plan:
`~/.claude/plans/agile-booping-waffle.md`, held until the steps are agreed". Other agents (Codex, opencode, Pi,
Astra) are not shown to read `~/.claude/`. Not read (outside the snapshot). Recommendation: move the plan into the
lab's `memory/` beside step 1. Not in a patch, because the file could not be read.

**F3. ORC's README lists scheduling as deliberately absent.** `README.md:152-154`: "Deliberately absent ...:
reminders, scheduling, additional external data sources, workflow execution...". The 2026-09-17 decision makes
scheduling a declared property of ORC's durable work (`schedule`: `now`, `at` or `recurring`), and the code has it
(`src/app/async/calendar.ts`; `src/core/async/types.ts:65,337`; the `*:async-series` scripts in `package.json`).
Settled correction: remove "scheduling" only, citing the decision. "Reminders", "additional external data sources"
and "workflow execution" are not plainly settled by a recorded decision and stay as they are; open. Already reported
by the lab's `reports/2026-10-01-design-review.md:174-177` and `reports/2026-10-01-review-synthesis.md:43-44`, and
waiting on Justin's word (synthesis item 7).

**F4. ORC's docs describe a Bookwhen published-events connector ORC no longer has.**
- `README.md:76-79` says to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN` for "exact-pinned `@jphil/bookwhen-client@0.6.1`".
  The variable is read nowhere (inventory of `ORCHESTRATOR_*` names across `src`, `config`, `scripts`), the client is
  not in `package.json`, and `test/architecture.test.ts:1315-1316` asserts both absences.
- `AGENTS.md:102-103` names `src/bookwhen.ts` as "the only module that imports the pinned Bookwhen client"; the file
  does not exist.
- `README.md:4-7` calls ORC's external paths "read-only"; `README.md:146-147` says the Moving Stillness specialist
  plans "without applying it". The 2026-09-17 decision made apply_slots the first user of durable work, with
  approval required (`decisions/2026-09-17-async-work-architecture.md`, "Consequences").

Settled correction, from AGENTS.md's own rule that domain connectors belong to their Scope (`AGENTS.md:40-41`) and
the 17 Sep decision. Also already reported by the 30 Sep design review and the 1 Oct synthesis.

**F5. ORC's list of where subprocesses are launched is incomplete.** `AGENTS.md:92-96` names three modules. The
search (record R-launch, section 4) finds a fourth that the architecture test already names,
`src/adapters/orc-service.ts` (git, `pnpm install --frozen-lockfile`, `scripts/build.mjs`, `systemctl --user restart
orc.service`; test at `test/architecture.test.ts:823-836`, citing orchestrator#101), and a fifth that neither names:
Chromium, launched through Playwright's library at `src/adapters/browser/playwright.ts:55`. The test's pattern looks
for `child_process`, so a library that starts a browser is invisible to it. Settled: add `orc-service.ts`, matching
the test and the README's restart-card section. Provisional on Q4: add Chromium, and a test check for browser
launches.

**F6. ORC's "only" list of network access is incomplete, and its document and test agree on the incomplete list.**
`AGENTS.md:98-101`: "Direct network access exists only in `src/core/research-tools.ts` ... and in
`src/adapters/notifications/ntfy.ts`". `test/architecture.test.ts:1295-1310` checks the same two. The search (record
R-net) finds, beyond them:
- a DNS lookup in ORC's own source, `src/adapters/browser/playwright.ts:14,520` (`lookup` from `node:dns/promises`),
  which `AGENTS.md:73` itself counts as an outbound channel; this makes the claim false under either reading below;
- Chromium's page loads to the hosts a browser grant approves (`playwright.ts:55`; `config/installation.ts:134`);
- the model provider calls Pi makes from the ORC process and the researcher child;
- the restart card's `pnpm install`, which downloads any package a release adds (`orc-service.ts:35-37,128`);
- MCP servers launched by `src/adapters/mcp/client.ts`, which reach whatever they reach;
- Scope package connectors bound in `config/installation.ts`, including SMTP to `smtp.protonmail.ch:587` for the
  Finance mail connector (`:168`); real email is waiting on orchestrator#137 (lab `STATE.md:69-70`).

"Direct" allows two readings (Node primitives in ORC's source only; or every reach made on ORC's behalf), which give
different lists: Q4. The rewrite of the paragraph and the test change are provisional on Q4; the SMTP line also
names #137.

**F7. ORC's credential claims do not match the code.** `README.md:103-104`: "A credential is read in exactly one
place, `src/runtime.ts`, and handed to the narrow connector that needs it. No subprocess ORC launches receives one."
The search (record R-cred) shows:
- `src/runtime.ts` reads no credential. Credentials are read by `src/web-cli.ts:625` (`ORCHESTRATOR_WEB_TOKEN`),
  `src/app/agent-packages.ts:772-777` (connector slots, from the environment or a Scope's folder), and
  `src/adapters/scope-credentials.ts:39-59` (Scope credential files), after `scripts/orc-env.sh:16-46` loads
  `~/.config/orchestrator/env` into the environment. The per-Scope part is authorised by the operator's 28 Sep quote
  (`scope-credentials.ts:14`). Whether "one place" means one module overall or one module per source is open: Q5.
- **Defect in the work, not the document:** `src/adapters/orc-service.ts:71,102,107,128` launch git, systemctl, node
  and pnpm with no `env` option, so each inherits ORC's whole environment (Node's default), which `orc-env.sh` filled
  from the env file (the unit's `ExecStart` runs ORC through it, `scripts/orc-service.ts:54`). The pnpm, git,
  systemctl and node processes a restart card starts therefore hold `ORCHESTRATOR_WEB_TOKEN`. The documented
  constraint is also `AGENTS.md:106-108` ("Credentials stay in composition roots and narrowed connectors"). Under
  intent-change rule step 6, the code is what is wrong. Proposal for an ORC pull request (guarded path, needs a
  Security review section): give `orc-service.ts`'s `run` an explicit environment carrying only what git, pnpm and
  systemctl need (for example `PATH`, `HOME`, `XDG_RUNTIME_DIR`, `DBUS_SESSION_BUS_ADDRESS`), as
  `src/core/analysis-tools.ts:314-321` already does for git, plus a test in the style of `architecture.test.ts:1006`.
  ORC's `SECURITY-REVIEW.md` ("What these boundaries are not") rightly says this is tidiness, not containment; that
  sizes it as small, not as a reason to change the document.
- Not verified: whether Chromium inherits ORC's environment (`chromium.launch` passes no `env`; Playwright's default
  decides it) and where Pi reads its provider credentials (`child-agent-process.ts:372` passes
  `PI_CODING_AGENT_DIR`). Both are library behaviour, absent from the snapshot.

**F8. The list of Danger-guarded paths is defined twice.** `SECURITY-REVIEW.md:177-181` restates `dangerfile.js`'s
`GUARDED` list (`dangerfile.js:11-26`) and omits seven entries: `config/`, `package.json`, `pnpm-lock.yaml`,
`scripts/approve-agent-package.ts`, `scripts/async-work.ts`, `test/core-ties.ts`, `scripts/source-headers.js`. The PR
template already defers to `dangerfile.js` (`.github/pull_request_template.md:5`). Settled: `dangerfile.js` owns the
list; the prose becomes a pointer with a correct summary.

**F9. "Guarded changes go through a pull request" is a rule nothing enforces.** ORC `AGENTS.md:141-143` and
`SECURITY-REVIEW.md:52-55` say so, and say themselves that a direct push to `main` is not checked and that "without
GitHub Pro a failed check warns rather than blocks a merge". The lab's `STATE.md:79-82` cites Danger as how security
reviews are checked, without that caveat. Enforcement would sit in a GitHub ruleset or branch protection on `main`,
in the existing `.githooks/pre-push` (refusing a push to `main` that touches `GUARDED` paths, once `core.hooksPath` is
set), or in the restart card (refusing to build a commit on `main` that no merged pull request reached). Reported,
not patched: choosing one is Justin's.

**F10. ORC's tests run only by hand.** CI runs only Danger (`.github/workflows/danger.yml:31`). `pnpm test`,
`pnpm typecheck` and `pnpm test:e2e` run when an agent or the diary runs them. "Tests on every PR (#144)" was kept on
4 Oct (`STATE.md:45`); the mechanism, GitHub Actions or a pre-push hook, waits on Justin (`STATE.md:69`). The merge
rule (Claude merges once review and tests pass) depends on the agent's own run. Linked to #144; no parallel work.

**F11. The state file contradicts itself and has outgrown its cap, again.** Lab `STATE.md` on 4 Oct is 99 lines
against "about forty content lines" (`AGENTS.md:34`) or "sixty lines" (`STATE.md:4`). Inside it:
- `:23` "#193 ... is built and in review, not merged" against `:31` "#193 is live: #200 merged as `3989cdb`";
- which build runs: `:58` "ORC live: 369628b since 22:12:47" and `:88` "main process started 2026-10-03 22:12:47 on
  `369628b`" against `:35` "#195 live (`8cee662`, restarted 14:48:27, verified)";
- Moving Stillness's head: `:91` "`main` `c759f96` (MS #51)" against `:31` "MS #53 merged as `fc830aa`";
- `:94` "Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z", carried as current on 4 Oct.

The same failure is recorded in `FRICTION.md` on 2026-09-12 (state lagged the work), 2026-09-13 (118 lines against
forty), 2026-09-22 ("a state file that lied twice") and 2026-09-23 (405 lines against forty). Four recurrences of one
cause: this is a **missing system** (nothing checks the state file at the moment it is written), not an instance.
The guard's live-fact and state-size checks are that system's judgment part; a line count is its mechanical part
(integration, Plan). The settled patch rewrites `STATE.md` (docs-first Step 5) to 37 content lines in 59 lines, which
satisfies both caps.

**F12. Two numbers for one cap.** `AGENTS.md:34` "capped at about forty content lines"; `STATE.md:4` "Target: sixty
lines". No recorded decision says which. Q3. The provisional patch makes `AGENTS.md` the one owner.

**F13. The lab's README describes its diary tool wrongly.** Search: `rg -n -e '--serve' -e '4190' tools README.md`
finds both only in `README.md:18,22`.
- `README.md:18` documents `--serve` on `http://localhost:4190`; `tools/report.mjs` has no such flag, and its header
  says "nothing is served" (`report.mjs:13`).
- `README.md:16` says a full run takes about ten seconds; `report.mjs:9-10` says about two minutes with the suites
  and ten seconds without.
- `README.md:17` says `--no-tests` "keeps the day's test count"; `report.mjs:51,313` write `suites: null` into the
  day's snapshot, replacing an earlier count from that day.
- The README does not say that a run adds issues to the GitHub Project (`report.mjs:56-57`, `map.mjs:128-139`).

Settled correction.

**F14. The kept recurring processes do not run by themselves.** The diary is described as "the nightly job"
(`report.mjs:56`) that "draws it every morning" (`map.mjs:13`), and Justin kept it on 4 Oct; nothing in either
snapshot schedules it, and the last daily snapshot is `reports/2026-10-02.json` (none for 3 or 4 Oct). The weekly
adversarial review, FRICTION into rules (#60), cleanups (#70, #182) and `node tools/map.mjs --check` are in the same
position. Justin decided they run through ORC's scheduling, built first (#166). Linked to #166; no parallel work.

**F15. Superseded material sits beside live truth.** ORC's top level holds twelve dated reports (`CLASSIFY.md`,
`FIXES.md`, `GRANTS-E2E.md`, `GRANTS.md`, `MCP.md`, `OPERATOR.md`, `POLICY-STORE.md`, `REWORK.md`, `SEAM.md`,
`SLICE1.md`, `TURN-RECORD.md`, `VISIBILITY.md`). Only `MCP.md` carries a history banner. Three name files that no longer
exist (path check of backticked paths: `GRANTS.md` names `src/adapters/browser/service.ts`; `MCP.md` names
`src/core/ports/browser.ts` and `test/browser-service.test.ts`; `CLASSIFY.md` names `src/adapters/browser/mcp.ts` and
`service.ts`). `REWORK.md:3` reads "Nothing committed, nothing pushed". In the lab, `memory/slots-run-walkthrough.md`
traces the 28 Sep browser path through Playwright MCP and `service.ts`/`mcp.ts`, replaced by #76 on 3 Oct, in a
folder agents read as current. The cost is shown in `FRICTION.md` 2026-09-27 ("the entry-lookup instruction named a
tool that was gone, and I copied it"). The ORC cleanup is target 4 of `reports/2026-10-01-design-review.md:248-258`,
waiting on Justin's word; linked, not duplicated. Settled: a dated "superseded in part" note on the walkthrough.

**F16. One concept defined in ORC and again in each package's manifest.** A host connector's setting names are
defined in ORC and in every Scope package's manifest with no test across the two; renaming `granted-tools` to
`granted-actions` made Moving Stillness unavailable for about an hour (`FRICTION.md` 2026-10-03, orchestrator#198).
Packages cannot test against ORC's real parts (#202). Linked to #198 and #202.

**F17. `FRICTION.md`'s order and the diary's reading of it.** `FRICTION.md:3` says "Newest first"; from line 1153 the
sections run oldest first (2026-09-11 to 2026-09-19, after 2026-09-03). `tools/collect.mjs:156` matches
`## <date> — <title>` only, so the sections headed "2026-09-21 night", "late" and "evening" are counted under the
section above them in the diary. Low; recommendation only.

**F18. No session-end guard exists, though Justin kept one.** `STATE.md:49` lists "entropy guard at session end" among
the processes kept on 4 Oct. Neither repository holds a guard (search for "entropy", "session end" and "coherence":
only `STATE.md:49,54` and reports mention it); the lab's `skills/` holds only `.gitkeep`. Whether one exists outside
the snapshots is Q2.

**F19. The state file restates ORC's operating facts.** `STATE.md:88-90` repeats how ORC runs (`orc.service`,
`pnpm service:status`, `journalctl`), which ORC's `README.md:106-129` and `AGENTS.md:136` own, against the lab's
`SCOPE.md:19` and `AGENTS.md:21`. Settled: the rewrite keeps the live observation (which build, when read) and one
command.

**F20. A hand-kept copy of the Pi version.** `README.md:165`. Matches `package.json:69` today; keep it correct. Low.

---

## 4. Search records for claims about everything of a kind

Searches used Claude Code's bundled ripgrep (`rg`) and `grep -rnE`; ast-grep and Semgrep are not installed (checked
2026-10-07: `ast-grep`, `semgrep` not found; `/usr/bin/sg` is shadow-utils, not ast-grep). Test files excluded unless
stated. "Process" is the process that runs the hit.

### R-net: network reach (F6)

Patterns: `\bfetch\(`, `-w fetch`, `node:https?`, `node:net`, `node:tls`, `node:dns`, `new WebSocket`,
`EventSource\(`, `undici`, `XMLHttpRequest`, `https?\.(request|get)\(`, `ClientTransport`; `chromium|firefox|webkit|
\.launch\(|launchPersistentContext|connectOverCDP|from "playwright|@playwright`; `@earendil-works/pi-[a-z-]+`;
`smtp|calendar`. Paths: ORC `src`, `config`, `scripts`, `web/src`, `e2e`; lab `tools`, `reports/async-flows`,
`.githooks`.

| Hit | Process | In AGENTS.md's list? |
|---|---|---|
| `src/core/research-tools.ts:8` `node:https` request, Jina Reader | researcher child (per README and AGENTS.md; not traced) | yes |
| `src/adapters/notifications/ntfy.ts:84,120` `fetch` | ORC | yes |
| `src/adapters/phone/index.ts:14` passes `fetch` to `publishNtfy` | ORC; transport in `ntfy.ts` | covered by ntfy |
| `src/adapters/browser/playwright.ts:14,520` `lookup` from `node:dns/promises` | ORC | **no** |
| `src/adapters/browser/playwright.ts:55` `chromium.launch`, hosts from `config/installation.ts:134` | Chromium, started by ORC | **no** |
| Pi imports across `src/backends/pi/*`, `src/runtime.ts`, `src/tools.ts`, `src/core/child-agent-process.ts` and others | ORC and the researcher child, through Pi | **no** (library; not verified) |
| `src/adapters/orc-service.ts:128` `pnpm install --frozen-lockfile` | pnpm, started by ORC for the restart card | **no** |
| `src/adapters/mcp/client.ts:8,60` `StdioClientTransport` | an MCP server started by ORC | as a subprocess only |
| `config/installation.ts:121,168` calendar token; SMTP `smtp.protonmail.ch:587` | Scope package connectors in ORC | general clause only (`AGENTS.md:96`) |
| `src/web-server.ts:8`, `src/web-cli.ts:12` `node:http` | ORC, inbound server | n/a (inbound) |
| `src/file-lock.ts:19` `createServer` from `node:net` | ORC, local lock | n/a (not outbound; not traced) |
| `web/src/api.ts:243,271,396,435` `fetch` | the browser client, to ORC's own API | n/a |
| `scripts/orc-service.ts:17`, `scripts/dev-web-readiness.ts:7`, `scripts/dev-web.mjs:3` `node:net` | operator scripts, by hand | n/a (local port checks) |
| lab `tools/collect.mjs:71-100`, `tools/map.mjs:48-162` `gh` | the diary or map tool, by hand | lab has no reach list |

### R-launch: launches (F5)

Patterns: `node:child_process`, `"child_process"`, `\bspawn(Sync)?\(`, `\bexecFile(Sync)?\(`, `\bexecSync\(`,
`\bfork\(`, `worker_threads`, `new Worker\(`, `StdioClientTransport\(`, `chromium\.launch`. Paths: ORC `src`,
`config`, `scripts`, `e2e`, `playwright.config.ts`, `vitest.config.ts`; lab `tools`, `reports/async-flows`,
`.githooks`.

| Hit | Process | AGENTS.md | Test |
|---|---|---|---|
| `src/core/child-agent-process.ts:7,532` `spawn(process.execPath)` | ORC, Pi researcher child | yes | yes |
| `src/core/analysis-tools.ts:7,300` `spawn("git")` | ORC, analyst tool | yes | yes |
| `src/adapters/mcp/client.ts:60` `StdioClientTransport` | ORC, MCP server | yes | yes |
| `src/adapters/orc-service.ts:9,71,102,107,128` `execFile` git, systemctl, node, pnpm | ORC, restart card | **no** | yes |
| `src/adapters/browser/playwright.ts:55` `chromium.launch` | ORC, Chromium | **no** | **no** |
| `src/adapters/agent-files/package-resolution.ts:19,54-62` `Worker` subclass | threads in ORC, not processes | n/a | n/a |
| `scripts/build.mjs:10-18` `execFileSync` node, git | by hand, and by the restart card through `orc-service.ts:107` | n/a | n/a |
| `scripts/dev-web.mjs:1,89`, `scripts/orc-service.ts:14`, `scripts/update-pi.mjs:17,32` | by hand | n/a | n/a |
| lab `tools/collect.mjs:9,33,192` `execFileSync` gh, git, `bash -c pnpm exec vitest` | by hand (the diary) | n/a | n/a |
| lab `reports/async-flows/build.mjs:9` `execFile` | by hand | n/a | n/a |
| `.githooks/pre-push` in both repositories | git, on push, if enabled | n/a | n/a |

### R-cred: credential reads (F7)

Patterns: `process\.env`, `credentials?`, `storage-state|storageState`, `apiKey|api_key|API_KEY`, `TOKEN`,
`auth\.json`, `ORCHESTRATOR_[A-Z_]+` (inventory, 20 names), `"credentials"`, `\.config/scopes`,
`readScopeCredential\(`, `ORCHESTRATOR_WEB_TOKEN`. Paths: ORC `src`, `config`, `scripts`.

| Hit | Process |
|---|---|
| `scripts/orc-env.sh:16-46` reads the env file and exports each line | the wrapper systemd and dev mode run ORC through |
| `src/web-cli.ts:625` `ORCHESTRATOR_WEB_TOKEN` | ORC |
| `src/app/agent-packages.ts:772-777` connector slots, from the environment or through `readScopeCredential` | ORC |
| `src/adapters/scope-credentials.ts:27-59` `<root>/<scope>/credentials/<name>`, default root `~/.config/scopes` | ORC |
| `src/adapters/browser/index.ts:45-76`, `playwright.ts:64-66,547-553` storage state received and parsed | ORC, then Chromium's context |
| `scripts/dev-web.mjs:13,34,40` token read, removed from Vite's environment, passed to the dev server | dev launcher, by hand |
| `src/core/child-agent-process.ts:372-374` explicit child environment; `test/architecture.test.ts:1006-1007` checks it | researcher child gets none |
| `src/core/analysis-tools.ts:314-321` explicit git environment | analyst's git gets none |
| `src/adapters/orc-service.ts:71,102,107,128` no `env` option | restart card children inherit everything |
| `src/runtime.ts` | no credential read (env reads are state and Scope directories only) |

### R-store: one storage claim checked

`README.md:66-67`: the web token "is retained only in memory and session storage". `web/src/api.ts:539-555` uses
`sessionStorage`; `localStorage` holds only the theme and the rail's state and width (`web/src/app.tsx:775-1031`).
**Holds.**

---

## 5. Domains, ownership and drift (mixed profile)

**Domains present and actively changed:** code (ORC `src/`, `web/`, lab `tools/`), documentation (both), tests
(ORC, 970 unit and 5 E2E on 4 Oct per `STATE.md:30`), API and data contracts (`src/package-api.api.md`, package
manifests, the SQLite store), workflow and process (the map, Danger, cards, kept processes), and live operational
state (`orc.service`, approvals and grants, the Bookwhen site, ntfy, the GitHub Project, credentials).

**Concepts and owners:**

| Concept | Owner | Others (summary or link) |
|---|---|---|
| What ORC is for and how it behaves | ORC `README.md`, `AGENTS.md` | lab `SCOPE.md` |
| What ORC reaches, launches and reads credentials from | ORC `AGENTS.md` "Boundaries"; enforced in part by `test/architecture.test.ts` | ORC `README.md` restates it (F4, F7; settled patch makes it a link) |
| Danger-guarded paths | `dangerfile.js` | `SECURITY-REVIEW.md` (F8), PR template |
| Current state of the whole system | lab `STATE.md` | none in ORC |
| Decisions | lab `decisions/`, and the issue a decision settles | lab `STATE.md` holds some (F1) |
| Open work | GitHub issues on orchestrator#140 | lab `STATE.md` lists those waiting on Justin |
| Map rules | orchestrator#140's description | ORC and lab `AGENTS.md`, `tools/map.mjs` (summaries) |
| The repositories on the map | lab `tools/collect.mjs` `REPOS` | not `scope.yaml`, which lists this Scope's own resources: a different concept |
| How ORC runs as a service | ORC `README.md`, `AGENTS.md:136` | lab `STATE.md` (F19) |
| What broke in use | lab `FRICTION.md` | none |
| A host connector's setting names | **two homes**: ORC and each package manifest (F16) | |
| The state file's cap | **two numbers**: lab `AGENTS.md`, `STATE.md` (F12) | |

**Drift between domains, by finding:** docs against implementation F3, F4, F5, F6, F7, F13; docs against docs F8,
F11, F12, F17, F19; tests against implementation F5, F6 (the test checks a narrower thing than the document claims),
F10 (tests run only by hand); contracts against implementation F16; workflow against reality F14, F18; rules
against enforcement F9, F11.

### Ranked risks (decay rate times recovery cost)

1. **The state file tells a fresh session the wrong live facts** (F11, F12, F19). Decays within hours: it is rewritten
   several times a day. Recovery is costly: its errors reach Justin as confident wrong answers about live services
   (`FRICTION.md` 2026-09-22, 2026-09-29). Anchor: lab `AGENTS.md` "Keeping state".
2. **Decisions are lost on the next overwrite** (F1, F2). Decays at the next rewrite of `STATE.md`. Recovery: Justin is
   asked again, or a recorded decision is reopened without anyone knowing it existed. Anchor: lab `decisions/`.
3. **Reach and credential claims are wrong while security reviews rely on them** (F5, F6, F7, F8, F9). Decays with
   each adapter or connector change: three changed reach in the week before the snapshot (#76, #197, #101). Recovery:
   a review answered from a wrong list; `SECURITY-REVIEW.md` question 2 asks exactly what these lists hold. Anchor:
   ORC `AGENTS.md` "Boundaries" plus the code search.
4. **Kept processes that do not run** (F10, F14, F18). Decays daily. Recovery is moderate: nothing breaks at once, but
   the diary's day-by-day record and test counts are lost for each missed day, and are only knowable at the time
   (lab `README.md:22-24`). Anchor: #166, #144.
5. **Superseded material revived** (F15, F3, F4, F13). Decays slowly; recovery moderate (`FRICTION.md` 2026-09-27).
   Anchor: the 30 Sep design review's target 4.

---

## 6. The lab as a docs-first member (docs-first Steps 2, 3, 5 and 7)

### Step 2: truth map

| Document | Role | Notes |
|---|---|---|
| `scope.yaml` | canonical | resource inventory, steward, purpose (`SCOPE.md:23`) |
| `SCOPE.md` | canonical | purpose, projects, authority split |
| `AGENTS.md` (and `CLAUDE.md`, a symlink to it) | canonical | working conventions, where things go, state rules |
| `decisions/` | canonical | settled decisions; one file before this assessment |
| `memory/authority-rules-step-1.md` | canonical | Justin's answers on authority, 1 Oct |
| `STATE.md` | current state | read first (`README.md:8`, `AGENTS.md:3`) |
| `FRICTION.md` | canonical log | what broke in use, product and workshop |
| `AGENT_IDEAS.md` | local elaboration | ideas, "not approved designs" (`AGENT_IDEAS.md:3`) |
| `tools/*.mjs` | product artifact | map and diary; flags and paths are contracts |
| `status.html`, `reports/<date>.json` | generated projection | from `tools/report.mjs` |
| `reports/*.md`, `research/` | historical | dated reviews and research; some hold proposals awaiting Justin |
| `memory/slots-run-walkthrough.md` | historical | a dated trace, superseded in part (F15) |
| `skills/`, `workflows/` | empty | `.gitkeep` only |

### Step 3: the real loop

- **Start.** A session in the lab loads `CLAUDE.md` or `AGENTS.md`, reads `STATE.md`, then `SCOPE.md`, then
  orchestrator#140 on GitHub. A session in ORC reads ORC's `AGENTS.md`, `README.md` and the architecture test. ORC has
  no `CLAUDE.md` (integration, Uncertain).
- **Work.** In ORC worktrees (under `.worktrees/` or `/tmp`, #196 open), on branches; marks on the map through
  `node tools/map.mjs working`.
- **Capture.** Decisions arrive in conversation with Justin and land in `STATE.md`, rarely in `decisions/` (F1);
  friction goes to `FRICTION.md` by day; reviews to `reports/`.
- **Handoff.** `STATE.md` is overwritten "at each verified event"; ORC work goes through a pull request (Danger),
  Claude merges once review and tests pass, the checkout is pulled, and Justin approves the restart card.
- **Pauses.** End of a session, a compaction ("read it again after any compaction"), the merge, and the overnight
  window (work stays on branches after 22:00).
- **Where follow-up is lost.** Between a decision in conversation and the next overwrite of `STATE.md`; between a
  merged change and the docs that describe it.

### Step 5: current-state file

`patches/settled.diff` rewrites `STATE.md` in place (no competing summary): current stage, documents to trust first,
settled decisions linked to the new decision record, live facts marked "recorded 4 Oct, not re-read", open questions
including Q1 to Q5, misleading material nearby, and next actions. It says what makes it stale and who refreshes it.
The `**Where we are now:** #193` line keeps the form `tools/map.mjs:184` parses. Its size line ("Target: sixty
lines") is left as it is because Q3 is open. Items dropped as history (closed, recorded elsewhere, or superseded):
the 3 Oct phone work, #199/#201 go-lives, the power cut (in `FRICTION.md` 2026-10-04), the expired build-card ids,
the old Moving Stillness head.

### Step 6: recommendations and one-time cleanup

- **Consolidate:** reach claims into ORC `AGENTS.md` (F4, F6, F7); guarded paths into `dangerfile.js` (F8); the
  state-file cap into lab `AGENTS.md` (F12); decisions into `decisions/` (F1).
- **Mark historical or delete:** ORC's twelve root reports, through target 4 of the 30 Sep design review (F15); the
  walkthrough gets a dated note now (settled patch).
- **One-time cleanup, each checked against the file on 2026-10-07:** `STATE.md` rewrite (F11); README fixes in both
  repositories (F3, F4, F13); the decision record (F1); F17's order and parser, recommended only.

### Step 7: guard inputs (lab surfaces, keep, amend, replace or demote)

| Surface | Verdict |
|---|---|
| lab `AGENTS.md` | amend: a row for decisions (settled), the guard pointer and one owner for the cap (provisional) |
| lab `CLAUDE.md` → `AGENTS.md` | keep |
| lab `.githooks/pre-push` | keep (a push-summary reminder) |
| lab `.claude/settings.json` | keep (plugins only, no workflow logic) |
| lab `tools/map.mjs --check` | keep; move into scheduled runs (#166) |
| lab `README.md` | amend (F13, settled) |

The checks written against this system's files are the guard's Checks section; the decision is below.

---

## 7. Existing guard surfaces, by whether they execute

- **Runs by itself:** Danger on every ORC pull request, checking for `## Security review` when a `GUARDED` path
  changes and `## Package API` when the API report changes (`danger.yml`, `dangerfile.js`). Evidence: `STATE.md:79-81`
  records it proven on GitHub on 2 Oct (pass, fail, pass); not re-observed here.
- **Runs only by hand:** ORC `pnpm test` (with `test/architecture.test.ts`, the core-ties ratchet `test/core-ties.ts`,
  `test/cause-discard-allowances.ts`, the package API report test), `pnpm typecheck`, `pnpm test:e2e`,
  `pnpm api:report`, `pnpm pi:check`; the `SECURITY-REVIEW.md` checklist; lab `node tools/map.mjs --check` and
  `node tools/report.mjs`.
- **Decided, not built:** tests on every PR (#144); the scheduled processes through #166 (diary, weekly review, #60,
  #70, #182); an entropy guard at session end (F18); a Claude Code hook that clears a session's map marks
  (`STATE.md:65`).
- **Declared, but missing:** `report.mjs --serve` (F13); the diary "every morning" (F14).
- **Unknown:** both `.githooks/pre-push` (enabled only if `core.hooksPath` is set; no `.git` in the snapshots); whether
  the ORC PR template is used (visible only on GitHub).

ORC surfaces, verdicts: `AGENTS.md` amend (F4, F5 settled; F6, F7, guard pointer provisional); `README.md` amend (F3,
F4 settled; F7 provisional); `SECURITY-REVIEW.md` amend (F8, settled); `test/architecture.test.ts` amend (F5, F6,
provisional on Q4); `dangerfile.js`, `danger.yml`, PR template, `.githooks/pre-push` keep.

---

## 8. Guard decision and the generator's inputs

**Decision: `create`.** No guard exists in either repository, Justin kept "entropy guard at session end" on 4 Oct, and
the costliest risks (1 and 2) arise at session end, when `STATE.md` is rewritten and decisions are left in it. If Q2's
answer is that a guard already exists elsewhere, the decision becomes `update` of that guard; the draft carries the
same content either way.

**The generator's inputs:**

- **Steward and intent:** Justin. Intent documents: lab `scope.yaml`, `SCOPE.md`, `decisions/`,
  `memory/authority-rules-step-1.md`; ORC `README.md` ("Direction") and `AGENTS.md`. Decision surface: lab
  `decisions/`, or the issue a decision settles on orchestrator#140. Open intent questions: Q1 to Q5; also open in
  the record: authority rules 3 and 6, chat handling and Iris's role (`memory/authority-rules-step-1.md`), #137, #144's
  mechanism, #196, the labels proposal, what else the lab should cover (Astra).
- **Current-state file:** lab `STATE.md`; refreshed by whichever agent completes a verified event (`AGENTS.md:33`).
- **Rules bound but not owned:** `~/pro/local-config/home/AGENTS.md` (user-wide; not read), `HOW_NOT_TO_PLAN.md` (not
  read), ORC `SECURITY-REVIEW.md` and `dangerfile.js`, orchestrator#140's rules (not read), the merge rule (Justin,
  25 Sep), `~/pro/scope/docs/MODEL.md` (not read). Spending policy: unresolved, not found in either snapshot.
- **Verification commands:** ORC `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report`; lab
  `node tools/map.mjs --check`. Only Danger runs by itself.
- **Code areas, with their docs and tests:** `src/core/` (`AGENTS.md` core-ties, `test/core-ties.ts`,
  architecture test); `src/adapters/` (`AGENTS.md` Boundaries, architecture test); `src/app/async/` and
  `src/core/async/` (lab `decisions/2026-09-17-...`, async tests); `src/package-api.ts` (`src/package-api.api.md`,
  its test, Danger); `src/adapters/orc-service.ts` (`README.md` "As a service", `test/orc-restart.test.ts`);
  `config/installation.ts` (`AGENTS.md`, `README.md` Run); `web/` (`README.md` Run); lab `tools/` (lab `README.md`; no
  tests).
- **Live state a session can change:** `orc.service` (only through Justin's restart card); package and build
  approvals; standing grants; the Bookwhen site through Moving Stillness's executor; ntfy notices; GitHub issues, the
  Project and map marks; ORC's durable-work database; credential files. Spend: none found in code; model-provider use
  through Pi is not costed here.
- **Findings:** F1 to F20.

---

## 9. Guard generation (the generator's output)

- **Supplied:** this assessment. **Found:** no existing guard (F18).
- **Guard:** `guard/SKILL.md`, drafted for `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`
  (provisional on Q1 and Q2).
- **Size: 1,155 words against a budget of 1,123.** Terms, each counted once:
  - common contract, the template with the intent-change rule copied in: 724 words (measured again on 2026-10-07 from
    the generator's template; it agrees with the generator's own figure);
  - checks: 8 repo-specific checks beyond the two standing ones, at 36 words each: 288;
  - pointers, the filled-in "Where things live" values: 38;
  - commands, the repo-specific commands block: 73.

  The 32 words over come from a 39-word comment that keeps Q1 and Q2 visible in the guard, as the generator requires
  for unresolved inputs; it is removed once they are answered, which brings the guard to 1,116. No duplication was
  found to remove; no coverage was cut.
- **Doc references added:** pointers from lab `AGENTS.md` and ORC `AGENTS.md` ("Before handing off"), in
  `patches/provisional.diff` (Q1).
- **Validation run:** both patches checked with `git apply --check --whitespace=error-all` against fresh copies of the
  snapshots: they apply in order and are whitespace-clean (the equivalent of `git diff --check`). The edited
  `test/architecture.test.ts` passes `node --check`, and its two new checks, simulated against this snapshot's `src/`,
  give exactly `[adapters/browser/playwright.ts]` for browser launches and `[adapters/browser/playwright.ts,
  adapters/notifications/ntfy.ts, core/research-tools.ts]` for direct network. ORC's test suite was not run (no
  `node_modules`; installing would fetch from the network). The guard's grep commands were run on the snapshots.
- **Review before handover:** the guard carries "Modes and safety" and binds its baseline per repository; every patch
  is sorted (section 10); no repair instruction permits editing intent documents to match work; size reported above.
- **Open questions the guard leaves visible:** Q1 and Q2 (comment at the top), Q3 (state-size check), Q4 and Q5
  (reach check).
- **Handoff:** to `guards-integrator`, `integration.md`.

---

## 10. Proposed changes, sorted

Nothing here has been applied. Both patches apply from the directory that holds `orchestrator/` and
`scope-orchestration-lab/`, with `git apply -p1` (or `patch -p1`), the settled one first. Copy this assessment to the
lab as `reports/2026-10-07-entropy-assessment.md`, which the new `STATE.md` points at.

### `patches/settled.diff`: touches no open question

| Change | Finding | Settled by |
|---|---|---|
| New `decisions/2026-10-04-lab-role-and-processes.md`, copying the decisions found only in `STATE.md`, with sources | F1 | intent-pass §5: recording is not deciding |
| Lab `AGENTS.md`: a row saying where a decision goes | F1 | the existing `decisions/` folder; one owner per concern |
| Lab `STATE.md` rewritten: current only, 37 content lines; size line untouched | F11, F19 | its own claims, dated; Q3 left open |
| Lab `README.md`: diary flags, timings, test count, GitHub Project writes | F13 | `tools/report.mjs`, `tools/map.mjs` |
| Lab `memory/slots-run-walkthrough.md`: dated "superseded in part" note | F15 | ORC `MCP.md:3-5` and the files' absence |
| ORC `README.md`: reach sentence becomes a link to `AGENTS.md`; Bookwhen token paragraph removed; apply through cards; scheduling off the absent list | F3, F4 | 2026-09-17 decision; `AGENTS.md:40-41`; architecture test |
| ORC `AGENTS.md`: `orc-service.ts` added to the subprocess list; the `src/bookwhen.ts` sentence replaced | F4, F5 | architecture test and #101; `AGENTS.md:40-41` |
| ORC `SECURITY-REVIEW.md`: guarded paths point at `dangerfile.js` | F8 | `dangerfile.js`, the PR template |

### `patches/provisional.diff`: not to be applied until Justin answers

| Change | Finding | Waits on |
|---|---|---|
| Install `guard/SKILL.md` at lab `skills/session-coherence-guard/SKILL.md` (copy; not in the diff) | F18 | Q1, Q2 |
| Lab `AGENTS.md` "Before handing off"; ORC `AGENTS.md` "Before handing off" pointer | F18 | Q1 |
| Lab `AGENTS.md` owns the cap (sixty lines, dated by Justin's answer); `STATE.md`'s size line becomes a link | F12 | Q3 |
| ORC `AGENTS.md` network paragraph lists every reach by process, with SMTP marked as waiting on #137 | F6 | Q4, #137 |
| ORC `test/architecture.test.ts`: DNS imports count as network; browser launches confined to `playwright.ts` | F5, F6 | Q4 |
| ORC `README.md` credential sentence and `AGENTS.md:64` "each source of credentials is read in one module" | F7 | Q5 |

### Proposals outside the patches

- ORC code: an explicit environment for `src/adapters/orc-service.ts`'s children (F7). A defect in the work; needs a
  Security review section.
- Enforcement for "guarded changes go through a pull request" (F9): Justin's choice of place.
- Move the authority-rules plan out of `~/.claude/plans/` into lab `memory/` (F2).
- `FRICTION.md` order and the diary's heading parser (F17).

---

## 11. Uncertainties

- Everything about GitHub, git history, live services and files outside the snapshots (see "Not covered").
- Whether the 3 Oct issue-level decisions and the 4 Oct decisions are already on their issues: GitHub not read.
- Library behaviour: Playwright's environment default for Chromium, Pi's provider credentials and network calls, the
  MCP SDK's child environment.
- This run is not the assessment Justin's 4 Oct decision describes ("Astra runs entropy-guard's assessment on ORC and
  the lab together. Justin is shaping the brief before it runs"); it was run by Claude from the caller's brief.
- Snapshot age: the snapshots are from 4 Oct; this run is 7 Oct. Every live fact in the new `STATE.md` is marked as
  recorded on 4 Oct and must be re-read before it is stated.
