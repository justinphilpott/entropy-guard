# Entropy assessment: ORC and the orchestration lab, as one system

Assessed 2026-10-07 with entropy-guard's skills (`entropy-assessment` 0.9.0, `docs-first-planning-assessment` 0.3.0,
`session-coherence-skill-generator` 0.5.0, `guards-integrator` 0.4.0).

- **Targets:** read-only snapshots of ORC (`orchestrator/`, a TypeScript orchestration system) and the lab Scope that
  manages its work (`scope-orchestration-lab/`), both dated 4 Oct 2026, without `.git` and without `node_modules`.
- **Mode:** build, into the output folder only. Nothing in the targets was changed: every change is a patch in
  `patches/`. Changes that cross the two repositories or touch policy are discuss-first, so all patches are proposals
  for Justin to apply.
- **Route:** `entropy-assessment` → intent pass → shape D, with B and C also fitting → `mixed-profile.md` for the system,
  plus docs-first Steps 2, 3, 5 and 7 on the lab → guard decision `create` → `session-coherence-skill-generator` →
  `guards-integrator`.

## 1. Intent

### The steward

**Justin.** The lab's `scope.yaml` line 6 says `steward: justin`, and its `members` make him the only admin. ORC's
source calls him "the operator", because its owner-tie ratchet (`test/core-ties.ts`) forbids his name in `src/`.

### Authorised intent, and where each part comes from

| Statement | Where | Kind | Authority |
|---|---|---|---|
| Purpose: "Develop and operate Justin's local orchestration platform and its reusable Scope-owned agents." | lab `scope.yaml` line 5 | directive, the formal inventory | neither attributed nor dated |
| North star: ORC as Justin's "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; then "work towards a point of consolidation" | lab `STATE.md` lines 8–11 | decision | attributed and dated, 25 and 26 Sep; **in an overwritten file** (F1) |
| The lab's role, where issues live, the processes kept, scheduling (#166) first, an entropy-guard assessment of both repos | lab `STATE.md` lines 38–54 | decision | attributed and dated, 4 Oct; overwritten file (F1) |
| Claude merges a PR once review and tests pass | lab `STATE.md` line 17 | decision | attributed and dated, 25 Sep; overwritten file (F1) |
| ORC owns a general async work capability; task types declare delivery, schedule, approval | lab `decisions/2026-09-17-async-work-architecture.md` | decision | attributed and dated, 17 Sep |
| Authority rules 1, 2, 4, 5 affirmed; 3, 6, chat handling and Iris's role open | lab `memory/authority-rules-step-1.md` | decision | attributed and dated, 1 Oct |
| Core ships with no specific Scope, model, owner or agent | ORC `AGENTS.md` lines 30–55 | directive | Justin quoted, 12 and 13 Sep |
| The map of work, orchestrator#140, is the reference point | ORC `AGENTS.md` lines 7–12; lab `AGENTS.md` lines 7–10 | directive | attributed and dated, 2 Oct |
| Boundaries: the lethal trifecta, standing grants, subprocess and network access, credentials, "Any new authority requires an explicit human choice" | ORC `AGENTS.md` lines 14–112 | directive | neither, except the trifecta's source (#20) |
| Approval cards drawn from fixed blocks | ORC `AGENTS.md` lines 114–128 | directive | the operator, 26 Sep |
| Scope logins are never centralised in ORC | ORC `src/adapters/scope-credentials.ts` line 14 | decision quoted in code | the operator, 28 Sep |
| Direction; "Wide eyes, narrow hands"; "Deliberately absent … each requires a decision" | ORC `README.md` lines 9–23, 138–154 | description and directive | neither; last edited 13 Sep |
| State rules: overwrite, current state only, about forty content lines | lab `AGENTS.md` lines 31–36 | directive | neither |

Bound by, not read in this run (outside the permitted scope): `~/pro/local-config/home/AGENTS.md`, the user-wide rules
that `STATE.md` line 16 cites; `~/pro/agentic/HOW_NOT_TO_PLAN.md`, the pace rule (lab `AGENTS.md` line 27);
`~/pro/scope/docs/MODEL.md`, authoritative for the Scope model (lab `SCOPE.md` line 24); the rules in orchestrator#140.

### Three readings

- **Declared** (ORC `README.md`, 13 Sep): a local-first personal agent with read-only external paths, and scheduling,
  workflow execution and new data sources deliberately absent.
- **Enacted** (lab `STATE.md`, `FRICTION.md`, `status.html` of 2 Oct; no git history in the snapshot): durable work
  with cards and standing grants; a browser that writes to Bookwhen through the Moving Stillness package (paused 4 Oct);
  invoicing through the finance Scope; phone notices through ntfy; ORC restarting itself from a card; the issue map;
  resolve-before-acting (#193); one package API version (#201).
- **Authorised:** the north star; the 17 Sep async decision, which covers durable writes and schedules; the core
  neutrality directive; the 4 Oct decisions, which put scheduling first. Nearly all enacted work traces to these, or to
  cards Justin approved. The exceptions are F9 and F10.

### Gaps, by condition

| Condition | Findings | Response |
|---|---|---|
| Stale description | F6, F8, F12 (README part), F13, F18; F7 for "scheduling" only | Corrected in `patches/settled.patch`, citing the decision that settles each. F7's sentence waits on Q4. |
| Conflict | F4 (forty or sixty lines) | Both shown; Q3. |
| Missing | F2 (no decision owner for ORC); F20 (the authority plan held outside both repos) | Q1; F20 noted. |
| Ambiguous | F7 (the rest of "Deliberately absent"); F22 ("consolidation") | Q4; F22 not asked, reason in `questions.md`. |
| Unauthorised drift | F9 (subprocess widened), F10 (core-ties allowance rose) | Proposals drafted for Justin (`patches/provisional-Q2.patch`); no document edited to match. |
| Prose control | F10 (direction of the ratchet), F12 (where credentials are read), F14 (tests before merge), F24 (direct pushes) | Where enforcement would sit is given in each finding. |
| Code breaks a documented constraint | F11 | Fix the work, not the README (intent-change rule, item 6). |

### Existing guards' repair instructions, read against the intent-change rule

No entropy guard exists in either repository. The rules that act like guards were read for repairs that change intent
or keep two definitions in step:
- **Intent:** none treats the work as permission to change authorised intent.
- **Ownership:** lab `AGENTS.md` line 19, "`scope.yaml`, then one line in `SCOPE.md`", keeps two places in step. `SCOPE.md`
  line 23 calls `scope.yaml` the formal inventory, so `SCOPE.md`'s line is a summary: acceptable, to be kept correct (F23).

### Questions and proposed changes

Four questions, each with a recommended answer: `questions.md` (Q1 to Q4). The proposed intent-relevant changes are
drafted in `patches/provisional-Q1.patch` to `-Q4.patch`, not recorded in the targets, because the targets are
read-only and because the place to record proposals about ORC is itself Q1.

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** `scope.yaml` line 7, `status: active`; `STATE.md` updated 2026-10-04 17:31; ORC recorded live on
  4 Oct (`STATE.md` lines 31–35); commits most days to 2 Oct (`status.html`).
- **Repositories: two, assessed as one system.** ORC holds the code. The lab holds its project management: state,
  decisions, friction log, reports, the map and diary tools. They meet at named seams (F2, F16, F17).
- **Shape: D, workflow-heavy, as the riskiest of three that fit.** C fits ORC alone (24,135 lines of TypeScript in `src/` on 30 Sep, by the
  design review; 970 tests by `STATE.md`'s count). B fits the pair (ORC's `README.md` and `AGENTS.md` drift from its code). D fits best:
  the fastest decay is in how work is handed on (F1, F3, F14, F19). B, C and D share `mixed-profile.md`. The lab is
  docs-first, so docs-first Steps 2, 3, 5 and 7 were also run on it.

## 3. Findings

One list; every other section refers to these ids. "Line" means the snapshot's line number.

- **F1. Steward decisions kept only in an overwritten state file.** Lab `STATE.md` holds the north star (lines 8–11), the
  merge delegation (17), the Moving Stillness pause (33), the 4 Oct interview (38–54) and three 3 Oct decisions (56–58).
  Lab `AGENTS.md` line 33: `STATE.md` "is overwritten at each verified event". The lab's `decisions/` holds one file,
  from 17 Sep. Fix: copy, not decide again (`patches/settled.patch`, new
  `decisions/2026-10-04-steward-decisions-from-state.md`); the ORC one (#194) waits on Q1.
- **F2. No decision owner for ORC.** ORC has no decision log. The lab says facts about ORC belong in ORC (`SCOPE.md` line
  19, `AGENTS.md` line 16), yet ORC's architecture decision lives in the lab's `decisions/`. Justin's ORC decisions sit in
  code comments as "the operator" (`scope-credentials.ts` line 14; `dangerfile.js` line 7), in `STATE.md`, and in report
  tables. Q1.
- **F3. `STATE.md` contradicts itself and carries expired live facts.** Line 23: "#193 … is built and in review, not
  merged"; line 31: "#193 is live: #200 merged as `3989cdb`". Lines 58 and 88: ORC runs `369628b` since 3 Oct 22:12:47;
  lines 31–35: four restarts on 4 Oct, the last at 14:48:27 onto `8cee662`. Line 91: Moving Stillness `main` is
  `c759f96`; line 32: MS #53 merged as `fc830aa`. Line 94: grant `e9675bd9` "until 1 Oct 18:00Z", in a file dated 4 Oct.
  `tools/map.mjs` (`whereWeAre`, lines 189–200) reads line 23's reference to draw "★ WE ARE HERE". `FRICTION.md` records
  the same failure on 12 Sep and on 22 Sep ("a state file that lied twice").
- **F4. `STATE.md` holds history and exceeds both caps, which disagree.** 99 lines, 87 with content, including dated
  history (lines 56–58, 76–90). Lab `AGENTS.md` line 34: "about forty content lines"; `STATE.md` line 4: "Target: sixty
  lines". Neither is attributed. Q3.
- **F5. Times are typed by hand.** `FRICTION.md` 30 Sep (lines 185–190) lists nine wrong times in three days and calls it
  "a missing system"; 29 Sep (line 297) another. orchestrator#192 is open on it.
- **F6. ORC `README.md` is stale.** Lines 76–79 tell the reader to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN`, which nothing in
  `src/`, `config/` or `scripts/` reads, for `@jphil/bookwhen-client@0.6.1`, which is not a dependency; the network test
  asserts its absence (`test/architecture.test.ts` lines 1315–1316). Lines 5–7 call ORC's external paths read-only and
  Bookwhen-specific; durable writes run since the 17 Sep decision. Settled by Justin's 12–13 Sep directive (ORC
  `AGENTS.md` lines 32–37), the operator's 28 Sep decision and the 17 Sep decision. Found earlier by the 1 Oct design
  review (section 2d); the fix awaited "your word" (`reports/2026-10-01-review-synthesis.md`, item 7). Corrected in
  `patches/settled.patch`; the replacement points to `AGENTS.md` and says it does not list Scope packages' connectors.
- **F7. README's "Deliberately absent" list (lines 152–154) is partly stale.** "Scheduling" is contradicted by the 17 Sep
  decision and by the `schedules` table (`src/adapters/async-store/sqlite.ts` line 41). "Workflow execution",
  "additional external data sources" and "reminders" are not plainly settled. Q4.
- **F8. ORC `AGENTS.md` lines 102–103 name `src/bookwhen.ts`,** which does not exist. Corrected in `patches/settled.patch`.
- **F9. Subprocess access was widened without a recorded decision.** ORC `AGENTS.md` lines 92–96 list three modules; the
  architecture test (lines 823–832) allows a fourth, `src/adapters/orc-service.ts` (orchestrator#101). `AGENTS.md` line
  110: "Any new authority requires an explicit human choice." README lines 4–5 also describe only the researcher child.
  Q2.
- **F10. The core-ties ratchet rose against its own rule.** ORC `AGENTS.md` lines 47–48 and `test/core-ties.ts` lines 6–7:
  a count "may only fall". `test/core-ties.ts` lines 41–49: the Scope allowance for `config/installation.ts` went 28 →
  51 (30 Sep) → 64 → 70 (2 Oct). The test enforces the exact count (lines 566–568, 602–611), not its direction, so the
  rule's direction is prose. The fix of the work is orchestrator#152. Q2.
- **F11. The restart card's subprocesses inherit ORC's credentials, against a documented constraint.** README line 104:
  "No subprocess ORC launches receives one." `src/adapters/orc-service.ts` lines 71, 102, 107 and 128 call `execFile`
  with no `env`, so git, `systemctl`, `pnpm install --frozen-lockfile` and `node scripts/build.mjs` (which runs `tsc` and
  Vite with its plugins) inherit ORC's environment, which `scripts/orc-env.sh` (lines 45–52) fills from
  `~/.config/orchestrator/env`. The other two modules pass an explicit minimal environment (`analysis-tools.ts` lines
  314–321; `child-agent-process.ts` line 373). **Size: low.** These are ORC's own pinned tools, and ORC's runtime
  dependencies already run in a process holding the same environment; I found no path that sends a value anywhere. The
  defect is that a documented constraint is broken and no test checks subprocess environments. Response: fix the work
  (pass a minimal `env`, as the other modules do) and extend the subprocess test; the README stays as it is. Not yet an
  issue; it belongs under Map A3, security (#145).
- **F12. Where credentials are read is unenforced, and README describes it wrongly.** README line 103: "read in exactly
  one place, `src/runtime.ts`". Also read: `src/web-cli.ts` line 625 (`ORCHESTRATOR_WEB_TOKEN`), `src/app/agent-packages.ts`
  line 466 (connector credentials), `src/adapters/scope-credentials.ts` (Scope logins). The rule, ORC `AGENTS.md` line 106,
  "Credentials stay in composition roots and narrowed connectors", has no test; it would sit in
  `test/architecture.test.ts` beside the network and subprocess checks. The README sentence is replaced by a pointer to
  the rule in `patches/settled.patch`.
- **F13. `SECURITY-REVIEW.md`'s trigger list (lines 177–182) is out of step with its owner,** `GUARDED` in `dangerfile.js`
  (lines 11–26). It omits `config/`, `package.json`, `pnpm-lock.yaml`, `test/core-ties.ts`, `scripts/source-headers.js`,
  `scripts/approve-agent-package.ts` and `scripts/async-work.ts`. Reduced to a pointer in `patches/settled.patch`.
- **F14. Tests run only by hand while merging depends on them passing.** The only CI is `.github/workflows/danger.yml`.
  Justin's 25 Sep delegation is conditional on tests passing (`STATE.md` line 17). The E2E suite was red on `main` for a
  week unnoticed (`reports/2026-10-01-review-synthesis.md` lines 58–59). orchestrator#144 is open and was kept on 4 Oct.
- **F15. Twelve one-off reports sit at ORC's root:** `CLASSIFY`, `FIXES`, `GRANTS-E2E`, `GRANTS`, `MCP`, `OPERATOR`,
  `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`, `TURN-RECORD`, `VISIBILITY`. Only `MCP.md` marks its history. `SLICE1.md`
  line 7 names `src/adapters/browser/service.ts`, now gone; `REWORK.md`, `SEAM.md` and `OPERATOR.md` say nothing is
  pushed. The 1 Oct design review proposes moving their unique facts and deleting them, awaiting Justin's word. **One
  correction to that review:** `OPERATOR.md` is referenced by code; `scripts/orc-service.ts` line 41 writes it into the
  systemd unit as `Documentation=`.
- **F16. The lab's diary reads ORC's internals and fails silently.** `tools/collect.mjs` line 16 hard-codes ORC's state
  directory as `~/.local/share/orchestrator-proof`, while ORC's default is `~/.local/share/orchestrator`
  (`src/runtime.ts` line 190). Lines 123–147 query ORC's `tasks` and `events` tables directly; lines 172–176 read
  `src/core/*.md`. Its header (lines 3–7) says every reader returns null when its source is unavailable, and that it was
  rebuilt on 29 Sep because its readers pointed at ORC paths that had moved. The schema matches today (`sqlite.ts` lines
  52–79). Two homes for one setting: orchestrator#62, #112.
- **F17. `FRICTION.md` has drifted from the format its parser reads.** `tools/collect.mjs` `friction()` (lines 150–161)
  misses three headings with a time of day ("2026-09-21 night —", "late", "evening"), so their 15 findings are counted
  under 2026-09-22: 24 instead of 9, checked with Node against the file. Entries for 11–19 Sep (lines 1153–1402) sit after
  3 Sep although the file says "Newest first", and 12 Sep and 17 Sep each have two sections. The parser is fixed in
  `patches/settled.patch`; the order is a cleanup.
- **F18. The lab's run walkthrough names moved ORC files.** `memory/slots-run-walkthrough.md` line 35:
  `src/adapters/browser/service.ts`, `mcp.ts`. ORC's `MCP.md` lines 3–5: the browser moved to `playwright.ts` on 3 Oct
  (#76). A dated note is added in `patches/settled.patch`.
- **F19. Processes Justin kept on 4 Oct are declared but not running.** No guard exists in either repository (a search for
  "entropy" finds only `STATE.md`). No label check exists (the tools only filter the `map` label). The newest diary
  snapshot is `reports/2026-10-02.json`. #144 and #60 are open. #166 is to come first.
- **F20. The authority plan lives outside both repositories, in a vendor folder.** `memory/authority-rules-step-1.md`
  line 5: "plan: `~/.claude/plans/agile-booping-waffle.md`, held until the steps are agreed". Other agents and the repos
  cannot reach it, and #149's next step depends on it.
- **F21. `AGENT_IDEAS.md` has two entries for one idea:** "Product search agent, tool, or skill" (line 164) and "Product
  search agent" (line 173).
- **F22. "Consolidation" is ambiguous against the work since.** Justin, 26 Sep: once the six slots work, consolidate. Since
  then: the invoicing agent (30 Sep), phone notices (1–3 Oct), the map (2 Oct), #193 (4 Oct). Readings: harden what
  exists before adding capabilities, or consolidate seams while features continue. Not asked (`questions.md`).
- **F23. One "update both" instruction, judged a summary.** Lab `AGENTS.md` line 19; see section 1.
- **F24. Danger does not see direct pushes.** ORC `AGENTS.md` lines 141–143: "a direct push to `main` is not checked".
  Whether branch protection requires the check: unknown from the snapshot.
- **F25. Whether the pre-push hooks are enabled is unknown.** Both repositories ship `.githooks/pre-push`, enabled only by
  `git config core.hooksPath .githooks`; the snapshot has no git configuration. Both hooks print a summary and never
  block.

Checked and found consistent, so not findings: the parent tools in ORC `AGENTS.md` lines 20–23 match
`config/installation.ts` line 41 (`list_open_fridays` is contributed by the Moving Stillness package, lines 64–70); the
seven-day bound on standing grants (`src/core/async/approval-grants.ts` line 33); the Pi pins (four, as `README.md` says);
`ORC_PACKAGE_API_VERSION` in `src/core/agents/package.ts` line 21; ORC's port 5173; the direct-network list in
`AGENTS.md` against its test.

## 4. Which document owns which truth (docs-first Step 2)

| Concept | Canonical home | Also stated in | Finding |
|---|---|---|---|
| Steward, purpose | lab `scope.yaml` | `SCOPE.md` (summary), ORC `README.md` "Direction" | — |
| North star, lab role, kept processes | lab `STATE.md` today; should be `decisions/` | — | F1 |
| Decisions about ORC | none | lab `decisions/`, code comments, `STATE.md`, reports | F2 |
| Current state, next steps | lab `STATE.md` | `status.html` (generated, 2 Oct) | F3, F4 |
| Open work and its structure | orchestrator#140 and the GitHub Project | `tools/map.mjs` (`MAP_ROOT`, the one place in code) | — |
| ORC's boundaries | ORC `AGENTS.md`, "Boundaries", and `test/architecture.test.ts` | `README.md` "Boundary" and its intro | F6, F9, F12 |
| Security-review trigger paths | `dangerfile.js` `GUARDED` | `SECURITY-REVIEW.md`, PR template (a link) | F13 |
| Core-ties allowances | `test/core-ties.ts` | `AGENTS.md` (the rule, a dated baseline) | F10 |
| Authority model | spread: ORC `AGENTS.md`, `GRANTS.md` (design, 20 Sep), lab `memory/authority-rules-step-1.md`, `config/installation.ts` | — | F20; the 1 Oct design review ranks this first (#148) |
| What broke in real use | lab `FRICTION.md` | `tools/collect.mjs` parses it | F5, F17 |
| Ideas | lab `AGENT_IDEAS.md` | — | F21 |
| ORC's state directory | ORC `src/runtime.ts` default, overridden by the service's environment | lab `tools/collect.mjs` | F16 |

Roles of the other documents:
- **Product artifacts (their formats are contracts):** `STATE.md`'s `**Where we are now:** <ref>` line, read by
  `tools/map.mjs`; `FRICTION.md`'s `## YYYY-MM-DD — title` headings, read by `tools/collect.mjs`; ORC's
  `src/package-api.api.md`; ORC's `src/core/*.md` agent definitions.
- **Local elaboration:** lab `memory/slots-run-walkthrough.md` (dated 28–29 Sep).
- **Historical:** lab `reports/` (dated reviews; three are "of record" per `STATE.md` lines 96–99), `research/`; ORC's
  root reports (F15), of which `MCP.md` is partly live and `GRANTS.md` is a design still cited.
- **Templates:** none. `skills/` and `workflows/` in the lab are empty.

## 5. The real loop (docs-first Step 3)

1. **Start.** A session opens in the lab or in ORC, mostly Claude Code; Codex and opencode run Astra's reviews. In the
   lab, `AGENTS.md` (also `CLAUDE.md`, a symlink) sends it to `STATE.md`, `SCOPE.md` and orchestrator#140. In ORC,
   `AGENTS.md` sends it to `README.md`, the architecture test and #140.
2. **Work.** An issue on the map is marked with `node tools/map.mjs working`; a branch in a worktree under `/tmp` (#196);
   a pull request, where Danger asks for `## Security review` and `## Package API`; Astra's adversarial review for
   complex changes, written into `reports/`; Claude merges once review and tests pass; ORC restarts through a card
   Justin approves, verified by process start time.
3. **Capture.** `STATE.md` is overwritten at each verified event; friction goes into `FRICTION.md`, ideas into
   `AGENT_IDEAS.md`, reviews into `reports/`. Justin's decisions land mostly in `STATE.md`, code comments and issue
   threads; `decisions/` has had nothing since 17 Sep (F1, F2).
4. **Handoff.** The session clears its map marks, overwrites `STATE.md`, commits and pushes the lab. Each pre-push hook
   prints a summary of branches and worktrees.
5. **Where follow-up is lost:** decisions overwritten (F1), state contradicting itself (F3), times typed by hand (F5),
   tests not run (F14), cross-repository readers failing silently (F16, F17).

## 6. Domains and seams (mixed profile)

Domains present and changing: code (ORC's `src/`, `web/src/`; the lab's `tools/`), documentation, tests (ORC: vitest,
Playwright E2E, architecture ratchets), contracts (`src/package-api.api.md`, Scope package manifests, ORC's SQLite
schema), workflow (the map, Danger, reviews, the diary, hooks), and live state (`orc.service` and its build, ORC's state
directory with tasks, approvals and grants, Scope credentials, ORC's env file, the ntfy topic, GitHub's Project marks).

Concepts with two homes across the repositories: the record of decisions (F1, F2), ORC's state directory (F16), the
formats `STATE.md` and `FRICTION.md` must keep for the lab's tools (F3, F17), and the authority model (section 4).

## 7. Ranked risks (decay rate × recovery cost)

1. **Decisions in overwritten or ownerless places** (F1, F2, F20). Decay: high, since `STATE.md` is rewritten several
   times a day. Recovery: high, since a lost decision must be asked of Justin again. Anchor: the lab's `decisions/`, and Q1.
2. **A state file that is confidently wrong** (F3, F4, F5). Decay: high. Recovery: medium to high; wrong answers reach
   Justin, and the map's ★ follows the wrong line. Anchor: `STATE.md` and the lab's `AGENTS.md`, "Keeping state".
3. **ORC's boundary descriptions drifting from enforcement and authorisation** (F9, F10, F11, F12, with F6–F8, F13).
   Decay: medium, one per capability change. Recovery: high, because security reviews reason from these descriptions.
   Anchor: ORC `AGENTS.md`, "Boundaries", and `test/architecture.test.ts`.
4. **Checks that are decided but do not run** (F14, F19). Decay: medium. Recovery: high (an E2E suite red for a week).
   Anchor: orchestrator#144 and #166.
5. **Cross-repository readers failing silently** (F16, F17, F18). Decay: medium. Recovery: medium. Anchor: the lab's
   `tools/collect.mjs`, and ORC's own operator commands (#112).

## 8. Existing guard surfaces, sorted by whether they execute

- **Runs by itself:** Danger on every ORC pull request (`dangerfile.js`, `.github/workflows/danger.yml`): a
  `## Security review` section for guarded paths and a `## Package API` section when the API report changes. Seen
  passing and failing on GitHub on 2 Oct (`STATE.md` lines 79–81). Keep.
- **Runs only by hand:** `pnpm typecheck`; `pnpm test`, which includes the architecture ratchets (core ties, discarded
  causes, source headers, subprocess and network confinement, the model's tool surface, UTF-8) and the API-report test;
  `pnpm test:e2e`; `pnpm api:report`; `node tools/map.mjs --check`; `node tools/report.mjs`; Astra's reviews;
  `SECURITY-REVIEW.md`. Keep; amend the architecture test for F11 and F12.
- **Decided, not built:** tests on every PR (#144); the entropy guard at session end; the label check; the daily diary and
  weekly review on a schedule (#166, #64, #79, #142); FRICTION into rules (#60); cleanups (#70, #182). F19.
- **Declared, but missing:** the ratchet's direction (F10); the credential rule (F12); the `STATE.md` cap (F4); the
  subprocess environment constraint (F11).
- **Unknown:** whether the pre-push hooks are enabled (F25); branch protection (F24); anything in local-config, such as a
  user-wide session-end ritual.

## 9. Mechanical checks that belong to tools

- **The project's own tests (ORC):** extend `test/architecture.test.ts` to list the modules that read credentials and to
  require an explicit `env` on every subprocess call (F11, F12); a test that every `ORCHESTRATOR_*` variable and `src/`
  path named in `README.md` and `AGENTS.md` exists (F6, F8 would have failed it). After Q2: a Danger rule that fails a
  rise in a `test/core-ties.ts` allowance unless the description quotes Justin's decision (F10).
- **A link checker such as lychee** over both repositories' Markdown (F15, F18).
- **ast-grep**, if a test is not wanted, for identifiers named in prose.
- **The lab's tools:** a check in `tools/map.mjs` or `tools/report.mjs` for the `STATE.md` cap, once Q3 is answered,
  and for `FRICTION.md`'s heading format (F4, F17).
- Whether lychee, ast-grep or an instruction-file linter is installed was not checked (outside the permitted scope);
  the guard depends on none of them.

## 10. Recommendations and one-time cleanup

Each item was checked against the snapshot's current file.

- **Settled, in `patches/settled.patch`:** copy the steward decisions out of `STATE.md` (F1); rewrite `STATE.md` (F3,
  section 11); correct ORC `README.md` (F6, F12) and `AGENTS.md` (F8); reduce `SECURITY-REVIEW.md`'s list to a pointer
  (F13); date the walkthrough's paths (F18); fix the `FRICTION.md` parser (F17); point both `AGENTS.md` files at the
  guard.
- **Provisional:** `patches/provisional-Q1.patch` to `-Q4.patch` (F2, F4, F7, F9, F10).
- **Fix the work, as new issues on the map:** F11, an explicit `env` in `src/adapters/orc-service.ts` (under #145); F12,
  the credential test (under #145).
- **Already proposed, awaiting Justin's word:** the root reports (F15), with the correction about `OPERATOR.md`.
- **Small cleanups, no question attached:** merge the two product-search ideas (F21); put `FRICTION.md`'s 11–19 Sep
  entries in order, or note at line 1153 that they are out of order (F17); move the authority plan (F20) into the lab's
  `memory/` or #149 before step 2 is discussed.
- **Leave as they are:** `AGENTS.md`'s dated core-ties baseline of 13 Sep; README's "Use" section, which is dated history.

## 11. The state-file update (docs-first Step 5)

Delivered as part of `patches/settled.patch`, replacing the lab's `STATE.md`: 60 lines, 53 with content, against 99
and 87. What changed, and why:
- It states the stage, what to trust and what not, the active fronts, what waits on Justin (including Q1 to Q4), the
  live facts and three next actions.
- Decisions are linked to the new decision record instead of being held (F1). The 3 Oct decisions stay listed until
  they have a record (Q1, and Moving Stillness's own `DECISIONS.md`, which was not read).
- **Where we are now** moves from #193, which the file itself records as live, to #166, which Justin's 4 Oct decision
  puts first. The `**Where we are now:** #<n>` format that `tools/map.mjs` reads is kept, and was checked with its regex.
- Every live fact keeps the date it was recorded, and says it was not re-read; nothing live was observed in this run.
  The expired grant and the superseded build and commit are gone (F3).
- It says what makes it stale and who refreshes it. Its "Target: sixty lines" sentence is untouched, because Q3 is about
  it.

## 12. The guard decision, and the generator's inputs

**Decision: `create`.** No guard exists in either repository (F19); Justin kept "entropy guard at session end" on 4 Oct;
the loop's failures (F1, F3, F5) are the kind a session-end check catches.

Inputs supplied to `session-coherence-skill-generator`:
- **Steward, intent and decisions:** Justin; the intent documents in section 1's table; decision surface, the lab's
  `decisions/`, with ORC's unresolved (Q1); open intent questions Q1 to Q4.
- **Current-state file:** the lab's `STATE.md`, refreshed by the session that causes a verified event (lab `AGENTS.md`
  line 33).
- **Rules owned elsewhere:** `~/pro/local-config/home/AGENTS.md` (not read); the merge delegation of 25 Sep; the map's
  rules in orchestrator#140 (not read); `HOW_NOT_TO_PLAN.md` and the Scope model (not read); ORC's `SECURITY-REVIEW.md`
  and Danger. A spending policy: none found in either repository; any user-wide one is in the unread file.
- **Verification commands:** ORC's `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report`; the lab's
  `node tools/map.mjs --check` and `node tools/report.mjs`. Only Danger runs by itself.
- **Code areas and what describes them:**

  | Code area | Docs | Tests |
  |---|---|---|
  | Durable work: `src/core/async/`, `src/app/async/`, `src/adapters/async-store/` | lab `decisions/2026-09-17-…`; ORC `AGENTS.md` "Approval cards" | `async-*.test.ts`, architecture neutrality checks |
  | Browser: `src/adapters/browser/` | `MCP.md` (partly history), `AGENTS.md` | `browser-connector.test.ts`, E2E |
  | Restart: `src/adapters/orc-service.ts`, `src/app/orc-restart.ts` | `README.md` "As a service", `AGENTS.md` line 136 | `orc-restart.test.ts`, subprocess check |
  | Packages: `src/core/agents/`, `src/adapters/agent-files/`, `src/app/agent-packages.ts`, `src/package-api.ts` | `AGENTS.md` "Security review", `src/package-api.api.md` | `package-*.test.ts` |
  | Installation: `config/installation.ts` | `test/core-ties.ts` comments, `GRANTS.md` | core-ties ratchet |
  | Research and analysis: `src/core/research-tools.ts`, `analysis-tools.ts`, `child-agent-process.ts` | `README.md` "Use", `AGENTS.md` trifecta | `research-*.test.ts`, `analysis-tools.test.ts`, topology |
  | Credentials: `src/runtime.ts`, `src/web-cli.ts`, `src/adapters/scope-credentials.ts` | `README.md` "Credentials", `AGENTS.md` | `scope-credentials.test.ts`; no placement test (F12) |
  | Lab tools: `tools/*.mjs` | lab `README.md`, `AGENTS.md` | none |

- **Live state a session can change:** ORC's service and build (by card), approvals and grants in ORC's state directory,
  Scope credentials, ORC's env file, the ntfy topic, GitHub issues and the Project's marks, and Bookwhen through the
  Moving Stillness package (paused). Spend: model calls through Pi's provider; whether they are billed per use is
  unknown.
- **Findings:** F1 to F25.

## 13. The generator's output

- **The guard:** `guard/SKILL.md`, to be installed as `skills/session-coherence-guard/SKILL.md` in the lab, which already
  has a `skills/` folder. One guard for both repositories, because they are one system and the lab is the central Scope;
  ORC's `AGENTS.md` points to it, which keeps owner-specific workflow out of ORC.
- **Size: 1,249 words, against a budget of 1,166:**
  - the common contract: 706 words, as the generator measured it, and recounted here at 706;
  - 9 repository-specific checks × 36 = 324;
  - pointers: 92 words of filled "Where things live" bullets, of which 28 are the template's own labels;
  - commands: 44 words.

  The 83 words over come from covering two repositories (the intro and per-repository baseline, about 30), naming five
  intent documents and the unresolved decision surface in the intent rule (about 35), the filled standing documentation
  check (about 25), and checks averaging 37.7 words. No duplicated content was found to remove; nothing required was cut.
- **Open questions it leaves visible:** Q1 (in "Where things live" and the intent rule), Q2 (in the boundary check), Q3
  (in the `STATE.md` check).
- **Validation:** `git diff --no-index --check` over every patched file: no whitespace errors. Every patch was dry-run
  with `patch -p1` against copies of the snapshot: the settled patch applies cleanly, and each provisional patch applies
  on top of it. The changed `tools/collect.mjs` passes `node --check`, and its parser was run against the real
  `FRICTION.md`. No ORC test reads the patched documents. ORC's tests were not run (no `node_modules`).
- **Handoff:** `integration.md`, from `guards-integrator`.

## 14. Uncertainties, and what was not covered

- No git history: enacted intent comes from `STATE.md`, `FRICTION.md` and `status.html`, not commits. Commit messages
  were not searched for steward quotes.
- GitHub was not read: issue bodies, the rules in #140, branch protection, and whether decisions sit in issue threads.
- Not read: the user-wide rules, the Moving Stillness, finance and ops-tool repositories, and the Scope model. So the
  README replacement for what ORC reaches is marked incomplete, and whether the MCP SDK's stdio transport filters the
  environment it passes was not verified.
- Nothing live was observed: every live fact is as `STATE.md` recorded it on 4 Oct or earlier.
- The 68 Markdown reports in the lab's `reports/` were sampled (the 1 Oct synthesis and design review, the 4 Oct map overview,
  the 30 Sep skills report, the 29 Sep backlog inventory), not read in full.
