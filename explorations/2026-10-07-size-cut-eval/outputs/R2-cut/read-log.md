# Read log

These are the files in the skills folder (`eval2/tool-cut`) that this run opened, in order. Before opening any of
them, the run listed the folder's file names with `find`; that listing showed names only, no contents.

1. `skills/entropy-assessment/SKILL.md`
2. `skills/entropy-assessment/intent-pass.md`
3. `skills/docs-first-planning-assessment/SKILL.md`
4. `skills/entropy-assessment/mixed-profile.md`
5. `skills/session-coherence-skill-generator/SKILL.md`
6. `skills/entropy-assessment/intent-change-rule.md`
7. `skills/guards-integrator/SKILL.md`

These files in the skills folder were not opened, with the reason for each:

- `skills/session-coherence-skill-generator/bootstrap.md`: the skills point to it only when a repo has no state file
  or no decision log, and the target has both.
- `skills/local/entropy-guard-feedback/SKILL.md`: no issue was filed (no web access), so feedback went to
  `feedback.md`.
- `skills/local/entropy-guard/SKILL.md`, `README.md` and `INTENT.md`: no skill on the route pointed to them.

## One deviation, recorded so it is visible

A directory listing of the target's parent folder (`eval/targets/`) showed the names of other targets. No file outside
the skills folder, the target and the output folder was read, and nothing from that listing was used.

## Scratch work

Scratch copies were made in `eval2/work-R2-cut/` to build and dry-run the patches and to test the hook in a throwaway
git repo. They were deleted at the end of the run.
