# entropy-guard feedback

These are the notes from the upstream feedback checks in `entropy-assessment`, `docs-first-planning-assessment` and
`guards-integrator`, in the issue format of `skills/local/entropy-guard-feedback/SKILL.md`. This run had neither `gh`
nor the web, so no issue was filed and existing issues were not checked for duplicates. The three notes are distinct.

---

## 1. intent-pass: an undated, unattributed decision log leaves no steward decisions to correct from

**Category:** assessment

**What I observed:** `intent-pass.md` counts a statement as a steward decision only when it is "attributed to the
steward with a date". The target's `DECISIONS.md` has 17 entries, none dated or attributed, in a personal repository
whose owner is clear from its GitHub links. Read strictly, the target holds no steward decisions. So the "stale
description" condition, which corrects a document from a later steward decision, can never fire. Every correction drawn
from the decision log became provisional and needed a question. The pass gives no guidance for this case, which is
probably common: most `DECISIONS.md` files are not attributed.

**Suggestion:** add a case to section 1 or section 3 for a decision log with unknown attribution. Treat its entries as
"recorded, attribution unknown". Ask the steward one question that ratifies the existing entries as a block, and
recommend a convention for new ones. Corrections drawn from those entries stay provisional until that answer.

**Project context:** markdown-only skills and methodology repo, solo owner plus AI agents, decision log scaffolded from
a template with no attribution field.

---

## 2. Route A asks for the guard surfaces to be classified twice

**Category:** skill

**What I observed:** the Output section of `entropy-assessment` asks for "Guard surfaces, in the four groups of Step
4d". Route A skips Step 4 and hands over to `docs-first-planning-assessment`. That skill's Step 7 classifies the same
surfaces differently: keep, amend, replace, or demote. On route A, the front door's output requires a classification
its own route skipped, so I produced both.

**Suggestion:** pick one classification for guard surfaces across both skills. Alternatively, have the front door's
Output say that on route A the docs-first Step 7 classification replaces Step 4d.

**Project context:** route A, a docs-first planning repo with one existing guard and a reminder hook.

---

## 3. Shape classification has no case for repos whose docs are an exported product

**Category:** assessment

**What I observed:** the target exports agent skills that other repositories run. Its README holds copy-paste prompts
that name skill paths, and its skills hand work to one another by path. Those names and handoffs work as an interface,
and drift in them breaks consumers. Examples:

- one skill says another "generates guards" when it no longer does;
- the newest skill cannot be reached from the front door.

Step 2 offers A (docs-first planning) or D (workflow-heavy), and neither names this interface. The docs-first checks
cover canonical ownership but not handoffs between skills, so I added a repo-specific "exported-skill handoffs" check
to the guard.

**Suggestion:** in Step 2, or in the docs-first checks, note that when documents are consumed by other systems
(skill libraries, prompt packs, templates), their names, paths and handoffs are a contract. The guard should check that
both sides of each handoff still agree.

**Project context:** a library of exported agent skills, all markdown, consumed by other repos through copy-paste
prompts and skill paths.
