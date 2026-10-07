# Steps, in order

Run on 2026-10-07 in plan mode. Skills folder: `eval2/tool-final`. Target: `eval/targets/entropy-guard-447da9a`
(read-only, no `.git`).

1. **`skills/session-coherence-skill-generator/SKILL.md`** (generator), "Inputs, and the guard decision". No
   assessment had been supplied, so it directed me to call `entropy-assessment` for analysis only, in my mode (plan).
   - **Handover 1: generator → `skills/entropy-assessment/SKILL.md`**, called for analysis only, mode plan.
2. **`skills/entropy-assessment/SKILL.md`**, Step 1. Ran **`skills/entropy-assessment/intent-pass.md`**: read the
   target's `README.md`, `INTENT.md`, `TODO.md`, `AGENTS.md`, `DECISIONS.md`, `LEARNINGS.md`, the existing guard
   `skills/local/entropy-guard/SKILL.md`, `.githooks/pre-commit`, `.gitignore`, `.editorconfig`, the head of
   `LICENSE`, `PHILOSOPHY.md` and each `explorations/` file, and the feedback helper. Read the existing guard's repair
   lines against the intent-change rule (intent-pass section 1).
3. **`entropy-assessment`, Step 2.** Recorded lifecycle (active) and shape: A (docs-first planning), with D noted;
   one repository. A routes to the docs-first analysis.
   - **Handover 2: `entropy-assessment` → `skills/docs-first-planning-assessment/SKILL.md`**, as a called skill that
     returns to `entropy-assessment` Step 3.
4. **`skills/docs-first-planning-assessment/SKILL.md`**, Steps 1 to 7. Step 1 reused the intent pass. For Steps 2 to
   4, read the target's exported skills (`entropy-assessment`, `session-coherence-skill-generator`, parts of
   `docs-first-planning-assessment`, the outline of `guards-integrator`) to build the truth map, loop map and ranked
   risks. Step 5: drafted the `TODO.md` update as a patch. Step 7: classified the guard surfaces and wrote the
   matrix's checks against the target's files. Opened **`skills/entropy-assessment/intent-change-rule.md`** here, to
   read the existing guard's repairs against it and to have the rule ready for the guard.
   - **Return: docs-first → `entropy-assessment` Step 3.**
5. **`entropy-assessment`, Step 3.** Guard decision: `update`. Step 4: called for analysis only, so it returned.
   - **Return: `entropy-assessment` → generator**, with findings F1 to F16, the guard decision and the inputs, each
     unresolved one marked. Written as `assessment.md`. Questions Q1 to Q5 written as `questions.md`; proposals for
     Q2 and Q3 drafted as `patches/DECISIONS.md.patch` (intent-pass section 5).
6. **Generator, Steps 1 to 6**, in plan mode:
   - Step 1, recording the work in `TODO.md`: listed as a build-mode change, not made.
   - Step 2: inputs checked. Unresolved: the steward (Q1), user-wide rules (Q4), the upstream branch (resolved when
     the guard runs).
   - Step 3: wrote `guard/SKILL.md` to the guard contract, as an in-place update of `skills/local/entropy-guard/SKILL.md`,
     with the intent-change rule copied in.
   - Step 4: review against modes, baseline, open questions, authorised intent and the size budget.
   - Step 5: checked the operator docs; only `TODO.md:20` needed a change, which is in the patch.
   - Step 6: ran `git diff --check`, the two scripted checks and `git apply --check` on scratch copies.
   Results are in `generator-report.md`.
   - **Handover 3: generator → `skills/guards-integrator/SKILL.md`** (generator Step 7).
7. **`skills/guards-integrator/SKILL.md`**, Steps 1 to 6. Reused the assessment's loop map. Checked in a scratch copy
   that the pre-commit reminder fires once enabled. Wrote `integration.md`.
8. Wrote `feedback.md` (the feedback notes both skills ask for), this file and `read-log.md`.

## Scratch work, reported for completeness

To test without touching the target, I copied it four times: into `eval2/guardtest-R5` and `eval2/patchwork-R5`,
both outside the output folder but inside the session scratchpad, and later into hidden folders inside the output
folder. Each copy held only the target's files and my drafts, and each was deleted. The first attempt failed because
the copy kept the target's read-only permissions. No command ran against the target itself, which was only read.

## Not opened

`skills/session-coherence-skill-generator/bootstrap.md` (the decision was `update`, and a state file and a decision
log already exist); `skills/entropy-assessment/mixed-profile.md` (route A); `skills/local/entropy-guard/SKILL.md`,
`skills/local/entropy-guard-feedback/SKILL.md`, `INTENT.md` and `README.md` in the skills folder (nothing directed me
to them).
