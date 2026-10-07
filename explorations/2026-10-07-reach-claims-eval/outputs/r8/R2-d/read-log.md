# Read log: files opened in the skills folder

The skills folder is `scratchpad/eval2/tool-r8`. This lists every file opened there, in order.

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/entropy-assessment/intent-change-rule.md`
4. `skills/docs-first-planning-assessment/SKILL.md`
5. `skills/session-coherence-skill-generator/SKILL.md`
6. `skills/guards-integrator/SKILL.md`

Two of these were re-read later, with `sed`, to measure the guard's common contract:

- lines 49 to 118 of `skills/session-coherence-skill-generator/SKILL.md`;
- lines 7 to 19 of `skills/entropy-assessment/intent-change-rule.md`.

Before reading anything, the folder's file names were listed with `find`; no file contents were read that way.

These files were not opened:

- `README.md` and `INTENT.md`, at the folder root;
- `skills/entropy-assessment/mixed-profile.md`, because route A does not use it;
- `skills/session-coherence-skill-generator/bootstrap.md`, because the target already has a state file and a decision
  log;
- `skills/local/entropy-guard/SKILL.md`;
- `skills/local/entropy-guard-feedback/SKILL.md`, because no issue was filed.
