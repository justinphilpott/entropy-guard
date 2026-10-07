# Feedback on entropy-guard's skills (tool-r6), from this run

`entropy-assessment` and `guards-integrator` ask for a note when a step misfired or was too implicit in a way others
would hit. Not filed as issues: this run had no web access and was not working inside the entropy-guard repo.

## 1. A guard update can become provisional as a whole, and the skills do not say how to deliver that

- **Category:** skill (generator and the "Rules along the whole route").
- **What happened:** the generator's contract requires every guard to carry the intent-change rule, and the existing
  guard said "update INTENT.md". The target's own `INTENT.md` line 3 invites agents to edit it, which made "may a
  session edit intent directly?" an open steward question. Replacing the guard therefore touches that question, so
  the whole updated guard went into the provisional patch, with only a one-line stale-reference fix to the old guard
  left in the settled patch.
- **Suggestion:** say in the generator what to deliver when the mandatory intent section touches an open question:
  for example, the full guard as provisional plus a settled amendment to the existing guard that fixes what does
  not depend on the answer.
- **Context:** a docs-first repo whose intent document grants agents edit rights; likely in any repo scaffolded with
  a "living intent" note.

## 2. Placeholders the template leaves without guidance

- **Category:** skill (generator).
- **What happened:** `<upstream>` has no instruction for a repo whose upstream branch cannot be read (I used
  `@{upstream}`, which works anywhere). The size rule's "words of the filled-in 'Where things live' values" does not
  say whether the field labels count (I excluded them). The Report's example ("renaming a setting in the code") is
  code-centred and was kept verbatim in a repo with no code.
- **Suggestion:** default `<upstream>` to `@{upstream}`; say whether labels count; offer a docs example alongside the
  code one.
- **Context:** markdown-only repo with no git metadata available to the assessing agent.

## 3. "A guard inside entropy-guard points here instead" is ambiguous for older copies

- **Category:** skill (`intent-change-rule.md`).
- **What happened:** the target was an older entropy-guard that lacks `intent-change-rule.md`, so pointing at it would
  dangle; I copied the rule, as for any other target.
- **Suggestion:** say "points here, if the repo contains this file".
- **Context:** niche; only entropy-guard itself or its forks.
