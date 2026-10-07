# Questions for the steward

These come from the entropy assessment of entropy-guard snapshot `447da9a`, dated 2026-10-07. No steward was
available, so each question carries the answer I recommend, and I continued on that recommendation. Work that
depends on an answer is drafted as provisional, and nothing that needs a new decision has been installed. Line
references are to the snapshot. Finding ids (F1 and so on) are in `assessment.md`.

Order: Q4 and Q3 block installing the updated guard; Q1 blocks the clean-up of the generator's role; Q2 blocks the
validation batch.

---

## Q1. Which skill writes guards?

**The statements, with sources (F4):**
- `INTENT.md:88` gives the generator role to `skills/entropy-assessment/` and `skills/docs-first-planning-assessment/`.
- `skills/docs-first-planning-assessment/SKILL.md:132-202` (Phase 2) writes or refines guards.
- `skills/session-coherence-skill-generator/SKILL.md` (dated 2026-05-10) also writes guards, to
  `skills/session-coherence-guard/SKILL.md`, with its own required sections. `README.md:91` and `AGENTS.md:46` say it
  "generates repo-specific session handoff guards".
- No entry in `DECISIONS.md` adds that skill or gives it the role. `DECISIONS.md:7-11` assumes it exists. Neither
  assessment skill routes to it.

**The readings:**
- (a) `docs-first-planning-assessment` writes guards for docs-first repos, and `session-coherence-skill-generator`
  writes them for every other shape.
- (b) `session-coherence-skill-generator` is the one guard writer, and the assessments supply its inputs.
- (c) `session-coherence-skill-generator` is a side tool, and the assessments remain the generator, as `INTENT.md:88`
  says.

**Where they diverge, in this repo:** the next item in `TODO.md:12` is "Generate or refine guards for those
projects". An agent following `README.md:52-58` runs docs-first Phase 2. It gets a guard built from the checklist
areas in `SKILL.md:156-173`, with integration advice. An agent following `README.md:91` runs the generator. It gets
`skills/session-coherence-guard/SKILL.md`, with modes, mechanical checks and safety rules, and no integration step.
That is the same target, with two different guards at two paths.

**Recommended answer: (b).** One skill, `session-coherence-skill-generator`, writes guards.
`docs-first-planning-assessment` keeps its analysis and passes its docs-first checks to the generator, and the
generator hands to `guards-integrator`. The reasons:
- It is the only skill with a written guard contract.
- It covers every repo shape, young repos included, through the bootstrap mode decided at `DECISIONS.md:7-11`.
- "Consolidate domain generators into single skill" (`DECISIONS.md:129-135`) already rejected keeping duplicated
  generation scaffolding in parallel.

If (b) is chosen, the generator must also gain the integration step that `DECISIONS.md:87-91` requires of
generators.

**What depends on the answer:**
- `INTENT.md` "The guard lifecycle";
- `README.md:52-58, 78, 91`;
- `skills/guards-integrator/SKILL.md:20, 227`;
- docs-first Phase 2;
- the guard's description of itself.

**Where the answer goes:** `DECISIONS.md`, replacing the proposal in `patches/decisions.patch`.

---

## Q2. Which repos make up the validation batch, and what signal judges it?

**The statements, with sources (F5):**
- `DECISIONS.md:26` ("Farm broader entropic-immunity exploration..."): "assess a larger set of open source projects
  ... track whether that produces more merged PRs".
- `INTENT.md:129-135`, `README.md:125` and `TODO.md:11-13`: "a larger batch of docs-first planning / architecture /
  blueprint repos", tracking "clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and
  sharper feedback".
- The later decision `DECISIONS.md:15-19` ("Specialize first around docs-first planning repos") specialises the
  exported skills. It does not restate the batch or its signal.

**The readings:**
- (a) Docs-first planning repos and the session signals replace the open-source batch and merged PRs.
- (b) Both apply: docs-first repos first, then open-source projects, with both signals recorded.
- (c) The decision governs: open-source projects, judged by merged PRs.

**Where they diverge, in this repo:** take a code-first open-source library with an active pull-request flow. Under
(c) it belongs in the batch, and success is a merged pull request. Under (a) it is outside the first wedge, which
`INTENT.md:129` names as docs-first planning systems, and success is a session that recovers its state cleanly, which
a merged pull request does not show.

**Recommended answer: (b).** Start with docs-first planning repos, as `INTENT.md`, `README.md` and `TODO.md` all say,
in line with the later "Specialize first..." decision. For each target, record the session signals and also whether
the resulting changes merged, where the target takes pull requests. Nothing recorded withdraws the merged-PR signal,
and it costs one line per target. The reason: (b) keeps both recorded statements true until the steward chooses.

**What depends on the answer:**
- how `TODO.md` "Next Up" items 1 and 2 are run, and what they record;
- whether `DECISIONS.md:26` is marked partially superseded.

**Where the answer goes:** a dated entry in `DECISIONS.md`, and `TODO.md` "Next Up".

---

## Q3. May contributors, agents included, change `INTENT.md` directly?

**The statements, with sources (F2):**
- `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents ... When you update it, note
  the date and what prompted the revision."
- `INTENT.md:139`: "If you find something missing, imprecise, or worth expanding — add it."
- `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated note".
- Against these: the intent-change rule that every generated guard must carry (rule 4: "Do not edit `<intent
  documents>` to match the work unless `<steward>` has recorded that decision").

**The readings:**
- (a) The direct-edit invitation is the steward's standing permission, and agents may revise `INTENT.md` with a dated
  note.
- (b) Agents propose intent changes in `DECISIONS.md`, and `INTENT.md` changes only after the steward records a
  decision.

**Where they diverge, in this repo:** the session that added `session-coherence-skill-generator` in May 2026 could
have rewritten `INTENT.md` "The guard lifecycle" to name it as the generator. Under (a), that is allowed, the guard's
check 3 then passes, and Q1 never surfaces. Under (b), the session records a proposal, the role stays visibly open,
and the work that depends on it waits.

**Recommended answer: (b).**
- `INTENT.md` calls itself the "north star". The repo says intent entropy is "catastrophic to recover"
  (`INTENT.md:33`), and that skill-to-intent drift is "the most dangerous form of entropy here"
  (`skills/local/entropy-guard/SKILL.md:70`).
- Under (a), the session that drifted can move the reference that drift is measured against.
- Keep the dated-note convention for the edit once the steward has decided.

**What depends on the answer:**
- the Intent section of `guard/SKILL.md`, which is written for (b) and so is provisional;
- `INTENT.md:3` and `:139`;
- `AGENTS.md:27`.

If you choose (a), the guard's rule 4 must say so before the guard is installed.

**Where the answer goes:** `DECISIONS.md`, replacing the proposal in `patches/decisions.patch`.

---

## Q4. Who is the steward?

**The statement (F1):** nothing in the repo names an owner or steward, and no decision is attributed or dated.

**The readings:**
- (a) Justin Philpott alone. The evidence:
  - he owns the GitHub repository that the feedback helper files issues on
    (`skills/local/entropy-guard-feedback/SKILL.md:10`);
  - `PHILOSOPHY.md:43` attributes a section to him;
  - `explorations/2026-03-24-entropy-immune-system-conversation.md:125` records him setting a project's intent.
- (b) Someone else, or a group, decides what the project is for.

**Where they diverge, in this repo:** the updated guard sends every undecided intent change to "Justin Philpott in
`DECISIONS.md`". Under (b), proposals would wait on the wrong person, and decisions he recorded could be read as
settled when they are not.

**Recommended answer: (a)**, recorded as a dated entry in `DECISIONS.md` and named in one line of `AGENTS.md`, so
that later decisions can carry an attribution.

**What depends on the answer:** the steward's name in five places in `guard/SKILL.md`, and who answers Q1 to Q3.

**Where the answer goes:** `DECISIONS.md`, and `AGENTS.md`.
