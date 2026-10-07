# Questions for the steward

No steward was available during this run. Each question below has the answer I recommend, and the run went ahead on that recommendation. They are ordered by how much they would change the outputs if answered differently.

## Q1. When was agentic-architecture made reference-only, and is that permanent?

- **Why it matters:** the banner at the top of `README.md` and `AGENTS.md` is undated and has no `DECISIONS.md` entry. Without a date, nobody can tell which docs were written before retirement. Without "permanent", the guard cannot know whether to block design work.
- **Recommended answer:** permanent until a later dated decision lifts it. Record it as a `DECISIONS.md` entry dated with the commit that added the banner (or today's date if that is unknown). The entry names the successors (`../personal-agent` for Personal Agent architecture, `../../scope` for the Scope/Project model) and says the open-question registry is frozen.
- **Proceeded on:** permanent; date unknown. The guard checks for the entry but works from the banners until it exists.

## Q2. What changes may still be made in this repo?

- **Why it matters:** the guard's mode gate (check 0) needs an allowed list. The banner only says "do not extend or reinterpret … without explicit authorization".
- **Recommended answer:** allowed without asking:
  - status headers and historical framing
  - successor pointers
  - harvest records
  - fixes to broken references or to factual errors about what was decided
  - typos

  Anything that adds or changes design needs a dated `DECISIONS.md` authorisation.
- **Proceeded on:** that list.

## Q3. Should the live-state documents be rewritten, or just marked historical?

- **Documents in question:** `ROADMAP.md`, `components.yaml`, `components/scope/TODO.md`, `components/scope/PLAN.md`, `components/orchestrator/TODO.md`, `components/orchestrator/PLAN.md`, `SCOPES_PLANNED.md`, `RUNTIME.md`, `AUTH_OPTIONS_ANALYSIS.md`, and the two component design skills.
- **Recommended answer:** mark them; do not rewrite. One header line each, linking to the Q1 entry. That is about 11 one-line edits, and it keeps the record intact for anyone harvesting from it. It also matches the repo's own rule: "update or mark the older material superseded in the same change".
- **Proceeded on:** header-demotion (bootstrap B2).

## Q4. Where should the record of what has been harvested into the successors live?

- **Why it matters:** run 001-003 findings (Pi event types as the v0 event-log schema, `roles/` missing from the scope template, the reference-vs-live role copy drift) were never promoted. If they move to a successor, nothing here records it.
- **Recommended answer:** a "Harvest status" section in `runs/README.md`, one line per item: source, destination or "dropped", date. The successor repos' `DECISIONS.md` entries cite the source file and dated entry here. That is one index here and the content there, not two copies.
- **Proceeded on:** that layout (bootstrap B5; guard check 4).

## Q5. Who owns the temporal coordinator V0 contract now?

- **Why it matters:** `components/temporal-coordinator/SPEC.md` calls itself authoritative for an implementation in the sibling `temporal-coordinator` repo, which keeps its own `spec/`. A reference-only repo cannot stay the authority for live code.
- **Recommended answer:** the implementation repo (or whichever successor took the temporal coordinator) owns it. Mark `SPEC.md` here as a historical mirror with a pointer, and say so in the Q1 entry.
- **Proceeded on:** `SPEC.md` is canonical for the historical record only. Guard check 5 defers to whatever the retirement entry names.

## Q6. Should `skills/session-kickoff.md` and the `AGENTS.md` session-start steps stay?

- **Recommended answer:** yes, amended to lead with "repository status / successors". They are how a fresh agent learns, before editing, that the repo is not live. Removing them would leave only the banner.
- **Proceeded on:** amend (see `integration.md` § Amendments).

## Q7. Which sibling-repo paths are right: `components.yaml` (`../scope`, `../library`, `../seed`, …) or `README.md` (`../../scope`, `../../library`, `../../seed`, …)?

- **Recommended answer:** `README.md`'s `../../` form. It matches `DECISIONS.md` 2026-04-04 (tools sit flat in `~/pro/`) and the run records, which show this repo at `~/pro/agentic/agentic-architecture`. Fix `components.yaml` once, under the "broken reference" allowance. Not verified on disk: sibling repos were outside this run's reading scope.
- **Proceeded on:** `README.md` paths are correct.

## Q8. Should the repository be archived (read-only) once harvesting is finished?

- **Recommended answer:** yes. When the harvest ledger shows every listed item as moved or dropped, archive it. Drift then becomes structurally impossible, and both the guard and the kickoff can be retired.
- **Proceeded on:** listed as the "Later / fully embedded" step in `integration.md`.

## Q9. Is the `display_name` field part of `scope.yaml` v2?

- **Where it appears:** `components/scope/template/scope.yaml` and `components/orchestrator/scope/scope.yaml`. No decision or model doc defines it, and the 2026-04-07 decision says not to add manifest fields without evidence.
- **Recommended answer:** decide it in the `scope` successor, not here. This repo just records that the template carried it.
- **Proceeded on:** reported as drift (assessment R5) with no fix proposed here.

## Q10. Is `AUTH_OPTIONS_ANALYSIS.md` "Current Working Decision: direct API key" still meant?

- **Why it matters:** all three runs used ChatGPT-subscription Codex login, not an API key.
- **Recommended answer:** treat it as a historical analysis. Include it in the header-demotion (Q3) with a note that the manual runs used subscription auth.
- **Proceeded on:** demote.
