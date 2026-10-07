# Feedback on the entropy-guard skills, from this run

**Context.** This run assessed a two-repository system: ORC, a TypeScript application, and the orchestration lab, a
docs-first Scope that manages ORC's work. Both were read-only snapshots, with no git metadata and no steward available.
The route was `entropy-assessment`, then the intent pass, then shape B through `mixed-profile.md`, plus docs-first
Steps 2, 3 and 5 on the lab, then the generator, then the integrator.

`entropy-assessment` asks for such notes, and `guards-integrator` asks for a short note on each misfire. In the
entropy-guard repository, `skills/local/entropy-guard-feedback/SKILL.md` would file them as issues. This run did not
open that skill or file anything.

Each note below says what happened and gives a suggestion.

1. **The guard template assumes one repository.**
   - **What happened:** "What changed this session", the `<upstream>` slot and "Where things live" have no place for a
     guard that covers two repositories, though `entropy-assessment` Step 2 tells you to assess them as one system. I
     added "In each repository the session touched" and a "Repositories" pointer.
   - **Suggestion:** one line in the contract for a guard that spans repositories.
2. **Decisions found outside a state file have no instruction.**
   - **What happened:** intent pass section 5 says to copy a steward decision found only in an overwritten state file.
     It says nothing about decisions found in dated reports or in code comments, which here were not overwritten but
     were not in a decision record either. I linked them from the decision record instead of copying them.
   - **Suggestion:** say whether to link or copy them.
3. **Discuss-first meets an absent steward.**
   - **What happened:** the generator makes Discuss-first the default for a change across repositories. The intent
     pass, with the steward absent, says to draft dependent work as provisional. I took that to mean: draft the guard,
     mark it provisional, install nothing.
   - **Suggestion:** one sentence in the generator saying how those two combine.
4. **The size budget is ambiguous about the copied intent-change rule.**
   - **What happened:** it is not clear whether the 450 words in "450 + 36 × J + S + C" include the copy of the
     intent-change rule (about 190 words). I counted it inside the 450. The guard came to 911 words against 913. If the
     rule is meant to be extra, the budget is understated.
5. **"Decided, not built" overlaps "declared, but missing"** (`mixed-profile.md`).
   - **What happened:** a steward listed "entropy guard at session end" among processes "kept", which implies it
     exists, with nothing behind it. It fits both categories.
   - **Suggestion:** a tie-break, such as: if the record speaks of it as existing, it is "declared, but missing".
6. **Tools that parse a state file make it a product artifact.**
   - **What happened:** `tools/map.mjs` in the lab parses one line of its `STATE.md`. Docs-first Step 2 classes
     `STATE.md` as current state only. Step 5, rewriting it, does not warn that a tool may read it.
   - **Suggestion:** in Step 5, "check whether any tool parses the state file before rewriting it, and keep that
     format".
7. **Read-only targets.**
   - **What happened:** docs-first Step 5 says "Update the repo's existing state file", and the generator's Step 1
     says "Record the work in the repo's current-state file". With read-only targets, both become one patch.
     Docs-first Step 6 allows "as a patch", but the generator does not mention it.
   - **Suggestion:** a minor wording change.
