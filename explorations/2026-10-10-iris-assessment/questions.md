# Questions for Justin

These are from the entropy-guard assessment of Iris-app (the orchestrator repository at `a694039`) and the
orchestration lab (`56a32e0`), 10 Oct 2026. You were not available, so each question carries my recommended answer.
Work went ahead on each recommendation only as a provisional patch, which waits for your answer. All four questions
are also recorded as awaiting you in the lab's `memory/central-scope.md`, "Waiting", by `settled-lab.patch`.
Finding ids (F1 and so on) refer to `assessment.md`.

## Q1. Where does the session-end guard live, and does one guard cover both repositories?

- **The statement.** The lab's `memory/central-scope.md:26` lists "entropy guard at session end" among the lab's
  twelve processes (your decisions of 4 to 7 Oct). It does not say where the guard lives. Two rules bear on the home:
  - entropy-guard's generator puts a guard at `skills/session-coherence-guard/SKILL.md` in "the repository";
  - your user-wide rules give a skill one home: "a Scope's `skills/` for one Scope's agents", or "a repository's own
    folder for one repository".
  Creating a folder needs your say-so.
- **The readings:**
  - **(a)** One guard in the lab, at `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`. It
    checks a session's changes in both repositories, and both `AGENTS.md` files point at it.
  - **(b)** Two guards, one per repository. The orchestrator has no `skills/` folder today, so this creates one.
  - **(c)** One shared skill in local-config's `home/.agents/skills/`.
- **Where they diverge, in this system.** Take a session in `~/worktrees/orchestrator/<branch>` that merges #328's
  PR 4 (Pi behind its port: the front door's tools) and then updates the lab's `STATE.md`.
  - Under (a), one run checks both the merge and the `STATE.md` claim about it.
  - Under (b), the lab's guard checks the `STATE.md` claim without seeing the pull request, and the orchestrator's
    guard repeats the decision and state checks.
- **Recommended: (a).** The lab is the central Scope "for project management, Core's issue tracking, code quality and
  security" (`memory/central-scope.md:8`). The state file, the decision records and `FRICTION.md` the guard checks
  are all the lab's. The lab already has an empty `skills/` folder. One guard keeps one copy of the checks.
- **Waiting on this:** `provisional-Q1-guard-home-lab.patch` and `provisional-Q1-guard-home-orchestrator.patch`.

## Q2. Do the lab's "Pace" line and the orchestrator's "Working Style" line still govern?

- **The statements:**
  - Lab `AGENTS.md:27-29` (3 Sep): "`HOW_NOT_TO_PLAN.md` governs new design work: one scored real use must come
    first."
  - Orchestrator `AGENTS.md:220-221`: "Use small working examples before generalising."
  - Your user-wide rule "Build the whole thing, not the proven minimum" (21 Sep): build "what is naturally needed
    given where we are and what's likely coming next".
  - Your user-wide rule "Before building a part, ask what it is one of" (10 Oct): at the second case, build the
    general version.
- **The readings:**
  - **(a)** Both repository lines still govern. Design waits for a scored real use, and generalising waits for
    examples.
  - **(b)** The user-wide rules replace them where they differ. "Keep documentation retrospective" stays.
- **Where they diverge, in this system.** On 10 Oct, the scheduled-agent design for #362 (the Pi release watch,
  `reports/2026-10-10-scheduled-agent-design.md`) designed Iris-app's general scheduling capabilities with no scored
  real use of a scheduled agent.
  - Under (a), the guard's intent check flags it as drift.
  - Under (b), it passes. It is a second case, alongside the lab's routine processes.
- **Recommended: (b).** The user-wide rules are later, attributed to you and dated, and the system's own precedence
  puts user-wide rules above a repository's. Your own 7 Oct Registry decision was also design ahead of a scored use.
  - **Caveat:** I did not read `HOW_NOT_TO_PLAN.md`. It sits outside the two repositories, so it may say more than
    the line quotes.
- **Waiting on this:** `provisional-Q2-pace-lab.patch` and `provisional-Q2-pace-orchestrator.patch`.

## Q3. Is plain "Iris" kept out of repository prose now, or only when the rename reaches it?

- **The statement.** Orchestrator `docs/GLOSSARY.md` gives two lines that pull different ways:
  - lines 17-19: "Plain 'Iris' is not used on its own … (Justin, 10 Oct 2026: 'From now on in our chats we'll refer
    to Iris-app, or Iris-agent')";
  - lines 4-5: "These are the target names: the project-wide rename brings the code, the repository and the service
    to them."
- **The readings:**
  - **(a)** The rule covers chats now. Repository prose moves when the project-wide rename (#50) reaches it.
  - **(b)** It covers all new or rewritten prose from 10 Oct. Existing prose moves with the rename.
- **Where they diverge, in this system.** Suppose a pull request on 11 Oct adds the line "Iris raises a card" to the
  orchestrator's `AGENTS.md`.
  - Under (a), the line is fine until the rename.
  - Under (b), it should say "Iris-app".
  - The guard's names check either reports the line or does not.
- **Recommended: (b),** for new or rewritten prose only. The glossary's own line states the rule without the "chats"
  limit, and every new plain "Iris" adds work for the rename. Until you answer, the guard reports new plain "Iris"
  and changes nothing. The settled patches write "Iris-app" in their new text, which fits either reading.
- **Waiting on this:** no patch; only the guard's report changes.

## Q4. How long may `STATE.md` be?

- **The statements.** Lab `AGENTS.md:34` (3 Sep) says `STATE.md` is "capped at about forty content lines". The
  file's own header, `STATE.md:5` (24 Sep), says "Target: sixty lines". Neither is attributed. The file was 62 lines
  at `56a32e0`.
- **The readings:**
  - **(a)** About forty content lines.
  - **(b)** Sixty lines.
- **Where they diverge, in this system.** Today's file is about twenty lines over (a) and just over (b). The guard's
  state check flags it under (a), or treats it as near the cap under (b). After `settled-lab.patch` it is 67 lines.
- **Recommended: (b), sixty lines, with one owner.** The cap belongs in the lab's `AGENTS.md`, "Keeping state",
  derived from what the file must hold, and `STATE.md`'s header should point there. Your rule is that a size limit
  is derived, never picked. The derivation adds up to sixty:

  | What the file must hold | Lines |
  |---|---|
  | Header | 5 |
  | North star | 4 |
  | How we work | 6 |
  | Up to five active fronts, at four lines each | 20 |
  | Your next actions | 6 |
  | Your other open decisions | 6 |
  | Misleading material nearby | 3 |
  | Spacing | 10 |
  | **Total** | **60** |

  The file has been written to about sixty lines since 24 Sep.
- **Waiting on this:** `provisional-Q4-state-size-lab.patch`.
