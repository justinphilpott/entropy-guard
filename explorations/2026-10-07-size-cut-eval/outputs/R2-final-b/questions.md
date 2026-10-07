# Questions for the steward

Target: the entropy-guard snapshot at commit 447da9a. Asked 2026-10-07. No steward was available, so each question
carries the answer I recommend, and the run continued on it. Work that depends on an answer was drafted as
provisional and not installed. The same three questions are recorded in the target as proposals P1 to P3 at the top
of DECISIONS.md (in `target.patch`). Findings (F-ids) are in `assessment.md`.

The steward is taken to be Justin Philpott, owner of github.com/justinphilpott/entropy-guard. No document says so
(F3); Q1 asks him to confirm it in passing.

---

## Q1. Who may change INTENT.md and the other intent documents?

**The statements.**
- INTENT.md line 3: "It is meant to be refined collaboratively — by humans and AI agents — as our understanding
  deepens. When you update it, note the date and what prompted the revision." Line 139 says the same.
- AGENTS.md line 27: "If a decision refines or challenges the intent, update INTENT.md and note why."
- The local guard, `skills/local/entropy-guard/SKILL.md` line 68: "if INTENT.md itself needs revision, update it
  with a dated note explaining what prompted the change."
- No document names who owns the project's direction (F3).

**The readings.**
- (a) Any contributor, including an agent in a working session, may revise INTENT.md directly, with a dated note.
- (b) Contributors draft intent changes as proposals in DECISIONS.md. INTENT.md changes only after Justin Philpott
  records the decision.

**Where they diverge.** During the validation batch, an agent concludes that code-first repos should join the scope.
Under (a) it rewrites INTENT.md "Scope boundary and next validation loop" in the same commit. Under (b) it adds a
proposal to DECISIONS.md, and INTENT.md stays as it is until you decide.

**Recommended: (b), and name yourself as owner in INTENT.md's header.**
- INTENT.md is the reference every guard check measures drift against: AGENTS.md line 38 calls it the "north star
  for the meta-skill and all guard design".
- INTENT.md line 33 says intent entropy "is catastrophic to recover". A reference that a session can edit to match
  its own work cannot catch that session's drift.
- The repo's earlier scope changes already came through DECISIONS.md first ("Farm broader…", "Specialize first…"),
  with INTENT.md's revision note following (line 5).
- "Humans and AI agents both contribute" (INTENT.md line 117) still holds under (b): they contribute proposals.

**Waiting on it.** The Intent section of the new guard (`guard/SKILL.md`) is provisional on this answer. The wording
of AGENTS.md line 27 and INTENT.md lines 3 and 139 is left unchanged by every patch.

---

## Q2. What counts as success for the next validation round?

**The statements.**
- DECISIONS.md line 26, "Farm broader entropic-immunity exploration into a sibling repo": "assess a larger set of
  open source projects, generate or refine guards, run them locally while making targeted improvements, and track
  whether that produces more merged PRs."
- INTENT.md lines 129–135: "select a larger batch of docs-first planning / architecture / blueprint repos … track
  whether this produces clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and sharper
  feedback on what the methodology gets right or wrong".
- README.md line 125 ends "…more useful changes in the wild". TODO.md lines 11–13 hold the docs-first batch and
  "track what changes prove useful".
- No decision entry settles which measure applies. "Specialize first…" changed which skills exist, not the measure.

**The readings.**
- (a) Success is merged PRs in other people's open source repos.
- (b) Success is session quality in repos where the guards run, whoever owns them.
- (c) Both.

**Where they diverge.** One of your own private docs-first planning repos. Under (a) it cannot count, as there is no
outside PR to merge. Under (b) it is a prime candidate. The other way round: an open source docs repo that merges a
guard-driven fix, but where nobody runs repeated sessions, counts under (a) and not under (b).

**Recommended: (c), on docs-first planning repos first, recorded as a new DECISIONS.md entry that names "Farm…" as
partly superseded.**
- Your own recorded words treat fast-merged fixes as the sign the method works: "1-shot suggested extremely well
  targetted fixes … merged within minutes" (explorations/2026-03-19-autopoiesis.md line 22) and "suggest changes
  which then get merged within a short space of time" (explorations/2026-03-24-entropy-immune-system-conversation.md
  line 86).
- The session measures are what the docs-first lifecycle, including the current-state packet, is built to improve.
  Neither measure replaces the other.

**Waiting on it.** Which repos the batch in TODO.md "Next Up" takes, and what it records for each.

---

## Q3. Which skill writes guards?

**The statements.**
- `skills/docs-first-planning-assessment/SKILL.md` lines 132–202, "Phase 2: Guard Generation / Refinement", define a
  guard through the checklist areas of Step 7.
- `skills/session-coherence-skill-generator/SKILL.md` lines 198–315 define a guard differently: "Generated Skill
  Requirements" and a template requiring modes, mechanical commands, safety rules and a statement of current
  direction.
- INTENT.md lines 86–88 give the generator role to `entropy-assessment` and `docs-first-planning-assessment` only.
- No skill routes to `session-coherence-skill-generator`. Only README.md line 91, AGENTS.md line 46 and DECISIONS.md
  lines 7–11 mention it. DECISIONS.md lines 7–11 extend it, but no entry records adopting it.

**The readings.**
- (a) Two writers, by repo kind: docs-first Phase 2 for docs-first repos, and the session-coherence generator for
  code repos and young repos.
- (b) One writer, `session-coherence-skill-generator`, with `docs-first-planning-assessment` handing it the
  docs-first checks.
- (c) One writer, docs-first Phase 2 together with `entropy-assessment`'s fallback, with the session-coherence
  generator kept only for bootstrap mode, or retired.

**Where they diverge.** This repo's own guard, which README.md line 97 calls the "reference example of generator
output". Under (a) or (c) it follows docs-first Step 7 and stays a narrative checklist. Under (b) it must also carry
the generator's modes, exact commands and safety rules. In an assessed docs-first repo, (a) can produce two guards of
different shapes, depending on which skill the agent happened to reach.

**Recommended: (b).**
- The repo has twice chosen one generator over several: "Guard creation skills over guard libraries" ("Invest
  primarily in the guard creation skill"), and "Consolidate domain generators into single skill" ("One file to read
  instead of five").
- The newest decision (DECISIONS.md lines 7–11) invested in the session-coherence generator.
- One canonical home per concept is the repo's own consistency rule (INTENT.md line 52; local guard line 87).

**Waiting on it.**
- The wording of `guards-integrator` lines 20 and 227 (F11).
- INTENT.md "The guard lifecycle" and README.md line 52 (F1).
- Removing the FlowBook residue (F2).

The new guard covers the required content of both existing guard definitions, so it does not depend on this answer
(see `assessment.md`, "Guard generation").
