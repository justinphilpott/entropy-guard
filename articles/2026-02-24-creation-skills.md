---
title: "Teach the Skill, Not the Fish: Why Guard-Creation Beats Guard-Libraries"
status: draft
date: 2026-02-24
themes: [entropy, meta-skills, tooling, DX, domain-specific design]
source: Discussion on generic vs. specific guards and the investment case for creation skills
---

# Teach the Skill, Not the Fish: Why Guard-Creation Beats Guard-Libraries

We've been going back and forth on a question that seems like it should have an obvious answer, and the answer we landed on surprised us a bit. It might be relevant to anyone building internal tooling, developer experience platforms, or AI-assisted workflows.

The question: if you want to help teams keep their systems coherent across iterations, should you give them a library of ready-made guards, or a process for creating their own?

Our instinct was the library. That's the normal pattern in developer tooling — centralise the knowledge, package it up, distribute it. ESLint configs, Terraform modules, CI templates. The library approach has obvious advantages: consistency across teams, lower barrier to adoption, economies of scale in maintenance.

But we think, in this case, the library might be the wrong answer.

## The 70% problem

Here's what we noticed when we tried to create guards for different types of systems. Each guard we wrote was *reasonable* — it asked sensible questions, covered obvious entropy vectors, followed a logical structure. And each one was about 70% right for any given system.

The 30% it missed was always the stuff that mattered most. The particular way *this* codebase's architecture was being eroded. The specific documentation gap that kept tripping up *this* team's new starters. The decision-recording practice that *this* project had already tried and abandoned for good reasons.

A guard that's 70% right is worse than it sounds. It's right enough that people feel like they're covered, but wrong enough that the most damaging entropy vectors go unchecked. It's a false sense of security that's arguably worse than having no guard at all, because at least without a guard you know you're unprotected.

This seems to be a general problem with templates and boilerplate in developer tooling, not specific to entropy guards. A CI template that's 70% right for your project will catch the obvious failures and miss the subtle ones. A code review checklist that's 70% relevant will train reviewers to skim through items rather than think about them. **The closer a template gets to "good enough," the harder it becomes to notice what it's missing.**

## What the creation process gives you that the artifact doesn't

When we shifted from trying to write guards to trying to write a *process for creating guards*, something interesting happened. The process itself — the analysis, the questions, the prioritisation — turned out to be where the value was.

Walking through "what are the highest-value entropy vectors for *this specific system*?" forces you to understand the system in a way that picking a template from a library doesn't. You have to think about:

- What does drift actually look like here? Not in general — here, in this codebase, with this team, at this iteration rate.
- What existing mechanisms already partially guard against entropy? (Most systems have *something*, even if it's informal.)
- Where would a new contributor be most likely to make a confident, incorrect change?

These questions produce genuine insight about the system. The guard that comes out is a *byproduct* of that understanding, not the primary output. The understanding is the product.

This is why we think the creation skill is more valuable than the library: **running the process teaches you something about your system that reading a template never will.**

## The domain-specific angle

There's a complication, though. When we tried to build a single universal creation process, we ran into a version of the same problem: different *types* of systems have fundamentally different entropy signatures, and a generic process that tries to cover all of them ends up being too broad to go deep on any of them.

Documentation entropy is about freshness, cross-referential integrity, vocabulary consistency, and audience clarity. The questions you ask to surface documentation entropy are about information flows and maintenance habits.

Code entropy is about pattern consistency, naming alignment, architectural boundary integrity, and abstraction honesty. The questions you ask are about structural evolution and design decision preservation.

Process entropy is about step adherence, decision recording, handoff completeness, and feedback integration. The questions you ask are about human behaviour and organisational memory.

These are different analytical lenses. A documentation guard creator and a code guard creator would ask different questions, look for different signals, and produce different outputs. A generic creation skill that tries to do all three ends up asking a lot of questions that don't apply and missing domain-specific questions that do.

So we're landing on something like: **one general creation skill for initial assessment, plus a small number of domain-specific creation skills for deeper analysis.** Not fifty. Maybe three. Documentation, code, and process as the starting domains, because they're the most common and the most different from each other.

## What about examples?

There's still a role for concrete guard examples — but we think it's as teaching tools, not as products.

A well-crafted example guard for a documentation-heavy project shows what *good output* from the creation process looks like. It demonstrates the right level of specificity, the right scope, the right balance between thoroughness and low burden. It's a reference implementation, not a template to copy.

The distinction matters because of how people use them. If you present a library of guards with the message "pick the one that fits your system," people will pick the closest match and adapt it minimally. If you present a creation process with example outputs, people will run the process and use the examples to calibrate their expectations.

We think the right number of examples is small — maybe one per domain — and they should be explicitly labelled as "this is what good output looks like" rather than "use this."

## The general principle

There might be a broader point here that applies beyond entropy guards.

In developer tooling and DX, the instinct is usually to package knowledge into reusable artifacts: templates, configs, boilerplate, libraries. And often that's right. But for problems where the value comes from *understanding the specific context* — where 70% right is actively harmful — a well-designed creation process might be more valuable than a library of pre-made solutions.

The investment profile is different. A library is cheaper to adopt (just pick one) but creates a long tail of maintenance and mediocrity. A creation skill is more expensive to run the first time (you have to actually think about your system) but produces something that's genuinely fit for purpose and teaches you about your system in the process.

We're not sure this principle generalises as cleanly as we're presenting it. Some domains genuinely benefit from standardisation, and the overhead of custom creation isn't always justified. But for problems where context matters as much as correctness — and coherence preservation seems to be one of those problems — we think the creation skill is the better investment.

## What we're less confident about

**Maybe we just haven't written enough guards.** It's possible that with enough examples, patterns would emerge that *could* be templated effectively. Our sample size is small. Maybe the 70% problem is an artifact of early exploration, not a fundamental limitation.

**Maybe the creation process is too expensive for most teams.** Running a thoughtful analysis of your system's entropy vectors takes time and requires someone who understands both the system and the entropy guard concept. That's a high bar. A "good enough" template that takes five minutes to adopt might deliver more value in practice than a perfect custom guard that takes two hours to create.

**Maybe this is just the build-vs-buy question wearing different clothes.** "Should you use a generic tool or build a custom one?" is not a new question, and the answer is usually "it depends." We might be overcomplicating a familiar trade-off.

Still — if you're building internal tooling or DX and you find yourself maintaining a growing library of templates that are each mostly-but-not-quite right, it might be worth asking: would a creation skill be more honest about the problem?
