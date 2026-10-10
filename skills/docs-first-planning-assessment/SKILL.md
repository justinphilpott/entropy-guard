---
name: docs-first-planning-assessment
description: Analyse markdown-first planning and design repos for entropy risks. Map which document owns which truth, bring the repo's current-state file up to date for fresh sessions, and supply the docs-first checks that the guard generator builds into the repo's guard.
metadata:
  version: "0.3.0"
---

# Skill: Docs-First Planning Assessment

The analysis for markdown-first planning, architecture and design repos, where the documents are the product and
work happens across repeated human and agent sessions. It does not write guards: it hands its checks to
[`session-coherence-skill-generator`](../session-coherence-skill-generator/SKILL.md).

Not for code-first systems (use [`entropy-assessment`](../entropy-assessment/SKILL.md)), one-off documents with no recurring loop, or
placing an existing guard (use [`guards-integrator`](../guards-integrator/SKILL.md)). It follows "Called for analysis only" and "Rules
along the whole route" in `entropy-assessment`: it inherits the caller's mode, keeps one findings list with ids, and
limits every correction by its evidence.

## Step 1: Intent and horizon

Use the intent pass already run by `entropy-assessment`; if there was none, run
[`../entropy-assessment/intent-pass.md`](../entropy-assessment/intent-pass.md). Record the lifecycle status (active,
reference-only or retired) and the planning horizon: what is settled, active, and still exploratory.

## Step 2: Which document owns which truth

Give the main documents a role each:

- **canonical:** the home of repo-wide intent, architecture, conventions or settled decisions;
- **current state:** `TODO.md`, `STATE.md`, handoff notes;
- **local elaboration:** component notes recording local implications only;
- **product artifact:** documents consumed as skills, templates or policies, whose names, paths, inputs and handoffs
  are contracts;
- **template;**
- **historical, superseded or imported.**

For each major concept, find its one canonical home, and which documents only link to it or summarise it. Produce a
**truth map**.

## Step 3: The real loop

Map how a fresh session actually starts, what it reads first, where work is tracked, when decisions and learnings are
captured, and where the handoff is: session end, commit or PR. Prefer the real loop over the documented one.

## Step 4: Risks

Rank the top 3 to 5, each with its decay rate, recovery cost, the symptoms seen, and the canonical source that should
anchor the fix. This matrix gives the common risks, what drift looks like, and the guard check each one needs:

| Risk | What drift looks like | Guard check |
|---|---|---|
| **Parallel truth** | Two documents are each complete about one concept, or the same decision, status or convention is kept in several files. | Apply the one-owner rule (`entropy-assessment`, "Rules along the whole route"). |
| **Local-global inversion** | Component notes restate system-wide truth in full. | Local notes record only local implications. |
| **Superseded material nearby** | Old or imported documents sit by live truth, half-marked, easy to revive. | Before restoring a deleted artifact, reviving an old concept or recreating a reference target, check whether the decision owner or the state file records its supersession. |
| **Stale references** | Changed paths, names or links. | Search for each old name; links to a link checker. |
| **Lost decisions and learnings** | Choices and gotchas that live only in sessions. | Did this session produce a decision or a learning? Record it. |
| **State dishonesty** | `TODO.md`, roadmaps or handoffs no longer match reality. | Does the state file match reality, and do the other mentions of each changed claim agree? |
| **Workflow drift** | Instructions, guard triggers or handoff rituals no longer match practice. | Would a fresh agent following the instructions do what this session did? |
| **Brittle automation** | Scripts that encode wording or paths that churn. | Keep volatile checks as judgment; automate only stable invariants such as links and required files. |

## Step 5: Bring the current-state file up to date

Update the repo's **existing** state file, the one the loop map shows is read first. Never add a competing summary. If
there is none, create the smallest one, using `session-coherence-skill-generator`'s `bootstrap.md` for that one surface.
It holds:
- the current stage;
- the canonical documents to trust first;
- settled decisions, linked to where they are recorded;
- active fronts and open questions, including the intent pass's;
- misleading superseded material nearby;
- one to three next actions.

Carry only what the docs and code cannot tell a fresh reader quickly; it is not an overview. Rules for claims:
- **Changing claims:** a claim likely to change within weeks carries its source and the date it was checked.
- **Staleness:** the file says what makes it stale, and who or what refreshes it.
- **Consistency:** for each claim you change, check its other mentions in the file.
- **Live facts:** for a live fact, such as which build runs, keep a fresh observation apart from an old recorded one.
  Citing a source does not refresh a value.

## Step 6: Deliver the assessment

Deliver these, from one findings list:
- the intent section;
- the truth map and the loop map;
- the ranked risks;
- recommendations: what to consolidate, demote or mark historical;
- one-time cleanup, each item verified against the current file;
- the state-file update, as a patch or the files changed.

## Step 7: The guard inputs

This step is part of the analysis, so it runs even for an assessment only.

1. List the existing guard surfaces (guards, instruction files, hooks, templates) as keep, amend, replace or demote.
   Prefer refining a sound existing guard.
2. Write the matrix's checks against this repo's actual files.
3. Make the guard decision (`none`, `bootstrap`, `create` or `update`), as in `entropy-assessment` Step 3. A
   reference-only or retired repo usually needs `none`.

Then, if another skill called this one, return the assessment and these inputs to it. Otherwise, for `create` or
`update`, hand them to `session-coherence-skill-generator`, which hands on to `guards-integrator`.

Track cleanup in `TODO.md` or a handoff note, never in the guard itself.

If this skill missed something others would hit, note it. In the entropy-guard repo, `skills/local/entropy-guard-feedback/SKILL.md`
files it.
