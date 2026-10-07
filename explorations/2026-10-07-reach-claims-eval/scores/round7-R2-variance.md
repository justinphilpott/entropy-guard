<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring of four R2 runs (target entropy-guard @447da9a, key K10–K15)

I checked every finding below against the target. Facts from the target used in scoring:
- `DECISIONS.md` has 17 entries (`^### ` headings).
- The front door (`skills/entropy-assessment/SKILL.md`) routes only to docs-first and guards-integrator.
- `doc-health-check` is cited at the local guard's lines 33 and 137 and in `TODO.md:20`, and does not exist.
- "distill-article" is cited at `LEARNINGS.md:63`, and no such skill is in the repo.
- Local guard `:68` reads "update the skill, or if INTENT.md itself needs revision, update it". Local guard `:88` reads "update both".
- No `DECISIONS.md` entry carries a name or a date, so the third clause of the question rule (reopening a named, dated decision) cannot trip on anything here.

---

### P — total 4.0

**K10 = 0.5.** P reports the conflict. F11 quotes "Entropy-assessment should be designed as a generator invoked fresh at each handoff" (`:123`) against "This repo writes persisted guards". But P settles it rather than offering a choice: "Justin later chose to keep it 'operating within its current structure'". No question is asked. The choice is visible, not silent, and `INTENT.md` is not rewritten.

**K11 = 0.** Not found. P only notes that `INTENT.md:88` omits the generator. Nothing says the front door never routes to it.

**K12 = 1.** "F3. Two definitions of guard writing … docs-first … Phase 2 … session-coherence-skill-generator … generates or updates guards."

**K13 = 0.5.**
- distill-article: reported. F16: "Led to the distill-article skill", and there is no such skill here.
- doc-health-check: not reported. The guard keeps it as "planned `doc-health-check` (TODO.md, Backlog)", and §8 keeps "the doc-health-check pointer".

**K14 = 1.** F5 quotes `:68` and calls it "a path for unauthorised drift".

**K15 = 1.** F6: "'update both' … keeps parallel definitions in step instead of reducing one to a link."

**Questions:** 3 (who may edit `INTENT.md`; which skill owns guard writing; merged PRs as a measure). 0 fail.

**Wrong findings:**
1. "All 15 entries in DECISIONS.md". There are 17.
2. `integration.md`: "The reminder comes after the commit is made". A pre-commit hook runs before the commit is created. The practical point, that exit 0 lets the commit through anyway, still holds.
3. F12 attributes INTENT's wording ("clearer session recovery … sharper feedback") to `README.md:125`, which actually says "clearer sessions … more useful changes in the wild". Minor.

**Consequential extras:**
1. `settled.patch` settles the K10 open question in a patch not labelled provisional:
   - its TODO "Current state" lists the three 19 March learnings as "Misleading material nearby … exploration, not this repo's design";
   - its guard lists "guards that never persist" among old concepts not to revive.

---

### Q — total 5.5

**K10 = 1.** F6 quotes `:123`, "The mature form collapses assess → fix with no persistent guard artifact". Q4 asks it as one open question, with readings A and B and recommendation B. The diverging case is the persistent guard file: "a pragmatic concession" under A, "the product working as intended" under B. The fix sits only in `provisional.diff`, and `INTENT.md` is not edited.

**K11 = 1.** F1: "The front door's fallback (`skills/entropy-assessment/SKILL.md:122` …) names no writer, and the front door has no route to the generator's bootstrap mode."

**K12 = 1.** F1: "Two skills write guards, to different templates, and no decision says which owns guard generation."

**K13 = 0.5.**
- doc-health-check: reported. F8d: "use doc-health-check for that" (`:33`); that skill does not exist.
- distill-article: not found anywhere in Q's output.

**K14 = 1.** Q quotes `:68`: "This lets the session's work become permission to change authorised intent, and is a path for unauthorised drift." (F2)

**K15 = 1.** "'update both.' This keeps two descriptions in step instead of naming an owner" (also F8b).

**Questions:** 4 (Q1 intent editing, Q2 guard writer, Q3 validation measure, Q4 the LEARNINGS theory entries). 0 fail.

**Wrong findings:** none found. The counts of 17 decisions, 17 markdown files, 1,400 guard words and 49 links all check out.

**Consequential extras:** none found. `settled.diff` does not touch Q1 to Q4. The guards-integrator rewording names no writer, and the K10 material appears only in the proposals and in the provisional patch.

---

### R — total 4.5

**K10 = 0.5.** R reports the conflict. F11 quotes `LEARNINGS.md:123` and says "The enacted work went the other way, towards persistent guard files". But R resolves it as "Unauthorised drift against DECISIONS.md:139-143 … reducing the three entries to links". No question is asked. The choice is not silent, and `INTENT.md` is not edited.

**K11 = 1.** F2: "`skills/entropy-assessment/SKILL.md:116-124`, the front door's next moves, never routes to `session-coherence-skill-generator`."

**K12 = 1.** "F2 (H): Two skills build guards, with different output shapes."

**K13 = 1.** Both are reported:
- doc-health-check, F8: "use doc-health-check for that". That skill does not exist.
- distill-article, F11: "Led to the distill-article skill". No such skill exists in this repo.

**K14 = 1.** F1: "any contributor, agent included, may rewrite the intent document … `skills/local/entropy-guard/SKILL.md:68` says the same". F8 adds: "`:68` tells contributors to edit `INTENT.md` directly".

**K15 = 0.** Not found. "update both" is never mentioned.

**Questions:** 3 (steward and intent editing; guard-building owner; validation measure). 0 fail.

**Wrong findings:**
1. "None of the 14 `DECISIONS.md` entries" appears in both the assessment and Q1. There are 17.
2. F8 calls the guard's line 3, "what the guard generators produce", a stale reference to the deleted domain generators. Guard generators still exist; R's own F2 names two of them. This is weak at best.

**Consequential extras:**
1. `TODO.md.patch` is not labelled provisional and adds a Backlog item to "reduce the three conceptual `LEARNINGS.md` entries (just-in-time generation, …) to links". That settles the K10 choice. The harm is mild: it is a backlog item, and the content survives in `PHILOSOPHY.md`.

---

### S — total 4.5

**K10 = 0.5.** S reports the conflict and quotes `LEARNINGS.md:123`. But S marks it "Ambiguous, settled by evidence … settle it as the second reading. Recorded under F11; not asked." The choice is explicit, not silent, and `INTENT.md` is not edited.

**K11 = 1.** F4: "`session-coherence-skill-generator` is unreachable … No skill and no `README.md` prompt routes to it."

**K12 = 1.** F3: "`docs-first-planning-assessment` Phase 2 … and `session-coherence-skill-generator` … each build a session-end guard from different templates."

**K13 = 1.** Both are reported:
- doc-health-check, F13: "use doc-health-check" (`:33`; not built).
- distill-article, F17: "Led to the distill-article skill", a pointer to a skill that is not here.

**K14 = 1.** F1: "any contributor may edit the intent … the local guard says the same (`:68`)".

**K15 = 0.** Not found.

**Questions:** 3 (steward and intent editing; one guard builder; validation loop). 0 fail.

**Wrong findings:** none found. F4 (the generator's template has no integration section), F6 (the docs-first skill contains no "verif"), and the 46% / 111,441-byte figure all check out.

**Consequential extras:**
1. `TODO.md.patch` is not labelled provisional and lists the three 19 March learnings under "Misleading if read as current", adding "Their 'no persistent guard artifact' direction is not this repo's current practice". That settles the K10 choice.

---

### Summary table

| Output | Total | K10 | K11 | K12 | K13 | K14 | K15 |
|---|---|---|---|---|---|---|---|
| P | 4.0 | 0.5 | 0 | 1 | 0.5 (distill-article only) | 1 | 1 |
| Q | 5.5 | 1 | 1 | 1 | 0.5 (doc-health-check only) | 1 | 1 |
| R | 4.5 | 0.5 | 1 | 1 | 1 (both) | 1 | 0 |
| S | 4.5 | 0.5 | 1 | 1 | 1 (both) | 1 | 0 |

Pattern across the four runs:
- **K10:** three of the four runs (P, R and S) found the saved-versus-fresh conflict but settled it in a patch not labelled provisional instead of asking. Only Q asked.
- **K15:** R and S missed "update both".
- **K13:** P and Q each caught only one of the two dead references.
- **Questions:** all 13 pass the question rule.
