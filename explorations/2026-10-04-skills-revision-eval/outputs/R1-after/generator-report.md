# Generator report: `session-coherence-skill-generator` v0.3.0

**Mode: build mode,** because the guard was explicitly requested. The targets are read-only, so the guard was
written to `guard/SKILL.md` here and not into the lab. The changes to the targets that build mode would have made
are listed as proposals below.

## Inputs supplied by the assessment

- the Intent section, `assessment.md` §1;
- the profile, `assessment.md` §§2, 3, 5 and 6;
- the ranked risks R1 to R5, `assessment.md` §4.

## Context-preservation structures found

| Loop | Structures |
|---|---|
| Intent | The lab's `scope.yaml` (`steward: justin`), `SCOPE.md`, `decisions/` and `memory/authority-rules-step-1.md`. ORC's `AGENTS.md`, which quotes Justin, and `README.md` "Direction". The description of the map's root issue |
| Session | The lab's `STATE.md`, which every session reads first and overwrites at each verified event. The lab's `AGENTS.md`, which says to read `STATE.md` again after a compaction |
| Decisions and learnings | The lab's `decisions/` (one file), `FRICTION.md`, `AGENT_IDEAS.md`, `memory/` and `reports/` |
| Verification | ORC's `pnpm typecheck`, `pnpm test` (with the architecture, core-ties and package-API ratchets) and `pnpm test:e2e`. Danger on ORC pull requests. The lab's `node tools/map.mjs --check` |
| Operational state | `orc.service` and `pnpm service:status`. ORC's operator commands, run through `scripts/orc-env.sh`. Restart and build cards. Grants with expiry |
| Rules owned elsewhere | `~/pro/local-config/home/AGENTS.md`. ORC's `SECURITY-REVIEW.md` and `dangerfile.js`. The map's root issue. `HOW_NOT_TO_PLAN.md`. The Scope model |
| Existing guard | None. The lab's `skills/` and `workflows/` hold only `.gitkeep`. "Entropy guard at session end" is a kept process with nothing behind it (`lab/STATE.md:49`) |

## Bootstrap classification

Bootstrap mode does not apply. Both repositories are mature. The direction review counts 232 commits in ORC and 248 in
the lab by 25 Sep, and both have every memory surface. The guard-readiness verdict is **ready now**: the handoff loop
repeats several times a day, and drift recurs (`lab/FRICTION.md` records `STATE.md` being wrong on 12 Sep and 22 Sep).

## Guard

- **Created:** `guard/SKILL.md`, for the target path `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`.
  This is provisional on Q2.
- **What it holds:**
  - pointers to the intent documents and to the rules owned elsewhere;
  - a definition of what changed, covering both repositories, uncommitted work, merged pull requests, and live reads
    of ORC;
  - the intent-change rule, filled in for Justin and `decisions/`;
  - judgment checks for state honesty (R1), ORC's documents against its code (R2), the seams between the two
    repositories (R5), workflow (R3), and decision capture (R4);
  - mechanical commands;
  - the safety rules and the report shape.
- **What it does not hold:**
  - current direction, active issue or PR numbers, build ids;
  - the text of the spending, live-service, security-review or merge rules. It links to them.

  It names one thing that may change: the list of ORC's historical root reports. That list goes once Q3 is answered.

## References to the guard from the operator docs

Proposed, not applied, because the targets are read-only. The exact lines are in `integration.md`, "Discovery plan":

- the lab's `AGENTS.md`, "Keeping state": one line naming the guard and when to run it;
- ORC's `AGENTS.md`, "Working Style": one line pointing to the lab's guard. `AGENTS.md` is a guarded path, so this
  pull request needs a `## Security review` section: "No new authority; documentation only".
- the lab's `STATE.md`: build-mode step 1 records the work in the state file. That was not possible here.

## Validation run

- **Every path the guard names exists in the snapshot.** A script checked 36 paths: 26 in ORC and 10 in the lab, 0
  missing.
- **The guard's read-only mechanical checks were run on the snapshot under bash, and work.**
  - `grep -c . STATE.md` gives 87.
  - The FRICTION heading check finds 3 headings the diary cannot read: lines 635, 665 and 684.
  - The "Where we are now" line is found at line 23.
  - The dead-path loop finds 11 references to 8 missing paths across 7 documents in ORC.
- **Not run:**
  - `pnpm typecheck`, `pnpm test` and `pnpm test:e2e`, because the snapshot has no `node_modules`;
  - `pnpm service:status` and the operator commands, because they need the live system;
  - `node tools/map.mjs --check`, because it needs GitHub;
  - `git diff --check`, because the snapshot has no `.git`.

## Open questions the guard leaves visible

- **Q1:** the decision surface. The guard uses `decisions/`.
- **Q2:** where the guard lives and whose sessions it covers. The guard covers both repositories from the lab.
- **Q3:** ORC's root reports. The guard's supersession check names them.
- **Q4:** the cap on `STATE.md`. The guard reads it from `AGENTS.md` and does not write the number down.

## Handoff

The guard was handed to `guards-integrator`. Its brief is in `integration.md`.
