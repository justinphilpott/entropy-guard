# Questions for the steward

No steward was available for this run. Each question below would go to the steward one at a time. For each, I give the
answer I recommend, and the work continued on that recommendation. Work that depends on an answer is in
`patches/provisional.patch`, which is not to be applied until the question is answered. Finding ids (F1–F12) refer to
`assessment.md`. Four questions were asked, within the limit of five.

## Q1. Who may change INTENT.md: agents directly, or only you, from a proposal? (F2)

**The statements:**
- `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents — as our understanding deepens.
  When you update it, note the date and what prompted the revision."
- `INTENT.md:139`: "If you find something missing, imprecise, or worth expanding — add it."
- `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated note explaining
  what prompted the change."

**The readings:**
- **(a)** Any contributor, human or agent, may revise the direction of intent and note the date.
- **(b)** Agents may improve how the intent is expressed, but a change of direction needs your recorded decision.

**Where they diverge.** Take an agent that, while working on Backlog item `TODO.md:19` ("Consider additional
specialized tracks… code-first"), decides the repo should add a code-first track:
- Under (a), it rewrites INTENT.md's "Scope boundary and next validation loop" itself, with a dated note.
- Under (b), it records a proposal in DECISIONS.md, and INTENT.md stays as it is until you decide.

**Recommended: (b).** Agents record a proposed change in DECISIONS.md, marked as awaiting you, and INTENT.md changes
only after you record the decision there. The reasons:
- INTENT.md itself rates intent drift as "catastrophic to recover" (`INTENT.md:33`).
- On 2026-03-24 you agreed that the healthy move is "not autonomous overreach, but escalation"
  (`explorations/2026-03-24-entropy-immune-system-conversation.md:540-543`).
- No current file records who decides intent.

**Depends on the answer:**
- the provisional hunks to INTENT.md:3 and :139 and to AGENTS.md:27;
- installing `guard/SKILL.md`, whose intent-change rule replaces the guard:68 repair.

If you answer (a), record that decision in DECISIONS.md. The guard's rule then permits edits that cite it, so the guard
needs no change.

## Q2. What should the validation batch measure? (F5)

**The statements:**
- `DECISIONS.md:26`, "Farm broader…": "assess a larger set of open source projects… and track whether that produces more
  merged PRs."
- `INTENT.md:135`: "track whether this produces clearer session recovery, fewer reintroduced stale ideas, more coherent
  docs, and sharper feedback on what the methodology gets right or wrong".
- `README.md:125` and `TODO.md:12` agree with INTENT.md.

No decision entry settles which of the two wins.

**The readings:**
- **(a)** Merged PRs: what the target's maintainers accept.
- **(b)** Session-level coherence measures.

**Where they diverge.** A docs-first planning repo whose owner does not take outside PRs, such as a private design
repo, can be measured under (b) but yields nothing under (a). A repo where the suggested fixes merge, but sessions are
no clearer, scores well under (a) and poorly under (b).

**Recommended: track both for each assessed repo.** Record whether the maintainers merged the suggested changes, and
the measures INTENT.md lists. The reasons:
- You described merged changes as the original signal of value (`explorations/2026-03-19-autopoiesis.md:22`, "fixes…
  merged within minutes"; conversation:86).
- INTENT.md's measures are the ones the docs-first lifecycle is designed to move.

**Depends on the answer:** the provisional hunks to INTENT.md:135, README.md:125, TODO.md:12 and the note on the "Farm…"
entry in DECISIONS.md.

## Q3. Which skill owns guard writing? (F4)

**The statements:**
- Two skills each define what a generated guard holds, and neither refers to the other:
  - `skills/docs-first-planning-assessment/SKILL.md` Phase 2 (lines 132-202; its checklist areas are at 160-168);
  - `skills/session-coherence-skill-generator/SKILL.md` "Generated Skill Requirements" and its template (lines
    198-315).
- `INTENT.md:86-88`: "that role is carried by the assessment workflow rooted at `skills/entropy-assessment/` and… 
  `skills/docs-first-planning-assessment/`".
- `README.md:91` and `AGENTS.md:46` describe `session-coherence-skill-generator` as the skill that "generates
  repo-specific session handoff guards".

**The readings:**
- **(a)** `session-coherence-skill-generator` writes every guard, and the assessments supply it with checks.
- **(b)** docs-first Phase 2 writes guards for docs-first repos, and the generator covers young repos and the other
  shapes.
- **(c)** The generator's bootstrap mode moves into the assessments, and the generator is deleted.

**Where they diverge.** Take this repo's own guard:
- Under (a), it must gain the generator's modes and safety rules, plus docs-first's supersession check.
- Under (b), it stays a docs-first guard, without modes or safety rules.
- Under (c), the reference guard keeps its current shape, and `README.md` and `AGENTS.md` lose a skill.

Another repo assessed today through `entropy-assessment`'s fallback route (shapes B to D) gets "add a lightweight
general post-work guard" (Step 4d) from no skill at all under (b) or (c), unless one is named.

**Recommended: (a).** The reasons:
- It is the only reading that gives the fallback route a writer.
- It follows your own precedent in "Consolidate domain generators into single skill" (`DECISIONS.md:129-135`): one
  process, with domain knowledge as reference data, rather than parallel processes with overlapping scaffolding.

**Depends on the answer:** the provisional hunks to INTENT.md:88, README.md:52, `entropy-assessment` Step 4d and
docs-first Phase 2. Under (a), the deeper consolidation is follow-up work after your decision: one guard template
instead of two.

## Q4. Who is the steward? (F1)

**The statement.** No document names who decides what this project is for. `LICENSE:3` reads "Copyright (c) 2026
entropy-guard". DECISIONS.md entries name no author.

**The readings:**
- **(a)** Justin Philpott alone.
- **(b)** The contributors together, "humans and AI agents" (`INTENT.md:3`).

**Where they diverge.** Take a revision to INTENT.md drafted by a contributing agent:
- Under (a), it waits for Justin's recorded decision.
- Under (b), the contributors' agreement is enough.

The guard's "Steward" line, and where proposals are addressed, follow from the answer.

**Recommended: (a), Justin Philpott.** He owns the GitHub repository the feedback skill files issues on
(`skills/local/entropy-guard-feedback/SKILL.md:10,47`), and the explorations record him making the repo's scope
decisions (conversation:86, :713). Record it in AGENTS.md, as in the provisional patch, and replace "Steward:
unresolved" in `guard/SKILL.md`.
