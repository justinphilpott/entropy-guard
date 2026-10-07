# Notes on the entropy-guard skills from this run

Written because `entropy-assessment` ("note it") and `guards-integrator` ("Feedback on entropy-guard") ask for a note
when a step was too implicit, in a way others would hit. No issue was filed: `entropy-guard-feedback` applies only
inside the entropy-guard repository, and this run had no web access.

- **Project context:** `agentic-architecture`, a docs-first architecture blueprint (shape A). It is reference-only
  according to its banners, and it already has a hand-run guard that it requires before every commit.
- **Not covered here:** whether these notes hold for code-first routes.

## 1. Reference-only repository that already mandates a guard

- **What happened:**
  - `entropy-assessment` Step 3 says a reference-only system "may finish with a correction or a demotion and no
    generated guard". `docs-first-planning-assessment` Step 6 says it "usually needs no new guard".
  - Neither says what to do when the repository's own instructions already require a guard, and that guard is
    shaped for active work (here `AGENTS.md:72` and `skills/entropy-guard.md`).
  - Left as it is, the guard does harm. Refining it and demoting it are both defensible. I chose to refine it in
    place and made that provisional on a steward question.
- **Suggestion:** one sentence in Step 3: "If the repository already requires a guard, refining that guard to suit
  its lifecycle counts as a correction. Demote it instead when no further edits are authorised."

## 2. Two sorts for one list of guard surfaces on route A

- **What happened:**
  - Route A says the docs-first assessment "is the assessment: add only intent and lifecycle".
  - Yet the Output section of `entropy-assessment` requires guard surfaces "sorted by whether they execute
    (`mixed-profile.md`)".
  - Meanwhile docs-first Step 7.1 sorts the same surfaces as keep, amend, replace or demote.
  - A cold agent has to decide whether route A reads `mixed-profile.md`. I read it only for the sort, and used one
    table with both columns.
- **Suggestion:** say in the Output section that route A uses the execution sort too, and that it can share a table
  with Step 7.1.

## 3. Guard name when updating an existing guard in place

- **What happened:** the generator's contract template fixes `name: session-coherence-guard`, but also allows
  "update the repo's existing guard in place". The existing guard here is `skills/entropy-guard.md`, named
  `entropy-guard`. Renaming it would give one guard two names. I kept the existing name and path.
- **Suggestion:** "When updating in place, keep the existing guard's path and name."

## 4. The provenance line for the intent-change rule

- **What happened:** `intent-change-rule.md` asks each copy to carry "a line naming this file and its version". The
  generator template's line, "(Intent-change rule v2, from entropy-guard.)", names the version but not the file. I
  included the file path.
- **Suggestion:** make the template line name `skills/entropy-assessment/intent-change-rule.md`.

## 5. What counts toward J in the size formula

- **What happened:** the template's Checks section has two generic lines, "When two documents describe one thing…"
  and "For each state claim changed…". It is unclear whether they count toward J or sit inside the 450-word base. I
  counted them in the base, and reported that choice.
- **A second, smaller issue:** the 36-word average cites
  `explorations/2026-10-05-skills-size-review-astra.md`, which is not shipped with the skills, so a cold agent cannot
  check it.

## 6. A "later" decision with no date

- **What happened:** the intent pass's "Stale description" needs a document to contradict "a later recorded steward
  decision". Here the governing directive is an unattributed, undated status banner, in a snapshot with no git
  history, so "later" can only be inferred. I classified the gap as stale description, kept the inference visible,
  and limited the corrections to status labelling.
- **Suggestion:** a line saying how to classify a directive whose date cannot be established.
