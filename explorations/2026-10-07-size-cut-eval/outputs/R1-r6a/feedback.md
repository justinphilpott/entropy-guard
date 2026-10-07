# Feedback on entropy-guard's skills, from this run

The skills ask for a note wherever they misrouted or left a step too implicit, in a way others would hit
(`entropy-assessment`, last paragraph; `guards-integrator`, "Feedback on entropy-guard"). This run was outside the
entropy-guard repository, so these are notes, not filed issues. Context: two repositories assessed as one system, a
TypeScript code repository (ORC) and a docs-first repository that manages its work (the lab), as read-only snapshots
with no steward present.

1. **The guard contract assumes one repository.** `session-coherence-skill-generator` gives one default path, one state
   file and one baseline. `entropy-assessment` Step 2 says to assess a multi-repository system as one, but nothing says
   whether that system gets one guard or one per repository, or where a single guard lives. This run wrote one guard in
   the managing repository, with a pointer from the code repository, and ran the baseline in each repository touched.
   **Suggestion:** one sentence in the generator: for a multi-repository system, one guard in the repository that holds
   its state and decisions, the others pointing at it, with the baseline taken per repository.

2. **"Touches an open question" is unclear when a settled correction edits the same sentence.** "Scheduling" in ORC's
   README was settled by a recorded decision, but the sentence also held items that were not settled, and those became a
   question. A change "touches one if it edits the question's text". This run put the whole sentence in the provisional
   patch, which delays a correction the evidence settles. **Suggestion:** say whether "the question's text" means the
   sentence the question quotes, or only the words it asks about.

3. **Where to record a proposal when the decision surface is itself the open question.** `intent-pass.md` section 5
   records proposals "there", at the concern's decision owner. Here, where decisions about ORC are recorded was the first
   question, so every proposal about ORC had nowhere settled to go. This run drafted them inside the provisional patch.
   **Suggestion:** name a fallback, such as the state file's open-questions list, until the owner is decided.

4. **Step 5's live-fact rules assume the assessor can observe something live.** With read-only snapshots, no live fact
   can be refreshed. This run labelled every live fact with the date it was recorded and "not re-read", which the rules
   allow, but a sentence saying so would stop a cold agent wondering whether to drop such facts or keep them.

5. **The size budget's "pointers" term overlaps the common contract.** The template's "Where things live" labels
   ("Authorised intent:", "Steward:" and so on, 28 words) are counted in the 706-word contract and again in the filled
   bullets. **Suggestion:** say "the words added by filling the placeholders".

6. **`mixed-profile.md` asks to check that a tool is installed before a guard depends on it.** A run limited to reading
   named folders cannot check, and should say so. This run's guard depends on no external tool, and the assessment says
   the check was not made.
