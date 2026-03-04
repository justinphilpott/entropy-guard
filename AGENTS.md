# Agent Context for entropy-guard

A collaborative research and development project exploring entropy guards — skills, rituals, and processes that keep iterated systems from drifting, losing coherence, or forgetting their purpose. See [INTENT.md](INTENT.md) for the full intent statement. Both humans and AI agents contribute here.

## Quick Links

- [README.md](README.md) - Project overview
- [INTENT.md](INTENT.md) - Living intent statement (north star)
- [PHILOSOPHY.md](PHILOSOPHY.md) - Philosophical musings
- [TODO.md](TODO.md) - Active work
- [DECISIONS.md](DECISIONS.md) - Key decisions
- [LEARNINGS.md](LEARNINGS.md) - Validated discoveries
- [skills/](skills/) - Skills

## Working Practices

- **Run entropy-guard before committing**: After any meaningful work session, run `skills/local/entropy-guard/SKILL.md` before committing. This is the primary mechanism for keeping this project coherent. Skip only for trivial changes (typos, minor formatting). This is non-negotiable — it takes 2–5 minutes and is the whole point of this project practicing what it preaches.
- **Small, atomic commits**: One logical change per commit. If you can't summarise it in a sentence, break it up
- **Commit early, commit often**: Working code with tests beats perfect code in progress. Small commits are easy to review, revert, and understand in git log
- **TODO.md as live context**: Before starting work, write what you're doing in TODO.md's "Doing Now" section — enough detail to resume if interrupted or context is lost. When the work is complete, derive your commit message from those items, then clear the section
- **Docs travel with code**: If a change affects how the project works, update the relevant docs in the same commit — not later
- **Check coherence before committing**: Skim project docs and verify they still agree with each other and with the code. Fix drift immediately — it compounds fast
- **Capture learnings**: When you discover something non-obvious — a gotcha, a pattern that works, a workaround — add it to LEARNINGS.md. If it's not worth writing down, it wasn't a real learning
- **Prune ruthlessly**: Replace placeholders with real content as soon as you can, or delete them. Stale scaffolding is worse than no scaffolding
- **Consult INTENT.md for significant decisions**: Before any substantial design or structural choice, check INTENT.md to ensure alignment. If a decision refines or challenges the intent, update INTENT.md and note why.

## Project Constraints

[Add constraints as they emerge - e.g., dependencies, patterns, non-obvious rules]

## Key Files

- [INTENT.md](INTENT.md) — the living intent statement; north star for the meta-skill and all guard design. Consult before any significant design work.
- [PHILOSOPHY.md](PHILOSOPHY.md) — open-ended philosophical musings; humans and agents both contribute freely
- [skills/local/entropy-guard/](skills/local/entropy-guard/) — mandatory pre-commit ritual; run after every meaningful work session
- [skills/entropy-assessment/](skills/entropy-assessment/) — start here to assess a system's entropy risks and generate domain-specific guards (docs, code, tests, API)

## Commands

[Add build, test, and run commands as they emerge]


## Testing

[Add test conventions and how to verify changes]

## Maintaining These Docs

When adding/removing source files or changing architecture, update:
- The **Key Files** section above
- Any affected sections in linked docs

## Scaffolding Feedback

This project was scaffolded by [seed](https://github.com/justinphilpott/seed). If you notice gaps in the scaffolding — missing template sections, working practices that don't fit, or ideas for improvement — feed them back to the seed project.
