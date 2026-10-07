---
name: entropy-guard
description: Check this repository's coherence at the end of a work session, before commit or handoff. The entropy-guard project's own session-end guard.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
<!-- Pointers only. Never copy current direction, work status, next tasks or build ids into the guard; they belong in
the state file. Stable links to an issue or record that owns a policy are fine. -->
- Authorised intent: `INTENT.md`; `AGENTS.md` "Project Constraints"; `README.md` "Project status"; the scope
  decisions in `DECISIONS.md`. Steward: whoever `AGENTS.md` names; while it names nobody, that is an open question
  in `TODO.md`.
- Current state and next steps: `TODO.md`. Read it first.
- Decisions: `DECISIONS.md`, newest entry first.
- Rules owned elsewhere: the agentskills.io specification for every `SKILL.md` (adopted in `DECISIONS.md`, "Skill
  format").

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use `@{upstream}`
and report "coverage incomplete". If neither exists, report committed changes as not covered, and still inspect
staged, unstaged and untracked work.
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
Does this change fit the authorised intent in `INTENT.md`, `AGENTS.md` "Project Constraints" and `README.md` "Project
status"? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for the steward (see "Where things live") in `DECISIONS.md`; work
>    that depends on it waits for the decision.
> 4. Do not edit `INTENT.md`, `AGENTS.md` "Project Constraints" or `README.md` "Project status" to match the work
>    unless the steward has recorded that decision.
> 5. Correct a document directly only when a recorded decision of the steward's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`.)

## Checks
<!-- One line per justified check, each with a trigger and a named thing to check. -->
- If `.githooks/pre-commit` changed: do `AGENTS.md` "Working Practices" and `README.md` "Adapt the project's own
  guard" and "Contributing" still describe it?
- For each state claim changed in `TODO.md`: do its other mentions still agree?
- If a skill's name, steps, inputs, outputs or handoffs changed: do the skills that hand to or from it, `README.md`
  "How to use this repo" and `INTENT.md` "The guard lifecycle" still describe it?
- If a skill changed: does it still meet `INTENT.md` "What a guard should preserve", "What a guard should NOT be" and
  "Enforcement depth spectrum"?
- If a skill was added or its job widened: does its job overlap another skill's? If so, one owns it and the other
  links to it.
- If `AGENTS.md` "Working Practices" changed: would a fresh agent starting from `AGENTS.md` do what this session did?
- If the session chose between approaches, decided against something or set a convention: is it at the top of
  `DECISIONS.md`, dated and naming who decided?
- If the session validated or invalidated something non-obvious: is it in `LEARNINGS.md`, with what validated it?
- If the session superseded a `DECISIONS.md` entry: is the old entry marked as the file already does
  (`*Superseded by …*`)? Before reviving anything from an older entry, a `LEARNINGS.md` implication or
  `explorations/`, look for such a mark.
- If a file was added, removed or renamed: do `README.md` "What's here" and `AGENTS.md` "Key Files" still list it,
  and does a search for the old name find no live mention?
- If the session changed when a skill files a GitHub issue through `skills/local/entropy-guard-feedback/SKILL.md`:
  do every skill that delegates to it and `AGENTS.md` "entropy-guard Feedback" state the same condition?
- In `TODO.md`: is "Doing Now" cleared, are finished items gone, and is "Current state" still true?
```bash
git diff --check <start>
# Each SKILL.md's name matches its folder (agentskills.io; DECISIONS.md "Skill format")
find skills -name SKILL.md | while read -r f; do d=$(basename "$(dirname "$f")"); grep -q "^name: $d\$" "$f" || echo "name mismatch: $f"; done
# Relative markdown links resolve
grep -rnoE --include='*.md' '\]\([^)#: ]+[)#]' . | sed -E 's/^([^:]*):([0-9]+):\]\((.*)[)#]$/\1 \2 \3/' |
  while read -r f l p; do [ -e "$(dirname "$f")/$p" ] || echo "$f:$l: broken link $p"; done
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
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in the
  code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for the steward, recorded in `DECISIONS.md`; files updated; the next action, written into `TODO.md`; a
  one-line result in the commit message ("entropy check clean" if nothing changed), as `README.md` "Contributing"
  asks.
