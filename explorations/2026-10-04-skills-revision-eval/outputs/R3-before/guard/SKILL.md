---
name: entropy-guard
description: Delta-scoped coherence check for the agentic-architecture repo in reference-only mode. Run before committing any change. Keeps the repo honest about being historical, sends live design work to the successor repos, and records what has been harvested from here.
generated: 2026-04-02
generated_by: entropy-assessment v0.5.2
refined: 2026-10-04
refined_by: entropy-assessment v0.6.0 → docs-first-planning-assessment v0.1.0
last_evaluated: 2026-10-04
system_snapshot: "Reference-only per the README.md and AGENTS.md banners (undated). Successors: ../personal-agent (Personal Agent architecture), ../../scope (Scope/Project model). 61 markdown + 7 YAML files; no code, CI or hooks. Last dated design work 2026-07-26. DECISIONS.md: 78 entries, 8 superseded; open-question registry frozen at 7 open + 6 deferred. One architecture snapshot (orchestration v1). Components: scope, agent, orchestrator (root-general draft), temporal-coordinator (V0 SPEC). Runs 001-003 complete. Companion: skills/session-kickoff.md at session start."
---

# Entropy Guard: agentic-architecture (reference-only mode)

Delta-scoped check run before committing anything to this repo. It replaces the live-design guard last evaluated 2026-04-27; that version is in git history if the repo is ever reactivated.

> **Scope:** only what changed in this session. 2-5 minutes. Most commits here should now be status headers, successor pointers, harvest records or reference fixes, so most checks will be "nothing to do".

## Current repo direction

This repo is a historical record of the agentic-architecture blueprint (Sol 0.x, 2026-03-31 to 2026-07-26). Current Personal Agent architecture lives in `../personal-agent`; the current Scope/Project model lives in `../../scope`. Do not extend, reinterpret or "bring up to date" the design here. Read it, cite it, harvest from it, and keep it from misleading the next reader.

## When to Run

- Before committing any change to this repo, however small. Commits are rare now, and each is a chance to reintroduce live-state language.
- After moving a decision, finding or learning from this repo into a successor repo, even if the only change here is the harvest record.

## When NOT to Run

- When you only read this repo from a successor-repo session and change nothing here. Run that repo's own guard instead.
- As a full audit. For a full re-read, rerun `entropy-assessment` from entropy-guard.
- If a dated `DECISIONS.md` entry has lifted reference-only status. Then this guard is the wrong one: regenerate it.

## Checklist

Work through each check against what you changed. "No, nothing to do" is the expected answer for most.

### 0. Mode gate (always first)

- Is reference-only status still in force? Check the `README.md` / `AGENTS.md` banners and the retirement entry in `DECISIONS.md`, if one exists.
- What class of change is this? Allowed without further authorisation:
  - a status header or historical framing
  - a successor pointer
  - a harvest record
  - a fix for a broken reference or a factual error about what was decided
  - a typo
- Anything else is design work: a new or changed decision, a changed model, a new snapshot, ticked roadmap items, a raised component status, a new open question. **Stop.** It belongs in `../personal-agent` or `../../scope`, unless the steward has authorised it and that authorisation is recorded as a dated `DECISIONS.md` entry.

### 1. Status honesty

- Does every file you touched still read as historical? No new "current", "next", "working towards", "in-progress", "Next Up", "Current Focus" or "Current Pickup" wording without a historical frame.
- If you touched `ROADMAP.md`, `components.yaml`, `components/*/TODO.md` or `components/*/PLAN.md`: was it only to add or keep the status header? Never tick items or change statuses.
- Manual aid only (it matches wording, so never automate it):
  `grep -nE "current named version|bleeding-edge|Working towards|Next Up|Current Focus|Current Pickup|in-progress" <files you touched>`

### 2. Point to successors, do not restate

- If you touched a concept that now lives in a successor repo, does this repo point there rather than restate or update it?
- If you cited this repo from a successor, did you link a specific file and dated entry (e.g. `DECISIONS.md` "2026-04-06 — One repo per scope"), not "agentic-architecture" in general?

### 3. Supersession check before reviving anything

Before restoring a deleted file or section, reviving an older concept, or "fixing" a reference by recreating its target, check whether it was superseded on purpose:

- `DECISIONS.md` *(superseded)* markers: 7 headings carry one. The 2026-04-27 "Scope manager is the unified platform gateway" entry is also superseded (by orchestration v1 on 2026-07-16), but only its body says so.
- `architecture/INDEX.md`: the only file that says which snapshot is current.
- Self-demoted files: `architecture/PICKUP.md`, `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`, `archive/`.
- Retired terms, which must not reappear except as history:
  - "phase" language
  - scope name `root` (now `root-general`)
  - `workflows.yaml`
  - a scope `activity/` directory
  - `~/scope/` (now `~/scopes/`)
  - the "unified" scope-manager gateway
  - the temporal coordinator's tick / Core-Egress / `EventSink` design

### 4. Harvest capture

- Did this session take a decision, finding or learning from here into a successor repo, or decide to drop one? Add one line to `runs/README.md` § Harvest status (create the section if it is missing), in this shape: item, source file, destination file in the successor or "dropped", date.
- Is the harvested item still described here as if it were current? Add a pointer to where it now lives.

### 5. Canonical ownership (of the historical record)

If you corrected a fact, did you correct it in its canonical home and leave other mentions as links? Each concept's home:

- decisions → `DECISIONS.md` (component-local ones → `components/{name}/DECISIONS.md`, linking to the root)
- orchestration anatomy → the snapshot listed in `architecture/INDEX.md`
- temporal coordinator V0 contract → `components/temporal-coordinator/SPEC.md`, or the owner named in the retirement entry if it moved
- component-local shape → `components/{name}/MODEL.md`
- open questions → frozen in `DECISIONS.md` § Open Questions and orchestration v1 § Under Review. Add no new ones here.

### 6. Resolved-question references

- If a file you touched says "open question", "TBD" or "still open", is that question actually still open in `DECISIONS.md`? Most runtime questions were resolved on 2026-04-27.
- If it was resolved, annotate in place: "resolved YYYY-MM-DD — see `DECISIONS.md`: '<entry title>'". Do not delete the historical text.

### 7. Cross-references

- Do the links in changed files still resolve? Use the aid below.
- Sibling-repo paths follow the layout in `DECISIONS.md` 2026-04-04: design repos sit next to this one (`../agentic-learning`, `../personal-agent`); tools sit flat in `~/pro/` (`../../scope`, `../../library`). `components.yaml` uses `../` for tools and is known to disagree with `README.md`. Do not copy its paths.
- Mechanical aid. Run it from the repo root; it is safe on the whole repo, which has 61 markdown files. It needs GNU `realpath`. Links to sibling repos are listed, not checked.

```bash
root=$(pwd -P)
find . -name '*.md' -not -path './runs/*/output.md' | while read -r f; do
  grep -oE '\]\([^)#[:space:]]+' "$f" | sed 's/^](//' | while read -r l; do
    case "$l" in http*|mailto:*) continue;; esac
    t=$(realpath -m "$(dirname "$f")/$l")
    case "$t" in
      "$root"/*) [ -e "$t" ] || echo "BROKEN   $f -> $l";;
      *)         echo "SIBLING  $f -> $l (not checked)";;
    esac
  done
done
```

Baseline on 2026-10-04: 0 `BROKEN`, 23 `SIBLING`.

### 8. Agent-instruction alignment

- Did you change how an agent should work here? Then `AGENTS.md`, `skills/session-kickoff.md`, `skills/README.md` and this guard must agree, in the same commit. `CLAUDE.md` is a symlink to `AGENTS.md`: edit `AGENTS.md` only.
- Would a fresh agent starting from `AGENTS.md` alone treat this repo as reference-only, and go to the successor repos for live work?

### 9. Guard-induced entropy

- Are you about to automate one of these checks? Only the link check (7) is a durable invariant. The wording grep (1) and every judgment check stay manual.
- Did this guard drift? If status, successors or the allowed-change list changed, update "Current repo direction", the mode gate and the metadata above, or regenerate the guard. Do not record one-time cleanup progress here; that belongs in the commit message or `DECISIONS.md`.

## Output

- Add one line to the commit message: `entropy check (reference-only): clean`, or what was fixed, e.g. `entropy check: demoted ROADMAP.md; harvest ledger +2`.
- If check 0 stopped a change, say where it went (successor repo and file) so the next reader is not left looking for it.
- If a gap needs more than this commit can carry, do not widen the commit. Record it in the successor repo's backlog, or as a line in `runs/README.md` § Harvest status, and commit what you have.

## Rationale

| Check | Entropy vector it guards against |
|---|---|
| 0. Mode gate | Retired design quietly re-extended: the top risk for a reference-only repo |
| 1. Status honesty | State entropy: live-state wording next to a reference-only banner |
| 2. Successor pointers | Parallel truth across repos: the same concept explained here and in a successor |
| 3. Supersession check | Superseded-nearby interference: old concepts rehydrated as current |
| 4. Harvest capture | Knowledge entropy: run findings and decisions lost, or harvested twice |
| 5. Canonical ownership | Parallel truth inside the repo, e.g. `RUNTIME.md` restating snapshot anatomy |
| 6. Resolved-question references | Zombie open questions: settled items read as open by a harvester |
| 7. Cross-references | Link rot: fast-decaying, cheap to fix within one commit |
| 8. Agent-instruction alignment | Workflow drift: instructions that steer agents into live-mode work |
| 9. Guard-induced entropy | The guard itself going stale or growing brittle automation |

## Integration

- **Current enforcement:** external, discipline-based. A standing instruction in `AGENTS.md` ("Before committing … run `skills/entropy-guard.md`").
- **Standing instruction for agents:** if you are about to commit anything in this repo, run this checklist first. You do not need to be asked.
- **Companion:** `skills/session-kickoff.md` at session start. Its packet must lead with repository status and successors.
- **Next maturity step:** only if commits keep landing here and runs of this guard are missed, add a non-blocking reminder hook. The most mature form is structural: once harvest is complete, archive the repo read-only, and this guard can be retired.

## What This Is Not

- Not a live-design guard. It does not check `MODEL.md` against `RUNTIME.md`, or roadmap progress against component work; those checks belonged to the active blueprint.
- Not an audit of the successor repos.
- Not a place to record bootstrap or cleanup completion.
