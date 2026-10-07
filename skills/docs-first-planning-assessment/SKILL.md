---
name: docs-first-planning-assessment
description: Analyse markdown-first planning and design repos for entropy risks. Map which document owns which truth, bring the repo's current-state file up to date for fresh sessions, and supply the docs-first checks that the guard generator builds into the repo's guard.
metadata:
  version: "0.3.0"
---

# Skill: Docs-First Planning Assessment

The analysis for markdown-first planning, architecture and design repos, where the documents are the product and
work happens across repeated human and agent sessions. It does not write guards: it hands its checks to
`skills/session-coherence-skill-generator/SKILL.md`.

Not for code-first systems (use `skills/entropy-assessment/SKILL.md`), one-off documents with no recurring loop, or
placing an existing guard (use `skills/guards-integrator/SKILL.md`). Its assessment follows the output rules in
`entropy-assessment`: one findings list, with ids.

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
| **Parallel truth** | Two documents are each complete about one concept, or the same decision, status or convention is kept in several files. | When a change touches something two documents describe, decide which owns it and reduce the other to a link. Keep summaries, generated projections and independent tests of the same contract. |
| **Local-global inversion** | Component notes restate system-wide truth in full. | Local notes record only local implications. |
| **Superseded material nearby** | Old or imported documents sit by live truth, half-marked, easy to revive. | Before recreating anything to fix a reference, check whether it was superseded in `DECISIONS.md` or the state file. |
| **Stale references** | Changed paths, names or links. | Search for each old name; links to a link checker. |
| **Lost decisions and learnings** | Choices and gotchas that live only in sessions. | Did this session produce a decision or a learning? Record it. |
| **State dishonesty** | `TODO.md`, roadmaps or handoffs no longer match reality. | Does the state file match reality, and do the other mentions of each changed claim agree? |
| **Workflow drift** | Instructions, guard triggers or handoff rituals no longer match practice. | Would a fresh agent following the instructions do what this session did? |
| **Brittle automation** | Scripts that encode wording or paths that churn. | Keep volatile checks as judgment; automate only stable invariants such as links and required files. |

## Step 5: Bring the current-state file up to date

Update the repo's **existing** state file, the one the loop map shows is read first. Never add a competing summary. If
there is none, create the smallest one (`session-coherence-skill-generator`'s `bootstrap.md`). It holds:
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

For assessment only, stop here. A reference-only or retired repo usually needs no new guard.

## Step 7: Supply the generator

1. List the existing guard surfaces (guards, instruction files, hooks, templates) as keep, amend, replace or demote.
   Prefer refining a sound existing guard.
2. Write the matrix's checks against this repo's actual files.
3. Run `session-coherence-skill-generator` with the intent section, the truth and loop maps, those checks and the guard
   surfaces. Then run `guards-integrator`.

Track cleanup in `TODO.md` or a handoff note, never in the guard itself.

If this skill missed something others would hit, note it. In this repo, `skills/local/entropy-guard-feedback/SKILL.md`
files it.
