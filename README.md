# entropy-guard

Skills, frameworks, and resources for keeping iterated systems coherent. Designed for AI-assisted workflows where change is fast and drift is faster.

This is an evolving project — actively used, actively refined. Both humans and AI agents contribute here.

The broader exploratory thread that grew out of this work — layered intent, entropic immunity, viability / steering, and the larger theory space around long-lived intent-bearing systems — now continues in the sibling `entropy-immune-system` repo. This repo stays focused on practical entropy guards and their validation.

---

## What is an entropy guard?

Systems that undergo repeated change — especially AI-assisted change — accumulate entropy: stale docs, forgotten decisions, internal inconsistencies, drift from original intent. An entropy guard is a lightweight, targeted mechanism applied at each iteration to prevent this drift before it compounds.

A guard is not a full audit. It is scoped to what changed in this iteration, takes 2–10 minutes, and preserves the things that matter most: continuity of intent, internal consistency, accumulated knowledge, and honest self-representation.

See [INTENT.md](INTENT.md) for a precise definition of what entropy means here and what guards should preserve.

---

## How to use this repo

Current strongest fit: markdown-first, docs-as-system, architecture/planning, and workflow-heavy repos that evolve through repeated AI-assisted sessions. Code/test/API-oriented use is still in scope, but is less validated here today.

### Assess a system for entropy risks

The front door is [entropy assessment](skills/entropy-assessment/). It classifies the system shape, routes you to the right assessment workflow, and produces a lightweight entropy profile when no deeper specialization fits yet.

Today the deepest specialized path is [docs-first planning assessment](skills/docs-first-planning-assessment/), for markdown-first planning/design repos where the main artifact is evolving documentation and the main risk is repeated session drift.

You don't need to know what guards you want upfront. Start at the front door unless you already know you're in the docs-first planning case.

**To assess a system**: point an AI agent at the front-door assessment skill and your target project.

```
Read skills/entropy-assessment/SKILL.md from the entropy-guard repo,
then assess [your project path] for entropy risks.
```

The front door classifies the repo and sends docs-first planning repos to the specialized workflow. That workflow produces a standalone entropy report, a canonical truth map, a compact current-state packet for fresh sessions, and guard recommendations.

**If you already know the repo is docs-first planning**: go straight to the specialized skill.

```
Read skills/docs-first-planning-assessment/SKILL.md from the entropy-guard repo,
then assess [your project path], produce a current-state packet,
and generate or refine a delta guard.
```

It also closes the loop on the skill itself: if the assessment misfires or creates avoidable friction, the final step is to capture a short upstream feedback note so the heuristic can improve.

**To generate guards**: if you want to go further, the specialized assessment continues into guard generation or refinement — producing a delta guard skill file you place in the target project's skills directory, or targeted amendment guidance for the guard you already have, along with first-pass advice on how to integrate it into the workflow you already use.

```
Read skills/docs-first-planning-assessment/SKILL.md from the entropy-guard repo,
then assess [your project path], produce a current-state packet,
and generate or refine the entropy guard.
```

**To integrate generated guards into a real loop**: run the [guards integrator](skills/guards-integrator/) skill after guard generation when you want a sharper recommendation about how those guards should fit an existing agent, commit, PR, or CI workflow.

```
Read skills/guards-integrator/SKILL.md from the entropy-guard repo,
then examine [your project path] and the generated guards,
and recommend how those guards should be integrated into the current iteration loop.
```

### Use it as a reference in discussions

Point an agent at this repo when discussing system quality, documentation drift, or process design. The frameworks here — entropy dimensions, enforcement depth, inter-domain drift — provide shared vocabulary for thinking about how systems decay and what to do about it.

Key starting points:
- [INTENT.md](INTENT.md) — the five entropy dimensions, enforcement depth spectrum, inter-domain drift model
- [LEARNINGS.md](LEARNINGS.md) — validated insights from applying these ideas to real systems

### Adapt the project's own guard

This project runs its [own entropy guard](skills/local/entropy-guard/) before every commit — a post-work micro-ritual backed by a non-blocking local reminder hook in [`.githooks/pre-commit`](.githooks/pre-commit). The guard checks decision capture, workflow/practice alignment, internal consistency, stale references, and honest state. It's a concrete example of what the generator produces and how a guard can mature from manual instructions to prompted workflow support.

---

## What's here

### Skills (exportable)

| Skill | Purpose |
|-------|---------|
| [entropy-assessment/](skills/entropy-assessment/) | Start here — front door that classifies the system shape, routes to deeper assessment workflows, and provides a lightweight fallback profile when no specialized path fits yet |
| [docs-first-planning-assessment/](skills/docs-first-planning-assessment/) | Deep path for markdown-first planning/design repos — assesses canonical truth structure, produces a current-state packet, and generates or refines docs/workflow delta guards |
| [guards-integrator/](skills/guards-integrator/) | Maps generated guards into a system's existing iteration loop (agent, commit, PR, CI, release) and prompts for upstream feedback if the integration guidance itself misfires |

### Skills (local to this project)

| Skill | Purpose |
|-------|---------|
| [entropy-guard/](skills/local/entropy-guard/) | Post-work micro-ritual — a reference example of generator output for a docs + workflow-heavy repo |
| [entropy-guard-feedback/](skills/local/entropy-guard-feedback/) | Create a GitHub issue on the entropy-guard repo to report a problem or suggestion about the tool itself |

### Frameworks and thinking

| Document | Purpose |
|----------|---------|
| [INTENT.md](INTENT.md) | Living intent statement — entropy dimensions, enforcement depth, inter-domain drift |
| [PHILOSOPHY.md](PHILOSOPHY.md) | Free-form reflections on entropy, self-awareness, and system design |
| [DECISIONS.md](DECISIONS.md) | Architectural decisions with context and rationale |
| [LEARNINGS.md](LEARNINGS.md) | Validated discoveries from building and using guards |

### Project operations

| Document | Purpose |
|----------|---------|
| [AGENTS.md](AGENTS.md) | Working practices for contributors (human and AI) |
| [`.githooks/pre-commit`](.githooks/pre-commit) | Non-blocking local reminder hook for running the repo's entropy guard before commit |
| [TODO.md](TODO.md) | Active work tracking |

---

## Project status

Actively evolving. The project's strongest validated use case is now docs-first planning repos: markdown-first systems where evolving design docs, decision logs, handoff docs, and agent instructions need to stay coherent across repeated sessions. This repo's own guard remains the main reference example.

The repo is now deliberately narrower in scope than the exploratory work that spawned it. `entropy-guard` focuses on making the assessment / guard workflow useful, repeatable, and externally validated, starting with docs-first planning systems before broadening further. Broader conceptual exploration has been farmed off into the sibling `entropy-immune-system` repo.

The next concrete phase here is external validation on a larger set of docs-first planning repos: run the specialized assessment, generate or refine guards, use the current-state packet at session start, run those guards locally while making targeted improvements, and see whether that yields clearer sessions, fewer reintroduced stale ideas, and more useful changes in the wild.

See [TODO.md](TODO.md) for current priorities.

---

## Contributing

Read [AGENTS.md](AGENTS.md) for working practices. The short version:

1. Check [TODO.md](TODO.md) for what's active
2. Do your work
3. Run [skills/local/entropy-guard/](skills/local/entropy-guard/) before committing (the local reminder hook nudges, but does not block)
4. Commit with a brief note of what the entropy check surfaced (or "entropy check clean")

To enable the reminder in a fresh clone, symlink [`.githooks/pre-commit`](.githooks/pre-commit) to `.git/hooks/pre-commit`.
