# Read log: files opened in the skills folder, in order

Skills folder: `scratchpad/eval2/tool-r8`

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/entropy-assessment/intent-change-rule.md`
4. `skills/docs-first-planning-assessment/SKILL.md`
5. `skills/session-coherence-skill-generator/SKILL.md`
6. `skills/guards-integrator/SKILL.md`

Re-read later, as files already listed above:
- `skills/session-coherence-skill-generator/SKILL.md` lines 49-118 (the template), and
- `skills/entropy-assessment/intent-change-rule.md` lines 7-19 (the rule).

These were read by script, to re-measure the generator's 724-word contract figure.

These files appeared in a file listing (`find`) but were never opened:
- `README.md` and `INTENT.md` at the folder root;
- `skills/entropy-assessment/mixed-profile.md`, because route A does not use it;
- `skills/session-coherence-skill-generator/bootstrap.md`, because a state file exists and the decision was `update`,
  not `bootstrap`;
- `skills/local/entropy-guard/SKILL.md`;
- `skills/local/entropy-guard-feedback/SKILL.md`, because it is pointed to only "when working in this repo", which this
  run was not.
