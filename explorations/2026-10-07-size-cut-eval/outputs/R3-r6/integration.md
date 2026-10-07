# Integration

**Not reached.** The guard decision is `none` (`assessment.md`, "Guard decision and the generator's inputs").
`entropy-assessment` Step 4 hands over to `session-coherence-skill-generator` only for `create` or `update`. Only the
generator hands on to `guards-integrator`. So no guard was generated, nothing was handed to the integrator, and that
skill was not opened.

The assessment does propose changes to where the existing guard is wired into this repo's loop. They are not
integrator advice. They come from the assessment's own demotion, and they are drafted in `provisional-Q3.patch`,
pending Q3:
- **`AGENTS.md:72`**: "Before committing non-trivial changes, run skills/entropy-guard.md" becomes a note that the
  guard is historical.
- **`AGENTS.md:36-45`**: the session start becomes a reference-only orientation, pointing to the "Current state" section
  of `ROADMAP.md` and to the successor repos.
- **The skills**: `skills/entropy-guard.md`, `skills/session-kickoff.md` and `skills/README.md` carry historical notes.

The live control for this lifecycle is the status banner at `README.md:3-5` and `AGENTS.md:3-6`. Every agent session
loads it, because `CLAUDE.md` is a symlink to `AGENTS.md` and Pi loads `AGENTS.md` too
(`runs/001-moving-stillness-status/RUN.md:74`). It needs no further wiring.

If the steward answers Q3 with (d), a minimal reference-only guard, the decision becomes `update`. The route then runs
the generator, and the generator hands on to `guards-integrator`, which would write the integration advice.
