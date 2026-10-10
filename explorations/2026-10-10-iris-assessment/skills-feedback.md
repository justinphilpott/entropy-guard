# Feedback on entropy-guard's skills, from this run

Each skill ends by asking for a note when a step misrouted the system, or was too implicit for a cold agent to
follow. These five came up while running the skills on Iris-app and the orchestration lab, a system that spans two
repositories, on 10 Oct 2026. Each gives what happened, a suggestion, and the context.

1. **The guard contract assumes a single repository.**
   - **What happened.** entropy-assessment says to assess a multi-repository system as one system. The generator
     then writes one guard to `skills/session-coherence-guard/SKILL.md` "in the repository". The template's fixed
     description reads "Check this repository's coherence", and its baseline block has a single `<start>`.
   - **What I did.** I kept the template's text and added one paragraph on finding `<start>` in each repository. I
     asked the steward where the guard lives (Q1).
   - **Suggestion.** The generator could say where a guard lives when the system spans repositories: the repository
     that holds the state file, with a pointer from the others. Its baseline section could say "run in each
     repository the session touched". The paragraph I added cost 61 words, counted under commands.

2. **Nothing says how to split patches across repositories.**
   - **What happened.** "Rules along the whole route" sorts patches into settled and provisional. A patch, though,
     applies to one repository.
   - **What I did.** I split each kind by repository, and based each provisional patch on its settled one.
   - **Suggestion.** Say so in the rules, and require a statement of the order in which the patches apply.

3. **docs-first Step 5 does not fit a state file that churns.**
   - **What happened.** The step says to update the state file "as a patch or the files changed". This system's
     `STATE.md` changes 17 to 61 times a day, so a patch against the snapshot conflicts before anyone reads it.
   - **Suggestion.** For a state file that changes more than daily, deliver its update as a list of claims to add or
     correct, each with its source, alongside the patch.

4. **mixed-profile's reach check needs a word on test blind spots.**
   - **What happened.** mixed-profile already warns that "a document and a test that agree are not evidence of
     completeness". Here the architecture test matched text patterns in `src/`. It could not see a library that
     launches a browser, a DNS lookup, or `fetch` passed as a value.
   - **Suggestion.** Add one line: when a test enforces a reach list, read the test's patterns and list what they
     cannot see.

5. **The intent pass gives no order for a busy decision record.**
   - **What happened.** Section 1 says to search "the code and commit messages around the thing in question" before
     reporting a decision missing. In this system the decisive record was often a dated commit to the state file:
     the pause, the merge grant, the north star. It was found by `git log -S` on `STATE.md`.
   - **Suggestion.** Name `git log -S` on the state file as the first search for a decision whose only home is an
     overwritten state file.
