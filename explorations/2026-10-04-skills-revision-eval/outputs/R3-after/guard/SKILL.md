---
name: entropy-guard
description: Check the agentic-architecture repository's coherence at the end of a work session, before commit or handoff. The repository is a reference-only record, so the main check is that a change does not treat it as live design.
metadata:
  generated: "2026-10-04"
  source: "entropy-guard session-coherence-skill-generator v0.3.0"
  replaces: "skills/entropy-guard.md generated 2026-04-02 by entropy-assessment v0.5.2 (updated in place, same path)"
  provisional: "Built on recommended answers to three questions Justin has not yet answered. They are listed in the status section of ROADMAP.md. Re-generate when he answers."
---

# Skill: agentic-architecture Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

This repository is a reference record, not current architecture authority. Most sessions here
should change nothing. This guard's main job is to catch a change that treats the record as live
design.

## When to use

- Before committing any change to this repository, however small. Every commit to a reference
  record is an exception, so none is too trivial to check.
- At the end of a session that consulted this repository for work elsewhere, if it edited anything
  here.

## When not to use

- A session that changed nothing here: no commits, and `git status --short` prints nothing.
- To review architecture content. The architecture here is frozen; review it in the repository that
  now owns it.

## Where things live

Read these; do not copy them into this guard.

- **Authorised intent:** the status banners at the top of `README.md` and `AGENTS.md`, and the
  status entry in `DECISIONS.md`. Steward: Justin. Until Justin records that entry, it is marked
  "PROPOSED" and the banners are the only statement of status.
- **Current state and next steps:** the "Status — read this first" section at the top of
  `ROADMAP.md`. Read it first.
- **Decisions:** root `DECISIONS.md`. Component-local decisions are in
  `components/{scope,agent,orchestrator}/DECISIONS.md`.
- **Where each concept lives now:** the `README.md` banner, and the `implementation:` and `repo:`
  keys in `components.yaml`.
- **Rules owned elsewhere:** none found in this repository.

## What changed this session

```bash
git log --oneline @{upstream}..HEAD        # commits this session, not yet pushed
git status --short                         # staged, unstaged and untracked, at a glance
git diff HEAD                              # all uncommitted changes to tracked files
git ls-files --others --exclude-standard   # untracked files: read each in full
```

If the commit the session started from is known, use `git log --oneline <start>..HEAD` instead. If
the branch has no upstream, compare against `main` and report "coverage incomplete: compared
against main".

## Modes

- Plan/suggest-only: inspect and report; do not edit.
- Build/just-do-it: inspect and make coherence fixes.
- Discuss-first: propose changes before editing.
- Audit-only: report risks only.

## Intent

- Is each changed file one of the changes the status permits? Under the proposed status these are:
  - a correction that makes the record accurate, citing the `DECISIONS.md` entry that settles it;
  - a pointer to the repository that now owns a concept;
  - a move into `archive/`.
- Anything else is architecture work. That includes a new or revised `DECISIONS.md` entry, a new
  snapshot under `architecture/snapshots/`, a ticked `ROADMAP.md` box, a `components.yaml` status
  change, a new run under `runs/`, and a new role or template. It belongs in `../personal-agent` or
  `../../scope`, unless Justin has recorded authorisation for it in `DECISIONS.md`.
- When this session's work and the authorised intent disagree:
  1. Decide which it is: a defect in the work, an adaptation within what was authorised, or a
     decision nobody has made.
  2. Fix a defect in the work.
  3. Record an adaptation or an unmade decision as a proposal for Justin in `DECISIONS.md`.
  4. Do not edit the `README.md` and `AGENTS.md` banners, the "Settled" list in `AGENTS.md`,
     `NORTH_STAR.md`, or the status entry in `DECISIONS.md` to match the work, unless Justin has
     recorded that decision.
  5. Correct a document directly only when a recorded decision of Justin's already settles it, and
     cite that decision.

## Judgment checks

- **Status coherence.** The `README.md` banner, the `AGENTS.md` banner, the `ROADMAP.md` status
  section and the `DECISIONS.md` status entry all say the same thing. If one changed, the others
  still agree.
- **Session-start alignment.** `AGENTS.md` "Session start" and `skills/session-kickoff.md` still send
  a fresh agent to the status first, not to "what's being worked towards".
- **One owner, not two copies.** If the change touches a concept that now lives elsewhere, this
  repository keeps at most a pointer to it. Do not bring both copies up to date as peers:
  - the Scope model, `components/scope/`, is owned by `../../scope`;
  - Personal Agent architecture (`MODEL.md`, `RUNTIME.md`, `architecture/`,
    `components/orchestrator/`, `components/agent/`) is owned by `../personal-agent`;
  - the temporal coordinator contract (`components/temporal-coordinator/SPEC.md`, `SCHEDULING.md`)
    is owned by `../temporal-coordinator` (provisional);
  - `roles/` holds reference copies only; the live professional-presence role is in the
    `scope-professional-presence` repository.
- **Supersession.** Before restoring, reviving, or fixing a reference by recreating its target,
  check `DECISIONS.md` for a superseded marker. Known cases: `architecture/PICKUP.md`;
  `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md` (EventSink, T09 HTTP push); a
  `workflows.yaml` index; a root scope named `root`; the `scope-template` repository; the scope
  manager as one "unified gateway".
- **Cross-reference integrity.** Changed paths, headings and links still resolve. Links to sibling
  repositories use the `README.md` form (`../../scope`, `../personal-agent`, `../agentic-learning`).
- **Decision capture.** A decision made this session goes into `DECISIONS.md`, dated and attributed
  to Justin, or marked proposed. It does not go into a `RUN.md`, an analysis document such as
  `AUTH_OPTIONS_ANALYSIS.md`, or a component `TODO.md`.
- **State honesty.** The `ROADMAP.md` status section still matches what is true, and its "last
  checked" date is updated whenever it is re-checked.

## Mechanical checks

```bash
# The status banner is still in both entry files: expect one line from each.
grep -n "Reference-only" README.md AGENTS.md

# Markdown files this session changed or added, committed or not, for the link check.
# Use the same baseline as above: @{upstream}, <start>, or main.
{ git diff --name-only @{upstream}; git ls-files --others --exclude-standard; } | grep '\.md$' | sort -u

# Offline link check of those files: local paths only, no network.
lychee --offline --no-progress <the files listed above>
```

No CI job or hook runs anything in this repository. lychee was not installed where this guard was
drafted (2026-10-04); until it is, open each changed link by hand.

## Report

- Baseline compared against, and whether coverage was complete
- Each changed file, and which permitted kind of change it is, or that it is none of them
- What was checked, and what was not
- Findings caused by this session; problems that were already there, listed separately
- Proposals for Justin, as recorded in `DECISIONS.md`
- Files updated, such as the `ROADMAP.md` status section and `DECISIONS.md`
- First next action for the next session, written into the `ROADMAP.md` status section, not here

## Safety

- Do not commit or push unless asked.
- Do not read or print secrets. The run records under `runs/` name API-key environment variables;
  never echo their values.
- Do not modify changes unrelated to this session.
- `CLAUDE.md` is a symlink to `AGENTS.md`: edit `AGENTS.md`. Do not add workflow logic under
  vendor-specific folders such as `.claude/`.
