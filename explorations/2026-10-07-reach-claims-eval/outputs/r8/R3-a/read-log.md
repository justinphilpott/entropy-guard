# Read log

The files in the skills folder (`eval2/tool-r8`) that I opened, in order:

1. `skills/entropy-assessment/SKILL.md`: the entry point, as the task instructed.
2. `skills/entropy-assessment/intent-pass.md`: Step 1 directs it.
3. `skills/entropy-assessment/intent-change-rule.md`: the intent pass directs reading existing guards against it.
4. `skills/docs-first-planning-assessment/SKILL.md`: Step 2, shape A, directs it.
5. `skills/session-coherence-skill-generator/SKILL.md`: needed for its "Inputs, and the guard decision" list,
   which the assessment's Output requires. Its `none` branch says to stop.

Before opening anything, I ran one `find` over the folder to list file names. No file was opened by that.

I did not open any of these:
- `README.md` and `INTENT.md` at the folder root;
- `skills/entropy-assessment/mixed-profile.md`, which is for routes B to D only;
- `skills/session-coherence-skill-generator/bootstrap.md`, which is for shape E only, or when a state file or
  decision log is missing;
- `skills/guards-integrator/SKILL.md`, which is reached only from the generator, and not on `none`;
- `skills/local/entropy-guard/SKILL.md` and `skills/local/entropy-guard-feedback/SKILL.md`, which are local to
  the entropy-guard repository.
