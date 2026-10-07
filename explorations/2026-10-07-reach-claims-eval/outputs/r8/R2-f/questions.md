# Questions for the steward

Target: the entropy-guard repository, snapshot `447da9a` (files dated 2026-05-11). Assessed 2026-10-07. No steward was
available, so each question carries the answer this run recommends, and the run continued on that recommendation:
work that depends on an answer is drafted as a provisional patch (`patches/provisional-Q<n>.patch`) and nothing
dependent on it is applied or installed.

The steward is not named anywhere in the repo (finding F1). Justin Philpott is inferred: he owns
`justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md` line 10) and directs the work in the
preserved conversations (`explorations/2026-03-24-entropy-immune-system-conversation.md` line 713). That is settled
enough by evidence not to be asked; recording it is recommended in `assessment.md`.

Ordered by how much depends on the answer.

---

## Q1. Which skill builds guards?

**The statements.**
- `INTENT.md` lines 86-88 say the guard generator role "is carried by the assessment workflow rooted at
  `skills/entropy-assessment/` and, for the strongest validated case, `skills/docs-first-planning-assessment/`".
- `skills/docs-first-planning-assessment/SKILL.md` lines 132-202 (Phase 2) generate or refine a guard, to their own list
  of checks.
- `skills/session-coherence-skill-generator/SKILL.md` lines 198-231 also generate or update a guard, to a different
  list of required sections (modes, mechanical commands, safety rules). Its metadata is dated 2026-05-10, after
  `INTENT.md`'s last revision (2026-04-07).
- `DECISIONS.md` lines 7-11 change that generator but no entry records adopting it, or dividing the role between it and
  docs-first. Nothing on the front door (`skills/entropy-assessment/SKILL.md`) routes to it.

**The readings.**
- (a) One builder, the generator; docs-first supplies its docs-first checks to it as input.
- (b) One builder, the assessment workflow; the generator is reduced to bootstrap for young repos, or retired.
- (c) Two builders split by repo shape: docs-first for docs-first repos, the generator for code and young repos, with
  the front door routing between them.

**Where they diverge, in this repo.** Re-evaluating this repo's own guard, `skills/local/entropy-guard/SKILL.md`. Under
docs-first Step 7 it stays a checklist of canonical ownership, supersession and state checks, with no modes, commands
or safety rules. Under the generator's requirements (lines 213-227) it must gain mode behaviour, mechanical checks with
exact commands, and safety rules. Same repo, two different guards.

**Recommended: (a).** The repo's own decisions favour one generation process with domain knowledge held as input:
"Consolidate domain generators…" (`DECISIONS.md` line 133: the domain knowledge "turned out to be reference data, not
separate processes") and "Guard creation skills over guard libraries" (line 124). The generator also already has the
young-repo bootstrap that the front door lacks. Reading (b) satisfies the same one-builder principle; (c) keeps two ways
of doing one job. Whichever is chosen, record it in `DECISIONS.md`.

**What waits on it:** `patches/provisional-Q1.patch` (drafted for (a)); findings F3 and F9.

---

## Q2. May agents revise `INTENT.md` themselves?

**The statements.**
- `INTENT.md` line 3: "It is meant to be refined collaboratively — by humans and AI agents… When you update it, note the
  date and what prompted the revision." Line 139 repeats it: "add it".
- `AGENTS.md` line 27: "If a decision refines or challenges the intent, update INTENT.md and note why."
- The repo's own guard, `skills/local/entropy-guard/SKILL.md` line 68: "if INTENT.md itself needs revision, update it
  with a dated note".
- Against them, `LEARNINGS.md` line 133: "The intent should be the most protected and slowest-changing element", drawn
  from the steward's 2026-03-19 conversation. None of these is attributed to the steward in the file it sits in.

**The readings.**
- (a) Any contributor, human or agent, may revise `INTENT.md` with a dated note.
- (b) Agents propose intent changes in `DECISIONS.md`; `INTENT.md` changes only after the steward's recorded decision.

**Where they diverge, in this repo.** The session that added `skills/session-coherence-skill-generator/` (May 2026)
made `INTENT.md` lines 86-88 incomplete. Under (a), that session's agent should itself have rewritten the guard
lifecycle in `INTENT.md` to name the generator and redefine the generator role, which is exactly the open Q1. Under (b),
it records a proposal and `INTENT.md` stays as it is until the steward decides.

**Recommended: (b).** `INTENT.md` line 51 puts "Continuity of intent" first among what a guard preserves, and under (a)
an agent's own edit to `INTENT.md` cannot be told apart from drift. Reading (b) is also the rule every guard built by
the entropy-guard generator now carries.

**What waits on it:** `patches/provisional-Q2.patch`, which also installs the updated guard (`guard/SKILL.md`), because
that guard's Intent section applies reading (b). Findings F4, F13.

---

## Q3. Are `explorations/` and the three autopoiesis-derived `LEARNINGS.md` entries live material in this repo?

**The statements.**
- The steward, 2026-03-24 (`explorations/2026-03-24-entropy-immune-system-conversation.md` line 713): "let's keep them
  in explorations, as I want to preserve the entropy-guard project and really farm this new evolution off into its own
  repo."
- `DECISIONS.md` lines 23-27 ("Farm broader…"): the sibling `entropy-immune-system` repo was "seeded with the
  exploration documents".
- Nothing records the status of the copies left here. `explorations/` is not listed in README "What's here" or
  `AGENTS.md` "Key Files".
- `LEARNINGS.md` lines 117-143 hold three entries "validated by" that conversation, and they prescribe design: "The
  mature form collapses assess → fix with no persistent guard artifact" (line 123), "The process generator should be
  ephemeral" (line 133).

**The readings.**
- (a) They stay live here: the record of how entropy-guard's own thinking developed, still guiding its design.
- (b) They are historical seed material: the line of thought continues in the sibling repo, and nothing here directs
  entropy-guard's design.

**Where they diverge, in this repo.** Designing the "guard runner" (`TODO.md` line 18). Under (a), an agent following
`LEARNINGS.md` line 123 builds a runner that regenerates a guard on every run and keeps no guard file. Under (b), it
runs the persistent `skills/local/entropy-guard/SKILL.md` as `INTENT.md` lines 92 and 96 describe.

**Recommended: (b), keeping the files.** The steward's "keep them in explorations" was said before the sibling repo
existed, and the later "Farm…" decision moved the line of thought out. Marking rather than deleting honours both
statements.

**What waits on it:** `patches/provisional-Q3.patch`; finding F6.

---

## Q4. What does the validation loop measure?

**The statements.**
- `DECISIONS.md` line 26 ("Farm…"): "assess a larger set of open source projects, generate or refine guards, run them
  locally… and track whether that produces more merged PRs."
- `INTENT.md` lines 129-135 (revised 2026-04-07), `README.md` line 125 and `TODO.md` lines 11-13: docs-first planning
  repos, tracking "clearer session recovery, fewer reintroduced stale ideas, more coherent docs".
- The later "Specialize first…" decision (`DECISIONS.md` lines 15-19) narrows the route but does not mention the
  measure.

**The readings.**
- (a) The docs-first measures replaced merged PRs.
- (b) Both: docs-first repos, with merged changes recorded alongside the docs-first measures.

**Where they diverge, in this repo.** Choosing the batch for `TODO.md` line 11. A private docs-first planning repo, where
no pull request gets merged, qualifies under (a) and gives no result under (b).

**Recommended: (b).** The steward's own recorded evidence of value is merged changes: "suggest changes which then get
merged within a short space of time" (2026-03-24 conversation, line 86) and "merged within minutes" (2026-03-19
conversation, line 22). The docs-first measures are what that track is meant to improve.

**What waits on it:** `patches/provisional-Q4.patch`; finding F5.
