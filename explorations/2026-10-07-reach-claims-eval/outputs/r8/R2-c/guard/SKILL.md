---
name: entropy-guard
description: Session-end coherence guard for the entropy-guard project itself. Run after meaningful work, before committing. Checks intent fit, decision and learning capture, skill handoffs, workflow alignment, references and state honesty. A reference example of a generated guard.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
  replaces: "skills/local/entropy-guard/SKILL.md v0.2.3 (generated 2026-03-19, last evaluated 2026-04-07)"
---

<!-- Drafted 2026-10-07 as an update in place of skills/local/entropy-guard/SKILL.md. Install only after the steward
answers "Proposed: who may change INTENT.md" in DECISIONS.md, because the Intent section below depends on it. On
install, replace "inferred, not yet recorded" with a link to that decision, and delete this comment. -->

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before commit or handoff, as `AGENTS.md` ("Run entropy-guard before
committing") asks. Check only this session's change. Skip it for a typo or formatting-only change.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: `INTENT.md`, and `AGENTS.md` "Project Constraints". Steward: Justin Philpott (inferred, not yet
  recorded: see `DECISIONS.md`, "Proposed: who may change INTENT.md").
- Current state and next steps: `TODO.md` ("Current state", then "Doing Now"). Read it first.
- Decisions: `DECISIONS.md`. Proposals awaiting the steward sit at its top.
- Rules owned elsewhere: the agentskills.io skill format adopted in `DECISIONS.md` "Skill format"; seed scaffolding
  feedback in `AGENTS.md` "Scaffolding Feedback". User-wide agent instructions, if any, are not visible from this repo.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use the remote's
default branch (`git rev-parse --abbrev-ref origin/HEAD`) and report "coverage incomplete". If neither exists, report
committed changes as not covered, and still inspect staged, unstaged and untracked work.
```bash
git log --oneline <start>..HEAD           # commits
git diff <start> HEAD                     # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
<!-- Check staged and unstaged separately: `git diff HEAD` nets them out, so a change staged and then undone in the
working tree shows nothing yet still lands. -->

## Intent
Does this change fit the authorised intent in `INTENT.md` and `AGENTS.md` "Project Constraints"? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin Philpott in `DECISIONS.md`; work that depends on it waits
>    for the decision.
> 4. Do not edit `INTENT.md` or `AGENTS.md` "Project Constraints" to match the work unless Justin Philpott has
>    recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin Philpott's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If a skill's name, path, steps, inputs, outputs or handoffs changed: do the skills that hand to or from it,
  `README.md` "What's here", `AGENTS.md` "Key Files" and `INTENT.md` "The guard lifecycle" still describe it?
- For each state claim changed in `TODO.md` "Current state": do its other mentions, in `README.md` "Project status"
  and `INTENT.md` "Scope boundary and next validation loop", still agree?
- If this session made a choice (an approach, a convention, something decided against): is it in `DECISIONS.md`,
  dated, with any entry it supersedes marked?
- If it validated a non-obvious insight: is it in `LEARNINGS.md`, and tactical? Conceptual material goes where
  `DECISIONS.md` "LEARNINGS.md stays tactical" says.
- If a skill was created or changed: does it still keep `INTENT.md` "What a guard should NOT be" and "Guiding
  principles": delta-scoped, low burden, each check at the right enforcement depth?
- If how contributors work changed (guard trigger, `TODO.md` use, feedback filing, the hook): would a fresh agent
  starting from `AGENTS.md` do what this session did, and do `AGENTS.md`, `README.md` "Contributing",
  `.githooks/pre-commit` and this guard agree?
- If files were added, removed or renamed: does the link check below pass, does a search for each old name find
  nothing stale, and is any new top-level folder in `AGENTS.md` "Quick Links"?
- Before restoring a deleted artifact or reviving an old concept: does `DECISIONS.md` mark it superseded, or is it
  material that `TODO.md` "Current state" lists as misleading, such as `explorations/`?
- If this session's work answers a placeholder or an empty section: fill it or remove it.
- Is `TODO.md` "Doing Now" cleared, are finished items closed, and is anything this session surfaced in Next Up or
  Backlog?
- If this session filed or closed an issue on `justinphilpott/entropy-guard`: does `TODO.md` link it?
```bash
git diff --check <start>
# Relative links that do not resolve; run in bash. explorations/ holds transcripts and is skipped.
grep -rnoE '\]\([^)#]+' --include='*.md' --exclude-dir=explorations . | while IFS= read -r l; do f=${l%%:*}; t=${l#*\]\(}; case $t in http*) ;; *) [ -e "$(dirname "$f")/$t" ] || echo "broken: $l";; esac; done
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For an exhaustive list or an "only" claim, check the full scope, including delegated behaviour. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.
- A gap too large for this session goes into `TODO.md` Backlog, never into this guard.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a skill's step
  makes an untouched `README.md` or calling skill wrong. Problems that were already there, listed separately.
- Proposals for Justin Philpott; files updated; the next action, written into `TODO.md`.
- Put the report in the commit message: what was updated, or "entropy check clean", as `README.md` "Contributing"
  says. Say so when the main issue was workflow drift rather than a missing doc update.
