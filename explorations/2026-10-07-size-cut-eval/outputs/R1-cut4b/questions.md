# Questions for the steward (Justin)

Four questions. Each is one the evidence in the snapshot cannot settle, and each changes what gets built or what the
guard checks. Finding ids refer to `assessment.md`. With no steward available, the run continued on each recommended
answer, and drafted the work that depends on it as provisional: nothing that needs one of these decisions was applied
to the targets.

Already open with Justin, so not asked again here: #144 (how tests run on every pull request), #196 (where agent
worktrees live), #166 (scheduling), #198 (connector names checked across repositories), #74 (an independent read for
grantable task types).

---

## Q1. Which items in ORC's "Deliberately absent" list are still excluded until you decide them?

- **The statement.** ORC `README.md` lines 152–154: "Deliberately absent, and each requires a decision rather than a
  convenience: reminders, scheduling, additional external data sources, workflow execution, sandboxes, shell access,
  and file edits."
- **Already settled, so not asked:** "scheduling". Your decision of 2026-09-17 (the lab's
  `decisions/2026-09-17-async-work-architecture.md`) makes scheduling part of ORC. `doc-corrections.patch` removes that
  one word and cites the decision.
- **The readings, for the rest:**
  - A: each remaining word is still a standing exclusion, and anything that touches it needs a recorded decision.
  - B: the list described ORC when it was written, and the work since has lifted some items without a decision being
    written down.
- **Where the readings diverge, concretely:**
  - "File edits": README lines 21–22 say an agent with memory "reads and appends to a markdown file in its Scope", and
    the Finance package writes invoices to an outbox directory (`config/installation.ts` 161–163). Under A these need
    a decision, or a narrower meaning of "file edits"; under B they are simply allowed.
  - "Additional external data sources": the browser now reaches Bookwhen's admin site under a grant, and packages send
    phone notices.
- **Recommended answer: A, with "file edits" narrowed.** Keep the sentence as a standing rule. Read "file edits" as
  edits a model directs to files outside its own Scope's memory and outbox, because README 21–22 already describes
  memory appends as intended. For each remaining item, record the decision or issue that lifted it (the browser:
  orchestrator#76 and the standing grants, #67), or leave it excluded.
- **What changes with the answer:** whether the guard's intent check (guard check 4) asks for a decision when a
  change touches one of these items, and the wording of P1 in `decisions/2026-10-07-proposed-intent-changes.md`.
- **Finding:** F10.

## Q2. Did you authorise Scope packages to send phone notices through ORC's ntfy sender?

- **The statement.** ORC `AGENTS.md` lines 100–102: "No model or agent reaches the ntfy transport, and it sends only a
  title, the notice's summary and the one configured tap address."
- **What the code does.** `src/adapters/phone/index.ts` lines 1–8 provide a built-in phone connector that packages
  declare as `{ "factory": "phone" }`. Its first user, on 2 Oct, was a Scope agent that pings you when its work is
  ready for review (#184). The installation fixes the topic and server; the package cannot choose them.
- **The readings:**
  - A: approving a package's build card, which lists its connectors (`AGENTS.md` 134), is the "explicit human choice"
    `AGENTS.md` 110 requires. The `AGENTS.md` sentence is then out of date and should be corrected.
  - B: a package reaching an outbound channel is new authority that needed its own decision. None is recorded in the
    snapshot, so this is unauthorised drift until you decide it.
- **Where they diverge:** the next package that declares `{ "factory": "phone" }`. Under A, its card approval is
  enough. Under B, it needs a recorded decision first, and the security review should name the phone connector as an
  outbound channel.
- **Recommended answer: A, and record it.** The connector is bounded and approved per package on a card. Record the
  decision, on #184 or in the lab's `decisions/`. Then change `AGENTS.md` 100–102 to say packages reach the ntfy
  sender only through the phone connector their card approves. Until then, `AGENTS.md` stays as it is; no patch here
  touches that sentence.
- **Finding:** F9. Proposal P2.

## Q3. Where should the session-end guard for ORC and the lab live, and is there an existing one to refine?

- **The statement.** `STATE.md` line 49 lists "entropy guard at session end" among the processes you kept on 4 Oct.
  Neither repository holds a guard: the lab's `skills/` has only `.gitkeep`.
- **The readings:**
  - A: there is no guard yet, and one should be built for the two repositories together.
  - B: a guard exists outside the snapshot (local-config, say), and the new checks should refine it.
- **Where it lives also diverges**, under the skills rule of 30 Sep (`reports/2026-09-30-skills-one-home.md` 46–49):
  - the lab's `skills/`, a Scope's own folder;
  - ORC's repository, the rule for one code repository;
  - local-config's `home/.agents/skills/`, for use across projects.
- **Recommended answer: A, in the lab's `skills/session-coherence-guard/SKILL.md`**, with a one-line pointer from both
  `AGENTS.md` files. On 4 Oct you made the lab the central Scope for project management, code quality and security,
  and `STATE.md`, `FRICTION.md`, `decisions/` and the map tools all live there.
- **What changes with the answer:** where `guard/SKILL.md` is installed, and the entry points in `integration.md`.
  Both are drafted on this recommendation and marked provisional.
- **Finding:** F16.

## Q4. Is `STATE.md`'s cap forty content lines or sixty, and which file owns the number?

- **The statement.** Lab `AGENTS.md` line 34: "capped at about forty content lines". `STATE.md` line 4: "Target:
  sixty lines." Today the file has 87 non-blank lines.
- **Where they diverge:** a `STATE.md` of 50 lines passes one and fails the other, so the guard cannot check it.
- **Recommended answer: `AGENTS.md` owns the number, and `STATE.md`'s header points to it.** `AGENTS.md` is the
  standing instruction for how state is kept; the header is a restatement. The value is yours to choose.
  `state-update.patch` leaves both numbers as they are and brings the file to 43 non-blank lines, 36 without
  headings, which meets either.
- **Finding:** F2. Proposal P3.
