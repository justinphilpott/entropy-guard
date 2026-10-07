# Read log: files opened in the skills folder, in order

Paths are relative to the skills folder: `.../scratchpad/eval2/tool-r8`.

Before step 1, a `find` listed the folder's file names; no file was opened by it.

1. `skills/entropy-assessment/SKILL.md`: the entry point.
2. `skills/entropy-assessment/intent-pass.md`: Step 1 points here.
3. `skills/entropy-assessment/intent-change-rule.md`: the intent pass points here, to read the existing guard's
   repairs against it.
4. `skills/docs-first-planning-assessment/SKILL.md`: route A, because the shape is docs-first planning.
5. `skills/session-coherence-skill-generator/SKILL.md`: entropy-assessment's Output asks for "the generator's inputs"
   as listed in the generator's "Inputs, and the guard decision". Its `none` branch says to stop.
6. `skills/guards-integrator/SKILL.md`: docs-first names it for placing an existing guard. It was read to frame the
   demotion of the existing guard; the route itself does not hand over to it, because the decision is `none`.

These were not opened, because the route did not need them:
- `skills/entropy-assessment/mixed-profile.md`: for routes B to D only.
- `skills/session-coherence-skill-generator/bootstrap.md`: needed only for route E or when no state file or decision
  log exists; both exist here.
- `skills/local/entropy-guard/SKILL.md` and `skills/local/entropy-guard-feedback/SKILL.md`: these apply when working
  inside the entropy-guard repository.
- `README.md` and `INTENT.md` at the folder root.
