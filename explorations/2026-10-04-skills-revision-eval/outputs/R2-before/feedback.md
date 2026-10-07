# Upstream feedback on entropy-guard

These notes were produced by the upstream feedback checks in `entropy-assessment`, `docs-first-planning-assessment` and `guards-integrator`. They are formatted for `skills/local/entropy-guard-feedback/SKILL.md`. This run allowed no network access, so no `gh issue create` was run and nothing was checked against existing issues. File them by hand at https://github.com/justinphilpott/entropy-guard/issues/new with the label `agent-feedback`. The four notes are distinct from one another.

---

## F1. entropy-assessment: the front door never routes to session-coherence-skill-generator, and guards-integrator still names entropy-assessment as the generator

## Category
assessment

## What I Observed
`skills/entropy-assessment/SKILL.md` Step 3 routes shape A to `docs-first-planning-assessment` and shapes B, C and D to the lightweight fallback. Step 4d's next-move list does not include `session-coherence-skill-generator`, although that skill is exported and listed in the README. That skill also produces a session-end guard over the same ground as docs-first Phase 2 (TODO state, decisions, learnings, workflow docs), and neither skill mentions the other. So an agent following the front door has no route to the session-coherence generator, and no guidance on which of the two generators to use.

Separately, `skills/guards-integrator/SKILL.md` line 20 ("After `entropy-assessment` generates one or more guards") and line 227 still describe entropy-assessment as the guard generator. It stopped being one when it became a router.

## Suggestion
Name the session-coherence generator in Step 3 and Step 4d. Two cases fit it:

- young repositories that need bootstrap mode;
- mixed or code-first repositories that want a session handoff guard, since the fallback path has no generator.

State in both generator skills how they divide the work. Update `guards-integrator` "When to Run" and "What This Is Not" to name whichever skill generated the guard.

## Project Context
A markdown-only skill library assessed with its own skills: docs-first planning shape, human and multi-vendor AI sessions, commit-level handoff, no CI.

---

## F2. docs-first-planning-assessment: the current-state packet has no stated home, owner or refresh trigger

## Category
skill

## What I Observed
Step 5 requires a current-state packet, and Step 8 says "session start: read the current-state packet first". But the skill does not say where the packet should live in the target repository, who refreshes it, or when. The packet holds the stage, active fronts, open questions and nearby superseded material, all of which change from session to session. Without a refresh trigger it becomes a new stale state artifact, which is the kind of entropy the skill exists to prevent. While integrating the guard I had to invent a home for it (`CURRENT_STATE.md`) and a refresh trigger (a state check at the end of the guard).

## Suggestion
In Step 5 or the Output section, say three things:

- The packet should live in a named file that the repository's agent instructions link first.
- The generated session-end guard must include a check to refresh it.
- The packet should stay to one screen.

Also add the refresh check to the Step 7 checklist areas under "State honesty".

## Project Context
The same as F1. The target had no packet even though its own guard says it came from this skill.

---

## F3. docs-first-planning-assessment: the canonical truth map has no role for documents that are the product

## Category
assessment

## What I Observed
Step 2 offers five roles: canonical system-wide truth, current-state, local elaborations, templates, and historical. In a repository whose documents are themselves the shipped product (here, exported agent skills; similar cases are prompt packs, policy libraries and runbook collections), the main artifacts fit none of those roles cleanly. They are not system-wide truth about the repository, and they are not local elaborations of it. I had to add an ad hoc "product" role. The most important drift in this target ran between those product documents and the decision log that governs them: decisions describing skill structure that had been removed, and decided behaviour that had silently vanished from a skill during a rewrite. No Step 4 vector names that.

## Suggestion
Add a "product artifacts" role to Step 2. Add a Step 4 vector along the lines of "decision–artifact drift: decisions that describe removed structure, or decided behaviour missing from the current artifact after a rewrite". Its canonical anchor would be the decision log plus the artifact itself.

## Project Context
The same as F1.

---

## F4. guards-integrator: the cold-start evidence list misses tracked hook folders

## Category
integration

## What I Observed
The "When entering a repo cold" list names `.pre-commit-config.yaml`, `.husky/`, `.git/hooks/` "(if visible)" and package scripts. It does not name a tracked custom hooks folder, such as `.githooks/` enabled by a symlink or `core.hooksPath`. This target's reminder hook lives in `.githooks/pre-commit`, and I found it only because `README.md` mentions it. In a read-only snapshot with no `.git`, the listed places would have shown no hook at all.

## Suggestion
Add "tracked hook folders (`.githooks/`, `hooks/`, or anything `core.hooksPath` points at)" to the Git hooks bullet. Note that whether such a hook is enabled cannot be seen without the clone's git configuration.

## Project Context
The same as F1. The snapshot had no `.git` directory.
