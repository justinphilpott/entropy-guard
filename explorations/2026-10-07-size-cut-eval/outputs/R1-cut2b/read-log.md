# Read log: files opened in the skills folder, in order

Skills folder: `tool-cut2/`.

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/entropy-assessment/mixed-profile.md`
4. `skills/entropy-assessment/intent-change-rule.md`
5. `skills/docs-first-planning-assessment/SKILL.md`
6. `skills/session-coherence-skill-generator/SKILL.md`
7. `skills/guards-integrator/SKILL.md`

The folder's file list was printed once at the start, with `find`; no file was opened that way.

**Not opened:**
- `INTENT.md` and `README.md` at the folder root, which no skill on this route pointed to.
- `skills/session-coherence-skill-generator/bootstrap.md`. It is needed only for a young repository (shape E), or
  when there is no state file or decision log. The lab has both.
- `skills/local/entropy-guard/SKILL.md`, which is this repository's own ritual.
- `skills/local/entropy-guard-feedback/SKILL.md`. It files GitHub issues when working in the entropy-guard repository,
  and this run filed none; its notes are in `feedback.md`.
