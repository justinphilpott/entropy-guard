# Integration advice: agentic-architecture

**No integration advice is produced on this route.** Integration advice comes from `guards-integrator`, and this
route never reaches it:
- The guard decision is `none`, because the repository is reference-only (section 11 of `assessment.md`).
- `entropy-assessment` hands work to `session-coherence-skill-generator` only for `create` or `update`.
- The generator is the only skill that hands work to `guards-integrator`.

So no guard was generated, and `guards-integrator` was not run.

## What stands in for it

One change in this run touches how work is done in the repository, which is what integration would normally cover.
It is the demotion in `provisional.patch`, waiting on question 1:
- `AGENTS.md`'s "Session start" section is replaced with a reference-only orientation.
- The pre-commit line "Before committing non-trivial changes, run skills/entropy-guard.md" is replaced with a note
  that the guard is historical.
- `skills/entropy-guard.md` and `skills/session-kickoff.md` get a "Historical, not run" banner.

That removes a ritual. It does not adopt a new one, so there is nothing to wire in:
- No hook exists, and none should be added to a reference-only repository.
- The status block at the top of `ROADMAP.md` (`settled-orientation.patch`) is reached by the path every session
  already takes. `AGENTS.md` loads automatically, and its session start points at `ROADMAP.md`.

## If question 1 is answered "keep them for corrections"

The guard decision becomes `update`. The route then continues from the generator's inputs (section 11 of
`assessment.md`), through `session-coherence-skill-generator`, to `guards-integrator`, which would produce the
integration advice. This run did not do that work, because nothing on the recommended route calls for it.
