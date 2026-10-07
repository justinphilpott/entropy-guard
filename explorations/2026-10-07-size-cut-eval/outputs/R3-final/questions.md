# Questions for the steward

Target: `agentic-architecture` (read-only snapshot). Assessment of 2026-10-07; finding ids refer to `assessment.md`.

No steward was available. Each question below carries a recommended answer, and the run continued on that
recommendation. Work that depends on an answer is marked provisional in `assessment.md` and `proposed-changes.patch`.
Nothing was applied to the target.

The steward is not named anywhere in this repository (F3). These questions are addressed to whoever decides what
`agentic-architecture` is for; the repository's own scope files point to `justin`.

---

## Q1. Is `agentic-architecture` reference-only?

**The statements and their sources.**
- README.md:3-5 and AGENTS.md:3-6 carry a notice, undated and unattributed: "Reference-only. Current Personal Agent
  architecture lives in `../personal-agent`, and the current generic Scope/Project model lives in `../../scope`. Do
  not treat decisions in this repository as current authority."
- DECISIONS.md:137 (2026-04-23) says "`agentic-architecture` is the bleeding-edge design source for the current named
  version", and DECISIONS.md:158 (2026-05-14) says it "remains the Level 1 design/blueprint source". README.md:9 and
  AGENTS.md:8 still describe it the same way. No decision entry records a change (F1, F2).

**The readings.**
- A. Reference-only is the authorised status. The repository is kept for history; no design work happens here
  without explicit authorisation.
- B. The repository is still the active design source, and the notice is a draft or applies only partly.

**Where they diverge, concretely.** A fresh session that follows AGENTS.md's "Session start" and is asked "what's
next?" takes ROADMAP.md:25 ("flesh out `components/orchestrator/scope/workflows/daily-summary/WORKFLOW.md`") under
reading B and edits that file. Under reading A it stops and points to `../personal-agent`. For the guard: A gives the
guard decision `none` (a demotion of the existing guard); B gives `update` of `skills/entropy-guard.md`, which was
last evaluated on 2026-04-27 and predates the July decisions (F8).

**Recommended answer: A, reference-only, recorded in DECISIONS.md with its date and author.** The reasons:
- the notice sits at the top of both entry documents;
- it names two successor repositories that no other file mentions, so it was written after everything else in the
  repository, including the latest dated decision of 2026-07-26;
- it explicitly forbids extending the blueprint without authorisation.

The patch adds a proposed entry to DECISIONS.md for this, marked as awaiting your decision. If the date the status
changed is known, please give it.

---

## Q2. Should the stale text be corrected, or should the repository stay frozen apart from its status records?

**The statements and their sources.** AGENTS.md:5-6 says "Do not extend or reinterpret this blueprint as current
design without explicit authorization." AGENTS.md:26 and architecture/INDEX.md:23 require that stale docs are fixed.
The assessment lists stale, contradictory or drifted text in findings F9-F19. Recorded decisions already settle most
of it; F16 and F17 are drift that no decision covers.

**The readings.**
- A. Frozen. Only the status records change: the DECISIONS.md entry once Q1 is decided, the ROADMAP.md status
  section, the architecture/INDEX.md pickup line, the components.yaml paths and the demotion notes. Everything else
  stays as it is, and the ROADMAP.md status section warns readers about the worst of it.
- B. A one-time cleanup is authorised: correct what recorded decisions already settle in F9-F19, and record F16 and
  F17 in DECISIONS.md as proposals awaiting you.

**Where they diverge, concretely.** components/orchestrator/MODEL.md:25 lists "provision workspace for scope X" as an
orchestrator call to the scope manager, which DECISIONS.md:648 (2026-04-27) rules out. Under A the line stays and
the status section tells readers this repository is historical. Under B it is rewritten as task submission, citing
DECISIONS.md:648.

**Recommended answer: A.** This repository is no longer where current work happens. A correction here would not
reach `../personal-agent` or `../../scope`, and the status section protects a fresh reader at much lower cost. If you
prefer B, the one-time cleanup list in `assessment.md` is ready to apply, and each item is checked against the
current file.

---

## Q3. Should the unpromoted findings of runs 001-003 be carried to the successor repositories?

**The statements and their sources.** runs/001-moving-stillness-status/RUN.md:114-120 lists findings to promote into
the architecture:
- Pi's event types as the v0 runtime event log schema;
- concrete evidence that sandbox filesystem isolation is load-bearing;
- AGENTS.md and CLAUDE.md as a context surface inside a scope;
- the unused `uses:` block.

runs/002-professional-presence-diagnostic/RUN.md:241 adds the copy-from-reference drift between a reference role and
its live copy, and :248 asks for findings to be promoted. components/orchestrator/TODO.md:16 and ROADMAP.md:26 still
have this open. No DECISIONS.md entry records any of it (F20).

**The readings.**
- A. These learnings belong to the current architecture, so they should be checked for in `../personal-agent` and
  `../../scope` and carried over where they are missing.
- B. They were experiments for this blueprint only and stay here as history.

**Where they diverge, concretely.** A session designing the runtime event log in `../personal-agent` under reading B
designs the schema from scratch. Under reading A it starts from the 10 Pi event types that run 001 recorded
(RUN.md:84-85).

**Recommended answer: A, as a check rather than a copy.** Look in the successor repositories first, and carry over
only what they lack, linking back to the run records here. This assessment could not read the successor
repositories, so it has not done this. The ROADMAP.md status section lists the check as next action (3).
