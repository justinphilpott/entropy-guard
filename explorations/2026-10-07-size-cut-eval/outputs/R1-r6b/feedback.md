# Feedback on entropy-guard, from this run

Notes for `skills/local/entropy-guard-feedback/SKILL.md` to file, as `entropy-assessment` and `guards-integrator`
ask. Project context: one system of two repositories, a TypeScript application (ORC) and a docs-first repository
that manages its work (the orchestration lab), read-only snapshots, no steward present.

1. **The generator's contract assumes one repository.** `entropy-assessment` Step 2 says to assess a multi-repository
   system as one, but the generator's guard contract binds one baseline ("Find the commit the session started from")
   and one default path ("Write it at ... `skills/session-coherence-guard/SKILL.md`"), and says nothing about one
   guard per repository or one for the system. This run added a sentence telling the guard to check each repository
   the session touched, and had to ask the steward where the guard lives. Suggestion: say in the generator what a
   multi-repository guard binds and where it lives, or which question to ask.

2. **Copying a decision out of a state file, when its owner is the open question.** `intent-pass.md` Step 5 copies a
   steward decision found only in an overwritten state file "to its concern's durable record". Here, decisions about
   ORC's direction had no named record, which was itself a question. The skill does not say whether such a copy is
   settled or provisional. This run made the copy settled where the concern's owner was clear (the lab's own role)
   and provisional where it was the open question. Suggestion: state that rule.

3. **Telling a boundary from a description.** "Observed behaviour never authorises changing a prescribed boundary"
   carried the run, but ORC's lists are phrased as descriptions ("Subprocess access exists in ..."; "No subprocess
   ORC launches receives one"). The run settled one by the system's precedence (a directive elsewhere in the same file
   outranks a description) and asked about the other. Suggestion: a line on how to read a descriptive sentence that
   functions as a boundary.

4. **The state-file update against a disputed size limit.** Docs-first Step 5 brings the state file up to date, but
   here its size limit was the subject of a conflict. Keeping the limit's text unchanged and reporting the result
   against both values worked; the skill could say so.

5. **Size terms.** The generator's budget counts the common contract, checks, pointers and commands. Three kinds of
   content fall outside all four: a scope sentence for a two-repository guard, the filled-in values of the
   intent-change rule's placeholders, and an adapted template comment. Suggestion: say whether filled placeholders
   count as pointers.

6. **Patch granularity.** "A separate patch marked provisional, naming each question" reads as one provisional patch.
   With four independent questions, one patch per question per repository let each answer be applied alone.
   Suggestion: say one per question.
