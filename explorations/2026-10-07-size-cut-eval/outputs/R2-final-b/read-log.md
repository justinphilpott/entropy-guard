# Read log: files opened in the skills folder

Folder: `tool-final/`. These are listed in the order they were opened. Before opening anything, I listed the folder
with `find`, without opening any file.

1. `skills/entropy-assessment/SKILL.md`, the entry point, read in full.
2. `skills/entropy-assessment/intent-pass.md`, read in full. Step 1 points here.
3. `skills/entropy-assessment/intent-change-rule.md`, read in full. The intent pass points here.
4. `skills/docs-first-planning-assessment/SKILL.md`, read in full. Step 2 sends shape A here.
5. `skills/session-coherence-skill-generator/SKILL.md`, read in full. The guard decision `update` hands on to it,
   and docs-first Step 7 names it.
6. `skills/guards-integrator/SKILL.md`, read in full. The generator hands on to it.
7. `skills/session-coherence-skill-generator/SKILL.md` lines 49–117 and
   `skills/entropy-assessment/intent-change-rule.md` lines 7–19, re-read with `sed` to rebuild the template with the
   rule copied in, and so reproduce the 706-word size term.

**Not opened, and why:**
- `skills/entropy-assessment/mixed-profile.md`: only routes B to D use it, and this run took route A.
- `skills/session-coherence-skill-generator/bootstrap.md`: only shape E, or a missing state file or decision log, needs
  it. The target has both TODO.md and DECISIONS.md.
- `skills/local/entropy-guard/SKILL.md`: no skill on this route points to the tool's own local guard.
- `skills/local/entropy-guard-feedback/SKILL.md`: it files issues only when working in the entropy-guard repo, and no
  issue was filed. The notes are in `feedback.md`.
- `INTENT.md` and `README.md` at the root of the skills folder: no skill points to them.
