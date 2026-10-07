---
name: entropy-guard
description: End-of-session coherence check for the entropy-guard repo, before commit or handoff. Also the repo's reference example of a generated guard.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0, updating skills/local/entropy-guard v0.2.3 in place"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before commit or handoff; skip typo-level changes. Check only this
session's change.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: `INTENT.md`, and the scope rules in `AGENTS.md` "Project Constraints". Steward: not named in the
  repo; Justin Philpott, owner of `justinphilpott/entropy-guard`, is inferred until it is recorded.
- Current state and next steps: `TODO.md`. Read it first.
- Decisions: `DECISIONS.md`, with open proposals under "Proposed, awaiting the steward". Learnings: `LEARNINGS.md`.
- Working practices: `AGENTS.md`. Reminder: `.githooks/pre-commit`.
- Rules owned elsewhere: the agentskills.io skill format (`DECISIONS.md` "Skill format"); the seed scaffolding
  (`AGENTS.md` "Scaffolding Feedback"); upstream feedback via `skills/local/entropy-guard-feedback/SKILL.md`.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use the branch's
upstream (`git rev-parse --abbrev-ref @{upstream}`) and report "coverage incomplete". If neither exists, report
committed changes as not covered, and still inspect staged, unstaged and untracked work.
```bash
git log --oneline <start>..HEAD           # commits
git diff <start> HEAD                     # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
Check staged and unstaged separately: `git diff HEAD` nets them out, so a change staged and then undone in the working
tree shows nothing yet still lands.

## Intent
Does this change fit the authorised intent in `INTENT.md` and the decisions in `DECISIONS.md`? Does each skill it
touched still keep guards low-burden, delta-scoped and matched to the right enforcement depth, as `INTENT.md` requires?
If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for the steward in `DECISIONS.md` ("Proposed, awaiting the steward");
>    work that depends on it waits for the decision.
> 4. Do not edit `INTENT.md` or `AGENTS.md` "Project Constraints" to match the work unless the steward has recorded
>    that decision.
> 5. Correct a document directly only when a recorded decision of the steward's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

Unresolved, Q2 in `DECISIONS.md`: `AGENTS.md` "Consult INTENT.md for significant decisions" and `INTENT.md`'s header
still tell contributors to revise `INTENT.md` themselves. Until the steward answers, report any revision a session made
to `INTENT.md` as a finding.

## Checks
- If a skill's name, path, inputs, outputs or handoff changed: do the skills that hand to it or receive from it,
  README "What's here" and `AGENTS.md` "Key Files" still match, and is its `metadata` version bumped?
- For each state claim changed in `TODO.md`: do its other mentions (README "Project status", `INTENT.md` "Scope
  boundary and next validation loop") still agree? Is "Doing Now" cleared before the commit?
- For each concept this session defined or redefined: does it keep one canonical home (`INTENT.md` for principles,
  `AGENTS.md` for practice, `DECISIONS.md` for decisions, `TODO.md` for state, each skill for its own procedure)?
- Before restoring a deleted file, reviving an old concept or recreating a link target: does `DECISIONS.md` or
  `TODO.md` "Misleading nearby" record it as superseded, such as the domain generators or `explorations/` ideas?
- For each renamed, moved or deleted path or name: run the search below for the old name, and the link check.
- Did this session make a decision or validate a learning? Record it in `DECISIONS.md` or `LEARNINGS.md`, dated and
  saying who decided; an undecided one goes under "Proposed, awaiting the steward".
- Would an agent starting from `AGENTS.md` alone follow the workflow this session used? Do `AGENTS.md`, README
  "Contributing", `.githooks/pre-commit` and this guard agree on when it runs and what gets noted?
- Did an entropy-guard skill misfire or cause friction? Note it for `skills/local/entropy-guard-feedback/SKILL.md`.
```bash
git diff --check <start>                    # whitespace errors (.editorconfig trims trailing space)
grep -rn "<old name>" --include='*.md' .    # once per renamed, moved or deleted name
python3 -c 'import re,glob,os;[print(f,p) for f in glob.glob("**/*.md",recursive=True) for p in re.findall(r"\]\((?![a-z]+:)([^)#\s]+)",open(f).read()) if not os.path.exists(os.path.join(os.path.dirname(f),p))]'  # broken relative links; silent when clean
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For an exhaustive list or an "only" claim, check the full scope, including delegated behaviour. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.
- A gap too large for this session goes to `TODO.md` Next Up or Backlog, not into this session's scope.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a skill makes an
  untouched README row wrong. Problems that were already there, listed separately.
- Proposals for the steward; files updated; the next action, written into `TODO.md`.
- In the commit message, always: what the check changed, or "entropy check clean". Say so when the main issue was
  workflow or practice drift rather than a missing doc update.
