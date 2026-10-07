# Integration: agentic-architecture

**No integration brief was produced, because the guard decision is `none`.**

- In entropy-guard, integration advice comes from `guards-integrator`.
- The route reaches the integrator only through `session-coherence-skill-generator`, and only on `create` or `update`
  (`entropy-assessment` Step 4; generator section "Inputs, and the guard decision").
- On `none` the generator stops and reports why. This repository is reference-only, so the decision is `none`
  (`assessment.md` section 12). No guard was generated, and the integrator was not run.

What changes in the repository's working loop if the patches are applied:

- **`patches/settled.patch` changes the loop itself.**
  - It puts a reference-only gate at the top of `AGENTS.md` "Session start", which Claude Code loads as `CLAUDE.md`,
    and in `skills/session-kickoff.md` Step 4.
  - With the gate, a fresh session orients and stops, instead of choosing next work.
  - It also makes `ROADMAP.md`, the file that loop reads first, open with the status block.
- **`patches/provisional-Q2.patch` removes the one enforced-by-discipline step.** It replaces the mandate to run
  `skills/entropy-guard.md` before commits (`AGENTS.md` 72) and demotes that guard to a record. Apply it only if the
  steward answers Q2 "frozen".
- **If the steward answers Q2 "maintained" instead,** the decision becomes `update`. The next run would then amend
  `skills/entropy-guard.md` through the generator and hand it to `guards-integrator`, which would produce real
  integration advice: where the guard runs, and how its adoption is checked.

`assessment.md` section 14, note 4, records the gap this leaves: under `none`, demoting an existing guard changes the
loop but gets no adoption check.
