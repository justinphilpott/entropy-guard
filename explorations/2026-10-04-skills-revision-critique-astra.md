---
title: "Constructive critique of the skills revision: GPT 6.1 Astra"
date: 2026-10-04
participants:
  - Justin Philpott
  - GPT 6.1 Astra (via opencode)
  - Claude Opus 5.5 (briefed and checked it)
type: review
status: complete; amendments to be discussed with Justin before any change
---

# Constructive critique of the skills revision: GPT 6.1 Astra, 4 October 2026

Asked for by Justin: "once you're done, get astra to constructively criticise and suggest updates for all critique".

**How it was run.** Through opencode with `openai/gpt-6-astra --variant xhigh`, read-only, with editing, shell,
web, sub-agents, browser tools and other directories all denied. Its pack held five things:

- entropy-guard at branch `revise-skills-intent-and-ownership` (`f3d7ae8`);
- the full diff from `447da9a`;
- every before-and-after run output, the two R4 guards and the blind scoring;
- the target snapshots;
- Justin's global `AGENTS.md`.

The first attempt, started at 19:12, stalled on its connection and produced nothing in 40 minutes, so it was
stopped. The second ran from 19:53 to 20:05.

**Checked by Claude the same evening.** The citations behind all 12 findings were read in the files, and all hold.
They include:

- `AGENTS.md:27` ("update INTENT.md and note why");
- the `INTENT.md` footer ("add it");
- the local guard's "fix the skill" (`:85`);
- "continue on the recommendation" (`intent-pass.md:82`);
- the adaptation-as-proposal step (`intent-pass.md:119`, generator template `:314`);
- the R1 "after" proposed README correction dropping "workflow execution" while saying "Flagged, not changed";
- the R1 "after" guard's "the test is the record" and its "only if it sits in a file this session touched";
- the lab's `SCOPE.md` "Authority" section;
- the integrator's "throwaway commit", which conflicts with "never commit unless asked";
- the integrator's leftover "guard runner" lines (`:168`, `:180`);
- `TODO.md` showing the after evaluation as both done and pending.

Its report follows unchanged.

---

Searched: the supplied skills, approved synthesis, earlier reviews, revision diff, evaluation outputs, generated guards, scoring records and relevant target snapshots. Found: an existing guard generator and recorded prior-art choices from Spec Kit, OpenSpec and intent-architect — using those mechanisms as the basis for corrections rather than proposing another system.

# Constructive review of the entropy-guard revision

## Actions taken

- Compared the revision with all six approved items in `entropy-guard/explorations/2026-10-04-skills-review-synthesis.md`.
- Read the revised skills and governing documents.
- Checked the evaluation’s conclusions against its scoring records, generated guards, run reports and feedback.
- Read target files where needed to verify consequential examples.

This is a source-and-evidence review. I did not rerun the evaluation, execute commands, inspect GitHub or read live services. Statements about ORC concern the supplied snapshots, not its current deployment.

Paths beginning with `skills/` below are relative to `entropy-guard/`. Paths beginning with `eval/` are relative to the supplied review folder. Cost estimates are rough editing and verification effort; overlapping estimates should not be added mechanically.

## Status now

**Keep the revision. It substantially implements the approved synthesis and improves the generated guards. The remaining work is bounded correction, not another redesign.**

The strongest improvements are:

- One skill now owns guard construction.
- The assessment distinguishes declared, enacted and authorised intent.
- Generated guards explicitly include uncommitted work.
- Integration distinguishes a placement plan from verified adoption.
- Current-state updates reuse existing files.

The most important remaining problem is that **some repair instructions still permit the very intent normalisation the revision was intended to prevent**. There are also routing gaps, incomplete examples of delta inspection, and evaluation conclusions that need qualification.

**The skills are suitable for the next read-only ORC/lab assessment with the corrections below incorporated. The generated R1 guard should not be installed unchanged.**

### Did the revision implement the six approved items?

| Approved item | Assessment |
|---|---|
| **1. Intent changes are proposals.** | Substantially implemented in `skills/entropy-assessment/intent-pass.md`, but contributor instructions still permit direct intent edits. Continuing on an unanswered recommendation is insufficiently bounded, and permitted adaptations are unnecessarily made proposals. Findings 1–3 cover these. |
| **2. Routing and one guard builder.** | Implemented. `entropy-assessment` routes mixed/code/workflow systems to the existing generator; docs-first supplies analysis rather than its own template. The local “update both” instruction is removed. Mixed systems still lose access to useful docs-first analysis: finding 6. |
| **3. Output lifetimes.** | Mostly implemented. Guards point to state and policy owners, and the generator specifies baseline and coverage reporting. The issue-number prohibition is overbroad, state refresh responsibility remains implicit, and the local reference guard does not fully implement the reporting contract. Findings 5 and 8. |
| **4. Verified adoption.** | Implemented as an instruction in `guards-integrator` Step 6. The read-only evaluation correctly leaves actual adoption planned. Evidence handling and invocation boundaries need tightening: finding 7. |
| **5. Reconcile the theory record.** | The three March entries are marked hypotheses, the reusable-guard method is recorded, and the generator appears in the lifecycle. Keeping the removed `distill-article` as explicitly historical context is reasonable. Issue #12’s closure cannot be established from this pack. Residual operational contradictions remain: finding 12. |
| **6. Before-and-after evaluation.** | Performed and recorded, including an unfamiliar repository and constructed changes. It provides useful evidence of better guard instructions. It does not establish the full strength of the reported outcome improvement or verified adoption. Findings 10–11. |

I found nothing wrong with retaining the four exported skills, preserving direct entry points, keeping bootstrap mode in the generator, or declining to build a separate runner.

---

### 1. High — Standing instructions still authorise direct intent edits

**What is wrong**

The revised intent statement, `entropy-guard/INTENT.md:3`, makes Justin the steward and requires his decision before an intent change lands. Two instructions still contradict that:

- `entropy-guard/AGENTS.md:27`: “If a decision refines or challenges the intent, update INTENT.md and note why.”
- `entropy-guard/INTENT.md:146`: “If you find something missing, imprecise, or worth expanding — add it.”

Neither distinguishes an agent’s judgment from Justin’s decision.

There is a related ordering problem in `skills/local/entropy-guard/SKILL.md:85`: “If the skill is misaligned with INTENT.md: fix the skill.” Classification comes afterwards. An already-approved intent change whose document update is pending should not cause the implementation to be reverted first.

This is an **instance**, because the new intent-change mechanism exists, but standing instructions still bypass it.

**The update**

Replace the instruction at `AGENTS.md:27` with:

> **Consult INTENT.md for significant decisions:** Before a substantial design or structural choice, check `INTENT.md`. Resolve discrepancies through the intent-change rule in `skills/entropy-assessment/intent-pass.md`; record proposed intent changes in `DECISIONS.md`, and update canonical intent only from Justin’s recorded decision.

Replace the `INTENT.md` footer with:

> Propose revisions through the stewardship process at the top of this document. Record the decision, date and reason when an approved revision lands.

Replace the local guard’s line 85 with:

> When a skill and `INTENT.md` disagree, apply the intent-change rule below before editing either.

**Cost and counterfactual**

Approximately 15–30 minutes, including a search for equivalent repair instructions. Expanding every introductory paragraph into another approval procedure would cost more than it saves; these should remain short pointers.

---

### 2. High — An unanswered recommendation can become operational policy

**What is wrong**

`skills/entropy-assessment/intent-pass.md:82–83` says that, without the steward, the agent should “continue on the recommendation” and mark dependent outputs provisional. It does not distinguish drafting a recommendation from implementing it or issuing a guard that treats it as binding.

A concrete failure appears in the revised ORC run’s proposed README correction:

- `eval/out/R1-after/proposed-corrections.md:33–38` removes “workflow execution” from the list of deliberately absent capabilities.
- Lines 40–43 call that phrase ambiguous and say “Flagged, not changed”.

The proposed text **does change it**. The assessment and questions describe this uncertainty as deferred, but the patch silently chooses a reading.

The shared intent-change rule also overcorrects in the other direction. `intent-pass.md:119` requires an adaptation **within what was authorised** to be recorded as a proposal. `entropy-guard/LEARNINGS.md:21` correctly says only the unmade decision needs that treatment.

This is an **instance**, because intent classification now has an owner, but its instructions confuse provisional analysis, permitted implementation and new authorisation.

**The update**

Replace the absent-steward instruction with:

> If the steward is unavailable, record the question and recommendation. Continue independent work and draft dependent options as provisional; do not implement, install or enforce a recommendation that requires a new decision.

Replace step 3 of the intent-change rule with:

> For an adaptation within existing authorisation, proceed and record its rationale when useful. For an unresolved change of intent, record a proposal for `<steward>` in `<decision surface>`; dependent implementation waits for the decision.

Require the generator’s final review to compare proposed patches with the unresolved-question list. An unresolved constraint must not disappear from a supposedly factual correction.

**Where should this rule be defined once?** In `intent-pass.md`. Replace the generator template’s independently repeated five-step rule at `skills/session-coherence-skill-generator/SKILL.md:310–317` with an instruction to insert the canonical rule with target names filled in. The local guard can reference the same file directly. Exported guards may carry an expanded, source-versioned copy so they work outside this repository.

**Cost and counterfactual**

Approximately 45–90 minutes, including checking one permitted adaptation and one unresolved change. Requiring approval for ordinary implementation choices would recreate the ceremony this correction removes.

---

### 3. High — Missing attribution is treated too much like missing authority

**What is wrong**

`intent-pass.md:32–49` offers a dated steward decision, description, observation or inference. It has no adequate treatment of an existing directive or decision whose attribution is incomplete.

The evaluation demonstrates the resulting misreadings:

- `eval/out/R2-after/assessment.md:51–52` concludes that the target has no steward decisions because its decision log lacks attribution.
- `eval/out/R2-after/questions.md:48–74` asks Justin to ratify all 17 entries as a block.
- `eval/out/R3-after/feedback.md:61–76` explains that the reference-only directive fits none of the categories cleanly.

The opposite problem appears when the ORC run treats several legitimate decision owners as a missing central home. `eval/out/R1-after/questions.md:13–36` lists local-config, ORC, the lab and the issue map, then recommends putting **every** decision in the lab. The target’s `eval/targets/orc-lab/scope-orchestration-lab/SCOPE.md:17–24` already assigns ownership by subject.

This is a **missing system**, because the pass does not distinguish incomplete provenance from absent intent, or one owner per concern from one location for every decision.

**The update**

In `intent-pass.md` section 1, separate statement kind from authority evidence. Add:

> Record existing decisions and directives even when their attribution or date is unknown; preserve that uncertainty without inventing an author. Missing attribution does not by itself make the statement an inference or mean the system has no usable intent.

Also add:

> Follow applicable instruction precedence. Ask about uncertain authority only where conflicting readings change the current work; do not request blanket ratification of a decision log.

In section 5, clarify:

> Use the existing decision owner for the affected concern. Preserve attributed decisions found only in overwriteable state in that owner’s durable record, retaining their source and date; recording an existing decision does not require deciding it again.

This should not move ORC-owned facts or global rules into the lab merely to give a guard one convenient path.

**Cost and counterfactual**

Approximately one to two hours, checking the R2 and R3 cases. Automatically treating every unsigned document as steward-approved would be worse; uncertainty must remain visible where it matters.

---

### 4. High — Generated checks can still make the implementation the authority

**What is wrong**

The revised ORC guard says:

> “Where the prose and the test differ, the test is the record. Reduce the prose to what the test enforces…”

That appears at `eval/guards/after-SKILL.md:137–140`.

This is consequential because the same assessment found that the architectural test does **not** detect Playwright’s browser launch (`eval/out/R1-after/assessment.md:147–158`). The test therefore cannot automatically settle the intended boundary.

The generator’s general statement that authorised intent is the fixed reference is correct (`skills/session-coherence-skill-generator/SKILL.md:368–373`), but that principle is not checked against individual repair instructions.

The R4b revised report also invokes “one owner” to recommend replacing an acceptance-test literal with the implementation’s constant (`eval/out/R4b-after/report.md:42`) without establishing what independent contract evidence that literal supplies. Repeated text alone does not establish redundant authority.

This is an **instance**, because the generator states the right reference principle but allows individual repairs to contradict it.

**The update**

Add this requirement beside the generator’s judgment-check requirements:

> Check every repair instruction against authorised intent. A test or implementation shows what is checked or enacted; it does not automatically authorise weakening a documented constraint. Establish whether the defect is in the description, implementation or check before aligning them.

Qualify the ownership check:

> Distinguish redundant policy copies from summaries, generated projections and independent contract tests. Consolidate duplicate definitions without removing independent evidence of the intended contract.

In the next ORC guard, replace the automatic “test is the record” instruction with this classification step. Preserve the original evaluation artifact.

**Cost and counterfactual**

Approximately one to two hours, including a case where code and tests agree while violating a retained requirement. Treating every ordinary factual correction as an intent dispute would be excessive; this check applies when the disagreement concerns a constraint or accepted contract.

---

### 5. Medium-high — Delta examples do not fully support their coverage promise

**What is wrong**

The generator correctly requires staged, unstaged and untracked coverage, but its example at `skills/session-coherence-skill-generator/SKILL.md:199–206` supplies:

- A commit-message log, without committed patch inspection.
- `git diff HEAD`, which shows the net working-tree difference, not each staged and unstaged change separately.

A concrete Git state illustrates the omission: stage a change from `A` to `B`, then restore `A` only in the working tree. `git diff HEAD` is empty, although the next ordinary commit contains `B`. This is a command-semantics finding, not a scenario I executed here.

The local reference guard is weaker still: `skills/local/entropy-guard/SKILL.md:44–51` does not instruct the reader to inspect untracked contents or report an unknown session baseline as incomplete.

Finally, the revised ORC guard introduces an incorrect attribution rule:

> “Treat a finding as this session’s only if it sits in a file this session touched.”

That is `eval/guards/after-SKILL.md:200–201`. R4b itself disproves it: changing an environment-variable name in code makes an **untouched README** wrong.

This is an **instance**, because delta coverage and causal attribution are existing responsibilities whose examples are incomplete.

**The update**

Revise the generator’s example to inspect each relevant surface:

```bash
git log --oneline "$START"..HEAD
git diff "$START" HEAD
git status --short
git diff --cached
git diff
git ls-files --others --exclude-standard
```

Tell the reader to inspect relevant untracked contents, respecting existing file-access restrictions. Retain the explicit incomplete-coverage report when the start point is unavailable.

Add to the generated report instructions:

> Attribute a finding by comparing the relevant relationship before and after the change, not by whether the file containing the symptom was edited. Check affected documents and consumers even when they are unchanged.

Bring the local guard into conformance, including “what was checked and what was not” in its output at lines 154–160.

**Cost and counterfactual**

Approximately one to two hours, including staged/unstaged cancellation and an untouched dependent document. Reviewing every file in the repository would cost more than it saves; follow the changed contract and its consumers.

---

### 6. Medium — Routing hides useful analysis and the no-new-guard outcome

**What is wrong**

Three related routing problems appear in the runs.

1. **Mixed systems lose docs-first analysis.**  
   `skills/entropy-assessment/SKILL.md:82–93` selects one system shape. The revised ORC/lab run consequently skipped the docs-first truth map and state-update guidance, despite identifying the lab’s state file as its largest risk (`eval/out/R1-after/feedback.md:14–31`).

2. **The reference-only restraint sits after an early handoff.**  
   The restraint is in front-door Step 5, lines 153–161. Route A hands off at lines 90–91. The R3 run identifies this exact problem (`eval/out/R3-after/feedback.md:20–39`) and still produces a 1,180-word replacement guard.

3. **Route A is asked for a Step 4 output it skipped.**  
   Front-door line 171 requires the four execution-status groups. Docs-first Step 7 instead asks whether each surface should be kept, amended, replaced or demoted. These describe different things, but the output contract makes them look like competing classifications.

The docs-first document roles also omit an explicit product-artifact role, even though exported skills are this repository’s main product (`skills/docs-first-planning-assessment/SKILL.md:55–64`).

This is an **instance**, because routing and specialised analysis exist, but the handoff contract drops applicable guidance.

**The update**

In the front door:

- Determine lifecycle status before routing, and carry it with the intent result.
- For a mixed system, reuse applicable docs-first ownership, state and supersession analysis without launching a second complete assessment.
- Apply the “assessment only / no guard needed” decision before invoking generation.
- Make the routed assessment the final assessment output rather than requiring a second front-door report.

Suggested routing text:

> Choose one primary route, then reuse specialised analysis where a member repository needs it. Combine the findings into one assessment and one generator handoff. Reference-only or retired systems may finish with a correction or demotion and no generated guard.

In docs-first Step 2, add:

> **Product artifacts:** documents consumed as skills, templates, policies or other executable guidance. Check their names, paths, inputs and handoffs as contracts.

Keep execution status and recommended disposition as separate columns only when both are useful.

**Cost and counterfactual**

Approximately two to three hours. Running the entire docs-first workflow separately for every member repository would multiply reports and undo the benefit.

---

### 7. Medium — Adoption verification needs a clearer evidence boundary

**What is wrong**

The new adoption criterion is useful, but parts of its procedure are underspecified.

- `skills/guards-integrator/SKILL.md:147–148` directs a throwaway commit or push, although the generator says never to commit or push unless asked (`skills/session-coherence-skill-generator/SKILL.md:345`).
- The integrator’s discovery list omits custom tracked hook folders (`guards-integrator:45–48`).
- Checking `core.hooksPath` alone does not establish whether a hook is enabled: a repository can use Git’s default hooks directory.
- The front door’s four guard-surface groups have no explicit “execution unknown” state. The revised R1 assessment consequently puts hooks under “Runs by itself” while saying enablement is unknown (`eval/out/R1-after/assessment.md:349–360`).

A successful trigger also does not establish refusal on failure for something labelled an enforced invariant.

This is a **missing system** at the evidence boundary, because “configured”, “observed running” and “observed refusing” are not consistently distinguished.

**The update**

Add to the integrator’s adoption step:

> Preserve the invocation’s read-only or suggest-only mode. When exercising a trigger requires an unapproved action, report the check as planned. Guard generation or integration advice does not itself authorise a commit or push.

Extend discovery to inspect tracked hook folders and the effective Git hooks path. Report configuration evidence separately from execution evidence.

Add:

> For a claimed enforced invariant, record a permitted failing case that was refused. For agent discovery, verify each distinct supported loading path; a pointer from an instruction file is valid even when the skills folder is not auto-loaded.

Allow `unknown` execution status rather than forcing a snapshot observation into “runs” or “manual”.

**Cost and counterfactual**

Approximately one to two hours for instructions and examples, plus target-specific adoption checks. Repeating fresh-session checks for every ordinary guard run would be ceremony; they belong at adoption or when the discovery path changes.

---

### 8. Medium — Lifetime rules overban useful pointers and underassign refresh work

**What is wrong**

`skills/session-coherence-skill-generator/SKILL.md:182–185` prohibits PR or issue numbers without distinguishing their role.

The ORC run shows the consequence: the stable rules in issue #140 must be reached indirectly through `AGENTS.md` and `MAP_ROOT` (`eval/out/R1-after/feedback.md:36–48`). That is less direct than linking the rule owner.

Meanwhile, docs-first Step 5 requires sources, dates and staleness triggers (`skills/docs-first-planning-assessment/SKILL.md:136–138`) but does not explicitly assign who refreshes the claims. “State honesty” remains a general question at line 194.

The revision’s own `TODO.md:11` says the after runs are complete while line 18 leaves them pending. The R1 assessment also missed the conflicting statuses of work #193/PR #200 in the lab state file.

This is an **instance**, because the lifetime distinction is present but is expressed too broadly for pointers and too weakly for refresh responsibility.

**The update**

Replace the blanket issue-number prohibition with:

> Keep current work-item status, next tasks and deployed build values in the current-state file. Stable links to policy-owning issues, decision records and other canonical sources are allowed; do not copy their changing contents.

Extend docs-first Step 5:

> Identify the existing actor or workflow that refreshes this state view, and the events that require a refresh. For each changed state claim, check its other mentions for conflicting status and preserve the observation source and date.

For live facts, retain the distinction between a fresh observation and an old recorded observation. A source citation alone does not refresh the value.

**Cost and counterfactual**

Approximately 45–90 minutes. A new freshness registry or mandatory metadata on every stable sentence would create more state than the skills need.

---

### 9. Medium — The extra size includes avoidable repeated analysis

**What is wrong**

The five revised skill files plus the new intent pass grow from **1,102 to 1,355 lines**, approximately **23%**, using the supplied diff and numbered files. Some growth is line wrapping, so this is not a token-cost measurement.

The run evidence matters more:

- R1’s total output grows from 10,383 to 13,536 words (`eval/scores/R1.md:48–51, 92–95`).
- The same state contradiction is elaborated in the intent section, ownership map and ranked-risk section of `eval/out/R1-after/assessment.md`.
- Front-door, docs-first, generator and integrator outputs each ask for overlapping summaries.

The intent pass starts with “Collect every statement” (`intent-pass.md:22`). That invites an exhaustive catalogue even when only a few statements affect the assessment.

This is an **instance**, because existing handoff instructions are insufficiently explicit about reusing analysis rather than reproducing it.

**The update**

Replace the collection instruction with:

> Locate the governing purpose, constraints and decision sources, then collect the statements needed to resolve the assessment’s material gaps. Do not reproduce every rule in the repository.

Clarify the output contract:

> Maintain one findings list. Intent, risk ranking, generation and integration sections reference those findings instead of repeating their evidence. Create a separate artifact only when it has a distinct consumer or is an applicable patch.

Other safe cuts are:

- The duplicate intent-change algorithm in the generator template, addressed in finding 2.
- The duplicate route-A report, addressed in finding 6.
- Adoption-plan horizons that have no justified next action.
- Repeated narrative explanation around checks already expressed concretely.

Do **not** cut provenance, uncovered scope, or the distinction between a proposal and a decision.

**Cost and counterfactual**

Approximately one to two hours. Removing all examples and scaffolds would make cold-start execution less reliable. The goal is less repetition, not the shortest possible skill.

---

### 10. Medium — The evaluation summary is stronger than its scoring supports

**What is wrong**

Several conclusions need correction.

**R2’s open-choice comparison is overstated.**  
`entropy-guard/explorations/2026-10-04-skills-revision-eval.md:176–178` says the before run put the saved-versus-fresh choice to the steward. The scorer explains that its question actually asked whether theory should leave `LEARNINGS.md`, and both versions received half credit (`eval/scores/R2.md:15, 68`).

**Question-failure counts depend on an unstated authority choice.**  
The R2 scorer explicitly changes from the key’s “recorded with his name and date” standard to counting unattributed entries as settled (`eval/scores/R2.md:5`). The reduction from 29 questions to 11 is directly supported. The exact “12 failing versus 1 failing” comparison is less secure.

**R4a conflates verification debt with a false defect finding.**  
The old report says tests were not run and marks that as an unmet practice requirement (`eval/out/R4a-before/report.md:19–23`). The new report also says tests are owed (`eval/out/R4a-after/report.md:23–25`). Neither reports a behavioral defect in the harmless rename. The difference in headline phrasing does not by itself prove fewer false alarms.

**The scoring misses consequential output defects.**  
R1 receives full credit for its intent-change guard while its proposed README correction removes an explicitly unresolved non-goal. R4b receives the required hit while also making stronger claims about unread deployed configuration. Those extras need assessment, not just a key-item check.

This is an **instance**, because an evaluation exists, but its interpretation and score aggregation do not consistently preserve their own evidential limits.

**The update**

Append a scoring clarification to the evaluation record, preserving the original results:

- Describe K10 as partly met by both versions.
- State the authority interpretation used for question scoring and show sensitivity where it changes the result.
- Separate implementation defects, unmet verification requirements and unknown coverage.
- Score consequential extra recommendations and patches, not only required findings.
- Reconsider R4’s aggregate after those distinctions are fixed.

A suitable replacement verdict is:

> The revision improves explicit guard requirements and reduces written questions on these cases. Useful findings outside the key are roughly even. The runs do not establish a general improvement in defect discovery, and several repair recommendations remain unsound.

**Cost and counterfactual**

Approximately two to three hours of focused rescoring. A statistically elaborate benchmark would cost more than these immediate conclusions require.

---

### 11. Medium — The evaluation is not yet a durable, discriminating regression procedure

**What is wrong**

The evaluation record says full scoring remains in a session scratchpad (`entropy-guard/explorations/2026-10-04-skills-revision-eval.md:139–140`), while `INTENT.md:100` and `README.md:128` make before-and-after evaluation part of each revision.

The supplied evidence does not preserve all the ingredients needed to reproduce that promise:

- The exact evaluation invocations.
- A precise revision identifier for the skills tested “after”.
- The constructed R4 repository history and fixture patch.
- Explicit partial-credit rules established before scoring.

The K16 correction was sensible: the original key depended on history absent from the snapshot. Its transparent correction is a strength, but also evidence that fixture visibility needs checking before the run.

The learning at `entropy-guard/LEARNINGS.md:11–13` goes beyond R4b’s evidence. Both runners found uncommitted drift; that does not establish that supplying the start commit caused the old runner to find it, or that removing that information will distinguish them.

This is a **missing system**, because the project has an evaluation report but not yet a durable procedure matching its promised recurring use.

**The update**

Extend the existing evaluation record with reproducible inputs: skill revisions, target revisions, reusable invocation text, allowed capabilities, fixture changes and scoring rules. Preserve outputs and scoring in a durable vendor-neutral location; no separate evaluation runtime is needed.

Replace the R4b learning with:

> Both R4b runners found the uncommitted drift, although only the revised guard explicitly required that coverage. This run does not establish why the old runner compensated. Check instruction completeness separately from task success, and compare known-baseline and unknown-baseline cases.

The next focused checks should cover the demonstrated gaps:

1. An unresolved intent phrase survives a proposed correction unchanged.
2. A permitted adaptation proceeds without a new approval request.
3. Code and tests agree while violating a retained constraint.
4. Staged and unstaged changes cancel in the working tree.
5. A change makes an untouched consumer document stale.
6. A mixed system reuses docs-first analysis, while a reference-only repository can finish without a replacement guard.

Keep the actual adoption exercise separate from a check that integration advice merely mentions it.

**Cost and counterfactual**

Approximately half a day, with much of the material reusable from this pack. Repeating the entire corpus for a harmless wording correction would be wasteful; run the cases affected by the changed behavior.

---

### 12. Low — A few operational records still contradict the settled method

**What is wrong**

Three bounded inconsistencies remain.

- `skills/guards-integrator/SKILL.md:168, 180` still recommends a dedicated guard runner as later work, contrary to the new decision at `entropy-guard/DECISIONS.md:35`.
- `entropy-guard/TODO.md:11, 18` simultaneously marks the after evaluation complete and incomplete.
- The local guard presents `repo-doc-evaluator` as an interchangeable full-document-audit route (`skills/local/entropy-guard/SKILL.md:33, 168`). The supplied earlier review distinguishes its newcomer-comprehension remit from entropy assessment’s coherence remit.

The approved synthesis also included closing issue #12. No closure evidence is supplied, so completion should remain unverified rather than assumed.

This is an **instance**, because the chosen method and task state already have owners, but dependent instructions were not fully reconciled.

**The update**

Replace the integrator’s “Later” example with:

> Later: move stable mechanical checks into the system’s existing CI, schemas, types or scheduler.

Delete the duplicate pending after-evaluation item from `TODO.md`.

Use this local-guard routing text:

> For newcomer comprehension and onboarding, use `repo-doc-evaluator`. For a whole-repository coherence assessment, run `entropy-assessment` again.

Record issue #12’s closure result when GitHub can be checked; do not infer it from the checked item-5 box.

**Cost and counterfactual**

Approximately 15–30 minutes, excluding the external issue check. Rewriting historical decisions wholesale would destroy useful context; correct current instructions and mark supersession where necessary.

---

### What the test shows, and what it cannot show

The evidence supports a useful, specific result: **the revised workflow produces guards with substantially better explicit operating instructions.**

The strongest comparison is R1:

- The before guard omits uncommitted ORC work from its delta definition.
- The after guard includes it.
- The before guard lacks an intent-change boundary.
- The after guard supplies one.
- The after integration brief explicitly requires discovery and trigger verification.

The R2 run also shows a real gain: the old workflow reproduces the local intent-rewrite instruction; the revised workflow removes it.

The evaluation does **not** establish:

- Actual installation or adoption.
- Reliable interactive clarification with Justin present.
- Complete coverage of staged and untracked work in practice.
- Correct handling of every intent-dependent repair.
- General improvement across models or repeated runs.
- Net time saved during ordinary work.

The report is commendably candid about several of these limits. The known-answer key is appropriate for regression checking. Blind scoring adds value, although version information weakens the blinding. The recorded K16 correction is preferable to silently changing the expected answer.

The before-and-after assessment times increase, while the generated guards become shorter. Those are different costs. Longer one-time assessment may be worthwhile if the recurring guard improves, but these runs do not yet measure that tradeoff.

### What the run feedback should change

The following dispositions cover the supplied feedback notes.

#### R1 before — `eval/out/R1-before/upstream-feedback.md`

- **F1, missing mixed-system generator route:** correct and fixed.
- **F2, no multi-repository ownership analysis:** correct and substantially fixed; finding 6 completes the mixed-analysis handoff.
- **F3, a competing current-state packet:** correct and fixed by updating the existing state surface.
- **F4, live facts mirrored into Markdown:** correct; finding 8 makes source freshness and refresh responsibility explicit.
- **F5, stale generator attribution:** correct and fixed.

Do not implement those old suggestions literally where the approved consolidation now supplies a better answer.

#### R1 after — `eval/out/R1-after/feedback.md`

- **Mixed systems need docs-first analysis:** correct; finding 6.
- **Stable issue links are not temporary task state:** correct; finding 8.
- **A neutral skills folder may not auto-load:** correct observation. The remedy is an explicit, verified discovery path, not moving the guard into vendor-specific storage; finding 7.
- **Decisions can disappear from overwritten state:** correct. Preserve them under their existing subject owner without asking the steward to decide again; finding 3.

#### R2 before — `eval/out/R2-before/feedback.md`

- **Routing and overlapping builders:** correct and fixed.
- **Packet home and refresh responsibility:** correct. Reusing `TODO.md` is better than the proposed new `CURRENT_STATE.md`; finding 8 supplies the remaining refresh instruction. “One screen” should not become an unexplained hard limit.
- **Documents can be exported products:** correct; finding 6 adds product artifacts and handoff contracts.
- **Tracked hook folders are missing from discovery:** correct; finding 7.

#### R2 after — `eval/out/R2-after/upstream-feedback.md`

- **Unattributed decision logs need handling:** correct diagnosis. Blanket ratification of all entries is not the right default; finding 3.
- **Route A receives incompatible output obligations:** correct. Execution status and amendment disposition are different dimensions, so simply choosing one classification would lose information; finding 6.
- **Exported documents expose contracts:** correct. Add the check without inventing a sixth mutually exclusive repository shape; finding 6.

#### R3 before — `eval/out/R3-before/feedback.md`

- **Lifecycle status matters:** correct. The proposed new harvest process is not justified merely because the repository is reference-only; finding 6.
- **Cross-repository handoffs matter:** correct. Discovery and ownership checks should name the consuming repository, but should not install processes in unread successors; findings 3 and 7.
- **Routed output ownership is ambiguous:** correct; findings 6 and 9.

#### R3 after — `eval/out/R3-after/feedback.md`

- **Reference-only restraint is unreachable on route A:** correct; finding 6.
- **Undated directives, unattributed decisions and absent history need explicit treatment:** correct; finding 3. Dated artifact content may inform the enacted reading, but it must remain labelled as an inference when history is unavailable.
- **A successor ownership map can be inferred:** only provisionally. The run’s guard assigns specific files to an unread sibling repository (`eval/out/R3-after/guard/SKILL.md:95–103`). The banner supports a general successor relationship, not every detailed ownership claim.

## Next steps/decisions

### Recommended completion of the approved revision

1. **Correct the intent boundary first:** findings 1–4. These affect whether the output preserves the steward’s decision.
2. **Complete delta and routing behavior:** findings 5–8. These directly affect the ORC/lab assessment.
3. **Remove repeated analysis and stale instructions:** findings 9 and 12.
4. **Clarify the existing evaluation and run targeted checks:** findings 10–11. Preserve original artifacts and append corrections rather than rewriting the evidence.

These are refinements of the approved work. They do not require a new architecture or another generation layer.

### Fitness for assessing ORC and the lab

**Proceed with the combined read-only assessment after these bounded corrections.** The assessment should:

- Use the mixed-system route and reuse the lab’s docs-first analysis.
- Keep ORC, lab and global-policy ownership distinct.
- Separate recorded operational history from fresh observations.
- Preserve unanswered choices in proposed patches.
- Connect findings to existing work rather than inventing parallel projects.

Installing the resulting guard, changing ORC or the lab, and refreshing deployed guards remain separate actions requiring the relevant authorisation.

The revision has earned continuation. Its principal gains are visible in the artifacts. The remaining defects are concrete enough to fix without restarting the design discussion.
