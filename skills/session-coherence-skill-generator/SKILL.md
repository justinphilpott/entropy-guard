---
name: session-coherence-skill-generator
description: The guard builder for entropy-guard. Generate or update a repository's session-end coherence guard from an assessment's findings, or bootstrap the smallest context-preservation structure for a young repo that is starting to need handoff memory.
metadata:
  version: "0.3.0"
---

# Skill: Session Coherence Skill Generator

This is the only skill in entropy-guard that writes guards. It builds or updates a repo-specific guard that an agent
or person runs at the end of a work session. The guard leaves the repo coherent, honest about its state, and easy to
pick up next time.

Its inputs usually come from an assessment:

- from `skills/entropy-assessment/SKILL.md`: the intent section, the profile of a mixed, code-first or
  workflow-heavy system, and the ranked risks;
- from `skills/docs-first-planning-assessment/SKILL.md`: the intent section, the canonical truth map, the loop map,
  and the docs-first checks.

When it is run without an assessment, it does its own discovery (below), and runs the intent pass in
[`../entropy-assessment/intent-pass.md`](../entropy-assessment/intent-pass.md) first.

For young repositories, it runs in bootstrap mode instead: it finds the smallest missing memory surfaces, and does
not build a full guard until there is a real repeated loop to guard.

After building a guard, hand it to `skills/guards-integrator/SKILL.md`, which places it and checks that it is
actually adopted.

---

## When to Use

- An assessment has handed over its findings and the repo needs a new or amended guard
- A repo has accumulated TODOs, handoff docs, ADRs, runbooks, skills, workflow docs, architecture docs or local state
  conventions, and those structures need to stay consistent
- A young repo has started accumulating work, the next handoff is approaching, and important context would otherwise
  live only in chat or memory
- An agent is being onboarded to a repo and needs to know which files preserve intent across sessions

## When NOT to Use

- For a quick typo or formatting-only change
- When the user only wants a one-off cleanup and not a reusable guard
- When the repo is still fully understandable from its files and there is no realistic handoff or rediscovery cost
  yet. If work is starting to outgrow memory, use bootstrap mode rather than building a full guard.

---

## Invocation Modes

Respect the user's requested mode. If both the runtime mode and the user's wording are available, the more
restrictive instruction wins.

- **Plan mode / suggest-only**: inspect and draft the guard or patch, but do not edit files. Return recommended
  changes and open questions.
- **Build mode / just do it**: inspect, build or update the guard, and make any directly implied doc updates.
- **Bootstrap mode**: inspect a young repo, classify missing memory surfaces, and recommend or create the smallest
  viable handoff structure. Do not build a full guard by default.
- **Discuss-first**: inspect and propose the guard's shape before writing.
- **Audit-only**: report existing structures, coherence risks, and whether a guard already exists; build nothing
  unless asked.

If the invocation is ambiguous, default to discuss-first for cross-repo policy or workflow changes, bootstrap mode
for young repos approaching handoff, and build mode for an explicitly requested guard.

---

## Bootstrap Mode for Young Repos

Use bootstrap mode when a repo has started to accumulate real work but does not yet have a stable
context-preservation system.

Signals that bootstrap mode applies:

- The repo has one or a few commits, and its purpose or current direction still lives mostly in conversation, memory,
  or uncommitted notes.
- A fresh session would need to rediscover the current task, next action, or why early choices were made.
- A human or AI handoff is likely soon, but there is no obvious place to record live state.

Bootstrap principles:

- Add the next missing memory surface only when rediscovery cost is present or imminent.
- Prefer one small file or section over several new process docs.
- Classify missing structures as **Needed now**, **Soon**, or **Premature**.
- Do not build `skills/session-coherence-guard/SKILL.md` until there is a real session, commit, PR, or release loop
  worth guarding.
- If the user asks for edits, create only the **Needed now** files or sections unless they explicitly approve more.

Default maturity ladder:

- **Purpose memory**: `README.md`, `INTENT.md`, or equivalent, when the repo cannot explain what it is for and who
  decides that.
- **Active-state memory**: a lightweight `TODO.md`, `STATE.md`, or equivalent, when current work and next steps would
  be painful to rediscover.
- **Decision memory**: `DECISIONS.md`, ADRs, or a short decision section, once choices exist that would be costly to
  relitigate.
- **Learning memory**: `LEARNINGS.md` or equivalent, once non-obvious gotchas or validated patterns have appeared.
- **Operator memory**: `AGENTS.md`, `CONTRIBUTING.md`, or workflow notes, when humans or agents will repeatedly enter
  the repo.
- **Guard memory**: a session-coherence guard, only once the repo has a repeated handoff loop or recurring drift.

Bootstrap output:

- Existing context surfaces discovered.
- Rediscovery risks for the next fresh session.
- Missing memory surfaces, grouped as **Needed now**, **Soon**, and **Premature**.
- The minimal patch plan, or the files actually created or updated in build mode.
- A guard-readiness verdict, `not yet`, `soon` or `ready now`, with the trigger that would justify building a guard.

---

## Discovery Pass

Skip what the assessment already supplied. Otherwise, search first, then read the most relevant files.

For young repos, absence is also evidence: note which memory surfaces do not exist yet, but do not treat every
missing surface as a gap that must be filled.

Look for:

- **Intent and its steward**: where authorised intent lives, and who can change it.
- **Agent and operator instructions**: `AGENTS.md`, `CLAUDE.md`, `CONTRIBUTING.md`, `README.md`,
  `.github/copilot-instructions.md`, or equivalent.
- **Current state and handoffs**: `TODO.md`, `STATE.md`, `SESSION.md`, `NEXT.md`, roadmap or milestone docs, issue
  trackers.
- **Durable reasoning**: `DECISIONS.md`, `ADR/`, `docs/decisions/`, `LEARNINGS.md`, postmortems, friction logs.
- **Rules owned elsewhere**: rules the repo is bound by but does not own, such as an organisation-wide or user-wide
  instruction file, a security policy, a spending policy or merge rules. The guard links to these; it never restates
  them.
- **Architecture and workflow docs**: `ARCHITECTURE.md`, `docs/`, runbooks, deploy docs.
- **Existing skills and automation**: `skills/**/SKILL.md`, `scripts/`, `Makefile`, `justfile`, package scripts.
- **Verification**: tests, CI workflows, lint and type-check commands, smoke tests. Note what actually runs by itself:
  read the CI workflow steps, and check whether committed hooks are enabled (`git config core.hooksPath`).
- **Live operational state**: running services, deployed builds, credentials, scheduled jobs, anything that costs
  money.
- **Local ignored state**: `.gitignore`, `.env.example`, local config, cache and output folders.

Do not read secrets. To see the shape of the environment, read `.env.example` rather than `.env`.

Treat vendor-specific agent folders (`.claude/`, `.codex/`, `.cursor/`, `.continue/`, `.windsurf/`) as local tooling
unless the repo explicitly commits them.

---

## Analysis Pass

Build a concise model of the repo's coherence system:

1. **Intent** - Where does authorised intent live, who is its steward, and where are decisions recorded?
2. **Session loop** - Where does work start, where is current state recorded, and where is richer handoff recorded?
3. **Decision and learning loops** - Where are choices and validated discoveries captured, and in what format?
4. **Verification loop** - Which commands prove the repo is safe to hand off, and which of them already run by
   themselves?
5. **Operational state** - Are there live services, deployed builds, credentials or spend that must be checked
   before handoff?
6. **Drift risks** - Which files are most likely to disagree after normal work? Map each changed code area to the
   docs and tests that describe it.
7. **Next-step clarity** - Can a fresh session find the first concrete action without rediscovering context?
8. **Bootstrap readiness** - For a young repo: which memory surfaces are needed now, soon, or prematurely?

Prefer the repo's own vocabulary and file layout.

---

## What a Guard Holds, and What It Must Not

A guard is a durable checking policy. It lasts as long as the repo's way of working, so it holds only what changes
that slowly.

**A guard holds:**

- the checks, as judgment questions and as exact commands that work in this repo;
- pointers to where authorised intent, current state, decisions and rules owned elsewhere live;
- the definition of what changed in a session (below);
- a copy of the intent-change rule from `intent-pass.md`, filled in with this repo's steward, intent documents and
  decision surface, and naming the rule's version so a stale copy can be found;
- the shape of the report each run produces.

**A guard must not hold:**

- current direction, active work, the current tranche or stage, next tasks, PR or issue numbers, or build ids. These
  belong in the current-state file, which the guard tells the reader to open.
- a restatement of a rule owned elsewhere, such as spending, security review or merge rules. Link to the owner
  instead, because a copied rule goes stale when the owner changes it.
- anything a fresh agent could find from the code in a minute.

## What Changed in a Session

A guard checks the session's change, so it must define that change so that nothing in it is missed:

- **Commits:** from the point where the session started, or from the upstream branch if that is not known, to
  `HEAD`.
- **Uncommitted work:** staged, unstaged and untracked files. A guard that compares only commits, for example
  `git diff origin/main..HEAD`, misses the work about to be committed.
- **Changes outside the files:** a deployed build, a restarted service, a granted permission or an expired
  credential, where the guard's checks depend on them. Read these from the live source, with the time read.

Typical commands, adapted to the repo:

```bash
git log --oneline <start>..HEAD        # commits this session
git status --short                     # staged, unstaged and untracked, at a glance
git diff HEAD                          # all uncommitted changes to tracked files
git ls-files --others --exclude-standard   # untracked files to read
```

If the starting point cannot be determined, the guard says so in its report: "coverage incomplete: compared against
`<what was used>`".

---

## Generated Guard Requirements

Create or update the guard under a neutral path. Default target:

```text
skills/session-coherence-guard/SKILL.md
```

If the repo already has an equivalent guard, update it in place rather than creating a duplicate. If the repo has a
clear naming convention, follow it. If bootstrap mode's verdict is `not yet` or `soon`, do not create this file.

The guard must include:

- YAML front matter with `name`, `description`, and generation metadata.
- "When to use" and "when not to use" sections.
- The pointers, the definition of what changed, and the intent-change rule, as described above.
- Judgment checks tailored to the repo's handoff structures, including the checks supplied by an assessment.
- Repair instructions checked against authorised intent. A test or the code shows what is checked or built; it does
  not authorise weakening a documented constraint. Where a description, the code and a check disagree, the guard
  says to establish which is wrong before making them agree. It never says "the test is the record" or "the code is
  the record".
- Mechanical checks with exact commands that work in this repo. Prefer the repo's existing tools, and leave anything
  CI already runs to CI.
- Drift checks that map code areas to the docs and tests that describe them.
- Operational state checks, if the repo has live infrastructure or spend.
- The report shape (see the template).
- Safety rules: do not commit unless asked, do not read or write secrets, do not modify unrelated changes, and do
  not add vendor-specific workflow logic.

Keep the guard specific enough to run without rediscovering the repo, and short enough to be read in full each time.
Avoid vague checks such as "update docs" unless paired with concrete file names.

---

## Build-Mode Workflow

1. Record the work in the repo's current-state file, if one exists.
2. Take the assessment's inputs, or discover the context-preservation structures yourself.
3. Decide whether bootstrap mode applies, whether to create a new guard, or whether to update an existing one.
4. If bootstrap mode applies, create only the **Needed now** memory surfaces and stop, unless the user explicitly
   asks for a guard.
5. Otherwise, write the guard against the repo's actual files and commands.
6. Review the guard and any proposed patches against the open questions from the intent pass. A patch must not
   quietly settle a question that is still open, and no repair instruction may make the code or a test the
   authority over a documented constraint.
7. Update the repo's operator docs to mention the guard, if that is part of its documented workflow.
8. Run cheap validation, at minimum `git diff --check`, plus any docs or build checks the repo implies.
9. Hand the guard to `skills/guards-integrator/SKILL.md`.
10. Summarise what was built, what structures were found, and the open questions.

## Plan-Mode Workflow

1. Take the assessment's inputs or discover the same structures, but edit nothing.
2. Report the discovered coherence system.
3. For a young repo, report the bootstrap classification before proposing any guard.
4. Propose the guard's path and name, with an outline or a full draft.
5. List the exact files that would be created or updated in build mode.

---

## Generated Guard Template

Adapt this skeleton to the target repo. Replace every placeholder with concrete file names and commands.

````markdown
---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "<date>"
  source: "entropy-guard session-coherence-skill-generator v0.3.0"
---

# Skill: <Repo> Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

## Where things live

Read these; do not copy them into this guard.

- Authorised intent: <files>. Steward: <name or role>.
- Current state and next steps: <state file>. Read it first.
- Decisions: <decision surface>.
- Rules owned elsewhere: <links, e.g. spending, security review, merge rules>.

## What changed this session

```bash
<repo-specific commands covering commits since the start point, plus staged, unstaged and untracked work>
```

If the start point is unknown, compare against <upstream> and report "coverage incomplete".

## Modes

- Plan/suggest-only: inspect and report; do not edit.
- Build/just-do-it: inspect and make coherence fixes.
- Discuss-first: propose changes before editing.
- Audit-only: report risks only.

## Intent

- Does this session's change fit the authorised intent in <files>?
- When the work and the authorised intent disagree:
  <the intent-change rule from entropy-guard's `skills/entropy-assessment/intent-pass.md`, copied with <steward>,
  <intent documents> and <decision surface> filled in>
  (Intent-change rule v2, from entropy-guard `intent-pass.md`.)

## Judgment checks

- <checks from the assessment, written against this repo's files>
- When a change touches something two documents both describe, decide which owns it and reduce the other to a link.
  Keep summaries and independent tests of the same contract; they are not redundant copies.
- If <code area> changed: does <doc> still describe it? <one line per mapping>

## Mechanical checks

```bash
<commands that work here and that CI does not already run>
```

## Report

- Baseline compared against, and whether coverage was complete
- What was checked, and what was not
- Findings caused by this session; problems that were already there, listed separately
- Proposals for <steward>
- Files updated, such as the state file and decision log
- First next action for the next session, written into <state file>, not here
````

---

## Safety Rules

- Never commit or push unless the user explicitly asks.
- Never read or print secret values. Use example env files and key names instead.
- Do not overwrite unrelated user changes.
- Do not create committed workflow logic under vendor-specific agent directories.
- Preserve the repo's existing conventions unless they conflict with an explicit user instruction or a documented
  policy.

---

## Output

When this skill finishes, report:

- The context-preservation structures found or supplied.
- For a young repo, the bootstrap classification and guard-readiness verdict.
- Whether a guard was created or updated, and its path.
- Any doc references added.
- Validation commands run, and their results.
- Open questions the guard intentionally leaves visible.
- The handoff to `guards-integrator`.

---

## Rationale

A guard built from a repo's real structures is far more useful than a generic checklist. A guard that copies the
repo's current state, or rules owned elsewhere, goes stale as soon as those change. So the guard holds the checking
policy and points at everything else. Its fixed reference is the steward's authorised intent. The current state of
the code is not a reference, because checking against it would treat drift as normal.
