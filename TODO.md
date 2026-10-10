# TODO

Lightweight task tracking for early development. Graduate to an issue tracker (GitHub Issues, Linear, etc.) once the project has momentum.

## Doing Now

Size cut: done, tested and merged (PR #14, `f2a3dba`).

Reach claims (approved by Justin 2026-10-07, "Agreed, proceed"), on branch `reach-claims-show-search`, stacked on
PR #14: a claim about everything a system reaches is checked against the code with a recorded search. Test:
`explorations/2026-10-07-reach-claims-eval.md`, key written before runs (R1 ×3, R2 and R3 once each).
State at 23:25 on 7 October: round 8 is scored. No regression in any case; the patch check works (K36: 3 of 3
against 1 of 3); the reach rule improves K35 by half a point where the rule asked for a whole run, so the round fails
that criterion. No PR opened.

Paused by Justin at 23:22 on 7 October; resumed 10 October. Two decisions still wait for him: what ships from this
branch (both changes, the patch check alone, or more runs), and an Astra review of it. PR #14 (the size cut) was
merged at 23:23 on 7 October, as `f2a3dba`; this branch sits on what main holds.

**Installed and running on Iris (ORC's new name), 10 October, on Justin's "yes please link them":**
- The four exportable skills now link to each other as `../<name>/SKILL.md` (`47eae36`), so they resolve once
  installed. local-config `91a7338` (not pushed) links them into `~/.agents/skills` and `~/.claude/skills` through
  its sync, with a DECISIONS entry. The links serve whatever `~/pro/entropy-guard` has checked out: this branch now.
- A read-only assessment of Iris (`origin/main` `a694039`) and the lab Scope (`56a32e0`) ran through the installed
  skills: `explorations/2026-10-10-iris-assessment/` (`run.md` says how, and which findings were checked). Guard
  decision `create`; 14 findings; 4 questions for Justin; settled and provisional patches, none applied. Nothing in
  Iris or the lab changes until Justin answers.
- The run's 5 notes on the skills themselves (`skills-feedback.md` there) are not yet triaged: multi-repository guard
  home and baseline, patches split by repository, a churning state file, test blind spots in reach checks, and
  `git log -S` for decisions held only in a state file.

## Next Up

- [ ] The generator's mandatory intent-change rule can meet an open question about that same rule (both round-6 R2 runs): say what the guard does then, so a run neither holds back every settled fix nor writes a guard that contradicts itself
- [ ] Triage the 7 deployed guards: which are still used, and which need the intent-change rule, pointers instead of copied state, or a delta that includes uncommitted work. The audio-tools guard's spend lines are first (they predate the 2026-10-03 rule that spending goes through ORC); each change needs that repo owner's yes
- [ ] Build an external validation batch: choose a larger set of docs-first planning / architecture / blueprint repos to assess through `entropy-assessment`, and record hits, misses and friction

## Backlog

- [ ] Consider additional specialized tracks once ORC and the docs-first batch show where the front door's profile is too thin (code-first, config/infrastructure, or other recurring repo shapes)
- [ ] Consider a blind-newcomer probe for the current-state file: a fresh agent answers fixed questions with and without it. Only if the file's value comes into question (synthesis, 2026-10-04)
