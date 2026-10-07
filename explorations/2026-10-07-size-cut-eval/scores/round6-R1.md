<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring: R1-r6a and R1-r6b (ORC and the lab)

I read only `out/R1-r6a/`, `out/R1-r6b/`, the three keys and the target. Every claim below was checked against the target files.

### R1-r6a

**1. Key items**
- **K1: 1.** The guard runs `pnpm typecheck && pnpm test`, `pnpm api:report`, `node tools/map.mjs --check` and `node tools/report.mjs --no-tests`.
- **K2: 1.** F3 quotes "Line 23: '#193 … is built and in review, not merged'; line 31: '#193 is live: #200 merged as `3989cdb`'". It also sets "Lines 58 and 88: ORC runs `369628b` since 3 Oct 22:12:47" against "four restarts on 4 Oct, the last at 14:48:27". The rewritten STATE.md says "Live, as recorded (not re-read since)".
- **K3: 1.**
  - F6 says the token is one "which nothing in `src/`, `config/` or `scripts/` reads". It is corrected in the settled patch.
  - F7: "'Scheduling' is contradicted by the 17 Sep decision and by the `schedules` table … 'Workflow execution' … not plainly settled. Q4."
  - It does not ask whether ORC should have async work. Holding the scheduling fix back is reported under over-sorting, not scored here.
- **K4: 1.** F19: "No guard exists in either repository". Section 12 says "Decision: `create` … Justin kept 'entropy guard at session end' on 4 Oct".
- **K5: 1.** F14: "The only CI is `.github/workflows/danger.yml` … orchestrator#144 is open". F25: "Both hooks print a summary and never block."
- **K6: 1.** The guard checks `git diff --cached`, `git diff` and `git ls-files --others --exclude-standard`.
- **K7: 1.** Rules owned elsewhere are pointers only: local-config `AGENTS.md`, `SECURITY-REVIEW.md`, `dangerfile.js`, #140. The guard says "Never copy current direction, work status… into the guard".
- **K8: 1.** Intent rule item 4: "Do not edit `scope.yaml`, `SCOPE.md`, the records in `decisions/`… unless Justin has recorded that decision."
- **K9: 1.** "Fresh-session discovery: planned. Ask a session with no context…". "It counts as adopted only when a completed guard report exists from a real session end".
- **K21: 1.** The settled patch does not touch "workflow execution" or either cap. It notes "Its 'Target: sixty lines' sentence is untouched, because Q3 is about it".
  - Borderline, not counted: the settled patch copies the north star ("ORC as his ChatGPT replacement…") and the merge rule into the lab's `decisions/`. Q1 asks where Justin's decisions about ORC are recorded. The run counted only #194 as an ORC decision.
- **K23: 1.** Section 4 holds the truth map, section 5 the loop map, and section 11 plus the settled patch the state-file update.
- **K30: 1.** One handover: "→ `session-coherence-skill-generator` → `guards-integrator`". The generator's inputs are listed once.
- **K32: 0.5.** The guard is correctly "executed check; planned", and the reminders are classed correctly. But the run writes "Danger on ORC pull requests: enforced invariant; verified 2 Oct 2026 by the lab's own record of a refused case". STATE.md:79-81 records only a failed check, and `SECURITY-REVIEW.md:54-55` says "without GitHub Pro a failed check warns rather than blocks a merge". On a strict reading of "never" this scores 0.
- **K33: 1.** The guard has "## Modes and safety". It says "write it in place of `<start>`… If you cannot, use `origin/main` and report 'coverage incomplete'".

**2. K34: not met.**
- F9 says "Subprocess access was widened without a recorded decision". The provisional Q2 record says "no recorded decision of Justin's was found for either".
- `src/app/orc-restart.ts:11` records "The operator, 2026-09-28: 'eventually we need to be able to restart without me issuing CLI commands.'" for orchestrator#101, and the run never cites it.
- It does cite `scope-credentials.ts` line 14 for the logins decision.

**3. Questions: 4, 0 fail.**
- Q1 (where ORC decisions live), Q3 (forty or sixty lines) and Q4 (which "Deliberately absent" items stand) each change what gets built.
- Q2 (does a merged PR authorise a widening) is borderline. Its first case, #101, is answered by `orc-restart.ts:11`. Its second case, the core-ties rises, is not answered, so it still changes the build.

**4. Wrong findings**
1. F9 and the provisional Q2 file both claim there is no recorded decision for the restart widening (see K34).
2. The run lists "Checked and found consistent… the direct-network list in `AGENTS.md` against its test". Both omit the Chromium that ORC itself launches:
   - `playwright.ts:54-55` (`chromium.launch`);
   - the "host-owned browser factory" in `browser/index.ts`;
   - `MCP.md:3-5`: "ORC drives Playwright's library in its own process".

   Likewise, F11 treats README:104's "No subprocess ORC launches receives one" as broken only by the restart card. It misses that Chromium receives the Scope's `storage-state` login.
3. F24 says whether the check is required is "unknown from the snapshot". `SECURITY-REVIEW.md:54-55` answers it: a failed check warns rather than blocks.

**Consequential extras**
1. The settled README intro says "What ORC itself reaches is set out in AGENTS.md under 'Boundaries'… Approved Scope packages reach further through their own declared connectors". This points to a list without ORC's own Playwright browser, and it hands the browser's reach to packages. It names neither the browser nor the right owner.
2. The README hunk in `provisional-Q2.patch` says ORC "launches only the subprocesses AGENTS.md lists". That is false while Chromium is unlisted.
3. The integration plan says "a Danger rule refuses a rise in a core-ties allowance". Without GitHub Pro, Danger cannot refuse a merge. This is minor.

**5. Over-sorting**
- The removal of "scheduling" sits only in `provisional-Q4.patch`, whose header says "Removing 'scheduling' alone is settled by Justin's decision of 2026-09-17".
- Borderline: naming `orc-service.ts` in AGENTS.md's subprocess list waits on Q2, although `orc-restart.ts:11`, AGENTS.md:136 and the test's #101 comment settle it.

**6. Total: 13.5 / 14.**

### R1-r6b

**1. Key items**
- **K1: 1.** The guard runs `cd ~/pro/orchestrator && pnpm typecheck && pnpm test`, plus a `pnpm test:e2e` check and `node tools/map.mjs --check`.
- **K2: 1.** F1 sets `:23` "not merged" against `:31` "#200 merged as `3989cdb`", and `:58`/`:88` `369628b` against four later restarts. The rewrite says "ORC, last recorded 4 Oct 14:48:27… Read `pnpm service:status`… before saying what runs."
- **K3: 0.5.** The token part (F5) and scheduling (F6, against A8 and `src/app/async/calendar.ts`) are corrected from evidence, and async work is not questioned. But "workflow execution" is never examined: it appears only as kept text inside the patch.
- **K4: 1.** F12: "'Entropy guard at session end' is decided and not built." Then "Decision: `create`".
- **K5: 1.** F9: "ORC's only workflow is `.github/workflows/danger.yml`; nothing runs `pnpm typecheck` or `pnpm test` on a PR (#144)". F14 says the hooks "print `push-summary` and exit 0".
- **K6: 1.** The same git commands as r6a.
- **K7: 1.** Pointers only. The guard does carry light dated status ("UNRESOLVED (asked of Justin on 7 Oct 2026)", "no CI runs them").
- **K8: 1.** Intent rule item 4 covers `scope.yaml`, `SCOPE.md`, `decisions/`, ORC's AGENTS/README and the north star.
- **K9: 1.** "Fresh-session discovery… ask one fresh session of each tool". "Counts as adopted when a session has run it at its trigger".
- **K21: 1.**
  - "Workflow execution" is unchanged.
  - Both caps are unchanged ("Its `Target: sixty lines` is left as written").
  - The north star's home is kept in the provisional Q3 patch.
  - The credential sentence is left for Q4.
  - Adding `orc-service.ts` is not something the run left open.
- **K23: 1.** Section 5 holds the truth map and the loop map, and section 9 plus `settled-lab.diff` the STATE.md update.
- **K30: 1.** "Step 4: handed to `session-coherence-skill-generator`, which wrote `guard/SKILL.md` and handed to `guards-integrator`". This happens once.
- **K32: 0.5.** It has the same Danger misclassification: "enforced invariant; verified 2 Oct per `STATE.md:79-82`". This also contradicts its own opening line, "none is `verified`". It also files "CI tests: enforced invariant; planned", which a required status cannot be without GitHub Pro. The guard itself is correctly "planned". On a strict reading this scores 0.
- **K33: 1.** "Modes and safety" is present, with `<start>` plus the `origin/main` fallback.

**2. K34: met.**
- A12 cites `src/adapters/scope-credentials.ts:14` and `config/installation.ts:78-79`.
- For the restart it makes no absence claim: "Unauthorised drift: none established". The listing is settled on AGENTS.md:136.

**3. Questions: 4, 0 fail.**
- Q1, where the guard lives, is borderline: the 4 Oct "central Scope" decision leans to (a). But no skill home fits a two-repository guard, so the answer still changes placement.
- Q2 (size owner), Q3 (home of ORC-direction decisions) and Q4 (credential sentence: boundary or description) each change the build.

**4. Wrong findings**
1. The Danger "verified" enforced-invariant claim in the integration advice (see K32).
2. Uncertainties says "the rewritten `STATE.md` keeps #193, because nothing records a newer focus". STATE.md:53 records "ORC scheduling (#166) is built first". As a result, the map's ★ stays on an item the same file calls "merged and live".

**Consequential extras**
1. The settled README intro attributes "Bookwhen's… admin pages" to "approved Scope packages' connectors" and does not name the browser. That reach is ORC's own in-process Chromium (`browser/index.ts`, `playwright.ts:55`) acting under a package grant. Two things soften it: "This list is not exhaustive", and the run's own F7(a), F8 and Q4, which correctly name ORC's Chromium. It is smaller than r6a's version.
2. The settled STATE.md keeps the ★ on #193 (as in wrong finding 2).
3. Planning CI as an "enforced invariant" (minor).

**5. Over-sorting:** none plain. Borderline: the guard's installation and both AGENTS.md pointers wait in `provisional-Q1-*`, although the run itself recommends (a).

**6. Total: 13.0 / 14.**

### Summary

| Output | Total (of 14) | K21 | K30 | K32 | K33 | K34 |
|---|---|---|---|---|---|---|
| R1-r6a | 13.5 | 1 | 1 | 0.5 | 1 | not met |
| R1-r6b | 13.0 | 1 | 1 | 0.5 | 1 | met |

Both runs missed `SECURITY-REVIEW.md:54-55`. That is the shared K32 defect, so a strict 0 on K32 lowers both totals by 0.5 and leaves the comparison unchanged. On ORC's network reach, r6a's README patch is the more harmful: it points readers to AGENTS.md as the complete list of what ORC itself reaches, and it never identifies ORC's own Playwright Chromium anywhere. r6b identifies the Chromium but still blurs who owns it in its settled README sentence.

