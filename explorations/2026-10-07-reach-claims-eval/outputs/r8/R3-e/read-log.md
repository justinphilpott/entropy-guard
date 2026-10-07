# Read log: skills folder

Files in the skills folder (`.../eval2/tool-r6`) that were opened, in order:

1. `skills/entropy-assessment/SKILL.md`, the entry point named by the task.
2. `skills/entropy-assessment/intent-pass.md`, from Step 1.
3. `skills/entropy-assessment/intent-change-rule.md`, which the intent pass reads guards against.
4. `skills/docs-first-planning-assessment/SKILL.md`, route A from Step 2.
5. `skills/session-coherence-skill-generator/SKILL.md`, read for its "Inputs, and the guard decision" list, which
   the entry skill's Output requires. On `none` it stops.

Listed with `find` at the start and never opened:

- `INTENT.md` and `README.md` at the folder root;
- `skills/entropy-assessment/mixed-profile.md`, used by routes B to D only;
- `skills/session-coherence-skill-generator/bootstrap.md`, needed only when a state file or decision log is missing;
  both exist here;
- `skills/guards-integrator/SKILL.md`, not reached on `none`;
- `skills/local/entropy-guard/SKILL.md`;
- `skills/local/entropy-guard-feedback/SKILL.md`.
