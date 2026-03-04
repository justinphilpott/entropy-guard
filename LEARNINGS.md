# Learnings

Capture discoveries as you build. Focus on what you validated, not just opinions.

---

### Conversations are high-entropy artifacts

**Topic**: Knowledge management

**Insight**: Conversations between humans and AI agents produce genuine intellectual work — frameworks, analyses, non-obvious insights — but this work decays instantly unless captured. The chat transcript is effectively write-only; nobody reads it again.
**Validated by**: Realised the discussion on entropy vectors, enforcement depth, and domain-specific guards contained publishable-quality thinking that would have been lost without a capture mechanism.
**Implication**: Need a systematic way to distill conversations into durable artifacts. Led to the distill-article skill.

---

### Documentation-as-system inverts the map/territory framing

**Topic**: Guard generation methodology

**Insight**: The docs-guard-generator assumes documentation is a "map" of some separate "territory" (code, infrastructure, etc.). But when the system *is* documentation — like this project — the map is the territory. Map/territory drift becomes internal consistency drift (do the docs agree with each other?), and coverage gaps become completeness gaps (are all concepts addressed?). The entropy vectors are the same in kind but different in what they point at.
**Validated by**: Running the generator entry point against this project. The docs-guard-generator's framing needed mental adaptation at every step. The guard it produced was materially different from what a naive application of the template would give.
**Implication**: Domain generators should acknowledge this special case explicitly. Systems where the artifact *is* the product (not a description of the product) need a note about how to adapt the analysis.

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
