# Entropy assessment: ORC and the orchestration lab, as one system

Run 2026-10-07 with entropy-guard's `entropy-assessment` (v0.8.0). The targets are read-only snapshots, taken on
2026-10-04 (ORC files dated 14:44, lab files 17:31), with no `.git`. No steward was available.

Abbreviations used below:
- **ORC** is the orchestrator repository (`orchestrator/`);
- **the lab** is the Scope repository that manages ORC's work (`scope-orchestration-lab/`);
- `F<n>` is a finding in the one findings list below, and `Q<n>` is a question for the steward in `questions.md`.

**Route taken.** Step 1 ran the intent pass. Step 2 classified the system as shape B, mixed docs and code, across two
repositories. B routes to `mixed-profile.md`, and because the lab is docs-first, docs-first Steps 2, 3 and 5 also ran on
it. The results are folded into this one assessment. Step 3 decided a guard is needed, and Step 4 handed on to
`session-coherence-skill-generator`, then `guards-integrator`.

**Mode.** The runtime is read-only, and the generator's default for a cross-repo change is discuss-first. Where those
differ, the stricter wins, so this run worked in plan mode:
- nothing in either repository was edited;
- the state-file update and the doc corrections are applicable patches in `patches/`;
- the guard is a provisional draft (`guard/SKILL.md`), not placed in either repository.

---

## 1. Intent

**Steward: Justin.** Evidence: `scope.yaml:6` (`steward: justin`), and ORC `README.md:3` ("Justin's local-first personal
agent").

### Authorised intent, with the source of each part

Each part below records where it was found, what kind of statement it is, its evidence of authority and its date.

| # | Statement | Where | Kind | Authority |
|---|---|---|---|---|
| A1 | Lab purpose: "Develop and operate Justin's local orchestration platform and its reusable Scope-owned agents." | lab `scope.yaml:5`, `SCOPE.md:5-7` | description in the formal inventory | steward named in the same file; undated |
| A2 | The lab is the central Scope for project management, core issue tracking, code quality and security. It also covers where issues live, the processes kept, scheduling (#166) first, and Astra running this assessment. | lab `STATE.md:38-54` | decision | "Decided by Justin, 4 Oct afternoon (interview)" |
| A3 | ORC as his "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; once the six slots work, "work towards a point of consolidation". | lab `STATE.md:9-11` | decision | Justin, 2026-09-25 and 2026-09-26 |
| A4 | Core ships with no specific Scope, model, owner or agent. | ORC `AGENTS.md:31-37` | directive | Justin, 2026-09-12 and 2026-09-13, quoted |
| A5 | ORC owns a general async work capability, including schedules and recurrence. | lab `decisions/2026-09-17-async-work-architecture.md` | decision | "Decided by Justin on 2026-09-17" |
| A6 | Map of work orchestrator#140 is the reference point for all work. | ORC `AGENTS.md:9-12`; lab `AGENTS.md:7-8` | directive | Justin, 2 Oct 2026 |
| A7 | Claude merges a PR once review and tests pass. | lab `STATE.md:17` | decision | Justin, 2026-09-25 |
| A8 | Security reviews are checked on GitHub by Danger. | ORC `dangerfile.js:7`; lab `STATE.md:79` | decision | Justin, 2026-10-02, "B" |
| A9 | Approval cards are drawn from fixed blocks, one declared arrangement per kind. | ORC `AGENTS.md:116-128` | directive | "The operator, 2026-09-26" |
| A10 | Authority rules, step 1. | lab `memory/authority-rules-step-1.md` | decision | Justin, 1 Oct 2026, 22:05 |
| A11 | No agent holds the lethal trifecta; standing grants only on `grantable` work, at most seven days. | ORC `AGENTS.md:67-91` | directive | undated, unattributed; sources in #20 |
| A12 | Pace: one scored real use before new design. Documentation stays concise and retrospective. | lab `AGENTS.md:25-29`; ORC `README.md:22-23`, `AGENTS.md:153-155` | directive | unattributed |

**Rules owned elsewhere, and not read in this run** (they sit outside the two targets):
- `~/pro/local-config/home/AGENTS.md` (cited at `STATE.md:16`);
- `~/pro/agentic/HOW_NOT_TO_PLAN.md`;
- `~/pro/agentic/agentic-architecture/MODEL.md`;
- `~/pro/scope/docs/MODEL.md`;
- the rules in orchestrator#140's description.

### Declared, enacted and authorised

- **Declared:** ORC's `README.md` and the `src/cli.ts` help describe a read-only, Bookwhen-reading agent without
  scheduling or workflow execution.
- **Enacted:** `STATE.md`, `FRICTION.md` and the code show more than that:
  - durable work with approval cards, grants and recurrence;
  - Bookwhen writes through the Moving Stillness package;
  - phone notices;
  - invoicing;
  - package API versioning;
  - resolve-before-acting.
- **Authorised:** A5, A11 (grants and cards), A3 and A2 cover what was enacted. In what was read, the enacted work
  matches the authorised intent. The declared intent is what lags, so the gaps below are stale descriptions, not
  drift.

### Gaps, by condition

| Condition | Gap | Response |
|---|---|---|
| Stale description | ORC `README.md` and `AGENTS.md` contradict A4 and A5 (F4), and `AGENTS.md`'s subprocess list (F5). The lab's `SCOPE.md` purpose contradicts A2 (F10). | Corrected from those decisions, citing them, in `patches/`. Not asked. |
| Conflict | The `STATE.md` cap is "about forty content lines" (lab `AGENTS.md:34`) or "sixty lines" (`STATE.md:4`). No decision says which (F3). | Q2 |
| Missing | A durable record for A2, A3 and A7, which live only in the overwritten `STATE.md` (F1). | Copied to `decisions/` in `patches/`. Recording them is not deciding them again. |
| Missing | A home for the session-end guard that A2 keeps, across two repositories (F11). | Q1 |
| Ambiguous | `SCOPE.md:19`, "Facts about ORC belong in its repository": does a session report about ORC count as such a fact? Diverging case: `REWORK.md` sits at ORC's root, while `reports/2026-09-17-async-review-conflation.md` covers the same work and sits in the lab (F6). | Q3 |
| Ambiguous | "A resource joined or left this Scope: `scope.yaml`" (lab `AGENTS.md:19`), after A2 widened the lab's role. Three lists name the repositories the lab oversees (F10). | Q4 |
| Unauthorised drift | None found in what was read. | — |
| Prose control | Rules written as if enforced that nothing enforces (findings in brackets): <br>• "tests pass" as the merge condition (A7), and "`pnpm test` … enforces the boundaries" (F7); <br>• "`--check` fails when an open issue is outside it" (F8); <br>• "Never … build ORC's `dist` by hand", which `pnpm test:e2e` breaks (F13); <br>• "a new grantable type should not be declared without one" (`AGENTS.md:88-90`), which is already acknowledged and tracked as #74. | Enforcement points are in Ranked risks and `integration.md`. |

**Questions:** four, in `questions.md`, each with a recommended answer. Work that depends on them is drafted as
provisional.

**Proposed changes, and where they were recorded:**
- widening `scope.yaml`'s `purpose` and naming the overseen repositories once: recorded as "awaiting Justin" in the
  proposed `decisions/2026-10-04-lab-role-and-processes.md`;
- nothing else in this run changes intent.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active, for both.** Evidence:
  - `scope.yaml:7` and `:14` say `status: active`;
  - `STATE.md` records three ORC restarts and two merges on 4 Oct.
  - The archived `status-tracker` project (`scope.yaml:22-30`) is reference-only and was not assessed.
- **Shape: B, mixed docs and code, across two repositories, assessed as one system.**
  - ORC is code-first (`src/`, 1,322-line architecture test). It also has a meaningful docs surface: 15 Markdown files
    at its root, 3,783 lines.
  - The lab is docs-first: `STATE.md`, `decisions/`, `FRICTION.md`, 68 Markdown reports and three Node tools that
    read GitHub and ORC.
  - D (workflow-heavy) also fits, since processes, cards, reviews and a map carry much of the state. B and D take the
    same route, and B is the riskier label because code and docs drift against each other here (F4, F5, F9).
- **Repositories:** ORC (`~/pro/orchestrator`, `justinphilpott/orchestrator`) and the lab
  (`~/scopes/scope-orchestration-lab`). The lab's tools also read four more repositories (`tools/collect.mjs:19-26`);
  those were out of scope.

---

## 3. Findings

One list. Every other section, and the other output files, refer to these ids.

**F1. Steward decisions are held only in the overwritten `STATE.md`.** High.
- Evidence: the decisions sit at `STATE.md:38-54` (4 Oct interview), `:9-11` (25 and 26 Sep direction), `:17` (25 Sep
  merge rule), `:33` (MS paused) and `:57-58` (3 Oct decisions).
- `AGENTS.md:33` says `STATE.md` "is overwritten at each verified event".
- `decisions/` holds one file (17 Sep). A search of the lab found the 4 Oct decisions and the merge rule nowhere else.
  `reports/2026-09-30-priorities.md:7` quotes the direction only.
- Source: intent pass §5 and mixed-profile "Docs against docs". Fix: `patches/lab-decisions-and-state.patch` copies
  them to two new `decisions/` files.

**F2. `STATE.md` contradicts itself about live facts.** High.
- The running ORC build is stated three ways: `:58` "ORC live: 369628b since 22:12:47", `:88` "started 2026-10-03
  22:12:47 on 369628b", and `:35` "#195 live (8cee662, restarted 14:48:27, verified)". `:56` (a power-cut restart on
  4 Oct) also contradicts "since 22:12:47".
- `:23` says "#193 … in review, not merged", and `:31` says "#193 is live".
- `:91` says Moving Stillness `main` is `c759f96`, and `:32` says MS #53 merged as `fc830aa`.
- `:94` says grant `e9675bd9` "covers the test entry until 1 Oct 18:00Z", stated as current in a file updated 4 Oct.
- The same failure has happened before: `FRICTION.md:864` (12 Sep), `:590ff` (22 Sep, "two false statements") and
  `:287` (29 Sep, "told Justin ORC had restarted when it had not").
- Source: mixed-profile "Docs against docs"; docs-first "State dishonesty".

**F3. `STATE.md` breaks its own rules and has two caps.** High.
- Lab `AGENTS.md:34` says "about forty content lines"; `STATE.md:4` says "Target: sixty lines".
- The file has 99 lines, 87 of them non-empty, and 1,246 words.
- `STATE.md:4` says "Overwrite … do not append", but `:31-36` is an appended chain of dated "live" events.
- Measured: the rewrite in `patches/` holds everything not recorded elsewhere in 37 content lines.
- Source: docs-first "Workflow drift"; intent pass "Conflict" (Q2).

**F4. ORC's README describes ORC as it was on 13 Sep, contradicting later steward decisions.** Medium-high.
- `README.md:152-154` lists "scheduling" and "workflow execution" as deliberately absent. Against it: A5, plus
  `src/app/async/engine.ts` (recurrence), `calendar.ts` and the `list:async-series` script.
- `README.md:5-7` gives ORC's "read-only external data paths" as Bookwhen and Jina only.
- `README.md:76-79` describes the `ORCHESTRATOR_BOOKWHEN_API_TOKEN` variable and the `@jphil/bookwhen-client@0.6.1`
  package:
  - grep finds no reader of the variable in `src/`, `scripts/` or `config/`;
  - the package is not in `package.json`;
  - `test/architecture.test.ts:1312-1313` asserts the package is absent.
- `README.md:146-147` says the Moving Stillness specialist plans a slot change "without applying it". Against it:
  `memory/slots-run-walkthrough.md`, whose run of 28 Sep added six slots.
- `AGENTS.md:102-103` names `src/bookwhen.ts`. The file is absent, and A4 and the test forbid it.
- `src/cli.ts:33-36` says "No … scheduling … workflow engine". It may describe only the terminal adapter, which is
  unverified.
- Found three times before and still unfixed on 4 Oct:
  - `reports/2026-09-29-backlog-inventory.md:212`;
  - `reports/2026-10-01-design-review.md:174-177`;
  - `reports/2026-10-01-review-synthesis.md:43`.
- Source: mixed-profile "Docs against implementation"; intent pass "Stale description". Fix:
  `patches/orc-docs-corrections.patch`.

**F5. ORC's `AGENTS.md` understates subprocess access.** Medium.
- `AGENTS.md:92-96` names three modules.
- `test/architecture.test.ts:828-835` allows four. The fourth is `src/adapters/orc-service.ts` (orchestrator#101),
  whose header lists git reads, a frozen-lockfile pnpm install, the `dist.next` build and a `systemctl` restart.
- A security description that is behind the code. Fix: in the same patch, citing #101.

**F6. Twelve one-off session reports sit at ORC's root, beside the canonical docs.** Medium.
- The twelve are `CLASSIFY`, `FIXES`, `GRANTS-E2E`, `GRANTS`, `MCP`, `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`,
  `SLICE1`, `TURN-RECORD` and `VISIBILITY`: 3,267 lines.
- None is linked from `README.md` or `AGENTS.md`.
- Several name files that are gone:
  - `src/adapters/browser/service.ts`, in `GRANTS.md`, `SLICE1.md` and `CLASSIFY.md`;
  - `mcp.ts`;
  - `src/core/policies.ts`, in `POLICY-STORE.md`.
- `REWORK.md:3` says "Nothing committed, nothing pushed".
- Only `MCP.md:3-5` carries a history banner.
- `OPERATOR.md`, a session report, is the systemd unit's `Documentation=` link (`scripts/orc-service.ts:41`).
- Reports about ORC work also live in the lab's `reports/` (68 files). `FIXES.md` cites a lab report as
  `reports/…`.
- Existing proposal: `reports/2026-10-01-design-review.md:254-256` (recommendation 4).
- Source: docs-first "Superseded material nearby"; mixed-profile "two homes" (Q3).

**F7. Tests run only by hand, while the merge rule and the README treat them as a control.** High.
- `.github/workflows/danger.yml:31` runs only `danger ci`.
- `README.md:135` says "`pnpm test` includes `test/architecture.test.ts`, which enforces the boundaries".
- A7 makes merging conditional on "tests pass".
- `FRICTION.md` (27 Sep): "ORC's end-to-end suite had failed on `main` for a week, unnoticed … nothing runs the E2E
  suite before a merge."
- The 4 Oct decision keeps "tests on every PR (#144)" (`STATE.md:45`); how it runs is still open (`:69`).
- Source: mixed-profile "Rules against enforcement" and "Workflow against reality". Connected to #144.

**F8. The lab's map check passes when it should fail.** Medium.
- Lab `AGENTS.md:10` says `node tools/map.mjs --check` "fails when an open issue is outside it".
- `reports/2026-10-04-labels-review-astra.md:9-13`, confirmed by Claude on 4 Oct, found two false passes:
  - a failed repository read becomes an empty list;
  - `collect.mjs` lists 6 repositories while the map spans 9.
- `map.mjs:240` exits 1 only on `outside.length`.
- The "label check", one of the kept processes, has no implementation ("`--check` … never validates labels").
- Source: mixed-profile "Rules against enforcement". Connected to the labels review.

**F9. The lab's tools read ORC's internals with no contract, and reimplement ORC's agent discovery.** Medium.
- `collect.mjs:16` hard-codes `~/.local/share/orchestrator-proof`. ORC's default is `~/.local/share/orchestrator`
  (`src/runtime.ts:190`); the running ORC takes `orchestrator-proof` from its environment file (`FRICTION.md:361-362`).
- `collect.mjs:123-133` queries ORC's SQLite tables `events` and `tasks`, and their columns, directly. They match
  `src/adapters/async-store/sqlite.ts:52-77` today.
- `collect.mjs:164-189` finds agents by walking `src/core/*.md` and `~/scopes/*/agents` with a regex. ORC's own
  discovery reads `ORCHESTRATOR_SCOPE_DIRECTORIES` instead (`src/agent-discovery.ts:17`).
- This already broke once (`collect.mjs:6-7`).
- No ORC test covers these reads.
- Source: mixed-profile "two implementations across repositories". Connected to design-review recommendation 5 and
  ORC #62.

**F10. The lab's declared role and its list of repositories lag A2.** Medium.
- `SCOPE.md:5-7` and `scope.yaml:5` give the narrower purpose.
- Three lists name the repositories the lab oversees:
  - `scope.yaml:10-31`, with 2 projects;
  - `collect.mjs:19-26`, with 6 repositories ("Finance joined on 2026-10-02");
  - the map, with 9 (labels review).
- Lab `AGENTS.md:19` makes `scope.yaml` the place a joining resource is recorded.
- Source: intent pass "Stale description" (`SCOPE.md`, corrected in the patch); docs-first "Parallel truth" (Q4).

**F11. The decided session-end entropy guard does not exist.** Medium.
- `STATE.md:49` keeps it as a process.
- A grep for "entropy" finds it only in `STATE.md` and one report.
- The lab's `skills/` holds only `.gitkeep`.
- Source: mixed-profile "declared, but missing". This run drafts it (`guard/SKILL.md`; placement is Q1).

**F12. The kept processes run only by hand, and the daily diary has lapsed before.** Medium-low.
- The diary's snapshots in `reports/` stop at 2026-10-02, though `STATE.md` changed on 4 Oct.
- `tools/report.mjs:12-13` says its predecessor "stopped because nothing ran it each day (orchestrator#64)".
- The labels review calls it "the nightly diary", so whether something outside these repositories runs it is unknown.
- Under A2, the scheduled processes wait on #166.
- Source: mixed-profile "Workflow against reality".

**F13. Running `pnpm test:e2e` in the live checkout rebuilds the web client the running ORC serves.** Medium.
- `package.json` defines `test:e2e` as `vite build --config web/vite.config.ts && playwright test`.
- `web/vite.config.ts:33-34` writes to `../dist/web` with `emptyOutDir: true`.
- The running ORC serves `dist/web` (`src/web-cli.ts:478-479`).
- `AGENTS.md:136` says "Never stop, start or build ORC's `dist` by hand"; `scripts/build.mjs:7-8` says "`dist` is never
  emptied under it".
- Concrete case:
  - after a merge, `AGENTS.md:136` says to pull the checkout and stop;
  - an agent then verifies the merge with `pnpm test:e2e` in `~/pro/orchestrator`;
  - the running server now serves a client built from the pulled commit, before Justin's restart card approved that
    build.
- Source: mixed-profile "Rules against enforcement"; live operational state.

**F14. `FRICTION.md` breaks its "Newest first" rule at its tail.** Low.
- `FRICTION.md:3` says "Newest first".
- The entries at `:1153-1365` run from 11 Sep to 19 Sep in ascending order, after the 3 Sep entry.

**F15. The lab's `README.md` gives timings for the diary that contradict the tool.** Low.
- `README.md:16-17` says a run with tests takes about 10 s.
- `tools/report.mjs:9-10` says about two minutes with tests, and about ten seconds without.

**F16. The architecture test that checks Danger's guarded list misses two of its paths.** Low.
- `dangerfile.js:18` and `:13` guard `^AGENTS\.md$` and `^config\/`.
- `test/architecture.test.ts:723-740` does not require either.
- A change removing them from the list would still need a security section, because `dangerfile.js` is itself
  guarded.

**F17. The 17 Sep decision record carries a field that was later split, unmarked.** Low.
- It still lists `idempotency: natural | keyed | none`.
- ORC `FIXES.md:13` records commit `79a33ef` splitting it into `repeatEffect` and `submissionKey`.
- Who decided the split is not recorded in either repository.

**F18. A session that starts in ORC never meets the lab's state file or decisions.** Medium.
- ORC's `AGENTS.md` and `README.md` link orchestrator#140 but not the lab, `STATE.md`, `FRICTION.md` or `decisions/`.
- The lab has a `CLAUDE.md` link to `AGENTS.md`; ORC has none, so whether Claude Code sessions in ORC load
  `AGENTS.md` is unknown.
- Source: docs-first Step 3, the real loop.

---

## 4. Truth map

Which document owns which truth. This is docs-first Step 2, applied to the lab and to ORC's docs.

| Concept | Canonical home | Also stated in | Verdict |
|---|---|---|---|
| What the lab is for | lab `SCOPE.md`, `scope.yaml` | `STATE.md` (A2) | Lags A2 (F10). |
| What ORC is for | A3, only in `STATE.md` | `reports/2026-09-30-priorities.md`; ORC `README.md` "Direction" | No durable home (F1). |
| Justin's decisions | lab `decisions/`; `memory/` for authority rules | `STATE.md` (only copy of most); `dangerfile.js` header; ORC `AGENTS.md` quotes | Scattered, and partly volatile (F1). |
| Current state, next steps | lab `STATE.md` | GitHub issues and Project 4 | Dishonest and over its cap (F2, F3). |
| Which ORC build runs | live: `pnpm service:status` | `STATE.md`, three ways | F2. |
| Map of work and its rules | orchestrator#140 | both `AGENTS.md` files link it; `map.mjs` holds the number once | Sound. The check overstates (F8). |
| Security boundaries | ORC `AGENTS.md` (prose) and `test/architecture.test.ts` (enforced) | `README.md` "Boundary" | Prose lags the test (F4, F5). |
| Security review procedure | ORC `SECURITY-REVIEW.md`; `dangerfile.js` enforces its presence | `AGENTS.md`, PR template | Sound: a test reads Danger's list (minor gap, F16). |
| Package API | `src/package-api.ts`, its `.api.md` report, `ORC_PACKAGE_API_VERSION` | `AGENTS.md` | Sound since #201. |
| Durable work design | lab `decisions/2026-09-17…` | ORC `REWORK.md`, `SEAM.md`, `FIXES.md` (history) | Decision partly superseded (F17). |
| ORC's state directory | ORC's environment file plus `src/runtime.ts` | lab `collect.mjs:16` | Two homes (F9). |
| Agent discovery | ORC `src/agent-discovery.ts` | lab `collect.mjs` `agents()` | Two implementations (F9). |
| Repositories the lab oversees | none agreed | `scope.yaml`, `collect.mjs`, the map | Three lists (F10). |
| Reports about ORC work | none agreed | ORC root (12), lab `reports/` (68) | Two homes (F6). |
| Learnings | lab `FRICTION.md`, per lab `AGENTS.md` "Where a learning goes" | — | Order drift only (F14). |

What kind of document each is (docs-first roles):
- **Canonical:**
  - lab: `SCOPE.md`, `scope.yaml`, `AGENTS.md`, `decisions/`, `memory/authority-rules-step-1.md`;
  - ORC: `README.md`, `AGENTS.md`, `SECURITY-REVIEW.md`, `test/architecture.test.ts`, `test/core-ties.ts`.
- **Current state:** lab `STATE.md`.
- **Product artifact:**
  - lab `tools/*.mjs`, whose map root, Project and repository list are contracts;
  - ORC `src/core/*.md` agent definitions, the PR template and `dangerfile.js`.
- **Generated:** lab `status.html` and `reports/*.json`.
- **Local elaboration:**
  - ORC `GRANTS.md`, `VISIBILITY.md` and `TURN-RECORD.md`, which describe mechanisms, partly current;
  - lab `memory/slots-run-walkthrough.md`.
- **Historical:**
  - ORC `REWORK.md`, `SEAM.md`, `OPERATOR.md`, `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`, `GRANTS-E2E.md`,
    `CLASSIFY.md`, and `MCP.md` (bannered);
  - lab `reports/*.md`, `research/`, `AGENT_IDEAS.md` (ideas, "not approved designs").
- **Empty scaffolding:** lab `skills/`, `workflows/`.

## 5. Loop map

This is docs-first Step 3, preferring the real loop over the documented one.

- **A session starts in the lab** with `AGENTS.md`, also loaded as `CLAUDE.md`. That sends it to `STATE.md` ("read
  it again after any compaction"), then `SCOPE.md`, then #140 (`node tools/map.mjs`). It marks its work with
  `map.mjs working`.
- **A session starts in ORC** with `AGENTS.md`, which sends it to `README.md`, `test/architecture.test.ts` and #140.
  It does not reach the lab (F18).
- **Work is tracked** in GitHub issues under #140 and in Project 4. "Where we are now" is in `STATE.md`.
- **Decisions are captured** in practice as "Decided by Justin" lines in `STATE.md` (F1). Occasionally they get a
  `decisions/` file, a `memory/` file, a code header or a quote in `AGENTS.md`.
- **Learnings are captured** in `FRICTION.md` and in review reports in `reports/`.
- **Handoffs happen at these points:**
  - ORC changes go by PR, with Danger's security and package-API sections. Claude merges once review and tests pass
    (A7), then pulls the live checkout. ORC raises a restart card, Justin approves it, and the agent checks the
    process start time.
  - `STATE.md` is rewritten at each verified event. In practice it is appended to (F3).
  - Work stops on branches after 22:00 (`STATE.md:18`).
- **Where follow-up gets lost:**
  - decisions left in `STATE.md` (F1);
  - review recommendations waiting for "your word" (F4, found three times);
  - processes kept but not scheduled (F12).

## 6. Ranked risks

Ranked by decay rate times recovery cost.

1. **The state file is not honest (F2, F3).**
   - Decay: every verified event, at least six on 4 Oct.
   - Recovery: high. Three recorded incidents of wrong statements to Justin about live services, each costing an
     evening.
   - Symptoms: three different answers for one running build; an expired grant stated as current.
   - Anchor: lab `AGENTS.md` "Keeping state", and `pnpm service:status` for the live fact.
2. **Decisions live in the file that is overwritten (F1).**
   - Decay: the next overwrite.
   - Recovery: high. Only git history of `STATE.md` holds the decisions, which is invisible to a fresh session, or
     Justin has to be asked again.
   - Anchor: lab `decisions/`.
3. **Tests run by hand while the merge rule depends on them (F7, F13).**
   - Decay: every merge.
   - Recovery: high. The E2E suite was red for a week; the architecture tests hold the security boundaries; a careless
     `test:e2e` changes what the live service serves.
   - Anchor: #144, and `README.md` "Verify".
4. **ORC's canonical docs and root reports describe an older ORC (F4, F5, F6, F18).**
   - Decay: every ORC change. The README was untouched for 142 commits by 30 Sep, per the design review.
   - Recovery: medium. Found three times, never fixed, and agents learn wrong facts from them. A dead tool name copied
     from agent text is recorded in `FRICTION.md` on 27 Sep.
   - Anchor: ORC `README.md`, `AGENTS.md` and the architecture test.
5. **The lab's tools couple to ORC internals and see part of the system (F9, F8, F10).**
   - Decay: any change to ORC's storage or discovery, or a repository joining.
   - Recovery: medium. Silent false passes and an empty diary section. It broke once already.
   - Anchor: ORC #62 and design-review recommendation 5; the labels review.

## 7. Guard surfaces, by whether they execute

**Runs by itself:**
- **Danger on every ORC PR** (`.github/workflows/danger.yml`, `dangerfile.js`): it asks for the security-review and
  package-API sections. Recorded as proven on GitHub on 2 Oct (`STATE.md:81`), which is an old observation. It does
  not check direct pushes to `main` (`AGENTS.md:142-143`).
- **ORC's own operational cards:** "Restart ORC onto <commit>" and the package-build approval cards (`README.md:123-129`,
  `AGENTS.md:134`). These guard live state, not docs.

**Runs only by hand:**
- **ORC checks:**
  - `pnpm typecheck`;
  - `pnpm test`, which includes the architecture test, the core-ties ratchet, TSDoc headers, the tool surface, the
    subprocess and network confinement, Danger's guarded list and the package-API report;
  - `pnpm test:e2e`;
  - `pnpm api:report`;
  - `pnpm pi:check`.
- **Lab checks:**
  - `node tools/map.mjs --check` (overstated, F8);
  - `node tools/report.mjs` (F12).
- **Reviews and records:**
  - `SECURITY-REVIEW.md`, whose presence Danger checks;
  - Astra reviews;
  - `FRICTION.md` entries.

**Decided, not built:**
- tests on every PR (#144);
- ORC scheduling (#166), and through it the daily diary, the weekly adversarial review, FRICTION into rules (#60),
  branch and worktree cleanup (#70) and `/tmp` cleanup (#182);
- the label check (the labels proposal);
- binding approvals to builds (#137);
- independent-read outcome checks for grantable types (#74).

**Declared, but missing:**
- the session-end entropy guard (F11);
- the `STATE.md` cap (F3);
- the map check's promise (F8);
- "tests pass" as a merge condition (F7).

**Unknown:**
- whether either clone sets `core.hooksPath` to `.githooks`. There is no `.git` in the snapshot, and both pre-push hooks
  only print a summary anyway;
- whether GitHub branch protection makes Danger blocking;
- whether something outside these repositories runs the diary;
- whether Claude Code sessions in ORC load `AGENTS.md` (F18).

## 8. Recommendations

**Consolidate:**
- Justin's decisions go into lab `decisions/`, and `STATE.md` links to them (F1, patch).
- One `STATE.md` cap, defined in one place (Q2).
- One list of the repositories the lab oversees (Q4).
- The lab's tools read ORC through what ORC declares, not its files (F9; existing work ORC #62).

**Demote or mark historical:**
- Add a history banner, like `MCP.md`'s, to the 11 ORC root reports that lack one (F6). That is not structural.
- Moving or deleting the reports waits on Q3 and Justin's yes. Design-review recommendation 4 already proposes moving
  their facts, then deleting them.
- Note on the 17 Sep decision that `idempotency` was later split, once who decided the split is known (F17).

**One-time cleanup, each item checked against the current file:**
1. Apply `patches/lab-decisions-and-state.patch` to the lab (F1, F2, F3, and F10 for `SCOPE.md`). It dry-runs
   cleanly against the snapshot.
2. Apply `patches/orc-docs-corrections.patch` to ORC through a PR (F4, F5). It dry-runs cleanly. `AGENTS.md` is a
   guarded path, so the PR needs a `## Security review` section, such as "No new authority; documentation corrected
   to match the code and `test/architecture.test.ts`".
3. Copy Justin's 3 Oct decisions to orchestrator#194 and scope-moving-stillness#52, then drop that line from
   `STATE.md`.
4. File the four map follow-ups listed in the patched `STATE.md` as issues under #140, then drop that line.
5. Check whether the "Milestone boundary" text in `src/cli.ts:33-36` still describes the terminal adapter, and correct
   it if not (F4). This is a guarded path.
6. Add `^AGENTS\.md$` and `^config\/` to the patterns the architecture test requires from `dangerfile.js` (F16).
7. Put `FRICTION.md`'s 11–19 Sep entries in date order (F14), and correct the lab README's timings (F15).

## 9. The state-file update

Docs-first Step 5 asks for an update of the lab's existing `STATE.md`. It is in `patches/lab-decisions-and-state.patch`:
- 37 content lines, down from 87;
- one statement per live fact, each with its date and a note that it was not re-read in this run;
- links to `decisions/` for everything settled;
- the intent pass's questions listed under "Waiting on Justin";
- a "Misleading nearby" section;
- two next actions.

Nothing in it settles Q1–Q4. It points to `AGENTS.md` for the cap instead of stating a number.

## 10. Is a guard needed, and what next

**Yes:** the system is active, A2 keeps a session-end entropy guard, and none exists (F11). There is no existing guard
to refine, so one is built through `session-coherence-skill-generator`. Its inputs were this section 1, sections 3–7,
and the risks in section 6.
- **Generated:** `guard/SKILL.md`. It is provisional, because its home is Q1.
- **Integration:** `integration.md`.
- **Next step for the steward:** answer Q1–Q4 (`questions.md`), then apply the two patches.

## 11. Uncertainties, and what was not covered

- **Not read:**
  - the rule files outside the targets (section 1);
  - GitHub (issues, PRs, #140's description, branch protection, Danger's runs);
  - git history, so enacted intent comes from `STATE.md`, `FRICTION.md` and the reports;
  - the live service, so no live fact here was re-read, and all are as recorded on or before 4 Oct;
  - the Moving Stillness, Bookwhen ops, Scope model and Finance repositories that the lab's tools span.
- **Read only in part:**
  - about 12 of the 68 lab reports;
  - about a quarter of `FRICTION.md`;
  - `src/` only at the points the docs make claims about;
  - none of `web/src` beyond its build path.
- **Not tested:** the ORC test suites were not run, so claims about what they enforce come from reading the tests.
- **Evidence in conflict:** whether the daily diary runs nightly (F12). Whether the running ORC's environment still
  sets `orchestrator-proof` (F9) rests on `FRICTION.md` of 28 Sep.
- **Proposals, not decisions:** the patches, the guard, the integration plan and every recommended answer in
  `questions.md`.

## 12. The generator's report

This is `session-coherence-skill-generator`'s output, run in plan mode.

**Inputs supplied:**
- the steward, intent documents and decision surface, from section 1;
- the open questions Q1–Q4;
- the current-state file and who refreshes it: the lab's `STATE.md`, rewritten by the agent at each verified event;
- the rules the system is bound by but does not own, from section 1;
- the verification commands, of which only Danger runs by itself (section 7);
- the code areas and the docs and tests that describe them (section 4);
- the live state a session can change: the ORC service and its build, restart and package cards, grants, durable work
  and the Bookwhen site through Moving Stillness;
- findings F1–F18.

No input was missing. No secret value was read.

**The guard:** `guard/SKILL.md`, the default name `session-coherence-guard`.
- Size: 874 words, with J = 12 checks.
- Budget: 450 + 36 × 12 + S (58 words of pointers) + C (36 words of commands) = about 976 words, so it is within budget.

**Checked before handing over:**
- **Against the open questions:**
  - the guard reports the `STATE.md` count against both caps rather than choosing one (Q2);
  - it asks before a root report is added rather than choosing a home (Q3);
  - it checks that the map read every repository without naming the list (Q4);
  - its placement is left to Q1.
  - The two patches settle none of Q1–Q4: `STATE.md` points to `AGENTS.md` for the cap and lists the questions as
    open.
- **Against authorised intent:** each repair instruction rests on a recorded rule. The worktree-only `test:e2e` rests
  on ORC `AGENTS.md:136`; "dated events go to git and issues" rests on lab `AGENTS.md:33-36`.

**Doc references added:** none, because this is plan mode.

**Files build mode would change:**
- **Lab:**
  - `skills/session-coherence-guard/SKILL.md` (new, per Q1);
  - `AGENTS.md` (one pointer line);
  - `STATE.md`;
  - `SCOPE.md`;
  - `decisions/2026-10-04-lab-role-and-processes.md` (new);
  - `decisions/2026-09-25-orc-direction-and-merging.md` (new).
- **ORC:**
  - `README.md`;
  - `AGENTS.md` (the corrections and one pointer line).

**Validation run:**
- both patches dry-run cleanly with `patch -p1 --dry-run` against copies of the snapshot files;
- no added line has trailing whitespace, which is the check `git diff --check` makes;
- after the ORC patch, a grep finds no `src/bookwhen.ts`, `ORCHESTRATOR_BOOKWHEN_API_TOKEN` or `bookwhen-client@` in
  `README.md` or `AGENTS.md`.

**Handoff:** to `guards-integrator`, with the brief in `integration.md`.
