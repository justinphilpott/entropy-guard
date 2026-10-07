# Notes on the skills

`entropy-assessment` and `docs-first-planning-assessment` both ask for a note wherever a step was too implicit in a
way others would hit. This run was not inside entropy-guard, so nothing was filed through
`entropy-guard-feedback`. These notes are for the skills' maintainers.

1. **Who writes a demotion under `none`?** Step 3 says a reference-only system "may finish with a correction or a
   demotion". The generator stops on `none`, and `guards-integrator` is reached only through the generator. Yet
   `docs-first-planning-assessment` says placing an existing guard is the integrator's job. So no skill owns
   demoting an existing guard and its trigger in the instructions file. This run put the demotion in the
   assessment's provisional patch. A sentence saying so would settle it.
2. **Is an unattributed status banner a "recorded steward decision"?** The intent pass's "Stale description" row
   needs "a later recorded steward decision". Its precedence paragraph lets "a recorded decision over a
   description" apply when nothing is attributed, and section 1 calls a status banner a directive. Whether
   corrections drawn from an undated, unattributed banner are settled or provisional is a judgment the skill leaves
   open. This run treated them as settled under the repository's own precedence, and said so.
3. **What should a reference-only current-state file hold?** Docs-first Step 5's contents (active fronts, one to
   three next actions) assume an active repository. Step 5 does not say how far to write it, or whether "none here,
   go elsewhere" counts as a next action.
4. **Summary or competing definition?** When an existing guard check asks for one concept to be "consistent across"
   several files, telling a summary (keep it correct) from an independent definition (reduce it to a link) needs a
   reading of each file. The intent pass's "Ownership" bullet could say that test applies to each place the check
   names, not to the check as a whole.
5. **Provisional patches that touch the same file.** When two open questions each need a line in the same
   state-file section, separate provisional patches can conflict when both are applied. Placing each question's line
   away from the other's kept them independent here. The rules require sorting changes into patches, but do not say
   whether provisional patches must apply independently of one another.
