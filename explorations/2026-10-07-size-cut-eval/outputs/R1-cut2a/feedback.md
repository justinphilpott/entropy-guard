# Feedback on entropy-guard, from this run

The skills ask for a note when they misroute or leave a step too implicit in a way others would hit
(`entropy-assessment`, Output; `guards-integrator`, "Feedback on entropy-guard"). Each note gives what happened, the
suggestion, and the context.

**Context for all four:** a two-repository system: ORC, a TypeScript orchestrator, and the orchestration lab, a
docs-first Scope that manages ORC's work. The run used read-only snapshots, and the steward was absent.

1. **The guard contract assumes one repository.**
   - **What happened.** The generator writes to `skills/session-coherence-guard/SKILL.md` "or the repo's existing
     guard". It does not say where the guard lives when the assessment covers two repositories as one system, or how
     a session that starts in the other repository meets it. Here that became a steward question (Q1), and the
     integrator had to invent a pointer for the second repository.
   - **Suggestion.** For a system of several repositories, say which repository owns the guard: the one that holds
     state and decisions. Each other repository's instruction file then gets one pointer line, and adoption is
     checked from each entry point.
2. **The size formula does not say whether J counts the template's own checks.**
   - **What happened.** The generator's budget is 450 + 36 × J + S + C. The template already carries two generic
     check lines: "two documents describe one thing" and "for each state claim changed". The formula does not say
     whether these count in J. This run left the first out and counted the second, made specific, in J.
   - **Suggestion.** State the rule in one clause.
3. **The size reference points outside the exported skills.**
   - **What happened.** The generator cites `explorations/2026-10-05-skills-size-review-astra.md` for the 36-word
     average. That file is not in the skills folder, so anyone using the exported skills cannot check the number.
   - **Suggestion.** Carry the measurement and its date in the skill, or link to a published copy.
4. **The route for a docs-first member repository omits the risk matrix.**
   - **What happened.** For shapes B to D with a docs-first member, `entropy-assessment` says to run docs-first
     Steps 2, 3 and 5. The docs-first risk matrix is in Step 4, and turning it into checks is Step 7. For the lab,
     the matrix's rows were the most useful source of guard checks: parallel truth, state dishonesty, lost
     decisions, brittle automation. This run applied them anyway.
   - **Suggestion.** Say whether Step 4's matrix applies to the member repository, and fold its checks into the one
     guard.
