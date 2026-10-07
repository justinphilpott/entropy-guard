# Upstream feedback on entropy-guard

These notes come from the upstream feedback steps in three skills:

- `entropy-assessment` ("Upstream Feedback Check");
- `docs-first-planning-assessment` ("Upstream Feedback Check");
- `guards-integrator` (Step 7).

**Why they were not filed.** The helper `skills/local/entropy-guard-feedback` creates GitHub issues, and this
run may not reach GitHub. So each note is in that helper's issue format, for the maintainer to submit. They are
distinct; file **F1** first if only one goes in.

**Project context, shared by all five notes.** The target is a two-repository system:

- a TypeScript orchestration service (ORC) with strong test-enforced architecture rules;
- a markdown-first "Scope" repository that manages its work: overwrite-only `STATE.md`, friction log,
  decisions, reviews, and Node scripts that read the service's database and GitHub.

Several AI agents work in it in repeated sessions, with PRs, Danger checks and approval-card restarts. There is
no CI test run.

---

## F1. entropy-assessment: the mixed and code-first routes recommend "a lightweight general post-work guard", but no skill makes one

**Category:** assessment

**What I observed.** The system classified as B (mixed docs + code). Step 3 sends B to the fallback profile.
Step 4d then offers "add a lightweight general post-work guard", but neither the front door nor anything it
links to says how to generate one. `session-coherence-skill-generator` sits in the same `skills/` folder, and
the README describes it as generating "repo-specific session handoff guards". The front door never mentions it.
I had to choose by judgment between `docs-first-planning-assessment` Phase 2 and that generator. I took the
docs-first track, because four of the five top risks were docs-first vectors.

**Suggestion.** In Step 4d, name the generator for each shape:

- A goes to `docs-first-planning-assessment`;
- B, C or D, when the risk is session handoff, goes to `session-coherence-skill-generator`, or to
  docs-first Phase 2 when the top risks are docs-first vectors.

Say which skill hands the result to `guards-integrator`.

## F2. entropy-assessment: no branch for a system that spans several repositories

**Category:** assessment

**What I observed.** Step 2 classifies "the repo". The target was two repositories, and its riskiest drift ran
between them:

- the Scope's `STATE.md` contradicted itself about which build of the service runs;
- the Scope's scripts hard-code the service's state directory and SQLite schema, and show 0 instead of an
  error when they cannot read them;
- decisions are spread across both repositories.

The shapes A to D fit each repository differently: Scope = A, service = C, together = B or D. Nothing in the
skill asks where truth that crosses repositories should live.

**Suggestion.** Add a Step 2 question: "Is this one repository or several? Which one owns cross-repo truth?"
Add "repo vs repo (undeclared contracts, mirrored state)" to the 4b drift list.

## F3. docs-first-planning-assessment: the current-state packet can compete with the target's own state file

**Category:** skill

**What I observed.** The skill asks for a "current-state packet" for the next fresh session. The target
already has one: `STATE.md`, overwrite-only, with a stated line cap, read first by every agent. A separate
packet becomes a parallel truth from the moment it is written. That is the vector the same skill warns
against. I wrote it, labelled it a one-off snapshot, and recommended its content feed the target's own
`STATE.md` rewrite.

**Suggestion.** In Step 5, say: if the target already maintains a current-state artifact, assess that
artifact. Produce the packet as a proposed rewrite of it, or as a diff, not as a second document.

## F4. docs-first-planning-assessment: no check for live-service state mirrored into markdown

**Category:** assessment

**What I observed.** The worst state entropy here was not planning state. It was **live operational facts
copied into a markdown state file**: which build runs, when it restarted, which PRs are merged, a grant's expiry
date. They go stale within hours, and the project's friction log records them twice as confident wrong
answers. The skill's "State entropy" vector covers `TODO.md` and roadmaps, but not facts with a live source of
truth.

**Suggestion.** Add a vector, or a sub-check of state entropy: "live facts mirrored into docs". The guard should
require each one to name its live source and when it was read, and prefer a link or command over a copied value.

## F5. guards-integrator: "When to Run" says entropy-assessment generates guards; since v0.6.0 it routes

**Category:** skill

**What I observed.** `guards-integrator` v0.2.2 says "After `entropy-assessment` generates one or more guards".
In v0.6.0 the front door routes and does not generate. Guards come from `docs-first-planning-assessment` or
`session-coherence-skill-generator`. The cross-reference is minor but stale.

**Suggestion.** Change it to "after a guard is generated (by `docs-first-planning-assessment`, or another
generator the front door routes to)".
