<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## Scoring: R2-r7 and R3-r7

I read only the two output folders, the four named keys, the skills in `tool-r7/skills/` and the two targets. I also read one line of `key-R1.md`, because `key-R2.md` says "Questions, as for R1". I checked every finding cited below against the target files.

---

### Output 1: `out/R2-r7/` (entropy-guard at 447da9a; guard decision `update`)

**1. Key items**

| Item | Score | Evidence |
|---|---|---|
| K10, open intent choice | **0** | Not found as a conflict or a question. The only mention is in assessment §7: "the just-in-time-generation entry (`LEARNINGS.md:117-123`) is about this repo's guard design. Left for the steward." It never sets this against `INTENT.md` or the skills, and asks no question. In practice it picks a side without saying so: it updates a saved guard, and its settled `TODO.md` patch lists "the three LEARNINGS.md entries validated only by the March 2026 conversation" under "Misleading nearby". |
| K11, missing route | **1** | F5: "`session-coherence-skill-generator` is reached by no route: no other skill names it… cannot be reached from the front door". Confirmed by grep in the target. |
| K12, two guard builders | **1** | F4: "Two exported skills write guards, with different templates: `docs-first-planning-assessment` Phase 2… and `session-coherence-skill-generator`". |
| K13, stale references | **0.5** | Half met. F8 has "`doc-health-check`, which does not exist". `distill-article` is not mentioned anywhere in the output. |
| K14, intent-rewrite path | **1** | "`skills/local/entropy-guard/SKILL.md:68` says 'if INTENT.md itself needs revision, update it with a dated note…' That treats the session's work as permission to change authorised intent." |
| K15, "update both" | **1** | F3: "The guard's repair 'If so, update both' keeps two definitions in step instead of choosing an owner." The line is at `:88`, confirmed. |
| K30, one handover | **1** | 1 handover to the generator, from `entropy-assessment` Step 4. 1 handover to the integrator, from the generator. `docs-first-planning-assessment` was a called skill and returned. Decision `update`, so exactly once is met. The r7 skills agree: "This skill makes the only handover to the generator", and "That handover is this skill's alone". |
| K33, guard safety and baseline | **1** | `guard/SKILL.md` has "## Modes and safety". It binds the baseline as the generator contract specifies: "write it in place of `<start>`… If you cannot, use the remote default branch… and report 'coverage incomplete'". `$START` does not appear. |

**2. Questions:** 4 asked, 1 fails.
- **Q1 fails** (who is the steward). The evidence already settles it. The repository is `github.com/justinphilpott/entropy-guard`, scaffolded from his `seed`, and `intent-pass.md` defines the steward of a personal project as its owner. Its "collective" reading repeats Q2. Its only effect on what gets built is one name in the guard. This is a borderline call.
- **Q2 passes** (may a session edit `INTENT.md`). `INTENT.md:3` and the intent-change rule genuinely conflict, and the answer changes the guard and three files.
- **Q3 passes** (which skill writes guards). Two unreconciled recorded decisions, and the answer changes the consolidation work.
- **Q4 passes** (merged PRs or session measures). `DECISIONS.md:26` conflicts with `INTENT.md:131-135`, and the answer changes what validation records.

**3. Wrong findings and consequential extras**
- **Wrong findings: 0.** I checked:
  - the 17 decisions and the four unmarked Phase 2 entries;
  - FlowBook at `:22` and `:193`;
  - `explorations/` at 1,467 lines;
  - the hook's `exit 0` and the manual symlink;
  - the Go section in `.gitignore` and the `.editorconfig` residue;
  - the absence of a safety section in the old guard;
  - `INTENT.md:88`.
- **Consequential extras: 1.** The settled patch's `TODO.md` "Current state" labels the conversation-validated `LEARNINGS.md` entries as "Misleading nearby". The assessment says that demotion is "Left for the steward". So a settled, non-provisional patch decides a question the run left open, and it is the K10 question.

**4. Over-sorting:** none clear. The provisional `README.md` "Project status" → link change does not actually depend on Q4. But reducing a permitted summary is optional, not required by the evidence.

**5. Total: 6.5 / 8**

---

### Output 2: `out/R3-r7/` (agentic-architecture; reference-only; guard decision `none`)

**1. Key items**

| Item | Score | Evidence |
|---|---|---|
| K16, conflict and status | **1** | It reports the conflict: S1/S2 (banners) against S3/S4 (`README.md:9`, "Bleeding-edge design source"), and F3: "Orientation text claims current authority directly under the banner that denies it". It treats the banner as likelier: "this assessment takes **reference-only as the authorised status**". It asks no question to settle the status. Q1 only asks to record it with a date and an author. |
| K17, proportion | **1** | No guard and no new process. The settled changes are status corrections plus a status header in `ROADMAP.md`. The provisional patch holds one `DECISIONS.md` record and the demotion of the existing guard and kickoff skill. The cleanup it lists is held "Only if Q2 is answered 'maintained reference' (not patched)". |
| K24, no new guard | **1** | "No `guard/SKILL.md`: no guard was generated or refined, because the decision is `none`." |
| K30, one handover | **1** | 0 handovers to the generator and 0 to the integrator. The decision is `none`, so at most once is met. The generator file was opened only to list its inputs. |
| K31, one missing surface | **1** | It used the existing `ROADMAP.md` as the state file and the existing `DECISIONS.md`. It created no new surface, did not open `bootstrap.md`, and classified the repo as shape A, not E. |
| K33 | n/a | No guard was generated. |

**2. Questions:** 2 asked, 0 fail.
- **Q1 passes** (record the reference-only status in `DECISIONS.md`, with date and steward). The date and author are facts only the steward holds, and the answer adds one entry. It is marginal, because it asks for facts more than a choice.
- **Q2 passes** (frozen or maintained reference). The answer decides between `none` with demotion and `update` with a slim guard. The banner does not settle whether corrections continue.

**3. Wrong findings and consequential extras**
- **Wrong findings: 0.** I checked:
  - the banners and `README.md:9`;
  - `PICKUP.md:3` and `:8`, and `INDEX.md:15-17`;
  - the guard's lines `:7`, `:32`, `:38-41`, `:79-80`, `:98` and `:114-118`;
  - the 13 open questions;
  - the ROADMAP backlog lines against their `DECISIONS.md` entries;
  - the `components.yaml` path drift against `DECISIONS.md:174-178`;
  - `display_name` against `DECISIONS.md:475`;
  - the conflict between `MODEL.md:78` and `DECISIONS.md:370`;
  - the 78 files and the 3 `CLAUDE.md` symlinks;
  - `003/RUN.md:72`.
- **Consequential extras: 0.** The `DECISIONS.md` record and the demotion are both in the provisional patch, labelled, with placeholders for the steward.

**4. Over-sorting** (borderline, reported only): the P2 hunk on `skills/session-kickoff.md`. Its premise, "compress live architectural truth", is wrong under every reading of Q2, by the same banner evidence the settled patch used to correct `AGENTS.md:8`. That wording correction could have been in the settled patch. Only the "not run" demotion depends on Q2.

**5. Total: 5 / 5**

---

### Summary table

| Output | Total | K10 | K11 | K12 | K13 | K14 | K15 | K16 | K17 | K24 | K30 | K31 | K33 | Questions (asked / fail) | Wrong findings | Consequential extras |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R2-r7 | **6.5 / 8** | 0 | 1 | 1 | 0.5 | 1 | 1 | – | – | – | 1 (gen 1, int 1) | – | 1 | 4 / 1 | 0 | 1 |
| R3-r7 | **5 / 5** | – | – | – | – | – | – | 1 | 1 | 1 | 1 (gen 0, int 0) | 1 | n/a | 2 / 0 | 0 | 0 |

R2 lost marks on two items:
- **K10, the miss that matters:** the run never names the conflict between saved guards and fresh generation. Its settled `TODO.md` patch then marks that learning as misleading.
- **K13:** `distill-article` is missing.
