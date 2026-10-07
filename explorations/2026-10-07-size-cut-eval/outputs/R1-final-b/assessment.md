# Entropy assessment: ORC and the orchestration-lab Scope, as one system

Run on 2026-10-07 by Claude, following entropy-guard's `entropy-assessment` (route B, with the docs-first steps on the
lab). The targets are read-only snapshots taken on 2026-10-04 (lab files dated 17:31): no `.git`, no GitHub, no live
service. Every live fact below is as the snapshot recorded it, not re-read.

**This is not the run Justin decided on.** The lab's `STATE.md:54` records his decision of 4 Oct: "Astra runs
entropy-guard's assessment on ORC and the lab together. Justin is shaping the brief before it runs." This run is a
test of the skills by Claude, with no steward present. Its questions and patches are proposals.

Files written with it:
- `questions.md`: the five questions for Justin, each with a recommended answer.
- `guard/SKILL.md`: the session-end guard (decision `create`), provisional on question Q4.
- `integration.md`: where the guard sits in the real loop, and what is verified (nothing yet).
- `lab.patch`: the lab's `STATE.md` brought up to date, a new decision record, and a README fix.
- `orc.patch`: ORC documentation corrections that the evidence settles, and historical banners.
- `feedback.md`: notes on entropy-guard's skills from this run.
- `read-log.md`: the skills files opened, in order.

---

## 1. Intent

### Steward
**Justin.** `scope-orchestration-lab/scope.yaml:6` (`steward: justin`); the scope holds the project `orchestrator`
(`scope.yaml:11-20`). ORC's own files name no steward, but quote Justin as the decider (`orchestrator/AGENTS.md:31-37`,
`dangerfile.js:7`).

### Authorised intent, with the source of each part
Kind and authority are kept apart, as the intent pass asks. "Attributed" means the text names Justin; "dated" means it
carries a date.

| # | Statement (short) | Where | Kind | Authority |
|---|---|---|---|---|
| A1 | The lab exists to "develop and operate Justin's local orchestration platform and its reusable Scope-owned agents" | `scope.yaml:5`; `SCOPE.md:5-7` | directive (scope definition) | attributed (steward field), undated |
| A2 | Facts about ORC belong in its repository; the Scope/ORC relationship belongs in the lab | `SCOPE.md:19-21`; lab `AGENTS.md:12-21` | directive | neither |
| A3 | North star: ORC is his "ChatGPT replacement, daily tool, agentic development test ground, and eventual work showpiece"; after the six slots, "work towards a point of consolidation" | `STATE.md:6-11`; `reports/2026-09-30-priorities.md:7` | decision | attributed, dated 25 and 26 Sep |
| A4 | Core ships with nothing tying it to a Scope, model, owner or agent | ORC `AGENTS.md:30-55` | decision | attributed, dated 12 and 13 Sep; enforced by `test/core-ties.ts` |
| A5 | ORC owns a general async work capability, recurring schedules included; Moving Stillness's `apply_slots` needs approval | lab `decisions/2026-09-17-async-work-architecture.md:3,19-30,171-180` | decision | attributed, dated 17 Sep |
| A6 | Security boundaries: the lethal trifecta rule, enforced controls, standing grants, subprocess and network confinement, credentials in composition roots | ORC `AGENTS.md:14-112` | directive | mostly neither; issue #20 cited for sources |
| A7 | Approval cards are drawn from fixed blocks per declared card kind | ORC `AGENTS.md:114-128` | decision | attributed ("the operator"), dated 26 Sep |
| A8 | The map of work, orchestrator#140, is the reference point for all work | both `AGENTS.md`; `tools/map.mjs:4` | decision | attributed, dated 2 Oct |
| A9 | 4 Oct interview: the lab is the central Scope for project management, issue tracking, code quality and security; where issues live; nine processes kept; scheduling (#166) first; Astra runs this assessment; labels wait; MS paused | `STATE.md:33,38-55` only | decision | attributed, dated 4 Oct |
| A10 | Claude merges a PR once review and tests pass | `STATE.md:17` only | decision | attributed, dated 25 Sep |
| A11 | Security reviews are checked on GitHub by Danger; git cleanup by Worktrunk and gh poi | `STATE.md:76-82`; `dangerfile.js:7` | decision | attributed, dated 2 Oct |
| A12 | Authority rules 1, 2, 4 and 5 affirmed; 3 and 6 open | lab `memory/authority-rules-step-1.md` | decision | attributed, dated 1 Oct |
| A13 | Pace: `HOW_NOT_TO_PLAN.md` governs new design work | lab `AGENTS.md:25-29` | directive | neither; the file it names is outside this run |
| A14 | ORC's declared direction (Iris, ADA, Scope-owned agents) and boundary ("wide eyes, narrow hands", "Deliberately absent") | ORC `README.md:9-23,138-154` | description | neither |

**Declared** (A1, A14): a local-first personal agent platform, narrow in reach, whose agents belong to Scopes.
**Enacted** (`STATE.md`, `FRICTION.md` 26 Sep to 4 Oct, the code): the browser stack (#193, #76), the package API
version (#201), restart cards, phone notices, invoicing through the finance Scope, Danger checks, the map tooling, and a
durable-work engine with recurring schedules. **Authorised** (A3 to A12): all of that is covered by recorded decisions
except three boundary extensions (gap I1) and one vocabulary change (F11). The direction review of 25 Sep
(`reports/2026-09-25-direction-review.md:20-21`) found most open issues served no declared goal; A8 and A9 have since
put every issue on one map, so that is no longer a gap in the recorded intent.

### Gaps by condition
Each gap points at its finding in section 4.

- **Stale description**
  - I2: ORC README "Deliberately absent … scheduling" (`README.md:152-153`) against A5 and A9. Corrected for
    "scheduling" only, in `orc.patch`. The other five items are not plainly settled and stay as written (Q2). → F4
  - I3: ORC README "calculate a slot-change plan without applying it" (`README.md:147`) against A5. Corrected. → F4
  - I4: ORC README's Bookwhen token paragraph (`README.md:76-79`) and `AGENTS.md:102-103` (`src/bookwhen.ts`) against
    A4 and the test that enforces it (`test/architecture.test.ts:1315-1320`). Corrected. → F4
- **Conflict**
  - I5: the `STATE.md` cap. Lab `AGENTS.md:34` says "about forty content lines"; `STATE.md:4` says "Target: sixty
    lines". No decision settles it. Both are kept; Q3. → F3
- **Missing**
  - I6: no durable record of A3, A9, A10 or the 3 Oct decisions. Each lives only in a file that is overwritten at
    every verified event. Recorded in `lab.patch`, not decided again. → F1
- **Ambiguous**
  - I7: "Deliberately absent" in ORC README. Does it mean ORC's core, or the installation with its Scope packages?
    Concrete case: the finance Scope writes `invoicing.json` into the Waterlands vault through ORC (`STATE.md:72-73`).
    Under the first reading that is fine; under the second it is a "file edit" with no recorded decision. Q2.
  - I8: "Do not duplicate repository facts here" (lab `AGENTS.md:21`) against `STATE.md` recording ORC's running build,
    restarts and test counts. Concrete case: `STATE.md:88` "main process started 2026-10-03 22:12:47 on `369628b`".
    Under one reading it is project state and belongs; under the other, only `pnpm service:status` should hold it. Q5.
    → F15
- **Unauthorised drift, or authorised and unrecorded** (the evidence cannot tell which)
  - I1: three code paths go beyond what ORC `AGENTS.md` "Boundaries" prescribes. No recorded decision for any of them
    was found in either repository. Pull request descriptions were not readable. Q1. → F5
- **Prose control**
  - I9: "Merge only when it is green" (`SECURITY-REVIEW.md:53-55`) and "Claude merges a PR once review and tests pass"
    (A10). Nothing runs the tests (`.github/workflows/` holds only `danger.yml`), and without GitHub Pro a failed Danger
    check "warns rather than blocks a merge" (`SECURITY-REVIEW.md:54-55`). Enforcement would sit in #144 plus a required
    status check. A10 cites the rule as the merge control. → F7
  - I10: "capped at about forty content lines … Overwrite … do not append" (lab `AGENTS.md:33-36`). Nothing checks it,
    and the file is 99 lines and appended through the day. → F3

### Existing guards' repair instructions, read against the intent-change rule
No session guard exists in either repository (searched both for "entropy" and for guard skills; `skills/` in the lab
holds only `.gitkeep`). The executing surfaces carry repair text, checked here:
- `dangerfile.js:66-73`: "Work through SECURITY-REVIEW.md, then add … a `## Security review` heading". **Intent:**
  no flag. **Ownership:** no flag.
- `test/core-ties.ts:6-7`: "A count may only fall, and the allowance must fall with it in the same change". **Intent:**
  no flag; it tightens. **Ownership:** no flag; the allowlist is the single owner.
- ORC `AGENTS.md:132`: "After changing what it exports, run `pnpm api:report`". **Intent:** no flag.
  **Ownership:** no flag; the report is a generated projection.
- ORC `README.md:158-162`, Pi "pinned in four places", kept in step by `pnpm pi:update`. **Ownership:** a versioned
  copy that pnpm's overrides require, moved by one script. Not a competing definition; no flag.
- Lab `AGENTS.md:19`: "`scope.yaml`, then one line in `SCOPE.md`". **Ownership:** flagged, mildly. It keeps the
  resource inventory in step in two places. The line in `SCOPE.md` is a summary, so this is allowed if it stays correct.
  Today it is correct (`SCOPE.md:11-15` against `scope.yaml:10-31`).

### Questions
Five, in `questions.md`, each with its readings, a concrete case and a recommendation. In short:
- Q1: were three boundary extensions authorised? Recommended: yes, record each in `decisions/`, then update ORC
  `AGENTS.md`; look at the phone notice's free `click` link when you do.
- Q2: does "Deliberately absent" cover core or the installation? Recommended: core, with packages' reach governed by
  package approval.
- Q3: is the `STATE.md` cap forty or sixty lines? Recommended: lab `AGENTS.md` owns it, at forty; the header links to it.
- Q4: where does the guard live? Recommended: the lab's `skills/session-coherence-guard/`, with a pointer from ORC.
- Q5: may `STATE.md` keep ORC's live facts? Recommended: yes, one dated "last observed" line each, plus a pointer to
  `pnpm service:status`.

### Proposed changes, and where they are recorded
- One proposed intent change: the 17 Sep decision's `idempotency` field was replaced by `repeatEffect` and
  `submissionKey`. It is recorded in the new decision record's "Proposed, awaiting Justin" section (`lab.patch`). → F11
- The answers to Q1 to Q5 go to the lab's `decisions/` once Justin gives them.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.** `scope.yaml:7,15` (`status: active` for the Scope and the `orchestrator` project);
  `STATE.md:3` updated 4 Oct 17:31 with four ORC restarts that day (`STATE.md:31-36`). The archived `status-tracker`
  project (`scope.yaml:22-31`) is outside this assessment.
- **Shape: B, mixed docs and code,** spanning two repositories assessed as one system. Shape D (workflow-heavy) also
  fits: the map, Danger, restart cards and nine kept processes. Both route to `mixed-profile.md`. B is taken as the
  riskier, because the costliest risk (R2) sits between the docs and the code.
- **ORC** (`orchestrator/`): code-first, with a large markdown surface. It has 111 TypeScript files under `src/`,
  62 test files (970 tests and 5 E2E on 4 Oct, `STATE.md:30`), and 17 root markdown files.
- **The lab** (`scope-orchestration-lab/`): docs-first. Its surfaces are `STATE.md`, `decisions/`, `memory/`,
  `FRICTION.md` (1,402 lines), `AGENT_IDEAS.md`, 78 files in `reports/`, and three Node tools (`tools/map.mjs`,
  `collect.mjs`, `report.mjs`). The docs-first steps 2, 3, 5 and 7 were run on it (sections 5, 6 and 9).

---

## 3. Domains, and who owns what

**Domains present and actively changed:**
- code: ORC, with four merges live on 4 Oct;
- documentation: both repositories;
- tests: ORC's vitest and Playwright suites;
- API and data contracts: `src/package-api.api.md`, package manifests' task types, ORC's SQLite durable-work store;
- workflow: the map, Danger, the pre-push hooks, `STATE.md`, the diary;
- live operational state: `orc.service` and its restart cards, package build approvals, standing grants, the ntfy
  topic, Scope credentials, and Bookwhen writes through Moving Stillness (paused).

**Concepts with two homes** (the truth map in section 5 has every concept):
- steward decisions: lab `decisions/` and `STATE.md` → F1;
- ORC's running state: `pnpm service:status` and `STATE.md` → F2, F15;
- the async task-type vocabulary: the lab's 17 Sep decision, ORC's `FIXES.md`, and the code → F11;
- the guarded paths: `dangerfile.js` and `SECURITY-REVIEW.md` → F12;
- ORC's boundary statement: `AGENTS.md`, README, and `src/cli.ts` help → F4, F5, F14;
- the `STATE.md` cap: lab `AGENTS.md` and the `STATE.md` header → F3.

---

## 4. Findings

One list, numbered F1 to F18; other sections refer to these ids. The source for every finding is a file read in this run.

**F1. Justin's decisions live only in an overwritten state file.**
- What: the 4 Oct interview decisions (`STATE.md:38-55`), the 3 Oct decisions (`STATE.md:57-58`), the merge rule of
  25 Sep (`STATE.md:17`) and "MS is paused" (`STATE.md:33`) appear nowhere else in either repository.
- Why it matters: `STATE.md` "is overwritten at each verified event" (lab `AGENTS.md:33`). The lab's `decisions/` holds
  one file, from 17 Sep.
- Fix: `lab.patch` copies these into `decisions/2026-10-04-steward-decisions-from-state.md`, with source and date.
  Recording them is not deciding them again.

**F2. `STATE.md` contradicts itself on live state.** Recurring.
- `STATE.md:23` "#193 … is built and in review, not merged" against `:31` "#193 is live: #200 merged as `3989cdb`".
- `:57-58` and `:88` say ORC has run `369628b` since 3 Oct 22:12:47, against `:56` (a power cut at 11:41 on 4 Oct)
  and `:31-36` (restarts at 13:36:37, 14:03:34, 14:26:04 and 14:48:27 onto other commits).
- `:91` gives MS `main` as `c759f96`, against `:31-32` (MS #53 merged as `fc830aa`).
- `:59` says "Next on the browser stack: #118, then #52", against `:33-34` (paused, by Justin's decision on 4 Oct).
- `:74` and `:82` give two different lists of open PRs.
- `:94` says grant `e9675bd9` runs "until 1 Oct 18:00Z", in a file dated 4 Oct.
- The same failure is recorded twice before: `FRICTION.md:864-868` (12 Sep) and `:621-625` (22 Sep, "two false
  statements, both found by being asked a direct question").
- `lab.patch` resolves only what later lines in the same file settle, and labels every live fact "as recorded on
  4 Oct, not re-read".

**F3. `STATE.md` is over its cap, has two caps, and is appended to.**
- Two caps: lab `AGENTS.md:34` says about forty content lines; `STATE.md:4` says sixty.
- The file is 99 lines.
- Paragraphs time-stamped from 00:21 to 14:48 accumulate in "Where we are now" (`:23-37`), and the "Labels" bullet runs
  into unrelated facts (`:55-59`).
- Gap I5 (conflict) and I10 (prose control).

**F4. ORC README describes a system that has since changed.** Gaps I2, I3, I4.
- `README.md:5-7`: the "read-only external data paths are published Bookwhen events …" claim is wrong today. ORC carries
  no Bookwhen client (`test/architecture.test.ts:1315-1320`). Approved packages reach further through connectors: a
  browser that clicks and types (`src/adapters/browser/connector.ts:3`), and phone notices (`src/adapters/phone/index.ts`).
- `README.md:76-79`: names `ORCHESTRATOR_BOOKWHEN_API_TOKEN` and `@jphil/bookwhen-client@0.6.1`. Only tests mention the
  token; the dependency is absent from `package.json`.
- `README.md:147`: "without applying it".
- `README.md:152-153`: "Deliberately absent … scheduling", although `src/app/async/calendar.ts:5` resolves "daily and
  weekly rules".
- `orc.patch` corrects these. The external-paths replacement is marked as checked against ORC's code only, not against
  every package.

**F5. Code goes beyond three boundary statements in ORC `AGENTS.md`.** Gap I1, Q1. The text is left unchanged.
- (a) ntfy. `AGENTS.md:101-102` says "No model or agent reaches the ntfy transport, and it sends only a title, the
  notice's summary and the one configured tap address." But `src/adapters/phone/index.ts:32-38` lets an approved
  package send its own title, text, tags, and any http(s) `click` address through `publishNtfy`. `AGENTS.md:72-73`
  counts "a generated link" as an outbound channel.
- (b) Subprocesses. `AGENTS.md:92-96` names three modules. `test/architecture.test.ts:822-835` confines subprocesses to
  four; the fourth is `src/adapters/orc-service.ts` (orchestrator#101). That module runs git reads,
  `pnpm install --frozen-lockfile`, `scripts/build.mjs` and `systemctl` (`orc-service.ts:71,102,107,128`). The test's
  own comment omits `build.mjs`. Playwright's `chromium.launch` (`src/adapters/browser/playwright.ts:55`) is a delegated
  process launch that neither the text nor the test names.
- (c) Credentials. `AGENTS.md:64` says "credentials are read in one place", and `README.md:103` "exactly one place,
  `src/runtime.ts`". But `src/adapters/scope-credentials.ts:2-5` reads a Scope's credential files when a package
  activates. Other readers were not searched exhaustively.
- (d) `AGENTS.md:102-103` names `src/bookwhen.ts`, which does not exist. This one is settled by A4 and corrected in
  `orc.patch`.

**F6. Superseded material sits beside the entry docs, mostly unmarked.**
- Ten branch reports sit in ORC's root: `FIXES.md`, `REWORK.md`, `SEAM.md`, `OPERATOR.md`, `SLICE1.md`,
  `TURN-RECORD.md`, `VISIBILITY.md`, `POLICY-STORE.md`, `GRANTS-E2E.md`, `CLASSIFY.md`. Some say "Nothing committed,
  nothing pushed" (`REWORK.md:3`) or "Nothing is pushed" (`SEAM.md:12`, `OPERATOR.md:12`).
- Between them they name 13 code paths that no longer exist, among them `src/adapters/browser/service.ts`,
  `src/core/policies.ts`, `test/browser-service.test.ts` and `scripts/chmod-cli.mjs` (checked by listing every
  backticked path).
- `MCP.md` has a banner, but its "Retired implementation" says `playwright.ts` was deleted, and that file is live again.
  Its "Verification output" still reads "Pending final verification." (`MCP.md:38-46,60`).
- `orc.patch` adds historical banners. Moving the files is a structural change, so it waits for Justin's yes.

**F7. Nothing runs the tests, and Danger warns rather than blocks.** Gap I9.
- `.github/workflows/` holds only `danger.yml`.
- `reports/2026-10-01-test-suite-review.md:21` says "Nothing runs the tests", and that is still true in this snapshot.
- #144 is decided as a kept process (A9), with its mechanism open (`STATE.md:69`).
- `STATE.md:82` lists four open PRs touching guarded files with no `## Security review` section.

**F8. Six of the nine kept processes have nothing that runs them.**
- The diary last ran 2 Oct 08:45 UTC (`reports/2026-10-02.json:3`; nothing for 3 or 4 Oct). It has stopped once
  before "because nothing ran it each day (orchestrator#64)" (`tools/report.mjs:12-13`). `tools/map.mjs:13` still says
  it draws the map "every morning".
- The weekly review, FRICTION into rules (#60) and `/tmp` cleanup (#182) have no runner.
- `map.mjs --check` runs only by hand. No label check exists.
- No entropy guard exists at all.
- One cause, a missing scheduler, is already decided as the fix: #166 comes first (A9).

**F9. The lab README documents a flag that does not exist.**
- `README.md:18` documents `node tools/report.mjs --serve`, but the tool says "nothing is served" (`tools/report.mjs:13`)
  and has no such flag.
- README's "runs the test suite (~10s)" is the timing of `--no-tests`; the full run takes about two minutes
  (`tools/report.mjs:9-10`).
- Corrected in `lab.patch`.

**F10. `FRICTION.md` breaks its own order and keeps growing.**
- Line 3 says "Newest first", but nine sections dated 11 to 19 Sep sit at lines 1153-1402 in ascending order. 12 and
  17 Sep each appear twice.
- The file is 1,402 lines and 120 KB. Its promotion into rules (#60) does not yet run.

**F11. The 17 Sep decision's vocabulary was superseded, and only the other repository says so.**
- The lab's decision record (`decisions/2026-09-17-async-work-architecture.md:47`) still prescribes
  `idempotency: natural|keyed|none`.
- The code uses `repeatEffect` and `submissionKey` (`src/core/async/types.ts:142,332`).
- ORC's `FIXES.md:138` calls this "the approved split", naming no approver.
- Recorded as a proposal awaiting Justin in `lab.patch`.

**F12. `SECURITY-REVIEW.md` restates the guarded-path list, incompletely.**
- `SECURITY-REVIEW.md:179-181` omits `config/`, `package.json`, `pnpm-lock.yaml`, `test/core-ties.ts` and three
  scripts, all of which `dangerfile.js:11-26` guards.
- Corrected in `orc.patch` to name `dangerfile.js` as the one definition.

**F13. Unused test helpers.** `test/architecture.test.ts:415-430` defines `openFridays()`, `bookwhen()` and
`bookwhenEvent()`, which import removed modules and are never called. Low; a guarded file.

**F14. Two source descriptions have drifted.**
- `src/cli.ts:6` "advertises Bookwhen availability".
- `src/cli.ts:33-35` help text: "No reminders, scheduling, … generic delegation, or delegation to any other
  specialist". The model now has `delegate_to_analyst` and `delegate_to_moving_stillness`
  (`test/architecture.test.ts:811-818`), and the async engine schedules.
- The architecture test checks that each source file has a header (`scripts/source-headers.js`), not that it is true.
  There are 108 `Today:` lines.

**F15. Repository facts duplicated in the lab.** `SCOPE.md:19` says "Facts about ORC belong in its repository", and
lab `AGENTS.md:21` says "Do not duplicate repository facts here", yet `STATE.md` holds ORC's commits, restarts and test
counts. Gap I8, Q5.

**F16. Hooks never block and may not be enabled.** Both `.githooks/pre-push` only print `push-summary`, and they need
`git config core.hooksPath .githooks` in each clone. Whether either clone enables them cannot be seen in a snapshot.

**F17. Claude Code in ORC may not load its instructions.** The lab links `CLAUDE.md -> AGENTS.md`; ORC has no
`CLAUDE.md`. This snapshot cannot show whether a Claude Code session in ORC loads `AGENTS.md`.

**F18. A plan that only Claude can reach.** `memory/authority-rules-step-1.md:3-5` holds the authority-rules plan "until
the steps are agreed", at `~/.claude/plans/agile-booping-waffle.md`. That is outside both repositories and in a
Claude-only location. Low.

---

## 5. Truth map (docs-first step 2, across both repositories)

**Roles:**
- **Canonical:**
  - lab: `scope.yaml`, `SCOPE.md`, `AGENTS.md`, `decisions/`, `memory/authority-rules-step-1.md`;
  - ORC: `README.md`, `AGENTS.md`, `SECURITY-REVIEW.md`, `dangerfile.js`, `test/architecture.test.ts`,
    `test/core-ties.ts`, and `src/package-api.api.md` (generated).
- **Current state:** the lab's `STATE.md`; `status.html` and `reports/<date>.json` are projections of it.
- **Local elaboration:** `memory/slots-run-walkthrough.md`.
- **Logs:** `FRICTION.md`, `AGENT_IDEAS.md` (its own header: "prompts for a conversation, not approved designs").
- **Historical:**
  - marked: the lab's `reports/*.md`, which are dated, and `research/`; ORC's `GRANTS.md` ("Design, 2026-09-20");
  - unmarked: the ten ORC branch reports, and `MCP.md`, half-marked (F6).

| Concept | Canonical home | Others, and their role | Finding |
|---|---|---|---|
| The lab's purpose and authority | `scope.yaml`, `SCOPE.md` | lab README (summary) | none |
| North star and Justin's process decisions | none durable today; proposed `decisions/2026-10-04-…` | `STATE.md` (sole copy), `reports/2026-09-30-priorities.md` (quote) | F1 |
| The map's rules | orchestrator#140's description (not read) | both `AGENTS.md` (pointer and summary), `tools/map.mjs` | none |
| Current state of the work | `STATE.md` | `status.html` (projection, last built 2 Oct) | F2, F3 |
| ORC's running build | `pnpm service:status` (live) | `STATE.md` (three conflicting copies) | F2, F15 |
| Async work design | lab `decisions/2026-09-17-…` | code (built), ORC `FIXES.md` (unattributed change) | F11 |
| What an agent can reach | ORC `AGENTS.md` "Boundaries" (prescribed) and `test/architecture.test.ts` (enforced) | README intro and "Boundary", `src/cli.ts` help, `SECURITY-REVIEW.md` | F4, F5, F14 |
| Guarded paths | `dangerfile.js` `GUARDED` | `SECURITY-REVIEW.md` (summary, incomplete), PR template (pointer) | F12 |
| The `STATE.md` cap | lab `AGENTS.md` "Keeping state" | `STATE.md` header (conflicting) | F3 |
| Learnings from real use | `FRICTION.md` | ORC README "Use" (scored uses) | F10 |
| The package API | `src/package-api.ts` → `src/package-api.api.md` | ORC `AGENTS.md` (summary), Danger (check) | none: one version, `src/core/agents/package.ts:21` |

---

## 6. Loop map (docs-first step 3: the real loop)

1. **A session starts.** It is usually Claude Code; the map also lists Codex, ORC and Justin as actors
   (`tools/map.mjs:31`).
   - In the lab: `AGENTS.md` (loaded through `CLAUDE.md`), then `STATE.md`, then `SCOPE.md`, then #140.
   - In ORC: `AGENTS.md`, then README and the architecture test, then #140. Whether Claude Code loads ORC's `AGENTS.md`
     is not established (F17).
2. **Work is tracked** as GitHub issues on the map, marked with `node tools/map.mjs working <ref>` and `stopped`.
3. **An ORC change** goes through these steps:
   - a branch or worktree;
   - a PR, with Danger's section checks;
   - for significant work, an Astra review saved to the lab's `reports/`;
   - tests run by hand;
   - Claude merges (A10);
   - the main checkout is pulled;
   - the restart card asks Justin to approve;
   - Justin approves, and the restart is verified by process start time;
   - `STATE.md` is overwritten.
4. **A lab change** is a direct commit; nothing suggests the lab uses PRs. `STATE.md` is meant to be overwritten "at
   each verified event", but in practice it is appended to through the day (F3).
5. **Decisions** land in `STATE.md` in practice (F1). They land in `decisions/` rarely (one since 17 Sep), and in
   `memory/` for authority rules.
6. **Learnings** go to `FRICTION.md` daily, and ideas to `AGENT_IDEAS.md`.
7. **Handoff** is the `STATE.md` overwrite plus the reply to Justin. After 22:00, work stays on branches.
8. **Periodic work** runs only by hand today: the diary and Astra reviews (F8).

Where follow-up is lost:
- overwritten decisions (F1);
- questions to Justin buried mid-paragraph (`STATE.md:36-37`);
- learnings never promoted (#60).

---

## 7. Ranked risks (decay rate × recovery cost)

1. **R1. The state file is the only record of decisions and of live state** (F1, F2, F3, F15).
   - Decay: hours. The file is rewritten several times a day.
   - Recovery: high. A lost decision survives only in git history that nobody knows to search, and wrong state has
     twice been told to Justin as fact.
   - Anchor: `decisions/`; `pnpm service:status`; lab `AGENTS.md` "Keeping state".
2. **R2. ORC's boundary text falls behind its code** (F5, F4, F12, F14).
   - Decay: every PR that changes `src/`, several a week.
   - Recovery: high. `SECURITY-REVIEW.md` and Danger make each review reason from `AGENTS.md` "Boundaries"; a false
     "only" claim hides a leg, such as the phone notice's `click` link.
   - Anchor: `AGENTS.md` "Boundaries", `test/architecture.test.ts`, Q1.
3. **R3. Kept processes, the tests among them, have nothing that runs them** (F7, F8, F16).
   - Decay: continuous.
   - Recovery: medium-high. A missed diary day cannot be reconstructed (lab `README.md:22-24`), and merges go in
     untested.
   - Anchor: A9; #144; #166.
4. **R4. Stale or superseded descriptions next to the docs a fresh agent reads first** (F4, F6, F9, F13, F14).
   - Decay: slow to medium.
   - Recovery: medium. ORC's `AGENTS.md:3-5` tells an agent to read the README first.
   - Anchor: the code, and the 17 Sep decision.
5. **R5. Decisions drift between the repositories, and learnings pile up** (F11, F18, F10).
   - Decay: slow. Recovery: medium.

---

## 8. Existing guard surfaces, by whether they execute

- **Runs by itself:**
  - Danger, on every PR event (`.github/workflows/danger.yml`): the "Security review" and "Package API" sections.
    Configuration seen; execution recorded on 2 Oct (`STATE.md:79-81`, "pass, fail with the section removed, pass
    restored"), not re-observed. It does not block a merge (F7).
  - The ORC runtime raises restart and build cards, which Justin approves.
- **Runs only by hand:**
  - ORC: `pnpm typecheck`; `pnpm test`, which includes `test/architecture.test.ts`, the core-ties ratchet
    (`test/core-ties.ts`), the source-header check and `test/package-api-report.test.ts`; `pnpm test:e2e`;
    `pnpm api:report`; `pnpm pi:check`.
  - Lab: `node tools/map.mjs --check`; `node tools/report.mjs`.
  - The `SECURITY-REVIEW.md` questions, and Astra reviews.
- **Decided, not built:**
  - tests on every PR (#144);
  - the scheduled diary, weekly review, FRICTION promotion (#60) and `/tmp` cleanup (#182), all waiting on #166;
  - the label check, whose labels proposal is waiting;
  - "entropy guard at session end" (A9).
- **Declared, but missing:**
  - the session-end entropy guard (no file in either repository);
  - `report.mjs --serve` (F9);
  - "the diary draws it every morning" (`tools/map.mjs:13`).
- **Unknown:**
  - whether either `.githooks/` is enabled (F16);
  - whether Danger's check is required on GitHub;
  - whether Claude Code loads ORC's `AGENTS.md` (F17).

**Mechanical checks that belong to tools, not the guard:**
- the tests, in CI (#144);
- a check that the markdown paths in backticks exist (the ad-hoc listing that found F6), or ast-grep for identifiers;
- lychee for links;
- ctxlint or agnix for `AGENTS.md`;
- a `STATE.md` line count.

None of these tools was checked as installed (outside this run's read scope), so the guard depends on none of them.

---

## 9. Guard decision and the generator's inputs (docs-first step 7)

**Decision: `create`.**
- No session-end guard exists in either repository.
- Justin kept "entropy guard at session end" on 4 Oct (A9).
- The loop has several sessions a day, two repositories and a state file that is overwritten. Danger and the
  architecture tests cover mechanics, not whether a session left the two repositories coherent.

**Existing surfaces:**
- Keep: Danger, the architecture test and the core-ties ratchet.
- Amend: lab `AGENTS.md` (add the guard pointer; `integration.md`) and `SECURITY-REVIEW.md` (F12).
- Demote to historical: the ten ORC branch reports, and `MCP.md`'s browser sections (F6).

**Generator inputs:**
- **Steward and intent documents:**
  - Steward: Justin.
  - Intent documents: the lab's `scope.yaml`, `SCOPE.md`, `decisions/` and `memory/authority-rules-step-1.md`; ORC's
    `README.md` ("Direction", "Boundary") and `AGENTS.md` ("Boundaries", "Core ships with no specific …", "Approval
    cards"); and the boundaries `test/architecture.test.ts` enforces.
  - Decision surface: the lab's `decisions/`, with the map's rules in orchestrator#140.
  - Open intent questions: Q1 to Q5, unresolved and kept visible in the guard.
- **Current-state file:** the lab's `STATE.md`. The agent that causes a verified event refreshes it (lab
  `AGENTS.md:33`).
- **Rules the system is bound by but does not own:** `~/pro/local-config/home/AGENTS.md` (not read in this run);
  `HOW_NOT_TO_PLAN.md` (not read); the map's rules (#140, not read); the merge rule (A10). ORC's own
  `SECURITY-REVIEW.md` and `dangerfile.js` also apply.
- **Verification commands:**
  - ORC: `pnpm typecheck`, `pnpm test`, `pnpm test:e2e`, and `pnpm api:report` when exports change.
  - Lab: `node tools/map.mjs --check`.
  - Only Danger's section checks run by themselves.
- **Code areas, with the docs and tests that describe them:**
  - outward reach (`src/adapters/`, `src/runtime.ts`, `src/core/child-agent-process.ts`, `analysis-tools.ts`,
    `research-tools.ts`): `AGENTS.md` "Boundaries"; README "Run" and "Boundary"; `test/architecture.test.ts`;
  - durable work: README "Boundary", the 17 Sep decision, and `test/async-*.test.ts`;
  - the package API: its report and its test;
  - the restart card: README "As a service", and `test/orc-restart.test.ts`;
  - `config/installation.ts`: README "Run";
  - lab `tools/`: lab README and `AGENTS.md`.
- **Live state a session can change:**
  - `orc.service` (through restart cards Justin approves);
  - package build approvals and standing grants (`pnpm list:approval-grants`);
  - durable work, in ORC's state directory;
  - Bookwhen entries through Moving Stillness (paused);
  - the ntfy topic;
  - GitHub issues and map marks.
  No spend appears in either repository.
- **Findings:** F1 to F18.

---

## 10. Guard generation (the generator's output)

- **Supplied:** this assessment's findings and inputs.
- **Decision:** `create`. The guard is at `guard/SKILL.md`. It is provisional: its home in the system is Q4. The
  generator's default would be `skills/session-coherence-guard/SKILL.md` in the chosen repository.
- **Size:** 1,237 words (`wc -w`), against a budget of 1,178.

  | Term | Words |
  |---|---|
  | Common contract (generator's measurement, 7 Oct) | 706 |
  | Checks: 9 beyond the two standing ones, at 36 each | 324 |
  | Pointers ("Where things live", filled) | 90 |
  | Commands (the checks' code block, 27; the live-state line, 31) | 58 |
  | **Budget** | **1,178** |

  The 59-word excess is the code-area map that fills the first standing check (about 100 words; R2 and R4 need it
  across two repositories), and the 37 words that bind the baseline to both repositories. The nine extra checks
  average 34 words. No duplication was found to remove, so the excess is kept.
- **Review before handover:**
  - The guard carries "Modes and safety", and binds its baseline per repository.
  - Its repair text is the template's: no "update to match", no "update both".
  - The intent-change rule is copied in, with Justin, the intent files and `decisions/` filled in.
  - Each open question appears as "open" in the check that depends on it.
  - The patches were checked against the questions; see below.
- **Doc references:** none added to the targets, which are read-only. `integration.md` gives the proposed lines.
- **Validation:**
  - `git apply --check --whitespace=error` passed for `lab.patch` and `orc.patch` against copies of the snapshot, and
    both applied cleanly.
  - The guard has no trailing whitespace.
  - The proposed `STATE.md` has 40 content lines (54 in all), within both caps in conflict (F3).
- **Open questions the guard leaves visible:** Q1 (the boundary check), Q3 (the cap check), and Q4 (where it lives).
  Q2 and Q5 are pointed to through `STATE.md`.
- **Handoff:** to `guards-integrator`, in `integration.md`.

**Patches, and the open questions they touch.** No patch changes any open question's text.

**`lab.patch`:**
- `decisions/2026-10-04-steward-decisions-from-state.md` records only, and touches no question. It carries one
  proposal, F11.
- `STATE.md`:
  - Touches Q3: it keeps the header's "Target: sixty lines" unchanged, and lands at 40 content lines, inside both caps.
  - Touches Q5: it keeps ORC's live facts as dated "as recorded on 4 Oct" lines, as now.
  - Touches Q4: it names the guard's home only as open.
- The lab `README.md` fix (F9) touches none.

**`orc.patch`** (`AGENTS.md` and `SECURITY-REVIEW.md` are guarded paths, so the PR needs a `## Security review`
section, such as "No new authority; documentation only"):
- The README intro touches Q1 and Q2. It states what the code does, and leaves `AGENTS.md:101-102`, the
  "Deliberately absent" items and `README.md:103` unchanged.
- The README's Bookwhen paragraph, the "apply" line and the removal of "scheduling" are settled by A4 and A5. Removing
  "scheduling" touches Q2 only by leaving the other five items unchanged.
- In `AGENTS.md`, only the `src/bookwhen.ts` sentence changes; the ntfy and subprocess text stays (Q1).
- The `SECURITY-REVIEW.md` change (F12), the `MCP.md` banner and the ten historical banners (F6) touch none.

**One-time cleanup not in a patch.** Each item was checked against the current file:
- `src/cli.ts:6,33-35` (F14) needs a guarded code PR. Removing "scheduling" is settled by A5; the delegation wording
  is not.
- `test/architecture.test.ts:415-430` (F13), and the `:822-826` comment omitting `scripts/build.mjs` (F5b, which
  touches Q1).
- `FRICTION.md` sections at lines 1153-1402 should go back into date order (F10).
- Moving the ten ORC branch reports out of the root is structural, and needs Justin's yes (F6).

---

## 11. What was not covered

- **GitHub:** issue and PR bodies, including #140's rules and the Security review sections; the Project; CI history;
  branch protection.
- **Outside the run:** git history and hook configuration, since the snapshot has no `.git`; any live service.
- **Other repositories and files:** Moving Stillness, the Bookwhen ops tool, scope-finance, `~/pro/scope`, local-config
  (the user-wide `AGENTS.md` and `DECISIONS.md`), `HOW_NOT_TO_PLAN.md`, and the agentic `MODEL.md`. The package-API
  seam with Moving Stillness (#202) was seen from ORC's side only.
- **Partly read:**
  - 78 lab reports: about 10 opened.
  - `FRICTION.md`: the header, two entries and its section index.
  - `AGENT_IDEAS.md`: the head only.
- **Exhaustive claims not fully checked:**
  - `AGENTS.md:20-24`'s list of the parent model's tools. Code also defines memory and durable-work tools, and who
    receives them was not traced.
  - Every credential reader (F5c).

## 12. Uncertainties

- Whether F5's three extensions were reviewed and approved in their PRs (the descriptions were not readable). Q1.
- Whether the snapshot's `STATE.md` was mid-edit at 17:31.
- Tool availability for the mechanical checks.
- F16 and F17, which a snapshot cannot settle.
