# Questions for the steward

Target: entropy-guard snapshot `entropy-guard-447da9a` (read-only, no `.git`). Assessed 2026-10-07.

Steward: Justin Philpott. Nothing in the target names a steward (finding F1); he is inferred from the repository slug
`justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md:10,47`) and from the conversations
where he sets the repo's scope (`explorations/2026-03-24-entropy-immune-system-conversation.md:86,713`).

No steward was available. Each question is recorded with the answer I recommend, and I continued on that
recommendation only as far as the rules allow: everything that depends on an answer is drafted in
`patches/provisional-q<n>.diff`, not applied. Each question is also recorded in the target's `DECISIONS.md` as a
proposal awaiting him (`patches/settled.diff`). Three questions, asked one at a time if he is present, in this order.

---

## Q1. Which skill writes and amends guards? (finding F5)

**The statements and their sources.**
- `skills/docs-first-planning-assessment/SKILL.md:132-202`: Phase 2 "Guard Generation / Refinement" writes the guard:
  canonical ownership, supersession and guard-induced-entropy checks, one combined docs + workflow guard.
- `skills/session-coherence-skill-generator/SKILL.md:198-315`: "Generated Skill Requirements" and a template: modes,
  mechanical commands, safety rules, default path `skills/session-coherence-guard/SKILL.md`; bootstrap mode for young
  repos (`:78-130`).
- `INTENT.md:88` gives the "Guard generator" role to the assessment workflow only. `README.md:21-66` ("How to use this
  repo") never routes to `session-coherence-skill-generator`. `skills/entropy-assessment/SKILL.md:122` recommends "a
  lightweight general post-work guard" without naming a writer. No `DECISIONS.md` entry records adopting the generator;
  the newest entry (`DECISIONS.md:7-11`) adds a bootstrap mode to "the previous session-coherence-skill-generator".

**The readings.**
- (a) Split by shape: `docs-first-planning-assessment` writes guards for docs-first repos, the generator for all other
  shapes.
- (b) One writer: the generator writes every guard; the assessment skills supply its inputs.

**Where they diverge, in this repo.** This repo's own guard (`skills/local/entropy-guard/SKILL.md`). Under (a) it is
written by docs-first Step 7: no modes, no safety rules, no commands section, a rationale under each check. Under (b)
it is written to the generator's template, with the docs-first checks as inputs. A young docs-first repo diverges
too: under (a) it gets a guard from a skill with no bootstrap mode; under (b) the generator's bootstrap mode applies.

**Recommended answer: (b).** The generator writes and amends every guard. `docs-first-planning-assessment` keeps its
analysis and hands its Step 7 checks and Step 8 depth advice to the generator; `entropy-assessment`'s other routes hand
to it too. Reason: it is the only writer not limited to one shape, the only one with a bootstrap mode and an
update-in-place rule, and one process fed by domain inputs is the reasoning of the repo's own "Consolidate domain
generators into single skill" decision (`DECISIONS.md:129-135`).

**What depends on it:** `patches/provisional-q1.diff` (INTENT.md "The guard lifecycle", README.md "How to use" and
skills table, AGENTS.md "Key Files", `entropy-assessment` Step 4d, `docs-first-planning-assessment` Phase 2 and output,
the generator's opening paragraph).

---

## Q2. May contributors, including agents, revise INTENT.md themselves? (finding F2)

**The statements and their sources.**
- `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents — as our understanding deepens.
  When you update it, note the date and what prompted the revision." `INTENT.md:139`: "add it".
- `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
- The old local guard, `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a
  dated note explaining what prompted the change."
- None of these is attributed or dated, so nothing shows whether Justin authorised agents to change the intent.

**The readings.**
- (a) These lines are his standing permission: any contributor may revise `INTENT.md` with a dated note.
- (b) They invite contributions, but a change of intent needs his recorded decision first.

**Where they diverge, in this repo.** An agent editing a skill finds the "2–10 minutes" burden in `INTENT.md`
"Guiding principles" (`:116`) too tight. Under (a) it rewrites the principle with a dated note, and the next guard run
checks the skills against the rewritten principle and passes. Under (b) the change is a `DECISIONS.md` proposal, and
`INTENT.md:116` stays until Justin decides.

**Recommended answer: (b).** Contributors record proposed intent changes in `DECISIONS.md`, marked as awaiting him;
`INTENT.md`, `README.md` "Project status" and `AGENTS.md` "Project Constraints" change only after his recorded decision.
Reason: `INTENT.md:33` calls intent entropy "catastrophic to recover" and `INTENT.md:51` puts continuity of intent
first among what a guard preserves; while any session may rewrite the reference, a guard cannot tell drift from an
approved change.

**What depends on it:** `patches/provisional-q2.diff` (INTENT.md opening and closing notes, AGENTS.md "Consult
INTENT.md...", and removal of the "Open, awaiting Justin Philpott" paragraph from the guard's Intent section). Until
then the rewritten guard keeps today's rule for `INTENT.md` edits and lists each such edit for his review.

---

## Q3. Which projects does the next validation batch use, and what does it track? (finding F4)

**The statements and their sources.**
- `DECISIONS.md:26` ("Farm broader entropic-immunity exploration..."): "assess a larger set of open source projects,
  generate or refine guards, run them locally while making targeted improvements, and track whether that produces
  more merged PRs."
- `INTENT.md:129-135` (revised 2026-04-07), `README.md:125`, `TODO.md:11-13`: docs-first planning / architecture /
  blueprint repos; track "clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and sharper
  feedback". No merged-PR measure, and no decision records the change.
- `DECISIONS.md:15-19` ("Specialize first around docs-first planning repos") narrows the strongest path, but names
  neither the batch nor its measure.
- Justin's words: "merged within minutes" (`explorations/2026-03-19-autopoiesis.md:22`); "suggest changes which then
  get merged within a short space of time" (`explorations/2026-03-24-entropy-immune-system-conversation.md:86`).

**The readings.**
- (a) The decision stands: open source projects, judged by merged PRs.
- (b) `INTENT.md` stands: docs-first planning repos, judged by session recovery and doc coherence.

**Where they diverge, in this repo.** Choosing the first batch (`TODO.md` "Next Up", item 1). A private docs-first
planning repo with no pull-request flow qualifies under (b) but produces no evidence under (a); a busy open source
code repo qualifies under (a) but is outside the docs-first wedge of (b). `TODO.md:12`'s "track what changes prove
useful" does not say which measure to record.

**Recommended answer:** docs-first planning repos, preferring ones that accept outside changes, tracking how many of
the resulting changes are merged as well as the session-recovery measures. Reason: his own recorded words cite merged
changes as the evidence the method works, and the docs-first narrowing follows the later "Specialize first" decision.

**What depends on it:** `patches/provisional-q3.diff` (INTENT.md:131,135, README.md:125, TODO.md "Next Up" item 2).
