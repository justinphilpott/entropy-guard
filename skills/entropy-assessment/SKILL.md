---
name: entropy-assessment
description: Front door for entropy-guard. Classify the system shape, route it to the most appropriate assessment workflow, and provide a lightweight fallback entropy profile when no deeper specialization fits yet.
metadata:
  version: "0.6.0"
---

# Skill: Entropy Assessment

Use this as the first stop when you do not yet know which entropy workflow fits the target system.

This skill is now a front door and router. It still produces a useful lightweight assessment on its own, but its main job is to identify the system shape and send you to the right deeper workflow.

Today the deepest validated specialization is `skills/docs-first-planning-assessment/SKILL.md`.

## When to Run

- You are entering a system cold and want to understand where entropy is accumulating
- You want to know whether a specialized assessment workflow applies
- You suspect an existing guard is stale or mismatched and want a quick fresh read before deeper work

## When NOT to Run

- As a substitute for running an existing guard that you already know is the right one
- For trivial one-off artifacts that will not be iterated
- When you already know the repo is a docs-first planning system; go straight to `skills/docs-first-planning-assessment/SKILL.md`

---

## Step 1: Establish intent

Before classifying the repo, determine whether it can explain itself.

- Read the highest-level intent docs first: `README.md`, `INTENT.md`, architecture docs, or design docs.
- Write a 2-4 sentence intent summary.
- If there is no discernible intent, stop and treat that as the highest-priority entropy finding.

## Step 2: Classify the system shape

Identify which of these best matches the target system.

### A. Docs-first planning

Choose this when most of these are true:

- the repo is markdown-first or documentation-as-system
- architecture, planning, design, or blueprint docs are the primary artifact
- `TODO.md`, decision logs, examples, templates, or agent instructions carry meaningful state
- the main iteration loop is repeated human/AI sessions rather than code/test/deploy alone
- the most likely drift is docs-to-docs, workflow/practice, or stale planning state

### B. Mixed docs + code

Choose this when the system has both meaningful implementation and a meaningful documentation/planning surface, and the top risks likely sit between them.

### C. Code-first / implementation-first

Choose this when the main artifact is implementation and the top risks are architectural drift, stale tests, or API/implementation mismatch.

### D. Workflow-heavy / ritual-heavy

Choose this when the primary entropy surface is how work is done: handoffs, release steps, contributor instructions, agent wrappers, or checklists.

If more than one shape fits, note the ambiguity and choose the one with the highest current risk.

## Step 3: Route to the right workflow

- If the answer is **Docs-first planning**, stop here and run `skills/docs-first-planning-assessment/SKILL.md`.
- If the answer is **Mixed docs + code**, continue below with the lightweight fallback assessment. Note the domains that need deeper follow-up.
- If the answer is **Code-first / implementation-first**, continue below with the lightweight fallback assessment. Treat the result as provisional until a stronger code-first specialization exists.
- If the answer is **Workflow-heavy / ritual-heavy**, continue below with the lightweight fallback assessment, paying special attention to declared loop vs real loop.

## Step 4: Lightweight fallback assessment

If no deeper specialization fits yet, produce a compact entropy profile.

### 4a. Map the present domains

For each domain, note whether it is present and actively iterated:

- code
- documentation
- tests
- API contracts
- workflow / process

### 4b. Identify the main cross-domain drift risks

Ask:

- docs vs implementation
- docs vs docs
- tests vs implementation
- API spec vs implementation
- workflow vs reality
- workflow vs other domains

Rank the top 3 risks by decay rate x recovery cost.

### 4c. Assess existing guard surfaces

Inventory what the system already has:

- skill files or checklists
- CI steps or scripted checks
- hooks, wrappers, templates, or contributor instructions
- decision logs, learnings logs, ADRs, or handoff notes

For each, decide:

- keep as-is
- amend
- replace
- no guard needed

### 4d. Recommend the next move

Choose the smallest useful next action:

- run `docs-first-planning-assessment`
- refine an existing guard
- add a lightweight general post-work guard
- hand the result to `guards-integrator`
- stop at assessment only because the system does not yet need a guard change

If the repo is still mostly markdown-first, planning-heavy, and AI-session-driven after this fallback pass, route it to `docs-first-planning-assessment` rather than trying to force a generic answer.

## Output

Deliver:

- **System shape classification**
- **Intent summary**
- **Domain map**
- **Top entropy risks**
- **Existing guard surface summary**
- **Recommended next skill or action**
- **Uncertainties**

## Upstream Feedback Check

Before you finish, ask whether this front door itself misrouted the system or left the next step too implicit.

Examples:

- it should have sent the repo to the docs-first planning track sooner
- the fallback profile was too shallow to be useful
- the classification shapes need another branch

If yes, capture a short feedback note and use `skills/local/entropy-guard-feedback/SKILL.md` when working inside this repo.

---

## Notes on Scope

- This skill is intentionally lighter than the specialized tracks behind it.
- The strongest validated path today is docs-first planning.
- Code/test/API-oriented assessment remains in scope, but is currently less specialized here.
