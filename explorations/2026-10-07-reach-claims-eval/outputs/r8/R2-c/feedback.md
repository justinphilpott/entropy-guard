# Feedback on entropy-guard's skills

`entropy-assessment` and `guards-integrator` both ask for a note when a skill misfired or left a step too implicit in
a way others would hit. Normally `skills/local/entropy-guard-feedback/SKILL.md` would file each note as a GitHub
issue. This run was not working inside entropy-guard and had no web access, so the notes are left here instead.

The project context for all of them: an older snapshot of entropy-guard itself, which is markdown-first, has no code
and no CI, and was assessed read-only in plan mode on route A.

## 1. Installing a guard can wait entirely on one open question

- **Category:** guard-quality.
- **What happened:**
  - The guard contract requires an Intent section carrying the intent-change rule.
  - This target's own `INTENT.md:3` invites agents to edit the intent document, so who may change intent was an open
    question (Q1).
  - Installing the updated guard therefore states as fact what Q1 asks. The whole guard went into a provisional
    patch, and with it all of its unrelated improvements: the baseline, the stale lines, the new checks.
  - I worked around this by putting the independent line fixes to the existing guard into the settled patch.
- **Suggestion:** say in the generator what to do when only part of a guard depends on an open question. Either ship
  the guard with that section held provisional, or apply the settled line fixes now, as done here.

## 2. "A guard inside entropy-guard points here instead" misfires on an older copy

- **Category:** skill.
- **What happened:** `intent-change-rule.md` says a guard inside entropy-guard links to the rule's file rather than
  copying it. This target is entropy-guard, but an older copy without that file, so following the instruction would
  leave a dangling pointer. I copied the rule in, in the template's form.
- **Suggestion:** "points here instead, when this file exists in the same repository".

## 3. Updating a guard in place: the contract does not say whether to keep its name

- **Category:** guard-quality.
- **What happened:** the template's front matter has `name: session-coherence-guard`. When an existing guard is
  updated in place, the repo's skill-format rule (agentskills.io: `name` matches the folder) requires keeping the old
  name, here `entropy-guard`. The contract says nothing either way.
- **Suggestion:** "when updating in place, keep the existing guard's name and path".

## 4. Choosing between shapes A and D comes before the findings that decide it

- **Category:** assessment.
- **What happened:** `entropy-assessment` Step 2 says to "take the riskiest" when more than one shape fits. Here A and
  D both fit. Which was riskier only became clear from findings that the route produces later. I chose A from a first
  read.
- **Suggestion:** give a tie-break that needs no findings, such as "classify by the primary artifact: if it is
  markdown read as instructions, take A".

## 5. A guard's link check can flag its own command

- **Category:** guard-quality. It is niche, but it applies to any docs-first guard that embeds a shell link check.
- **What happened:** the link-check one-liner written into the guard contained a literal `](`. Scanning the repo, it
  reported the guard's own text as a broken link.
- **Suggestion:** the docs-first matrix's "links to a link checker" row could warn that commands embedded in the
  scanned markdown are scanned too.
