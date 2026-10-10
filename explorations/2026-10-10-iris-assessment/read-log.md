# Read log

Each file read, in order, with the skill step that sent me there. Paths under `target/` are relative to
`/tmp/claude-1000/-home-justin-philpott-pro-entropy-guard/335a8e5b-97c6-4579-9aa5-94cefea81c71/scratchpad/iris-run/target/`.
Skill paths are under `~/.claude/skills/`.

| # | File | Sent by |
|---|---|---|
| 1 | entropy-assessment/SKILL.md | Task brief: "start here" |
| 2 | entropy-assessment/intent-pass.md | entropy-assessment Step 1 |
| 3 | entropy-assessment/intent-change-rule.md | intent-pass.md (header and Section 1, "Read every existing guard's repair instructions against intent-change-rule.md") |
| 4 | entropy-assessment/mixed-profile.md | entropy-assessment Step 2, shapes B/C/D (read ahead to choose the route) |
| 5 | docs-first-planning-assessment/SKILL.md | entropy-assessment Step 2, shape A, and the rule for a docs-first member repo under B/C/D |
| 6 | session-coherence-skill-generator/SKILL.md | entropy-assessment Step 3/4 (guard decision, generator's inputs) |
| 7 | session-coherence-skill-generator/bootstrap.md | entropy-assessment Step 2 shape E and Step 3 `bootstrap` (read to rule it in or out) |
| 8 | guards-integrator/SKILL.md | session-coherence-skill-generator Step 7 handover (read ahead) |
| 9 | target/scope-orchestration-lab/README.md | entropy-assessment Step 1 / intent-pass §1 Gather (top-level documents) |
| 10 | target/scope-orchestration-lab/AGENTS.md (CLAUDE.md is a symlink to it; compared) | intent-pass §1 (agent instruction files); docs-first Step 3 (real loop) |
| 11 | target/scope-orchestration-lab/SCOPE.md | intent-pass §1 (purpose, authority) |
| 12 | target/scope-orchestration-lab/STATE.md | intent-pass §1 (state files); docs-first Step 3 and Step 5 (the state file read first) |
| 13 | target/scope-orchestration-lab/scope.yaml | intent-pass §1 (steward, purpose) |
| 14 | target/orchestrator/AGENTS.md | intent-pass §1; mixed-profile "Drift between domains" (reach claims) |
| 15 | target/orchestrator/README.md | intent-pass §1 (direction); mixed-profile "Docs against implementation" |
| 16 | target/orchestrator/OPERATOR.md | mixed-profile "Docs against docs"; docs-first Step 4 (superseded material nearby) |
| 17 | target/orchestrator/SECURITY-REVIEW.md | mixed-profile "Rules against enforcement"; generator inputs (rules owned elsewhere) |
| 18 | target/orchestrator/docs/GLOSSARY.md | intent-pass §1 (steward-agreed names); docs-first Step 2 (truth map) |
| 19 | target/orchestrator/.github/workflows/danger.yml, pr-names-issue.yml, release.yml | mixed-profile "Workflow against reality" (read what CI steps run); integrator Inputs |
| 20 | target/orchestrator/.githooks/checkout-moved, post-checkout, pre-push, reference-transaction; .github/pull_request_template.md | mixed-profile "Workflow against reality" (tracked hook folders); integrator Inputs (PR templates) |
| 21 | target/orchestrator/dangerfile.js | mixed-profile "Workflow against reality"; "Existing guard surfaces" |
| 22 | target/orchestrator/package.json, .changeset/README.md, .changeset/config.json | mixed-profile "Docs against implementation" (Pi pin, commands); generator inputs (verification commands) |
| 23 | target/scope-orchestration-lab/.githooks/pre-push, .claude/settings.json; listing of memory/, decisions/, skills/, workflows/ | mixed-profile "Workflow against reality"; integrator Inputs |
| 24 | target/scope-orchestration-lab/memory/core-and-scopes.md | intent-pass §1 (decision records); docs-first Step 2 |
| 25 | target/scope-orchestration-lab/memory/authority-rules-step-1.md, memory/central-scope.md | intent-pass §1 (decisions); mixed-profile "Existing guard surfaces" (decided, not built) |
| 26 | target/scope-orchestration-lab/memory/slots-run-walkthrough.md (first 30 lines); decisions/2026-09-17-async-work-architecture.md (first 40 lines); FRICTION.md headings | intent-pass §1; docs-first Step 2 (roles) |
| 27 | target/scope-orchestration-lab/FRICTION.md lines 1-230, 829-875, 1103-1118 | integrator Inputs (known pain); docs-first Step 4 (symptoms seen); intent-pass §1 (steward quotes) |
| 28 | target/scope-orchestration-lab/tools/map.mjs (header, lines 200-410) | mixed-profile "Workflow against reality" (what the map check runs); docs-first Step 4 (brittle automation) |
| 29 | git -C ~/scopes/scope-orchestration-lab log/show for STATE.md (e77500a, 0c28182, ecd6d59), blame of AGENTS.md | intent-pass §1 (search commit messages; steward decision found only in an overwritten state file) |
| 30 | target/scope-orchestration-lab/tools/collect.mjs (header), tools/report.mjs (header, grep) | mixed-profile "Workflow against reality" (declared daily diary) |
| 31 | git -C ~/pro/orchestrator log a694039 (cadence, 25 latest commits) | docs-first Step 3 (real loop); intent-pass §2 (enacted) |
| 32 | target/orchestrator src/, web/src, config, scripts file listing | mixed-profile "Domains" |
| 33 | grep for bookwhen across orchestrator; test/architecture.test.ts lines 55-110, 975-1050, 1440-1490; config/installation.ts (header, connectors, lines 65-71); git log for src/bookwhen.ts deletion | mixed-profile "Docs against implementation" and "What the system reaches" (pattern search) |
| 34 | src/adapters/browser/playwright.ts (header, lines 46-90, 516-530), src/adapters/browser/index.ts (grep), src/adapters/public-web/search-providers.ts (header), src/adapters/public-web/connector.ts (header), src/adapters/phone/index.ts (header), src/diagnostics.ts (header) | mixed-profile "What the system reaches, launches or stores" (including delegated behaviour: a library that starts a browser) |
| 35 | pattern searches over src/ and config/ for subprocess, network and credential reads; src/adapters/orc-service.ts (lines 100-130, run() calls); src/adapters/scope-credentials.ts (header); src/web-cli.ts (lines 505-530, 575-590) | mixed-profile "What the system reaches" (record patterns, paths, hits) |
| 36 | src/core/front-door.ts (lines 1-40), src/tools.ts (exports, lines 387-400, 790-870), src/runtime.ts (lines 283-360), git log for the memory tools | mixed-profile "Docs against implementation" (parent tool list) and "Tests against implementation" |
| 37 | scripts/update-pi.mjs (lines 1-40); git log -S'0.82.1' | mixed-profile "Docs against implementation" (Pi pin) |
| 38 | git log for OPERATOR.md; git show 470e531; target/scope-orchestration-lab/reports/2026-10-07-refactor-review-claude.md lines 128-145; reports/archive/orchestrator/README.md | docs-first Step 4 (superseded material nearby); intent-pass §3 (Justin's 8 Oct archive instruction) |
| 39 | grep of lab reports for bookwhen.ts, #144, #180, #60, #196, #209 in reports/2026-10-09-issue-map-scan.md (lines 1-40 and matched rows); reports/2026-10-08-codebase-layout-plan.md line 412; reports/2026-10-01-design-review.md lines 176-178 | mixed-profile "Existing guard surfaces" (connect gaps to existing issues and decisions) |
| 40 | grep for entropy references; reports/2026-10-10-scheduled-agent-design.md lines 170-200 | entropy-assessment Step 3 (does a guard exist or is one decided) |
| 41 | grep for STATE-only decisions (merge grants, live install, the pause) | intent-pass §5 (steward decision found only in an overwritten state file) |
| 42 | reports/2026-09-25-direction-review.md (first 20 lines); reports/2026-09-30-priorities.md (first 30 lines); git show ecd6d59 | intent-pass §1-2 (authorised purpose and its source) |
| 43 | git log/show 5aeecdc (phone connector), git log -S for AGENTS.md lines, git diff 02d6e3c..a694039 (10 Oct evening session) | intent-pass §3 (stale description vs later decision); integrator Step 5 (trial of the checks) |
| 44 | scripts/rights.ts, approval-grants.ts, spend-allowances.ts, rehearse.ts, orc-service.ts (headers); src/app/own-cards.ts (header); grep of card kinds | mixed-profile "Rules against enforcement" (Danger's guarded paths); "Docs against implementation" (card kinds) |
| 45 | src/core/child-agent-process.ts (header), src/compose/isolated-run.ts (header); git log for web_search reinstatement | mixed-profile "Docs against implementation" (README intro and "Use") |
| 46 | `command -v` for lychee, ast-grep, semgrep, rg, ctxlint, agnix, gh, wt, node, pnpm | mixed-profile "Check that a tool is installed before a guard depends on it" |
| 47 | git show of `.changeset/archive-root-reports.md` (470e531) and `.changeset/glossary-iris-app-agent.md` (ef52c23) | generator Step 6 ("any checks the repo implies"): the form an empty changeset takes, so the orchestrator patches pass Danger |
| 48 | src/app/agent-packages.ts lines 787-801 (`resolveConnectorCredentials`); config/installation.ts line 43 | "Every correction is limited by its evidence": checking the full scope of the README credential claim before replacing it |
| 49 | git diff 02d6e3c..a694039 for README.md, scripts/, web/src (stat) | guards-integrator Step 5 (a trial reading of the checks on the 10 Oct evening session) |
| 50 | grep of line numbers in memory/central-scope.md, memory/core-and-scopes.md, orchestrator AGENTS.md, scripts/orc-service.ts, tools/report.mjs, tools/map.mjs | entropy-assessment "Never cut ... where a claim came from": verifying each citation in `assessment.md` |
| 51 | The guard's two reach-search commands, run on the read-only orchestrator copy | mixed-profile "Mechanical checks belong to tools": checking a command works before a guard depends on it |

Outputs written (not reads): `assessment.md`, `guard/SKILL.md`, `integration.md`, `questions.md`, `skills-feedback.md`,
`settled-orchestrator.patch`, `settled-lab.patch`, `provisional-Q1-guard-home-lab.patch`,
`provisional-Q1-guard-home-orchestrator.patch`, `provisional-Q2-pace-lab.patch`, `provisional-Q2-pace-orchestrator.patch`,
`provisional-Q4-state-size-lab.patch`. Every patch was applied, in order, to scratch copies of the two snapshots
(`git apply`), never to the copies or the live repositories.
