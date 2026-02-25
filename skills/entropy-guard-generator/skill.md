# Skill: Entropy Guard Generator

Analyze a system and design an entropy guard appropriate for it. This is the general-purpose generator; domain-specific variants (e.g. `docs-guard-generator.md`, `code-guard-generator.md`) live alongside this file and provide deeper, tailored analysis for specific system types.

> **Before you begin**: Read [INTENT.md](../../INTENT.md). The intent statement defines what a guard should preserve and what it should not be. Use it as your reference throughout.

> **Status**: This is a living scaffold. The process below reflects current best thinking and will be refined as we apply it to real systems. Note what works and what doesn't in LEARNINGS.md.

---

## When to Run

- When you encounter a new system that undergoes repeated AI-assisted (or human) iteration and has no entropy guard
- When asked to evaluate whether an existing system's guard is adequate
- When an existing guard feels stale or misaligned

## When NOT to Run

- As a substitute for actually running an existing guard — if a guard exists for this system type, run it
- For trivial one-off scripts or throwaway artifacts that won't be iterated

---

## The Process

Work through each step. Most of the output lives in the final step — the draft guard. The earlier steps are analysis to inform that design.

### Step 1: Understand the system's intent

- What is this system trying to achieve? What is its core purpose?
- Who uses it, and how?
- What does "success" look like for this system?
- What would it look like if this system had drifted badly from its intent? What would break, confuse, or mislead?

Write a 2–4 sentence intent summary. If you can't write this clearly, stop and investigate more before continuing.

### Step 2: Map the iteration pattern

- How is this system changed? (commits, pull requests, agent sessions, document edits, manual processes?)
- Who makes changes? (solo developer, team, AI agents, a mix?)
- How often does it change? (daily, weekly, per sprint?)
- What is the handoff point — when does one iteration end and another begin?

The handoff point is the natural place to run the guard.

### Step 3: Identify entropy vectors

For this specific system, what tends to degrade without active maintenance? Consider:

- **Documentation**: do docs go stale, diverge from implementation, accumulate dead links?
- **Cross-references**: do files reference each other, and do those references break?
- **Naming**: do names drift from what they refer to?
- **Decisions**: are architectural choices recorded, or do they get re-litigated?
- **Learnings**: do hard-won insights get forgotten across sessions/contributors?
- **State**: does the system accurately represent its own current condition?
- **Intent alignment**: does the work continue to serve the original purpose?
- **Internal consistency**: do the parts agree with each other?

Rank the top 3–5 vectors by destructive potential for *this specific system*. Don't try to guard everything — guard what matters most.

### Step 4: Assess existing guards

- Does the system already have any entropy guard mechanisms? (checklists, review processes, linting, tests, CI checks, doc requirements?)
- If yes: what do they cover, and what do they miss?
- Is there significant overlap with the standard `entropy-guard` skill that already covers decisions, learnings, architecture, stale placeholders, cross-references, and TODO state?

If the standard entropy-guard already covers this system well, the answer may simply be: run entropy-guard. Note this explicitly rather than creating a redundant guard.

### Step 5: Consult INTENT.md

Check your analysis against [INTENT.md](../../INTENT.md):

- Does the proposed guard preserve continuity of intent, internal consistency, accumulated knowledge, legibility, and honest state — where relevant to this system?
- Is the proposed guard low-burden (2–10 minutes at the handoff point)?
- Is it scoped to the delta of each iteration, not a full audit?

Adjust if not.

### Step 6: Design the guard

Write a draft guard skill file. It should include:

- **When to Run** — tied to the iteration handoff point identified in Step 2
- **When NOT to Run** — scope boundaries
- **Checklist** — one item per high-value entropy vector from Step 3; each item is a yes/no question with a clear action if yes
- **Output** — what the contributor records after running (brief note for commit message or session log)
- **Rationale** (optional but valuable) — a short note explaining why each check exists, so future maintainers can adapt intelligently

If the system is complex enough to need multiple guards (covering different aspects or different handoff points), design them separately and note their relationship.

### Step 7: Output

Save the draft guard as a skill file in the target system's skills directory (e.g. `skills/<system-type>-guard.md`).

Note in your output:
- What the top entropy vectors were and why
- Whether any existing mechanisms already cover some of them
- Any uncertainties or areas where the guard should be refined after real use

---

## What This Is Not

- A replacement for actually running guards — analysis is not practice
- A one-size-fits-all template — the value is in the system-specific targeting
- A finished product — the first version of any guard should be treated as a hypothesis, validated by actually running it
