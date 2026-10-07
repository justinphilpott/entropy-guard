# Feedback on entropy-guard's skills, from this run

The skills ask for a note wherever they misrouted the system or left a step too implicit, in a way others would hit.
These are the notes, each with what happened, a suggestion and the project context. They were not filed as issues:
this run had no web access, and the feedback helper was out of scope.

Project context for all of them: a markdown-first repository whose product is agent skills, with one local guard, a
non-blocking tracked hook, no CI, and no git history in the copy assessed.

## 1. A copied intent-change rule can contradict the target's own amendment rule, and nothing says how to deliver the guard then

- **What happened:** the target's INTENT.md invites any contributor to revise it. The rule the generator copies into
  every guard says intent documents change only on the steward's recorded decision. That makes the guard update itself
  touch an open question (Q1), because it replaces the old guard's "update INTENT.md" line. The generator says
  unresolved inputs stay visible, and `entropy-assessment` says to sort changes into settled and provisional patches.
  Neither says whether a whole guard can be provisional, or what runs meanwhile. I delivered the guard as provisional,
  added an "Open" line under its Intent section, and put the safe fixes to the existing guard in the settled patch.
- **Suggestion:** say in the generator's Steps what to do when the guard contract itself conflicts with a target rule.
  Many repositories have "living document, edit freely" intent files, so this will recur.

## 2. "Update the existing guard in place" against a template whose name is fixed

- **What happened:** the guard contract's front matter says `name: session-coherence-guard`, and the generator also says
  to update an existing guard in place. Here the existing guard is `skills/local/entropy-guard/`, and the skill format
  requires the name to match its folder. A cold agent following the template literally would rename the guard and
  break the references to its path in AGENTS.md, README.md and the hook.
- **Suggestion:** one clause in the contract: when updating in place, keep the existing name and path.

## 3. Choosing between shapes A and D has no tie-breaker beyond "take the riskiest"

- **What happened:** a repository whose product is workflow skills fits A (docs-first) and D (workflow-heavy) equally
  well. I compared the findings' recovery costs after the fact to justify A. That worked, but only because A's matrix
  also covers workflow drift.
- **Suggestion:** say that A's analysis covers workflow drift, so A is the default when markdown is the product, even
  if the workflow is the subject.

## 4. A "fresh agent session" is not context-free in every harness

- **What happened:** the integrator verifies discovery by asking a session with no context. In this harness a new
  session preloads the instructions of the repository it is launched from, which here name the same guard path. Its
  answer could not show what the target's own instructions achieve, so I reported the check `unknown`.
- **Suggestion:** ask the verifier to state what the fresh session preloaded, and to count the check only when that
  excludes the answer.

## 5. The size budget cites a file exported users do not have

- **What happened:** the generator's per-check average (36 words) cites `explorations/2026-10-05-skills-size-review-astra.md`,
  which is not in the skills folder. The rule could still be followed, but the number cannot be checked from what ships.
- **Suggestion:** quote the sample size and date inline, or ship the source with the skills.
