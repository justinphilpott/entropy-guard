---
name: entropy-guard
description: Check the entropy-guard repository's coherence at the end of a meaningful work session, before commit or handoff. The project's own guard, and a reference example of a generated guard.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before commit or handoff. Check only this session's change. Skip it for
typo or formatting-only changes, and run it once per logical piece of work. It is not a full audit; that is the
planned `doc-health-check` (TODO.md, Backlog). One combined guard, per DECISIONS.md "Keep a single local guard".

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: INTENT.md; README.md "Project status"; AGENTS.md "Project Constraints". Steward: Justin
  Philpott, inferred from his dated directions in `explorations/2026-03-24-entropy-immune-system-conversation.md`
  (lines 86, 713) and the GitHub owner; no file in the repo names the steward yet.
- Current state and next steps: TODO.md. Read its "Current state" first.
- Decisions: DECISIONS.md. Open questions for Justin: its "Proposed, awaiting Justin" section.
- Learnings: LEARNINGS.md. Historical material: `explorations/`.
- Rules owned elsewhere: the agentskills.io specification (DECISIONS.md "Skill format"); seed scaffolding feedback
  (AGENTS.md "Scaffolding Feedback"); upstream issues via `skills/local/entropy-guard-feedback/SKILL.md`.

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
Check staged and unstaged separately: `git diff HEAD` nets them out. If this session ran `gh issue create`, the issue
is a live change: put its URL in the report.

## Intent
Does this change fit the authorised intent in INTENT.md, README.md "Project status" and AGENTS.md "Project
Constraints"? If a skill file changed, does it still keep INTENT.md's guard principles: low burden, delta scope,
enforcement depth matched to the vector, and inter-domain drift? If not:

**In force until Justin answers Q1** (DECISIONS.md, "Proposed, awaiting Justin"), the repo's current text: update the
skill, or if INTENT.md itself needs revision, update it with a dated note explaining what prompted the change. List any
such revision under "Proposals for Justin" in the report.

**Provisional, takes force only when Justin records Q1 as recommended:**

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
- If `.githooks/pre-commit` changed: do README.md ("Adapt the project's own guard", "Project operations",
  "Contributing") and AGENTS.md ("Working Practices", "Key Files") still describe what it does?
- For each state claim changed in TODO.md: do its other mentions still agree (README.md "Project status", INTENT.md
  "Scope boundary")? Is "Doing Now" cleared, and is new work in "Next Up" or "Backlog"?
- If you chose between approaches, decided against something, found a constraint or set a convention: is it in
  DECISIONS.md as context, decision and impact, with its date and who decided?
- If you found a gotcha, or tested an assumption or an INTENT.md concept on a real case: is it in LEARNINGS.md as
  insight, what validated it, and implication?
- If a skill's purpose, inputs, outputs or handoffs changed: do README.md "What's here", AGENTS.md "Key Files" and
  any skill that hands to it still summarise it correctly? The skill's own SKILL.md owns it.
- If guard-writing rules changed (`skills/docs-first-planning-assessment/SKILL.md` Steps 6-8, or
  `skills/session-coherence-skill-generator/SKILL.md`'s requirements and template): report any new divergence
  between them. Which one owns guard writing is Q2; do not resolve it here.
- If a file or folder was added, removed or renamed: are README.md "What's here" and AGENTS.md "Quick Links" and
  "Key Files" still right? Run `rg -n '<old name>'` for each old name, and the link check below.
- Before restoring a deleted file or section, reviving an old concept (the domain generators, a Phase 2 inside
  entropy-assessment, guards that never persist, entropic-immunity theory) or recreating a link target: do
  DECISIONS.md or TODO.md "Current state" record it as superseded?
- If contributor workflow changed (AGENTS.md "Working Practices", README.md "Contributing", TODO.md usage, upstream
  feedback, or this guard): would a fresh agent starting from AGENTS.md alone do what this session did?
- If this work answers a `[TBD]`, `[Add X here]` or empty section: fill it or remove it.
- If you added automation: does it check a stable invariant (links, required files, frontmatter names) rather than
  wording or paths still moving?
```bash
# Relative markdown links that point at nothing
rg -n -o '\]\(([^)#]+)' -r '$1' --glob '*.md' . | grep -v '://' |
  while IFS=: read -r f l t; do [ -e "$(dirname "$f")/$t" ] || echo "BROKEN $f:$l -> $t"; done
# Skill frontmatter name matches its folder (agentskills.io, DECISIONS.md "Skill format")
for f in $(find skills -name SKILL.md); do n=$(sed -n 's/^name: *//p' "$f" | head -1)
  [ "$n" = "$(basename "$(dirname "$f")")" ] || echo "NAME MISMATCH $f: $n"; done
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For a claim about everything of a kind, such as what the system reaches or launches, search the code rather than
  trusting a document and a test that agree, and record the search. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.
- A gap too large for this change goes to TODO.md "Next Up" or "Backlog", not into this commit.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin; files updated; the next action, written into TODO.md.
- Put a one-line result in the commit message, or "entropy check clean" (README.md "Contributing"). Say so when the
  main issue was workflow or practice drift rather than a missing doc update.
