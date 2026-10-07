# Entropy assessment: ORC and the orchestration-lab Scope, as one system

Run 2026-10-07 with entropy-guard's `entropy-assessment` (v0.9.0) on route B (mixed docs and code), with
`docs-first-planning-assessment` Steps 2, 3, 5 and 7 run on the lab, then `session-coherence-skill-generator`
(v0.5.0) and `guards-integrator` (v0.4.0).

- **Targets (read-only snapshots, no `.git`):** `orchestrator/` (ORC) and `scope-orchestration-lab/` (the lab), taken
  on 4 Oct 2026 (lab files dated 17:31). Line numbers below refer to those snapshots.
- **Mode:** build, but the targets cannot be edited, so every change is delivered as a patch in `patches/`. Settled
  patches touch no open question; provisional patches wait for the steward's answers in `questions.md`.
- **Not covered:** git history and commit messages (no `.git`); GitHub issues, PRs and the map's description
  (orchestrator#140); the running service; files outside the two targets that they cite as owners of rules
  (`~/pro/local-config/home/AGENTS.md`, `~/pro/agentic/HOW_NOT_TO_PLAN.md`, `~/pro/scope`, the Moving Stillness and
  Finance Scopes, Pi's own code). ORC's tests were not run: the snapshot has no `node_modules`.

## 1. Intent

**Steward:** Justin (`scope.yaml` L6 `steward: justin`; SCOPE.md L5 "Justin's Scope").

**Authorised intent, with the source of each part:**
- **Purpose of the lab:** "Develop and operate Justin's local orchestration platform and its reusable Scope-owned
  agents" (`scope.yaml` L5; SCOPE.md L5-7). Authority split: facts about ORC in ORC's repo, about the generic Scope
  model in `~/pro/scope`, about their relationship here (SCOPE.md L19-21). Directive, unattributed, undated.
- **North star:** "his ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"
  (Justin, 2026-09-25) and "once the six slots work, work towards a point of consolidation" (Justin, 2026-09-26),
  lab STATE.md L8-11. Attributed and dated, but held only in a state file (F1).
- **ORC direction and boundaries:** README "Direction" (L9-23), "Boundary" (L138-154); ORC AGENTS.md "Boundaries"
  (L14-112), including "Core ships with no specific Scope, model, owner, or agent", attributed to Justin
  2026-09-12 and 2026-09-13 (L30-37). Directives.
- **Durable work:** "ORC owns a general async work capability", with schedules now, at a time or recurring (lab
  `decisions/2026-09-17-async-work-architecture.md`, "Decided by Justin on 2026-09-17").
- **Authority rules, step 1:** rules 1, 2, 4 and 5 affirmed, 3 and 6 open (Justin, 1 Oct 22:05,
  `memory/authority-rules-step-1.md`).
- **4 Oct interview:** the lab is the central Scope for project management, core issue tracking, code quality and
  security; nine processes kept, including "entropy guard at session end"; scheduling (#166) built first; this
  assessment to run on ORC and the lab together (lab STATE.md L38-54). Held only in a state file (F1).
- **Operator quotes in code:** Scope credentials "DEFINITELY NOT be centralised" (2026-09-28,
  `config/installation.ts` L78, `src/adapters/scope-credentials.ts` L15); phone topics per Scope (2026-10-02,
  `config/installation.ts` L101); security review checked by Danger, "B" (2026-10-02, `dangerfile.js` L7).

**Declared, enacted, authorised.** Declared intent (README, SCOPE.md) and authorised intent (the records above) agree
on direction. Enacted work since late September (browser writes on Bookwhen, Finance invoicing and mail, phone
notices, a restart card, package API versioning) has outrun README's statement of what ORC reaches (F5, F7-F11). Most
of it was approved card by card by Justin; no recorded decision lifts README's "deliberately absent" list (F5, Q3).

**Gaps by condition** (evidence in the findings list, section 4):
- **Stale description:** F4 (scheduling listed as absent after the 2026-09-17 decision), F7, F11.
- **Conflict:** F3 (pace rule); the STATE.md size cap, about forty lines (lab AGENTS.md L34) against sixty (STATE.md
  L4), part of F16, left open.
- **Missing:** F1 (decisions only in a state file), F2 (no decision surface).
- **Ambiguous:** F6 (is ORC's `config/installation.ts` core?).
- **Unauthorised drift, or stale description (cannot tell without the steward):** F5.
- **Prose control:** F13 (the architecture tests cited as enforcing boundaries they do not see), F19 (merge rule's
  "tests pass", which nothing runs on a pull request).

**Existing guards' repair instructions.** No guard exists in either repository (searched both for "entropy",
"session-coherence" and "guard": only lab STATE.md L49 and L54 mention one). Instructions that act as repairs:
- **Intent flag:** lab AGENTS.md L33 "STATE.md is overwritten at each verified event". Because STATE.md holds the
  north star and Justin's decisions, any agent following this rule can rewrite authorised intent without a
  decision (F1).
- **Ownership flag:** lab AGENTS.md L19 "`scope.yaml`, then one line in `SCOPE.md`" keeps two files in step. SCOPE.md
  L23 names `scope.yaml` the formal inventory, so SCOPE.md's line is a summary, not a competing definition. No
  finding.

**Questions:** five, in `questions.md`, each with a recommended answer. **Proposed changes and where recorded:** the
provisional patches (section 9); none is recorded in a target, because the targets are read-only. Applying the
settled lab patch records the copied decisions in `decisions/2026-10-04-decisions-recorded-from-state.md`.

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** `scope.yaml` L7 `status: active`; ORC restarted four times on 4 Oct (STATE.md L31-35); the
  latest FRICTION entry is 4 Oct.
- **Shape: B, mixed docs and code**, across two repositories:
  - **ORC:** about 140 TypeScript source files and 70 test files, with 13 root-level documents, a Danger CI job and
    a hook. Code-first by weight, with a large docs surface that carries security claims.
  - **The lab:** docs-first. It holds the state file, friction log, decision records, reports and three Node tools
    that read ORC and GitHub. It manages ORC's work.
- **Riskiest fit:** B, because the costliest drift found sits between ORC's docs and its code (F5, F7-F13) and
  between the two repositories (F15). Docs-first Steps 2, 3, 5 and 7 were run on the lab and folded in here.
- **Domains present and actively changed:**
  - code;
  - documentation;
  - tests, including architecture ratchets;
  - an API contract (`src/package-api.api.md`);
  - workflow (the map, Danger, hooks, diary, reviews);
  - live state: `orc.service`, approval cards, grants, package approvals, Scope credentials, the ntfy topics,
    live Bookwhen entries and Finance mail.

## 3. Repositories and ownership

| Concept | Owner | Other homes |
|---|---|---|
| Lab purpose and authority | lab `SCOPE.md` | `scope.yaml` purpose, README (summaries) |
| Resource inventory | lab `scope.yaml` | `SCOPE.md` Projects (summary) |
| Current state | lab `STATE.md` | none |
| North star, Justin's decisions | **none durable** (F1, F2) | STATE.md, `decisions/`, `memory/`, reports, code comments |
| Map of work | orchestrator#140 (GitHub) | `tools/map.mjs` `MAP_ROOT`; both AGENTS.md (pointers) |
| ORC reach and boundaries | ORC `AGENTS.md` "Boundaries" | `test/architecture.test.ts` (independent check, narrower: F13); README (summary, stale: F5, F7, F11) |
| Security review | `SECURITY-REVIEW.md` (questions), `dangerfile.js` (paths) | PR template, AGENTS.md (pointers) |
| ORC state directory | **three homes** (F15) | `src/runtime.ts` default; the env file; lab `tools/collect.mjs` |
| Durable work design | lab `decisions/2026-09-17-…` | ORC `src/core/async/` (implementation) |
| Real-use friction | lab `FRICTION.md` | none |

**Seams that cost the most.**
- **ORC's state directory (F15).** It is chosen three ways. FRICTION.md records three separate confusions from that
  one cause.
- **ORC's reach (F5, F7-F13).** Prose, tests and code each describe it differently.

## 4. Findings

One list. Every other section refers to these ids.

- **F1. Justin's decisions and the north star exist only in a file agents overwrite.**
  - Where they are: lab STATE.md L6-11 (north star), L17-19 (merge rule, Justin 2026-09-25), L38-58 (4 Oct
    interview, 3 Oct decisions).
  - Why they are at risk: lab AGENTS.md L33 says STATE.md is overwritten at each verified event.
  - Repair: the settled lab patch copies them, verbatim, to `decisions/2026-10-04-decisions-recorded-from-state.md`.
- **F2. No document says where a decision is recorded.**
  - Where decisions were found: lab `decisions/` (one file), STATE.md, `memory/authority-rules-step-1.md`, reports
    quoting Justin (`reports/2026-09-22-pushback-analysis.md`), and code comments quoting "the operator"
    (`config/installation.ts` L78, L101, L122; `dangerfile.js` L7). GitHub issues may hold more; they were not read.
  - What is missing: ORC has no decision log, and the lab's AGENTS.md "Where a learning goes" (L12-19) has no row
    for decisions. → Q2.
- **F3. Two pace rules.**
  - Lab AGENTS.md L25-29: `HOW_NOT_TO_PLAN.md` governs new design work, and "one scored real use must come first".
  - Justin, 21 Sep 18:05 and 18:11 (quoted in `reports/2026-09-22-pushback-analysis.md` L127-135): "relax suggested
    development to 'what is naturally needed given where we are and what's likely coming next'".
  - ORC AGENTS.md L154 and GRANTS.md L4-5 also carry the earlier rule. → Q5.
- **F4. README lists scheduling as deliberately absent** (README L152-154).
  - The 2026-09-17 decision gives ORC durable work scheduled now, at a time or recurring.
  - The code has it: `src/core/async/types.ts` L72 and `src/app/async/calendar.ts`.
  - Repair: settled patch, citing the decision.
- **F5. README's account of ORC's reach is narrower than what ORC does.**
  - README L3-7 says ORC launches "one isolated fixed researcher child" and has "read-only external data paths".
  - README L146-147 says the Moving Stillness specialist calculates a plan "without applying it".
  - README L152-154 lists "additional external data sources" and "file edits" as deliberately absent.
  - The code shows these:
    - an analyst child (`config/installation.ts` L56);
    - an admin browser on `movingstillness.bookwhen.com` granted `click`, `replace`, `select` and `confirm`
      (L128-145);
    - `apply_moving_stillness_slots` (L44);
    - Finance mail through `smtp.protonmail.ch` and client and outbox folders (L154-171);
    - advert folders (L120-126);
    - memory appends, which README L20-21 states itself.
  - Justin approved the build cards that bind these (STATE.md L31-32, L91-92), but no recorded decision lifts the
    "deliberately absent" items. → Q3, provisional patch.
- **F6. Is ORC's `config/installation.ts` core?**
  - ORC AGENTS.md L32-42: core carries no tie to a Scope, business, model, provider, person or machine, and "an
    owner's ... setup belong[s] to that owner's Scopes and config".
  - The ties ratchet scans only `src/` and `web/src/` (L47).
  - `config/installation.ts` names Moving Stillness, Finance, Bookwhen hosts, `smtp.protonmail.ch` and
    `gpt-5.6-sol`.
  - Readings: core (the ratchet should cover `config/`), or the owner's installation config (allowed). They diverge
    when a third Scope's connector binder is added there. Tracked by #152 (Scopes load by card). Left open, not
    asked, because of the question limit.
- **F7. Bookwhen identifiers in ORC's docs no longer exist.**
  - The names: README L76-79 (`ORCHESTRATOR_BOOKWHEN_API_TOKEN`, `@jphil/bookwhen-client@0.6.1`) and AGENTS.md
    L102-103 (`src/bookwhen.ts`).
  - The search: no such file; no code reads the variable; `package.json` has no such dependency.
  - The check: `test/architecture.test.ts` L1313-1321 asserts the client's absence.
  - The directive: AGENTS.md L41, attributed to Justin, puts Bookwhen code in the Scope.
  - Repair: settled patch.
- **F8. ORC AGENTS.md's subprocess list is incomplete** (L92-96).
  - It omits `src/adapters/orc-service.ts`, which runs git, `pnpm install`, the build and `systemctl` for the restart
    card. The architecture test's own list includes it (L823-835), and AGENTS.md L136 prescribes the restart card.
  - It omits Chromium, launched by `src/adapters/browser/playwright.ts` L55.
  - Repair: settled patch. Package code is left as an explicit gap (F10).
- **F9. ORC AGENTS.md's network list holds only for direct calls in `src/`** (L98-104; the test at L1295-1317).
  - Delegated requests: Chromium to approved hosts, Pi to the model provider, `pnpm install` during a restart, and
    package code (F10).
  - "No model or agent reaches the ntfy transport" is stale since the phone connector
    (`src/adapters/phone/index.ts`; the operator, 2026-10-02). Package code now publishes to its own topic with a
    title, text, tags and a tap address it chooses (http or https, L50).
  - That tap address is a generated link, which AGENTS.md L72-74 counts as an outbound channel; it is used only if
    the operator taps it.
  - Repair: the settled patch corrects only what the 2 Oct decision covers. The link is recorded here for the
    security work under #145.
- **F10. Package bundles may import any `node:` built-in** (`src/adapters/agent-files/bundle-imports.ts` L3, L30) and
  run in ORC's process (`in-process-task`, `config/installation.ts` L31).
  - A bundle importing `node:child_process` passes `bundleImportProblems`.
  - Nothing in AGENTS.md says its subprocess and network lists do not bind package code. → Q4, provisional patch.
- **F11. README says ORC reads credentials "in exactly one place, `src/runtime.ts`"** (L91, L103).
  - Credentials are also read in `src/web-cli.ts` L625 (web token), `src/app/agent-packages.ts` L766-779 (connector
    credentials) and `src/adapters/scope-credentials.ts` (Scope folders, by the operator's 2026-09-28 directive).
  - Pi reads its own model login; that was not checked.
  - Repair: settled patch.
- **F12. Defect in the work: launched processes receive ORC's credentials.**
  - The constraint: README L104 "No subprocess ORC launches receives one", and `src/runtime.ts` L4 "Never:
    Credentials must not enter ... launched child environments".
  - The cause: `scripts/orc-env.sh` L45 exports every env-file line into ORC's process.
    `src/adapters/orc-service.ts` L71, L102, L107 and L128 call `execFile` with no `env`, so git, systemctl, the
    build and `pnpm install` inherit it. `playwright.ts` L55 launches Chromium the same way.
  - The contrast: the Pi children and `git log` get explicit environments (`child-agent-process.ts` L371-380,
    `analysis-tools.ts` L314-321).
  - Size: no route was found by which these programs show the values to a model or a web page. The constraint is
    simply unenforced and untested.
  - Response: fix the code, not the doc (intent-change rule 6). Work item W1.
- **F13. The architecture tests are cited as enforcing boundaries they cannot see.**
  - README L135 says `test/architecture.test.ts` "enforces the boundaries below".
  - Its subprocess test (L828) looks for `child_process` and `StdioClientTransport`, and its network test (L1295)
    for `fetch` and `http` imports.
  - Chromium launched through Playwright's library passes both. Work item W2.
- **F14. Danger's guarded paths miss two authority scripts.**
  - `dangerfile.js` L10 defines `GUARDED` as "anything here changes, or checks, what an agent can reach", but L11-26
    omits `scripts/execution-policies.ts` (`pnpm grant:operation`, `grant:tool`) and `scripts/approval-grants.ts`.
  - Example: a PR that makes `grant` skip its identity check passes without a Security review section.
  - The architecture test (L723-737) pins only part of `GUARDED` (not `config/` or `AGENTS.md`).
  - Related: terminal grants without a card differ from affirmed rule 2 ("a card allows it",
    `memory/authority-rules-step-1.md` L14). That rule is not yet built (#149, #154). Work item W3.
- **F15. ORC's state directory is chosen three ways.**
  - `src/runtime.ts` L190 defaults to `~/.local/share/orchestrator`; operator scripts use it
    (`scripts/async-work.ts` L18 and others).
  - The service reads the env file (`scripts/orc-service.ts` L132).
  - Lab `tools/collect.mjs` L16 hard-codes `~/.local/share/orchestrator-proof`.
  - FRICTION.md L360-367 (28 Sep, "the third time", "a missing system"), L468-469 and L655-656; ORC #62.
  - This is a missing system, not an instance: nothing ties an operator command, or the lab's diary, to the ORC
    that is running. Work item W4.
- **F16. STATE.md is more than twice its cap and grows by appending.**
  - Size: 99 lines, 87 of them content, against "about forty content lines" (lab AGENTS.md L34) and "Target: sixty
    lines" (STATE.md L4). Two numbers for one cap: a conflict, left open.
  - Appending: dated paragraphs from 2, 3 and 4 Oct accumulate despite "do not append".
  - Repair: the settled patch rewrites it to 37 content lines, which meets both numbers.
- **F17. STATE.md contradicts itself.**
  - L23 says #193 is "not merged"; L31 says "#193 is live".
  - L58 and L88 say ORC has run `369628b` since 3 Oct 22:12:47; L31-35 record four later restarts.
  - L91 says MS `main` is `c759f96`; L32 says MS #53 merged as `fc830aa`.
  - L94 says grant `e9675bd9` "covers" until 1 Oct, in a file updated 4 Oct.
  - It has happened before: FRICTION.md L866 (12 Sep) and L621 (22 Sep, "two false statements").
  - Repair: settled patch. Live facts are labelled as recorded on 4 Oct, not re-observed.
- **F18. Superseded material sits beside ORC's live docs.**
  - Ten worktree reports at ORC's root (`REWORK`, `SEAM`, `OPERATOR`, `FIXES`, `SLICE1`, `POLICY-STORE`,
    `GRANTS-E2E`, `TURN-RECORD`, `VISIBILITY`, `CLASSIFY`). README and AGENTS.md link none of them, and they speak in
    the present tense ("Nothing is pushed", REWORK.md L3).
  - GRANTS.md L13 "Today that job needs a source edit" is superseded (`config/installation.ts` L5).
  - Repair: the settled patch adds banners. Moving the files is a structural change for Justin.
- **F19. Of the nine processes kept on 4 Oct, only Danger's checks run by themselves**
  (`.github/workflows/danger.yml` is the only workflow).
  - Tests on a pull request: none (#144).
  - Entropy guard: none existed before this run.
  - Daily diary (`tools/report.mjs`): run by hand. Its snapshots stop at `reports/2026-10-02.json`, and its
    predecessor "stopped because nothing ran it each day" (`report.mjs` L11-12).
  - Decided but not built: FRICTION into rules (#60), cleanup (#70, #182).
  - The merge rule "once review and tests pass" relies on tests run by hand.
  - All of these wait on #166.
- **F20. Unknown: hooks and instruction loading.**
  - Hooks: both `.githooks/pre-push` files only print a summary. Whether either is enabled cannot be seen without
    `.git`.
  - Instructions: the lab has `CLAUDE.md` → `AGENTS.md`; ORC has only `AGENTS.md`. Whether a Claude Code session in
    ORC loads it is unknown.

**The reach search behind F7-F13**, run on ORC's `src/`, `scripts/` and `config/` on 2026-10-07:
- **Subprocesses:** `node:child_process`, `spawn(`, `execFile(`, `fork(`, `StdioClientTransport`, `chromium.launch`.
- **Network:** `fetch`, `node:http(s)`, `node:net`, `node:tls`, `node:dgram`, `WebSocket`, `createServer`, `.listen(`,
  `playwright`, `@modelcontextprotocol`.
- **Credentials:** `process.env`, `ORCHESTRATOR_*`, `ORC_*`, `readScopeCredential`.
- **What it found:** subprocesses in `child-agent-process.ts`, `analysis-tools.ts`, `mcp/client.ts`,
  `orc-service.ts` and `playwright.ts`. Network calls in `research-tools.ts`, `ntfy.ts` (also reached through
  `phone/index.ts`) and `playwright.ts` (Chromium); listening servers in `web-server.ts`/`web-cli.ts` and the local
  lock socket in `file-lock.ts`. Development-only launches in `scripts/` (`build.mjs`, `dev-web.mjs`,
  `update-pi.mjs`, `orc-service.ts`).
- **Not searched:** Scope package code (not in the targets), Pi's internals, and the MCP servers ORC may be
  configured to launch.

## 5. Ranked risks (decay rate × recovery cost)

1. **The state file (F16, F17, F1).**
   - Decay: hours. STATE.md records thirteen timestamped events on 4 Oct.
   - Recovery: high. Wrong answers about live services reach Justin, and decisions are lost at the next overwrite.
   - Anchor: lab AGENTS.md "Keeping state" and the new decisions record.
2. **ORC's reach claims (F5, F7-F13).**
   - Decay: weekly. Library browser (3 Oct), phone connector (2 Oct) and restart card (1-2 Oct) each changed it.
   - Recovery: high. Security reviews and the architecture tests are read as the boundary.
   - Anchor: ORC AGENTS.md "Boundaries".
3. **No decision surface (F2).** Decay: every decision. Recovery: high, because a lost decision gets asked again.
   Anchor: Q2.
4. **The state-directory seam (F15).** Decay: every operator command and diary run. Recovery: medium; the failures
   are silent empty reads, recorded three times. Anchor: ORC #62.
5. **Kept processes that do not run (F19).** Decay: daily. Recovery: medium, but a diary day not snapshotted cannot
   be recovered. Anchor: #166 and #144.

## 6. Lab: truth map and the real loop (docs-first Steps 2 and 3)

**Roles of the lab's documents.**
- **Canonical:** `SCOPE.md`, `scope.yaml`, `AGENTS.md`, `decisions/`.
- **Current state:** `STATE.md`.
- **Historical:**
  - `FRICTION.md`, the dated friction log, newest first (1,402 lines);
  - `reports/`;
  - `research/`;
  - `memory/slots-run-walkthrough.md`.
- **Register:** `AGENT_IDEAS.md`, "prompts for a conversation, not approved designs".
- **Decision record kept in `memory/`:** `memory/authority-rules-step-1.md`.
- **Generated:** `status.html` and `reports/<date>.json`.
- **Product artifacts:** `tools/*.mjs`, which read ORC and GitHub by path.
- **Superseded:** the `status-tracker` project, archived (SCOPE.md L13-15).
- The concept owners are in section 3.

**The real loop.**
- **Session start, lab:** `AGENTS.md`/`CLAUDE.md` → `STATE.md` → `SCOPE.md` → the map (`node tools/map.mjs`), marking
  `working`.
- **Session start, ORC:** `AGENTS.md` → README and `test/architecture.test.ts` → the map.
- **Work tracked:** GitHub issues on orchestrator#140, shown live in GitHub Project 4.
- **During a session:** FRICTION entries for each real-use failure; reports for reviews; ideas committed one at a
  time.
- **Decisions captured** wherever the session is (F2), usually STATE.md.
- **Handoff:**
  - STATE.md, in practice appended (F16);
  - a branch and PR with a Security review section, which Danger checks;
  - Claude merges after review and hand-run tests;
  - the checkout is pulled, and Justin approves the restart card.
- **Session end:** no guard (F19). A fresh agent following the instructions would not run a session-end check today.

**State-file update (Step 5):** in `patches/settled-scope-orchestration-lab.patch`. It holds:
- the stage;
- documents to read first;
- links to the decision records;
- the active fronts, with live facts labelled as recorded on 4 Oct and not re-observed;
- what Justin is waiting on, including Q1-Q5;
- superseded material nearby;
- what makes the file stale.

## 7. Existing guard surfaces (sorted by whether they execute)

- **Runs by itself:** Danger's Security review and Package API section checks on ORC pull requests (`danger.yml`,
  `dangerfile.js`). STATE.md L79-81 records them proven on 2 Oct; not re-observed.
- **Runs only by hand:**
  - in ORC: `pnpm typecheck`, and `pnpm test` (architecture ratchets, core-ties ratchet, cause-discard ratchet,
    package-API report test), and `pnpm test:e2e`;
  - in the lab: `node tools/map.mjs --check` and `node tools/report.mjs`;
  - `SECURITY-REVIEW.md`, worked through by hand;
  - Astra reviews.
- **Decided, not built:**
  - tests on every PR (#144);
  - FRICTION into rules (#60);
  - cleanup (#70, #182);
  - scheduled processes (#166);
  - the session-end entropy guard (drafted by this run).
- **Unknown:** both `.githooks/pre-push`, which print only and never block (F20).

**Lab surfaces (docs-first Step 7):**
- Keep: `tools/map.mjs --check`, `tools/report.mjs` (schedule it under #166), FRICTION.md, `.githooks/pre-push`.
- Amend: STATE.md (settled patch); `decisions/` (extended); lab AGENTS.md (provisional: a decisions row, the pace
  rule, a handoff pointer).
- Demote: the ORC root reports (banners).

**Mechanical checks belong to tools.** These would suit:
- a link checker such as lychee, for the docs' path references;
- ast-grep, for identifiers named in prose (F7 was exactly this);
- extending `test/architecture.test.ts` (W2, W3);
- a STATE.md line-count check in the lab's hook.

Whether lychee or ast-grep is installed could not be checked from the snapshot.

## 8. The guard decision and the generator's inputs

**Decision: `create`.** No guard exists. Justin kept "entropy guard at session end" on 4 Oct (F19), and the loop has
no session-end check.

**Inputs:**
- **Steward, intent and questions:**
  - Steward: Justin.
  - Intent documents: ORC `README.md` and `AGENTS.md`; lab `SCOPE.md`, `scope.yaml`, `decisions/`,
    `memory/authority-rules-step-1.md`.
  - Decision surface: lab `decisions/`, or the issue concerned. Where ORC's decisions go is open (Q2).
  - Open questions: Q1-Q5.
- **Current-state file:** lab `STATE.md`, refreshed by the agent at each verified event (lab AGENTS.md L33).
- **Rules owned elsewhere:**
  - `~/pro/local-config/home/AGENTS.md` (not read);
  - `SECURITY-REVIEW.md` and `dangerfile.js`;
  - orchestrator#140's description (not read);
  - `HOW_NOT_TO_PLAN.md` (not read);
  - the merge rule (decisions record).
- **Verification commands:**
  - Danger runs by itself.
  - By hand in ORC: `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, `pnpm api:report`.
  - By hand in the lab: `node tools/map.mjs --check`.
- **Code areas and their docs:**
  - reach and credentials: `src/core`, `src/adapters`, `src/app/agent-packages.ts`, `config/`, documented in README
    "Credentials" and AGENTS "Boundaries", checked by the architecture tests;
  - restart: `orc-service.ts`, `orc-restart.ts`, `scripts/orc-service.ts` and `orc-env.sh`, documented in README
    "As a service";
  - package API: `src/package-api.ts`, its report and test;
  - lab tools: `tools/*.mjs`, which read ORC paths (F15).
- **Live state a session can change:** `orc.service` and its build, cards and grants, package approvals, Scope
  credentials, ntfy topics, live Bookwhen entries, Finance mail, the GitHub Project marks.
- **Findings:** F1-F20.

## 9. Patches, work items and recommendations

**Settled patches** (apply with `patch -p1` from each repository's root; checked on copies of the snapshots):
- `patches/settled-orchestrator.patch`:
  - README: F7, F11 and the "scheduling" part of F4;
  - AGENTS.md: F7, F8, F9, leaving package code visibly open;
  - banners on the ten reports and GRANTS.md (F18).
- `patches/settled-scope-orchestration-lab.patch`:
  - the new decisions record (F1);
  - the STATE.md rewrite (F16, F17).

**Provisional patches** (apply after the settled ones, only once the named question is answered as recommended):
- `patches/provisional-orchestrator.patch`:
  - README's reach paragraph, the "applying it" sentence and the "deliberately absent" list (Q3);
  - AGENTS.md on package code (Q4);
  - a decisions line (Q2);
  - a "Before handing off" pointer (Q1).
- `patches/provisional-scope-orchestration-lab.patch`:
  - the guard at `skills/session-coherence-guard/SKILL.md` (Q1);
  - AGENTS.md's decisions row (Q2), pace paragraph (Q5) and "Before handing off" section (Q1);
  - STATE.md's guard line (Q1).

**Work items.** These are defects in the work, not documents. Each joins its existing issue:
- **W1 (F12):** give `orc-service.ts`'s commands and Chromium an explicit environment, with a test that fails when a
  launched process inherits an `ORCHESTRATOR_*` value. Map B7 (#155).
- **W2 (F13):** make the architecture tests see delegated launches, such as Playwright's `chromium.launch`, so the
  lists in AGENTS.md cannot silently fall behind. Map A2 (#143) or A3 (#145).
- **W3 (F14):** guard `scripts/execution-policies.ts` and `scripts/approval-grants.ts` in `dangerfile.js`, and pin
  the whole `GUARDED` list in the test. A3 (#145).
- **W4 (F15):** one resolution of ORC's state directory for the service, operator scripts and the lab's tools.
  ORC #62.
- **W5 (F19):** tests on every PR (#144); run the diary and reviews through #166 once built.

**Recommendations:**
- Consolidate decisions in one surface (Q2).
- Move the ten ORC root reports to the lab's `reports/`, with Justin's say-so.
- Schedule the diary first, because its lost days cannot be recovered.

## 10. Uncertainties

- Whether any GitHub issue already records the decisions copied from STATE.md (F1), or #140's rules on where
  decisions go (F2).
- Which build ORC runs now, and whether the hooks are enabled (F20).
- Whether Moving Stillness's `DECISIONS.md` records decisions that lift README's "deliberately absent" items (F5).
- Whether pnpm runs any dependency's lifecycle scripts during the restart card's install (F12's size).
- Pi's own credential handling, and the MCP servers ORC may be configured to launch.

## 11. Guard generation (session-coherence-skill-generator v0.5.0)

- **What it was given:** this assessment's inputs (section 8). Unresolved inputs are left visible in the guard: where
  ORC's decisions go (Q2), and the open intent questions, by pointer to `STATE.md`.
- **Decision and path:** `create`. The guard is `guard/SKILL.md`. Its proposed home is the lab's
  `skills/session-coherence-guard/SKILL.md` (Q1, provisional patch).
- **Size: 1,051 words (`wc -w`), against a derived budget of 1,074.** The budget's terms:
  - the common contract, 706;
  - 8 repo-specific checks beyond the template's two standing ones, at 36 each, 288 (they measure about 230);
  - pointers, 50;
  - commands, 30.
  - The one sentence saying the guard spans two repositories (24 words) is the only content outside those terms.
- **Review before handover:**
  - The guard carries "Modes and safety" and binds its baseline (`<start>`, else `origin/main`).
  - Its intent-change rule is copied with Justin, the intent documents and the decision surface filled in, and marked
    v2.
  - Its repair instructions treat no work as permission to change intent.
  - Every proposed change is sorted: nothing in a settled patch touches Q1–Q5.
- **Doc references added:** a "Before handing off" section in the lab's `AGENTS.md`, and a pointer in ORC's
  `AGENTS.md`. Both are provisional on Q1.
- **Validation run:**
  - On fresh copies of both snapshots, the settled patches applied cleanly, then the provisional ones, with
    `patch -p1`.
  - Changed files have no trailing whitespace.
  - Every repository path that the patched `README.md`, `AGENTS.md` and `STATE.md` cite exists.
  - Not run: `git diff --check` inside the targets (no `.git`), and ORC's tests (no `node_modules`).
- **Handoff:** to `guards-integrator`. See `integration.md`.
