---
name: entropy-assessment
description: Front door for entropy-guard. Establish what the system's steward has authorised it to be for, classify the system's shape, route it to the right analysis, and hand guard building to the guard generator. Use first when you do not know which entropy workflow fits.
metadata:
  version: "0.9.0"
---

# Skill: Entropy Assessment

The first stop when you do not know which entropy workflow fits. It establishes intent, chooses the route, and keeps
one assessment for the whole route. The other skills are:
- `docs-first-planning-assessment`, for analysis of a docs-first repo;
- `session-coherence-skill-generator`, the only skill that writes guards;
- `guards-integrator`, for adoption.

## Called for analysis only

The generator calls this skill when it lacks analysis, and a person may ask for an assessment only. In both cases:
- **Mode.** Every route inherits the caller's operating mode (plan, audit-only, discuss-first or build).
- **Where it stops.** It returns before any generation or integration.
- **What it returns:**
  - the findings;
  - the guard decision from Step 3;
  - the generator's inputs, as listed in the generator's "Before writing", with each one that is inapplicable or
    unresolved marked as such.
- **Reuse.** It reuses analysis already done and investigates only what is missing.

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

| Shape | When | Analysis |
|---|---|---|
| **A. Docs-first planning** | Markdown is the primary artifact; decision logs, TODOs and agent instructions carry state; work happens in repeated sessions. | Run `skills/docs-first-planning-assessment/SKILL.md` as a called skill: it returns to Step 3. Its assessment is the assessment; add only intent and lifecycle. |
| **B. Mixed docs and code** | Meaningful implementation and a meaningful docs or planning surface, with risk between them. | Read [`mixed-profile.md`](mixed-profile.md). |
| **C. Code-first** | Implementation is the main artifact; risks are architecture, tests or API drift. | As B. |
| **D. Workflow-heavy** | The main entropy surface is how work is done: handoffs, releases, instructions, checklists. | As B. |
| **E. Young repo** | Little history; purpose lives mostly in conversation; handoffs are starting. | Read the generator's [`bootstrap.md`](../session-coherence-skill-generator/bootstrap.md). |

If more than one shape fits, note it and take the riskiest. For B, C or D with a member repository that is docs-first,
such as one that manages the work rather than holding code, also run docs-first Steps 2, 3, 5 and 7 on it, and fold
the results into the one assessment.

## Step 3: The guard decision

Decide one of these before any handover, with the reason:

- **`none`:** no guard change is needed. Use it for a retired or reference-only system, which may finish with a
  correction or a demotion. Use it also for an active system whose existing guard and arrangements need no change.
- **`bootstrap`:** a young repo whose memory surfaces come first (`bootstrap.md`). Build a guard only if its verdict
  is `ready now`.
- **`create`:** no guard exists, and the loop needs one.
- **`update`:** an existing guard needs amendment.

## Step 4: Hand on

If this skill was called for analysis only, return now. Otherwise, for `create` or `update`, hand the findings and the
generator's inputs to `session-coherence-skill-generator`. The generator, in turn, hands to the integrator. This skill
makes the only handover to the generator on its route.

## Output

- Intent, from the intent pass.
- Lifecycle status, shape and repositories, each with evidence.
- Findings, each with an id, evidence and source.
- Guard surfaces: sorted by whether they execute (`mixed-profile.md`) for routes B to D, and classified in docs-first
  Step 7 for route A.
- The guard decision and the generator's inputs.
- Questions for the steward, each with a recommended answer, or "none".
- Uncertainties.

## Rules along the whole route

These apply to the docs-first assessment, the generator, the guards it writes, and the integration brief.

- **Keep one findings list.** Other sections refer to findings by id rather than repeating their evidence.
- **Make a separate file only when it has its own reader,** such as a guard or a state file, or when it is a patch that
  can be applied.
- **One owner per concept.** When two places define one concept independently, decide which owns it and reduce the
  other to a link. Summaries, generated projections, versioned copies and independent tests of the same contract are
  not competing definitions; keep them, and keep them correct.
- **Every correction is limited by its evidence:**
  - Before replacing a claim, identify its scope and the evidence for it.
  - Change only what that evidence settles; keep unresolved parts visibly open.
  - For an exhaustive list or an "only" claim, such as what the system reaches, launches or stores, check the full
    stated scope, including delegated behaviour. Otherwise, mark the replacement as incomplete.
  - Observed behaviour never authorises changing a prescribed boundary.
  - Each proposed patch names the open questions it touches and leaves their text unchanged. A patch that settles an
    open question is a decision, not a correction.
- **Never cut these for length:** where a claim came from, what was not covered, and the difference between a proposal
  and a decision.

If this skill misrouted the system or left a step too implicit, in a way others would hit, note it.
`skills/local/entropy-guard-feedback/SKILL.md` files it as an issue when working in this repo.
