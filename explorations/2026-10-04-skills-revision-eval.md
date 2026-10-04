---
title: "Before-and-after test of the skills revision"
date: 2026-10-04
participants:
  - Justin Philpott
  - Claude Opus 5.5
type: evaluation
status: answer key written; runs pending
---

# Before-and-after test of the skills revision

Item 6 of the revision approved on 4 October (`2026-10-04-skills-review-synthesis.md`). The same runs are done twice:

- **before**, with the skills at commit `447da9a`;
- **after**, with the revised skills.

Each run gets a fresh agent that sees only the skill files and the target. It does not see either review, the
synthesis or this answer key. The answer key below was written before any run, so it cannot be fitted to the results.

## Fixed targets

The snapshots are copies, not live checkouts, so the right answers cannot move between runs:

- **ORC** at `8cee662`, with the lab Scope (`scope-orchestration-lab`) at `096b96f`. This is a mixed code, docs and
  workflow system spread over two repositories.
- **entropy-guard** at `447da9a`, a docs-first repository: this repository as it was before the revision.
- **agentic-architecture** at `faf2233`, a docs-first repository that no reviewer has assessed.

## Runs

- **R1 — assess ORC and the lab.** Start at the front door, follow its route, and carry it through to a generated
  guard and integration advice. Read-only on the targets; outputs go to a separate folder.
- **R2 — assess entropy-guard at `447da9a`.** Front door, route followed, assessment and guard advice.
- **R3 — assess agentic-architecture at `faf2233`.** Front door, route followed, assessment and guard advice.
- **R4 — run R1's generated guard at the end of a constructed session on ORC.** The session is a copy of ORC with
  two scenarios that no review has seen:
  - **R4a:** one committed change that is legitimate. It renames a local variable in one function, with no
    behaviour or documentation effect.
  - **R4b:** the same commit, plus an uncommitted change. The setting `ORCHESTRATOR_SCOPE_DIRECTORIES` is renamed
    in `src/agent-discovery.ts` and its test, and the README's line 81 still names the old setting.

## Answer key

A run scores one point for each item it gets right. A finding is wrong if the files do not support it, or if it
blames the delta for a problem that was already there.

### R1 — ORC and the lab

- **K1, route.** The run reaches a path that produces a guard for code and docs, using ORC's real verification
  commands, such as `pnpm typecheck` and the test commands. It does not stop at a generic fallback.
- **K2, contradictory state.** The run reports that the lab's `STATE.md` says PR #200 is "not merged" and also
  merged. It also reports the "ORC: … started 2026-10-03 22:12:47 on `369628b`" line against the later restarts. It
  does not assert which is live without reading the live service.
- **K3, stale description settled by evidence.** The run reports two things:
  - ORC's README lists scheduling and workflow execution as "deliberately absent", against
    `decisions/2026-09-17-async-work-architecture.md` and `src/app/async-work.ts`;
  - ORC's README documents `ORCHESTRATOR_BOOKWHEN_API_TOKEN`, which nothing in `src/` reads.

  It treats both as documents to correct from evidence. It does not ask Justin whether ORC should have async work.
- **K4, a declared guard that does not exist.** The lab's `STATE.md` lists "entropy guard at session end" among the
  processes kept, and no such guard exists in either repository. The run treats this as the decided integration
  point, not yet built.
- **K5, tests not run before merge.** The run notes that the test suites exist and that nothing runs them before a
  merge. The only workflow runs Danger; the pre-push hook prints a summary. It connects this to #144, which
  `STATE.md` names, rather than proposing a separate project.
- **K6, the delta includes uncommitted work.** The generated guard defines what changed so that staged, unstaged
  and untracked work is included.
- **K7, no frozen state or borrowed rules.** The generated guard holds checking rules only. Current PRs, issues and
  build ids live in the state file and are pointed to. Rules owned elsewhere, such as spending, the security-review
  trailer and the merge rules, are linked, not restated.
- **K8, intent changes are proposals.** The generated guard does not let an agent resolve a conflict between work
  and stated intent by editing the intent documents without the steward's approval.
- **K9, adoption checked.** The integration advice includes confirming that the trigger fires and that a fresh agent
  session finds the guard.
- **Questions.** Any question to Justin must change what gets built, and must not reopen a decision already recorded
  with his name and date. Count the questions, and count those that fail this test.

### R2 — entropy-guard at `447da9a`

- **K10, an open intent choice.** The run reports the conflict between saved guards (`INTENT.md` and the skills) and
  fresh generation at each handoff (`LEARNINGS.md`, 19 March). It presents this as an open choice with a
  recommendation, at most one question. It does not silently pick one, and does not rewrite `INTENT.md` itself.
- **K11, a missing route.** The run reports that the front door never routes to
  `session-coherence-skill-generator`.
- **K12, two guard builders.** The run reports that the docs-first skill and the session-coherence generator both
  build end-of-session guards.
- **K13, stale references.** The run reports that `doc-health-check` does not exist, and that `distill-article` is
  no longer in the repository.
- **K14, the intent-rewrite path.** The run reports that the local guard's "update the skill, or … update
  [INTENT.md]" lets intent be rewritten without the steward.
- **K15, "update both".** The run reports that the local guard's "update both" keeps two copies alive.
- **Questions,** as for R1.

### R3 — agentic-architecture at `faf2233`

- **K16, conflicting self-description settled by evidence.** The README's status line says "Reference-only … Do not
  treat decisions in this repository as current authority", while the next paragraph says "Bleeding-edge design
  source for the current named version". The dated last commit ("Mark architecture blueprint as reference-only",
  1 August) settles it. The run reports the conflict and resolves it from that evidence, without asking.
- **K17, proportion.** Because the repository is reference-only, the run recommends little or nothing new: no new
  guards or heavy process, at most demoting or retiring the existing guard instructions.
- **Also recorded:** useful findings, wrong findings and questions, without a fixed key, because no reviewer has
  assessed this repository.

### R4 — R1's guard run at the end of a constructed session

- **K18, R4a — legitimate change.** The guard reports no finding caused by the change. Problems that were already
  there may be listed separately, as not caused by this session.
- **K19, R4b — uncommitted drift.** The guard examines the uncommitted change and reports that README line 81 now
  names a setting the code no longer reads.
- **K20, coverage stated.** In both scenarios the guard's report says which baseline it compared against and what it
  did not cover.

## Also recorded for every run

- useful findings outside the key;
- wrong findings;
- the number and quality of questions;
- minutes taken.

The number of files generated is not a measure of success.

## Results

*Pending.*
