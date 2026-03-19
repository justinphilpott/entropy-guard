---
name: entropy-assessment
description: Assess any system for entropy risks and optionally generate guards. Inventories what exists, identifies which domains are at risk, surfaces cross-domain drift, produces an entropy profile, can generate domain-specific guard artifacts including workflow/process guards, and should leave maintainers with actionable integration advice.
metadata:
  version: "0.5.0"
---

# Skill: Entropy Assessment & Guard Generation

Assess a system's entropy profile — where it's drifting, what's at risk, and what to do about it. This skill walks through a structured assessment that produces a standalone entropy report. If you want to go further and generate guards, it continues into domain-specific analysis and guard design using built-in domain references, then recommends how those guards should fit into the system's real iteration loop.

**Two phases, one skill:**
- **Phase 1 (Steps 1–4): Assessment** — produces an entropy profile and recommendations. This is a complete, useful deliverable on its own.
- **Phase 2 (Steps 5–8): Guard generation** — optional. Analyzes each relevant domain in depth, produces guard artifacts, and closes with concrete integration guidance.

> **Key principles** (from [INTENT.md](../../INTENT.md)):
> - A guard preserves five things: **continuity of intent**, **internal consistency**, **accumulated knowledge**, **legibility**, and **honest state**
> - A guard is **delta-scoped** (what changed this iteration, not a full audit) and **low-burden** (2–10 minutes)
> - Prioritize entropy vectors by **decay rate x recovery cost** — fast-decaying, cheap-to-fix problems (like link rot) need catching every iteration; slow-decaying, catastrophic-to-recover problems (like intent drift) need the most careful guarding
> - **Enforcement depth spectrum**: External (skill file, relies on discipline) → Prompted (pre-commit hook, workflow reminder) → Semi-embedded (linting, CI, catches mechanically) → Fully embedded (type system, structurally impossible to violate). If you're relying on discipline for something that could be mechanically checked, that's a design smell.

> **If you already know which domain needs a guard**: Skip Phase 1 and go directly to Phase 2. Pre-select your domain and use the relevant appendix.

---

## When to Run

- When you want to understand a system's entropy risks (assessment only — stop after Step 4)
- When you encounter a new system that undergoes repeated iteration and has no entropy guard
- When asked to evaluate whether an existing system's guards are adequate
- When an existing guard feels stale or misaligned and you need to reassess from scratch
- When you want to generate guards for a system (continue through Phase 2)

## When NOT to Run

- As a substitute for actually running an existing guard — if a guard exists, run it
- For trivial one-off scripts or throwaway artifacts that won't be iterated
- When the codebase needs a linter, not a guard — if the problems are formatting, syntax, or style, the answer is tooling, not a skill file

---

## Phase 1: Assessment

### Step 1: Establish system intent

Before anything else, determine whether the system can explain itself.

- Does intent documentation exist? (INTENT.md, README with a clear "why," architecture doc, design doc)
- If yes: read it and write a 2–4 sentence intent summary.
- If no: **this is the highest-priority finding.** Before a guard can check alignment with intent, intent must be articulated. Help the maintainer write a brief intent statement — even 2–3 sentences is enough to anchor everything that follows. Record it in the system (INTENT.md, README, or wherever is natural).

If you can't articulate what this system is for after investigation, stop. A guard for a system with no discernible intent is premature — the first task is to clarify purpose, not to guard it.

### Step 2: Assess the system landscape

Survey the system at a high level to understand what it contains and how it's structured. You're not going deep yet — you're building a map to decide which domains need analysis.

**What domains does this system span?**

| Domain | Present? | Signals |
|--------|----------|---------|
| **Code** | Yes/No | Source files, build system, runtime artifacts |
| **Documentation** | Yes/No | README, docs/, wiki, guides, API reference, inline docs |
| **Tests** | Yes/No | Test files, test config, CI test steps, coverage reports |
| **API contracts** | Yes/No | API endpoints, OpenAPI spec, GraphQL schema, protobuf, IPC interfaces, public SDK |
| **Workflow / process** | Yes/No | Contributor instructions, PR templates, checklists, runbooks, handoff docs, local skills, CI gates, release rituals |

Most systems span multiple domains. A web application likely has code, docs, tests, API contracts, and workflow/process. A documentation project might have docs plus workflow/process. A library might have code, tests, docs, API contracts, and release/process rituals.

**What is the iteration pattern?**

- How does this system change? (Commits, PRs, agent sessions, document edits, manual processes?)
- Who makes changes? (Solo developer, team, AI agents, a mix?)
- How often? (Multiple times daily, weekly, per sprint, sporadically?)
- What is the handoff point? (PR merge, deploy, sprint boundary, session end?)

Note whether different domains have different iteration patterns. Documentation may lag code. Tests may lag features. API specs may only update at release time. Workflow docs may describe an idealized loop that nobody actually follows. These cadence mismatches are themselves an entropy signal.

### Step 3: Identify cross-domain drift risks

Before diving into domain-specific analysis, assess the **inter-domain drift** risks. These live in the gaps *between* domains and no single domain analysis will catch them:

- **Docs vs. implementation**: do the docs describe the current system, or a past version?
- **Tests vs. implementation**: do the tests verify the current contract, or an old one?
- **API spec vs. implementation**: does the spec match what the code actually does?
- **Tests vs. docs**: do the documented behaviors have corresponding tests? Do tested behaviors appear in the docs?
- **Workflow vs. reality**: do contributor instructions, checklists, and handoff rituals match how changes actually happen?
- **Workflow vs. other domains**: do process docs still point at the current code/tests/docs/API surfaces, or do they enforce stale expectations?

Note the most dangerous drift risks. These will inform how domain-specific guards coordinate — for example, a docs guard should cross-check against code, a test guard should cross-check against the API contract, and a workflow/process guard should cross-check against the real handoff loop.

### Step 4: Prioritize domains for guard generation

Based on Steps 2 and 3, decide which domains warrant guards.

**Selection criteria:**

- Only analyze domains that are present and will be iterated. Don't generate a test guard for a system with no tests and no plan to add them.
- Prioritize by entropy risk. If docs/code drift is the biggest danger, focus on docs first.
- Treat workflow/process as first-class when the system's main risks live in handoffs, contributor rituals, release steps, agent instructions, or operational checklists. This is especially common in documentation-as-system repos, agent-heavy projects, and mature systems with lots of automation.
- Consider whether a general-purpose post-work checklist already covers the system adequately. A general guard is a short checklist (5–10 items) covering decision capture, internal consistency, cross-references, and honest state — run before each commit. For simple systems with one domain, this may be enough. Note this explicitly rather than generating domain-specific guards unnecessarily.
- Do not assume each high-risk domain needs its own file. If multiple risk areas share the same actor, trigger, and burden budget, a single combined guard may be better than separate guards.

**Sequencing (if generating guards for multiple domains):**

1. **Code** first (if applicable) — establishes the architectural baseline that other domains reference
2. **API contract** second (if applicable) — defines the contract surface that tests should verify and docs should describe
3. **Tests** third (if applicable) — can reference the code architecture and API contract
4. **Documentation** fourth (if applicable) — can reference all of the above and check alignment across them
5. **Workflow / process** last (if applicable) — should reference the real loop, the chosen guards, and the current enforcement surfaces rather than freezing an outdated ideal

### Assessment output

At this point you have a complete entropy assessment. Deliver it as a report:

- **System intent summary** (from Step 1)
- **Domain map** — which domains are present, their iteration patterns, cadence mismatches (from Step 2)
- **Entropy risk profile** — top cross-domain drift risks, ranked by danger (from Step 3)
- **Recommendations** — which domains need guards (if any), in what order, and why. For simple systems, note if a general entropy-guard checklist is sufficient (from Step 4)
- **Bootstrap actions** — anything the system needs before guards can work (e.g., write an intent statement, consolidate duplicate conventions)

> **If your goal is assessment only, stop here.** The report above is a complete deliverable — it tells the system's maintainers where entropy is accumulating and what to do about it. Continue to Phase 2 only if you want to produce guard artifacts.

---

## Phase 2: Guard Generation (optional)

This phase takes the assessment from Phase 1 and produces concrete guard artifacts. For each domain prioritized in Step 4, work through Steps 5–8 using the domain reference appendices at the bottom of this file.

### Step 5: Domain inventory

For each selected domain, inventory what exists before analyzing entropy. This prevents generating a guard that references artifacts that don't exist.

**Catalogue what's present.** Consult the relevant domain appendix (A-E) for domain-specific inventory items. For each item, note whether it's present, absent, or stale.

**Classify gaps.** For each expected element that's missing, determine:

- **Missing and needed** — the generated guard should include a bootstrap action (e.g., "write a 2-sentence intent statement before the first guard run")
- **Missing and fine** — not every system needs every element. A small CLI tool doesn't need a tutorial site.
- **Present but possibly stale** — exists but shows signs of age (dates, references to removed features, etc.)

If there is no intent or strategy documentation for the domain at all, **flag this prominently**. A guard cannot check alignment with intent that was never articulated.

### Step 6: Analyze domain entropy

For each selected domain, work through four analyses:

**a. Understand the domain's purpose.** This is not "what does it contain?" — it's "what role does this domain play?" Who relies on it? What is the cost of it being wrong? Write a 2–4 sentence domain intent summary.

**b. Map the iteration pattern.** When does this domain change? Who changes it? What triggers changes? What is the handoff point? Note the **lag pattern**: how much time typically passes between a change in one domain and the corresponding update in this one?

**c. Identify entropy vectors.** Consult the relevant domain appendix (A-E) for domain-specific entropy vectors. Rank the top 3–5 by destructive potential for *this specific system*. The ranking should reflect the product of decay rate and recovery cost (see key principles above).

**d. Assess existing quality mechanisms.** What does the system already have? For each existing mechanism, map it to the enforcement depth spectrum (see key principles above): External → Prompted → Semi-embedded → Fully embedded. Where is the system relying on discipline for something that could be mechanically enforced? Those are the highest-value recommendations. Consult the domain appendix for common mechanisms to look for.

**Check before proceeding.** Verify your analysis preserves: continuity of intent, internal consistency, accumulated knowledge, legibility, honest state. Verify the proposed guard will be low-burden (2–10 minutes) and delta-scoped (what changed this iteration, not a full audit).

### Step 7: Design the guard

Write a draft guard as a **skill file** — a markdown file (typically `SKILL.md` in its own directory under `skills/`) containing a structured checklist that a contributor (human or AI) runs at a handoff point. For a reference example of a generated guard, see the [entropy-guard project's own guard](https://github.com/justinphilpott/entropy-guard/blob/main/skills/local/entropy-guard/SKILL.md).

The guard should include:

- **When to Run** — tied to the domain handoff point identified in Step 6b
- **When NOT to Run** — scope boundaries
- **Bootstrap checks** (if Step 5 identified critical gaps) — one-time actions to establish baselines before the recurring guard makes sense
- **Checklist** — organized into two sections. Consult the relevant domain appendix (A-E) for domain-specific items:

  **Judgment-requiring checks** (keep as skill-file items):
  Items that require a human or AI to evaluate intent alignment, design coherence, and whether the right things are being guarded.

  **Mechanically-assistable checks** (with enforcement depth recommendations):
  Items where tooling could catch the issue. Each item should note its current enforcement level and recommend a target level with specific tool suggestions.

- **Inter-domain drift check** — at least one item should explicitly verify consistency with other domains (e.g., "do the docs reflect the code change you just made?")
- **Output** — what the contributor records after running
- **Rationale** — why each check exists and what entropy vector it guards against
- **Integration** — how this guard gets run (see Step 8)
- **Versioning metadata** — when generated, for what system state (see Step 8)

If generating guards for multiple domains, review the complete set for coherence: eliminate duplicated checks across guards, fill cross-domain gaps, verify handoff timing alignment, and confirm total burden stays within 2–10 minutes.

### Step 8: Close the loop — integration and versioning

A guard that isn't integrated into the workflow is dead weight.

Treat this step as a first-pass integration design. Stop here if you have one guard, one main actor, and an obvious trigger. If guard generation happens in a separate session from operational planning, or if the system has more than one guard, more than one actor type (for example humans plus agents), or existing CI / hooks / PR workflows that the guards should plug into, run [`skills/guards-integrator/SKILL.md`](../guards-integrator/SKILL.md) after this step to produce a deeper integration brief.

**Integration plan.** For each guard, specify:
- **Trigger**: exactly when and how the guard runs. Options by enforcement depth:
  - *External*: contributor runs it manually (skill file instructions)
  - *Prompted*: pre-commit hook prints a reminder, PR template includes a checkbox
  - *Semi-embedded*: CI step runs the guard automatically, blocks merge if checks fail
  - *Fully embedded*: guard checks are structural (type system, schema validation) — no separate "run" needed
- **Discovery**: how does a new contributor find out which guards exist? Recommend a manifest — a `guards/` directory, a section in AGENTS.md, or a guard-runner config file.
- **Execution**: if multiple guards exist, what order do they run in? Can they run in parallel?
- **Right-now adoption**: what can the maintainers do immediately, using their current workflow, so the guards start catching drift this week rather than waiting for ideal automation?
- **Agentic integration**: if AI agents work in the system, what standing instructions, task templates, or wrapper prompts need to mention these guards so a fresh agent actually runs them?

**Versioning metadata.** Each generated guard should include:
- **Generated**: date and which skill version produced it
- **Last evaluated**: date the guard was last reviewed for fit
- **System snapshot**: brief description of the system state when the guard was designed (so future evaluators can tell if the system has outgrown the guard)

**Output summary.** Deliver the complete guard set with:
- The system intent summary
- Which domains were analyzed and why
- The top cross-domain drift risks and which guards address them
- Bootstrap actions needed before the guards can be run effectively (ordered)
- Enforcement depth recommendations — which discipline-based checks should move to mechanical enforcement
- Integration plan — how guards will be triggered, discovered, and executed
- Immediate adoption plan — the smallest workflow changes that make the guards valuable right now
- Agent-facing integration notes — how the guards should appear in prompts, instructions, or handoff artifacts
- Versioning baseline — the system snapshot for future comparison
- Any uncertainties or areas to revisit after real use

**Upstream feedback check.** Before you finish, ask one final question: did `entropy-assessment` itself misfire in a way future users would hit too? Examples: it missed an important entropy signal, recommended an impractical integration point, generated a guard that needed major rewriting, or left the next step too implicit for a cold-start agent.

- If **no**, note that no upstream feedback is needed and finish normally.
- If **yes**, include a short `entropy-guard feedback` note in your output with:
  - **Title** — short, specific summary
  - **Category** — `assessment`, `guard-quality`, `integration`, `skill`, or `other`
  - **What I observed** — the concrete misfire or friction
  - **Suggestion** — what should change
  - **Project context** — enough context to judge whether the issue is general or niche
- When working inside the entropy-guard repo, or whenever the local feedback helper is available, use [`skills/local/entropy-guard-feedback/SKILL.md`](../local/entropy-guard-feedback/SKILL.md) to turn that note into a GitHub issue on `justinphilpott/entropy-guard`.
- When that helper is not available, leave the formatted feedback note in your final output so the maintainer can submit it manually.

---

## What This Is Not

- A guard itself — the assessment diagnoses entropy risks, and the optional generation phase produces guards
- A one-size-fits-all template — the value is in system-specific assessment and targeted recommendations
- A linter or style guide — if the problems are mechanical, the answer is tooling, not a guard
- A finished product — the first version of any assessment or guard set should be treated as a hypothesis, validated by real use

---

## Domain Reference Appendices

These appendices contain domain-specific knowledge used during Phase 2. Each covers: what to inventory, what entropy vectors to look for, how to split guard checks between judgment and mechanical enforcement, and what existing mechanisms to assess.

---

### Appendix A: Documentation

> Use during Phase 2: **A.1** for Step 5 (inventory), **A.2** for Step 6c (entropy vectors), **A.3** for Step 7 (checklist design), **A.4** for Step 6d (existing mechanisms).

#### A.1 Inventory items

- **Intent/purpose documentation** — INTENT.md, README with a clear "why," architecture docs, design docs
- **Doc types** — API reference, user guides, developer docs, tutorials, decision logs, changelogs, ADRs, runbooks, inline comments, README files
- **Location pattern** — co-located with code (docs/, docstrings)? Separate site (wiki, Confluence, Notion)? Both? Scattered?
- **Build/generation pipeline** — auto-generated docs? (typedoc, Sphinx, Storybook, etc.)
- **Source of truth** — when docs and code disagree, which is correct? Is this stated or just cultural?

#### A.2 Entropy vectors

- **Map/territory drift** — docs describe the system as it was, not as it is. The most damaging doc entropy vector — readers build incorrect mental models and make wrong decisions.
- **Coverage gaps** — features, APIs, configuration options, or workflows with no documentation at all. Often invisible because nobody notices what's not there.
- **Audience confusion** — docs written for the wrong reader. Developer internals mixed with user-facing guides. Expert-level docs as the only onboarding path.
- **Stale examples** — code samples, command examples, or screenshots that no longer work. Particularly dangerous because readers copy-paste them.
- **Link rot** — internal cross-references that point to moved/deleted content, external links that 404.
- **Structural decay** — docs grew organically without reorganization. The table of contents no longer reflects actual structure, related content is scattered.
- **Terminology drift** — docs use names or terms the codebase has moved away from.
- **Zombie content** — sections no longer relevant but never removed. They dilute trust in the rest of the docs.

**Special case — documentation-as-system**: When the documentation *is* the product (not docs *about* a separate system), map/territory drift becomes internal consistency drift, and coverage gaps become completeness gaps. The entropy vectors are the same in kind but point inward.

#### A.3 Checklist design guidance

**Judgment-requiring**: map/territory alignment (do docs reflect current system?), audience appropriateness, structural coherence, intent alignment.

**Mechanically-assistable**: link checking (→ CI step or linter), terminology consistency (→ search/replace tooling), stale example detection (→ doc test runner), orphaned page detection (→ build pipeline check).

#### A.4 Existing mechanisms to assess

Doc linters, link checkers, auto-generated docs from code, PR templates requiring doc updates, doc review as part of code review, scheduled doc audits. Note: auto-generated docs solve some entropy vectors but can create a false sense of coverage.

---

### Appendix B: Code

> Use during Phase 2: **B.1** for Step 5, **B.2** for Step 6c, **B.3** for Step 7, **B.4** for Step 6d.

#### B.1 Inventory items

- **Intent/architecture documentation** — INTENT.md, architecture doc, design doc explaining *why* the code is structured this way
- **Stated conventions** — contributing guide, style guide, conventions doc (documented or culturally transmitted?)
- **Static analysis** — linters, formatters, type checkers (ESLint, Prettier, mypy, clippy, etc.). What rules? Custom rules?
- **Type system usage** — structural (making invalid states unrepresentable) or cosmetic (annotating obvious types)?
- **CI/CD pipeline** — what runs automatically? What gates exist before merge?
- **Dependency management** — lockfile? Automated updates (Dependabot, Renovate)?
- **Code organization** — directory structure, module boundaries, pattern for where new code goes

#### B.2 Entropy vectors

- **Pattern proliferation** — multiple approaches to the same class of problem coexist. Error handling done three ways. Data fetching done two ways. Each locally correct, globally incoherent. The most common code entropy vector and hardest to catch mechanically.
- **Abstraction decay** — an abstraction created for a good reason persists after the need shifted. The name says one thing, the implementation does another. Newcomers build on a wrong mental model.
- **Responsibility drift** — modules that started with a clear purpose accumulate unrelated responsibilities. The file is 800 lines and handles three concerns. Often visible as "this file is the junk drawer."
- **Dependency rot** — not just outdated versions, but dependencies the project has outgrown, dependencies that overlap, dependencies whose API surface is barely used.
- **Dead code accumulation** — commented-out code, unreachable branches, unused functions, always-on feature flags. Dead code misleads readers about what's active.
- **Naming drift** — variables, functions, classes whose names no longer describe what they do. Often caused by scope expansion without rename.
- **Convention erosion** — a convention wasn't enforced mechanically and was gradually violated until the convention is the minority pattern.
- **Knowledge silos** — parts of the code only one person understands, not because they're complex, but because the design rationale was never externalized.

#### B.3 Checklist design guidance

**Judgment-requiring**: pattern consistency (does new code follow existing patterns or introduce a new approach?), abstraction fitness (do touched abstractions still accurately represent what they wrap?), responsibility coherence (does any file now handle responsibilities that don't belong together?), design intent alignment.

**Mechanically-assistable**: dead code detection (→ static analysis), naming consistency (→ linter/naming rules), dependency hygiene (→ unused dependency tools), convention adherence (→ custom lint rules for each convention currently checked by discipline).

#### B.4 Existing mechanisms to assess

Linting (rules, custom rules, auto-fix), type checking (strict mode, coverage), code review process, ADRs, module boundary enforcement (no-restricted-imports, dependency-cruiser), CODEOWNERS, refactoring cadence.

---

### Appendix C: Tests

> Use during Phase 2: **C.1** for Step 5, **C.2** for Step 6c, **C.3** for Step 7, **C.4** for Step 6d.

#### C.1 Inventory items

- **Testing philosophy/strategy** — documented approach? Contributing guide with test expectations?
- **Test types** — unit, integration, e2e, property-based, snapshot, performance, contract, smoke, acceptance, visual regression
- **Test infrastructure** — framework, runner, CI integration (Jest, pytest, Go test, Vitest, etc.)
- **Coverage tooling** — measured? What tool? Coverage gate?
- **Test data management** — fixtures, factories, builders, mocks, stubs, seeded databases, recorded HTTP responses
- **Test organization** — mirror source tree? Grouped by feature? By test type?
- **Mutation testing or test quality tools** — anything that tests the tests? (Stryker, mutmut, pit, etc.)

#### C.2 Entropy vectors

- **Assertion rot** — tests assert on stale values, implementation details rather than behavior, or have assertions so weak they'd pass on broken code. The test is green but proves nothing.
- **Coverage theater** — high coverage numbers masking untested critical paths. 90% line coverage that misses error handling and edge cases. Coverage as vanity metric rather than confidence signal.
- **Intent drift** — tests that once verified meaningful behavior now verify incidental implementation details. The test still passes, but what it proves is no longer what matters.
- **Fixture staleness** — test data, mocks, and recorded responses that no longer resemble real-world inputs. Tests pass against fictional data.
- **Test/system contract divergence** — the system's contract has evolved but the test suite still guards the old contract. New promises are unverified; old promises are over-guarded.
- **Redundancy accumulation** — multiple tests verify the same thing (from different eras), while new behavior has no tests at all. Test count grows but test value doesn't.
- **Flaky test erosion** — intermittently failing tests that train the team to ignore failures. Signal-to-noise ratio degrades.
- **Mock drift** — mocked dependencies that no longer behave like the real thing. Tests verify behavior against a fiction.

#### C.3 Checklist design guidance

**Judgment-requiring**: intent drift (are tests testing the right things?), test/system contract alignment (does the suite guard current promises?), test meaningfulness (would deleting a random test file matter?).

**Mechanically-assistable**: assertion strength (→ mutation testing), coverage quality (→ branch coverage + mutation testing), fixture freshness (→ contract tests, recorded response expiration), flaky test detection (→ quarantine tooling), redundancy detection (→ test impact analysis).

Test entropy is uniquely amenable to deeper enforcement. For each vector, explicitly note whether it can be mechanized.

#### C.4 Existing mechanisms to assess

Coverage thresholds/gates, mutation testing, test impact analysis, flaky test detection/quarantine, test review as part of code review, test performance monitoring, contract testing between services, snapshot update review.

---

### Appendix D: API Contracts

> Use during Phase 2: **D.1** for Step 5, **D.2** for Step 6c, **D.3** for Step 7, **D.4** for Step 6d.

#### D.1 Inventory items

- **API specification** — OpenAPI/Swagger, GraphQL schema, protobuf, JSON Schema? Generated from code or hand-maintained?
- **Contract consumers** — who calls this API? (Internal services, external customers, mobile apps, third-party integrations) How many? Can you enumerate them?
- **Versioning strategy** — URL path, header, query param, no versioning? How many active versions? Deprecation policy?
- **Contract testing** — tests verifying API behaves according to spec? (Pact, Dredd, Schemathesis) Do consumers contribute expectations?
- **Change communication** — how are API changes communicated? (Changelog, migration guide, they find out when things break)
- **Error contract** — consistent error response format? Documented? Actually followed across all endpoints?

**The contract triangle**: Every API has three aspects that can disagree: (1) the spec — what the API says it does, (2) the implementation — what it actually does, (3) client expectations — what consumers believe and depend on. Note which exist, which are explicit, and where you suspect disagreement.

#### D.2 Entropy vectors

- **Spec/implementation divergence** — the spec says one thing, the code does another. Clients trusting the spec build broken integrations. Can go both directions: spec documents removed behavior, or implementation has undocumented behavior.
- **Implicit contract expansion** — clients depend on behavior that was never promised: response field ordering, undocumented fields, timing characteristics, error message text. The API's *actual* contract is larger than its *documented* contract. Uniquely an API problem — no analog in other domains.
- **Error contract inconsistency** — different endpoints return errors in different formats. Each locally reasonable, collectively making client-side error handling brittle.
- **Versioning entropy** — multiple versions with unclear support status. v1 "deprecated" but still serving traffic. Deprecation timelines slipping.
- **Authentication/authorization drift** — auth model evolved but not all endpoints reflect the current model. Auth documentation lags auth implementation.
- **Cross-service contract drift** — in multi-service architectures, service A's expectations of service B are based on an old version. The contract between services is implicit rather than explicit.
- **Documentation decay** — API docs no longer match the current API. Higher stakes than general doc decay because consumers programmatically depend on accuracy.
- **Deprecation zombies** — endpoints, fields, or parameters marked deprecated but never removed. Consumers continue using them. The deprecation label becomes noise.

#### D.3 Checklist design guidance

**Judgment-requiring**: contract intent alignment (does this change serve the stability promise?), implicit contract awareness (does this alter undocumented behavior clients might depend on?), versioning coherence (is the version lifecycle still coherent?), consumer impact assessment (who is affected and do they know?).

**Mechanically-assistable**: spec/implementation sync (→ schema validation in CI, generated stubs), error format consistency (→ response validation middleware), breaking change detection (→ automated spec diffing), deprecation tracking (→ usage analytics on deprecated endpoints), auth consistency (→ auth middleware validation).

API entropy has the strongest mechanical enforcement story of any domain. Lean into this.

#### D.4 Existing mechanisms to assess

API specification (auto-generated or hand-maintained?), contract testing (consumer-driven, provider-driven, both?), schema validation in CI, breaking change detection, consumer communication channels, API review process, rate limiting/monitoring/usage analytics, client SDK generation from spec.

---

### Appendix E: Workflow / Process

> Use during Phase 2: **E.1** for Step 5, **E.2** for Step 6c, **E.3** for Step 7, **E.4** for Step 6d.

#### E.1 Inventory items

- **Contributor instructions** — AGENTS.md, CONTRIBUTING.md, onboarding docs, team playbooks, local skills, task templates
- **Handoff artifacts** — TODOs, issue trackers, PR templates, release checklists, runbooks, changelogs, decision logs
- **Execution surfaces** — local scripts, git hooks, CI jobs, scheduled reviews, release rituals, wrapper prompts, slash commands
- **Actor model** — who changes the system and at which handoffs? Humans, AI agents, reviewers, operators, release managers?
- **Declared loop vs. real loop** — what the repo says the workflow is, and what commit history / contributor behavior suggests it actually is

#### E.2 Entropy vectors

- **Practice drift** — the documented workflow no longer matches how work actually happens. Contributors follow habit instead of the stated loop, and the docs silently become fiction.
- **Handoff gaps** — a crucial follow-up step has no reliable trigger. Docs are "supposed" to be updated later; decisions are "supposed" to be captured at some point; nobody owns the transition.
- **Ceremony accumulation** — the process grew extra steps nobody believes in. People skip them routinely, which trains the system to ignore its own safeguards.
- **Responsibility ambiguity** — multiple actors assume someone else handles the check, or no one knows who is expected to do it.
- **Discovery failure** — the right ritual exists, but a fresh contributor or agent cannot tell it exists or when to run it.
- **Workflow/tooling mismatch** — the process relies on discipline for a check that could be prompted or automated, or conversely tries to automate something too judgment-heavy and creates noise.
- **Stale integration points** — process docs point at removed scripts, old CI jobs, obsolete branch rules, or outdated review steps.
- **Local optimization, global drift** — each team or agent follows a workable micro-loop, but the end-to-end system loses coherence because the handoffs do not line up.

#### E.3 Checklist design guidance

**Judgment-requiring**: does the documented loop still match reality, is each guard/check at the right handoff point, are roles and escalation paths clear, does the process preserve intent without adding cargo-cult ceremony?

**Mechanically-assistable**: reminder hooks (→ pre-commit / wrapper prompt), template enforcement (→ PR templates, issue forms), stale path detection in process docs (→ search / CI), required metadata capture (→ issue template fields, PR checks), handoff visibility (→ guard manifest, generated summaries).

Workflow/process guards often coordinate other guards rather than standing alone. Prefer a separate workflow guard only when the process has its own stable trigger or actor. If the workflow checks naturally belong at the same handoff as another guard, combine them.

#### E.4 Existing mechanisms to assess

CONTRIBUTING.md, AGENTS.md, PR templates, issue templates, release checklists, recurring review rituals, git hooks, wrapper scripts, CI jobs, bot reminders, CODEOWNERS, branch protection rules, scheduled maintenance tasks, and local skills that contributors are expected to run.
