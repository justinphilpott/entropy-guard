---
name: entropy-guard
description: Session-end coherence guard for the entropy-guard project itself. Run after a meaningful work session, before commit or handoff. Checks only this session's change - intent fit, decision and learning capture, skill contracts, parallel truth, workflow, structure, superseded material and state.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0; refines skills/local/entropy-guard/SKILL.md v0.2.3 in place"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before commit or handoff. Check only this session's change. Skip it for
typo or formatting-only changes. A gap too large for this change goes to `TODO.md` "Next Up", not into this commit.

## Where things live

- Authorised intent: `INTENT.md`, `README.md` "Project status", `AGENTS.md` "Project Constraints", and the decisions in
  `DECISIONS.md`. Steward: Justin Philpott.
- Current state and next steps: `TODO.md`. Read it first.
- Decisions and proposals awaiting the steward: `DECISIONS.md`.
- Learnings: `LEARNINGS.md`, validated and tactical only.
- Product: the skills in `skills/` (exported) and `skills/local/` (this repo's own). Their names, paths, inputs and
  handoffs are contracts.
- Historical: `explorations/`, the seed material of the sibling repo `entropy-immune-system`.
- Rules owned elsewhere: the agentskills.io skill format (`DECISIONS.md`, "Skill format"); seed scaffolding feedback
  (`AGENTS.md`, "Scaffolding Feedback").

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

Does this change fit the authorised intent above? If not:

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

(Intent-change rule v2, from entropy-guard.) Pending the steward's answer to the `DECISIONS.md` proposal "Intent
changes are proposed before INTENT.md is edited".

## Checks

1. **Decisions.** If this session chose between approaches, decided against one, or set a convention: is there a
   `DECISIONS.md` entry with context, decision, impact, its date and who decided? If it supersedes an entry, is the
   older entry marked?
2. **Learnings.** If something non-obvious was validated or invalidated: is it in `LEARNINGS.md` with what validated
   it? Opinion goes to `PHILOSOPHY.md`, theory to `entropy-immune-system`.
3. **Skill contracts.** If a `skills/**/SKILL.md` changed its name, path, inputs, outputs or handoff: do the skills
   handing to or from it (`grep -rn "<skill-name>" skills/`), `README.md` "What's here" and `AGENTS.md` "Key Files"
   still match? If a skill was added or removed, add "re-evaluate the local guard" to `TODO.md` "Next Up".
4. **Skill and intent fit.** If a skill changed: does it still keep `INTENT.md`'s guard principles (delta-scoped, low
   burden, enforcement depth, inter-domain drift)? Fix the skill; if `INTENT.md` looks wrong, apply the Intent rule.
5. **One owner per truth.** When the change touches something two documents describe (the validation loop, skill
   roles), decide which owns it and reduce the other to a link. Keep summaries and independent tests of the same
   contract.
6. **Workflow.** If how contributors work changed: would a fresh agent starting from `AGENTS.md` do what this session
   did, and does `.githooks/pre-commit` still agree? Hooks and scripts check only stable invariants such as links,
   never wording.
7. **Structure and references.** If a file was added, removed or renamed: search for the old name across the repo,
   run the link check below, and update `AGENTS.md` "Key Files" and `README.md` "What's here".
8. **Superseded material.** Before recreating a missing file or reviving a concept to fix a reference: was it
   superseded in `DECISIONS.md`, or does it come from `explorations/`, `PHILOSOPHY.md` or a theory entry in
   `LEARNINGS.md`? Then it is not current truth.
9. **State.** Is `TODO.md` "Doing Now" cleared and are finished items gone? For each state claim you changed, do its
   other mentions agree? Are new proposals for the steward listed under its open questions? Fill or remove any
   placeholder this session's work now answers.

```bash
git diff --check
for f in $(git ls-files '*.md'); do grep -oE '\]\([^)#: ]+[)#]' "$f" | sed 's/^](//; s/[)#]$//' |
  while read -r l; do [ -e "$(dirname "$f")/$l" ] || echo "broken link: $f -> $l"; done; done
```

## Report

- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a skill makes
  an untouched `README.md` table wrong. Problems that were already there, listed separately.
- Proposals for Justin Philpott, recorded in `DECISIONS.md`; files updated; the next action, written into `TODO.md`.
- In the commit message: what the guard changed, or "entropy check clean"; name workflow drift as such.
