# Entropy assessment: ORC and the orchestration-lab Scope, assessed as one system

Run on 2026-10-07 with entropy-guard's `entropy-assessment` (v0.9.0), on read-only snapshots of two repositories
without git metadata. The snapshots' newest dated content is 2026-10-04 17:31 (the lab's `STATE.md`). No steward was
available and no live service was read: every statement below about a running service is a recorded observation,
dated, and was not re-read.

- **ORC**: `orchestrator/`, on the operator's machine `~/pro/orchestrator`. Called "ORC" below.
- **The lab**: `scope-orchestration-lab/`, on the machine `~/scopes/scope-orchestration-lab`. Called "the lab".

File references are `orc:<path>:<line>` and `lab:<path>:<line>`, against the snapshots.

## Route taken

1. Step 1, the intent pass (`intent-pass.md`): below, "Intent".
2. Step 2: both repositories **active**; the system spans two repositories and is assessed as one. Shapes: ORC is
   code-first (C), the lab is docs-first planning (A) with small tools, and the risk sits between them, so the
   system is **B, mixed docs and code**, which is also the riskiest fit. Route B: `mixed-profile.md`, plus the
   docs-first skill's Steps 2, 3, 5 and 7 run on the lab, folded into this one assessment.
3. Step 3, the guard decision: **`create`** (below).
4. Step 4: handed to `session-coherence-skill-generator`, which wrote `guard/SKILL.md` and handed to
   `guards-integrator`, which wrote `integration.md`.

## Lifecycle, shape and repositories

| Repository | Lifecycle | Evidence | Shape |
|---|---|---|---|
| ORC | active | `lab:scope.yaml:14` (`status: active`); a running service recorded restarted on 4 Oct (`lab:STATE.md:31-36`); 278 files, 970 tests recorded 4 Oct | C, code-first: TypeScript, Vitest, Playwright E2E, one CI workflow |
| The lab | active | `lab:scope.yaml:7` (`status: active`); `STATE.md` updated 2026-10-04 17:31; FRICTION entries daily to 4 Oct | A, docs-first: state, decisions, friction log, 80+ dated reports; three Node tools that read GitHub, git and ORC's database |

The lab manages ORC's work (`lab:SCOPE.md:11-12`, `lab:AGENTS.md:3-10`); its `tools/` also reach four repositories
outside this assessment (Moving Stillness, the Bookwhen ops tool, the Scope model, Finance; `lab:tools/collect.mjs:19-26`),
which were not read. The archived `status-tracker` project (`lab:scope.yaml:22-30`) is not part of the system.

## Intent

**Steward: Justin.** `lab:scope.yaml:6` (`steward: justin`), `:35-37` (sole member, admin). ORC names no steward
itself, but quotes Justin as the authority for its rules (`orc:AGENTS.md:11,34-37`) and calls itself "Justin's
local-first personal agent" (`orc:README.md:3`).

**Authorised intent, with sources.** Kind and authority are recorded separately.

| Statement | Where | Kind | Authority |
|---|---|---|---|
| Develop and operate Justin's local orchestration platform and its reusable Scope-owned agents | `lab:scope.yaml:5`, `lab:SCOPE.md:3-6` | description (scope definition) | neither attributed nor dated |
| Facts about ORC belong in its repository; the relationship belongs in the lab | `lab:SCOPE.md:17-23`, `lab:AGENTS.md:11-21` | directive | neither |
| ORC is his "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; then "work towards a point of consolidation" | `lab:STATE.md:8-11` | decision | attributed and dated (Justin, 25 and 26 Sep) |
| The lab is the central Scope; where issues live; the processes kept (entropy guard at session end among them); scheduling (#166) first; Astra runs this assessment | `lab:STATE.md:38-54` | decision | attributed and dated (Justin, 4 Oct) |
| Claude merges a PR once review and tests pass | `lab:STATE.md:17` | decision | attributed and dated (Justin, 25 Sep) |
| ORC owns a general async (durable) work capability, scheduling included | `lab:decisions/2026-09-17-async-work-architecture.md:3,21-30,54` | decision | attributed and dated (Justin, 17 Sep) |
| Core ships with no specific Scope, model, owner or agent | `orc:AGENTS.md:30-45` | directive | attributed and dated (Justin, 12 and 13 Sep) |
| No agent holds the lethal trifecta; new authority needs an explicit human choice; standing grants within bounds | `orc:AGENTS.md:68-112` | directive | partly sourced (#20, #67), not attributed |
| Approval cards from a fixed set of blocks | `orc:AGENTS.md:114-128` | directive | attributed and dated (the operator, 26 Sep) |
| Iris as front door, ADA, Scopes own agents; "Wide eyes, narrow hands"; "Deliberately absent ... each requires a decision" | `orc:README.md:9-23,145-154` | description | neither |
| Authority rules 1, 2, 4, 5 affirmed; 3, 6 open | `lab:memory/authority-rules-step-1.md:3-29` | decision | attributed and dated (Justin, 1 Oct 22:05) |
| Scope logins are not centralised | `orc:src/adapters/scope-credentials.ts:14` | decision quoted in code | attributed and dated (the operator, 28 Sep) |
| The map of work is orchestrator#140 | `orc:AGENTS.md:9-12`, `lab:AGENTS.md:6-10` | directive | attributed and dated (Justin, 2 Oct) |

**Declared, enacted, authorised.**
- **Declared** (ORC `README.md`): a personal agent whose external paths are read-only, whose Moving Stillness
  specialist plans without applying, and from which scheduling, extra data sources and file edits are deliberately
  absent.
- **Enacted** (code and the lab's records): durable work with schedules and series; a Bookwhen apply through ORC's own
  browser; invoices through a mail connector; phone notices from packages; ORC rebuilding and restarting itself on
  a card.
- **Authorised**: scheduling (17 Sep decision); writes behind controls and standing grants (`orc:AGENTS.md:76-90`);
  new authority by explicit human choice, which the package cards provide (`orc:AGENTS.md:110`; Justin approved the
  Moving Stillness build cards on 3 Oct, `lab:STATE.md:91-92`). Whether a card is the decision the README asks for
  is open (Q2).

**Gaps, by condition** (evidence in the findings list):

| Condition | Gap | Finding |
|---|---|---|
| Stale description | `orc:README.md:152-154` lists scheduling as deliberately absent; the 17 Sep decision covers it. Corrected by an inserted note citing the decision; the rest of the paragraph is left as written and marked under question | F8e |
| Stale description | `orc:AGENTS.md:102-103` and `orc:README.md:76-79` describe a Bookwhen client in core, which the 12-13 Sep directive puts in the Scope and the architecture test refuses | F7a, F8a |
| Ambiguous | "Deliberately absent: additional external data sources ... file edits", and README's "without applying it", against card-approved package connectors and the grantable apply | F8d, F8e; Q2 |
| Conflict | Two caps for one state file: "Target: sixty lines" against "capped at about forty content lines" | F5; Q5 |
| Unauthorised drift, or an undecided reach | `orc:AGENTS.md:101-102` "No model or agent reaches the ntfy transport" against package phone notices since 2 Oct | F7d; Q3 |
| Missing | Where the session-end guard Justin kept should live | F17; Q1 |
| Missing | Whether ORC's root branch reports belong in ORC or in the lab's `reports/` | F12; Q4 |
| Prose control | `STATE.md`'s overwrite rule and cap: nothing checks them, and they were broken | F2 |
| Prose control | `orc:AGENTS.md` Boundaries reads as a control; the enforcement is `test/architecture.test.ts`, which only runs by hand and misses the browser | F7, F9, F24 |

**Existing guards' repair instructions** read against the intent-change rule: none exist in either repository (the
lab's `skills/` holds only `.gitkeep`; ORC has no `skills/`). Nothing to flag for intent or ownership.

**Questions**: five, in `questions.md`, each with a recommended answer. Q1 guard home (recommend the lab's
`skills/`); Q2 card-approved reaches (recommend: the card is the decision, recorded once in ORC's Boundaries); Q3
package phone tap address (recommend: hosts the card names); Q4 ORC root reports (recommend: move to the lab's
`reports/`); Q5 state-file cap (recommend: about forty content lines, owned by lab `AGENTS.md`).

**Proposed changes and where recorded.** Steward decisions found only in the overwritten `STATE.md` are copied, with
source and date, to two new records in the lab's existing `decisions/` (settled lab patch). No intent document is
edited to match the work. The questions are recorded in the updated `STATE.md` under "Waiting on Justin". No new
register was added.

## Domains

All present and actively changed: code (ORC `src/`, `web/`, `config/`, `scripts/`; lab `tools/`), documentation
(both), tests (ORC Vitest and Playwright E2E), API and data contracts (`orc:src/package-api.api.md`; durable-work
contracts; the lab's `STATE.md` and `FRICTION.md` formats, which code parses, F15), workflow (the map, Danger, pull
requests, Astra reviews, restart and package cards, the diary), and live operational state (`orc.service` on
athena, its SQLite state, grants, Scope credentials, ntfy topics, the Bookwhen site, GitHub Project 4).

## Repositories and ownership

| Concept | Owner | Second home | Finding |
|---|---|---|---|
| What an agent may reach | `orc:AGENTS.md` Boundaries (prose) and `orc:test/architecture.test.ts` (enforced): an independent test of the same contract, kept, but they disagree | — | F7, F24 |
| Which paths need a security review | `orc:dangerfile.js:11-26` (`GUARDED`) | `orc:SECURITY-REVIEW.md:177-181`, a summary, incomplete | F11 |
| Where the work stands | `lab:STATE.md` | — | F1, F2 |
| Steward decisions | `lab:decisions/` (one record) | `lab:STATE.md`, which held most of them | F4 |
| Working rules | `~/pro/local-config/home/AGENTS.md`, lab `AGENTS.md` | `lab:STATE.md:13-19`, restated | F6 |
| The state file's cap | (undecided) | `lab:STATE.md:4` and `lab:AGENTS.md:34` | F5 |
| Which build ORC runs | live: `pnpm service:status` | `lab:STATE.md`, three values | F1 |
| ORC's state directory | ORC's env file, `ORCHESTRATOR_STATE_DIR` (`orc:scripts/orc-service.ts:132-133`; default `orc:src/runtime.ts:190`) | `lab:tools/collect.mjs:16`, hard-coded | F14 |
| Repositories in the work | `lab:scope.yaml` resources (two) | `lab:tools/collect.mjs:19-26` (six) | F16 |
| Open work | GitHub issues under orchestrator#140 | — | — |
| What broke in real use | `lab:FRICTION.md` | — | F20 |

The seam that carries most cost is the first: a prose list and a test, in one repository, describing what ORC
reaches, each correct on a different subset (F7, F24).

## Findings

One list. Other sections refer to these ids.

**F1. The lab's `STATE.md` contradicts itself about live facts.** `lab:STATE.md:58` "ORC live: 369628b since
22:12:47" and `:88` "main process started 2026-10-03 22:12:47 on `369628b`", against `:31-36`, which record restarts
on 4 Oct onto `3989cdb` (13:36:37), `adaa127` (14:03:34), `6d89ce7` (14:26:04) and `8cee662` (14:48:27). `:91`
records Moving Stillness `main` at `c759f96`, against `:31-32`, MS #53 merged as `fc830aa`. Source: the lab.

**F2. `STATE.md` appends instead of overwriting, and exceeds both of its caps.** 99 lines on 4 Oct, against "Target:
sixty lines" (`lab:STATE.md:4`) and "capped at about forty content lines" (`lab:AGENTS.md:34`). It still states
"Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z" (`:94`) three days after that expiry. The rule "Overwrite
at each verified event; do not append" (`:4`, `lab:AGENTS.md:33-35`) is enforced by nothing: a prose control.

**F3. The state file has been wrong repeatedly, from one cause.** `lab:FRICTION.md:864-869` (12 Sep: finished work
described as missing), `:621-626` (22 Sep: "two false statements, both found by being asked a direct question"),
`:297` and `:308-313` (29 Sep: a timestamp written without reading the clock; a restart reported that had not
happened). Three failures from one cause: **a missing system** (no check at session end), not an instance.

**F4. Steward decisions were recorded only in the overwritten state file.** The north star (Justin, 25 and 26 Sep,
`lab:STATE.md:8-11`), the merge rule (25 Sep, `:17`), the 4 Oct interview (`:38-55`) and the pause of Moving
Stillness (4 Oct, `:33`). Searched with ripgrep over both snapshots for "central Scope", "ChatGPT replacement",
"merges a PR", "processes kept", "MS is paused", "weekly adversarial", "`core` label": found only in `STATE.md`,
except the 25 Sep phrase also quoted in `lab:reports/2026-09-30-priorities.md:7`. The lab's decision record
(`decisions/`, one file of 17 Sep) holds none of them.

**F5. Two caps for one state file.** `lab:STATE.md:4` against `lab:AGENTS.md:34`; no record settles which. Q5.

**F6. `STATE.md` restates working rules owned elsewhere.** `lab:STATE.md:13-19` ("How we work") summarises rules it
attributes to `local-config/home/AGENTS.md` and "AGENTS.md, 2026-09-27". That file was not read, so whether the
summary is correct was not checked.

**F7. ORC's `AGENTS.md` lists of what ORC launches and reaches are stale and incomplete.** `orc:AGENTS.md:92-104`.
Searched as recorded under "Reach search" below.
- **a.** "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client" (`:102-103`): the file does
  not exist; `package.json` and `pnpm-lock.yaml` hold no `@jphil/bookwhen-client`; `orc:test/architecture.test.ts:1314-1315`
  asserts that no file imports it.
- **b.** The subprocess list (`:92-96`) omits `src/adapters/orc-service.ts`, which runs git, a frozen-lockfile `pnpm
  install`, ORC's build and `systemctl --user restart` for the restart card (`orc:src/adapters/orc-service.ts:71,102,107,128`).
  The architecture test already allows it (`:828-834`): the document and the test disagree.
- **c.** Neither list names the headless Chromium launched in ORC's own process (`orc:src/adapters/browser/playwright.ts:55`,
  since orchestrator#76, 3 Oct) or that module's DNS lookups (`:14`). Q2.
- **d.** "No model or agent reaches the ntfy transport, and it sends only a title, the notice's summary and the one
  configured tap address" (`:101-102`) is contradicted by the package phone connector (`orc:src/adapters/phone/index.ts:14,38,50`,
  orchestrator#184, 2 Oct), which sends a package's own title, text, tags and any `http(s)` tap address. Q3.
- **e.** Package connectors bound in `orc:config/installation.ts:121-168` reach a mail server
  (`smtp.protonmail.ch:587`), the booking calendar with a token, two Bookwhen hosts through the browser, and the ops
  tool's directory. `orc:AGENTS.md:96` covers them only generically. Q2.

**F8. ORC's `README.md` describes an earlier system.**
- **a.** `orc:README.md:76-79`: `ORCHESTRATOR_BOOKWHEN_API_TOKEN` is read by no code (ripgrep over `src`, `config`,
  `scripts`: no hits), and the pinned client is gone (F7a).
- **b.** `:103-104` "A credential is read in exactly one place, `src/runtime.ts`": Scope credentials are read by
  `orc:src/adapters/scope-credentials.ts:27-43`, as the operator decided on 28 Sep. "No subprocess ORC launches
  receives one": see F25, and the browser's stored login (`orc:src/adapters/browser/playwright.ts:66`; Q2).
- **c.** `:3-7` "launches one isolated fixed researcher child"; "Its read-only external data paths are ...": both
  incomplete (F7).
- **d.** `:146-147` "calculate a slot-change plan without applying it", while `orc:AGENTS.md:89` names "the Moving
  Stillness apply" as grantable durable work. Q2.
- **e.** `:152-154` "Deliberately absent ...: reminders, scheduling, additional external data sources, workflow
  execution, sandboxes, shell access, and file edits." Scheduling is a stale description (17 Sep decision). Extra
  data sources and file edits are ambiguous against package connectors, advert files, the finance outbox, and the
  memory appends `:20-21` itself describes. Q2.

**F9. ORC's tests and type checks run only by hand.** The one CI workflow is Danger
(`orc:.github/workflows/danger.yml`), which checks pull-request descriptions only. `pnpm typecheck`, `pnpm test`
(with the architecture ratchets, core ties and the package-API report test) and `pnpm test:e2e` run when someone
runs them. `lab:reports/2026-10-01-review-synthesis.md:58`: "Nothing runs the tests. Both reviews rank it first. The
E2E suite was red on `main` for a week in September." Decided, not built: orchestrator#144 (`lab:STATE.md:45,69`).

**F10. The security-review check covers pull requests only, and warns rather than blocks.** `orc:SECURITY-REVIEW.md:53-55`
("a direct push to `main` is not checked, and without GitHub Pro a failed check warns rather than blocks a merge").
Recorded 2 Oct: four open pull requests touched guarded files without the section (`lab:STATE.md:82`).

**F11. `SECURITY-REVIEW.md`'s summary of guarded paths is incomplete.** `orc:SECURITY-REVIEW.md:179-181` names
`src/`, `AGENTS.md`, itself, the architecture test and the check; `orc:dangerfile.js:11-26` also guards `config/`,
`package.json`, `pnpm-lock.yaml`, `scripts/approve-agent-package.ts`, `scripts/async-work.ts`, `test/core-ties.ts`
and `scripts/source-headers.js`.

**F12. Superseded material sits beside ORC's live documents.** Twelve markdown files at ORC's root besides
`README.md`, `AGENTS.md` and `SECURITY-REVIEW.md`. Six are reports of single pieces of branch work: `REWORK.md`
("Nothing committed, nothing pushed"), `SEAM.md` ("Nothing is pushed"), `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`
and `GRANTS-E2E.md`. Named paths that no longer exist (checked with a path test on each backticked
`src/`, `test/` or `scripts/` path): `SLICE1.md` (`src/adapters/browser/service.ts`, `test/browser-service.test.ts`),
`POLICY-STORE.md` (`src/core/policies.ts`), `REWORK.md` (`src/adapters/async-store/store.ts`,
`test/async-store.test.ts`), `CLASSIFY.md` (`src/adapters/browser/mcp.ts`, `service.ts`), `GRANTS.md` (`service.ts`),
`MCP.md` (`src/core/ports/browser.ts`, in its sections marked history). `OPERATOR.md` is mixed: a branch report
("Nothing is pushed") later extended with live operating facts (ntfy settings, phone install), so it is not marked. `orc:AGENTS.md:3-5` says only "The code supplies
any further context". Q4.

**F13. The lab's `README.md` disagrees with its tool.** `lab:README.md:16` "runs the test suite (~10s)" against
`lab:tools/report.mjs:9-10` (both suites, about two minutes; ten seconds without them). `:17` "keeps the day's test
count" against `report.mjs:51,313`, which writes the day's snapshot with `suites: null`. `:18,21-22` `--serve` and
`http://localhost:4190`, which `report.mjs` does not implement ("nothing is served", `:13`). `:22` "One snapshot per
day": `lab:reports/` holds snapshots for 3 and 7 Sep and 29 Sep to 2 Oct only; the diary runs by hand.

**F14. ORC's state directory has two homes.** ORC reads `ORCHESTRATOR_STATE_DIR` from its env file
(`orc:scripts/orc-service.ts:132-133`; default `~/.local/share/orchestrator`, `orc:src/runtime.ts:190`). The lab's
`tools/collect.mjs:16` hard-codes `~/.local/share/orchestrator-proof`, as does
`lab:memory/slots-run-walkthrough.md:19,80-93`. The same class of defect cost a morning on 28 Sep
(`lab:FRICTION.md:360-362`, orchestrator#62).

**F15. Two prose files are parsed contracts, and say so nowhere.** `lab:tools/map.mjs:181-190` reads
`**Where we are now:** <ref>` from `STATE.md`; `lab:tools/collect.mjs:150-160` reads `FRICTION.md`'s
`## YYYY-MM-DD — title` headings and `- **` findings, and `report.mjs:131` shows its first six sections. Rewording
either silently drops a marker or a section from the diary.

**F16. Two lists of the repositories in the work.** `lab:scope.yaml:10-30` lists `orchestrator` and
`status-tracker`; `lab:tools/collect.mjs:19-26` lists six, "Finance joined on 2026-10-02".
`lab:AGENTS.md:19` routes "a resource joined or left this Scope" to `scope.yaml`. Ambiguous whether "a repository
the map covers" is "a resource of this Scope"; not asked, to stay within five questions.

**F17. Processes Justin kept on 4 Oct are not built.** Entropy guard at session end (no guard in either repository);
weekly adversarial review; FRICTION into rules monthly (orchestrator#60); branch and worktree cleanup (#70); `/tmp`
cleanup (#182); the daily diary (manual, F13); the label check (waiting on Astra's revisions). Justin's decision
puts ORC scheduling (#166) first and runs the scheduled ones through it; this assessment proposes no parallel work.

**F18. A session started in ORC is not pointed at where the work stands.** `orc:AGENTS.md:3-12` sends agents to
`README.md`, the architecture test and orchestrator#140; nothing names the lab's `STATE.md` or a session-end step.
Whether the user-wide rules file does was not checked.

**F19. The async decision's declared vocabulary differs from the code.** `lab:decisions/2026-09-17-async-work-architecture.md:47`
"idempotency: `natural`, `keyed` (with the key), or `none`"; `orc:FIXES.md` (commit `79a33ef`) split it into
`repeatEffect` and `submissionKey`. Classified as an adaptation within the decision (delivery stays declared per task
type); no steward record of the split was found. Recommendation only: a dated "later changes" line in the decision
pointing at the commit. The decision is not edited by this assessment.

**F20. `FRICTION.md` is not newest first throughout.** It says "Newest first" (`:3`), but sections dated 11 to 19 Sep
sit after 3 Sep (`:1153-1402`). Minor; the diary reads only the first six.

**F21. A plan the lab relies on lives outside both repositories, in one vendor's folder.**
`lab:memory/authority-rules-step-1.md:5` holds the authority-rules plan at `~/.claude/plans/agile-booping-waffle.md`.

**F22. The pre-push hooks only print a summary, and whether they run is unknown.** `orc:.githooks/pre-push` and
`lab:.githooks/pre-push` call `~/pro/local-config/scripts/push-summary` and always exit 0. The snapshots carry no git
configuration, so `core.hooksPath` cannot be read.

**F23. A lab memory note names ORC files replaced on 3 Oct.** `lab:memory/slots-run-walkthrough.md:35` names
`src/adapters/browser/service.ts` and `mcp.ts`. The note dates itself (28-29 Sep), so it is honest, but sits in
`memory/` where current relationship facts live.

**F24. The architecture test's reach checks miss the browser.** `orc:test/architecture.test.ts:828-857` looks for
Node's process primitives and the MCP stdio transport, so `chromium.launch` passes it; `:1295-1316` has no `dns`
pattern, so `playwright.ts:14` passes it. A test and a document that agree on a subset are not evidence of
completeness. Recommended (not patched): add both to the test, with the reach decided in Q2.

**F25. The restart card's commands inherit ORC's whole environment.** `orc:src/adapters/orc-service.ts:15,71,102,107,128`
call `execFile` without an `env` option, so git, `pnpm install`, ORC's build and `systemctl` receive Node's default,
the parent's environment, which `scripts/orc-env.sh` filled from the credentials file. This contradicts "No subprocess
ORC launches receives one" (`orc:README.md:104`), a stated constraint, and the researcher child shows the intended
pattern (`orc:src/core/child-agent-process.ts:372-382`). **A defect in the work**, so the fix is the code (pass an
explicit environment), not the sentence. Size: small. Every process ORC starts runs as the same user and could read
the env file anyway (`orc:SECURITY-REVIEW.md:100-107`); the finding is that the README's claim is false today.
Whether Playwright passes the environment to Chromium was not checked here (no `node_modules` in the snapshot).

### Checked and consistent

- Pi pinned in four places, all `0.82.1` (`orc:package.json:69,119-121`), as `orc:README.md:158,165` says.
- ORC's service port 5173 (`orc:src/adapters/orc-service.ts:46`), as `orc:AGENTS.md:136` says.
- `ORCHESTRATOR_SCOPE_DIRECTORIES` and `ORCHESTRATOR_WEB_TOKEN` are read (`src/agent-discovery.ts`; `src/web-cli.ts`).
- Every `pnpm` command named in ORC's `AGENTS.md` and `README.md` exists in `package.json`.
- `ORC_PACKAGE_API_VERSION` lives in `src/core/agents/package.ts`, as `orc:AGENTS.md:132` says.
- `node tools/map.mjs --check`, `working` and `stopped` exist as `lab:AGENTS.md:9-10` and `lab:STATE.md:63-64` say.

### Reach search (F7, F8, F24, F25)

Run on 2026-10-07 with ripgrep 14.1.1 over the snapshots. ast-grep and Semgrep are not installed on the machine that
ran this.

**Patterns and paths.**
- **Network.** `fetch\(`, `-w fetch`, `node:https?`, `node:net`, `node:dgram`, `node:dns`, `node:tls`, `new
  WebSocket`, `EventSource\(`, `undici`, `createServer\(`, `\.listen\(`, and `"node:http"`/`"node:https"` imports.
  Over ORC `src/`, `scripts/`, `config/`, `e2e/`, `playwright.config.ts`; separately over `web/src` (non-test).
- **Processes.** `node:child_process`, `"child_process"`, `\bspawn\(`, `\bspawnSync\(`, `\bexecFile(Sync)?\(`,
  `\bexecSync\(`, `\bfork\(`, `StdioClientTransport`, `new Worker\(`, `worker_threads`. Over the same ORC paths.
- **Browser and library launches.** `chromium`, `firefox\b`, `webkit`, `\.launch\(`, `launchPersistentContext`,
  `connectOverCDP`, `from "playwright`. Over ORC `src/`, `scripts/`, `config/`.
- **Bookwhen.** `-i bookwhen` over ORC `src/`, `config/`, `scripts/`, `web/src`; also `package.json`,
  `pnpm-lock.yaml`.
- **Credentials and environment.** `process\.env`, `credentials` over ORC `src/` and `config/`; `env` in each
  subprocess module.
- **Pi.** `from "@earendil-works/..."` over ORC `src/`.
- **The lab.** `node:child_process`, `execFile`, `spawn`, `fetch\(`, `node:https?`, `createServer` over `tools/` and
  `reports/async-flows/`.

**Hits, with the process that runs each.** Columns: in ORC's `AGENTS.md` lists? in the architecture test?

| Hit | What it does | Process | AGENTS.md | Test |
|---|---|---|---|---|
| `src/core/child-agent-process.ts:532` `spawn(process.execPath)` | Pi researcher child, minimal environment (`:372-382`) | ORC's main process (`orc.service`) | yes | yes |
| `src/core/analysis-tools.ts:300` `spawn("git")` | read-only git history | ORC main | yes | yes |
| `src/adapters/mcp/client.ts:8,60` `StdioClientTransport` | MCP server over stdio, as declared | ORC main | yes | yes |
| `src/adapters/orc-service.ts:9,71,102,107,128` `execFile` | git reads, `systemctl --user restart`, `node scripts/build.mjs`, `pnpm install --frozen-lockfile` (the registry, over the network); inherits ORC's environment (F25) | ORC main, on the restart card | **no** | yes |
| `src/adapters/browser/playwright.ts:16,55` `chromium.launch` | headless Chromium per browser session, granted hosts only by a no-listen proxy (`:40-53`), loaded with the Scope's stored login (`:66`) | ORC main, per session | **no** | **no** |
| `src/adapters/browser/playwright.ts:14` `lookup` from `node:dns/promises` | DNS lookups of hosts | ORC main | **no** | **no** |
| `src/adapters/agent-files/package-resolution.ts:19` `worker_threads` | worker threads for package code; not a process | ORC main | n/a | n/a |
| `src/core/research-tools.ts:7-9` `node:https` | Jina Reader | researcher child | yes | yes |
| `src/adapters/notifications/ntfy.ts:84,120` `fetch` | ntfy publish | ORC main | yes | yes |
| `src/adapters/phone/index.ts:14` `publishNtfy(..., fetch)` | package phone notices through `ntfy.ts` | ORC main, called by package code | **contradicted** | not matched |
| `src/web-server.ts:8,159`, `src/web-cli.ts:12,486` `node:http` | the operator's API, on loopback | ORC main | no (README "Run") | not matched |
| `src/file-lock.ts:19,158,174` `node:net` `createServer` | an abstract local socket used as a lock; not network | ORC main | n/a | not matched |
| Pi (`src/backends/pi/*`, `src/app/conversations.ts`, `src/runtime.ts`) | model providers, through the library | ORC main | no (README Boundary: "Pi owns model integration") | confined by `:865` |
| `config/installation.ts:121-168` connector bindings | calendar token; ops directory; browser hosts `movingstillness.bookwhen.com`, `cdn.bookwhen.com`; SMTP `smtp.protonmail.ch:587` | package code in ORC main (not in these repositories) | generic (`:96`) | n/a |
| `scripts/build.mjs:10-18`, `scripts/dev-web.mjs:1,89`, `scripts/orc-service.ts:14,17`, `scripts/update-pi.mjs:17,32`, `scripts/dev-web-readiness.ts:7` | git, node, dev servers, systemctl, `pnpm` (registry); local port probes | the operator's shell, not ORC | n/a | n/a |
| `web/src/api.ts:243,271,396,435` `fetch` | the operator's browser calling ORC's own API | the browser | n/a | n/a |
| Bookwhen | no `@jphil/bookwhen-client` in `package.json` or the lockfile; `src/bookwhen.ts` absent; `ORCHESTRATOR_BOOKWHEN_API_TOKEN` read nowhere | — | stale (F7a) | asserts absence |
| `lab:tools/collect.mjs:9,33` `execFileSync` | `gh` (GitHub API), `git`, and `bash -c "pnpm -s exec vitest run"` in ORC's and Moving Stillness's checkouts; reads ORC's database read-only (`:123-148`) | the operator's shell | n/a | n/a |

**Not covered.** Package code (Moving Stillness, Finance, the ops tool), which is outside both repositories; the
internals of Pi, Playwright, the MCP SDK and other libraries (no `node_modules` in the snapshot); runtime behaviour.
So every restatement of these lists in the patches is either marked incomplete (settled) or names this search as
its basis (provisional).

## Ranked risks

Ranked by decay rate times recovery cost.

1. **The state file stops telling the truth** (F1, F2, F3, F4, F15). Decays every session: it is rewritten several
   times a day and was 99 lines against a 40-60 line cap. Recovery is costly: three dated incidents of confident
   wrong answers to Justin and a morning's plan built on a restart that had not happened. Anchor: lab `STATE.md`,
   with the cap owned by lab `AGENTS.md` (Q5) and decisions in `decisions/`.
2. **ORC's documented boundary drifts from what ORC reaches** (F7, F8, F11, F24, F25). Decays with each connector or
   driver change (2 Oct phone, 2 Oct finance, 3 Oct browser), and the security review works from these documents
   (`SECURITY-REVIEW.md` question 1). Recovery is costly because the error surfaces in a safety decision. Anchor:
   `orc:test/architecture.test.ts` for what is enforced, with ORC's `AGENTS.md` Boundaries recording the decisions
   (Q2, Q3).
3. **Nothing runs the checks** (F9, F10, F22). Decays per pull request; the E2E suite was red for a week. Anchor:
   orchestrator#144.
4. **Decisions are scattered and re-argued** (F4, F19, F21, F6). The skills placement alone had four earlier rounds
   (`lab:reports/2026-09-30-skills-one-home.md:3-13`). Anchor: lab `decisions/`.
5. **Superseded material and cross-repository seams** (F12, F13, F14, F16, F23). Slower decay; each costs a
   misdirected search or a diary reading the wrong state. Anchor: ORC's `AGENTS.md` and the lab's `tools/`.

## The lab, docs-first Steps 2, 3, 5 and 7

### Truth map (Step 2)

| Document | Role | Holds |
|---|---|---|
| `scope.yaml` | canonical | identity, purpose, steward, resources |
| `SCOPE.md` | canonical | purpose, projects, the authority split |
| `AGENTS.md` | canonical | agent instructions: read order, where learnings go, pace, state rules, ideas |
| `decisions/` | canonical | settled decisions (one record before this assessment) |
| `STATE.md` | current state | read first; in practice it also held decisions (F4) and rules (F6) |
| `FRICTION.md` | canonical log | what broke in real use; parsed by `tools/collect.mjs` (F15) |
| `AGENT_IDEAS.md` | canonical | ideas, not approved designs |
| `memory/authority-rules-step-1.md` | local elaboration, holding steward decisions | Justin's answers of 1 Oct |
| `memory/slots-run-walkthrough.md` | historical, dated | a 28 Sep run traced (F23) |
| `reports/*.md` | historical, dated | reviews, research, proposals |
| `reports/*.json`, `status.html` | generated projections | diary snapshots and page (`tools/report.mjs`) |
| `README.md` | summary | the overview page's commands (F13) |
| `tools/` | code | the diary, the map |

ORC's side, for the same concepts: `README.md` and `AGENTS.md` canonical (description and directive);
`SECURITY-REVIEW.md` canonical for the review; `dangerfile.js` and `test/architecture.test.ts` canonical and
executable; `src/package-api.api.md` a generated projection checked by a test; `TURN-RECORD.md`, `VISIBILITY.md`,
`CLASSIFY.md` local elaboration; `GRANTS.md` a dated design; `MCP.md` and `OPERATOR.md` mixed; the six branch reports
historical (F12).

### Loop map (Step 3)

- **Start.** In the lab: `AGENTS.md`, then `STATE.md` (again after any compaction), then `SCOPE.md`, then
  orchestrator#140. In ORC: `AGENTS.md`, then `README.md` and the architecture test, then #140; not `STATE.md` (F18).
  Every tool also loads the user-wide rules file (`lab:reports/2026-09-30-skills-one-home.md:15-23`).
- **Tracking.** An issue on the map, marked with `node tools/map.mjs working <ref> --agent <name>` and cleared with
  `stopped`. `STATE.md`'s "Where we are now" names the current issue.
- **Work.** Branches in ORC worktrees; pull requests carrying `## Security review` (Danger); Astra reviews written
  to the lab's `reports/`; Claude merges once review and tests pass; ORC's restart card after the pull.
- **Decisions and learnings.** Decisions in practice in `STATE.md`, rarely in `decisions/`; learnings in
  `FRICTION.md` daily.
- **Handoff.** `STATE.md` rewritten at verified events (documented), appended to (real, F2). No session-end ritual:
  the guard was decided on 4 Oct but not built (F17).

### State-file update (Step 5)

Delivered as the `STATE.md` hunk of `patches/settled-lab.patch`. 55 lines, 38 content lines, so it meets both caps
until Q5 is answered. It keeps line 4 byte-identical because Q5 quotes it. It holds:
- the stage;
- the documents to trust first;
- the decisions, linked to their records;
- the active fronts, and what waits on Justin, including the five questions;
- the misleading material nearby;
- three next actions.

Each live fact is labelled as recorded on 4 Oct and not re-read: "ORC, last recorded: `8cee662` ... Re-read with
`pnpm service:status`". The expired grant is stated as expired by its own record. It says what makes it stale and
who rewrites it. Its other mentions were checked: the build named once, Moving Stillness's state once.

### Recommendations

- **Consolidate:** steward decisions into `decisions/` (done in the settled patch); the state cap into lab
  `AGENTS.md` (Q5); the reach contract's prose to match the test, and the test to cover the browser (F7, F24, Q2).
- **Demote:** `STATE.md`'s "How we work" to a pointer (done); `SECURITY-REVIEW.md`'s guarded list to a summary that
  names its owner (done).
- **Mark historical:** the six ORC branch reports (done); their move waits on Q4.

### One-time cleanup, each verified against the current file

1. `lab:tools/collect.mjs:16`: read `ORCHESTRATOR_STATE_DIR` from ORC's env file, as `orc:scripts/orc-service.ts:132-133`
   does, instead of a hard-coded path (F14). Verified: line 16 holds `join(HOME, ".local/share/orchestrator-proof")`.
2. `orc:src/adapters/orc-service.ts:15`: pass an explicit, minimal environment to `run` (F25). Verified: no `env`
   option at `:71,102,107,128`.
3. `lab:FRICTION.md`: move the sections dated 11 to 19 Sep (`:1153-1402`) to their places (F20). Verified.
4. `lab:memory/authority-rules-step-1.md:5`: copy the plan from `~/.claude/plans/` into the lab, or say it is not
   needed (F21). Verified: line 5 names that path.
5. `lab:decisions/2026-09-17-async-work-architecture.md`: a dated "later changes" line naming `79a33ef` (F19).
   Verified: `:47` still lists `natural`, `keyed`, `none`.

Track these in the map (orchestrator#140), not in the guard.

### Guard inputs (Step 7)

1. **Existing surfaces**, and what to do with each:
   - Danger: keep.
   - `test/architecture.test.ts`: amend, to cover Chromium and DNS (F24).
   - The pre-push hooks: keep; possibly a reminder line (`integration.md`).
   - `STATE.md`'s own rules: amend, one owner for the cap (Q5).
   - `orc:.github/pull_request_template.md`: amend, adding a `## Package API` prompt beside the security one.
   - No session guard: create.
2. **The matrix's checks, written against this system's files**, are the guard's "Checks":
   - state dishonesty: `STATE.md`;
   - lost decisions: `decisions/`;
   - stale references: renamed names searched in both repositories;
   - workflow drift: `tools/map.mjs --check`, `FRICTION.md` format;
   - superseded material: reports in `reports/`.
3. **Decision:** `create` (below).

## Existing guard surfaces, by whether they execute

- **Runs by itself:**
  - Danger's "Security review" workflow on every pull request. Recorded as proven on GitHub on 2 Oct (pass, fail
    with the section removed, pass restored; `lab:STATE.md:79-82`). Not re-run here.
- **Runs only by hand:**
  - ORC: `pnpm typecheck`; `pnpm test` (architecture ratchets, core ties, cause-discard allowances, package-API
    report test); `pnpm test:e2e`; `pnpm api:report`; `pnpm pi:check`.
  - The lab: `node tools/map.mjs --check`; `node tools/report.mjs`.
  - Other: the `SECURITY-REVIEW.md` checklist; Astra reviews.
- **Decided, not built:**
  - tests on every pull request (#144);
  - the session-end entropy guard;
  - the weekly adversarial review;
  - FRICTION into rules (#60);
  - cleanups (#70, #182);
  - the diary on a schedule (#166);
  - the label check;
  - approvals bound to builds (#137).
- **Declared, but missing:**
  - `STATE.md`'s overwrite rule and cap (F2);
  - "one snapshot per day" and `--serve` (F13);
  - the completeness of the Boundaries lists, read as a control (F7).
- **Unknown:**
  - both `.githooks/pre-push` (F22);
  - the 22:00 rule's hook, which lives in the user's tool settings outside both repositories.

### Mechanical checks belong to tools

Checked on the machine that ran this assessment, 2026-10-07:
- ripgrep 14.1.1: installed, so the guard's reach search uses it.
- lychee: not installed. ctxlint and agnix: not installed. ast-grep and Semgrep: not installed (`/usr/bin/sg` is
  the shadow-utils group command, not ast-grep).
- The project's own checks (`pnpm typecheck`, `pnpm test`, `tools/map.mjs --check`) belong in CI with #144.
- The reach rule belongs in the architecture test (F24).

No guard check depends on an uninstalled tool.

## Guard decision: `create`

No guard exists in either repository. Justin kept "entropy guard at session end" on 4 Oct (F4, F17). The failure it
targets recurs from one cause (F3). One guard covers both repositories, because the costliest drift is between them.
Its home is open (Q1); it is drafted at `guard/SKILL.md` for the recommended `skills/session-coherence-guard/SKILL.md`
in the lab.

### The generator's inputs

- **Steward:** Justin.
- **Intent documents:** lab `scope.yaml`, `SCOPE.md`, `decisions/`, `memory/authority-rules-step-1.md`; ORC
  `README.md` (Direction, Boundary), `AGENTS.md`.
- **Decision surface:** lab `decisions/`, or the issue on orchestrator#140 that owns the concern.
- **Open intent questions:** Q1 to Q5, unresolved.
- **Current-state file:** lab `STATE.md`, rewritten by the agent whose session causes a verified event
  (`lab:AGENTS.md:33-35`). Nothing refreshes it automatically.
- **Rules bound by, not owned.** None of these was read, except the two ORC files:
  - `~/pro/local-config/home/AGENTS.md`, the user-wide rules, which also covers spending and merging;
  - `~/pro/agentic/HOW_NOT_TO_PLAN.md` (pace);
  - orchestrator#140's description (map rules);
  - ORC `SECURITY-REVIEW.md` and `dangerfile.js`, which were read;
  - `~/pro/scope/docs/MODEL.md`.
- **Verification commands:**
  - ORC: `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report`.
  - The lab: `node tools/map.mjs --check`, `node tools/report.mjs`.
  - Runs by itself: only Danger, on pull requests.
- **Code areas and what describes them:**
  - packages and approvals (`src/core/agents`, `src/adapters/agent-files`): `AGENTS.md` (Security review, Approval
    cards), `package-*.test.ts`;
  - durable work (`src/core/async`, `src/app/async`, `src/adapters/async-store`): the lab's 17 Sep decision,
    `async-*.test.ts`, `OPERATOR.md`;
  - the browser (`src/adapters/browser`): `MCP.md`, `AGENTS.md` Boundaries, `browser-connector.test.ts`, the
    architecture test;
  - notices (`src/adapters/notifications`, `phone`): `AGENTS.md` Boundaries, `OPERATOR.md`, the ntfy and phone tests;
  - the service (`src/adapters/orc-service.ts`, `scripts/orc-service.ts`): `README.md` "As a service",
    `AGENTS.md:136`, `orc-restart.test.ts`;
  - research (`src/core/research-tools.ts`, `child-agent-process.ts`): `README.md` Use and Run, research tests;
  - the package API (`src/package-api.ts`): `src/package-api.api.md`, `AGENTS.md:132`, `dangerfile.js`, the report
    test;
  - installation config (`config/installation.ts`): `README.md` Run, `OPERATOR.md`;
  - diagnostics: `VISIBILITY.md`;
  - turn records: `TURN-RECORD.md`;
  - the lab's `tools/`: lab `README.md`, `AGENTS.md`, `STATE.md`.
- **Live state a session can change:**
  - `orc.service` (restart cards; the build it runs) and ORC's state directory (durable work, grants, approvals);
  - package and build cards;
  - Scope credentials under `~/.config/scopes/`, and ORC's env file;
  - the Bookwhen site, through Moving Stillness (paused);
  - ntfy topics;
  - GitHub issues, map marks and Project 4.
  - Spend: Astra runs through opencode, cost not recorded.
- **Findings:** F1 to F25.

## Generation (`session-coherence-skill-generator`)

- **Supplied:** this assessment and its inputs.
- **Recorded in the state file:** the work, in the `STATE.md` update.
- **Decision:** `create`.
- **Path:** `guard/SKILL.md` here, for the lab's `skills/session-coherence-guard/SKILL.md` (provisional on Q1).
- **Size:** 1,065 words (`wc -w`), against a budget of 1,183. The budget's terms:
  - the common contract, 724, as measured on 2026-10-07;
  - checks: 10 repo-specific checks beyond the template's standing state-claim check, at 36 each, 360;
  - pointers: 55;
  - commands: 44.
  - Not covered by a term: a 21-word scope sentence naming the two repositories.
- **Review before handover:**
  - The guard carries "Modes and safety" and binds its baseline (`origin/main` when the start commit is unknown).
  - Its repairs never treat the work as permission to change intent.
  - The patch check is below.
- **Doc references:** pointers from both `AGENTS.md` files, in the provisional patches (Q1).
- **Validation run:**
  - trailing-whitespace and `git apply --whitespace=error` on fresh copies of the snapshot files, all four patches
    in order: clean;
  - the ripgrep search above.
  - The targets' own tests were not run: read-only snapshots without `node_modules`.
- **Left visible:** Q1 in the guard's home, Q4 in its reports check, Q5 through "the cap in lab `AGENTS.md`".
- **Handoff:** to `guards-integrator`, `integration.md`.

## Patch check

Every hunk was read against the findings and the five questions before delivery. Rules applied:
- A settled hunk may not state what a finding contradicts.
- A settled hunk may not edit text a question quotes.
- A settled hunk may not describe a reach whose authorisation is open.
- Every hunk restating a list a finding calls incomplete adds what is missing or marks it incomplete.

**`settled-orchestrator.patch`:**
- **`README.md` intro.** Restates the process and data-path lists with "include" and "Neither is a complete list"
  (F7, F8c). It names no new reach.
- **`README.md` Bookwhen paragraph.** Removed (F8a). Its replacement names the package tool for published events, a
  path the README already declared, and the test.
- **`README.md` credentials.** Line 103 corrected, with the operator's decision of 28 Sep cited (F8b). Line 104 is
  untouched context. The inserted F25 note records a defect in the work and leaves the constraint standing. The
  open part is marked by quoting the claim as "under question".
- **`README.md` "Deliberately absent".** Paragraph left byte-identical, because Q2 asks about it. An inserted note
  corrects scheduling only, citing the 17 Sep decision.
- **`AGENTS.md` Boundaries.** Lines 92-104 left byte-identical, because Q2 and Q3 quote lines 96 and 101-102. An
  inserted note corrects F7a and F7b and marks both lists incomplete without naming the open reaches.
- **`SECURITY-REVIEW.md`.** The summary now names its owner and adds the missing paths (F11).
- **Banners.** Six banners mark the branch reports historical. Q4 asks only where they live.

**`settled-lab.patch`:**
- **`STATE.md`.** Keeps "Target: sixty lines." (Q5) byte-identical. It states no answer to Q1 to Q5. It names
  F7/F8 only as "under-list". Every live fact carries its date.
- **Q1's quoted text.** The 4 Oct decisions Q1 quotes move verbatim from `STATE.md` to
  `decisions/2026-10-04-...md`; their words are not edited.
- **Lab `README.md`.** Touches no question.

**Provisional patches.** Each hunk names its question in the patch header:
- `provisional-orchestrator.patch`: Q1, Q2, Q3;
- `provisional-lab.patch`: Q1, Q5.

The reach lists there state their search basis and what it did not cover. The F25 note stays, because it is a
defect, not a question.

## Uncertainties and what was not covered

- No live service, GitHub issue, pull request or Project was read. Every live fact here is from the lab's records
  of 4 Oct or earlier.
- Not read: the user-wide rules file, `HOW_NOT_TO_PLAN.md`, the Scope model, orchestrator#140's description, and the
  four other repositories the lab's tools reach. Claims that depend on them (F6, F18, the merge rule) are marked.
- Of the lab's 80+ reports, only these were read: `2026-09-30-skills-one-home.md`, `2026-10-01-review-synthesis.md`
  (in part) and `2026-09-30-priorities.md` (one line). Of the 1,402-line `FRICTION.md`, the 4 Oct entry and the
  state-related entries.
- `STATE.md` changes several times a day, so the settled state update is against a three-day-old file.
- Hook enablement and Playwright's environment default could not be read from the snapshot.
