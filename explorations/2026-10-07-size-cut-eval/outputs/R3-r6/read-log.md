# Read log

The files I opened in the skills folder (`eval2/tool-r6`), in order:

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/entropy-assessment/intent-change-rule.md`
4. `skills/docs-first-planning-assessment/SKILL.md`
5. `skills/session-coherence-skill-generator/SKILL.md`. I read it for its list of inputs, which `entropy-assessment`
   points to in "Called for analysis only" and in "Output", and for what `none` means there. I did not invoke it.

Before step 1, I listed the folder's file names with `find`, which does not open any file.

These files were not opened, because the route did not call for them:
- `skills/entropy-assessment/mixed-profile.md`, which is for routes B to D only;
- `skills/session-coherence-skill-generator/bootstrap.md`, which is for route E, or a missing state file or decision
  log; this repo has both;
- `skills/guards-integrator/SKILL.md`, which is reached only through the generator, for `create` or `update`;
- `skills/local/entropy-guard-feedback/SKILL.md`, which files issues when working inside the entropy-guard repo; the
  notes on the skills went to `skills-feedback.md` instead;
- `skills/local/entropy-guard/SKILL.md`, `INTENT.md` and `README.md`, which the route never points to.
