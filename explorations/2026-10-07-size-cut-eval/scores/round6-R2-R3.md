<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring of round 6: R2-r6a, R2-r6b, R3-r6

I read only the three output folders, the four keys (plus the "Questions" line of key-R1, which key-R2 points to), the tool-r6 skills and the two targets. I checked every finding cited below against the target files.

**On K30 and the skills:** the tool-r6 skills allow one handover to the generator per route. The front door's Step 4 says it "makes the only handover to the generator on its route". Docs-first Step 7 hands over only when no other skill called it. Only the generator hands on to the integrator.

---

### R2-r6a (entropy-guard at 447da9a)

**1. Key items**
- **K10: 0.5.**
  - **Met in part:** it quotes the passage: "`LEARNINGS.md` lines 117-143 hold three theory entries … whose implications steer future design. Line 123 reads 'The mature form collapses assess → fix with no persistent guard artifact'". It leaves the choice with the steward: "The steward decides whether they move to the sibling repo, which nothing recorded settles". It does not rewrite `INTENT.md`.
  - **Missing:** it never names the conflict with the saved guards that `INTENT.md` and the skills assume, and it offers no choice-with-recommendation on that conflict. It only proposes demoting the entries.
- **K11: 1.** "`skills/entropy-assessment/SKILL.md` line 68 routes only to the first". The settled patch's proposal text repeats it: "`skills/entropy-assessment/` routes only to the first".
- **K12: 1.** "F05: two skills write guards, to different contracts."
- **K13: 1.**
  - "Lines 33 and 137 point at `doc-health-check`, which does not exist."
  - "'Led to the distill-article skill.' No such skill is here."
- **K14: 1.** "F03: three instructions let agents rewrite intent", quoting guard line 68: "if INTENT.md itself needs revision, update it…".
- **K15: 1.** "Line 88 says: '…If so, update both.'", reported under "keep descriptions in step without asking which one owns the concept".
- **K30: 1.**
  - Generator handovers: 1. Docs-first ran "as a called skill", then the front door's guard decision was `update`, then the generator ran.
  - Integrator handovers: 1. "Handoff: to `guards-integrator`, in `integration.md`."
- **K33: 1.**
  - The generated guard has a "## Modes and safety" section.
  - It binds its baseline: "write it in place of `<start>` … If you cannot, use `origin/main` and report 'coverage incomplete'".

**2. Questions:** 5, none fail.
- Q1: which skill writes guards.
- Q2: may agents revise `INTENT.md` themselves.
- Q3: what the validation measures.
- Q4: where the current-state packet lives.
- Q5: whether a guard carries a system snapshot.

Each changes what gets built. None is settled by the target. None reopens a decision recorded with the steward's name and date.

**3. Wrong findings and consequential extras**
- **Wrong findings:** none.
  - One slip in evidence: F08 says a search for "verif" across the skills finds only `guards-integrator` line 96. `session-coherence-skill-generator` lines 154 and 181 also match. The finding still stands.
- **Consequential extras:** none. Every provisional patch is labelled and names its question.

**4. Over-sorting: yes.** `provisional-guard-update.patch` waits on Q2 and Q5, so it holds back fixes the evidence already settles:
- the stale references: `doc-health-check` at guard lines 33 and 137, "README.md (Key Documents table)" at line 99, and "20+ markdown files" at line 92;
- the "update both" repair, replaced by one owner per concept;
- the "Modes and safety" section and the baseline binding;
- the summary at `README.md` line 78.

Only the copied intent-change rule touches Q2. The run explains this in its `feedback.md`, item 2.

**5. Total: 7.5 of 8.**

---

### R2-r6b (entropy-guard at 447da9a)

**1. Key items**
- **K10: 0.5.**
  - **Met in part:** it reports the tension: "`:123` reads as live direction: 'The mature form collapses assess → fix with no persistent guard artifact'. No decision adopts it." Risk R3 adds "a learning that directs the product toward no persistent guard". It does not rewrite `INTENT.md`.
  - **Missing:** it offers no open choice and asks no question. The settled patch replaces `LEARNINGS.md` lines 117-143 with a pointer to `PHILOSOPHY.md`, citing the decision "LEARNINGS.md stays tactical". The key wants this held open as a choice.
- **K11: 1.** "Nothing routes to the generator: `README.md:21-66` does not route to it, and neither do `entropy-assessment` or `docs-first`."
- **K12: 1.** "F5. Guard writing is defined in full by two skills, and one of them has no route in."
- **K13: 1.**
  - "'use doc-health-check for that': no such skill exists".
  - "'Led to the distill-article skill', which is not in this repo".
- **K14: 1.** On guard line 68: "This treats the work as permission to change intent (F2)."
- **K15: 1.** "F3. The guard repairs drift by keeping two copies in step … 'If so, update both.'"
- **K30: 1.**
  - Generator handovers: 1 ("`session-coherence-skill-generator`, which updated the guard").
  - Integrator handovers: 1. The integration brief opens "after `session-coherence-skill-generator` updated the guard".
- **K33: 1.** The guard has "## Modes and safety". It binds `<start>`, falling back to `@{upstream}` with "coverage incomplete".

**2. Questions:** 3, none fail.
- Q1: which skill writes guards.
- Q2: may contributors revise `INTENT.md`.
- Q3: which projects the validation batch uses and what it tracks.

**3. Wrong findings and consequential extras**
- **Wrong findings:** none. There are two slips in evidence:
  - The statements table says `DECISIONS.md` has "14 entries"; it has 17.
  - F5 cites `DECISIONS.md:9`, "the previous session-coherence-skill-generator", as a sign the skill was never adopted. In context, "previous" means the skill's earlier version. That reading is written into the proposal text the settled patch adds to `DECISIONS.md`.
- **Consequential extras:** none counted.
  - **A muddle worth noting:** the settled patch installs the new guard. Its copied intent-change rule (steps 3-5) forbids editing `INTENT.md` without Justin's recorded decision. A paragraph just below says the permissive `AGENTS.md` instruction governs until he decides. That leaves Q2 open and keeps current behaviour, but the guard contradicts itself.

**4. Over-sorting:** none found. The three provisional patches touch only Q1, Q2 and Q3.

**5. Total: 7.5 of 8.**

---

### R3-r6 (agentic-architecture, reference-only)

**1. Key items**
- **K16: 1.**
  - It reports the conflict: "F3 — 'Current' claims contradict the banner. `README.md:9` ('bleeding-edge design source for the current named version')".
  - It treats the banner as the current status: "Authorised: reference-only, per the banner."
  - It asks one related question: Q1, about the call's date, its record and the steward. It does not ask which status holds.
- **K17: 1.**
  - The guard decision is `none`.
  - The settled patch only adds signposting and a current-state section in `ROADMAP.md`.
  - It recommends against content corrections: Q2, recommended answer (a).
  - The only change to the guard is a demotion, drafted as provisional (Q3).
- **K24: 1.** "Decision: `none`. … Option (d) would add a per-session guard to a repo where almost nothing should change."
- **K30: 1.**
  - Generator handovers: 0. Integrator handovers: 0.
  - "Step 4: no handover. The generator is not invoked for `none`, so `guards-integrator` is not reached." That is correct for `none` under K30 as clarified.
- **K31: 1.** It used the existing `ROADMAP.md` as the state file and the existing `DECISIONS.md` for the decision record. It created no surface and did not use bootstrap.
- **K33:** does not apply, because no guard was generated.

**2. Questions:** 3, none fail.
- Q1: when the reference-only call was made, and whether to log it.
- Q2: whether reference-only allows content corrections.
- Q3: what happens to the guard and the session rituals written for active work.

**3. Wrong findings and consequential extras**
- **Wrong findings:** none. I verified F4, F8, F9, F10, F12, F13, F14, F15, F16 and F17 against the target.
- **Consequential extras:** none.
  - Q1's patch is a placeholder draft.
  - The Q2 patch is labelled "apply only if (b)" and says to check the sibling paths on disk first.

**4. Over-sorting:** nothing clear-cut. The Q2 patch holds corrections whose content the evidence settles, such as the superseded gateway wording at `RUNTIME.md:67` and `:82` and the resolved questions at `SCOPES_PLANNED.md:90`. It holds them behind a real question: whether a reference-only repo should be edited at all. Demoting the guard and the session rituals (Q3) sets the banner against older standing instructions, and no decision ranks the two. That is not plainly settled either.

**5. Total: 5 of 5.**

---

### Summary table

| Output | Total | K10 | K11 | K12 | K13 | K14 | K15 | K16 | K17 | K24 | K30 (generator / integrator handovers) | K31 | K33 | Questions (asked / fail) | Wrong findings | Consequential extras | Over-sorting |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R2-r6a | 7.5/8 | 0.5 | 1 | 1 | 1 | 1 | 1 | – | – | – | 1 (1 / 1) | – | 1 | 5 / 0 | 0 | 0 | yes: the whole guard update is provisional |
| R2-r6b | 7.5/8 | 0.5 | 1 | 1 | 1 | 1 | 1 | – | – | – | 1 (1 / 1) | – | 1 | 3 / 0 | 0 | 0 | none |
| R3-r6 | 5/5 | – | – | – | – | – | – | 1 | 1 | 1 | 1 (0 / 0, decision `none`) | 1 | n/a | 3 / 0 | 0 | 0 | none clear-cut |

The totals sum the key items only. Questions, wrong findings and extras are reported in their own columns. Both R2 runs lose the same half point on K10: neither presents the saved-versus-fresh-generation conflict as an open choice with a recommendation. R2-r6a leaves it open but barely names it. R2-r6b names it more clearly, then relocates the learnings in its settled patch.
