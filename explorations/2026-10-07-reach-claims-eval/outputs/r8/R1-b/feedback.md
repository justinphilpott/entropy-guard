# Feedback on entropy-guard from this run

These are notes, as `entropy-assessment` and `guards-integrator` ask. They were not filed: this run was not working in
the entropy-guard repository.

1. **A guard for a system that spans two repositories has no stated home.** The generator writes "the repo's" guard
   at `skills/session-coherence-guard/SKILL.md`. Nothing says whether a system of two repositories gets one guard
   or one per repository, or where a single guard lives. Here it became steward question Q1. Suggestion: one line in
   the generator saying a multi-repository system gets one guard, kept in the repository that manages the work,
   with a pointer from each of the others.
2. **Telling a description from a prescription took judgement.** README's "No subprocess ORC launches receives
   [a credential]" reads as a description, but the code violates it and `src/runtime.ts` states the same rule as a
   "Never". "Observed behaviour never authorises changing a prescribed boundary" was the right rule. Spotting that a
   sentence was a boundary was not mechanical. Suggestion: treat any never, only or must claim, and any claim a
   test or review is cited for, as prescribed until a decision says otherwise.
3. **The size budget leaves the filled standing checks unclear.** It counts checks "beyond the template's two
   standing ones", plus pointers and commands. It does not say whether the extra words of the two filled standing
   checks, or a guard's scope sentence, count. This run left them inside the actual size and outside the budget
   terms.
4. **Five questions were tight for two repositories.** One real ambiguity, whether ORC's `config/installation.ts` is
   core, was recorded as open but not asked. That seems right, but the intent pass could say so: an ambiguity
   beyond the five is recorded with its readings and left open.
5. **Read-only targets.** Docs-first Step 5 and generator step 1 assume the state file can be edited. With read-only
   snapshots, everything became patches. "In plan mode … list the files build mode would change" nearly fits; a line
   about read-only targets would remove the guesswork.
