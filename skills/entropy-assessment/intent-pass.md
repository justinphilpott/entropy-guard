# Intent Pass

Establish what the system's steward has **authorised** it to be for, separately from what its documents and code
currently say, so that drift can be told apart from an approved change of intent.

Used by:

- `entropy-assessment` Step 1, on every route.
- `docs-first-planning-assessment` Step 1, when that skill is entered directly.
- `session-coherence-skill-generator`, which writes the **intent-change rule** at the end of this file into every
  guard it builds.

This file is the one definition of these rules. The other skills point here rather than restating them.

The steward is the person, or the named role, who can decide what the system is for. On a personal project it is
the owner. On a team project it may be a lead, a product owner, or a decision log they maintain.

---

## 1. Gather the statements

Collect every statement of purpose, scope, non-goal, standing decision and rule. Look in:

- top-level documents: `README.md`, `INTENT.md`, `NORTH_STAR.md`, vision or roadmap documents;
- decision logs: `DECISIONS.md`, ADR folders, decision folders;
- state and handoff files: `TODO.md`, `STATE.md`, session notes;
- agent instruction files: `AGENTS.md`, `CLAUDE.md`, contributor guides.

For each statement, record:

- **Where it is:** the file and line.
- **What kind it is:**
  - a **steward decision**, attributed to the steward with a date, such as "Justin, 2026-09-25: …" or an ADR the
    steward accepted;
  - a **description**: a document saying what the system is or does;
  - an **observation**: what the code, history or running system shows;
  - an **inference**: something an agent wrote without a steward source.
- **When it was made**, if a date is given.

Name the steward. If no document says who can decide intent, that is itself a finding.

## 2. Compare three readings

- **Declared:** what the documents say the system is for.
- **Enacted:** what recent work actually pursued: recent commits, open work, what was built.
- **Authorised:** what the steward decided, in their own recorded words.

Only steward decisions carry authority. A newer modification date does not make a document authoritative, and
implementation shows what was built, not what was approved.

## 3. Classify each gap

Each gap between the three readings falls under one of these conditions. The condition sets the response.

| Condition | How to recognise it | Response |
|---|---|---|
| **Stale description** | A document contradicts a later recorded steward decision, or describes something that decision superseded. | Correct the document from that decision, citing it. Do not ask. |
| **Conflict** | Two sources prescribe incompatible things, and no recorded decision settles which wins. | Present both with their sources. Ask only if the work depends on the answer. |
| **Missing** | An outcome or constraint the work depends on is stated nowhere. | Name the missing decision. Ask only if the work depends on it. |
| **Ambiguous** | A statement admits readings that would lead to different work. | Give the readings and a concrete case where they diverge. Ask only for the unresolved choice. |
| **Unauthorised drift** | What was enacted differs from what was authorised, and no decision covers the difference. | Either fix the work, or record a proposed intent change for the steward. Never resolve it by editing the intent documents. |
| **Prose control** | A rule is written as if something enforces it, and nothing does. | Report where enforcement would have to sit, and whether anything cites the rule as a control. |

Gaps that do not depend on intent, such as broken links, stale paths or a contradictory state file, are not held up
by any of this. Report and fix them as usual.

## 4. Ask rarely, and well

Ask the steward only when both of these hold:

- the evidence cannot settle the gap;
- the answer changes what gets built, or what a guard checks.

Rules for asking:

- **At most five questions per run.** When the steward is present, ask them one at a time.
- **Each question carries four things:** the statement and its source; the candidate readings; one concrete case
  from this system where the readings lead to different work; and the answer you recommend, with the reason.
- **Do not reopen a recorded steward decision.** Settle staleness from it instead.
- **Refuse to guess, in both directions.** Do not invent an answer the steward owes. Do not restate the steward's
  words in vocabulary they did not use, as if that were what they meant.
- **If the steward is not available,** record each question with its recommended answer, continue on the
  recommendation, and mark the outputs that depend on it as provisional.

## 5. Record what was settled

- **Answers** go into the target's existing decision surface, such as `DECISIONS.md`, an ADR or an issue, dated and
  attributed. Each answer names any entry it supersedes.
- **Proposed intent changes** go into the same surface, marked as proposed and awaiting the steward. The intent
  documents change only after the steward's recorded decision. This follows the change-proposal shape OpenSpec uses:
  the proposal holds the change, and it merges only on approval.
- **Do not create a new register** for intent questions when the target already has a decision surface. If it has
  none, create the smallest one, following the bootstrap rules in `session-coherence-skill-generator`.
- **If there is no usable intent at all,** stop guard work. Report what could still be inventoried, and hand over to
  an intent-elicitation interview, such as an `intent-architect`-style skill, before any guard is built.

## Output

Add an **Intent** section to the assessment, holding:

- the steward;
- the authorised intent, in short, with the source of each part;
- the gaps, grouped by condition, each with its evidence;
- the questions for the steward, each with its recommended answer;
- any proposed intent changes, and where they were recorded.

---

## The intent-change rule

Every guard built by `session-coherence-skill-generator` carries this rule, written with the target's own steward
and decision surface filled in:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what was authorised, or a decision nobody has
>    made.
> 2. Fix a defect in the work.
> 3. Record an adaptation or an unmade decision as a proposal for `<steward>` in `<decision surface>`.
> 4. Do not edit `<intent documents>` to match the work unless `<steward>` has recorded that decision.
> 5. Correct a document directly only when a recorded decision of `<steward>`'s already settles it, and cite that
>    decision.
