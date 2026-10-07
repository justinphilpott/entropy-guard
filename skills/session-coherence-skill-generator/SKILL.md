---
name: session-coherence-skill-generator
description: The guard builder for entropy-guard. Generate or update a repository's session-end coherence guard from an assessment's findings, or bootstrap the smallest context-preservation structure for a young repo that is starting to need handoff memory.
metadata:
  version: "0.5.0"
---

# Skill: Session Coherence Skill Generator

The only skill in entropy-guard that writes guards. It builds or updates the guard an agent or person runs at the end
of a work session, so the repo is left coherent, honest about its state, and easy to pick up.

## Inputs, and the guard decision

The inputs come from an assessment. If none was given, call `skills/entropy-assessment/SKILL.md` for analysis only,
passing your own mode. Its "Called for analysis only" contract returns the findings, the guard decision and the inputs
below. Then act on the decision:

- **`none`:** stop. Report that no guard change is needed, and why.
- **`bootstrap`:** follow [`bootstrap.md`](bootstrap.md). Build a guard only if its verdict is `ready now`.
- **`create` or `update`:** build the guard to the contract below, then hand it to `skills/guards-integrator/SKILL.md`.
  That handover is this skill's alone.

The inputs a guard needs are below. Any input marked unresolved stays visible in the guard; do not fill it by
guessing.
- the steward, every document that holds authorised intent (a north star, a scope definition, a README's direction:
  not only the README), the decision surface, and any open intent questions (`intent-pass.md`);
- the current-state file, and who refreshes it;
- rules the repo is bound by but does not own, such as a user-wide instructions file, a security or spending policy,
  or merge rules;
- the verification commands, and which of them already run by themselves;
- each code area and the docs and tests that describe it;
- live operational state or spend that a session can change;
- the assessment's findings, by id.

## Modes and safety

The "Modes and safety" section of the guard contract below applies to this skill as well as to every guard it writes.
When the runtime mode and the wording differ, the stricter wins. Discuss-first is the default for changes that cross
repositories or touch policy.

## The guard contract

This template is the one definition of what a guard holds. A guard holds durable checking policy only: it points at
current state, decisions and other owners' rules, and never copies them. Write it at the default path
`skills/session-coherence-guard/SKILL.md`, or update the repo's existing guard in place.

````markdown
---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "<date>"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: <Repo> Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
<!-- Pointers only. Never copy current direction, work status, next tasks or build ids into the guard; they belong in
the state file. Stable links to an issue or record that owns a policy are fine. -->
- Authorised intent: <files>. Steward: <name or role>.
- Current state and next steps: <state file>. Read it first.
- Decisions: <decision surface>.
- Rules owned elsewhere: <links>.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use <upstream> and
report "coverage incomplete". If neither exists, report committed changes as not covered, and still inspect staged,
unstaged and untracked work.
```bash
git log --oneline <start>..HEAD           # commits
git diff <start> HEAD                     # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
<!-- Check staged and unstaged separately: `git diff HEAD` nets them out, so a change staged and then undone in the
working tree shows nothing yet still lands. Add live changes the checks depend on (a deployed build, a grant), read
with the time. -->

## Intent
Does this change fit the authorised intent in <files>? If not:
<the intent-change rule from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`, copied with
<steward>, <intent documents> and <decision surface> filled in>
(Intent-change rule v2, from entropy-guard.)

## Checks
<!-- One line per justified check, each with a trigger and a named thing to check. -->
- If <code area> changed: does <doc> still describe it?
- For each state claim changed in <state file>: do its other mentions still agree?
```bash
<repo commands that CI does not already run>
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For an exhaustive list or an "only" claim, check the full scope, including delegated behaviour. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for <steward>; files updated; the next action, written into <state file>.
````

## Size

A guard runs every session, so its size is derived, not picked. Its terms are counted once each:

- **The common contract:** the template above with the intent-change rule copied in, before any repo-specific content.
  Measured on 2026-10-07 at 706 words (`wc -w` on the template with the rule copied in, placeholders included).
- **Checks:** each justified repo-specific check beyond the template's two standing ones, at a planning average of 36
  words. That average was taken from a small sample in Astra's size review
  (`explorations/2026-10-05-skills-size-review-astra.md`); it is not a limit.
- **Pointers:** the words of the filled-in "Where things live" values.
- **Commands:** the words of repo-specific commands not already in the template.

The budget is the common contract, plus 36 for each check, plus the pointers, plus the commands. Report the actual
size and each of these terms. Remove duplication first. If justified coverage still exceeds the budget, keep it and
explain the excess. Never cut required coverage to meet an estimate.

## Steps

1. Record the work in the repo's current-state file.
2. Check the inputs are complete, and act on the guard decision.
3. Write or update the guard to the contract.
4. Review before handing over:
   - the guard carries "Modes and safety", and binds its baseline;
   - every proposed patch against the open questions, so none quietly settles one;
   - every repair instruction against authorised intent;
   - the size against the budget.
5. Mention the guard in the operator docs, if the repo's workflow documents its guards.
6. Run `git diff --check`, plus any checks the repo implies.
7. Hand to `guards-integrator`.

In plan mode, follow the same steps but edit nothing, and list the files build mode would change.

## Output

- What was supplied or found.
- The guard decision, and the guard's path, size and budget terms, or the bootstrap verdict.
- Doc references added, and validation run.
- Open questions the guard leaves visible.
- The handoff to `guards-integrator`.
