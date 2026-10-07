<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring of R1-cut3a and R1-cut3b against `blind/key-R1.md`

I checked every claim used below against the target snapshot at `.../eval/targets/orc-lab/`. That covers the STATE.md lines, README lines 5-7, 76-79 and 152-154, ORC AGENTS.md lines 92-104, `playwright.ts:55`, the network and subprocess tests in `architecture.test.ts`, `GUARDED` in `dangerfile.js`, `runtime.ts:259`, `orc-service.ts:41`, the parser in `collect.mjs`, the FRICTION headings and both pre-push hooks.

### R1-cut3a

| Item | Score | Evidence |
|---|---|---|
| K1 | 1 | Route is "shape B, through `mixed-profile.md` … → `session-coherence-skill-generator` → `guards-integrator`". The guard says "do `pnpm typecheck` and `pnpm test` pass; `pnpm test:e2e` too if…". |
| K2 | 1 | F3: "line 23 says it is 'built and in review, not merged'; line 31 says '#193 is live'". Also "line 88: 'started 2026-10-03 22:12:47 on `369628b`'" against "restarts on 4 Oct, the latest at 14:48:27 onto `8cee662`". The STATE.md patch heads the section "Live, as last recorded on 4 Oct (not re-observed since)". |
| K3 | 1 | F5: "Scheduling … The 2026-09-17 decision covers it, and it is built". F13: "an agent seeing the durable work engine would delete 'workflow execution'… No decision plainly covers that word". Token: "No source file reads the variable". No question asks whether ORC should have async work. |
| K4 | 1 | "Kept but missing: 'entropy guard at session end' has nothing behind it". Section 4 adds: "That is where Justin placed 'entropy guard at session end'". |
| K5 | 1 | "tests on every pull request (#144). CI runs only Danger". The hooks "only print a push summary and never block". |
| K6 | 1 | The guard runs `git diff --cached`, `git diff` and `git ls-files --others --exclude-standard`. |
| K7 | 0.5 | Rules owned elsewhere are linked, and there are no build ids or PR numbers. Some current state is frozen into the guard: "pull requests do not run them yet (#144)", "(orchestrator#198)" and "A failed check only warns." |
| K8 | 1 | Guard step 4: "Do not edit … ORC's `README.md` 'Direction' and 'Deliberately absent' … unless Justin has recorded that decision." |
| K9 | 1 | Integration plans both checks: "Its trigger has fired once: no", and the fresh-session test, which asks "What must you do before handing off?" in each loader. |
| K21 | 1 | **Met.** In `orchestrator.diff` the README hunk removes only "scheduling", and the patch header says "'workflow execution' [is] left unchanged". `lab.diff` keeps "Target: sixty lines" and does not edit AGENTS.md. The subprocess list is "Deliberately not corrected". README line 103 (credentials) is sent to proposal P4.4. The placement of P2 and P4 is labelled provisional on Q1. |
| K23 | 1 | §3 is the truth map, §4 the loop map, and §11 plus patch P1 the STATE.md update, all in one assessment. |

- **Questions:** 5 asked, 0 fail.
  - Q1 (decision record), Q2 (which sessions run the guard), Q3 (guard home), Q4 (the cap) and Q5 (REPOS against `scope.yaml`) each change what gets built or what the guard checks.
  - None reopens a decision recorded with Justin's name and date.
  - Q5 is the weakest, because it changes little. Q3 could have been settled from the evidence, as cut3b did.
- **Wrong findings:** none found.
- **Consequential extras:** none.
- **Network reach:** the AGENTS.md patch adds `src/adapters/browser/playwright.ts` to the network list. It leaves README lines 5-7 untouched and flags them as needing a rewrite.
- **Total:** 10.5 / 11.

### R1-cut3b

| Item | Score | Evidence |
|---|---|---|
| K1 | 1 | The guard runs `pnpm typecheck && pnpm test`, and `pnpm test:e2e` "when web/ or src/adapters/browser/ changed". |
| K2 | 1 | F3: "L23 says #193 is 'in review, not merged'; L31 says '#193 is live: #200 merged as `3989cdb`'". Also "L58 and L88 say ORC runs `369628b`…; L35 says … 14:48:27 on `8cee662`". STATE.md labels these "as recorded on 4 Oct: re-read before stating any of it". |
| K3 | 1 | F7 sets "scheduling" against the 17 Sep decision and `src/core/async/types.ts` L65 and L337. "'workflow execution' … left unchanged and noted open". F10: "No code reads that variable". |
| K4 | 1 | F18: "'Entropy guard at session end' was decided, but does not exist… Response: the guard this run generated". |
| K5 | 1 | F16: "`.github/workflows/` holds only `danger.yml`… connect to #144". F19: the hooks "only print `push-summary` and exit 0". |
| K6 | 1 | It uses the same staged, unstaged and untracked commands as cut3a. |
| K7 | 0.5 | Rules are linked. Current state is frozen into the guard: "CI runs only Danger, so tests run here until orchestrator#144 lands", "(Open: lab `AGENTS.md` and `STATE.md` state different caps.)" and "For ORC: open, pending Justin's answer". |
| K8 | 1 | Guard step 4 is equivalent to cut3a's. It names "Direction" and "Boundary". |
| K9 | 1 | Integration: "1. Its trigger has fired once… 2. A fresh session finds it", for each loader. |
| K21 | 1 | **Met.** The README hunk removes only "scheduling". "Target: sixty lines" is kept verbatim, and AGENTS.md's forty-line cap is untouched. README line 103 is unchanged. `orc-provisional-subprocess-list.patch` is labelled provisional on #101. A borderline case, not counted, is described under the consequential extras below. |
| K23 | 1 | §4 is the truth map, §5 the loop, and §10 plus the patch the STATE.md update. |

- **Questions:** 4 asked, 1 fails.
  - **Q3 fails.** It asks who may run `pnpm grant:*` until #149. By its own text, "What waits on it: nothing is enforced. The guard only asks that every authority change … be reported", so the answer changes nothing that gets built.
  - Q1, Q2 and Q4 pass.
- **Wrong findings:** none in the assessment text. The false network statement sits in a patch, so it is counted once, under extras.
- **Consequential extras:** 2.
  1. **`orc-corrections.patch`, README hunk at lines 5-7.** The new text reads "Its own external paths are public webpages through Jina Reader and durable-work notices to an ntfy topic." It moves the "host-limited browser" to Scope packages.
     - That is false. `src/adapters/browser/playwright.ts:55` calls `chromium.launch` inside ORC's own process.
     - The same patch's AGENTS.md hunk (lines 99-104) edits the "Direct network access exists only in `research-tools.ts` … and `ntfy.ts`" paragraph without adding the browser.
     - The run never found the network-list drift, although its §1 says "a browser stack driven by ORC itself".
     - **This is the network-reach omission you asked about.**
     - Borderline, not counted under K21: the same hunk says packages "reach outside services", while the Boundary section still lists "additional external data sources" as absent. The run left that item open.
  2. **`lab-state-and-decisions.patch`, STATE.md "Read first".** It replaces the git-cleanup decision ("2 Oct, Justin: 'yes'") with a pointer, "git cleanup, 2 Oct (local-config `DECISIONS.md`)".
     - The run did not read that file; its §14 says the user-wide files were unreadable.
     - The new decisions file does not carry the decision, so the lab loses its only attributed record of it.
     - Low severity: the pointer is in fact correct according to the user-wide rules. cut3a kept the text and hedged "not checked".
- **Total:** 10.5 / 11.

### Summary

The key items do not separate the two runs. They differ on questions and on harmful patches. On my convention of minus 0.5 for each failing question, wrong finding or extra, the net is cut3a 10.5 and cut3b 9.0.

K7 is scored 0.5 for both runs, for the same frozen #144 line. If that line is accepted as a reason rather than as frozen state, both rise to 11.

| Output | Total (key) | K21 | Questions (failing) | Wrong findings / extras | Net |
|---|---|---|---|---|---|
| R1-cut3a | 10.5 / 11 | met | 5 (0) | 0 / 0 | 10.5 |
| R1-cut3b | 10.5 / 11 | met | 4 (1: Q3) | 0 / 2 (README network reach omits the Playwright browser; git-cleanup pointer to an unread file) | 9.0 |
