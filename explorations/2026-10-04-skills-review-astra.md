---
title: "Independent review of entropy-guard's skills: GPT 6.1 Astra"
date: 2026-10-04
participants:
  - Justin Philpott
  - GPT 6.1 Astra (via opencode)
  - Claude Opus 5.5 (briefed and checked it)
type: review
status: complete
---

# Independent review of entropy-guard's skills: GPT 6.1 Astra, 4 October 2026

**How it was run.** Through opencode with `openai/gpt-6-astra --variant xhigh`, read-only: editing, shell, web,
sub-agents, browser tools and other directories were all denied. It read a snapshot pack of four things:

- entropy-guard at `447da9a`;
- ORC at `8cee662` and the lab Scope at `096b96f`;
- the 7 guards generated in other repositories;
- Justin's global `AGENTS.md`, plus the `intent-architect` and `repo-doc-evaluator` skills.

It did not see Claude's review (`2026-10-04-skills-review.md`).

**Timing.** The first attempt ran from 17:57 to 18:03. It returned only a 185-word summary, because the brief
pointed Astra at Justin's writing rules without exempting the report from the 150-200 word reply cap. That was the
brief's defect. The brief was amended and the same session resumed from 18:04 to 18:11 to write this report.

**Checked by Claude the same evening.** Every citation below was read in the pack, and all hold:

- The local guard (`skills/local/entropy-guard/SKILL.md:68`) says to resolve a mismatch by updating the skill or
  `INTENT.md`. FlowVoice's guard (`:51–53`) says to "update the relevant top-level docs". Neither asks for the
  steward's approval.
- The local guard (`:88`) says "update both" when two documents describe the same thing.
- The audio-tools guard (`:46–47`, `:196–197`) treats an explicit user request plus
  `AUDIO_TOOLS_ASYNC_ALLOW_LIVE_SPEND=true` as enough for live spend. That conflicts with the 3 October rule that
  spending goes through ORC.
- FlowBook's guard (`:158`) reviews `git diff origin/main..HEAD`, which leaves out uncommitted work.
- The tbt and scope-agentic-tools guards are byte-identical.
- ORC's README:
  - it names `ORCHESTRATOR_BOOKWHEN_API_TOKEN`, which appears only in the README and three tests, not in `src/`;
  - it lists scheduling and workflow execution as deliberately absent, while `src/app/async-work.ts` exists.
- ORC's only GitHub workflow runs Danger and nothing else, and its pre-push hook only prints a worktree summary.
- The lab's `STATE.md` says PR #200 is "not merged" and, in the same paragraph, merged as `3989cdb`. Its line 88
  still gives ORC as running on `369628b`, while the paragraph above records restarts up to `8cee662`.
- All eight cited `FRICTION.md` passages say what the report says they say.

OpenSpec, named below but not verified by Astra, was checked by Claude: a change is a proposal holding
ADDED / MODIFIED / REMOVED deltas, merged into the source-of-truth specs only when archived.

Its report follows unchanged.

---

Searched: all six entropy-guard skills, seven deployed guards, the supplied intent and documentation skills, and the ORC/lab snapshots. Found: existing intent-interviewing, handoff, architectural-checking, API-reporting and workflow-integration mechanisms — using these as the starting point rather than proposing replacement infrastructure. External alternatives below are identified from prior knowledge; their current maintenance status was not checked.

# Independent review of entropy-guard

**Recommendation: retain entropy-guard and improve its existing skills before adopting the resulting guard on ORC. Its strongest capability is preserving coherence across changes. Its largest gap is distinguishing an authorised change of intent from drift, then preserving the evidence needed to make that distinction later.**

Include ORC and its orchestration lab in this examination as read-only assessment cases. Their recorded failures expose shortcomings that another documentation-only example would not reveal.

## Evidence and limits

This review examines:

- `entropy-guard/`, the supplied snapshot of commit `447da9a`.
- All seven files in `deployed-guards/`.
- The supplied ORC snapshot, `orchestrator/`, at `8cee662`.
- The supplied lab snapshot, `scope-orchestration-lab/`, at `096b96f`.
- The three reference files named in the brief.

I read source and records; I did not execute the skills, run tests, inspect GitHub, or contact live services. Operational incidents below are reports preserved in the supplied files, not fresh observations of the running services.

The deployed guards establish adoption and show the instructions agents would receive. They do not establish how often those instructions ran, what every run found, or their net time savings.

# 1. Should this exist, and what already does it?

## Yes: the useful job is real, and parts of it already exist elsewhere

The March conversation records useful first applications: unfamiliar systems received targeted fixes that were quickly accepted (`entropy-guard/explorations/2026-03-19-autopoiesis.md:20–34`). The deployed guards also contain concrete, repository-specific knowledge that a generic linter would not supply.

For example, the Seed guard protects the repository’s product direction: `poc-starter` remains the product, old CLI material remains archival, and additional files must justify their context cost (`deployed-guards/seed--seed-coherence-guard.md:11–31`). That is a useful judgment task.

The strongest reason to retain entropy-guard is its ability to connect:

- What the steward intended.
- What the current artifacts and implementation say.
- How contributors actually work.
- Which existing mechanism should prevent a discovered problem from recurring.

No tool I can identify confidently from prior knowledge replaces that whole workflow. That is not a claim of uniqueness, and it is not a completed maintained-tool search.

## Direct peers and overlapping approaches to check

These are the closest external approaches I would examine before enlarging entropy-guard:

| Existing approach | Relevant overlap | Implication for entropy-guard |
|---|---|---|
| **Kiro Specs and Steering** | Persistent project guidance and requirements-to-design-to-task workflows. | Check its treatment of evolving requirements and project context before inventing another intent-maintenance workflow. |
| **Cline Memory Bank** | Project context, active state and progress preserved across sessions. | Much of session-coherence’s memory preservation belongs to an established problem category. |
| **GitHub Spec Kit**, `github/spec-kit` | Explicit principles, specifications and implementation planning. | Compare how it separates governing principles from individual changes and implementation evidence. |
| **OpenSpec**, `Fission-AI/OpenSpec` | Specifications and proposed changes maintained through a change lifecycle. | Examine its handling of accepted changes and superseded specifications before designing a new intent-change format. |

These are candidates for comparison, not adoption recommendations. I have not verified their October 2026 features or maintenance.

There is also relevant local evidence against casually replacing the workflow with a larger tool. The lab’s Beads trial reportedly changed shared Git configuration and introduced conflicting task-memory instructions (`scope-orchestration-lab/FRICTION.md:847–862`). A memory or issue tool’s governance assumptions matter as much as its features.

## Reuse the mechanisms already underfoot

ORC already uses several established tools for narrower parts of entropy resistance:

- **Vitest and architecture tests** check source boundaries.
- **API Extractor** produces the package API report.
- **Danger** checks required pull-request review sections.
- **Playwright** exercises browser behavior.
- **Pino and OpenTelemetry** provide diagnostic records and correlation.

The evidence is in `orchestrator/package.json`, `orchestrator/test/architecture.test.ts`, `orchestrator/test/package-api-report.test.ts`, `orchestrator/dangerfile.js`, and `orchestrator/VISIBILITY.md`.

For missing mechanical capabilities, tools such as **lychee** for links, **dependency-cruiser** for JavaScript/TypeScript dependency rules, and **Cucumber/Gherkin** for executable acceptance scenarios are relevant prior art. Entropy-guard should identify the need and prefer an existing mechanism where it fits.

## Justin’s two reference skills overlap materially

**`reference/intent-architect-SKILL.md` owns intent elicitation and acceptance definition.** Its refusal to guess, its distinction between operator decisions and technical claims, and its question “could every eval pass while the intent remains unrealised?” are directly useful here.

Entropy-guard should reuse those principles and refer substantial unresolved requirements work to intent-architect. It should not require that skill’s five-artifact bundle and multi-agent pipeline for every ambiguity. The supplied reference is an entry-point description; its full implementation and effectiveness were not available for review.

**`reference/repo-doc-evaluator-SKILL.md` owns newcomer comprehension and onboarding usability.** That overlaps with entropy-guard’s definition of legibility. It does not own repeated-change guarding, runtime evidence, or decision supersession.

Consequently, I would reconsider the proposed `doc-health-check` in `entropy-guard/TODO.md:20` against repo-doc-evaluator before creating it.

**Counterfactual:** replacing a useful lightweight skill with a specification suite or memory platform could cost more in migration and ceremony than it saves. The evidence supports reusing capabilities, not selecting a wholesale replacement.

# 2. Where the work stands

## What the six skills actually do

| Skill | Current responsibility | Assessment |
|---|---|---|
| `entropy-guard/skills/entropy-assessment/SKILL.md` | Establishes an intent summary, classifies the repository, routes documentation-first systems, and gives other systems a lightweight profile. | A useful front door, but its routing is incomplete. |
| `entropy-guard/skills/docs-first-planning-assessment/SKILL.md` | Maps canonical ownership and the iteration loop; produces an assessment, current-state packet and generated or refined guard. | The strongest developed assessment workflow. |
| `entropy-guard/skills/guards-integrator/SKILL.md` | Maps guards to triggers, actors, discovery paths, outputs and adoption stages. | Sound adoption guidance; it produces a plan rather than proving installation and use. |
| `entropy-guard/skills/session-coherence-skill-generator/SKILL.md` | Discovers repository memory and verification surfaces, bootstraps young repositories, and generates coding-session handoff guards. | Useful capabilities, insufficiently connected to the other exported skills. |
| `entropy-guard/skills/local/entropy-guard/SKILL.md` | Runs the repository’s own delta-scoped documentation and workflow check. | A useful reference, with contradictory instructions about resolving drift. |
| `entropy-guard/skills/local/entropy-guard-feedback/SKILL.md` | Turns concrete methodology feedback into GitHub issues. | Appropriately narrow. I found no material defect requiring its replacement. |

## What is sound

I found nothing wrong with these central choices:

- Assess before generating a guard.
- Prefer refining an existing guard.
- Identify one canonical owner for each concept.
- Check supersession before recreating deleted material.
- Keep recurring checks focused on the relevant change.
- Put mechanical invariants into existing tools.
- Keep bootstrap completion outside the guard definition.
- Allow “no new guard needed” as an outcome.
- Fit adoption to the real workflow.

The tracked reminder in `entropy-guard/.githooks/pre-commit:3–9` accurately implements a non-blocking reminder. It does not pretend to perform the judgment checks. Its installation in an actual checkout was not established by this snapshot.

## Finding: the front door omits an existing generation path

`entropy-assessment` routes mixed documentation/code systems to its fallback profile. Its next-action list names the documentation-first assessment and integrator, but never names `session-coherence-skill-generator` (`entropy-guard/skills/entropy-assessment/SKILL.md:66–126`).

That omitted generator explicitly addresses coding sessions, verification commands, operational state and code/documentation/test relationships.

**This is an instance, because routing already has an owner, but the owner does not expose an existing capability.**

The practical consequence is important for ORC: entering through the advertised front door gives a shallower path than entering through the newer generator directly.

## Finding: two exported workflows own overlapping guard construction

The documentation-first assessment designs and generates a session-end guard in Steps 6–8. The session-coherence generator independently specifies discovery, analysis, generation requirements and a checklist template.

Both address current state, decisions, learnings, handoffs and verification. Their requirements differ: session-coherence explicitly specifies invocation modes and generation metadata; documentation-first supplies stronger canonical-ownership and supersession guidance.

**This is an instance, because guard construction exists twice and the shared requirements have diverged.**

**Where should guard-construction requirements be defined once?** In the existing session-coherence generator. The documentation-first assessment should retain its specialised analysis and supply that analysis to the shared generation instructions. The integrator should continue to own detailed placement.

That recommendation does not require another orchestration layer. It requires one owner for the common instructions.

## Finding: the local guard can preserve duplication while checking for it

The local guard asks whether each concept has one canonical home, then immediately says: “Did you change something that another doc also describes? If so, update both” (`entropy-guard/skills/local/entropy-guard/SKILL.md:82–90`).

**This is an instance, because canonical ownership is already a stated rule, but the repair instruction can perpetuate independently maintained copies.**

The repair should first decide whether the second description is a legitimate summary, a generated projection, or redundant authority. Updating both is appropriate only after that distinction.

## Finding: the historical guidance is not consistently reconciled with the current workflow

`entropy-guard/DECISIONS.md:129–135` says domain knowledge was preserved in assessment appendices. That decision is marked partially superseded, but the current front door has no such appendices. Earlier workflow-domain and bootstrap decisions also describe steps that no longer appear in that form.

More significantly, `entropy-guard/LEARNINGS.md:117–133` directs fresh generation at every handoff, while `entropy-guard/INTENT.md:84–96` describes generation at design time and persistent guards executed later.

**This is an instance, because the repository already has supersession and canonical-ownership practices, but they have not fully reconciled its own methodology.**

Historical decisions should remain understandable as history. They should not silently compete with current operating instructions.

# 3. Intent and signal decay

## What lasting resistance requires

Capturing a fact is only the beginning. A useful signal must remain attributable, findable and applicable until it is superseded.

The skills address capture and consistency well. They only partly address whether a signal:

- Came from the steward, an observation, or an agent’s inference.
- Still applies to the present system and task.
- Reaches the actor who needs it.
- Produces a response at the relevant moment.
- Is corrected or retired when its basis changes.

## Finding: intent alignment has no reliable clarification boundary

The local guard permits correcting misalignment by updating the skill **or** revising `INTENT.md` (`entropy-guard/skills/local/entropy-guard/SKILL.md:60–68`). The Flowvoice guard tells contributors to capture a material intent shift and update top-level documents (`deployed-guards/flowvoice--entropy-guard.md:51–53`).

Neither instruction requires establishing that the steward authorised the shift.

**This is a missing system, because no shared workflow owns distinguishing authorised intent changes from discrepancies that must be put back to the steward.**

The failure is not that an intent document must never change. It is that making the documents agree can erase the evidence that a choice was never made.

A guard should separately establish:

1. What outcome and constraints were authorised.
2. What the change actually does.
3. Whether any difference is an implementation defect, a permitted adaptation, or an unresolved decision.

## Finding: current-state packets can become another stale authority

The documentation-first assessment requires a session-start packet containing current stage, settled decisions, active work and next actions. It does not require an observation basis, a refresh owner, an invalidation trigger, or explicit reuse of an existing state artifact (`entropy-guard/skills/docs-first-planning-assessment/SKILL.md:116–126, 184–188`).

The lab provides a concrete example of the problem this must handle. Its current-state file says PR #200 is not merged, then records that it merged; it records newer ORC restarts while retaining an older running-build statement (`scope-orchestration-lab/STATE.md:23–37, 88–90`).

The contradiction in the lab file is **an instance**, because the lab already assigns current-state maintenance to that file. The packet-lifecycle gap is **a missing system**, because the assessment does not assign responsibility for keeping its generated orientation current.

The answer is to update or project the existing current-state surface, with evidence attached to volatile claims. Creating another authoritative summary would reproduce the problem.

## Finding: rules can survive in files without reaching their consumers

The lab records four coding rules being promoted into a skill location loaded by neither relevant agent harness (`scope-orchestration-lab/FRICTION.md:610–616`). It separately records Scope business notes that never reached the agent, leading to triplicated rules (`scope-orchestration-lab/FRICTION.md:435–442`).

The integrator already asks about discovery and entry points, which is correct. It does not require an adoption check demonstrating that a fresh actor actually receives and invokes the guard.

**This is a missing system at operational validation, because a placement recommendation is produced, but no step establishes that the resulting discovery and trigger path works.**

This needs a verified adoption step, not necessarily a runner implementation.

## Finding: generated guards mix durable checking policy with temporary state

The Audio Tools guard embeds a current product direction, the completion of a particular tranche, and the next issue to investigate (`deployed-guards/audio-tools--session-coherence-guard.md:23–32, 68–73`).

Those facts have a different lifetime from the instruction to check current state before handoff.

**This is an instance, because current-state files already exist, but the generated guard duplicates their responsibility.**

There is also a concrete policy conflict. The Audio Tools guard describes live-spend eligibility in terms of explicit user intent and an environment flag (`:46–47, 196–197`). The supplied global rules require spend to pass through ORC’s durable-work permissions or an exact approved standing grant (`reference/justin-global-AGENTS.md:321–340`).

The higher-level rule remains authoritative. The old guard is not permission to bypass it. Nor does the evidence establish that the guard caused the recorded unauthorised paid run.

The lesson is that generated guards should discover current authority rules, rather than freeze them as independent policy.

## Finding: “delta-scoped” is not yet a precise coverage promise

The FlowBook guard instructs an agent to review changes before its final commit using:

```text
git diff origin/main..HEAD
```

That compares committed trees. It does not include staged, unstaged or untracked work awaiting the final commit (`deployed-guards/flowbook--entropy-guard.md:155–163`).

**This is an instance, because delta inspection is already the guard’s job, but the prescribed comparison omits part of the intended delta.**

A guard needs to state its baseline and what it examined. When that baseline is unavailable, the result should say “coverage incomplete,” not imply a clean session.

Changed files also do not capture every relevant change. A grant can expire or a deployed build can change without a new local edit. Such facts need event- or freshness-based checks where they matter.

## Salience and provenance need more than additional logs

`entropy-guard/LEARNINGS.md` calls itself a collection of validated discoveries. Yet its three autopoiesis entries cite a philosophical conversation as their validation (`:117–143`).

The lab’s friction record supplies the other side of signal loss: important facts are recorded repeatedly but still fail to influence action. On 23 September, its state file reportedly reached 405 lines while the agent claimed to be maintaining it (`scope-orchestration-lab/FRICTION.md:534–540`).

**This is an instance of evidence classification in `LEARNINGS.md`, and a missing lifecycle responsibility in the exported skills: preserving a signal does not yet require preserving its evidential status or reviewing whether it remains useful.**

A periodic review should group recurrences by cause, distinguish product failures from workshop failures, and retire obsolete guidance. It should not promote every incident into another permanent instruction.

## Testing the autopoiesis conclusions

### “Freshly generated checks resist staleness better”

**Conditionally right.** Selecting checks from the actual delta is useful. Regenerating everything from the current implementation can also normalise the very drift being checked.

The generator needs an independently retained reference: approved intent, accepted constraints, and relevant historical evidence. Freshness alone does not supply correctness.

The deployed guards demonstrate the cost of embedded temporary state. They do not demonstrate that regenerating the full assessment at every handoff performs better.

### “Different parts need different persistence expectations”

**Right, but the recorded formulation conflates the generator with its execution.**

`entropy-guard/LEARNINGS.md:127–133` calls the process generator ephemeral. The same exploration describes the assessment machinery as the stable encoding layer.

The practical distinction should be:

- Approved intent and rationale persist, with explicit amendment and supersession.
- The reusable assessment and guard-selection method persists.
- Current observations and risk memory are refreshed when their basis changes.
- A particular run’s selected checks are temporary.
- Material findings, decisions and verification results remain available as evidence.

Current operational facts may become stale much faster than architectural memory. They should not share one assumed refresh cadence.

### “Existing guards mostly protect representations rather than purpose”

**Broadly right for this repository, but too absolute about tests and other tooling.**

Most deployed checks compare documents, code, contracts and state. The Seed guard is a useful exception: it explicitly tests product direction.

The claim that tests cannot guard purpose is too strong. Acceptance tests can encode real outcomes, and independent observation can check whether those outcomes occurred. What tests cannot independently settle is an unarticulated or changed human need.

The March working conclusions express the problem more carefully: declared intent, enacted intent and actual need can differ, and escalation should be calibrated (`entropy-guard/explorations/2026-03-24-entropy-immune-system-working-conclusions.md:38–48, 63–83, 101–103`).

**This is an instance of overclaiming in the learning record, because conceptual hypotheses are presented as validated conclusions.** Keep the useful distinctions, but do not use them to justify a new architecture before comparing it with the existing method.

The skills partly implement the conclusions through enforcement depth, current-state packets and feedback. They do not yet implement explicit stewardship, signal provenance, or demonstrated outcome-based intent checking.

# 4. Unclear intent: what the skills should produce and when they should ask

## Classify uncertainty before attempting repair

The skills should distinguish four conditions:

| Condition | Meaning | Required response |
|---|---|---|
| **Missing intent** | The relevant outcome or constraint is not stated in the available authoritative material. | Name the missing decision and ask the responsible steward. |
| **Conflicting intent** | Applicable sources prescribe incompatible outcomes or constraints. | Present both sources and establish their authority and supersession relationship. |
| **Stale intent representation** | A document still describes an earlier, demonstrably superseded decision. | Correct the representation from evidence; do not reopen the settled decision. |
| **Ambiguous intent** | The available statement permits materially different actions. | Give concrete alternatives and their consequences; ask only for the unresolved choice. |

A document’s modification date alone does not make it authoritative. Implementation shows enacted behavior; it does not automatically authorise that behavior.

## Produce a small clarification record in an existing work surface

For each material uncertainty, the assessment should produce:

- **The disputed statement and scope.** Name the affected capability or work.
- **The evidence.** Cite the relevant statements and distinguish decisions, observations and inferences.
- **The consequence.** Explain which action would differ under each interpretation.
- **The decision owner.** Name who can resolve the remaining uncertainty.
- **The question and recommendation.** Present concrete options, with a recommended choice.
- **The resolution.** Once answered, record the decision in its canonical home and supersede the conflicting instruction.

Use the existing issue, decision record or handoff surface. Do not create another permanent ambiguity registry unless the existing workflow cannot hold the information.

## Ask only when evidence cannot resolve a consequential choice

The front door currently stops if intent is indiscernible (`entropy-guard/skills/entropy-assessment/SKILL.md:30–36`). That is appropriate for purpose-dependent recommendations, but unnecessarily broad for all assessment work.

The agent can still inventory artifacts, identify broken references, and distinguish available evidence from missing evidence. It should suspend only the work that depends on the unanswered intent.

Two examples from this corpus show the boundary:

**ORC’s README says scheduling and workflow execution are deliberately absent.** The lab’s dated async-work decision assigns general durable work to ORC, and the source implements it (`orchestrator/README.md:152–154`; `scope-orchestration-lab/decisions/2026-09-17-async-work-architecture.md:19–30`; `orchestrator/src/app/async-work.ts`).

The correct response is to identify stale self-description and distinguish implemented capability from operator-facing availability. Asking Justin whether ORC should have durable work would unnecessarily reopen an existing decision.

**Entropy-guard’s documents disagree about persistent guards versus regeneration at every handoff.** The skills and current intent describe a persistent-guard workflow; the learning record advocates the alternative. Report the current operating method and the competing hypothesis. Ask the steward only if implementation work would change that method.

The question should be concrete: “Should the next revision retain a compact reusable guard with checks selected for each delta, or replace it with a fresh full assessment at every handoff? I recommend the former because it preserves stable constraints with less repeated assessment.”

**Counterfactual:** a mandatory interview for every discrepancy would consume attention and slow ordinary maintenance. Clarification should resolve decisions, not substitute for reading evidence.

# 5. Fitness for ORC

## The path the skills would take today

### ORC itself

The most defensible classification is **mixed documentation and code**. Its intent is discernible from `orchestrator/README.md`, `orchestrator/AGENTS.md`, and the lab’s stated north star.

The advertised front door would therefore:

1. Produce an intent summary.
2. Map code, documentation, tests, contracts and workflow.
3. Rank its principal cross-domain risks.
4. Inventory existing guard surfaces.
5. Recommend further action through the lightweight fallback.

It would not automatically reach the session-coherence generator.

That fallback is honestly described as less specialised. The defect is not that it secretly promises a complete code review; it is that the existing stronger handoff-generation path is omitted.

### The orchestration lab

The lab fits both documentation-as-system and workflow-heavy categories. Its `STATE.md`, decisions and reports suit the documentation-first assessment, while its issue map and operating processes require the workflow lens.

The router leaves this tie to the agent. That is workable, but it should not cause the combined ORC/lab system to be treated as a documentation-only repository.

The useful boundary is one assessment of their relationship, with different evidence requirements for ORC’s implementation and the lab’s operating context.

## What the skills could usefully find

### Stale self-description

ORC’s README still instructs the reader to configure `ORCHESTRATOR_BOOKWHEN_API_TOKEN` (`orchestrator/README.md:76–79`). Searching the supplied TypeScript and Markdown files found that name in the README and tests, not in the implementation.

The same README calls scheduling absent while later parts describe a durable restart card.

**This is an instance, because documentation already has an owner but no longer consistently describes the implementation.**

An ordinary map/implementation check should catch it.

### Contradictory current state

The lab’s `STATE.md` contains both unmerged and merged descriptions of PR #200, plus incompatible running-build statements.

A documentation-first check should catch those contradictions. It should not choose a live-state value without a fresh observation.

### Checks that exist without automatic execution

ORC’s architecture tests and API report test are real guard surfaces. However, the supplied `.github/workflows/` contains only `danger.yml`, whose command runs Danger, not the test suites. The pre-push hook prints a worktree summary.

The lab also records an end-to-end suite remaining red unnoticed for a week (`scope-orchestration-lab/FRICTION.md:396–400`), and tracks tests on every PR as #144.

**This is a missing system in automated verification coverage, because the available checks do not establish a routine that executes the test suites before merge.**

The guard should recognise the existing issue and connect its recommendation to that work. It should not invent a second test-running project.

## What the current skills would not reliably establish

### Whether approved meaning survives implementation boundaries

The lab records fixtures that equated two different Bookwhen identifiers, hiding four wrong comparisons (`scope-orchestration-lab/FRICTION.md:635–651`). It also records tests against a different browser snapshot representation from the one the agent actually received (`:323–331`).

The skills ask whether contracts and implementations agree. They do not require tracing a consequential term through actual producers, consumers and captured evidence.

### Whether approval still describes the effect at execution time

The prior review identifies work executing under a later package build than the one originally contemplated (#137; `scope-orchestration-lab/reports/2026-10-01-review-synthesis.md:30–34`). In the supplied source, `PackageTaskExecution.replaceOwners` replaces the owner map, and execution acquires the selected owner’s current authority digest (`orchestrator/src/app/async-work.ts:172–182`).

This is an example of intent preservation across time, not merely document consistency. The existing assessment prompts do not explicitly examine it.

### Whether a rule is actually a control

The global evidence records `unavailableOperations` as prompt text that withdrew no tool authority (`reference/justin-global-AGENTS.md:106–121`). The skills’ enforcement spectrum recognises the distinction, but generated checks need to follow the relevant rule to the actual refusal point.

### Whether the system delivered the steward’s outcome

The lab distinguishes successful mechanisms from completed business work. Its earlier direction review explicitly separates valued research, diagnosis improvements and platform development from completed booking outcomes (`scope-orchestration-lab/reports/2026-09-25-direction-review-astra.md:27–41`).

A coherent packet and passing tests cannot substitute for that distinction.

These are **missing assessment responsibilities**, because the current instructions do not require a representative trace from approved outcome through execution to independently observed result. They are not a reason to turn every handoff into a full audit.

## Should ORC participate now?

**Yes, as a read-only test case for the skills, together with the lab.**

ORC supplies the implementation and executable constraints. The lab supplies intent, decisions, operating history and consequences. Examining either alone would omit material evidence.

The evaluation should establish whether the revised skills:

- Take the correct route.
- Reuse ORC’s checks and existing work map.
- Identify the known state contradictions.
- Distinguish recorded history from current observations.
- Recognise consequential uncertainties without guessing.
- Avoid reopening decisions already settled by Justin.

Keep Moving Stillness’s recorded pause intact. No live browser operation is needed to evaluate these assessment behaviors.

ORC should be one demanding case, not the sole basis for a generic methodology. Otherwise entropy-guard could become a checklist specialised to ORC’s architecture and failure history.

# 6. Changes in priority order

The estimates below are rough editing, review and scenario-checking effort, not measured delivery promises. They exclude implementing ORC features and verifying live deployments.

## 1. Add a shared intent-and-evidence clarification step

**Change:** require assessments and generated guards to distinguish authorised intent, observed behavior and unresolved interpretation. Give each consequential ambiguity an evidence-backed question and a decision owner.

**Reuse:** intent-architect’s refusal-to-guess and acceptance-coverage principles. Retain existing decision and issue surfaces.

**Evidence:** the local guard’s intent-revision instruction and Flowvoice’s automatic alignment instruction, discussed in Sections 3–4.

**Cost:** approximately half a day to revise the relevant instructions and check resolved, unresolved and legitimately changed-intent examples.

**Costly counterfactual:** requiring steward confirmation for ordinary evidence-backed corrections would create needless interruptions. The rule must explicitly permit resolving factual staleness from authoritative evidence.

## 2. Repair routing and give shared generation requirements one owner

**Change:** route appropriate mixed/code handoff work to `session-coherence-skill-generator`. Make that generator own common guard requirements; keep specialised documentation assessment and integration responsibilities distinct.

**Evidence:** the missing route in `entropy-assessment:66–126`, and the overlapping generation procedures in the two exported skills.

**Cost:** approximately half to one day across the four exported skills and their entry-point documentation.

**Costly counterfactual:** over-consolidation could erase the useful documentation-first analysis or require every simple invocation to load several unnecessary workflows. Preserve direct entry points and load only the relevant guidance.

## 3. Give generated packets and guard results an explicit lifecycle

**Change:** require reuse of existing state surfaces, source references for volatile claims, and clear refresh or invalidation conditions. Generated guards should report what was checked, what was not checked, and what remains unresolved.

Define the relevant delta rather than assuming one Git comparison covers it. Keep temporary stage descriptions and next tasks in current-state artifacts.

**Evidence:** the lab’s contradictory `STATE.md`, Audio Tools’ embedded tranche state, and FlowBook’s committed-tree-only comparison.

**Cost:** approximately half a day for the instructions and representative output examples. Actual recurring burden must be measured during use.

**Costly counterfactual:** elaborate metadata could become another stale registry. Keep mechanically derivable facts derived, and record only evidence that changes a decision or enables recovery.

## 4. Add operational acceptance to integration recommendations

**Change:** a guard is considered adopted only after its entry point and trigger have been exercised. Separate a reminder, an executed check, and an enforced invariant in the output.

For consequential claims, include a representative trace through the real boundary or an existing relevant test.

**Reuse:** ORC’s Vitest, Playwright, API Extractor, Danger and existing issue #144. Use the target project’s own workflow machinery elsewhere.

**Evidence:** the uninstalled hook recorded in `scope-orchestration-lab/FRICTION.md:541–544`, the unread rules, and the unrun end-to-end suite.

**Cost:** approximately half a day for the skill changes, plus a target-specific adoption check.

**Costly counterfactual:** running every test or performing a full integration audit at every small handoff would overwhelm the guard’s purpose. Match the verification to the changed invariant and use existing continuous checks for the rest.

## 5. Reconcile the theory record with the chosen operating method

**Change:** distinguish hypotheses from validated learnings. Resolve the persistent-generator/ephemeral-run terminology and state which workflow currently governs the skills. Mark superseded procedural descriptions clearly.

Keep the March explorations as historical evidence.

**Evidence:** the conflicting lifecycle descriptions in `LEARNINGS.md:117–143`, `INTENT.md:84–96`, and the current generators.

**Cost:** approximately two to four hours for a focused reconciliation.

**Costly counterfactual:** reopening the entire philosophy could consume days without improving a guard. Limit the work to claims that currently change how an agent acts.

## 6. Refresh deployed guards according to actual use

**Change:** inspect active guards against their repositories’ present workflows and governing policies. Prioritise the Audio Tools spend-policy conflict and FlowBook’s delta definition if those guards are still used.

Do not assume every old guard requires maintenance merely because a copy exists.

**Evidence:** seven deployed files show materially different generations of the method; the TBT and scope-agentic-tools copies are the same generic checklist, while newer guards carry more specialised responsibilities.

**Cost:** triage should take a short review of each guard; refreshing an active guard requires its current repository and may take several hours. The supplied copies are insufficient to verify every named command.

**Costly counterfactual:** comprehensively refreshing dormant guards could exceed their likely future benefit. Confirm whether each guard has a current consumer before spending that effort.

## 7. Evaluate the revision on concrete cases before broad rollout

**Change:** compare the current and revised instructions on cases already exposed here:

- A missing route to an existing capability.
- Conflicting current-state claims.
- A settled decision represented by stale documentation.
- A genuinely unresolved intent choice.
- A guard whose instructions are never loaded.
- A delta containing uncommitted work.
- A legitimate change that should produce no finding.

Use ORC and the lab for the mixed-system case, and an existing documentation-oriented guard for contrast. Include an unfamiliar change so the exercise does not merely reward recognising this report.

Record useful findings, missed findings, false alarms, clarification quality and effort. Do not use the number of generated artifacts as the success measure.

**Cost:** approximately one day for a focused comparison and revision; subsequent evidence should come from normal use.

**Costly counterfactual:** a large benchmark project could become more work than the skills. These cases should verify the upgrade’s claimed behaviors, not create a research programme.

## What to cut, and what not to build

- **Cut duplicated guard-construction instructions.** The cost is the consolidation above; keeping both preserves divergent requirements.
- **Cut temporary work status from reusable guard policy.** Move necessary facts to their existing canonical state surface, with references from the guard.
- **Remove `doc-health-check` as an assumed dependency until its distinct job is established.** Comparing its intended coverage with repo-doc-evaluator should take a short assessment, not a new implementation.
- **Do not build a dedicated guard runner or evaluator runtime now.** Existing hooks, task runners and CI can execute the present checks. A new runtime would add installation, scheduling and failure-reporting obligations before the simpler adoption path has been exercised.
- **Do not build an intent language, semantic graph or autonomous intent-rewriting system from the autopoiesis discussion.** The immediate gap is evidence-backed clarification and stewardship. The supplied evidence does not establish a need for those larger mechanisms.
- **Do not generate a new document for every preservation concern.** Canonical ownership should reduce independently maintained state, not multiply it.

## Recommended decision

Approve a bounded revision of the existing skills covering clarification, routing, signal lifetime and verified integration. Then assess ORC and the orchestration lab together using the revised workflow.

That preserves what entropy-guard already does well while addressing the concrete failure visible throughout this corpus: **information was often recorded, but its authority, freshness, delivery or consequence was lost before the next decision depended on it.**
