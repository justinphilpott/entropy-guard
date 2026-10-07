# Feedback on entropy-guard from this run

`entropy-assessment` and `guards-integrator` both ask for a note when the workflow misfired in a way others would hit.
**Project context:** a two-repository system, ORC (TypeScript code) and the Scope that manages its work (markdown,
state file, small tools). Both were assessed from read-only snapshots, with no steward present. These notes are for
`skills/local/entropy-guard-feedback/SKILL.md` to file; this run was not inside the entropy-guard repository, so
nothing was filed.

1. **A guard for a system that spans repositories has no home in the contract.**
   - *What happened:* `entropy-assessment` Step 2 says to assess two repositories as one system. The generator's
     contract assumes one: "this repository's coherence", one default path, one git block, one upstream. Where a guard
     for both should live, and how "What changed this session" covers two checkouts, had to be invented. This run put
     the guard in the repository that manages the work and ran the git block per repository.
   - *Suggestion:* one paragraph in the generator for multi-repository systems: which repository hosts the guard, a
     per-repository git block, and an entry point from each repository.

2. **"Fix as usual" and "do not weaken a documented constraint" meet at capability lists.**
   - *What happened:* the intent pass fixes gaps that do not depend on intent "as usual". Rule 6 of the intent-change
     rule says code does not authorise weakening a documented constraint. A list of what a system reaches, launches or
     reads credentials from is both a description and a constraint when it says "only" or "exactly one place". Adding
     the missing member to such a list loosens the constraint. Here, adding Chromium to "direct network access exists
     only in…" was safe only because a recorded decision of the steward covered it. "No subprocess ORC launches
     receives one" had no such decision, so the right move was a code fix, not a doc fix.
   - *Suggestion:* in `intent-pass.md` or `mixed-profile.md`, say that a correction adding a member to a list worded as
     exclusive needs a citing decision, or else becomes a question or a fix to the work.

3. **Read-only targets and an absent steward leave some steps implicit.**
   - *What happened:*
     - `docs-first-planning-assessment` Step 5 and generator Step 1 say to update the repository's state file, and the
       docs-first skill has no plan mode. Step 6's "as a patch or the files changed" was the only clue for a read-only
       target.
     - The generator makes discuss-first the default for cross-repository work: propose the guard's shape before
       writing. With nobody to discuss it with, it does not say whether to draft anyway. This run drafted into the
       output folder and installed nothing.
   - *Suggestion:* say once, in `entropy-assessment`'s rules for the whole route, that with a read-only target every
     edit becomes a patch, and that with no steward discuss-first becomes "draft, mark provisional, install nothing".

4. **The size formula's terms are loose, and its source is not shipped.**
   - *What happened:* the generator cites `explorations/2026-10-05-skills-size-review-astra.md`, which is not in the
     skills folder. It is unclear whether the repository-specific lines in "What changed this session" count toward C
     or the 450.
   - *Suggestion:* define S and C by section, and either ship the reference or drop the path.

5. **What worked, so it is kept.** The `mixed-profile.md` instruction to search the code for every member of a kind,
   when a correction rewrites a capability list, found four omissions the prompting finding would not have:
   - the restart-card subprocess module;
   - the in-process browser;
   - the web-token read;
   - the Scope-credentials reader.
