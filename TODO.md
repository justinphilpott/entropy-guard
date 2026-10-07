# TODO

Lightweight task tracking for early development. Graduate to an issue tracker (GitHub Issues, Linear, etc.) once the project has momentum.

## Doing Now

Size cut approved by Justin on 2026-10-07 ("lets go"), following `explorations/2026-10-05-skills-size-review-astra.md`,
on branch `cut-skills-to-derived-size`. Baseline for comparison: the skills at `daee846` (PR #13 merged).

- [x] Step 1: the intent-change rule in its own file; this repo's guard to about 700 words
- [x] Step 2: the generator to about 900 words, with bootstrap mode in its own file and one guard contract
- [x] Step 3: the integrator to about 850 words, with one worked example
- [x] Step 4: the front door to about 550 words, with the mixed profile in its own file; docs-first to about 950
- [x] Step 5: the intent pass to about 800 words
- [ ] Step 6: test against the frozen baseline on the existing cases and the seven next checks; Astra review of the PR
- [x] Small items: stall cause corrected in `FRICTION.md`; codex loads the same global rules, so the reply cap likely applies there too (not yet tested; `astra-review` is Justin's to change)

Then: assess ORC and the lab read-only with the cut skills.

## Next Up

- [ ] Assess ORC and the lab Scope together with the revised skills, read-only; bring the results and any proposed changes to Justin before anything in ORC changes
- [ ] Triage the 7 deployed guards: which are still used, and which need the intent-change rule, pointers instead of copied state, or a delta that includes uncommitted work. The audio-tools guard's spend lines are first (they predate the 2026-10-03 rule that spending goes through ORC); each change needs that repo owner's yes
- [ ] Build an external validation batch: choose a larger set of docs-first planning / architecture / blueprint repos to assess through `entropy-assessment`, and record hits, misses and friction

## Backlog

- [ ] Consider additional specialized tracks once ORC and the docs-first batch show where the front door's profile is too thin (code-first, config/infrastructure, or other recurring repo shapes)
- [ ] Consider a blind-newcomer probe for the current-state file: a fresh agent answers fixed questions with and without it. Only if the file's value comes into question (synthesis, 2026-10-04)
