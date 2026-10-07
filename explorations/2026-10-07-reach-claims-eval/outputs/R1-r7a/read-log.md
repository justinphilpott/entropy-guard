# Read log

Files in the skills folder (`eval2/tool-r7`) opened during this run, in order. Paths are relative to that folder.

1. `skills/entropy-assessment/SKILL.md`: the front door, as the task directed.
2. `skills/entropy-assessment/intent-pass.md`: Step 1 of the front door.
3. `skills/entropy-assessment/intent-change-rule.md`: named by the intent pass, and copied into the guard.
4. `skills/entropy-assessment/mixed-profile.md`: the route for shape B (mixed docs and code).
5. `skills/docs-first-planning-assessment/SKILL.md`: Steps 2, 3, 5 and 7, run on the lab Scope, a docs-first member
   repository, as the front door's Step 2 requires.
6. `skills/session-coherence-skill-generator/SKILL.md`: the guard builder, after the `create` decision.
7. `skills/guards-integrator/SKILL.md`: the integration brief, after the guard was written.

A directory listing of the skills folder (`find . -type f`) was run once at the start to see which files existed. The
listing printed file names only; no file content was read from it.

Not opened:
- `skills/session-coherence-skill-generator/bootstrap.md`: no route led to it. Shape E did not fit, both repositories
  already have a decision surface (the lab's `decisions/`) and a current-state file (the lab's `STATE.md`), and the
  guard decision was `create`, not `bootstrap`.
- `skills/local/entropy-guard-feedback/SKILL.md`: it files issues "when working in this repo"; this run works on
  other repositories and files nothing. Feedback is noted in `feedback.md` instead.
- `skills/local/entropy-guard/SKILL.md`, `README.md`, `INTENT.md`: nothing on the route pointed to them.
