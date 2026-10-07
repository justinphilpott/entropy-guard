<!-- Extracted from the run's final message by the coordinating session; text unchanged. -->

## R3 scoring, round 8: six outputs (a–f) against keys K16, K17, K24, K30 and K31

**How it was scored.**
- I read the six output folders, `key-R3.md`, `key-round5-extra.md` and the target, and nothing else.
- I checked findings against the target with greps and file reads, including a recount of the tool calls in each run's `events.jsonl`.
- No output generated a guard, so K33 does not apply to any of them.
- In all six the guard decision is `none` and nothing is handed to the generator, so K30 is met with zero handovers.

### Output a
- **K16 = 1.** Finding F3 reports the conflict: "README.md:9: 'Bleeding-edge design source for the current named version'". It treats the banner as the status: "a directive outranks a description… the evidence settles the lifecycle". It asks no question about the status.
- **K17 = 1.** "Do not consolidate or reconcile F3, F11–F17… while the repository is reference-only". It only demotes the rituals, as a provisional change.
- **K24 = 1.** "No guard is generated, and nothing is handed to session-coherence-skill-generator."
- **K30 = 1.** "Step 4 makes no handover."
- **K31 = 1.** It uses `ROADMAP.md`, the existing state file. It notes there is no root `TODO.md` and creates none.
- **Questions:** 1. Q1 asks whether to demote, retire or keep the rituals. 0 fail.
- **Wrong findings:** none. F19's breakdown checks exactly against run 001's stream: 16 tool calls, 5 reads all inside the scope, 5 `ls` and 6 `find`.
- **Consequential extras:** none.
- **Over-sorting:** a gate saying "do not choose new work here without authorization" in the `AGENTS.md` session start and the kickoff's "what's next?" step sits only in `provisional-Q1`, although the banner settles it. The settled `ROADMAP.md` note softens this ("new architecture work goes to the successor repositories").
- **Total: 5/5.**

### Output b
- **K16 = 1.** F2: "Body text still claims current authority, against the banners". Also: "Nothing contradicts them except body text the banners override". Q1 asks what reference-only permits, not whether the repository is reference-only.
- **K17 = 1.** It recommends a frozen record: "leave F8 to F11, F13 and F17 to F23 listed and unfixed". The demotion is provisional.
- **K24 = 1.** "Guard decision: none… The generator is not called."
- **K30 = 1.** "The guard generator stops and makes no handover."
- **K31 = 1.** "ROADMAP.md is the existing state file… no competing file is added."
- **Questions:** 2, 0 fail.
  - Q1 asks whether the repository is frozen or maintained.
  - Q2 asks who now owns the temporal coordinator contract, the templates and layer 1. It decides the pointers in `provisional-Q2`.
- **Wrong findings:** none.
- **Consequential extras:** none harmful. A mild point: the settled patch adds a `DECISIONS.md` entry headed with the recording date, 2026-10-07, in a log whose conflict rule goes by dates. The entry's text says the date is when it was recorded.
- **Over-sorting:** corrections the dated decisions plainly settle sit only in `provisional-Q1b` (the "maintained" answer). Examples are `RUNTIME.md:67` and `:82`, the pointers to resolved questions, and `DECISIONS.md:896`. They are held back by the frozen-or-maintained question, not by the evidence.
- **Total: 5/5.**

### Output c
- **K16 = 1.** F3: "Body text still claims current authority under the banners". Also: "The banners are directives that postdate the body text… so they win over it." Q2 asks for the banner's date and author, not its validity.
- **K17 = 1.** "Consolidate nothing while reference-only." The demotion is provisional.
- **K24 = 1.** "No guard is generated or amended."
- **K30 = 1.** "Step 4 (no handover…)."
- **K31 = 1.** It updates `ROADMAP.md` "in place rather than adding a summary".
- **Questions:** 2, 0 fail.
  - Q1 asks whether the rituals stay in force.
  - Q2 asks when and by whom the status was set, and whether to record it. This one is borderline: the "record it?" half is close to settled by the repository's own practice of recording decisions in `DECISIONS.md`. The date and author are facts only the steward holds.
- **Wrong findings:** none. Its inference from file times is correct: every file carries 2026-08-01 21:12, which bounds when the banners existed.
- **Consequential extras:** none.
- **Over-sorting:** the same session-start and kickoff gate as output a sits only in `provisional-q1`. The settled `ROADMAP.md` line "Next actions here: none are authorised" softens it.
- **Total: 5/5.**

### Output d
- **K16 = 1.** F2: "'Current' claims sit directly under the banners". Also: "It is used as the authorised lifecycle throughout this assessment."
- **K17 = 1.** "Do not: write a new guard; add a new state or summary file…; consolidate F12 or F13". Its patch of accuracy corrections is labelled optional.
- **K24 = 1.** "Decision: none… no guard was generated."
- **K30 = 1.** "Nothing is handed to the generator or the integrator."
- **K31 = 1.** "No competing summary was added."
- **Questions:** 2, 0 fail.
  - Q1 asks whether to retire the rituals or keep them for corrections.
  - Q2 asks whether to record the status with its date and decider. It is borderline in the same way as c's Q2. d itself says `git log` in the real repository would give the date and author.
- **Wrong findings:** one minor. It says the run 001 agent "read files outside the scope directory (RUN.md:89)". The stream shows only `ls` and `find` outside the scope; all 5 reads were inside. This has no consequence.
- **Consequential extras:** none.
- **Over-sorting:** the same session-start and kickoff gate sits only in `provisional.patch`. The settled `ROADMAP.md` block softens it.
- **Total: 5/5.**

### Output e
- **K16 = 1.** F-03: "Entry-point text contradicts the banners". Also: "The repository's own precedence lets them win". Only Q1 questions the status itself; its reading (b) is "not yet your decision".
- **K17 = 1.** It recommends no new guard and no process: "limits these to correcting, demoting and marking material historical". Its settled patch is the largest of the six, at 16 files.
- **K24 = 1.** "No guard is generated, so there is no guard/SKILL.md."
- **K30 = 1.** "On none it stops… guards-integrator was not reached."
- **K31 = 1.** "There is no root TODO.md or STATE.md, so no competing file was added."
- **Questions:** 4, 1 fails.
  - Q1 asks the date of the status. It is borderline in the same way as c's Q2.
  - Q2 asks whether the repository is frozen or maintained.
  - Q3 asks who owns the templates and the reference role.
  - **Q4 fails.** It asks whether to stay in `~/pro/agentic/` or move to `~/pro-archive/`, and says itself "What the answer changes: No patch". Nothing built depends on it.
- **Wrong findings:** one trivial. It says there are "17 standing positions"; `AGENTS.md:12-34` has 19. It also cites `DECISIONS.md` line 826, inside an entry superseded on 2026-07-26, as current support. F-09's conclusion still holds through lines 836-851.
- **Consequential extra:** the settled patch writes four agent-written questions into the canonical `DECISIONS.md` Open Questions registry of a reference-only repository, before any answer. One of them is the repository move. It also rewrites the registry's header. These stay in the log if the steward never answers.
- **Over-sorting:** none. The minimal gate is in the settled patch.
- **Total: 5/5.**

### Output f
- **K16 = 1.** F2: "The orientation text contradicts the banner directly above it". Also: "directives over descriptions… it postdates the descriptions it overrides". Q1 asks how far the banner reaches and Q3 asks who set it; neither asks whether the repository is reference-only.
- **K17 = 1.** "Consolidate (recommendation only)… None of these is patched". The demotion is provisional. A narrow `create` is mentioned only if Q1 is answered B, which it does not recommend.
- **K24 = 1.** "Guard decision: none… Nothing is handed to the generator."
- **K30 = 1.** "Step 4 makes no handover to session-coherence-skill-generator."
- **K31 = 1.** It puts a block at the top of `ROADMAP.md` and adds no new surface.
- **Questions:** 3, 0 fail.
  - Q1 asks whether the banner covers the temporal coordinator's `SPEC.md`.
  - Q2 asks whether to demote the rituals.
  - Q3 asks who set the banner and when. It is borderline: it changes only the header of the settled `DECISIONS.md` entry, and its reading (ii) has no supporting evidence.
- **Wrong findings:** one minor. It says file times are uniform at "the time it was taken", so they are not evidence. They are 2026-08-01 21:12, not the snapshot date, and they do bound the banner date. It also counts `SPEC.md:3` among the places calling the contract "authoritative", and that line does not say so.
- **Consequential extras:** none harmful. The settled patch adds a note on the runs' authentication to `AUTH_OPTIONS_ANALYSIS.md`. Like output e, it changes the paths in `components.yaml` without checking the disk; the change follows the 2026-04-04 layout decision and the README.
- **Over-sorting:** the session-start and kickoff gate sits only in `provisional-q2`. The settled `ROADMAP.md` block softens it.
- **Total: 5/5.**

### Summary table

| Output | Total | K16 | K17 | K24 | K30 | K31 | Questions (fail) |
|---|---|---|---|---|---|---|---|
| a | 5/5 | 1 | 1 | 1 | 1 | 1 | 1 (0) |
| b | 5/5 | 1 | 1 | 1 | 1 | 1 | 2 (0) |
| c | 5/5 | 1 | 1 | 1 | 1 | 1 | 2 (0) |
| d | 5/5 | 1 | 1 | 1 | 1 | 1 | 2 (0) |
| e | 5/5 | 1 | 1 | 1 | 1 | 1 | 4 (1) |
| f | 5/5 | 1 | 1 | 1 | 1 | 1 | 3 (0) |

**What separates them**, since the scored items do not:
- **Size of the settled patch:** a 2 files; c 4; d 4, plus 6 optional; b 6; f 15; e 16.
- **Output e** is the only one with a failing question (Q4) and a consequential extra (the questions added to the registry).
- **Outputs a, c, d and f** hold the minimal "no new work without authorization" gate only in a provisional patch. Output b holds settled corrections only behind its frozen-or-maintained question.

**A judgement call on K17.** I read "little or nothing new" as excluding new guards and new process, not one-time correction patches. On that reading e and f still score 1. If size is meant to count, e and f are the two that would drop to 0.5, e first because of the questions it adds to the registry.
