---
title: "Are entropy-guard's skills too large? GPT 6.1 Astra"
date: 2026-10-05
participants:
  - Justin Philpott
  - GPT 6.1 Astra (via opencode)
  - Claude Opus 5.5 (briefed and checked it)
type: review
status: complete; awaiting Justin's decision on any cuts
---

# Are entropy-guard's skills too large? GPT 6.1 Astra, 5 October 2026

Asked for by Justin: "can we get Astra to independently take a view on is this skill too large? 9700 is HUGE".

**How it was run.** Through opencode with `openai/gpt-6-astra --variant xhigh`, read-only: editing, shell, web,
sub-agents, browser tools and other directories were all denied. Its pack held four things:
- entropy-guard at `d1bb276`;
- the skills at `447da9a`, for comparison;
- the revised skills' three test assessments and their guards;
- Justin's global `AGENTS.md`.

It did not see Claude's view.

**The runs, 22:29 to 23:02:**
1. **First run, 22:29.** It returned a 192-word summary, applying Justin's reply cap despite an exemption in the brief.
2. **Second run, resumed with the reason spelled out.** It refused again. It explained that the cap is in its standing
   instructions: opencode loads Justin's global `AGENTS.md` into every session as system instructions, and a brief
   cannot override that.
3. **Third run, resumed with a review-mode instruction loaded as a system instruction.** It hung before any output. It
   was stopped after 10 minutes.
4. **Fourth run, 22:46 to 23:02.** It ran through a runner that retries when no output arrives within 3 minutes, and
   produced this report on its first attempt.

**Checked by Claude the same night.** The structural citations were read in the files, and all hold:
- the generator's sections:
  - "Bootstrap Mode for Young Repos" at `:69–109`;
  - "What a Guard Holds" at `:166`;
  - "Generated Guard Requirements" at `:225`;
  - "Generated Guard Template" at `:282`;
  - "short enough to be read in full each time" at `:254`;
- the front door's mixed profile, at `:107–169`;
- the intent-change rule, at `intent-pass.md:128–146`;
- the local guard's rationale paragraphs, at `:71`, `:124`, `:150` and the others;
- the integrator's four "Minimal scaffold" blocks, at `:69`, `:124`, `:182` and `:222`.

The word-count arithmetic was not re-derived.

Its report follows unchanged.

---

Searched: the current and `447da9a` skill files, supplied generated guards, evaluation, and prior-art sections of the supplied reviews. Found: four exported skills, one guard builder, an existing supporting-file mechanism, and reported tools for parts of the job — using those existing mechanisms; this pack does not verify the tools’ current maintenance status.

# Review: the size of entropy-guard’s skills

## Actions taken

I compared the current instructions with the earlier skills, examined the three generated guards, and checked the evaluation and subsequent critique.

This is a source review. I did not execute the skills, rerun tests, tokenize the files, or inspect live services. The large-file word counts come from `BRIEF.md:14–26`; the short instruction samples below were counted by hand.

Paths beginning `skills/`, `explorations/`, or `TODO.md` refer to the supplied `entropy-guard/` repository. Paths beginning `eval-outputs/` refer to the review pack.

The reported prior art supports reusing existing mechanisms. The earlier review names Spec Kit for clarification and lychee and instruction-file linters for mechanical checks, rather than hand-built equivalents (`explorations/2026-10-04-skills-review.md:79–91`: “Several parts are worth taking rather than writing”). Nothing supplied establishes a maintained replacement for this entire workflow or an empirically correct skill-size limit.

## Status now

## 1. Is it too large?

**Yes. The current route asks an agent to load substantially more instruction than the selected work needs. I would reduce the instruction corpus and its per-route load by roughly half, while retaining the revision’s substantive behaviour.**

The problem is uneven. The generator and integrator contain substantial repeated presentation and branch-specific material. The intent pass contains more consequential distinctions and deserves a less aggressive cut.

This is an **instance**, because the project already has separate workflow responsibilities and supporting files; the excess comes from how instructions are packaged and repeated within that existing arrangement.

### The four costs are different

| Cost | What the supplied evidence establishes | My assessment |
|---|---|---|
| **Loading a complete route** | The five listed files total **9,729 words**, up from **6,281**: an increase of **3,448 words, approximately 55%** (`BRIEF.md:16–23`, “Total”). | Excessive for the current packaging. Some instructions concern branches the run never takes. |
| **Holding instructions while working** | A continuous agent session can retain earlier instructions alongside repository reads, findings, patches, and later-stage instructions. | Splitting files helps only when it prevents reading them. Reading every support file still incurs essentially the same load. |
| **Maintaining the skills** | A maintainer has **9,729 words** across the five listed files, plus the local guard and other project instructions. The generator alone is **2,839 words** (`BRIEF.md:18–25`). | The main maintenance burden is having to reconcile several presentations of the same requirement. Moving all the prose elsewhere would not solve that. |
| **Running generated guards repeatedly** | The generated guards contain **1,941**, **1,570**, and **1,180 words**. The repository’s own guard contains **1,644 words** (`explorations/2026-10-04-skills-revision-eval.md:185–187`; `BRIEF.md:25`). | This deserves particularly close attention because the cost recurs at handoff. |

**The 9,729 words are not one skill.** They are four exported skills and one supporting file. The front door identifies the four responsibilities explicitly: assessment, specialised analysis, guard building, and adoption (`skills/entropy-assessment/SKILL.md:12–18`: “The skills … share one flow”).

Nor does every route necessarily load all 9,729 words:

- A complete docs-first route loads the five listed files.
- A mixed/code/workflow route without docs-first supplementation nominally loads **7,959 words**.
- A mixed system using the docs-first guidance can again load all five files. The current routing explicitly permits that supplementation (`skills/entropy-assessment/SKILL.md:98–101`: “also run docs-first Steps 2, 3 and 5”).

These are instruction-file totals, assuming each relevant file is read once in full. They exclude target documents, tool output, rereads, and any additional processing of retained conversation context. They are not token or billing measurements.

### The recurring cost can quickly exceed the design-time cost

Six invocations of R1’s 1,941-word guard load **11,646 words of guard text**, assuming one complete read per invocation. That already exceeds one 9,729-word design route.

The local guard has an additional dependency. Its intent check says to “apply the intent-change rule in `skills/entropy-assessment/intent-pass.md`” (`skills/local/entropy-guard/SKILL.md:91`). If an agent reads that whole file to obtain the rule, the combined instruction load is:

**1,644 + 1,462 = 3,106 words.**

That is a possible branch cost, not a claim that every run reads both files. It nevertheless shows why the short runtime rule should be independently loadable.

### The research does not supply the answer

The two papers are reported evidence, not sources I verified. More importantly, `BRIEF.md:41` explicitly says that neither measured “skills invoked on demand”.

They justify paying attention to unnecessary context. They do not establish that:

- 200 lines is the right maximum for these skills;
- the reported inference-cost increase applies to this workflow;
- cutting a given percentage of words will improve task success.

The supplied evaluation gives a better reason to preserve the revision: generated guards became shorter while gaining explicit operating requirements (`explorations/2026-10-04-skills-revision-eval.md:153–170, 185–187`: “The generated guards changed the most” and “The guards themselves got shorter”).

**My conclusion is to shorten the revised design, rather than return to the earlier instructions.**

---

## 2. What is the right size, derived rather than picked?

There is no defensible universal word ceiling in this pack. There is enough evidence to derive **provisional editing budgets from the duties each file must perform**.

That distinction matters. A derived editing budget is a concrete starting point for a rewrite. An empirically established optimum would require comparative runs that have not happened.

### What one complete instruction costs

I used three existing passages to calibrate the size of a useful instruction. Counts exclude bullet labels and Markdown markers.

| Existing passage | Approximate prose words | What it carries |
|---|---:|---|
| `skills/session-coherence-skill-generator/SKILL.md:186–187`: “a restatement of a rule owned elsewhere … Link to the owner instead” | 31 | One exclusion, its replacement action, and its reason. |
| `skills/docs-first-planning-assessment/SKILL.md:138–140`: “Each claim likely to change within weeks … carries its source and the date” | 44 | One freshness requirement, including a staleness condition and example. |
| `skills/docs-first-planning-assessment/SKILL.md:194–197`: “decide which owns it” and “keep independent evidence” | 68 | Two obligations: consolidate duplicate definitions, and preserve independent contract evidence. |

These passages contain approximately **143 words for four obligations**, or **36 words per obligation** after rounding.

That is a small calibration sample. I would use **36 words as an average planning allowance**, not a maximum sentence length. A difficult instruction can need more; a simple routing instruction can need less.

The complete file budget must also include:

- Front matter and headings.
- Route tables or input/output fields.
- Exact commands and their necessary explanation.
- Source paths and version information.
- Examples that demonstrate otherwise easy-to-miss behaviour.

This follows the supplied sizing rule: “work out what it must hold” and account for “how large one of them is” (`reference/justin-global-AGENTS.md:132–134`).

### Derived overall targets

The file-by-file arithmetic appears in section 6. It produces these provisional totals:

| Complete route | Current instruction words | Proposed instruction words |
|---|---:|---:|
| Docs-first assessment through integration | 9,729 | **About 4,250** |
| Mixed/code/workflow route without docs-first supplementation | 7,959 | **About 3,850** |
| Mixed system also using docs-first analysis | 9,729 | **About 4,800** |

The proposed library totals **about 5,200 words**, including the three proposed supporting files. That is an approximately **47% reduction in maintained instruction text**, rather than merely a reduction in the visible `SKILL.md` files.

The complete-route reductions are approximately **51–56%**. They are proposed budgets, not measured results.

### What must be measured before making those budgets hard limits

The next comparison should record:

1. **Actual instruction words and tokens read**, including supporting files and rereads.
2. **Which conditional files were loaded**, and whether their triggering conditions were present.
3. **Generated output size**, especially repeated findings and recurring guards.
4. **Criterion-level behaviour**, using the existing cases and the current instructions.
5. **Elapsed time and tool work**, separately from instruction length.

Token counts should use the tokenizer for the model actually being evaluated. Shell commands, paths, and Markdown do not have a dependable fixed words-to-tokens ratio.

If a faithful draft exceeds a budget because it needs another named check or command, revise the calculation. Do not remove an essential qualification to satisfy a number.

---

## 3. Where does the size come from?

### The revision’s growth

The supplied word counts divide the 3,448-word increase as follows:

| File | Increase |
|---|---:|
| `skills/entropy-assessment/SKILL.md` | 668 |
| `skills/entropy-assessment/intent-pass.md` | 1,462 |
| `skills/docs-first-planning-assessment/SKILL.md` | 227 |
| `skills/session-coherence-skill-generator/SKILL.md` | 665 |
| `skills/guards-integrator/SKILL.md` | 426 |

The new intent pass accounts for approximately **42% of the increase**. That does not make it the best place to cut first. Much of its content expresses distinctions the evaluation showed were needed.

### 3.1 The front door: useful routing mixed with a route-specific assessment

**Keep the routing behaviour.**

The current front door correctly permits specialised analysis inside a mixed system, requires one combined assessment, and allows a no-guard outcome:

- `skills/entropy-assessment/SKILL.md:93–105`: “Combine the findings into one assessment” and “may finish with a correction or a demotion”.
- `skills/entropy-assessment/SKILL.md:147–154`: execution status includes “Unknown”.
- `skills/entropy-assessment/SKILL.md:198–203`: “Keep one findings list” and “Never cut these for length”.

These are operating instructions with consequences.

**Move the mixed/code/workflow profile behind its route.**

`skills/entropy-assessment/SKILL.md:107–169` contains “Profile for mixed, code-first and workflow-heavy systems”. A docs-first run currently reads that material as part of loading the front door, even though its route sends it elsewhere.

Put that profile in a supporting file. Keep the route and the condition for reading it in `SKILL.md`.

**Condense repeated framing.**

The introductory flow, invocation descriptions, shape descriptions, route, and “Hand on” section all explain parts of the same journey (`skills/entropy-assessment/SKILL.md:10–31, 48–105, 171–179`: “Choose the smallest useful next step”).

A compact routing table can carry the shape, analysis owner, and next step together. Preserve lifecycle status and the no-guard decision outside that table so every route sees them.

The feedback examples at `:209–213`—including “the profile in Step 4 missed a kind of drift”—can become one instruction to record a concrete reusable failure. They do not require a separate mini-checklist.

### 3.2 The intent pass: shorten the presentation, preserve the distinctions

**This is the least suitable file for indiscriminate compression.**

The following passages carry substantial weight:

- `skills/entropy-assessment/intent-pass.md:30–47` separates statement kind from authority evidence: “Missing attribution does not by itself make a statement an inference”.
- `:53–62` distinguishes declared, enacted, and authorised intent: “implementation shows what was built, not what was approved”.
- `:68–75` maps six conditions to different responses.
- `:82–98` controls clarification and unresolved decisions: “Do not implement, install or enforce a recommendation that needs a new decision”.
- `:102–114` preserves decisions under their existing concern owner and stops guard work when no usable intent exists.

Removing these distinctions would recreate demonstrated errors, including the request to ratify an entire decision log in `eval-outputs/R2-after/questions.md:68–71`: “the 17 existing entries, ratified as a block”.

**There is still compression available.**

The question gate appears both in the classification table and the asking section. The no-usable-intent outcome appears here and in the front door. Several paragraphs explain the same authority boundary from different directions.

State each operational rule fully once, then use short references where another step needs it. Keep the six-condition response table: it is already a compact representation of genuinely different actions.

**Separate the runtime intent-change rule.**

`skills/entropy-assessment/intent-pass.md:128–146` is a distinct runtime contract. Its preamble says “Every guard … carries a copy”, while a guard inside this repository “points here instead”.

That section should become a short sibling file. The assessment needs the longer intent analysis; the recurring local guard needs the decision rule.

I would target **about 800 words for the assessment pass and 200 words for the independently loadable rule**. This is a reduction of roughly one-third across the pair, not an attempt to turn the whole intent mechanism into a few slogans.

### 3.3 The docs-first skill: retain the state lifecycle and consolidate overlapping inventories

**The current-state instructions earn their space.**

`skills/docs-first-planning-assessment/SKILL.md:120–145` requires:

- Reusing the existing state file.
- Recording sources and observation dates.
- Naming the refresh actor and trigger.
- Checking other mentions of a changed claim.
- Distinguishing a fresh observation from an old one.

The critical sentence is at `:144–145`: “citing a source does not refresh the value”.

Likewise, the ownership qualification at `:194–197` prevents consolidation from destroying independent tests: “keep independent evidence of what the contract is meant to be”.

**Consolidate the surrounding presentation.**

The document-role inventory, ownership questions, risk catalogue, and supplied guard checks partly revisit the same concepts:

- `skills/docs-first-planning-assessment/SKILL.md:55–73`: document roles and competing canonical homes.
- `:94–109`: “Parallel truth”, “Registry/catalog duplication drift”, and related vectors.
- `:193–206`: ownership, supersession, state honesty, and workflow checks.

Retain the different failure conditions, but present them in one working matrix: **what to inspect, what constitutes drift, and what check follows**. Avoid describing ownership three times before handing it to the generator.

The separate output lists at `:149–159` and `:224–234` can become one assessment record with a generator handoff section. The existing rule already says “one findings list, referred to by id” (`:149–150`).

### 3.4 The generator: the largest opportunity for consolidation

**Keep the complete change definition and its examples.**

`skills/session-coherence-skill-generator/SKILL.md:194–221` covers committed, staged, unstaged, untracked, and relevant non-file changes. It also explains two important cases:

- `:212–214`: “`git diff HEAD` alone nets them out”.
- `:219–221`: “Renaming a setting in the code makes an untouched README wrong”.

Those examples describe traps, not decoration. They should survive.

**Move bootstrap instructions out of ordinary generation.**

`skills/session-coherence-skill-generator/SKILL.md:69–109` is explicitly “Bootstrap Mode for Young Repos”. Mature-repository generation does not need its maturity ladder and bootstrap output requirements.

This is a straightforward conditional supporting file.

**Reuse supplied analysis instead of presenting another assessment procedure.**

The generator already says “Skip what the assessment already supplied” (`skills/session-coherence-skill-generator/SKILL.md:115`). Nevertheless, its discovery and analysis sections occupy `:113–162`.

Keep a short completeness check for incoming assessment material. Standalone generation should obtain missing analysis through the existing assessment route, explicitly in assessment-only mode, rather than carrying another independently complete discovery workflow.

**Define the guard contract once.**

The same contract is presented through:

- “What a Guard Holds” at `:166–188`.
- “Generated Guard Requirements” at `:225–255`.
- “Generated Guard Template” at `:282–354`.

For example, all three carry the pointer/delta/intent/report structure.

**Where should that concept be defined once?** In one annotated template owned by the generator. The present file provides several overlapping presentations; those presentations need not remain independently complete.

Keep a final review of the generated result. In particular, retain `:267–269`: “A patch must not quietly settle a question that is still open”. Consolidating the contract must not remove the check that the output actually follows it.

### 3.5 The integrator: preserve adoption evidence, cut repeated scaffolds

**Adoption verification is the section to protect.**

`skills/guards-integrator/SKILL.md:145–168` requires:

- A trigger that actually fired.
- Discovery by a fresh agent.
- Respect for the invocation’s permissions.
- Separate configuration and execution evidence.
- A refused failing case when enforcement is claimed.

Its central distinction is explicit: “the hooks path points at `.githooks/`” is not “the hook ran” (`:158–159`).

**The repetition lies around that section.**

The integrator supplies:

- A loop-map scaffold at `:69–78`.
- A placement scaffold at `:124–130`.
- An adoption-plan scaffold at `:182–189`.
- A full output scaffold at `:222–251`.

One compact worked example can demonstrate the complete output. Four overlapping scaffolds are unnecessary.

The eight-part output list at `:209–218` can also be reduced to a placement-and-evidence record, with additional sections only when they contain distinct information. Preserve all required facts, rather than requiring eight headings.

The feedback form at `:191–203` need not be carried in every integration invocation. Keep the obligation to capture a concrete misfire, and load the feedback helper when one actually needs filing.

### 3.6 The local guard: recurring explanations are an especially poor trade

The local guard contains nine labelled rationale paragraphs:

`skills/local/entropy-guard/SKILL.md:71, 81, 93, 103, 115, 124, 133, 141, 150`.

Examples include:

- “Decisions made in one session are invisible to the next unless captured” (`:71`).
- “Structural changes propagate” (`:124`).
- “Stale TODO state is state entropy” (`:150`).

These explanations are reasonable documentation. They need not be reread every time an agent performs the check. The actionable checks immediately above them should remain.

The provenance and system-description block at `:14–22`, including “Why this is one combined guard”, can also be reduced to short generation metadata.

Finally, internal consistency, key-file maintenance, and cross-references overlap at `:105–133`. Combine their shared changed-file trigger while preserving the concrete actions and the supersession check. Do not replace them with a vague “keep docs consistent”.

---

## 4. What restructuring would reduce loading without losing behaviour?

### Keep four exported skills

Four is a reasonable number because the entry points serve different work:

1. Assess an unfamiliar system.
2. Assess a known docs-first system directly.
3. Build or amend a guard from an assessment.
4. Integrate an existing guard.

The current source already makes these responsibilities explicit (`skills/entropy-assessment/SKILL.md:14–18`: “This skill”, “Analysis”, “Guard building”, “Adoption”).

The fifth file in the brief is supporting material, not a fifth exported skill. I would not introduce a new exported skill for the intent pass or bootstrap branch.

### Add three supporting files inside the existing skill directories

These are proposed locations, not changes made by this review.

| Proposed supporting file | When it is read | Existing content it owns |
|---|---|---|
| `skills/entropy-assessment/mixed-profile.md` | The selected route is mixed, code-first, or workflow-heavy. | Front-door Step 4, currently `skills/entropy-assessment/SKILL.md:107–169`. |
| `skills/entropy-assessment/intent-change-rule.md` | A generator embeds the rule, or a local guard needs to apply it. | The runtime rule currently in `intent-pass.md:128–146`. |
| `skills/session-coherence-skill-generator/bootstrap.md` | The target needs young-repository memory bootstrapping. | The bootstrap branch currently in the generator at `:69–109`. |

The important change is **conditional reading**, not merely conditional execution. A short entry file must identify exactly when to open each support file.

I would retain the generator’s delta commands in its main construction contract: all full guards need them. Moving an always-needed template to another file would improve navigation, but would not reduce complete-route load.

### Preserve standalone invocation without repeating whole workflows

Each entry point should check whether its prerequisites are already available:

- The docs-first entry reuses the intent result or runs the pass once.
- The generator reuses an assessment or requests missing assessment work.
- The integrator reuses the loop map and investigates only missing or changed placement evidence.

The docs-first skill already implements the first pattern (`skills/docs-first-planning-assessment/SKILL.md:45–46`: “use its output. Otherwise, run the intent pass”). Apply that pattern consistently.

Lifecycle and no-guard decisions must also survive direct entry. A short route cannot assume that the front door always ran.

### Keep one assessment and one set of findings

The current front-door output rule is right: “Give each finding an id” and refer to it rather than repeating its evidence (`skills/entropy-assessment/SKILL.md:198–203`).

The older R1 outputs show why this matters:

- The ownership map identifies conflicting live-build claims in `eval-outputs/R1-after/assessment.md:246`.
- The ranked-risk section expands the same contradiction at `:254–276`.
- A separate generator report reconstructs the context-preservation map at `eval-outputs/R1-after/generator-report.md:13–23`.

Useful outputs still need different views. They do not need complete restatements of the same evidence.

The current source already contains an attempted correction. The next rewrite should make the templates follow that correction rather than adding another “be concise” instruction.

### Behaviours that must survive

The shorter version must preserve these capabilities:

- **Intent authority:** distinguish an approved adaptation from an undecided intent change.
- **Evidence handling:** retain sources, uncertainty, and incomplete attribution.
- **Question discipline:** ask when an unresolved choice changes the work, without reopening settled decisions.
- **Canonical ownership:** remove duplicate definitions while retaining summaries and independent tests.
- **Complete change coverage:** inspect committed and uncommitted changes and affected untouched consumers.
- **State honesty:** preserve observation dates, refresh ownership, and within-file consistency.
- **Proportionate routing:** include mixed-system analysis and a no-new-guard outcome.
- **Verified adoption:** distinguish a reminder, an executing check, and enforced refusal.

These are the operational distinctions identified in section 3. They are not candidates for removal merely because their instructions are longer than a generic checklist item.

### Counterfactual: when restructuring would cost more than it saves

Three cuts would be poor trades:

1. **Making exported guards depend on this repository being installed.** The current rule deliberately allows a versioned embedded copy for exported guards (`skills/entropy-assessment/intent-pass.md:130–132`: “carries a copy … naming this file and the version”). Keep that portability. Local guards can use a short shared file.

2. **Removing the staged/unstaged example.** The example explains a real coverage failure. Saving that paragraph while restoring `git diff HEAD` as the complete delta would weaken the guard.

3. **Splitting every small section into a file.** If every route immediately loads every file, total context does not fall and navigation becomes harder. The three proposed splits have identifiable consumers that do not need the other branches.

---

## 5. Are the generated guards the right size, and what should the generator’s limit be?

**The generated guards should not share one fixed maximum. Their budgets should scale with the number of justified checks and the concrete commands they need.**

My provisional targets are:

- **R1, ORC and the lab:** about **1,400 words across the complete guard bundle**, with a smaller common entry file where conditional loading is useful.
- **R2, entropy-guard:** about **950 words** for a self-contained exported guard.
- **R3, reference-only agentic-architecture:** normally **no newly generated guard**; approximately **650 words** if a full retained guard is justified.
- **The repository’s own local guard:** about **700 words**, plus the **200-word shared intent rule** when needed.

### Derive the recurring guard budget from its contents

A full guard has a common operating contract before repository-specific checks are added.

| Common component | Provisional words | Required content |
|---|---:|---|
| Identification and operating boundaries | 80 | Front matter, trigger, invocation mode, and concise safety boundaries. |
| Complete session change definition | 130 | Baseline, committed patches, separate index/worktree inspection, untracked contents, affected consumers, and relevant non-file changes. |
| Intent-change rule | 150 | The compact rule itself, with target names supplied. |
| Report and structural overhead | 90 | Coverage, findings versus existing problems, proposals, updates, and headings. |
| **Common subtotal** | **450** | |

The intent rule allowance is grounded in the current six-step rule, which is approximately 145 prose words before its explanatory preamble (`skills/entropy-assessment/intent-pass.md:134–146`: “When this session’s work and the authorised intent disagree”).

The other allowances are design estimates from the required content, not measurements of a completed shorter guard.

The resulting budget is:

**Guard budget = 450 + 36 × J + S + C**

Where:

- **J** is the number of distinct, justified repository-specific checking obligations.
- **S** is the word count of the required source-pointer entries.
- **C** is the word count of repository-specific commands and necessary operating notes, excluding the common delta commands already budgeted.

Each obligation should have a concrete trigger and a named thing to check. It should come from a finding, a standing constraint, or an established workflow requirement. Inventing more bullets must not manufacture a larger allowance.

### What that calculation gives for the supplied cases

These are proposed content allocations, not counts of the existing guards’ bullets.

| Guard | Proposed calculation | Rounded target |
|---|---|---:|
| R1 | 450 common + 18 × 36 checking words + 120 source words + 180 command words = **1,398** | **1,400** |
| R2 | 450 common + 8 × 36 checking words + 90 source words + 100 command words = **928** | **950** |
| R3, if retained | 450 common + 3 × 36 checking words + 50 source words + 40 command words = **648** | **650** |
| Local guard | 300 common, with the embedded intent rule removed + 8 × 36 checking words + 60 source words + 50 command words = **698** | **700**, plus shared rule |

These calculations provide an auditable editing target. They do not establish that every complex check can be expressed in precisely 36 words. Actual commands and necessary qualifications take precedence over the estimate.

### R1: its scope justifies more words, but not every word on every run

R1 genuinely covers two repositories and operational state. Its checks include ORC-to-lab data contracts and agent-definition readers (`eval-outputs/R1-after/guard/SKILL.md:155–166`: “Seams between the two repositories”). Those checks should not disappear to make its size match a docs-only guard.

A useful packaging target would be approximately:

- **800 words of common session, intent, state, and reporting instructions.**
- **400 words of conditional code/contract checks.**
- **200 words of conditional operational checks.**

Those allocations total the same approximately 1,400-word bundle; they are not three separate allowances on top of it.

Determine the session’s full change before selecting those branches. An operational change can occur without a file diff. A state-file edit that makes a live-service claim may also require an operational read.

The budget must count every supporting file actually loaded. A small `SKILL.md` that unconditionally opens another thousand words has not become a small guard.

### R2: remove repeated explanation and avoid carrying hand-built checkers

R2 has eight numbered judgment-check areas (`eval-outputs/R2-after/guard/SKILL.md:83–120`), which provides a useful basis for its check allowance.

Its mechanical section embeds link-parsing and front-matter shell loops (`:126–147`: “Relative markdown links that do not resolve” and “frontmatter name matches its directory”). These are candidates for maintained tooling or existing repository commands.

However, tool availability must be checked before claiming that those commands can be replaced. R3’s artifact explicitly records that lychee was not installed where it was drafted (`eval-outputs/R3-after/guard/SKILL.md:131–132`: “until it is, open each changed link by hand”).

A shorter guard must still provide a usable check in its actual environment.

### R3: the first sizing decision is whether to generate anything

R3’s guard says its “main job is to catch a change that treats the record as live design” (`eval-outputs/R3-after/guard/SKILL.md:15–17`). Yet it contains 1,180 words and detailed successor-ownership and supersession lists at `:95–108`.

The current front door already permits a reference-only system to finish without a guard (`skills/entropy-assessment/SKILL.md:104–105`: “a correction or a demotion and no generated guard”).

Use that outcome where appropriate. If the existing guard remains necessary for exceptional edits, preserve the full operating contract and keep the specialised checks narrow. A short status notice is also possible, but it should not be presented as equivalent to a full guard with complete delta and coverage requirements.

### The generator’s limit should be a derived review threshold

Replace “short enough to be read in full each time” (`skills/session-coherence-skill-generator/SKILL.md:254`) with a checkable allocation based on the formula above.

The generator should report the resulting guard’s:

- Entry-file size.
- Maximum conditional instruction load.
- Number of justified checks.
- Required source and command allowance.

An over-budget result should trigger removal of duplication, reconsideration of scope, or a justified recalculation. It should never trigger silent truncation.

### The counterfactual matters here

A longer design-time instruction can be worthwhile if it produces a clearer, shorter recurring guard. The supplied evaluation is consistent with that: the revised guards are shorter, while their explicit requirements improve.

Conversely, a nominally 500-word guard that forces every runner to rediscover paths, commands, authority, and dependent documents can cost more than a 950-word guard that supplies them correctly.

The correct comparison is the **whole run’s work and behaviour**, not the entry file alone.

---

## Next steps/decisions

## 6. A target and a plan

### File-by-file targets

The calculations below are editorial budgets. “Instructions” means complete obligations or decisions, using the approximately 36-word planning allowance from section 2. Additional allowances cover the named non-prose content. Rounded targets provide room for normal sentences rather than compressed fragments.

| File | Current words | Derivation | Proposed target |
|---|---:|---|---:|
| `skills/entropy-assessment/SKILL.md` | 1,552 | Eight routing/control obligations × 36 = 288; five route entries at about 20 words = 100; approximately 140 for front matter, output fields, and headings. | **550** |
| **New:** `skills/entropy-assessment/mixed-profile.md` | Included above | Twelve profiling/checking obligations × 36 = 432; approximately 90 for domain/status labels and structure. | **550** |
| `skills/entropy-assessment/intent-pass.md` | 1,462 | Nineteen obligations × 36 = 684; approximately 115 for statement/output fields and navigation. | **800** |
| **New:** `skills/entropy-assessment/intent-change-rule.md` | Included above | Approximately 145 words for the existing rule; approximately 55 for applicability, substitutions, and version/source information. | **200** |
| `skills/docs-first-planning-assessment/SKILL.md` | 1,770 | Twenty-two analysis/state/check/handoff obligations × 36 = 792; approximately 158 for metadata, document roles, and output fields. | **950** |
| `skills/session-coherence-skill-generator/SKILL.md` | 2,839 | Eight workflow obligations and twelve construction obligations × 36 = 720; approximately 150 for metadata, command syntax, and template structure. | **900** |
| **New:** `skills/session-coherence-skill-generator/bootstrap.md` | Included above | Seven bootstrap obligations × 36 = 252; six memory categories at about 12 words = 72; approximately 40 for output fields. | **400** |
| `skills/guards-integrator/SKILL.md` | 2,106 | Fifteen integration/evidence obligations × 36 = 540; approximately 270 for placement/status fields, metadata, and one worked example. | **850** |
| **Instruction-library total** | **9,729** | Includes the proposed supporting files. | **5,200** |
| `skills/local/entropy-guard/SKILL.md` | 1,644 | The local-guard calculation in section 5. | **700**, plus the 200-word rule when needed |

The intent pass’s nineteen obligations cover gathering, evidence interpretation, six gap responses, question discipline, durable recording, and the no-usable-intent outcome. The budget therefore does not assume that those distinctions disappear.

The generator budget assumes one construction contract, conditional bootstrap loading, and reuse of assessment work. Without those structural changes, 900 words would be an unjustified demand for compression.

The supporting files must be included in size reporting. Otherwise the apparent reduction would overstate what has been achieved.

### Cut in this order

#### 1. Separate the short intent-change rule and shorten the local guard

This has the clearest recurring benefit.

Move the canonical runtime rule to the proposed short file, update references, and remove the local guard’s repeated rationale paragraphs. Preserve the commands and dependent-document coverage at `skills/local/entropy-guard/SKILL.md:42–57`: “Check what depends on what changed”.

This first step should produce a visibly smaller guard without changing the assessment algorithm.

#### 2. Consolidate the generator

Move bootstrap instructions behind their condition. Replace the overlapping hold/requirements/template presentations with one annotated construction contract.

Preserve the final output review, particularly the unresolved-question check and the requirement to determine which side of a disagreement is wrong (`skills/session-coherence-skill-generator/SKILL.md:242–245, 267–269`: “establish which is wrong before making them agree”).

This is the largest source-level reduction.

#### 3. Shorten the integrator

Reuse the supplied loop map, keep one example, and express placement and adoption evidence in a compact record.

Protect the trigger, fresh-session discovery, and refusal evidence. Those are adoption work, not optional explanatory text.

#### 4. Separate the front-door profile and consolidate docs-first analysis

The front door should select work rather than load every analysis branch. The docs-first skill should produce one ownership/state analysis and one handoff from it.

Check both front-door entry and direct docs-first entry, especially for reference-only repositories.

#### 5. Compress the assessment intent pass last

By this point the runtime rule has its own home and the other files have stopped restating the assessment flow. Remove remaining repetition while keeping the classifications and qualifications.

This is the part where shortening a sentence carelessly is most likely to alter behaviour.

#### 6. Regenerate and compare the guards

Use the shorter skills to produce candidate guards. Measure the whole loaded bundle, not just `SKILL.md`.

The historical evaluation artifacts should remain historical evidence. Candidate guards are new outputs, not edits that make the old evaluation appear cleaner.

### Establish the correct comparison baseline first

The current skills contain amendments that the supplied “after” guards do not.

For example:

- `eval-outputs/R1-after/guard/SKILL.md:139–140` says “the test is the record”.
- The current generator explicitly rejects that instruction at `skills/session-coherence-skill-generator/SKILL.md:242–245`: “It never says ‘the test is the record’”.
- The current generator separately inspects staged and unstaged changes at `:203–214`, whereas the older generated artifacts use net-diff examples.

The task record confirms later critique groups were incorporated (`TODO.md:13–16`: groups 1–3 are checked, while correcting the test write-up remains open).

Therefore:

**Compare the shortened candidate against a frozen copy of the current skills, not merely against the older “after” outputs.**

The existing outputs remain useful evidence of gains and failure modes. They do not establish the current version’s exact behaviour.

### Use the existing cases as the regression backbone

| Existing case | What the shortened version must demonstrate |
|---|---|
| **R1: ORC and the lab** | Preserve the mixed-system route, real verification commands, state contradictions, evidence-settled documentation corrections, execution-status distinctions, complete delta, policy pointers, intent protection, and adoption advice. The key names these at `explorations/2026-10-04-skills-revision-eval.md:48–77`, including “The delta includes uncommitted work”. |
| **R2: older entropy-guard** | Preserve the genuine saved-versus-regenerated intent question, identify the missing route and duplicate builders, catch stale references, and reject intent rewriting and “update both”. These are K10–K15 at `:79–93`, including “It does not silently pick one”. |
| **R3: reference-only architecture repository** | Treat the banner as the likelier status without inventing missing history, ask only the unresolved material question, and avoid unnecessary guards or process. The corrected key at `:95–109` explicitly allows “no new guards or heavy process”. |
| **R4: constructed session** | Report no change-caused defect for the harmless rename; catch the uncommitted setting rename making an untouched README wrong; state baseline and uncovered scope. These are K18–K20 at `:113–120`, including “what it did not cover”. |

Do not accept an unchanged aggregate score if an important criterion regresses. Losing intent protection cannot be compensated for by finding another stale link.

### Check the corrections that the original evaluation did not adequately exercise

Use focused variants of the existing cases to check:

- A staged change reversed only in the worktree.
- An unknown starting baseline.
- Relevant untracked content.
- A permitted adaptation that needs no new intent approval.
- An unresolved intent choice that remains unresolved in proposed patches.
- Code and tests agreeing with each other while violating a retained constraint.
- Conditional guard sections being loaded when an untouched consumer or non-file change requires them.

These are grounded in the current requirements and the prior critique’s proposed focused checks (`explorations/2026-10-04-skills-revision-critique-astra.md:506–515`: “Staged and unstaged changes cancel in the working tree” and “Code and tests agree while violating a retained constraint”).

The existing R1–R4 cases do not cover young-repository bootstrap behaviour comprehensively. Moving that branch requires a separate focused check of its readiness decision and minimal-memory output. Similarly, direct integration entry needs a discovery check because it may not arrive with a freshly produced loop map.

### Record enough evidence to distinguish a smaller skill from a cheaper run

For each comparison, retain:

- The exact skill contents and target versions.
- The invocation and available capabilities.
- The instruction files actually read.
- Input and output token counts where available.
- Elapsed time and relevant tool work.
- Findings, misses, unsupported recommendations, and material questions.
- Guard entry size and maximum loaded supporting material.

The evaluation already warns that it used “One run per case” and did not measure variation (`explorations/2026-10-04-skills-revision-eval.md:189–199`). Begin with the affected existing cases; repeat a comparison when a meaningful difference needs checking. Do not infer stable performance improvements from one favourable run.

Also preserve the evaluation’s limits:

- Both R4b runners caught the uncommitted drift (`:182–184`).
- Useful findings outside the key were “roughly even” (`:191–195`).
- The recorded assessment times increased, but the test does not isolate instruction length from the additional work requested (`:144–148, 185–187`).

Those limitations do not undo the revision’s demonstrated improvements. They prevent claiming that every added word was necessary, or that every proposed cut will save time.

### Acceptance decision

I would accept the shorter version when it:

1. Preserves the required behaviour and the current post-evaluation corrections.
2. Reduces **actual loaded instruction text**, including support files.
3. Produces proportionate guards whose checks remain concrete.
4. Avoids replacing explicit instructions with rediscovery work.
5. Keeps evidence, uncertainty, and unresolved decisions visible.

**Recommended target:** approximately **5,200 maintained instruction words**, **4,250–4,800 words for the complete routes that currently load 9,729**, and generated-guard budgets calculated from their actual obligations. The repository’s own guard should fall to approximately **700 words**, with a separately loadable **200-word intent rule**.

The revision’s useful behaviour should remain. The repeated explanations, overlapping templates, and instructions for unselected branches should account for most of the reduction.
