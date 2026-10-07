# Feedback on entropy-guard

The notes `entropy-assessment` ("If this skill misrouted the system or left a step too implicit") and
`guards-integrator` ("Feedback on entropy-guard") ask for. Project context: a two-repository system, ORC (TypeScript
code) and the orchestration-lab Scope (Markdown state and decisions), assessed from read-only snapshots with no steward
present.

1. **The guard contract assumes one repository.** `entropy-assessment` Step 2 says to assess a code repository and the
   repository that manages its work as one system, but the generator's template binds one baseline ("Find the commit
   the session started from") and the default path `skills/session-coherence-guard/SKILL.md` names no repository.
   Here I added one sentence ("Run the block in each repository the session touched") and asked the steward where
   the guard lives (Q1). Suggestion: the template says "in each repository the session touched", and the generator's
   inputs include "which repository holds the guard, for a system that spans several".

2. **The size budget has no term for keeping unresolved inputs visible.** The generator requires unresolved inputs to
   stay visible in the guard, and that note was the only reason this guard ran 32 words over its budget (1,155
   against 1,123). Suggestion: count unresolved-input notes as their own term, or leave them out of the budget since
   they are removed once answered.

3. **The 36-word planning average cites a file outside the exported skills.** The generator's "Size" section points
   at `explorations/2026-10-05-skills-size-review-astra.md`, which is not in the skills folder, so a user of the
   exported skills cannot check it.

4. **`git diff --check` has no equivalent named for patch-only output.** When the target cannot be edited (read-only
   snapshots, or discuss-first across repositories), the work is a patch. I used `git apply --check
   --whitespace=error-all` on fresh copies, which also proves the patch applies. Suggestion: name it in the
   generator's Step 6.

5. **The "everything of a kind" rule names patterns for network and launches, not for storage.** `mixed-profile.md`
   and the rule list the kinds (reaches, launches, stores, reads credentials from) but suggest search patterns only
   for connections and launches. A short pattern list for writes (file writes, databases, browser storage) would help
   the "stores" case.
