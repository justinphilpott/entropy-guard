# Upstream feedback on entropy-guard (not filed)

These notes come from the upstream feedback checks in `entropy-assessment`, `docs-first-planning-assessment` and
`guards-integrator`. They are formatted for `skills/local/entropy-guard-feedback/SKILL.md`, and were not filed:
filing needs `gh` and the web, both out of bounds for this run. They are distinct, so they are kept as separate
notes.

---

## 1. Intent pass: the "Stale description" test needs a steward decision, but most decision logs are unattributed

**Category:** assessment

**What I observed:** The target's `DECISIONS.md` has 14 entries, none dated or attributed. The intent pass says
missing attribution does not make a decision an inference. But the "Stale description" condition requires "a later
recorded **steward** decision", and nothing says whether an unattributed entry in the system's own decision log
qualifies, or how to tell "later" when entries carry no dates and the log is in mixed order. Here, one entry points
to its superseder "below" and another to its superseder "above". I treated the log as the system's recorded
decisions and said so in the assessment, but another run could reasonably refuse the correction and ask instead,
spending one of its five questions.

**Suggestion:** Say whether a decision in the system's own decision log, with no author, can settle staleness, and
how to order undated entries: by explicit supersession markers, then by dated documents that cite them.

**Project context:** a markdown-first repo whose decision log has no dates or authors; a docs-first route.

---

## 2. Guard generator: no way to label mechanical checks that could not be run on the target

**Category:** guard-quality

**What I observed:** The generator requires "Mechanical checks with exact commands that work in this repo", and the
"What changed" definition is built on git. The target was a snapshot without `.git`, so the git commands and
`git diff --check` could not be run, and nothing in the guard says which commands were verified. `guards-integrator`
has `verified`, `planned` and `unknown`; the generator has no equivalent for its own commands.

**Suggestion:** Ask the generator to record, in its report and not in the guard, which commands were run against the
target and with what result, and to label the rest as not exercised.

**Project context:** the target was a read-only snapshot, the kind used in evaluation runs and audits of exported
copies.

---

## 3. Integrator: the fresh-session discovery check cannot be clean when the agent's own environment preloads the same instructions

**Category:** integration

**What I observed:** Step 6 asks for a fresh agent session with no prior context. Any session this run could start
loads the live entropy-guard repository's `AGENTS.md`, which names the same guard path as the target. So the session
could not show whether the target alone leads a fresh agent to the guard. I reported discovery as `planned`, with
the reason.

**Suggestion:** Add one line to Step 6: if the available sessions inherit instruction files that mention the guard,
the discovery check is not clean. Report it as `planned`, and name the environment it needs.

**Project context:** an assessment of an entropy-guard copy, run from inside entropy-guard. Self-assessment is
common for this repo.

---

## 4. Generator: the intent-change rule assumes a steward, and has no variant for a collaboratively governed intent document

**Category:** guard-quality

**What I observed:** The target's own rules let any contributor, agent included, revise `INTENT.md`
(`AGENTS.md:27`, `INTENT.md:3`). The generator requires every guard to carry rule v2 verbatim, and step 4 forbids
editing the intent document without the steward's decision. If the steward answers that intent is collaborative,
the copied rule contradicts the repo's standing instruction, and the generator offers no adaptation. I made the
guard provisional on that question.

**Suggestion:** Say what the generator does when the intent pass finds that intent is deliberately open to all
contributors: fill `<steward>` with the governing group and its process, or hold the guard until the question is
answered.

**Project context:** a docs-first repo where AI agents are first-class contributors to the intent document.
