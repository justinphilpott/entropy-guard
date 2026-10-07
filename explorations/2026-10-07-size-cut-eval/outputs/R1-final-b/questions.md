# Questions for Justin, the steward

Five questions, the most the intent pass allows. Each is a choice that changes what gets built or what the guard checks.
No steward was present, so this run continued on each recommendation. Work that depends on an answer is drafted as
provisional, and nothing that needs a new decision was applied. Findings (F) and gaps (I) are in `assessment.md`.

---

## Q1. Were three extensions of ORC's documented boundaries authorised?

**The statements, all in ORC's `AGENTS.md`, "Boundaries":**
- (a) ntfy. `AGENTS.md:101-102`: "No model or agent reaches the ntfy transport, and it sends only a title, the notice's
  summary and the one configured tap address."
- (b) Subprocesses. `AGENTS.md:92-96` names three modules that launch subprocesses.
- (c) Credentials. `AGENTS.md:64`: "credentials are read in one place"; also `README.md:103`, "exactly one place,
  `src/runtime.ts`".

**What the code does:**
- (a) `src/adapters/phone/index.ts:32-38` lets an approved package send its own title, text, tags and any http(s)
  `click` address to the ntfy topic.
- (b) `test/architecture.test.ts:822-835` admits a fourth module, `src/adapters/orc-service.ts` (orchestrator#101). It
  runs git reads, `pnpm install`, `scripts/build.mjs` and `systemctl`. Playwright's `chromium.launch` in
  `src/adapters/browser/playwright.ts:55` is a delegated process launch that neither the text nor the test names.
- (c) `src/adapters/scope-credentials.ts` reads a Scope's credential files when a package activates.

**The readings:**
- **Authorised.** Each was approved, through its PR's security review and your approval of cards, and the text simply
  lags. If so, the text should change, citing a recorded decision.
- **Not authorised.** The text is the boundary. If so, the code has crossed it, and goes back inside or comes to you as
  a proposal.

**A concrete case where they diverge:** a package's phone notice whose `click` link carries data in its URL.
`AGENTS.md:72-73` counts "a generated link" as an outbound channel. Under the first reading this is a reviewed, known
leg. Under the second it is a new outbound channel that no decision granted.

**Recommended answer:** authorised, recorded one decision per extension in the lab's `decisions/`, and then the three
`AGENTS.md` passages updated to cite them. When recording (a), decide whether a package's `click` may be any http(s)
address, or only one the installation names. That is the one place where the old text was narrower in a way that
matters for the trifecta check.
- Why: all three are built, tested, and in daily use, and you approve their cards.
- But: observed use does not authorise changing a prescribed boundary, so the text waits for your word.

**What depends on it:** the boundary corrections, which `orc.patch` leaves out; the guard's "reaches outside" check,
which marks these three cases as open; and finding F5.

---

## Q2. Does README's "Deliberately absent" list cover ORC's core, or the whole installation?

**The statement:** ORC `README.md:152-154`, "Deliberately absent, and each requires a decision rather than a
convenience: reminders, scheduling, additional external data sources, workflow execution, sandboxes, shell access, and
file edits." `orc.patch` removes "scheduling" only, which the 17 Sep decision settles.

**The readings:**
- **Core.** ORC's own code lacks these; Scope packages may add reach under package approval.
- **Installation.** The running system, packages included, lacks them unless you decided otherwise.

**A concrete case where they diverge:** the finance Scope writes `invoicing.json` into the Waterlands vault through
ORC (`STATE.md:72-73`). The same applies to Moving Stillness's browser connector, an additional external data source
that writes to Bookwhen. Under "core" these are fine. Under "installation" each needs a recorded decision.

**Recommended answer:** core. Packages' reach is governed by package approval and grants (`AGENTS.md`, "Approval
cards" and the standing-grant paragraph). The README sentence should then say "ORC's core".
- Why: this matches A4 ("Core knows kinds of thing … never instances"), and it is how the system was built and
  approved.

**What depends on it:** the remaining five items' wording; the README intro's description of package connectors; and
what the guard treats as new authority.

---

## Q3. Is `STATE.md`'s cap about forty content lines, or sixty?

**The statements:** the lab's `AGENTS.md:34` says "capped at about forty content lines"; `STATE.md:4` says "Target:
sixty lines". The file is 99 lines (F3).

**The readings:**
- **Forty.** The standing instruction rules.
- **Sixty.** The header is a later, deliberate relaxation.

**A concrete case where they diverge:** a 50-line `STATE.md` passes one and fails the other. The proposed `STATE.md`
in `lab.patch` has 40 content lines, so it does not need the answer.

**Recommended answer:** the lab's `AGENTS.md` owns the cap, and the `STATE.md` header says "see AGENTS.md, 'Keeping
state'" rather than restating a number. Forty, unless you meant sixty.
- Why: conventions belong in the instruction file; one number in one place cannot drift; and nothing records why
  sixty.

**What depends on it:** the guard's cap check, which reports against both numbers until then.

---

## Q4. Where should the session-end guard live?

**The statement:** your 4 Oct decision keeps "entropy guard at session end" (`STATE.md:49`). The skills-one-home rule
(`reports/2026-09-30-skills-one-home.md:46-49`) says:
- a skill used across projects goes in local-config;
- one used by one Scope's agents goes in that Scope's `skills/`;
- one used for one code repository stays there.

This guard checks two repositories, so none of the three fits exactly.

**The readings, and where each puts the guard:**
- **(a)** the lab's `skills/session-coherence-guard/SKILL.md`, with a one-line pointer from ORC's `AGENTS.md`;
- **(b)** ORC's own `skills/session-coherence-guard/SKILL.md`, with a pointer from the lab;
- **(c)** two guards, one per repository.

**A concrete case where they diverge:** a Codex session that only edits ORC. Under (a) it must follow a path into a
personal Scope from ORC's `AGENTS.md`. That is a small tie to one Scope and one machine, which ORC's own open-source
test (`AGENTS.md:32-37`) avoids for code, though not so far for its docs. Under (b) the guard ships in ORC while
checking lab files. Under (c) the cross-repository checks (decisions, state, map) are written twice.

**Recommended answer:** (a).
- Why: your 4 Oct decision makes the lab "the central Scope for project management … code quality and security";
  most of the guard's checks read lab files; and one guard keeps the cross-repository checks in one place.
- The ORC pointer can be phrased so that it names no machine path: "run the session guard of the Scope that manages
  this work". That still needs your yes, because it adds a new directory.

**What depends on it:** the guard's path; the `AGENTS.md` lines in `integration.md`; and adoption.

---

## Q5. May `STATE.md` keep ORC's live facts, or only point to `pnpm service:status`?

**The statements:**
- The lab's `AGENTS.md:21`: "Do not duplicate repository facts here."
- `SCOPE.md:19`: "Facts about ORC belong in its repository."
- Against them, `STATE.md` records ORC's running commit, restart times and test counts.

**The readings:**
- **Project state.** A running build is project state, which the lab manages, so it belongs in `STATE.md`.
- **A repository fact.** It belongs to ORC and its tooling, so `STATE.md` only points to it.

**A concrete case where they diverge:** `STATE.md:88`, "main process started 2026-10-03 22:12:47 on `369628b`". Under
the first reading it stays, and is refreshed at each restart. Under the second it becomes "what runs:
`pnpm service:status`". That line was already wrong within the same file (F2).

**Recommended answer:** keep one dated "last observed" line per live service, saying where and when it was read, next
to the pointer to `pnpm service:status`.
- Why: you rely on `STATE.md` for "where are we", and a restart's verification is a verified event.
- But: three copies of one live fact (F2) is the failure, so one line, overwritten.

**What depends on it:** the shape of the `STATE.md` patch, which follows this reading as current practice; and the
guard's live-claims check.
