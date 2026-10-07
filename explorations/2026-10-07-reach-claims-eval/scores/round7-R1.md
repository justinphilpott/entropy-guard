<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring of R1-r7a, R1-r7b and R1-r7c

I re-ran the recorded searches against the target myself. The hits line up with the code. The only errors are off-by-one line numbers: r7c gives 106 for `orc-service.ts` 107, and 15-16 for `scope-credentials.ts` 14-15.

### R1-r7a: 14.5 / 15

- **K1 = 1.** Guard runs "`pnpm typecheck && pnpm test`", plus `pnpm test:e2e`, the map check and `git grep`.
- **K2 = 1.** F10(a) "lines 58 and 88 give `369628b`… restarts on 4 Oct… `8cee662`"; (b) "line 23 says 'not merged'; line 31 says '#193 is live'". It adds "No live value was re-read."
- **K3 = 1.** Scheduling is removed from the absent list, citing the decision (F6); the Bookwhen token paragraph is replaced (F5). Both are in `settled.patch`.
- **K4 = 1.** F17: "No session-end guard exists, although Justin kept one… Disposition: `create`".
- **K5 = 1.** F13: "`danger.yml` is ORC's only workflow… linked to #144". F18: hooks "exit 0".
- **K6 = 1.** The guard lists `git diff --cached`, `git diff` and `git ls-files --others --exclude-standard`.
- **K7 = 1.** The guard holds checks only and points to `STATE.md`; `SECURITY-REVIEW.md` and `dangerfile.js` are listed under "Rules owned elsewhere".
- **K8 = 1.** Intent-change rule v2, step 4: "Do not edit… unless Justin has recorded that decision".
- **K9 = 1.** Two rows: "A fresh session finds the guard… ask… 'what must you do before handing off?'", and "Run the guard at the end of the next session… keep its report".
- **K21 = 1.**
  - "Workflow execution" is untouched.
  - `STATE.md` line 4 and the lab AGENTS.md cap are unchanged in the settled patch.
  - The reach rewrites are only in `provisional-Q1.patch`, which is labelled.
- **K23 = 1.** Truth map, loop map and a state-file update are all in one assessment.
- **K30 = 1.** "Step 4 handed on to `session-coherence-skill-generator`… handed on to `guards-integrator`", once.
- **K32 = 0.5.** Every mechanism is classified and none is called verified. But the Danger row reads "enforced invariant (the section is present…)", and `SECURITY-REVIEW.md` lines 54-55 say a failed check only warns without GitHub Pro.
- **K33 = 1.** "Modes and safety" is present, and the baseline is bound to `<start>` with `origin/main` as fallback.
- **K35 = 1.** Claims checked:
  - F1 (subprocess list): "`playwright.ts` 55… the ORC service launches headless Chromium", search S1/N2.
  - F2 (network list): Chromium and DNS lookups by the ORC service, search N1/N2.
  - Settled patch: keeps the old "Direct network access exists only" sentence, which F2 and Q1 mark incomplete.
  - `provisional-Q1.patch`, ORC AGENTS.md: lists Chromium in both the subprocess and network paragraphs, and says package code is not covered.
  - `provisional-Q1.patch`, README: "through ORC's browser… AGENTS.md lists every place".
  - Guard: its search pattern includes `playwright`.
  - All the hits I re-ran match.
- **K34: met.** It cites `scope-credentials.ts` 14-15, and for the restart it cites #101 in the architecture test. It makes no claim of absence.
- **Questions:** 3 questions plus 2 approvals (A1 delete the MCP client, A2 add banners), so 5 asks. None fails. Q1 bundles the restart and Chromium, which r7a itself says already have records; the tap address carries the question.
- **Wrong findings:**
  - Danger is called an "enforced invariant".
  - F19 says `GRANTS-E2E.md` line 11 "cites a POLICY-SOURCE.md that does not exist". That line itself says the file is not present.
- **Consequential extras:**
  - The settled README credential rewrite re-asserts "No subprocess ORC launches receives one". In fact `orc-service.ts` runs `promisify(execFile)` with no `env`, so those processes inherit everything the env file put into ORC's environment.
  - The Danger "enforced invariant" label could lead someone to rely on it to block a merge.

### R1-r7b: 14 / 15

- **K1 = 1.** The guard has `pnpm typecheck && pnpm test`.
- **K2 = 1.** F11: ":23 'not merged' against :31 '#200 merged as `3989cdb`'"; ":58… :88 `369628b` against :35 `8cee662`". The new `STATE.md` says "nothing below was re-read since".
- **K3 = 1.** F3 (scheduling) and F4 (the Bookwhen token) are both in the settled patch.
- **K4 = 1.** "Decided, not built:… an entropy guard at session end (F18)". Decision: `create`.
- **K5 = 1.** F10: "CI runs only Danger… Linked to #144; no parallel work". The hooks are "never blocking".
- **K6 = 1.** Staged, unstaged and untracked work are all in the guard.
- **K7 = 1.** Checks only; the state file and #140 are pointed to.
- **K8 = 1.** Rule v2, step 4.
- **K9 = 1.** "Fresh-session test, still to do…", plus "one completed guard report from a real session end".
- **K21 = 1.** "Workflow execution" stays. "Target: sixty lines" is untouched in the settled patch. The change to sixty in lab AGENTS.md is only in `provisional.diff`, labelled Q3.
- **K23 = 1.** Section 6 holds Steps 2, 3 and 5.
- **K30 = 1.** One handover.
- **K32 = 1.** Danger is an "executed check (a failed check warns… so it is not an enforced invariant); verified, by record". The record is the 2 Oct pass, fail, pass run noted in `STATE.md`. Everything else is "planned" or "unknown".
- **K33 = 1.**
- **K35 = 0.**
  - F5, F6 and the R-net and R-launch tables are correct. They credit "Chromium, started by ORC", and the hits re-ran correctly.
  - But `settled.diff` rewrites ORC AGENTS.md's subprocess list to four modules plus "The subprocess check in `test/architecture.test.ts` names these four". That omits Chromium and is not marked incomplete.
  - `provisional.diff` never adds Chromium to that paragraph either. It only appears in the network paragraph.
  - The settled README opening now points readers to this list.
- **K34: met.** It cites `scope-credentials.ts:14`. For the restart it cites the test and #101, with no claim of absence.
- **Questions:** 5. None fails.
- **Wrong findings:**
  - The guard says `map.mjs --check` "exits… 2 when GitHub cannot be read". In fact a failed read of one repository becomes `[]` (map.mjs:176) and the check passes.
  - "67 test files": the target has 70.
  - The MCP client is treated as a live launch, though nothing in production calls it.
- **Consequential extras:**
  - The settled AGENTS.md subprocess list makes the document and the test agree on an incomplete list.
  - The settled README pointer sends readers to that list.
  - The guard's `--check` comment overstates what the check catches.

### R1-r7c: 13 / 15

- **K1 = 1.**
- **K2 = 0.5.** F2 reports the `369628b` line against the 4 Oct restarts, "Not re-observed". The #193/#200 "not merged" against merged contradiction is never reported; the settled `STATE.md` rewrite just resolves it.
- **K3 = 1.** F9 (Bookwhen token) and F10 ("scheduling only") are settled.
- **K4 = 1.** F22. Decision: `create`.
- **K5 = 1.** F14, linked to #144; section 8 says the hooks "only print a summary".
- **K6 = 1.**
- **K7 = 1.**
- **K8 = 1.**
- **K9 = 1.** Its stated adoption test: "A fresh session in each repository… must name the guard", and "One completed guard report must exist at its trigger".
- **K21 = 0.5.**
  - A settled hunk edits the sentence Q3 quotes, extending "a count may only fall" to `config/` while Q3 ("May a … allowance rise?") is open.
  - By r7c's own sorting rule, a change that "edits the question's text" belongs in the provisional patch.
  - "Workflow execution" and both caps are untouched.
- **K23 = 1.** Sections 5, 6 and 12.
- **K30 = 1.**
- **K32 = 1.** Danger is an "executed check, not an enforced invariant (warns, does not block…)", verified per `STATE.md`'s record.
- **K33 = 1.**
- **K35 = 0.**
  - F6 and F7 are correct, with recorded searches ("`playwright.ts` 55… Playwright's library starts Chromium in the ORC server"), and the provisional AGENTS.md hunks include Chromium.
  - But the provisional README opening says ORC "launches an isolated Pi child for each delegated… run… Core reads public webpages through Jina Reader; everything else outside the machine, such as Bookwhen… is reached by an approved Scope package's connectors".
  - That omits Chromium, credits the Bookwhen reach to packages, has no pointer to AGENTS.md, and is not marked incomplete.
- **K34: not met.** Assessment line 87 says "No decision covering either was found in the two repositories" for F6 and F7, which include the restart card's launches. `orc-restart.ts:11` records the operator's direction of 28 Sep, and r7c's own S10 records the browser decision. The logins half is cited (`scope-credentials.ts` 15-16).
- **Questions:** 5. None fails. Q1 bundles the restart and browser decisions, which are already recorded in code, like r7a's Q1.
- **Wrong findings:**
  - The absence claim at line 87, above.
  - The provisional README's account of what ORC reaches, which contradicts its own provisional AGENTS.md hunk.
- **Consequential extras:**
  - The provisional README opening.
  - The settled ratchet hunk, which makes the four recorded rises read as rule breaches before Q3 is answered.
  - The settled credential paragraph keeps "No subprocess ORC launches receives one", which its own F8 says is false.

### Over-sorting (reported, not scored)

- **r7a:**
  - `orc-service.ts` in the subprocess list is held in `provisional-Q1.patch`. The architecture test (lines 823-836) already names it with #101, and r7b settled the same change.
  - Chromium's listing is held there too, although r7a's own Q1 says #76 is recorded in `playwright.ts`.
- **r7b:**
  - The `playwright.ts` DNS lookup is provisional, although F6 calls the claim "false under either reading".
  - The README "exactly one place, `src/runtime.ts`" sentence waits wholly on Q5, although `runtime.ts` reads no credential.
  - The guard install and both pointers wait on Q1 and Q2.
  - Chromium in the subprocess list is held back, then dropped from the provisional patch.
- **r7c:**
  - The restart card and Chromium in the subprocess list are held on Q1.
  - The guard pointers are held on Q4.

| Output | Total /15 | K3 | K21 | K30 | K32 | K33 | K34 | K35 |
|---|---|---|---|---|---|---|---|---|
| R1-r7a | 14.5 | 1 | 1 | 1 | 0.5 | 1 | met | 1 |
| R1-r7b | 14 | 1 | 1 | 1 | 1 | 1 | met | 0 |
| R1-r7c | 13 | 1 | 0.5 | 1 | 1 | 1 | not met | 0 |

Two scores are judgment calls:
- **r7b K35 = 0** rests on one claim, the settled subprocess list. F5 does flag Chromium as missing from that list.
- **r7a K32 = 0.5** rests on the Danger label alone. Its status there is "unknown", not "verified".
