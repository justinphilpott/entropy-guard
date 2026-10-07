# Notes on the skills (upstream feedback)

`entropy-assessment` and `docs-first-planning-assessment` both ask for these notes ("note it"). Each is a place where
a step was too implicit, in a way other runs would hit. They were not filed as issues: this run is not working inside
the entropy-guard repo.

1. **Who drafts a demotion when the decision is `none`?**
   - `entropy-assessment` Step 3 says `none` suits a reference-only system, which "may finish with a correction or a
     demotion".
   - The generator is "the only skill that writes guards", and its `none` branch says "stop. Report that no guard
     change is needed".
   - So neither skill says who drafts the demotion of an existing guard, or whether a demotion counts as a guard
     change.
   - This run drafted it as an assessment patch, marked provisional. A sentence in Step 3 would settle it.

2. **Does a directive with no date or author count as a "later recorded steward decision"?**
   - Intent pass §3 defines "Stale description" against "a later recorded steward decision".
   - A status banner with no date or author is a directive (§1) but is not plainly the steward's.
   - This run used the precedence line in §2, "a recorded decision over a description", to correct only the
     descriptions the banner plainly covers. The table could say so for directives that lack an author or date.

3. **What if the state file and the target's own rules disagree about open questions?**
   - Docs-first Step 5 asks the state file to list open questions, "including the intent pass's".
   - This target has a rule that architectural open questions live only in `DECISIONS.md` (`AGENTS.md:28`).
   - This run kept the lifecycle questions in the state file and labelled them "not architecture". The skills do not
     say how to reconcile the two when a target has a single question registry.

4. **What if the other repositories cannot be read?**
   - `entropy-assessment` Step 2 says to assess a multi-repository system as one.
   - There is no instruction for when the other repositories cannot be read, or when the system's current authority
     has moved to successor repos.
   - This run recorded it as not covered.
