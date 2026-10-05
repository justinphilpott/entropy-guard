# Canonical truth map: ORC and the Orchestration Lab

Built from read-only snapshots read on 2026-10-04: ORC at `~/pro/orchestrator` and the lab at
`~/scopes/scope-orchestration-lab`. GitHub was not read, local-config was not read, and git history was not
available.

**How to read it.** Each row gives:

- the concept;
- where it should live once ("canonical");
- what else mentions it, and whether that mention is a link or summary (fine) or an independent copy (drift);
- the status.

## Live system truth

| Concept | Canonical home | Other mentions | Status |
|---|---|---|---|
| Which build ORC runs, since when, whether it is healthy | the live service: `pnpm service:status` in ORC's checkout; `journalctl --user -u orc.service` | lab `STATE.md` mirrors it | **drift**: STATE gives two different answers (`369628b` since 3 Oct 22:12:47, and restarts on 4 Oct up to `8cee662` at 14:48:27) |
| ORC's authority boundaries: subprocess, network, tool surface, Bookwhen out of core | `test/architecture.test.ts` (enforced) | ORC `AGENTS.md` "Boundaries" (description); `README.md` "Boundary"; `SECURITY-REVIEW.md` (questions, not facts) | **drift**: `AGENTS.md` names the missing `src/bookwhen.ts` and leaves out `src/adapters/orc-service.ts`; README's Boundary predates packages, grants and the browser |
| Paths that need a security review | `dangerfile.js` `GUARDED` list | PR template and `SECURITY-REVIEW.md` point to it | fine (linked) |
| Package API | `src/package-api.ts` plus `src/package-api.api.md` (with a test); version in `src/core/agents/package.ts` | ORC `AGENTS.md` "Security review" describes the procedure | fine |
| Core ties (no Scope, model, owner or agent in core) | `test/core-ties.ts` counts | ORC `AGENTS.md` keeps a 13 Sep baseline, labelled as dated | fine (dated, not restated as current) |
| What each source file owns | that file's TSDoc header (`Owns:` / `Never:` / `Today:`); `pnpm codemap` prints them all | none | presence is enforced; **`Today:` lines can go stale** (e.g. `src/core/iris.ts` "until slice 3b") |
| ORC setup, run, service, credentials | ORC `README.md` "Run" and "As a service" | ORC `AGENTS.md` repeats the service rules for agents | **drift** in Run: the `ORCHESTRATOR_BOOKWHEN_API_TOKEN` paragraph |
| ORC's durable-work database schema and state directory | ORC `src/adapters/async-store/sqlite.ts`; `src/runtime.ts` (`ORCHESTRATOR_STATE_DIR`, default `~/.local/share/orchestrator`) | lab `tools/collect.mjs` hard-codes `~/.local/share/orchestrator-proof` and the table and column names | **independent copy**, undeclared, fails silently |

## Work, intent and decisions

| Concept | Canonical home | Other mentions | Status |
|---|---|---|---|
| Open work and where each issue sits | GitHub, the map rooted at orchestrator#140 (GitHub Project 4 shows it) | STATE "Next" and "Waiting on Justin" summarise it; ORC labels are a second, older system (`reports/2026-10-04-issue-map-overview.md`) | mostly fine; labels partly stale (decision pending on Astra's revisions) |
| Rules for the map | #140's description (not read) | both `AGENTS.md` files link to it | fine (linked) |
| Current state of the work | lab `STATE.md` | Moving Stillness has its own `STATE.md`, dated 25 Sep and stale per the 29 Sep inventory (not read here) | canonical, but **dishonest in places** (assessment R1) |
| Decisions Justin has taken | **no single home.** Candidates: lab `decisions/` (1 file, 17 Sep) | STATE "Decided by Justin, 4 Oct"; quotes in both `AGENTS.md` files; code headers (`dangerfile.js`: "Justin, 2026-10-02: 'B'"); #140; `reports/*-synthesis.md`; `memory/authority-rules-step-1.md`; `~/.claude/plans/agile-booping-waffle.md` (Claude-only); local-config and `~/pro/scope` `DECISIONS.md` (not read) | **parallel truth**. Recommended: `decisions/` for lab and relationship decisions; ORC rules in ORC `AGENTS.md`; cross-project rules in local-config |
| North star (what ORC is for, in Justin's words) | should be one place: ORC `README.md` "Direction" for the product, lab `SCOPE.md` "Purpose" for the Scope | STATE "North star" | **two homes**; STATE is "current state only", so it is the wrong one |
| Working rules for agents | local-config `home/AGENTS.md` (global; not read), then the lab's `AGENTS.md`, then ORC's `AGENTS.md` | STATE "How we work" restates global rules | **restated copy**; it should link instead |
| Resources of the Scope | `scope.yaml` | `SCOPE.md` gives one line per project | fine |
| Where a learning goes | lab `AGENTS.md` table | none | fine; practice differs (ORC product learnings live only in lab `FRICTION.md`) |
| The generic Scope model | `~/pro/scope/docs/MODEL.md` (not read) | `SCOPE.md` links to it | fine (linked) |

## Learning, history and reference

| Concept | Canonical home | Other mentions | Status |
|---|---|---|---|
| What real use taught | lab `FRICTION.md` (newest first) | ORC `README.md` "Use" (scored uses up to 10 Sep) | fine; FRICTION's order is broken for 11–19 Sep |
| Agent, tool and skill ideas | lab `AGENT_IDEAS.md` | `reports/2026-09-30-agent-ideas-review.md` | fine; two adjacent entries ("Product search agent, tool, or skill" and "Product search agent") overlap |
| Reviews, prior art, syntheses | lab `reports/` (dated, history by convention) | STATE "Of record" names the current ones | fine as a convention |
| ORC task reports (18–21 Sep, plus `MCP.md`) | **history**, not guidance | 12 files at ORC's root beside `README.md` and `AGENTS.md` | **sitting next to live docs without demotion**; 10 references to removed files |
| How one run works end to end | lab `memory/slots-run-walkthrough.md` (28 Sep) | none | fine, dated |
| Glossary | none on `main` (`docs/GLOSSARY.md` is in unmerged orchestrator#106) | none | **missing**: "async" and "durable work" are one concept; "grant" means three things |
| Daily progress record | `tools/report.mjs` writes `status.html` and `reports/<date>.json` (generated) | none | **stale since 2 Oct 08:45 UTC** |
| Skills for this Scope's agents | lab `skills/` (empty, `.gitkeep`) | `reports/2026-09-30-skills-one-home.md` says each Scope keeps its own `skills/` | fine; this is where the new guard goes |
