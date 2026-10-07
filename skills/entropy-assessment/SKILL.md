---
name: entropy-assessment
description: Front door for entropy-guard. Establish what the system's steward has authorised it to be for, classify the system's shape, route it to the right analysis, and hand guard building to the guard generator. Use first when you do not know which entropy workflow fits.
metadata:
  version: "0.8.0"
---

# Skill: Entropy Assessment

The first stop when you do not know which entropy workflow fits. It establishes intent, chooses the route, and keeps
one assessment for the whole route. The other skills are:

- `docs-first-planning-assessment`, for analysis of a docs-first repo;
- `session-coherence-skill-generator`, the only skill that writes guards;
- `guards-integrator`, for adoption.

Run it in **assessment-only mode** when the generator needs analysis it was not given: stop at Step 4, without
handing over.

## Step 1: Intent

Run [`intent-pass.md`](intent-pass.md). It names the steward, separates declared, enacted and authorised intent,
settles what evidence can settle, and asks at most five questions, each one about a choice that changes what gets
built. Open questions do not block work that does not depend on them. If there is no usable intent at all, stop guard
work and recommend an intent interview.

## Step 2: Lifecycle and shape

Record the **lifecycle status** first, with its evidence: active, reference-only or frozen, or retired. It limits how
much the route may recommend.

Then choose the shape, and note whether the system spans more than one repository, such as a code repository and a
separate one that manages its work. If it does, assess the repositories as one system.

| Shape | When | Route |
|---|---|---|
| **A. Docs-first planning** | Markdown is the primary artifact; decision logs, TODOs and agent instructions carry state; work happens in repeated sessions. | Run `skills/docs-first-planning-assessment/SKILL.md`. Its assessment is the assessment: add only intent and lifecycle. |
| **B. Mixed docs and code** | Meaningful implementation and a meaningful docs or planning surface, with risk between them. | Read [`mixed-profile.md`](mixed-profile.md). |
| **C. Code-first** | Implementation is the main artifact; risks are architecture, tests or API drift. | As B. |
| **D. Workflow-heavy** | The main entropy surface is how work is done: handoffs, releases, instructions, checklists. | As B. |
| **E. Young repo** | Little history; purpose lives mostly in conversation; handoffs are starting. | Run the generator's [`bootstrap.md`](../session-coherence-skill-generator/bootstrap.md). |

If more than one shape fits, note it and take the riskiest. For B, C or D with a member repository that is docs-first,
such as one that manages the work rather than holding code, also run docs-first Steps 2, 3 and 5 on it, and fold the
results into the one assessment.

## Step 3: Is a guard needed?

Decide before any handover. A reference-only, frozen or retired system may finish with a correction or a demotion and
no generated guard. Otherwise choose between building a guard and refining an existing one, both through
`session-coherence-skill-generator`.

## Step 4: Hand on

Give the generator three things: the intent section, the analysis, and the ranked risks. In assessment-only mode,
stop here.

## Output

- Intent, from the intent pass.
- Lifecycle status, shape and repositories, each with evidence.
- Findings, each with an id, evidence and source.
- Guard surfaces, sorted by whether they execute (`mixed-profile.md`).
- The next step, and the questions for the steward, each with a recommended answer, or "none".
- Uncertainties.

These rules apply along the whole route, including the docs-first assessment, the generator's report and the
integration brief:

- **Keep one findings list.** Other sections refer to findings by id rather than repeating their evidence.
- **Make a separate file only when it has its own reader,** such as a guard or a state file, or when it is a patch that
  can be applied.
- **Never cut these for length:** where a claim came from, what was not covered, and the difference between a proposal
  and a decision.

If this skill misrouted the system or left a step too implicit, in a way others would hit, note it.
`skills/local/entropy-guard-feedback/SKILL.md` files it as an issue when working in this repo.
