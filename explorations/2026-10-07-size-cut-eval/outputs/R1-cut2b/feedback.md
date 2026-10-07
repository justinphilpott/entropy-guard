# Feedback on entropy-guard from this run

`entropy-assessment` and `guards-integrator` both ask for a note when a skill left a step too implicit, in a way
others would hit. Context: one system in two repositories, ORC (code) and the lab Scope that manages its work. Read-only
snapshots, no steward. Nothing was filed as an issue.

1. **A guard for a system in two repositories has no placement rule.** `entropy-assessment` says to assess two
   repositories as one system. But the generator's contract writes one guard at one repository's
   `skills/session-coherence-guard/SKILL.md`, with one `git` block and one state file. Which repository holds the
   guard, and how its "What changed" block covers both, had to be invented, then asked of the steward (Q1).
   **Suggestion:** a sentence in the generator, such as "for a multi-repository system, one guard lives with the
   state file; each other repository's instruction file points at it", plus a note in the integrator on checking
   each repository's agent entry point.
2. **The intent pass's copy rule and its no-settling rule meet when there is no named decision record.** §5 says to
   copy a STATE-only decision "to its concern's durable record". Here nothing names the decision record, and that is
   itself an open question (Q2). **Suggestion:** "copy to the existing decision log, and name the open question the
   location touches".
3. **What J counts is unclear.** The generator's size rule does not say whether the template's two standard check
   lines count in J. I counted them, which gives the higher budget. **Suggestion:** say which.
4. **A dangling reference.** The generator cites `explorations/2026-10-05-skills-size-review-astra.md`, which the
   exported skills folder does not contain. A reader of the exported skills cannot follow it.
5. **"Check that a tool is installed" cannot be done from a snapshot.** It cannot be done on the target machine
   from a snapshot. **Suggestion:** say to record it as unknown, and keep the guard independent of the tool.
6. **"Runs by itself" mixes two kinds of evidence.** For Danger, I saw only the configuration plus a state-file
   claim that it ran. The integrator separates configuration from execution evidence; `mixed-profile.md`'s
   guard-surface sort could ask for the same label.
