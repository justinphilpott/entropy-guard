# Read log: files opened in the skills folder, in order

Skills folder: `eval2/tool-r7`. Before opening anything, the folder's file list was taken with `find`; no file was
opened by that.

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/entropy-assessment/intent-change-rule.md`
4. `skills/docs-first-planning-assessment/SKILL.md`
5. `skills/session-coherence-skill-generator/SKILL.md`
6. `skills/guards-integrator/SKILL.md`
7. `skills/local/entropy-guard-feedback/SKILL.md`

Later re-reads, which did not open any new file:
- Lines 49-118 of `skills/session-coherence-skill-generator/SKILL.md` and lines 7-19 of
  `skills/entropy-assessment/intent-change-rule.md`, extracted with `sed` to reproduce the 724-word contract measurement.

Not opened: `skills/entropy-assessment/mixed-profile.md` (route A does not use it), and
`skills/session-coherence-skill-generator/bootstrap.md` (not a young repo, and the state file and decision log
exist). Also not opened, because no skill pointed to them: `README.md`, `INTENT.md` and
`skills/local/entropy-guard/SKILL.md` at the skills folder's root.
