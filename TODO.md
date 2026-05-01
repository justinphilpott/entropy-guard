# TODO

Lightweight task tracking for early development. Graduate to an issue tracker (GitHub Issues, Linear, etc.) once the project has momentum.

## Doing Now

[empty]

## Next Up

- [ ] Build an external validation batch: choose a larger set of docs-first planning / architecture / blueprint repos to assess through `entropy-assessment` and `docs-first-planning-assessment`
- [ ] Generate or refine guards for those projects, use the current-state packet at session start, run the guards locally while making targeted improvements, and track what changes prove useful
- [ ] Use the results to refine the docs-first planning assessment, the current-state packet output, and the integration guidance based on real-world hits, misses, and friction

## Backlog

- [ ] Test the assessment workflow against a real multi-domain system (codebase with tests, docs, and API) — the docs-first planning path is now stronger; need to validate the front door and fallback guidance against a repo with multiple active domains
- [ ] Design a **guard runner** concept — a wrapper (script, CI step, or skill) that discovers all guards registered for a system and runs them at the correct handoff point. Distinct from the generator/evaluator (which decides what guards are needed) and the integrator (which maps guards into the workflow). The runner is the operational tool; the generator is the design tool.
- [ ] Consider additional specialized tracks after docs-first planning validation (code-first, config/infrastructure, or other recurring repo shapes)
- [ ] Create `doc-health-check` skill (referenced in local/entropy-guard/SKILL.md but doesn't exist yet)
