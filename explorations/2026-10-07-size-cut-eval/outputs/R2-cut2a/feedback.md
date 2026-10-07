# Feedback on the entropy-guard skills

The skills ask for a note whenever they misrouted, or left a step too implicit, in a way that others would hit. These
notes come from running them on the entropy-guard snapshot `447da9a` on 2026-10-07. They were not filed as issues:
`skills/local/entropy-guard-feedback/SKILL.md` files issues only when working in the entropy-guard repo itself, and
this run had no web access.

Project context for all of them: a docs-first, markdown-only repository with one local guard, assessed read-only
without git history.

## 1. intent-change-rule.md: "A guard inside entropy-guard points here instead"

- **What happened:** the target was a copy of entropy-guard that predates `intent-change-rule.md`. Read literally, the
  guard should point at a file that does not exist in that repo. I copied the rule in instead.
- **Suggestion:** "A guard in the same repository as this file points here instead. Otherwise it carries a copy."

## 2. Generator, Size: it cites a file the exported skill does not ship

- **What happened:** the size budget's 36 words per check cites
  `explorations/2026-10-05-skills-size-review-astra.md`. That file is in the entropy-guard repo, not in the skill
  folder. Anyone using the exported skill cannot follow the reference, and this run was not allowed to.
- **Suggestion:** give the derivation in one inline sentence, or drop the path.

## 3. Generator, Size: S does not say what it covers

- **What happened:** the guard needed two repo-specific lines outside "Where things live": how to set `START`, and the
  live GitHub-issue state. Counting them as S puts the guard within budget, at 957 of 966 words. Counting them as part
  of the 450-word contract puts it 28 words over.
- **Suggestion:** define S as "all repo-specific pointer text in the guard", or say where such lines belong.

## 4. Generator template: `$START` is never defined, and the name does not fit an in-place update

- **What happened:** the template's commands use `"$START"` but never say where it comes from. Its `name:
  session-coherence-guard` also conflicts with updating an existing guard in place under another name, when the skill
  format requires `name` to match the folder.
- **Suggestion:** add one line saying `START` comes from the state file's session-start entry, or from the upstream
  branch. Add another saying that an in-place update keeps the existing guard's name and path.

## 5. Two lists of lifecycle states

- **What happened:** `entropy-assessment` Step 2 lists "active, reference-only or frozen, or retired".
  `docs-first-planning-assessment` Step 1 lists "active, reference-only or retired". One concept is defined twice, and
  the two definitions differ.
- **Suggestion:** define the states once, in `entropy-assessment`, and have docs-first link to it.
