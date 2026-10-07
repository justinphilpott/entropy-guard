---
title: "Adversarial review of the size cut: GPT 6.1 Astra"
date: 2026-10-07
type: review
status: all 10 findings verified by Claude against the files on 2026-10-07, and all hold; fixes follow
---

# Adversarial review of the size cut: GPT 6.1 Astra, 7 October 2026

Run through codex (`gpt-6-astra`, xhigh, read-only) per the `astra-review` skill, on the branch at `29e629d`. **Not yet verified against the files.** Its report follows unchanged.

---

Searched: the supplied baseline-to-head diff, all nine current skill files, the 5 October size targets, and the 7 October evaluation, for existing mechanisms that already cover the work under review. Found: an assessment pipeline, a single guard generator, tool-based mechanical checks, and a known-answer evaluation — using those mechanisms rather than proposing another implementation. The supplied material does not establish whether a maintained replacement exists; no external search was performed.

**Verdict: request changes before merge. Retain the size-cut approach.**

Separating route-specific material, replacing repeated construction instructions with one template, and removing rationale from the local guard are sound changes. Restoring the old library wholesale would not address the defects below.

The main problems are that the template no longer exports some required operating restrictions, and the generator’s new assessment callback does not have an unambiguous return contract. Several smaller obligations also disappeared or became narrower.

This is a review of the supplied text. I did not execute the skills, independently count their words, or inspect the evaluation’s raw outputs. The original K1–K20 definitions are not included, so I cannot independently audit those scores. Counterexamples below describe permitted misreadings of the instructions, not failures I observed in a run.

**P1 — 1. Generated guards no longer have to carry their operating restrictions.**

**Location:** `skills/session-coherence-skill-generator/SKILL.md`, the diff removing “Generated Guard Requirements” and the template’s `## Modes` section.

The baseline required generated guards to contain:

> “Safety rules: do not commit unless asked, do not read or write secrets, do not modify unrelated changes…”

Its template also defined plan, build, discuss-first and audit-only behaviour.

The replacement says its template is “the one definition of what a guard holds”, but that template contains neither the operating modes nor the safety restrictions. Those restrictions survive outside the template, where they govern the generator. A later session running only the generated guard need not have read them.

A concrete case is a fresh guard run that encounters an untracked deployment environment file containing credentials. The emitted contract says to read relevant untracked files and account for live changes. It no longer requires the generated guard to exclude secret values. Similarly, the emitted guard contains repair instructions but no longer defines the audit-only behaviour previously offered by the template.

Higher-priority user and runtime restrictions still apply. The defect is the loss of the portable guard’s own contract, not permission to override those restrictions.

This is an **instance**, because the operating restrictions already exist in the generator but are omitted from the artifact it produces.

**Fix:** put the common operating restrictions inside the emitted contract and have the generator reuse that definition. Keep generation-specific defaults outside it.

Suggested text:

> Follow the invocation’s mode: plan, audit-only and discuss-first inspect and report without editing; build permits scoped repairs.  
> Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.  
> Leave unrelated changes alone, and keep committed workflow logic outside vendor-specific agent folders.

A fresh-context test should inspect the generated artifact itself and exercise audit-only behaviour. Testing the generator while its surrounding instructions remain in context does not establish that the emitted guard carries these protections.

**P1 — 2. The new assessment callback lacks a complete, nonrecursive return contract.**

**Location:** `skills/entropy-assessment/SKILL.md`, Steps 2–4; `skills/docs-first-planning-assessment/SKILL.md`, Steps 6–7; and `skills/session-coherence-skill-generator/SKILL.md`, “Inputs” and “Before writing”.

The generator now obtains missing analysis by calling the front door in assessment-only mode. That makes the boundary between analysis and orchestration consequential.

Three parts do not agree:

- The front door’s docs-first route says to run the docs-first skill. That skill’s Step 7 invokes the generator and then the integrator. The front door subsequently reaches its own guard decision and handover.
- Assessment-only stops the docs-first skill at Step 6, but the guard-surface inventory sits in Step 7. The front door’s output still requires that inventory.
- The generator requires information that the assessment routes do not consistently promise to return, including the current-state refresher, exact verification commands, and mappings from code areas to their documents and tests.

A cold generator invocation on a docs-first repository therefore depends on the agent inferring both inherited mode and the correct partial execution of Step 7. A normal front-door invocation can reasonably follow the child’s handover and then the parent’s handover. I am not claiming that recursion is inevitable; I am saying the instructions permit competing execution orders.

There is also a definite lost outcome. The baseline front door explicitly allowed:

> “Stop at the assessment, because no guard change is needed.”

The new Step 3 reserves an explicit no-guard outcome for reference-only, frozen or retired systems, then says:

> “Otherwise choose between building a guard and refining an existing one…”

An active repository with a sound existing guard needs a legitimate no-change result. A young repository returning “not yet” from bootstrap also needs to terminate without falling through into guard construction.

This is a **missing system**, because making assessment callable from the generator introduces a return boundary whose ownership, results and termination conditions have not been defined.

**Fix:** define the analysis return contract once at the front door. Separate workflow stage from write permission: assessment-only means “return analysis without generation”, while the caller’s plan/build/audit restrictions determine whether state updates may be applied.

Suggested core text:

> When called for analysis, every route inherits the caller’s operating mode and returns before generation or integration.  
> Return the findings, the guard decision (`none`, `bootstrap`, `create` or `update`), and the generator’s required inputs; mark inapplicable or unresolved inputs explicitly.  
> Reuse completed analysis and investigate only missing inputs.

Then make the following procedural changes:

- Obtain the docs-first guard inventory and proposed checks before the assessment returns.
- Permit `none` for an active system whose existing arrangements need no change.
- Give one caller responsibility for the generator handover.
- Let the generator own the subsequent integrator handover.

The supplied evaluation does not establish coverage of this cold-generator return path.

**P2 — 3. The bootstrap file’s loading condition contradicts its callers.**

**Location:** `skills/session-coherence-skill-generator/bootstrap.md`, opening paragraph; `skills/entropy-assessment/intent-pass.md`, “No new register”; and `skills/docs-first-planning-assessment/SKILL.md`, Step 5.

The bootstrap file says:

> “Read this only when the target is a young repository…”

But the intent pass sends any repository without a decision surface to bootstrap, and the docs-first assessment sends any repository without a current-state file there.

Consider an established planning repository with years of decisions but no useful current-state file. Docs-first Step 5 explicitly directs the agent to use bootstrap to create that missing surface. Bootstrap explicitly excludes the repository.

The new young-repository route also enters `bootstrap.md` directly, bypassing the generator file that defines operating modes. Bootstrap mentions “build mode” without defining or explicitly inheriting it.

This is an **instance**, because the minimal-memory mechanism exists, but its loading predicate excludes legitimate callers and its direct-entry assumptions are incomplete.

**Fix:** distinguish whole-repository bootstrap from consulting its rules for one missing surface.

Suggested opening:

> Read this for a young repository, or when an assessment needs a missing state or decision surface. For an established repository, assess only that requested surface and return to the caller. Inherit the caller’s operating mode.

The guard-readiness verdict should return to the routing contract in finding 2. “Ready now” should be usable by that caller; “not yet” and “soon” should terminate guard construction.

This preserves conditional loading. It does not require every route to read bootstrap.

**P2 — 4. The integration example claims a running check without evidence that the check ran.**

**Location:** `skills/guards-integrator/SKILL.md`, Step 5 and the `## Adoption` worked example; the diff removing the mandatory adoption-status fields.

The baseline explicitly required reporting:

- whether a mechanism was a reminder, a running check or an enforced invariant;
- whether it was verified, planned or unknown;
- what was exercised and when.

The replacement keeps important evidence requirements, but no longer mandates that classification. Its example reports:

> “reminder … + check that runs … verified…”

The evidence supplied is that the hook fired and a fresh session named the guard. Neither observation shows the agent executing the guard.

A reminder hook could print a message and exit successfully. A fresh agent could identify the guard’s path without running it. Both observations would satisfy the example while the claimed “check that runs” remained untested.

The trigger-plus-discovery condition existed before the cut. This is therefore a retained weakness made easier to miss by removing the explicit reporting contract.

This is an **instance**, because the integrator already owns adoption verification, but its example and reduced output requirements allow the evidence to support a stronger claim than was observed.

**Fix:** restore the distinction in a short mandatory instruction and correct the example.

> Report each mechanism as a reminder, an executed check or an enforced invariant, with `verified`, `planned` or `unknown`, its evidence and date. A reminder firing verifies the reminder only. Verify guard execution from an actual guard result, and enforcement from a permitted failing case that was refused.

If “adopted” is intended to mean that the guard has actually been used, require both a completed guard run and fresh-session discovery. Keep the existing rule against performing unapproved commits or pushes to obtain that evidence.

**P2 — 5. The “update both” repair conflates duplicate authority with legitimate dependent artifacts.**

**Location:** `skills/entropy-assessment/intent-pass.md`, the new final paragraph of “Gather”; compare the ownership exceptions in the docs-first risk matrix.

The new instruction treats keeping “two copies of one thing in step” as a path for unauthorised drift.

That is too broad without the distinction already present elsewhere in the library. The docs-first matrix explicitly preserves summaries, generated projections and independent tests of the same contract.

For example, an existing guard could say:

> “After an authorised command rename, update the canonical command reference and its quick-start summary.”

Those are two representations that should agree. Updating the summary does not make it a second authority or change intent. The library’s own versioned copies of the intent-change rule are another deliberate form of duplication.

The inspection added after round 1 is the right place to catch dangerous repair instructions. Its classification is the part that needs correction.

This is an **instance**, because the library already distinguishes competing definitions from dependent artifacts, but the new guard-inspection rule omits that distinction.

**Fix:**

> Read each guard’s repair instructions. Flag repairs that treat implementation as permission to change authorised intent. Separately flag independently maintained peer definitions of one concept; preserve summaries, generated projections and independent tests.

Use one ownership definition, including those exceptions, for the assessment and the generated contract. Do not leave the matrix preserving generated projections while another instruction can classify maintaining them as unauthorised drift.

**P2 — 6. The capability-list fix protects one assessment route, not every place that produces the same repair.**

**Location:** `skills/entropy-assessment/mixed-profile.md`, “Docs against implementation”; compare the generated guard’s `## Checks` and the front door’s route-wide patch rules.

The fifth fix correctly broadens a code search beyond the member that prompted an edit. The repeated omission of ORC’s Playwright browser is good evidence that this was needed.

However, the new obligation exists only in the mixed profile.

A generated ORC guard can later discover stale README text and propose a replacement description of network reach. That fresh guard run does not normally load the mixed profile. Its contract contains no corresponding requirement to verify the scope of an exhaustive replacement. A directly entered docs-first assessment can likewise rewrite a catalog of capabilities implemented by skills and instructions without loading this file.

These are the same kind of repair occurring elsewhere in the workflow. The current tests demonstrate an assessment failure; they do not yet demonstrate that the repair obligation reaches generated guards.

“Search the code for every member” also leaves a judgment unresolved: what establishes the scope of the list? Searching direct HTTP calls does not establish the full network reach of a system that launches a browser. A prescribed boundary and an observed capability list also require different evidence.

This is a **missing system**, because patch-producing routes do not share one obligation for establishing what a replacement claim is justified in saying.

**Fix:** make correction validity part of the common guard contract and have patch-producing assessment routes reuse it. Replace the route-specific rule with a reference plus any necessary code-search detail.

Suggested common text:

> Before replacing a claim, identify its scope and supporting evidence. Change only what that evidence settles; keep unresolved portions visibly open. For an exhaustive list or an “only” claim, check the full stated scope, including delegated behaviour; otherwise qualify the replacement as incomplete. Observed behaviour does not authorise changing a prescribed boundary.

This gives the K21 and capability-list fixes a common basis: a correction must not claim more than its evidence settles. It does not require a new parser, review service or execution mechanism.

**P2 — 7. Supersession protection now applies only when repairing a reference.**

**Location:** `skills/docs-first-planning-assessment/SKILL.md`, the matrix’s “Superseded material nearby” row, replacing baseline Step 8; and `skills/local/entropy-guard/SKILL.md`, check 5.

The baseline docs-first instruction covered three triggers:

> “before restoring a deleted file, reviving an old concept, or fixing a broken reference by recreation…”

The replacement covers only:

> “Before recreating anything to fix a reference…”

Consider a session that revives an old standalone planning packet because it appears useful for a new task. No broken link prompted the restoration. The packet’s broad purpose can still fit the current intent, while a recorded decision specifically retired its separate ownership.

The new supersession check does not trigger. The old one did.

This is an **instance**, because an existing check was narrowed during compression rather than its responsibility being deliberately removed.

**Fix:**

> Before restoring a deleted artifact, reviving an old concept or recreating a reference target, check whether the decision owner or current-state file records its supersession.

Carry that trigger into guards generated from the matrix. A regression case should revive superseded material without involving a broken reference; a link-repair case would not distinguish the old and new instructions.

**P2 — 8. The template’s Git commands use a baseline variable that the contract never binds.**

**Location:** `skills/session-coherence-skill-generator/SKILL.md`, the `## What changed this session` template.

The template now contains concrete commands using `$START`, but it never instructs the runner to set that variable. Previously, the template called for repository-specific commands covering the chosen start point.

In a shell where `START` is unset:

- `git log --oneline "$START"..HEAD` becomes a comparison with an omitted left endpoint and can report no commits.
- `git diff "$START" HEAD` receives an empty revision argument and fails.

The fallback sentence explains what to compare against when the starting point is unknown. It does not bind the variable when the start point is known, nor say what to do when no usable upstream exists.

This is an **instance**, because the baseline-selection mechanism exists but the example omits the step that makes its commands executable.

**Fix:**

> Resolve the session’s recorded start commit and use it as the baseline in the commands below. If unavailable, use the repository’s upstream and report incomplete coverage. If neither is available, report committed coverage as unavailable and still inspect staged, unstaged and untracked work.

Use an explicit substituted baseline in the generated commands, or include its assignment. Do not rely on a variable surviving from an earlier tool invocation.

The reported no-start guard test is valuable, but it does not establish that every permitted rendering of this template binds `$START`.

**P2 — 9. The size formula is a useful shape, but its accounting and over-budget response are underspecified.**

**Location:** `skills/session-coherence-skill-generator/SKILL.md`, `## Size`.

The formula scales with justified checks, source pointers and commands. The 36-word allowance is also honestly described as a planning average. Both are sound.

Two details need correction.

First, the terms are not demonstrably disjoint. The “common contract above” already contains pointer lines, Git commands and several checks. It is unclear whether those checks count toward `J`, which command words belong in the fixed 450, or whether source-pointer labels count in both 450 and `S`. The template also contains an unexpanded intent-change rule. The supplied text does not provide a reproducible measurement of the common portion.

Second:

> “Over budget means removing duplication or narrowing scope…”

allows a size estimate to reduce justified coverage. A cross-repository check can need more than 36 words to name the relevant owner, trigger and evidence. That is not itself a reason to omit one repository or weaken the check.

This is an **instance**, because the budget mechanism exists but its counting convention and response to necessary detail are incomplete.

**Fix:** define mutually exclusive terms:

- the measured common contract, including the expanded shared rule;
- additional justified checks;
- target-specific pointer values;
- target-specific commands not already counted.

Record the common measurement and counting convention. Report the actual size, allowance and component values, not just size and `J`.

Replace the final instruction with:

> Remove duplication first. If justified coverage still exceeds the planning allowance, retain it and explain the excess. Do not reduce required coverage merely to meet the estimate.

I am not claiming that 450 is numerically wrong. I am saying the supplied instructions do not make its derivation reproducible.

**P3 — 10. The integrator lost its explicit check that a guard’s cost fits its trigger.**

**Location:** `skills/guards-integrator/SKILL.md`, removal of baseline “Classify each guard by timing and burden” and the final warning against excessive ceremony.

The baseline asked how expensive each guard was and instructed the integrator to simplify or automate a guard that could not fit the loop.

The replacement records placement and depth, but does not explicitly assess execution cost.

A judgment-heavy guard could take twenty minutes and be placed before every small commit. Its trigger could fire and a fresh agent could find it, so the adoption checks would pass even though the chosen frequency makes the guard burdensome.

This is an **instance**, because the placement decision remains but one of its required inputs—execution cost—was removed.

**Fix:** restore one sentence, not the old rationale:

> Estimate each guard’s execution cost against its trigger frequency; if the cost does not fit the real loop, adjust placement or move stable mechanical checks into existing tooling.

The current cut substantially reduces guard size, so this is not evidence that its generated guards are presently too expensive. It is a lost obligation that prevents future placement mistakes.

**The post-round-1 fixes are mostly aimed at the right responsibilities, but their shared rule remains incomplete.**

The individual changes deserve different judgments:

| Change | Assessment |
|---|---|
| Inspect existing guards’ repair instructions | Correct. Guard instructions can themselves authorise the drift being assessed. Qualify “update both” as described in finding 5. |
| Name open questions touched by patches | Useful as a final check, but insufficient when the agent never recognises a question as open. Round 2 demonstrated that limitation. |
| Correct only what a recorded decision plainly settles | The strongest repair. It addresses the reason the first patch check failed. Preserve this distinction. |
| Collect every document holding authorised intent | Correct. A README alone is not an adequate proxy for a system spanning ORC and its lab. |
| Search the full kind of capability being rewritten | Directionally correct, but limited to one route and still dependent on establishing the claim’s scope. Round 4 remains pending. |
| Remove the docs-first route’s stray mixed-profile reference | Correct. No reason is shown for loading mixed-system profiling on a pure docs-first route. |

The deeper gap is narrower than “the whole design is broken”. The library has several producers of document patches, but the conditions that make those patches valid are scattered among the intent pass, front-door output rules, mixed profile and generator review steps. Findings 5 and 6 address that shared responsibility. Adding another reminder to each file would preserve the opportunity for them to diverge.

**The evaluation supports recovery on particular cases, not a passing final revision.**

The evaluation has several strengths:

- It compares against the post-critique baseline, rather than an older and easier opponent.
- The key was committed before the runs.
- Blind pairing reduces an obvious source of scoring bias.
- Intent and change-coverage losses cannot be hidden by equal aggregate scores.
- Generated guards were exercised against staged, unstaged and untouched-consumer cases.
- Harmful extras were recorded instead of being discarded as irrelevant output.

Those strengths make the failures informative.

However, the stated pass rule is stronger than the later recovery claim. The rule requires the cut to score at least as well on **every** key item the baseline met. Recovering the two highlighted intent behaviours does not by itself satisfy that rule.

The supplied results leave these limits:

1. **An observed non-intent loss remains unresolved in the report.** Round 1 loses half a point on R4a K18. Round 2 also records a K11 miss. Neither can be silently excluded from the original all-items criterion because it is not an intent or coverage item.
2. **The final revision has not completed testing.** Round 4 is pending. Results from earlier revisions establish what those revisions did, not what the final revision does.
3. **Only some behaviours were repeated.** K14 and K15 recovered twice in round 2; K21 recovered twice in round 3. K8, K22 and K25 are cited from round 1. The wording should not imply that every intent item was repeatedly exercised on the final candidate.
4. **Different revisions cannot be pooled into a reliability estimate.** “Three of five” establishes recurrence during development. It is not a failure rate for one fixed version. Two successes on the same repaired case establish repeatability on those runs, not a dependable general success probability.
5. **Repeated use of the same cases is regression repair, not independent generalisation evidence.** That is useful work. It needs at least one distinct case exercising the same principle before claiming that the underlying behaviour has been recovered broadly.

The R4c fixture also needs repair. Its intended claim is that code and tests can agree while violating documented authority. The write-up acknowledges that the test would actually fail. A run can still correctly identify the authority violation, so the existing K25 result has value. But it does not demonstrate the stronger green-test scenario that motivated the case.

Before relying on that scenario, make the fixture’s verification genuinely pass while the documented boundary remains violated, verify those conditions, and then run the guard.

The instruction-load reduction is substantial **as reported**: 5,103 words versus 9,729–10,269 in round 1. That establishes lower reported loading for those runs. It does not establish that every route loads only its required files, or that the current revision retains exactly those counts.

A suitable current verdict would be:

> The cut substantially reduced reported instruction loading. Targeted intent regressions recovered in the reported reruns. Final acceptance remains pending the last fix, resolution or retesting of other recorded losses, and testing of the final candidate against the complete key.

Before merge, freeze the candidate and complete that evaluation. Add focused cases for the boundaries identified here: an assessment returning to a cold generator, an active system needing no guard change, an established repository missing one memory surface, fresh-context guard restrictions, and reminder evidence that must not be reported as guard execution. Those cases test responsibilities the present write-up does not establish.

**The remaining size excess is not a reason to remove necessary behaviour.**

Using the brief’s approximate current total, 5,600 words is about 400 words, or 7.7%, above the 5,200-word target. It remains about 42% below the 9,729-word baseline.

The target was an editorial model of obligations, not a hard ceiling. Four hundred words corresponds to roughly eleven of the model’s 36-word instruction allowances. That comparison does not prove every excess word is needed, but it shows why a small number of recovered obligations can legitimately move the total.

I would not require another indiscriminate 400-word cut. Nor would I declare all remaining excess justified without a current file-by-file count.

There are useful cuts still available:

- Give handover and termination one owner, removing repeated generator and integrator invocations.
- Consolidate patch-validity instructions around one definition instead of retaining several incomplete versions.
- Keep one precise ownership rule with its exceptions.
- Remove duplicated prose after moving operating restrictions into the actual emitted contract.

Conversely, the words needed to restore mode handling, supersession triggers and evidence distinctions belong in the budget. They were not expendable rationale.

Recount the final library, including all supporting files, and report route loads for the final candidate. Keep historical counts attached to the revisions they measured. The daily cost of a generated guard should also include its copied rule or any supporting rule it reads.

**Several important parts survived the cut correctly.**

I found no substantive weakening in the extracted six-part intent-change rule itself. It still distinguishes defects, authorised adaptations and undecided intent changes, and it still refuses to treat code or tests as authority for weakening a documented constraint.

The guard template retains separate staged and unstaged inspection, untracked-file inspection, and the rule that a session can make an untouched consumer wrong. Those are the right protections, and the reported guard runs provide evidence for them.

The compressed intent pass preserves the distinction between a statement’s kind and its evidence of authority. Missing attribution does not automatically erase usable intent. That is an important distinction, and it remains explicit.

The docs-first state-file rules also retain their essential safeguards: use the existing state owner, date changing claims, identify refresh responsibility, check conflicting mentions, and distinguish fresh observations from old records.

Removing rationale paragraphs from the local guard was justified. Most of those paragraphs explained why the checks existed without adding obligations. Keeping one integrator example was likewise justified; the example needs accurate evidence, not additional examples.

The appropriate next revision is a focused correction of the contracts above, followed by a verdict on the final tested candidate. The size-cut structure should remain.