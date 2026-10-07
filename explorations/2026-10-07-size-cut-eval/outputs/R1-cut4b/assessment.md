# Entropy assessment: ORC and the orchestration lab, as one system

- **Assessed:** 2026-10-07, from read-only snapshots taken 2026-10-04 (no `.git` in either).
  - `orchestrator/` — ORC, the TypeScript orchestration system (called "ORC" below).
  - `scope-orchestration-lab/` — the Scope that manages ORC's work (called "the lab" below).
- **Skill route:** `entropy-assessment` → intent pass → shape B, mixed docs and code (`mixed-profile.md`) → docs-first
  Steps 2, 3 and 5 on the lab, folded in here → `session-coherence-skill-generator` (plan mode) → `guards-integrator`.
- **Mode:** plan / suggest-only. The targets are read-only and no steward is present, so every change is delivered as
  a patch or a draft in this folder, and nothing that needs a new decision is implemented.
- **Files in this folder:** this assessment; `questions.md`; `guard/SKILL.md`; `generator-report.md`;
  `integration.md`; three patches (`decision-records.patch`, `state-update.patch`, `doc-corrections.patch`);
  `feedback.md`; `read-log.md`.

## 1. Intent

### Steward

**Justin.** `scope.yaml` line 6 (`steward: justin`), line 36–37 (`members: justin, role admin`); ORC `README.md` line 3
("Justin's local-first personal agent"). Steward decisions across both repositories are quoted as "Justin, <date>".
The steward is named; this is not a finding.

### Statements gathered

Kind: decision/directive, description, observation, inference. Authority: attributed and dated, one of the two, or
neither.

| Where | Kind | Authority | Says |
|---|---|---|---|
| lab `STATE.md` 8–11 | decision | attributed, dated (Justin 2026-09-25, 09-26) | North star: ORC is his "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; once the six slots work, "work towards a point of consolidation". |
| lab `STATE.md` 38–55 | decisions | attributed, dated (Justin, 4 Oct, interview) | The lab is the central Scope for project management, core issue tracking, code quality and security; where issues live; nine processes kept; ORC scheduling (#166) built first; Astra runs this assessment; labels wait. |
| lab `STATE.md` 17–19, 33, 56–58, 76–82 | decisions | attributed, dated | Claude merges once review and tests pass (09-25); MS paused (4 Oct); 3 Oct decisions (#194, MS failure-verdicts, MS #52); Worktrunk / gh poi (2 Oct "yes"); Danger (2 Oct "B"). |
| lab `decisions/2026-09-17-async-work-architecture.md` 1–30, 54–57, 114–116, 132–134 | decision | attributed, dated (Justin 2026-09-17) | ORC owns a general async work capability, schedule `now`/`at`/`recurring`, per-agent facades, approvals; SCP archived. |
| lab `memory/authority-rules-step-1.md` 3–29 | decisions + open items | attributed, dated (Justin, 1 Oct 22:05) | Rules 1, 2 (amended), 4, 5 affirmed; rules 3, 6, chat handling, Iris's role open. |
| lab `scope.yaml` 5–7; `SCOPE.md` 5–7, 17–24 | description | steward named, undated | Purpose: develop and operate ORC and its reusable Scope-owned agents. |
| lab `AGENTS.md` 7–10, 33–36 | directive | 7–10 attributed and dated (Justin, 2 Oct); 33–36 neither | Map of work is orchestrator#140; `STATE.md` holds current state only, capped "about forty content lines". |
| lab `AGENTS.md` 19 | directive | neither | "A resource joined or left this Scope → `scope.yaml`, then one line in `SCOPE.md`". |
| ORC `AGENTS.md` 9–12, 30–45 | directive | attributed, dated (Justin 2 Oct; 2026-09-12, 09-13) | Map #140; core ships with no Scope, model, owner or agent; Bookwhen connector belongs to the Scope. |
| ORC `AGENTS.md` 68–112 | directive | neither (cites #20, #67, #74) | Lethal trifecta; enforced controls; standing grants; subprocess and network lists; "Any new authority requires an explicit human choice". |
| ORC `AGENTS.md` 114–128 | directive | attributed, dated (operator, 2026-09-26) | Approval cards from a fixed set of blocks. |
| ORC `AGENTS.md` 154–155; `README.md` 22–23 | directive | neither | Documentation is concise and retrospective: "record only what the implementation and real use established". |
| ORC `README.md` 9–23, 138–154 | description, with one directive (152–154) | neither | Direction (Iris, ADA, Scopes); boundary ("wide eyes, narrow hands"); "Deliberately absent, and each requires a decision rather than a convenience: reminders, scheduling, additional external data sources, workflow execution, sandboxes, shell access, and file edits." |
| ORC `src/adapters/browser/playwright.ts` 9–11 | decision (code header) | dated, not attributed | Browser moves to Playwright's library, "orchestrator#76, decided 3 Oct 2026". |
| ORC `dangerfile.js` 7 | decision (code header) | attributed, dated (Justin, 2026-10-02: "B") | Danger replaces the pre-push trailer check. |

### Three readings

- **Declared** (ORC `README.md`): a local-first personal agent with read-only external data paths, narrow hands, and
  a list of things deliberately absent until decided.
- **Enacted** (from `STATE.md`, `FRICTION.md` and the code; git history was not available): durable work with
  approval cards and standing grants; recurring schedules in the async engine; an agent driving a browser that writes
  to Bookwhen; phone notices through ntfy, including from Scope packages; invoicing through a Finance Scope; a
  systemd service restarted by card.
- **Authorised** (steward's recorded words): the async capability including scheduling and the Bookwhen apply
  (2026-09-17 decision); the north star (09-25, 09-26); the 4 Oct process decisions; core free of Scope ties
  (09-12, 09-13). Most of the enacted work traces to one of these. Two pieces do not trace in the snapshot (F9, F10).

### Gaps by condition

| Condition | Gap | Findings |
|---|---|---|
| Stale description | ORC `README.md` 152–154 lists "scheduling" as deliberately absent; the 2026-09-17 decision makes scheduling part of ORC. Corrected in `doc-corrections.patch`, citing the decision. No question is asked about it. | F10 |
| Stale description (code, not intent) | ORC `README.md` 76–79 and `AGENTS.md` 47, 92–104 describe modules, settings and scan roots the code no longer has, or omit ones it has. Fixed as usual in `doc-corrections.patch`. | F6, F7 |
| Ambiguous | The other six items of the "Deliberately absent" list, against memory appends, the Finance outbox, the browser and phone notices. Readings and a concrete case are in Q1. | F10 |
| Ambiguous, settled for the part that matters | "Work towards a point of consolidation" (09-26) could mean "stop adding capabilities" or "consolidate the architecture while continuing". The later 4 Oct decision to build scheduling first settles that new capability work continues; no question. | — |
| Unauthorised drift (candidate) | Scope packages send phone notices through ORC's ntfy sender; ORC `AGENTS.md` 100 says no model or agent reaches it. No decision in the snapshot covers the change. Q2. | F9 |
| Conflict | `STATE.md`'s size cap: "about forty content lines" (lab `AGENTS.md` 34) against "Target: sixty lines" (`STATE.md` 4). Q4. | F2 |
| Missing | Where the system's session-end guard lives. "Entropy guard at session end" is a kept process with nothing behind it in either repository. Q3. | F16 |
| Prose control | `STATE.md` cap and "do not append"; ORC `AGENTS.md` 88–90 (grantable types need an independent read, #74); 142–143 (direct pushes to `main` are not checked). | F2, F19 |
| Repair path for drift | Lab `AGENTS.md` 19 keeps two copies in step; ORC `AGENTS.md` 154–155 would rewrite intent from the code. | F11, F12 |
| Steward decisions in an overwritten file | Copied to the lab's `decisions/` in `decision-records.patch`. Recording them is not deciding them again. | F4 |

### Questions

Four, in `questions.md`, each with a recommended answer. Work that depends on them is drafted as provisional. Steward
questions already open and not re-asked: #144 (how tests run on every PR), #196 (where agent worktrees live), #166
(scheduling), #198 (connector names), #74 (independent read for grantable types).

### Proposed changes, and where recorded

Recorded as awaiting Justin in a new file in the lab's existing decision folder,
`decisions/2026-10-07-proposed-intent-changes.md` (in `decision-records.patch`): P1 (Q1), P2 (Q2), P3 (Q4), P4 (F11),
P5 (F12). No intent document is changed by any patch except the one word "scheduling", which the 2026-09-17 decision
settles.

## 2. Lifecycle, shape and repositories

- **Lifecycle: active, both repositories.** Evidence: `scope.yaml` lines 7 and 14 (`status: active`); `STATE.md`
  updated 2026-10-04 17:31 with five ORC restarts recorded that day; `FRICTION.md`'s newest entry is 2026-10-04;
  daily snapshots in `reports/` run to 2026-10-02. Active status allows the full route.
- **Shape: B, mixed docs and code, with D (workflow-heavy) also fitting.** Taking B as the riskiest, because the
  costliest drift found sits between ORC's code and the documents that describe its boundaries (F6–F10).
  - ORC: 111 TypeScript source modules in `src/`, a React client in `web/src/`, 70 test files (62 in `test/`, 8 in `web/src/`) and an E2E suite, beside 15
    root markdown documents including the agent rules in `AGENTS.md`.
  - The lab: docs-first. `STATE.md`, `FRICTION.md` (1,402 lines), `decisions/`, `memory/`, 78 report files (68 in markdown) and three
    small tools. It manages ORC's work rather than holding its code, so docs-first Steps 2, 3 and 5 were run on it
    (sections 4 and 5 below).
  - D fits too: the main surfaces of the lab are handoffs (`STATE.md`), the issue map, PR checks, restart cards and
    adversarial reviews. Route B and D are the same profile.
- **Repositories: assessed as one system.** ORC is the code; the lab holds state, learnings, decisions about ORC, and
  the map tooling. Both point at the same map of work (orchestrator#140).

## 3. Domains, ownership and seams

**Domains present and actively changed:** code; documentation; tests (unit, architecture ratchets, E2E); contracts
(the package API report `src/package-api.api.md`, Scope package manifests, task-type declarations); workflow (issue
map, Danger, restart cards, Astra reviews, `STATE.md`); live operational state (`orc.service` on athena, the durable
work database and grants under `~/.local/share/orchestrator-proof`, Bookwhen through Moving Stillness, the ntfy topic,
credentials, GitHub Project marks).

**Who owns what:**

| Concept | Owner | Also stated in |
|---|---|---|
| What agents can reach (boundaries) | ORC `AGENTS.md`, enforced in part by `test/architecture.test.ts` | ORC `README.md` Boundary; `SECURITY-REVIEW.md` |
| Async work design | lab `decisions/2026-09-17-…` | ORC code; ORC root reports REWORK, SEAM, OPERATOR, FIXES |
| Current state | lab `STATE.md` | `status.html` (generated) |
| Open work | GitHub issues under orchestrator#140 | `STATE.md`; `reports/2026-10-04-issue-map-overview.md` (dated) |
| Learnings and failures | lab `FRICTION.md` | `reports/2026-09-30-learnings-digest.md` |
| Steward decisions | scattered: `STATE.md`, `decisions/`, code headers, `AGENTS.md` quotes, `memory/`, issues | — (F4) |
| Resource inventory | lab `scope.yaml` | `SCOPE.md` Projects (F11) |
| User-wide working rules | `~/pro/local-config/home/AGENTS.md` (outside the snapshot) | `STATE.md` "How we work" |

**Concepts with two homes** (the costliest seams): steward decisions in `STATE.md` and `decisions/` (F4); host
connector setting names in ORC and in each package manifest, and ORC's state directory in two places (F14); the
resource list in `scope.yaml` and `SCOPE.md` (F11).

## 4. Truth map and loop map (docs-first Steps 2 and 3, on the lab and the documents ORC carries)

**Document roles:**

- **Canonical:** ORC `AGENTS.md`, `README.md`, `SECURITY-REVIEW.md`; lab `scope.yaml`, `SCOPE.md`, `AGENTS.md`,
  `decisions/`, `FRICTION.md`.
- **Current state:** lab `STATE.md`.
- **Local elaboration:** lab `memory/*.md`; ORC `GRANTS.md`, `MCP.md`, `TURN-RECORD.md`, `VISIBILITY.md`.
- **Product artifacts** (names and paths are contracts): ORC `src/core/*.md` agent definitions; `dangerfile.js`;
  `.github/pull_request_template.md`; `src/package-api.api.md`.
- **Generated:** lab `status.html`, `reports/<date>.json`.
- **Historical:** lab `reports/*.md` (dated); ORC root REWORK, SEAM, OPERATOR, FIXES, SLICE1, POLICY-STORE,
  GRANTS-E2E, CLASSIFY (branch-era, unmarked: F13); `memory/slots-run-walkthrough.md` (dated 28 Sep, partly
  superseded: F18).

**The real loop** (from `AGENTS.md` in both repositories, `STATE.md`, `FRICTION.md`; git history was not available):

1. A session (Claude, Codex, opencode or Astra) loads the user-wide rules, then the repository's `AGENTS.md`.
2. It reads lab `STATE.md` first, and again after compaction, then the map (orchestrator#140, `node tools/map.mjs`).
3. It marks its issue (`node tools/map.mjs working '<ref>' --agent Claude`) and works on a branch, usually in a
   worktree under `/tmp` (#196 open).
4. Tests and typecheck run by hand. Nothing runs them on the pull request (F5).
5. Pull request; Danger checks the `## Security review` and `## Package API` sections on GitHub.
6. Astra reviews substantial work (`reports/*-astra.md`); Claude merges once review and tests pass.
7. The ORC checkout is pulled; ORC raises "Restart ORC onto <commit>"; Justin approves; the restart is verified by
   start time, `build.json` and health.
8. `STATE.md` is overwritten; failures go to `FRICTION.md`; the mark is cleared with `stopped`.

**Where follow-up gets lost:** decisions taken in conversation land in `STATE.md` and are overwritten (F4); live
facts in `STATE.md` go stale between restarts (F1); "entropy guard at session end" has no entry point (F16); the
daily diary and map check wait for scheduling (F17).

## 5. Findings

One list. Every other section and file refers to these ids.

- **F1. `STATE.md` contradicts itself on live facts.** Lines 58 and 88 say ORC runs `369628b` since 2026-10-03
  22:12:47; lines 31–36 record four later restarts on 4 Oct, the last onto `8cee662` at 14:48:27. Line 23 says #193
  is "built and in review, not merged"; line 31 says "#193 is live: #200 merged as `3989cdb`". Line 91 gives Moving
  Stillness `main` as `c759f96`; line 32 records MS #53 merged as `fc830aa`. Lines 93–94 say grant `e9675bd9`
  "covers the test entry until 1 Oct 18:00Z" in a file updated 4 Oct. Source: lab `STATE.md`.
- **F2. `STATE.md` breaks its own rules, and its cap is stated twice, differently.** 87 non-blank lines (99 in all),
  against "about forty content lines" (lab `AGENTS.md` 34) and "Target: sixty lines" (`STATE.md` 4). It holds
  history despite "Current state only… do not append" (`STATE.md` 3–4): lines 76–94 carry 2 and 3 Oct items, such as
  "Phone (closed 3 Oct)". Nothing checks either rule.
- **F3. This is the third time from one cause.** `FRICTION.md` 866–869 (12 Sep: `STATE.md` described finished work as
  missing) and 621–626 (22 Sep: two false statements, "a state file is wrong in exactly the places nobody has had
  cause to re-read"). Three occurrences from one cause: nothing checks `STATE.md`'s consistency at the moment it is
  overwritten. This is a **missing system**, not an instance.
- **F4. Steward decisions live only in the file that is overwritten by design.** `STATE.md` 8–11 (north star), 17–19
  (merge rule), 33 (MS paused), 38–55 (the 4 Oct interview), 56–58 (3 Oct), 76–78 (git cleanup). In the snapshot the
  4 Oct decisions appear nowhere else; the north star appears elsewhere only in prepared reports
  (`reports/2026-09-30-priorities.md` 7, `reports/2026-10-01-reviews-claude.md` 20). The lab's `decisions/` holds one
  file. Lab `AGENTS.md` 33: `STATE.md` "is overwritten at each verified event". GitHub issues were not read, so some
  may also be recorded there.
- **F5. No tests run by themselves before or after a merge.** The only workflow, `.github/workflows/danger.yml`, runs
  Danger (line 31) and nothing else. `pnpm typecheck`, `pnpm test` (the architecture, core-tie and package-API report
  tests) and `pnpm test:e2e` run only by hand. `FRICTION.md` 396–400 (27 Sep): the E2E suite failed on `main` for a
  week unnoticed, "because nothing runs the E2E suite before a merge". `STATE.md` 46 lists "tests on every PR (#144)"
  among processes kept (Justin, 4 Oct); line 69 still lists its mechanism as waiting on Justin.
- **F6. ORC's documents name a Bookwhen client and setting the code does not have.** `README.md` 76–79
  (`ORCHESTRATOR_BOOKWHEN_API_TOKEN`, "exact-pinned `@jphil/bookwhen-client@0.6.1`") and `AGENTS.md` 102–103
  ("`src/bookwhen.ts` is the only module that imports the pinned Bookwhen client"). `src/bookwhen.ts` does not exist;
  no file in `src/`, `scripts/` or `config/` reads `ORCHESTRATOR_BOOKWHEN_API_TOKEN`; `test/architecture.test.ts`
  1315–1316 asserts no file imports the client and `package.json` does not depend on it. The move is authorised by
  `AGENTS.md` 41 ("Domain code, such as a Bookwhen connector, belongs to the Scope that needs it").
- **F7. ORC `AGENTS.md`'s lists of subprocess and network access miss members the code has.** Searched for every
  member of each kind (`child_process`, `StdioClientTransport`, `fetch`, `chromium.launch`, `from "playwright"`):
  - Subprocess (lines 92–96) names three modules; `test/architecture.test.ts` 828–835 approves four, adding
    `src/adapters/orc-service.ts` (git reads, a frozen-lockfile `pnpm install`, the build, one `systemctl` restart).
    `src/adapters/browser/playwright.ts` 54–55 also launches headless Chromium through Playwright's library.
  - Network (lines 98–104) names `src/core/research-tools.ts` and `src/adapters/notifications/ntfy.ts` only; the
    Chromium that `playwright.ts` launches reaches the hosts a browser grant approves (orchestrator#76, 3 Oct).
  - Line 47 says the core-tie ratchet covers `src/` and `web/src/`; `test/core-ties.ts` 8 scans `config/`, `src/` and
    `web/src/`, with allowances for `config/installation.ts`.
- **F8. The architecture test does not see the browser.** "Limits core network I/O to the approved modules"
  (`test/architecture.test.ts` 1295–1312) matches `fetch`, WebSocket and Node http/net imports; "confines subprocess
  access" (828–830) matches `child_process`. Neither matches `chromium.launch`, so a second Chromium launcher anywhere
  in `src/` would pass both. `README.md` 135 says `pnpm test` "enforces the boundaries below". Enforcement is
  partial; the prose does not say so.
- **F9. Scope packages reach the ntfy sender; `AGENTS.md` says no agent does.** `AGENTS.md` 100–102: "No model or
  agent reaches the ntfy transport, and it sends only a title, the notice's summary and the one configured tap
  address." `src/adapters/phone/index.ts` 1–8: a built-in phone connector that packages declare
  (`{ "factory": "phone" }`), first used 2 Oct by a Scope agent that pings its operator, sending through ORC's ntfy
  sender (#184). Each package's connectors are approved on its build card (`AGENTS.md` 134), which may be the
  "explicit human choice" of line 110, but no steward decision in the snapshot says so. Q2.
- **F10. README's "Deliberately absent" list against decisions and code.** `README.md` 152–154.
  - "Scheduling" is stale: lab `decisions/2026-09-17-async-work-architecture.md` (Decision 1; `schedule: now, at, or
    recurring`, line 54) and the code (`src/core/async/types.ts` 65, 337; `src/app/async/engine.ts` 189).
  - The other items are ambiguous. "File edits" against README 21–22 itself (an agent "reads and appends to a markdown
    file in its Scope") and the Finance outbox (`config/installation.ts` 161–163). "Additional external data sources"
    against the browser and phone connector. "Workflow execution" against `src/workflows/daily-summary/` and durable
    work. "Reminders" against recurring tasks. Q1.
  - README 3–7 describes Bookwhen paths as ORC's own; they now come from a Scope package (`src/runtime.ts` 259–260),
    and the browser write path is not mentioned. This touches Q1 and is left unchanged.
- **F11. A standing instruction keeps two copies in step.** Lab `AGENTS.md` 19: "A resource joined or left this Scope
  | `scope.yaml`, then one line in `SCOPE.md`". `SCOPE.md` 9–15 restates `scope.yaml`'s projects; `SCOPE.md` 23 calls
  `scope.yaml` the formal inventory. Proposal P4.
- **F12. The documentation rule can rewrite intent from what was built.** ORC `AGENTS.md` 154–155, "record only what
  the implementation and real use established" (also `README.md` 22–23). Applied to README's Direction and Boundary,
  or to `AGENTS.md`'s Boundaries, it directs rewriting intent to match the code. F10 is the case where it would fire.
  Small. Proposal P5.
- **F13. Branch-era reports sit at ORC's root, unmarked.** `REWORK.md` 3 ("Nothing committed, nothing pushed"),
  `SEAM.md` 12 and `OPERATOR.md` 12 ("Nothing is pushed"), plus `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`,
  `GRANTS-E2E.md`, `CLASSIFY.md`. Between them they name seven files that no longer exist:
  - `src/adapters/browser/mcp.ts`, `src/adapters/browser/service.ts`, `src/core/ports/browser.ts`;
  - `src/core/policies.ts`, `src/adapters/async-store/store.ts`;
  - `test/browser-service.test.ts`, `test/async-store.test.ts`.

  `README.md` links none of them. `MCP.md` 3–5 carries the banner the others lack, though its "Retired
  implementation" (40–44) lists `src/adapters/browser/playwright.ts` as deleted, and that file is live again.
  `GRANTS.md` 14–15 still says the job "needs a source edit to `config/installation.ts` and a restart".
- **F14. Cross-repository concepts with two homes, recorded by the system itself.**
  - Host connector setting names are defined in ORC and again in each package manifest, with no test across the two.
    `FRICTION.md` 63–68 (3 Oct): Moving Stillness unavailable for about an hour; orchestrator#198 open.
  - ORC's state directory: the code default `~/.local/share/orchestrator` (`src/runtime.ts` 189) against the
    service's `~/.local/share/orchestrator-proof` (`FRICTION.md` 654–661; #62). The second is copied into lab
    `tools/collect.mjs` 16 and `memory/slots-run-walkthrough.md` 80, 87.
  - Tool names in agent text against package manifests (`FRICTION.md` 414–420; MS #25).
- **F15. `FRICTION.md` says "Newest first" (line 3), but lines 1153–1402 hold 11–19 Sep entries in ascending order
  after the 3 Sep entry.** A reader who stops at 3 Sep misses them. Low.
- **F16. "Entropy guard at session end" is a kept process with nothing behind it in either repository.**
  `STATE.md` 49. The lab's `skills/` holds only `.gitkeep`; neither repository has a session-end guard. One may live
  outside the snapshot. Q3.
- **F17. Most kept processes wait for scheduling.** `STATE.md` 43–53: the daily diary, weekly adversarial review,
  map check, FRICTION into rules (#60) and cleanups (#70, #182) are to run through ORC scheduling (#166). Today
  `node tools/map.mjs --check` and `node tools/report.mjs` run only by hand. `tools/report.mjs` 12–13 records that the
  earlier overview "stopped because nothing ran it each day (orchestrator#64)".
- **F18. `memory/slots-run-walkthrough.md` (28 Sep) traces the browser through Playwright MCP,** naming
  `src/adapters/browser/service.ts` and `mcp.ts`, both gone since #76. It is dated and honest, but it sits in
  `memory/`, which agents read as current. Low.
- **F19. Prose controls, honestly labelled.** ORC `AGENTS.md` 88–90: "ORC does not yet require a grantable task type
  to judge its outcome by an independent read (#74)… a new grantable type should not be declared without one."
  Enforcement would sit in task-type validation (`src/core/async/types.ts`). Lines 142–143: "a direct push to `main`
  is not checked"; whether branch protection requires the Danger check is not visible.
- **F20. Neither pre-push hook is a control, and whether they run is unknown.** Both `.githooks/pre-push` files only
  print `push-summary` and exit 0. The snapshot has no `.git`, so `core.hooksPath` cannot be read.

## 6. Ranked risks (decay rate × recovery cost)

1. **The state file misleads, and decisions live in it** (F1–F4). Decays daily: five restarts were recorded on 4 Oct
   alone. Recovery is costly: confident wrong answers to the steward, and decisions lost when the file is overwritten.
   Third occurrence from one cause (F3). Anchor: lab `AGENTS.md` "Keeping state", and `decisions/`.
2. **Merges reach a live service unverified** (F5, F17). Decays at every merge. A restart card deploys whatever
   merged, and Moving Stillness writes to a live Bookwhen site. Anchor: #144.
3. **Boundary documents drift from the code they describe** (F6–F10, F12). Decays with each capability; three arrived
   in the week before the snapshot (the browser, phone notices, invoicing). Recovery is costly because
   `SECURITY-REVIEW.md` and Danger send reviewers to these documents to judge what an agent can reach. Anchor: ORC
   `AGENTS.md` Boundaries, with `test/architecture.test.ts`.
4. **Concepts with two homes across repositories** (F14). Decays at each rename; silent unavailability when it does.
   Anchor: #198, #62.
5. **Superseded material beside live truth** (F11, F13, F15, F18). Decays slowly; an agent can revive a deleted
   module's design. Anchor: `MCP.md`'s banner as the pattern.

## 7. Existing guard surfaces, by whether they execute

- **Runs by itself:** Danger on GitHub for every pull request (`.github/workflows/danger.yml`, `dangerfile.js`). It
  requires a `## Security review` section for guarded paths, and a `## Package API` section when the API report
  changes.
- **Runs only by hand:**
  - ORC: `pnpm typecheck`; `pnpm test` (architecture boundaries, core-tie ratchet, package-API report,
    cause-discard allowances); `pnpm test:e2e`; `pnpm api:report`; `pnpm service:status`; `SECURITY-REVIEW.md`.
  - Lab: `node tools/map.mjs --check`; `node tools/report.mjs`.
  - Both: Astra reviews; the `STATE.md` overwrite rule; `FRICTION.md`'s instance / missing-system classification.
- **Decided, not built:** #144 (tests on every PR); #166 (scheduling, for the kept processes); #198 (connector-name
  test); #74 (independent read for grantable types); #137 (approvals bound to builds); #202 (packages tested against
  ORC's real parts).
- **Declared, but missing:** "entropy guard at session end" (F16); the `STATE.md` size cap (F2); lab `AGENTS.md`
  40–42, "commit each newly recorded idea immediately".
- **Unknown:** whether either pre-push hook is enabled (F20); whether branch protection requires Danger (F19); any
  guard kept outside the snapshot, for example in local-config.

**Mechanical checks belong to tools.** Dead paths and links in documents (F6, F13, F18) suit a link checker such as
lychee, or ast-grep for identifiers. The browser gap (F8) belongs in `test/architecture.test.ts`. Neither tool was
checked as installed, so the guard does not depend on them.

## 8. Recommendations and one-time cleanup

Each item was checked against the current file.

- **Record the decisions first.** `decision-records.patch` adds `decisions/2026-10-04-steward-decisions-from-state.md`
  (F4) and `decisions/2026-10-07-proposed-intent-changes.md` (P1–P5).
- **Bring `STATE.md` up to date** (docs-first Step 5). `state-update.patch`: 43 non-blank lines, 36 without
  headings, so it meets either cap without choosing one (Q4). It removes the contradictions in F1, moves history out, links decisions instead of
  holding them, and keeps each live fact as recorded with its time, never refreshed. It must be applied after
  `decision-records.patch`.
- **Correct ORC's documents.** `doc-corrections.patch`: F6, F7, and "scheduling" from F10. It touches `AGENTS.md`, a
  Danger-guarded path, so its pull request needs a `## Security review` section ("No new authority; the documents now
  name modules that already exist").
- **Add the browser to the architecture test** (F8). Confine `from "playwright"` imports to
  `src/adapters/browser/playwright.ts`, so the test sees every launcher. ORC work, not patched here.
- **Mark the eight ORC root reports historical** (F13), with a banner like `MCP.md`'s. Moving them into a folder is a
  structural change and waits for Justin.
- **Put `FRICTION.md` 1153–1402 in date order** (F15). **Add a dated "superseded by #76" line** to
  `memory/slots-run-walkthrough.md` (F18).
- **Close the test gap through #144** (F5). Recommended: a GitHub Actions job beside Danger running
  `pnpm typecheck` and `pnpm test`, required on `main`, because Danger already moved review checks to GitHub
  (Justin, 2 Oct, "B"). This is Justin's open question on #144, not decided here.

## 9. Is a guard needed? (Step 3)

**Yes: build a new one.** The system is active; "entropy guard at session end" is a process Justin kept on 4 Oct
(F16); and the top risks are judgment checks at the moment a session ends: state honesty, decisions recorded, and
boundary documents matching the code. No guard exists in either repository to refine. Where it lives waits on Q3;
drafted provisionally at the lab's `skills/session-coherence-guard/SKILL.md` (`guard/SKILL.md` here).

## 10. Handover to the generator (Step 4)

Given to `session-coherence-skill-generator`: section 1 (intent), sections 3–5 (analysis and findings), section 6
(ranked risks), section 7 (guard surfaces). Its report is `generator-report.md`; the integration brief is
`integration.md`.

## 11. Next step

Justin answers Q1–Q4 (`questions.md`). The patches do not wait for the answers, since none changes the text a
question is about. In the lab, apply `decision-records.patch` and then `state-update.patch`. In ORC, apply
`doc-corrections.patch` through a pull request. The guard is placed as `integration.md` says once Q3 is answered.

## 12. Uncertainties and what was not covered

- **No git history** in either snapshot. Enacted intent was read from `STATE.md`, `FRICTION.md` and the code, not from
  commits. Hook configuration and branch protection could not be read.
- **GitHub was not read**: issue #140's rules, and whether decisions in F4 are also recorded on their issues.
- **Outside the snapshot, not read:** `~/pro/local-config/home/AGENTS.md` (the user-wide rules `STATE.md` 16 cites),
  `~/pro/scope/docs/MODEL.md`, `~/pro/agentic/HOW_NOT_TO_PLAN.md`, `~/pro/agentic/agentic-architecture/MODEL.md`, and
  the Moving Stillness and Finance repositories. Rules owned there were not checked against the work.
- **Not read in full:** about 60 of the lab's 68 markdown reports (titles, and the ones cited above); `FRICTION.md`
  beyond the entries cited; `AGENT_IDEAS.md` beyond its head; ORC's `web/src/` and most of `src/` (searched, not
  read).
- **Live state:** nothing was observed live. Every build id, restart time and grant in this folder is a value recorded
  in `STATE.md` on 4 Oct.
- **Which run this is:** `STATE.md` 54 says Astra runs this assessment once Justin has shaped the brief. This is a
  separate test run by Claude on a snapshot, not that run.
- **Proposal versus decision:** every item in `decisions/2026-10-07-proposed-intent-changes.md`, every question, and
  the guard's placement are proposals. The only change made on a decision's authority is "scheduling" (2026-09-17).

## 13. Notes on the skills

Five notes, in `feedback.md`:

- the guard template assumes one repository;
- "existing guard" is undefined when a system has instruction files but no guard file;
- the generator cites a size review that does not ship with the skills;
- docs-first Step 5 reads as an edit even where the run may not write;
- the contract's example check can turn into a path for editing intent documents to match the code.
