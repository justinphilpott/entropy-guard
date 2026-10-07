---
title: "Test of the rule that a claim about everything a system reaches shows its search"
date: 2026-10-07
participants:
  - Justin Philpott
  - Claude Opus 5.5
type: evaluation
status: key written; runs to follow
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

*Pending.*
