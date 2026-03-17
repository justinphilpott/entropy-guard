---
name: guards-integrator
description: Examine a system's existing iteration loops and generated guards, then recommend how those guards should be integrated for immediate operational value. Maps guard checks to triggers, discovery paths, execution order, and adoption steps.
metadata:
  version: "0.2.0"
---

# Skill: Guards Integrator

Take a set of generated guards and make them real. This skill examines the target system's current iteration loops, identifies the best handoff points for each guard, and produces an adoption plan that fits how the system already changes.

Use this after generating guards, or at the end of guard generation if the agent already has the necessary context.

> **Core idea**: a guard file that nobody remembers to run is dead weight. Integration is part of the guard design, not an optional afterthought.

---

## When to Run

- After `entropy-assessment` generates one or more guards
- When a system has guards on disk but no clear way they enter daily work
- When the team already has an agentic loop, PR flow, or CI pipeline and wants to fit guards into it with minimal disruption
- When an existing guard is routinely skipped, forgotten, or run too late to be useful

## When NOT to Run

- Before the system's main iteration loop is understood at all
- For mechanically-checkable problems that should go straight to linting, CI, schema validation, or type constraints
- As a substitute for guard generation; this skill integrates guards, it does not decide from scratch which guards are needed

---

## Inputs

Gather these before recommending integration:

- The generated guards themselves (or a clear summary of each guard's purpose, scope, and `When to Run` section)
- The system's current iteration loop: agent session, local commit, PR review, CI, deploy, release, scheduled review, or other handoff
- Who performs each handoff: humans, AI agents, or both
- Existing workflow mechanisms: commit hooks, CI jobs, PR templates, agent instructions, runbooks, release checklists
- Any known pain points: skipped docs updates, stale tests, forgotten decisions, late review, noisy automation

When entering a repo cold, look for concrete evidence of the current loop before inferring one:

- **CI / automation**: `.github/workflows/`, `.gitlab-ci.yml`, `circle.yml`, `buildkite.yml`, `azure-pipelines.yml`, `Jenkinsfile`, `Makefile`, task runners
- **Git hooks / local prompts**: `.pre-commit-config.yaml`, `.husky/`, `.git/hooks/` (if visible), `package.json` scripts, lint-staged config
- **PR / review flow**: `.github/pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE/`, contribution docs, CODEOWNERS
- **Agent instructions**: `AGENTS.md`, local wrapper prompts, slash-command docs, task templates, repo-specific contributor instructions
- **Iteration pattern clues**: recent commit history, release notes, changelog cadence, scheduled review docs, deployment runbooks

If any of these are missing, infer what you can from the repository and state the uncertainty explicitly.

---

## Process

### Step 1: Map the live iteration loops

Identify how change actually moves through the system today.

- What is the smallest meaningful unit of iteration? (agent session, commit, PR, deploy, release)
- Which handoff points are already stable and habitual?
- Where are contributors already pausing to evaluate work?
- Where is entropy introduced because an expected follow-up happens later or not at all?

Write a short loop map. Prefer the real workflow over the idealized one.

Minimal scaffold:

```md
Loop map
- Change starts in: agent task + local branch
- First handoff: local commit
- Second handoff: pull request review
- Automated gate: GitHub Actions test + lint workflow
- Final handoff: merge to main
```

### Step 2: Classify each guard by timing and burden

For each guard, determine:

- What change should trigger it?
- How expensive is it? (seconds, 2-5 minutes, longer)
- Is it judgment-requiring, mechanically-assistable, or mixed?
- What is the latest useful moment to run it without losing value?

Do not force every guard into pre-commit. Place it where it catches drift while the change is still cheap to correct.

### Step 3: Choose the integration depth

For each guard or guard check, recommend the right depth:

1. **External** — manual invocation from a skill file
2. **Prompted** — reminders in hooks, templates, or agent instructions
3. **Semi-embedded** — CI jobs, scripts, or automated verification steps
4. **Fully embedded** — structural enforcement; no separate guard run needed

Default rule: keep judgment in skills, move mechanics into tooling as soon as the system can support it.

Signals to calibrate what the system can support *now*:

- **CI already exists**: prefer prompted or semi-embedded recommendations over purely manual ones
- **Hook framework already exists** (`pre-commit`, Husky, lint-staged): prefer local reminders or lightweight scripted checks
- **No automation exists yet**: keep the `Now` plan manual or lightly prompted; reserve CI or structural enforcement for `Next` / `Later`
- **Team already uses agent instructions or templates**: add agent-facing guard reminders there before inventing new surfaces
- **The workflow is unstable or informal**: recommend the smallest reliable trigger first rather than a broad rollout

### Step 4: Fit guards into the existing loop

For each guard, specify:

- **Trigger**: exactly when it should run
- **Actor**: who runs it or observes its result
- **Entry point**: how the contributor discovers and invokes it
- **Output**: what result should be recorded, where, and for whom
- **Escalation path**: what to do when the guard reveals a gap too large to fix inside the current iteration

If multiple guards exist, define ordering and note which can run in parallel.

Minimal scaffold:

```md
Guard placement
- `docs-drift-guard`: run at PR open or before merge because doc/code drift is cheapest to fix before review ends
- `decision-capture-guard`: run at end of agent session or before commit because the required context is freshest then
```

### Step 5: Adapt for agentic workflows

If AI agents participate in the loop, check whether guard execution is:

- In the agent's standing instructions (`AGENTS.md`, task preamble, wrapper prompt)
- Included in the completion criteria for a task
- Reflected in any handoff artifact the agent produces
- Discoverable by a fresh agent entering the repo cold

Recommend the smallest change that makes the guard visible to the agent at the right moment. Examples: an `AGENTS.md` section, a guard manifest, a slash-command wrapper, or a task template that names the guard explicitly.

### Step 6: Produce an adoption plan

Deliver a phased recommendation with three horizons:

- **Now** — changes that can be adopted immediately with existing workflow primitives
- **Next** — light automation or prompt changes that reduce reliance on memory
- **Later** — deeper embedding into CI, schemas, types, or a dedicated guard runner

The "Now" plan should be actionable without waiting for new infrastructure.

Minimal scaffold:

```md
Adoption plan
- Now: add guard links to `AGENTS.md` and require a short guard note in PR descriptions
- Next: add a PR template checkbox and a pre-commit reminder script
- Later: move mechanical checks into CI and add a guard runner if the set grows
```

---

## Output

Produce an integration brief with these sections:

- **Loop map** — the system's real iteration and handoff points
- **Guard placement** — where each guard belongs and why
- **Adoption plan** — `Now`, `Next`, `Later`
- **Discovery plan** — how contributors and agents find the guards
- **Execution plan** — ordering, parallelism, and outputs
- **Automation opportunities** — which manual checks should move deeper into tooling
- **Risks / uncertainties** — assumptions that should be validated after a few real iterations

Use compact, explicit entries rather than narrative prose. A good brief is easy for a maintainer or fresh agent to scan and immediately act on.

Minimal output scaffold:

```md
## Loop map
- Change starts in ...

## Guard placement
- `guard-name` -> trigger / actor / why here

## Adoption plan
- Now: ...
- Next: ...
- Later: ...

## Discovery plan
- Add guard references in ...

## Execution plan
- Order: ...
- Parallelizable: ...

## Automation opportunities
- Move ... from manual to CI when ...

## Risks / uncertainties
- Assumed ... because ...
```

If the assessment skill generated the guards in the same session, append this brief directly after the guard set so the maintainer gets both artifacts together.

---

## What This Is Not

- A replacement for `entropy-assessment` — use that to decide what guards are needed
- A guard runner implementation — this skill recommends integration; it does not execute guards for you
- An excuse to add ceremony — if a guard cannot fit the loop without large overhead, simplify the guard or move more of it into automation
