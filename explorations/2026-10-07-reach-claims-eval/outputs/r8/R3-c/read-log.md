# Read log

Files opened in the skills folder (`tool-r6/`), in order:

1. `skills/entropy-assessment/SKILL.md`: the task's starting point.
2. `skills/entropy-assessment/intent-pass.md`: Step 1.
3. `skills/entropy-assessment/intent-change-rule.md`: the intent pass reads the existing guard's repairs against it.
4. `skills/docs-first-planning-assessment/SKILL.md`: Step 2, shape A.
5. `skills/session-coherence-skill-generator/SKILL.md`: needed for its "Inputs, and the guard decision", which the
   assessment's output must list, and for its `none` branch.

Before step 1, the folder's file names were listed (`find`). That listing opened no file.

Not opened, because the route did not point to them:
- `skills/entropy-assessment/mixed-profile.md`: routes B to D only.
- `skills/session-coherence-skill-generator/bootstrap.md`: needed only when the repository has no current-state file
  or no decision log, and it has both (`ROADMAP.md`, `DECISIONS.md`).
- `skills/guards-integrator/SKILL.md`: reached only through the generator on `create` or `update`.
- `skills/local/entropy-guard/SKILL.md`: local to entropy-guard.
- `skills/local/entropy-guard-feedback/SKILL.md`: files issues only "when working in this repo", meaning
  entropy-guard, and this run did not.
- The folder's `README.md` and `INTENT.md`.
