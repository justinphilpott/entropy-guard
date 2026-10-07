---
title: "Test of the rule that a claim about everything a system reaches shows its search"
date: 2026-10-07
participants:
  - Justin Philpott
  - Claude Opus 5.5
type: evaluation
status: round 7 fails; variance measured
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
