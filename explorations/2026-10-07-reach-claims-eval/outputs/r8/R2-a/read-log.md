# Read log: files opened in the skills folder, in order

Skills folder: `eval2/tool-r6`. Before opening anything, the folder was listed with `find` (names only).

1. `skills/entropy-assessment/SKILL.md` (the front door; the task's starting point)
2. `skills/entropy-assessment/intent-pass.md` (Step 1 points to it)
3. `skills/entropy-assessment/intent-change-rule.md` (the intent pass reads existing guards against it; the
   generator copies it into the guard)
4. `skills/docs-first-planning-assessment/SKILL.md` (route A, shape "Docs-first planning")
5. `skills/session-coherence-skill-generator/SKILL.md` (Step 4 hands to it; its "Inputs, and the guard decision"
   section defines the inputs). Lines 49-117 were read a second time with `sed` to re-measure the common contract's
   word count.
6. `skills/guards-integrator/SKILL.md` (the generator hands to it)

Not opened, and why:

- `skills/entropy-assessment/mixed-profile.md`: read only on routes B to D; this run took route A.
- `skills/session-coherence-skill-generator/bootstrap.md`: reached only for a young repo (route E), a `bootstrap`
  decision, or a missing state file or decision log; the target has `TODO.md` and `DECISIONS.md`.
- `skills/local/entropy-guard-feedback/SKILL.md`: the skills point to it for filing feedback as a GitHub issue when
  working in the entropy-guard repo. This run was told not to use the web, so feedback was written to
  `upstream-feedback.md` instead.
- `skills/local/entropy-guard/SKILL.md`, and `README.md` and `INTENT.md` at the skills folder's root: not pointed to
  by the route.
