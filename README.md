# entropy-guard

A collaborative research and development project exploring **entropy guards** — skills, rituals, and processes that keep iterated systems from drifting, losing coherence, or forgetting their purpose.

Both humans and AI agents contribute here.

---

## What is an entropy guard?

Systems that undergo repeated change — especially AI-assisted change — tend to accumulate entropy: stale docs, forgotten decisions, internal inconsistencies, drift from original intent. An entropy guard is a lightweight, targeted mechanism applied at each iteration to prevent this drift before it compounds.

A guard is not a full audit. It is scoped to what changed in this iteration, takes 2–10 minutes, and preserves the things that matter most: continuity of intent, internal consistency, accumulated knowledge, and honest self-representation.

See [INTENT.md](INTENT.md) for a more precise definition of what entropy means here and what guards should preserve.

---

## What this project does

- **Develops and refines the meta-skill** ([skills/meta-guard.md](skills/meta-guard.md)) — a process for analyzing any system and designing an entropy guard appropriate to it
- **Maintains a library of guards** ([guards/](guards/)) — system-specific guard skill files developed and evaluated over time
- **Records the thinking** — decisions, learnings, and philosophical reflections that emerge from the work
- **Practices what it preaches** — this project runs [skills/entropy-guard.md](skills/entropy-guard.md) before every commit

---

## Key documents

| Document | Purpose |
|----------|---------|
| [INTENT.md](INTENT.md) | Living intent statement — north star for all guard design |
| [PHILOSOPHY.md](PHILOSOPHY.md) | Free-form musings — humans and agents write here |
| [guards/README.md](guards/README.md) | Guards library index and evaluation criteria |
| [skills/entropy-guard.md](skills/entropy-guard.md) | The post-work micro-ritual; run before every commit |
| [skills/meta-guard.md](skills/meta-guard.md) | Meta-skill for analyzing systems and designing guards |
| [DECISIONS.md](DECISIONS.md) | Architectural decisions |
| [LEARNINGS.md](LEARNINGS.md) | Validated discoveries |
| [AGENTS.md](AGENTS.md) | Working practices for contributors (human and AI) |

---

## How to contribute

Read [AGENTS.md](AGENTS.md) for working practices. The short version:

1. Check [TODO.md](TODO.md) for what's active
2. Do your work
3. Run [skills/entropy-guard.md](skills/entropy-guard.md) before committing
4. Commit with a brief note of what the entropy check surfaced (or "entropy check clean")

To add a guard to the library: run [skills/meta-guard.md](skills/meta-guard.md) against a target system and follow the output instructions.

To add a philosophical reflection: open [PHILOSOPHY.md](PHILOSOPHY.md) and write freely.
