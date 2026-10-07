---
name: entropy-guard
description: Session-end coherence guard for the entropy-guard repository. Run at the end of a meaningful work session, before commit or handoff. Checks this session's change against authorised intent, decisions, learnings, skill contracts, workflow, state and references.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before commit or handoff, once per logical piece of work. Check only
this session's change. Skip it for typo or formatting-only changes.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: `INTENT.md`, and the scope decisions in `DECISIONS.md` ("Specialize first…", "Farm broader…");
  `README.md` "Project status" summarises them. Steward: Justin Philpott (inferred, see `DECISIONS.md` proposals).
- Current state and next steps: `TODO.md`. Read it first.
- Decisions: `DECISIONS.md`. Learnings: `LEARNINGS.md`. Historical: `explorations/`.
- Rules owned elsewhere: the agentskills.io skill format (`DECISIONS.md`, "Skill format"); a user-wide agent
  instructions file: unresolved, none is named here.

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
working tree shows nothing yet still lands. -->

## Intent
Does this change fit the authorised intent in `INTENT.md` and the scope decisions in `DECISIONS.md`? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin Philpott in `DECISIONS.md`; work that depends on it waits
>    for the decision.
> 4. Do not edit `INTENT.md` or the scope decisions in `DECISIONS.md` to match the work unless Justin Philpott has
>    recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin Philpott's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If a skill's contract changed (its name, path, inputs, outputs or handoffs): do the skills that hand to or from it,
  `README.md` "What's here" and `AGENTS.md` "Key Files" still describe it?
- For each state claim changed in `TODO.md`: do its other mentions (`README.md` "Project status", `INTENT.md` "Scope
  boundary") still agree? Is "Doing Now" cleared and finished work removed?
- If this session chose between approaches, rejected one or set a convention: is it in `DECISIONS.md`, dated and
  attributed, with any entry it supersedes marked?
- If something was validated or invalidated in real use: is it in `LEARNINGS.md` with what validated it? Conceptual
  work goes to `PHILOSOPHY.md`, the writing repo or `entropy-immune-system` (`DECISIONS.md`).
- If a skill changed: does it still keep to `INTENT.md` "What a guard should NOT be" and the enforcement depth
  spectrum?
- If `docs-first-planning-assessment` Phase 2 or `session-coherence-skill-generator` changed: did their two guard
  templates move further apart? Report it against the open proposal in `DECISIONS.md` on which skill writes guards.
- If this session changed how contributors work (guard trigger, `TODO.md` discipline, feedback capture, the hook):
  would a fresh agent starting from `AGENTS.md` do what this session did, and do `README.md` "Contributing" and
  `.githooks/pre-commit` agree?
- Before restoring a deleted file, reviving a concept from `explorations/` or a superseded `DECISIONS.md` entry, or
  recreating a link target: does `DECISIONS.md` or `TODO.md` record its supersession?
- If a file, skill or heading was renamed, moved or deleted: search for the old name, and run the link check.
- If this session created or edited GitHub issues through `skills/local/entropy-guard-feedback/SKILL.md`: list each.
```bash
# Relative markdown links that do not resolve; prints nothing when all resolve
grep -rnoE --include='*.md' '\]\([^)# ]+' . | sed 's/:[]][(]/:/' | while IFS=: read -r f l t; do case $t in http*|mailto:*) continue;; esac; [ -e "$(dirname "$f")/$t" ] || echo "$f:$l -> $t"; done
git diff --check <start>                  # whitespace errors (.editorconfig)
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For a claim about everything of a kind, such as what the system reaches or launches, search the code rather than
  trusting a document and a test that agree, and record the search. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.
- A gap too large for this change goes to `TODO.md` "Next Up" or "Backlog"; do not widen the session to fix it.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a skill makes
  an untouched `README.md` wrong. Problems that were already there, listed separately.
- Proposals for Justin Philpott; files updated; the next action, written into `TODO.md`.
- A one-line result in the commit message, or "entropy check clean" (`README.md` "Contributing").
