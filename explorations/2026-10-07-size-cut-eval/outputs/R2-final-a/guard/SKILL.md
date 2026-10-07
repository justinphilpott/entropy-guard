---
name: entropy-guard
description: Check this repository's coherence at the end of a work session, before commit or handoff. The entropy-guard project's own session-end guard.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before commit or handoff. Check only this session's change. Skip it for
trivial changes such as typos or formatting, as `AGENTS.md` allows.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
<!-- Pointers only. Never copy current direction, work status, next tasks or build ids into the guard; they belong in
the state file. Stable links to an issue or record that owns a policy are fine. -->
- Authorised intent: `INTENT.md`, `README.md` "Project status", `AGENTS.md` "Project Constraints". Steward: Justin
  Philpott (inferred from the repository owner, `justinphilpott/entropy-guard`; unconfirmed, see `TODO.md`).
- Current state and next steps: `TODO.md`. Read it first. Open intent questions are listed there.
- Decisions: `DECISIONS.md`. Validated learnings: `LEARNINGS.md`.
- Rules owned elsewhere: the agentskills.io specification (https://agentskills.io/specification), adopted in
  `DECISIONS.md` "Skill format".
- Historical, not current truth: `explorations/`, `PHILOSOPHY.md`.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use
`$(git merge-base HEAD origin/HEAD)` and report "coverage incomplete". If neither exists, report committed changes as
not covered, and still inspect staged, unstaged and untracked work.
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
Does this change fit the authorised intent in `INTENT.md`, `README.md` "Project status" and `AGENTS.md` "Project
Constraints"? For a skill change, check it against `INTENT.md` "What a guard should preserve", "What a guard should
NOT be" and "Guiding principles". If not:

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
- If a skill under `skills/` changed its name, path, purpose, inputs or handoffs: do `README.md` "How to use this
  repo" and "What's here", `AGENTS.md` "Key Files", `INTENT.md` "The guard lifecycle", and every skill that hands to
  it still describe it?
- For each state claim changed in `TODO.md`: do its other mentions still agree, including `README.md` "Project
  status" and `INTENT.md` "Scope boundary and next validation loop"?
- If the session chose between approaches, decided against something or set a convention: is it in `DECISIONS.md`,
  dated, with context, decision and impact? If it validated a non-obvious insight: is it in `LEARNINGS.md` with what
  validated it? Unvalidated theory belongs in `PHILOSOPHY.md`, not `LEARNINGS.md`.
- If the session replaced a structure, step, skill or approach: are the `DECISIONS.md` entries and `LEARNINGS.md`
  references that describe the old one marked superseded, with a link? Before restoring a deleted file or section,
  or reviving an old concept, check `DECISIONS.md` for its supersession.
- If the session changed how contributors work (a guard trigger, `TODO.md` discipline, feedback capture, the hook):
  would a fresh agent following `AGENTS.md` alone do what this session did? Do `AGENTS.md` "Working Practices",
  `README.md` "Contributing", `.githooks/pre-commit` and this guard agree?
- If a path, heading, skill name or step number was renamed, moved or deleted: search for the old name with the first
  command below, and fix each hit.
- If a skill was added or renamed: does its frontmatter `name` match its folder, with exportable skills under
  `skills/` and repo-local ones under `skills/local/`? The second command below checks the names.
- `TODO.md`: is "Doing Now" cleared, is finished work removed or ticked, are gaps found this session filed under
  "Next Up" or "Backlog", and is any placeholder this session's work answers filled in or removed?
```bash
grep -rn --exclude-dir=.git -- '<old name>' .
for f in skills/*/SKILL.md skills/local/*/SKILL.md; do
  d=$(basename "$(dirname "$f")"); grep -q "^name: $d\$" "$f" || echo "name mismatch: $f"
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
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a skill makes
  an untouched `README.md` wrong. Problems that were already there, listed separately.
- Proposals for Justin Philpott; files updated; the next action, written into `TODO.md`.
- Gaps too large for this change: filed in `TODO.md`, not fixed now.
- A one-line result in the commit message, or "entropy check clean". Say so when the main issue was workflow drift
  rather than a missing doc update. List any issue filed on `justinphilpott/entropy-guard` this session, with its
  link.
