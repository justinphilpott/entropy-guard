# TODO

Lightweight task tracking for early development. Graduate to an issue tracker (GitHub Issues, Linear, etc.) once the project has momentum.

## Doing Now

[Write what you're working on before you start. Include enough context to resume if interrupted. When done, use these items to write your commit message, then clear this section.]

## Next Up

- [ ] Test the assessment skill against a real multi-domain system (codebase with tests, docs, and API) — the dogfooding test covered docs-only; need to validate guard generation across multiple domains and cross-domain coordination

## Backlog

- [ ] Design a **guard runner** concept — a wrapper (script, CI step, or skill) that discovers all guards registered for a system and runs them at the correct handoff point. Distinct from the generator/evaluator (which decides what guards are needed). The runner is the operational tool; the generator is the design tool.
- [ ] Consider additional domain appendices (process/workflow, config/infrastructure)
- [ ] Create `doc-health-check` skill (referenced in local/entropy-guard/SKILL.md but doesn't exist yet)
