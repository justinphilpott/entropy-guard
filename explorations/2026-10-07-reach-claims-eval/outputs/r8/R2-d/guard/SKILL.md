---
name: entropy-guard
description: Check the entropy-guard repository's coherence at the end of a meaningful work session, before commit or handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
  replaces: "local entropy-guard v0.2.3 (generated 2026-03-19, last evaluated 2026-04-07)"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: `INTENT.md`, `README.md` "Project status", `AGENTS.md` "Project Constraints". Steward: Justin
  Philpott, unresolved: inferred from the GitHub owner, not recorded in the repo (TODO.md, Q2).
- Current state and next steps: `TODO.md`. Read it first.
- Decisions: `DECISIONS.md`.
- Rules owned elsewhere: the agentskills.io skill format (DECISIONS.md, "Skill format");
  `skills/local/entropy-guard-feedback/SKILL.md` for upstream issues.
- Live state a session can change: GitHub Issues on justinphilpott/entropy-guard, through that helper. When it may
  be used from other projects is open (TODO.md, Q5).

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use `@{upstream}`
and report "coverage incomplete". If neither exists, report committed changes as not covered, and still inspect staged,
unstaged and untracked work.
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
Does this change fit the authorised intent listed above? If not:

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

(Intent-change rule v2, from entropy-guard.)

Open until the steward answers TODO.md Q1: `AGENTS.md` "Consult INTENT.md for significant decisions" and the
`INTENT.md` preamble still tell contributors to update `INTENT.md` themselves. Report any session that did so.

## Checks
- If a skill under `skills/` changed its name, path, inputs, outputs or handoffs: do `README.md` "What's here" (the
  catalogue), the `AGENTS.md` "Key Files" summary, `INTENT.md` "The guard lifecycle" and every skill naming it agree?
- For each state claim changed in `TODO.md`: do its other mentions, in `README.md` "Project status" and `INTENT.md`
  "Scope boundary and next validation loop", still agree? Is "Doing Now" cleared before the commit?
- If a skill was added, removed or rerouted: does some skill hand work to it, does `skills/entropy-assessment/SKILL.md`
  route to it where it should, and does this guard still cover it? If not, rerun the assessment on this repo.
- If this session made a choice or found a gotcha: is it in `DECISIONS.md`, dated and attributed, or in `LEARNINGS.md`?
  Conceptual work from conversations stays out of `LEARNINGS.md` (DECISIONS.md, "LEARNINGS.md stays tactical").
- Before restoring a deleted file, reviving an old concept or recreating a reference target: do `DECISIONS.md` or
  `TODO.md` "Misleading nearby" record it as superseded? Theory belongs in the sibling `entropy-immune-system` repo.
- If how contributors work changed (guard trigger, TODO discipline, hook, feedback path): would a fresh agent following
  `AGENTS.md` "Working Practices" alone do what this session did? Do `README.md` "Contributing" and
  `.githooks/pre-commit` agree with it?
- If this session ran `skills/local/entropy-guard-feedback/SKILL.md`: report the issue URL it created, or the note it
  left for filing by hand.
- If a path, name or heading changed: search for the old one with `grep -rn '<old>' .`, then run the reference checks.
```bash
git diff --check <start>   # whitespace errors in this session's changes
bash <<'EOF'   # reference checks, from the repo root. Judge each line: a skill's output paths and globs may be absent
grep -rnoE '\]\([^)]+\)' --include='*.md' . | while IFS= read -r m; do
  f=${m%%:*}; l=${m#*](}; l=${l%)}; l=${l%%#*}
  case "$l" in *://*|mailto:*|*\$*|'') continue;; esac
  [ -e "$(dirname "$f")/$l" ] || echo "MISSING link $m"; done
grep -rnoE '`(skills|explorations|\.githooks)/[^` ]*`' --include='*.md' . | while IFS= read -r m; do
  p=${m#*\`}; p=${p%\`}; p=${p%%:[0-9]*}; [ -e "$p" ] || echo "MISSING path $m"; done
for f in skills/*/SKILL.md skills/local/*/SKILL.md; do   # agentskills.io: name matches the folder
  n=$(sed -n 's/^name: *//p' "$f" | head -1)
  [ "$n" = "$(basename "$(dirname "$f")")" ] || echo "MISMATCH $f: name '$n'"; done
EOF
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
- Put the result in the commit message, "entropy check clean" when nothing needed changing (`README.md`
  "Contributing"). A gap too large for this change goes to `TODO.md` "Next Up" or "Backlog".
