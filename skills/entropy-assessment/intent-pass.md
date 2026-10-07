# Intent Pass

Establish what the system's steward has **authorised** it to be for, apart from what its documents and code currently
say, so that drift can be told apart from an approved change of intent. Run by `entropy-assessment` on every route,
and by `docs-first-planning-assessment` when entered directly. This file is its one definition; the rule guards carry
is in [`intent-change-rule.md`](intent-change-rule.md).

The steward is whoever can decide what the system is for: the owner of a personal project, or a lead or product owner
on a team.

## 1. Gather

Find the governing purpose, constraints and decision sources, and collect only the statements the assessment's gaps
need. Look in top-level documents (`README.md`, `INTENT.md`, vision or roadmap), decision logs and ADRs, state files,
and agent instruction files. Record each statement with:

- **where it is:** the file and line;
- **its kind:** a decision or directive (a decision-log entry, an ADR, a status banner, a standing instruction), a
  description, an observation from code, history or the running system, or an agent's inference;
- **its evidence of authority,** kept separate from its kind: attributed to the steward and dated, one of the two, or
  neither;
- **its date,** if any.

Record decisions and directives even when their author or date is unknown, and keep that uncertainty visible. Missing
attribution does not make a statement an inference, or mean there is no usable intent. If nothing says who the
steward is, that is a finding.

Read every existing guard's repair instructions against [`intent-change-rule.md`](intent-change-rule.md). An
instruction to edit intent documents to match the work, or to keep two copies of one thing in step ("update both"),
is a path for unauthorised drift: record it as a finding, quoting the line.

## 2. Compare three readings

- **Declared:** what the documents say the system is for.
- **Enacted:** what recent commits and open work actually pursued.
- **Authorised:** what the steward decided, in their own recorded words.

Steward decisions carry the most authority. Otherwise, follow the system's own precedence, such as a user-wide rules
file over a repository's, or a recorded decision over a description. A newer file is not more authoritative, and code
shows what was built, not what was approved. Never ask the steward to ratify a decision log as a block.

## 3. Classify each gap

| Condition | How to recognise it | Response |
|---|---|---|
| **Stale description** | A document contradicts a later recorded steward decision. | Correct it from that decision, citing it. Do not ask. |
| **Conflict** | Two sources prescribe incompatible things; no recorded decision settles which wins. | Present both, with sources. |
| **Missing** | An outcome or constraint the work depends on is stated nowhere. | Name the missing decision. |
| **Ambiguous** | A statement allows readings that lead to different work. | Give the readings and one concrete case where they diverge. |
| **Unauthorised drift** | What was enacted differs from what was authorised, and no decision covers it. | Fix the work, or record a proposed intent change. Never edit the intent documents to match. |
| **Prose control** | A rule is written as if enforced, and nothing enforces it. | Report where enforcement would sit, and whether anything cites the rule as a control. |

Gaps that do not depend on intent, such as broken links or a contradictory state file, are fixed as usual.

## 4. Ask rarely, and well

Ask only when the evidence cannot settle a gap **and** the answer changes what gets built or what a guard checks.

- **Limit:** at most five questions per run, one at a time when the steward is present.
- **What each question carries:** the statement and its source, the readings, one concrete case from this system
  where they diverge, and your recommended answer with its reason.
- **Settled decisions:** never reopen a recorded steward decision; settle staleness from it.
- **Guessing:** refuse to guess in both directions. Do not invent an answer the steward owes, and do not restate their
  words in vocabulary they did not use.
- **Steward absent:** record each question with its recommendation. Continue independent work, and draft the work
  that depends on an answer as provisional. Never implement, install or enforce a recommendation that needs a new
  decision. Before handing over, check every proposed patch against the open questions, so that none quietly settles
  one.

## 5. Record

- **Answers** go to the existing decision owner for that concern (`DECISIONS.md`, an ADR folder, an issue), dated and
  attributed, naming any entry they supersede. A system may have one decision owner per concern; do not gather every
  decision into one place.
- **A steward decision found only in an overwritten state file** is copied to its concern's durable record, with its
  source and date. Recording it is not deciding it again.
- **Proposed intent changes** are recorded there too, marked as awaiting the steward. Intent documents change only after
  the steward's recorded decision.
- **No new register.** Add a decision log only if there is none, the smallest one (the generator's `bootstrap.md`).
- **No usable intent at all:** stop guard work, report what could still be inventoried, and recommend an
  intent-elicitation interview, such as an `intent-architect`-style skill.

## Output

An **Intent** section in the assessment holding:

- the steward;
- the authorised intent, with the source of each part;
- the gaps by condition, with evidence;
- the questions, with recommended answers;
- any proposed changes, and where they were recorded.
