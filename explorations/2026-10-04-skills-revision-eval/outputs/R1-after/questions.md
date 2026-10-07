# Questions for the steward (Justin)

There are four questions, each about a choice that changes what gets built or what the guard checks. No steward was
available, so each carries the answer this run recommends, and the run went ahead on that answer. Outputs that
depend on an answer are marked provisional, and the dependencies are listed under each question.

If the steward is present, ask them one at a time, in this order.

---

## Q1. Where should your decisions about ORC and the lab be recorded, so that they survive?

- **The statements, and where they are.** Your decisions are kept in six places today:
  - `lab/decisions/` holds one file, from 2026-09-17;
  - `lab/memory/authority-rules-step-1.md` holds your authority-rule answers of 1 Oct;
  - `lab/STATE.md:38-58` holds your interview decisions of 4 Oct and your decisions of 3 Oct;
  - `orchestrator/AGENTS.md` quotes your decisions of 12, 13 and 26 Sep and 2 Oct;
  - the description of orchestrator#140 holds the rules of the map;
  - `~/pro/local-config/home/AGENTS.md` holds the cross-agent rules.

  `lab/STATE.md:3-4` and `lab/AGENTS.md:33` say `STATE.md` is overwritten at each verified event, and never appended
  to.
- **The candidate readings.**
  - **(a)** `STATE.md` is a fine home for current decisions, and `decisions/` is only for architecture.
  - **(b)** Every decision of yours goes into `lab/decisions/`, dated and in your words, and `STATE.md` links to it.
  - **(c)** Decisions about ORC go into ORC's repository, and the lab holds only decisions about the relationship
    between ORC and its Scopes. This is the reading `lab/SCOPE.md:19` suggests.
- **A case from this system where the readings lead to different work.** Your 4 Oct list of nine kept processes
  (`STATE.md:43-52`) includes "entropy guard at session end". Under (a), the next agent to tidy `STATE.md` down to its
  cap may drop it, as the rule tells them to, and the guard loses its mandate. Under (b), it becomes
  `decisions/2026-10-04-central-scope-and-kept-processes.md`, and the guard's intent rule cites it. Under (c), the
  async-work decision of 17 Sep would move to ORC, where agents working in ORC would find it.
- **Recommended answer: (b), every decision in `lab/decisions/`.** `STATE.md` keeps one line per decision, with a
  link. Your 4 Oct decision made the lab "the central Scope for project management, core issue tracking, code quality
  and security", and `decisions/` already exists there with the right format: dated, attributed, and with its
  supersession named. ORC's `AGENTS.md` can keep quoting the decisions that constrain code, with a link back.
- **What depends on this.** The guard's intent rule and decision-capture check, and drafts P0 to P2 in
  `proposed-decisions.md`.

## Q2. Where does the session-end entropy guard live, and whose sessions does it cover?

- **The statement, and where it is.** "Entropy guard at session end" is one of the nine processes you kept on 4 Oct
  (`lab/STATE.md:49`). Nothing says which repository it lives in, or which sessions it covers.
- **The candidate readings.**
  - **(a)** It covers lab sessions only, and lives in the lab.
  - **(b)** One guard in the lab covers any session that changes ORC or the lab, and ORC's `AGENTS.md` points to it.
  - **(c)** Two guards: a generic one inside ORC with no Scope ties, and the lab's for cross-repository checks.
- **A case from this system where the readings lead to different work.** Take a session implementing #195 in an ORC
  worktree, which changes `src/` and restarts ORC.
  - Under (a), nothing checks that `orchestrator/AGENTS.md` still describes the boundary, or that `lab/STATE.md` says
    which build now runs. Those are the two places where drift is worst today (R1 and R2 in the assessment).
  - Under (c), ORC's guard cannot name the lab, `STATE.md` or athena without breaking your open-source test for ORC.
    That test covers `src/`, `web/src/` and `config/`, not `AGENTS.md`, but the spirit applies.
- **Recommended answer: (b).** Put one guard at `lab/skills/session-coherence-guard/SKILL.md`, covering both
  repositories. Add one pointer line in each repository's `AGENTS.md`. The lab is where you put code quality and
  project management on 4 Oct, and `skills/` in a Scope is the home for one Scope's agents. No coding tool loads a
  Scope's `skills/` by itself (`lab/FRICTION.md:610-616` records a rules file "loaded by nothing"), so the pointers
  are what make the guard findable.
- **What depends on this.** The guard's path and its "When to use" section, and the discovery plan in
  `integration.md`.

## Q3. What happens to the one-off branch reports at ORC's repository root?

- **The statements, and where they are.**
  - `orchestrator/AGENTS.md:154-155` says "Keep documentation concise and retrospective".
  - `orchestrator/README.md:22-23` says "Documentation stays concise".
  - The ORC root holds 7 branch reports: `REWORK.md`, `SEAM.md`, `OPERATOR.md`, `FIXES.md`, `SLICE1.md`,
    `POLICY-STORE.md` and `GRANTS-E2E.md`, between 190 and 580 lines each.
    - Several begin "Branch `feat/async-work-capability` … Nothing is pushed".
    - Between them they name 5 code paths that no longer exist.
  - Five more root documents are reference material that later work still cites: `GRANTS.md`, `MCP.md`,
    `CLASSIFY.md`, `TURN-RECORD.md` and `VISIBILITY.md`.
- **The candidate readings.**
  - **(a)** Leave them where they are.
  - **(b)** Move the 7 branch reports to a history folder, such as `docs/history/`, each with a one-line "superseded
    by" header, and keep the 5 reference documents at the root.
  - **(c)** Delete the 7, since git keeps them, after moving any decision they hold into `decisions/` or `AGENTS.md`.
- **A case from this system where the readings lead to different work.** An agent fixing the browser greps the
  repository for `browser/service.ts` and lands in `SLICE1.md` and `GRANTS.md`. Both describe enforcement in a file
  that no longer exists; the browser is now `src/adapters/browser/connector.ts` and `playwright.ts`. Under (a), the
  guard needs a standing "do not revive" check against those files. Under (b) or (c), it does not.
- **Recommended answer: (c) for the reports whose content survives in code or the decision log, and (b) for any whose
  reasoning would otherwise be lost.** This changes how your files are organised, so it waits for your yes. Until
  then, the guard's supersession check names the 7 files.
- **What depends on this.** The guard's supersession check, and setup action S4 in `integration.md`.

## Q4. Is `STATE.md` capped at forty lines or sixty?

- **The statements, and where they are.**
  - `lab/AGENTS.md:34` says it is "capped at about forty content lines".
  - `lab/STATE.md:4` says "Target: sixty lines".
  - Neither is attributed to you.
  - The file is 99 lines today, 87 of them non-blank.
- **The candidate readings.**
  - **(a)** About 40 content lines, as `AGENTS.md` says.
  - **(b)** 60 lines, as `STATE.md` says.
- **A case from this system where the readings lead to different work.** The trim that follows this assessment.
  Moving the 3 and 4 Oct decisions out to `decisions/` (Q1) removes about 20 lines. Removing the lines that are stale
  or contradictory removes about 10 more. That reaches 60, but not 40. Reaching 40 also means cutting "Waiting on
  Justin" down to links to the issues.
- **Recommended answer: (a), 40, with `AGENTS.md` as the one place the number is written.** The header in
  `STATE.md` would then say "cap: see `AGENTS.md`, Keeping state". `AGENTS.md` is the instruction file every agent
  reads. A self-description that disagrees with it is the kind of second home the guard is meant to remove.
- **What depends on this.** The number the guard's state-honesty check compares against. The guard reads it from
  `AGENTS.md`, so only the trim depends on the answer.

---

## Settled without asking

These were not asked, because the evidence settles them:

- **Tests on every PR.** You decided to keep this on 4 Oct, and the mechanism is already put to you in #144. Until it
  is built, the guard runs the tests itself, and it checks `.github/workflows/` to see whether that is still needed.
- **ORC README's "deliberately absent: scheduling", and its Bookwhen-in-core text.** Both are stale against your
  recorded decisions of 17 Sep and 12-13 Sep. The corrections are in `proposed-corrections.md` and cite those
  decisions.
- **"Workflow execution" in the same README list.** It is ambiguous. The guard does not depend on it, so it is
  flagged in `proposed-corrections.md` and not asked.
