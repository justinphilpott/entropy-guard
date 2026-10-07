# Integration brief: entropy-guard local guard

This brief comes from `guards-integrator` v0.4.0. It reuses the loop map and findings in `assessment.md`. Findings are
cited by id: F for findings, Q for questions.

## Placement

There is one guard, `skills/local/entropy-guard/SKILL.md`, to be replaced by `guard/SKILL.md`. It keeps the same name
and path.
- **Trigger:** the end of a meaningful work session, before the commit that hands it off. This is the latest point at
  which a stale reference or an unrecorded decision is still one session old and cheap to fix (`INTENT.md:33`).
  Typo-only and formatting-only commits skip it.
- **Actor:** whoever did the work, which here is a human or an AI agent (`AGENTS.md:3`).
- **Entry point:** `AGENTS.md:19` ("Run entropy-guard before committing") and `AGENTS.md:41` (Key Files). The
  `.githooks/pre-commit` reminder backs these up where the hook is enabled.
- **Output:** the guard report. Its findings, or "entropy check clean", go in the commit message (`README.md:138`).
  Proposals go to `DECISIONS.md`. The next action goes to `TODO.md` "Current state".
- **Escalation:** a gap too large for the current change goes to `TODO.md` "Next Up" or "Backlog". An intent change
  goes to a `DECISIONS.md` proposal awaiting the steward.
- **Ordering:** it is the only guard, so it has no ordering constraint.
- **Cost against frequency:** the guard is 1,126 words, about 10 check lines plus 2 commands. It runs once per
  meaningful commit, which is within the 2 to 10 minutes `INTENT.md:116` allows. The two commands take seconds.

## Adoption

| Mechanism | What it is | Status | Evidence | Date |
|---|---|---|---|---|
| Fresh-agent discovery of the guard | discovery path | verified | A fresh session with no context, given only the snapshot path, chose `AGENTS.md` first. It named `skills/local/entropy-guard/SKILL.md` as what to run before handing off, citing `AGENTS.md:19`. The updated guard keeps that path. | 2026-10-07 |
| `.githooks/pre-commit` reminder | reminder | unknown | The file exists and is executable, but it runs only after a manual link into `.git/hooks/` (`README.md:140`). The snapshot has no `.git`, so neither `core.hooksPath` nor `.git/hooks/pre-commit` could be read. It was not seen firing. | 2026-10-07 |
| Updated guard (`guard/SKILL.md`) | executed check | planned | Not installed, and not run at its trigger. It waits for Q1 and Q2 (see below). | 2026-10-07 |
| The guard's link and name commands | executed check (a part of the guard) | planned | Both ran once against the snapshot and printed nothing. They caught a planted broken link and a planted name mismatch in a scratch copy. That shows the commands work, not that the guard ran at its trigger. | 2026-10-07 |
| Commit-message entropy note (`README.md:138`) | convention, prose only (F9) | unknown | There is no commit history to inspect. Nothing checks it. | 2026-10-07 |

## Plan

- **Now (settled):** apply `patches/settled.patch`. It fixes the current guard's stale references (F8), so the guard
  in use is correct while the update waits. It also adds `TODO.md` "Current state" (F14), which the updated guard
  reads first.
- **Now (after Q1 and Q2 are answered):**
  - Copy `guard/SKILL.md` over `skills/local/entropy-guard/SKILL.md`, and fill the steward in "Where things live".
  - Apply `patches/provisional.patch` for its Q2 parts.
  - Run the guard once at the next meaningful commit, with its report in the commit message. That run is what moves
    the guard from `planned` to `verified`.
  - If Q2 is answered "sessions may edit `INTENT.md`", rule 4 in the guard's Intent section cannot stand as written.
    Bring the guard back to the generator, rather than editing the rule by hand.
- **Next:**
  - Have `.githooks/pre-commit` also run the guard's two mechanical commands, still non-blocking, printing any
    `BROKEN` or `NAME MISMATCH` lines (F8, F9). Both commands check stable invariants, not wording, so they are safe to
    automate (docs-first matrix, "Brittle automation").
  - Replace the manual hook link with `git config core.hooksPath .githooks` in `AGENTS.md:19` and `README.md:140`.
    Then edits to the tracked hook take effect without re-linking. This is the steward's choice: it changes a
    documented working practice.
- **Later:**
  - If the repo gains CI, move the link and name checks into it as an enforced, failing step.
  - A guard runner and a periodic re-evaluation (F9) are already tracked at `TODO.md` Backlog line 18 ("Design a
    guard runner concept"). Link to it rather than starting parallel work.

## Uncertain

- **Instruction loading.** Agents that auto-load only `CLAUDE.md`, or that load skills from a tool-specific folder,
  have nothing here that points them at the guard. The fresh-session test covered one agent choosing to read
  `AGENTS.md`. Not checked for other agents.
- **Whether anyone runs the guard today.** No commit history or hook configuration was readable, so this is unknown
  (F9).
