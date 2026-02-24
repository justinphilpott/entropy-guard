---
title: "Your AI Agents Are Building Faster Than You Can Remember Why"
status: draft
date: 2026-02-24
themes: [entropy, AI agents, iteration velocity, intent preservation]
source: Initial entropy-guard project discussion on what decays fastest in iterated systems
---

# Your AI Agents Are Building Faster Than You Can Remember Why

Here's something we've been noticing while working on AI-assisted development, and we think it points at a real problem that most teams haven't named yet.

## The speed problem that isn't about speed

If you've worked with AI coding agents for any serious length of time, you've probably felt this: the codebase grows, features land, tests pass — and yet something is quietly going wrong. Not in the code itself, but in the *understanding* around it. Why was this abstraction chosen? What constraint ruled out the simpler approach? Why does this module have this particular boundary?

The answers to those questions are decaying. Not because anyone is being careless, but because the iteration velocity has outpaced the rate at which understanding is preserved.

We think this might be one of the more consequential problems in AI-assisted development, and it's not the one most people are focused on. The conversation tends to be about code quality, hallucination rates, test coverage. Those matter. But there's a slower, quieter failure mode: the system works, but nobody — human or AI — can confidently explain *why it's shaped the way it is*.

## What seems to decay, and at what rate

When we tried to map out what actually degrades in an iterated system, we found that not all forms of decay are equal. They differ on two axes that matter: how fast they decay, and how costly it is to recover once they have.

**Intent** — the "why" behind design choices — seems to decay slowly. It feels stable in the moment; of course you know why you made this decision, you just made it. But intent is catastrophically expensive to recover once lost. Reverse-engineering rationale from code is archaeology, and AI agents can't do it any better than humans. Maybe worse, because they'll confidently fabricate a plausible-sounding rationale that happens to be wrong.

**Pattern consistency** — whether the same class of problem is solved the same way throughout the system — decays at a medium rate. Each contributor (human or AI) brings their own stylistic tendencies. Over time the codebase becomes a geological record of different eras of thinking. This isn't fatal, but it increases cognitive load on every subsequent change.

**Cross-references and naming** — links between files, names that describe what things do — decay fast but are cheap to fix. The catch is that "cheap to fix" only applies if you catch it within one or two iterations. Left for five iterations, it stops being a quick fix and becomes its own investigation: *was* this link supposed to point there, or did the target move too?

**State honesty** — whether the system's self-description matches its actual condition — decays continuously and is uniquely insidious because stale state *looks like* real state. A TODO item that's been done. A feature flag that's never checked. An architecture diagram from three months ago. You don't notice the lie because the lie looks exactly like the truth used to look.

If this mapping is roughly right, it suggests something about where to invest attention: **guard the things that are expensive to recover, even if they decay slowly.** And fix the things that decay fast *immediately*, before the cost compounds.

We've been thinking about this as a product: decay rate times recovery cost. The highest-priority entropy vectors are the ones where both factors are non-trivial. Intent scores high on recovery cost. Referential integrity scores high on decay rate. Both warrant active guarding, but for different reasons.

## What if we're right about this?

If this framing holds, it has some practical implications.

First, **most AI coding workflows are optimised for the wrong thing.** They're optimised for throughput — how many features, how many commits, how fast can we ship. But throughput without coherence preservation is a system that's slowly making itself illegible to future contributors. Including future AI agents, who will inherit the same confusion.

Second, **the need for active coherence preservation scales with iteration velocity.** A solo developer working on a side project might take weeks to drift significantly from their original intent. A team of AI agents working in parallel on a complex system could drift in hours — producing locally consistent changes that are globally incoherent with each other. Faster systems don't need less guardrailing; they need more, and better.

Third, **"tech debt" might be a less useful frame than "accumulated entropy."** Tech debt implies a deliberate trade-off: we borrowed against the future and need to pay it back. But a lot of what gets called tech debt wasn't a conscious choice at all. It's decay that happened because nobody was actively preventing it. You didn't choose to have three different error-handling patterns; they just accumulated. You didn't decide to let the docs diverge from the code; it just happened while you were shipping. Framing it as entropy — as the natural tendency of iterated systems toward incoherence — might be more honest about the mechanism, and more useful for designing countermeasures.

## What we're calling an "entropy guard"

We've been experimenting with something we're calling entropy guards — lightweight, targeted mechanisms that run at iteration boundaries (usually pre-commit) to check whether the system's coherence has degraded.

The key design constraints, as we understand them so far:

- **Delta-scoped**: a guard checks what changed in *this* iteration, not everything that could theoretically be wrong. A full audit is a different tool.
- **Low-burden**: if it takes more than 10 minutes, it won't be run consistently. This is sustained practice, not a periodic deep clean.
- **Prioritised**: it focuses on the highest-value entropy vectors for the specific system, not a generic checklist.

Whether this is the right approach, or the right name, or the right level of intervention — we're not sure yet. But the underlying observation feels solid: systems that iterate fast need something active to preserve their coherence, and most don't have it.

## What we might be wrong about

A few things we're uncertain about:

**Maybe entropy is the wrong metaphor.** Thermodynamic entropy has a precise mathematical definition. What we're describing is more like organisational decay or coherence loss. Using the entropy framing might imply more rigour than we actually have. On the other hand, it captures the directionality — systems don't spontaneously become more coherent — and the compounding nature of the problem.

**Maybe the market doesn't feel the pain yet.** AI-assisted development is new enough that most teams haven't accumulated enough iterations to feel the coherence problem acutely. By the time they do, the damage may be significant enough that recovery is the topic, not prevention.

**Maybe guards are solving a tooling problem with a process solution.** If the real issue is that AI agents don't preserve context across sessions, the right fix might be better context management in the agents themselves, not a post-hoc checklist. We think both matter — but it's worth being honest that guards are, in some sense, compensating for a limitation in current tooling.

## Where this seems to lead

If nothing else, we think there's value in making the problem visible. Most teams experiencing coherence decay don't have a name for it, which makes it hard to discuss, hard to prioritise, and hard to address systematically.

And naming what decays fastest, what's most expensive to recover, and where the intervention points are — even imperfectly — seems more useful than not naming it at all. A stab in the twilight is better than no stab.

We're continuing to develop this thinking in the [entropy-guard](https://github.com/justinphilpott/entropy-guard) project. The ideas are evolving. We'd be interested to hear whether this matches what others are seeing.
