---
name: entropy-guard
description: Check this repository's coherence at the end of a meaningful work session, before commit or handoff. Skip it for typo or formatting-only changes.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. Skip it for typo or
formatting-only changes. This repo's skills are its product, so a change to a skill is the code change here.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.
- Creating a GitHub issue with `skills/local/entropy-guard-feedback/` writes to a live tracker: do it only when the
  invocation permits it.

## Where things live
- Authorised intent: `INTENT.md`, and the scope decisions in `DECISIONS.md`. Steward: unresolved; see `TODO.md`
  "Current state".
- Current state and next steps: `TODO.md`. Read "Current state" first.
- Decisions: `DECISIONS.md`. Learnings: `LEARNINGS.md`. Working practices: `AGENTS.md`.
- Rules owned elsewhere: the SKILL.md format at https://agentskills.io/specification (`DECISIONS.md` "Skill format");
  seed scaffolding at https://github.com/justinphilpott/seed.
- Historical, not live: `explorations/`; its thread continues in `../entropy-immune-system`.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use the remote
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
Does this change fit the authorised intent in `INTENT.md` and the scope decisions in `DECISIONS.md`? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for the steward in `DECISIONS.md`; work that depends on it waits
>    for the decision.
> 4. Do not edit `INTENT.md` to match the work unless the steward has recorded that decision.
> 5. Correct a document directly only when a recorded decision of the steward's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If a skill under `skills/` changed: do `README.md` "What's here", `AGENTS.md` "Key Files" and the skills that hand
  to or from it still describe it, and does its frontmatter `name` match its folder?
- For each state claim changed in `TODO.md`: do its other mentions in `README.md` "Project status" and `INTENT.md`
  "Scope boundary and next validation loop" still agree?
- If an exported skill (under `skills/`, not `skills/local/`) changed: does it still meet `INTENT.md` "What a guard
  should preserve" and "What a guard should NOT be": delta-scoped, low burden, depth matched to the check?
- If the session chose between approaches, set a convention or decided against something: is it in `DECISIONS.md`,
  dated, with "Superseded by" or "Partially superseded by" on each entry it replaces?
- If the session learned something non-obvious: is it in `LEARNINGS.md`, with what validated it?
- If `AGENTS.md` "Working Practices", `README.md` "Contributing", `.githooks/pre-commit` or this guard changed: would
  a fresh agent starting from `AGENTS.md` follow the loop this session used?
- Before restoring a deleted file or reviving a concept (the four domain generators, `entropy-assessment` Phase 2 or
  its appendices, `doc-health-check`, theory from `explorations/`): do `DECISIONS.md` or `TODO.md` "Current state"
  record its supersession?
- If a file was added, moved, renamed or deleted: does the old-name search below come back empty, and do `AGENTS.md`
  "Key Files" and `README.md` "What's here" list the new state?
- If `TODO.md` changed or the work finished: is "Doing Now" cleared, and does each changed "Current state" claim
  carry its date?
- If the session created a GitHub issue through `skills/local/entropy-guard-feedback/`: is its link in the report?
```bash
# Relative markdown links that do not resolve; prints nothing when clean
grep -rnoE --include='*.md' '\]\([^)#[:space:]]+' . | while IFS=: read -r f n m; do t=${m#*\(}; case $t in http*|mailto:*) continue;; esac; [ -e "$(dirname "$f")/$t" ] || echo "BROKEN $f:$n -> $t"; done
# Each skill's frontmatter name matches its folder; prints nothing when clean
for s in $(find skills -name SKILL.md); do n=$(sed -n 's/^name: *//p' "$s" | head -1); [ "$n" = "$(basename "$(dirname "$s")")" ] || echo "NAME MISMATCH $s: $n"; done
# After a rename or removal: what still uses the old name (replace OLD_NAME)
grep -rn --exclude-dir=.git --exclude-dir=explorations 'OLD_NAME' .
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For a claim about everything of a kind, such as what the system reaches or launches, search the code rather than
  trusting a document and a test that agree, and record the search. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.
- A gap too large for this change goes into `TODO.md` "Next Up" or "Backlog", not into this guard.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a skill makes an
  untouched README wrong. Problems that were already there, listed separately.
- Proposals for the steward; files updated; the next action, written into `TODO.md`.
- In the commit message: the findings, or "entropy check clean".
