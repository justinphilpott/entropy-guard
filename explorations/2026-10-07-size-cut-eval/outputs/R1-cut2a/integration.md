# Integration brief: the session-end guard for ORC and the orchestration lab

From `guards-integrator`, for the guard drafted at `guard/SKILL.md`. Finding ids (F…) and the loop map are in
`assessment.md`, sections 6 and 7; questions (Q…) are in `questions.md`. Everything here is planned. The targets
were read-only, and nothing has run.

## Placement

The guard is `session-coherence-guard`. Its proposed home is the lab's `skills/session-coherence-guard/SKILL.md`,
provisional on Q1.

- **Trigger.** There are two moments:
  - At the end of a work session, before its last commit or before a pull request is opened or updated, and before
    `STATE.md` is overwritten for handoff. This is the latest point at which a stale `STATE.md` line or an unrecorded
    decision is still cheap to fix (F1, F8).
  - Immediately before an agent merges an ORC pull request, for the merge check alone. After a merge, a red suite
    sits on `main`; it sat there for a week once (F11).
- **Actor.** The coding agent that ran the session: Claude Code, Codex or opencode, the agents `tools/map.mjs` names.
  Justin, when he works directly. ORC's own agents are not actors here: ORC starts Pi with `noSkills: true`
  (`reports/2026-09-30-skills-one-home.md`).
- **Entry point.** One line in each repository's `AGENTS.md`, the file every session reads first (proposed text
  below). The skill is not expected to load by itself. Claude Code reads skills only from `~/.claude/skills/`, by
  the same report, so the pointer is how agents find it.
- **Output.**
  - The guard's report goes into the commit message or the pull request description, beside the Security review
    section ORC already requires.
  - The next action goes into the lab's `STATE.md`.
  - Decisions go into the lab's `decisions/`.
- **Escalation.**
  - A gap too large for the current change becomes an issue on the map, under "A: keep the system healthy" (#141)
    or its tests branch (#143), as the map's rules require.
  - An undecided change of intent goes into `decisions/`, marked as awaiting Justin.
- **Ordering.** After the session's own verification commands and before the `STATE.md` overwrite. It is
  independent of Danger, which runs on GitHub after the push, and of the weekly Astra review. That review can sample
  the guard's reports to check it is being run.

## Depth

- **Now: Prompted.** The guard is read by path, through the `AGENTS.md` pointer. It stays judgment-heavy: intent,
  state honesty, and where decisions go.
- **Mechanics to move out of the guard as the system allows:**
  - **Typecheck and tests on every pull request.** This is #144 (Q3). Once it runs, the guard's merge check becomes
    "is CI green".
  - **The diary and the other recurring processes.** #166 runs these on a schedule (F12).
  - **The lab's formats.** The `**Where we are now:**` line, the `FRICTION.md` headings and the `STATE.md` cap
    become a `--check` in the lab's own tools (F8, F9, F14). This is ready once Q2 is answered.
  - **The map check.** An unreadable repository should fail it, and one repository list should feed both
    `collect.mjs` and `map.mjs` (F13, F15).
  - **Docs naming paths that do not exist.** An ORC test that every backticked path in a root `.md` file exists,
    unless the file is marked as history. A link checker such as lychee for both repositories (F7). Neither tool's
    installation was checked, so the guard depends on neither.

## Adoption

Both conditions are **planned**, not verified.

- **The trigger has fired once.** Run the guard at the end of one real session in each repository. The first
  pull request of the #166 work is the natural case in ORC; the next `STATE.md` update is the case in the lab. Its
  report should appear in that pull request's description. This needs a commit and a push, which this run was not
  authorised to make.
- **A fresh agent session finds it.** Ask a fresh Claude Code session, a Codex session and an opencode session, each
  with no context, started in ORC and again in the lab: "what must you do before handing off?" Each must name the
  guard's path.
  - Check ORC's case closely. The lab links `CLAUDE.md` to `AGENTS.md` and ORC has no such link, so a Claude Code
    session in ORC may not read the pointer at all (F21).
  - That the `AGENTS.md` line exists is configuration evidence. Only an answer from a fresh session counts as
    adoption.
- **Hooks are not used.** The two committed pre-push hooks are non-blocking summaries by design. Whether they are
  enabled is unknown, because the snapshots have no `.git`.

## Plan

- **Now:**
  - Justin answers Q1 to Q4.
  - Apply `patches/scope-orchestration-lab.patch`, with `decisions/` first (F1, F2, F8, F9, F14, F15, F20).
  - Open a pull request for `patches/orchestrator.patch`, with a Security review section (F3 to F6, F24).
  - On Q1's answer, add the guard and the two pointer lines below.
- **Next:**
  - If ORC's case fails the fresh-session check, add a `CLAUDE.md` link to `AGENTS.md` in ORC, as the lab has
    (F21).
  - If runs are missed, have Claude Code's existing night prompt name the guard. That prompt lives in
    `~/.claude/settings.json` and reaches only Claude Code, so the `AGENTS.md` line stays the main entry point.
- **Later:**
  - #144's CI job (F11).
  - #166's schedules for the diary, the weekly review and FRICTION into rules (F12).
  - The `--check` modes and the docs-path test above (F7, F13, F14).
  - Take each mechanical line out of the guard as its tool lands.

**Proposed pointer lines, provisional on Q1:**
- **The lab's `AGENTS.md`,** at the end of "Keeping state": "Before handing off, run
  `skills/session-coherence-guard/SKILL.md`. It covers this Scope and ORC."
- **ORC's `AGENTS.md`,** under "Working Style": "Before handing off, run the session-end guard in the orchestration
  lab, `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`."
  - The file is a guarded path, so its pull request needs a Security review section.
  - The line names a Scope's path inside ORC. Q1 weighs that tie.

## Uncertain

- Whether agents load the lab's `skills/` by themselves. The skills report says Claude Code does not, so the
  pointer is relied on instead.
- Whether Claude Code loads ORC's `AGENTS.md` without a `CLAUDE.md` link. Not checked.
- Whether a session-end guard already exists outside both repositories (Q1).
- Whether `.githooks` is enabled in either clone, and whether GitHub branch protection is set.
- The rules in #140's description were not read. The escalation route assumes they accept health issues under #141.
