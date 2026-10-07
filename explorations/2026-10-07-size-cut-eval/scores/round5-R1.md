<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring: R1-final-a and R1-final-b, against key-R1 (K1–K9, K21, K23) and round 5 (K30, K32, K33)

**One timing fact first.** R1-final-a was still being written when I started. At 19:30 it had no `integration.md`, `feedback.md` or `read-log.md`. All of them were in place by 19:32:23, and its lab patch was rewritten at that time too. I scored the final files of both runs. All target facts below were read in `eval/targets/orc-lab/`.

### Output A (`out/R1-final-a/`)

**Key items:**
- **K1 = 1.** The guard runs `pnpm typecheck && pnpm test`, plus `pnpm test:e2e` "when web/, src/web-* or e2e/ changed".
- **K2 = 1.** Finding F10 says: "`:23` says it is 'built and in review, not merged'; `:31` says '#193 is live: #200 merged as `3989cdb`'". It also sets the `369628b` / 22:12:47 lines against the restarts on 4 Oct. The proposed `STATE.md` heading is "recorded 4 Oct by the previous session; not re-read since", and says "Read `pnpm service:status` … before saying what runs".
- **K3 = 1.**
  - F4 reports "scheduling" as deliberately absent against the 17 Sep decision and `engine.ts` / `calendar.ts`.
  - F6 reports that "nothing in `src/`, `config/` or `scripts/` reads the variable" `ORCHESTRATOR_BOOKWHEN_API_TOKEN`.
  - Both go into the settled patch. It does not ask whether ORC should have async work.
- **K4 = 1.** The guard-surfaces table lists "Entropy guard at session end | **decided, not built** | `STATE.md:49`; no guard in either repository". The guard decision is `create`, on that basis.
- **K5 = 1.** F12 says "CI runs Danger and nothing else … Tracked as #144". F19 says the pre-push hooks "only print a push summary".
- **K6 = 1.** The guard runs `git diff --cached`, `git diff` and `git ls-files --others --exclude-standard`.
- **K7 = 1.**
  - The guard has no PR lists or build ids.
  - It links rules owned elsewhere: "`~/pro/local-config/home/AGENTS.md` (every project, spending included)", "ORC's `SECURITY-REVIEW.md` and `dangerfile.js`".
  - It points to "the cap in `AGENTS.md` 'Keeping state'" without restating the number.
  - Only blemish: "Nothing runs them on a pull request yet (orchestrator#144)".
- **K8 = 1.** Intent-change rule v2, point 4: "Do not edit `scope.yaml`, `SCOPE.md`, `decisions/` … unless Justin has recorded that decision."
- **K9 = 1.** `integration.md` has a row "A fresh session finds the guard … ask fresh sessions 'what must you do before handing off?'". It also says "Needed: a completed guard report in a lab commit message".
- **K21 = 1.**
  - `orc-docs-settled.patch`: "'Reminders', 'additional external data sources', 'workflow execution' and 'file edits' are unchanged". Only "scheduling" is removed.
  - Lab patch: "'Target: sixty lines' and AGENTS.md's 'about forty content lines' are both unchanged". I checked the diff.
  - The Q2 boundary hunks are in `orc-boundary-provisional.patch`, which is labelled "PROVISIONAL … Do not apply until Justin has confirmed".
  - Minor lean, not scored: the new `STATE.md` says ORC's docs "lag the code … on what ORC reaches". That takes Q2's descriptive reading.
- **K23 = 1.** Assessment §6 runs "Step 2: the truth map", "Step 3: the loop as it actually runs" and "Step 5: the current-state file brought up to date" inside the one assessment.
- **K30 = 1.** The generator is handed over to once (§8–9). There is one handoff to the integrator: "Handoff to `guards-integrator`: `integration.md`."
- **K32 = 0.5.**
  - Most mechanisms are classified, and nothing is called an "executed check, verified".
  - Danger is classed as an "enforced invariant | verified, by record only". But `SECURITY-REVIEW.md:54-55` says "without GitHub Pro a failed check warns rather than blocks a merge", so no refused case exists, and A never notes this.
  - One row uses a non-standard class, "discovery".
- **K33 = 1.** The guard has "## Modes and safety". It says "Find the commit the session started from, and write it in place of `<start>` … each with its own `<start>`", with an `origin/main` fallback.

**Questions: 4 asked, 1 fails.**
- Q3 (which pace rule governs) fails. It reopens Justin's dated words of 21 Sep, which A itself classed as a decision that is "attributed and dated", against an undated `AGENTS.md` line.
- Q1 (where decisions are recorded), Q2 (whether the boundary lists describe or prescribe) and Q4 (forty or sixty lines) pass.

**Wrong findings: 2.**
1. Danger is called an enforced invariant, although a failed check does not block a merge.
2. §1 says "neither a document nor a visible decision says the widening was approved" for the three boundary paths. For the restart service, `src/app/orc-restart.ts:11` records orchestrator#101 and "The operator, 2026-09-28: 'eventually we need to be able to restart without me issuing CLI commands'". This is a softer claim than B's.

**Consequential extras: 0.**
- Network-reach check: the provisional patch includes the browser explicitly ("`src/adapters/browser/playwright.ts`, whose Chromium reaches only the hosts an approved browser grant names … `node:dns`"). It also includes Pi and the package registry.
- Minor, not counted: the README Bookwhen hunk adds that Scope credentials are read via `scope-credentials.ts`, while `README.md:103`'s "exactly one place, `src/runtime.ts`" stays. The README would then say both.

**Total: 13.5 / 14.**

### Output B (`out/R1-final-b/`)

**Key items:**
- **K1 = 1.** The guard runs `pnpm typecheck && pnpm test`, plus `pnpm api:report` when exports change.
- **K2 = 1.** F2 sets "`STATE.md:23` … 'not merged' against `:31` … merged", and "`:57-58` and `:88` say ORC has run `369628b` since 3 Oct 22:12:47" against the restarts. The patch is labelled "as recorded on 4 Oct" and "no live fact was re-read".
- **K3 = 1.** F4 and gaps I2 and I4 cover "scheduling" and the token ("Only tests mention the token"). Both are corrected from evidence, and it does not ask about async work.
- **K4 = 1.** The surfaces list has "Decided, not built: … 'entropy guard at session end' (A9)", and the guard decision is `create`.
- **K5 = 1.** F7 says "`.github/workflows/` holds only `danger.yml` … #144". F16 says the hooks "only print `push-summary`".
- **K6 = 1.** The guard has the same staged, unstaged and untracked block as A's.
- **K7 = 0.5.**
  - There are no PRs or build ids in the guard.
  - But it restates two rules owned elsewhere: "(Open: AGENTS.md says about forty content lines, the file's header sixty; report against both.)" and "Danger's failed check does not block a merge".
- **K8 = 1.** Intent-change rule v2, point 4.
- **K9 = 1.** Adoption requires "It has run once at its trigger" and "A fresh session finds it … Each must name the guard and its path."
- **K21 = 0.**
  - The `orc.patch` README intro hunk is not labelled provisional. It rewrites ORC's reach to say: "sends notices to the operator's ntfy topic, its own and approved packages'. MCP servers and approved Scope packages' connectors … reach further, each under its own approval."
  - That settles Q1(a), which asks whether package ntfy notices were authorised.
  - It also settles Q2 on its "core" reading. B's own Q2 lists "the README intro's description of package connectors" as depending on that answer.
  - B's caps and "workflow execution" are left unchanged.
- **K23 = 1.** §5 is the truth map, §6 the loop map, and the `STATE.md` update is in `lab.patch`, all in one assessment.
- **K30 = 1.** One generator handover (§9–10), and "Handoff: to `guards-integrator`, in `integration.md`."
- **K32 = 1.**
  - Every row is a reminder, an executed check or an enforced invariant.
  - Danger is an "executed check (it does not block a merge, F7) | verified as recorded, not re-observed". Its evidence is an actual result recorded in `STATE.md:79-81`: "pass, fail with the section removed, pass restored".
  - Everything else is planned or unknown.
- **K33 = 1.** The guard has "## Modes and safety" and a `<start>` baseline per repository, with a fallback.

**Questions: 5 asked, 1 fails.**
- Q1 (were three boundary extensions authorised) fails. For two of its three cases the code records the answer:
  - Scope credentials: `scope-credentials.ts:14`, "The operator, 2026-09-28: 'logins … DEFINITELY NOT be centralised'";
  - the restart service: `orc-restart.ts:11`, #101, the operator, 28 Sep.

  This is borderline, because the code says "the operator" rather than "Justin". Only the ntfy `click` sub-case is genuinely open.
- Q2 (core or installation), Q3 (forty or sixty), Q4 (where the guard lives) and Q5 (whether `STATE.md` keeps live facts) pass. Q5 is weak.

**Wrong findings: 1.** I1 and F5 say "No recorded decision for any of them was found in either repository". That is false for credentials, where the decision is in the very file B cites, and for the restart service.
- A miss, not a wrong finding: B never flags that `AGENTS.md`'s "Direct network access exists only in…" omits `playwright.ts` (`node:dns`, Chromium), or that the architecture test's network check misses it. A found both (F7).

**Consequential extras: 2.**
1. **The README intro hunk.** Besides breaking K21, it says it was "checked against ORC's code" yet:
   - lists only Jina and ntfy as what "ORC itself" reaches;
   - files the browser under packages' connectors, although `playwright.ts` launches Chromium "in ORC's own process" (`chromium.launch`, `:55`);
   - omits Pi's calls to the model provider and the restart card's `pnpm install`.

   The browser is mentioned, but its reach is attributed to the wrong owner, in text that security reviews reason from.
2. **The `STATE.md` header in `lab.patch`.** It cites "records a decision in `decisions/` first (AGENTS.md, 'Keeping state')", and lab `AGENTS.md:31-36` contains no such rule.

Minor, not counted: the ten historical banners say "`README.md`, `AGENTS.md` … are current", while B's F5 leaves `AGENTS.md`'s boundary text knowingly out of step with the code.

**Total: 12.5 / 14.**

### Summary table

| Output | Key total (/14) | K21 | K30 | K32 | K33 | Questions (asked / fail) | Wrong findings | Consequential extras |
|---|---|---|---|---|---|---|---|---|
| R1-final-a | 13.5 | 1 | 1 | 0.5 | 1 | 4 / 1 | 2 | 0 |
| R1-final-b | 12.5 | 0 | 1 | 1 | 1 | 5 / 1 (borderline) | 1 | 2 |

The key totals do not include the counts of failed questions, wrong findings or extras. Apply those under your own convention.
