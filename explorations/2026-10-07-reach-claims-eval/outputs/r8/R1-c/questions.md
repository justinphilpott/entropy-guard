# Questions for the steward

The steward is Justin (`scope.yaml`: `steward: justin`). He was not available, so each question carries the answer
recommended here, and the run continued on that recommendation without installing or enforcing it: the work that
depends on an answer is in the provisional patches and marked provisional in the guard and the integration brief.
Five questions, the most the intent pass allows, in the order they change what gets built. Finding ids refer to
`assessment.md`.

## Q1. Where does the session-end guard live?

- **The statement.** Justin decided on 4 October that "entropy guard at session end" is one of the processes the lab
  keeps, and that the lab is "the central Scope for project management, core issue tracking, code quality and
  security" (lab `STATE.md` as of 2026-10-04 17:31, lines 39-40 and 49; the settled patch moves these words
  verbatim to `decisions/2026-10-04-central-scope-and-kept-processes.md`). The skills rule reads: "1. Used across
  projects: local-config `home/.agents/skills/`. 2. Used by one Scope's agents: that Scope's `skills/` ... granted
  by ORC. 3. Used for one code repository: stays in that repository." (lab `reports/2026-09-30-skills-one-home.md`,
  "The rule, written once").
- **The readings.** (a) One guard in the lab's `skills/session-coherence-guard/SKILL.md`, covering both repositories,
  with a pointer from ORC's `AGENTS.md`. (b) One guard in each repository. (c) One guard in local-config's
  `home/.agents/skills/`, loaded by every tool.
- **Where they diverge.** An agent working in an ORC worktree on orchestrator#118 ends its session. Under (a) it finds
  the guard only through ORC's `AGENTS.md` pointer, and the guard also checks the lab's `STATE.md`. Under (b) it runs
  ORC's own guard, and the two guards' copies of the cross-repository checks (F14, F15) can drift apart. Under (c)
  every project's agents load a guard that names this system's files.
- **Recommended: (a).** The guard has to check both repositories as one system, because the costliest drift is between
  them (the state file about ORC, F1; the lab's tools reading ORC's paths, F14). The lab is the central Scope by
  Justin's 4 October decision, its `skills/` folder already exists, and rule 2 is the nearest fit. A Scope skill is
  not loaded by ORC's agents unless ORC grants it, so it reaches no ORC agent by accident.

## Q2. Which reaches found in ORC's code, and missing from its documents, has Justin authorised?

- **The statement.** ORC `AGENTS.md`, Boundaries: "Approved Scope packages may implement separately declared
  connectors: the backends that reach an outside service." (line 96) and "Any new authority requires an explicit
  human choice." (line 110). ORC `README.md`: "Deliberately absent, and each requires a decision rather than a
  convenience" (line 152).
- **What the code does that these documents do not list** (search recorded under F7 in `assessment.md`):
  1. ORC launches a headless Chromium in its own process for each browser session a package's browser connector
     opens, loaded with that Scope's stored login (`src/adapters/browser/playwright.ts:55,66`; orchestrator#76,
     "decided 3 Oct 2026" in the module header, with no name attached).
  2. Package connectors bound in `config/installation.ts`: mail through `smtp.protonmail.ch:587` with a Scope token
     (lines 159-168), and the Bookwhen ops tool's directory, whose tool the Moving Stillness package runs (line 127).
  3. The Moving Stillness apply writes to Bookwhen behind an approval card or a standing grant (ORC `AGENTS.md`
     lines 82-90 name it), while `README.md` line 147 says the specialist plans "without applying it".
- **The readings.** (a) An operator-approved package card is the "explicit human choice" and the decision README's
  paragraph asks for, so each of these is authorised by its card and the documents should say so. (b) Each reach
  needed its own recorded decision, and the ones without one are unauthorised drift to be reported, not documented.
- **Where they diverge.** The Finance package's mail connector, approved by its card, sends an invoice by SMTP. Under
  (a) `README.md` lists "external data sources and file writes through an approved package's card" and the guard
  checks only that a new connector arrives with a card. Under (b) mail sending is drift, and the guard reports every
  connector without a decision record.
- **Recommended: (a), recorded once.** ORC `AGENTS.md` already makes the card the control for new authority, and
  `STATE.md` records Justin approving the Moving Stillness build cards on 3 October. Record the answer in ORC's
  `AGENTS.md` Boundaries (the provisional patch drafts it), so the next connector needs no new question.

## Q3. May a package choose the address a phone notice opens?

- **The statement.** ORC `AGENTS.md` lines 101-102: "No model or agent reaches the ntfy transport, and it sends only
  a title, the notice's summary and the one configured tap address." Line 73: "an outbound channel is easy to miss:
  a generated link ... is one."
- **What the code does.** Since 2 October a package's phone connector sends its own title, text, tags and `click`
  address through ORC's ntfy sender to its own topic; `click` may be any `http` or `https` address
  (`src/adapters/phone/index.ts:38,50`, orchestrator#184). The topic naming is the operator's choice of 2 October
  (`config/installation.ts:99-102`).
- **The readings.** (a) Authorise it as built: a package may send any tap address. (b) Authorise package notices,
  with the tap address limited to hosts the package's card names. (c) Keep the rule as written and remove package
  access to the transport.
- **Where they diverge.** Moving Stillness's `adverts-review` notice opens an advert's share page on the configured
  pages address: allowed under (a) and (b), refused under (c). A notice whose `click` is
  `https://example.net/?q=<a customer's booking note>`: allowed only under (a).
- **Recommended: (b).** It keeps the real use, and it closes the generated-link channel that `AGENTS.md` and
  `SECURITY-REVIEW.md` pattern 5 ("Destinations are fixed in code") warn about. It needs a small code change in
  `src/adapters/phone/index.ts` and a card field; the provisional patch's wording assumes it.

## Q4. Should ORC's root branch reports move to the lab's `reports/`?

- **The statement.** Six documents at ORC's root are reports of single pieces of branch work: `REWORK.md`,
  `SEAM.md`, `SLICE1.md`, `POLICY-STORE.md`, `FIXES.md` and `GRANTS-E2E.md`. Four name files that no longer exist
  (F12). They sit beside `README.md`, `AGENTS.md` and `SECURITY-REVIEW.md`, and ORC's `AGENTS.md` tells agents that
  "The code supplies any further context".
- **The readings.** (a) Move them to the lab's `reports/`, where dated reviews of ORC already live. (b) Keep them at
  ORC's root, marked historical. (c) Delete them; git keeps them.
- **Where they diverge.** An agent asked how ORC enforces a browser grant searches ORC and finds `SLICE1.md` naming
  `src/adapters/browser/service.ts`, which no longer exists. Under (a) and (c) the search finds only current
  documents; under (b) it finds the report with a "Historical" banner first.
- **Recommended: (a).** The settled patch adds the banners now, which serve (b) and are harmless under (a). Moving
  them changes how the two repositories are organised, so it waits for Justin. `OPERATOR.md`, `CLASSIFY.md`,
  `TURN-RECORD.md`, `VISIBILITY.md`, `GRANTS.md` and `MCP.md` are not in this question: each still describes a live
  mechanism, partly or wholly.

## Q5. Which cap does the lab's `STATE.md` keep, and which file owns it?

- **The statement.** `STATE.md` line 4: "Target: sixty lines." Lab `AGENTS.md` line 34: "capped at about forty
  content lines".
- **The readings.** (a) Sixty lines in all. (b) About forty content lines. The two may be meant as one limit, since
  sixty lines with headings and blank lines is close to forty content lines.
- **Where they diverge.** A state file of 55 lines with 45 content lines meets (a) and fails (b). The file was 99
  lines on 4 October, failing both.
- **Recommended: (b), owned by lab `AGENTS.md`,** with `STATE.md`'s header pointing there instead of stating its
  own number. The instruction file is read before the state file is written, and the state file is overwritten at
  every event, so a rule kept inside it is the first thing to be lost. The settled state-file update fits both
  readings (55 lines, 38 content lines), so nothing waits on this except the guard's size check.
