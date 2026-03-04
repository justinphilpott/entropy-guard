---
name: distill-article
description: Extract intellectual work from project conversations and produce Substack-ready article drafts. Proposes article angles before drafting. Target audience is senior developers, tech leads, and AI practitioners.
---

# Skill: Distill Article

An editorial collaboration skill. After a substantive conversation, extract the intellectual work and produce Substack-ready article drafts — but only after discussing angles with the human first.

> **Audience**: Senior developers, tech leads, AI/agentic practitioners, information systems researchers. These are people who build things and have felt the pain. No introductory hand-holding. The test: would a senior engineer share this in their team Slack?

---

## When to Run

- After a conversation that explored ideas worth sharing — frameworks, analyses, non-obvious insights
- When the human says "blog this", "write this up", or similar
- When a discussion has produced thinking that would decay if left only in a chat transcript

## When NOT to Run

- After routine implementation work with no conceptual content
- When the conversation was purely tactical (debugging, config, etc.)
- If the ideas are too half-formed to be useful to a reader — in that case, add to PHILOSOPHY.md instead and revisit later

---

## Process

### Step 1: Extract threads

Review the conversation and identify 2–4 distinct intellectual threads. A thread is a line of thinking that:
- Has a clear insight or framework at its core
- Would survive being lifted out of the conversation context
- Says something non-obvious to the target audience

Don't force it. If there's only one strong thread, propose one. If there are four, propose four. But don't pad.

### Step 2: Propose angles

For each thread, pitch an article angle. Present each with:

- **Working title** — specific and intriguing, not generic
- **Core thesis** (1–2 sentences) — the single claim the article makes
- **So what?** — why a senior dev/tech lead would care. What problem does this illuminate? What does the reader gain?
- **Key insight** — the one framework, analogy, or observation that makes this worth reading

Present all angles to the human before proceeding.

### Step 3: Discuss

This is the most important step. Ask the human:

- Which angles resonate? Which feel flat?
- Is there a thread you're missing — something that was discussed but you didn't flag?
- What angle would be most useful for their specific audience?
- Are there real-world examples or experiences that should ground the article?

Do not proceed to drafting until the human has weighed in. The conversation about what's worth writing is itself valuable — it sharpens the thinking.

### Step 4: Produce rough drafts

For each approved angle, write a rough draft:

**Structure:**
- **Hook** — open with something the reader recognises from their own experience. A problem, a frustration, a pattern they've noticed but not named.
- **Thesis** — state the core claim clearly and early
- **Development** — build the argument. Use concrete examples from the conversation. Introduce frameworks if they emerged. Show, don't just assert.
- **Implications** — what does this mean for how the reader works? What should they do differently, think about differently, or watch for?
- **Forward-looking close** — end with questions worth pursuing, not a neat bow. The best articles open doors.

**Voice guidelines:**
- Write so the human can edit into their own voice — provide substance and structure, not a finished persona
- Informed but not academic. Conversational but not sloppy.
- Concrete over abstract. If you can give an example, give an example.
- Don't hedge excessively. If the argument is worth making, make it.

### Step 5: Save

Save each draft to `articles/YYYY-MM-DD-slug.md` with a YAML-style header:

```
---
title: "The actual title"
status: draft
date: YYYY-MM-DD
themes: [entropy, documentation, whatever tags fit]
source: brief note on which conversation this came from
---
```

Note the new article(s) in `articles/README.md`.

---

## What This Is Not

- A summariser — summaries are for internal records. Articles are for readers who weren't in the room.
- A transcription service — the article should be better than the conversation, not a replay of it.
- A solo act — the editorial discussion (Step 3) is where the real value is. Skipping it produces generic output.
