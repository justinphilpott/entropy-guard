# Read log: files opened in the skills folder, in order

Skills folder: `eval2/tool-r6`.

1. `skills/entropy-assessment/SKILL.md`, the front door. Read in full.
2. `skills/entropy-assessment/intent-pass.md`, from Step 1. Read in full.
3. `skills/entropy-assessment/intent-change-rule.md`, referenced by the intent pass. Read in full.
4. `skills/docs-first-planning-assessment/SKILL.md`, from the route for shape A. Read in full.
5. `skills/session-coherence-skill-generator/SKILL.md`, from the hand-on after guard decision `update`. Read in full.
6. `skills/guards-integrator/SKILL.md`, from the generator's handoff. Read in full.

Re-opened later only to measure: `skills/session-coherence-skill-generator/SKILL.md` lines 49–117 and 93–94, and
`skills/entropy-assessment/intent-change-rule.md` lines 7–19. I counted their words with `wc -w` to re-check the
guard contract's 706-word measurement.

Not opened. The route did not point to these:
- `skills/entropy-assessment/mixed-profile.md`, which is for shapes B–D;
- `skills/session-coherence-skill-generator/bootstrap.md`, because the target already has a state file and a decision
  log;
- `skills/local/entropy-guard/SKILL.md`;
- `skills/local/entropy-guard-feedback/SKILL.md`, which files issues only "when working in this repo"; I noted
  feedback in `feedback.md` instead;
- the root `INTENT.md` and `README.md` of the skills folder.

I also listed the file names in the skills folder once (`find`), before reading.

Outside the skills folder, target, and this output folder: once, while creating this folder, I listed the names of
the sibling folders in `eval2/out/`. I opened none of them.
