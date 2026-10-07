# Questions for the steward (Justin)

From the entropy-guard assessment of ORC and the orchestration lab, 7 October 2026, run on read-only snapshots taken
4 October 2026. No steward was available, so each question carries the answer I recommend, and the work continued on
that recommendation. Work that depends on an answer is drafted as **provisional** and is not applied, installed or
enforced. Finding ids (F1 and so on) refer to `assessment.md`.

The intent pass allows at most five questions, each one about a choice that changes what gets built or what a guard
checks. Four were needed.

## Q1. Where are steward decisions about ORC recorded?

- **The statements and their sources:**
  - lab `SCOPE.md` L19: "Facts about ORC belong in its repository."
  - The one ORC architecture decision on record, async work (Justin, 17 Sep), lives in the **lab's**
    `decisions/2026-09-17-async-work-architecture.md`. ORC has no decision log.
  - Other ORC decisions sit in ORC `AGENTS.md` quotes, the `dangerfile.js` header (Justin, 2 Oct, "B"), lab
    `memory/authority-rules-step-1.md`, issues, and lab `STATE.md`, which is overwritten (F1, F4).
  - Authority Rule 5 (Justin, 1 Oct, `memory/authority-rules-step-1.md` L17), "every decision is recorded and visible in
    one place in ORC", is about the operator's authority decisions inside the running ORC, not design decisions, so it
    does not settle this.
- **The readings:** (a) lab `decisions/`, one file per decision, for ORC and the lab alike; (b) a decision log inside ORC's
  repository for ORC decisions, with the lab's `decisions/` for the lab's own.
- **Where they diverge in this system:** ORC's north star (your words of 25 and 26 Sep) is held only in lab `STATE.md`.
  Under (a) it is copied to `decisions/2026-09-25-orc-north-star.md` in the lab; under (b) it goes to a new decision
  log in ORC. Your coming answer on #144 (tests on every PR: GitHub Actions or a pre-push hook) needs the same choice.
- **Recommended answer: (a), the lab's `decisions/`.** Reasons: it is where the one existing ORC architecture decision
  already lives; your 4 Oct decision makes the lab "the central Scope for project management, core issue tracking, code
  quality and security"; and ORC's own rule, that core ships with no tie to a particular owner, argues against filling
  ORC's repository with one owner's decisions. ORC's `AGENTS.md` and `README.md` would keep the enforced rules and cite
  the record.
- **What waits on it:** `patches/lab-provisional-orc-north-star.patch`; the guard's "Decisions" pointer for ORC, which is
  left open in `guard/SKILL.md`.

## Q2. What is the state file's cap: forty content lines or sixty lines?

- **The statements and their sources:** lab `AGENTS.md` L34, "capped at about forty content lines"; lab `STATE.md` L4,
  "Target: sixty lines". Neither is attributed or dated. The file was 99 lines on 4 Oct (F2). `FRICTION.md` L536
  records it at 405 lines against "its own forty-line cap" on 23 Sep, rewritten then to 66 lines.
- **The readings:** forty content lines (blank lines and headings not counted), or sixty lines in all.
- **Where they diverge:** a file of 50 content lines and 60 lines passes sixty and fails forty. The guard's state check
  gives a different verdict on it.
- **Recommended answer:** one number, stated once, in lab `AGENTS.md` "Keeping state", with `STATE.md`'s header
  pointing at it instead of carrying its own; and keep **about forty content lines**. Reason: the proposed rewrite of
  `STATE.md` (`patches/lab-state-and-decisions.patch`) holds everything the docs-first assessment requires in 37
  content lines and 60 lines in all, once decisions live in `decisions/` and history in `git log`. So forty is
  achievable, and it is the standing instruction.
- **What waits on it:** the wording of both files. The proposed patch meets both readings and leaves both sentences
  unchanged. The guard says the cap is open.

## Q3. Until #149 builds granting by card, who may run `pnpm grant:operation` and `pnpm grant:tool`?

- **The statements and their sources:**
  - `memory/authority-rules-step-1.md` L14, affirmed by you on 1 Oct: "Rule 2, nothing is allowed by default; a card
    allows it."
  - ORC `GRANTS.md` L60-64: you are asked for "a new policy, or widening an existing one"; slice 3 (L93) is
    "requesting and granting by conversation".
  - ORC `AGENTS.md` L110: "Any new authority requires an explicit human choice."
  - Against these, `scripts/execution-policies.ts` gives `pnpm grant:operation` and `pnpm grant:tool`. Each writes a
    standing policy straight into ORC's store from a terminal. No card is raised, so nothing is recorded in ORC's
    interface (F5).
- **The readings:** (a) only you run these commands, at your own terminal, until #149; (b) an agent may run them when
  you say yes in chat.
- **Where they diverge in this system:** you say "yes, grant Moving Stillness the tool" in a Claude Code session. Under
  (b) the agent runs `pnpm grant:tool -- …`; the only record is the policy journal and the chat. Under (a) the agent
  writes the exact command into its report and you run it.
- **Recommended answer: (a).** Reason: Rule 2 says a card allows it, and under (b) the grant leaves no card. It also
  matches the precedent in `FRICTION.md` (22 Sep, L590 onward): `approve-agent-package.ts`, run from an agent's shell,
  silently stored an empty ops directory, because the value came from the wrong environment.
- **What waits on it:** nothing is enforced. The guard only asks that every authority change a session made be reported,
  with who approved it.

## Q4. "Credentials are read in one place": one module, or one reader for each source?

- **The statements and their sources:**
  - ORC `AGENTS.md` L64: "credentials are read in one place". ORC `SECURITY-REVIEW.md` L120: "one place that reads a
    credential". ORC `README.md` L103: "A credential is read in exactly one place, `src/runtime.ts`."
  - `scripts/orc-env.sh` L4-5: the env file "is read and checked in this one place".
  - Credential-bearing values are read in `src/runtime.ts`, `src/web-cli.ts:625` (`ORCHESTRATOR_WEB_TOKEN`),
    `config/installation.ts:110` (`ORCHESTRATOR_NTFY_TOPIC_URL`) and `src/app/agent-packages.ts:466` (connector
    credentials). A Scope's own credential files are read by `src/adapters/scope-credentials.ts` (F6).
- **The readings:** (a) literally one module; (b) one reader for each source: ORC's env file read once by
  `scripts/orc-env.sh` and consumed by its composition roots, and a Scope's credential files read only by
  `scope-credentials.ts`.
- **Where they diverge:** `src/web-cli.ts:625` reads the web token. Under (a) that breaks the rule. Under (b) it is
  allowed, because it is a composition root consuming the env file that `orc-env.sh` read.
- **Recommended answer: (b),** recorded as a proposed change of the wording, awaiting you. Reasons: the code and
  `orc-env.sh` were built to (b); Scope credentials living in each Scope's own folder follows Rule 1 (a Scope's things
  belong to it); and a single module could serve both sources only by reaching into every Scope.
- **What waits on it:** ORC `README.md` L103 is left unchanged by every patch. The guard checks credential reads
  against whichever reading you choose.

## Noted, not asked

The intent pass records these, but they do not change what gets built now, or they wait on someone else.

- **README "Deliberately absent" (L152-154):** the 17 Sep decision plainly settles "scheduling", and the patch corrects
  only that word. Whether "reminders", "workflow execution" and "additional external data sources" are still absent is
  not plainly settled, and those words are left as they are. Recommended: confirm them when #166 (scheduling) is
  designed.
- **ORC `AGENTS.md` subprocess list (F11):** `patches/orc-provisional-subprocess-list.patch` adds
  `src/adapters/orc-service.ts`, which the test approves "from orchestrator#101". Apply it only if #101 records your
  approval of the restart card's subprocess use. GitHub could not be read in this run.
- **Pace (F8):** lab `AGENTS.md` L27-29 says one scored real use comes before new design work. Your words of 21 Sep
  (`reports/2026-09-22-pushback-analysis.md` L126-134) relax proof-first building to "what is naturally needed". The
  two are compatible on the reading in `reports/2026-09-25-direction-review-astra.md` (L72). Recommended: cite both in
  `AGENTS.md` "Pace" when you next touch it.
- **The lab's wider role:** what else the lab should cover is with Astra (your 4 Oct decision). The patch leaves it open.
- **Two Scope-model homes (F25):** ORC `AGENTS.md` L59 names `pro/agentic/agentic-architecture/MODEL.md`, and lab
  `SCOPE.md` L24 names `pro/scope/docs/MODEL.md` as authoritative. Neither could be read here. Which one is current is a
  fact you hold.

## Proposals awaiting you (no question needed now)

- **Guard the approval-card renderer (F20):** add `web/src/durable-work.tsx` to `GUARDED` in `dangerfile.js`. A card
  is a control only if it shows the actual effect (ORC `AGENTS.md` L76-80). Danger's stated scope is "what an agent can
  reach", which does not plainly cover this, so it is your call.
- **Move ORC's branch reports (F23)** (`REWORK.md`, `SEAM.md`, `OPERATOR.md`, `FIXES.md`) into lab `reports/`. The
  patch only adds "Historical" banners, following `MCP.md`'s precedent. Moving files between repositories is a
  structural change.
- **ORC `CLAUDE.md` (F26):** if a Claude Code session in ORC does not load `AGENTS.md`, add the same
  `CLAUDE.md -> AGENTS.md` symlink the lab has.
