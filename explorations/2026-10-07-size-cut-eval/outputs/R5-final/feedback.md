# Feedback on entropy-guard's skills

Notes asked for by `entropy-assessment` ("If this skill misrouted the system or left a step too implicit") and
`guards-integrator` ("Feedback on entropy-guard"). Not filed as issues: this run has no web access, and
`skills/local/entropy-guard-feedback/SKILL.md` was not opened.

1. **A dangling section name.** `skills/entropy-assessment/SKILL.md`, "Called for analysis only", returns "the
   generator's inputs, as listed in the generator's 'Before writing'". The generator has no "Before writing" section;
   its inputs are under "Inputs, and the guard decision". Suggestion: name that section.
2. **Pointer or copy, when the target is entropy-guard itself.** `intent-change-rule.md` says "A guard inside
   entropy-guard points here instead." This target is an older entropy-guard without that file, so a pointer would
   be a broken link. This run copied the rule. Suggestion: say "points here when the file exists in the same repo".
3. **The template's fixed name versus updating in place.** The contract fixes `name: session-coherence-guard` and
   also says "or update the repo's existing guard in place". Here the existing guard lives in
   `skills/local/entropy-guard/`, and the repo follows the agentskills.io rule that a skill's name matches its folder.
   This run kept `entropy-guard`. Suggestion: say that an in-place update keeps the guard's existing name.
4. **The size term's source is not shipped.** The 36-word check average cites
   `explorations/2026-10-05-skills-size-review-astra.md`, which is not in the exported skills, so a user cannot check
   it. Small.
5. **Shape ties.** `entropy-assessment` Step 2 says to "take the riskiest" when shapes A and D both fit, without
   saying how to compare them. Here A was taken because its matrix already includes workflow drift. Suggestion: say
   that A covers D's risks when the workflow lives in markdown.
6. **Fresh-session check.** `guards-integrator` Step 5 asks a session with no context to find the guard. On a
   machine where every session loads the live repo's instructions, a clean test of a snapshot is not possible. This
   run reported it as `planned`. Possibly niche.
