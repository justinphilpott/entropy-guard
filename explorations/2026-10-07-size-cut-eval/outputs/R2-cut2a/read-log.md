# Read log: files opened in the skills folder, in order

The skills folder is `.../scratchpad/eval2/tool-cut2`.

1. `skills/entropy-assessment/SKILL.md`: the entry point, as the task instructed.
2. `skills/entropy-assessment/intent-pass.md`: from entropy-assessment Step 1.
3. `skills/entropy-assessment/intent-change-rule.md`: from intent-pass.md section 1, for reading the existing guard's
   repair instructions.
4. `skills/docs-first-planning-assessment/SKILL.md`: from entropy-assessment Step 2, shape A.
5. `skills/session-coherence-skill-generator/SKILL.md`: from docs-first Step 7.3.
6. `skills/guards-integrator/SKILL.md`: from docs-first Step 7.3 and generator Step 7.

Before step 1, a directory listing (`find -type f`) showed the folder's file names. No file was opened at that point.

## Seen in the listing or referenced, but not opened

- `skills/entropy-assessment/mixed-profile.md`: only for routes B to D. This run took route A.
- `skills/session-coherence-skill-generator/bootstrap.md`: only for a young repo (shape E), or a repo with no state
  file. The target has TODO.md and is not young.
- `skills/local/entropy-guard-feedback/SKILL.md`: it files issues only when working in the entropy-guard repo itself,
  and this run had no web access. The notes are in `feedback.md` instead.
- `skills/local/entropy-guard/SKILL.md`, `INTENT.md`, `README.md` (at the skills folder's root): not pointed to by
  the route.
- `explorations/2026-10-05-skills-size-review-astra.md`: cited by the generator's Size section. It is not in the
  skills folder, so it was out of bounds.
