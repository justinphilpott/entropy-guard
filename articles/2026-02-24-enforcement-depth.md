---
title: "Stop Writing Checklists, Start Designing Constraints"
status: draft
date: 2026-02-24
themes: [entropy, enforcement depth, systems design, process vs architecture]
source: Discussion on embedded vs. external guards and the enforcement depth spectrum
---

# Stop Writing Checklists, Start Designing Constraints

We've been thinking about something that might reframe how engineering teams approach process and quality — and we suspect a lot of the friction around "process improvement" comes from putting the right checks at the wrong level.

## The pattern we keep seeing

Here's a scenario that probably sounds familiar. Something goes wrong — a stale doc causes confusion, a naming convention drifts, a module boundary gets crossed. The response is predictable: add a checklist item. "Before merging, verify that documentation is updated." "Before committing, check that naming conventions are followed."

These checklists are well-intentioned. They often work for a while. And then they quietly stop being followed, because they depend on something that doesn't scale: human discipline applied to mechanical tasks.

We think there might be a more useful way to think about this.

## A spectrum we stumbled into

While working on entropy guards — lightweight mechanisms for keeping iterated systems coherent — we found ourselves distinguishing between different *depths* at which a guard can live. It turned into something like a spectrum:

**Level 1: External.** A skill file, a checklist, a wiki page that says "remember to do X." This relies entirely on someone remembering to run it and being honest about the answers. It's the most flexible — you can check anything, including judgment calls — but it's also the most fragile. If discipline lapses, the guard disappears.

**Level 2: Prompted.** A pre-commit hook, a CI step that surfaces a reminder, a Slack bot that asks "did you update the docs?" This removes the need to *remember* but still requires judgment. You can't ignore it without actively dismissing it, which is a meaningful difference from Level 1.

**Level 3: Semi-embedded.** Linting rules, automated tests, schema validation, CI checks that block the merge. These run automatically and catch mechanical issues without human involvement. No discipline required, but they can only check things that are mechanically checkable. They can tell you a link is broken but not whether a document is *semantically* stale.

**Level 4: Fully embedded.** The type system, foreign key constraints, architectural invariants in code, immutable data structures. At this level, certain classes of entropy are *structurally impossible*. You can't pass a string where an integer is expected. You can't delete a record that's still referenced. The constraint is part of the system itself.

What we find interesting about this spectrum isn't the levels themselves — most engineers would recognise them intuitively. It's the question of **mapping**: for a given integrity check, which level is the right one?

## The design smell we think we've identified

Here's the heuristic that fell out of this thinking, and we're curious whether it holds up broadly:

**If you're relying on human discipline for something that could be mechanically checked, that's a design smell.**

Naming convention enforcement? That's a linter, not a checklist item. Broken cross-references? That's an automated check, not something a reviewer should be scanning for manually. JSON schema compliance? That's validation, not a code review comment.

Every time you ask a human to do something a machine could do, you're spending a scarce resource (attention, discipline) on a problem that has a cheaper solution. And you're introducing a failure mode that doesn't need to exist.

**The converse also seems true: if you're trying to mechanically enforce something that requires judgment, you'll get false positives and people will learn to ignore the guard.**

"Does this change align with the project's original intent?" — that's not a linting rule. "Is this abstraction still earning its complexity?" — no CI check can answer that. "Should this decision be recorded for future contributors?" — that requires contextual judgment.

These belong at Level 1 or 2, where a thinking agent (human or AI) can evaluate them. Trying to automate them produces rules that are either too loose to catch anything or too strict to be useful.

## What this might mean in practice

If this framing is right, the useful exercise isn't "what checklists should we add?" but "for each integrity check we care about, at what depth should it live?"

Take a typical engineering team's quality concerns:

- **Code formatting**: Level 4 (auto-formatter, runs on save, not even a question)
- **Type safety**: Level 4 (compiler enforces it)
- **Test coverage thresholds**: Level 3 (CI check, blocks merge)
- **Broken links in docs**: Level 3 (automated check, trivially scriptable)
- **Naming conventions**: Level 3 (linter rule)
- **"Did you update the docs?"**: Level 2 (prompted reminder, requires judgment about *what* to update)
- **"Does this change serve the project's goals?"**: Level 1 (requires genuine reflection, can't be automated)
- **"Should this decision be recorded?"**: Level 1 (contextual judgment)

Most teams, we suspect, have a lot of Level 1 checks that should be Level 3, and a few Level 3 checks that should be Level 1. The mismatch in both directions causes friction.

## The maturity angle

There's possibly a maturity model here, though we're less certain about this part.

A young system starts with everything at Level 1 — the team knows the conventions because they're small enough to hold them in their heads. As the system grows, some checks get promoted to Level 2 (hooks, reminders) and Level 3 (linting, CI). A very mature system has pushed as many *mechanical* checks as possible to Level 3 or 4, reserving Levels 1 and 2 for the things that genuinely require judgment.

The interesting implication: **the most mature form of a guard is when it becomes a behaviour of the system itself.** The external checklist is scaffolding. For mechanical entropy vectors, the goal is to embed the constraint deeply enough that the scaffolding can be removed. You don't need a checklist item that says "use the type system" — the type system enforces itself.

But — and this is important — not everything can or should be embedded. Judgment-requiring checks need to stay external, and that's not a failure of maturity. It's a recognition that some forms of coherence require a thinking agent to evaluate. The goal isn't to automate everything; it's to automate the right things and preserve human attention for the things that need it.

## What we might be wrong about

**The spectrum might be too clean.** Real systems are messy, and some checks don't fit neatly into one level. A code review is partly Level 1 (judgment about design) and partly Level 3 (catching mechanical issues that a linter should have caught). The spectrum might be more useful as a thinking tool than as a taxonomy.

**"Design smell" might be too strong.** Sometimes a checklist is the right answer because the team is small, the system is simple, and the overhead of setting up a linter isn't worth it. The smell heuristic assumes a level of maturity and scale that not every project has.

**We might be undervaluing the cultural function of checklists.** A shared checklist, even for mechanical things, can serve as a teaching tool and a statement of values. "We care about documentation" is communicated by the checklist item, even if the item itself is redundant with an automated check. Removing the checklist might remove the signal.

## Where this leads

We think the mapping exercise — "for each thing we care about, at what depth should the guard live?" — is worth doing explicitly, whether or not you agree with our specific spectrum. Most quality problems in engineering teams aren't caused by not caring enough; they're caused by putting the right checks at the wrong level and then being surprised when discipline fails.

The question isn't "should we have more process?" It's "should this particular check be a process at all, or should it be a constraint?"
