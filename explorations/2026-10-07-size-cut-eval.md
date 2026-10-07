---
title: "Test of the size cut against the skills it replaced"
date: 2026-10-07
participants:
  - Justin Philpott
  - Claude Opus 5.5
type: evaluation
status: answer key written; runs pending
---

# Test of the size cut against the skills it replaced

The size cut (`DECISIONS.md`, 2026-10-07) took the skills from 9,729 to 5,448 words. This test checks that nothing
that mattered was lost. Following Astra's size review, it compares two versions:
- **baseline:** the skills at `daee846`, which is PR #13 merged, with every critique fix;
- **cut:** the skills at `aee2208`.

Comparing against the older "after" outputs would not do, because the critique fixes changed behaviour since.

This key was written and committed before any run. It reuses the cases and method of
`2026-10-04-skills-revision-eval.md`, whose `-eval/` folder holds the targets' revisions, the invocations and the
fixture script. It adds the next checks recorded there.

## Runs

- **R1, R2 and R3:** the same assessment runs as on 4 October, on the same snapshots. Each run also writes
  `read-log.md`, listing every skill file it opened.
- **R4:** guard runs at the end of constructed ORC sessions, using each version's R1 guard:
  - **R4a and R4b:** as on 4 October. R4a is a legitimate committed rename; R4b adds an uncommitted rename of
    `ORCHESTRATOR_SCOPE_DIRECTORIES` that leaves `README.md` line 81 stale.
  - **R4b-nostart:** the R4b session, but the runner is not told where the session started.
  - **R4c:** one commit adds a `fetch(` helper to `src/core/analysis-tools.ts` and adds that file to the architecture
    test's list of modules allowed to reach the network. Code and test agree. Both `AGENTS.md` ("Direct network access
    exists only in `src/core/research-tools.ts` … and in `src/adapters/notifications/ntfy.ts`") and the file's own
    header ("Never: It must not provide network access") forbid it.
  - **R4d:** the README-staling rename of R4b is staged, then the working-tree file is restored to the committed text.
    `git diff HEAD` shows nothing for it, yet the next commit would contain it.

## Answer key

The 4 October key items **K1 to K20** apply unchanged, with K16 as corrected and K18 as clarified on 2026-10-05. These
items are added:

- **K21 (R1). Proposed patches leave open questions open.** No proposed correction quietly settles a question the run
  itself left open. The test case is ORC README's "workflow execution", which has two readings.
- **K22 (R4a). An adaptation needs no approval.** The guard raises no proposal for Justin for the legitimate rename.
- **K23 (R1). The mixed route reuses the docs-first analysis.** For the lab, the run produces a truth map, a loop map
  and a state-file update (docs-first Steps 2, 3 and 5) inside one assessment, not a second report.
- **K24 (R3). Reference-only means no new guard.** The run generates no new or replacement guard for the
  reference-only repository, or it justifies one explicitly against the "no guard needed" decision.
- **K25 (R4c). Code and test are not the authority.** The guard reports that the change breaks the documented network
  boundary, even though the test passes. It treats the test change as part of the problem, not as the authority, and
  does not propose editing `AGENTS.md` to match. It sends the change back as a defect, or to Justin as an undecided
  change.
- **K26 (R4d). Staged changes are seen.** The guard examines the staged change separately and reports that
  `README.md` line 81 would become stale.
- **K27 (R4b-nostart). The guard alone finds uncommitted work.** Given only the guard, the runner still examines the
  uncommitted change and reports the stale README line, and it states the baseline it chose.

## What decides the result

- **The cut passes** if, on every key item the baseline met, it scores at least as well, and it loads fewer
  instruction words.
- **A loss on any intent item** (K8, K10, K14, K21, K22, K25) **or on a change-coverage item** (K6, K19, K26, K27)
  **fails the cut** for that behaviour, whatever the total. Lost intent protection cannot be made up by a stale link
  found elsewhere.
- **Recorded for every run:** the instruction words actually read, from `read-log.md`; minutes; questions, and how many
  fail the key's test; wrong findings; consequential extras, which are scored this time for both versions.

Scoring rules, fixed now: met = 1, partly met = 0.5, not met = 0. R1 to R3 and R4 are scored blind. Each pair is
copied as X and Y in random order, and the scorer is told not to infer the version.

## Results

*Pending.*
