# Read log: files opened in the skills folder, in order

The skills folder is `eval2/tool-r8`. Before opening anything, I listed its file names once with `find`. That
listing opened no file.

1. `skills/entropy-assessment/SKILL.md`: the entry point.
2. `skills/entropy-assessment/intent-pass.md`: Step 1.
3. `skills/entropy-assessment/intent-change-rule.md`: referenced by the intent pass.
4. `skills/entropy-assessment/mixed-profile.md`: read early, together with item 3, before the shape was chosen. The
   route taken was A (docs-first). From it, only the guidance that applies on every route was used: the reach rule
   for "only" claims, applied as "not checked" to finding F20.
5. `skills/docs-first-planning-assessment/SKILL.md`: route A analysis.
6. `skills/session-coherence-skill-generator/SKILL.md`: read only for its list of inputs, which
   `entropy-assessment`'s Output section asks for even under a `none` decision. The generator was not run.

**Not opened:**
- `skills/session-coherence-skill-generator/bootstrap.md`: not route E. A decision log and a state file already exist.
- `skills/guards-integrator/SKILL.md`: not reached, because the decision was `none`.
- `skills/local/entropy-guard/SKILL.md` and `skills/local/entropy-guard-feedback/SKILL.md`.
- `README.md` and `INTENT.md` at the root of the skills folder.
