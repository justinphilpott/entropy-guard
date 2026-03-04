---
name: api-guard-generator
description: Analyze an API and design an entropy guard for it. Assesses the contract triangle (spec vs implementation vs client expectations), error consistency, and versioning entropy. Use directly when you know the target is an API, or via the entropy-guard-generator entry point.
---

# Skill: API Contract Guard Generator

Analyze an API and design an entropy guard appropriate for it. This is a domain-specific variant of the [general entropy guard generator](../entropy-guard-generator/SKILL.md), tuned for the ways API contracts uniquely decay.

> **Before you begin**: Read [INTENT.md](../../INTENT.md). API entropy is distinctive because it is **externalized** — your drift becomes someone else's broken system. The inter-domain drift concept from INTENT.md applies with particular force here: the spec, the implementation, and the client expectations are three domains that must stay in agreement.

> **Status**: Living scaffold. Refine based on real use. Note what works and what doesn't in LEARNINGS.md.

---

## When to Run

- When an API undergoes repeated iteration and has no contract-specific entropy guard
- When an API has consumers (internal or external) and breaking changes have caused incidents or friction
- When there's uncertainty about what the API actually promises vs what clients happen to depend on
- When asked to evaluate whether an existing API's contract management practices are sustainable

## When NOT to Run

- As a substitute for actually running an existing API guard — if one exists, run it
- For internal function-call interfaces within a single codebase — the code guard generator covers those
- For APIs that are genuinely experimental with no consumers yet

---

## The Process

Work through each step. Steps 0–5 are analysis; Steps 6–7 produce the guard.

### Step 0: API contract inventory

Before analyzing entropy, discover what contract surfaces exist and how they're managed. API entropy is uniquely dangerous because it often lives in the gap between what's documented and what clients actually depend on.

**Catalogue what's present:**

- [ ] **API specification** — does a formal spec exist? (OpenAPI/Swagger, GraphQL schema, protobuf definitions, JSON Schema, RAML, hand-written docs) Is it generated from code or hand-maintained? If generated, what's the source of truth?
- [ ] **Contract consumers** — who calls this API? (Internal services, external customers, mobile apps, third-party integrations, AI agents) How many consumers? Can you enumerate them, or is the consumer set unknown?
- [ ] **Versioning strategy** — how are API versions managed? (URL path, header, query param, no versioning) How many active versions exist? Is there a deprecation policy?
- [ ] **Contract testing** — are there tests that verify the API behaves according to its spec? (Pact, Dredd, Schemathesis, custom contract tests) Do consumers contribute contract expectations?
- [ ] **Change communication** — how are API changes communicated to consumers? (Changelog, migration guide, email, Slack, they find out when things break)
- [ ] **Authentication/authorization surface** — how is access controlled? Is the auth contract documented alongside the data contract?
- [ ] **Error contract** — is there a consistent error response format? Is it documented? Is it actually followed across all endpoints?

**Classify gaps:**

For each expected element that's missing, determine:

- **Missing and needed** — the generated guard should include a bootstrap action (e.g., "generate an OpenAPI spec from the current implementation before the first guard run")
- **Missing and fine** — an internal API with two known consumers may not need formal versioning
- **Present but possibly stale** — a spec that was accurate at launch but hasn't been updated, a versioning strategy that's documented but not followed

If there is no API specification at all, **flag this prominently**. Without an explicit contract, the implicit contract is "whatever the API currently does" — which means every implementation detail is a potential breaking change. Step 1 will need to shift from "read the contract" to "help the maintainer define what the API actually promises."

**Identify the contract triangle:**

Every API has three aspects that can disagree:
1. **The spec** — what the API says it does (documentation, schema, types)
2. **The implementation** — what the API actually does (handler code, middleware, database queries)
3. **The client expectations** — what consumers believe and depend on (their code, their tests, their mental models)

Note which of these exist, which are explicit, and where you suspect disagreement. The most dangerous API entropy lives in the gaps between these three.

### Step 1: Understand the API's contract intent

This is not "what endpoints exist?" — it's "what promises does this API make, and to whom?"

- What is the API's core purpose? What capability does it provide to consumers?
- Who are the consumers, and what do they need? (Different consumers may need different things from the same API)
- What is the stability promise? (Is this a "move fast" internal API, or a "never break" public API? Something in between?)
- What is the cost of a breaking change? (Consumer rebuild time? Production incidents? Lost trust? Contractual violations?)
- What would it look like if this API's contract had degraded badly? (Consumers relying on undocumented behavior? Spec and implementation disagreeing? Multiple versions with unclear support status?)

Write a 2–4 sentence contract intent summary. This captures what the API *promises*, not just what it provides.

### Step 2: Map the API iteration pattern

- **How does the API change?** (Feature additions, bug fixes, performance changes, breaking changes, new versions?)
- **Who initiates changes?** (Internal team? Consumer feature requests? Platform requirements?)
- **What is the change process?** (PR with spec update? Implementation first, spec later? Spec first, implementation later?)
- **How are breaking changes handled?** (Never? With a deprecation period? Immediately with notification? Accidentally?)
- **What is the API handoff point?** (Deployment? Spec publication? Version bump? Consumer notification?)

Note the **spec-implementation sync pattern**: does the spec update before, during, or after the code changes? If after (or never), that's the primary window for contract entropy.

Also note the **consumer awareness lag**: how long between an API change and consumers knowing about it? For external APIs, this lag can be weeks or months — the entropy accumulates silently.

### Step 3: Identify API entropy vectors

For this specific API, what degrades? Consider:

- **Spec/implementation divergence**: the spec says one thing, the code does another. This is the map/territory problem with teeth — clients that trust the spec will build broken integrations. Divergence can go both directions: the spec may document behavior that was removed, or the implementation may have behavior the spec doesn't describe.

- **Implicit contract expansion**: clients depend on behavior that was never promised — response field ordering, undocumented fields, timing characteristics, error message text, header values. The API's *actual* contract (what clients depend on) is larger than its *documented* contract (what was promised). You don't know which undocumented behaviors are load-bearing for someone. This is a uniquely API entropy vector — it has no analog in docs or code.

- **Error contract inconsistency**: different endpoints return errors in different formats. Some return `{error: "message"}`, others `{errors: [{code, detail}]}`, others raw strings. Each was locally reasonable when written. Collectively they make client-side error handling brittle and inconsistent.

- **Versioning entropy**: multiple versions exist with unclear support status. v1 is "deprecated" but still serving traffic. v2 was the clean rewrite but has accrued its own issues. Breaking changes in v2 aren't backported to v1 (or are, inconsistently). The deprecation timeline keeps slipping.

- **Authentication/authorization drift**: the auth model has evolved (new scopes, changed permissions, deprecated auth methods) but not all endpoints reflect the current model. Some endpoints accept auth tokens they shouldn't. The auth documentation lags the auth implementation.

- **Cross-service contract drift**: in a multi-service architecture, service A's expectations of service B's responses may be based on an old version. The contract between services is implicit (inferred from client code) rather than explicit (defined and tested).

- **Documentation decay**: the API reference, guides, and examples no longer match the current API. This overlaps with doc entropy generally, but API docs have higher stakes because consumers are programmatically depending on accuracy.

- **Deprecation zombies**: endpoints, fields, or parameters that were marked deprecated but never removed. Consumers continue using them. The deprecation label becomes meaningless noise.

Rank the top 3–5 vectors by destructive potential for *this specific API*. Spec/implementation divergence and implicit contract expansion are almost always in the top 3 for APIs with external consumers — if they're not, explain why.

### Step 4: Assess existing API quality mechanisms

- Does the API already have mechanisms for maintaining contract integrity? Consider:
  - API specification (auto-generated or hand-maintained?)
  - Contract testing (consumer-driven? provider-driven? both?)
  - Schema validation in CI (does the spec validate against the implementation on every commit?)
  - Breaking change detection (automated diffing of API specs between versions?)
  - Consumer communication channels (changelog, migration guides, deprecation notices)
  - API review process (is there a dedicated review step for API changes, beyond code review?)
  - Rate limiting, monitoring, and usage analytics (do you know which endpoints consumers actually use?)
  - Client SDK generation (auto-generated clients from spec?)

- For each existing mechanism, map it to the **enforcement depth spectrum** (from INTENT.md):
  - External (relies on discipline) — "developer updates spec when changing API"
  - Prompted (removes need to remember) — PR template asks "does this change the API contract?"
  - Semi-embedded (catches mechanically) — schema validation in CI, breaking change detection, contract tests
  - Fully embedded (structurally impossible to violate) — generated server stubs from spec (spec-first), type-safe API layers, schema-validated request/response middleware

- API entropy has a strong mechanical enforcement story. For each identified vector, explicitly note: **can this be mechanized?**
  - Spec/implementation divergence → yes (schema validation in CI, generated stubs)
  - Error contract inconsistency → partially (response schema validation, shared error types)
  - Cross-service contract drift → yes (consumer-driven contract testing)
  - Implicit contract expansion → no (requires judgment about what's promised vs incidental)
  - Versioning entropy → partially (automated version lifecycle tracking)
  - Deprecation zombies → partially (usage analytics showing deprecated endpoint traffic)

### Step 5: Consult INTENT.md

Check your analysis against [INTENT.md](../../INTENT.md):

- Does the proposed guard preserve **continuity of intent** — does the API continue to serve its stated purpose and stability promise?
- Does it preserve **internal consistency** — do the spec, implementation, error format, and auth model agree?
- Does it preserve **honest state** — does the API accurately represent its current contract, including what's deprecated, what's experimental, and what's stable?
- Does it address **inter-domain drift** — the spec/implementation/client-expectation triangle?
- Is it **low-burden** (2–10 minutes at the handoff point)?
- Is it **delta-scoped** — checking what changed this iteration, not auditing all endpoints?

Adjust if not.

### Step 6: Design the guard

Write a draft guard skill file. It should include:

- **When to Run** — tied to the API handoff point identified in Step 2. Note: API guards often have two handoff points — code deployment and spec publication — and the guard may need to run at both.
- **When NOT to Run** — scope boundaries
- **Bootstrap checks** (if Step 0 identified critical gaps) — one-time actions to establish baselines:
  - If no spec exists: generate one from the current implementation
  - If no contract tests exist: set up the framework
  - If no error format standard exists: define one and document it
  - If the contract triangle has known disagreements: document them explicitly as tech debt
- **Checklist** — organized into two sections:

  **Judgment-requiring checks** (keep as skill-file items):
  - Contract intent alignment: does this change serve the API's stability promise? If it's a breaking change, is that intentional and communicated?
  - Implicit contract awareness: does this change alter undocumented behavior that consumers might depend on? (Field ordering, timing, error messages, headers)
  - Versioning coherence: if multiple versions exist, is this change applied to the right versions? Is the version lifecycle still coherent?
  - Consumer impact assessment: who is affected by this change, and do they know?

  **Mechanically-assistable checks** (with enforcement depth recommendations):
  - Spec/implementation sync: does the spec match the implementation after this change? → recommend schema validation in CI
  - Error format consistency: does this endpoint follow the standard error format? → recommend response validation middleware
  - Breaking change detection: does this change remove or modify existing contract surfaces? → recommend automated spec diffing
  - Deprecation tracking: are deprecated items progressing toward removal or stalling? → recommend usage analytics on deprecated endpoints
  - Auth consistency: does this endpoint's auth model match the current standard? → recommend auth middleware validation

- **Output** — what the contributor records after running. For API changes, the output should include a consumer-impact statement: "this change affects [consumers] because [reason], communicated via [channel]" or "no consumer impact."
- **Rationale** — why each check exists and what entropy vector it guards against
- **Integration** — how this guard gets run (see Step 7)
- **Versioning metadata** — when generated, by which generator, for what system state (see Step 7)

### Step 7: Close the loop

A guard that isn't integrated into the workflow won't get run. A guard that isn't versioned won't get updated.

**Integration instructions** — the generated guard must specify:
- **Trigger**: when does this guard run? API guards often need two triggers — one at code deployment (did the implementation change the contract?) and one at spec publication (does the spec match?). Tie these to the handoff points from Step 2.
- **Discovery**: how does a contributor find out this guard exists? (Contributor guide, guard manifest, CI pipeline, API review checklist)
- **Enforcement depth**: API guards have the strongest case for semi-embedded enforcement. Specify which checks should be CI-enforced (schema validation, breaking change detection) vs advisory (implicit contract awareness, consumer impact assessment).
- **Consumer notification**: for externally-consumed APIs, the integration plan should include how guard findings get communicated to consumers — not just to the team.

**Versioning metadata** — include in the generated guard:
- **Generated**: date and generator version
- **System snapshot**: brief description of the API's state when the guard was designed (number of endpoints, versions active, consumer count/type, spec format, known contract gaps). This allows future re-evaluation: has the API outgrown this guard?
- **Last evaluated**: date (initially same as generated; updated when the guard is re-assessed)

**Output summary** — note in your output:
- What the top entropy vectors were and why
- Whether any existing mechanisms already cover some of them
- What the Step 0 inventory revealed — especially the state of the contract triangle (spec, implementation, client expectations)
- **Enforcement depth recommendations** — which checks should be mechanized and how. API entropy has the strongest mechanical enforcement story of any domain; lean into this.
- The split between judgment-requiring and mechanically-assistable checks
- **Consumer impact considerations** — how the guard accounts for the externalized nature of API entropy
- **Integration plan**: how the guard will be triggered, discovered, and how findings reach consumers
- **Versioning baseline**: the system snapshot for future comparison
- Any uncertainties or areas where the guard should be refined after real use

---

## What This Is Not

- A replacement for actually running an API guard — analysis is not practice
- An API design guide — this guards contract consistency, not whether the API design is good
- A breaking change migration tool — it identifies contract drift, not how to fix it
- A spec generator — though it may recommend generating a spec as a bootstrap action
- A substitute for contract testing — though it will likely recommend contract testing as a deeper enforcement mechanism
