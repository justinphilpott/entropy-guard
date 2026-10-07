# Integration brief: the session-end guard for ORC and the orchestration lab

From `guards-integrator` (v0.4.0), 2026-10-07. It covers one guard, `guard/SKILL.md`. Finding ids (F01 and so on) and
question ids (Q1 to Q5) refer to `assessment.md` and `questions.md`. The loop it is placed in is mapped in
`assessment.md` section 5, Step 3.

## The loop as it is

- **Smallest unit of change:** a commit. In ORC, anything on a guarded path goes through a PR, which Danger checks.
- **Pauses that already happen:**
  - opening a PR;
  - Claude merging once review and tests pass;
  - Justin approving the restart card;
  - rewriting `STATE.md` at each verified event.
- **Where follow-up gets lost:**
  - decisions overwritten out of `STATE.md` (F01);
  - stale live facts (F18);
  - unattended night runs that end their turn;
  - worktrees in `/tmp`;
  - times typed by hand (F20).

## Placement

- **`session-coherence-guard` (one guard for both repositories):**
  - **Trigger:** the end of each work session in ORC or the lab, before the commit or handoff. For an ORC change,
    that is before the PR is opened, so the guard's findings can go into the PR's Security review and Package API
    sections. Running it any later lets an overwritten `STATE.md` or an unrecorded decision (F01) slip through.
  - **Actor:** the agent running the session (Claude Code, Codex or opencode), or Justin. An unattended night run
    counts too, and still runs the guard without committing, since its mode governs.
  - **Entry point:** a "Before handing off" section in lab `AGENTS.md`, which `CLAUDE.md` links to, and in ORC
    `AGENTS.md`. Both are drafted in the provisional patch, waiting on Q5.
  - **Output:** the guard's report in the commit message, or in the hand-off. Its next action goes into lab
    `STATE.md`.
  - **Escalation:**
    - A gap too large for the session becomes a GitHub issue, placed on the map, orchestrator#140.
    - A change of intent becomes a proposal in lab `decisions/`, for Justin.
  - **Ordering:** after `pnpm typecheck`, `pnpm test` and `node tools/map.mjs --check`, which the guard itself lists.
    Before the push, and therefore before Danger. Separate from the restart card, which comes after the merge.
  - **Cost:**
    - About 1,050 words to read.
    - The test suites: `tools/report.mjs`'s header puts ORC's and Moving Stillness's suites together at about two
      minutes. The lab README says about 10 s for the same command, and the two disagree (F34).
    - `test:e2e` runs only when the web client, the browser or the web server changed.
    - Sessions here commonly last hours, so this fits the loop at every session end.

## Depth of each check

- **Now, external:** the guard is a skill run by hand. Every check in it needs judgment, about intent, reach,
  decisions and what is stale.
- **Mechanical parts that belong in tools.** None of these is to be built inside the guard:
  - **What ORC reaches:** `test/architecture.test.ts`, extended once Q1 is answered (provisional patch). It runs in
    `pnpm test`, and in CI once #144 exists.
  - **Core-tie rises:** a Danger rule failing a PR that raises a number in `test/core-ties.ts` unless its description
    cites the decision. Once Q2 is answered.
  - **The state file's cap:** a line count, in Danger or a hook, once Q3 has fixed the number. Until then it stays a
    judgment in the guard.
  - **Dead paths and links in markdown:** a link checker such as lychee, in the CI job #144 adds (F15, F16, F23).
    Whether lychee is installed was not checked, and the guard does not depend on it.
  - **The map:** `node tools/map.mjs --check`, run on a schedule by ORC once #166 exists (F29, F30).
- **Not automated:** wording in `README.md`, module headers' "Today:" lines (F32), and `STATE.md` content. These are
  volatile, so they stay judgment.

## Making it visible to agents

The smallest change a fresh agent will meet at the right moment is one "Before handing off" section in each
`AGENTS.md`. This works because each tool's rules file already sends agents to it: Claude Code reads lab `CLAUDE.md`,
which links to `AGENTS.md`, and Codex and opencode read `AGENTS.md`. Both sections are in the provisional patch.

ORC `AGENTS.md` is a Danger-guarded path, so its PR needs a `## Security review` section. "No new authority;
instructions only" is a complete answer under `SECURITY-REVIEW.md`.

Adding the guard to the task's completion criteria also helps: a line in briefs for unattended runs, such as "run the
session-end guard; report in the hand-off". Without it, an unattended run may not reach `AGENTS.md`'s last sections
before it ends.

## Adoption

Each mechanism, with what kind it is, its status, the evidence and the date:

- **`session-coherence-guard`.** Executed check. **Planned.** It has not run at its trigger: the targets are
  read-only snapshots, and nothing was committed. Evidence for verification, when it runs: a completed guard report
  in the commit message of the first session after the patches are applied. (2026-10-07)
- **Fresh-session discovery** (pointers in both `AGENTS.md` files). Reminder. **Planned**, waiting on Q5. To verify:
  ask a session with no context "what must you do before handing off?" in each repository, once through Claude Code
  (`CLAUDE.md`) and once through Codex or opencode (`AGENTS.md`). (2026-10-07)
- **Danger** (Security review and Package API sections). Enforced invariant. **Unknown.** `STATE.md:79-82` and
  `FRICTION.md` 2026-10-02 record a refused case on #179, but it was not observed here. Per `SECURITY-REVIEW.md:54-55`
  it warns rather than blocks a merge (F26). That is configuration and recorded execution, not a refusal this
  assessment saw. (2026-10-07)
- **`test/architecture.test.ts` and `test/core-ties.ts`.** Executed check, run by hand in `pnpm test`. **Unknown**
  whether they are run before each merge. `STATE.md` records "Tests: ORC 970" on 4 Oct. (2026-10-07)
- **`.githooks/pre-push` in both repositories.** Reminder, a summary that never blocks. **Unknown.** There is no git
  configuration in the snapshot to show `core.hooksPath` (F31). (2026-10-07)

## Plan

- **Now:**
  - Apply `patches/settled.patch` in each repository, through a PR for ORC.
  - Ask Justin Q1 to Q5 (`questions.md`).
  - On his answer to Q5, apply `patches/provisional.patch`, or the hunks for each question he answered. Then run the
    guard once at the end of the next real session, and check that a fresh session finds it.
- **Next, light prompting:**
  - Add one line to both `.githooks/pre-push`, after the push summary: "Session-end guard run? Its report belongs in
    the hand-off." This catches a missed run before the work leaves the machine. Even so, it fires after the commit,
    so the `AGENTS.md` pointer stays the primary entry.
  - Add a "Session guard" line to ORC's `.github/pull_request_template.md`.
  - Add the guard line to unattended-run briefs.
- **Later, mechanical checks into existing tooling, each linked to its issue:**
  - tests, typecheck and a link check in CI (#144);
  - the map check and the diary on ORC's scheduler (#166, F29);
  - the architecture test's reach lists (Q1);
  - a Danger rule on core-tie rises (Q2);
  - one owner for the running state directory (#62, F21) and for a connector's setting names (#198, F33).

## Uncertain

- Whether Claude Code, Codex or opencode load the lab's `skills/` on their own. Not checked. The pointers from
  `AGENTS.md` make the guard findable either way.
- Whether either pre-push hook is enabled (F31).
- Whether the Danger check is required on `main`. GitHub's settings were not read.
- How long `pnpm test` takes today. The figures above are the lab's own records, not a run.

## Feedback on entropy-guard

The integrator's output format assumes one repository: one entry point, one hooks path. For a guard covering two, each
mechanism needs a status per repository, as the Adoption list above gives it. Worth a line in the skill.
