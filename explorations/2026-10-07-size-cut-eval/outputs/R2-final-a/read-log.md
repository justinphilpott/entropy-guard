# Read log: files opened in the skills folder, in order

Skills folder: `eval2/tool-final`. Before opening anything, I listed the folder's files with `find`; that opened no
file.

1. `skills/entropy-assessment/SKILL.md` — the entry point.
2. `skills/entropy-assessment/intent-pass.md` — Step 1 of the entry point.
3. `skills/entropy-assessment/intent-change-rule.md` — the intent pass points to it for reading the existing guard's
   repairs, and the generator copies it into the guard.
4. `skills/docs-first-planning-assessment/SKILL.md` — the route for shape A.
5. `skills/session-coherence-skill-generator/SKILL.md` — the handover for guard decision `update`.
6. `skills/guards-integrator/SKILL.md` — the generator's handover.

## Not opened, and why

- `skills/entropy-assessment/mixed-profile.md` — it is for routes B to D; I took route A.
- `skills/session-coherence-skill-generator/bootstrap.md` — it is needed only for route E, for guard decision
  `bootstrap`, or when no state file exists. `TODO.md` exists.
- `skills/local/entropy-guard-feedback/SKILL.md` — it files issues only when working inside the entropy-guard
  repository. My notes went to `feedback.md` instead.
- `skills/local/entropy-guard/SKILL.md`, `INTENT.md`, `README.md` (in the skills folder) — no route pointed to them.

The generator's size section cites `explorations/2026-10-05-skills-size-review-astra.md`. It is not in the skills
folder, and I did not read it.
