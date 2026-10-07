# Feedback on entropy-guard, from this run

Each skill asks for a note when it misrouted a system or left a step too implicit, in a way others would hit. Context
for all four notes: two repositories assessed as one system, route B, with no steward present.

1. **A settled state-file update collides with questions that quote the state file.**
   - What happened: docs-first Step 5 rewrites the state file, and the intent pass's Step 5 moves steward decisions
     out of it. The route's rule then forbids a settled hunk from editing "text a question quotes". Here Q1 and Q5
     quoted `STATE.md`, so the rewrite had to keep one line byte-identical, and to move the quoted decisions
     verbatim into a decision record.
   - Suggestion: say whether moving quoted text verbatim to its durable owner counts as editing it, and whether a
     question should quote the durable record instead.
2. **A settled correction can share a line with questioned text.**
   - What happened: twice, a correction settled by a recorded decision sat in the same sentence or paragraph as text
     a question asked about. The scheduling item in the README's "Deliberately absent" list was one; the Bookwhen
     sentence in ORC's `AGENTS.md` was the other. The only compliant settled form was an inserted note after the
     paragraph, leaving a known-false phrase in place above it.
   - Suggestion: name this pattern in "Rules along the whole route", or allow a hunk to split a line so that only
     the settled clause changes.
3. **The guard contract assumes one repository.**
   - What happened: the template's description reads "Check this repository's coherence", and the default path
     names one repository's `skills/`. Step 2 routes multi-repository systems to one assessment, but nothing says
     where one guard for them lives or how its baseline step covers each repository. That became a steward question
     (Q1) and an added scope sentence, which no budget term counts.
   - Suggestion: add a multi-repository variant, or a slot for it.
4. **The size budget's "two standing checks" are ambiguous once replaced.**
   - What happened: the template's first standing check ("If <code area> changed: does <doc> still describe it?")
     was replaced by more specific checks, and the budget does not say how to count it. It was counted as replaced,
     giving 10 repo-specific checks.

One heuristic that helped, worth keeping: `mixed-profile.md`'s requirement to record the process that runs each hit.
It surfaced that the restart card's subprocesses inherit ORC's whole environment (F25), which "reads credentials
from" did not prompt directly. Naming inherited environments in that bullet would make it routine.
