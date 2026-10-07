# Integration: agentic-architecture

## The integrator was not reached

The guard decision is `none`, provisional on steward question Q1 (see `assessment.md`). The route therefore ends
before any guard is generated:
- entropy-assessment Step 4 hands to `session-coherence-skill-generator` only for `create` or `update`;
- the generator's own rule for `none` is "stop. Report that no guard change is needed, and why";
- only the generator hands to `guards-integrator`.

So no guard was generated, there is no `guard/SKILL.md`, and `guards-integrator` was not run or opened.

The reason for `none`: the README.md and AGENTS.md notices make the repository reference-only, and docs-first Step 7.3
says "a reference-only or retired repo usually needs `none`".

## Where the existing guard surfaces sit after the demotion

This classification comes from docs-first Step 7.1. The changes are in `proposed-changes.patch`, and apply only if Q1
is answered "reference-only". Placing an existing guard would normally belong to the integrator. The `none` route
does not reach it, as noted under "Feedback on the skills" in `assessment.md`.

| Point in the loop | Surface | After the patch |
|---|---|---|
| Session entry | README.md and AGENTS.md notices | Unchanged. This is still the first thing a session reads. |
| Session start | AGENTS.md "Session start" | A new step 0 points to the notice and to ROADMAP.md's status section. Without explicit authorisation, the session reads for reference only and stops before choosing work. |
| Current state | ROADMAP.md | A new "Status — read this first" section: the stage, what to trust, misleading material, Q1-Q3 and next actions. |
| Orientation | skills/session-kickoff.md | Gains one "When NOT to Run" line: not without an authorised change. |
| Before commit | skills/entropy-guard.md, as AGENTS.md:72 directs | A status note: run only on an authorised change and fix only what it touched. Its 2026-04-27 snapshot is marked historical. |
| Automation | none | Nothing is added. ROADMAP.md:69's hook idea is not pursued while the repository is reference-only. |

**Enforcement level:** all of these stay prose, which the existing guard already says at skills/entropy-guard.md:114.
The only mechanical option is archiving the repository at its host, which this assessment could not check (F4).
Whether to do that is the steward's call, and it is not proposed as a change here.

## If Q1 is answered "active"

The decision becomes `update`. The route would then be:
1. Hand the findings and the generator inputs in `assessment.md` to `session-coherence-skill-generator`.
2. The generator updates skills/entropy-guard.md in place to its contract.
3. The generator hands the result to `guards-integrator`.

None of that was drafted, because the run continued on the recommended answer.
