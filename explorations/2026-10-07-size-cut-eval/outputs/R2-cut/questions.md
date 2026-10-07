# Questions for the steward

The steward, Justin Philpott, was not available. Each question below has the answer I recommend, and the run carried
on using that recommendation. Work that depends on an answer was drafted as provisional, and none of it is installed.
Each question is also recorded as a "Proposed" entry, awaiting Justin, at the top of `DECISIONS.md` in
`patches/DECISIONS.md.patch`.

## Q1. Who may revise `INTENT.md`? (finding F3)

**Statement and source.** `INTENT.md`:3 says the document "is meant to be refined collaboratively — by humans and AI
agents… When you update it, note the date and what prompted the revision". `AGENTS.md`:27 says "If a decision refines
or challenges the intent, update INTENT.md and note why." Neither statement is attributed. The last revision
(`INTENT.md`:5, 2026-04-07) records no author.

**The readings:**

- **(a)** Any contributor, an agent included, revises `INTENT.md` directly when their own work refines or challenges
  it, and adds a dated note.
- **(b)** A contributor proposes the change, and `INTENT.md` is revised only after Justin has recorded a decision,
  which the revision note then cites.

**Where they diverge, in this repo.** An agent working on the Backlog item "Consider additional specialized tracks
(code-first…)" concludes that code-first should come next, and rewrites `INTENT.md`:129, "The first validation wedge
should be… docs-first planning systems".

- Under (a), the edit is allowed with a dated note.
- Under (b), the agent records a proposal in `DECISIONS.md`, and `INTENT.md` stays as it is until Justin decides.

**Recommended answer: (b).** There are two reasons:

- An unattributed revision cannot be told apart from drift. This assessment could not tell who approved the 2026-04-07
  specialisation.
- Your own recorded words treat questioning intent as a rare step that signals upward for input, not something done
  silently. See "the 'question intent' signal is actually rare" (conversation 2026-03-24:543), and "a need to signal for
  input" (:292).

**What depends on it.** The Intent section of `guard/SKILL.md` carries the intent-change rule, which takes reading (b).
That section is marked provisional. If you choose (a), rule 4 of the copied rule would be dropped or reworded to match.

## Q2. Which skill writes guards? (finding F4)

**Statement and source.** Two exported skills write guards to different contracts:

- `skills/docs-first-planning-assessment/SKILL.md` Phase 2 (:132-202) writes a docs + workflow "delta guard" in the
  repo's existing guard location;
- `skills/session-coherence-skill-generator/SKILL.md` (:198-315) writes a "session-coherence guard" at
  `skills/session-coherence-guard/SKILL.md`, with modes, mechanical commands and operational-state checks.

The front door, `skills/entropy-assessment/SKILL.md`, never routes to the generator. `INTENT.md`:88 names only the
assessment skills as the guard generator. No entry in `DECISIONS.md` records why the generator was added: the entry at
:7-11 already calls it "the previous `session-coherence-skill-generator`".

**The readings:**

- **(a)** One writer: `session-coherence-skill-generator`. `docs-first-planning-assessment` supplies its checks to it.
- **(b)** Two writers, split by repo shape: docs-first repos go through `docs-first-planning-assessment` Phase 2;
  other repos and young repos go through the generator.
- **(c)** One writer: `docs-first-planning-assessment` and the front door. The generator is reduced to its bootstrap
  mode for young repos.

**Where they diverge, in this repo.** Refining this repo's own guard, `skills/local/entropy-guard/SKILL.md`, gives a
different result under each reading:

- under (c), it stays a checklist in place;
- under (a), it takes the generator's contract and gains source pointers, a "what changed" block and commands;
- under (b), a user who follows the README's third prompt gets one shape, while a user who runs the generator gets a
  second guard at a second path.

**Recommended answer: (a).** There are three reasons:

- It follows "Consolidate domain generators into single skill" (`DECISIONS.md`:129-135): one process rather than
  parallel scaffolding.
- It follows "Guard creation skills over guard libraries": the meta-skill is the product.
- The generator already covers young repos (`DECISIONS.md`:7-11), which the docs-first path does not.

Disclosure: this run used a later version of entropy-guard's skills, which is built this way. That is a reason to check
this recommendation independently, not a reason to accept it.

**What depends on it.** These depend on the answer, and are left open until it is given:

- the wording of `skills/guards-integrator/SKILL.md`:20 (cleanup item 6 in `assessment.md`);
- `INTENT.md`:88;
- `README.md` "How to use this repo";
- whether check 3 of the guard stays.

## Q3. What does the validation batch measure, and where are its results recorded? (finding F10)

**Statement and source.** The two sources disagree:

- `DECISIONS.md`:26 says: "assess a larger set of open source projects… and track whether that produces more merged
  PRs."
- `INTENT.md`:129-135 (revised 2026-04-07), `README.md`:125 and `TODO.md`:12 say docs-first planning repos, tracking
  "clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and sharper feedback". Neither names a
  place to record results.

No entry records the change of measure.

**The readings:**

- **(a)** Merged pull requests on open-source repos.
- **(b)** The session-quality measures in `INTENT.md`, on docs-first planning repos.
- **(c)** Both measures, on docs-first planning repos.

**Where they diverge, in this repo's next phase.** The two kinds of run fall on opposite sides:

- A private docs-first planning repo that you own produces no pull requests. It counts under (b) and records nothing
  under (a).
- An open-source, code-heavy repo where a suggested fix is merged counts under (a). It falls outside the docs-first
  wedge in (b).

**Recommended answer: (c).** Run on docs-first planning repos, as "Specialize first" sets. For each run, record whether
the suggested changes were merged, and the `INTENT.md` measures. Write one line per run under the `TODO.md` Next Up item
while the batch runs, and move patterns to `LEARNINGS.md`.

The reason: the merged outcome is your own recorded evidence that the method works. You described guards that
"1-shot suggested extremely well targetted fixes… merged within minutes" (`explorations/2026-03-19-autopoiesis.md`:22),
and changes "merged within a short space of time" (conversation 2026-03-24:86). The `INTENT.md` measures are what the
docs-first lifecycle is designed to change.

**What depends on it.** What the batch records, which is the Next Up item at `TODO.md`:12, and the "Next actions"
line of the new "Current state" section.
