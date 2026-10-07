# Read log: files opened in the skills folder, in order

Skills folder: `scratchpad/eval2/tool-cut`. Paths below are relative to it.

Before opening anything, the folder's file list was printed once with `find` (names only, no contents).

1. `skills/entropy-assessment/SKILL.md`: the front door, as the task directed.
2. `skills/entropy-assessment/intent-pass.md`: Step 1 of the front door ("Run intent-pass.md").
3. `skills/entropy-assessment/mixed-profile.md`: Step 2 routes shape B (mixed docs and code) here.
4. `skills/docs-first-planning-assessment/SKILL.md`: Step 2 says that for B with a docs-first member repository (the
   lab), docs-first Steps 2, 3 and 5 also run on it.
5. `skills/session-coherence-skill-generator/SKILL.md`: Step 3 and 4 hand guard building to it.
6. `skills/entropy-assessment/intent-change-rule.md`: the generator's guard contract says to copy this rule into the
   guard (also named by `intent-pass.md`).
7. `skills/guards-integrator/SKILL.md`: the generator's Step 7, and docs-first Step 7, hand the guard to it.

## Not opened, and why

- `README.md` and `INTENT.md` at the folder's top level: no skill on the route pointed to them.
- `skills/session-coherence-skill-generator/bootstrap.md`: named for shape E (young repo) and for creating a missing
  state file or decision log. The system has both (the lab's `STATE.md` and `decisions/`), so it was not needed.
- `skills/local/entropy-guard-feedback/SKILL.md`: the skills say it files feedback as a GitHub issue "when working in
  this repo" (entropy-guard). This run works on ORC and the lab, so feedback was written as a note
  (`feedback.md`) instead.
- `skills/local/entropy-guard/SKILL.md`: no skill on the route pointed to it; it is entropy-guard's own local ritual.
- `explorations/2026-10-05-skills-size-review-astra.md`: cited by the generator's Size section, but not in the
  skills folder, and the run rules forbid reading other entropy-guard material. Noted in `feedback.md`.
