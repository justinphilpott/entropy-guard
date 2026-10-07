# Questions for the steward

The steward is Justin Philpott. That is inferred, because the repo names no steward (assessment F1). He was not
available, so this run continued on each recommendation below. Each answer would go to DECISIONS.md, where
`patches/settled.patch` records these three questions as "Proposed, awaiting Justin". Work that depends on an answer
is drafted in `patches/provisional-Q<n>.patch` and not applied.

---

## Q1. When a session's work refines or challenges INTENT.md, may the session edit INTENT.md itself?

- **Statement and source:** three lines say a session may revise the intent document directly:
  - INTENT.md:3: "It is meant to be refined collaboratively — by humans and AI agents … When you update it, note the
    date and what prompted the revision."
  - AGENTS.md:27: "If a decision refines or challenges the intent, update INTENT.md and note why."
  - `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated note".
- **Readings:**
  - (a) an agent may rewrite INTENT.md with a dated note;
  - (b) agents propose in DECISIONS.md, and INTENT.md changes after you record the decision.
- **Where they diverge:** INTENT.md "The guard lifecycle: four distinct tools" (lines 84-96) does not mention
  `skills/session-coherence-skill-generator/`. Under (a), the next session to notice rewrites that section. Under (b),
  it records a proposal and the section waits for you.
- **Recommended:** (b). INTENT.md is what every guard measures drift against (AGENTS.md:38). If a session can edit it
  to match its own work, the drift is hidden rather than caught. Agents still contribute, through proposals.
- **What depends on it:**
  - the guard's "Intent" section, which keeps today's text in force until you answer;
  - `patches/provisional-Q1.patch`, which edits INTENT.md:3, AGENTS.md:27 and the guard.

## Q2. Which skill owns writing guards: `docs-first-planning-assessment` or `session-coherence-skill-generator`?

- **Statement and source:** each skill writes guards in its own way, and INTENT.md names a third arrangement:
  - `skills/docs-first-planning-assessment/SKILL.md` Phase 2 (Steps 6-8) generates or refines a guard from its own
    checklist areas.
  - `skills/session-coherence-skill-generator/SKILL.md` generates or updates a guard to its own requirements and
    template (lines 198-315).
  - README.md:89 and :91 each say their skill generates guards.
  - INTENT.md:88 gives the generator role to entropy-assessment and docs-first only.
  - DECISIONS.md:7-11 adds a bootstrap mode to the session generator but does not settle ownership.
- **Readings:**
  - (a) docs-first owns guards for docs-first repos, and the session generator owns guards for other repos;
  - (b) the session generator owns what a guard holds and writes every guard, with docs-first supplying its checks as
    inputs;
  - (c) docs-first owns guard writing, and the session generator is reduced to bootstrap mode.
- **Where they diverge:** adding safety rules to every guard. Under (b), that is one edit to one template. Under (a),
  it is two edits that drift apart. This repo's own guard already matches neither template (assessment F3).
- **Recommended:** (b). The session generator is the only one with a full template, mode handling and safety rules,
  and it carries the bootstrap mode your decision records. Docs-first's Step 7 is a list of checklist areas, which
  fits being an input.
- **What depends on it:** `patches/provisional-Q2.patch`, which edits INTENT.md:88, README.md:89 and :91, and
  docs-first Step 7 and its Output.

## Q3. Is "more merged PRs" still a measure for the validation loop?

- **Statement and source:** the decision and the intent document name different measures:
  - DECISIONS.md:26 says to "assess a larger set of open source projects … track whether that produces more merged
    PRs".
  - INTENT.md:131-135, revised 2026-04-07, and README.md:125 track "clearer session recovery, fewer reintroduced stale
    ideas, more coherent docs, and sharper feedback".
  - TODO.md:12 says "track what changes prove useful".
  - No entry records merged PRs being dropped.
- **Readings:**
  - (a) merged PRs was replaced by INTENT.md's session measures;
  - (b) both are measures, and INTENT.md left one out.
- **Where they diverge:** a run on a docs-first repo that gives clearer sessions but no merged PR counts as a success
  under (a) and as a miss under (b). This decides what the validation batch in TODO.md "Next Up" records.
- **Recommended:** (b), track both. Merged PRs is the only measure on record that someone outside the project can
  observe. It is also the result you said first impressed you: "1-shot suggested extremely well targetted fixes …
  merged within minutes" (`explorations/2026-03-19-autopoiesis.md:22`), and "suggest changes which then get merged
  within a short space of time" (`explorations/2026-03-24-entropy-immune-system-conversation.md:86`).
- **What depends on it:** `patches/provisional-Q3.patch`, which edits INTENT.md:135, README.md:125 and TODO.md:12.

---

Not asked, because the evidence settles enough to proceed:
- **Who the steward is (F1):** the inference is labelled wherever it is used. A one-line record by you would close it.
- **Whether `explorations/` stays in this repo:** you settled that on 2026-03-24 (conversation, line 713).
