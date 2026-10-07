# Feedback on the entropy-guard skills

`entropy-assessment` asks for a note wherever a skill misrouted the system or left a step too implicit, in a way others
would hit. These notes come from this run on 2026-10-07, on the entropy-guard snapshot 447da9a. They were not filed as
issues, because this run was not working in the entropy-guard repo.

1. **Category: assessment.** `entropy-assessment` Step 2 says that when more than one shape fits, take "the riskiest".
   Here both A (docs-first) and D (workflow-heavy) fit, but the shapes describe where risk lives, not how large it is,
   so the rule does not say how to compare them. I chose A because its matrix also covers workflow drift.
   - **Suggestion:** say what "riskiest" is measured by, for example the shape that holds the top-ranked risks.

2. **Category: guard-quality.** The generator lists "live operational state or spend that a session can change" as an
   input, but the guard contract's "Where things live" has no line for it. Here that state is the public GitHub issues
   the feedback helper creates. I added a "Live state" pointer to the guard.
   - **Suggestion:** give that input a line in the template.

3. **Category: guard-quality.** With no steward available, the intent-change rule that the contract requires in every
   guard can conflict with the target's own standing instruction. Here that instruction is `AGENTS.md:27`, "update
   INTENT.md and note why". The guard's required Intent section then touches an open question, so the whole guard
   became provisional. The skills say neither of these:
   - whether a guard can be installed with that section pending;
   - whether small settled fixes to the old guard are wanted in the meantime.

   I did both: the guard is provisional, and the old guard got settled fixes.
   - **Suggestion:** say which.

4. **Category: skill.** `intent-change-rule.md` says "A guard inside entropy-guard points here instead". The target was
   an older copy of entropy-guard without that file, so pointing at it would have made a broken reference. I copied the
   rule in.
   - **Suggestion:** say "points here when this file exists in the repo".

5. **Category: assessment.** `intent-pass.md` §5 records proposed intent changes in the decision owner, marked as
   awaiting the steward. Docs-first Step 5 puts the open questions in the state file. That gives the same questions two
   homes. I made `DECISIONS.md` the owner and kept one line per question in `TODO.md`.
   - **Suggestion:** state that split in one of the two places.
