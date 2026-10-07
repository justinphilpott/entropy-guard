# Questions for the steward

The steward is Justin Philpott, inferred from the evidence (assessment F01). No file in the repo records it. These
are the only gaps the evidence could not settle where the answer changes what gets built. The run continued on each
recommended answer, keeping dependent work provisional or unpatched. Each question is also recorded as a proposal
(P1 to P3) in `patches/02-DECISIONS-proposals-and-supersession.patch`.

---

## Q1: Who may change `INTENT.md`? (Proposal P1; findings F01, F03)

**The statements, and where they are.**

- `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `INTENT.md:3`: "meant to be refined collaboratively — by humans and AI agents… When you update it, note the date
  and what prompted the revision." The same at `INTENT.md:139`.
- `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated note".

None of these is dated or attributed, and no file names who decides what the project is for.

**The two readings.**

- **(a) A standing delegation.** Any contributor, including an AI agent, may revise `INTENT.md` directly, with a
  dated note.
- **(b) Steward only.** `INTENT.md` changes only on your recorded decision. Contributors record a proposed change in
  `DECISIONS.md` and wait.

**A case from this repo where they lead to different work.** This assessment found that `INTENT.md:84-88` names
only the assessment workflow as the guard generator, although `session-coherence-skill-generator` now exists (F04).

- Under (a), the next agent rewrites `INTENT.md:88` to include the generator. In doing so it answers Q2 itself.
- Under (b), it records a proposal and leaves `INTENT.md` alone until you decide.

**Recommended: (b).** Record yourself as steward in `AGENTS.md` and in the `INTENT.md` header. Keep one exception:
a correction that an existing recorded decision already settles may be made directly, citing that decision. The
reasons:

- `INTENT.md:33` itself rates intent entropy as "catastrophic to recover".
- `INTENT.md:5` keeps only one "Last revised" line, so under (a) the reasons for every revision before 2026-04-07
  have already been lost.
- Your own recorded choices (`explorations/2026-03-24-entropy-immune-system-conversation.md:86,713`) show scope
  being decided by you, not by whichever contributor arrives next.

**What waits on the answer.**

- The wording of `AGENTS.md:27`, which is not patched.
- The steward line, and the provisional note in the Intent section, of the draft guard (`guard/SKILL.md`). The
  guard should not be installed until this is answered.

**Draft for each answer.**

- (a): add to `DECISIONS.md` "Justin Philpott, <date>: contributors may revise INTENT.md directly, adding a dated
  entry to a revision log at its foot." That record satisfies item 4 of the intent-change rule in the guard, so the
  guard text stays as drafted.
- (b): change `AGENTS.md:27` to "If a decision refines or challenges the intent, record it in DECISIONS.md under
  'Proposed — awaiting Justin Philpott'. INTENT.md changes after his recorded decision."

---

## Q2: Which skill writes guards? (Proposal P2; finding F04)

**The statements, and where they are.**

- `skills/docs-first-planning-assessment/SKILL.md:132-202`: "Phase 2: Guard Generation / Refinement".
- `README.md:52-58`: "the specialized assessment continues into guard generation or refinement".
- `INTENT.md:84-88` names the assessment workflow as the guard generator.
- `skills/session-coherence-skill-generator/SKILL.md` also writes guards, and gained the young-repo bootstrap mode
  in the newest decision (`DECISIONS.md:7-11`).
- `skills/guards-integrator/SKILL.md:20` says it runs "after `entropy-assessment` generates one or more guards".

No decision records adding the generator, or how it relates to the assessments.

**The three readings.**

- **(a)** The assessments write guards. The generator is a separate tool for generic session-handoff guards and
  young-repo bootstrap.
- **(b)** `session-coherence-skill-generator` is the only guard writer. The assessments hand it their findings and
  checks, and `guards-integrator` takes its output.
- **(c)** Fold bootstrap mode into the assessments, and retire the generator.

**Cases from this repo where they lead to different work.**

- **Refreshing this repo's own guard** (done in this run).
  - Under (a), docs-first Step 7 amends `skills/local/entropy-guard/SKILL.md` with its seven checklist areas.
  - Under (b), the generator rewrites it to its template: what changed in the session, exact commands, modes, a
    report shape and safety rules. That is `guard/SKILL.md`.
- **A young repo arriving at the front door.** Under (a) or (c), it has no route unless one is added. Under (b), the
  front door routes it to bootstrap mode.

**Recommended: (b).** The reasons:

- `DECISIONS.md:121-125` invests in "the guard creation skill", singular.
- `DECISIONS.md:129-135` removed four generators because 80% of their scaffolding was duplicated; two guard writers
  recreate that.
- The newest decision put effort into the generator's bootstrap mode, which no assessment has.

**What waits on the answer.** Corrections to:

- `INTENT.md` "The guard lifecycle";
- `README.md` "How to use this repo";
- `docs-first-planning-assessment` Phase 2;
- the routes in `entropy-assessment` Step 3;
- `guards-integrator` "When to Run" and "What This Is Not";
- where the "no-existing-loop" integration pattern from `DECISIONS.md:42` should live (F06).

None of these is patched.

---

## Q3: What does the validation batch measure? (Proposal P3; finding F08)

**The statements, and where they are.**

- `DECISIONS.md:26`: "assess a larger set of open source projects … and track whether that produces more merged
  PRs".
- `INTENT.md:129-135` (revised 2026-04-07), followed by `README.md:125` and `TODO.md:11-13`: docs-first planning
  repos, tracked by "clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and sharper
  feedback".
- `DECISIONS.md:15-19` narrowed the set of target repos but said nothing about the measure.
- Your own words, 2026-03-19 (`explorations/2026-03-19-autopoiesis.md:22`), cite fixes "merged within minutes" as
  the evidence that the skill works.

**The three readings.**

- **(a)** Merged PRs, on open-source targets.
- **(b)** Session-recovery and coherence outcomes, on docs-first planning repos.
- **(c)** Both, recorded for each target.

**Cases where they lead to different work.**

- A private docs-first planning repo with no PR flow cannot count under (a), but is the primary kind of target under
  (b).
- A public code repo where a guard-prompted PR merges counts under (a), but is off-track under (b).

**Recommended: (c).** For each target, record the `INTENT.md` outcomes as the primary measure, and also whether the
resulting changes merged, where the target has a PR flow. Then mark `DECISIONS.md:26` as partially superseded on
both the set of targets and the measure. The reasons:

- The later documents narrow the set of targets to docs-first planning repos, and many of those have no PRs.
- Merges were your first evidence of value, and they cost almost nothing to record when they exist.

**What waits on the answer.**

- The wording of `TODO.md` "Next Up" item 2, and how batch results are recorded.
- A supersession marker on the validation sentence of the "Farm" entry. Patch 02 deliberately leaves it unmarked.
