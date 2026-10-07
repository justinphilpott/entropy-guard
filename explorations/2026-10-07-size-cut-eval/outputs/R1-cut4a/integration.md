# Integration brief: the session-end guard for ORC and the orchestration-lab Scope

From `guards-integrator`, for the guard drafted in `guard/SKILL.md`. Finding ids (F1 to F26) refer to `assessment.md`,
whose loop map (section 4) this reuses. The two repositories were read-only snapshots with no `.git`, and no steward
was present, so nothing here has been placed or exercised: every item is a plan.

## Placement

- **`session-coherence-guard`**, at the lab's `skills/session-coherence-guard/SKILL.md`. That folder exists and holds
  only `.gitkeep` (F23). Justin made the lab the central Scope for project management, code quality and security on
  4 Oct, and kept "entropy guard at session end" among its processes.
  - **Trigger:** at the end of a work session, before its last rewrite of the lab's `STATE.md`. If the session opened
    a pull request, also before that pull request is marked ready or merged. That is the latest moment drift is still
    cheap: Claude merges once review and tests pass (`STATE.md:17`), with nothing on GitHub running the tests (F6), and
    `STATE.md` is overwritten at each verified event (F1, F2). Pre-commit is too early: a session commits several times
    before its work is coherent.
  - **Actor:** the agent that did the session (Claude Code, Codex or opencode), or Justin when he works by hand.
  - **Entry point:** a line in each repository's `AGENTS.md` (wording below). In the lab, `CLAUDE.md` links to
    `AGENTS.md`, so Claude Code and the other agents meet the same line.
  - **Output:** the guard's report in the session's final message, and in the pull request's description when there is
    one. The next action goes into `STATE.md`. Proposals for Justin go to the lab's `decisions/` or the issue they
    concern.
  - **Escalation:** a gap too large for the current change becomes an issue, placed on the map orchestrator#140 under
    the branch it serves, as the map's rules require, and linked from `STATE.md`.
  - **Ordering:** after the session's own tests, before the `STATE.md` rewrite. It runs alongside Danger, which runs
    when the pull request is opened or edited. It comes before the weekly adversarial review, which can then read its
    reports.

### Wording for the entry points

Lab `AGENTS.md`, at the end of "Keeping state":

> Before a session's last rewrite of `STATE.md`, and before a pull request is marked ready, run
> `skills/session-coherence-guard/SKILL.md`. It covers this Scope and ORC.

ORC `AGENTS.md`, at the end of "The map of work":

> Before handing off, run the orchestration-lab Scope's session-end guard,
> `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`. It covers ORC and the lab together.

Three things to know about the ORC line:

- `AGENTS.md` is on Danger's guarded list, so its pull request needs `## Security review`: "No new authority".
- It names a Scope. That fits its section, which already ties ORC to this installation's map, and the core-ties
  ratchet does not scan `AGENTS.md`. If Justin would rather ORC's own files name no Scope, put the pointer in
  orchestrator#140's description instead.
- ORC has no `CLAUDE.md`. Whether Claude Code sessions in ORC load `AGENTS.md` at all is unchecked (F22). If they do
  not, the smallest fix is a `CLAUDE.md` linking to `AGENTS.md`, as the lab already has.

## Depth of each check

| Guard check | Depth now | Moves to | When |
|---|---|---|---|
| `STATE.md` claims agree, and live values say where and when (F1) | external | prompted (the entry-point lines) | now |
| Justin's decisions recorded outside `STATE.md` (F2) | external | prompted | now |
| Reach, launch and credentials lists match the code (F10 to F16) | external | stays judgment; the architecture test already confines the modules, and should recognise the in-process browser (F14) | test change: next |
| Core-ties allowance rose (F5) | external | fully embedded: a check that fails on a rise without the approval Q2 names | after Q2 |
| Authority scripts outside `GUARDED` (F9) | external | semi-embedded: add the three scripts to `dangerfile.js` and to the architecture test's required list, then drop this check from the guard | next |
| Tests run before "tests pass" (F6) | external | semi-embedded: a pull-request workflow (#144) | when Justin picks the mechanism |
| Seams between the repositories (F18, F21) | external | semi-embedded: the diary reads through an ORC command; operator scripts find the running ORC's state directory (#62); a contract test for connector setting names (#198, #202) | later |
| A decision's subject changed in code (F4) | external | stays judgment | — |
| Old names, flags and paths; root reports marked as history (F17, F20) | external | a link checker and ast-grep, once installed (neither is on this machine's PATH) | later |

Keep the judgment checks in the guard. Do not automate the state file's wording or the capability lists' prose: both
still move every few days.

## Adoption

- **`session-coherence-guard`: planned, not verified.** Both conditions are still to be met:
  - **Its trigger has fired once:** a real session ends with the guard run and its report in the session's last
    message, or in a pull request description. No hook carries this trigger, so a scratch commit would prove nothing.
  - **A fresh agent finds it:** in each repository, ask a session with no context what it must do before handing off,
    once with Claude Code and once with Codex or opencode. In ORC, check first whether Claude Code loads `AGENTS.md`
    (F22).
- **No configuration evidence either:** nothing was placed. Both `.githooks/pre-push` hooks only print a summary and
  may not be enabled (F25). That is configuration, which shows nothing about execution.

## Plan

- **Now** (after Justin has looked at the draft and answered Q1 and Q2, or accepted the recommendations):
  - copy `guard/SKILL.md` into the lab's `skills/session-coherence-guard/`;
  - add the two entry-point lines;
  - apply `patches/scope-orchestration-lab.patch` (F1, F2, F20) and `patches/orchestrator.patch` (F11 to F15, F19), the
    second as a pull request.
- **Next:**
  - add the authority scripts to `GUARDED` (F9);
  - give the restart card's commands an explicit environment (F10);
  - point the systemd unit's documentation at `README.md` and mark ORC's root reports as history (F17);
  - make the network test recognise the in-process browser (F14).
  - If missed runs become the main failure, add a reminder line to the lab's `.githooks/pre-push` or to
    `tools/map.mjs`'s output. Not to `.claude/`: workflow logic stays out of vendor folders.
- **Later:**
  - tests on every pull request (#144, F6), after which the guard's test check shrinks to reading the result;
  - the core-ties rise check (F5, after Q2);
  - a length and age check on `STATE.md` in `node tools/map.mjs --check` (F1, F7, after Q3);
  - the seam work on #62, #198 and #202 (F18, F21);
  - a link checker once one is installed.

## Uncertain

- Whether Claude Code sessions in ORC load `AGENTS.md`: not checked (no `CLAUDE.md` in ORC).
- Whether either repository has `core.hooksPath` set: a snapshot cannot show it.
- Whether Danger's check is required for merging: branch protection was not readable.
- Where Codex and opencode briefs are written, and so whether "run the guard" can join their completion criteria:
  `STATE.md:65` mentions the briefs, but they are outside both snapshots.
- Whether `lychee`, `ast-grep` or an instruction-file linter is installed on the machine ORC runs on: checked only on
  the machine this assessment ran on, where none is.
