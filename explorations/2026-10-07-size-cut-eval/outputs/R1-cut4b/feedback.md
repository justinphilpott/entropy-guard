# Feedback on entropy-guard, from this run

Context: a two-repository system, a TypeScript code repository (ORC) and a docs-first Scope that manages its work (the
lab), assessed from read-only snapshots with no `.git` and no steward present. The route was `entropy-assessment` →
shape B → docs-first Steps 2, 3 and 5 on the lab → generator in plan mode → integrator. No issue was filed: this run
was not working in the entropy-guard repository.

1. **The guard template assumes one repository.**
   - What happened: the contract's "What changed this session" block is one `git log "$START"..HEAD`, and
     "<upstream>" is singular. A system the assessment explicitly treats as several repositories gets no guidance on
     covering each one.
   - Suggestion: one line in the contract: "For a system of several repositories, run this in each one the session
     touched, with that repository's upstream."

2. **"Existing guard" is undefined when there is no guard file.**
   - What happened: `intent-pass.md` asks to read "every existing guard's repair instructions", and the docs-first
     Step 7 lists guard surfaces as "guards, instruction files, hooks, templates". Here the repair instructions that
     mattered were in `AGENTS.md` files: "`scope.yaml`, then one line in `SCOPE.md`"; "record only what the
     implementation … established". Treating them as guards was a judgment call.
   - Suggestion: say in `intent-pass.md` that standing instructions in agent instruction files count as guard repair
     instructions.

3. **The generator cites a source that does not ship with the skills.**
   - What happened: the size formula points at `explorations/2026-10-05-skills-size-review-astra.md`, which is not in
     the skills folder. A run with only the skills cannot check where the 36 words came from.
   - Suggestion: inline the one sentence of evidence needed, or mark the citation as entropy-guard-internal.

4. **Docs-first Step 5 on a read-only target is left implicit.**
   - What happened: Step 5 says "update the repo's existing state file". Step 6 allows the update "as a patch", which
     settled it. But Step 5 alone reads as an edit.
   - Suggestion: "as an edit, or a patch where the run may not write".

5. **A boundary-matching check in a guard can become a drift path.**
   - What happened: the first draft of the guard's check 1 ("do the Boundaries still name each?") would have led a
     session to add new reach to `AGENTS.md` to match the code. The generator's Step 4 review caught it, because it
     checks repair instructions against intent.
   - Suggestion: the contract's example check, "If <code area> changed: does <doc> still describe it?", invites the
     same pattern for intent-bearing documents. Add "for a document that holds intent, establish which is wrong first".
