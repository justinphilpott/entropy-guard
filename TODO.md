# TODO

Lightweight task tracking for early development. Graduate to an issue tracker (GitHub Issues, Linear, etc.) once the project has momentum.

## Doing Now

Size cut (approved by Justin 2026-10-07, "lets go") is done and tested on branch `cut-skills-to-derived-size`; its
pull request is open for Justin to merge. Test: `explorations/2026-10-07-size-cut-eval.md` (round 6 passes).

## Next Up

- [ ] Stop assessments misstating what a system reaches: 6 of 11 cut runs on ORC rewrote ORC's network reach wrongly, most often by leaving out the Chromium ORC launches itself, despite the fix at `29e629d`. Do before the ORC assessment
- [ ] The generator's mandatory intent-change rule can meet an open question about that same rule (both round-6 R2 runs): say what the guard does then, so a run neither holds back every settled fix nor writes a guard that contradicts itself
- [ ] Fix K3's wording in the eval key so it no longer conflicts with K21 on "workflow execution"
- [ ] Assess ORC and the lab Scope together with the revised skills, read-only; bring the results and any proposed changes to Justin before anything in ORC changes
- [ ] Triage the 7 deployed guards: which are still used, and which need the intent-change rule, pointers instead of copied state, or a delta that includes uncommitted work. The audio-tools guard's spend lines are first (they predate the 2026-10-03 rule that spending goes through ORC); each change needs that repo owner's yes
- [ ] Build an external validation batch: choose a larger set of docs-first planning / architecture / blueprint repos to assess through `entropy-assessment`, and record hits, misses and friction

## Backlog

- [ ] Consider additional specialized tracks once ORC and the docs-first batch show where the front door's profile is too thin (code-first, config/infrastructure, or other recurring repo shapes)
- [ ] Consider a blind-newcomer probe for the current-state file: a fresh agent answers fixed questions with and without it. Only if the file's value comes into question (synthesis, 2026-10-04)
