<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring

The total for each run is the sum of its key items (met = 1, partly = 0.5, not met = 0). Questions, wrong findings and consequential extras are reported beside the total and are not subtracted from it. I checked every finding I relied on against the read-only targets.

---

### R2-final-a (entropy-guard at 447da9a)

**Key items**
- **K10: 0.** Not found. F9 treats the three entries from 19 March only as theory in the wrong file ("goes against the file's header ... and 'LEARNINGS.md stays tactical'"). It never reports the conflict between saved guards and fresh generation. The TODO patch then lists those entries as "Misleading material nearby" and adds a backlog item to "Move or relabel" them, so it quietly picks one side.
- **K11: 1.** F4: "Neither `skills/entropy-assessment/SKILL.md:66-126` nor the docs-first skill routes to it."
- **K12: 1.** F4: "`docs-first-planning-assessment/SKILL.md:132-202` (Phase 2) writes or refines guards" and "`session-coherence-skill-generator` ... writes guards to `skills/session-coherence-guard/SKILL.md`".
- **K13: 1.**
  - F13: "Lines 33 and 137 point to `doc-health-check`, which does not exist."
  - F9: "`LEARNINGS.md:63` cites 'the distill-article skill', which is not in this repo."
- **K14: 1.** F2 quotes `SKILL.md:68` "if INTENT.md itself needs revision, update it", then says "Both let the session that drifted rewrite the intent."
- **K15: 1.** F3: "'update both' ... keeps two descriptions in step instead of choosing an owner."
- **K30: 1.** 1 handover to the generator and 1 to the integrator. The docs-first skill ran as a called skill and returned.
- **K33: 1.** The guard has "## Modes and safety". Its baseline is "write it in place of `<start>` ... If you cannot, use `$(git merge-base HEAD origin/HEAD)`".

**Questions:** 4, of which 1 fails.
- **Q4 (who is the steward) fails:** the evidence already settles it. The repository is `justinphilpott/entropy-guard`, Justin is the only human participant in all four `explorations/` files, and the intent pass defines the steward as "the owner of a personal project". The recommended answer changes nothing that gets built.
- **Q1 (which skill writes guards), Q2 (which repos and measure the validation batch uses) and Q3 (may agents edit `INTENT.md`) pass.**

**Wrong findings:** 0.

**Consequential extras:** 1, and it is small. The `TODO.md` backlog item to move or relabel the just-in-time and hierarchy entries in `LEARNINGS.md` would settle the open K10 choice by demotion without ever raising it.

**Total: 7 / 8**

---

### R2-final-b (entropy-guard at 447da9a)

**Key items**
- **K10: 0.5.**
  - **What it gets right:** F14 reports the tension: "Line 123 suggests the mature form has 'no persistent guard artifact', which points away from the persisted guards the repo ships." It leaves the decision open ("moving these entries is the owner's call. Recommendation only") and does not touch `INTENT.md`.
  - **What it misses:** it frames the choice as where the entries should live, not as the intent choice between saved guards and fresh generation. It gives no recommendation on that choice. Its state patch also lists the entries under "Misleading nearby".
- **K11: 1.** F1: "No skill routes to the generator: grep finds it only in README.md line 91, AGENTS.md line 46 and DECISIONS.md lines 9–10."
- **K12: 1.** F1: "Two independent definitions of what a generated guard holds", meaning docs-first Phase 2 and the generator.
- **K13: 1.**
  - F9: "use doc-health-check ... That skill does not exist."
  - F17: "Led to the distill-article skill. No such skill exists here."
- **K14: 1.** On line 68: "This lets session work rewrite the authorised intent."
- **K15: 1.** On line 88, "update both": "This keeps two definitions in step."
- **K30: 1.** 1 handover to the generator and 1 to the integrator.
- **K33: 1.** The guard has "Modes and safety". Its baseline is `<start>`, with the upstream branch from `git rev-parse --abbrev-ref @{upstream}` as fallback.

**Questions:** 3, of which 0 fail.
- Q1 (who may change `INTENT.md`, with steward confirmation folded in), Q2 (validation measure) and Q3 (which skill writes guards) all pass.

**Wrong findings:** 0. There are 2 minor slips that change no finding:
- the truth map says "2 of 14 entries", but `DECISIONS.md` has 17;
- it says "'Specialize first' refers to the 'Consolidate' entry as 'above'", which is reversed: the Consolidate entry's marker (line 131) points to Specialize as "above".

**Consequential extras:** 0.

**Total: 7.5 / 8**

---

### R3-final (agentic-architecture, reference-only)

**Key items**
- **K16: 1.**
  - It reports the conflict. F1: README.md:3-5 and AGENTS.md:3-6 say reference-only, against "DECISIONS.md:137 ... :158 ... the design source".
  - It treats the banner as likelier: "Lifecycle: reference-only, provisional on Q1", recommended answer A.
  - It asks one question, Q1.
- **K17: 1.** Guard decision `none`, plus a demotion of the existing guard surfaces. The patch adds only an `AGENTS.md` step 0, a status section in `ROADMAP.md`, a proposed `DECISIONS.md` entry and two pointer fixes. The 8-item cleanup is gated on Q2, and the run recommends not doing it ("Recommended answer: A", frozen).
- **K24: 1.** "Guard decision: `none`, provisional on Q1 ... no guard was generated."
- **K30: 1.** 0 handovers to the generator and 0 to the integrator: "the generator's own rule for `none` is 'stop'", and the integrator "was not run or opened". Read literally, "makes the generator handover once" would score 0 here. I scored it met because zero is correct for `none`, and a literal reading would contradict K24. Under the literal reading this run's total is 4/5.
- **K31: 1.** It updated the existing `ROADMAP.md` and `DECISIONS.md`, added no new surface, and did not open `bootstrap.md` ("needed only if there is no state file or no decision log").
- **K33:** does not apply, because no guard was generated.

**Questions:** 3, of which 0 fail.
- **Q1 (is it reference-only?) passes.**
- **Q2 (correct the stale text, or stay frozen?) passes, but is the weakest.** The repository's own rules pull both ways: AGENTS.md:26 and INDEX.md:23 say fix stale docs, while AGENTS.md:5-6 says "do not extend". The answer changes 8 cleanup items.
- **Q3 (carry the findings of runs 001-003 to the successor repositories?) passes.** The successor repositories were not readable.

**Wrong findings:** 0. I spot-checked F1, F8 (13 registry items), F13, F18 (paths against DECISIONS.md:176 and RUN.md:29) and the claim that `personal-agent` appears only in the notices.

**Consequential extras:** 0. The patch header gates everything on the steward's authorisation.

**Total: 5 / 5** (K33 not applicable)

---

### R5-final (direct generator call on 447da9a)

**Key items**
- **K29: 1.** `steps.md` records this order:
  - the generator was called with no assessment, so it called `entropy-assessment` "for analysis only, mode plan";
  - docs-first ran once, as a called skill, and returned;
  - the decision `update` came back to the generator, which acted on it;
  - "Handover 3: generator → `skills/guards-integrator/SKILL.md`" is the only handover to the integrator.
- **K33: 1.** The guard has "Modes and safety". Its baseline is `<start>`, with fallback `git merge-base HEAD @{upstream}`.

**Questions:** 5, of which 1 fails.
- **Q1 (who is the steward) fails,** for the same reason as R2-final-a's Q4: the evidence already settles it.
- **Q2 (agents editing `INTENT.md`), Q3 (which skill writes guards), Q4 (user-wide rules) and Q5 (validation measure) pass.** Q5's "recommendation" ("record which measure, or both") is not really an answer.

**Wrong findings:** 0.

**Consequential extras:** 0.

**Total: 2 / 2**

---

| Output | Total | K10 | K11 | K12 | K13 | K14 | K15 | K16 | K17 | K24 | K29 | K30 | K31 | K33 | Questions (fail) | Wrong | Extras |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R2-final-a | 7 / 8 | 0 | 1 | 1 | 1 | 1 | 1 | – | – | – | – | 1 | – | 1 | 4 (1) | 0 | 1 |
| R2-final-b | 7.5 / 8 | 0.5 | 1 | 1 | 1 | 1 | 1 | – | – | – | – | 1 | – | 1 | 3 (0) | 0 | 0 |
| R3-final | 5 / 5 | – | – | – | – | – | – | 1 | 1 | 1 | – | 1* | 1 | n/a | 3 (0) | 0 | 0 |
| R5-final | 2 / 2 | – | – | – | – | – | – | – | – | – | 1 | – | – | 1 | 5 (1) | 0 | 0 |

\* 0 handovers, which is correct for `none`. A literal reading of "once" gives 0 and a total of 4/5.

The one gap shared by both R2 runs is K10. Neither run presents the choice between saved guards and fresh generation as an intent question with a recommendation, and both state patches label the 19 March entries "misleading". In the R5 run's assessment those entries appear only under "Exploratory", and its state patch does not mention them.
