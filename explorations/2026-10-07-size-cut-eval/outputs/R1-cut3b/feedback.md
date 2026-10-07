# Feedback on entropy-guard's skills, from this run

`entropy-assessment` asks for a note when it misrouted a system or left a step too implicit; `guards-integrator` asks
the same of itself. This run was not in the entropy-guard repository, so nothing was filed as an issue.

**Context:** a two-repository system, ORC (TypeScript) and the lab Scope that manages its work. Both were read-only
snapshots with no `.git`, and no steward was available.

1. **Docs-first Step 5 assumes the state file can be edited.**
   - What happened: the step says to "update the repo's existing state file". With read-only targets, the update
     could only be a patch.
   - It also had to avoid settling an open question about the file's own cap (forty content lines or sixty lines),
     so it was fitted to both readings and both sentences were left alone.
   - Suggestion: say "as a patch when the target cannot be edited", and say that a cap under question is met on both
     readings, or left unmet and named.
2. **The generator assumes one repository.**
   - What happened: the default path, `skills/session-coherence-guard/SKILL.md`, and the "What changed" commands are
     written for one repository. For a system assessed as one across two repositories, the skill does not say which
     one holds the guard, or that its git commands run in each.
   - I chose the lab, as the Scope that manages the work, and listed commands per repository.
   - Suggestion: one line on multi-repository systems.
3. **Copying a decision out of a state file can wait on an open question.**
   - What happened: the intent pass says to copy it "to its concern's durable record". Here, where ORC's decisions
     are recorded was itself the open question, so that copy became provisional.
   - The decision stayed only in the file that is overwritten. I kept it in that file meanwhile.
   - Suggestion: when the record is undecided, copy to the nearest existing decision record now and mark the location
     provisional. Losing a decision costs more than moving one later.
4. **"Check that a tool is installed before a guard depends on it" cannot always be done.**
   - What happened: this run forbade reading outside the targets. The guard makes lychee conditional on
     `command -v lychee`.
   - Suggestion: allow that form explicitly.
5. **The size budget's source is not shipped with the skills.**
   - What happened: the generator cites `explorations/2026-10-05-skills-size-review-astra.md` for its 36 words per
     check, but that file is not in the skills folder. A cold agent cannot check the figure.
6. **The intent-change rule reads awkwardly for a two-repository guard.**
   - What happened: the rule fills in `<decision surface>` as a single place. When that place differs by repository,
     and one is undecided, the filled-in rule had to point back to "Where things live" instead.
   - Suggestion: allow "the decision record named above".
