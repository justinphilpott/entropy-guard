# Integration advice

**Did the route reach the integrator? No.** The guard decision is `none` (`assessment.md` section 10), so the guard
generator stops and makes no handover, and the integrator is not run on this route. This note records two things in
the integrator's terms, for reuse:
- the placement of the existing guard, as the assessment found it;
- the one placement change the route proposes: the provisional demotion.

Finding ids refer to `assessment.md`.

## Placement of the existing guard, as found
`skills/entropy-guard.md` is placed as follows:
- **Trigger:** "before committing non-trivial changes" (AGENTS.md:72; `skills/entropy-guard.md`:16-18), plus at the
  start of a session after a gap of a few days.
- **Actor:** an agent or a person.
- **Entry point:** AGENTS.md, which is loaded automatically through the CLAUDE.md symlink, in its working practices
  and key files, and in skills/README.md:8.
- **Output:** "note any issues found and fixed". No place is named for recording a run.
- **Escalation:** items that need discussion go to the DECISIONS.md open questions.
- **Depth:** External, discipline-based (`skills/entropy-guard.md`:114).

**Adoption: unknown.** There is no git history and no guard report in the snapshot. F7 and F12 are exactly what the
guard's checks at lines 39 and 48 target, and both remain. That fits a guard that was skipped, or one whose checks no
longer reach the snapshot-owned anatomy (F6b). The evidence cannot tell which.

## Proposed placement change: demotion (provisional, applies only if Q1 is answered (a))
- **Trigger: none.** The guard stops being a pre-commit gate. `provisional-Q1a-frozen.patch` changes AGENTS.md:72,
  AGENTS.md:103 and skills/README.md:8, and adds a "Demoted" header to the guard.
- **Entry point for the status that replaces it:** the settled patch.
  - The pointer at the top of `skills/session-kickoff.md`, which AGENTS.md session-start step 6 runs.
  - The status block in ROADMAP.md, which session-start step 1 reads.
  - Together these are where a fresh agent meets "reference-only" at the moment it would choose work.
- **Adoption check: `planned`, not run.** Ask a fresh session in the repository, after the patches are applied,
  "what's next here?". It should answer that the repository is reference-only and point to the successors, rather than
  proposing a ROADMAP item. It was not run, because the target is a read-only snapshot and the patches are not applied.

## If Q1 is answered (b)
The decision becomes `update`. The generator then amends `skills/entropy-guard.md` in place (F6b to F6f) and hands it
to the integrator. The trigger and entry point stay as they are found above. The guard's own next step, a
non-blocking reminder hook (`skills/entropy-guard.md`:118; ROADMAP.md:69), should wait until missed runs are shown to
be the main failure. Today there is no evidence either way.
