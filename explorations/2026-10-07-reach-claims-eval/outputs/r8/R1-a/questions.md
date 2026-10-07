# Questions for the steward

Three questions, for Justin (the steward: `scope.yaml`, `steward: justin`). No steward was available in this run, so
each carries the answer recommended here, and the run continued on it: work that depends on an answer is drafted only
in `patch-provisional.diff`, which is not to be applied until he answers. Finding ids refer to `assessment.md`.

## Q1. Do the reach lists in ORC's `AGENTS.md` cover reach that a library or a launched process performs for ORC?

**The statement.** ORC's `AGENTS.md`, lines 98–101, not attributed or dated:

> Direct network access exists only in `src/core/research-tools.ts`, for read-only Jina Reader requests, and in
> `src/adapters/notifications/ntfy.ts`, which publishes durable-work notices to the ntfy topic the operator names in
> ORC's environment file.

`test/architecture.test.ts`, lines 1295–1312, enforces the same two modules.

**The readings.**
- (a) "Direct" means network calls ORC's own code makes. Reach that a library or a process ORC launches performs on
  its behalf is outside this list.
- (b) The list is ORC's inventory of what it reaches, so reach performed for ORC by a library or a launched process
  belongs in it, with the process that runs it.

**Where they diverge in this system.** The headless Chromium that `src/adapters/browser/playwright.ts:55` launches,
logged in with Moving Stillness's stored Bookwhen admin session (`playwright.ts:69`) and reaching
`movingstillness.bookwhen.com` and `cdn.bookwhen.com` (`config/installation.ts`). Under (a), the list and the test are
complete for their purpose. Under (b), both miss ORC's one logged-in path to a live business site, as well as Pi's
model-provider calls, `pnpm install` on a restart card, declared MCP servers, and Scope package connectors such as
SMTP (finding F2). Under either reading, the DNS lookups in `playwright.ts:520` are ORC's own code and are missing;
the settled patch already marks that.

**Recommended: (b).** Keep "direct" as the subset the test enforces, and add a listed inventory of delegated reach
beside it. The reasons:
- `AGENTS.md` lines 68–74 and `SECURITY-REVIEW.md` question 2 say an outbound channel is easy to miss, and count a
  DNS lookup as one.
- The subprocess list beside this sentence already counts a launch the MCP SDK performs for ORC.
- `FRICTION.md`, 2026-09-28: "nothing lists the tools an unattended run actually receives, so a permission set I
  wrote looked complete and was not."

**What depends on it.** The provisional hunks for the `AGENTS.md` network paragraph and the architecture test's
network check. Until it is answered, the guard's reach check reports against both readings.

## Q2. Where does the session-end guard live?

**The statement.** `STATE.md` line 49 lists "entropy guard at session end" among the processes Justin kept on
4 October. The generator's default path is `skills/session-coherence-guard/SKILL.md` in the repository, but this
system is two repositories. The lab's `reports/2026-09-30-skills-one-home.md` gives the skills rule: "Used by one
Scope's agents: that Scope's `skills/` ... granted by ORC. Used for one code repository: stays in that repository."

**The readings.**
- (a) One guard, in the lab's `skills/`, covering both repositories, with a pointer line in ORC's `AGENTS.md`.
- (b) A guard in each repository.
- (c) A cross-project skill in local-config.

**Where they diverge in this system.** Take an agent session that works only in `~/pro/orchestrator`:
- under (a), it meets one line in ORC's `AGENTS.md` naming a path in the lab;
- under (b), ORC carries its own guard, and the checks on `decisions/` and `STATE.md` are either repeated or split
  across two files;
- under (c), a cross-project location holds checks that name ORC's and the lab's files.

Reading (a) also stretches the skills rule: the lab's `skills/` was described as holding skills ORC grants to the
Scope's agents, while this guard is run by development agents.

**Recommended: (a), at `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`.** The reasons:
- Justin's 4 October decision makes the lab the central Scope for code quality, and lists this guard among the lab's
  processes.
- One guard is one definition.
- Every session's handoff ends in the lab's `STATE.md` whichever repository it worked in.
- ORC's rule that core ships with nothing tying it to an owner or a Scope (`AGENTS.md` lines 30–42) argues against
  placing in ORC's repository a guard that names the lab, Justin and athena's paths.

**What depends on it.** The guard's path; the "Before handing off" hunks in both `AGENTS.md` files; the placement in
`integration.md`.

## Q3. Which cap holds for the lab's `STATE.md`: about forty content lines, or sixty lines?

**The statements.** Neither is attributed or dated.
- The lab's `AGENTS.md`, lines 33–34: "It holds current state only, capped at about forty content lines."
- `STATE.md`, line 4: "Target: sixty lines."

`FRICTION.md`, 2026-09-23, speaks of "its own forty-line cap" and records a rewrite to 66 lines.

**The readings.**
- (a) `AGENTS.md`'s forty governs, and `STATE.md` should not state a number of its own.
- (b) Sixty governs, perhaps as a later relaxation nobody recorded, and `AGENTS.md` should change.

**Where they diverge in this system.** The settled rewrite of `STATE.md` has 38 content lines (44 non-blank lines with
headings), so it passes both. The 4 October version had 87 non-blank lines and failed both. A state file of 50 content
lines would pass (b) and fail (a), and the guard's state check would report it differently under each.

**Recommended: (a). `AGENTS.md` owns the cap, and `STATE.md` points to it.** The reasons:
- One owner per concept.
- `AGENTS.md` is the standing instruction every session reads, while `STATE.md` is overwritten.
- `FRICTION.md` shows forty was the cap in force on 23 September.

If sixty was a deliberate later choice, record it in `decisions/` and change `AGENTS.md`.

**What depends on it.** The provisional hunk replacing `STATE.md` line 4, and the guard's state check.

## Asked before, and not asked again here

These were already put to Justin by earlier work, according to the records read. They are connected to that work
rather than repeated:
- **orchestrator#144, tests on every pull request: GitHub Actions or a pre-push hook?** `integration.md` recommends
  Actions.
- **Design review target 4, the 12 top-level reports in ORC: harvest, then delete?** It is waiting on his word
  (`reports/2026-10-01-design-review.md`).
- **Design review target 5: operator commands go through the running ORC** (#62).
- **The README cleanup** (`reports/2026-10-01-review-synthesis.md`, item 7, "on your word"). The settled patch here
  covers it, citing his recorded decisions.
