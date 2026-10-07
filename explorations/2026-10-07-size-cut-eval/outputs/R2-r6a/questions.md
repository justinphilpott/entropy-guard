# Questions for the steward

Target: the entropy-guard repository, snapshot `entropy-guard-447da9a`, assessed 2026-10-07.
Steward: Justin Philpott (evidence in `assessment.md`, finding F01).

No steward was available, so each question carries its recommended answer, and the run continued on that
recommendation. Every change that depends on an answer is in a provisional patch under `patches/`, not in the
settled patch, and none of them is applied. The questions are in the order I would ask them.

---

## Q1. One skill writes guards: which skill owns writing a guard?

**Statements and sources**
- `skills/docs-first-planning-assessment/SKILL.md` lines 132-202 ("Phase 2: Guard Generation / Refinement") design
  and deliver "the refined or generated guard" as one combined docs and workflow checklist.
- `skills/session-coherence-skill-generator/SKILL.md` lines 198-315 write a guard to its own required contents
  (front matter, mode behaviour, judgment checks, mechanical checks with exact commands, safety rules), with a default
  path of `skills/session-coherence-guard/SKILL.md`.
- Neither skill mentions the other. `skills/entropy-assessment/SKILL.md` line 68 routes docs-first repos only to the
  first. `INTENT.md` line 88 says the generator role "is carried by the assessment workflow rooted at
  `skills/entropy-assessment/` and ... `skills/docs-first-planning-assessment/`". `README.md` lines 89 and 91 describe
  both skills as producing guards.
- `DECISIONS.md` line 10 records adding bootstrap mode to the session-coherence skill, but no decision records adding
  the skill or how it relates to docs-first Phase 2 (findings F05, F06).

**Readings**
- (a) The docs-first skill writes guards for docs-first repos, and the session-coherence skill writes guards for
  everything else, including young repos.
- (b) One skill writes every guard. The other supplies checks to it.

**Where they diverge, in this repo:** this repository's own guard, `skills/local/entropy-guard/SKILL.md`. Under
docs-first Phase 2 it stays a nine-area checklist with rationale blocks. Under the session-coherence skill it is
updated in place to that skill's template, with sections for modes, judgment checks, mechanical checks and output.
Today an agent's choice of entry point decides which shape it gets.

**Recommended answer:** (b), with `session-coherence-skill-generator` as the writer and
`docs-first-planning-assessment` supplying its docs-first checks to it.
- **Why that skill:** it is the only one with a complete guard template and a bootstrap mode that decides when a guard
  is premature. That bootstrap mode is the subject of the most recent decision (`DECISIONS.md` line 7).
- **Why the docs-first skill keeps its checks:** its distinctive value is the analysis: the truth map, the
  current-state packet, and the supersession and brittle-automation checks (`DECISIONS.md` line 18). That analysis
  survives as input to the writer.
- **Why not (a):** two writers would keep two guard contracts for one concept.

**Waiting on it:** `patches/provisional-Q1-one-skill-writes-guards.patch`.

---

## Q2. Who changes intent: may agents revise `INTENT.md` themselves?

**Statements and sources**
- `INTENT.md` line 3: "It is meant to be refined collaboratively — by humans and AI agents — as our understanding
  deepens. When you update it, note the date and what prompted the revision."
- `AGENTS.md` line 27: "If a decision refines or challenges the intent, update INTENT.md and note why."
- The existing guard, `skills/local/entropy-guard/SKILL.md` line 68: "if INTENT.md itself needs revision, update it
  with a dated note explaining what prompted the change."
- None of the three is attributed to you. The last revision note on `INTENT.md` (line 5, 2026-04-07) does not say who
  decided it (findings F02, F03).

**Readings**
- (a) Line 3 is your standing authorisation: an agent whose work refines or challenges the intent may edit
  `INTENT.md` itself, with a dated note.
- (b) Line 3 invites contributions: agents propose intent changes, and `INTENT.md` changes only once you have recorded
  the decision.

**Where they diverge, in this repo:** `INTENT.md` line 88 names the generator without mentioning
`session-coherence-skill-generator` (Q1). Under (a), the next agent that touches that skill rewrites line 88 to suit
its own reading of Q1. Under (b), it records a proposal in `DECISIONS.md` and line 88 waits for your answer.

**Recommended answer:** (b).
- **What is at stake:** `INTENT.md` is "the north star for the meta-skill and all guard design" (`AGENTS.md` line
  38), and the repo's own text says intent entropy "is catastrophic to recover" (`INTENT.md` line 33).
- **Why (a) fails here:** no document names a steward, and decisions are unattributed. An agent's edit under (a) is
  indistinguishable from an approved change, which is the drift this project exists to catch.
- **Consistency:** every guard the current entropy-guard generator writes carries a rule that says (b), so (a) would
  also put this repo's guard at odds with its own product.

**Waiting on it:** `patches/provisional-Q2-who-changes-intent.patch`, and `patches/provisional-guard-update.patch`
(the updated guard carries rule (b)).

---

## Q3. Validation measure: what does the external validation measure?

**Statements and sources**
- `DECISIONS.md` line 26 ("Farm broader entropic-immunity exploration…"): "assess a larger set of open source
  projects, generate or refine guards, run them locally while making targeted improvements, and track whether that
  produces more merged PRs."
- `INTENT.md` lines 129-135 (revised 2026-04-07): docs-first planning repos, tracking "clearer session recovery, fewer
  reintroduced stale ideas, more coherent docs, and sharper feedback on what the methodology gets right or wrong".
- `README.md` line 125: "clearer sessions, fewer reintroduced stale ideas, and more useful changes in the wild".
- `TODO.md` line 12: "track what changes prove useful" (finding F11).

The set of repos is not in conflict: docs-first planning repos can be open-source projects. Only the measure differs.

**Readings**
- (a) Merged PRs is the measure.
- (b) `INTENT.md`'s outcomes are the measure.
- (c) Both are measures.

**Where they diverge, in this repo:** the first validation batch (`TODO.md` "Next Up"). Under (a), a private
planning repo where no PR is ever opened yields no result. Under (b), every repo yields session-recovery and
stale-idea observations, and PRs are not counted.

**Recommended answer:** (b), with `README.md` linking to `INTENT.md` instead of restating the loop.
- **Why:** `INTENT.md` is the later, dated statement and the declared north star.
- **What a PR count misses:** the docs-first wedge's stated benefits, session recovery and fewer revived stale ideas,
  are not things a PR count measures.

If you want merged PRs kept as one signal, answer (c) and the patch adds it to `INTENT.md`'s list instead.

**Waiting on it:** `patches/provisional-Q3-validation-measure.patch`.

---

## Q4. Packet location: where does the docs-first current-state packet live in an assessed repo?

**Statements and sources**
- `skills/docs-first-planning-assessment/SKILL.md` line 116: "Also produce a **current-state packet** for the next
  fresh session." Nothing says where it is kept.
- `README.md` line 40 and `INTENT.md` line 73 list the packet as an output.
- The same skill's own risk list names "Registry/catalog duplication drift" (line 88), where one status is kept in
  several files (finding F13).

**Readings**
- (a) The packet is a separate document in the assessed repo.
- (b) The packet is written into the assessed repo's existing state file, such as its `TODO.md`, and a new file is
  created only when there is none.

**Where they diverge, in this repo:** this repo already keeps live state in `TODO.md` (`AGENTS.md` line 22). Under
(a), an assessment adds a second state document beside `TODO.md`, and the two drift apart. Under (b), the packet
becomes the `TODO.md` "Current state" section added by this run's settled patch.

**Recommended answer:** (b).
- **Why:** it keeps one owner for current state, which the skill's own duplication-drift risk asks for.
- **What it changes:** where the packet lives, not whether there is one. `INTENT.md` line 73 needs no change.

**Waiting on it:** `patches/provisional-Q4-packet-location.patch`.

---

## Q5. Guard snapshot: does a guard carry a snapshot of the system?

**Statements and sources**
- `INTENT.md` line 94: the guard evaluator is "aided by the versioning metadata (generated date, system snapshot) that
  each guard carries."
- The existing guard, lines 18-22, carries "System snapshot: documentation-as-system repo with 4 exportable skills, 2
  local skills, ...".
- The guard template in `skills/session-coherence-skill-generator/SKILL.md` lines 274-280 carries only `generated` and
  `source`.
- The current entropy-guard generator, which wrote the updated guard, forbids copying current state into a guard
  (finding F22).

**Readings**
- (a) Every guard carries a description of the system as it was when the guard was generated.
- (b) A guard carries its generated date and source, and points at the state file for the system's current state.

**Where they diverge, in this repo:** adding a fifth exportable skill. Under (a), the local guard's snapshot must be
edited, and stays wrong until someone does. The old guard's state-like claims have already drifted: it says "20+
markdown files" where there are 17, and refers to a "Key Documents table" that `README.md` does not have (F14). Under
(b), nothing in the guard changes, and `TODO.md` "Current state" holds the stage.

**Recommended answer:** (b).
- **What (a) costs:** snapshot claims go stale at the rate the system changes.
- **Who would use a snapshot:** the evaluator that would read one is still future work (`INTENT.md` line 86).
- **Why (b) is enough:** a generated date plus the generator's version is enough to find a guard older than its
  generator.

**Waiting on it:** `patches/provisional-Q5-guard-snapshot.patch`, and `patches/provisional-guard-update.patch`.
