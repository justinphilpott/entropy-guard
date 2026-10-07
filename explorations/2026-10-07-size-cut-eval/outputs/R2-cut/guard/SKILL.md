---
name: entropy-guard
description: Check the entropy-guard repository's coherence at the end of a meaningful work session, before commit or handoff. Covers the exported skills as a product, the decision and learning logs, TODO.md state, and the contributor workflow.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before commit or handoff. Check only this session's change. Skip it for
typo or formatting-only changes.

## Where things live
- Authorised intent: `INTENT.md`; `README.md` "Project status" and `AGENTS.md` "Project Constraints" summarise it.
  Steward: Justin Philpott.
- Current state and next steps: `TODO.md` "Current state". Read it first.
- Decisions: `DECISIONS.md`, newest at the top; entries marked "Proposed" await Justin.
- Rules owned elsewhere: the agentskills.io specification for every `SKILL.md` (adopted in `DECISIONS.md` "Skill
  format"); `skills/local/entropy-guard-feedback/SKILL.md` for issues on `justinphilpott/entropy-guard`.
- Historical, not current direction: `explorations/`, seed material for the sibling `entropy-immune-system` repo.

## What changed this session
```bash
git log --oneline "$START"..HEAD          # commits
git diff "$START" HEAD                    # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
If the start point is unknown, compare against `origin/main` and report "coverage incomplete".

## Intent
Does this change fit `INTENT.md`, including "What a guard should preserve", "What a guard should NOT be" and "Scope
boundary and next validation loop"? If not:

<!-- Provisional: install this guard only after Justin decides "Proposed: intent changes are proposed by
contributors and decided by Justin" in DECISIONS.md. If he keeps the current AGENTS.md practice (a contributor revises
INTENT.md with a dated note), reword rule 4 to match before installing, then delete this comment. -->

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin Philpott in `DECISIONS.md`; work that depends on it waits
>    for the decision.
> 4. Do not edit `INTENT.md`, or the scope summaries in `README.md` and `AGENTS.md`, to match the work unless Justin
>    Philpott has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin Philpott's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If a `SKILL.md` changed its name, path, inputs, outputs, steps or the skill it hands to: do the skills that hand to
  it or from it, `README.md` "How to use this repo" and "What's here", `AGENTS.md` "Key Files" and `INTENT.md` "The
  guard lifecycle" still describe it?
- If a `SKILL.md` was added or its frontmatter changed: does `name` match its folder, and is `description` present?
- If the session changed how guards are written (`docs-first-planning-assessment` Phase 2 or
  `session-coherence-skill-generator`): decide which of the two owns the changed point, change that one, and reduce
  the other to a link rather than growing both.
- If the session removed or renamed a skill's phase, step or appendix: grep `DECISIONS.md` and `LEARNINGS.md` for the
  old name and mark entries that describe it "Superseded by" or "Partially superseded by". Before recreating anything
  to fix a reference, check whether it was superseded there.
- Did the session choose between approaches, reject one, or set a convention? Record it in `DECISIONS.md` with the
  date and who decided.
- Did the session validate or invalidate something non-obvious? Add it to `LEARNINGS.md` with what validated it. An
  idea supported only by conversation belongs in `PHILOSOPHY.md` or the sibling repo.
- For each claim this session changed in `TODO.md`: is "Doing Now" cleared, do `README.md` "Project status" and
  `INTENT.md` "Scope boundary and next validation loop" still agree, and does each changed "Current state" claim carry
  its new check date?
- If the session changed how contributors work (guard trigger, hook, TODO discipline, feedback flow): do `AGENTS.md`
  "Working Practices", `README.md` "Contributing", `.githooks/pre-commit` and this guard agree, and would a fresh
  agent starting from `AGENTS.md` do what this session did?
- If files were added, removed or renamed: are `AGENTS.md` "Key Files" and `README.md` "What's here" right, and does
  any prose quote a count, version or path that changed?
- If the session filed or closed an issue on `justinphilpott/entropy-guard`: does `TODO.md` link it where it affects
  active work?

```bash
grep -rn --include='*.md' 'OLD_NAME' .   # after a rename: every remaining mention of the old name
for f in $(git ls-files '*SKILL.md'); do  # each SKILL.md name matches its folder
  n=$(sed -n 's/^name: *//p' "$f" | head -1)
  [ "$n" = "$(basename "$(dirname "$f")")" ] || echo "name mismatch: $f ($n)"
done
```

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a step in one
  skill makes an untouched skill that cites it wrong. Problems that were already there, listed separately.
- Proposals for Justin, in `DECISIONS.md`; files updated; one line for the commit message ("entropy check clean", or
  what changed); the next action, written into `TODO.md` "Current state".
