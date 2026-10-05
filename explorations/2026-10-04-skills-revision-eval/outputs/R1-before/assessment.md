# Entropy assessment: ORC and the Orchestration Lab Scope

- **Targets (read-only snapshots, read 2026-10-04):**
  - ORC, `targets/orc-lab/orchestrator` (files dated 4 Oct 14:44). Lives at `~/pro/orchestrator`.
  - The lab Scope, `targets/orc-lab/scope-orchestration-lab` (files dated 4 Oct 17:31). Lives at
    `~/scopes/scope-orchestration-lab`.
- **Skills used, in order:** `entropy-assessment` v0.6.0 (front door), then its Step 4 fallback, then
  `docs-first-planning-assessment` v0.1.0 (Phases 1 and 2) for the docs and workflow surface, then
  `guards-integrator` v0.2.2.
- **What this evidence excludes.** The snapshots had no `.git`, so no history, dates of change or branch state.
  Nothing on GitHub was read: not the map of work (orchestrator#140), its rules, or any issue. Also not read:
  local-config's `AGENTS.md`, `~/pro/scope`, the Moving Stillness repository, and the live ORC service.
  Statements below about live state are what the lab's `STATE.md` *says*, not what is true.

## Route taken, and why

1. **Front door, Step 2.** Classified as **B, mixed docs + code** (reasoning below).
2. **Front door, Step 3.** For B, continue with the lightweight fallback profile (Part 1).
3. **Front door, Step 4d.** Next move: **run `docs-first-planning-assessment`** on the docs and workflow surface.
   That surface is the whole lab plus ORC's `README.md`, `AGENTS.md` and root documents. Four of the five
   top fallback risks are vectors the docs-first track names: state entropy, parallel truth,
   superseded-nearby interference, and phrase-encoded automation. The lab is markdown-first and run by AI
   sessions. Its `STATE.md` records "entropy guard at session end" as a process Justin kept on 4 Oct, and no
   guard exists in either repository. So the docs-first track is the one that produces that guard.
4. The docs-first track's "When NOT to run" clause covers systems that are mainly code-first, where the risks
   sit in code, tests or API contracts. It does not fire here. ORC's code-side risks are already guarded
   strongly by tests, apart from the one gap in R3, which stays a code-side follow-up.
5. **Docs-first Step 8:** there are several actors and several handoff points, so the result goes on to
   `guards-integrator` (see `integration.md`).

---

# Part 1: Front door (`entropy-assessment`)

## Intent summary

ORC is Justin's local-first personal agent system. It is a TypeScript service holding:

- owned conversations;
- Iris as the front door;
- Scope-owned agents and packages;
- durable work with approval cards;
- grants and a browser connector.

Its core must carry nothing tied to a specific Scope, model, owner or agent (ORC `AGENTS.md`). The lab is
the Scope that develops and operates ORC (`SCOPE.md`, `scope.yaml`). It owns current state (`STATE.md`), the
friction log of real use (`FRICTION.md`), agent ideas, reviews, decisions and relationship memory. On 4 Oct
Justin also made it the central Scope for project management, issue tracking, code quality and security
(`STATE.md`). Both repositories can explain what they are for, so there is no intent-level stop.

## System shape classification

**B: mixed docs + code.** The ambiguity, stated:

- **ORC alone looks code-first (C).** It has about 26k lines of TypeScript in `src/`, 62 test files, and STATE reports 970
  unit tests and 5 E2E tests. Its boundaries are enforced by `test/architecture.test.ts`, `test/core-ties.ts`,
  the source-header rule and the package API report.
- **The lab alone looks docs-first (A).** It is markdown-first and run by AI sessions. State, decisions,
  friction, ideas and 78 reports are its product.
- **Workflow-heavy (D) also fits.** The rituals include:
  - map marks;
  - overwriting STATE at each verified event;
  - the friction log;
  - the daily diary;
  - restart cards;
  - Danger checks;
  - the pre-push summary;
  - the rule to commit each idea at once;
  - the merge rule.
- **The highest current risk sits between the two repositories.** It lies between the lab's description of
  ORC and ORC's code and live state, and between ORC's own docs and its code. That is the B case.

## Domain map

| Domain | Present | Actively iterated | Where |
|---|---|---|---|
| Code | yes | yes, several merges and restarts a day (STATE lists 4 card restarts and a power-cut reboot on 4 Oct) | ORC `src/`, `web/src/`, `config/`, `scripts/`; lab `tools/*.mjs` |
| Documentation | yes | lab yes (STATE, FRICTION, reports daily); ORC docs rarely (the 29 Sep inventory says `README.md` last changed 13 Sep) | lab root and `reports/`; ORC `README.md`, `AGENTS.md`, `SECURITY-REVIEW.md` and 12 task reports (15 root `.md` files) |
| Tests | yes | yes | ORC `test/` (vitest), `e2e/` (Playwright). **Nothing runs them automatically** (#144) |
| API contracts | yes | yes | ORC `src/package-api.ts` and `src/package-api.api.md` (API Extractor report plus a test). Undeclared: ORC's SQLite schema and state directory, read by the lab's `tools/collect.mjs` |
| Workflow / process | yes | yes, heavily | lab `AGENTS.md`, `STATE.md` "How we work", orchestrator#140 rules (not read), ORC `AGENTS.md`, `dangerfile.js`, `.githooks/pre-push`, PR template |

## Top entropy risks (cross-domain, ranked by decay rate × recovery cost)

**R1. The lab's `STATE.md` against live reality (workflow vs reality, docs vs docs).** Decay is fast: the file
changes at every verified event, several times a day. Recovery is costly, because a wrong line comes back as
a confident wrong answer to Justin about a live service. `FRICTION.md` records this twice: 2026-09-12, "STATE
described finished work as missing", and 2026-09-22, "`STATE.md` contained two false statements, both found
by being asked a direct question". The 4 Oct 17:31 snapshot contradicts itself in at least six places:

- **#193:** "built and in review, not merged", and in the same paragraph "#193 is live: #200 merged as
  `3989cdb`".
- **The build ORC runs:** "ORC live: 369628b since 22:12:47" and "main process started 2026-10-03 22:12:47 on
  `369628b`". Against that, restarts at 13:36:37, 14:03:34, 14:26:04 and 14:48:27 on 4 Oct, the last onto
  `8cee662`.
- **Moving Stillness `main`:** "`c759f96`", against "MS #53 merged as `fc830aa`".
- **The browser stack:** "MS is paused ... (#118, #52, MS #52) waits", against "Next on the browser stack:
  #118, then #52".
- **A grant past its date:** "Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z", written in the
  present tense three days later.
- **Its own length cap:** the lab's `AGENTS.md` says "about forty content lines", STATE's header says "Target:
  sixty lines", and the file has 87 non-empty lines, some up to 237 characters.

STATE also holds the only copy in either target of the decisions Justin took in the 4 Oct afternoon interview,
in a file whose rule is "overwrite; do not append".

**R2. ORC's docs that agents act on, against ORC's code (docs vs implementation).** Decay is medium: each
capability merge. Recovery is medium to high, because `AGENTS.md` is what fresh agents and security reviews
read. Evidence:

- **`AGENTS.md` names a file that does not exist.** It says "`src/bookwhen.ts` is the only module that imports
  the pinned Bookwhen client". That file does not exist, and `test/architecture.test.ts` (lines 1315–1320)
  requires that no source names `@jphil/bookwhen-client` and that `package.json` does not depend on it.
- **`AGENTS.md` leaves a module off the subprocess list.** Its list names `child-agent-process.ts`,
  `analysis-tools.ts` and `mcp/client.ts`. The test also allows `src/adapters/orc-service.ts`, in "confines
  subprocess access to the exact Pi child, git history, MCP adapter and ORC service modules".
- **`README.md` has four stale claims:**
  - It says to set `ORCHESTRATOR_BOOKWHEN_API_TOKEN` for `@jphil/bookwhen-client@0.6.1`. The only source
    reads of that variable are test stubs.
  - It says the Moving Stillness specialist plans "without applying it".
  - It lists "scheduling" and "workflow execution" as deliberately absent. Yet the SQLite store has a
    `schedules` table, `src/app/async/calendar.ts` resolves daily and weekly rules, and `package.json` has the
    `*:async-series` commands.
  - It describes the read-only external data paths as Bookwhen events, Bookwhen admin inspection and Jina.
- **These are already known.** The 29 Sep backlog inventory and the 1 Oct synthesis (`reports/`) both flagged
  the README. In this snapshot it still has the Bookwhen-token paragraph. So the finding has been made three
  times and nothing owns it.

**R3. ORC's tests against its implementation (tests vs implementation).** Decay is fast: every PR. Recovery is
medium. Nothing runs the suites on a pull request. `.github/workflows/danger.yml` runs only Danger, and #144
("tests on every PR") is kept but its mechanism is undecided. `FRICTION.md` (2026-09-27): "ORC's end-to-end
suite had failed on `main` for a week, unnoticed". This is mechanically checkable, so it belongs in CI, not in
a judgment guard.

Further risks are ranked in Part 2's entropy profile (V2, V4, V5).

## Existing guard surface summary

| Surface | Kind | Verdict |
|---|---|---|
| ORC `test/architecture.test.ts` (boundaries, tool surface, subprocess and network confinement, headers, Bookwhen out of core) | fully embedded | **keep**: the strongest guard here, and the truth the docs should follow |
| ORC `test/core-ties.ts`, `test/cause-discard-allowances.ts` (count-down ratchets) | fully embedded | **keep** |
| ORC source headers (`Owns:` / `Never:` / `Today:`, checked by `scripts/source-headers.js`; `pnpm codemap`) | semi-embedded | **amend**: the test checks the lines are present, not that they are true. 108 `Today:` lines, some transitional, e.g. `src/core/iris.ts` "until slice 3b" when FRICTION records slice 3b-1 merged by 14 Sep |
| ORC `src/package-api.api.md` with its test, plus Danger's "Package API" rule | fully embedded / CI | **keep** |
| ORC Danger "Security review" check, `SECURITY-REVIEW.md`, PR template | CI plus checklist | **keep**. Note that `AGENTS.md` is a guarded path, so a docs-only fix to it needs a `## Security review` section |
| ORC `.githooks/pre-push` (push summary) | prompted | **keep** (branch hygiene, not entropy) |
| ORC `AGENTS.md`, `README.md` | standing instructions | **amend** (R2) |
| ORC root reports: `CLASSIFY`, `FIXES`, `GRANTS`, `GRANTS-E2E`, `MCP`, `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`, `TURN-RECORD`, `VISIBILITY` | history sitting beside live docs | **demote to historical** (proposed 1 Oct, needs Justin's yes, #37) |
| CI test run | none | **missing** (#144) |
| Lab `AGENTS.md` "Keeping state" rule (overwrite STATE at each verified event) | standing instruction | **amend**: one cap, stated once; decisions get a home outside STATE |
| Lab `tools/map.mjs --check` and the 14 h stale-mark report | scripted, run by hand | **keep**; prompted from the new guard |
| Lab `tools/report.mjs` daily diary (`status.html`, `reports/<date>.json`) | scripted, run by hand | **amend**: last run 2 Oct 08:45 UTC. It shows 0 / 0 ORC runs, not "could not read", when ORC's database cannot be read |
| Lab `FRICTION.md`, folded into rules monthly (#60) | log plus ritual | **keep**; minor amendment for order |
| Lab `decisions/` (one file, 17 Sep) | decision log | **amend**: make it the decision home |
| Lab `AGENT_IDEAS.md` commit-at-once rule | standing instruction | **keep** |
| Weekly adversarial review, review syntheses in `reports/` | ritual | **keep** |
| Session-end entropy guard | decided 4 Oct, does not exist | **generate** (this run: `guard/SKILL.md`) |

## Recommended next skill or action

Run `docs-first-planning-assessment` on the docs and workflow surface, generate one combined session-end
guard, then run `guards-integrator`. Done below and in `guard/SKILL.md` and `integration.md`. The code-domain
follow-up stays outside the guard: tests on every PR (#144).

## Uncertainties

- **Which side of STATE's contradictions is current** cannot be settled without the live service
  (`pnpm service:status`) and git.
- **Whether the README's "scheduling" means something narrower** than the recurring series ORC already has.
  #166, "ORC scheduling is built first", suggests a different feature.
- **Whether ORC's snapshot (14:44) is the commit that is live.** STATE says it was restarted onto `8cee662`
  at 14:48:27.
- **The rules in orchestrator#140** may already cover some of the checks proposed here. They were not read.

---

# Part 2: Docs-first planning assessment, Phase 1

## Intent and planning horizon

The intent is as in Part 1. The horizon:

- **Settled:**
  - core carries no Scope, model, owner or agent ties;
  - the lethal-trifecta rule;
  - approval cards;
  - one map of work (#140);
  - Danger for security review;
  - Worktrunk and `gh poi` for cleanup;
  - the lab as central Scope;
  - the list of kept processes;
  - scheduling (#166) built first.
- **Active:**
  - the browser stack (#193 live, #118 and #52 next, MS paused);
  - package API versioning (#201, live);
  - authority rules step 2 (#149);
  - type labels (waiting on Astra's revision);
  - this assessment.
- **Exploratory:** most of `AGENT_IDEAS.md`; ADA and Analyst unavailable; phone and Iris follow-ups.

## Canonical truth map

The map is in `canonical-truth-map.md`. It is kept in one file so this report does not become a second copy
of it. In short:

- **Concepts with one clear home:**
  - current work state (lab `STATE.md`);
  - open work (orchestrator#140);
  - real-use friction (`FRICTION.md`);
  - resources (`scope.yaml`);
  - ORC boundaries (`test/architecture.test.ts`);
  - package API (`src/package-api.api.md`).
- **Concepts with no single home, or two homes that disagree:**
  - **decisions:** spread across `decisions/`, STATE, both `AGENTS.md` files, #140, code headers, `reports/`
    and `memory/`;
  - **the description of ORC's boundaries:** `AGENTS.md` and `README.md` disagree with the test that enforces
    them;
  - **agent working rules:** STATE's "How we work" restates local-config rules;
  - **north star:** ORC `README.md` "Direction" and STATE "North star";
  - **vocabulary:** the glossary is in unmerged #106, "async" and "durable work" name one concept, and
    "grant" names three things.

## Loop map (real, from the evidence)

- **Session start.** The agent (Claude mostly; also Codex and opencode; Astra reviews read-only) opens either:
  - the lab: `CLAUDE.md` links to `AGENTS.md`, then `STATE.md`, then `SCOPE.md`, then #140; or
  - an ORC worktree: `AGENTS.md`, then `README.md`, then `test/architecture.test.ts`, then #140.
- **Tracking work.** GitHub issues placed under #140. `node tools/map.mjs working '<ref>' --agent Claude` marks
  an issue and `stopped` clears it.
- **Changing code.** ORC branch and worktree, then a PR. Danger checks the security review and package API
  sections on GitHub, then an adversarial review (reports in lab `reports/`). Claude merges once review and
  tests pass, with tests run locally only. Then the ORC checkout is pulled, Justin approves the restart card,
  and the agent verifies process start time, `build.json` and health.
- **Recording state.** `STATE.md` is overwritten "at each verified event".
- **Recording decisions.** Justin decides in chat or an interview. The decision lands mostly in STATE ("Decided
  by Justin"), sometimes in `AGENTS.md`, code headers, #140 or `decisions/`.
- **Recording learnings.** `FRICTION.md`, newest first, folded into rules monthly (#60).
- **Coherence pauses.** Ad hoc reviews and syntheses, a weekly adversarial review, and the daily diary
  (`tools/report.mjs`, last run 2 Oct 08:45 UTC). There is **no session-end check**.
- **Main handoff.** The STATE overwrite plus the session's final message. AGENTS.md says to re-read STATE after
  compaction.

## Entropy profile (top risks, ranked by destructive potential)

| # | Vector | Decay | Recovery cost | Symptoms in the snapshot | Canonical anchor for the fix |
|---|---|---|---|---|---|
| V1 | **State entropy in `STATE.md`** (R1) | fast, several events a day | high: confident wrong answers about live services | 6 self-contradictions; over its cap; FRICTION 09-12 and 09-22 | `STATE.md`, one line per fact, overwritten; live facts from `pnpm service:status` |
| V2 | **Parallel truth for decisions**, held in a file built to be overwritten | slow | catastrophic: decisions relitigated. `reports/2026-09-30-skills-one-home.md` quotes Justin: "we've had this discussion so many time" | 4 Oct decisions exist only in STATE; `decisions/` has 1 file; `memory/authority-rules-step-1.md` cites `~/.claude/plans/agile-booping-waffle.md`, a plan held only in a Claude folder | `decisions/` in the lab for lab and relationship decisions; ORC `AGENTS.md` for ORC rules |
| V3 | **A canonical doc not tracking its territory**: ORC `AGENTS.md` and `README.md` (R2) | medium | medium to high | `src/bookwhen.ts`; missing `orc-service.ts`; Bookwhen token; "without applying"; "scheduling absent" | `test/architecture.test.ts` is the truth; `AGENTS.md` describes it |
| V4 | **Superseded material sitting near live truth** | slow | medium: a fresh agent rehydrates a retired design | ORC root reports say "Nothing committed, nothing pushed" (`REWORK.md`) and "Today that job needs a source edit to `config/installation.ts`" (`GRANTS.md`). 10 references to code paths in root reports point at files that no longer exist (e.g. `src/adapters/browser/service.ts`, `src/core/policies.ts`, `src/adapters/async-store/store.ts`). `MCP.md` is only half-demoted by a banner. Lab `reports/` (78 files) is dated, but nothing marks which ones STATE's "Of record" supersedes | a history location (ORC `docs/history/`, proposed 1 Oct); the list of known supersessions in the guard |
| V5 | **Automation that encodes another repository's internals or wording** | medium: each ORC schema or path change | low to medium, but **silent** | `tools/collect.mjs` hard-codes `~/.local/share/orchestrator-proof` (ORC defaults to `~/.local/share/orchestrator`, from `ORCHESTRATOR_STATE_DIR`). It reads ORC's `tasks` and `events` tables and columns, parses FRICTION's `## YYYY-MM-DD — title` and `- **` shape, scrapes vitest's tail, and turns every failure into null, so the diary shows "0 / 0 ORC runs". Its header records the previous breakage ("readers pointed at ORC paths that have since moved"). The lab `README.md` documents a `--serve` flag `tools/report.mjs` does not have, and its timings contradict the script's header | ORC owns its schema and state directory; the lab reads them the way ORC's `scripts/orc-service.ts` does |

Lower-ranked risks:

- **Vocabulary drift.** "Async" and "durable work" name one concept, "grant" has three meanings, and labels
  and the map are two classification systems. These are already reviewed (`reports/2026-10-01-reviews-claude.md`,
  `reports/2026-10-04-issue-map-overview.md`).
- **`FRICTION.md` order.** It says "Newest first", but the 2026-09-11 to 09-19 block at line 1153 runs oldest
  first.
- **The lab's authority rule against practice.** `AGENTS.md` says "Do not duplicate repository facts here",
  yet STATE carries ORC commit SHAs and test counts, and FRICTION carries ORC product friction. This works,
  but ORC itself has no record of product learnings after 10 Sep.

## Recommendations

- **Consolidate.**
  - Decisions go into `decisions/`; STATE keeps a one-line link.
  - The STATE cap is stated once, in the lab's `AGENTS.md`.
  - ORC's boundary description follows `test/architecture.test.ts`.
  - The north star moves out of STATE (it is not state) into `SCOPE.md` "Purpose" or ORC's README "Direction".
- **Demote.**
  - ORC's 12 root task reports go to a history location (Justin's yes needed).
  - `MCP.md` goes with them.
  - Until then, nothing new goes at ORC's root.
- **Mark as historical.** Lab `reports/` stays history by convention. STATE's "Of record" line is the only
  pointer to which reports are current.
- **Guard.** One combined session-end guard (`guard/SKILL.md`). Its checks:
  - STATE honesty;
  - decision and learning capture;
  - ORC docs against code;
  - agent-facing names;
  - supersession;
  - cross-repo readers;
  - map and marks;
  - tests until #144.

## Bootstrap actions (one-time, before the recurring guard is useful)

Track completion as issues under orchestrator#140, not in the guard file.

- **B1.** Move the 4 Oct interview decisions (and any 2–3 Oct decisions still only in STATE) into
  `decisions/2026-10-04-central-scope-and-processes.md`. STATE links to it.
- **B2.** Rewrite `STATE.md` at the next verified event:
  - resolve the six contradictions in R1;
  - delete the expired grant line;
  - keep one line for what ORC runs, read from `pnpm service:status`;
  - fit within the cap.
- **B3.** State the STATE cap once, in the lab's `AGENTS.md`, with its derivation. Drop "Target: sixty lines"
  from STATE's header (see `questions.md` Q3).
- **B4.** Fix ORC's `README.md` and `AGENTS.md` in one PR, covering R2's items. Its `## Security review`
  reads "No new authority; documentation brought in line with `test/architecture.test.ts`".
- **B5.** Demote ORC's root reports (needs Justin's yes; #37 and the 1 Oct proposal).
- **B6.** Make the lab's collector read ORC's state directory as ORC does, and show "could not read" for
  durable work instead of 0 / 0. Fix the lab README's `--serve` and timing lines.
- **B7 (low).** Put `FRICTION.md` back in newest-first order. Bring the plan cited by
  `memory/authority-rules-step-1.md` into the lab when #149 resumes.

## Current-state packet

The packet is in `current-state-packet.md`.

---

# Part 3: Docs-first Phase 2 (guard generation)

## Step 6: guard surfaces

The inventory is the table in Part 1. There is no existing session guard to refine, so this run generates one.
The mostly sound mechanical guards are kept as they are: architecture test, ratchets, package API report and
Danger.

## Step 7: guard design

One combined docs and workflow guard, run at session end. There is one stable trigger, and the riskiest drift
crosses both repositories, so two guards would split one handoff. Each check is gated by "did this session
touch X", so a quiet session clears in under two minutes. The guard includes a check against entropy it could
cause itself: it asks the agent not to write one fact in two places, including the guard's own list of
supersessions.

## Step 8: enforcement depth per check

| Check | Depth now | Why | Later |
|---|---|---|---|
| STATE honesty | narrative | which line is false needs judgment | non-blocking line count against the cap in the lab's pre-push hook (durable: one number) |
| Decision and learning capture | narrative | judgment | none |
| ORC docs against code | narrative plus one command | the path-existence check is mechanical and durable | an ORC vitest asserting that backticked paths in `README.md`, `AGENTS.md` and `SECURITY-REVIEW.md` exist |
| Agent-facing names | command (grep) | mechanical once the old name is known | per-repository tests like scope-moving-stillness#25 |
| Supersession | narrative | judgment, with volatile wording | keep narrative |
| Cross-repo readers | prompted run of `tools/report.mjs --no-tests` | the reader should fail loudly instead (B6) | after B6 the diary itself reports the break |
| Map and marks | existing script | already scripted | the diary, once scheduled (#166) |
| Tests | prompted | mechanical | CI (#144); then drop it from the guard |

The following were **not** proposed for automation, because their wording is volatile: anything matching
STATE's prose, phrase checks on FRICTION beyond its heading shape, and the list of supersessions.

Integration: `integration.md`. Upstream feedback on entropy-guard itself: `upstream-feedback.md`.
