# Questions for the steward

There are three, which is under the limit of five. Each one changes what gets built. No steward was available, so work
continued on each recommended answer. Anything that depends on an answer is drafted as provisional and not applied.
Finding ids (F…) refer to `assessment.md`.

## Q1 — When did agentic-architecture become reference-only, and should that be logged as a dated decision?

- **The statement and its source.** The status banner at `README.md:3-5` and `AGENTS.md:3-6` says the repo is "no
  longer current architecture authority" and names the successors `../personal-agent` and `../../scope`. It has no
  date and no author. `DECISIONS.md` has no entry for it; its last dated entry is 2026-07-26 (`DECISIONS.md:836`). No
  document names this repo's steward (F1, F2).
- **The readings:**
  - (a) Log a dated entry in `DECISIONS.md` that records the call and names you as the one who made it.
  - (b) Leave the banner as the only record.
- **Where they diverge.** `AGENTS.md:25` resolves conflicts "by current snapshots/index and dated decisions". Under
  (b), a later reader cannot place the reference-only call against the 2026-07-26 temporal coordinator decision, or
  against anything else. Under (a), they can.
- **Recommended answer: (a).** Give the date, and confirm that you (Justin) are this repo's steward. It costs one
  entry, the date is still known now, and it gives the repo's own chronology rule something to work with.
  `provisional-Q1.patch` drafts the entry with three placeholders: the decision date, the recording date and the
  steward.

## Q2 — Does "reference-only" allow content corrections, or only signposting?

- **The statement and its source.** "Do not extend or reinterpret this blueprint as current design without explicit
  authorization" (`AGENTS.md:5-6`; `README.md:5` is similar).
- **The readings:**
  - (a) Signposting only. Mark what is historical, and fix the pointers that present old material as current.
  - (b) Signposting, plus content corrections inside the historical documents: stale open-question references,
    superseded wording and sibling paths.
- **Where they diverge.** `SCOPES_PLANNED.md:90` lists "workspace lifecycle triggers" as open, although
  `DECISIONS.md:650` resolved it on 2026-04-27. Under (a) it stays as it is. Under (b) it is corrected, along with
  F10, F11, F13, F16 and F18.
- **Recommended answer: (a).**
  - Current truth now lives in the successor repos.
  - Content edits here spend effort on a record nobody should treat as current, and each one risks reinterpreting
    historical text.
  - Signposting at the entry points removes most of the real risk (R1 and R2 in `assessment.md`).
  - The settled patch does only signposting, which is allowed under either reading.
  - If you choose (b), apply `provisional-Q2.patch`, after checking the `components.yaml` sibling paths on disk.

## Q3 — What should happen to the guard and session rituals that were written for active work?

- **The statement and its source.** These are standing instructions:
  - session start (`AGENTS.md:36-45`, ending in "the 1-3 most plausible next actions");
  - `skills/session-kickoff.md` ("Likely Next Actions", `:108`);
  - "Before committing non-trivial changes, run skills/entropy-guard.md" (`AGENTS.md:72`).

  The guard's repairs update ROADMAP progress, component statuses and open questions (`skills/entropy-guard.md:79-80`,
  `:98`). All of these send a session into blueprint work, which the banner forbids without explicit authorization.
  No recorded decision says which wins (F7, F8, F9).
- **The options:**
  - (a) Demote. Mark both skills historical, replace session start with a reference-only orientation, and mark the
    working practices as describing the active period.
  - (b) Delete the two skills and the steps. Git keeps them.
  - (c) Keep everything as it is.
  - (d) Replace them with a minimal guard for reference-only maintenance. This changes the guard decision from `none`
    to `update`, and re-enters the route at `session-coherence-skill-generator`.
- **Where they diverge.** A fresh agent here is asked "what's next?". Under (c), it runs the kickoff and proposes
  extending "Working towards next", for example the `scopectl` CLI at `ROADMAP.md:27`. Under (a) or (b), it is sent to
  the successor repos.
- **Recommended answer: (a).**
  - It keeps the historical record readable.
  - It stops the misdirection at the point every session reads.
  - It matches `entropy-assessment`'s guidance that a reference-only system takes guard decision `none`, which "may
    finish with a correction or a demotion".
  - Option (d) would add a per-session guard to a repo where almost nothing should change.

  `provisional-Q3.patch` drafts (a).
