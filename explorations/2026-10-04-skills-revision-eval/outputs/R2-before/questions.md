# Questions for the steward

No steward was available during this run, so each question carries the answer I recommend. The rest of this run went ahead on those recommendations. The questions are in order of what blocks the validation batch first.

## Q1. How should the two guard generators divide the work?

**The question.** `skills/docs-first-planning-assessment/SKILL.md` Phase 2 and `skills/session-coherence-skill-generator/SKILL.md` both produce a guard that runs at session end. The second one covers TODO state, decisions, learnings and workflow docs, which is the same ground as the first. Neither skill mentions the other, `entropy-assessment` Step 3 never routes to the session-coherence generator, and the guard lifecycle in `INTENT.md` (line 88) does not include it. Which repositories should each generator serve?

**Recommended answer.** Keep both, and record one `DECISIONS.md` entry dividing the work:

- `docs-first-planning-assessment` serves docs-first planning repositories (shape A).
- `session-coherence-skill-generator` serves two kinds of repository:
  - young repositories, through its bootstrap mode, at any shape;
  - mixed or code-first repositories (shapes B and C) that want a session handoff guard, because the lightweight fallback in the front door has no generator of its own.

Then make three edits:

- Add those two routes to `entropy-assessment` Steps 3 and 4d.
- Name the session-coherence generator in the generator line of `INTENT.md`.
- Fix `guards-integrator` lines 20 and 227.

Also remove or explain the FlowBook references at lines 22 and 193 of the session-coherence generator.

**Why it matters.** The validation batch sends every repository through the front door. Without this decision, users outside the project will get two overlapping guards, or will pick one generator arbitrarily.

## Q2. Are the four `explorations/` documents now historical copies?

**The question.** The `DECISIONS.md` entry "Farm broader…" (line 23) says the sibling repository `entropy-immune-system` was seeded with the exploration documents. Does that repository now hold the canonical copies, so that the 4 files here (1,467 lines, two of them `status: draft`) are historical?

**Recommended answer.** Yes, treat them as historical:

- Add one status line to the top of each file saying it is a historical seed copy and that the canonical home is `entropy-immune-system`.
- List `explorations/` as historical in the `README.md` "What's here" tables and the `AGENTS.md` Key Files list.
- Do not delete the files yet. `PHILOSOPHY.md` line 45 and `LEARNINGS.md` line 122 link to them.

**Why I am asking.** The rules of this run did not let me read the sibling repository, so I could not confirm that the copies exist there.

## Q3. Should the three theory entries leave `LEARNINGS.md`?

**The question.** Three entries in `LEARNINGS.md` are validated only by the 2026-03-19 conversation:

- "Just-in-time guard generation…" at line 117;
- "The four-component temporal hierarchy…" at line 127;
- "Most current guards operate at the wrong layer…" at line 137.

All three restate `PHILOSOPHY.md` lines 73-116. They also conflict with the decision "LEARNINGS.md stays tactical". Should they be removed?

**Recommended answer.** Yes, remove them from `LEARNINGS.md`. `PHILOSOPHY.md` already holds the same content, and the sibling repository owns the inquiry. The just-in-time entry also contradicts current practice ("no persistent guard artifact"), so leaving it among the validated learnings misleads a fresh session.

## Q4. Which measure of validation success is current?

**The question.** The `DECISIONS.md` entry "Farm broader…" (line 26) says to assess "a larger set of open source projects" and "track whether that produces more merged PRs". `INTENT.md` (lines 122-135) and the "Project status" section of `README.md` say to use docs-first planning repositories and to track "clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and sharper feedback". Which of these is current?

**Recommended answer.** `INTENT.md` is canonical. Mark that sentence in `DECISIONS.md` as partially superseded by the decision "Specialize first…". If merged pull requests in the target repositories are still a signal you want, add it to the list in `INTENT.md` rather than leaving it only in the decision log.

## Q5. Where should the results of the validation batch be recorded?

**The question.** `TODO.md`, `INTENT.md` and `README.md` all say the next phase will track what proves useful across a batch of external repositories. No file or convention says where the result for each repository goes. Where should it go?

**Recommended answer.** A new root file, `VALIDATION.md`, with one dated entry per assessed repository. Each entry records:

- the repository, or its shape if it must stay anonymous;
- the route taken through the skills;
- which outputs were produced (assessment, packet, guard, integration);
- which outputs were actually used afterwards;
- what misfired;
- the numbers of any feedback issues filed.

The other option is GitHub issues only. Those hold feedback about the skills, not results, so they would scatter the evidence.

**Why I am asking.** This is a new kind of file, and where new kinds of thing live is your decision.

## Q6. Where should the current-state packet live?

**The question.** The docs-first skill requires a current-state packet, and this repository has none. Where should `current-state-packet.md` be placed?

**Recommended answer.** At `CURRENT_STATE.md` in the repository root. That follows the existing names (`TODO.md`, `DECISIONS.md`, `LEARNINGS.md`, `INTENT.md`). Make it the first Quick Link in `AGENTS.md`, and let local guard check 10 refresh it. If you choose a different name, update guard checks 4, 5, 7 and 10 and the `integration.md` plan to match.

## Q7. Should bootstrap-action verification go back into `docs-first-planning-assessment` Step 5?

**The question.** The `DECISIONS.md` entry at line 39 requires "bootstrap actions to be verified against the current artifact before they are written". The learning at `LEARNINGS.md` line 27 records the failure behind that decision. The current Step 5 of `docs-first-planning-assessment` does not contain the requirement. Was it dropped on purpose?

**Recommended answer.** No, it was not dropped on purpose. Restore it as one sentence in Step 5. The same entry's "dedicated appendix" for workflow/process should instead be marked superseded, not restored. The router's shape D and domain list 4a now carry that concern.

## Q8. Keep the `doc-health-check` backlog item?

**The question.** `TODO.md` line 20 tracks a `doc-health-check` skill that does not exist. The current local guard points readers to it. Should the backlog item stay?

**Recommended answer.** Drop it. `INTENT.md` already defines the full-evaluation role as the guard evaluator, meaning the generator re-run in evaluation mode. The refined guard now points to a re-run of `entropy-assessment` instead.

## Q9. Should the upstream feedback in `feedback.md` be filed?

**The question.** This run had no network access, so the four notes in `feedback.md` were not filed as GitHub issues on `justinphilpott/entropy-guard`. Should they be filed?

**Recommended answer.** File F1 and F2. They change outputs for every docs-first user. F3 and F4 are smaller and can wait until the validation batch shows whether they recur.
