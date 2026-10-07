# Feedback on the entropy-guard skills

These are the notes the skills ask for ("if this skill ... left a step too implicit, note it"). They are for the
entropy-guard maintainers. They were not filed as issues, because this run is not working inside the entropy-guard
repository.

1. **Under `none`, nothing says who delivers a demotion.**
   - What happened: entropy-assessment Step 3 allows `none` to "finish with a correction or a demotion". The
     generator's `none` branch stops, so the integrator is never reached. Yet docs-first sends "placing an existing
     guard" to the integrator.
   - What I did: delivered the demotion as a provisional assessment patch, and framed it in `integration.md` without
     running the integrator's adoption steps.
   - Suggestion: say in Step 3 which of these is meant.
2. **A status banner with no date or author does not fit the "Stale description" condition cleanly.**
   - What happened: the intent-pass table requires "a later recorded steward decision". A banner's lateness and its
     author are both inferred.
   - What I did: treated it as a directive that outranks a description, under intent-pass step 2, and kept the
     uncertainty visible.
   - Suggestion: one line on how to treat such banners.
3. **For a question whose readings each imply different work, the skills do not say how many drafts to write.**
   - What happened: "Draft the work that depends on an answer as provisional" does not say whether to draft one patch
     per reading or only the recommended one.
   - What I did: drafted both, `provisional-Q1a-frozen.patch` and `provisional-Q1b-maintained.patch`.
4. **Docs-first Step 5 does not say what the state-file update should be for a reference-only repository.**
   - What happened: the required contents (current stage, canonical documents, settled decisions, active fronts, next
     actions) assume an active repository.
   - What I did: wrote a status block that names the successors and the open questions, and gave no next actions.
