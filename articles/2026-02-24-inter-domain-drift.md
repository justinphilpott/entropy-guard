---
title: "The Map, The Territory, and The Practice: Where Systems Actually Rot"
status: draft
date: 2026-02-24
themes: [entropy, inter-domain drift, documentation, systems thinking]
source: Discussion on how entropy manifests between domains rather than within them
---

# The Map, The Territory, and The Practice: Where Systems Actually Rot

We've been trying to understand why some systems feel rotten even when each individual piece looks fine. The docs are decent. The code works. The team follows a process. And yet something is off — changes are harder than they should be, new contributors take longer to get productive than the codebase's size would suggest, and everyone has a nagging feeling that they're working around something they can't quite name.

We think we might have a framing for this, and if it's right, it explains why a lot of conventional quality approaches miss the real problem.

## Three things that have to agree

Every non-trivial system has three aspects:

**The map** — what the system says it is. Documentation, READMEs, architecture diagrams, ADRs, onboarding guides. The explicit self-description.

**The territory** — what the system actually does. The code, the database schema, the deployed infrastructure, the actual runtime behaviour. The reality.

**The practice** — how people actually use and change the system. The real workflow, not the documented one. Which steps are followed, which are skipped. Where decisions actually get made. The lived experience.

Borrowing from Korzybski: the map is not the territory. But in software, we have a third thing that's neither the map nor the territory — the practice of navigating between them.

The observation that's been nagging at us: **most entropy in real systems isn't within any one of these domains. It's between them.**

## What inter-domain drift looks like

The docs say the authentication flow goes through a middleware layer. The code routes it through a different path that was added six months ago as a "temporary" fix. The team knows to ignore the docs and look at the middleware test file to understand how auth actually works. All three are internally consistent enough to pass a superficial check. The docs aren't *wrong* about how middleware works in general. The code passes its tests. The team has a functional workflow.

But the system as a whole is lying to anyone who takes any one domain at face value.

This is inter-domain drift, and we think it might be the dominant form of entropy in most software systems. Not because the individual domains aren't maintained, but because **nobody is explicitly checking whether they still agree with each other.**

Here's what seems to happen:

1. The map and territory start aligned (someone writes accurate docs for code that was just written)
2. The territory changes (code evolves through iteration)
3. The map doesn't update in sync (it's always "the next commit")
4. The practice adapts informally (the team learns workarounds, tribal knowledge fills the gap)
5. Now you have three divergent sources of truth, and a new contributor has to triangulate between them to figure out what's real

Steps 2–5 happen so gradually that nobody notices the drift until it's substantial. And by then, fixing it is a project in itself.

## Why domain-specific checks miss this

If you only check documentation quality — are the docs well-written, complete, internally consistent — you'll miss the fact that they describe a system that no longer exists.

If you only check code quality — does it pass tests, follow conventions, have reasonable architecture — you'll miss the fact that the stated architecture in the docs doesn't match the real one.

If you only check process adherence — are people following the stated workflow — you'll miss the fact that the *real* workflow has diverged from the stated one because the stated one doesn't account for how the territory has changed.

Each domain-specific check is internally valid. The rot is in the *gaps between* them.

We think this might explain a common frustration: teams invest in documentation tooling, code quality tooling, and process management tooling, and still feel like things are deteriorating. They're checking within domains when the problem is between domains.

## What a cross-domain check might look like

We're still working this out, but the general shape seems to be: at iteration boundaries, explicitly ask whether the three domains still agree.

Some concrete questions that seem to surface real drift:

- **Map vs. territory**: If someone followed the documentation literally, would they correctly understand how the system works *right now*? Not "roughly" — literally. Where would they be misled?

- **Territory vs. practice**: Is the code structured in a way that supports how the team actually works? Or are there architectural assumptions that the practice has outgrown? (The classic: a monorepo that the team has mentally partitioned into services, but the code doesn't enforce the boundaries.)

- **Practice vs. map**: Does the documented workflow match what people actually do? If there's a discrepancy, which one is right — has the practice improved beyond the docs, or has it degraded?

The interesting thing about these questions is that they require judgment. You can't automate "would a newcomer be misled by this documentation?" That's a fundamentally different kind of check from "is this link broken?" — and it's arguably the more valuable one.

## A diagnostic for something that's hard to see

One possible use for this framing: when something feels wrong but you can't pinpoint it, explicitly check the three-way agreement.

Most "tech debt" conversations we've seen focus on the territory — the code is messy, the architecture has accreted, there's too much coupling. But at least some of what gets labelled tech debt might actually be inter-domain drift. The code isn't necessarily bad; it just no longer matches what the docs say or how the team works. And the fix isn't refactoring the code — it's realigning the three domains.

This distinction matters because the interventions are different. If the problem is code quality, you refactor. If the problem is inter-domain drift, you update docs, align process with reality, and make the system's self-description honest again. These are cheaper interventions, but they're easy to deprioritise because they don't feel like "real work."

## Where we're less sure

**Maybe three domains is too few.** Larger systems might have more meaningful domains — security, infrastructure, user-facing behaviour, internal APIs — each with their own representation that can drift from the others. The map/territory/practice framing might be a useful simplification that breaks down at scale.

**Maybe the map just isn't worth maintaining.** There's a legitimate school of thought that says the code is the only source of truth, and documentation is inherently doomed to go stale. If the territory *is* the truth, maybe the answer is to make the territory more self-describing (better naming, better types, better structure) rather than trying to keep a separate map in sync. We're sympathetic to this, but we think it only works for the territory/map relationship. The practice dimension — how people actually work — can't be read from the code.

**Maybe inter-domain drift is just another name for communication breakdown.** If the team communicated perfectly, the domains would stay aligned. But "communicate better" is the "just eat less" of organisational advice — technically true and practically useless. We think having a structural name for the failure mode, and specific questions to ask, is more useful than a general exhortation to communicate.

## The question underneath

The deeper question might be: whose job is it to check the alignment between domains? In most teams, it's nobody's job. The documentarian checks the docs. The developer checks the code. The team lead checks the process. Nobody explicitly checks whether all three still agree.

If that's the gap, then maybe the most valuable intervention isn't better tools for any individual domain. It's a practice — even a lightweight one — that explicitly asks: do the map, the territory, and the practice still tell the same story?

We're experimenting with what that looks like. Early days, and we might be wrong about the framing. But the underlying observation — that the rot is in the gaps, not in the pieces — feels real enough to be worth sharing.
