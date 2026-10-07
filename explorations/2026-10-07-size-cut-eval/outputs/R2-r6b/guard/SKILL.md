---
name: entropy-guard
description: Check the entropy-guard repository's coherence at the end of a work session, before commit or handoff.
metadata:
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
- Authorised intent: `INTENT.md`, `README.md` "Project status", `AGENTS.md` "Project Constraints". Steward: Justin
  Philpott (repository owner).
- Current state and next steps: `TODO.md`. Read it first.
- Decisions: `DECISIONS.md`. Open intent questions are its entries marked "Proposed (awaiting Justin Philpott)".
- Rules owned elsewhere: the skill format, https://agentskills.io/specification (adopted in `DECISIONS.md`).
- Homes: principles in `INTENT.md`; tactical learnings in `LEARNINGS.md`; reflections in `PHILOSOPHY.md`; working
  practices in `AGENTS.md`; each skill's behaviour in its own `SKILL.md`. `explorations/` is historical.

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
Does this change fit the authorised intent in `INTENT.md`, `README.md` "Project status" and `AGENTS.md` "Project
Constraints"? If not:

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

(Intent-change rule v2, from entropy-guard `skills/entropy-assessment/intent-change-rule.md`.)

Open, awaiting Justin Philpott (proposal in `DECISIONS.md`): the opening note of `INTENT.md` and `AGENTS.md` "Consult
INTENT.md for significant decisions" let any contributor revise `INTENT.md` with a dated note, which steps 3 to 5 do
not allow. Until he decides, that `AGENTS.md` instruction governs edits to `INTENT.md` itself, and the report lists
each such edit for his review.

## Checks
<!-- One line per justified check, each with a trigger and a named thing to check. -->
- If a skill under `skills/` changed: do `README.md` "What's here", `AGENTS.md` "Key Files" and the skills that hand
  to or from it still describe its role, inputs and handoffs?
- For each state claim changed in `TODO.md`: do its other mentions still agree?
- If a skill changed: does it still hold `INTENT.md` "What a guard should NOT be" and "Guiding principles": scoped to
  the delta, low burden, each check at the enforcement depth it needs?
- If the session chose between approaches, rejected one, or set a convention: is it in `DECISIONS.md` as context,
  decision, impact? If it validated a gotcha or pattern: is it in `LEARNINGS.md` as insight, validated by,
  implication? Untested theory goes to `PHILOSOPHY.md`.
- If a concept's explanation changed: is it still explained in one home only (see "Homes"), with other files linking?
- Before restoring a deleted file or section, reviving an old concept or recreating a link target: does
  `DECISIONS.md` or `TODO.md` record that it was superseded? Entries marked superseded are not live guidance.
- If a file, section or skill was added, renamed, moved or removed: do `AGENTS.md` "Key Files" and `README.md` "What's
  here" list it correctly? Grep each old name, and run the link check below.
- If the session changed how work is done here (when this guard runs, how `TODO.md` is used, feedback capture,
  `.githooks/pre-commit`): would a fresh agent starting from `AGENTS.md` do what this session did, and do `AGENTS.md`
  "Working Practices", `README.md` "Contributing" and the hook still agree?
- Is `TODO.md` "Doing Now" cleared, and does its "Current state" still hold by its own staleness line?
- If the session filed an issue with `skills/local/entropy-guard-feedback/`: is the issue's URL in the commit
  message, and in `TODO.md` if work follows from it?
- Before commit: does the message say what this guard found, or "entropy check clean" (`README.md` "Contributing")?
```bash
git diff --check; git diff --cached --check        # whitespace errors (.editorconfig)
grep -rn -- '<old name>' --include='*.md' .        # once per renamed, moved or removed name
for f in $(git ls-files '*.md'); do grep -oE '[]][(][^)#]+' "$f" | cut -c3- | grep -vE '^(https?|mailto):' |
  while read -r l; do [ -e "$(dirname "$f")/$l" ] || echo "$f: broken link $l"; done; done   # relative links
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
