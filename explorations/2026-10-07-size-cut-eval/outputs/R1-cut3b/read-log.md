# Read log: files opened in the skills folder

Skills folder: `scratchpad/eval2/tool-cut3`. Before opening anything, I listed the folder's file names with `find`.
That shows names only; no file was opened by it.

Files opened, in order:

1. `skills/entropy-assessment/SKILL.md`: the entry point named in the task.
2. `skills/entropy-assessment/intent-pass.md`: Step 1 says to run it.
3. `skills/entropy-assessment/intent-change-rule.md`: the intent pass says to read every existing guard's repair
   instructions against it. The guard also carries a copy of it.
4. `skills/entropy-assessment/mixed-profile.md`: Step 2 routes shape B there.
5. `skills/docs-first-planning-assessment/SKILL.md`: Step 2 says to run docs-first Steps 2, 3 and 5 on a member
   repository that is docs-first (the lab). Step 7 of this file also says to run the generator, then the integrator.
6. `skills/session-coherence-skill-generator/SKILL.md`: Step 3 says guards are built through it, and Step 4 hands it
   the intent section, the analysis and the ranked risks.
7. `skills/guards-integrator/SKILL.md`: the generator's Step 7, and docs-first Step 7.3, hand on to it.

Not opened, and why:

- `skills/session-coherence-skill-generator/bootstrap.md`: only for shape E (a young repo), or when there is no state
  file or decision log. The lab has both, `STATE.md` and `decisions/`.
- `skills/local/entropy-guard-feedback/SKILL.md`: the skills point to it only "when working in this repo" (the
  entropy-guard repository). This run was not. The feedback note it would file is written to `feedback.md` instead.
- `skills/local/entropy-guard/SKILL.md`, `README.md` and `INTENT.md`: no step on the route points to them.
- `explorations/2026-10-05-skills-size-review-astra.md`, which the generator cites for its 36-words-per-check figure:
  it is not in the skills folder. The formula was used as written.
