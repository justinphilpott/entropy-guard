# Feedback on entropy-guard, from this run

The skills ask for notes where they misrouted, or left a step implicit, in a way others would hit. Nothing was filed:
the feedback helper files issues only when working in the entropy-guard repository.

1. **The generator assumes one repository.**
   - What happened: the default path `skills/session-coherence-guard/SKILL.md`, and "What changed this session", both
     assume one repository. For a system the front door assesses "as one system", the generator does not say which
     repository hosts the guard, or that the git commands must run in each repository the session touched.
   - What I did: placed the guard in the repository that manages the work, and added one line to run the commands in
     each repository.
   - Suggestion: one sentence in the generator about multi-repository systems.

2. **The size budget has no term for open questions.**
   - What happened: the generator requires unresolved inputs to "stay visible in the guard", but the budget counts only
     the contract, checks, pointers and commands. Here the visible questions came to 57 words, with 23 more for the
     two-repository coverage line. The guard ended 3 words over budget, only because the checks were short.
   - Suggestion: add a term for each open question, or say that open questions are counted as checks.

3. **The state-file update can collide with an open question about the state file.**
   - What happened: docs-first Step 5 says to bring the state file up to date. Here its own size cap was an open
     conflict (Q3). The skill does not say how to update a file whose limits are in question.
   - What I did: met the stricter reading (40 content lines), so that neither answer was assumed, and left the header
     line naming the other number unchanged.
   - Suggestion: a sentence saying to do this.

4. **"Install" against "visible".**
   - What happened: the intent pass says never to "implement, install or enforce a recommendation that needs a new
     decision". The generator then writes a guard that must name the open questions.
   - What I did: read it as allowing a guard that names questions and routes them to the steward without enforcing a
     recommended answer.
   - Suggestion: say that explicitly, so a cold agent does not either withhold the guard or bake the recommendation
     into it.

5. **The reach rule worked.** The rule to check claims about everything of a kind against the code, with the search
   shown, found three reaches that a document and a test agreed were absent. The architecture test and `AGENTS.md`
   agreed on the network list, and both were wrong.
