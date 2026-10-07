# Read log: files opened in the skills folder, in order

Skills folder: `eval2/tool-r8`.

1. `skills/entropy-assessment/SKILL.md`: the entry point, as instructed.
2. `skills/entropy-assessment/intent-pass.md`: Step 1.
3. `skills/entropy-assessment/intent-change-rule.md`: referenced by the intent pass; later copied into the guard.
4. `skills/docs-first-planning-assessment/SKILL.md`: Step 2, shape A.
5. `skills/session-coherence-skill-generator/SKILL.md`: Step 4 handover, after the guard decision `update`.
6. `skills/guards-integrator/SKILL.md`: the generator's handover.

**Not opened, and why:**
- `skills/entropy-assessment/mixed-profile.md`: read only on routes B to D; this run took route A.
- `skills/session-coherence-skill-generator/bootstrap.md`: for route E, for a missing state file, or for a missing
  decision log; the target has TODO.md and DECISIONS.md.
- `skills/local/entropy-guard/SKILL.md` and `skills/local/entropy-guard-feedback/SKILL.md`: the skills folder's own
  local skills, for work inside that repository. No issue was filed (no web access), so the feedback notes are in
  `feedback.md`.
- `README.md` and `INTENT.md` at the folder root: no skill on the route points to them.

The folder was also listed once with `find` to see its files; listing opened no file. Outside the skills folder, only
the target snapshot and this output folder were read. Scratch copies of the target, used to build and test the
patches, were made in the session scratchpad and are not part of the output.
