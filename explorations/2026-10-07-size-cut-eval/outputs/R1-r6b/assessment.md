# Entropy assessment: ORC and the orchestration lab, as one system

Run on 7 October 2026 with entropy-guard's `entropy-assessment` (v0.9.0), on read-only snapshots of two repositories
taken on 4 October 2026 (the lab's files are stamped 17:31, ORC's 14:44):

- **ORC**, `orchestrator/`, checked out at `~/pro/orchestrator` (GitHub `justinphilpott/orchestrator`).
- **The lab**, `scope-orchestration-lab/`, checked out at `~/scopes/scope-orchestration-lab` (GitHub
  `justinphilpott/scope-orchestration-lab`).

**Mode.** The caller asked for the whole route: assessment, guard, integration advice. The targets are read-only, so
nothing in them was edited: every change is a patch in `patches/`. No steward was available, so every question is in
`questions.md` with a recommended answer, and the work that depends on an answer is in a provisional patch. There is
no `.git` in either snapshot, so nothing here rests on history, hooks configuration or GitHub; nothing on GitHub or
on the running ORC was read.

**Route taken.** Step 1 intent pass (`intent-pass.md`). Step 2: lifecycle active; shapes B (ORC), A (the lab) and D
fit; the riskiest, B, routes to `mixed-profile.md`, and the lab, the member that manages the work, also got
docs-first Steps 2, 3, 5 and 7. Step 3 decision: `create`. Step 4: handed to `session-coherence-skill-generator`,
which wrote `guard/SKILL.md` and handed to `guards-integrator` (`integration.md`).

## 1. Intent

### Steward

**Justin.** The lab's `scope.yaml:6` says `steward: justin`; ORC's `AGENTS.md` quotes him by name and as "the
operator". Nothing contradicts it.

### Authorised intent, with the source of each part

| # | Statement | Where | Kind | Authority |
|---|---|---|---|---|
| A1 | The lab exists to "develop and operate Justin's local orchestration platform and its reusable Scope-owned agents" | lab `scope.yaml:5`, `SCOPE.md:5-7` | directive (scope definition) | steward named, undated |
| A2 | Facts about ORC go in its repository, about the Scope model in `~/pro/scope`, about their relationship in the lab | lab `SCOPE.md:19-24`, `AGENTS.md:12-19` | directive | neither |
| A3 | North star: ORC is Justin's "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece" (25 Sep); "work towards a point of consolidation" (26 Sep) | lab `STATE.md:8-11`; quoted in `reports/2026-09-30-priorities.md:7` | decision | attributed and dated, in an overwritten file (F3) |
| A4 | Core ships with no specific Scope, model, owner or agent ("There shouldn't be the tiniest hint of scope specific code inside the core") | ORC `AGENTS.md:30-45` | decision | attributed, dated 2026-09-12 and 2026-09-13 |
| A5 | The lethal trifecta rule; standing grants only for `grantable` work, one owner, task type and key, at most seven days | ORC `AGENTS.md:68-90` | directive | neither; issues #20, #67, #74 cited |
| A6 | Any new authority requires an explicit human choice | ORC `AGENTS.md:110-112` | directive | neither |
| A7 | Approval cards drawn from fixed blocks | ORC `AGENTS.md:114-128` | decision | "the operator, 2026-09-26" |
| A8 | ORC owns a general async work capability; task types declare delivery, approval and schedule (`now`, `at`, `recurring`) | lab `decisions/2026-09-17-async-work-architecture.md` | decision | attributed and dated |
| A9 | Authority rules step 1: rules 1, 2, 4, 5 affirmed (rule 2: "nothing is allowed by default; a card allows it"); rules 3, 6, chat handling and Iris's role open | lab `memory/authority-rules-step-1.md` | decision | attributed, dated 1 Oct 22:05 |
| A10 | The map of work is orchestrator#140; every issue on it | lab `AGENTS.md:7-10`, ORC `AGENTS.md:7-12` | decision | "Justin, 2 Oct 2026" |
| A11 | The 4 Oct interview: the lab is the central Scope for project management, core issue tracking, code quality and security; where issues live; nine processes kept, including "entropy guard at session end"; ORC scheduling (#166) first; this assessment | lab `STATE.md:38-55` | decision | attributed and dated, only there (F3) |
| A12 | Scope logins "should DEFINITELY NOT be centralised" | ORC `config/installation.ts:78-79`, `src/adapters/scope-credentials.ts:14` | decision | "the operator, 2026-09-28" |
| A13 | Security reviews checked by Danger on GitHub | ORC `dangerfile.js:7`; lab `STATE.md:79-82` | decision | "Justin, 2026-10-02: B" |
| A14 | Claude merges a PR once review and tests pass | lab `STATE.md:17` | decision | "Justin, 2026-09-25", only there (F3) |
| A15 | ORC's direction as described: Iris the front door; ADA to create agents; every agent belongs to a Scope | ORC `README.md:9-23` | description | neither |

**Rules the system is bound by but does not own** (not read in this run, as they sit outside the two targets):
`~/pro/local-config/home/AGENTS.md` (user-wide, cited by `STATE.md:16`); the rules in orchestrator#140's description;
`~/pro/agentic/HOW_NOT_TO_PLAN.md` (lab `AGENTS.md:27`); `~/pro/scope/docs/MODEL.md` (`SCOPE.md:24`);
`~/pro/agentic/agentic-architecture/MODEL.md` (ORC `AGENTS.md:59`); Moving Stillness's `DECISIONS.md`
(`config/installation.ts:122`).

### Three readings

- **Declared** (ORC `README.md`): a local-first personal agent with read-only external data paths, with scheduling
  deliberately absent.
- **Enacted** (4 Oct `STATE.md` and `FRICTION.md`): resolve-before-acting on the live Bookwhen browser (#193), the
  package API version (#201), ORC restarting itself from a card (#101), phone notices, invoices sent through a Scope
  package, scheduling next (#166).
- **Authorised:** A3 to A14. The enacted work sits inside them: writes go through cards and grants (A5, A9), the
  scheduling decision exists (A8). The gap is the declared reading, which has not kept up.

### Gaps by condition

- **Stale description:** F5 and F6 (ORC's README against A4, A8, A12 and A5), F7(b) (ORC's `AGENTS.md` naming a
  removed Bookwhen module, against A4). Corrected only where the decision plainly covers it, in the settled patch.
- **Conflict:** F2, the size of `STATE.md`, stated as forty content lines in one file and sixty lines in another.
  Question 2.
- **Missing:** F4, no named home for decisions about ORC's direction (question 3); where a guard for a two-repository
  system lives (question 1).
- **Ambiguous:** F8, whether "No subprocess ORC launches receives one" is a boundary or a description (question 4);
  F17, "credentials are read in one place" (noted, not asked: it does not change the guard).
- **Unauthorised drift:** none established. F18 lists enacted reach (file writes, mail, the browser) that ORC's README
  still calls absent; each is approved by a package card, which A9's rule 2 makes the deciding act.
- **Prose control:** F9, the merge rule's "tests pass", which nothing runs; F14, "guarded changes go through a pull
  request", which nothing shown here enforces.

**Existing guards' repair instructions.** There is no session guard in either repository (F12). The repair
instructions that exist (Danger's failure text, `SECURITY-REVIEW.md`, ORC `AGENTS.md`'s "raise the version" and "run
`pnpm api:report`") never treat the work as permission to change intent. **Ownership:** ORC `README.md:158-163`, "Pi
is pinned in four places", kept in step by `pnpm pi:update`. Three of the four are pnpm overrides, which pnpm needs
to pin transitive packages, so the duplication is probably forced; noted, no change proposed.

**Open questions the steward already holds**, left open everywhere in this run: authority rules 3 and 6, chat
handling and Iris's role (A9); #196, where agent worktrees live; what else the lab should cover (A11); how tests run
on every PR (#144); the label proposal.

**Questions asked:** four, in `questions.md`. **Proposed changes and where recorded:** section 9.

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** `scope.yaml:7` and `:14` say `status: active`; `STATE.md` was rewritten on 4 Oct at 17:31
  after two merges and four verified restarts that day (`STATE.md:31-35`); `FRICTION.md` has a dated entry for each
  day from 20 Sep to 4 Oct.
- **Shape.** ORC is **B, mixed**: 135 TypeScript source files and 71 test files beside 15 top-level documents that
  state its boundaries. The lab is **A, docs-first**: state, decisions, friction and reports in Markdown, with three
  small tools. **D, workflow-heavy**, also fits: nine standing processes, a map, labels, Danger, restart cards.
  The riskiest is B, because the costliest drift found sits between ORC's documents and its code (F5 to F8) and
  between the lab's state file and the live system (F1).
- **One system.** The lab manages ORC's work: its `STATE.md` records where ORC stands, its `FRICTION.md` records ORC's
  failures, its `decisions/` holds ORC's async architecture, and its tools read ORC's checkout, tests and database
  (`tools/collect.mjs:14-25`).

## 3. Domains

All present and changed in the week before the snapshot:
- **code:** ORC `src/`, `web/`, `scripts/`, `config/`; lab `tools/`;
- **documentation:** both;
- **tests:** ORC `test/` (vitest) and `e2e/` (Playwright); the lab has none;
- **API and data contracts:** `src/package-api.ts` and its report `src/package-api.api.md`, `ORC_PACKAGE_API_VERSION`;
  `scope.yaml`; the `**Where we are now:**` line that `tools/map.mjs` parses out of `STATE.md` (F11);
- **workflow:** the map and its marks, Danger, pre-push hooks, restart and build cards, Astra reviews, the diary;
- **live operational state:** `orc.service` on athena and the build it runs; approval grants; package build
  approvals; the live Bookwhen site, written through Moving Stillness's apply (paused 4 Oct); invoices and mail
  through the finance package (#137 is to come "before any real email"); ntfy topics; the GitHub Project's Status
  marks, written by `map.mjs working|stopped` and by every diary run (`tools/report.mjs:55-56`, `syncProject`);
  credentials in `~/.config/orchestrator/env` and `~/.config/scopes/<scope>/credentials/`. Spend: model inference
  (`openai-codex`, `config/installation.ts:17-21`) and Astra runs; the spending rules are owned by the user-wide file,
  not read here.

## 4. Repositories and ownership

| Concept | Owner | Other places it appears |
|---|---|---|
| ORC's code, boundaries, package API, security review | ORC | — |
| Where the work stands, for ORC and every Scope on the map | lab `STATE.md` | read by `tools/map.mjs`; ORC's `AGENTS.md` does not point to it (F13) |
| Open work | GitHub issues under orchestrator#140 | summarised in `STATE.md` |
| What broke in real use | lab `FRICTION.md` | — |
| Steward decisions | **no single owner**: lab `decisions/`, `memory/`, `STATE.md`, ORC `AGENTS.md` quotes, code comments, issues (F3, F4) | |
| The size of `STATE.md` | **two owners**: lab `AGENTS.md:34` and `STATE.md:4` (F2) | |
| The lab's resources | `scope.yaml` | one line each in `SCOPE.md`, as `AGENTS.md:19` prescribes |
| The repositories on the map | `tools/collect.mjs:18-25` (`REPOS`) | not a second home: `scope.yaml` lists what the lab owns, not what the map spans |

**Two homes across the repositories.** One concept has two independent definitions: the size of `STATE.md` (F2).
Two have no home: decisions about ORC's direction (F4) and the record of the 4 Oct decisions (F3). One
cross-repository seam outside these two targets showed in the 4 Oct issue map (`reports/2026-10-04-issue-map-overview.md`,
ms#11: "Two apply paths, two Bookwhen vocabularies"); it is not assessed here.

## 5. Truth map and loop map (docs-first Steps 2 and 3, on the lab)

**Truth map.**

| Role | Documents |
|---|---|
| canonical | lab `scope.yaml`, `SCOPE.md` (purpose, authority split), `AGENTS.md` (working conventions), `decisions/`, `memory/authority-rules-step-1.md`; ORC `AGENTS.md` (rules), `README.md` (direction, run, boundary), `SECURITY-REVIEW.md`; `test/architecture.test.ts` is the enforced form of the rules, not their record |
| current state | lab `STATE.md`; generated from live data: `status.html` and `reports/<date>.json` (projections, not competitors) |
| local elaboration | lab `memory/slots-run-walkthrough.md` (one run of 28 Sep, dated) |
| product artifact | lab `tools/map.mjs`, `collect.mjs`, `report.mjs`; the `**Where we are now:**` line in `STATE.md`, which `map.mjs:184` parses (F11); ORC `src/package-api.api.md` (generated, checked by a test and Danger) |
| historical | lab `reports/` (dated), `research/`, `AGENT_IDEAS.md` ("prompts for a conversation, not approved designs"); ORC's branch reports at its root: `REWORK.md`, `SEAM.md`, `OPERATOR.md`, `FIXES.md`, `SLICE1.md`, `GRANTS-E2E.md`, `POLICY-STORE.md`, `CLASSIFY.md`, `TURN-RECORD.md`, `VISIBILITY.md`; `MCP.md`'s browser sections (marked) (F15) |
| design | ORC `GRANTS.md` (2026-09-20) |

**Concepts and their one canonical home**: purpose, A1 in `scope.yaml`; ORC's rules, ORC `AGENTS.md`; where we are,
`STATE.md`; open work, the issues; failures, `FRICTION.md`; north star, **none durable** (F3, question 3); the
`STATE.md` size, **two** (F2, question 2).

**Loop map, as practised** (from `AGENTS.md`, `STATE.md` and `FRICTION.md`):
1. A session starts in the lab (`CLAUDE.md` links to `AGENTS.md`): read `STATE.md`, then `SCOPE.md`, then #140.
   A session in an ORC worktree reads ORC's `AGENTS.md`, if its tool loads it (F13), which points to #140 but not to
   `STATE.md`.
2. Work is marked on the GitHub Project with `node tools/map.mjs working '<ref>' --agent <A>`.
3. ORC changes go on a branch, often in a worktree under `/tmp` (lost in the 4 Oct power cut; #196), then a PR. Danger
   checks the `## Security review` and `## Package API` sections. An Astra review may follow. Claude merges "once review
   and tests pass"; the tests are run by hand (F9).
4. After a merge, ORC raises a restart card; Justin approves it; the session reads back what runs.
5. At each verified event, the session overwrites `STATE.md`. Decisions are written into `STATE.md` as they are taken
   (F3); failures go to `FRICTION.md`; ideas to `AGENT_IDEAS.md`; reviews to `reports/`.
6. The handoff is the `STATE.md` overwrite plus the reply to Justin. There is no session-end check (F12).

Where follow-up gets lost: review findings about documents (F5 was found on 1 Oct and is unchanged on 4 Oct);
decisions written into a file that is then overwritten (F3); In Progress marks left behind (`map.mjs` flags marks older
than 14 hours); uncommitted worktrees in `/tmp`.

## 6. Findings

Each finding has one entry; other sections and files refer to it by id.

**F1. The lab's `STATE.md` contradicts itself about what runs and what is done.** Source: lab.
- `STATE.md:23` "#193 ... is built and in review, not merged" against `:31` "#193 is live: #200 merged as `3989cdb`".
- `:58` "ORC live: 369628b since 22:12:47" and `:88` "main process started 2026-10-03 22:12:47 on `369628b`" against
  `:31-35`, four later restarts on 4 Oct, the last at 14:48:27 onto `8cee662`.
- `:91` "Moving Stillness: `main` `c759f96` (MS #51)" against `:31` "MS #53 merged as `fc830aa`".
- `:59` "Next on the browser stack: #118, then #52" against `:33-34` "MS is paused ... (#118, #52, MS #52) waits".
- `:93-94` "Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z", in the present tense on 4 Oct.
- The same failure is recorded three times before: `FRICTION.md:864-870` (12 Sep), `:621-626` (22 Sep, "two false
  statements"), `:287` (29 Sep, "I told Justin ORC had restarted when it had not").

**F2. The size of `STATE.md` has two owners, and the file exceeds both.** Source: lab. `AGENTS.md:34` "capped at about
forty content lines"; `STATE.md:4` "Target: sixty lines". The file has 99 lines, 82 of them content lines. It holds
history that `AGENTS.md:33-36` sends to `git log` (the 4 Oct power cut, "Phone (closed 3 Oct)", the 2 Oct git
cleanup). Condition: conflict. Question 2.

**F3. Steward decisions are recorded only in `STATE.md`, which is overwritten at each verified event.** Source: lab.
Searched both repositories for each: the 4 Oct interview (`STATE.md:38-55`, A11), found only there; the north star
(`:8-11`, A3), only there and in one report; the merge rule (`:17`, A14), only there; three 3 Oct decisions (`:57-58`),
only there and, for one, `reports/2026-10-03-branch-cleanup.md`. The 4 Oct record is the one that decides this guard
should exist.

**F4. Decisions about ORC's direction have no named home.** Source: both. Lab `AGENTS.md:16` sends facts about ORC to
ORC's repository, which has no decision log. The one recorded ORC architecture decision sits in the lab's `decisions/`
(2026-09-17). The rest are quotes in ORC `AGENTS.md` (A4, A7), code comments (A12, A13), `memory/` (A9) and
`STATE.md` (A3, A14). Condition: missing. Question 3.

**F5. ORC's README contradicts recorded decisions and the code.** Source: ORC.
- `README.md:76-79` tells a reader to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN` for an exact-pinned
  `@jphil/bookwhen-client@0.6.1`. `package.json` has no such dependency; `test/architecture.test.ts:1315-1320` asserts
  it absent; the calendar's token is the Scope credential `scope:calendar.api-token` (`config/installation.ts:121`);
  A4 puts a Bookwhen connector in the Scope. Astra and Claude reported this on 1 Oct
  (`reports/2026-10-01-review-synthesis.md:43`, defect 7) and offered it among "Small cleanups, on your word" (`:95`); it is
  unchanged on 4 Oct.
- `README.md:5-7` "Its read-only external data paths are ..." against the Moving Stillness apply, which writes to
  Bookwhen behind a card or standing grant (ORC `AGENTS.md:82-90`), and the package connectors in
  `config/installation.ts`.
- `README.md:146-147` "calculate a slot-change plan without applying it" against `apply_moving_stillness_slots`
  in the binding (`config/installation.ts:44`, `:58`) and `AGENTS.md:82-90`.
- `README.md:103` "A credential is read in exactly one place, `src/runtime.ts`" against
  `src/adapters/scope-credentials.ts` (A12) and `src/web-cli.ts:625` (`ORCHESTRATOR_WEB_TOKEN`).
- Condition: stale description. Corrected in the settled patch, each change citing its decision.

**F6. ORC's README calls scheduling "deliberately absent".** Source: ORC. `README.md:152-154` against A8 (2026-09-17:
`schedule: now, at, recurring`) and A11 ("ORC scheduling (#166) is built first"); the code has
`src/app/async/calendar.ts` and the `*:async-series` commands (`package.json:38-42`). Condition: stale description.
"Scheduling" is removed in the settled patch; the rest of that list is F18.

**F7. ORC's `AGENTS.md` lists that claim completeness are incomplete.** Source: ORC.
- (a) `AGENTS.md:92-96` names three modules with subprocess access. `test/architecture.test.ts:823-857` approves four;
  the fourth, `src/adapters/orc-service.ts`, runs git, `pnpm install`, the build and `systemctl` for the restart card
  (#101) that `AGENTS.md:136` tells agents to rely on. The test searches `src/` for subprocess primitives, so it does
  not see `chromium.launch` in `src/adapters/browser/playwright.ts:55` (Playwright's library, since #76 on 3 Oct;
  `MCP.md:3-5`). Rules against enforcement: the enforced list is blind to processes a library launches.
- (b) `AGENTS.md:102-103` "`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client": the file is
  absent and the test forbids the client (F5).
- (c) `AGENTS.md:47` says `test/core-ties.ts` scans `src/` and `web/src/`; `test/core-ties.ts:8` scans `config/` too.
- (a) adds `orc-service.ts`, settled by the directive at `AGENTS.md:136` (a directive outranks a description); the
  browser's Chromium is left to question 4. (b) and (c) are corrected in the settled patch.

**F8. "No subprocess ORC launches receives one [credential]" is not true of two subprocesses.** Source: ORC.
`README.md:104`. The Chromium that `playwright.ts:55-69` launches is given the Scope's login (`storage-state`) as its
cookies; before 3 Oct, the Playwright MCP server was (`memory/slots-run-walkthrough.md`, step 11). The restart card's
commands (`src/adapters/orc-service.ts:71`, `:102`, `:107`, `:128`) pass no `env`, so they inherit ORC's environment,
which `scripts/orc-env.sh:45` fills from `~/.config/orchestrator/env`, including `ORCHESTRATOR_WEB_TOKEN` when it is
pinned. Real size: the restart card's commands are git, systemctl, pnpm and ORC's own build script, so the practical
exposure is small; whether pnpm runs any dependency's install script there was not checked. The browser case is the
material one. Condition: ambiguous (boundary or description). Question 4.

**F9. The checks run only by hand, and one rule cites them as a gate.** Source: both.
- ORC's only workflow is `.github/workflows/danger.yml`; nothing runs `pnpm typecheck` or `pnpm test` on a PR (#144).
  `vitest.config.ts:12` excludes `e2e/`, which runs only through `pnpm test:e2e`. The 1 Oct synthesis ranks "Nothing
  runs the tests" first and records E2E red on `main` for a week.
- `STATE.md:17` "Claude merges a PR once review and tests pass": a prose control; enforcement would sit in a required
  CI status (#144, kept on 4 Oct, mechanism open).
- The "daily diary", a process kept on 4 Oct, last ran on 2 Oct (`status.html` "generated 08:45 UTC";
  `reports/2026-10-02.json`, with `suites: null`). `tools/report.mjs:12-13` records the same failure in September
  (orchestrator#64: "nothing ran it each day").
- `node tools/map.mjs --check` runs only by hand.

**F10. The lab's README names commands and behaviour the tool lacks.** Source: lab.
- `README.md:18` `--serve`: `tools/report.mjs` has no such flag, and `:13` says "nothing is served".
- `README.md:16` "runs the test suite (~10s)": `report.mjs:9-10` says both suites, about two minutes; ten seconds is
  `--no-tests`.
- `README.md:22` "One snapshot per day is kept": six snapshots exist, the last for 2 Oct (F9).
- `README.md:17` `--no-tests` "keeps the day's test count": `report.mjs:51-54` and `:313` write the day's snapshot
  with `suites: null`, replacing an earlier full run's counts. Which side is wrong is not established; not patched.
- The first three are corrected in the settled patch.

**F11. A line in `STATE.md` is a machine-read contract, and nothing says so.** Source: lab. `tools/map.mjs:182-191`
reads `**Where we are now:** <ref>` from `STATE.md`; without it the map marks nothing and reports no error.
`AGENTS.md` "Keeping state" does not mention it. Settled patch adds one sentence.

**F12. "Entropy guard at session end" is decided and not built.** Source: both. A11 keeps it. A search of both
repositories for "entropy", "session-coherence" and "session end" finds only `STATE.md:49` and `:54`. The lab's
`skills/` holds only `.gitkeep`.

**F13. Whether ORC sessions find their instructions is uncertain, and they do not point to the state file.** Source:
both. The lab has `CLAUDE.md` linked to `AGENTS.md`; ORC has `AGENTS.md` only.
`reports/2026-09-30-skills-one-home.md:17-23` lists `~/.claude/CLAUDE.md` as Claude Code's rules file, where Codex,
opencode and Pi read `AGENTS.md`. Whether a Claude Code session in an ORC worktree loads ORC's `AGENTS.md` is unknown
from the snapshot. ORC's `AGENTS.md` points to #140 but not to the lab's `STATE.md` or `FRICTION.md`,
although A11 makes the lab the central Scope.

**F14. The hooks only print, and whether they run is unknown.** Source: both. ORC and the lab each have
`.githooks/pre-push`, which prints `push-summary` and exits 0. No `.git` in the snapshot, so `core.hooksPath` cannot
be read. ORC `AGENTS.md:143`: "a direct push to `main` is not checked"; whether branch protection refuses one is
unknown. "Guarded changes go through a pull request" is therefore prose as far as this snapshot shows.

**F15. ORC's root holds branch reports beside its live documents, unmarked.** Source: ORC.
- `REWORK.md:3` "Nothing committed, nothing pushed"; `SEAM.md:12` and `OPERATOR.md:12` "Nothing is pushed".
- Removed paths named as current: `src/adapters/browser/service.ts` (`SLICE1.md:7,24`, `GRANTS.md:88`,
  `CLASSIFY.md:43-46`, `VISIBILITY.md:58`); `src/adapters/browser/mcp.ts` (`CLASSIFY.md:55`, `VISIBILITY.md:57`);
  `src/core/policies.ts` (`POLICY-STORE.md`, now `src/core/agents/policies.ts`); `POLICY-SOURCE.md` (`GRANTS-E2E.md`).
- `scripts/orc-service.ts:41` writes `Documentation=file://.../OPERATOR.md` into the systemd unit: the unit's
  documentation is a branch report.
- `MCP.md:3-5` shows the marking that works: a banner saying what is history.

**F16. `FRICTION.md` says "Newest first" (line 3), but its entries for 11 to 19 Sep follow 3 Sep, oldest first
(lines 1153-1402).** Source: lab.

**F17. "Credentials are read in one place" (ORC `AGENTS.md:64`) has two readings.** Source: ORC. One module per kind
of credential (true: ORC's env file, `scope-credentials.ts` for Scope credentials) or one module for all (false:
`runtime.ts`, `web-cli.ts:625` and `scope-credentials.ts` each read some). The case where they diverge is containerising
ORC, which the sentence prepares for. Left as is; noted for question 3's decision owner.

**F18. ORC's README still lists as "deliberately absent" things that now exist behind cards.** Source: ORC.
`README.md:152-154`: "additional external data sources" (the browser, ntfy, the finance mail connector) and "file
edits" (the finance package's client folders and outbox, Moving Stillness's advert folder:
`config/installation.ts:120-172`).
Each is bound on an approval card, which A9's rule 2 makes the deciding act. No recorded decision plainly settles the
README's wording, so it is left open, and not asked, because the answer changes neither the guard nor the build.

**F19. `memory/slots-run-walkthrough.md` is a dated trace with present-tense instructions.** Source: lab. "How to look
at a run yourself" says `pnpm timeline` is "available once ORC restarts onto `26dd4d4` or later"; steps 11-12 name
`service.ts` and `mcp.ts`. The trace itself is correctly dated (28-29 Sep). Low.

## 7. Ranked risks (decay rate times recovery cost)

1. **State dishonesty in the lab's `STATE.md`** (F1, F2, F11). Decay: fast: it is rewritten after every verified
   event, and 4 Oct alone recorded two merges and four restarts. Recovery: high, because its errors reach Justin as
   confident wrong answers about live services, three times recorded. Anchor: `STATE.md` itself and `AGENTS.md` "Keeping state". Guard checks 2 and 3.
2. **Lost steward decisions** (F3, F4). Decay: one careless overwrite. Recovery: very high, because a lost decision
   must be asked of Justin again, and the 4 Oct one defines the lab's role. Anchor: `decisions/`. Guard check 4.
3. **ORC's boundary documents drifting from its code** (F5 to F8, F18). Decay: every PR that changes reach, three in
   two days (#193, #201, #101). Recovery: medium to high: `AGENTS.md` is what a security review reads, and F5 survived
   two reviews' reports for three days. Anchor: ORC `AGENTS.md` "Boundaries", A4, A12. Guard checks 1 and 5.
4. **Checks that only run by hand** (F9, F14). Decay: every merge. Recovery: medium (red E2E for a week). Anchor: #144,
   and #166 for the scheduled processes. Guard: the commands block and check 6, until CI exists.
5. **Superseded material beside live documents** (F15, F19). Decay: slow. Recovery: low to medium, a fresh agent
   reading a removed path as current. Anchor: `MCP.md`'s banner pattern. Guard check 9 stops new ones.

## 8. Guard surfaces, sorted by whether they execute

- **Runs by itself:** Danger on every ORC PR (`danger.yml`, `dangerfile.js`): the Security review and Package API
  sections. Recorded as proven on GitHub on 2 Oct (`STATE.md:80-81`), not re-observed. The restart card is raised by
  ORC within a minute of the checkout moving (`AGENTS.md:136`); it is a deploy step, not a guard.
- **Runs only by hand:** ORC `pnpm typecheck`, `pnpm test` (with `architecture.test.ts`, `core-ties.ts`,
  `package-api-report.test.ts`), `pnpm test:e2e`, `pnpm api:report`, `pnpm pi:check`, `pnpm service:status`; lab
  `node tools/map.mjs --check`, `node tools/report.mjs`; `SECURITY-REVIEW.md` (Danger checks only that a section
  exists); Astra reviews.
- **Decided, not built:** the entropy guard at session end (F12); tests on every PR (#144); the weekly adversarial
  review, daily diary, FRICTION-into-rules (#60), branch and worktree cleanup (#70), `/tmp` cleanup (#182), to run
  through ORC scheduling (#166).
- **Declared, but missing:** `report.mjs --serve` (F10); `src/bookwhen.ts` and `ORCHESTRATOR_BOOKWHEN_API_TOKEN`
  (F5, F7); the systemd unit's documentation, which points at a branch report (F15).
- **Unknown:** both `.githooks/pre-push` (F14); branch protection on ORC's `main` (F14); whether Claude Code loads
  ORC's `AGENTS.md` (F13).

## 9. Proposed changes

Every change is a patch in `patches/`, made against the 4 Oct snapshot and checked with `git apply --check` on copies
of the files; the provisional patches apply on top of the settled ones, singly or together. Sorted by whether they
touch an open question.

**Settled: touch no open question.**
- `settled-orchestrator.diff`:
  - `README.md`: the data-paths sentence, marked not exhaustive (F5); the Bookwhen paragraph, citing A4 (F5); the
    credentials sentence, citing A12, leaving the subprocess sentence alone (F5, question 4); "without applying it",
    citing `AGENTS.md:82-90` (F5); "scheduling" out of the absent list, citing A8 (F6).
  - `AGENTS.md`: `orc-service.ts` added to the subprocess list, and the test's blind spot stated (F7a); the
    `src/bookwhen.ts` sentence (F7b); `config/` in the core-ties scope (F7c).
- `settled-lab.diff`:
  - `STATE.md` brought up to date (docs-first Step 5; F1, F2): contradictions resolved to the latest recorded value,
    each live fact marked "recorded, not re-read", what makes it stale and who refreshes it, the assessment recorded,
    history dropped. 59 lines, 47 of them content lines (from 99 and 82): inside `STATE.md`'s sixty, over
    `AGENTS.md`'s forty. Getting under forty would drop open work with no verified other record (the map follow-ups,
    the 3 Oct decisions); question 2 settles which limit applies. Its `Target: sixty lines` is left as written.
  - `decisions/2026-10-04-lab-role-and-processes.md`: the 4 Oct interview copied verbatim (F3). It concerns the lab's
    role and processes, so it belongs to the lab's own decision record whatever question 3's answer.
  - `AGENTS.md`: one sentence on the `**Where we are now:**` contract (F11).
  - `README.md`: `--serve`, the timing and "one snapshot per day" (F10).

**Provisional: not to be applied until Justin answers.**
- `provisional-Q1-lab.diff`, `provisional-Q1-orchestrator.diff` (question 1): the guard at
  `skills/session-coherence-guard/SKILL.md` in the lab, a "Before handing off" section in each `AGENTS.md`.
- `provisional-Q2-lab.diff` (question 2): `STATE.md`'s size line becomes a link to `AGENTS.md`.
- `provisional-Q3-lab.diff`, `provisional-Q3-orchestrator.diff` (question 3): the north star and the merge rule copied to
  `decisions/2026-09-25-north-star-and-merge-rule.md`; `STATE.md` links to it; ORC's `AGENTS.md` names the lab's
  `decisions/`.
- `provisional-Q4-orchestrator.diff` (question 4): the browser exception in `README.md` and `AGENTS.md`, with a
  placeholder for Justin's decision. Under the recommended answer, the restart card's environment is a defect in the
  work, fixed in `src/adapters/orc-service.ts` through a PR with its own security review; no patch is offered here.

**One-time cleanup, each item checked against the current file, none patched:**
- Mark ORC's ten branch reports as history with a banner like `MCP.md:3-5`, or move them (a structural change: needs
  Justin's yes) (F15).
- Point the systemd unit's `Documentation=` at `README.md` instead of `OPERATOR.md` (`scripts/orc-service.ts:41`) (F15).
- Decide whether `report.mjs --no-tests` should keep the day's test counts, then fix the tool or the README (F10).
- Move `FRICTION.md` lines 1153-1402 into date order (F16).
- Confirm the three 3 Oct decisions are on #194 and the Moving Stillness issues, then drop them from `STATE.md` (F3).
- Add a `## Package API` placeholder to `.github/pull_request_template.md`, which has only the Security review one.

**Recommendations: consolidate, demote, mark historical.** Consolidate decisions (F3, F4) into the owner question 3
names. Demote ORC's branch reports to history (F15). Keep `status.html` and the snapshots as generated projections.
Hand the stable mechanics to tools (section 10).

## 10. Mechanical checks that belong to tools

- **Tests on every PR:** a CI job running `pnpm typecheck && pnpm test`, as a required status (#144). Until then the
  guard runs them.
- **Paths and identifiers named in prose:** a check that each `src/...` path and `ORCHESTRATOR_*` name in ORC's
  `README.md` and `AGENTS.md` exists in the code. `test/architecture.test.ts` already reads source; ast-grep or a
  short test would do it. It would have caught F5 and F7(b) on the day.
- **Links:** lychee, for the relative links in both repositories.
- **Instruction files:** an instruction-file linter such as ctxlint or agnix on both `AGENTS.md`.
- **`STATE.md`'s shape:** a `--check` in `tools/map.mjs` that fails when the `**Where we are now:**` line is missing
  or the file is over its limit (F11, F2).
- **The diary and the map check on a schedule:** through ORC scheduling (#166), as decided.
- None of these tools was checked for installation; the guard depends on none of them, only on git, pnpm, node and
  gh, which the repositories already use.

## 11. The guard decision, and the generator's inputs

**Decision: `create`.** No guard exists (F12); Justin decided one at session end (A11); the loop needs one, because the
top three risks recur session by session and each was found by a person asking, not by a check. One guard for the
system, not one per repository, because both repositories' sessions write the same state file, decisions and
friction log; where it lives is question 1.

**The generator's inputs**, each resolved or not:
- Steward: Justin. Resolved.
- Intent documents: A1, A2, A4 to A10 sources, and A3's north star in `STATE.md`. The north star's durable home is
  unresolved (question 3).
- Decision surface: the lab's `decisions/` for the lab; the issue for an issue-scoped decision; ORC's direction
  unresolved (question 3).
- Open intent questions: questions 1 to 4, plus the steward's own (section 1).
- Current-state file: the lab's `STATE.md`, overwritten by the session that causes each verified event (lab
  `AGENTS.md:33`). Its size limit is unresolved (question 2).
- Rules bound by, not owned: section 1, plus A13 and A14.
- Verification commands: section 8. Only Danger runs by itself.
- Code areas and their docs and tests:
  - ORC `src/` reach (subprocess, network, credentials, connectors, tools) is described in `README.md` (opening,
    "Credentials", "Boundary") and `AGENTS.md` ("Boundaries") and enforced by `test/architecture.test.ts` and
    `test/core-ties.ts`.
  - `src/package-api.ts` is reported in `src/package-api.api.md`, checked by `test/package-api-report.test.ts` and Danger.
  - `src/adapters/orc-service.ts` and `scripts/orc-service.ts` are described in `README.md` "As a service" and
    `AGENTS.md` "Security review".
  - `web/` and the browser adapter are covered by `e2e/`.
  - The lab's `tools/*.mjs` are described in its `README.md` and `AGENTS.md`; `STATE.md` is read by `tools/map.mjs`.
- Live state and spend a session can change: section 3.
- Findings: F1 to F19.

## 12. The generated guard (generator output)

- **Path:** `guard/SKILL.md` here; intended home `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`
  (question 1; `provisional-Q1-lab.diff` adds it there).
- **Size: 1,070 words** (`wc -w`), against a **budget of 1,106**:
  - common contract: 706 words (the generator's measure);
  - checks: 10 lines, 2 of them the template's standing checks filled in, so 8 extra at 36 words each, 288 words;
  - pointers: 83 words of filled-in "Where things live" values (102 words in the section's list, less 19 for its labels);
  - commands: 29 words, the two-line block under "Checks".
  - Content outside these terms: one sentence naming the two repositories, the filled-in values of the intent-change
    rule's placeholders, and the live-change note under "What changed this session". The total still falls inside
    the budget, so nothing was cut.
- **Checks and what justifies each:**
  1. reach changed, ORC's boundary documents still right (F5, F7, F8);
  2. state claims agree, live facts dated (F1);
  3. the `**Where we are now:**` line and the size limit (F11, F2);
  4. a decision recorded at its owner (F3, F4);
  5. a renamed name searched for in prose (F5, F10);
  6. `pnpm test:e2e` when the browser or web side changed (F9);
  7. a merge followed by a card restart and a read-back (F1; ORC `AGENTS.md:136`);
  8. the map check and marks cleared (A10);
  9. a new report dated and marked as a record (F15);
  10. friction recorded (A11, #60).
- **Review before handover:** the guard carries "Modes and safety" and binds its baseline (the session's start commit,
  else `origin/main` with "coverage incomplete"). Its repairs never permit editing an intent document to match the
  work. Every settled hunk was checked against the four questions' text.
- **Open questions it leaves visible:** the decision home for ORC's direction (question 3) and the size limit
  (question 2), both marked UNRESOLVED in the guard.
- **Doc references added:** none to the targets (read-only); the pointers are in `provisional-Q1-*.diff`.
- **Validation:** all eight patches pass `git apply --check` on copies of the files and compose; `git diff --check`
  found no whitespace errors; the rewritten `STATE.md` still matches `tools/map.mjs`'s regular expression
  (`**Where we are now:** #193`). Not run: either repository's tests (no dependencies in the snapshot).
- **Handoff:** to `guards-integrator`, in `integration.md`.

## 13. What was not covered

- Nothing on GitHub was read: #140's rules, the issues, the Project, branch protection, PR descriptions.
- Nothing live was read: what `orc.service` runs, grants, the Bookwhen site. Every live value here is as recorded,
  with its time.
- No history: no `.git`, so no commit messages were searched for steward quotes, and no hook configuration was read.
- Files outside the two targets: the user-wide `AGENTS.md`, `HOW_NOT_TO_PLAN.md`, the Scope model, Moving
  Stillness and finance.
- ORC's 15 top-level documents were read at their heads and searched for named paths, not read in full. Of the lab's
  68 Markdown reports, three were read (`2026-09-30-skills-one-home.md` whole, `2026-10-01-review-synthesis.md` and
  `2026-10-04-issue-map-overview.md` in part) and the rest only searched; `AGENT_IDEAS.md` and `FRICTION.md` in part.
- The full reach of each Scope package's connectors (F5's "not exhaustive").
- Tests were not run, so the test counts are as recorded on 4 Oct.

## 14. Uncertainties

- F13: whether Claude Code, Codex, opencode and Pi each load ORC's `AGENTS.md` from a worktree.
- F14: whether either pre-push hook is enabled, and whether ORC's `main` refuses direct pushes.
- F10: whether `--no-tests` was meant to keep the day's counts.
- F8: whether pnpm runs any dependency install script during the restart card's install.
- Whether "where we are now" should still be #193 after it went live; the rewritten `STATE.md` keeps #193, because
  nothing records a newer focus.
