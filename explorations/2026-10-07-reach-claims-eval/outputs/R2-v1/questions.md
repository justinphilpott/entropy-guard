# Questions for the steward

The steward was not available. Each question below is recorded with its recommended answer, and the work that depends
on it is drafted as provisional (`provisional.diff`, and the "Provisional patch" section of `assessment.md`). Nothing
that depends on an answer was installed or enforced. The same four questions are written into the target's own
decision log as proposals awaiting the steward (top of `DECISIONS.md`, in `settled.diff`).

Steward, as inferred: Justin Philpott. No file in the repository names a steward (finding F3); the inference rests on
the GitHub owner `justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md:10`) and on his
recorded scope decision of 2026-03-24 (`explorations/2026-03-24-entropy-immune-system-conversation.md:713`).

---

## Q1. Who may change `INTENT.md`?

- **Statement and source.** `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents — as
  our understanding deepens. When you update it, note the date and what prompted the revision." `INTENT.md:139`: "If
  you find something missing, imprecise, or worth expanding — add it." `AGENTS.md:27`: "If a decision refines or
  challenges the intent, update INTENT.md and note why." The local guard, `skills/local/entropy-guard/SKILL.md:68`:
  "if INTENT.md itself needs revision, update it with a dated note explaining what prompted the change." None of these
  is attributed; `INTENT.md:5` records a revision date but not who made it.
- **Readings.**
  - A: any contributor, human or agent, revises `INTENT.md` directly, with a dated note.
  - B: only the steward revises `INTENT.md`; anyone else records a proposal in `DECISIONS.md`, and the intent changes
    after the steward's recorded decision.
- **Where they diverge, in this repo.** An agent adds a guard-runner skill (`TODO.md:18`). Under A it rewrites
  `INTENT.md:86`, which says the runner "remain[s] future work", in the same session. Under B it leaves `INTENT.md`
  as it is and records a proposal in `DECISIONS.md` for Justin to decide.
- **Recommended answer: B.** Reason: no revision of `INTENT.md` records who made it, so an authorised change of intent
  cannot be told apart from drift, and `INTENT.md:33` itself ranks intent entropy as "catastrophic to recover".
- **What depends on it.** The guard's Intent section (the intent-change rule replaces the current repair),
  `AGENTS.md:27`, `INTENT.md:3` and `:139`: all in `provisional.diff`.

## Q2. Which skill writes guards?

- **Statement and source.** `skills/docs-first-planning-assessment/SKILL.md:132-202` (Phase 2) generates or refines
  a docs-first guard to its own checklist. `skills/session-coherence-skill-generator/SKILL.md:198-315` generates or
  updates a guard at `skills/session-coherence-guard/SKILL.md` to a different template (modes, mechanical checks,
  safety rules). `INTENT.md:88` gives the generator role to "the assessment workflow rooted at
  `skills/entropy-assessment/` and ... `skills/docs-first-planning-assessment/`" and does not mention the session
  coherence generator. `DECISIONS.md:7-11` extends that generator with a bootstrap mode. The front door's fallback,
  `skills/entropy-assessment/SKILL.md:122`, recommends "add a lightweight general post-work guard" and names no skill
  that writes one. No recorded decision says which writer owns guard generation.
- **Readings.**
  - A: `docs-first-planning-assessment` writes guards for docs-first repos, and `session-coherence-skill-generator`
    for everything else, including young repos.
  - B: `session-coherence-skill-generator` writes every guard; the docs-first skill stops at analysis and hands it
    the docs-first checks.
  - C: the assessment workflow writes every guard, as `INTENT.md:88` says, and the session coherence generator is
    reduced to bootstrap only, or retired.
- **Where they diverge, in this repo.** A young docs-first planning repo with one week of history. Under A, the
  docs-first skill drafts a combined docs and workflow guard now. Under B, the generator's bootstrap mode adds only
  the missing memory surface and writes no guard until a repeated loop exists (`DECISIONS.md:10`).
- **Recommended answer: B.** Reason: the generator's template is the only one here that covers code, tests, live
  state and young repos, and the front door's fallback already needs a writer it does not name; one writer removes
  two templates for one artifact, as "Consolidate domain generators into single skill" (`DECISIONS.md:129-135`) did
  for the earlier domain generators.
- **What depends on it.** `INTENT.md:71` and `:88`, `README.md:52` and `:91`, docs-first Phase 2,
  `skills/entropy-assessment/SKILL.md:116-126`, and the guard's temporary check on the two templates. Drafted as a
  change list only, because its shape depends on the answer.

## Q3. What does the validation batch measure, and on which repos?

- **Statement and source.** `DECISIONS.md:26` ("Farm broader…"): "assess a larger set of open source projects,
  generate or refine guards, run them locally while making targeted improvements, and track whether that produces
  more merged PRs." `INTENT.md:129-135`, `README.md:125` and `TODO.md:11-13`: "docs-first planning / architecture /
  blueprint repos", tracking "clearer session recovery, fewer reintroduced stale ideas, more coherent docs". The later
  decision, "Specialize first…" (`DECISIONS.md:15-19`), does not say which population or measure replaces the
  earlier one. Neither decision is dated.
- **Readings.**
  - A: docs-first planning repos, measured by session recovery, stale ideas and doc coherence.
  - B: open source projects, measured by merged PRs.
  - C: docs-first planning repos, with both measures.
- **Where they diverge, in this repo.** Running the assessment on one of Justin's private planning repos counts
  under A and yields nothing under B, which has no outside PR to merge.
- **Recommended answer: C.** Reason: the population follows `INTENT.md`'s later revision (2026-04-07), and the
  steward's own account of success is outside changes "merged within a short space of time"
  (`explorations/2026-03-24-entropy-immune-system-conversation.md:86`), which `INTENT.md`'s list leaves out.
- **What depends on it.** `INTENT.md:135`, `TODO.md` "Next Up" item 2, and a supersession marker on "Farm broader…"
  if the measure changes. Drafted as a change list only.

## Q4. Are three entries in `LEARNINGS.md` current direction for this repo, or theory from the farmed-off line?

- **Statement and source.** `LEARNINGS.md:117-123` ("Just-in-time guard generation…": "The mature form collapses
  assess → fix with no persistent guard artifact"), `:127-133` (the four-component hierarchy) and `:137-143` (the
  layer hierarchy). Each is "Validated by" the 2026-03-19 conversation only. `LEARNINGS.md:3` asks for "what you
  validated, not just opinions". `explorations/2026-03-24-entropy-immune-system-working-conclusions.md:20-22` keeps
  the equivalent later material out of `LEARNINGS.md` for that reason, and "Farm broader…" (`DECISIONS.md:25-26`)
  moves "the March 2026 explorations on autopoiesis" to the sibling repo. No decision names these three entries.
- **Readings.**
  - A: they are current design direction for entropy-guard's guards.
  - B: they are hypotheses belonging to the `entropy-immune-system` line, not validated practice here.
- **Where they diverge, in this repo.** This run updates a persistent guard file, `skills/local/entropy-guard/SKILL.md`.
  Under A that file is "a pragmatic concession" to be phased out (`LEARNINGS.md:123`); under B it is the product
  working as intended.
- **Recommended answer: B,** keeping the entries and marking their status. Reason: their only validation is a
  conversation, and the farm-off decision names the autopoiesis explorations they came from.
- **What depends on it.** Three status lines in `LEARNINGS.md`: in `provisional.diff`.
