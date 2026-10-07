# Questions for Justin, the steward

No steward was available during this run. Each question records the recommended answer. The run carried on with that
recommendation, but only as provisional patches. Nothing that depends on an answer is in a settled patch. Finding ids
(F1–F20) refer to `assessment.md`.

## Q1. Where should the one session guard for ORC and the lab live?

- **The statement:** "entropy guard at session end", one of the processes you kept on 4 Oct (lab `STATE.md` L49).
  The guard generator's default is `skills/session-coherence-guard/SKILL.md` in a repository. The skills rule of
  30 Sep (`reports/2026-09-30-skills-one-home.md`) puts a skill for one code repository in that repository, and a
  skill for one Scope's agents in that Scope's `skills/`.
- **The readings:**
  - (a) One guard in the lab's `skills/`, linked from both `AGENTS.md` files.
  - (b) One guard in ORC's repository.
  - (c) One guard per repository.
- **Where they diverge:** a session renames how ORC picks its state directory and leaves the lab's
  `tools/collect.mjs` reading the old one (F15). A guard covering both repositories sees the break. A per-repository
  ORC guard does not. Under (b), ORC's repository would also carry your name and the lab's paths, which ORC
  `AGENTS.md` L32-42 keeps out of core.
- **Recommended: (a).** You made the lab the central Scope for project management and code quality on 4 Oct. The
  costliest drift sits between the two repositories. ORC's `AGENTS.md` needs only a two-line pointer.

## Q2. Where are decisions about ORC itself recorded?

- **The statement:** decisions are currently found in several places (F2):
  - lab `STATE.md`, which is overwritten;
  - lab `decisions/`, which holds one file, about ORC's durable work;
  - `memory/authority-rules-step-1.md`;
  - reports;
  - code comments that quote "the operator";
  - GitHub issues.
  Lab `SCOPE.md` L19-21 puts facts about ORC in ORC's repository, but says nothing about decisions.
- **The readings:**
  - (a) In the lab's `decisions/`, dated and attributed, with a decision about a single issue kept on that issue.
  - (b) A `DECISIONS.md` in ORC's repository.
  - (c) As now, wherever the session is.
- **Where they diverge:** the north star you gave on 25 and 26 Sep sits only in `STATE.md`. Under (c) it disappears
  at the next overwrite. Under (a) or (b) it has one home that the guard points to.
- **Recommended: (a).** It already holds the 2026-09-17 decision about ORC, and it matches your 4 Oct decision that
  the lab is the central Scope. It also keeps your setup out of ORC's repository. The settled patch copies the
  decisions found only in `STATE.md` into the lab's `decisions/` either way. That copy keeps them safe. It does not
  decide this question.

## Q3. Which of README's "deliberately absent" reaches have been decided?

- **The statement:** ORC's README L152-154: "Deliberately absent, and each requires a decision rather than a
  convenience: reminders, scheduling, additional external data sources, workflow execution, sandboxes, shell access,
  and file edits."
  - Scheduling is settled by your 2026-09-17 decision, so the settled patch corrects only that word.
- **The code** (F5) has these:
  - browser writes to `movingstillness.bookwhen.com` (`click`, `replace`, `select`, `confirm`, and the slots apply);
  - Finance mail through Proton SMTP, and client and outbox folders;
  - advert folders;
  - memory appends.
  You approved the build cards that bind them (`STATE.md` L31-32, L91-92). No record found here says those approvals
  lift README's list.
- **The readings:**
  - (a) They are decided parts of ORC's reach: each further site, mailbox or folder needs its own card, and README
    describes them.
  - (b) They are still exceptions awaiting a decision, so README keeps listing them as absent.
- **Where they diverge:** take a reviewer working through `SECURITY-REVIEW.md` question 1, "What does this let an
  agent do that it could not do before?", on a package that adds a second booking site. Under (a) it is one more of
  an approved kind, judged on its card. Under (b) it is new authority, and needs a decision first.
- **Recommended: (a).** Record one dated decision naming the kinds of external write that are authorised and the card
  as their control. Then apply the provisional README patch, which says this and keeps reminders, workflow execution,
  sandboxes and shell access absent.

## Q4. What may package code itself launch or reach?

- **The statement:** ORC `AGENTS.md` L96: "Approved Scope packages may implement separately declared connectors: the
  backends that reach an outside service." But `src/adapters/agent-files/bundle-imports.ts` lets an approved bundle
  import any `node:` built-in, and bundles run inside ORC's process (F10).
- **The readings:**
  - (a) A package's reach is bounded by your approval of its exact build. AGENTS.md says so.
  - (b) Package code reaches out only through ORC-provided connectors, and the bundle check refuses
    `node:child_process`, `node:net`, `node:tls`, `node:http(s)` and `node:dgram`.
- **Where they diverge:** a package bundle that imports `node:child_process` and runs `curl` is approved today under
  (a) and refused at build under (b). Under (b), Finance's mail connector, which a Scope package implements, would
  need to move behind an ORC connector first.
- **Recommended: (a) now, as the description of what is true.** Also show a bundle's `node:` imports on its build
  card, under #154 (a package declares everything), so your approval sees them. Move towards (b) only if a review
  finds a reason. This needs your decision because it states a security boundary.

## Q5. Which pace rule governs new work?

- **The statement:** lab `AGENTS.md` L27-29: "`HOW_NOT_TO_PLAN.md` governs new design work: one scored real use must
  come first. Keep implementation examples small." Against it, your words of 21 Sep 18:05 and 18:11, quoted in
  `reports/2026-09-22-pushback-analysis.md` L127-135: "relax suggested development to 'what is naturally needed given
  where we are and what's likely coming next'", without "building out huge edifices that don't have a clear reason".
- **The readings:**
  - (a) Both hold, for different things. A new platform system needs a scored real use first. Completing a thing
    already being built follows "what is naturally needed".
  - (b) The 21 Sep calibration replaces the real-use-first rule.
- **Where they diverge:** take the daily diary and weekly reviews you kept on 4 Oct, to run through scheduling
  (#166), which has never had a schedule registered (`reports/2026-09-25-direction-review.md`). Under the rule as
  written, building #166 would wait for a scored use. Under (a) or (b) it goes ahead as naturally needed, which is
  what you decided.
- **Recommended: (a).** It is the reading the 25 Sep direction review proposed ("keeps 'fix the wall' and adds a
  reason test"). The provisional patch adds your 21 Sep words to the lab's Pace section with their date, and changes
  nothing else.
