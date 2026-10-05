# Feedback on entropy-guard

These come from the upstream feedback checks in `entropy-assessment`, `guards-integrator` Step 8 and the generator.
The helper `skills/local/entropy-guard-feedback/SKILL.md` would open each as a GitHub issue with `gh issue create`.
This run had no web access, so the notes are left here, formatted for manual submission. There are four, and each is
distinct.

---

## 1. The front door: no route for a two-repository system with one docs-first repository

**Category:** assessment

**What I observed.** The system was ORC, a code-first TypeScript repository, together with the lab, a docs-first and
workflow-heavy Scope that manages ORC's work. Step 2 says to assess more than one repository as one system, and to
choose one shape. I chose B, mixed, which routes to Step 4.

The top risk turned out to be the lab's `STATE.md`. It is the file every session reads first, and it contradicts
itself about which build is live. That is exactly what `docs-first-planning-assessment` handles well:

- Step 2, the canonical truth map;
- Step 5, bringing the current-state file up to date;
- Step 8, the supersession and state-honesty checks.

Step 4c covers only "state and handoff files that contradict themselves". So I wrote the state-honesty checks without
that skill's guidance, and could not follow its rule to update the current-state file. Following the skills exactly
meant leaving that skill unused.

**Suggestion.** Let Step 3 route by member repository when a multi-repository system mixes shapes. Run Step 4 for the
system, and also run `docs-first-planning-assessment` Steps 2, 5 and 8 for any member repository that is docs-first.
Merge both into the one hand-off to the generator.

**Project context.** A personal agent platform: a TypeScript service with about 970 tests, plus a markdown Scope that
manages its work, with a state file overwritten several times a day by several agents (Claude, Codex, opencode).

## 2. The generator: "a guard must not hold issue numbers" when the system's rule surface is an issue

**Category:** guard-quality

**What I observed.** `session-coherence-skill-generator` says a guard must not hold "PR or issue numbers". In this
system, though, the standing rules for all work live in the description of one GitHub issue, the root of the map of
work. Both `AGENTS.md` files point every agent at that issue by number. It is a stable rule surface, not a current
work item. To obey the rule, the guard had to point at it indirectly: "the root issue named in the lab's `AGENTS.md`
and in `MAP_ROOT` in `tools/map.mjs`". That is harder for a fresh agent to follow.

**Suggestion.** Separate **pointers to stable rule surfaces**, such as a pinned issue, a map root or an ADR index,
which a guard may hold, from **current work items**, which it must not. One test would do: "would this number change
when the current task changes?"

**Project context.** The same system. GitHub issues and a GitHub Project serve as its planning surface.

## 3. The integrator: a guard placed in a folder that no tool loads

**Category:** integration

**What I observed.** The generator's default path, `skills/session-coherence-guard/SKILL.md`, puts the guard in a
folder that none of the target's agent tools load by themselves. The target's own records show this failure before:
"rules promoted into a file loaded by nothing". `guards-integrator` Step 5 asks whether the guard is in the agent's
standing instructions. It does not ask whether the place the guard lives is loaded by any tool, which is the more
basic check when several vendors' agents work in the same repository.

**Suggestion.** In `guards-integrator` Step 5, add: "Check which agent tools load the folder the guard is placed in.
If none does, the pointer in each agent-instruction file is the only discovery path, so make it explicit and verify it
with the fresh-session test."

**Project context.** Claude Code, Codex, opencode and Pi all work in the same repositories. Each loads skills from
different folders.

## 4. The intent pass: steward decisions held only in an overwritten state file

**Category:** skill

**What I observed.** `intent-pass.md` §1 gathers statements from decision logs, state files and agent instructions.
Here, the steward's most recent decisions, nine kept processes and the order of work, were recorded only in
`STATE.md`. That file's own rule is "overwritten at each verified event; do not append". The intent pass's conditions
have no case for "authorised, but recorded somewhere that is designed to forget". I classed it as **Missing**: no
durable decision surface. That needed a question to the steward, and a proposed entry that copies the decisions out
of the state file.

**Suggestion.** In §1 or §3, add a check: "Is any steward decision recorded only in a current-state or handoff file
that is overwritten? If so, copy it verbatim into the decision surface, attributed. This needs no question, because it
records rather than decides." It would also make the generator's rule, that a guard checks decision capture, concrete.

**Project context.** The same system. The state file is rewritten by agents many times a day, and has been found wrong
twice before.

---

No feedback was needed on routing B against D. Both route to Step 4, so the ambiguity cost nothing.
