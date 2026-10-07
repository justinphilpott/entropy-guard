# Read log: files opened in the skills folder, in order

Skills folder: `.../scratchpad/eval2/tool-baseline`

1. `skills/entropy-assessment/SKILL.md` (the front door, as the task instructed)
2. `skills/entropy-assessment/intent-pass.md` (pointed to by entropy-assessment Step 1)
3. `skills/docs-first-planning-assessment/SKILL.md` (pointed to by entropy-assessment Step 3, route B: docs-first
   Steps 2, 3 and 5 for the lab Scope)
4. `skills/session-coherence-skill-generator/SKILL.md` (pointed to by entropy-assessment Step 5, "Hand on")
5. `skills/guards-integrator/SKILL.md` (pointed to by the generator's build-mode step 9)

Each file was opened once and read in full.

## Listed but not opened

- The folder's file list was printed once with `find` before anything was opened, to locate the front door.
- `README.md` and `INTENT.md` at the folder root: no skill on the route pointed to them.
- `skills/local/entropy-guard/SKILL.md`: no skill on the route pointed to it.
- `skills/local/entropy-guard-feedback/SKILL.md`: the front door, docs-first and integrator skills point to it "when
  working inside this repo" or "whenever the local feedback helper is available". This run was not inside the
  entropy-guard repository, and the helper files a GitHub issue, which the run's rules (no web) do not allow. The
  feedback note went into `upstream-feedback.md` instead, as guards-integrator Step 8 says to do when the helper is
  not available.
