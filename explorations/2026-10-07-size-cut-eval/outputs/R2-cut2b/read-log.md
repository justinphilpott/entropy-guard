# Read log: files opened in the skills folder

Folder: `eval2/tool-cut2`. Files are listed in the order they were opened. Each was read in full, once.

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/entropy-assessment/intent-change-rule.md`
4. `skills/docs-first-planning-assessment/SKILL.md`
5. `skills/session-coherence-skill-generator/SKILL.md`
6. `skills/guards-integrator/SKILL.md`

Before step 1, the folder's file list was taken with `find`. That opened no file.

## Files not opened

These files are in the skills folder but were not opened, and the reason for each:

- `skills/entropy-assessment/mixed-profile.md`: the route was Shape A, and that file is only for routes B, C and D.
- `skills/session-coherence-skill-generator/bootstrap.md`: the target already has a state file, `TODO.md`, and is not
  a young repo.
- `skills/local/entropy-guard-feedback/SKILL.md`: it files issues only when working in the entropy-guard repo, and this
  run had no web access. The feedback notes were written to `feedback.md` instead.
- `skills/local/entropy-guard/SKILL.md`, `INTENT.md` and `README.md` in the skills folder: no skill on the route
  pointed to them.

The target's own copies of the skills (`entropy-guard-447da9a/skills/...`) were read as the target being assessed,
not as instructions.
