---
name: entropy-guard
description: Check this repository's coherence at the end of a work session, before handoff.
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
- Authorised intent: `INTENT.md`, `README.md` "Project status", `AGENTS.md` "Project Constraints", and the scope
  entries in `DECISIONS.md`. Steward: not yet named (open question in `TODO.md`).
- Current state and next steps: `TODO.md`. Read it first.
- Decisions: `DECISIONS.md`, newest first. Learnings: `LEARNINGS.md`.
- Rules owned elsewhere: the agentskills.io specification (`DECISIONS.md`, "Skill format"); seed, for scaffolding
  feedback (`AGENTS.md`); upstream issues, through `skills/local/entropy-guard-feedback/SKILL.md`. Whether a
  user-wide instructions file applies is open (`TODO.md`).

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use
`git merge-base HEAD @{upstream}` and report "coverage incomplete". If neither exists, report committed changes as not
covered, and still inspect staged, unstaged and untracked work.
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
Also list each issue this session filed through `skills/local/entropy-guard-feedback/SKILL.md`, with its URL and the
time you read it (`gh issue list --repo justinphilpott/entropy-guard --label agent-feedback`). The diff does not show
it.

## Intent
Does this change fit the authorised intent in `INTENT.md`, `README.md` "Project status", `AGENTS.md` "Project
Constraints" and the scope entries in `DECISIONS.md`? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for the steward (not yet named: see `TODO.md`) in `DECISIONS.md`; work
>    that depends on it waits for the decision.
> 4. Do not edit `INTENT.md`, `README.md` "Project status" or `AGENTS.md` "Project Constraints" to match the work
>    unless the steward has recorded that decision.
> 5. Correct a document directly only when a recorded decision of the steward's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

Open: whether the preamble of `INTENT.md`, which invites humans and agents to refine it, is already that recorded
decision (`TODO.md`).

## Checks
<!-- One line per justified check, each with a trigger and a named thing to check. -->
- If an exported skill in `skills/` changed its name, path, inputs, outputs or handoffs: do the skills it calls or is
  called by, `README.md` "What's here", `AGENTS.md` "Key Files" and `INTENT.md` "The guard lifecycle" still describe
  it?
- For each state claim changed in `TODO.md`: do its other mentions still agree, including `README.md` "Project status"?
- If a skill changed: does it still keep `INTENT.md` "What a guard should NOT be", and match each check it prescribes
  to the "Enforcement depth spectrum"?
- If this session chose between approaches, rejected one, or set a convention: is it in `DECISIONS.md`, with context,
  decision and impact?
- If something behaved unexpectedly, or applying a skill confirmed or refuted an assumption: is it in `LEARNINGS.md`,
  with the insight, what validated it and the implication?
- If this session worked differently from `AGENTS.md` "Working Practices", or changed them, `README.md`
  "Contributing", `.githooks/pre-commit` or this guard: would a fresh agent starting from `AGENTS.md` work as this
  session did?
- If a concept changed: does it still have one home among the files `TODO.md` lists to trust first, with the others
  summarising and linking?
- If a file, heading or skill was added, renamed, moved or deleted: are `AGENTS.md` "Key Files" and `README.md`
  "What's here" right, and does `git grep -n '<old name>'` find it only in `DECISIONS.md`, `LEARNINGS.md` and
  `explorations/`, which keep history?
- Before restoring a deleted file, reviving a concept or recreating a link target: does `DECISIONS.md` or `TODO.md`
  record it as superseded?
- If this session's work answers a placeholder or an empty section: is it filled in or removed?
- In `TODO.md`: is "Doing Now" cleared, finished work removed, and work this session surfaced in "Next Up" or
  "Backlog"?
```bash
git diff --check <start>   # whitespace, as .editorconfig requires
# each skill's front matter name matches its folder (DECISIONS.md, "Skill format")
for f in $(git ls-files --cached --others --exclude-standard 'skills/*SKILL.md'); do d=$(basename "$(dirname "$f")"); grep -q "^name: $d\$" "$f" || echo "name does not match folder: $f"; done
# inline relative markdown links resolve
git ls-files --cached --others --exclude-standard '*.md' | while read -r f; do grep -oE '\]\([^)#]+' "$f" | sed 's/^](//' | grep -v '://' | while read -r l; do [ -e "$(dirname "$f")/$l" ] || echo "broken link: $f -> $l"; done; done
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
- Proposals for the steward; files updated; the next action, written into `TODO.md`.
- In the commit message, a line saying what this check surfaced, or "entropy check clean" (`README.md`,
  "Contributing").
