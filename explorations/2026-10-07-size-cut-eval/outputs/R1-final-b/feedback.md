# Feedback on entropy-guard's skills, from this run

The skills ask for notes wherever a step misrouted the system, or was left too implicit, in a way others would hit
(`entropy-assessment` end, `docs-first-planning-assessment` end, `guards-integrator`, "Feedback on entropy-guard").
`skills/local/entropy-guard-feedback/SKILL.md` files these as issues only "when working in this repo". This run worked
on other targets, so that skill was not opened and nothing was filed.

Project context: ORC, a TypeScript orchestration system, and the lab Scope that manages its work. The repositories were
read-only snapshots, and no steward was present.

1. **The guard contract assumes one repository.**
   - What happened: the template says "Check this repository's coherence", gives one default path, and binds one
     `<start>` baseline. Entropy-assessment Step 2 tells the assessor to treat two repositories as one system, but the
     generator says nothing about a guard that spans them. I added "Do this in each repository the session touched",
     and the home of the guard became a steward question (Q4).
   - Suggestion: one sentence in the generator on multi-repository guards: the baseline per repository, and the home
     chosen by who owns the cross-repository checks.

2. **Docs-first Step 7.3 repeats entropy-assessment Step 3.**
   - What happened: for routes B to D with a docs-first member, entropy-assessment runs docs-first Steps 2, 3, 5 and 7
     "and folds the results into the one assessment". Step 7 includes making the guard decision, which
     entropy-assessment Step 3 also makes.
   - Suggestion: say that Step 7.3 is skipped when the steps run inside another route.

3. **The size budget has no term for the filled standing check.**
   - What happened: the first standing check ("If <code area> changed: does <doc> still describe it?") naturally
     becomes a map of code areas to docs, about 100 words here. The budget counts it as neither a check nor a pointer,
     so the guard came out 59 words over for that reason alone.
   - Suggestion: count the filled area-to-doc map under "Pointers".

4. **Five questions is tight for two repositories.**
   - What happened: six gaps met the bar for asking. One (whether three boundary extensions were authorised) covers
     three statements that share one choice. It was asked as one question, which bends "each one about a choice".
   - Suggestion: say whether grouped instances of one choice may form one question.

5. **A state-file cap in conflict, during the Step 5 rewrite.**
   - What happened: "A patch that settles an open question is a decision" made the rewrite of `STATE.md` awkward while
     its two caps (40 and 60) conflict. Landing under the stricter cap, with the conflicting text left unchanged,
     satisfied both readings without settling either.
   - Suggestion: worth a line as the general tactic, since state files often carry their own targets.

6. **Read-only or snapshot targets.**
   - What happened: "Check that a tool is installed before a guard depends on it" (`mixed-profile.md`) and "verify
     adoption" both assume the assessor can touch the real environment. With a snapshot, both end as "not checked" or
     "planned".
   - Suggestion: the integrator's "unknown" status covers this. Mixed-profile could say the same for tools: record "not
     checked", and do not depend on the tool.
