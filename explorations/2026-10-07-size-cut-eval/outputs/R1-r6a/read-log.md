# Read log

Files opened in the skills folder (`eval2/tool-r6`), in the order they were opened:

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/entropy-assessment/intent-change-rule.md`
4. `skills/entropy-assessment/mixed-profile.md`
5. `skills/docs-first-planning-assessment/SKILL.md`
6. `skills/session-coherence-skill-generator/SKILL.md`
7. `skills/guards-integrator/SKILL.md`

Before opening any of them, the folder's file list was printed once (`find . -type f`), which showed names only.

Not opened, because the route did not point to them:
- `README.md`, `INTENT.md` at the folder's root;
- `skills/session-coherence-skill-generator/bootstrap.md` (route E, or adding a missing decision log; the system has
  one, the lab's `decisions/`);
- `skills/local/entropy-guard/SKILL.md` and `skills/local/entropy-guard-feedback/SKILL.md` (they apply when working
  in the entropy-guard repo itself; feedback was written as a note instead, `feedback.md`).
