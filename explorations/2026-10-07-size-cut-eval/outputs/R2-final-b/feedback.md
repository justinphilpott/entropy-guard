# Feedback on the entropy-guard skills used in this run

These are notes on the skills in `tool-final/skills`: `entropy-assessment` 0.9.0, `docs-first-planning-assessment`
0.3.0, `session-coherence-skill-generator` 0.5.0 and `guards-integrator` 0.4.0. The skills ask for such notes to be
written down. They were **not filed**: this run had no web access, and `skills/local/entropy-guard-feedback` files
issues only when working in the entropy-guard repo itself.

The route itself did not misfire. The target classified cleanly as shape A, and each handover was explicit.

1. **A heading name that does not exist.**
   - **Category:** skill.
   - **What happened:** `entropy-assessment`, "Called for analysis only", says to return "the generator's inputs, as
     listed in the generator's 'Before writing'". The generator has no heading of that name; its list is under
     "Inputs, and the guard decision". A cold agent looks for a section that is not there.
   - **Suggestion:** use the real heading name.
2. **"A guard inside entropy-guard points here instead."**
   - **Category:** guard-quality.
   - **What happened:** `intent-change-rule.md` gives this instruction, but the target here was an older copy of
     entropy-guard that has no `intent-change-rule.md`, so a pointer would have been a broken link. I copied the rule
     in instead.
   - **Suggestion:** "points here instead, when this file exists in that repository; otherwise copy it as for any
     other repo".
3. **When updating in place, the existing guard's name should win.**
   - **Category:** guard-quality.
   - **What happened:** the generator's contract fixes `name: session-coherence-guard`, and also says "or update the
     repo's existing guard in place". Here the existing guard is `skills/local/entropy-guard/`, and the repo's
     agentskills rule says `name` must match the folder. I kept `entropy-guard`, but nothing in the contract says to.
   - **Suggestion:** add "keep the existing guard's name and path when updating in place".
4. **Who "asked" for a commit.**
   - **Category:** guard-quality.
   - **What happened:** the contract says "Never commit or push unless asked". In a repo whose standing instruction
     is "Commit early, commit often" (this target's AGENTS.md), it is unclear whether that standing instruction
     counts as the ask.
   - **Suggestion:** say that the guard itself never commits, and that the repo's own practice governs the commit
     after it.
5. **How to count the pointer budget term.**
   - **Category:** skill.
   - **What happened:** the generator's size budget counts "the words of the filled-in 'Where things live' values",
     but the template's own labels and placeholders are already inside the 706-word common contract. I counted the
     filled bullets minus the template's bullets (85 − 28 = 57) to avoid counting them twice; other agents may count
     differently.
   - **Suggestion:** state the counting method. Also, the 36-word average cites
     `explorations/2026-10-05-skills-size-review-astra.md`, which is not part of the exported skills, so an agent
     outside the repo cannot check it.
