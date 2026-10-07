# Feedback on the entropy-guard skills

The skills ask for a note wherever they misrouted a system or left a step too implicit, in a way others would hit.
These notes are about the skills in `eval2/tool-cut2`, not about the target. They were not filed as issues:
`skills/local/entropy-guard-feedback/SKILL.md` files issues only when the run is working in the entropy-guard repo,
and this run had no web access.

1. **The rule-copying requirement collides with the open-question rule.**
   - What happened: the generator's guard contract requires a copy of the intent-change rule. Rule step 4 forbids
     editing intent documents without a recorded steward decision.
   - Here, the target's own documents invite agents to edit `INTENT.md` directly. That made the rule's subject the
     open question Q1.
   - `intent-pass.md` then says a patch must leave the text an open question is about unchanged, and must never
     "implement, install or enforce" an undecided recommendation.
   - The guard therefore had to be drafted as provisional, with its Intent section marked as pending.
   - Suggestion: the generator should say what to do when the steward has not yet adopted the rule itself. For
     example: draft the guard, mark it provisional, and do not install it until the decision is recorded.
2. **A pointer would have been broken in an older copy of entropy-guard.**
   - What happened: `intent-change-rule.md` says "A guard inside entropy-guard points here instead."
   - The target was an older copy of entropy-guard that does not contain `intent-change-rule.md`, so the pointer would
     have led nowhere. The rule was copied instead.
   - Suggestion: make the exception conditional on the file existing in the repo being guarded.
3. **The source for a size constant does not ship with the skills.**
   - What happened: the generator's "Size" section cites `explorations/2026-10-05-skills-size-review-astra.md` as the
     source of the 36-words-per-check figure.
   - That file is not in the skills folder, so someone using the exported skills cannot check the number.
   - Suggestion: ship the one-line derivation inline, or ship the file.
4. **The guard template's name clashes with refining an existing guard in place.**
   - What happened: the template's front matter hard-codes `name: session-coherence-guard`.
   - When an existing guard is refined in place, the agentskills.io convention requires the name to match the
     directory. Here that is `entropy-guard`.
   - Suggestion: one line saying that an in-place refinement keeps the existing name.
5. **Shapes A and D both fit, and the rule for choosing comes too early.**
   - What happened: a markdown repo that also exports workflow skills fits both A and D.
   - "Take the riskiest" asks for a risk judgment before the analysis that produces one.
   - Minor. A tie-breaker such as "prefer A when Markdown is the only artifact" would make runs consistent.

Context for all five: a docs-first, markdown-only repo whose product is agent skills. It is a read-only snapshot with
no git history, and no steward was available.
