# Questions for the steward

No steward was available, so each question carries the answer I recommend, and the run continued on that
recommendation. Work that depends on an answer was drafted as provisional and is not to be installed until the answer
is recorded. Each question is also a "Proposed:" entry in `patches/DECISIONS.md.patch`, which is where the answer
belongs, dated and attributed. Finding ids (F1 and so on) refer to `assessment.md`.

---

## Q1. Who decides what entropy-guard is for, and may contributors edit `INTENT.md` themselves?

- **Statements and sources:**
  - `INTENT.md:3`: "meant to be refined collaboratively — by humans and AI agents… When you update it, note the date
    and what prompted the revision."
  - `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
  - The local guard's check 3 says the same (`skills/local/entropy-guard/SKILL.md:68`).
  - No document names a steward, and none of the 17 `DECISIONS.md` entries records a date or a decider (F1, F2).
- **Candidate readings:**
  - (a) Any contributor, including an agent, may revise `INTENT.md` with a dated note. This is the current written
    practice.
  - (b) Justin Philpott is the steward. A contributor records a "Proposed:" entry in `DECISIONS.md`, and
    `INTENT.md` changes only after his recorded decision.
- **Where they lead to different work:** `INTENT.md`'s lifecycle section (`:84-96`) omits
  `session-coherence-skill-generator`. Under (a), the next agent to notice edits `INTENT.md:88` to add it, choosing
  Q2's answer as it goes. Under (b), it records a proposal and leaves `INTENT.md` alone. The refined guard's rule 4
  (section 1 of `guard/SKILL.md`) says one or the other.
- **Recommended answer: (b), with Justin Philpott named as steward.**
  - The repo's own model makes intent the slowest-changing, most protected layer: `LEARNINGS.md:133`, "the intent
    should be the most protected and slowest-changing element", and `INTENT.md:33`, "catastrophic to recover".
  - Justin's own words say the owner steers intent (2026-03-24, `explorations/2026-03-24-entropy-immune-system-conversation.md:292`).
  - Under (a), an agent can quietly settle a question like Q2 by editing the north star.
- **If (b):** apply the guard as drafted, and reword `AGENTS.md:27`, the `INTENT.md` header and check 3 to match.
- **If (a):** use the alternative rule 4 already written into the guard.

---

## Q2. Which skill builds guards?

- **Statements and sources:**
  - `INTENT.md:88` names the generator as "the assessment workflow rooted at `skills/entropy-assessment/` and…
    `skills/docs-first-planning-assessment/`".
  - `README.md:91` and `AGENTS.md:46` say `session-coherence-skill-generator` "generates repo-specific session handoff
    guards".
  - `DECISIONS.md:7` gives `session-coherence-skill-generator` a bootstrap mode; `DECISIONS.md:18` gives guard
    generation for docs-first repos to `docs-first-planning-assessment`.
  - The two skills use different guard templates and different default paths. No skill routes to
    `session-coherence-skill-generator`, and `guards-integrator:20` still expects `entropy-assessment` to generate
    guards (F3 to F5).
- **Candidate readings:**
  - (a) One builder: `session-coherence-skill-generator` writes every guard; the assessments supply checks.
  - (b) Two builders split by shape: `docs-first-planning-assessment` Phase 2 for docs-first repos,
    `session-coherence-skill-generator` for every other shape and for young repos, each named in the front door's
    routing.
  - (c) `session-coherence-skill-generator` is a standalone export outside the assessment flow.
- **Where they lead to different work:** when the external validation batch reaches a docs-first repo, (a) produces
  a guard with modes, a definition of the session's change and exact commands, while (b) produces the docs-first
  checklist with neither. And `entropy-assessment` Step 4d's "add a lightweight general post-work guard" has a builder
  under (a) or (b), but none under (c).
- **Recommended answer: (a).**
  - One template for one artifact removes the parallel truth that R1 ranks highest.
  - `DECISIONS.md:7`, the newest decision, already invests in `session-coherence-skill-generator`, and it is the one
    skill that works for any shape and for young repos.
  - `docs-first-planning-assessment` keeps all its analysis and passes its checks across.
  - The cost: `INTENT.md:84-96`, `README.md` "How to use", `entropy-assessment` Steps 3 and 4d, docs-first Phase 2,
    and `guards-integrator` "When to Run" all change, and the builder's template gains the integration section that
    `DECISIONS.md:90` requires.

---

## Q3. What does the external validation batch measure, and on which repos?

- **Statements and sources:**
  - `DECISIONS.md:26`: "assess a larger set of open source projects… and track whether that produces more merged
    PRs".
  - `INTENT.md:129-135`: "docs-first planning / architecture / blueprint repos"; track "clearer session recovery,
    fewer reintroduced stale ideas, more coherent docs, and sharper feedback".
  - `README.md:125` and `TODO.md:11-13` follow `INTENT.md` (F8).
- **Candidate readings:**
  - (a) External open-source repos, with merged pull requests as the measure.
  - (b) Docs-first planning repos of any ownership, measured by session-recovery quality.
  - (c) Both, each measure where it applies.
- **Where they lead to different work:** a private docs-first planning repo of the steward's qualifies under (b) but
  not under (a), where "merged PRs" means nothing. A popular open-source code library qualifies under (a) but not
  under (b).
- **Recommended answer: (c), stated once in `INTENT.md`.** Record merged changes where the target is an external
  open-source repo, and session-recovery quality everywhere; `README.md` and `TODO.md` link to it.
  - The two sources probably differ by age rather than by design: `DECISIONS.md:26` follows Justin's 2026-03-24
    farm-out, while the docs-first narrowing (`:18`) is the change `INTENT.md` records as its 2026-04-07 revision. The
    log carries no dates to confirm this (F2).
  - Measuring both costs one extra line per assessed repo.
  - Meanwhile, work can start on open-source docs-first planning repos, which qualify under every reading.
