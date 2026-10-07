<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring of the six R2 outputs (`blind/r8/R2/a` to `f`), against `key-R2.md`, the K30 and K33 items in `key-round5-extra.md`, and K36

I checked every claim against the read-only snapshot `entropy-guard-447da9a`. I applied two standards the same way to all six outputs:

- **Questions on the validation measure.** All six asked the merged-PRs-versus-session-measures question. I counted it as passing each time, but it is borderline: `INTENT.md`, `README.md` and `TODO.md` agree on the session measures, and run a drafted no change for it.
- **K33.** All six guards meet it. Each has a "Modes and safety" section and tells the runner to write the start commit in place of `<start>`, with a fallback to `@{upstream}` (c uses `origin/HEAD`).

### a: 8.5 of 9
- **K10 = 0.5.** F15 says "One implication runs against current practice: line 123, '…no persistent guard artifact'". It is not presented as an open choice with a recommendation; there is only a backlog item asking where the three entries belong.
- **K11 = 1.** "The front door's Steps 2-3 have no route to the generator or its bootstrap mode."
- **K12 = 1.** F4: "Guard generation is defined twice."
- **K13 = 1. It names both.** F11(d): `doc-health-check` "does not exist". F15: a "distill-article skill" that "is not in this repo".
- **K14 = 1.** "line 68 … This is a path for unauthorised drift."
- **K15 = 1.** "'update both.' This keeps two definitions in step."
- **K30 = 1.** One handover, `update` → generator → integrator. The integration brief hands nothing back.
- **K33 = 1.**
- **K36 = 1.** Every settled hunk agrees with the findings. The `README.md:78` hunk keeps the phrase Q3 quotes ("a concrete example of what the generator produces") unchanged.
- **Questions:** 5, none fails.
- **Wrong finding (1):** `DECISIONS.md` is called "newest entry first" in the truth map, the guard and the settled `TODO.md`. In the target, "Two-layer…" (line 103) sits above "Consolidate…" (line 129), which superseded it. F3 itself only says the order "looks newest-first".
- **Consequential extras:** the same claim, carried into the settled `TODO.md`.
- **Over-sorting:** the whole guard update sits only in the provisional patch, under Q2. That includes the "update both" repair, removing the `doc-health-check` pointer, and modes and safety. The FlowBook and metadata edits are also held for Q3, although the run says they do not touch it.

### b: 7.5 of 9
- **K10 = 0. Not found.** It lists only "just-in-time guarding (LEARNINGS.md:117-143…)" as exploratory, with no conflict reported.
- **K11 = 0.5.** It says "The entropy-assessment fallback (Step 4d) … names no skill to write it". It never says the front door does not reach the generator.
- **K12 = 1.** F4: "Two skills write guards."
- **K13 = 1. It names both.** F9: `doc-health-check` "does not exist". F8: the `distill-article` skill "is not in the repository".
- **K14 = 1.** "This repair gives a path for unauthorised drift."
- **K15 = 1.** F3: "A guard repair keeps two definitions in step."
- **K30 = 1.**
- **K33 = 1.**
- **K36 = 1.** The integrator rewording "names no writer", and no hunk edits text a question quotes.
- **Questions:** 4, none fails.
- **Wrong findings:** none.
- **Consequential extras:** one minor. The settled guard line 33 sends a "full doc audit" to re-running `entropy-assessment`, which is a triage router.
- **Over-sorting:** modes, safety and the baseline arrive only through the provisional guard install (Q1). Minor.

### c: 8.0 of 9
- **K10 = 0.5.** It reports the conflict, then picks a side in a settled hunk. The settled `TODO.md` "Misleading material nearby" says: "The first describes a future with no persistent guard file; DECISIONS.md … and this repo's practice keep guard files." There is no question.
- **K11 = 1.** "entropy-assessment/SKILL.md:68 routes only to docs-first."
- **K12 = 1.** F3.
- **K13 = 1. It names both** (F8 and F15).
- **K14 = 1.** "treats the work as permission to change authorised intent."
- **K15 = 1.** "keeps two independent definitions in step."
- **K30 = 1.**
- **K33 = 1.**
- **K36 = 0.5.**
  - The settled FlowBook hunk removes text that Q2 quotes ("it mentions 'FlowBook'…").
  - The settled `TODO.md` lists the whole "Farm broader…" entry under "Settled; do not reopen casually", while F11 and Q3 hold its measure open.
- **Questions:** 4, none fails.
- **Wrong findings:** none.
- **Consequential extras (1):** the settled `TODO.md` labels the fresh-generation learning misleading, which settles the K10 choice.
- **Over-sorting:** the guard install is provisional under Q1. Minor.

### d: 8.0 of 9
- **K10 = 0.5.** F7 says the learning runs "against current practice" and files it as a stale description. Settled status lines then say "this line of thought continues outside this repo".
- **K11 = 1.** F4: "Nothing hands work to session-coherence-skill-generator."
- **K12 = 1.** F3.
- **K13 = 0.5. It names `doc-health-check` only** (F9). It does not mention `distill-article`.
- **K14 = 1.**
- **K15 = 1.** F10: "keeps two lists … in step ('update both')."
- **K30 = 1.**
- **K33 = 1.**
- **K36 = 1.**
- **Questions:** 5, none fails.
- **Wrong findings (2):**
  - F12 treats the `AGENTS.md:51` line "No build, test, or runtime commands yet" as an exhaustive list of commands, and calls it incomplete for leaving out `gh issue` and the hook link.
  - F8, and a backlog item, treat a planned filename inside the verbatim transcript (`…-conversation.md:691`) as a broken path to fix. Borderline.
- **Consequential extras (1):** the settled `LEARNINGS.md` status lines settle the K10 choice.
- **Over-sorting:** modes and safety arrive only through the provisional guard replacement. Separately, the `README.md:78` "before every commit" claim that F13 flags is fixed nowhere; the provisional hunk keeps it.

### e: 8.5 of 9
- **K10 = 0.5.** Risk R5 names "LEARNINGS.md line 123 ('no persistent guard artifact') against a generator that writes persistent guards". The settled markers demote the entry as "Conceptual … not validated in use". There is no question.
- **K11 = 1.** "Steps 3 and 4d never route to it."
- **K12 = 1.**
- **K13 = 1. It names both** (F11 and F14).
- **K14 = 1.** F2.
- **K15 = 1.** F3.
- **K30 = 1.**
- **K33 = 1.**
- **K36 = 1.**
- **Questions:** 4, **1 fails.** Q4 asks which part of "Consolidate…" was superseded. The target settles it: "Specialize first…" moves `entropy-assessment` "to triage and routing rather than carrying all deep guidance itself". The run itself says "What is missing is the record, not the content."
- **Wrong finding (1):** the settled `TODO.md` says `DECISIONS.md` is "newest first".
- **Consequential extras:** the same `TODO.md` line. The `LEARNINGS.md` demotion leans towards one side of K10, but it is milder than c's or d's.
- **Over-sorting:** the stale `guards-integrator` line 20 is held in the provisional Q2 patch, although a neutral rewording is settled by "Specialize first…". Four other runs settled it. The guard install is also provisional.

### f: 9.0 of 9
- **K10 = 1.** Q3 sets out the choice: under reading (a), "an agent following LEARNINGS.md line 123 builds a runner that regenerates a guard on every run and keeps no guard file". Under (b), "it runs the persistent `skills/local/entropy-guard/SKILL.md`". It recommends (b), puts the work in the provisional Q3 patch, and does not edit `INTENT.md`.
- **K11 = 1.** F9(a): "The front door has no route to the generator."
- **K12 = 1.** F3.
- **K13 = 1. It names both** (F13 and F11).
- **K14 = 1.**
- **K15 = 1.** "'update both.' It pulls against line 87 … one canonical home."
- **K30 = 1.**
- **K33 = 1.**
- **K36 = 1.**
- **Questions:** 4, none fails.
- **Wrong findings:** none.
- **Consequential extras (1, minor):** the settled `TODO.md` lists `explorations/` and the three `LEARNINGS.md` entries as "Misleading nearby" while Q3 is open. It does add "their status here is Q3".
- **Over-sorting:** the historical banners for `explorations/` are held in the provisional Q3 patch, although the "Farm broader…" decision and `README.md:7` settle them. a and d settled them.

### Summary table

| Output | Total | K10 | K11 | K12 | K13 | K14 | K15 | K30 | K33 | K36 | Questions (fail) |
|---|---|---|---|---|---|---|---|---|---|---|---|
| a | 8.5 | 0.5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 5 (0) |
| b | 7.5 | 0 | 0.5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 4 (0) |
| c | 8.0 | 0.5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0.5 | 4 (0) |
| d | 8.0 | 0.5 | 1 | 1 | 0.5 | 1 | 1 | 1 | 1 | 1 | 5 (0) |
| e | 8.5 | 0.5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 4 (1) |
| f | 9.0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 4 (0) |
