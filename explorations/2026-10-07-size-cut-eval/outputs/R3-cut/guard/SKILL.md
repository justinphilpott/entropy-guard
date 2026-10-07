---
name: entropy-guard
description: Check this reference-only repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.4.0"
---

# Skill: agentic-architecture Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

## Where things live
- Authorised intent: the status banners in `README.md` and `AGENTS.md` (reference-only), recorded in `DECISIONS.md`,
  "agentic-architecture is reference-only"; `NORTH_STAR.md` for the purpose the blueprint served. Steward: the
  repository owner (`justin` in this repository's scope manifests).
- Current state and next steps: the Status block at the top of `ROADMAP.md`. Read it first.
- Decisions: `DECISIONS.md`, as historical authority; component `DECISIONS.md` files hold local detail only.
- Rules owned elsewhere: current architecture in `../personal-agent` and `../../scope`; any user-wide agent
  instructions that apply to this machine's repositories.

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
Does this change fit the authorised intent in the `README.md` and `AGENTS.md` status banners? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for the repository owner in `DECISIONS.md`; work that depends on it
>    waits for the decision.
> 4. Do not edit the status banners in `README.md` and `AGENTS.md`, or `NORTH_STAR.md`, to match the work unless
>    the repository owner has recorded that decision.
> 5. Correct a document directly only when a recorded decision of the repository owner's already settles it, and
>    cite that decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`.)

## Checks
- If the change adds or alters a statement of current direction, status, open work or next steps (`ROADMAP.md`,
  `components.yaml`, a component `TODO.md` or `PLAN.md`, a `RUN.md`, `architecture/`, a skill): does it present this
  repository as current authority or as holding live work? That needs a recorded decision of the repository owner
  in `DECISIONS.md`; otherwise take the work to `../personal-agent` or `../../scope`, or record a proposal.
- If `README.md`, `AGENTS.md`, the `ROADMAP.md` Status block or the reference-only entry in `DECISIONS.md` changed:
  do all four still state the same status and the same successor repositories?
- If a document was marked superseded, historical or reference-only: does the marker name what replaces it, and do
  the files that link to it (`README.md` Navigation, `AGENTS.md` Key files, `architecture/INDEX.md`,
  `skills/README.md`) say the same?
- If a changed file says a question is open or a decision is pending: does `DECISIONS.md` already settle it? Cite
  that entry. Add no new architectural open questions here.
- If the session produced a decision or a learning, such as a run result or an analysis conclusion: is it a dated
  entry in `DECISIONS.md`, or named in the report as belonging to a successor repository? Never leave it only in a
  run record or analysis note.
- If a changed file links to a sibling repository (`../`, `../../`): does the path match `DECISIONS.md`, "Local
  directory structure", and the other files that link to the same repository?
- When two documents describe one thing, decide which owns it and reduce the other to a link. Keep summaries and
  independent tests of the same contract.
- For each state claim changed in the `ROADMAP.md` Status block: do its other mentions still agree?
```bash
if command -v lychee >/dev/null; then
  git diff --name-only "$START" HEAD -- '*.md' | xargs -r lychee --offline --no-progress
else
  echo "lychee not installed: links not checked"
fi
```

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for the repository owner; files updated; the next action, written into the `ROADMAP.md` Status block.
