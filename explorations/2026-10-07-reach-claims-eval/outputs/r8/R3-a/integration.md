# Integration advice

**There is no integration step on this route.** The guard decision is `none`: the repository is reference-only
(`assessment.md`, §2 and §11). On `none`:
- `entropy-assessment` Step 4 makes no handover;
- the generator stops;
- `guards-integrator` is reached only from the generator.

So no integrator run took place, and no new guard needs placing in the loop.

What does change the working loop comes from the assessment's patches. It is listed here so it can be found in
one place.

## Settled (`patches/settled.patch`)

- **`ROADMAP.md`**, which `AGENTS.md:38` has every session read first, opens with a status note. The note says:
  - the repository is reference-only;
  - its checklists are a record as of 2026-07-26, not a work queue;
  - which documents to trust, and the one point where they disagree;
  - what is misleading nearby;
  - what makes the note stale.
- **`architecture/INDEX.md`** no longer sends readers to a superseded pickup.

## After the steward answers Q1 with (a) (`patches/provisional-Q1.patch`)

- **The session start in `AGENTS.md`** runs only for a task the steward has explicitly authorized. Any other
  request is pointed to the successor repositories.
- **The guard `skills/entropy-guard.md`** runs only before committing an explicitly authorized change. It
  reports issues instead of adding open questions to `DECISIONS.md`. Its "next maturity step" becomes none.
- **The kickoff `skills/session-kickoff.md`** answers "what's next?" by pointing to the successor repositories.

## Enforcement

Both rules stay prose; nothing enforces them (F10).
- **Where enforcement would sit:** the remote's archive or read-only setting would make the banner's rule
  enforced. A pre-commit reminder would do the same for the guard.
- **Neither is recommended without a steward decision.** Archiving would also block authorized edits.
