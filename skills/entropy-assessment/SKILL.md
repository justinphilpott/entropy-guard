---
name: entropy-assessment
description: Front door for entropy-guard. Establish what the system's steward has authorised it to be for, classify the system's shape, route it to the right analysis, and hand guard building to the guard generator. Use first when you do not know which entropy workflow fits.
metadata:
  version: "0.7.0"
---

# Skill: Entropy Assessment

Use this as the first stop when you do not yet know which entropy workflow fits the target system.

The skills in entropy-guard share one flow, and this skill is its first step:

1. **This skill:** the intent pass, the system's shape, and the route.
2. **Analysis:** `skills/docs-first-planning-assessment/SKILL.md` for docs-first planning repos, or this skill's own
   profile (Step 4) for every other shape.
3. **Guard building:** `skills/session-coherence-skill-generator/SKILL.md`. It is the only skill that writes guards.
4. **Adoption:** `skills/guards-integrator/SKILL.md`.

## When to Run

- You are entering a system cold and want to understand where entropy is accumulating
- You want to know which analysis and guard fit the system
- You suspect an existing guard is stale or mismatched and want a fresh read before changing it

## When NOT to Run

- As a substitute for running an existing guard that you already know is the right one
- For trivial one-off artifacts that will not be iterated
- When you already know the repo is a docs-first planning system: go straight to
  `skills/docs-first-planning-assessment/SKILL.md`, which runs the intent pass itself

---

## Step 1: Intent pass

Run the intent pass in [`intent-pass.md`](intent-pass.md). It does five things:

- names the steward;
- separates what the documents declare, what recent work enacted, and what the steward authorised;
- classifies each gap between them;
- settles what the evidence can settle;
- asks the steward at most five questions, each one about a choice that changes what gets built.

If there is no usable intent at all, stop guard work there. Report what can still be inventoried, and recommend an
intent interview before any guard is built. Open questions do not block work that does not depend on them.

## Step 2: Classify the system shape

Identify which of these best matches the target.

### A. Docs-first planning

Choose this when most of these are true:

- the repo is markdown-first or documentation-as-system
- architecture, planning, design, or blueprint docs are the primary artifact
- `TODO.md`, decision logs, examples, templates, or agent instructions carry meaningful state
- the main iteration loop is repeated human/AI sessions rather than code/test/deploy alone
- the most likely drift is docs-to-docs, workflow/practice, or stale planning state

### B. Mixed docs + code

Choose this when the system has both meaningful implementation and a meaningful documentation or planning surface,
and the top risks likely sit between them.

### C. Code-first

Choose this when the main artifact is implementation and the top risks are architectural drift, stale tests, or
API/implementation mismatch.

### D. Workflow-heavy

Choose this when the primary entropy surface is how work is done: handoffs, release steps, contributor instructions,
agent wrappers, or checklists.

### E. Young repo

Choose this when the repo has little history and its purpose or current direction still lives mostly in
conversation or memory, while handoffs are starting to happen.

Also note whether the system spans **more than one repository**: for example, a code repository and a separate
repository that manages its work, or a service and the packages that plug into it. If it does, assess them as one
system.

If more than one shape fits, note the ambiguity and choose the one with the highest current risk.

## Step 3: Route

- **A, docs-first planning:** run `skills/docs-first-planning-assessment/SKILL.md`. It does the analysis and hands
  guard building on to the generator.
- **B, C or D:** do Step 4 below, then hand the result to `skills/session-coherence-skill-generator/SKILL.md`.
- **E, young repo:** run `skills/session-coherence-skill-generator/SKILL.md` in bootstrap mode.

## Step 4: Profile for mixed, code-first and workflow-heavy systems

### 4a. Domains

For each domain, note whether it is present and actively changed:

- code
- documentation
- tests
- API and data contracts
- workflow and process
- live operational state: running services, deployed builds, credentials, scheduled jobs

### 4b. Repositories and ownership

Skip this when the system is one repository.

- Which repository owns which concept? Name the concept and its home.
- Where does one concept have two homes, such as two names for it or two implementations of it across
  repositories? These seams are usually the costliest drift, because each side looks correct on its own.

### 4c. Cross-domain drift

Check each of these, with evidence:

- **Docs against implementation:** settings, commands, paths and identifiers named in prose that the code no longer
  reads or provides. Search the code for each one.
- **Docs against docs:** state and handoff files that contradict themselves or each other.
- **Tests against implementation:** tests that exist but do not run, or that test a different representation from
  the one used in practice.
- **Contracts against implementation:** API reports, schemas and manifests.
- **Workflow against reality:** declared processes, hooks and CI steps that do not run. A committed hook that is not
  enabled counts as not running.
- **Rules against enforcement:** rules written as if enforced, which nothing enforces.

Rank the top 3 to 5 risks by decay rate times recovery cost.

### 4d. Existing guard surfaces

Inventory the guard surfaces, sorted into four groups:

- **Runs by itself:** CI steps, enabled hooks, scheduled checks.
- **Exists, but runs only by hand:** test suites, scripts, skills.
- **Decided, not yet built:** usually an open issue or a decision record.
- **Declared, but missing:** named in a doc or a process list, with nothing behind it.

For a gap that already has an issue or a decision, connect the recommendation to that work. Do not propose a
parallel project.

### 4e. Mechanical checks belong to tools

Recommend maintained tools for anything mechanical rather than having a guard repeat it by hand:

- a link checker such as lychee;
- a linter for agent instruction files, such as ctxlint or agnix;
- ast-grep, for identifiers named in prose;
- the project's own tests, type checks, linters and API reports.

## Step 5: Hand on

Choose the smallest useful next step:

- Hand to `session-coherence-skill-generator`, with three things: the intent section, the profile, and the ranked
  risks.
- Refine an existing guard through the same generator, rather than writing a new one.
- Stop at the assessment, because no guard change is needed. Keep it proportionate: a retired or reference-only
  repository needs little or nothing new.

## Output

Deliver:

- **Intent:** the intent pass's output (see `intent-pass.md`)
- **System shape**, including the repositories involved
- **Domain and ownership map**
- **Top entropy risks**, with evidence
- **Guard surfaces**, in the four groups of Step 4d
- **Recommended next step**
- **Questions for the steward**, each with a recommended answer, or "none"
- **Uncertainties**

## Upstream Feedback Check

Before you finish, ask whether this front door itself misrouted the system or left the next step too implicit.

Examples:

- it should have sent the repo to the docs-first planning track sooner
- the profile in Step 4 missed a kind of drift this system has
- the intent pass asked a question the evidence could have settled

If yes, capture a short feedback note and use `skills/local/entropy-guard-feedback/SKILL.md` when working inside this
repo.
