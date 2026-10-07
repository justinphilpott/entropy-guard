# Questions for the steward

These come from the entropy assessment of the entropy-guard snapshot 447da9a, on 2026-10-07. There are five, which is
the limit, and each one's answer changes what gets built or what the guard checks.

No steward was available, so work continued on each recommended answer, and the work that depends on an answer is in
`provisional.patch` and `guard/SKILL.md`. The finding ids (F) refer to `assessment.md`.

Order: Q1 and Q2 first, because the guard's Intent section depends on them.

---

## Q1. May a contributor or agent change `INTENT.md` during a session, or only propose a change for you to decide?

**The statements:**
- `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents — as our understanding deepens.
  When you update it, note the date and what prompted the revision."
- `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated note explaining
  what prompted the change."

None of the three is dated or attributed. (F1)

**The readings:**
- **(a)** Any contributor, agents included, may change what `INTENT.md` says, adding a dated note.
- **(b)** Contributors propose in `DECISIONS.md`. `INTENT.md` changes only after you record the decision. A wording fix
  that a recorded decision already settles can still be made directly.

**Where they diverge.** `session-coherence-skill-generator` was added in May 2026; its metadata says it was generated on
2026-05-10. `INTENT.md:86-88` still says the generator role is filled by `entropy-assessment` and
`docs-first-planning-assessment`.
- Under (a), the next session's guard has an agent rewrite `INTENT.md:88` itself, which in effect answers Q3 without
  you.
- Under (b), that session records a proposal, and `INTENT.md` waits for you.

**Recommended answer: (b).** The repo's own texts rank intent as the most protected layer:
- `LEARNINGS.md:133`: "The intent should be the most protected and slowest-changing element";
- `PHILOSOPHY.md:69`: "intent > machinery > content".

`INTENT.md:13` also names intent drift as change that happens "without anyone noticing". An agent's edit with a dated
note is that path.

**What depends on it:**
- the guard's Intent section;
- the `AGENTS.md:27` and `INTENT.md:3` hunks in `provisional.patch`.

---

## Q2. Who is the steward of entropy-guard?

**The statement.** No file names who decides what entropy-guard is for, and all 17 `DECISIONS.md` entries are undated
and unattributed. The evidence for Justin Philpott:
- the feedback helper files issues on `justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md:10`);
- the only directives in the repo with a named author are yours, for example
  `explorations/2026-03-24-entropy-immune-system-conversation.md:125`. (F2)

**The readings:**
- **(a)** You alone.
- **(b)** A wider group, for example anyone with merge rights. `README.md:5` says "Both humans and AI agents contribute
  here".

**Where they diverge.** An agent proposes narrowing the front door.
- Under (a), the proposal waits for you.
- Under (b), any maintainer could accept it by merging a pull request.

**Recommended answer: (a).** Name yourself in `INTENT.md`'s header, and date and attribute new `DECISIONS.md` entries
from now on. Every directive in the repo with a named author is yours, and the repository is under your GitHub account.

**What depends on it:**
- the steward named in the guard, now marked unresolved;
- the `INTENT.md` hunk in `provisional.patch`;
- every guard check that routes a proposal to the steward.

---

## Q3. Which skill builds guards?

**The statements:**
- `INTENT.md:88` gives the generator role to "the assessment workflow rooted at `skills/entropy-assessment/` and …
  `skills/docs-first-planning-assessment/`".
- `docs-first-planning-assessment` Phase 2 (`:132-202`) generates or refines guards.
- `session-coherence-skill-generator` (`:198-315`) also generates them, with a different template and a different
  default path, `skills/session-coherence-guard/SKILL.md`.
- `README.md:91` and `AGENTS.md:46` call the latter a generator.
- `DECISIONS.md:7-11` adds a bootstrap mode to it, without saying what role it has.
- No skill hands work to it, and the front door has no young-repo route. (F3, F4)

**The readings:**
- **(a)** Both build guards: docs-first for docs-first repos, the generator for other repos and for young ones.
- **(b)** `session-coherence-skill-generator` is the only builder. The front door and docs-first hand it their
  findings and checks.
- **(c)** Docs-first is the builder. The generator only bootstraps young repos.

**Where they diverge:**
- **This repo's own guard.** Under (a) or (c), it follows docs-first Step 7's checklist areas. Under (b), it follows the
  generator's template: modes, mechanical checks with exact commands, and safety rules.
- **A mixed docs-and-code repo entering by the front door.** Under (c) it gets no builder at all:
  `skills/entropy-assessment/SKILL.md` Step 4d says only "add a lightweight general post-work guard".

**Recommended answer: (b).** Three reasons:
- `DECISIONS.md` "Consolidate domain generators into single skill" already chose one generation process over
  near-duplicates ("~80% identical scaffolding").
- The generator alone has a complete guard template and the bootstrap mode that `DECISIONS.md:10` requires.
- The front door's routes B to D have no builder today.

**What depends on it.** The consolidation listed in `assessment.md` "Recommendations", which touches:
- `INTENT.md:84-96`;
- the front door's routes;
- docs-first Phase 2;
- `README.md` "What's here" and `AGENTS.md` "Key Files";
- the integrator's handoff.

It has no hunk, because the text differs for each reading.

---

## Q4. Does the validation batch still track merged PRs?

**The statements:**
- `DECISIONS.md:26` (the Farm entry): "assess a larger set of open source projects, generate or refine guards, run them
  locally while making targeted improvements, and track whether that produces more merged PRs."
- `INTENT.md:129-135`: a batch of docs-first planning repos, tracking "clearer session recovery, fewer reintroduced
  stale ideas, more coherent docs, and sharper feedback".
- `README.md:125` and `TODO.md:11-13` follow `INTENT.md`.

No recorded decision drops merged PRs. (F15)

**The readings:**
- **(a)** `INTENT.md`'s batch and measures replaced the Farm entry's.
- **(b)** Both apply: the batch is docs-first repos, and merged PRs stays a measure alongside the others.

**Where they diverge.** Take an assessment of one of your own private docs-first repos.
- Under (a), it counts in full.
- Under (b), it yields no merged-PR evidence, so the batch also needs public repos that take outside pull requests.

**Recommended answer: (b).** Track merged PRs wherever an assessed repo takes outside pull requests. It is the only
success measure recorded as a decision, and your own words at `explorations/2026-03-19-autopoiesis.md:22` single out
guard-driven work "merged within minutes" as the evidence that the method works.

**What depends on it:**
- the "Next Up" hunk in `TODO.md`, in `provisional.patch`;
- how the batch is chosen.

---

## Q5. May an agent using these skills on another project file a public issue on `justinphilpott/entropy-guard`?

**The statements.** They disagree:
- **Whenever the helper is available:** `DECISIONS.md:66` ("use the local helper when available") and
  `skills/guards-integrator/SKILL.md:174` ("When working inside the entropy-guard repo, or whenever the local feedback
  helper is available").
- **Only when working here:** `skills/entropy-assessment/SKILL.md:150`, `skills/docs-first-planning-assessment/SKILL.md:217`
  and `AGENTS.md:72`.

The helper runs `gh issue create`. The issue body includes "Project Context" (`:42`, `:68`), and there is no
confirmation step. (F11)

**The readings:**
- **(a)** File whenever the helper is reachable. It is reachable whenever an agent reads the skills from this repo,
  which is how `README.md:36` tells people to use them.
- **(b)** File only when working in entropy-guard. Elsewhere, leave the drafted issue in the output for the user.

**Where they diverge.** Someone assesses a private client's planning repo following `README.md:36`, and the
integrator's Step 7 finds a misfire.
- Under (a), the agent creates a public issue describing that client's project.
- Under (b), the note stays in the agent's output, and the user decides.

**Recommended answer: (b).** The issue is public and carries the assessed project's context, and the person running
the assessment has not agreed to publish it. (b) still produces the feedback note, so the improvement loop stays.

**What depends on it:**
- the hunks for `guards-integrator` and the feedback helper in `provisional.patch`;
- the guard's "Live state" pointer, now marked open.
