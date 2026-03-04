---
title: "Your Guards Are Dead Weight: Why Integration Beats Intention"
status: draft
date: 2026-03-03
themes: [entropy, quality-processes, enforcement-depth, integration]
source: Session on building domain-specific guard generators and dogfooding the generator against its own project
---

# Your Guards Are Dead Weight: Why Integration Beats Intention

You have a linting config. You have a test strategy document. You have a code review checklist. You might even have an architecture decision record template.

And nobody uses them.

This isn't a discipline problem. It's a design problem. The most common failure mode of quality processes isn't bad checks — it's checks that never run. A guard that exists as a file in a repository but isn't wired into the workflow provides exactly zero value. Worse than zero, actually — it provides the *illusion* of coverage, which is more dangerous than knowing you have no coverage at all.

## The three-tool problem

When teams think about quality processes, they think about one thing: *what should we check?* They design checklists, write review criteria, define standards. This is the **generator** — the design-time tool that produces quality checks.

But there are actually three distinct tools in a quality lifecycle, and most teams only build the first:

**1. Generator (design-time)** — analyzes the system and produces guards tailored to its specific risks. Run once, or rarely. This is the part everyone builds.

**2. Runner (run-time)** — discovers all guards registered for a system and executes them at the right moment. Pre-commit hook. CI step. PR template checkbox. Whatever the mechanism, this is what turns a document into a practice. This is the part almost nobody builds.

**3. Evaluator (maintenance-time)** — periodically checks whether the guard set is still appropriate for the system. Has the system outgrown its guards? Have the guards gone stale? Are they consistent with each other? This is the part nobody even thinks about.

These three tools have different cadences. The generator runs once. The runner runs at every handoff point. The evaluator runs periodically. Conflating them — or, more commonly, building only the generator and hoping the other two happen by osmosis — is why quality processes decay.

## The closed loop

What makes a guard actually work isn't the quality of the checklist. It's the **closed loop**: the guard is triggered automatically, it runs at the right moment, its output is visible, and failure to run it is noticeable.

Consider two scenarios:

**Scenario A**: You have a beautifully designed code review checklist. It lives in your wiki. New engineers are told about it during onboarding. Senior engineers know it exists but don't open it because they've internalised the important parts (they think).

**Scenario B**: You have a mediocre PR template with three checkbox items. It appears automatically when you open a pull request. You can't submit without checking the boxes. Everyone sees it every time.

Scenario B catches more issues. Not because the checks are better, but because they actually run.

This is the enforcement depth spectrum in action:

- **External** (skill file, checklist) — relies on discipline. Best for judgment-requiring checks, but vulnerable to "I already know this" decay.
- **Prompted** (pre-commit hook, PR template) — removes the need to remember. Still requires judgment, but the guard *presents itself* at the right moment.
- **Semi-embedded** (linting, CI checks) — catches mechanically. No discipline required. But can only enforce things that have clear right/wrong answers.
- **Fully embedded** (type system, schema constraints) — certain classes of error are structurally impossible. The guard isn't something you run; it's something you can't violate.

The heuristic: **if you're relying on discipline for something that could be mechanically checked, that's a design smell.** Conversely, if you're trying to mechanically enforce something that requires judgment, you'll get false positives and people will learn to ignore the guard — which is worse than not having it.

## What integration actually means

When we built guard generators that produce quality checklists for systems, we initially produced just the checklist. Step 1 through Step 6: analyze the system, identify entropy vectors, design the checks. The output was a skill file. Done.

Then we dogfooded it. And the first thing we noticed was: there's no mechanism to ensure this guard ever gets run. It sits in a `skills/` directory, and the only thing connecting it to the workflow is a line in a contributing guide that says "run this before committing."

That's a discipline-based guard for a practice that should be at least prompted. The guard was guarding against entropy in the system — but nothing was guarding against entropy in the guard's own enforcement.

So we added a "Close the Loop" step to every generator. Every guard produced must now specify:

- **Trigger**: when does this guard run? What's the mechanism? Not "before committing" but "pre-commit hook runs it automatically" or "PR template includes it as a section."
- **Discovery**: how does a new contributor find out this guard exists? Not "it's in the docs" but "the pre-commit hook mentions it" or "CI reports it."
- **Enforcement depth**: for each check, what's the current enforcement level, and should it be deeper?

This doesn't guarantee the guard will be run. But it forces the guard *designer* to think about integration as part of the design, not an afterthought. And it gives the guard *user* a specific integration plan, not a vague hope.

## Versioning: the forgotten dimension

There's a subtler problem: guards go stale. A guard designed for a three-person team with a single-service architecture may be inadequate when the team grows to fifteen with five services. A test quality guard designed when the project had 200 tests doesn't know about the 2,000 tests that exist now.

This is why every guard should carry metadata:

- **Generated**: when was this guard created, and by what process?
- **System snapshot**: what did the system look like when the guard was designed? (Size, complexity, team structure, key architectural patterns)
- **Last evaluated**: when was this guard last re-derived from scratch — not just run, but *regenerated*?

The system snapshot is the key. It creates a comparison point: "this guard was designed for a system with X. The system now has Y. Is the guard still appropriate?" Without this, guards silently become inadequate as the system evolves past them.

## The real cost

The cost of a dead-weight guard isn't just the time spent creating it. It's the false confidence. A team that believes it has a code review process — because the checklist exists — won't invest in building a better one. A team that believes it has documentation standards — because the style guide is in the wiki — won't notice when docs drift into incoherence.

The presence of an unintegrated guard is worse than its absence, because it suppresses the signal that would otherwise prompt action.

So before you design your next quality process, ask three questions:

1. **How does this get triggered?** If the answer involves someone remembering to do it, it won't happen consistently.
2. **How does a newcomer discover it?** If the answer is "it's in the docs," it's invisible.
3. **When will you re-evaluate it?** If the answer is "never" or "when something goes wrong," it will silently go stale.

Build the runner. Build the evaluator. And give every guard a version.

The checklist is the easy part.
