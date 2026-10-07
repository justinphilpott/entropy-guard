# Feedback on entropy-guard's skills, from this run

`entropy-assessment` and `guards-integrator` ask for a note when a skill misrouted the system, or left a step too
implicit, in a way others would hit. `skills/local/entropy-guard-feedback/SKILL.md` files such notes only when the
work is inside the entropy-guard repo. This run worked on a snapshot, so the notes stay here and were not filed.

1. **The generator's template name conflicts with "update in place".**
   - **Skill:** `session-coherence-skill-generator`, "The guard contract".
   - **What happened:** the template fixes `name: session-coherence-guard`, while the same section says to update an
     existing guard in place. An existing guard at `skills/local/entropy-guard/` must keep `name: entropy-guard`,
     because the agentskills.io format requires `name` to match the folder.
   - **Suggestion:** say that an in-place update keeps the existing guard's name and the repo's metadata
     conventions.
   - **Context:** any repo that already has a guard.
2. **The skills do not say what to do when the guard's mandatory rule copy conflicts with the target's own practice.**
   - **Skill:** `session-coherence-skill-generator`, "Inputs, and the guard decision".
   - **What happened:** the target's `INTENT.md` and `AGENTS.md` invite agents to edit intent directly, and the rule
     every guard carries forbids that without a steward decision. Under "Rules along the whole route", installing the
     guard then touches an open question, so the whole guard update became provisional.
   - **Suggestion:** state that outcome explicitly, so a run does not either install the guard silently or drop the
     rule.
   - **Context:** common in young, agent-edited repos.
3. **The target can prescribe guard contents that contradict the generator's contract.**
   - **Skill:** `session-coherence-skill-generator`.
   - **What happened:** the target's `INTENT.md` says each guard carries a "system snapshot". The contract forbids
     copying state into a guard. Nothing said whether the target's prescription or the contract wins, so it became
     question Q5.
   - **Suggestion:** say that a target's own prescription about guard contents is a question for its steward, not
     something the generator overrides.
   - **Context:** repos that already have opinions about guards.
4. **The shape table's tie-break needs a way to rank risk.**
   - **Skill:** `entropy-assessment`, Step 2.
   - **What happened:** "If more than one shape fits, ... take the riskiest" gives no basis for which shape is
     riskier. This run ranked by where the top findings fell, which needs the findings first.
   - **Suggestion:** say "the shape whose analysis covers the highest-ranked risks", or allow a provisional choice
     that is revisited after the risks are ranked.
   - **Context:** docs-first repos that also export a workflow.
5. **The size rule leaves two things unclear.**
   - **Skill:** `session-coherence-skill-generator`, "Size".
   - **Pointers:** it does not say whether "Pointers: the words of the filled-in values" includes extra pointer lines
     a guard needs. This run included its "Triggered by" line.
   - **Filled-in Intent values:** it gives no term for the filled-in Intent-rule values (steward, intent documents),
     which add words to the common contract.
   - **Suggestion:** say whether each of these counts, and under which term.
