# Integration brief: the session coherence guard for ORC and the orchestration lab

From entropy-guard's `guards-integrator` (v0.4.0), 7 October 2026, for the guard in `guard/SKILL.md`. It reuses the
assessment's loop map (`assessment.md`, section 5) and refers to its findings by id. The targets were read-only
snapshots with no `.git`, and nothing was run in them, so every mechanism below is `planned` or `unknown`; none is
`verified`. Its placement depends on question 1 in `questions.md`, and is written for the recommended answer: one
guard, in the lab.

## The loop as it is

- **Smallest unit of change:** a commit on a branch in a worktree, then a pull request to ORC, checked by Danger; in
  the lab, commits straight to its branch, with no CI.
- **Habitual pauses:**
  - a PR opened (Danger runs, Astra may review);
  - a merge (Claude merges once review and tests pass);
  - the restart card, approved by Justin and read back;
  - each verified event, after which `STATE.md` is overwritten;
  - the reply that hands back to Justin;
  - 22:00, after which work stays on branches.
- **Where follow-up is lost:** documentation findings (F5 survived three days after two reviews reported it);
  decisions written into a file that is then overwritten (F3); In Progress marks left behind; uncommitted worktrees
  in `/tmp` (#196).

## Placement

- `session-coherence-guard`:
  - **Trigger:** at the end of a work session, before its last commit and before the reply that hands back to Justin.
    When the session opened an ORC pull request, before that PR is marked ready, so documentation repairs ride in the
    same PR and Danger's security-review check sees them. That is the latest point at which a stale `STATE.md` line
    or an unrecorded decision is still one edit away; after the hand-back it surfaces as a wrong answer (F1).
  - **Actor:** the agent running the session (Claude, Codex, opencode, Astra), or Justin.
  - **Entry point:** a "Before handing off" section in the lab's `AGENTS.md` (loaded through the lab's `CLAUDE.md`
    link and by the tools that read `AGENTS.md`), and the same section in ORC's `AGENTS.md`, both pointing to
    `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md` (`provisional-Q1-*.diff`).
  - **Output:** the guard's report in the session's hand-back reply, and in the PR description when there is a PR.
    The next action goes into `STATE.md`, which the guard's Report section already requires.
  - **Escalation:** a gap too large for the session goes to a GitHub issue placed on the map (orchestrator#140, under
    the branch it serves), never to a list in `STATE.md` or the guard.
  - **Ordering:** after the tests, typecheck and any Astra review, so the guard reports on the change as it will
    land. It is the session's last step: its check 8 is what prompts `node tools/map.mjs stopped` for the session's
    marks.
- **Execution cost against frequency.** The guard is 1,070 words to read. The git commands take seconds per
  repository. `pnpm typecheck && pnpm test` runs only when ORC changed; `tools/report.mjs:10` puts ORC's and Moving
  Stillness's suites together at about two minutes, and ORC's alone was not measured. `pnpm test:e2e` runs only when
  the web or browser side changed. Sessions end several times a day (two merges and four verified restarts on 4 Oct alone), so
  minutes per session fits. Nothing needs to move to tooling for cost reasons.

## Depth of each check

| Check (guard order) | Depth now | Where its stable part goes later |
|---|---|---|
| 1. reach changed, ORC's boundary docs still right | External (judgment) | a test that every `src/...` path and `ORCHESTRATOR_*` name in ORC's `README.md` and `AGENTS.md` exists, beside `test/architecture.test.ts` |
| 2. state claims agree, live facts dated | External (judgment) | stays judgment |
| 3. `**Where we are now:**` line and size | External | a `--check` in `tools/map.mjs` (F11, F2), once question 2 is answered |
| 4. decision at its owner | External (judgment) | stays judgment |
| 5. renamed names searched for | External | the same path-and-name test as check 1 |
| 6. `pnpm test:e2e` when web or browser changed | External | a CI job, with #144 |
| 7. card restart and read-back after a merge | External | stays judgment: it is a live read |
| 8. map check, marks cleared | External | the scheduled map check through #166; a hook that clears a session's marks (already a map follow-up) |
| 9. reports dated and marked | External (judgment) | stays judgment |
| 10. friction recorded | External (judgment) | stays judgment; the monthly FRICTION-into-rules process (#60) consumes it |
| commands: `pnpm typecheck && pnpm test` | External | a required CI status (#144) |

Volatile wording stays out of tooling: the list of ORC's boundary sentences and the `STATE.md` layout are still
moving.

## Adoption

- **Pointers in both `AGENTS.md` files:** reminder; planned (question 1; F12, F13).
- **`session-coherence-guard`:** executed check; planned. It counts as adopted when a session has run it at its
  trigger and its report sits in a hand-back reply or a PR description.
- **Fresh-session discovery:** planned. To verify, ask one fresh session of each tool that works here what it must do
  before handing off: one in the lab, one in an ORC worktree. Claude Code in ORC is the uncertain one, since ORC has
  no `CLAUDE.md` (F13).
- **Danger on ORC PRs:** enforced invariant; verified 2 Oct per `STATE.md:79-82` (a PR failed without its section and
  passed with it). That is a recorded result, not re-observed in this run.
- **Pre-push hooks in both repositories:** reminder (print only); unknown, because the snapshot has no git
  configuration to show `core.hooksPath` (F14). They carry no guard reminder today.
- **CI tests:** enforced invariant; planned under #144, mechanism open.

## Plan

- **Now** (once question 1 is answered):
  - apply `provisional-Q1-lab.diff` and `provisional-Q1-orchestrator.diff`;
  - run the guard at the end of the next session, and keep its report in the hand-back;
  - ask one fresh session in each repository what it must do before handing off.
- **Next:**
  - if the guard is skipped twice, add one line to each `.githooks/pre-push` reminding the pusher to run it, and
    confirm `core.hooksPath` is set in each clone (F14);
  - add the `CLAUDE.md` link in ORC if Claude Code sessions do not find ORC's `AGENTS.md` (F13; a layout change, on
    Justin's yes).
- **Later:**
  - tests on every PR as a required status (#144);
  - the path-and-name test for ORC's documents (F5, F7);
  - `tools/map.mjs --check` covering the `STATE.md` line and size (F11, F2);
  - the map check and the diary running on ORC's scheduler (#166, then the kept processes).

## Uncertain

- Whether each tool (Claude Code, Codex, opencode, Pi) loads `AGENTS.md` from an ORC worktree: not checked (F13).
- Whether either pre-push hook is enabled: not checked (F14).
- How long ORC's own test suite takes: not measured.
- Whether a lab session commits straight to `main` or through PRs: the snapshot does not show it.
