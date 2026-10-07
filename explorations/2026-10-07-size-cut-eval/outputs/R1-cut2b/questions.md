# Questions for the steward (Justin)

From the entropy assessment of ORC and the orchestration-lab Scope, 7 October 2026 (`assessment.md`). No steward was
available, so each question carries the answer I recommend, and the work was continued on that recommendation as a
**provisional draft**: nothing that depends on an answer was installed or applied. Five questions, the skill's limit,
in the order they should be answered. Finding ids (F1 and so on) refer to `assessment.md`.

## Q1. Where should the session-end guard live? (Missing)

- **Statement and source.** Your 4 Oct interview kept "entropy guard at session end" among the processes (the lab's
  `STATE.md`, line 49, 4 Oct 17:31). Neither repository holds one: the lab's `skills/` has only a `.gitkeep`, and ORC
  has no guard (F17). One system spans two repositories, so one guard has to choose a home.
- **Readings.**
  - (a) The lab's `skills/session-coherence-guard/SKILL.md`, with one pointer line in each repository's `AGENTS.md`.
  - (b) ORC's repository, because most sessions change code there.
  - (c) The user-wide skills folder, `~/pro/local-config/home/.agents/skills/`, so every tool loads it.
- **Where they diverge, in this system.** A session in ORC fixing #201 meets the guard under (a) through ORC
  `AGENTS.md`'s pointer, and under (b) directly. A lab-only session, such as the labels review of 4 Oct, never meets
  it under (b). Under (c) every project's sessions load a guard that names ORC's files.
- **Recommended: (a).** Your 4 Oct decision makes the lab the central Scope for code quality, and the lab's
  `reports/2026-09-30-skills-one-home.md` lists a Scope's own `skills/` as the home for that Scope's agents. One copy
  avoids a second home for the guard. It creates a new directory in the lab, so it needs your yes.
- **What waits on it:** installing `guard/SKILL.md`; patches 04 and 05.

## Q2. Where are your decisions recorded from now on? (Missing)

- **Statement and source.** The lab's `AGENTS.md`, line 33: "`STATE.md` is overwritten at each verified event: a
  commit lands, tests pass, a decision is taken." The lab's one decision record,
  `decisions/2026-09-17-async-work-architecture.md`, is linked from no README, SCOPE, AGENTS or STATE file. Your 4 Oct
  interview decisions existed only in `STATE.md` (lines 38-58) (F3, F4).
- **Readings.**
  - (a) `decisions/` in the lab: one dated file per decision, in your words, linked from `STATE.md` and the issue.
  - (b) The GitHub issue that owns the work, with `STATE.md` linking to it.
  - (c) `STATE.md`, as today.
- **Where they diverge.** Take the 4 Oct "processes kept" list. Under (c) the next rewrite that trims `STATE.md` to
  its cap can drop it, as `STATE.md` errors have gone unseen before (FRICTION 12 and 22 Sep). Under (a) it survives in
  a file any agent reads offline. Under (b) it survives on #141 or #167, but only for an agent with GitHub access.
- **Recommended: (a),** with the owning issue linking to the file: the folder already exists, and the lab is the
  central Scope by your 4 Oct decision. Whatever you answer, the STATE-only decisions had to be copied to a durable
  record now; patch 03 copies them to `decisions/`, the only one there is. Your answer decides the going-forward rule
  in the lab's `AGENTS.md` (patch 04) and the guard's "Decisions" line.
- **Also affected:** `SCOPE.md` says "Facts about ORC belong in its repository", while the lab's `decisions/` already
  holds an ORC architecture decision. Under (a), steward decisions about ORC live in the lab, and ORC's repository keeps
  the facts of what is built.

## Q3. Does the pace rule still gate new design work? (Ambiguous)

- **Statement and source.** The lab's `AGENTS.md`, lines 27-29: "`HOW_NOT_TO_PLAN.md` governs new design work: one
  scored real use must come first. Keep implementation examples small and documentation retrospective." Against it,
  your words of 21 Sep, 18:05 and 18:11, quoted in `reports/2026-09-22-pushback-analysis.md` (lines 127-133): "relax
  suggested development to 'what is naturally needed given where we are and what's likely coming next'", bounded by
  "I'm not saying to release all restraint and start building out huge edifices that don't have a clear reason" (F7).
  `HOW_NOT_TO_PLAN.md` itself was outside this run and not read.
- **Readings.**
  - (A) The scored-real-use rule still gates starting new design. The 21 Sep words relax only the demand for proof
    before completing work a real use already justifies.
  - (B) The 21 Sep words replace the stricter rule: build what is naturally needed and visibly coming, without
    waiting for a scored use.
- **Where they diverge.** Option D of `reports/2026-09-30-priorities.md`, ORC's own loop machinery toward #38 and #39.
  Under (A) it waits until options A and C have shown what the loop needs. Under (B) it can start now, because it is
  visibly coming. The guard's intent check also changes: under (A), design built ahead of a scored use is drift to
  flag; under (B) it is not.
- **Recommended: (A),** recorded in `decisions/` so the lab's `AGENTS.md` can cite it. Your 18:11 message bounds the
  18:05 one, and the 30 Sep priorities page reasons the same way about option D ("building it before A and C have
  shown what the loop needs is how five earlier attempts died"). This reading is mine, not your words; if it is
  wrong, (B) needs the lab's `AGENTS.md` "Pace" section changed by your decision. Nothing in this run's patches
  touches that section, ORC's `AGENTS.md` "Working Style" or `GRANTS.md`.

## Q4. What is `STATE.md`'s size limit? (Conflict)

- **Statement and source.** The lab's `AGENTS.md`, line 34: "capped at about forty content lines". `STATE.md` line 4:
  "Target: sixty lines". Neither records who set it or why. The 4 Oct file had 87 content lines (F2).
- **Readings.** (a) About forty content lines. (b) Sixty lines.
- **Where they diverge.** The 4 Oct file must lose 47 lines under (a) and 27 under (b). The guard's state check would
  fire at different sizes.
- **Recommended: (a), derived rather than picked.** A state file must hold six things (the stage, the documents to
  trust, decisions linked, active fronts and open questions, misleading material nearby, one to three next actions).
  Patch 03 holds all six in 39 content lines. Patch 03 keeps both texts unchanged; after you decide, one of them goes,
  and the cap is written once.

## Q5. Where do ORC's eight dated branch reports go? (Ambiguous, and a structural change)

- **Statement and source.** ORC's `AGENTS.md`, lines 154-155: "Keep documentation concise and retrospective". ORC's
  root holds eight branch reports beside its live documents: `CLASSIFY.md`, `FIXES.md`, `GRANTS-E2E.md`,
  `OPERATOR.md`, `POLICY-STORE.md`, `REWORK.md`, `SEAM.md` and `SLICE1.md`. They name removed paths and a removed
  command (F12). `reports/2026-09-30-priorities.md` option F proposed "`docs/` in each repository"; no decision on it
  was found.
- **Readings.**
  - (a) Leave them in place, marked historical. Patch 01 does this, and it fits any later move.
  - (b) Move them into a `docs/` folder in ORC.
  - (c) Move them into the lab's `reports/`.
- **Where they diverge.** An agent searching ORC for `approve:agent-package` finds `GRANTS-E2E.md` in the root under
  (a), marked historical. Under (b) it finds it in `docs/`, and under (c) not at all. The guard's check on new
  documents also says where a new session report goes.
- **Recommended: (a) now, then (b) when option F is decided.** (b) keeps facts about ORC in ORC's repository, as
  `SCOPE.md` asks, and clears the root. Creating `docs/` is a structural change, so it waits for your yes.
