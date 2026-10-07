# Generator report

Output of `skills/session-coherence-skill-generator/SKILL.md`, 2026-10-07, plan mode. Finding ids refer to
`assessment.md`.

## What was supplied or found

No assessment was supplied. The generator called `skills/entropy-assessment/SKILL.md` for analysis only, in plan mode;
it routed the snapshot as shape A to `skills/docs-first-planning-assessment/SKILL.md`. Findings F1 to F16, the inputs
table and the guard surfaces are in `assessment.md`.

## Guard decision, path, size and budget

- **Decision: `update`.** The existing guard is updated in place, at `skills/local/entropy-guard/SKILL.md`. Draft:
  `guard/SKILL.md`. Its front matter keeps `name: entropy-guard`, not the template's `session-coherence-guard`,
  because the repo's adopted rule requires a skill's name to match its folder (`DECISIONS.md:79-83`), and keeping the
  path keeps `AGENTS.md`, `README.md` and the hook correct.
- **The intent-change rule is copied, not pointed to.** The rule file says a guard inside entropy-guard points to it
  instead, but this snapshot has no `skills/entropy-assessment/intent-change-rule.md`, so a pointer would be a broken
  link. When the repo gains that file, replace the copy with a pointer.
- **Size: 1,197 words** (`wc -w guard/SKILL.md`). The guard it replaces is 1,400 words.
- **Budget: 1,217 words**, made of these terms:
  - common contract: 706 (the generator's measurement);
  - checks: 10 at 36 each, 360. Nine repo-specific checks in "Checks", beyond the two standing ones, plus the
    live-state line in "What changed this session", which has a trigger and a named thing to check;
  - pointers: 54 (the filled "Where things live" values);
  - commands: 97 (the three scripted checks and their comments).
- Under budget by 20 words. Two additions fall outside the terms and fit within the margin: the line keeping Q2 open
  after the intent-change rule, and the commit-message line in "Report" (`README.md:138`).

## Review before handover (generator Step 4)

- The guard carries "Modes and safety" and binds its baseline. Its fallback, `git merge-base HEAD @{upstream}`, is
  resolved when the guard runs, because the snapshot has no `.git` to name an upstream branch.
- Each patch was checked against Q1 to Q5. `patches/TODO.md.patch` records the questions and leaves the text they
  are about unchanged. `patches/DECISIONS.md.patch` adds two proposals marked "not a decision" (Q2, Q3) and edits no
  entry. The guard shows Q1, Q2 and Q4 as open. It drops the old instruction to update `INTENT.md` (F2), but its
  copied rule defers to whatever the steward records under Q2, so it settles nothing.
- Repair instructions were checked against authorised intent. They are the contract's two repairs, which keep checks
  delta-scoped and low burden (`INTENT.md:59-66`). The old "update both" repair (F3) is gone.
- Size: within budget, as above.

## Doc references, and validation run

- Operator docs: no change needed. `AGENTS.md:19`, `:41` and `README.md:78`, `:97`, `:137` name the unchanged path.
  `README.md:78`'s list of what the guard checks is a summary and stays true. `TODO.md:20` names the guard's old
  `doc-health-check` reference, so `patches/TODO.md.patch` rewrites that line.
- Validation, all run 2026-10-07 on scratch copies; the target was never written:
  - `git diff --check` over the guard replacement: clean (exit 0);
  - the name check and the link check with the draft installed: no hits. Both caught a deliberate break in a
    separate scratch repository;
  - the 13 headings the guard names exist in the target's files;
  - both patches pass `git apply --check`, apply to give exactly the drafted files, and are whitespace-clean.

## Files build mode would change

- `skills/local/entropy-guard/SKILL.md`: replaced by `guard/SKILL.md`.
- `TODO.md`: `patches/TODO.md.patch`. Build mode would also write this work into "Doing Now" at the start (Step 1)
  and clear it at the end (`AGENTS.md:22`), which nets to nothing in the patch.
- `DECISIONS.md`: `patches/DECISIONS.md.patch`.
- Not changed: `AGENTS.md`, `README.md`, `INTENT.md`, `.githooks/pre-commit`. Changes to them wait for Q2 and Q3.

## Open questions the guard leaves visible

Q1, the steward (in "Where things live" and in the rule); Q2, whether the `INTENT.md` preamble counts as a recorded
decision (the line after the rule); Q4, any user-wide rules (in "Rules owned elsewhere"). Q3 and Q5 are recorded in
`TODO.md` and do not change the guard's checks.

## Handover

Handed to `skills/guards-integrator/SKILL.md`; its brief is `integration.md`.
