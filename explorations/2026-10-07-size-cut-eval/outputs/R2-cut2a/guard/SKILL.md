---
name: entropy-guard
description: Check the entropy-guard repository's own coherence after meaningful work, before the commit that lands it. Also the repo's reference example of a generated guard.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0, refining this guard's v0.2.3"
---

<!-- PROVISIONAL until the steward answers "Who the steward is" and "How INTENT.md changes" in DECISIONS.md
"Proposed, awaiting the steward". The steward named below and the Intent section assume the recommended answers.
Do not install this over v0.2.3 before then, and delete this comment when installing. -->

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before commit or handoff. Check only this session's change; skip typo
or formatting-only changes. For a full audit, run `skills/entropy-assessment/SKILL.md` instead.

## Where things live
- Authorised intent: INTENT.md, README.md "Project status", AGENTS.md "Project Constraints", and the scope decisions
  in DECISIONS.md. Steward: Justin Philpott.
- Current state and next steps: TODO.md. Read it first.
- Decisions: DECISIONS.md. Working practice: AGENTS.md.
- Rules owned elsewhere: the agentskills.io skill format (DECISIONS.md "Skill format").
- Historical, not direction here: `explorations/`, and anything marked as carried to the sibling
  `entropy-immune-system` repo (DECISIONS.md "Farm broader entropic-immunity exploration…").

## What changed this session
Set `START` to the commit noted in TODO.md "Doing Now" when the session began; read it before clearing that section.
```bash
git log --oneline "$START"..HEAD          # commits
git diff "$START" HEAD                    # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
Check staged and unstaged separately: `git diff HEAD` nets them out. Also list any GitHub issue this session filed on
`justinphilpott/entropy-guard` through `skills/local/entropy-guard-feedback/`, with its URL.
If the start point is unknown, compare against `origin/main` and report "coverage incomplete".

## Intent
Does this change fit the authorised intent above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin Philpott in DECISIONS.md; work that depends on it waits
>    for the decision.
> 4. Do not edit INTENT.md, README.md "Project status" or AGENTS.md "Project Constraints" to match the work unless
>    Justin Philpott has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin Philpott's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If a skill under `skills/` changed: does it still meet INTENT.md "What a guard should NOT be" (delta-scoped, low
  burden), and does each check it recommends sit at a depth from INTENT.md "Enforcement depth spectrum"?
- If a skill's name, path, inputs, outputs or hand-off changed: do the skills on each side of the hand-off still agree
  (`entropy-assessment` → `docs-first-planning-assessment` → the guard writer → `guards-integrator`), and do README.md
  "What's here" and AGENTS.md "Key Files" still match? If INTENT.md "The guard lifecycle" no longer matches, use the
  rule above.
- When two documents describe one thing, decide which owns it and reduce the other to a link: a skill's purpose →
  its `description`; working practice → AGENTS.md; next steps → TODO.md; decisions → DECISIONS.md. Keep summaries,
  and the standalone explanations an exported skill needs outside this repo.
- If this session chose between approaches, rejected one, or set a convention: is it in DECISIONS.md, dated and
  naming who decided, and does each entry it supersedes now say "Superseded by …"?
- If this session validated or invalidated something on a real system: is it in LEARNINGS.md with what validated it?
  Untested theory goes to PHILOSOPHY.md, or to the sibling repo if it is entropic-immunity theory.
- Before recreating a deleted file, section or concept to fix a reference: was it superseded in DECISIONS.md or
  TODO.md, or marked historical?
- For each claim changed in TODO.md: do README.md "Project status" and INTENT.md "Scope boundary and next validation
  loop" still agree (both are intent documents: use the rule above)? Is "Doing Now" cleared, with finished items gone?
- If this session changed how work is done (guard trigger, TODO discipline, feedback path, the hook): would a fresh
  agent starting from AGENTS.md alone do what this session did? Update AGENTS.md, then check README.md
  "Contributing" and `.githooks/pre-commit` agree. A rule written as enforced names what enforces it.
- For each renamed, moved or deleted file, section or skill: `grep -rn "<old name>" .`, and fix each hit outside
  `explorations/`.
```bash
git diff --check "$START"
# relative markdown links resolve (explorations/ excluded: historical)
bash -c 'grep -rnoE --include="*.md" "\]\([^)#[:space:]]+" . | grep -v "](http" | grep -v "^./explorations/" | while IFS=: read -r f l m; do t=$(printf "%s" "$m" | cut -c3-); [ -e "$(dirname "$f")/$t" ] || echo "broken link: $f:$l -> $t"; done'
# each skill's frontmatter name matches its folder (DECISIONS.md "Skill format")
bash -c 'for f in skills/*/SKILL.md skills/local/*/SKILL.md; do d=$(basename "$(dirname "$f")"); grep -q "^name: $d\$" "$f" || echo "name mismatch: $f"; done'
```

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a skill makes
  an untouched README.md row wrong. Problems that were already there, listed separately.
- Proposals for Justin Philpott, in DECISIONS.md; files updated; the next action, written into TODO.md.
- A commit-message line: what the check changed, or "entropy check clean", naming workflow drift when that was the
  main issue.
