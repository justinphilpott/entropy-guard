# Questions for the steward

There are four, below the intent pass's limit of five. Each one is asked because the evidence cannot settle it and the
answer changes what gets built or what the guard checks. No steward was available, so each carries the answer I
recommend, and the work continued on that recommendation as **provisional**. Nothing that depends on these answers is
installed or enforced. Findings (F) are in `assessment.md`.

---

## Q1. Who is the steward, the person who decides what this repository is for?

- **The statement and its source.** No file says. `LICENSE:3` names "entropy-guard". All 17 `DECISIONS.md` entries
  and the `INTENT.md` revision note are unattributed (F1).
- **The readings:**
  - (a) the repository owner decides alone;
  - (b) contributors decide collectively, as `INTENT.md:3`'s "refined collaboratively — by humans and AI agents"
    could be read.
- **Where they diverge here.** Take an agent session that narrows "What a guard should NOT be" in `INTENT.md`. Under
  (a), it records a proposal and waits. Under (b), its own edit with a dated note is the decision.
- **What it changes.** Whom the guard's intent-change rule names, and who answers Q2 to Q4.
- **Recommended answer: Justin Philpott.** The repository is `github.com/justinphilpott/entropy-guard` (feedback skill
  `:10`, `:46-47`), it was scaffolded from his `seed` (`AGENTS.md:68`), and he sets the direction in every exploration
  transcript. Record it in `INTENT.md`'s header and as a dated `DECISIONS.md` entry.

## Q2. May a session edit `INTENT.md` when its work refines or challenges the intent?

- **The statement and its source.**
  - `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents… When you update it, note the
    date."
  - `INTENT.md:139`: "If you find something missing… — add it."
  - `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
  - The current guard `:68` says the same.

  These conflict with the intent-change rule that every generated guard carries: "Do not edit `INTENT.md` to match the
  work unless the steward has recorded that decision" (F2).
- **The readings:**
  - (a) the sentences are standing permission, and any session may revise intent;
  - (b) sessions propose, and the steward decides.
- **Where they diverge here.** This repo's own `README.md:23` says code, test and API use is "less validated". Suppose
  a session adds a code-first track. Under (a), it also edits `INTENT.md:129` to make code-first validation part of
  the next step. Under (b), it writes a proposal in `DECISIONS.md`, and `INTENT.md` keeps docs-first as the wedge until
  the steward decides.
- **What it changes.** The guard's Intent section, and the wording in `INTENT.md:3`, `INTENT.md:139` and
  `AGENTS.md:27` (all in `patches/provisional.patch`).
- **Recommended answer: (b).** `INTENT.md:33` itself rates intent entropy as "catastrophic to recover". Letting the
  session doing the work rewrite the standard it is judged by is the drift path this project exists to stop. Recorded
  as a proposal in `DECISIONS.md` (settled patch).

## Q3. Which skill writes guards: `docs-first-planning-assessment` Phase 2 or `session-coherence-skill-generator`?

- **The statement and its source.**
  - `docs-first-planning-assessment/SKILL.md:132-202` drafts a "docs-first delta guard" from its own checklist areas.
  - `session-coherence-skill-generator/SKILL.md:198-315` writes guards to a different template, with modes,
    mechanical checks and bootstrap.
  - `DECISIONS.md:18` backs the first. `DECISIONS.md:10` extends the second.
  - `INTENT.md:88` names only the assessment workflow.
  - No other skill routes to the generator (F4, F5).
- **The readings:**
  - (a) one writer, which is the generator;
  - (b) one writer, which is docs-first Phase 2;
  - (c) both, split by repo shape.
- **Where they diverge here.** Regenerating this repo's own guard. Under (a), it gets modes, a baseline and commands,
  as in `guard/SKILL.md`. Under (b), it gets docs-first Step 7's seven checklist areas and no modes or baseline. Under
  (c), whichever skill an agent happens to start from decides the guard's shape.
- **What it changes.** Which skill is consolidated into which, the front door's routing for young repos, and
  `INTENT.md` "The guard lifecycle".
- **Recommended answer: (a).** The generator is the newest recorded investment (`DECISIONS.md:10`; metadata
  2026-05-11). It holds the fuller contract. `DECISIONS.md:129-135` ("Consolidate…") already chose one process
  scaffold over duplicated ones. Under (a), docs-first keeps its analysis and hands its checks to the generator.
  Recorded as a proposal in `DECISIONS.md` (settled patch). No consolidation patch is drafted until this is answered.

## Q4. What does the external validation batch measure?

- **The statement and its source.**
  - `DECISIONS.md:26`: "assess a larger set of open source projects… and track whether that produces more merged PRs".
  - `INTENT.md:131-135` and `README.md:125`: docs-first planning repos, tracking "clearer session recovery, fewer
    reintroduced stale ideas, more coherent docs, and sharper feedback" (F7).
- **The readings:**
  - (a) the merged-PR count is the measure;
  - (b) INTENT's session measures are the measure.
- **Where they diverge here.** Take `TODO.md` Next Up item 2, "track what changes prove useful", for a private,
  single-author docs-first planning repo. Under (a), there are no pull requests to count, so the run records nothing.
  Under (b), it records whether a fresh session started from the current-state packet without reviving superseded
  ideas.
- **What it changes.** What the validation batch records, and `README.md` "Project status" (provisional patch).
- **Recommended answer: (b).** Record merged PRs as well, only for assessed repos that take pull requests. The later
  docs-first decision (`DECISIONS.md:18`) chose repos where PR counts often do not exist, so (a) alone cannot measure
  the chosen wedge. Recorded as a proposal in `DECISIONS.md` (settled patch).
