# Read log

These are the files opened in the skills folder (`eval2/tool-final`), in order.

1. `skills/entropy-assessment/SKILL.md`: the entry point.
2. `skills/entropy-assessment/intent-pass.md`: Step 1, the intent pass.
3. `skills/entropy-assessment/intent-change-rule.md`: the intent pass reads existing guards' repairs against it.
4. `skills/docs-first-planning-assessment/SKILL.md`: Step 2, route A (docs-first planning).
5. `skills/session-coherence-skill-generator/SKILL.md`: entropy-assessment's Output asks for "the generator's
   inputs", which this file lists. Its rule for `none` is "stop".

Before step 1, the folder's contents were listed with `ls -R`, without opening any file.

## Not opened

These were not on the route:
- `skills/entropy-assessment/mixed-profile.md`, which serves routes B-D;
- `skills/session-coherence-skill-generator/bootstrap.md`, which is needed only if there is no state file or no
  decision log, and the target has ROADMAP.md and DECISIONS.md;
- `skills/guards-integrator/SKILL.md`, which is reached only through the generator, and the generator stops on `none`;
- `skills/local/entropy-guard/SKILL.md` and `skills/local/entropy-guard-feedback/SKILL.md`, which apply to the
  entropy-guard repository itself;
- the folder's own `INTENT.md` and `README.md`.
