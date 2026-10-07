---
name: entropy-guard
description: Check the entropy-guard repository's coherence at the end of a work session, before commit or handoff. Covers intent, decision and learning capture, skill contracts and catalogues, workflow alignment and TODO.md state.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. A trivial change (a
typo or formatting only) may skip it, as `AGENTS.md` allows.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: `INTENT.md`; `README.md` "Project status"; `AGENTS.md` "Project Constraints". Steward:
  unresolved, as no document names one (open question in `TODO.md` "Current state").
- Current state and next steps: `TODO.md`. Read it first.
- Decisions: `DECISIONS.md`; read its header note and each entry's "Superseded by" note. Learnings: `LEARNINGS.md`.
- Rules owned elsewhere: the agentskills.io skill format (https://agentskills.io/specification), adopted in
  `DECISIONS.md` "Skill format".
- Product artifacts: `skills/*/SKILL.md` (exported) and `skills/local/*/SKILL.md` (this repo's own). Their names,
  paths, step numbers, inputs and handoffs are contracts that other files cite.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use
`@{upstream}` and report "coverage incomplete". If neither exists, report committed changes as not covered, and still
inspect staged, unstaged and untracked work.
```bash
git log --oneline <start>..HEAD           # commits
git diff <start> HEAD                     # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
<!-- Check staged and unstaged separately: `git diff HEAD` nets them out, so a change staged and then undone in the
working tree shows nothing yet still lands. No check here depends on live state. -->

## Intent
Does this change fit the authorised intent in `INTENT.md`, `README.md` "Project status" and `AGENTS.md` "Project
Constraints"? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for the steward in `DECISIONS.md`; work that depends on it waits
>    for the decision.
> 4. Do not edit `INTENT.md`, `README.md` "Project status" or `AGENTS.md` "Project Constraints" to match the work
>    unless the steward has recorded that decision.
> 5. Correct a document directly only when a recorded decision of the steward's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`.)

Open intent questions are listed in `TODO.md` "Current state".

## Checks
- If `.githooks/pre-commit` changed: do `README.md` ("Project operations", "Contributing") and `AGENTS.md` ("Run
  entropy-guard before committing", "Key Files") still describe what it prints and how to enable it?
- For each state claim changed in `TODO.md`: do its other mentions still agree (`README.md` "Project status",
  `INTENT.md` "Scope boundary and next validation loop")? Refresh the check date in "Current state".
- If this session chose between approaches, decided against something, found a constraint or set a convention: is it
  in `DECISIONS.md`, dated, naming who decided, with context, decision and impact?
- If it found a gotcha, or validated or broke an assumption about the method: is it in `LEARNINGS.md`, with the
  insight, what validated it and the implication?
- Before restoring a deleted file, reviving an old concept or recreating a missing link target: does `DECISIONS.md`
  or `TODO.md` "Current state" record it as superseded?
- If a skill's name, path, step numbers, inputs or handoff changed: search the other skills, `README.md`,
  `AGENTS.md`, `INTENT.md`, `DECISIONS.md` and `LEARNINGS.md` for the old form, and fix each live reference (in
  `INTENT.md`, only as the Intent rule allows) or mark a historical one as such.
- If a file or skill was added, removed or renamed, or a skill's role changed: do `AGENTS.md` "Quick Links" and "Key
  Files", `README.md` "What's here" and `INTENT.md` "The guard lifecycle" still agree with each skill's own
  `description`?
- If a skill changed: does it still follow `INTENT.md` "What a guard should preserve", "What a guard should NOT be"
  and "Enforcement depth spectrum"?
- If this session changed how contributors work: would an agent starting from `AGENTS.md` alone do what this session
  did, and do `README.md` "Contributing", `.githooks/pre-commit` and this guard agree?
- If changed text says a check runs, is required or is enforced: does it name the mechanism that makes it so, or say
  that it is a reminder?
- `TODO.md`: is "Doing Now" cleared, finished work removed, and new work filed under Next Up or Backlog?
- Did this session's work answer a placeholder or an empty section? Fill it or remove it.
```bash
git diff --check <start>                  # whitespace errors in this session's changes
# skill frontmatter name must equal its folder name (agentskills.io)
for f in $(git ls-files 'skills/*SKILL.md'); do d=$(basename "$(dirname "$f")"); n=$(sed -n 's/^name: *//p' "$f" | head -1); [ "$n" = "$d" ] || echo "name mismatch: $f ($n)"; done
# relative markdown links whose target does not exist
git ls-files '*.md' | xargs grep -onE '\]\([^)#: ]+[)#]' | while IFS=: read -r f l m; do t=${m#??}; t=${t%?}; [ -e "$(dirname "$f")/$t" ] || echo "broken link: $f:$l -> $t"; done
# after a rename: every remaining mention of the old name or step
git grep -n -F '<old name>' -- '*.md' .githooks
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For a claim about everything of a kind, such as what the system reaches or launches, search the code rather than
  trusting a document and a test that agree, and record the search. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a skill makes an
  untouched `README.md` table wrong. Problems that were already there, listed separately.
- Proposals for the steward; files updated; the next action, written into `TODO.md`. A gap too large for this change
  goes to `TODO.md` Next Up or Backlog, not into this commit.
- Put a one-line result (what was updated, or "entropy check clean") in the commit message, as `README.md`
  "Contributing" asks.
