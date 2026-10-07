<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring of the six R1 outputs (r8/R1/a to f) against the fixed key

I read all six folders in full: assessment, questions, integration, guard and every patch. Disputed claims were checked against the target. Standards I applied the same way to all six:

- **Quoted text (K36).** A settled hunk "edits text a question quotes" only when it changes the part of the quote that the question is about. A line quoted only as background does not count.
- **K35.** A provisional hunk that credits the browser's reach to a package fails, as the round-7 key says.
- **Questions.** A question fails if any item it asks Justin to decide is already settled by a dated record in the target. That covers the 17 Sep `apply_slots` decision, #76 (3 Oct), `src/app/orc-restart.ts:11` (operator, 28 Sep) and `config/installation.ts:99-102` (operator, 2 Oct, package phone topics).

### a — total 15.0
- K1 1: route B; the guard runs `pnpm typecheck && pnpm test`.
- K2 0.5: F8 reports "369628b since 3 Oct 22:12:47" against the 4 Oct restarts onto 8cee662. It never reports #193/#200 "not merged" against "merged" (a search for "not merged" or "in review" found nothing).
- K3 1: F3 and F5 correct the Bookwhen token and "scheduling" in the settled patch. It does not ask about async work.
- K4 1: F14, "'Entropy guard at session end' was kept on 4 Oct, and neither repository has a guard"; the decision is `create`.
- K5 1: F12, "Nothing runs `pnpm typecheck` or `pnpm test` on a pull request… Already tracked: #144"; F15 covers the hooks.
- K6 1: the guard runs `git diff --cached`, `git diff` and `ls-files --others`.
- K7 1: the guard holds pointers only. It freezes one small fact: map check "reads 6 of the map's 9 repositories".
- K8 1: rule 4 is filled in.
- K9 1: run the guard once at a session end, plus the fresh-session check.
- K21 1: "Target: sixty lines" is kept verbatim, and "reminders and workflow execution deliberately left".
- K23 1: section 5 holds the truth map and loop map; `STATE.md` is rewritten in the settled patch.
- K30 1: one handover.
- K32 0.5: Danger is "enforced invariant | verified per the record", but `SECURITY-REVIEW.md:54-55` says a failed check only warns.
- K33 1.
- K35 1. Claims checked, all with Chromium credited to ORC and the search in section 4 beside them:
  - F1 and F2;
  - the section 4 reach table ("A Chromium child of orc.service");
  - the settled subprocess list (adds `playwright.ts`);
  - the settled network note ("incomplete");
  - the settled README opener ("not a complete inventory");
  - the settled credentials paragraph;
  - Q1;
  - the provisional delegated-reach list ("from the session's headless Chromium");
  - the guard's search.
- K36 1: lists are completed or marked, and the unverified credential part is marked.
- **K34: met.** It cites `scope-credentials.ts:14-16` and makes no claim of absence.
- **Questions:** 3, none fail.
- **Wrong findings:** F17, "The core-ties ratchet scans only src/ and web/src/". In fact `test/core-ties.ts:8` scans `config/`, and allowances exist for `config/installation.ts`.
- **Consequential extras:** none.
- **Over-sorting:** DNS goes into the network list and the test's DNS pattern only in the provisional patch, though Q1 itself says DNS is ORC's own code "under either reading". The settled patch does note it.

### b — total 13.5
- K1 1.
- K2 1: F17, "L23 says #193 is 'not merged'; L31 says '#193 is live'", plus 369628b against the restarts.
- K3 1.
- K4 1.
- K5 1: F19 (#144) and F20 (hooks).
- K6 to K9: 1 each.
- K21 1: the cap is kept; "workflow execution" is kept.
- K23 1.
- K30 1.
- K32 0.5: "The architecture and ratchet tests: enforced invariant, run by hand; unknown". Nothing runs them, so they enforce nothing.
- K33 1.
- K35 0. The provisional README says "Beyond the machine it reaches … what approved Scope packages' connectors reach… Today those are the Moving Stillness Scope's… admin browser", which credits the browser's reach to a package. Claims checked:
  - F8, F9 and F13;
  - the reach search (patterns, paths and hits are recorded);
  - the settled AGENTS.md ("Chromium reaches the hosts its connector's card approves").
  All were fine apart from that README hunk.
- K36 0: the settled README keeps "No subprocess ORC launches receives one." F12 says "launched processes receive ORC's credentials… playwright.ts L55 launches Chromium the same way".
- **K34: met.**
- **Questions:** 5, of which 2 fail.
  - Q3 puts the slots apply back as undecided, though the 17 Sep decision settled it.
  - Q5 (pace rule): its own example says #166 "goes ahead" under every reading, so the answer changes nothing built.
- **Wrong findings:**
  1. F6 says the ties ratchet scans only `src/` and `web/src/`. It also scans `config/`.
  2. The settled AGENTS.md says "In ORC's own source, direct network requests are made only in" Jina and ntfy. This misses `playwright.ts:14/:520` `node:dns` lookups; its search had no DNS pattern.
  3. F5 and Q3 treat the Bookwhen apply as having no decision.
- **Consequential extras:**
  - The settled README re-asserts the false subprocess-credential claim.
  - The provisional README misattributes the browser's reach.
- **Over-sorting:** "without applying it" and the README opener (Chromium, restart commands) are held provisional on Q3.

### c — total 14.5
- K1 1.
- K2 0.5: F1 reports 369628b against the restarts and the Moving Stillness mismatch. There is no "not merged" contradiction.
- K3 1: an inserted note corrects scheduling; the token is corrected.
- K4 1 (F17).
- K5 1 (F9, F22).
- K6 to K9: 1 each.
- K21 1: "Deliberately absent" is left byte-identical; the cap is kept.
- K23 1.
- K30 1.
- K32 1: Danger is "executed check: a failing status that warns, not blocks… (F10)"; the guard is planned.
- K33 1.
- K35 0. The provisional README says "every other outside service… is reached through an approved Scope package…, such as Bookwhen's admin pages through a browser". That credits the reach to packages, and it also omits Pi and ntfy. Claims checked:
  - F7c ("headless Chromium launched in ORC's own process");
  - the reach table ("ORC main, per session"), with its search recorded;
  - the settled README opener and AGENTS.md note ("Neither is a complete list");
  - Q2;
  - the provisional AGENTS.md.
  All were fine apart from that README hunk.
- K36 1: the settled README marks "No subprocess ORC launches receives one" as "under question"; the AGENTS.md lines are kept, with an incompleteness note.
- **K34: met** (`scope-credentials.ts:14`).
- **Questions:** 5, of which 1 fails. Q2 asks whether the Chromium (#76) and the Moving Stillness apply (17 Sep) are authorised.
- **Wrong findings:**
  1. `integration.md` says "neither has a CLAUDE.md". The lab has one, a symlink to `AGENTS.md`.
  2. The settled README says "A credential ORC holds itself is read in one place, `src/runtime.ts`". `web-cli.ts:625` reads `ORCHESTRATOR_WEB_TOKEN`, which its own checked list notes, and `runtime.ts` reads none.
- **Consequential extras:**
  - The provisional README's reach sentence: Jina is named as the only thing ORC reaches itself.
  - The settled "one place" claim.
- **Over-sorting:**
  - Chromium and DNS are kept out of the settled lists, which are only marked incomplete, and held on Q2.
  - "without applying it" is held on Q2, though settled on 17 Sep.

### d — total 15.5
- K1 1.
- K2 1: F7, "'#193 … not merged' (23), against '#193 is live: #200 merged' (31)", plus 369628b.
- K3 1.
- K4 1 (F19).
- K5 1 (F5, F18).
- K6 to K9: 1 each.
- K21 1: the cap is kept; "workflow execution" is kept.
- K23 1.
- K30 1.
- K32 0.5: Danger is "enforced invariant on pull requests; verified as recorded… It warns rather than blocks", which contradicts itself.
- K33 1.
- K35 1. Claims checked: F1 and F2, which carry their search patterns, with paths in section 12; the settled AGENTS.md, which credits Chromium and DNS to `playwright.ts`; the settled README ("It launches… one headless Chromium"); provisional P1 and P2. Both lists are marked "incomplete".
- K36 1: "These two lists are incomplete… P1 and P2" covers the re-emitted ntfy sentence.
- **K34: NOT met.** F1 says "no decision of Justin's in the two repositories does (P1)". P1 says "No decision of Justin's authorising this reach is in either repository". `orc-restart.ts:11` records it.
- **Questions:** 5, of which 2 fail. P1 asks about the restart card (recorded in code). P2 asks whether packages may reach ntfy, which the operator decided on 2 Oct (`config/installation.ts:99-102`).
- **Wrong findings:**
  1. The settled AGENTS.md and README remove `list_open_fridays` and "open Fridays" from what the model has. `src/core/iris.ts:17` still lists it, served by the package or the stand-in at `runtime.ts:259`.
  2. The claim of no decision for the restart card.
  3. The claim of no decision for the phone connector, labelled "Unauthorised drift".
- **Consequential extras:** the settled patch narrows the model's documented tool list in the security boundary.
- **Over-sorting:**
  - The `orc-service` listing (P1) and the package ntfy reach (P2) are held provisional despite the code records.
  - The copy of the north star is held for P5.

### e — total 13.5
- K1 1.
- K2 0.5: F18 reports 369628b against 8cee662, plus the Moving Stillness and grant mismatches. There is no "not merged" contradiction.
- K3 1.
- K4 1 (F28).
- K5 1 (F25, F31).
- K6 to K9: 1 each.
- K21 1: the cap is kept; "workflow execution" is kept.
- K23 1.
- K30 1.
- K32 0.5: Danger is "Enforced invariant. Unknown… it warns rather than blocks".
- K33 1.
- K35 0.5. The browser is present and owned by ORC everywhere:
  - F04 ("`playwright.ts:55`: `chromium.launch`");
  - P1;
  - the provisional AGENTS.md and README.
  But the network claim in F05 has no recorded search; only F04's process search lists patterns and paths.
- K36 0. Two settled hunks are re-emitted unmarked:
  - The rewritten README credentials paragraph ends "No subprocess ORC launches receives one." F08 calls this "doubtful: the Chromium is given the approved storage state".
  - The AGENTS.md hunk re-emits "sends only a title, the notice's summary and the one configured tap address", which F06 says "The code contradicts".
- **K34: met** (`scope-credentials.ts:14-15`; no explicit claim of absence).
- **Questions:** 5, of which 1 fails. Q1 asks Justin to "confirm" the restart module, the Chromium and the phone connector, all of which are already recorded.
- **Wrong findings:** F06 says "Whether this reach was authorised is not recorded in either repository", and the gaps list calls it unauthorised drift. Both are contradicted by `config/installation.ts:99-102`.
- **Consequential extras:** the settled patch publishes those two contradicted security sentences unmarked.
- **Over-sorting:** every reach-list correction (orc-service, Chromium, DNS) is held on Q1, and the settled patch has no incompleteness marker.

### f — total 16.0
- K1 1.
- K2 1: F14 covers both contradictions.
- K3 1: the token is settled. Scheduling is called stale and settled by 17 Sep, and is not asked about. The correction itself is held back; see over-sorting.
- K4 1 (F19).
- K5 1 (F17, F24).
- K6 to K9: 1 each.
- K21 1: the cap is kept; "workflow execution" is changed only in the provisional patch labelled Q5. One minor inconsistency, not scored: Q3 says it decides "where the copies of… ORC's north star go", yet the settled patch copies the north star into the README's "Direction".
- K23 1.
- K30 1.
- K32 1: Danger is "executed check, warns without blocking (F18)".
- K33 1.
- K35 1. Claims checked: F7 to F10; the section 5 reach record (patterns, paths and hits; "ORC, for a package's browser connector"); the settled AGENTS.md ("ORC also reaches the network through what it starts or loads: Chromium… from a pattern search… incomplete"); the settled README pointer; the provisional patches.
- K36 1: the settled README says "That does not yet hold for the restart card's commands… Chromium… may inherit it too". The ntfy re-wrap is covered by "one further path is under an open question".
- **K34: met** (`scope-credentials.ts:15-16`).
- **Questions:** 5, none fail.
- **Wrong findings:** F21, "The core-ties ratchet does not cover `config/`", is false.
- **Consequential extras:** none. One note: the rewritten `STATE.md` is 85 lines, still over both caps, and Q2 leans on that number to recommend sixty.
- **Over-sorting:** removing "scheduling" is held in the provisional patch (Q5), though f itself says the 17 Sep decision settles it.

### Cross-output notes
- No output read "not merged" in K2 from only one side. a, c and e simply missed the #193 contradiction.
- Only c and f classify Danger correctly as a check that warns. a, d and e call it an enforced invariant; b mislabels the tests that are run by hand instead.

| Output | Total | K1 | K2 | K3 | K4 | K5 | K6 | K7 | K8 | K9 | K21 | K23 | K30 | K32 | K33 | K34 | K35 | K36 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| a | 15.0 | 1 | 0.5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0.5 | 1 | met | 1 | 1 |
| b | 13.5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0.5 | 1 | met | 0 | 0 |
| c | 14.5 | 1 | 0.5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | met | 0 | 1 |
| d | 15.5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0.5 | 1 | not met | 1 | 1 |
| e | 13.5 | 1 | 0.5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0.5 | 1 | met | 0.5 | 0 |
| f | 16.0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | met | 1 | 1 |

Questions, as failed of asked: a 0/3, b 2/5, c 1/5, d 2/5, e 1/5, f 0/5.

No files were written. I did not open `r8-mapping.json` or anything else outside the six folders, the keys and the target.
