# Entropy assessment: ORC and the orchestration lab

- **Assessed:** 7 October 2026, from read-only snapshots dated 4 October 2026 (the lab's `STATE.md` was updated
  2026-10-04 17:31).
- **The repositories:**
  - ORC: `orc-lab/orchestrator`, a TypeScript orchestration system;
  - the lab: `orc-lab/scope-orchestration-lab`, the Scope that manages ORC's work.
- **The snapshots have no `.git`.** So no commit history, hook configuration or branch state could be read. GitHub
  (issues, orchestrator#140, pull requests) and the running service could not be read either.
- **Route taken through the skills:**
  - `entropy-assessment` Step 1 runs the intent pass.
  - Step 2 records lifecycle and shape: B (mixed docs and code), across two repositories assessed as one system, so
    `mixed-profile.md` applies. The lab is a docs-first member, so docs-first Steps 2, 3 and 5 also run on it.
  - Step 3 decides a guard is needed, and Step 4 hands on to `session-coherence-skill-generator`.
  - The generator works in plan mode, because the targets are read-only, and hands on to `guards-integrator`.
- **Companion files:**
  - `guard/SKILL.md`: the guard;
  - `integration.md`: the integration brief;
  - `questions.md`: questions for Justin;
  - `patches/`: six applicable patches;
  - `feedback.md`: notes on the skills;
  - `read-log.md`: the skill files opened.

Finding ids (F1 to F28) are defined once, in §3. Every other section refers to them.

## 1. Intent

### Steward

**Justin.** Lab `scope.yaml`: `steward: justin` and `members: justin, role admin`. ORC's rules quote him by name and
date throughout (ORC `AGENTS.md` L11, L35-37, L117-118).

### Authorised intent, and where each part comes from

Each of these is Justin's own recorded words, attributed and dated, unless marked otherwise.

- **What ORC is for:**
  - "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece" (25 Sep).
  - "once the six slots work, work towards a point of consolidation" (26 Sep).
  - Both are in lab `STATE.md` L8-11; the first is also in `reports/2026-09-30-priorities.md` L7. The sentence before
    them in `STATE.md` (the UX surface, Iris, ADA) is unattributed.
- **Core ships with no specific Scope, model, owner or agent** (12 and 13 Sep): ORC `AGENTS.md` L30-45. It is
  enforced by `test/core-ties.ts`.
- **ORC owns a general async work capability:** schedules now, at a time, or recurring; delivery declared per task type;
  each agent works through its own facade (17 Sep). Lab `decisions/2026-09-17-async-work-architecture.md`.
- **Approval cards** come from a fixed set of blocks (26 Sep): ORC `AGENTS.md` L114-128.
- **Authority rules, step 1** (1 Oct): `memory/authority-rules-step-1.md`. Rule 1: a Scope's memory is that Scope's.
  Rule 2: nothing is allowed by default; a card allows it. Rule 4: loading a Scope needs a card. Rule 5: every decision
  is recorded and visible in one place in ORC.
- **The map of work, orchestrator#140, is the reference point** (2 Oct): ORC `AGENTS.md` L9-12; lab `AGENTS.md` L7-10;
  `tools/map.mjs` L3.
- **Security reviews are checked by Danger on GitHub** (2 Oct, "B"): `dangerfile.js` L7; lab `STATE.md` L79-82.
- **The lab's role and processes** (4 Oct interview): the lab is the central Scope for project management, core issue
  tracking, code quality and security; where issues live; nine processes kept, including "entropy guard at session
  end"; scheduling (#166) built first. Lab `STATE.md` L38-54 only (F1).
- **Merging** (25 Sep): Claude merges a PR once review and tests pass. Lab `STATE.md` L17-18 only (F1).
- **Rules with no attribution or date.** These are recorded as decisions or directives, with their authority unknown:
  - the lab's purpose (`scope.yaml`, `SCOPE.md` L3-7);
  - Pace (lab `AGENTS.md` L25-29);
  - the state-file rules (lab `AGENTS.md` L31-36);
  - the lethal-trifecta and standing-grant rules (ORC `AGENTS.md` L68-90);
  - "Documentation stays concise" (ORC `README.md` L22-23).

**Rules this system is bound by but does not own.** None of these could be read in this run:

- `~/pro/local-config/home/AGENTS.md`, the user-wide rules (cited in lab `STATE.md` L15-16);
- `~/pro/agentic/HOW_NOT_TO_PLAN.md`;
- `~/pro/scope/docs/MODEL.md`;
- the rules in orchestrator#140's description.

### Declared and enacted

- **Declared:** ORC `README.md` (opening, Direction, Boundary), ORC `AGENTS.md`, lab `SCOPE.md` and `scope.yaml`.
- **Enacted, as read from `STATE.md`, `FRICTION.md` and the code** (git history was not available):
  - a browser stack driven by ORC itself;
  - Bookwhen writes by the Moving Stillness package through durable work;
  - recurring schedules in the engine;
  - standing grants, restart cards and package build cards;
  - ntfy phone notices;
  - invoicing through Finance;
  - Danger checks;
  - map tooling and the daily diary.
- **The two match in direction.** The gaps are descriptions and enforcement that lag the work.

### Gaps by condition

The intent pass sorts each gap by condition. Each finding is defined in §3.

- **Stale description:**
  - F7: README says "scheduling" is absent, and calls ORC's external paths read-only.
  - F9: `SCOPE.md` is silent on the 4 Oct role decision.
  - F10 and F11: Bookwhen text in the README and `AGENTS.md`. The core-ties decision settles these.
- **Conflict:**
  - F2: two caps for `STATE.md`.
  - F5: grant commands against Rule 2.
- **Missing:** F4, no decision record named for ORC.
- **Ambiguous:**
  - F6: "credentials are read in one place";
  - F8: Pace against the 21 Sep calibration;
  - F25: two homes named for the Scope model.
- **Unauthorised drift:** none found. What was enacted traces to recorded decisions; where it does not, the work was
  done with Justin present (restart cards: `STATE.md` L88) and is only undocumented (F11).
- **Prose control:**
  - F2: the state-file cap;
  - F15: "guarded changes go through a pull request";
  - F16: "tests pass" before merging;
  - F8: the pace gate (`FRICTION.md` L1088-1093: once satisfied "in conversation and nowhere on disk").
- **Repair instructions read against the intent-change rule:** one keeps two copies in step. F22: lab `AGENTS.md` L19,
  "`scope.yaml`, then one line in `SCOPE.md`".
- **Gaps that do not depend on intent:** F3, F12, F13, F14, F17, F21, F23 and F24 are fixed as usual.

### Questions

Four questions are asked, each with a recommended answer and reasons in `questions.md`:

- **Q1:** where ORC's decisions are recorded (F4). Recommended: the lab's `decisions/`.
- **Q2:** forty content lines or sixty lines for `STATE.md` (F2). Recommended: forty, stated once in `AGENTS.md`.
- **Q3:** who runs `pnpm grant:*` until #149 (F5). Recommended: only Justin.
- **Q4:** what "credentials are read in one place" means (F6). Recommended: one reader for each source, as a proposed
  change of wording.

`questions.md` also lists five items noted but not asked, and three proposals.

### Proposed changes, and where they are recorded

None is applied, because the targets are read-only. Each is a patch in `patches/` (§9).

- **Justin's 4 Oct decisions, his 25 Sep merge rule and his 3 Oct single-issue decisions** are copied from
  `STATE.md` to a new `decisions/2026-10-04-lab-role-and-processes.md`, the lab's existing decision owner. Copying
  them is not deciding them again.
- **ORC's north star** gets a record, provisional on Q1.
- **No intent document is changed** except as follows, each citing the decision that settles it:
  - README "scheduling", from the 17 Sep decision;
  - the README and `AGENTS.md` Bookwhen statements, from the 12 and 13 Sep core-ties decision;
  - `SCOPE.md`'s role sentence, from the 4 Oct decision, quoted in Justin's words.

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** Lab `scope.yaml`: `status: active`; project `orchestrator` is `active`; `STATE.md` was
  updated on 4 Oct. `orc.service` was serving and restarted three times on 4 Oct (`STATE.md` L31-35). The archived
  `status-tracker` project is outside these snapshots.
- **Shape: B, mixed docs and code.**
  - ORC has 33,519 lines of TypeScript in `src/` and `web/src/`, and 3,783 lines across 15 top-level markdown files.
  - The lab is docs-first: state, decisions, a friction log, 68 markdown reports, and three small scripts.
  - Shapes C (code-first: architecture, test and API drift) and D (workflow-heavy: cards, hooks, Danger, the map, the
    diary) also fit. All three route to `mixed-profile.md`, and B is taken because the costliest risks sit between
    docs and code.
- **Repositories: two, assessed as one system.**
  - The lab "owns" ORC's relationship facts and work management (`SCOPE.md` L17-24), and is by decision the central
    Scope for both (4 Oct).
  - A third repository, the Moving Stillness Scope's package, takes part in the system's main seam (F28), but is not
    in these snapshots.
- **Domains present and actively changed:**
  - code;
  - documentation;
  - tests;
  - API and data contracts: `src/package-api.api.md`, task-type declarations, card templates;
  - workflow: the map, Danger, hooks, diary and reviews;
  - live operational state: `orc.service`, grants, package approvals, credentials files, ntfy, live Bookwhen entries.

## 3. Findings

One list. Each entry gives the evidence, its source (doc = read in a document; code = read in the code or a test) and
the response. Line numbers are those of the 4 Oct snapshot.

**Intent and decisions**

- **F1. Justin's decisions are held only in the overwritten state file.** Lab `AGENTS.md` L33 says `STATE.md` is
  overwritten at each verified event. It holds, and no other file in either repository holds:
  - the 4 Oct interview decisions (L38-54);
  - the 25 Sep merge rule (L17-18);
  - three 3 Oct single-issue decisions (L57-58);
  - the 26 Sep north-star words (L10-11).
  Source: doc, checked by searching both repositories. Response: copy them to their records (patch;
  the ORC part is provisional on Q1).
- **F2. Two caps for one state file, and both exceeded.** Lab `AGENTS.md` L34 says "about forty content lines"; lab
  `STATE.md` L4 says "Target: sixty lines". The file is 99 lines (87 non-blank). The same failure is recorded three
  times before: `FRICTION.md` L866 (12 Sep, it described finished work as missing), L621 (22 Sep, two false
  statements), L536 (23 Sep, 405 lines). Nothing checks the cap. Source: doc. Response: Q2. The patch meets both
  readings and leaves both sentences unchanged.
- **F3. The state file contradicts itself.** Each of these is a docs-against-docs contradiction inside the 4 Oct
  `STATE.md`:
  - L23 says #193 is "in review, not merged"; L31 says "#193 is live: #200 merged as `3989cdb`".
  - L58 and L88 say ORC runs `369628b` since 3 Oct 22:12:47; L35 says it restarted 4 Oct 14:48:27 on `8cee662`.
  - L91 says Moving Stillness `main` is `c759f96`; L32 says MS #53 merged as `fc830aa`.
  - L94 lists grant `e9675bd9` "until 1 Oct 18:00Z", already past on the file's own date.
  Source: doc. Response: the state-file patch (§10).
- **F4. No decision record is named for ORC.** Decisions sit in six places:
  - lab `decisions/`, which has one file, an ORC architecture decision;
  - `STATE.md`;
  - `memory/`;
  - the `dangerfile.js` header;
  - ORC `AGENTS.md` quotes;
  - issues.
  Lab `SCOPE.md` L19 says "Facts about ORC belong in its repository"; ORC has no decision log. No instruction file
  says where a decision goes. Source: doc. Response: Q1.
- **F5. The grant commands write policy without a card.** `scripts/execution-policies.ts` (`pnpm grant:operation`,
  `grant:tool`, `revoke:*`) writes a standing policy from a terminal. Against it:
  - `memory/authority-rules-step-1.md` L14, affirmed 1 Oct: "nothing is allowed by default; a card allows it";
  - ORC `GRANTS.md` L60-64 and L93: new policies are asked for by card, in slice 3.
  The card path for policies is #149's work. Source: code and doc. Response: Q3; connect to #149.
- **F6. "Credentials are read in one place" has two readings.** Ambiguous:
  - the rule's own wording: ORC `AGENTS.md` L64, `SECURITY-REVIEW.md` L120, and `README.md` L103 ("exactly one place,
    `src/runtime.ts`");
  - the reads in code: `src/web-cli.ts:625`, `config/installation.ts:110`, `src/app/agent-packages.ts:466` and
    `src/adapters/scope-credentials.ts` read credential-bearing values;
  - `scripts/orc-env.sh` L4-5 reads the env file "in this one place".
  Source: code. Response: Q4. README L103 is left unchanged.
- **F7. The README lags two decisions.** Stale description:
  - `README.md` L152-154 lists "scheduling" as deliberately absent. Against it: the 17 Sep decision (schedule `now`,
    `at`, `recurring`), and `src/core/async/types.ts` L65 and L337, which implement recurring schedules.
  - `README.md` L5-7 calls ORC's external paths "read-only … published Bookwhen events …". The same decision makes
    Moving Stillness's apply, a write, run through ORC; `test/architecture.test.ts` L1315-1320 keeps Bookwhen code out
    of ORC.
  Source: code and doc. Response: correct only those words (patch). "Reminders", "workflow execution" and "additional
  external data sources" are left unchanged and noted open.
- **F8. Pace and the 21 Sep calibration.** Ambiguous. Lab `AGENTS.md` L27-29 says "one scored real use must come
  first". Justin, 21 Sep (`reports/2026-09-22-pushback-analysis.md` L129-134), relaxes proof-first building to "what
  is naturally needed". `reports/2026-09-25-direction-review-astra.md` L72 reconciles them. Source: doc. Response:
  noted, not asked (`questions.md`).
- **F9. `SCOPE.md` does not mention the lab's 4 Oct role.** `SCOPE.md` L3-7 gives the purpose without it. Source: doc.
  Response: add one sentence in Justin's words, leaving "what else" open (patch).

**Documents against the code**

- **F10. A dead Bookwhen paragraph in the README.** `README.md` L76-79 says to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN`,
  for "exact-pinned `@jphil/bookwhen-client@0.6.1`". No code reads that variable; `package.json` has no such
  dependency; `test/architecture.test.ts` L1315-1316 asserts both stay absent. Open Fridays now come from a Scope
  package contribution (`src/runtime.ts` L259). Source: code. Response: patch.
- **F11. ORC `AGENTS.md` "Boundaries" has drifted from the tests that enforce it.** It is parallel truth, in three
  places:
  - Subprocess modules: three named at L92-96, four approved by `test/architecture.test.ts` L823-835. The fourth is
    `src/adapters/orc-service.ts`, "from orchestrator#101".
  - L102-103 calls `src/bookwhen.ts` "the only module that imports the pinned Bookwhen client". The file does not
    exist, and the test asserts no module imports it.
  - L47 says the core-ties scan covers "`src/` and `web/src/`"; `test/core-ties.ts` L7-8 scans `config/` as well.
  Source: code. Response: patch. The subprocess hunk is provisional on #101.
- **F12. The README names almost none of the environment.** The code reads 19 `ORCHESTRATOR_*` environment variables
  (`ORCHESTRATOR_VERSION` is a constant). `README.md` names three, one of them dead (F10). There is no `.env.example`,
  though `.gitignore` allows one. Source: code. Response: a test or an `.env.example` (§9). The guard checks it
  meanwhile.
- **F13. Two lists of guarded paths, drifted.** `SECURITY-REVIEW.md` L177-181 lists the guarded paths in prose; the
  list itself is `GUARDED` in `dangerfile.js` L11-26. The prose omits `config/`, `package.json`, `pnpm-lock.yaml`,
  `test/core-ties.ts`, `scripts/source-headers.js` and two scripts. The PR template already says "the list is in
  dangerfile.js". Source: code. Response: reduce the prose to a pointer (patch).

**Enforcement and workflow**

- **F14. Danger does not guard four authority scripts.** `dangerfile.js` L3 says it owns "which paths change what an
  agent can reach". `GUARDED` omits:
  - `scripts/execution-policies.ts` (grants operations and tools);
  - `scripts/approval-grants.ts` (standing grants);
  - `scripts/activate-research-agent.ts` (activation);
  - `scripts/orc-env.sh` (ORC's credentials and configuration).
  Source: code. Response: add them (patch). It widens the check and decides nothing new.
- **F15. The security-review check warns, and does not block.** `SECURITY-REVIEW.md` L53-55 and ORC `AGENTS.md`
  L141-143: a direct push to `main` is not checked, and "without GitHub Pro a failed check warns rather than blocks a
  merge". The docs say so honestly. "Guarded changes go through a pull request" is prose. Enforcement would sit in
  branch protection, or in a pre-push refusal on `main`. Nothing cites it as stronger than it is. Source: doc.
  Response: noted; the merge rule depends on the check being green.
- **F16. Tests do not run on pull requests.** `.github/workflows/` holds only `danger.yml`. The merge rule (25 Sep)
  requires "tests pass", which only the merging agent's local run attests. "Tests on every PR (#144)" was kept on
  4 Oct; the mechanism is still waiting on Justin (`STATE.md` L69). Source: code and doc. Response: connect to #144.
  Until then, the guard runs the tests.
- **F17. Processes decided as kept have lapsed while they run only by hand.**
  - The daily diary, `status.html`, was last generated "2026-10-02 · generated 08:45 UTC". `reports/` holds
    snapshots for 3 and 7 Sep, then 29 Sep to 2 Oct only.
  - The diary stopped once before because "nothing ran it each day" (`tools/report.mjs` L11-12, orchestrator#64).
  - `node tools/map.mjs --check` runs by hand, or inside the diary.
  Source: doc and code. Response: connect to #166.
- **F18. "Entropy guard at session end" was decided, but does not exist.** It is decided in `STATE.md` L49. No guard
  exists in either repository; lab `skills/` holds only `.gitkeep`. Source: doc. Response: the guard this run
  generated (§12).
- **F19. Whether the pre-push hooks run is unknown.** Both `.githooks/pre-push` files only print `push-summary` and
  exit 0. Whether `core.hooksPath` is set cannot be read from these snapshots. `FRICTION.md` L541-545 records a
  committed Moving Stillness hook that never ran. Source: code and doc. Response: verify (`integration.md`).
- **F20. The approval-card renderer is outside the guarded paths.** `web/src/durable-work.tsx` renders approval
  cards. ORC `AGENTS.md` L76-80 makes "human approval that shows the actual effect" a control, but `GUARDED` covers
  no part of `web/`. Source: code. Response: proposal to Justin (`questions.md`).

**Structure of the documents**

- **F21. The lab's routing table leaves out `FRICTION.md`.** Lab `AGENTS.md` L12-19, "Where a learning goes", does not
  mention it. Yet `STATE.md` L4 names it as the home of "what broke in real use", it has dated entries from 3 Sep to
  4 Oct, and the 4 Oct decision keeps "FRICTION into rules, monthly". This is workflow drift. Source: doc. Response:
  add a row (patch).
- **F22. An instruction to keep two copies in step.** Lab `AGENTS.md` L19: "`scope.yaml`, then one line in
  `SCOPE.md`". `SCOPE.md` L9-15 restates the projects in `scope.yaml`. Source: doc. Response: keep `SCOPE.md`'s lines
  as a summary of `scope.yaml`, which owns the inventory; the guard's two-documents check covers it.
- **F23. Superseded branch reports at ORC's root.** `REWORK.md` L3 says "Nothing committed, nothing pushed";
  `SEAM.md` L12 and `OPERATOR.md` L12 say "Nothing is pushed"; `FIXES.md` is a branch report too. They sit beside the
  live docs, unmarked. `MCP.md` has a history banner, which is the precedent. Source: doc. Response: add banners
  (patch); moving them is a proposal.
- **F24. Report volume, and a raw transcript filed as a report.** The lab has 68 markdown reports; 23 files in
  `reports/` are dated 1 to 4 Oct. `reports/2026-09-17-async-review-critical.md` is a raw session transcript of 126
  JSONL records, not a report. The 25 Sep direction review recommended "one report per decision"; that was a review's
  advice, not a decision. Source: doc. Response: cleanup item (§9).
- **F25. Two homes named for the Scope model.** ORC `AGENTS.md` L59 points to
  `pro/agentic/agentic-architecture/MODEL.md`; lab `SCOPE.md` L24 says `pro/scope/docs/MODEL.md` "remains
  authoritative". Not verified. Source: doc. Response: noted.
- **F26. ORC has no `CLAUDE.md`.** The lab's `CLAUDE.md` is a symlink to `AGENTS.md`; ORC has none. If Claude Code
  does not read `AGENTS.md`, ORC's rules, and the guard's pointer, do not reach Claude Code sessions in ORC. Not
  verified. Source: code. Response: verify (`integration.md`).
- **F27. A third hand-kept list of the system's repositories.** `tools/collect.mjs` L19-26 hard-codes six
  repositories and their local paths, beside `scope.yaml` (two resources) and the #140 map. The 4 Oct decision ("a
  Scope's issues stay in its own repository, on one central map") means the four extra are not lab resources, so this
  is a view list, not an inventory. Source: code. Response: noted. It is low risk.
- **F28. ORC and its packages must change together, and nothing tests them together.** `STATE.md` L26-28: ORC #200
  and MS #53 "must go live together". #202 records that packages cannot test against ORC's real parts. Danger's
  "Package API" check covers only `src/package-api.api.md`. Source: doc and code. Response: a guard check; connect to
  #202.

## 4. Which document owns which truth

This is docs-first Step 2, run on the lab with ORC's documents included, because the concepts cross repositories.

**The role of each document:**

- **Canonical:**
  - lab: `scope.yaml`, `SCOPE.md`, `AGENTS.md`, `decisions/`;
  - ORC: `README.md`, `AGENTS.md`, `SECURITY-REVIEW.md`, `test/architecture.test.ts`, `test/core-ties.ts`,
    `dangerfile.js`.
- **Current state:** lab `STATE.md`; `status.html`, a generated projection.
- **Local elaboration:**
  - lab `memory/`;
  - ORC `VISIBILITY.md`, `TURN-RECORD.md`, `CLASSIFY.md`, `GRANTS.md` (a design, partly built), and `MCP.md` (whose
    browser sections are history).
- **Product artifact:** lab `tools/*.mjs`, both `.githooks/pre-push`, the ORC PR template, and
  `src/package-api.api.md` (generated).
- **Logs and registers:** `FRICTION.md` (newest first), `AGENT_IDEAS.md`.
- **Historical:**
  - lab `reports/` and `research/`;
  - ORC `REWORK.md`, `SEAM.md`, `OPERATOR.md`, `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`, `GRANTS-E2E.md`.

**The truth map** gives each concept one canonical home:

| Concept | Canonical home | Also stated in | Finding |
|---|---|---|---|
| What ORC is for | Justin's words, now only in lab `STATE.md` | ORC `README.md` "Direction" (declared) | F1, Q1 |
| What the lab is for | `scope.yaml`, `SCOPE.md`; the 4 Oct decision | lab `README.md` (a summary) | F1, F9 |
| Boundaries: tools, subprocesses, network | `test/architecture.test.ts` | ORC `AGENTS.md`, `README.md` "Boundary" | F11 |
| Core ties | `test/core-ties.ts` | ORC `AGENTS.md` | F11 |
| Guarded paths | `dangerfile.js` `GUARDED` | `SECURITY-REVIEW.md`, the PR template | F13, F14 |
| Package API | `src/package-api.api.md`, plus its test and Danger | ORC `AGENTS.md` (a summary) | none |
| Async work design | lab `decisions/2026-09-17-…` | ORC branch reports | F23 |
| Grants and policy | the code; `memory/authority-rules-step-1.md` (target rules) | `GRANTS.md`, `POLICY-STORE.md`, ORC `AGENTS.md` | F5 |
| Credentials | `scripts/orc-env.sh`, `scope-credentials.ts` | README, ORC `AGENTS.md`, `SECURITY-REVIEW.md` | F6 |
| Configuration | the code; `~/.config/orchestrator/env` | README "Run" (partial) | F10, F12 |
| Current state | lab `STATE.md` | none | F2, F3 |
| Decisions | none named | six places | F4 |
| Learnings and friction | `FRICTION.md`, `memory/` | none (missing from the routing table) | F21 |
| The map and its rules | orchestrator#140's description | both `AGENTS.md`, `STATE.md`, `tools/map.mjs` (`MAP_ROOT`) | none |
| Repositories in the system | `scope.yaml` | `SCOPE.md`, `tools/collect.mjs` | F22, F27 |
| The Scope model | not settled | ORC `AGENTS.md`, lab `SCOPE.md` | F25 |

## 5. The real loop

This is docs-first Step 3; `guards-integrator` reuses it.

1. **How a session starts.** An agent (Claude Code, Codex, opencode or Pi) opens a worktree of ORC, or the lab.
   - In the lab, `CLAUDE.md`, which links to `AGENTS.md`, sends it to `STATE.md`, then `SCOPE.md`, then #140 through
     `node tools/map.mjs`.
   - In ORC, `AGENTS.md` sends it to `README.md`, `test/architecture.test.ts` and #140. ORC has no `CLAUDE.md` (F26).
   - The user-wide rules load from outside.
2. **How work is tracked.** GitHub issues sit under #140, marked with `map.mjs working` and `stopped` and shown in
   GitHub Project 4.
3. **How a change lands in ORC.**
   - A branch, then a PR. Danger checks the "Security review" and "Package API" sections.
   - Claude merges once review and local tests pass (F16), pulls the checkout, and stops.
   - ORC raises a "Restart ORC onto <commit>" card, and Justin approves it.
   - Package changes need build cards. ORC and a package often must go live together (F28).
4. **How a change lands in the lab.** Commits; there is no CI. The pre-push hook prints a summary (F19).
5. **Where decisions are captured.** Spoken in a session. Then written into `STATE.md` (F1), sometimes into
   `decisions/` or `memory/`, sometimes into a code comment or an issue (F4).
6. **Where learnings are captured.** A `FRICTION.md` entry most days, `memory/`, and a report in `reports/` (F24).
7. **Where the handoff is.** `STATE.md` is overwritten "at each verified event". After 22:00, work stays on branches.
8. **The regular jobs.** The diary and the weekly review run by hand (F17).

**Where follow-up gets lost:**

- decisions overwritten with `STATE.md`;
- false or contradictory state (F2, F3);
- marks left on the map (`map.mjs` flags marks older than 14 hours);
- diary days not run;
- guarded changes pushed straight to `main` (F15).

## 6. Ownership across the repositories

This section follows `mixed-profile.md`.

**Who owns what:**

- **ORC owns** the runtime, boundaries, the package API, the security-review check, and the operator surface.
- **The lab owns:**
  - the map tooling;
  - state;
  - decisions about the Scope and, so far, about ORC;
  - friction;
  - reports;
  - Scope-owned agent context.
- **The Moving Stillness package owns** the Bookwhen tools, the executor and its card text (outside these snapshots).

**Concepts with two homes:**

- decisions (F4);
- boundary lists (F11);
- guarded paths (F13);
- the state-file cap (F2);
- the Scope model (F25);
- the repository list (F27);
- the credentials rule (F6);
- reports at ORC's root against the lab's `reports/` (F23).

The costliest seam is ORC against its packages (F28). Each side is tested alone, and the pair went live together on
4 Oct by hand.

## 7. Ranked risks

Ranked by decay rate times recovery cost.

1. **Decisions lost, and state stated wrongly, through the overwritten `STATE.md`** (F1, F2, F3, F4).
   - **Decay: fast.** The file is rewritten at every verified event. It has been wrong four times: 12, 22 and 23 Sep,
     and now on 4 Oct.
   - **Recovery: high.** A lost decision has to be asked of Justin again. A false claim is repeated to him as fact
     (`FRICTION.md` L621).
   - **Anchor:** `decisions/` and the state-file patch.
2. **Ways to change authority that lie outside the enforced checks** (F5, F14, F15, F20).
   - **Decay: moderate.** It moves whenever a grant, approval or card path changes.
   - **Recovery: high.** A widened policy acts with no card, and a card that hides a fact gets approved.
   - **Anchor:** `GUARDED` in `dangerfile.js`, `memory/authority-rules-step-1.md`, #149, #137.
3. **Prose about boundaries and configuration drifting from the code that enforces them** (F6, F7, F10, F11, F12,
   F13, F28).
   - **Decay: per boundary change.** Seven instances were found in one snapshot.
   - **Recovery: moderate.** Security reviewers and fresh agents work from the prose. `FRICTION.md` L373, 27 Sep: "the
     entry-lookup instruction named a tool that was gone, and I copied it".
   - **Anchor:** `test/architecture.test.ts` and `dangerfile.js`.
4. **Processes decided but not running** (F16, F17, F18, F19).
   - **Decay: fast.** The diary lapsed within days of its rebuild.
   - **Recovery: mixed.** A missed day's snapshot can never be taken (lab `README.md` L19-24). An untested merge is
     found late.
   - **Anchor:** #166 and #144.
5. **Superseded material beside live truth** (F21, F22, F23, F24).
   - **Decay: slow.**
   - **Recovery: moderate.** An agent revives a superseded design or claim.
   - **Anchor:** the banners and the routing table.

## 8. Existing guard surfaces, by whether they execute

- **Runs by itself:** Danger on every GitHub pull request to ORC: the Security review and Package API sections
  (`.github/workflows/danger.yml`). It warns rather than blocks (F15).
- **Runs only by hand:**
  - `pnpm typecheck` and `pnpm test`, which include the architecture, core-ties, cause-discard and package-API-report
    tests;
  - `pnpm test:e2e`;
  - `node tools/map.mjs --check`;
  - `node tools/report.mjs` (the diary);
  - the `SECURITY-REVIEW.md` questions;
  - the weekly Astra review;
  - `pnpm pi:check`;
  - `pnpm service:status`.
- **Decided, not built:**
  - tests on every PR (#144);
  - scheduled processes through #166: the diary, the weekly review, FRICTION into rules (#60), branch cleanup (#70),
    `/tmp` cleanup (#182);
  - the session-end entropy guard (F18);
  - the label check (the proposal waits on Astra);
  - card-based policy granting (#149);
  - approvals bound to builds (#137);
  - an independent outcome read for each grantable task type (#74).
- **Declared, but missing:**
  - the state-file cap check (F2);
  - the pace gate (F8);
  - "every new issue is placed on the map", which nothing checks except by hand.
- **Unknown:** whether either `.githooks/pre-push` is enabled (F19). Neither blocks anything in any case.

## 9. Recommendations and one-time cleanup

Each patch below was applied to copies of the snapshot files, in this order, and every one applied cleanly. Apply
patches in ORC through a pull request: they touch guarded files. Suggested Security review section: "No new
authority: corrects documentation, adds four scripts to `GUARDED`, adds history banners."

| Patch | What it does | Findings | Open questions it touches |
|---|---|---|---|
| `patches/orc-corrections.patch` | README (scheduling, external paths, Bookwhen paragraph); `AGENTS.md` (Bookwhen sentence, core-ties roots); `dangerfile.js` (four scripts); `SECURITY-REVIEW.md` (list becomes a pointer); banners on four branch reports | F7, F10, F11, F13, F14, F23 | None. It leaves README L103 (Q4) and the other "deliberately absent" words unchanged. |
| `patches/orc-provisional-subprocess-list.patch` | Adds `orc-service.ts` to `AGENTS.md`'s subprocess list | F11 | Provisional on orchestrator#101 recording Justin's approval. |
| `patches/lab-state-and-decisions.patch` | New `decisions/2026-10-04-lab-role-and-processes.md`; `STATE.md` rewritten; `SCOPE.md` role sentence; two routing rows in `AGENTS.md` | F1, F2, F3, F9, F21 | Q2: both cap sentences unchanged, and the file meets both readings (37 content lines, 60 lines). Q1: only lab decisions go to lab `decisions/`. "What else the lab covers" is left open. |
| `patches/lab-provisional-orc-north-star.patch` | New `decisions/2026-09-25-orc-north-star.md`; `STATE.md`'s north star becomes a link | F1 | Provisional on Q1 = (a). |
| `patches/lab-guard-placement.patch` | Adds the guard as `skills/session-coherence-guard/SKILL.md`, and a "Before handing off" section in lab `AGENTS.md` | F18 | None. The guard leaves Q1 and Q2 visible. |
| `patches/orc-guard-pointers.patch` | "Before handing off" in ORC `AGENTS.md`; a "Session coherence" section in the PR template | F18, F26 | None. |

**Cleanup that is not in a patch.** Each item was checked against the current file:

- File the map follow-ups listed in `STATE.md` L65-66 as issues on #140. The rewritten `STATE.md` keeps them until
  that is done.
- Confirm that orchestrator #194 and Moving Stillness #52 carry Justin's 3 Oct decisions. The decision record says so.
- Mark `reports/2026-09-17-async-review-critical.md` as a raw transcript in its first line, or replace it with the
  review's text (F24).
- Add `.env.example` (allowed by ORC's `.gitignore`) listing the 19 environment variables, and a test that every
  `ORCHESTRATOR_*` name read in `src/` or `config/` appears in it (F12). This is mechanical, so it goes to a test rather
  than the guard.

**Consolidate or demote:**

- ORC `AGENTS.md` "Boundaries" and `SECURITY-REVIEW.md` keep the rules, and name the test or `dangerfile.js` for the
  exact lists (F11, F13).
- The branch reports are marked historical now; moving them to the lab is a proposal for Justin.

## 10. Bringing the state file up to date

This is docs-first Step 5. The existing file, lab `STATE.md`, is rewritten; no competing summary is added. The patch is
`patches/lab-state-and-decisions.patch`.

**What changed:**

- **Its contents now:**
  - the stage;
  - the documents to read first;
  - the settled decisions, each linked to its record;
  - the live facts, kept apart and labelled "as recorded on 4 Oct: re-read before stating any of it";
  - the open items waiting on Justin, including this assessment's four questions;
  - misleading material nearby;
  - three next actions.
- **Staleness:** the file now says what makes it stale and who rewrites it.
- **History removed:** the restart times of #199 and #201, the Phone section and the power cut. They are in
  `FRICTION.md` and git.
- **Contradictions resolved toward the later verified statement:** #193 merged; ORC on `8cee662`; MS #53 `fc830aa`.
  The expired grant is stated as expired.
- **Kept verbatim:** the cap sentence (L4) and the north star.
- **No live fact was refreshed.** None could be read; each is labelled with its 4 Oct date.

## 11. Is a guard needed, and what was handed on

- **Step 3: a guard is needed.** The system is active; Justin decided a session-end entropy guard on 4 Oct (F18); and
  three of the five ranked risks arise inside sessions (1, 3 and 5). No existing guard exists to refine.
- **Step 4: handed to `session-coherence-skill-generator`:**
  - the Intent section (§1);
  - the analysis (§§3-6);
  - the ranked risks (§7);
  - the guard surfaces (§8).

## 12. The generator's report

- **Mode:** plan or suggest-only, because the targets are read-only. The guard is drafted in `guard/SKILL.md`; it is a
  cross-repository guard, which the generator's default is to discuss first. Build mode would add
  `skills/session-coherence-guard/SKILL.md` to the lab, and edit lab `AGENTS.md`, ORC `AGENTS.md` and
  `.github/pull_request_template.md` (both pointer patches).
- **Input check.** Present: the steward; the intent documents; the decision surface, except for ORC (Q1); the open
  questions; the state file and who refreshes it; the verification commands, and which of them run by themselves
  (Danger only); each code area against its docs and tests; the live state (`orc.service`, grants, package approvals,
  credentials files); the findings. Named but not read: the rules the system does not own (§1). No spending policy was
  found in either repository; the user-wide file may hold one.
- **Guard:** `guard/SKILL.md`, proposed home `scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`.
  - **Size:** 939 words.
  - **J:** 11 justified checks.
  - **Budget:** 450 + 36 × 11 + S 85 + C 67 = 998 words. It is within budget.
  - **Each check traces to findings:**
    1. boundaries: F11, F7;
    2. configuration: F10, F12, F6;
    3. guarded paths: F14, F13;
    4. authority changes: F5;
    5. the package seam: F28;
    6. map hygiene: F17;
    7. state-file honesty: F2, F3;
    8. decisions recorded: F1, F4;
    9. learnings routed: F21;
    10. root reports: F23;
    11. one owner for each concept: F22, F25.
- **Doc references proposed:** "Before handing off" in both `AGENTS.md` files, and "Session coherence" in ORC's PR
  template.
- **Validation:**
  - every patch applied cleanly to copies of the snapshot files;
  - no added line has trailing whitespace (the `git diff --check` equivalent, since there is no git);
  - the patched `dangerfile.js` parses (`node --check`), and its four new patterns match their paths.
  - The guard itself has not been run: there was no session to check.
- **Review before handover:**
  - Every patch was read against Q1 to Q4 and the noted items (table in §9). The guard's intent rule and state check
    were reworded so that they do not settle Q1 or Q2.
  - Every repair instruction in the guard was read against the intent-change rule.
  - The size is within budget.
- **Open questions the guard leaves visible:** Q1 (no decision record for ORC) and Q2 (the cap). Q3 and Q4: the guard
  reports and does not enforce.
- **Handoff:** to `guards-integrator`, in `integration.md`.

## 13. Next step

Justin answers Q1 to Q4. Meanwhile, these patches are independent of the questions and can be reviewed:

- `orc-corrections.patch`;
- `lab-state-and-decisions.patch`;
- the two pointer and placement patches.

Next comes the adoption check in `integration.md`: a fresh session in each repository names the guard, and one real
session's report appears in a PR.

## 14. Uncertainties, and what was not covered

- **Not readable in this run:**
  - git history, so the enacted reading rests on `STATE.md`, `FRICTION.md`, reports and code;
  - hook configuration;
  - GitHub: #140's rules, the issues, PR states, orchestrator#101;
  - the running service and its live grants;
  - the user-wide rules file, `HOW_NOT_TO_PLAN.md`, both `MODEL.md` files;
  - the Moving Stillness package.
- **Not checked:** whether `lychee` or other tools are installed on the machine (the guard runs lychee only if
  `command -v` finds it); whether Claude Code loads ORC's `AGENTS.md` (F26).
- **Read only in part:** the 68 lab reports and `FRICTION.md` (1,402 lines) were read in the sections a finding
  needed. ORC's source was searched by pattern and read at the sites cited, not in full. `AGENT_IDEAS.md` was read
  only in outline.
- **No tests were run.** The snapshot has no `node_modules`, and installing is out of scope.
- **Line numbers are those of the 4 Oct snapshot.** The ranking in §7 is judgement, from the evidence cited.
