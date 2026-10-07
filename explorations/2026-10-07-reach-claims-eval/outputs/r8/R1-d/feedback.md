# Feedback on entropy-guard, from this run

These are notes the skills ask for when a step was too implicit, in a way others would hit. Context: a two-repository
system (ORC, a TypeScript service, and the Scope that manages its work), read-only snapshots, no steward.

1. **Where one guard lives for a system of several repositories.**
   - **What happened:** the generator writes the guard at `skills/session-coherence-guard/SKILL.md` "in the repo",
     and `entropy-assessment` assesses several repositories as one system. Nothing says whether such a system gets one
     guard or one per repository, or where the one goes. It had to become a question for the steward (P4).
   - **Suggestion:** one line in the generator. For a multi-repository system, write one guard in the repository that
     holds the current-state file, and point to it from each repository's instructions, unless the steward says
     otherwise.
2. **Recording proposals when the decision surface itself is an open question.**
   - **What happened:** the intent pass says to record proposals in the decision owner, and the settled patch must
     touch no open question. One question here was where decisions about ORC are recorded (P5). Recording the
     proposals in the lab's `decisions/` follows current practice, but partly presumes that answer.
   - **Suggestion:** say that recording proposals is never itself a "change that touches an open question", and that
     they go to the current de facto decision owner when ownership is open.
3. **One provisional patch, or one per question.**
   - **What happened:** "Rules along the whole route" asks for "a separate patch marked provisional, naming each
     question". With five questions, one combined patch cannot be applied as each answer arrives. I wrote one per
     question and per repository, each checked to apply after the settled patch, alone and together.
   - **Suggestion:** say which form is intended.
4. **Reach through a library.**
   - **What happened:** the mixed profile's reach rule found Chromium launched through Playwright. The target's own
     architecture test missed it, because it searches for Node's own primitives.
   - **Suggestion:** a short example in the profile would make the point land: "search for libraries that launch
     processes or open connections, not only `child_process` and `fetch`".
5. **The size budget's standing checks.**
   - **What happened:** the 706-word common contract counts the template's two standing checks at placeholder size.
     Filled in, they grew from about 25 words to 59.
   - **Suggestion:** say whether filling a standing check counts against "checks" or is absorbed in the contract.
     Minor.
