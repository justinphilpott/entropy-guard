<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

# Scoring: cut2a and cut2b, runs R1 and R2

**How the total works.** Met = 1, partly met = 0.5, not met = 0, summed over the key items. The key gives no weights for questions, wrong findings or consequential extras, so the total does not deduct for them. They are counted beside it. Every claim called right or wrong below was checked against the read-only targets.

---

## R1-cut2a (ORC and the lab)

**Key items**

| Item | Score | Evidence |
|---|---|---|
| K1 | met | Route: "Shape B, so `mixed-profile.md`". The guard runs `pnpm typecheck && pnpm test`, `pnpm test:e2e` and `node tools/map.mjs --check`. |
| K2 | met | F8 has both contradictions. First: "Line 23 says #193 is 'built and in review, not merged'; line 31 says '#193 is live'". Second: "Line 88 … 'started 2026-10-03 22:12:47 on `369628b`' … Against that, lines 31–36 record restarts at 13:36:37 … 14:48:27". It does not claim which is live: "Every live fact below is quoted from `STATE.md` with its date, never observed". The patch marks values "as recorded on 4 Oct" and adds "Re-read with `pnpm service:status`". |
| K3 | met | F3: "README 152–154 lists scheduling and workflow execution as 'deliberately absent'. This contradicts A5 (17 Sep)", backed by the `*:async-series` scripts. F4: "nothing in `src/` reads that token" (verified). Both are corrected by patch; Justin is not asked about async work. |
| K4 | met | F22: "A process kept without anything behind it … Neither repository has a guard file." §14: "A session-end guard is a kept process (A8) with nothing behind it". |
| K5 | met | F11: "`.github/workflows/danger.yml` is the only CI job … Decided, not built: #144, kept on 4 Oct." §9: the pre-push hooks "only print a push summary and never block". |
| K6 | met | The guard runs `git diff --cached`, `git diff` and `git ls-files --others --exclude-standard`. |
| K7 | partly | It has no build ids or PR numbers, and it lists the rules owned elsewhere. But it restates the merge rule: "Before merging an ORC pull request: is Danger's 'Security review' check green (a red one warns, it does not block), and did `pnpm typecheck` and `pnpm test` pass". It also freezes current state: "CI runs only Danger"; "`--check` treats a repository it could not read as having no issues" (the F13 bug); and the root-report list "`CLASSIFY.md` to `VISIBILITY.md`". |
| K8 | met | Intent-change rule v2, step 4: "Do not edit the lab's `SCOPE.md`, `scope.yaml` or `decisions/`, or ORC's `AGENTS.md` rules or README 'Direction' and 'Boundary', to match the work unless Justin has recorded that decision." |
| K9 | met | `integration.md`: "The trigger has fired once" and "A fresh agent session finds it … Only an answer from a fresh session counts as adoption." |
| K21 | met | `orchestrator.patch`, header lines 12–13: "'additional external data sources' and 'workflow execution' … no recorded decision settles them, so they stay. Only 'scheduling' moves". The README hunk (patch lines 112–117) keeps "workflow execution". The lab patch leaves both cap texts alone (Q2) and says in `SCOPE.md` "What else it should cover is open". No patch changes text belonging to Q1–Q4, F18 or F19. |
| K23 | met | One assessment holds §5 truth map, §6 loop map and §13 state update, with the `STATE.md` rewrite in the lab patch. |

**Key total: 10.5 of 11.**

**Questions: 4, none fail.**
- Q1, where the guard lives: passes.
- Q2, the `STATE.md` cap: passes.
- Q3, how #144 runs tests: passes. It repeats a question already waiting on Justin (`STATE.md`:69), but that is undecided, and the answer changes the guard's merge check.
- Q4, ORC's root reports: passes. It is a structural change.

**Wrong findings: 2, both minor.**
1. F3 says the 17 Sep decision contradicts "workflow execution" as well as scheduling. That decision does not plainly cover workflow execution, as the run's own patch header later says.
2. F10 says ORC `AGENTS.md` 142–143 "says the same" as `SECURITY-REVIEW.md`. It only says a direct push to `main` is not checked; it never says a failed check only warns.

**Consequential extras: 2.**
1. **The scheduling chat disappears.** The `STATE.md` rewrite drops "the scheduling chat (#166)" from Waiting on Justin (target `STATE.md`:71) without saying so. The patch header's list of what moved where does not mention it. The same rewrite moves "Where we are now" to #166, the line `tools/map.mjs` reads. If applied, the state file sends agents to build #166 with the pending chat gone.
2. **The README understates ORC's network reach.** `orchestrator.patch` lines 52–55 say "Its own network reach is read-only Jina Reader requests for the researcher and ntfy notices". In fact ORC launches headless Chromium in its own process (`src/adapters/browser/playwright.ts` header, and `chromium.launch` at line 55). The run never noticed the browser, so its "correction" misstates a security boundary. Severity: low to moderate.

Not counted: the new row in the lab's `AGENTS.md`, "`decisions/`; `STATE.md` may link it, never hold it alone". It adds a working rule without asking Justin; cut2b asked this as Q2. Low harm.

---

## R1-cut2b (ORC and the lab)

**Key items**

| Item | Score | Evidence |
|---|---|---|
| K1 | met | Route: mixed-profile. The guard runs `pnpm typecheck && pnpm test # in ORC` and `pnpm test:e2e`. |
| K2 | met | F1: "line 23 says #193 is 'built and in review, not merged'; line 31 says '#193 is live: #200 merged as `3989cdb`'", and "lines 58 and 88 say ORC runs `369628b` … lines 31-35 record restarts". Live facts are "quoted from the lab's `STATE.md` … and was not re-read". Patch 03 heads them "re-read before stating any of them". |
| K3 | met | F8: "no source reads the variable (only tests stub it)". F10 sets the "deliberately absent" list against the 17 Sep decision, `sqlite.ts` 41-51, `src/app/async/calendar.ts` and the scripts. Corrected by patch 01; no question. |
| K4 | met | F17: "kept on 4 Oct … exists in neither repository: the lab's `skills/` holds a `.gitkeep`". §11: "Justin kept 'entropy guard at session end' on 4 Oct, which authorises it". |
| K5 | met | F13: "ORC's only CI job runs Danger … Tests on every PR (#144) was kept on 4 Oct". The hooks "never block". The integration plan says "Later, linked to existing work rather than parallel projects: … #144". |
| K6 | met | The same staged, unstaged and untracked commands as cut2a. |
| K7 | met | The guard points to `STATE.md` and `decisions/` and lists the rules owned elsewhere. It holds no build ids or PRs, and no issue number except the map root, #140. One frozen fact: "CI runs only the Danger check". |
| K8 | met | Intent-change rule v2, step 4. |
| K9 | met | `integration.md` Adoption, steps 1 and 2: the trigger fires, and a fresh session names the guard. |
| K21 | **not met** | **Patch 01, README hunk `@@ -143,15 +143,17 @@`, patch lines 170–175.** It replaces "-scheduling, additional external data sources, workflow execution, sandboxes…" with "+additional external data sources, sandboxes, shell access, and file edits. Durable work, including scheduled and recurring work, was decided on 2026-09-17". So "workflow execution" leaves a list whose rule is "each requires a decision", and the header (lines 4–5) says "No other open question is touched." The 17 Sep decision does not plainly say workflow execution. ORC also has `src/workflows/`, and `AGENTS.md` says "Workflow modules receive neither network nor subprocess access", so the phrase has a second reading. The other patches are fine: 04 and 05 settle Q1 and Q2 but are labelled PROVISIONAL; 03 keeps both cap texts and the scheduling chat; 01's historical banners fit every reading of Q5. |
| K23 | met | §7 holds the truth map, loop map and state-file update in one assessment. |

**Key total: 10 of 11.**

**Questions: 5, 1 fails.**
- Q1, the guard's home: passes.
- Q2, where decisions are recorded: passes.
- **Q3, the pace rule: fails.**
  - It asks Justin to choose between the lab `AGENTS.md` rule, which has no name or date, and his own words of 21 Sep, which are attributed and dated (`reports/2026-09-22-pushback-analysis.md`). It then recommends the reading that limits his words. That reopens a recorded decision.
  - The case where the readings differ, option D, is not the next work. The 4 Oct order (#166 first) fixes the next work under either reading, as cut2a noted.
  - The guard only links `HOW_NOT_TO_PLAN.md`, so no guard check depends on the answer.
- Q4, the `STATE.md` cap: passes.
- Q5, ORC's branch reports: passes.

**Wrong findings: 2, both minor.**
1. F10 makes the same overstatement as cut2a's F3 about "workflow execution", and here it drives the K21 patch.
2. Patch 02 rewrites the lab README's `--no-tests` line and keeps "keeps the day's test count". That is false: `report.mjs`:51 sets `suites` to null, and :313 writes it into `reports/<date>.json`. cut2a caught this (F20).

**Consequential extras: 1.**
1. Patch 01's removal of "workflow execution", as described under K21.

Not counted: patch 02 adds "Superseded in part" to Justin's 17 Sep decision record. It rests on FIXES.md's "approved split", whose approver the note admits is unrecorded. Low harm; the note says "it decides nothing".

---

## R2-cut2a (entropy-guard at `447da9a`)

**Key items**

| Item | Score | Evidence |
|---|---|---|
| K10 | partly | F8 reports the conflict. It quotes `LEARNINGS.md`'s "The mature form collapses assess → fix with no persistent guard artifact" and sets it "against … I1, I6, I7". But it is not presented as an open choice, and no question is asked. Instead it is settled from the steward's 24 March words ("farm this new evolution off into its own repo"). `cleanup.patch` then marks both `LEARNINGS.md` entries "Historical for this repo … Its implication is not current work here." Not silent, and `INTENT.md` is untouched, so partly. |
| K11 | met | F5: "The generator is referenced by no other skill (search: only README.md line 91, AGENTS.md line 46, DECISIONS.md lines 9-10)". F6: "`entropy-assessment` v0.6.0 only routes". Verified: no other skill names it. |
| K12 | met | F5: "Two skills write guards … `docs-first-planning-assessment` Phase 2 … and `session-coherence-skill-generator`". |
| K13 | met | F12: "`doc-health-check` (lines 33, 137) does not exist". F14: "A learning names a skill that is not here", about distill-article. |
| K14 | met | F2: "guard line 68 ('if INTENT.md itself needs revision, update it with a dated note')", under "Intent documents and the guard invite editing intent to match the work". |
| K15 | met | F3: "Guard line 88: '… If so, update both.'", under "Guard repair instructions keep copies in step". |

**Key total: 5.5 of 6.**

**Questions: 4, none fail.**
- Q1, who the steward is: passes, but it is the weakest. The evidence settles it (cut2b did not ask). Answer (b), "held jointly", would change the intent rule, so it still passes.
- Q2, who may revise `INTENT.md`: passes.
- Q3, what the validation batch measures: passes. It changes how the batch is chosen and scored, and neither side is named and dated.
- Q4, which skill writes guards: passes.

**Wrong findings: 1, minor.**
- F6 counts `guards-integrator` line 221 ("If the assessment skill generated the guards") as stale. It still fits `docs-first-planning-assessment`, which does generate guards.

**Consequential extras: 1, borderline.**
- `cleanup.patch` (patch lines 72–86) marks the steward's two `LEARNINGS.md` theory entries "not current work here". That settles K10's open choice inside his own learning log. The header says Q1–Q3 are untouched and does not flag this as a choice. In its favour, it cites his dated 24 March words.

---

## R2-cut2b (entropy-guard at `447da9a`)

**Key items**

| Item | Score | Evidence |
|---|---|---|
| K10 | partly | F11: "`LEARNINGS.md:123` says 'the mature form collapses assess → fix with no persistent guard artifact'. Current practice keeps a guard file." Its gaps section says: "Evidence settles it: every later decision builds persistent guards". It asks no question and presents no open choice. The `LEARNINGS.md` change is left as "Recommendation for the steward … Not patched". But `state-file.patch` and guard check 8 still treat those entries as "not current truth". `INTENT.md` is untouched. |
| K11 | **not met** | It never reports that `entropy-assessment` fails to route to the generator. The closest it comes is F6: "`INTENT.md:86-88` … never mentions `session-coherence-skill-generator`" and "`DECISIONS.md:7-11` extends the generator without placing it". Those are about the intent documents, not the front door. |
| K12 | met | F6: "Phase 2 … writes guards, and so does `session-coherence-skill-generator`". |
| K13 | met | F14: `doc-health-check` "does not exist"; distill-article "is not in this repo". |
| K14 | met | F3 lists ":68: 'if INTENT.md itself needs revision, update it with a dated note'" and says "each one is a path for unauthorised drift". |
| K15 | met | F4: "'update both.' That keeps two copies of one truth alive." |

**Key total: 4.5 of 6.**

**Questions: 3, none fail.** Q1 who may change `INTENT.md`, Q2 the validation measure, Q3 which skill writes guards: all pass.

**Wrong findings: 1, minor.**
- F7 counts `guards-integrator` :221 and :227 as stale. :227 ("A replacement for `entropy-assessment` — use that to decide what guards are needed") is still accurate, because `entropy-assessment` remains the front door.

**Consequential extras: none counted.** Guard check 8 and the TODO line "do not describe current practice" lean the same way as cut2a's patch. They state a true fact, though, and the run left the `LEARNINGS.md` edit to the steward.

**Findings outside the key, all verified.**
- cut2b R2 F18: the bootstrap-verification requirement in `DECISIONS.md:42` is in no skill.
- cut2b R1 F9: the Playwright browser is in neither ORC `AGENTS.md`'s lists nor the architecture test.
- cut2a R1 F20 and F23: `--no-tests` wipes the day's test count, and the guarded-path test omits `AGENTS.md` and `config/`.

---

## Summary

| Output | Total (key) | K14 | K15 | K21 | Questions (failing) | Wrong findings | Consequential extras |
|---|---|---|---|---|---|---|---|
| R1-cut2a | 10.5 / 11 | n/a | n/a | met | 4 (0) | 2 minor | 2 |
| R1-cut2b | 10 / 11 | n/a | n/a | **not met**: patch 01 drops "workflow execution", lines 170–175 | 5 (1: Q3) | 2 minor | 1 |
| R2-cut2a | 5.5 / 6 | met | met | n/a | 4 (0) | 1 minor | 1 (borderline) |
| R2-cut2b | 4.5 / 6 | met | met | n/a | 3 (0) | 1 minor | 0 |

No files were written.
