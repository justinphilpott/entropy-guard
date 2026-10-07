---
title: "Test of the size cut against the skills it replaced"
date: 2026-10-07
participants:
  - Justin Philpott
  - Claude Opus 5.5
type: evaluation
status: first round failed on two intent items; fixes re-tested (see Round 2)
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

### Round 1: the cut at `aee2208` against the baseline at `daee846`, 7 October

Sixteen runs, each by a fresh Claude Opus 5.5 agent:
- six assessments, R1 to R3 for each version;
- ten guard runs, R4a, R4b, R4b-nostart, R4c and R4d for each version.

All were scored blind: X and Y were assigned at random, and the mapping was revealed only after scoring.

**Instruction words actually read,** from the runs' read logs:
- the baseline: 9,729 to 10,269 words, five or six files;
- the cut: 5,103 words, seven files, about half.

| Case | Baseline | Cut | Notes |
|---|---|---|---|
| R1, ORC and the lab (K1–K9, K21, K23) | 9.5 of 11 | 9.5 of 11 | The cut was better on K2 and K9, but **failed K21**: its patches dropped "workflow execution" and picked the `STATE.md` cap while saying they settled nothing. |
| R2, entropy-guard at `447da9a` (K10–K15) | 5 of 6 | 4 of 6 | The cut was better on K10 (0.5 against 0). It **only partly met K14**: it did not name the local guard's own intent-rewrite line. It **missed K15** ("update both"). |
| R3, agentic-architecture (K16, K17, K24) | 2.5 of 3 | 2.5 of 3 | The cut had no wrong findings established, against four minor ones, and a lighter guard: 778 words against 1,220. |
| R4, five guard runs (K18–K20, K22, K25–K27) | 11 of 11 | 10.5 of 11 | The cut lost half on R4a K18, for a naming nitpick filed as a session finding. Both versions caught the staged-only rename, found the uncommitted rename without a start commit, and refused "code and test agree". |
| Generated guard size | 1,995 words | 874 words | The cut's ORC guard named fewer intent documents to protect: it left out the lab's north star. |
| Questions (failing) | R1 4 (0), R2 3 (0), R3 3 (1) | R1 4 (0), R2 3 (0), R3 3 (1) | No difference. |

**Verdict under the rule fixed before the runs: the cut fails.** It lost two intent items, K14 on R2 and K21 on R1, both
of which the baseline met. It also lost K15. On every coverage item (K6, K19, K26, K27) it held.

**Two corrections to this key, found by the scorers:**
- **R4c's key says "even though the test passes".** It would not pass. The edited allowlist is out of the sorted order
  that `toEqual` compares, and `src/core/analysis-tools.ts` rises above its agent-tie allowance. K25 is unaffected.
  The runs that predicted these failures were right.
- **The 5 October correction to K16 missed a dating clue.** `git archive` stamps every file with its commit's time, so
  the snapshot's file dates (1 August) do date the reference-only commit.

### What was changed after round 1

Three targeted fixes (`fe67639`):
- **K14, K15:** the intent pass reads every existing guard's repair instructions against the intent-change rule, and
  records "edit intent to match" or "update both" as a finding.
- **K21:** every proposed patch names the open questions it touches and leaves their text alone.
- **Stray load:** the front door no longer sends docs-first runs to `mixed-profile.md`.

Also from this round: the generator asks for every document that holds authorised intent, not only the README.

One run per case cannot separate a real loss from run-to-run variation. So round 2 runs each failed case twice.

### Round 2

*Pending.*
