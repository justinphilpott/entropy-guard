# Feedback on the entropy-guard skills, from this run

`entropy-assessment` and `docs-first-planning-assessment` both ask a run to note any place where a step was too
implicit "in a way others would hit". In entropy-guard, `skills/local/entropy-guard-feedback/SKILL.md` files these as
issues. This run had no web access, so they are listed here instead.

1. **It is unclear whether demoting a guard counts as a "guard change" under `none`.**
   - `entropy-assessment` Step 3 defines `none` as "no guard change is needed".
   - In the same breath it allows a reference-only system to "finish with a correction or a demotion".
   - Docs-first Step 7.1 lists "demote" as a verdict for an existing guard.

   In this run, retiring `skills/entropy-guard.md` was a demotion under `none`. It was not an `update`, and it was not
   generator work. The skills never say this outright, though. One sentence in Step 3 would settle it: "Retiring or
   demoting an existing guard is a `none` finish, not generator work."

2. **A question about a directive's provenance can make every correction that relies on it provisional.**
   - The intent pass says an undated, unattributed directive, such as a status banner, is still usable intent.
   - The rules then say a change "touches" an open question if it states as fact what the question asks.

   If a run asks "is this banner your decision?", every correction based on the banner becomes provisional. This run
   avoided that by asking only for the banner's date and decider, so it could be recorded, and not whether it holds.
   The intent pass could say so: "A question about recording a directive's date or author does not reopen the
   directive."

3. **The current-state fields fit a reference-only repository poorly.** Docs-first Step 5 asks for "active fronts" and
   "one to three next actions". A reference-only repository has no active fronts, and its one next action is "work
   elsewhere". A line saying that, for reference-only or retired systems, the state-file update is a status block
   (stage, source, where work went, misleading nearby material, open questions) would save the next run from adapting
   it.

4. **Nothing says what to do when commit history is unavailable.** The intent pass says to search "commit messages"
   before reporting that nothing records a decision, but a snapshot may have no `.git`. A line asking the run to
   report this as a coverage gap, and to recommend the `git log` query that would settle the point, would make the
   handling consistent across runs.
