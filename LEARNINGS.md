# Learnings

Capture discoveries as you build. Focus on what you validated, not just opinions.

---

### Judgment-heavy guards usually mature through reminders before automation

**Topic**: Guard adoption

**Insight**: When a guard is already well-scoped and useful, the next failure mode is often forgetfulness rather than bad guard design. For judgment-heavy guards, the right next move is usually a non-blocking reminder at the real handoff point, not immediate CI or hard enforcement.
**Validated by**: This repo's local `entropy-guard` ritual had become stable enough that the main remaining gap was remembering to run it consistently. Adding a local pre-commit reminder hook improved the workflow without pretending the underlying judgment checks could be automated.
**Implication**: Assessment and integration guidance should explicitly recommend an `External -> Prompted -> deeper embedding` adoption ladder for judgment-heavy guards, and distinguish reminder surfaces from the guard definition itself.

---

### Bootstrap checks need direct evidence and external state tracking

**Topic**: Guard generation methodology

**Insight**: A generated guard loses trust quickly if it names a gap that is not actually present or if it asks contributors to mutate the guard definition to prove completion. Bootstrap checks should be grounded in the current artifact, and their completion should be tracked in a companion artifact rather than the guard file itself.
**Validated by**: Dogfooding `entropy-assessment` produced two first-draft errors that were only caught in self-review: one bootstrap action targeted a config key that was not present in the tracked file, and another proposed striking completed bootstrap items from the generated `SKILL.md` itself.
**Implication**: Step 5 should require direct verification of the target artifact before a bootstrap action is written, and Step 7 should require an explicit output location outside the guard definition.

---

### Workflow/process belongs in the assessment model, not just in the prose

**Topic**: Assessment methodology

**Insight**: It is not enough for the framework to mention workflow in abstract terms. If workflow/process is a real entropy-bearing domain, it has to appear explicitly in the assessment map, the cross-domain drift prompts, and the guard-generation reference material; otherwise agents will underweight it or treat it as an awkward docs-only special case.
**Validated by**: Running the assessment against this repo surfaced workflow/practice drift immediately, but the skill's old domain table and appendices had no first-class slot for it. Adding a dedicated workflow/process appendix made the methodology line up with what the repo's own intent already claimed.
**Implication**: When a domain matters enough to change prioritization or guard design, it should be explicit in the skill structure, not left implicit in examples or surrounding theory.

---

### Workflow-heavy repos do not always need separate guards

**Topic**: Guard generation methodology

**Insight**: A repo can have workflow/practice drift as a first-class entropy vector without needing a separate workflow guard. If there is still one stable, low-burden handoff point and the checks are tightly coupled, the better design can be a single guard that explicitly covers both documentation and workflow alignment.
**Validated by**: Running Phase 2 of `entropy-assessment` against this repo. The main risks clearly span both docs and practice, but splitting the local guard would have added ceremony without adding a better trigger point.
**Implication**: The assessment should model workflow/process more explicitly during analysis, but guard design should still optimize for the smallest effective set of rituals rather than assuming each risk area deserves its own file.

---

### Conversations are high-entropy artifacts

**Topic**: Knowledge management

**Insight**: Conversations between humans and AI agents produce genuine intellectual work — frameworks, analyses, non-obvious insights — but this work decays instantly unless captured. The chat transcript is effectively write-only; nobody reads it again.
**Validated by**: Realised the discussion on entropy vectors, enforcement depth, and domain-specific guards contained publishable-quality thinking that would have been lost without a capture mechanism.
**Implication**: Need a systematic way to distill conversations into durable artifacts. Led to the distill-article skill.

---

### Documentation-as-system inverts the map/territory framing

**Topic**: Guard generation methodology

**Insight**: The documentation domain analysis assumes documentation is a "map" of some separate "territory" (code, infrastructure, etc.). But when the system *is* documentation — like this project — the map is the territory. Map/territory drift becomes internal consistency drift (do the docs agree with each other?), and coverage gaps become completeness gaps (are all concepts addressed?). The entropy vectors are the same in kind but different in what they point at.
**Validated by**: Running the assessment skill against this project. The documentation domain framing needed mental adaptation at every step. The guard it produced was materially different from what a naive application of the template would give.
**Implication**: Domain analysis should acknowledge this special case explicitly. Systems where the artifact *is* the product (not a description of the product) need a note about how to adapt the analysis.

---

### Dogfooding immediately surfaces guard gaps

**Topic**: Guard generation methodology

**Insight**: Running the generator against the project that hosts it revealed two missing checks in the existing guard (skill/intent alignment, internal consistency) and one systemic problem (under-populated DECISIONS.md and LEARNINGS.md). These gaps were invisible until a structured analysis was applied.
**Validated by**: The dogfooding exercise itself — the existing guard had been run multiple times without catching these gaps because the guard didn't check for them.
**Implication**: Guards should be periodically re-evaluated by running the generator against the system, not just run as-is. A guard that never gets regenerated is itself a source of entropy. Also: a guard that exists but isn't actually run is dead weight — generators need to produce guards with integration instructions, not just checklist files.

---

### Step 0 (System Inventory) is the highest-value addition to the generator pattern

**Topic**: Guard generation methodology

**Insight**: The Step 0 inventory — checking what actually exists before analyzing entropy vectors — prevents generating guards that reference non-existent artifacts and surfaces the most fundamental entropy signal: "this system can't explain itself." When intent documentation is missing, that's the finding, not an obstacle.
**Validated by**: Building all four domain generators with Step 0, then running the entry point against this project. Step 0 immediately surfaced that DECISIONS.md and LEARNINGS.md were under-populated (present but stale).
**Implication**: Consider porting Step 0 back to the entry point as a required first action, not just in domain generators. The general-purpose entry point currently has "establish system intent" as Step 1 — this is a lightweight version of Step 0 but doesn't inventory artifacts beyond intent docs.

---

### Naming shapes discoverability more than content does

**Topic**: Skill design

**Insight**: The entropy-guard-generator skill already contained a full system assessment (Steps 1–4) that produced a useful standalone deliverable. But an agent arriving cold didn't recognize it as the start point for reviewing a system — the name "generator" framed assessment as a precursor to generation, not as a first-class output. Renaming to `entropy-assessment` and adding an explicit assessment output format made the same content dramatically more discoverable.
**Validated by**: A fresh-session agent assessed the project and recommended creating a new assessment skill, not realizing the existing generator already did exactly that. The capability was there; the framing hid it.
**Implication**: When a skill serves multiple purposes, name it after the most common entry use case, not the most complex one. Users and agents form expectations from names before reading content.

---

### Guard adoption is a separate design problem from guard generation

**Topic**: Guard integration

**Insight**: Knowing which guards a system needs is not the same as knowing where those guards should live in the system's real iteration loop. The missing work is operational: mapping guards onto the actual agent, commit, PR, CI, and release handoffs people already use.
**Validated by**: Reviewing the current docs showed that Step 8 of `entropy-assessment` already said guards need integration, but the repo still lacked a dedicated artifact for translating generated guards into concrete adoption steps for a specific workflow.
**Implication**: Treat guard integration as a first-class skill. Generators should emit immediate adoption advice, and more complex systems should get a dedicated integration pass before guards are considered truly in use.

---

### Just-in-time guard generation is a better model than pre-generated guard artifacts

**Topic**: Guard generation methodology

**Insight**: A pre-generated guard encodes system state at time A and drifts from time B onward. A process generator that produces fresh guards from current state + cached memory + intent is fundamentally more robust — not because it's a better implementation but because it's a different category of thing. The generator makes claims about how to assess *any state of this system*; the guard makes claims about *a specific past state*. The analogy: DNA repair enzymes aren't pre-stocked patches — they're proteins that recognise and respond to damage classes, whatever form the damage takes.
**Validated by**: The 2026-03-19 philosophical conversation on autopoiesis and entropy guards (`explorations/2026-03-19-autopoiesis.md`).
**Implication**: Entropy-assessment should be designed as a generator invoked fresh at each handoff, not a template that's maintained between uses. The intermediate guard artifact is a pragmatic concession to the current state of tooling, not a design goal. The mature form collapses assess → fix with no persistent guard artifact.

---

### The four-component temporal hierarchy of a complete guarding system

**Topic**: Guard system architecture

**Insight**: A complete guarding system has four components with fundamentally different persistence expectations: (1) intent — slowest to change, constitutional core; (2) system memory — the cached entropy profile, analogous to immune memory, updates with major architectural shifts; (3) process generator — freshly instantiated at each handoff from the other three, never persisted; (4) delta — what changed this iteration, consumed immediately. The error in current guard design is treating all four as having the same persistence profile. The stability hierarchy maps directly to the biological analogy: the repair enzyme genes (intent) are ancient; the enzymes themselves (memory) persist in the cell; the specific repair action (process) is immediate and consumed.
**Validated by**: The 2026-03-19 philosophical conversation on autopoiesis and entropy guards.
**Implication**: Future entropy-assessment design should explicitly distinguish these four components and design persistence expectations accordingly. The process generator should be ephemeral. The system memory should be maintained as a first-class artifact with its own update cadence. The intent should be the most protected and slowest-changing element.

---

### Most current guards operate at the wrong layer — representational rather than meaning

**Topic**: Guard design methodology

**Insight**: There is a layer hierarchy from representational consistency (layer 5: docs agree with each other) down to actual-meaning integrity (layer 1: the effect still serves what motivated building it). Current entropy guards almost entirely operate at layers 4–5. Test suites operate at layer 3 — checking against a static behavioral baseline. Almost nothing guards layers 1–2. A system can be perfectly internally consistent, pass all tests, and be doing the wrong thing — intent drift at layer 1 is invisible to every representational guard. This is the cancer pattern: local coherence, global harm.
**Validated by**: The 2026-03-19 philosophical conversation; the observation that test suites guard regression but not purpose drift.
**Implication**: The most valuable future development for entropy guards is mechanisms for layer 1–2 checking — evaluating whether the running system still serves its stated intent. This likely requires AI-assisted evaluation rather than mechanical checking. The fact that almost no tooling addresses this layer is itself a significant gap in the current software development infrastructure.

---

### Cold-start reliability needs scaffolding, not just process prose

**Topic**: Skill design

**Insight**: A well-sequenced process is not enough for an agent entering a repo cold. Reliability improves materially when the skill also points to where evidence usually lives and shows what good output looks like in compact scaffolds.
**Validated by**: Review feedback on the `guards-integrator` PR surfaced that the process was sound, but the skill still left too much unstated for an unfamiliar agent: where to inspect workflow artifacts, how to judge current automation maturity, and what shape the final brief should take.
**Implication**: For exportable skills, include both reasoning steps and lightweight output / discovery scaffolding. This preserves flexibility while reducing cold-start variance.
