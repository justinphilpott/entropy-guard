---
name: entropy-guard
description: Check the entropy-guard repository's coherence at the end of a meaningful work session, before commit or handoff. The project's own guard, and its reference example of generator output.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
  replaces: "local entropy-guard v0.2.3 (generated 2026-03-19, last evaluated 2026-04-07)"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. Skip it for trivial
changes such as typos or formatting, as AGENTS.md "Working Practices" allows. It is not a full documentation audit;
that is the `doc-health-check` item in TODO.md's Backlog.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
<!-- Pointers only. Never copy current direction, work status, next tasks or build ids into the guard; they belong in
the state file. Stable links to an issue or record that owns a policy are fine. -->
- Authorised intent: INTENT.md; README.md "Project status"; AGENTS.md "Project Constraints". Steward: Justin
  Philpott, owner of github.com/justinphilpott/entropy-guard (inferred from the repository's links; no document names
  the owner yet, see DECISIONS.md proposal P1).
- Current state and next steps: TODO.md, its "Current State" section. Read it first.
- Decisions: DECISIONS.md, newest first, with open proposals at the top.
- Rules owned elsewhere: the agentskills.io specification for `SKILL.md` files (DECISIONS.md "Skill format"). Any
  user-wide agent instructions your setup loads also bind you; none are kept in this repo.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use the upstream
branch (`git rev-parse --abbrev-ref @{upstream}`) and report "coverage incomplete". If neither exists, report
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
working tree shows nothing yet still lands. Add live changes the checks depend on (a deployed build, a grant), read
with the time. -->

## Intent
Does this change fit the authorised intent in INTENT.md, README.md "Project status" and AGENTS.md "Project
Constraints"? If not:

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

Provisional until DECISIONS.md proposal P1 is answered: INTENT.md's header invites humans and agents to refine it,
and AGENTS.md "Consult INTENT.md for significant decisions" says to update it; step 4 reads that more narrowly.

## Checks
<!-- One line per justified check, each with a trigger and a named thing to check. -->
- If a skill under `skills/` changed: do README.md "What's here" and "How to use", AGENTS.md "Key Files" and
  INTENT.md "The guard lifecycle" still describe it?
- For each state claim changed in TODO.md: do README.md "Project status" and INTENT.md "Scope boundary and next
  validation loop" still agree? Is "Doing Now" cleared, and "Current State" refreshed where this session changed it?
- If a skill's name, path, steps, inputs or outputs changed: do the skills that route to it or use its output
  (entropy-assessment, docs-first-planning-assessment, session-coherence-skill-generator, guards-integrator,
  skills/local/entropy-guard-feedback) still name them correctly?
- If a skill changed: does it still honour INTENT.md "What a guard should NOT be" and "Guiding principles":
  delta-scoped, low burden, each check at a fitting enforcement depth?
- If a concept changed: does it still have one owner (INTENT.md for principles and scope, DECISIONS.md for choices,
  each `SKILL.md` for its own steps, TODO.md for state), with other mentions reduced to links or correct summaries?
- If this session chose between approaches, rejected one or set a convention: is it in DECISIONS.md, and does the
  new entry name each older entry it supersedes, with a "Superseded" line added to that entry?
- If this session validated or disproved something in real use: is it in LEARNINGS.md with what validated it?
  Conceptual work goes to PHILOSOPHY.md, `explorations/` or the sibling `entropy-immune-system` repo instead.
- Before restoring a deleted file or section, reviving an idea from `explorations/` or an older DECISIONS.md entry,
  or recreating a link target: does DECISIONS.md record that it was superseded?
- If anything was renamed, moved or removed: search for the old name (`grep -rn '<old name>' --include='*.md' .`)
  and check README.md "What's here" and AGENTS.md "Quick Links" and "Key Files". In DECISIONS.md and LEARNINGS.md,
  leave the history as written.
- If AGENTS.md "Working Practices", README.md "Contributing", `.githooks/pre-commit` or this guard changed: do they
  still agree, and would a fresh agent starting from AGENTS.md do what this session did?
- If this session added or changed automation (a hook, a script, or a check a skill recommends): does it test a
  stable invariant, such as links, required files or frontmatter, rather than wording or paths still moving?
- If this session's work answers a placeholder (`[TBD]`, an empty section): fill it in or remove it.
- If this session filed GitHub issues through skills/local/entropy-guard-feedback: list them in the report, read
  back with `gh issue view <number> --repo justinphilpott/entropy-guard`, with the time.
```bash
# Relative markdown links that do not resolve. Prints nothing when clean.
grep -rnoE --include='*.md' '\]\([^)]+\)' . | grep -vE '\]\((https?:|mailto:|#)' |
  sed -E 's/^([^:]+):([0-9]+):.*\]\(([^)#]*).*$/\1 \2 \3/' |
  while read -r f l t; do [ -z "$t" ] || [ -e "$(dirname "$f")/$t" ] || echo "broken link: $f:$l -> $t"; done
# Skill frontmatter names that do not match their folder (agentskills.io). Prints nothing when clean.
for f in skills/*/SKILL.md skills/local/*/SKILL.md; do
  n=$(sed -n 's/^name: *//p' "$f" | head -n 1); d=$(basename "$(dirname "$f")")
  [ "$n" = "$d" ] || echo "name mismatch: $f has name '$n'"
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
- Proposals for Justin Philpott; files updated; the next action, written into TODO.md.
- The outcome goes in the commit message, as README.md "Contributing" asks ("entropy check clean" if nothing
  changed); say so when the main problem was workflow drift rather than a missing doc update.
