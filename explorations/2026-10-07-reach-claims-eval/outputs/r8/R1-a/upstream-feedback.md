# Notes for entropy-guard

The skills ask for these: `entropy-assessment` ("note it") and `guards-integrator` ("Feedback on entropy-guard").
Each note gives what happened, a suggestion, and the context: a run on ORC and the orchestration lab, one system
across two repositories, on 2026-10-07.

1. **The guard contract assumes one repository.**
   - **What happened.** The generator writes to "the repo's" default path, and "What changed this session" binds a
     single baseline. Nothing in the skills says where a guard lives when the system spans two repositories, or how
     to bind two baselines. This run ran the git block once per repository touched, and asked the steward where the
     guard lives (Q2).
   - **Suggestion.** For a multi-repository system, the generator states:
     - the guard's home is the repository that owns the system's state file, unless the steward says otherwise;
     - "What changed" runs in each repository touched.
2. **A rewrite of the state file collides with the open-question rule.**
   - **What happened.** Docs-first Step 5 rewrites the state file. The rule "a change touches a question if it edits
     the question's text" then forced one quoted line (`STATE.md` line 4, "Target: sixty lines") to be kept verbatim
     inside an otherwise rewritten file, with its change moved to the provisional patch.
   - **Suggestion.** Say so explicitly in Step 5: "a rewrite keeps, verbatim, any line an open question quotes".
3. **The intent pass is silent when no guard exists.**
   - **What happened.** It says to read "every existing guard's repair instructions". With no guard, it does not say
     whether to read guard-like surfaces instead: CI checks, hooks, standing rules in `AGENTS.md`. This run read
     them, and found one instruction that could license documentation following the code (F16).
   - **Suggestion.** Add: "if there is no guard, read the standing instructions and checks that act as one".
4. **The size budget double-counts and misses a term.**
   - **What happened.** The 724-word common contract already includes the placeholder labels of "Where things live",
     which the pointers term then counts again. And a multi-repository "What changed" instruction has no term.
   - **Suggestion.** Count pointers as the words added over the placeholders, and allow a per-repository term.
5. **One question is a choice of guard placement.**
   - **What happened.** Q2 is about where the guard lives, which the intent pass does not cover as a gap condition.
     It was recorded as "Missing".
   - **Suggestion.** The generator could name "guard placement across repositories" as a question it may need to ask.
