# Integration brief: the session coherence guard for ORC and the orchestration lab

From `guards-integrator`. This brief places `guard/SKILL.md` in the system's real loop, the loop map in
`assessment.md` section 6, and says what is verified, which today is nothing. Findings are referred to by id, from
`assessment.md`. Everything here is provisional on Q4 (where the guard lives). The paths below assume the recommended
answer: the lab's `skills/session-coherence-guard/SKILL.md`.

## The loop as it is
- **Smallest unit of change:**
  - in ORC: a pull request, from a branch or a worktree under `.worktrees/`;
  - in the lab: a direct commit, usually with a `STATE.md` overwrite.
- **Habitual pauses:**
  - the PR's Danger check;
  - review (Astra, for significant work);
  - the merge;
  - the restart card Justin approves;
  - the `STATE.md` overwrite and the reply to Justin at the end of a session;
  - compaction, after which the lab's `AGENTS.md:3-4` says to re-read `STATE.md`;
  - 22:00, after which work stays on branches.
- **Where follow-up gets lost:**
  - decisions overwritten in `STATE.md` (F1);
  - questions to Justin buried mid-paragraph;
  - kept processes with no runner (F8);
  - tests nobody runs (F7).

## Placement
- **`session-coherence-guard`:** at the end of every agent session that changed ORC or the lab.
  - **Trigger:** before the session's last `STATE.md` overwrite and its handoff message. Also before merging an ORC PR
    that changes `src/`, `config/` or a boundary document. That is the latest moment a documentation fix can ride in
    the same PR and the same Security review section; after the merge, the restart card puts the change live.
  - **Actor:** the agent running the session (Claude Code, Codex or opencode); Justin, when he works by hand.
  - **Entry point:** the lab's `AGENTS.md`, which Claude Code loads through `CLAUDE.md`, and one line in ORC's
    `AGENTS.md` (text below).
  - **Output:**
    - the guard's report, in the handoff message to Justin;
    - the next action, in `STATE.md`;
    - proposals, in the lab's `decisions/`, marked as awaiting Justin.
  - **Escalation:** a gap too large for the change becomes an issue on the map, under #141 ("keep the system healthy")
    or #167 ("how we work"). An intent question goes to `STATE.md`, under "Waiting on Justin".
  - **Ordering:**
    - after `pnpm typecheck && pnpm test`, and after the PR's `## Security review` section is written;
    - before the `STATE.md` overwrite and the push, after which the pre-push hooks print `push-summary`;
    - beside Danger, which it does not replace.
  - **Cost against frequency:** there are several sessions a day. Each run reads one session's diff plus up to 11
    triggered checks; most do not fire for a given session. Estimated at 5 to 10 minutes of agent time, which fits the
    end of a session. The costly check, every "only" claim against all of `src/`, fires only when outward reach
    changes, a few times a week.

## Depth of each check
- **External now** (a skill run by hand): the whole guard.
- **Prompted next:** the `AGENTS.md` lines below, plus a line in ORC's PR template. The template is under `.github/`,
  a guarded path, so adding the line needs a Security review section.
- **Semi-embedded later.** These are mechanical parts to move out of the guard:
  - the tests on every PR (#144), which removes the guard's "did the tests pass" check;
  - `node tools/map.mjs --check` and a `STATE.md` line count, run by ORC scheduling (#166);
  - a check that backticked markdown paths exist, and lychee for links, once installed (not checked);
  - the diary on a schedule (#166).
- **Already fully embedded, keep:** `test/architecture.test.ts`, the core-ties ratchet (`test/core-ties.ts`), the
  package-API report test and the source-header check. They run whenever the tests run.
- **Kept as judgment:** the wording of `STATE.md` and of the boundary text. It is volatile, so it is not automated.

## Making it visible to agents
These proposed lines are not applied, because the targets are read-only and Q4 is open. They are the smallest change a
fresh agent meets at the right moment.

**In the lab's `AGENTS.md`, after "Keeping state":**
```markdown
## Before handing off

Run [the session coherence guard](skills/session-coherence-guard/SKILL.md) on this session's change, in every
repository it touched, before the last `STATE.md` overwrite and your reply to Justin. Put its findings in that reply,
proposals in `decisions/`, and a gap too large to fix now on the map as an issue.
```

**In ORC's `AGENTS.md`, "Working Style".** This is a guarded path, so the change needs a `## Security review` section:
"No new authority; instruction only".
```markdown
Before handing off, or merging a pull request that changes `src/` or a boundary document, run the session coherence
guard kept by the Scope that manages this work (for this installation, the orchestration lab's
`skills/session-coherence-guard/`).
```

Do not put the trigger in a `.claude/` hook. The guard's own safety rules keep committed workflow logic out of
vendor-specific agent folders.

## Adoption

| Mechanism | What it is | Status | Evidence | Date |
|---|---|---|---|---|
| `session-coherence-guard` | executed check | planned | none: not installed, never run at its trigger | 2026-10-07 |
| Lab `AGENTS.md` "Before handing off" | reminder | planned | not applied | 2026-10-07 |
| ORC `AGENTS.md` pointer | reminder | planned | not applied | 2026-10-07 |
| Danger "Security review" and "Package API" | executed check (it does not block a merge, F7) | verified as recorded, not re-observed | `STATE.md:79-81`: "proven on GitHub (pass, fail with the section removed, pass restored)" | 2 Oct, recorded |
| Architecture test and core-ties ratchet | enforced invariants, but only when the tests run | unknown per PR | configuration only; nothing runs the tests by itself (F7) | 2026-10-07 |
| `node tools/map.mjs --check` | executed check, by hand | unknown | no run recorded in the snapshot | 2026-10-07 |
| `.githooks/pre-push` in both repositories | reminder (never blocks) | unknown | the snapshot has no `.git`, so `core.hooksPath` cannot be read (F16) | 2026-10-07 |

**The guard counts as adopted only when both of these hold:**
- **It has run once at its trigger.** That is a completed guard report from a real session end, quoted in the handoff
  reply or saved with the commit.
- **A fresh session finds it.** Ask each way agents load instructions here, with no context: "what must you do before
  handing off?" That means:
  - Claude Code in the lab, through `CLAUDE.md`;
  - Claude Code in ORC, which has no `CLAUDE.md` (F17);
  - a Codex or opencode session, which reads `AGENTS.md`.

  Each must name the guard and its path.

## Plan
- **Now,** once Justin answers Q4:
  - install the guard at the chosen path;
  - add the two `AGENTS.md` lines;
  - apply `lab.patch`;
  - open the ORC PR for `orc.patch`, with "No new authority; documentation only" (F1, F2, F4, F6, F9, F12);
  - run the guard at the next session end and keep the report. That is the first adoption evidence.
- **Next:**
  - the ORC PR template line;
  - ask Justin whether ORC should get a `CLAUDE.md -> AGENTS.md` link like the lab's. This is a new file, so it is
    his call (F17).
  - after Q1, the boundary text in ORC's `AGENTS.md` (F5).
- **Later:** these join existing work rather than starting parallel projects.
  - tests on every PR, under #144 (F7);
  - scheduled runs of the diary, map check, `STATE.md` cap check and weekly review, under #166 (F8);
  - FRICTION promotion, under #60 (F10);
  - a markdown path and link check, in the same CI job as #144 (F6, F9).

## Uncertain
- Whether Claude Code loads ORC's `AGENTS.md` without a `CLAUDE.md` link. Not checked (F17).
- Whether either clone has `core.hooksPath` set. Not checkable in a snapshot (F16).
- Whether Danger's status is required on GitHub. `SECURITY-REVIEW.md:54-55` says it warns rather than blocks.
- Whether lychee, ast-grep, ctxlint or agnix are installed. Not checked, so no step depends on them.
