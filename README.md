# entropy-guard

Skills, frameworks, and resources for keeping iterated systems coherent. Designed for AI-assisted workflows where change is fast and drift is faster.

This is an evolving project — actively used, actively refined. Both humans and AI agents contribute here.

---

## What is an entropy guard?

Systems that undergo repeated change — especially AI-assisted change — accumulate entropy: stale docs, forgotten decisions, internal inconsistencies, drift from original intent. An entropy guard is a lightweight, targeted mechanism applied at each iteration to prevent this drift before it compounds.

A guard is not a full audit. It is scoped to what changed in this iteration, takes 2–10 minutes, and preserves the things that matter most: continuity of intent, internal consistency, accumulated knowledge, and honest self-representation.

See [INTENT.md](INTENT.md) for a precise definition of what entropy means here and what guards should preserve.

---

## How to use this repo

### Assess a system for entropy risks

The primary export of this repo. The [entropy assessment](skills/entropy-assessment/) skill is the start point — it inventories your system, identifies which domains are at risk, surfaces cross-domain drift, and produces an entropy profile with recommendations.

You don't need to know what guards you want upfront. The assessment figures that out with you.

**To assess a system**: point an AI agent at the assessment skill and your target project.

```
Read skills/entropy-assessment/SKILL.md from the entropy-guard repo,
then assess [your project path] for entropy risks.
```

The assessment walks through intent, domain mapping, drift analysis, and recommendations. It produces a standalone entropy report — useful on its own for understanding where a system is drifting.

**To generate guards**: if you want to go further, the assessment continues into guard generation — producing domain-specific guard skill files you place in your project's skills directory, along with first-pass advice on how to integrate them into the workflow you already use.

```
Read skills/entropy-assessment/SKILL.md from the entropy-guard repo,
then assess [your project path] and generate entropy guards.
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

This project runs its [own entropy guard](skills/local/entropy-guard/) before every commit — a post-work micro-ritual that checks for decision capture, internal consistency, stale references, and honest state. It's a concrete example of what the generator produces and can be adapted directly for documentation-heavy or knowledge-management projects.

---

## What's here

### Skills (exportable)

| Skill | Purpose |
|-------|---------|
| [entropy-assessment/](skills/entropy-assessment/) | Start here — assesses systems for entropy risks, produces profiles, generates domain-specific guards, and gives first-pass integration advice |
| [guards-integrator/](skills/guards-integrator/) | Maps generated guards into a system's existing iteration loop (agent, commit, PR, CI, release) |

### Skills (local to this project)

| Skill | Purpose |
|-------|---------|
| [entropy-guard/](skills/local/entropy-guard/) | Post-work micro-ritual — a reference example of generator output |
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
| [TODO.md](TODO.md) | Active work tracking |

---

## Project status

Actively evolving. The assessment skill has been used against this project itself (dogfooding) and the guard it produced is in daily use. Domain-specific knowledge for docs, code, test, and API guards is built into the skill as reference appendices.

See [TODO.md](TODO.md) for current priorities.

---

## Contributing

Read [AGENTS.md](AGENTS.md) for working practices. The short version:

1. Check [TODO.md](TODO.md) for what's active
2. Do your work
3. Run [skills/local/entropy-guard/](skills/local/entropy-guard/) before committing
4. Commit with a brief note of what the entropy check surfaced (or "entropy check clean")
