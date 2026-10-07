# Feedback on entropy-guard itself

These notes respond to the request in `entropy-assessment` ("If this skill misrouted the system or left a step too
implicit… note it") and in `guards-integrator` ("Feedback on entropy-guard"). They were not filed as GitHub issues,
because this run had no web access. Each note is written so the maintainer can file it as it stands.

## 1. When the target's own rule conflicts with the intent-change rule, the guard cannot be installed, and nothing says what to do meanwhile

- **Category:** guard-quality.
- **What I observed:**
  - The generator's contract puts the intent-change rule in every guard.
  - The target's `INTENT.md:3` and `AGENTS.md:27` tell sessions to edit `INTENT.md` themselves, so the two conflict.
    The intent pass makes that a steward question.
  - "Steward absent" says never to install or enforce anything that needs a new decision.
  - So the whole updated guard waits, including eight settled checks. The generator does not say whether to ship the
    guard without its Intent section, keep the old guard and patch it, or block. I kept the old guard, patched its
    stale references in the settled patch, and held the new one.
- **Suggestion:** add one sentence to the generator's Steps, covering what to deliver when the intent-change rule
  itself depends on an open question.
- **Project context:** a markdown-first skills repo whose north star invites agents to edit it.

## 2. Does recording a proposal at the decision owner "touch" an open question?

- **Category:** skill.
- **What I observed:**
  - `intent-pass.md` step 5 says proposed intent changes are recorded at the decision owner, marked as awaiting the
    steward.
  - `SKILL.md`'s sorting rule says a change touches a question if it "edits the question's text", and that such
    changes go in the provisional patch, not to be applied.
  - A proposal entry is the question's text, so read literally the proposal could never be recorded until the
    question is answered.
  - I put the proposals in the settled patch, because they state nothing as fact.
- **Suggestion:** say explicitly that a proposal marked "awaiting the steward" belongs in the settled patch.
- **Project context:** a single-repo docs-first assessment with the steward absent.

## 3. Rule 4 is unclear about a standing permission to edit intent

- **Category:** skill.
- **What I observed:** rule 4 reads "Do not edit `<intent documents>` to match the work unless `<steward>` has
  recorded that decision". It is unclear whether a standing steward decision, such as "agents may refine INTENT.md
  with a dated note", counts as "that decision". If it counts, then answering Q2 "yes" would make the rule vacuous. If
  it does not, a steward who chose collaborative editing could not hold a valid guard.
- **Suggestion:** state which reading is intended in `intent-change-rule.md`.
- **Project context:** as in note 1.

## 4. "Points here instead" assumes the guard sits in an up-to-date entropy-guard

- **Category:** other (an edge case).
- **What I observed:** `intent-change-rule.md` says a guard inside entropy-guard points to the rule rather than
  copying it. This target is an older entropy-guard with no `intent-change-rule.md`, so a pointer would have been a
  broken link. I copied the rule instead.
- **Suggestion:** say "points here when this file exists in the repo".
- **Project context:** an assessment of an older snapshot of entropy-guard itself.
