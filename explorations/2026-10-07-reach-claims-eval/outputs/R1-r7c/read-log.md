# Read log

Files in the skills folder (`tool-r7`) that were opened, in order:

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/entropy-assessment/intent-change-rule.md`
4. `skills/entropy-assessment/mixed-profile.md`
5. `skills/docs-first-planning-assessment/SKILL.md`
6. `skills/session-coherence-skill-generator/SKILL.md`
7. `skills/guards-integrator/SKILL.md`

The folder's file list was also printed once (`find . -type f`) before step 2, without opening anything.

Not opened:
- `skills/session-coherence-skill-generator/bootstrap.md`: the route needs it only when there is no state file or no
  decision log. The lab has both.
- `skills/local/entropy-guard-feedback/SKILL.md`: it applies only when working in the entropy-guard repository.
- `skills/local/entropy-guard/SKILL.md`, `README.md`, `INTENT.md`: not on the route.
