---
title: "Dogfood Your Quality Process, Not Just Your Product"
status: draft
date: 2026-03-03
themes: [entropy, dogfooding, quality-processes, meta-cognition]
source: Session where we ran the entropy guard generator against the entropy guard project itself
---

# Dogfood Your Quality Process, Not Just Your Product

We all know the value of dogfooding your product. Use your own software. Feel the pain your users feel. Catch the bugs before they do.

But almost nobody dogfoods their *quality process*. The code review checklist? Nobody reviews the checklist. The test strategy? Nobody tests the strategy. The documentation standards? Nobody checks if the standards doc is itself well-documented.

We discovered this the hard way when we built a tool for generating entropy guards — quality checklists tailored to specific systems — and then ran it against the project that hosts it.

## What happened when we ate our own cooking

The entropy guard project had a quality checklist. It had been running for weeks. It had six checks: capture decisions, capture learnings, update architecture docs, fix stale placeholders, fix broken cross-references, update TODO state. Reasonable checks. The guard was green most of the time.

Then we ran the generator — the tool that *designs* guards — against the project itself, as if encountering it fresh. The structured analysis walked through: what kind of system is this? What domains does it span? What are the highest-risk entropy vectors?

Three findings surfaced immediately:

**1. Two missing checks.** The guard checked whether decisions were captured but didn't check whether *the skills themselves* still aligned with the project's stated intent. It checked for broken cross-references but didn't check whether *docs agreed with each other in substance* (not just links). These are arguably the two most important checks for a documentation-as-product system — and the guard had no coverage for them.

**2. A systemic knowledge capture problem.** The decisions log had two entries. The learnings log had one. In the same period, the project had made at least five significant architectural decisions and validated at least three non-obvious insights. The guard asked "did you capture learnings?" and the answer each time was apparently "no, nothing this session" — but the transcript told a different story.

**3. No self-evaluation mechanism.** The guard had no way to tell whether it was still appropriate for the system. No version, no "last evaluated" date, no record of what the system looked like when the guard was designed.

None of these were detectable by *running* the guard. They were only detectable by *regenerating* it.

## Running vs. regenerating

There's a fundamental difference between running a quality process and re-deriving it from first principles.

**Running** answers: "did this iteration comply with our standards?"

**Regenerating** answers: "are our standards still the right standards?"

Running a test suite tells you whether the code passes the tests. It doesn't tell you whether you're testing the right things. Running a code review checklist tells you whether the reviewer checked the boxes. It doesn't tell you whether the boxes are the ones that matter.

Most quality processes are run repeatedly but never regenerated. They're write-once artifacts that ossify while the system they guard evolves around them. The guard becomes a fossil record of what mattered when someone first thought about quality — not what matters now.

## Why this happens

There's a cognitive trap: when a quality check passes, you feel good. Green checkmark. Clean. Entropy guard: no issues found. The absence of signal feels like the presence of quality.

But a guard can only find what it looks for. If the guard doesn't check for skill/intent alignment, it will never flag skill/intent drift — even if that drift is the system's most dangerous entropy vector. The green checkmark means "nothing I was looking for is wrong," not "nothing is wrong."

This is especially treacherous for judgment-requiring checks. A linter either flags a violation or it doesn't — the check is deterministic. But a judgment-based checklist item like "did you capture any decisions?" relies on the person running it to *recognise* that a decision was made. If they don't recognise it (because the decision felt obvious at the time, or because it was embedded in a larger discussion), the check passes honestly but incorrectly.

The fix isn't better discipline. The fix is periodic regeneration: step back, analyze the system fresh, and ask "if I were designing a quality process from scratch for this system as it exists today, what would I check?"

## What regeneration looks like in practice

You don't need a fancy tool to regenerate your quality process. Here's the minimum viable version:

**Every quarter** (or whatever cadence fits your iteration rate):

1. Pretend you've never seen this system before. What kind of system is it? What domains does it span? What would go wrong if nobody paid attention for six months?

2. Look at what actually changed in the last quarter. Were there any quality problems that the existing process didn't catch? Were there any checks that flagged something useful? Were there any checks that never flagged anything — and is that because everything's fine, or because the check is too weak?

3. Compare the system today with the system when the process was designed. What's grown? What's new? What's been deprecated? Is the process still shaped for the system it's guarding, or for a past version?

4. Update. Add missing checks. Remove checks that are now mechanically enforced elsewhere. Adjust check wording to match current reality. Update the version metadata so future-you knows when this evaluation happened.

This takes an hour, not a day. And it consistently surfaces insights that months of daily guard-running missed.

## The meta-lesson

There's something recursive about all this. The quality process for a quality process project had a quality problem. The tool for designing guards needed a guard of its own. It's turtles all the way down.

But that's actually the point. Entropy doesn't care about your meta-level. It applies to your code, your docs, your tests, your quality processes, your quality-process-design tools, and anything else that persists across time and iteration. The only defence is periodic regeneration — stepping back and asking "is this still the right thing?" at every level.

Dogfood your product. But also dogfood your quality process. The bugs you find will be the ones you least expected, because they're the ones your existing process was built not to see.
