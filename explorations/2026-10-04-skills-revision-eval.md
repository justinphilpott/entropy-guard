---
title: "Before-and-after test of the skills revision"
date: 2026-10-04
participants:
  - Justin Philpott
  - Claude Opus 5.5
type: evaluation
status: complete; results recorded 2026-10-04
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
  **Corrected after R3-before finished, before any scoring.** The snapshot is a `git archive`, with no history, so
  the dated commit this case relied on is not visible to the run. Nothing in the files dates the reference-only
  status either: it appears only as undated banners in `README.md` and `AGENTS.md`. K16 is therefore scored as
  follows, for both runs:
  - the run reports the conflict;
  - it treats the explicit banner as the likelier current status;
  - it asks at most one question to settle it.
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

Run on 4 October 2026, between about 18:30 and 19:25. Each run was a fresh Claude Opus 5.5 agent that saw only the skills and
the target.

R1 to R3 were scored blind. A fresh agent got each pair of outputs as X and Y in random order, with the key and the
read-only target, and checked every finding it called right or wrong against the target. The order happened to come
out "X = before" in all three. The blinding was imperfect, because some outputs name the skill version they
followed. The full scoring is kept with the run outputs in the session scratchpad, not in this repository; the
figures below are taken from it. Claude scored R4 itself, not blind, because its three cases are mechanical.

A key item scores 1 if met and 0.5 if partly met.

| Run | Key, before | Key, after | Questions (failing), before | Questions (failing), after | Minutes, before / after |
|---|---|---|---|---|---|
| R1, ORC and the lab | 5.0 of 9 | 8.5 of 9 | 10 (4) | 4 (0) | 13.2 / 18.6 |
| R2, entropy-guard at `447da9a` | 3.5 of 6 | 5.5 of 6 | 9 (2) | 4 (1) | 11.5 / 14.8 |
| R3, agentic-architecture | 1.0 of 2 | 1.5 of 2 | 10 (6) | 3 (0) | 11.1 / 13.7 |
| R4, guard runs on a constructed ORC session | 2.0 of 3 | 3 of 3 | — | — | 2.0–2.4 / 3.1–4.3 |

### Where the revision did better

- **The generated guards changed the most.** On R1 the "before" guard missed all four guard items:
  - it did not cover uncommitted work (K6);
  - it held issue numbers and restated other owners' rules (K7, partly met);
  - it had no rule for when work conflicts with intent (K8);
  - its integration advice never checked adoption (K9).

  The "after" guard met all four.
- **The "before" guard kept the intent-rewrite line.** On R2, the guard the old skills produced kept, word for word,
  the line "update it [INTENT.md] with a dated note", and quietly kept "update both". The new skills' guard removed
  both.
- **Questions fell by more than half, and almost all now pass the test.** Across the three assessments, the old
  skills asked 29 questions, 12 of them failing; the revised skills asked 11, with 1 failing.
- **Proportion improved on the reference-only repo (R3).** The old skills added a harvest process and checks in the
  successor repositories. The revised skills ruled out hooks and CI, and shrank the guard from 1,704 to 1,180 words.
- **R4a, the legitimate change.** The old guard reported "not clean", only because tests could not run in this test.
  The new guard reported no finding caused by the change, and listed the tests as owed before merge.
- **R4, baseline and coverage.** The new guard stated its baseline and coverage in both scenarios, including
  "coverage incomplete" for the lab, which has no git history in these copies.

### Where the revision did no better, or worse

- **R1, K2.** The "after" run missed the contradiction about PR #200 ("not merged" and merged) in the lab's
  `STATE.md`, which the "before" run caught. It did catch the contradiction about which build is running.
- **R2, K10.** The "before" run put the choice between saved and regenerated guards to the steward as one question.
  The "after" run settled it itself, calling the 19 March learnings historical. The intent pass says to ask only when
  the work depends on the answer, and an assessment arguably does depend on this one.
- **R3, wrong findings.** The "after" run's guard assigns ownership of five files to a sibling repository that the
  run never read, and does not mark this as an inference. That breaks the intent pass's own rule of labelling
  inferences.
- **R4b, uncommitted drift (K19).** This case did not tell the two versions apart. Both runs caught the stale README
  line. The agent running the old guard, which says nothing about uncommitted work, was told where the session
  started and checked `git status` on its own.
- **Time and size.** The revised runs took 25 to 40% longer, and R1's outputs grew from about 10,400 to 13,500 words
  in all. The guards themselves got shorter: 1,941 against 2,118 words (R1), 1,570 against 2,023 (R2), and 1,180
  against 1,704 (R3).

### What this test cannot show

- **One run per case.** Run-to-run variation was not measured.
- **The key tests what the revision set out to fix.** It was written by the same agent that wrote the revision,
  after the reviews. So a higher score confirms that the revision does what it intended. It is not independent
  evidence that the skills catch new problems better. The independent signal is the scorers' "useful findings
  outside the key", and there the two versions were roughly even.
- **K16 was corrected after one run had finished** (recorded above). The correction applied to both runs.
- **No steward was present.** The question counts are questions written down, not questions asked and answered.
- **R4 was scored by the reviser, not blind.** And the runner was told the session's start commit, which made K19
  unable to discriminate.

### Real problems the runs found, beyond the key

These are recorded for the coming assessments, and none has been acted on.

**In this repository:**
- **The reminder-hook instruction never worked.** The README told readers to symlink `.githooks/pre-commit` to
  `.git/hooks/pre-commit`. A relative link resolves inside `.git/hooks/`, so the reminder silently never ran. The R2
  "after" run found this; it was reproduced and fixed on this branch with `git config core.hooksPath .githooks`.

**In ORC at `8cee662`.** Each of these was checked by a scorer against the target; the first was also checked by
Claude:
- **The test leaves two Danger patterns unprotected.** Danger's `GUARDED` list has 14 patterns, but
  `test/architecture.test.ts` (lines 723–740) asserts only 12. It leaves out `^config\/` and `^AGENTS\.md$`, so
  either could be removed from Danger's list without a test failing. Both are present today.
- **`AGENTS.md` names `src/bookwhen.ts`, which does not exist.**
- **A subprocess is missing from `AGENTS.md`.** `src/adapters/browser/playwright.ts:55` calls `chromium.launch`, but
  `AGENTS.md`'s subprocess and network lists leave it out.
- **Three `FRICTION.md` headings are missed.** The lab's headings at lines 635, 665 and 684 do not match the pattern
  in `friction()` in `tools/collect.mjs`, so their findings are counted under the section before them.
- **A decided name changed without a record.** The 17 September decision's `idempotency: natural | keyed | none`
  became `repeatEffect` and `submissionKey` (`FIXES.md:13`), with no record of Justin's decision.

### Verdict

On the cases it was built to fix, the revision works:
- the generated guards now carry the intent-change rule, pointers instead of copies, a full definition of what
  changed, and an adoption check;
- the assessments ask far fewer questions, and almost none that fail.

It costs about a third more time per assessment. Three weaknesses showed up, which the next revision should address:
- one missed state contradiction;
- one choice settled that should have been asked;
- one inference written into a guard as fact.
