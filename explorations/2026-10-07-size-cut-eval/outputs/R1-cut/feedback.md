# Feedback on entropy-guard

The skills ask for this note when a step misrouted or was too implicit, in a way others would hit. It is not filed as
an issue, because this run did not work in the entropy-guard repository.

**Project context:** ORC, a TypeScript orchestrator, and the lab, a docs-first Scope that manages ORC's work. Both are
read-only snapshots, with no steward available.

1. **The generator cites a source the exported skills do not ship.**
   - What happened: the generator's Size section cites `explorations/2026-10-05-skills-size-review-astra.md` for the
     36-words-per-check average. That file is not in the skills folder, so a user of the exported skills cannot check
     the number.
   - Suggestion: state the sample size and date inline, or ship the file.

2. **The guard contract assumes one repository.**
   - What happened: the contract's default path (`skills/session-coherence-guard/SKILL.md`) and its "What changed"
     block (`$START` and `<upstream>`) assume one repository. `entropy-assessment` assesses a multi-repo system as one,
     but nothing says where its single guard lives, or how the change block covers two repositories.
   - This run had to raise that as a steward question (Q1) and adapt the block ("in each repository the session
     touched").
   - Suggestion: one sentence in the generator on placing the guard for a multi-repository system.

3. **Two mode rules met with no rule between them.**
   - What happened: the generator makes discuss-first the default for cross-repo changes, and the intent pass says
     "steward absent: draft dependent work as provisional". The skills do not say how the two combine. This run took
     "the stricter wins" to mean plan mode: draft, edit nothing, list what build mode would change.
   - Suggestion: say that explicitly.

4. **Verification commands can change live state, and nothing says to check.**
   - What happened: `mixed-profile.md` lists live operational state as a domain, and the guard contract has a slot for
     "repo commands that CI does not already run". Neither asks whether such a command changes live state. Here,
     `pnpm test:e2e` rebuilds `dist/web`, which the running service serves (F13). A guard that simply listed it would
     have caused that.
   - Suggestion: one line in the contract's Checks comment, such as "check each command for side effects on live
     state before listing it".

5. **The docs-first state-file step assumes the targets can be written.**
   - What happened: docs-first Step 5 says to update the existing state file. With read-only targets, Step 6's "as a
     patch" was the only route.
   - No change needed. It worked as written.
