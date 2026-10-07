# Feedback on the entropy-guard skills used in this run

The skills ask for a note when one of them misrouted the system or left a step too implicit, in a way others would hit
(`entropy-assessment` "If this skill misrouted...", `docs-first-planning-assessment` Step 7, `guards-integrator`
"Feedback on entropy-guard"). I am not working inside the entropy-guard repository, so these notes are not filed as
issues. Context for all five: a docs-first, markdown-only repository with an existing guard, assessed read-only, with
no steward available.

## 1. The assessment names a generator section that does not exist

- **What happened:** `skills/entropy-assessment/SKILL.md:24` says the generator's inputs are "as listed in the
  generator's 'Before writing'". `skills/session-coherence-skill-generator/SKILL.md` v0.5.0 has no section by that
  name. The inputs are under "Inputs, and the guard decision" (lines 13-34). A cold agent searching for the heading
  finds nothing.
- **Suggestion:** point to "Inputs, and the guard decision", or rename that section.

## 2. "A guard inside entropy-guard points here instead" is ambiguous for a copy of entropy-guard

- **What happened:** `skills/entropy-assessment/intent-change-rule.md:5` tells a guard inside entropy-guard to point
  at the rule rather than copy it. The target here was an older entropy-guard that has no `intent-change-rule.md`, so
  pointing would have left a broken reference. I treated it as any other target and copied the rule.
- **Suggestion:** "A guard in a repository that contains this file points here instead."

## 3. The guard contract can settle an open intent question

- **What happened:** the generator requires every guard to carry the intent-change rule, whose step 4 forbids editing
  intent documents without the steward's recorded decision. This target's own `INTENT.md:3` invites anyone, agents
  included, to edit it directly. Copying the rule therefore decides an open intent question (Q3 here).
  `intent-pass.md` section 4 forbids installing a recommendation that needs a new decision, and generator Step 4
  checks patches against open questions. Neither says what to do when the mandatory contract is itself what settles
  the question. I drafted the guard as provisional and held back its installation.
- **Suggestion:** state that rule in the generator. When the intent-change rule conflicts with the target's own
  recorded instructions, record the conflict as an intent question, and deliver the guard as provisional until the
  steward answers.

## 4. The guard template has no place for historical material

- **What happened:** the docs-first risk "Superseded material nearby" needs the guard to know which folders are not
  current truth, but the template's "Where things live" lists only intent, state, decisions and external rules. I
  added a "Historical, not current truth" pointer.
- **Suggestion:** add an optional "Historical, not current truth: <paths>" line to "Where things live".

## 5. The size budget does not count filled-in standing checks

- **What happened:** the two standing checks are counted inside the 706-word common contract, with their
  placeholders. Filling them for a repo where 4 documents describe each skill and 2 restate the state added about 55
  words that no budget term covers. That showed up as unexplained excess.
- **Suggestion:** count the words a standing check gains when it is filled as part of the pointers term, or say that
  the excess is expected.
