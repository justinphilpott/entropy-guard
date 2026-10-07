# TODO

Lightweight task tracking for early development. Graduate to an issue tracker (GitHub Issues, Linear, etc.) once the project has momentum.

## Doing Now

Size cut: done and tested; PR #14 open for Justin to merge.

Reach claims (approved by Justin 2026-10-07, "Agreed, proceed"), on branch `reach-claims-show-search`, stacked on
PR #14: a claim about everything a system reaches is checked against the code with a recorded search. Test:
`explorations/2026-10-07-reach-claims-eval.md`, key written before runs (R1 ×3, R2 and R3 once each).
State at 22:40 on 7 October: round 7 failed (reach claims found but contradicted by two of three runs' own
patches; K13 dropped in all three docs-first runs). Justin approved the revision at 22:29: the reach rule moved to
`mixed-profile.md`, a patch-against-findings check added, and a pass rule comparing sums over three runs of each
version (`d34c31a`). Round 8 is running: 18 runs, the candidate against PR #14's skills, three of each on R1, R2 and
R3; then one blind scorer per case. The PR waits for round 8's verdict.

## Next Up

- [ ] The generator's mandatory intent-change rule can meet an open question about that same rule (both round-6 R2 runs): say what the guard does then, so a run neither holds back every settled fix nor writes a guard that contradicts itself
- [ ] Assess ORC and the lab Scope together with the revised skills, read-only; bring the results and any proposed changes to Justin before anything in ORC changes
- [ ] Triage the 7 deployed guards: which are still used, and which need the intent-change rule, pointers instead of copied state, or a delta that includes uncommitted work. The audio-tools guard's spend lines are first (they predate the 2026-10-03 rule that spending goes through ORC); each change needs that repo owner's yes
- [ ] Build an external validation batch: choose a larger set of docs-first planning / architecture / blueprint repos to assess through `entropy-assessment`, and record hits, misses and friction

## Backlog

- [ ] Consider additional specialized tracks once ORC and the docs-first batch show where the front door's profile is too thin (code-first, config/infrastructure, or other recurring repo shapes)
- [ ] Consider a blind-newcomer probe for the current-state file: a fresh agent answers fixed questions with and without it. Only if the file's value comes into question (synthesis, 2026-10-04)
