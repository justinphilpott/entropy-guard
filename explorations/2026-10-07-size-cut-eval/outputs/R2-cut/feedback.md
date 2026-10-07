# Feedback on entropy-guard's skills from this run

`entropy-assessment` and `guards-integrator` both ask a run to note any place where the skills misfired in a way others
would hit. These notes are for the entropy-guard maintainer.

Normally `skills/local/entropy-guard-feedback/SKILL.md` would file them as GitHub issues. This run did not use it,
because it had no web access and the target was not a working checkout, so nothing was filed.

1. **`intent-change-rule.md`: a guard "inside entropy-guard" is undefined for an older copy of entropy-guard.**
   - **What happened:** the rule file says "A guard inside entropy-guard points here instead." The target was an older
     snapshot of entropy-guard that has no `intent-change-rule.md`, so a pointer would have dangled. I copied the rule
     instead.
   - **Suggestion:** "points here instead, if this file exists in that repository; otherwise copy it."
   - **Context:** this applies to any run against a fork, or against an old checkout of this repository.

2. **`session-coherence-skill-generator`: the contract template fixes `name: session-coherence-guard`.**
   - **What happened:** the same skill says to update an existing guard in place. Under the agentskills.io format,
     `name` must match the folder, so here it had to stay `entropy-guard`. The template does not say to keep the
     existing name.
   - **Suggestion:** "keep the existing guard's name and path when updating in place."
   - **Context:** this applies to any repository that already has a guard.

3. **`session-coherence-skill-generator` Size: the formula leaves it unclear what counts toward S and the fixed 450.**
   - **What happened:** S is the words of "source pointers", but the template's own "Where things live" lines are
     already counted in the 450. I counted the whole section as S, which may double-count it by about 35 words.
   - **Suggestion:** say whether S is the filled section or only the words added beyond the template.

4. **`intent-pass.md`: the enacted reading assumes commit history.**
   - **What happened:** with a snapshot that has no `.git`, the skill gives no fallback. I used dated metadata in the
     skills, and transcript dates.
   - **Suggestion:** one line on what may stand in for commits, and a requirement to say that the enacted reading is
     weak when history is missing. `mixed-profile.md` already has an "unknown" class for guard surfaces.

5. **`guards-integrator` Step 5: the fresh-session test can be contaminated.**
   - **What happened:** when the assessing environment auto-loads the same `AGENTS.md` as the target, as it does when
     the target is entropy-guard assessed from inside entropy-guard, a "fresh" session is not fresh.
   - **Suggestion:** require the fresh session to run from a clean checkout of the target, with no host instruction
     files that mention the guard.
