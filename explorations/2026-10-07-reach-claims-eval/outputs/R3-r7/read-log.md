# Read log: files opened in the skills folder, in order

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/docs-first-planning-assessment/SKILL.md`
4. `skills/entropy-assessment/intent-change-rule.md`
5. `skills/session-coherence-skill-generator/SKILL.md`, opened only to list "Inputs, and the guard decision", which
   the assessment's Output requires.

Before step 1, one `find -type f` listing of the skills folder showed the file names; it opened no files.

Not opened, because the route did not point to them:
- `README.md` and `INTENT.md` at the folder root;
- `skills/entropy-assessment/mixed-profile.md` (routes B to D only);
- `skills/session-coherence-skill-generator/bootstrap.md` (shape E, or no state file or decision log);
- `skills/guards-integrator/SKILL.md` (not reached when the decision is `none`);
- `skills/local/entropy-guard/SKILL.md`;
- `skills/local/entropy-guard-feedback/SKILL.md` (it files issues only "when working in this repo"; feedback is noted
  in `feedback.md` instead).
