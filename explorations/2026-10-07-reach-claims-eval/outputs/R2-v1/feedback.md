# Feedback on entropy-guard's skills

The skills ask for a note wherever they misrouted a system or left a step too implicit, in a way others would hit
(`entropy-assessment`, last section; `docs-first-planning-assessment` Step 7; `guards-integrator`, "Feedback on
entropy-guard"). These notes are in the issue format of `skills/local/entropy-guard-feedback/SKILL.md`. They were not
filed: this run has no network access, and it was not working inside the entropy-guard repository.

---

## 1. Generator: how to deliver a guard when only one section is provisional

- **Category:** skill
- **What I observed:** an existing guard had to be rebuilt to the contract. Only its Intent section depended on an
  open question: the target lets agents edit `INTENT.md`, and the contract's intent-change rule forbids that without
  the steward. The rule "sort proposed changes into a settled and a provisional patch" covers patches, but
  `session-coherence-skill-generator` asks for the whole guard as one file. Nothing says which version that file
  should be, or how the guard should show the open part. I delivered the full guard, a settled diff that keeps
  today's repair with a visible note, and a provisional diff that swaps in the rule.
- **Suggestion:** say in the generator's Steps that when a guard section depends on an open question, the settled
  guard keeps the current text with a note naming the question, and the provisional patch carries the new text.
- **Project context:** a markdown-only skills repo with an existing guard and an unattributed `INTENT.md` that invites
  edits from agents.

## 2. "Search the code" in a repo whose code is instructions

- **Category:** assessment
- **What I observed:** the rule on claims about everything of a kind says to search "the code". In this repo the only
  network reach, `gh issue create`, lives in a `SKILL.md` that agents execute. A search limited to non-markdown files
  would have found only a `printf` hook and reported "no reaches".
- **Suggestion:** say that instructions agents execute (skills, runbooks, prompts) count as code for this search.
- **Project context:** docs-first repos that ship agent skills.

## 3. Intent-change rule: "a guard inside entropy-guard points here instead"

- **Category:** guard-quality
- **What I observed:** the target was an older entropy-guard copy that lacks `intent-change-rule.md`. A pointer would
  have been a broken link, so I copied the rule in. The sentence assumes the guard's repository has the current
  skills.
- **Suggestion:** "points here instead, if this file exists in the guard's repository; otherwise carries a copy".
- **Project context:** forks or old copies of entropy-guard being assessed as targets.
