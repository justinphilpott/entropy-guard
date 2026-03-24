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

- **Run entropy-guard before committing**: After any meaningful work session, run `skills/local/entropy-guard/SKILL.md` before committing. This is the primary mechanism for keeping this project coherent. Skip only for trivial changes (typos, minor formatting). This is non-negotiable — it takes 2–5 minutes and is the whole point of this project practicing what it preaches. This repo also ships a non-blocking reminder hook at `.githooks/pre-commit`; enable it locally by linking it to `.git/hooks/pre-commit`.
- **Small, atomic commits**: One logical change per commit. If you can't summarise it in a sentence, break it up
- **Commit early, commit often**: Working code with tests beats perfect code in progress. Small commits are easy to review, revert, and understand in git log
- **TODO.md as live context**: Before starting work, write what you're doing in TODO.md's "Doing Now" section — enough detail to resume if interrupted or context is lost. When the work is complete, derive your commit message from those items, then clear the section
- **Docs travel with code**: If a change affects how the project works, update the relevant docs in the same commit — not later
- **Check coherence before committing**: Skim project docs and verify they still agree with each other and with the code. Fix drift immediately — it compounds fast
- **Capture learnings**: When you discover something non-obvious — a gotcha, a pattern that works, a workaround — add it to LEARNINGS.md. If it's not worth writing down, it wasn't a real learning
- **Prune ruthlessly**: Replace placeholders with real content as soon as you can, or delete them. Stale scaffolding is worse than no scaffolding
- **Consult INTENT.md for significant decisions**: Before any substantial design or structural choice, check INTENT.md to ensure alignment. If a decision refines or challenges the intent, update INTENT.md and note why.

## Project Constraints

- Keep the repo markdown-first and workflow-focused; there is no application runtime in this project yet.
- Prefer updating the core knowledge docs (`README.md`, `INTENT.md`, `DECISIONS.md`, `LEARNINGS.md`, `TODO.md`) in the same change when behavior or methodology shifts.
- Exportable skills live in `skills/`; repo-local helper and ritual skills live in `skills/local/`.

## Key Files

- [INTENT.md](INTENT.md) — the living intent statement; north star for the meta-skill and all guard design. Consult before any significant design work.
- [PHILOSOPHY.md](PHILOSOPHY.md) — open-ended philosophical musings; humans and agents both contribute freely
- [`.githooks/pre-commit`](.githooks/pre-commit) — non-blocking local reminder hook for running the repo's entropy guard before commit
- [skills/local/entropy-guard/](skills/local/entropy-guard/) — mandatory pre-commit ritual; run after every meaningful work session
- [skills/local/entropy-guard-feedback/](skills/local/entropy-guard-feedback/) — local helper for turning assessment/integration feedback into upstream GitHub issues on entropy-guard
- [skills/entropy-assessment/](skills/entropy-assessment/) — start here to assess a system's entropy risks, generate domain-specific guards, and sketch how they should be integrated
- [skills/guards-integrator/](skills/guards-integrator/) — maps generated guards into the target system's real iteration loop so they get used

## Commands

- No build, test, or runtime commands yet. This repo is currently markdown-first and workflow-focused.
- Typical verification is: read affected docs, check cross-references and workflow alignment, and review `git diff` for unintended drift.


## Testing

- There is no automated test suite yet.
- Verify changes by checking that affected docs agree with each other, referenced files exist, and local skills still describe the current workflow accurately.

## Maintaining These Docs

When adding/removing source files or changing architecture, update:
- The **Key Files** section above
- Any affected sections in linked docs

## Scaffolding Feedback

This project was scaffolded by [seed](https://github.com/justinphilpott/seed). If you notice gaps in the scaffolding — missing template sections, working practices that don't fit, or ideas for improvement — feed them back to the seed project.

## entropy-guard Feedback

If you notice something about entropy-guard itself that could be better — a guard that misfired, an assessment heuristic that missed something, a skill that caused friction — capture it as part of the `entropy-assessment` upstream feedback check, then use the [entropy-guard-feedback](skills/local/entropy-guard-feedback/) helper to create a GitHub issue on the entropy-guard repository when working here.
