# Questions for the steward

The steward is Justin (`scope-orchestration-lab/scope.yaml`, `steward: justin`). No steward was available in this
run, so each question carries the answer I recommend, and the work continued on that recommendation. Work that
depends on an answer is drafted as provisional and is not applied: the targets are read-only, and nothing here
installs or enforces a recommendation that needs a new decision. Finding ids (F1 to F21) refer to `assessment.md`.

Four questions, in the order they matter. Each is about a choice that changes what gets built or what the guard
checks; gaps the evidence could settle are corrected in the patches instead, and are not asked.

---

## Q1. Where is each kind of decision recorded?

**The statement and its source.** Nothing names a decision owner per concern. Your decisions are currently found in
eight kinds of place (F2):
- `STATE.md` in the lab, which `AGENTS.md` says is overwritten at each verified event (the 4 Oct interview, the north
  star of 25–26 Sep, the merging rule of 25 Sep);
- the lab's `decisions/` folder, which holds one file, of 17 Sep;
- `memory/authority-rules-step-1.md`, whose plan is held in `~/.claude/plans/agile-booping-waffle.md`, where only Claude
  sessions can read it;
- quotations in ORC's `AGENTS.md` (12–13 Sep, 26 Sep, 2 Oct);
- code comments (`dangerfile.js:7`, "Justin, 2026-10-02: B"; `src/adapters/browser/playwright.ts:9`, "#76, decided 3 Oct");
- lab reports (`reports/2026-09-22-pushback-analysis.md` quotes 21 Sep);
- GitHub issues (#140's description holds the map rules);
- the user-wide rules file `~/pro/local-config/home/AGENTS.md` (not read in this run).

**The readings.**
- (a) One decision log for everything, in the lab's `decisions/`.
- (b) One owner per kind: the lab's `decisions/` for Scope, process and cross-repository decisions; the GitHub issue
  for an ORC design question, with the resulting rule stated once in ORC's `AGENTS.md` citing the issue; the
  user-wide file for rules across all projects. `STATE.md`, reports and code comments only link.
- (c) GitHub issues for everything.

**Where they diverge here.** Your 4 Oct choice that "the processes kept" include an entropy guard at session end is
today only in `STATE.md:43-52`. Under (a) or (b) it is copied to `decisions/`; under (c) it goes to an issue on the
map. The guard's "Decisions" pointer, and its check that a decision taken in a session was recorded in the right
place, both depend on the answer.

**Recommended: (b).** It matches what already works (Danger's rule is in `dangerfile.js` and `SECURITY-REVIEW.md`; the
async architecture is in `decisions/`), keeps ORC's decisions in ORC's own tracker as `SCOPE.md` "Authority" asks
("Facts about ORC belong in its repository"), and gives the 4 Oct decisions a home that is not overwritten. Also
move the authority-rules plan out of `~/.claude/plans/` into `memory/` or #149.

**What I did on this recommendation (provisional).** The lab patch copies the decisions found only in `STATE.md`
into `decisions/2026-10-04-copied-from-state.md`, and records this run's proposals in
`decisions/2026-10-07-proposals-from-entropy-assessment.md`. The guard names `decisions/` and the owning issue, and
says the choice is unresolved.

---

## Q2. Should ORC's boundary documents describe the browser, ORC's restart service and package notices?

**The statements and their sources** (F7, F8).
- ORC `AGENTS.md:92-96` lists where subprocess access exists: the Pi child, `git log`, the MCP adapter.
  - It omits `src/adapters/orc-service.ts`, which runs `systemctl`, `pnpm install` and the build (`orc-service.ts:3-4,
    102, 128`).
  - `test/architecture.test.ts:828-835` allows that module.
- ORC `AGENTS.md:98-104` says direct network access exists "only" in `src/core/research-tools.ts` and
  `src/adapters/notifications/ntfy.ts`.
  - It omits `src/adapters/browser/playwright.ts`, which resolves host names with `node:dns/promises` (line 14) and
    drives Chromium to a grant's approved hosts.
  - The architecture test's network check (`test/architecture.test.ts:1295-1312`) matches neither `node:dns` nor a
    `playwright` import, so it passes.
- ORC `AGENTS.md:100-101` says "No model or agent reaches the ntfy transport". `src/adapters/phone/index.ts:1-8` lets
  a Scope package send notices through ORC's one ntfy sender, since #184 (2 Oct).
- ORC `README.md:5-7` lists ORC's "read-only external data paths" as Bookwhen and Jina only. `README.md:145-150` says
  the model "cannot" reach more. `config/installation.ts` binds Scope packages to:
  - a browser with page actions on `movingstillness.bookwhen.com` (lines 128-134);
  - a mail connector with an SMTP host (lines 159-168);
  - client records (line 156);
  - a calendar API token (line 121);
  - phone notices (line 86).

**The readings.**
- (a) These lists describe what was built. The browser (#76, decided 3 Oct), the restart card, and package notices
  (#184) were each approved through a reviewed pull request and package cards, so the documents should say so.
- (b) These lists prescribe the boundary. Each omitted path is a widening that needs your explicit decision first,
  and the code is reviewed against the lists until then.

**Where they diverge here.** Under (a) the provisional ORC patch is applied as written, and the guard treats a future
difference as a stale description. Under (b) the patch is not applied, and the three paths are proposals waiting on
you, each with its security review read again. Either way the guard's boundary check reads the same files; what
changes is whether its repair corrects the documents or files a proposal.

**Recommended: (a), after you confirm each of the three was approved.** The evidence shows each was built and that
guarded paths need a `## Security review` section on the pull request. I could not read the pull requests to see
the sections. Also:
- add a mechanical check: extend the architecture test to confine `playwright` imports and `node:dns` to the browser
  adapter;
- make one document own the boundary list: `AGENTS.md` "Boundaries", with `README.md` "Boundary" reduced to a summary
  that links there.

**What I did on this recommendation (provisional).** The hunks that depend on this question are in a separate patch,
`patches/orc-boundary-provisional.patch`. Each is labelled Q2, and none is applied.

---

## Q3. Which pace rule does the guard apply to new work?

**The statements and their sources** (F3).
- Lab `AGENTS.md:27-29`, unattributed and undated: "`/home/justin-philpott/pro/agentic/HOW_NOT_TO_PLAN.md` governs
  new design work: one scored real use must come first. Keep implementation examples small".
- Your words of 21 Sep 18:05 and 18:11, quoted in `reports/2026-09-22-pushback-analysis.md:127-133`: "Being too
  conservative and afraid to build just a couple more abilities into tools and processes because 'we have to prove we
  need it'…" and "relax suggested development to 'what is naturally needed given where we are and what's likely
  coming next'", bounded by "I'm not saying to release all restraint and start building out huge edifices that don't
  have a clear reason".
- `reports/2026-09-25-direction-review.md:180-182` (an agent's report, not your decision) reads them together as
  "stop building a new platform system unless a failure on the active job pulls it and a second job is named".

**The readings.**
- (a) `AGENTS.md` governs: a capability without a scored real use is drift.
- (b) Your 21 Sep words govern: completing a capability that the work in hand naturally needs is authorised, and a
  new system still needs a clear reason.

**Where they diverge here.** Take a session that adds a timeout and a lookup by name to a Moving Stillness package tool
that no failure has yet needed. Under (a) the guard's intent check reports it as a change of intent nobody decided.
Under (b) it passes. Neither `HOW_NOT_TO_PLAN.md` nor the user-wide rules file was read in this run; either may
already settle this.

**Recommended: (b) for completing capabilities on work already on the map (#140), and (a)'s "one real use first" for
starting a new system.** Record it in `decisions/` (or wherever Q1 places it), and make `AGENTS.md` "Pace" cite that
record. The guard's intent check stays neutral until then: it names both sources and reports, without blocking.

---

## Q4. Is `STATE.md` capped at forty content lines or sixty?

**The statements and their sources** (F11). Lab `AGENTS.md:34` says `STATE.md` is "capped at about forty content
lines". `STATE.md:4` says "Target: sixty lines". The file has 87 non-blank lines. Neither number is attributed or
dated, and no recorded decision settles which wins.

**Where they diverge here.** The proposed `STATE.md` in `patches/lab-state-and-decisions.patch` has 49 content
lines below its headings (55 non-blank, 66 in all). It meets the sixty when blank lines are not counted and fails the
forty, so the guard's state check passes or fails depending on your answer.

**Recommended: one number, stated once, in `AGENTS.md` "Keeping state", with `STATE.md`'s header linking to it rather
than repeating it.** Which number is yours to choose. I would keep `AGENTS.md`'s forty: it is the standing
instruction, and the version I proposed shows that the waiting list, rather than the state, is what pushes the file
past forty. The patch leaves both texts unchanged.
