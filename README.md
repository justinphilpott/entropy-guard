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

The front door is [entropy assessment](skills/entropy-assessment/). It first runs the [intent pass](skills/entropy-assessment/intent-pass.md), which establishes what the system's steward has authorised it to be for, separately from what the docs and code currently say. It flags intent that is missing, conflicting, stale or ambiguous, settles what the evidence can settle, and asks the steward at most five questions. Then it classifies the system's shape and routes it:

- **Docs-first planning repos** go to [docs-first planning assessment](skills/docs-first-planning-assessment/), the deepest analysis path.
- **Mixed, code-first and workflow-heavy systems**, including systems spread over more than one repository, get the front door's own profile.
- **Young repos** go to the guard generator's bootstrap mode.

Every route that needs a guard ends at the [session coherence skill generator](skills/session-coherence-skill-generator/), the only skill that builds guards, and then the [guards integrator](skills/guards-integrator/).

You don't need to know what guards you want upfront. Start at the front door unless you already know you're in the docs-first planning case.

**To assess a system**: point an AI agent at the front-door assessment skill and your target project.

```
Read skills/entropy-assessment/SKILL.md from the entropy-guard repo,
then assess [your project path] for entropy risks.
```

Where the four exportable skills are installed as skills, each `skills/<name>` folder linked as one folder into the agent's skills directory (on Justin's machine, local-config's sync links them into `~/.agents/skills` and `~/.claude/skills`), ask for it by name from inside the project: "Use entropy-assessment to assess this repository for entropy risks." The skills link to each other relatively, so they resolve from either place.

The front door runs the intent pass, classifies the repo, and routes it. The docs-first workflow produces an entropy report, a canonical truth map, an up-to-date current-state file for fresh sessions, and the checks its guard needs.

**If you already know the repo is docs-first planning**: go straight to the specialized skill.

```
Read skills/docs-first-planning-assessment/SKILL.md from the entropy-guard repo,
then assess [your project path] and bring its current-state file up to date.
```

It also closes the loop on the skill itself: if the assessment misfires or creates avoidable friction, the final step is to capture a short upstream feedback note so the heuristic can improve.

**To generate guards**: carry the assessment through to the guard generator. It builds a session-end guard in the target project's `skills/` directory, or amends the guard you already have. The guard holds only durable checking policy. It points at the project's intent, state file, decision log and rules owned elsewhere, rather than copying them. It covers uncommitted work as well as commits, and when work and intent disagree it records a proposal for the steward instead of rewriting the intent.

```
Read skills/entropy-assessment/SKILL.md from the entropy-guard repo,
then assess [your project path] and carry the route through
to a generated or refined guard and integration advice.
```

**To integrate generated guards into a real loop**: run the [guards integrator](skills/guards-integrator/) skill after guard generation. It fits the guard into the existing agent, commit, PR or CI workflow, and counts the guard as adopted only once its trigger has fired and a fresh agent session has found it.

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
| [entropy-assessment/](skills/entropy-assessment/) | Start here — runs the intent pass ([intent-pass.md](skills/entropy-assessment/intent-pass.md)), classifies the system shape, routes it, and profiles mixed, code-first and workflow-heavy systems |
| [docs-first-planning-assessment/](skills/docs-first-planning-assessment/) | Analysis for markdown-first planning/design repos — maps which document owns which truth, brings the current-state file up to date, and supplies the docs-first checks to the generator |
| [session-coherence-skill-generator/](skills/session-coherence-skill-generator/) | The only guard builder — generates or amends a repo's session-end guard from an assessment's findings, or bootstraps minimal context-preservation files for young repos |
| [guards-integrator/](skills/guards-integrator/) | Fits guards into a system's existing iteration loop (agent, commit, PR, CI, release) and verifies they are actually adopted |

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

Actively evolving. The project's strongest validated use case is docs-first planning repos: markdown-first systems where evolving design docs, decision logs, handoff docs, and agent instructions need to stay coherent across repeated sessions. The October 2026 revision (see `explorations/2026-10-04-skills-review-synthesis.md`) added the intent pass, made one skill the guard builder, and added routes for mixed and multi-repository systems ahead of assessing ORC. This repo's own guard remains the main reference example.

The repo is now deliberately narrower in scope than the exploratory work that spawned it. `entropy-guard` focuses on making the assessment / guard workflow useful, repeatable, and externally validated, starting with docs-first planning systems before broadening further. Broader conceptual exploration has been farmed off into the sibling `entropy-immune-system` repo.

The next concrete phase is assessing ORC, Justin's orchestration system, together with the lab Scope that manages it, then continuing external validation on more repos. Each revision of the skills is checked against the known-answer cases in `explorations/2026-10-04-skills-revision-eval.md`.

See [TODO.md](TODO.md) for current priorities.

---

## Contributing

Read [AGENTS.md](AGENTS.md) for working practices. The short version:

1. Check [TODO.md](TODO.md) for what's active
2. Do your work
3. Run [skills/local/entropy-guard/](skills/local/entropy-guard/) before committing (the local reminder hook nudges, but does not block)
4. Commit with a brief note of what the entropy check surfaced (or "entropy check clean")

To enable the reminder in a fresh clone, run `git config core.hooksPath .githooks`. (A relative symlink from `.git/hooks/pre-commit` to `.githooks/pre-commit`, which this line used to suggest, resolves inside `.git/hooks/` and silently never runs.)
