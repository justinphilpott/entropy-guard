# Integration

**No integration brief was produced.**
- The guard decision is `none` (see `assessment.md` §11).
- On that decision, `entropy-assessment` Step 4 makes no handover to `session-coherence-skill-generator`. The
  generator's own rule for `none` is "stop. Report that no guard change is needed, and why".
- `guards-integrator` is reached only through the generator, after a `create` or `update`. It was not reached, and
  not read.
- No guard was generated or refined, so there is no `guard/SKILL.md`.

**Why `none`.**
- `agentic-architecture` is reference-only, according to the banners at `README.md:3-5` and `AGENTS.md:3-6`.
- No further design loop is authorised in it.
- `entropy-assessment` uses `none` for such a system, "which may finish with a correction or a demotion". This run
  finishes with both:
  - a correction: `patches/settled.patch`;
  - a demotion of the existing guard and the session-start procedure: `patches/provisional-q2.patch`, pending Q2.

**How the patches are placed.** This is not a skill step, only what applying them involves.
- **`settled.patch`** can be applied by the steward, or by an agent the steward authorises, from the repository root
  with `git apply -p1`. It needs no hook, CI or tooling.
- **`provisional-q2.patch`** is applied only after the steward answers Q2 with (b). Once applied, the operative
  workflow is `AGENTS.md`'s reference-only Session start: corrections only, each citing its `DECISIONS.md` entry.
  - This is a written rule. Nothing enforces it, and nothing needs to while the repository takes no new design work.
  - Do not add a reminder hook for the demoted guard. The guard's own "next maturity step"
    (`skills/entropy-guard.md:118`) assumed an active repository.
- **`provisional-q1.patch`** is applied only after the steward answers Q1 with A, and names where the live temporal
  coordinator contract is owned.

**What would bring integration back into scope.** Each of these would change the guard decision and send the route to
the generator, then to the integrator:
- **Q2 answered (a), keep the rituals:** the decision becomes `update`. The existing guard needs refreshing for
  findings F6a to F6d, and its place in the loop is checked again.
- **Q1 answered B, `SPEC.md` still live:** consider `create` for a narrow guard that checks `SPEC.md` against the
  temporal-coordinator implementation. That is a cross-repository check, and this run could not read the
  implementation.
- **The steward reactivates the repository:** run the full route again from `entropy-assessment`.
