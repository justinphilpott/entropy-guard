---
name: entropy-guard
description: Before committing any change to the reference-only agentic-architecture repository, check that the change keeps the repository honest about its status and adds no new design.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.3.0"
  refines: "skills/entropy-guard.md, generated 2026-04-02 by entropy-assessment v0.5.2, last evaluated 2026-04-27"
  place_at: "skills/entropy-guard.md, updated in place; AGENTS.md, README.md and skills/README.md already link to that path"
---

# Skill: agentic-architecture Entropy Guard

This repository is reference-only. Architecture work now happens in `../personal-agent` and `../../scope`. This
guard runs before every commit here and checks one thing above all: that the commit corrects or labels the record,
and does not grow the design.

## When to use

- Before committing any change to this repository, including a one-line status edit.
- When a session working in another repository is about to change a file here.

## When not to use

- When only reading this repository for reference. Reading needs the Status block at the top of `ROADMAP.md`, not
  this guard.
- As a substitute for a guard in `../personal-agent` or `../../scope`. Design work, and its checks, belong there.

## Where things live

Read these; do not copy them into this guard.

- **Authorised intent:** the status banners at the top of `README.md` and `AGENTS.md`, recorded in `DECISIONS.md`
  under "This repository is reference-only". `NORTH_STAR.md` is the vision as it stood while the repository was
  current. Steward: Justin, the repository owner. No document names who decides this repository's intent; the
  owner is inferred from the `justinphilpott/agentic-architecture` link in `components/orchestrator/scope/README.md`.
- **Current state, pending questions, and historical material easy to mistake for current:** the Status block at
  the top of `ROADMAP.md`. Read it first.
- **Decisions:** `DECISIONS.md` at the root. The `DECISIONS.md` files under `components/` are historical local detail.
- **Owned elsewhere:** current architecture authority, in `../personal-agent` (Personal Agent architecture) and
  `../../scope` (Scope and Project model). Link to them; never restate them here.

## What changed this session

```bash
git status --short                          # staged, unstaged and untracked, at a glance
git diff --cached                           # staged: what the next commit will contain
git diff                                    # unstaged changes
git ls-files --others --exclude-standard    # untracked files; read the ones that matter
git log --oneline @{upstream}..HEAD         # commits not yet pushed
git diff @{upstream} HEAD                   # what those commits changed
```

If the branch has no upstream, compare against `origin/main` and report "coverage incomplete: compared against
`origin/main`". Check staged and unstaged changes separately; `git diff HEAD` alone nets them out.

## Modes

- Plan/suggest-only: inspect and report; do not edit.
- Build/just-do-it: inspect and make the coherence fixes below.
- Discuss-first: propose changes before editing.
- Audit-only: report risks only.

## Intent

- Is every change in this session one of these: a correction of the record from a dated decision, a historical
  label, a status update, or a link to where the work now lives? Anything else is new design: a new or reopened
  decision, an open question, a roadmap or TODO item, a component status change, a change to a template, role or
  schema, a new architecture snapshot. Stop, and take that work to `../personal-agent` or `../../scope`, unless
  `DECISIONS.md` records Justin's authorisation for it here.
- When this session's work and the authorised intent disagree:
  1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
     intent nobody has decided.
  2. Fix a defect in the work.
  3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
     undecided change of intent as a proposal for Justin in `DECISIONS.md`; work that depends on it waits for the
     decision.
  4. Do not edit the status banners in `README.md` and `AGENTS.md`, the reference-only entry in `DECISIONS.md`, or
     `NORTH_STAR.md` to match the work unless Justin has recorded that decision.
  5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
     decision.
  6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
     the code shows what is checked or built; it does not authorise weakening a documented constraint.

  (Intent-change rule v2, from entropy-guard `skills/entropy-assessment/intent-pass.md`.)

## Judgment checks

- **Status agrees everywhere it is stated.** If this session touched the banner in `README.md` or `AGENTS.md`, the
  reference-only entry in `DECISIONS.md`, or the Status block in `ROADMAP.md`: do all four still agree on the status
  and on where current authority lives? The `DECISIONS.md` entry owns the status; the other three carry a short
  form and a link to it.
- **Labels stay on.** If this session edited a file that the Status block lists as historical: is its historical
  label still in place, and does the edit only correct or label?
- **Nothing revived.** Before restoring a deleted file, reviving a superseded concept, or fixing a broken link by
  recreating its target, check the supersession markers in `DECISIONS.md`, `architecture/INDEX.md` and the Status
  block. Superseded material stays superseded.
- **Corrections cite their decision.** A stale sentence is corrected only from a dated `DECISIONS.md` entry, and the
  edit names that entry. A sentence that no recorded decision settles is left as it is and listed in the report.
- **One owner, not two copies.** When a change touches something two documents both describe, decide which owns it
  and reduce the other to a link. Keep summaries; they are not redundant copies.
- **Templates are copied, not read.** If this session touched `components/scope/template/` or
  `components/agent/template/`: everything in those folders is copied into new scope and role repositories, so a
  status note placed inside them spreads to every copy. Check the Status block for whether anything still copies
  them before editing.
- **Links to the moved work still resolve.** If this session changed a path or a link: do `../personal-agent`,
  `../../scope` and every changed link still point at something that exists on this machine?
- **The Status block stays honest.** For each claim this session changed in the Status block: do its other mentions
  in the block agree, and does it carry its source and the date it was checked? Citing a source does not refresh a
  value that was not re-read.

## Mechanical checks

```bash
git diff --check; git diff --cached --check            # whitespace errors in this session's change
grep -c "Reference-only" README.md AGENTS.md           # both status banners present: each count at least 1
git diff --cached -U0 -- DECISIONS.md | grep '^+### '  # any new decision heading needs Justin's authorisation (see Intent)
lychee --offline --no-progress './**/*.md'             # local links resolve; only if lychee is installed
```

Links into `../personal-agent`, `../../scope` and other sibling repositories resolve only on a machine with those
checkouts.

## Report

- Baseline compared against, and whether coverage was complete
- What was checked, and what was not
- Findings caused by this session, judged by the relationship changed, not the file edited; problems that were
  already there, listed separately
- Proposals for Justin, recorded in `DECISIONS.md`
- Files updated, such as the Status block in `ROADMAP.md` and `DECISIONS.md`
- First next action for the next session, written into the Status block in `ROADMAP.md`, not here

## Safety

- Do not commit or push unless asked.
- Do not read or print secrets.
- Do not modify unrelated changes.
- Do not add vendor-specific workflow logic. `CLAUDE.md` stays a symlink to `AGENTS.md`.
