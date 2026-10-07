# Feedback on entropy-guard's skills, from this run

Notes for the entropy-guard maintainer, as `entropy-assessment` ("If this skill misrouted the system or left a step
too implicit... note it"), `docs-first-planning-assessment` and `guards-integrator` ask. Not filed as issues: this run
was not working inside the entropy-guard repo and had no `gh` or web access.

**Project context:** a markdown-first repo with no code, whose product is a set of agent skills (an older snapshot of
entropy-guard itself), assessed read-only with no steward present and no `.git`.

1. **A target's own rule can contradict the intent-change rule, and nothing says how to write the guard then.**
   (skill: `session-coherence-skill-generator`, "The guard contract" / `intent-pass.md` "Steward absent")
   - **What happened:** the target's `INTENT.md` and `AGENTS.md` let any contributor revise `INTENT.md` with a dated
     note. The contract puts the rule ("Do not edit `<intent documents>`...") in every guard, while the steward-absent
     rule forbids enforcing a recommendation that needs a new decision. I kept the rule, added a visible "Open,
     awaiting the steward" paragraph that leaves the target's current instruction governing `INTENT.md` edits, and
     put its removal in the provisional patch.
   - **Suggestion:** name this case in the contract: when the target's existing directive conflicts with the rule
     and the steward is absent, the rule is carried with the conflict shown as an open input.
2. **The size budget has no term for open inputs that must stay visible.** (`session-coherence-skill-generator`,
   "Size") The 57-word open-question paragraph from item 1 put the guard 22 words over its budget (1,175 against
   1,153). Suggestion: a term for unresolved-input lines, which leave when the question is answered.
3. **"A guard inside entropy-guard points here instead" assumes the current repo.** (`intent-change-rule.md`) The
   target was an older entropy-guard with no `intent-change-rule.md`, so pointing would have left a broken
   reference. I copied the rule and named its upstream path. Suggestion: "points here when this file exists in that
   repository".
4. **It is unclear whether recording an open question as a proposal belongs in the settled or the provisional
   patch.** (`entropy-assessment`, "Rules along the whole route") A proposal entry carries the question's text and
   a recommended answer. I put the proposals in the settled patch, because `intent-pass.md` step 5 prescribes
   recording them and recording one decides nothing. Suggestion: say so, and say whether to write one provisional
   patch per question (I did, so that answers can be applied independently).
5. **"Take the riskiest" shape gives no way to compare shapes.** (`entropy-assessment` Step 2) Shapes A and D both
   fit a repo whose product is workflow skills. I chose A because docs-first Step 2's "product artifact" role and its
   workflow-drift row cover D's surface. Suggestion: one line on judging risk between shapes, such as "the shape whose
   analysis covers the other's surface".
6. **Fresh-session verification cannot be done from inside a nested or evaluation run.** (`guards-integrator` Step 5)
   This run's own context would have leaked into any "fresh" session, so I reported discovery as `planned`.
   Suggestion: name this case and say to report it as `planned`, with the reason.
