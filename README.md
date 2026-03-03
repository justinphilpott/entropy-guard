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

- **Develops and refines guard generator skills** ([skills/entropy-guard-generator/](skills/entropy-guard-generator/)) — an entry-point skill that assesses systems and routes to domain-specific generators (docs, test, code, API) to produce tailored entropy guards
- **Records the thinking** — decisions, learnings, philosophical reflections, and [articles](articles/) distilled from project conversations
- **Practices what it preaches** — this project runs [skills/entropy-guard/](skills/entropy-guard/) before every commit

---

## Key documents

| Document | Purpose |
|----------|---------|
| [INTENT.md](INTENT.md) | Living intent statement — north star for all guard design |
| [PHILOSOPHY.md](PHILOSOPHY.md) | Free-form musings — humans and agents write here |
| [skills/entropy-guard/](skills/entropy-guard/) | The post-work micro-ritual; run before every commit |
| [skills/entropy-guard-generator/](skills/entropy-guard-generator/) | Entry point + domain-specific guard generators (docs, test, code, API) |
| [DECISIONS.md](DECISIONS.md) | Architectural decisions |
| [LEARNINGS.md](LEARNINGS.md) | Validated discoveries |
| [articles/](articles/) | Substack-ready article drafts distilled from discussions |
| [skills/distill-article/](skills/distill-article/) | Editorial skill for extracting publishable articles from conversations |
| [AGENTS.md](AGENTS.md) | Working practices for contributors (human and AI) |

---

## How to contribute

Read [AGENTS.md](AGENTS.md) for working practices. The short version:

1. Check [TODO.md](TODO.md) for what's active
2. Do your work
3. Run [skills/entropy-guard/](skills/entropy-guard/) before committing
4. Commit with a brief note of what the entropy check surfaced (or "entropy check clean")

To generate a guard for a system: run the appropriate generator from [skills/entropy-guard-generator/](skills/entropy-guard-generator/) against the target system.

To add a philosophical reflection: open [PHILOSOPHY.md](PHILOSOPHY.md) and write freely.
