---
name: entropy-guard
description: Check this repository's coherence at the end of a work session, before handoff. Run before committing after meaningful work.
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
- Authorised intent: `INTENT.md`, README.md "Project status", AGENTS.md "Project Constraints", and the decisions in
  `DECISIONS.md`. Steward: Justin Philpott (inferred from the repository owner; no file names a steward).
- Current state and next steps: `TODO.md`. Read it first; its "Current state" holds the open steward questions.
- Decisions: `DECISIONS.md`.
- Rules owned elsewhere: the agentskills.io specification (https://agentskills.io/specification), adopted in
  DECISIONS.md "Skill format". Any user-wide instruction file: unresolved.
- When this guard runs and when it may be skipped: AGENTS.md "Working Practices".

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use the branch's
upstream (`@{upstream}`) and report "coverage incomplete". If neither exists, report committed changes as not covered,
and still inspect staged, unstaged and untracked work.
```bash
git log --oneline <start>..HEAD           # commits
git diff <start> HEAD                     # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```

## Intent
Does this change fit the authorised intent in INTENT.md, README.md "Project status", AGENTS.md "Project Constraints"
and DECISIONS.md? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin Philpott in `DECISIONS.md`; work that depends on it waits
>    for the decision.
> 4. Do not edit `INTENT.md`, README.md "Project status" or AGENTS.md "Project Constraints" to match the work unless
>    Justin Philpott has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin Philpott's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`.)

Open: question Q1 in TODO.md asks whether INTENT.md's preface, which invites contributors to revise it, is the
recorded decision step 4 refers to. Until it is answered, report any INTENT.md edit as a proposal.

## Checks
- If a skill under `skills/` changed its name, path, inputs, outputs or handoff: do the skills that name it, README.md
  "What's here" and AGENTS.md "Key Files" still describe it? Search for its name.
- For each state claim changed in `TODO.md`: do its other mentions (README.md "Project status", INTENT.md "Scope
  boundary and next validation loop") still agree? Is "Doing Now" cleared, and no finished item still open?
- If a skill under `skills/` changed: does it still meet INTENT.md "What a guard should NOT be" and "Enforcement depth
  spectrum", and does every DECISIONS.md requirement it carried survive?
- If this session chose between approaches, rejected one or set a convention: is it in DECISIONS.md, dated and naming
  who decided, and does any entry it replaces now say "Superseded"?
- If this session found a gotcha or validated a pattern in real use: is it in LEARNINGS.md with what validated it?
  Conceptual work goes to PHILOSOPHY.md or `../entropy-immune-system` (DECISIONS.md "LEARNINGS.md stays tactical",
  "Farm broader entropic-immunity exploration"), not LEARNINGS.md.
- If a concept's text changed: does it still have one canonical home, with other mentions only links or summaries?
- Before restoring a deleted file or section, reviving a retired concept (domain generators, domain appendices,
  `entropy-guard-generator`, entropy-assessment's old Phases and Steps) or recreating a link target: does DECISIONS.md
  or TODO.md record its supersession? Is `explorations/` material being treated as current guidance?
- If a file, skill, section or heading was added, renamed, moved or deleted: search for the old name in `*.md` and
  `.githooks/pre-commit`, check AGENTS.md "Key Files" and README.md "What's here", and run the commands below.
- If how contributors work changed (guard timing, TODO.md discipline, the hook, feedback capture): do AGENTS.md
  "Working Practices", README.md "Contributing", `.githooks/pre-commit` and this guard still agree? Would a fresh agent
  starting from AGENTS.md do what this session did?
- If this session proposes a script or hook check: does it test only a stable invariant, such as links resolving or a
  skill's `name` matching its folder? Keep wording- and path-dependent checks here.
- If this session wrote outside this repository (an issue on justinphilpott/entropy-guard through
  `skills/local/entropy-guard-feedback/`, the seed project, `../entropy-immune-system`, or anywhere else): report
  each write and where it went.
```bash
git diff --check <start>
# relative markdown links that do not resolve
grep -rnoE --include='*.md' '\]\([^)#]+' . | while IFS=: read -r f l m; do p=${m#*'('}
  case $p in http*|mailto:*) continue;; esac; [ -e "$(dirname "$f")/$p" ] || echo "$f:$l: missing $p"; done
# a skill's name must match its folder (DECISIONS.md "Skill format")
for f in $(find skills -name SKILL.md); do d=$(basename "$(dirname "$f")")
  n=$(sed -n 's/^name: *//p' "$f" | head -1); [ "$d" = "$n" ] || echo "name mismatch: $f ($n)"; done
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
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin Philpott; files updated; the next action, written into `TODO.md`.
- A one-line result for the commit message, or "entropy check clean" (README.md "Contributing").
