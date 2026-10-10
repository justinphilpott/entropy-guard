# Entropy assessment: Iris-app (orchestrator) and the orchestration lab, 10 Oct 2026

Run by Claude with entropy-guard's skills (entropy-assessment 0.9.0, docs-first-planning-assessment 0.3.0,
session-coherence-skill-generator 0.5.0, guards-integrator 0.4.0), in build mode for outputs and read-only for the
two repositories. Steward absent: every question is in `questions.md` with a recommended answer; work that depends
on an answer is in a provisional patch.

What was read:
- **orchestrator** at `a694039` (Release 0.5.4), a read-only copy with no `.git`.
- **scope-orchestration-lab** at `56a32e0`, likewise.
- History from `git log`, `git show` and `git blame` on the live repositories, up to those commits.
- Every file read, in order, with the skill step that sent me there, is in `read-log.md`.

Route taken: entropy-assessment → intent pass → shape B (mixed docs and code), with D (workflow-heavy) also fitting →
`mixed-profile.md` for the system, plus docs-first Steps 2, 3, 5 and 7 on the lab, a docs-first member repository →
guard decision `create` → session-coherence-skill-generator → guards-integrator.

## 1. Intent

**Steward:** Justin. Evidence: `scope.yaml:6` (`steward: justin`); both repositories quote him as the decider
throughout, for example orchestrator `AGENTS.md:47-51` and lab `memory/core-and-scopes.md`.

**Authorised intent, with the source of each part:**

| Part | Source | Kind and authority |
|---|---|---|
| Agent Iris is Justin's ChatGPT replacement, daily tool, agentic development test ground and eventual work showpiece | 25 Sep interview, recorded in lab `STATE.md` (`ecd6d59`, "Settled by Justin on 2026-09-25") and `reports/2026-09-30-priorities.md:7`; summarised in today's `STATE.md:9-12` | decision; attributed, dated |
| The lab is Justin's Scope for developing and operating ORC and its reusable Scope-owned agents | `scope.yaml:5`, `SCOPE.md:3-7` | directive; steward named in `scope.yaml`, undated |
| The lab is the central Scope: project management, Core's issue tracking, code quality, security; twelve processes, including "entropy guard at session end" and "tests on every PR" | `memory/central-scope.md:8-27` | decisions; Justin, 4–7 Oct |
| Core ships with no specific Scope, model, owner or agent; no agent-specific code in Core | orchestrator `AGENTS.md:44-67`; `memory/core-and-scopes.md:127-134` | decisions; Justin, 12–13 Sep and 10 Oct, quoted |
| How Core and Scopes relate: the Registry, two consents, cross-Scope writes ratcheted down, lead agents | `memory/core-and-scopes.md` | decisions; Justin, 4–7 Oct |
| Durable work is a general capability of Iris-app, with each agent facing it through a facade | lab `decisions/2026-09-17-async-work-architecture.md` | decision; Justin, 17 Sep |
| Names: Iris-app, Iris-agent, Core = `src/core/`, retired words | orchestrator `docs/GLOSSARY.md` | decisions; agreed with Justin 7 Oct, 10 Oct |
| The lethal trifecta rule, enforced controls, grants by card | orchestrator `AGENTS.md:89-126`, `SECURITY-REVIEW.md` | directives; issue #20, Justin's quotes |
| The live install is development; merge rights until 15 Oct; the pause point | lab `STATE.md:18-19, 46-49` only (F1) | decisions; Justin, 7 and 8 Oct |
| Cross-project rules: prior art, referents, merge requests, PRs name issues, sessions close more issues than they open, spending through Iris-app's permissions | `~/.claude/CLAUDE.md` and `~/AGENTS.md` | directives; Justin, dated; highest precedence |
| Tests on every PR as a local gate, not GitHub Actions | #144 as summarised in lab `reports/2026-10-09-issue-map-scan.md:122` ("We can run tests locally", 8 Oct) | decision; attributed, dated; the issue itself was not read |

**Declared, enacted and authorised:**
- **Declared:** a thin, generic Core with Scope-owned agents, authority by card, containment later. It is in the
  READMEs, `AGENTS.md` and `SCOPE.md`.
- **Enacted:** 518 orchestrator commits and 181 merges between 3 and 10 Oct. They went to stabilisation and the
  rename, #328 (Pi behind its port), Iris's memory (#350), paid search, restart reliability, the contained rehearsal
  and incognito chats. 314 lab commits went to designs, Astra reviews, map hygiene and `STATE.md`.
- **Authorised:** the enacted work matches the authorised direction. I found no unauthorised drift. Each new reach
  I checked traces to a recorded decision (F4).

**Existing guards' repair instructions (intent-pass §1).** No session-coherence guard exists in either repository.
I read these repair instructions:
- the "Fix:" and "Rule for myself" lines in `FRICTION.md`;
- the messages in `dangerfile.js` and `tools/map.mjs`;
- the ratchet rule in orchestrator `AGENTS.md:61-62`.

None treats the work as permission to change intent. None keeps two independent definitions in step: the core-ties
ratchet's allowance and count are a test and its expectation.

**Gaps, by condition:**

| Condition | Gap | Evidence | Response |
|---|---|---|---|
| Stale description | The reach, tool and card lists, Bookwhen, Pi and "deliberately absent" lines in the orchestrator README and `AGENTS.md` | F3, F4, F5, F6 | corrected in `settled-orchestrator.patch`, citing the decisions |
| Stale description | `memory/core-and-scopes.md` "Names", and its "Finding 2" for ORC; `docs/GLOSSARY.md:152` | F11 | corrected in the settled patches |
| Conflict | `STATE.md` size: "about forty content lines" (lab `AGENTS.md:34`, 3 Sep) against "Target: sixty lines" (`STATE.md:5`, 24 Sep) | F8 | Q4 |
| Conflict | Lab `AGENTS.md:27-29` ("one scored real use must come first") and orchestrator `AGENTS.md:220-221`, against the user-wide rules of 21 Sep and 10 Oct | `git blame`: `a5ee57a`, 3 Sep | Q2 |
| Ambiguous | Plain "Iris" in repository prose: "in our chats" (Justin's words) or all prose ("not used on its own") | `docs/GLOSSARY.md:4-5, 17-19` | Q3 |
| Missing | Where the session-end guard lives, and whether it covers both repositories | `memory/central-scope.md:26` decides the process, not its home | Q1 |
| Prose control | Rules that nothing enforces; four are cited as the gate (list below) | F7 | report where enforcement would sit; F7 |
| Prose control | The pause, the merge-rights expiry and "no agent edits `scope.yaml`" have no mechanism. The last one says so itself (#146) | F1; `memory/core-and-scopes.md:66` | guard check (working rules) |

The four prose rules cited as the gate:
- **"Merge only when it is green"** (`SECURITY-REVIEW.md:55`). Enforcement would sit in #180, required checks.
- **"The full suite runs before every merge"** (FRICTION, 10 Oct). Enforcement would sit in #144, the local merge gate.
- **"pr-names-issue.yml refuses"** (orchestrator `AGENTS.md:16`). A failed check warns rather than blocks.
- **The same wording in the user-wide rules.** This one is owned elsewhere and is not patched.

**Questions:** four, in `questions.md`.

**Proposed intent changes, and where they were recorded:**
- **Q2** would retire the Pace line. It is drafted in `provisional-Q2-pace-*.patch`.
- **All four questions** are recorded as awaiting Justin in lab `memory/central-scope.md`, "Waiting". That record
  is in `settled-lab.patch`.

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** Since 3 Oct there were 518 orchestrator commits and 314 lab commits. `STATE.md` was
  rewritten 61 times on 8 Oct and 17 times on 10 Oct. `scope.yaml:7` reads `status: active`.
- **Repositories, assessed as one system.**
  - `orchestrator` is the code. It is TypeScript: 149 files under `src/`, 102 under `test/`, plus `web/`. It has
    substantial rule documents: `AGENTS.md`, `README.md`, `SECURITY-REVIEW.md` and `docs/GLOSSARY.md`.
  - `scope-orchestration-lab` manages the work. It holds `STATE.md`, `memory/`, `decisions/`, `FRICTION.md`
    (1,641 lines), 183 reports (94 of them Astra reviews, 426,000 words) and three tools (`tools/*.mjs`).
- **Shape: B, mixed docs and code.** D, workflow-heavy, also fits. The handoffs, PR rituals, releases and map rules
  carry much of the risk. Both routes read `mixed-profile.md`. I took B as the riskier one, because the costliest
  drift seen is between documents and code (F3–F6). The lab is docs-first, so docs-first Steps 2, 3, 5 and 7 ran on
  it, folded in below.

## 3. Findings

**F1. Three steward decisions are held only in the overwritten `STATE.md`.**
- **The decisions:**
  - "The live install is development for now" (Justin, 7 Oct 23:05; `STATE.md:18`).
  - "Merge rights until 15 Oct" (Justin, 8 Oct 05:55: "you have merge grants for a week"; `STATE.md:19`).
  - The pause point, asked at 23:30 on 8 Oct and recorded at 23:31 in `0c28182`. Its after-rule: "backend work …
    only outside `web/src/`, restarts batched to one he approves a day" (`STATE.md:46-49`).
- **Evidence:** a search of both repositories found these only in `STATE.md` and its history.
- **Why it matters:** `STATE.md` is overwritten 17 to 61 times a day.
- **Source:** intent-pass §5.
- **Fixed:** `settled-lab.patch` copies all three to `memory/central-scope.md`, "Working rules in force", with
  their sources.

**F2. Decisions have no index, a design report's opening goes stale when it is decided, and orchestrator sessions
are not pointed at the lab's record.**
- **The pointer is incomplete.** `STATE.md:4` says "decisions in `memory/`". Decisions also live in `decisions/`, in
  design reports (the Registry, "decided by Justin on 7 Oct", sits in `reports/2026-10-07-registry-design.md`), in
  orchestrator `AGENTS.md` and in `docs/GLOSSARY.md`.
- **Cost on 10 Oct (FRICTION):** three statements in one day contradicted recorded decisions.
  - "#328 awaits approval"; it was approved on 8 Oct.
  - The env-file Scope list was offered as an option.
  - "Six Registry questions are open", because "the design file's opening paragraph had not been updated".
  - Justin: "serious failures of continuity".
- **Cost on 7 Oct (FRICTION):** "loans" were designed against the 6 Oct decisions: 35 minutes and two Astra runs.
- **Orchestrator sessions miss the lab's record.** Orchestrator `AGENTS.md:3-5` sends a fresh session to the
  README, the architecture test and the map. It names lab `memory/core-and-scopes.md` (line 71) but never lab
  `STATE.md` or the working rules. So an orchestrator session does not learn that `web/src/` is held back.
- **Fixed:** the settled lab patch gives `STATE.md` a decision-owner line.
- **Provisional:** Q1's patches add the guard pointer.

**F3. Deleted Bookwhen code is still described, ten days after it was first reported.**
- **Where:** orchestrator `AGENTS.md:141-142`: "`src/bookwhen.ts` is the only module that imports the pinned
  Bookwhen client". `README.md:76-79`: `ORCHESTRATOR_BOOKWHEN_API_TOKEN`, `@jphil/bookwhen-client@0.6.1`.
- **What the code says:**
  - `src/bookwhen.ts` was deleted on 15 Sep in `19a5561`.
  - `test/architecture.test.ts:1481-1482` asserts that no file imports the client and that `package.json` has no
    such dependency.
  - The variable is read nowhere in `src/`; only three tests stub it.
- **Reported twice already:** lab `reports/2026-10-01-design-review.md:176-178` and
  `reports/2026-10-07-refactor-review-claude.md:142`.
- **Scheduled late:** as step 19 of 19 in #328's layout plan (`reports/2026-10-08-codebase-layout-plan.md:412`).
- **Fixed:** in `settled-orchestrator.patch`.

**F4. The lists of what Iris-app launches, reaches and reads credentials from are incomplete, and the architecture
test shares their blind spot.**

What each list misses:
- **Subprocesses** (`AGENTS.md:128-132`).
  - It omits `src/adapters/browser/playwright.ts:55`, `chromium.launch`: one headless Chromium per browser session,
    since 3 Oct (`e7d6572`, #76).
  - It omits three things `orc-service.ts` also runs: `systemd-notify --ready` (:136), `systemctl --user
    reset-failed` (:165) and `node scripts/build.mjs` (:171).
- **Network** (`AGENTS.md:134-143`, "Direct network access exists only in …").
  - It omits the browser connector: Chromium to the granted hosts, plus a `node:dns` lookup of those hosts at
    `playwright.ts:520`.
  - It says the connector "searches Brave … holding Brave's key". The installation's provider is Kagi
    (`config/installation.ts:43`; `b428309`, 8 Oct).
  - It says "No model or agent reaches the ntfy transport". An approved package reaches it through the phone
    connector (`src/adapters/phone/index.ts:14`; `5aeecdc`, 2 Oct, #184; Justin: "If there's a common functionality
    then it should be shared from a central place").
  - It omits model-provider traffic through Pi, and the restart's `pnpm install`.
- **Credentials.** `README.md:108-109` says a credential "is read in exactly one place, `src/runtime.ts` … No
  subprocess Iris launches receives one". The code reads credentials in more places:
  - the web token in `src/web-cli.ts:396`;
  - environment-named connector credentials in `src/app/agent-packages.ts:795`;
  - Scope credentials from `~/.config/scopes/<scope>/credentials/`, in `src/adapters/scope-credentials.ts:41`.
  - Chromium's context is loaded with the storage-state login (`playwright.ts:57, 66-69`), so one subprocess does
    receive a credential.
- **The README's opening** (lines 5-7): "read-only external data paths are published Bookwhen events, … and public
  webpages through Jina Reader".

The test's blind spot:
- `test/architecture.test.ts:1018-1022, 1458-1476` matches `child_process`, `fetch(` and http imports in `src/`.
- It cannot see a library that launches or connects (Playwright), `node:dns`, or `fetch` passed as a value
  (`phone/index.ts:14`).
- The document and the test agree with each other, and both miss the same things.

Real size:
- Every omitted reach was authorised and reviewed when it was built (#76, #184, #296, #332, and Scope credentials
  on 28 Sep). I found no live exposure.
- The cost is in the next review. `AGENTS.md` is the brief agents read before changing reach, and
  `SECURITY-REVIEW.md` question 2 is answered against it. Concrete case: a pull request grants the browser connector
  to an agent that holds private data. The reviewer finds no browser channel in `AGENTS.md`'s network list.

Search record (mixed-profile):
- **Patterns:**
  - `child_process|\bspawn\(|\bexecFile|\bfork\(|chromium\.launch|\.launch\(|from "playwright"|process\.kill|worker_threads|new Worker\(`
  - `\bfetch\b|node:dns|node:net\b|node:http|node:https|WebSocket|EventSource|undici|createServer|listen\(`
  - `process\.env|environment\.…|_API_KEY|_TOKEN`
- **Paths:** `src/` and `config/`, `*.ts`, tests excluded.
- **Hits, with the process each runs in** (the Iris-app server process, except where noted):
  - `tools/local-files/tools.ts:276` (`git`, spawned by the tool inside an isolated child process);
  - `core/child-agent-process.ts:540`;
  - `adapters/orc-service.ts:17` and its five `run(...)` calls;
  - `adapters/browser/playwright.ts:14, 55, 90`;
  - `adapters/agent-files/package-resolution.ts:19` (a worker thread, not a process);
  - `app/operator-state.ts:58` (`process.kill(pid, 0)`, a liveness probe);
  - `adapters/public-web/connector.ts:136, 336`;
  - `adapters/notifications/ntfy.ts:85, 121`;
  - `adapters/phone/index.ts:14`;
  - `web-server.ts:158` and `web-cli.ts:340` (inbound, loopback);
  - `file-lock.ts:127` (a local socket);
  - `diagnostics.ts:14` (instrumentation, exported to local Pino);
  - credential reads at `runtime.ts:236`, `web-cli.ts:396, 581`, `app/agent-packages.ts:795` and
    `adapters/scope-credentials.ts:41`.
- **Not searched:** `web/src/`, which runs in the operator's browser; `scripts/`, the operator commands, for example
  `rehearse.ts`; Scope packages, which are outside both repositories; Pi's internals.
- **So:** the corrected lists in `settled-orchestrator.patch` are marked incomplete for packages and scripts.

**F5. The tool and card-kind lists in `AGENTS.md` are stale, and the test does not cover the production tool
surface.**
- **The parent tool list** (`AGENTS.md:25-28`) is wrong in two ways:
  - It omits `remember`, `change_memory` and `recall_memories` (`src/tools.ts:801-815`, composed by
    `web-cli.ts:542`; #350, 10 Oct).
  - It presents `list_open_fridays` as the parent's own. That tool is an approved package contribution
    (`config/installation.ts:65-71`; `runtime.ts:288-346`).
- **The test:** "exposes exactly the approved tool surface" builds the tools without operator memories, so it
  checks a different surface from the one production composes.
- **Card kinds** (`AGENTS.md:165`) names three. `src/app/own-cards.ts` declares six: Rights, Delegation and
  Spending allowance as well (`rights-card.ts:41`, `delegation-review.ts:43`, `spend-allowances.ts:39`).
- **Fixed:** the settled patch corrects the tool list and reduces the card kinds to a link to their one owner.

**F6. Several README facts are stale.**
- **The Pi pin.** "Pinned in four places … Currently on Pi Coding Agent `0.82.1`" (`README.md:189-196`).
  `package.json:68` pins `1.1.0` once; the overrides refer to it (`scripts/update-pi.mjs:8-11`; `ec75baa` and #280,
  8 Oct).
- **"Deliberately absent: … scheduling, additional external data sources, workflow execution"** (`README.md:183-185`).
  The 17 Sep durable-work decision covers scheduling and workflow execution. #332 (search) and #76 (browser) cover
  the external sources.
- **"Use".** It says search was collapsed into `read_webpage` and "may be reinstated". It was reinstated on 8 Oct
  (`65da3bd`, #296; `b428309`, #332).
- **"The model sees …"** omits the operator's memories (#350).
- **Left visibly open:** "file edits" stays in the "deliberately absent" list. The README's own "Direction" says an
  agent with memory appends to a markdown file, and no decision settles which file edits the absence means.
- **Fixed:** in the settled patch.

**F7. Tests run only by hand while merges are frequent, and pull request checks warn rather than block.**
- **CI runs no tests.** `.github/workflows/` holds `danger.yml` (description sections, changeset),
  `pr-names-issue.yml` and `release.yml`. None runs `pnpm typecheck` or `pnpm test`.
- **Failed checks only warn.** "Without GitHub Pro a failed check warns rather than blocks a merge"
  (`SECURITY-REVIEW.md:54-55`).
- **Breakage that got through:**
  - `main` was broken by comment-only changes on 7 Oct (#115, repaired by PR #215).
  - It was broken again on 10 Oct, 19:33 to 19:37 (#372, repaired by #376).
  - Four flaky tests merged on 8 Oct (FRICTION).
- **Decided, not built:** #144, re-scoped to a local gate on 8 Oct. **Open:** #180, GitHub Pro.
- **What stands in the meantime:** two rules written in prose, "merge only when it is green" and "the full suite
  runs before every merge". Agents hold merge rights until 15 Oct (F1).
- **`AGENTS.md:16`** says the workflow "refuses" a pull request. The settled patch corrects this.
- **The user-wide `~/AGENTS.md` and `~/.claude/CLAUDE.md`** use the same "refuses" wording. They are owned elsewhere,
  so I noted them and did not patch them.

**F8. `STATE.md` is often wrong in the same ways, and it has two size caps.**
- **Churn:** 414 rewrites in total, and 61 on 8 Oct alone.
- **False or estimated claims written into it (FRICTION):**
  - 12 Sep: finished work was described as missing.
  - 22 Sep: two false statements. "A state file is wrong in exactly the places nobody has had cause to re-read."
  - 8 Oct: estimated times, three times. "Three times from one cause is a missing system."
  - 10 Oct: guessed times again. "The 8 Oct lesson does not fire at the moment of writing a time."
- **Two caps:** lab `AGENTS.md:34` says "about forty content lines" (3 Sep). `STATE.md:5` says "Target: sixty lines"
  (24 Sep). The file is 62 lines. This is Q4.

**F9. `tools/map.mjs` has silently dropped its "where we are" star since 5 Oct.**
- `whereWeAre()` (`map.mjs:307-317`) reads `**Where we are now:** #N` from `STATE.md` and returns null without a
  word when the line is missing.
- `STATE.md` lost that line on 5 Oct in `e77500a`, "STATE rewritten around a direction".
- `tools/report.mjs:251` still tells the reader "★ is where we are now, from STATE.md".
- **Fixed:** `settled-lab.patch` restores the line on #328. That is what `STATE.md`'s own lines name as the work in
  progress. The patch also makes `map.mjs` say when the line is missing.

**F10. Processes declared to run on a schedule have stopped, or never started.**
- **The diary.** `tools/report.mjs`'s header says it was rebuilt on 29 Sep because "nothing ran it each day
  (orchestrator#64)". Its snapshots stop at `reports/2026-10-02.json`, and `status.html` was last committed on 2 Oct
  (`44c51f2`). Meanwhile three places describe it as current:
  - the lab README: "shows what ORC is today";
  - the lab README again: "one snapshot per day is kept";
  - `map.mjs:27`: "the diary draws it every morning".
- **FRICTION into rules (#60).** No pass since 22 Sep. `FRICTION.md` is now 1,641 lines.
- **The twelve processes** in `memory/central-scope.md:15-27` ("0 schedules so far", line 17) are decided and not built.
  They wait on the scheduler work: #182, then #166 (`reports/2026-10-10-scheduled-agent-design.md`).
- **The lab README's timing** for `report.mjs` contradicts the script's own header. Fixed in `settled-lab.patch`.

**F11. Superseded material sits beside live truth.**
- **(a) Orchestrator `OPERATOR.md`.**
  - It opens "Branch `feat/async-work-capability`, worktree `ws-async2` … Nothing is pushed." It is a 17 Sep branch
    report (`e6658c8`), with live operator content added on 1–2 Oct (ntfy, installing the phone app).
  - It was kept at the root on 8 Oct, when ten other reports were archived, because the systemd unit links it
    (`scripts/orc-service.ts:57`).
  - Justin, 8 Oct: "archive old reports text files within scope but outside project" (`470e531`).
  - The 7 Oct refactor review proposed moving its live part.
- **(b) Lab `memory/core-and-scopes.md:9`.**
  - "ORC is to be called **Core** … super-name, still unchosen (#42)". The glossary superseded this on 7 and 10 Oct.
  - FRICTION, 7 Oct, shows the cost: "I used 'Core' for the whole repository an hour after we agreed it means only
    `src/core/`."
  - Its "Still open: Finding 2" says ORC's `AGENTS.md` cites the retired architecture. That was fixed on 5 Oct in
    `5e7bef8`.
- **(c) `docs/GLOSSARY.md:152`.** "ORC: now Agent Iris, or Iris" contradicts its own line 17 (Justin, 10 Oct).
- **Fixed:** (b) and (c) in the settled patches. (a) is recommended in section 7.

**F12. Restart cards depend on local git configuration that nothing checks.**
- Since #367 (10 Oct), Iris-app learns that its checkout moved only from the hooks writing `orc-checkout-moved`
  (`orc-service.ts:106-116`; `web-cli.ts:512-516`), or at start.
- The hooks need `git config core.hooksPath .githooks` (`AGENTS.md:175`). No code checks that it is set.
- Whether the live checkout has it set is **unknown**: the snapshot has no git configuration, and reading it was out
  of bounds.
- If it is not set, pulling merged work raises no restart card until Iris-app next starts.
- Both repositories' pre-push hooks also call a script outside both,
  `$HOME/pro/local-config/scripts/push-summary`. They never block. FRICTION, 10 Oct: the summary misreported the
  push it was summarising (local-config#3).

**F13. Danger's guarded paths omit `scripts/rehearse.ts`.**
- `dangerfile.js:14-32` guards `src/`, `config/` and two scripts.
- `rehearse.ts` decides what a rehearsal of live data withholds. At `:81` it withholds
  `ORCHESTRATOR_BOOKWHEN_OPS_DIRECTORY`: "it runs operations against the live booking site".
- A change that stopped withholding it would need no Security review section.
- The rights, grants and allowance scripts only raise cards or narrow, as their headers say.
- **Recommended, not patched:** extending `GUARDED` is itself a guarded change, and an Astra-review case.

**F14. The pull request template lacks the Astra review section that Danger requires.**
- `.github/pull_request_template.md` has only "Issue" and "Security review".
- `dangerfile.js:89-110` fails every pull request that lacks a changeset or an Astra verdict.
- **Fixed:** in the settled patch.

## 4. Ranked risks (decay rate × recovery cost)

1. **Decisions that do not reach the session that needs them** (F1, F2, F11b).
   - **Decay:** fast. Decisions are taken most days, and `STATE.md` is overwritten many times a day.
   - **Recovery:** an evening of wrong design, plus reviews (7 and 10 Oct).
   - **Anchor:** `memory/` as the decision owner, with `STATE.md` pointing at it.
2. **Reach and boundary documents drifting from the code** (F3, F4, F5, F6).
   - **Decay:** fast. 181 merges a week, and #328 moving files.
   - **Recovery:** high when a security review relies on the list. The defects are known and lingering: ten days
     since the first report.
   - **Anchor:** orchestrator `AGENTS.md` "Boundaries", kept honest by `test/architecture.test.ts`.
3. **Unverified merges** (F7).
   - **Decay:** every merge.
   - **Recovery:** about an hour of a red `main` each time. Agents hold merge rights until 15 Oct.
   - **Anchor:** #144's local gate.
4. **Untrue claims in `STATE.md`** (F8, F9).
   - **Decay:** 17 to 61 rewrites a day.
   - **Recovery:** confident wrong answers to Justin, and on 8 Oct "a decision changed twice in one hour".
   - **Anchor:** times read, not estimated; one size cap.
5. **Declared processes that stop silently** (F10, F12).
   - **Decay:** slow but invisible. The diary has now stopped twice.
   - **Recovery:** low to medium.
   - **Anchor:** the scheduler work (#182, #166) and a visible "not running" state.

## 5. Truth map and loop map (docs-first Steps 2 and 3)

**Roles.**

| Role | Documents |
|---|---|
| Canonical | lab `scope.yaml`, `SCOPE.md`, `memory/*.md` (except `slots-run-walkthrough.md`), `decisions/`; orchestrator `AGENTS.md`, `docs/GLOSSARY.md`, `SECURITY-REVIEW.md`, `.changeset/README.md`; user-wide rules (not owned here) |
| Current state | lab `STATE.md`; GitHub issues on the map, orchestrator#140 |
| Logs | `FRICTION.md` (incidents and learnings); `AGENT_IDEAS.md` (ideas) |
| Local elaboration | `reports/*-design.md` (designs, some holding decisions in their opening); `memory/slots-run-walkthrough.md` |
| Product artifacts | `tools/*.mjs`; orchestrator `src/core/*.md` agent definitions; `dangerfile.js`; workflows; hooks |
| Templates | `.github/pull_request_template.md`; `.changeset/` |
| Generated projections | `status.html` and `reports/<date>.json` (`tools/report.mjs`); `CHANGELOG.md` (the release job); `src/package-api.api.md` (`pnpm api:report`) |
| Historical | `reports/archive/orchestrator/`; dated reviews and stocktakes in `reports/`; README "Use"; `OPERATOR.md` is mostly historical (F11a) |

**One home for each concept.**

| Concept | Canonical home | Also stated in | State |
|---|---|---|---|
| Purpose and direction | 25 Sep interview (`reports/2026-09-30-priorities.md:7`), the goal issues on the map | `STATE.md` "North star" (summary), orchestrator README "Direction" | consistent |
| Names | `docs/GLOSSARY.md` | `STATE.md:9-12` (summary); `memory/core-and-scopes.md` "Names" | superseded copy (F11b) |
| Core and Scopes | `memory/core-and-scopes.md` | orchestrator `AGENTS.md:71-81` (summary with link) | consistent |
| What Iris-app reaches | `AGENTS.md` "Boundaries", enforced in part by `test/architecture.test.ts` | README opening, "Credentials", "Boundary" | parallel and stale (F3–F6); settled patch makes README point at `AGENTS.md` |
| Card kinds | `src/app/own-cards.ts` | `AGENTS.md:165`; glossary "Card" (concept) | stale copy (F5); reduced to a link |
| Pi version | `package.json` | README | stale copy (F6); reduced to a link |
| PR requirements | `dangerfile.js`, `pr-names-issue.yml` | `AGENTS.md`, `SECURITY-REVIEW.md`, PR template | template incomplete (F14) |
| Decisions | by concern: `memory/`, `decisions/`, design reports, `AGENTS.md`, glossary | `STATE.md` (three held only there) | F1, F2 |
| Working rules in force | none until the settled patch (`memory/central-scope.md`) | `STATE.md` | F1 |
| `STATE.md` size | none | lab `AGENTS.md:34` and `STATE.md:5` | conflict (Q4) |
| Open work | GitHub issues on #140 | `STATE.md` "Where we are", `reports/*-issue-map-scan.md` (snapshot) | consistent |

**The loop as it runs.** I prefer this to the documented loop.
1. **A session starts** in the lab or in an orchestrator worktree under `~/worktrees`. The agent is Claude, often
   with sub-agents, or Codex or opencode. It runs `map.mjs session start` (user-wide rule).
   - **In the lab,** `AGENTS.md` sends it to `STATE.md`, then `SCOPE.md`, then the map.
   - **In the orchestrator,** `AGENTS.md` sends it to the README, the architecture test and the map. It is never
     sent to the lab's `STATE.md` (F2).
2. **Orchestrator work** goes on a branch and then a pull request. Each pull request needs:
   - Issue, Security review, Astra review and Package API sections, and a changeset (Danger);
   - an Astra review when it is complex.
   The agent merges under the merge rights, or asks Justin with a "Merge request" line. Release workflow: version,
   changelog, tag. Pull the live checkout, the hooks fire, a restart card appears, and Justin clicks it.
3. **Lab work** commits straight to `main` and pushes (`AGENTS.md:38-42`).
4. **Handoff.** `STATE.md` is overwritten at each verified event. Incidents go to `FRICTION.md`. Issues are opened
   and closed through `map.mjs`. The session ends with `map.mjs session end`. There is no coherence check at this
   point: this is where the guard goes.
5. **Where follow-up gets lost:** in decisions held only in `STATE.md` or in chat (F1, F2), in review findings
   deferred to late plan steps (F3), and in processes that stop (F10).

## 6. Guard surfaces, by whether they execute

| Surface | Status | Keep / amend / replace / demote |
|---|---|---|
| Danger (`danger.yml`, `dangerfile.js`): Security review, Package API, Astra verdict, changeset | runs by itself, on pull requests; warns, does not block (F7) | keep; amend `GUARDED` (F13) |
| `pr-names-issue.yml` | runs by itself; warns | keep |
| `release.yml` (major-bump refusal, release) | runs by itself | keep |
| `test/architecture.test.ts`, `test/core-ties.ts`, package API report test, `test/pi-version.test.ts` | runs only by hand (`pnpm test`) | keep; amend reach patterns and tool surface (F4, F5) |
| `tools/map.mjs --check`, `session start/end` | runs only by hand | keep; amended for the star (F9) |
| `tools/report.mjs` diary | runs only by hand; declared daily, last run 2 Oct | decided, not built as a schedule (F10) |
| `.githooks/pre-push` (both) | unknown: depends on `core.hooksPath`; reminder only | keep |
| `.githooks` checkout-moved hooks | unknown (F12); operational, not a guard | keep; check at session end |
| `SECURITY-REVIEW.md` checklist, `astra-review` skill | runs only by hand; Danger checks a section exists | keep |
| PR template | reminder | amend (F14) |
| #144 local test gate | decided, not built | link (F7) |
| #180 GitHub Pro (required checks) | open decision | link (F7) |
| #60 FRICTION into rules; #209 Scope check; the twelve processes | decided, not built | link (F10) |
| Session-end entropy guard | decided, not built (`memory/central-scope.md:26`) | create: `guard/SKILL.md` |
| `STATE.md` rules ("Keeping state") | prose | amend: one cap (Q4) |

## 7. Recommendations and one-time cleanup

Each item below was checked against the current file at the snapshot commit.
- **Move the live parts of `OPERATOR.md`** (ntfy settings, the phone app, the series commands) into the README's
  "Run" section. Archive the rest to the lab's `reports/archive/orchestrator/`. Point `scripts/orc-service.ts:57`'s
  `Documentation=` at the README. This is covered by Justin's 8 Oct instruction (F11a). Not patched, because it
  edits a script and moves a file.
- **Extend `test/architecture.test.ts` so the test and the corrected `AGENTS.md` lists stay one contract:**
  - treat `from "playwright"` and `node:dns` as reach, and `fetch` passed as a value;
  - build the tool-surface test with operator memories (F4, F5).
  This is part of #328's step 19; a session doing it before then should file it under #328.
- **Add `scripts/rehearse.ts` to `GUARDED` in `dangerfile.js`** (F13). This needs an Astra review, because the
  change touches a guard.
- **Make the diary's absence visible** until #182 or #166 schedule it. The `status.html` banner could show the date
  it was built (F10). Not patched.
- **Run one FRICTION decomposition pass under #60** (F10).
- **Make the cap single (Q4).** Then trim `STATE.md` to it. After the settled patch it is 67 lines.

**The state-file update** (docs-first Step 5) is `settled-lab.patch`, `STATE.md` hunk:
- a decision-owner line;
- the working rules linked to their new durable record;
- the "where we are now" line restored;
- the entropy-guard questions listed;
- a dated "Misleading nearby" line.

Live facts are untouched. I did not re-read `running.json`, so the line "Live Iris-app runs `68541dc`" keeps its
original source and time.

## 8. Guard decision and the generator's inputs

**Guard decision: `create`.** No session-coherence guard exists in either repository. Justin decided "entropy guard
at session end" as one of the lab's processes (`memory/central-scope.md:26`). The loop runs many sessions a day
across two repositories, and four of the five top risks are drift a session can catch at its end. Where the guard
lives is open (Q1), so the guard is delivered as `guard/SKILL.md`. The patches that install and point at it are
provisional.

Generator inputs:
- **Steward:** Justin. **Intent documents:** see section 1. **Decision surface:** `memory/` (by concern), with
  "Waiting" for proposals. **Open intent questions:** Q1–Q4.
- **Current-state file:** lab `STATE.md`. The session that changes what it says refreshes it (`AGENTS.md`,
  "Keeping state").
- **Rules bound but not owned:** user-wide `~/AGENTS.md` and `~/.claude/CLAUDE.md` (prior art, referents, merge
  requests, PRs name issues, sessions end with fewer issues, spending through Iris-app's permissions, live-service
  reporting); orchestrator `SECURITY-REVIEW.md`, "Astra review", "Versions"; `astra-review` skill.
- **Verification commands:**
  - **Run only by hand:** `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report`, `node tools/map.mjs
    --check`, `map.mjs session end`.
  - **Run by themselves:** Danger, pr-names-issue and release, on pull requests and merges.
  - **Installed:** `grep`, `gh`, `wt`, `node` and `pnpm`.
  - **Not installed** (checked with `command -v`): lychee, ast-grep, Semgrep, ctxlint and agnix. `rg` exists only as
    a Claude Code shell function.
- **Code areas and the docs that describe them:**
  - orchestrator `src/`, `config/` → `AGENTS.md` "Boundaries" and "Approval cards", README;
  - `scripts/` → README "Run", "As a service", `AGENTS.md` "Security review";
  - `.githooks/` and `.github/` → `AGENTS.md`, `SECURITY-REVIEW.md`;
  - lab `tools/` → lab README.
- **Live state a session can change:**
  - the live checkout and its pull → the restart card → `orc.service`;
  - the live checkout's `core.hooksPath`;
  - cards and grants, decided by Justin;
  - spending through allowance cards;
  - ntfy;
  - the lab's pushed `main`.
- **Findings:** F1–F14.

Guard built: `guard/SKILL.md`.
- **Size:** 1,217 words.
- **Budget:** 1,261 words, the sum of four terms:
  - the common contract, 724;
  - nine repo-specific checks at 36 words each, 324;
  - pointers, 98;
  - commands, 115: the 54-word command block plus the 61-word paragraph for finding the starting commit in each
    repository.
- Within budget.

## 9. Patches, and the check against findings and questions

The settled patches (apply first):
- **`settled-orchestrator.patch`** changes `AGENTS.md` (F3, F4, F5, F7), `README.md` (F3, F4, F6), `GLOSSARY.md`
  (F11c), the PR template (F14), and adds an empty changeset.
- **`settled-lab.patch`** changes `STATE.md` (F1, F2, F9, F10, F11), `memory/central-scope.md` (F1; questions
  recorded), `memory/core-and-scopes.md` (F11b), `tools/map.mjs` (F9) and `README.md` (F10).

The provisional patches, not to be applied until Justin answers the named question:
- `provisional-Q1-guard-home-lab.patch` and `provisional-Q1-guard-home-orchestrator.patch`, on Q1;
- `provisional-Q2-pace-lab.patch` and `provisional-Q2-pace-orchestrator.patch`, on Q2;
- `provisional-Q4-state-size-lab.patch`, on Q4.

Q3 needs no patch; the guard keeps it visible.

How they were checked:
- All patches apply to the snapshot in that order (`git apply`, on scratch copies), and `map.mjs` passes
  `node --check`.
- No settled hunk edits "Target: sixty lines", the Pace or Working Style lines, or any line naming the guard's home.
- New prose in settled hunks says "Iris-app", which fits either reading of Q3.
- **The tool list:** every settled hunk that restates it now lists what F5 found missing.
- **The subprocess, network and credential lists:** every hunk that restates them adds what F4 found missing, and
  says the list does not cover Scope packages or scripts.
- `STATE.md` changes about forty times a day, so its hunk will need re-basing by hand on the current file. The
  claims it adds are listed above.

## 10. Uncertainties

- **Not read:**
  - GitHub (no web): the map issue #140 and its rules, the state of #144, #180 and #328, and branch protection;
  - the live working trees and their git configuration, so `core.hooksPath` is unknown (F12);
  - `running.json`;
  - Scope packages (Moving Stillness, finance), so the reach lists stay incomplete;
  - `~/pro/agentic/HOW_NOT_TO_PLAN.md` (Q2);
  - local-config's `push-summary`.
- **Read in part:** about 25 of the 183 lab reports, and `FRICTION.md` from its newest entries back to 6 Oct plus two
  older entries.
- **Whether each agent loads `AGENTS.md`:** Claude Code loaded `AGENTS.md` files in this run. Codex, opencode and
  Iris-app's own agents were not checked. The lab's `CLAUDE.md` is a symlink to its `AGENTS.md`.
- **My reading:** the "where we are now" line names #328 because `STATE.md`'s own lines name it as the backend work
  after the pause. Justin may mark a different issue.
