# Read log

These are the files I opened in the skills folder (`.../eval2/tool-r6`), in order. First I listed the folder's files
with `find` to see what it held. That listing opened no file.

1. `skills/entropy-assessment/SKILL.md`: the front door, as the task instructed.
2. `skills/entropy-assessment/intent-pass.md`: Step 1 of the front door.
3. `skills/entropy-assessment/intent-change-rule.md`: the intent pass requires every existing guard's repair
   instructions to be read against it.
4. `skills/docs-first-planning-assessment/SKILL.md`: the analysis for route A (docs-first planning), run as a called
   skill.
5. `skills/session-coherence-skill-generator/SKILL.md`: read for its "Inputs, and the guard decision" section, which
   the front door's Output and docs-first Step 7 require to be listed. I did not hand work to it, because the guard
   decision is `none`.

## Files I did not open, and why

- **`skills/entropy-assessment/mixed-profile.md`:** it is only for routes B to D, and this run took route A.
- **`skills/session-coherence-skill-generator/bootstrap.md`:** it is only needed when a repository has no state file
  or no decision log. This one has both: `ROADMAP.md` and `DECISIONS.md`.
- **`skills/guards-integrator/SKILL.md`:** the integrator is reached only through the generator, which runs only for
  `create` or `update`.
- **`skills/local/entropy-guard-feedback/SKILL.md`:** it files GitHub issues "when working in this repo", meaning
  entropy-guard itself. This run used no web access, so I wrote the feedback to `feedback.md` instead.
- **`INTENT.md`, `README.md` and `skills/local/entropy-guard/SKILL.md`:** nothing on the route points to them.
