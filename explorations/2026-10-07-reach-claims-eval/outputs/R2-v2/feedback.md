# Feedback on entropy-guard's skills

These notes come from this run, as `entropy-assessment` ("If this skill misrouted…"), `docs-first-planning-assessment`
Step 7 and `guards-integrator` ("Feedback on entropy-guard") ask. They were not filed as issues: the network was not
used, and this run was not working in the entropy-guard repo.

**Project context.** The target is an older snapshot of entropy-guard itself:
- markdown-first, with 17 markdown files and one shell hook;
- an existing local guard;
- no git history and no CI;
- the steward absent.

---

1. **The skills give no interim text when the contract's intent rule conflicts with a standing directive in the
   target.**
   - **What happened:** the generator's contract requires the intent-change rule to be copied into the guard. The
     intent pass says never to install a recommendation that needs a new decision. Here the target's own directives
     (INTENT.md:3, AGENTS.md:27) let agents edit INTENT.md, so whether the rule replaces them was an open question.
     Neither skill says what the guard should say meanwhile.
   - **What I did:** kept the target's current text in force, verbatim, and marked the rule provisional inside the
     guard. That costs 55 words of budget.
   - **Suggestion:** one sentence in the generator's contract, saying that where the rule's step 4 conflicts with an
     open intent question, the guard keeps the current text in force and marks the rule provisional.

2. **"A guard inside entropy-guard points here instead" fails for an older copy of entropy-guard.**
   - **What happened:** `intent-change-rule.md` says a guard inside entropy-guard should point at the rule file rather
     than copy it. The target is entropy-guard but has no such file, so a pointer would dangle.
   - **What I did:** copied the rule.
   - **Suggestion:** "points here instead, if this file exists in the same checkout".

3. **The contract's fixed `name:` clashes with an in-place update under a naming rule.**
   - **What happened:** the template sets `name: session-coherence-guard`. Updating an existing guard in place, in a
     repo bound by the agentskills.io rule that a skill's name matches its folder, needs the existing name kept
     (`entropy-guard`).
   - **Suggestion:** "on an in-place update, keep the guard's existing name and path".

4. **"Take the riskiest" shape gives no way to compare risk before analysis.**
   - **What happened:** shapes A (docs-first) and D (workflow-heavy) both fit a repo whose product is instruction
     files. I chose A because the target's own record names docs-to-docs drift as its primary vector, and because A's
     risk matrix already covers workflow drift.
   - **Suggestion:** say that when A and D both fit, A is taken, because its matrix includes workflow drift.

5. **The rule on claims about everything of a kind is unclear for negative claims.**
   - **What happened:** the rule covers "any list or 'only' claim" of what a system reaches or launches. The target's
     claims were negative ("no application runtime", "No build, test, or runtime commands"). I treated them as
     covered, and the search found one network reach (`gh issue create`) and one launched hook.
   - **Suggestion:** add "or a claim that there is none".
