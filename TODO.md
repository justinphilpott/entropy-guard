# TODO

Lightweight task tracking for early development. Graduate to an issue tracker (GitHub Issues, Linear, etc.) once the project has momentum.

## Doing Now

[empty]

## Next Up

- [ ] Build an external validation batch: choose a larger set of open source projects to assess with `entropy-assessment`
- [ ] Generate or refine guards for those projects, run them locally while making targeted improvements, and track what merges
- [ ] Use the results to refine the assessment and integration guidance based on real-world hits, misses, and friction

## Backlog

- [ ] Test the assessment skill against a real multi-domain system (codebase with tests, docs, and API) — the dogfooding test covered docs-only; need to validate guard generation across multiple domains and cross-domain coordination
- [ ] Design a **guard runner** concept — a wrapper (script, CI step, or skill) that discovers all guards registered for a system and runs them at the correct handoff point. Distinct from the generator/evaluator (which decides what guards are needed) and the integrator (which maps guards into the workflow). The runner is the operational tool; the generator is the design tool.
- [ ] Consider additional domain appendices (config/infrastructure)
- [ ] Create `doc-health-check` skill (referenced in local/entropy-guard/SKILL.md but doesn't exist yet)
