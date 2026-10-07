# Questions for the steward

Steward: Justin (`scope-orchestration-lab/scope.yaml`, `steward: justin`). No steward was available in this run, so
each question carries the answer recommended, and work that depends on it is drafted only in
`patch-provisional.diff`. Five questions, the intent pass's limit; each changes what gets built or what the guard
checks. Findings are by id in `assessment.md`.

## Q1. Are the launches and network reach that ORC's `AGENTS.md` does not list authorised?

- **The statement:** ORC `AGENTS.md`, "Boundaries": "Subprocess access exists in `src/core/child-agent-process.ts`
  ..., `src/core/analysis-tools.ts` ..., and `src/adapters/mcp/client.ts`" and "Direct network access exists only in
  `src/core/research-tools.ts` ... and in `src/adapters/notifications/ntfy.ts` ... No model or agent reaches the ntfy
  transport". README: "No subprocess ORC launches receives one" (a credential).
- **What the code does besides (F6, F7, F8):**
  - `src/adapters/orc-service.ts` runs git, `systemctl --user restart orc.service`, `pnpm install --frozen-lockfile`
    and `scripts/build.mjs` for the restart card, with ORC's whole environment, which holds the env file's credentials.
  - `src/adapters/browser/playwright.ts` launches headless Chromium through Playwright's library and resolves hosts
    with `node:dns`.
  - `src/adapters/phone/index.ts` lets a Scope package's tool publish to ntfy: a title, text, up to five tags and an
    http or https tap address the package chooses.
- **The readings:** (a) these are authorised, and the lists are stale descriptions; (b) the lists are the prescribed
  boundary, and some of these reaches are drift to be removed or put behind a decision.
- **Where they diverge:** a Moving Stillness tool sends a phone notice whose tap address carries text taken from a
  Bookwhen page. That is an outbound channel the list says no agent has. Under (a) it is documented and reviewed.
  Under (b) the phone connector's `click` field is drift.
- **Recommended:** (a), for all four. The restart card is how ORC is run (README "As a service"). The browser in ORC's
  process was decided in orchestrator#76 on 3 Oct, and the phone connector was built for a Scope agent's review pings on
  2 Oct (#184). Then three changes follow. List all four in `AGENTS.md` (draft in `patch-provisional.diff`). Widen
  `test/architecture.test.ts` to catch library launches, `node:dns` and `fetch` passed as a value. Decide separately
  whether a package may choose a phone notice's tap address. Under SECURITY-REVIEW.md's own question 2, that is an
  outbound channel.

## Q2. What do README's "Deliberately absent" list and its "read-only external data paths" bound: ORC core, or everything the installation's agents reach?

- **The statement:** ORC `README.md`, lines 5-7: "Its read-only external data paths are published Bookwhen events, fixed
  Bookwhen admin inspection and planning operations, and public webpages through Jina Reader." Line 147: the specialist
  calculates a plan "without applying it". Lines 152-154: "Deliberately absent ...: reminders, scheduling, additional
  external data sources, workflow execution, sandboxes, shell access, and file edits."
- **The readings:** (a) they describe ORC core, and approved Scope packages reach further through connectors bound
  on their approval card (`AGENTS.md`: "Approved Scope packages may implement separately declared connectors");
  (b) they describe the whole installation.
- **Where they diverge:** the finance package's `send_client_invoice` sends mail through `smtp.protonmail.ch:587`
  (`config/installation.ts`, `financeConnector`), and `apply_moving_stillness_slots` writes to Bookwhen. Under (a)
  both fit. Under (b) both are drift from a "read-only" boundary.
- **Settled already, and not asked:** scheduling. Justin decided on 2026-09-17 that ORC owns durable work that runs
  now, at a time or on a recurring schedule (lab `decisions/2026-09-17-async-work-architecture.md`). The settled patch
  removes "scheduling" from the list and cites that decision. "Workflow execution", "file edits" and the rest stay open.
- **Recommended:** (a). It matches the steward's rule that domain code belongs to the Scope that needs it
  (`AGENTS.md`, Justin 2026-09-12 and 2026-09-13). Write "from core" into the list, and replace lines 5-7 with what core
  reaches (draft in `patch-provisional.diff`).

## Q3. May a `test/core-ties.ts` allowance rise?

- **The statement:** ORC `AGENTS.md`: "`test/core-ties.ts` ratchets all four ties ... a count may only fall, and its
  allowance falls in the same change."
- **What happened (F11):** the Scope allowance for `config/installation.ts` rose 28 → 51 (30 Sep) → 64 → 70 (2 Oct).
  `test/core-ties.ts` gives a reason beside each rise ("every agent installed still needs this file edited, until
  Scopes load by card (orchestrator #152)").
- **The readings:** (a) the rule is absolute, so the rises are unauthorised drift; (b) installing a Scope's agent is an
  accepted exception until #152, which nobody wrote down.
- **Where they diverge:** the next Scope agent installed raises the count again. Under (a) the guard reports it as
  drift and the work waits. Under (b) the guard accepts it when the reason sits beside it.
- **Recommended:** (b), written into `AGENTS.md` as an exception for `config/installation.ts` only, ending when #152
  lands; any other rise stays refused. Reason: each rise was deliberate, explained and tied to one issue. Until you
  answer, the guard reports every rise as a proposal for you.

## Q4. Where should the session-end guard live, and may ORC's `AGENTS.md` point to it?

- **The statement:** you kept "entropy guard at session end" on 4 Oct (now copied to lab
  `decisions/2026-10-04-lab-role-and-kept-processes.md`), and said the lab is the central Scope for project management,
  code quality and security. ORC `AGENTS.md`: "If ORC were published today, core would carry nothing that ties it to a
  particular Scope".
- **The readings:** (a) one guard in the lab, at `skills/session-coherence-guard/SKILL.md` (the lab's `skills/`
  already exists), with a "Before handing off" pointer from both `AGENTS.md` files; (b) a guard in each repository.
  Option (b) means creating a new `skills/` folder in ORC, which is a structural change.
- **Where they diverge:** a Codex session that changes only ORC reads ORC's `AGENTS.md` and nothing in the lab. Under
  (a) the pointer takes it to the lab's guard, which updates the lab's `STATE.md`. Under (b) it runs ORC's guard, and
  the system's state file still lives in the lab.
- **Recommended:** (a). The system has one state file and one decision folder, both in the lab. ORC's `AGENTS.md`
  already points outside ORC (orchestrator#140, `pro/agentic/agentic-architecture/MODEL.md`). The open-source rule
  covers core's code (`test/core-ties.ts` scans `config/`, `src/`, `web/src/`), not its working notes.

## Q5. What is `STATE.md`'s cap: about forty content lines, or sixty lines?

- **The statement:** lab `AGENTS.md`, "Keeping state": "capped at about forty content lines". `STATE.md`'s own header:
  "Target: sixty lines". The file of 4 Oct is 99 lines (F5).
- **The readings:** (a) forty, from the standing instruction, with the header linking to it; (b) sixty, from the
  header, with `AGENTS.md` corrected.
- **Where they diverge:** the reorganised `STATE.md` in the settled patch has 40 content lines and 57 lines in all.
  It meets both readings now, but the next item added breaks (a) and not (b), and the guard checks the cap.
- **Recommended:** (a). `AGENTS.md` is the instruction file that owns how state is kept, and the state file should
  link to its owner rather than restate it (draft in `patch-provisional.diff`).
