---
name: session-coherence-skill-generator
description: Generate or update a repository-specific session-coherence guard, or bootstrap the smallest useful context-preservation structure for a young repo that is starting to need handoff memory.
metadata:
  generated: "2026-05-10"
  last_updated: "2026-05-11"
  skill_version: session-coherence-generator v0.2.0
  system_snapshot: >
    Generic meta skill for solo or agent-assisted repositories that either rely
    on durable context artifacts such as TODO files, session handoffs, decision
    logs, learnings, architecture docs, workflow docs, skills, scripts, tests,
    CI, and local ignored state, or are young enough that those structures need
    to be bootstrapped proportionately.
---

# Skill: Session Coherence Skill Generator

Use this skill when you want to create or refresh a repo-specific guard that can
be run during or near the end of a coding session to leave the codebase coherent,
self-explanatory, and easy to pick up next time.

This is a meta skill: it does not assume the repository already has FlowBook's
exact files. It first discovers the repository's own context-preservation
structures, then writes or updates a custom session-coherence skill for that
repository.

For young repositories, this skill can run in bootstrap mode instead: inspect the
repo, identify the smallest missing memory surfaces, and avoid generating a full
guard until there is a real repeated loop to guard.

---

## When to Use

- You want a project-specific "handoff guard" or "coherence guard".
- A repo has accumulated TODOs, handoff docs, ADRs, runbooks, skills, workflow
  docs, architecture docs, issue templates, or local state conventions, and you
  want those structures to stay internally consistent.
- A young repo has started accumulating work, the next handoff is approaching,
  and important context would otherwise live only in chat or local memory.
- You are repeatedly tightening docs and code at session boundaries and want the
  pattern captured as a reusable skill.
- You are onboarding an agent to a repo and need it to understand which files
  preserve intent across sessions.

## When NOT to Use

- For a quick typo or formatting-only change.
- When the user only wants a one-off cleanup and does not want a reusable guard.
- When the repository is still fully understandable from its files and there is
  no realistic handoff or rediscovery cost yet. If work is starting to outgrow
  memory, use bootstrap mode rather than generating a full guard.

---

## Invocation Modes

Respect the user's requested mode. If both the runtime mode and user wording are
available, the more restrictive instruction wins.

- **Plan mode / suggest-only**: inspect the repo and draft the generated skill or
  patch, but do not edit files. Return recommended changes and open questions.
- **Build mode / just do it**: inspect, generate or update the skill, and make
  any directly implied doc updates.
- **Bootstrap mode**: inspect a young repo, classify missing memory surfaces,
  and recommend or create the smallest viable handoff structure. Do not generate
  a full guard by default.
- **Discuss-first**: inspect and propose the target skill shape before writing.
- **Audit-only**: report existing structures, coherence risks, and whether a
  custom guard already exists; do not generate one unless asked.

If the invocation is ambiguous, default to discuss-first for cross-repo policy or
workflow changes, bootstrap mode for young repos that are approaching handoff,
and build mode for explicitly requested skill creation.

---

## Bootstrap Mode for Young Repos

Use bootstrap mode when a repo has started to accumulate real work but does not
yet have a stable context-preservation system. The output is a smallest viable
coherence system, not a full guard unless the repo already has a repeated loop.

Signals that bootstrap mode applies:

- The repo has one or a few commits and the purpose or current direction is still
  mostly in conversation, memory, or uncommitted notes.
- A fresh session would need to rediscover the current task, next action, or why
  early choices were made.
- Human or AI handoff is likely soon, but there is no obvious place to record
  live state.
- The repo has enough momentum that repeated sessions are plausible, but not
  enough process history to justify a dedicated guard yet.

Bootstrap principles:

- Add the next missing memory surface only when rediscovery cost is present or
  imminent.
- Prefer one small file or section over several new process docs.
- Classify missing structures as **Needed now**, **Soon**, or **Premature**.
- Do not generate `skills/session-coherence-guard/SKILL.md` until there is a real
  session, commit, PR, or release loop worth guarding.
- If the user asks for edits, create only the files or sections in **Needed now**
  unless they explicitly approve more ceremony.

Use this default maturity ladder:

- **Purpose memory**: add or tighten `README.md`, `INTENT.md`, or equivalent when
  the repo cannot explain what it is for.
- **Active-state memory**: add a lightweight `TODO.md`, `NEXT.md`, or equivalent
  when current work and next steps would be painful to rediscover.
- **Decision memory**: add `DECISIONS.md`, ADRs, or a short decision section only
  after choices exist that would be costly to relitigate.
- **Learning memory**: add `LEARNINGS.md` or equivalent only after non-obvious
  gotchas or validated patterns have appeared.
- **Operator memory**: add `AGENTS.md`, `CONTRIBUTING.md`, or workflow notes when
  humans or agents will repeatedly enter the repo and need shared instructions.
- **Guard memory**: generate a session-coherence guard only after the repo has a
  repeated handoff loop or recurring drift symptoms.

Bootstrap output should include:

- Existing context surfaces discovered.
- Rediscovery risks for the next fresh session.
- Missing memory surfaces grouped as **Needed now**, **Soon**, and **Premature**.
- The minimal patch plan, or the files actually created/updated in build mode.
- A guard-readiness verdict: `not yet`, `soon`, or `ready now`, with the trigger
  that would justify moving to guard generation.
- A compact handoff note or first next action if no durable handoff file exists
  yet.

---

## Discovery Pass

Read enough of the repo to understand how context survives from session to
session. Search first; then read the most relevant files.

For young repos, absence is also evidence: note which memory surfaces do not
exist yet, but do not treat every missing surface as a gap that must be filled.

Look for these structures:

- Agent/operator instructions: `AGENTS.md`, `CLAUDE.md`, `CONTRIBUTING.md`,
  `README.md`, `.github/copilot-instructions.md`, or equivalent.
- Active scratchpads and handoffs: `TODO.md`, `SESSION.md`, `NEXT.md`, `ROADMAP.md`,
  issue tracker exports, milestone docs, project boards, or planning files.
- Durable reasoning logs: `DECISIONS.md`, `ADR/`, `docs/decisions/`,
  `LEARNINGS.md`, postmortems, incident notes, research notes.
- Architecture and workflow docs: `ARCHITECTURE.md`, `docs/`, `docs/workflows/`,
  runbooks, benchmark docs, deploy docs.
- Existing skills or automation: `skills/**/SKILL.md`, `bin/`, `scripts/`,
  `Makefile`, `justfile`, package scripts, task runners.
- Verification surfaces: tests, CI workflows, lint/build commands, deploy checks,
  smoke tests, generated artifact rules.
- Local ignored state conventions: `.gitignore`, `.env.example`, local config
  directories, cache/state folders, output folders.
- Vendor-specific workflow directories: `.claude/`, `.codex/`, `.cursor/`,
  `.continue/`, `.windsurf/`. Treat these as local tooling unless the repo
  explicitly wants them committed.

Do not read secrets. If you need to inspect environment shape, prefer examples
such as `.env.example` over `.env`.

---

## Analysis Pass

Build a concise model of the repo's coherence system:

1. **Purpose and active direction** - What is the product/project trying to do
   right now? What is explicitly no longer active?
2. **Session loop** - Where does current work start, where is live scratch state
   recorded, and where is richer handoff recorded?
3. **Decision loop** - Where are architectural choices captured, and what format
   do they use?
4. **Learning loop** - Where are validated gotchas and operational discoveries
   preserved?
5. **Workflow loop** - Where do reusable workflows live? Are they neutral or
   vendor-specific?
6. **Verification loop** - Which commands prove the codebase is safe to hand off?
7. **Operational state loop** - Are there live services, deploy state, pods,
   endpoints, queues, or spend risks that must be checked before handoff?
8. **Artifact loop** - Which generated outputs are ignored, committed, or used as
   evidence?
9. **Drift risks** - Which files are most likely to disagree after normal work?
10. **Next-step clarity** - Can a fresh session identify the first concrete action
    without rediscovering context?
11. **Bootstrap readiness** - If the repo is young, which memory surfaces are
    needed now, which are soon, which are premature, and is guard generation still
    premature?

Prefer the repository's existing vocabulary. Do not impose FlowBook's exact file
layout on another codebase.

---

## Generated Skill Requirements

Create or update a repo-specific skill under a neutral path. Default target:

```text
skills/session-coherence-guard/SKILL.md
```

If the repository already has an equivalent guard, update it in place instead of
creating a duplicate. If the repo uses a clear naming convention, follow it.

If bootstrap mode produces a guard-readiness verdict of `not yet` or `soon`, do
not create this file yet. Report the minimal memory surfaces and the future
trigger that would justify guard generation.

The generated guard must include:

- YAML front matter with `name`, `description`, and generation metadata.
- A short statement of the repo's current active direction.
- "When to use" and "when not to use" sections.
- Mode behavior for plan/suggest-only, build/just-do-it, discuss-first, and
  audit-only invocations.
- Judgment checks tailored to the repo's actual handoff structures.
- Mechanical checks with exact commands that work in this repo.
- Drift checks that map code domains to docs and tests.
- Operational state checks if the repo has live infrastructure or cost risks.
- Output expectations: what to report, what to update, and what unresolved risks
  to leave visible.
- Safety rules: do not commit unless asked, do not read/write secrets, do not
  modify unrelated user changes, and do not add vendor-specific workflow logic.

Keep the generated skill specific enough that a future agent can run it without
needing to rediscover the repo. Avoid vague generic checks such as "update docs"
unless paired with concrete file names and examples.

---

## Build-Mode Workflow

1. Record the work in the repo's active scratchpad if one exists.
2. Discover context-preservation structures using search and targeted reads.
3. Decide whether bootstrap mode applies, whether to create a new guard, or
   whether to update an existing one.
4. If bootstrap mode applies, create only the minimal **Needed now** memory
   surfaces and stop before guard generation unless the user explicitly asks for
   a guard.
5. If guard generation is appropriate, draft the generated guard against the
   repository's actual files and commands.
6. Write the guard under a neutral path.
7. Update the repo's operator docs to mention the new guard only if that is part
   of the repo's documented workflow.
8. Run cheap validation checks, at minimum whitespace/diff checks and any docs or
   build checks implied by the repo.
9. Summarize what was generated, what structures it discovered, and any remaining
   open questions.

---

## Plan-Mode Workflow

1. Discover the same structures, but do not edit files.
2. Report the discovered session/coherence system.
3. If the repo is young, report the bootstrap classification and smallest viable
   memory surfaces before proposing any guard.
4. Propose the target skill path and name when guard generation is appropriate.
5. Provide an outline or full draft of the generated guard when appropriate.
6. List the exact files that would be created or updated in build mode.

---

## Generated Guard Checklist Template

Adapt this skeleton to the target repository. Replace placeholders with concrete
file names and commands.

````markdown
---
name: session-coherence-guard
description: Check and repair this repository's session handoff coherence.
metadata:
  generated: "<date>"
  source: "session-coherence-skill-generator"
---

# Skill: <Repo> Session Coherence Guard

## Current Repo Direction

<One paragraph summarizing active direction and what not to reopen casually.>

## Modes

- Plan/suggest-only: inspect and report; do not edit.
- Build/just-do-it: inspect and make coherence fixes.
- Discuss-first: propose changes before editing.
- Audit-only: report risks only.

## Judgment Checks

- Current-state docs: <specific files>
- Next-step clarity: <specific section/files>
- Decisions/learnings: <specific files/formats>
- Workflow ownership: <neutral locations and banned locations>
- Domain-specific drift: <code/docs/tests/infrastructure mappings>

## Mechanical Checks

```bash
<build/test/lint commands that actually work here>
```

## Output

- Coherence status
- Files changed or proposed
- Remaining risks
- First next action for the next session
````

---

## Safety Rules

- Never commit or push unless the user explicitly asks.
- Never read or print secret values. Use example env files and key names instead.
- Do not overwrite unrelated user changes.
- Do not create committed workflow logic under vendor-specific agent directories.
- Preserve the repo's existing conventions unless they conflict with an explicit
  user instruction or a documented policy.

---

## Output

When this meta skill finishes, report:

- The context-preservation structures discovered.
- For young repos, the bootstrap classification and guard-readiness verdict.
- Whether a generated guard was created or updated.
- The generated guard path.
- Any doc references added.
- Validation commands run and results.
- Any unresolved questions the generated guard intentionally leaves visible.

---

## Rationale

Agent-assisted projects lose time when current state, decisions, operational
constraints, and next steps drift across multiple files. A repo-specific guard is
most useful when it is generated from the repo's real structures instead of from
a generic checklist. This meta skill makes that generation repeatable while still
respecting each project's own conventions.
