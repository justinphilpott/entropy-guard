# Questions for the steward

Target: the entropy-guard snapshot `entropy-guard-447da9a` (read-only, no git history). Steward: Justin Philpott,
inferred from the repository owner `justinphilpott` (finding F1 in `assessment.md`); no file names a steward, so this
was not asked as a question. No steward was available, so each question carries the answer I recommend, and the
assessment continued on that recommendation only in drafts: every change that depends on an answer is in
`provisional-Q<n>.patch` and is not to be applied until the steward answers. Four questions, asked in this order.

---

## Q1. May a contributor revise INTENT.md directly, or only after your recorded decision?

**The statements.**
- `INTENT.md` line 3: "It is meant to be refined collaboratively — by humans and AI agents — as our understanding
  deepens. When you update it, note the date and what prompted the revision." Line 139: "If you find something
  missing, imprecise, or worth expanding — add it."
- `AGENTS.md` line 27: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `AGENTS.md` line 32: "Prefer updating the core knowledge docs (`README.md`, `INTENT.md`, ...) in the same change when
  behavior or methodology shifts."
- `skills/local/entropy-guard/SKILL.md` line 68: "if INTENT.md itself needs revision, update it with a dated note
  explaining what prompted the change."

**The readings.**
- (a) Line 3 is your standing authorisation: any contributor, including an agent, may revise INTENT.md in the same
  session, with a dated note.
- (b) Contributors propose; INTENT.md changes only after you record the decision in DECISIONS.md.

**Where they diverge, in this repo.** The session-coherence-skill-generator arrived on 2026-05-10. INTENT.md's "The
guard lifecycle" (line 88) still names only entropy-assessment and docs-first-planning-assessment as the guard
generator. Under (a), the session that added the generator could have rewritten line 88 to describe the generator as
the guard writer, settling Q2 without you. Under (b) it records a proposal, and line 88 waits.

**Recommended answer: (b).** INTENT.md calls itself the north star (line 3) and names intent drift as the entropy that
"is catastrophic to recover" (line 33). If the session doing the work may edit the statement its work is checked
against, nothing catches that drift. A correction that a recorded decision already settles stays direct under (b).

**What depends on it.** `provisional-Q1.patch`: INTENT.md lines 3 and 139, AGENTS.md lines 27 and 32, README.md's
summary of the guard, and the replacement of the local guard by `guard/SKILL.md`, whose copied intent-change rule
embodies (b). If you answer (a), record it in DECISIONS.md; that entry is then the recorded decision the guard's rule
(steps 4 and 5) refers to, and the guard's "Open" line comes out. The proposal is already recorded in DECISIONS.md by
`settled.patch`, marked as awaiting you.

---

## Q2. Which skill writes guards: docs-first-planning-assessment's Phase 2, or session-coherence-skill-generator?

**The statements.**
- `skills/docs-first-planning-assessment/SKILL.md`, "Phase 2: Guard Generation / Refinement" (lines 132-202); its
  Output (line 196): "the refined or generated guard".
- `skills/session-coherence-skill-generator/SKILL.md`, "Generated Skill Requirements" (lines 198-231), default path
  `skills/session-coherence-guard/SKILL.md`, with required sections (modes, mechanical checks, safety rules) that the
  docs-first Phase 2 does not ask for.
- `INTENT.md` line 88: the generator role "is carried by the assessment workflow rooted at `skills/entropy-assessment/`
  and, for the strongest validated case, `skills/docs-first-planning-assessment/`." It does not mention the
  session-coherence-skill-generator.
- `README.md` lines 50-58 say the docs-first assessment "continues into guard generation or refinement"; README line 91
  and AGENTS.md line 46 list the generator as generating "repo-specific session handoff guards".
- `skills/entropy-assessment/SKILL.md` (v0.6.0) Steps 3 and 4d never route to the generator. DECISIONS.md lines 7-11
  add its bootstrap mode and call it "the previous session-coherence-skill-generator"; no entry records adopting it.

**The readings.**
- (a) docs-first Phase 2 writes guards for docs-first repos; the generator serves other shapes and young repos.
- (b) The generator is the one guard writer; docs-first supplies its checks to it; entropy-assessment routes to it.
- (c) Both stay, as alternatives the user picks between.

**Where they diverge, in this repo.** A user following README lines 52-58 ("generate or refine the entropy guard" through
docs-first) gets a checklist guard "you place in the target project's skills directory". A user following AGENTS.md line 46 gets
`skills/session-coherence-guard/SKILL.md` with modes, commands and safety rules. Two differently shaped guards for the
same repo, and the README's claim that the local guard is "a reference example of generator output" (line 97) is true
for neither.

**Recommended answer: (b).** The generator already holds bootstrap mode (DECISIONS.md lines 7-11) and does not depend on
the repo's shape. TODO.md's Backlog (line 19) plans further specialised tracks (code-first, config); under (a) or (c)
each would grow its own guard writer and the guard shape would fork again.

**What depends on it.** `provisional-Q2.patch`: INTENT.md line 88, README.md lines 52, 89 and 91,
docs-first-planning-assessment Phase 2 and its Output, entropy-assessment Step 4d, guards-integrator line 20. The
proposal is recorded in DECISIONS.md by `settled.patch`, marked as awaiting you.

---

## Q3. Is "more merged PRs" still a measure of the validation loop?

**The statements.**
- `DECISIONS.md` line 26 ("Farm broader entropic-immunity exploration..."): "Set the next validation loop here to:
  assess a larger set of open source projects, generate or refine guards, run them locally while making targeted
  improvements, and track whether that produces more merged PRs."
- `INTENT.md` lines 129-135 (revised 2026-04-07), README.md line 125 and TODO.md lines 11-13: a batch of docs-first
  planning / architecture / blueprint repos, tracking "clearer session recovery, fewer reintroduced stale ideas, more
  coherent docs, and sharper feedback". No mention of merged PRs.
- The later decision "Specialize first around docs-first planning repos" (DECISIONS.md lines 15-19) settles the repo
  shape for the first validation wedge. It says nothing about the measure.

**The readings.**
- (a) Merged PRs remain the measure, so the batch must be open-source repos that accept PRs.
- (b) The session-quality measures replaced it, and any docs-first planning repo, private ones included, qualifies.

**Where they diverge.** Choosing the batch (TODO.md Next Up, first item). Under (a) a private architecture repo cannot
show a merged PR and does not count; under (b) it is a normal member and no PR tracking is needed.

**Recommended answer:** keep INTENT.md's session-quality measures for every repo in the batch, and track merged PRs as
well where the target is an open-source project. Reason: the batch named in TODO.md includes architecture and
blueprint repos, which are often private and have no upstream PR path, so merged PRs alone cannot measure them; but the
recorded decision asked for merged PRs, and dropping that is yours to decide.

**What depends on it.** `provisional-Q3.patch`: one line of INTENT.md (line 135).

---

## Q4. Which part of "Consolidate domain generators into single skill with domain appendices" did "Specialize first" supersede?

**The statements.**
- `DECISIONS.md` lines 129-135: "Fold all domain knowledge into the entropy-assessment skill as reference appendices
  (one per domain)", "All domain knowledge preserved as structured appendices", and line 131: "*Partially superseded by
  'Specialize first ...'*", without saying which part.
- DECISIONS.md line 50 added a workflow/process appendix.
- `skills/entropy-assessment/SKILL.md` v0.6.0 has no appendices, and no file in the repo holds them (searched for
  "appendi" across the snapshot on 2026-10-07: only DECISIONS.md and one LEARNINGS.md line mention them).

**The readings.**
- (a) The appendices were dropped on purpose when entropy-assessment became a router; code, test and API guidance waits
  for a code-first track (TODO.md Backlog line 19). Only "delete the four standalone domain generators" still stands.
- (b) Only the routing part was superseded, and the domain knowledge should still exist, in the fallback assessment or
  a reference file.

**Where they diverge.** TODO.md Backlog line 17: testing the front door against a multi-domain codebase. Under (a) the
agent gets only the lightweight fallback (entropy-assessment Step 4); under (b) it also gets the code, test and API
entropy vectors, inventory items and checklist guidance that DECISIONS.md line 135 says were "preserved".

**Recommended answer: (a), written down.** entropy-assessment's own "Notes on Scope" (lines 156-158) describes the skill
as "intentionally lighter" with code/test/API "currently less specialized", which matches (a) as built; restoring the
appendices would regrow the umbrella skill the Specialize decision set out to slim. What is missing is the record, not
the content.

**What depends on it.** `provisional-Q4.patch`: the supersession note at DECISIONS.md line 131.
