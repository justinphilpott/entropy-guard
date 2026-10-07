# Questions for the steward

Steward: Justin (`scope-orchestration-lab/scope.yaml`, `steward: justin`). No steward was available for this run, so
each question carries the answer I recommend, and the run continued on that recommendation: work that depends on an
answer is drafted only in the provisional patches (`patches/provisional-*.patch`) and nothing was applied. Findings
(F-numbers) are in `assessment.md`. Five questions, the limit; each changes what gets built or what the guard checks.
Asked in this order if Justin is present, one at a time.

## Q1. May a Scope package send a phone notice with its own text and tap link?

- **The statement.** ORC `AGENTS.md:98-102`: "`src/adapters/notifications/ntfy.ts`, which publishes durable-work
  notices to the ntfy topic the operator names in ORC's environment file. No model or agent reaches the ntfy
  transport, and it sends only a title, the notice's summary and the one configured tap address." The same claim is
  the comment at `test/architecture.test.ts:63` ("no model or agent reaches it").
- **What the code does (F9).** `src/adapters/phone/index.ts` (2 Oct, orchestrator#184) gives any approved package
  that declares the `phone` connector a notice through ORC's one ntfy sender, with the package's own title, text, up
  to five tags and any `http` or `https` tap address (`noticeProblem`, lines 46-52). The topic and server are fixed
  by the installation on the package's card (lines 3-4). The architecture test passes, because the phone adapter
  hands `fetch` to `publishNtfy` as a value, which its pattern `\bfetch\s*\(` does not match.
- **The readings.**
  - (a) Authorised as built. Approving the connector on the package's card is the explicit human choice
    `AGENTS.md:110-112` asks for; the `AGENTS.md` sentence and the test comment are stale.
  - (b) Not authorised as written. `AGENTS.md:73` and `SECURITY-REVIEW.md` question 2 count a generated link as an
    outbound channel, so a package-chosen tap link is a leg the rule meant to keep out; the code should limit the tap
    to ORC's own address.
- **Where they diverge.** A package tool forwards a model-written URL, with text from the conversation in its query
  string, as the notice's `click`. Under (a) it reaches Justin's phone as a tappable link; under (b) it is refused.
- **Recommended: (a).** The topic and server are the installation's, ntfy is Justin's own server, a link opens only
  on his tap, and the connector is approved per package on a card. The provisional hunk rewrites the sentence and
  the test comment to say what is built. If Justin prefers (b), the work is a code change in `noticeProblem` and the
  `AGENTS.md` sentence stays.
- **What it changes.** What ORC `AGENTS.md` lists as reach, and whether the guard's reach check treats a package's
  notice as inside the boundary.

## Q2. Is `STATE.md` capped at forty lines or sixty, and which file owns the cap?

- **The statements.** Lab `AGENTS.md:34`: "It holds current state only, capped at about forty content lines." Lab
  `STATE.md:4`: "Target: sixty lines." Neither is dated or attributed. `STATE.md` was 99 lines (87 non-empty) on
  4 Oct; after the settled patch it is 85 (F5).
- **The readings.** (a) Forty content lines, owned by `AGENTS.md`. (b) Sixty lines, owned by `AGENTS.md`, with
  `STATE.md` pointing to it. (c) Each file keeps its own number.
- **Where they diverge.** A 55-line `STATE.md` passes the guard's cap check under (b) and fails it under (a); under
  (c) the guard cannot tell which number to apply.
- **Recommended: (b).** One owner, the instruction file every session reads first. Sixty rather than forty, because
  the file now holds state for the central Scope across several repositories (Justin, 4 Oct: the lab is "the central
  Scope for project management"); the settled rewrite, which drops only history and duplicates, is still 85 lines,
  so forty would push current facts out. Whichever number, the cap should live in one file.
- **What it changes.** The guard's `STATE.md` length check, and how much the next refresh must cut.

## Q3. Are Justin's decisions about ORC recorded in the lab's `decisions/`, or in ORC's repository?

- **The statements.** Lab `SCOPE.md:19-21`: "Facts about ORC belong in its repository. ... Facts about their
  relationship, including Scope-owned agent context and policy, belong here." ORC has no decision log. The one ORC
  architecture decision on record, `decisions/2026-09-17-async-work-architecture.md`, is in the lab; others are in
  the lab's `STATE.md` (#194, 3 Oct), in code comments (`src/adapters/browser/playwright.ts:10`, "orchestrator#76,
  decided 3 Oct 2026") and in GitHub issues (F2). Justin, 4 Oct (in `STATE.md`): the lab is "the central Scope for
  project management, core issue tracking, code quality and security".
- **The readings.** (a) The lab's `decisions/` is the one decision record for ORC and the lab, with issues under
  orchestrator#140 as the working record. (b) ORC gets its own decision log, and the lab's `decisions/` keeps only
  the relationship and the lab's processes.
- **Where they diverge.** The design decision for scheduling (#166), which Justin chose to build first: under (a) it
  is written to `scope-orchestration-lab/decisions/`; under (b) to a new file in ORC.
- **Recommended: (a).** A decision record already exists and already holds ORC's async-work decision, the intent
  pass forbids a new register where one exists, and the 4 Oct decision makes the lab the place for project
  management. ORC's `AGENTS.md` then links to it.
- **What it changes.** Where the guard's decision check looks, and where the copies of #194 and ORC's north star go.

## Q4. One session-end guard in the lab for sessions in both repositories, or one in each?

- **The statement.** Justin, 4 Oct (in `STATE.md`): among the processes kept, "entropy guard at session end". No
  guard exists in either repository. Lab `AGENTS.md:3` sends lab sessions to `STATE.md` first; ORC `AGENTS.md:3-12`
  sends ORC sessions to `README.md`, `test/architecture.test.ts` and orchestrator#140, and never to the lab (F20).
- **The readings.** (a) One guard at `scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`, which ORC's
  `AGENTS.md` points to. (b) A guard in each repository; ORC's cannot read the lab's `STATE.md`, so it would need its
  own state file.
- **Where they diverge.** A session started in `~/pro/orchestrator` that builds #166 and changes no lab file. Under
  (a) it runs the lab's guard, which checks ORC's docs and reach and writes the next action into the lab's
  `STATE.md`. Under (b) it runs ORC's guard, and the lab's `STATE.md` learns of the work only at the next lab
  session.
- **Recommended: (a).** The lab owns the state file, the decisions and the map of work; one guard keeps one
  definition of the checks. The cost is one pointer in ORC's `AGENTS.md` to a path outside the repository, which the
  open-source rule there (`AGENTS.md:30-45`) aims at core, and its ratchet (`test/core-ties.ts`) scans only `src/`
  and `web/src/`.
- **What it changes.** Where the guard lives, which instruction files point to it, and what its baseline covers.

## Q5. Which items in ORC README's "Deliberately absent" list still each need their own decision?

- **The statement.** ORC `README.md:152-154`: "Deliberately absent, and each requires a decision rather than a
  convenience: reminders, scheduling, additional external data sources, workflow execution, sandboxes, shell access,
  and file edits."
- **What is known (F3).** Scheduling was decided on 2026-09-17 (`decisions/2026-09-17-async-work-architecture.md`,
  "schedule: now, at a time, or recurring") and is built (`src/core/async/types.ts:72`, `src/app/async/calendar.ts`).
  Durable work executes declared task types (same decision). Packages now bring data sources and connectors through
  cards (browser, calendar, mail, client records, advert files: `config/installation.ts:116-168`), and agents with
  memory append to a file in their Scope (`README.md:20-21`).
- **The readings.** (a) The list still binds: each item needs its own recorded decision, and a package card
  approving a connector is not one. (b) The list was a snapshot of 13 Sep; for a Scope's data sources, file access
  and durable work, approving its package on a card is the decision `AGENTS.md:110-112` requires; only reminders,
  sandboxes and shell access still need their own decision.
- **Where they diverge.** The finance Scope's mail connector to SMTP (`config/installation.ts:159-168`): under (a) it
  needs a recorded decision beyond its card; under (b) its card is enough.
- **Recommended: (b),** with scheduling and durable work cited to the 2026-09-17 decision. The provisional hunk
  rewrites the sentence that way. Removing "scheduling" alone is already settled by that decision, but it sits in the
  sentence this question quotes, so it waits with the rest.
- **What it changes.** Whether the guard's intent check asks for a decision record when a session adds a connector.
