---
title: "Test of the rule that a claim about everything a system reaches shows its search"
date: 2026-10-07
participants:
  - Justin Philpott
  - Claude Opus 5.5
type: evaluation
status: round 8 fails on its K35 criterion; patch check shown to work
---

# Test of the rule that a claim about everything a system reaches shows its search

## Why

The size-cut test (`2026-10-07-size-cut-eval.md`) found assessments misstating what ORC reaches in 6 of 11 cut runs on
ORC and the lab. Most left out the Chromium that ORC launches in its own process from
`src/adapters/browser/playwright.ts`, or credited that browser's reach to packages. One run reported ORC's
`AGENTS.md` network list "consistent" because the architecture test agreed with it, although both omit the browser.
A targeted instruction at `29e629d` ("search for every member of that kind") did not stop it.

This is a missing system, not an instance: the skills told runs to check completeness, but nothing made the check
visible, so a run could skip it and still state the claim. Justin approved the fix on 7 October ("Agreed, proceed").

Searched: "static analysis inventory of outbound network calls and subprocess launches". Found: pattern searches
with Semgrep and ast-grep, which this repo already recommends for mechanical checks. The rule uses them rather than
anything new.

## The change

`entropy-assessment`'s "Rules along the whole route" gains one rule, replacing the line it supersedes: a claim about
everything of a kind (what the system reaches over the network, launches, stores, or reads credentials from) is
checked against the code with a pattern search, never against a document and a test that agree. The run records the
patterns, the paths and each hit with the process that runs it, and marks a claim without that record incomplete.
`mixed-profile.md` points at the rule, and the guard contract's repair line carries a short copy. The guard's common
contract grows from 706 to 724 words.

## Runs

The same targets, prompts and method as the size-cut test, on a copy of the skills at this branch's commit with the
evaluation paths withheld:
- **R1 (ORC and the lab), three times.** R1 is the only case with reach claims. Three runs, because the earlier fix
  passed two runs and then failed later.
- **R2 and R3, once each,** to check the change breaks nothing there.
- **R4 and R5 are not re-run.** The guard template's change is one repair line; the routes are unchanged.

## Answer key

The size-cut test's key applies (K1 to K34), with two clarifications made before these runs:
- **K3** covers "scheduling" and the Bookwhen token. "Workflow execution" belongs to K21, which requires it left open.
- **K30** reads "at most once, and exactly once when the guard decision is `create` or `update`".

Added:
- **K35 (R1). ORC's reach is stated from a recorded search.** Every claim the run makes, keeps or reports consistent
  about everything ORC reaches over the network or launches, in findings, in lists of things checked, or in any patch:
  - includes the Chromium launched from `src/adapters/browser/playwright.ts` (`chromium.launch`), credited to ORC's
    own process, or is marked incomplete;
  - has its search recorded beside it: the patterns, the paths and the hits.

  Met: both, everywhere. Partly met: the browser is present and correctly owned everywhere, but a search record is
  missing. Not met: any such claim leaves out the browser or credits its reach to packages, without being marked
  incomplete.

## What decides the result

- **Every gate is met in every run of its case.** R1 gates: K1, K3, K4, K5, K6, K8, K21, K23 and K35. R2 gates: K11 to
  K15. R3 gates: K16 and K24. A partly met item counts as a loss.
- **Reported, not gates:** totals, questions and how many fail, wrong findings, consequential extras, K34,
  over-sorting, and the words the runs read.

## Results

### R2 and R3 (`scores/round7-R2-R3.md`)

| Run | Total | Gate items missed | Questions (failing) | Wrong findings | Consequential extras |
|---|---|---|---|---|---|
| R2-r7 | 6.5 of 8 | **K13** (0.5) | 4 (1) | 0 | 1 |
| R3-r7 | 5 of 5 | none | 2 (0) | 0 | 0 |

**R2-r7 misses a gate: K13 is partly met.** It reports `doc-health-check` as a missing skill but never mentions
`distill-article`, the other dead reference. K13 was met in all four earlier runs of the cut skills (rounds 5 and 6).
The change under test adds a rule about reach claims to the front door, which this run read; the rule says nothing
about stale references, so the miss is more likely run-to-run variation than an effect of the change, but one run
cannot show which. The rule fixed before the runs does not allow for that: under it, **this round
fails on K13**, whatever R1 shows.

**What was added after this result, and why.** The baseline was run once per case, so nothing measures how often it
meets each item. Without that, an unrelated miss cannot be told from a regression. Two more R2 runs of the candidate
and two of the baseline (`daee846`) were started on 7 October at about 22:10, scored blind on K10 to K15. They
measure variation; they do not change this round's verdict under its rule.

### R1 (`scores/round7-R1.md`)

| Run | Total | Gate items missed | K35 | K32 | K34 | Questions (failing) | Wrong findings | Consequential extras |
|---|---|---|---|---|---|---|---|---|
| R1-r7a | 14.5 of 15 | none | 1 | 0.5 | met | 5 (0) | 2 | 2 |
| R1-r7b | 14 of 15 | **K35** | 0 | 1 | met | 5 (0) | 3 | 3 |
| R1-r7c | 13 of 15 | **K35, K21** (0.5) | 0 | 1 | not met | 5 (0) | 2 | 3 |

**The search works; the patches do not use it.** All three runs found ORC's own Chromium, credited it to ORC's
process, and recorded searches that the scorer re-ran and matched. Before this change, 6 of 11 runs misstated ORC's
reach somewhere in their output, and the findings were not scored separately from the patches. What failed now is the
step after the findings:
- **R1-r7b** reports Chromium missing from ORC's subprocess list (its F5), then its settled patch rewrites that list
  to four modules without Chromium, not marked incomplete.
- **R1-r7c** has correct findings and a correct provisional `AGENTS.md` hunk, then a provisional README opening that
  leaves Chromium out and credits the Bookwhen reach to packages, contradicting its own `AGENTS.md` hunk.
- **R1-r7c also misses half of K21:** a settled hunk edits the sentence its open question Q3 quotes.

**This is a missing system, not an instance.** Three failures now share one cause: a run's patches are written
without being checked against its own findings and questions. Round 5's K21 failure was the same shape (the run named
the questions its hunk touched, then left it settled). Nothing in the skills asks for that check: the generator
reviews its patches for open questions only, and the assessment has no review step at all.

**Also seen, not gates:**
- **K32 improved:** two of three runs class Danger correctly as an executed check that warns, against none of four in
  rounds 5 and 6.
- **K34 is met in two of three runs.**
- **Over-sorting is in all three runs,** mostly listing Chromium or the restart service held behind a question that the
  code already settles.

### The variance runs (`scores/round7-R2-variance.md`, blind; mapping in `scores/r7-variance-mapping.json`)

| Version | Run | K10 | K11 | K12 | K13 | K14 | K15 |
|---|---|---|---|---|---|---|---|
| candidate | R2-r7 | 0 | 1 | 1 | **0.5** | 1 | 1 |
| candidate | R2-v1 | 1 | 1 | 1 | **0.5** | 1 | 1 |
| candidate | R2-v2 | 0.5 | **0** | 1 | **0.5** | 1 | 1 |
| baseline | R2-v3 | 0.5 | 1 | 1 | 1 | 1 | **0** |
| baseline | R2-v4 | 0.5 | 1 | 1 | 1 | 1 | **0** |

**Revised, with this evidence:** the K13 miss is probably not chance, as the R2 section above suggested. The candidate
missed half of K13 in all three of its round-7 runs; the round-6 skills, without the reach rule, met it in all four
runs of rounds 5 and 6, and the old skills met it in both runs here. A likely cause is visible: R2-v2 ran a full
pattern search for what a markdown-only repository "reaches or launches". The rule sits in the front door, so every
route loads it, including docs-first routes where such claims rarely exist. Moving it to `mixed-profile.md`, which only
mixed, code-first and workflow-heavy routes read, follows the size cut's own principle of loading branch material
only on its branch.

**The baseline fails its own gate.** The old skills missed K15 ("update both") in both new runs, though their single
round-1 run met it. So the pass rule, which holds every candidate run to items the baseline met once, is stricter than
the baseline itself can pass. A fair rule compares rates across several runs of each version.

### Verdict under the rule fixed before the runs

**Round 7 fails:** K35 in two of three R1 runs, K21 in one, and K13 in the R2 run. The change is not ready to merge.

## Round 8: the revised change, against PR #14's skills (key written before any run)

Approved by Justin on 7 October at 22:29 ("agreed"), after round 7.

**What changed since round 7:**
- **The reach rule moved to `mixed-profile.md`,** which only mixed, code-first and workflow-heavy routes read. The front
  door keeps its earlier, shorter line on exhaustive claims, as in PR #14.
- **A new rule in the front door: check every patch against the findings and the questions before delivering it.** A
  settled hunk may not state what a finding contradicts or edit text a question quotes, and a hunk restating a list a
  finding calls incomplete adds what is missing or marks it incomplete. The generator's review step points at it.

**Versions:** the candidate is this branch's next commit. The reference is PR #14's skills, the version this change
modifies (`b73b10d`, whose skills are identical to `e7f0b6e`'s).

**Runs:** three of each version on each of R1, R2 and R3: 18 runs. Each case's six runs are scored by one scorer,
blind, labelled in random order.

**Added key item:**
- **K36 (R1, R2). Patches agree with the run's own findings.** No settled hunk states what one of the run's findings
  contradicts, edits text one of its open questions quotes, or restates a list a finding calls incomplete without
  adding what is missing or marking it incomplete.

**The pass rule, fixed now:** each item is compared as a sum over three runs, scored as before (1, 0.5, 0).
- **No regression:** for every gate item (R1: K1, K3, K4, K5, K6, K8, K21, K23; R2: K11 to K15; R3: K16 and K24), the
  candidate's sum is at least the reference's sum minus 0.5. Half a point is one partly met run, the smallest step
  the scoring has. Tonight two runs of the same old skills differed from their earlier run by a whole point on K15,
  so three runs cannot separate smaller differences from chance; a drop of a whole run or more fails.
- **Improvement on the item under test:** for K35 the candidate's sum is at least the reference's plus 1, a whole run
  better. For K36 the candidate's sum is at least the reference's.
- **Reported, not gates:** every other item, questions, wrong findings, consequential extras, over-sorting, and the
  words each run read.

### Round 8 results

Each case's six runs were scored blind by one scorer; the labels were unblinded afterwards from
`scores/r8-mapping.json`. Sums over three runs per version.

**R2 (`scores/round8-R2.md`):**

| Item | Candidate | Reference | Rule | Result |
|---|---|---|---|---|
| K11 | 2.5 | 3 | no drop over 0.5 | holds |
| K12 | 3 | 3 | no drop over 0.5 | holds |
| K13 | 2.5 | 3 | no drop over 0.5 | holds |
| K14 | 3 | 3 | no drop over 0.5 | holds |
| K15 | 3 | 3 | no drop over 0.5 | holds |
| K36 | 3 | 2.5 | at least the reference | holds |
| K10 (reported) | 1 | 2 | – | – |

K13 recovers from round 7, where the reach rule sat in the front door and every candidate run missed half of it: here
one of three candidate runs misses `distill-article`. K10 is lower for the candidate, by one point; it is not a gate,
and it was the weakest item for every version in every round.

**R3 (`scores/round8-R3.md`):** all six runs score 5 of 5, so K16 and K24 are 3 and 3 for each version, and the rule
holds. Every run chose `none` and handed nothing to the generator. The runs differ in patch size, from 2 files to 16,
which the key does not score.

**R1 (`scores/round8-R1.md`):**

| Item | Candidate | Reference | Rule | Result |
|---|---|---|---|---|
| K1, K3, K4, K5, K6, K8, K21, K23 | 3 each | 3 each | no drop over 0.5 | hold |
| **K35** | **2** | **1.5** | **at least the reference plus 1** | **fails** |
| K36 | 3 | 1 | at least the reference | holds |
| K32 (reported) | 2.5 | 1.5 | – | – |
| K2 (reported) | 2 | 2.5 | – | – |

### Verdict under the rule fixed before the runs

**Round 8 fails on one criterion: K35 improves by half a point, and the rule asked for a whole run.** Everything else
holds:
- **No regression** on any gate in any of the three cases.
- **The patch check works:** K36 is 3 of 3 for the candidate against 1 of 3 for the reference. The reference's two
  failures are settled hunks that re-assert sentences their own findings call false.
- **The reach rule's effect is small:** the candidate met K35 in two of three runs; the reference, with no reach rule,
  met it in one and a half. The reference did better than the earlier record suggested (6 of 11 runs misstated reach
  in rounds 1 to 6), so three runs cannot show whether the rule helps.
- **One failure is shared by both versions:** a README rewrite that credits the browser's reach to Scope packages (one
  candidate run, one reference run). The finding is right in both; the prose that summarises it is wrong.

Three runs per version can show large differences only. What the evidence supports: the patch check is a clear gain;
the reach rule costs nothing now that it sits in the mixed profile, and its benefit is not shown.

**Not opened as a PR.** Whether to ship both changes, ship the patch check alone, or test further is Justin's call.
