---
name: session-coherence-skill-generator
description: The guard builder for entropy-guard. Generate or update a repository's session-end coherence guard from an assessment's findings, or bootstrap the smallest context-preservation structure for a young repo that is starting to need handoff memory.
metadata:
  version: "0.4.0"
---

# Skill: Session Coherence Skill Generator

The only skill in entropy-guard that writes guards. It builds or updates the guard an agent or person runs at the end
of a work session, so the repo is left coherent, honest about its state, and easy to pick up.

- **Inputs** come from an assessment: `skills/entropy-assessment/SKILL.md` or
  `skills/docs-first-planning-assessment/SKILL.md`. If there was none, run `entropy-assessment` in assessment-only
  mode first rather than discovering the repo again here.
- **A young repo** with no stable memory yet: follow [`bootstrap.md`](bootstrap.md) instead, and build no guard.
- **Afterwards**, hand the guard to `skills/guards-integrator/SKILL.md`, which places it and checks it is adopted.

## Modes

Use the mode asked for; when the runtime mode and the wording differ, the stricter wins.

- **Plan or suggest-only:** draft the guard and report; edit nothing.
- **Build:** write or update the guard and any directly implied doc updates.
- **Discuss-first:** propose the guard's shape before writing. The default for cross-repo or policy changes.
- **Audit-only:** report existing structures and risks; build nothing unless asked.

## Before writing: are the inputs complete?

The guard needs each of these. Take them from the assessment; fill any gap with an assessment-only run, never by
guessing.

- the steward, every document that holds authorised intent (a north star, a scope definition, a README's direction:
  not only the README), the decision surface, and any open intent questions (`intent-pass.md`);
- the current-state file, and who refreshes it;
- rules the repo is bound by but does not own, such as a user-wide instructions file, a security or spending policy,
  or merge rules;
- the verification commands, and which of them already run by themselves;
- each code area and the docs and tests that describe it;
- live operational state or spend that a session can change;
- the assessment's findings, by id.

Never read secret values; read `.env.example`, not `.env`.

## The guard contract

This template is the one definition of what a guard holds. A guard holds durable checking policy only: it points at
current state, decisions and other owners' rules, and never copies them. Write it at the default path
`skills/session-coherence-guard/SKILL.md`, or update the repo's existing guard in place.

````markdown
---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "<date>"
  source: "entropy-guard session-coherence-skill-generator v0.4.0"
---

# Skill: <Repo> Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

## Where things live
<!-- Pointers only. Never copy current direction, work status, next tasks or build ids into the guard; they belong in
the state file. Stable links to an issue or record that owns a policy are fine. -->
- Authorised intent: <files>. Steward: <name or role>.
- Current state and next steps: <state file>. Read it first.
- Decisions: <decision surface>.
- Rules owned elsewhere: <links>.

## What changed this session
```bash
git log --oneline "$START"..HEAD          # commits
git diff "$START" HEAD                    # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
<!-- Check staged and unstaged separately: `git diff HEAD` nets them out, so a change staged and then undone in the
working tree shows nothing yet still lands. Add live changes the checks depend on (a deployed build, a grant), read
with the time. -->
If the start point is unknown, compare against <upstream> and report "coverage incomplete".

## Intent
Does this change fit the authorised intent in <files>? If not:
<the intent-change rule from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`, copied with
<steward>, <intent documents> and <decision surface> filled in>
(Intent-change rule v2, from entropy-guard.)

## Checks
<!-- One line per justified check, each with a trigger and a named thing to check. Never write "the test is the
record" or "the code is the record": where a description, the code and a check disagree, establish which is wrong
first. -->
- If <code area> changed: does <doc> still describe it?
- When two documents describe one thing, decide which owns it and reduce the other to a link. Keep summaries and
  independent tests of the same contract.
- For each state claim changed in <state file>: do its other mentions still agree?
```bash
<repo commands that CI does not already run>
```

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for <steward>; files updated; the next action, written into <state file>.
````

## Size

A guard runs every session, so its size is derived, not picked: about **450 + 36 × J + S + C** words, where J is the
number of justified checks, S the words of source pointers, and C the words of repo-specific commands. The 450 covers
the common contract above; 36 words is a planning average for one complete instruction, taken from a small sample
in Astra's size review (`explorations/2026-10-05-skills-size-review-astra.md`), not a hard limit. Report the guard's size and its J. Over budget means removing
duplication or narrowing scope, never silent truncation.

## Steps

1. Record the work in the repo's current-state file.
2. Check the inputs are complete.
3. Write or update the guard to the contract.
4. Review before handing over:
   - every proposed patch against the open questions, so none quietly settles one;
   - every repair instruction against authorised intent;
   - the size against the budget.
5. Mention the guard in the operator docs, if the repo's workflow documents its guards.
6. Run `git diff --check`, plus any checks the repo implies.
7. Hand to `guards-integrator`.

In plan mode, follow the same steps but edit nothing, and list the files build mode would change.

## Safety

Never commit or push unless asked. Never read or print secrets. Leave unrelated changes alone. Commit no workflow
logic into vendor-specific agent folders such as `.claude/` or `.cursor/`.

## Output

What was supplied or found; the guard's path, size and J, or the bootstrap verdict; doc references added; validation
run; open questions the guard leaves visible; the handoff to `guards-integrator`.
