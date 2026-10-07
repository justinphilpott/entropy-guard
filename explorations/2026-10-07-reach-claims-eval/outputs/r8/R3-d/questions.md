# Questions for the steward: agentic-architecture

There are two questions. The intent pass limits a run to five, and these are the only gaps where the snapshot's
evidence cannot settle the answer and the answer changes what gets built. No steward was available, so the run
continued on the recommended answers. The work that depends on them is drafted in `provisional.patch` and must not be
applied until the steward answers.

The steward is not named anywhere in the repository. These questions are addressed to Justin Philpott, inferred from
`steward: "justin"` in `components/orchestrator/scope/scope.yaml:6` (finding F6 in `assessment.md`).

---

## Question 1: retire the session-start ritual and the pre-commit guard, or keep them for corrections?

**The statements, and where they are.** The banner at the top of `AGENTS.md` (lines 3-6) says the repository is
reference-only: "Do not extend or reinterpret this blueprint as current design without explicit authorization."
Directly below it, the same file still runs active-development rituals:
- "Session start": "Check ROADMAP.md — know what version we're on and what's being worked towards" (`AGENTS.md:38`),
  then run `skills/session-kickoff.md`, which produces "the 1-3 most plausible next actions" (`AGENTS.md:43`).
- "Before committing non-trivial changes, run skills/entropy-guard.md" (`AGENTS.md:72`). That guard runs without
  being asked (`skills/entropy-guard.md:116`), and several of its checks direct extension: "If a component has
  shipped deliverables, update ROADMAP.md progress" (`:80`), "If a component's status has changed, update
  components.yaml" (`:79`), and "add them to DECISIONS.md Open Questions" (`:98`).

**The readings.**
- **(a) Retire both.** Mark `skills/session-kickoff.md` and `skills/entropy-guard.md` as historical. Replace "Session
  start" and the pre-commit line with a short reference-only orientation: read the banner and the `ROADMAP.md` status
  block, do current work in the successor repositories, and limit edits here to corrections and historical markers.
- **(b) Keep both for corrections.** Rewrite them for reference maintenance: drop the extension checks and the
  kickoff's "next actions", and keep running the guard before commits.

**Where the readings diverge, in this repository.** Say a session is asked to correct `RUNTIME.md:67`, which still
says "Runtime gateway (unified for v0)" although the 2026-07-16 snapshot superseded it.
- Under (a), the session fixes the line and commits.
- Under (b), it first runs the rewritten guard.
- Under today's unrewritten text, it would also meet `skills/entropy-guard.md:80` and could tick `ROADMAP.md` items from
  the temporal-coordinator repository's progress. That extends a reference-only blueprint, which the banner forbids.

**Recommended answer: (a), retire both.** The reasons:
- It is the finish entropy-assessment prescribes for a reference-only repository: the guard decision is `none`,
  ending in a correction or a demotion.
- The banner already rules out the work the rituals exist to support.
- Keeping (b) means maintaining a guard for a repository that should seldom change.

**What it changes.**
- On (a), apply the question-1 parts of `provisional.patch`, and the guard decision stays `none`.
- On (b), drop those parts. The decision becomes `update`, and `session-coherence-skill-generator` rewrites
  `skills/entropy-guard.md` from the inputs in section 11 of `assessment.md`, then hands it to `guards-integrator`.

---

## Question 2: record the reference-only status in DECISIONS.md, with its date and decider?

**The statements, and where they are.** "Reference-only. Current Personal Agent architecture lives in personal-agent,
and the current generic Scope/Project model lives in scope. Do not treat decisions in this repository as current
authority." (`README.md:3-5`, with matching text in `AGENTS.md:3-6`). Neither banner has a date or an author.
`DECISIONS.md`, the repository's decision log, has no entry for the change. The snapshot has no git history, so the
commit that added the banners cannot be found from here.

**The readings.**
- **(a) Record it.** Add a dated entry naming the decider to `DECISIONS.md`, and have both banners link to it. The
  entry then owns the decision and the banners become summaries of it.
- **(b) Leave the banners as the only record.**

**Where the readings diverge, in this repository.** `AGENTS.md:50` tells a session that is "unsure whether something
is settled" to "check DECISIONS.md before asking the user".
- Under (b), a session that checks finds no reference-only decision. It finds a log whose latest entries (2026-07-26)
  read as live design work, and can reasonably conclude the repository is current.
- Under (a), it finds the decision, its date, and where current work went.

**Recommended answer: (a), record it.** Date the entry from the commit that added the banner. Running
`git log -S "Reference-only" -- README.md AGENTS.md` in the real repository should give both the date and the author
without asking the steward again, though that could not be checked from the snapshot. Recording a decision found in a
banner is recording, not deciding it again.

**What it changes.** Apply the question-2 parts of `provisional.patch`, and fill in its `<YYYY-MM-DD>` and `<steward>`
placeholders: the first new `DECISIONS.md` entry, the "Recorded in DECISIONS.md" lines on both banners, and the
"Source" line of the `ROADMAP.md` status block.
