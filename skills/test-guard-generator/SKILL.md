---
name: test-guard-generator
description: Analyze a test suite and design an entropy guard for it. Detects assertion rot, coverage theater, intent drift, and fixture staleness. Maps mechanizable vs judgment-requiring checks. Use directly when you know the target is tests, or via the entropy-guard-generator entry point.
---

# Skill: Test Suite Guard Generator

Analyze a test suite and design an entropy guard appropriate for it. This is a domain-specific variant of the [general entropy guard generator](../entropy-guard-generator/SKILL.md), tuned for the ways test suites uniquely decay.

> **Before you begin**: Read [INTENT.md](../../INTENT.md). Pay particular attention to the **enforcement depth spectrum** — test entropy is uniquely suited to mechanical enforcement, and a good test guard should recommend the right depth for each vector.

> **Status**: Living scaffold. Refine based on real use. Note what works and what doesn't in LEARNINGS.md.

---

## When to Run

- When a system has a test suite that undergoes repeated iteration and has no test-specific entropy guard
- When tests pass but confidence is low — people don't trust the green checkmark
- When the test suite feels like a maintenance burden rather than a safety net
- When asked to evaluate whether an existing system's testing practices are sustainable

## When NOT to Run

- As a substitute for actually running an existing test guard — if one exists, run it
- For systems with no tests at all — the answer is "write some," not "guard what doesn't exist"
- For one-off test scripts or exploratory test code that won't be maintained

---

## The Process

Work through each step. Steps 0–5 are analysis; Steps 6–7 produce the guard.

### Step 0: Test suite inventory

Before analyzing entropy, discover what you're working with. This prevents generating a guard that assumes infrastructure or practices that don't exist.

**Catalogue what's present:**

- [ ] **Testing philosophy/strategy** — does the system have a documented testing approach? (Testing strategy doc, contributing guide with test expectations, ADR on test practices?) If not, this is a significant finding — the suite has no stated contract with the codebase.
- [ ] **Test types** — what kinds of tests exist? (Unit, integration, end-to-end, property-based, snapshot, performance, contract, smoke, acceptance, visual regression)
- [ ] **Test infrastructure** — what framework and runner? How are tests executed? (Jest, pytest, Go test, Vitest, etc.) CI integration?
- [ ] **Coverage tooling** — is coverage measured? What tool? What are the current numbers? Is there a coverage gate?
- [ ] **Test data management** — how is test data handled? (Fixtures, factories, builders, mocks, stubs, seeded databases, recorded HTTP responses?)
- [ ] **Test organization** — how do tests map to the system? (Mirror source tree? Grouped by feature? By test type? Mixed?)
- [ ] **Mutation testing or test quality tools** — anything that tests the tests? (Stryker, mutmut, pit, etc.)

**Classify gaps:**

For each expected element that's missing, determine:

- **Missing and needed** — the generated guard should include a bootstrap action (e.g., "document what the test suite is supposed to prove before the first guard run")
- **Missing and fine** — not every system needs every test type. A pure library doesn't need e2e tests.
- **Present but possibly stale** — exists but shows signs of neglect (skipped tests, disabled coverage gates, outdated fixture data)

If there is no testing strategy documentation at all, **flag this prominently**. Without a stated contract between the test suite and the system, it's impossible to evaluate whether tests are guarding the right things. Step 1 will need to shift from "read the strategy" to "help the maintainer articulate what the test suite should prove."

### Step 1: Understand what the test suite should prove

This is not "what does the test suite do?" — it's "what confidence is it supposed to provide?"

- What contract does this test suite verify? (Correctness? Performance? Security? API stability? Regression prevention?)
- Who relies on the test suite's verdict? (Developers before merging? CI/CD pipeline? Release process? Compliance?)
- What is the cost of a false green? (Broken production? Data corruption? Security breach? Just a bug that gets caught later?)
- What is the cost of a false red? (Blocked deploys? Developer frustration? Flaky-test fatigue leading to ignored failures?)
- What breaks if you delete a random test file? If the answer is "nothing noticeable" — that's a high-entropy signal.

Write a 2–4 sentence test suite intent summary. This captures what the suite is *for*, not just what it contains.

### Step 2: Map the test iteration pattern

Tests can evolve in sync with code or lag behind. Map the actual pattern:

- **When do tests change?** (Same commit as code? Same PR? Retroactively when a bug ships? During dedicated "test improvement" sprints? Never after initial creation?)
- **Who writes tests?** (Same person who writes code? QA team? Only when coverage drops below a threshold?)
- **What triggers a new test?** (New feature? Bug fix? PR review comment? Coverage gate? Nothing systematic?)
- **What triggers test removal or update?** (Refactoring? Flaky test complaints? Nothing — they just accumulate?)
- **What is the test handoff point?** (PR approval? CI green? Release? There isn't one specific to test quality?)

Note the **sync pattern**: do tests lead code (TDD), follow code (test-after), or drift independently? This determines what kind of entropy accumulates fastest.

### Step 3: Identify test entropy vectors

For this specific test suite, what degrades? Consider:

- **Assertion rot**: tests that assert on stale values, assert on implementation details rather than behavior, or have assertions so weak they'd pass on broken code. The test is green but proves nothing.
- **Coverage theater**: high coverage numbers that mask untested critical paths. 90% line coverage that misses error handling, edge cases, and integration boundaries. Coverage as a vanity metric rather than a confidence signal.
- **Intent drift**: tests that once verified meaningful system behavior but now verify implementation details that have become incidental. The test still passes, but what it proves is no longer what matters.
- **Fixture staleness**: test data, mocks, and recorded responses that no longer resemble real-world inputs. Tests pass against fictional data while real data would expose failures.
- **Test/system contract divergence**: the system's actual contract has evolved (new features, changed behavior, deprecated paths) but the test suite still guards the old contract. New promises are unverified; old promises are over-guarded.
- **Redundancy accumulation**: multiple tests that verify the same thing (often from different eras of the codebase), while new behavior has no tests at all. Test count grows but test value doesn't.
- **Flaky test erosion**: intermittently failing tests that train the team to ignore failures, re-run CI, or skip tests. The signal-to-noise ratio of the suite degrades.
- **Mock drift**: mocked dependencies that no longer behave like the real thing. The test verifies behavior against a fiction, not against reality.

Rank the top 3–5 vectors by destructive potential for *this specific test suite*. The ranking should reflect the product of decay rate and recovery cost (per INTENT.md).

### Step 4: Assess existing test quality mechanisms

- Does the system already have mechanisms for maintaining test quality? Consider:
  - Coverage thresholds or gates
  - Mutation testing
  - Test impact analysis
  - Flaky test detection and quarantine
  - Test review as part of code review (not just "are there tests?" but "are they good?")
  - Test performance monitoring (slow test detection)
  - Contract testing between services
  - Snapshot update review processes

- For each existing mechanism, map it to the **enforcement depth spectrum** (from INTENT.md):
  - External (relies on discipline) — e.g., "reviewer checks test quality"
  - Prompted (removes need to remember) — e.g., PR template asks "did you update tests?"
  - Semi-embedded (catches mechanically) — e.g., coverage gate in CI, mutation testing
  - Fully embedded (structurally impossible to violate) — e.g., type system guarantees, compile-time test generation

- Test entropy is uniquely amenable to deeper enforcement. For each identified vector, explicitly note: **can this be mechanized?**
  - Assertion rot → partially (mutation testing catches weak assertions)
  - Coverage theater → partially (branch coverage + mutation testing)
  - Fixture staleness → partially (contract tests, recorded response expiration)
  - Flaky test erosion → yes (flaky test detection and quarantine)
  - Intent drift → no (requires judgment about what matters)
  - Redundancy accumulation → partially (test impact analysis)

### Step 5: Consult INTENT.md

Check your analysis against [INTENT.md](../../INTENT.md):

- Does the proposed guard preserve **continuity of intent** — does the test suite continue to verify what the system actually promises?
- Does it preserve **internal consistency** — do tests agree with each other and with the system's current behavior?
- Does it preserve **honest state** — does the test suite accurately represent the system's actual test coverage and confidence level, not a flattering fiction?
- Does it address **inter-domain drift** — the divergence between what the system does and what the tests verify?
- Is it **low-burden** (2–10 minutes at the handoff point)?
- Is it **delta-scoped** — checking what changed this iteration, not auditing all tests?

Adjust if not.

### Step 6: Design the guard

Write a draft guard skill file. It should include:

- **When to Run** — tied to the test handoff point identified in Step 2
- **When NOT to Run** — scope boundaries
- **Bootstrap checks** (if Step 0 identified critical gaps) — one-time actions to establish baselines (e.g., document the testing strategy, enable coverage measurement, establish a flaky test process)
- **Checklist** — organized into two sections:

  **Judgment-requiring checks** (keep as skill-file items):
  - Items addressing intent drift, test/system contract alignment, and test meaningfulness
  - These require a human or AI to evaluate whether the tests are *testing the right things*

  **Mechanically-assistable checks** (with enforcement depth recommendations):
  - Items addressing coverage, assertion strength, fixture freshness, flaky tests
  - Each item should note its current enforcement level and recommend a target level
  - Include specific tool recommendations where applicable

- **Inter-domain drift check** — at least one item should explicitly verify that test changes reflect system changes (or vice versa): "did the system's contract change in this iteration? If so, do the tests reflect the new contract?"
- **Output** — what the contributor records after running
- **Rationale** — why each check exists and what entropy vector it guards against
- **Integration** — how this guard gets run (see Step 7)
- **Versioning metadata** — when generated, by which generator, for what system state (see Step 7)

### Step 7: Close the loop

A guard that isn't integrated into the workflow won't get run. A guard that isn't versioned won't get updated.

**Integration instructions** — the generated guard must specify:
- **Trigger**: when does this guard run? (Pre-commit, CI step, PR review, post-test-run) Tie this to the handoff point from Step 2. Test guards often integrate naturally into CI — consider whether the guard (or parts of it) should run as a CI step alongside the test suite itself.
- **Discovery**: how does a contributor find out this guard exists? (Contributor guide, guard manifest, CI pipeline config)
- **Enforcement depth**: for mechanically-assistable checks, specify whether they should be CI-enforced (blocks merge) or advisory (reports but doesn't block).

**Versioning metadata** — include in the generated guard:
- **Generated**: date and generator version
- **System snapshot**: brief description of the test suite's state when the guard was designed (test types present, coverage level, known gaps). This allows future re-evaluation: has the suite outgrown this guard?
- **Last evaluated**: date (initially same as generated; updated when the guard is re-assessed)

**Output summary** — note in your output:
- What the top entropy vectors were and why
- Whether any existing mechanisms already cover some of them
- What the Step 0 inventory revealed — especially any critical gaps
- **Enforcement depth recommendations** — which checks should be mechanized and how. This is unique to test guards and is one of the most valuable outputs.
- The split between judgment-requiring and mechanically-assistable checks, and whether the balance is right
- **Integration plan**: how the guard will be triggered and discovered
- **Versioning baseline**: the system snapshot for future comparison
- Any uncertainties or areas where the guard should be refined after real use

---

## What This Is Not

- A replacement for actually running a test guard — analysis is not practice
- A test framework recommendation — this guards test quality, not test tooling choices
- A coverage improvement tool — coverage is one signal among many; this guards the meaningfulness of the suite as a whole
- A test generation tool — it designs the guard, not the tests themselves
- A substitute for mutation testing — though it may recommend adopting mutation testing as a deeper enforcement mechanism
