---
name: entropy-guard
description: Check the entropy-guard repository's coherence at the end of a work session, before commit or handoff.
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
- Authorised intent: `INTENT.md`, and the scope decisions in `DECISIONS.md`; `README.md` "Project status" and
  `AGENTS.md` "Project Constraints" summarise them. Steward: Justin Philpott.
- Current state and next steps: `TODO.md`. Read it first, including its open questions.
- Decisions: `DECISIONS.md`.
- Rules owned elsewhere: the agentskills.io specification (`DECISIONS.md` "Skill format"); upstream feedback through
  `skills/local/entropy-guard-feedback/SKILL.md`.
- Triggered by: `AGENTS.md` "Working Practices", and the reminder in `.githooks/pre-commit`.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use `origin/main`
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
Does this change fit the authorised intent in `INTENT.md` and the scope decisions in `DECISIONS.md`? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin Philpott in `DECISIONS.md`; work that depends on it waits
>    for the decision.
> 4. Do not edit `INTENT.md`, `README.md` "Project status" or `AGENTS.md` "Project Constraints" to match the work
>    unless Justin Philpott has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin Philpott's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`.)

## Checks
<!-- One line per justified check, each with a trigger and a named thing to check. -->
- If a skill under `skills/` changed: do `README.md` "What's here", `AGENTS.md` "Key Files" and `INTENT.md` "The
  guard lifecycle" still describe its name, path and role?
- For each state claim changed in `TODO.md`: do its other mentions still agree?
- If a skill's name, path, inputs, outputs or handoff changed: does every skill that routes to it, calls it or hands
  to it still match (`grep -rn "<skill-name>" skills/`)?
- If guard-writing instructions changed (`skills/docs-first-planning-assessment/` Phase 2,
  `skills/session-coherence-skill-generator/`): does `DECISIONS.md` name one owner of the guard contract, with the
  other skill linking to it? If no decision names one, record the change as a proposal.
- If a skill changed: is it still delta-scoped and low-burden, with each check at the depth `INTENT.md` "Enforcement
  depth spectrum" gives it?
- Did this session choose between approaches, reject one, or set a convention? Is it in `DECISIONS.md`, dated? Did it
  validate or overturn something non-obvious? Is it in `LEARNINGS.md`, with what validated it?
- Before restoring a deleted file or section, reviving an old concept (such as `entropy-assessment`'s former Phase 2
  or domain appendices, or theory now in `../entropy-immune-system/`), or recreating a link target: does
  `DECISIONS.md` or `TODO.md` record that it was superseded?
- If anything was renamed, moved or deleted: does `grep -rn "<old name>" .` find no live reference outside
  `explorations/` and entries marked superseded?
- If how work is done here changed (guard trigger, `TODO.md` use, `.githooks/pre-commit`, feedback capture): would a
  fresh agent starting from `AGENTS.md` do what this session did, and do `README.md` "Contributing" and the hook agree?
- Is `TODO.md` "Doing Now" cleared, and is each follow-up, or gap too large for this change, in "Next Up" or "Backlog"?
```bash
# every SKILL.md is named after its folder (DECISIONS.md "Skill format")
for f in skills/*/SKILL.md skills/local/*/SKILL.md; do
  grep -q "^name: $(basename "$(dirname "$f")")$" "$f" || echo "name mismatch: $f"
done
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
- Proposals for Justin Philpott; files updated; the next action, written into `TODO.md`.
- A one-line summary in the commit message, or "entropy check clean" (`README.md` "Contributing").
