---
name: entropy-guard
description: Session-end check for the entropy-guard repository itself. Run before committing after meaningful work. Checks decisions and learnings, skill and intent alignment, workflow alignment, consistency and references, and honest state.
metadata:
  version: "0.4.0"
  generated: "2026-03-19, by entropy-assessment v0.4.0; last revised 2026-10-07 (size cut)"
---

# Skill: Entropy Guard

Run when you finish a meaningful piece of work, before commit. Check only this session's change: it takes 2-5
minutes, and a full audit is out of scope. Skip it for typo or formatting-only changes. The `.githooks/pre-commit`
hook reminds you (`git config core.hooksPath .githooks` enables it).

## Where things live

- Authorised intent: `INTENT.md`. Steward: Justin Philpott.
- Current state and next steps: `TODO.md`.
- Decisions: `DECISIONS.md`. Learnings: `LEARNINGS.md`. What broke in use: `FRICTION.md`.

## What changed this session

```bash
git log --oneline origin/main..HEAD          # commits not yet pushed
git diff origin/main HEAD                    # what those commits changed
git status --short                           # staged, unstaged and untracked
git diff --cached                            # staged: what the next commit will contain
git diff                                     # unstaged
git ls-files --others --exclude-standard     # untracked files: read the ones that matter
```

If the session started somewhere other than `origin/main`, compare against that and say so. If you cannot tell where
it started, report "coverage incomplete" and what you compared against. A change can make an untouched file wrong,
such as a renamed skill leaving a stale link elsewhere: check what depends on what changed.

## Checks

Most answers will be "nothing to do".

1. **Decisions.** Did you choose between approaches, decide against something, find a constraint or set a
   convention? Record it in `DECISIONS.md`: context, decision, impact, and who decided and when.
2. **Learnings and friction.** Did something behave unexpectedly, or did you validate or disprove an assumption?
   Record it in `LEARNINGS.md`: insight, what validated it, implication. Did something break in real use? Add it to
   today's entry in `FRICTION.md`, with its cost.
3. **Skills and intent.** If you changed a skill, does it still keep guards low-burden, scoped to the change, and at
   the right enforcement depth? When a skill and `INTENT.md` disagree, apply the intent-change rule in
   `skills/entropy-assessment/intent-change-rule.md` before editing either. Here the steward is Justin, the intent
   document is `INTENT.md`, and the decision surface is `DECISIONS.md`.
4. **Workflow.** If you changed how work is done here (when guards run, how `TODO.md` or feedback is used), would an
   agent starting from `AGENTS.md` alone follow what you actually did? Do `AGENTS.md`, `README.md`, `TODO.md` and the
   skills still agree?
5. **Consistency and references.** For each file you added, renamed, moved or deleted, and each concept you changed:
   - Is the change reflected in `AGENTS.md` (Key Files) and `README.md`?
   - Does each concept still have one home? If two docs describe it, decide which owns it and reduce the other to a
     link. A summary or an independent check of the same contract is not a redundant copy: keep it.
   - Are any links, paths or names now stale? Search for the old name.
   - Before restoring a deleted file, reviving an old concept or recreating a reference target, check whether
     `DECISIONS.md` or `TODO.md` records its supersession.
6. **Placeholders and state.** Fill or remove any placeholder your work now answers. Clear "Doing Now" in `TODO.md`,
   tick finished items, and add anything this work surfaced.

## Output

Note briefly, in the commit message if anything changed:

- what you compared against, and whether that covered the whole session;
- what you checked, and what you did not;
- what was updated, or "entropy check clean";
- any proposal recorded for Justin.

For newcomer comprehension, use `repo-doc-evaluator` (in local-config); for whole-repository coherence, run
`entropy-assessment` again. This guard does neither.
