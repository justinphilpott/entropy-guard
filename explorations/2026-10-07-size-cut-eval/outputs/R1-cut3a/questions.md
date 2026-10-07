# Questions for the steward (Justin)

No steward was available in this run. Each question is about a choice that changes what gets built or what the guard
checks; the evidence in the two snapshots could not settle it. Each carries the statement and its source, the readings,
one case from this system where they diverge, and the answer I recommend. I continued on each recommendation, and the
work that depends on one is marked provisional (the guard, and the parts of the patches named below).

Finding ids (F1 to F24) refer to `assessment.md`.

## Q1. Which record owns decisions about ORC and the lab?

- **Statement and source.** The lab has one decision record, `decisions/2026-09-17-async-work-architecture.md`, and it
  is about ORC's architecture. Other decisions of yours live in the overwritten `STATE.md` (the North star, the merge
  rule, the 4 Oct interview), in reports (`reports/2026-10-03-browser-stack-prior-art.md` line 76, "lets use the
  library"), in `memory/authority-rules-step-1.md`, in ORC code comments (`src/adapters/scope-credentials.ts` line 14)
  and in ORC's `AGENTS.md`. The lab's `SCOPE.md` (lines 19-21) says facts about ORC belong in ORC's repository, which
  has no decision record. Nothing names one owner (F1, F2).
- **Readings.** (a) The lab's `decisions/` owns every decision about ORC, the lab and how the work is done, one dated
  file each; an issue may hold a decision about itself, with a dated line in `decisions/` linking to it. (b) Decisions
  about ORC's code go in a new record in ORC's repository; the lab's `decisions/` keeps the rest.
- **Where they diverge.** Your 4 Oct decision "ORC scheduling (#166) is built first". Under (a) it goes in the lab's
  `decisions/`, where the guard looks. Under (b) it goes in a new ORC file, and the guard must check two places.
- **Recommended: (a).** It is the only decision record that exists, it already holds an ORC decision, and on 4 Oct you
  made the lab the central Scope for project management. It adds no new register.
- **Depends on it:** the guard's decision surface; patch `lab.diff` parts P2 and P4 (they follow (a) and say they move
  unchanged under (b)).

## Q2. Which sessions does "entropy guard at session end" cover?

- **Statement and source.** Your 4 Oct interview kept "entropy guard at session end" (`STATE.md` line 49). It does not
  say which sessions. Work here is done by Claude Code, by Codex and opencode runs (some overnight, in worktrees), and by
  Astra's read-only review runs (`STATE.md` lines 65 and 54; `FRICTION.md` 2026-10-04).
- **Readings.** (a) Every session that commits to ORC or the lab, by any agent. (b) Only the main interactive session,
  once at its end.
- **Where they diverge.** An overnight opencode run that commits to an ORC branch. Under (a) its brief carries the
  guard and it runs before handing back; under (b) nothing checks it until the next main session, if then.
- **Recommended: (a), excluding runs that commit nothing.** Drift comes from changes, and a review that changes nothing
  already ends in a report.
- **Depends on it:** the guard's trigger and entry points in `integration.md`.

## Q3. Where does the guard live?

- **Statement and source.** Nothing yet says. The lab's `skills/` holds only `.gitkeep`.
  `reports/2026-09-30-skills-one-home.md` proposes a Scope's own `skills/` for its agents' skills, and a code
  repository's own folder for a skill that belongs to it. This guard covers two repositories.
- **Readings.** (a) One guard in the lab, at `skills/session-coherence-guard/SKILL.md`, with a one-line pointer from
  ORC's `AGENTS.md` and from the lab's. (b) One guard in each repository.
- **Where they diverge.** A session working only in `~/pro/orchestrator`. Under (a) it meets the guard through the
  pointer in ORC's `AGENTS.md`; under (b) it runs ORC's copy, and the two copies must be kept in step.
- **Recommended: (a).** The lab is the central Scope for code quality (4 Oct), and one guard avoids two copies.
- **Depends on it:** the guard's path and the pointers in `integration.md`.

## Q4. Is `STATE.md` capped at forty lines or sixty?

- **Statement and source.** The lab's `AGENTS.md` line 34: "capped at about forty content lines". `STATE.md` line 4:
  "Target: sixty lines". No recorded decision settles which. The file had 99 lines on 4 Oct (F3, F4).
- **Readings.** (a) Forty content lines, as the standing instruction says; the header's "sixty" is removed. (b) Sixty;
  `AGENTS.md` changes.
- **Where they diverge.** The 4 Oct file. Under sixty it could keep its "Waiting on Justin" list in full and some
  history; under forty, history must go to `git log` and decisions to `decisions/`, as the drafted rewrite does.
- **Recommended: (a).** The instruction file is read by every session and outranks a banner inside the file it
  governs, and the rewrite shows the content fits in 41 lines.
- **Depends on it:** the guard's size check on `STATE.md`. The patch leaves both texts unchanged.

## Q5. Should the repositories on the central map be listed in `scope.yaml`?

- **Statement and source.** The set of repositories the map and the diary cover is defined only in the lab's
  `tools/collect.mjs` (`REPOS`, lines 19-26: six repositories; "Finance joined on 2026-10-02"). `scope.yaml` lists two
  projects (orchestrator, status-tracker), and the lab's `AGENTS.md` line 19 says a resource joining the Scope goes in
  `scope.yaml`, then a line in `SCOPE.md`. On 4 Oct you made the lab the central Scope for core issue tracking (F14).
- **Readings.** (a) A repository on the map is tracked, not owned: `REPOS` stays its one definition, and `SCOPE.md`
  gains one line pointing at it. (b) It joins this Scope: `scope.yaml` lists it (under `uses`, for example).
- **Where they diverge.** Finance joining on 2 Oct. Under (a) nothing else changes; under (b) the guard would require a
  `scope.yaml` entry and a `SCOPE.md` line for it, and for each repository that joins later.
- **Recommended: (a).** It keeps one list, where the code reads it, and avoids a second copy to keep in step (F12).
- **Depends on it:** whether the guard checks `scope.yaml` against `REPOS`. The guard does not check it now.

## Already with you, not asked again

- Correcting ORC's `README.md` and retiring its twelve root reports was put to you as "small cleanups, on your word"
  (`reports/2026-10-01-review-synthesis.md` item 7; `reports/2026-10-01-design-review.md` section 4). The patch
  `orchestrator.diff` corrects only the lines your recorded decisions already settle; the rest stays with that item.
- Four proposed changes are recorded as awaiting you, not asked here (`lab.diff`, part P4):
  - ORC's service adapter's subprocess authority (orchestrator#101);
  - what README's "Deliberately absent" list still holds;
  - the wording of the "retrospective documentation" rule;
  - what "one place that reads a credential" now means.
