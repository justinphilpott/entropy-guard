# Upstream feedback on entropy-guard (from this run)

`entropy-assessment` and `guards-integrator` both ask for a note when the skills misfire, or leave a step too implicit,
in a way others would hit. I did not file these as issues: this run was not working in the entropy-guard repo, and no
web access was allowed.

The project context: the target was an older snapshot of entropy-guard itself (`447da9a`). It is a markdown-first
repo with one local guard and a reminder hook, and it was assessed by route A, then the generator, then the
integrator.

1. **"A guard inside entropy-guard points here instead" does not cover an older copy of the repo.**
   (`intent-change-rule.md:5`, category: guard-quality)
   - **What happened:** the target is entropy-guard, but its snapshot has no `skills/entropy-assessment/intent-change-rule.md`
     to point to. A pointer would have been a broken link, so the rule was copied in.
   - **Suggestion:** "points here instead, when this file exists in that repository; otherwise copy it".

2. **Is the guard's intent-change rule a change that "touches" an open question?** (category: skill)
   - **What happened:** the generator's contract makes every guard carry the intent-change rule, and the rule answers
     any open question about who may edit the intent documents. Q1 here was exactly that question, so installing the
     guard became provisional under "Rules along the whole route", although the rule defers to whatever the steward
     records. Nothing in the skills says whether a contract-mandated rule counts as touching such a question. Runs
     could reasonably go either way.
   - **Suggestion:** state it explicitly in `SKILL.md`'s patch-sorting rule or in the generator.

3. **Commands written into a guard are not required to be run before handover.** (generator Step 4 and Step 6,
   category: guard-quality)
   - **What happened:** my first broken-link command flagged every `https://` link, and matched its own source line.
     It looked right and was wrong, and only running it in a scratch checkout showed that.
   - **Suggestion:** add "run each command the guard contains once on a clean tree, and once on a deliberately
     broken case" to the generator's review list.

4. **Updating a guard in place leaves its name unaddressed.** (generator contract, category: skill)
   - **What happened:** the template says `name: session-coherence-guard`, while "update the repo's existing guard in
     place" keeps a different folder. agentskills.io ties the name to the folder, so I kept `entropy-guard`.
   - **Suggestion:** one clause: "keep the existing guard's name when updating in place".

5. **The shape tie-break has no criterion.** (`entropy-assessment` Step 2, category: assessment)
   - **What happened:** "If more than one shape fits, note it and take the riskiest" gives no measure of risk. For a
     repo whose product is workflow skills written in markdown, choosing A over D was a judgment call, and the two
     routes produce differently shaped analysis.
   - **Suggestion:** one line on how to judge risk, such as where the observed drift sits, or the recovery cost of the
     surface each shape analyses.
