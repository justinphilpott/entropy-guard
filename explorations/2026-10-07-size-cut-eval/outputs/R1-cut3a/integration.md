# Integration brief: the session-end guard for ORC and the Orchestration Lab

From `guards-integrator`, 2026-10-07, for the guard in `guard/SKILL.md`. It reuses the loop map and findings in
`assessment.md` (section 4 and section 6); finding ids are from there. Everything here is a plan. Nothing was placed,
and no trigger was exercised: both repositories were read-only snapshots, without git metadata. Placement depends on
open questions Q2 (which sessions) and Q3 (where the guard lives); it is drafted on the recommended answers.

## Placement

- **`session-coherence-guard`** (one guard covering both repositories):
  - **Trigger:** at the end of every session that committed to ORC or the lab (Q2). It runs after `pnpm test` and
    before the session's last commit. For ORC work in a pull request, it runs before the merge, the latest point where a
    stale document can still ride in the same pull request.
  - **Actor:** the agent that ran the session: Claude Code, or a Codex or opencode run through its brief.
  - **Entry point:** a one-line pointer in each repository's agent instructions, drafted below, and the same line in the
    briefs for Codex and opencode runs.
  - **Output:** fixes go in the session's own commit or pull request; proposals for Justin go in the lab's `decisions/`,
    marked as awaiting him; the next action goes in the lab's `STATE.md`, which the guard's last step overwrites.
  - **Escalation:** a gap too large for the session becomes an issue placed on the map, orchestrator#140, under Map A
    (#141, keeping the system healthy) or Map G (#167, how we work).
  - **Ordering:** after the mechanical checks (tests; Danger on the pull request), before the `STATE.md` overwrite and
    before the session's map marks are cleared with `node tools/map.mjs stopped <ref>`.

### The pointers, as they would be added (provisional on Q2 and Q3)

In the lab's `AGENTS.md`, at the end of "Keeping state":

> Before a session's last commit or handoff, run `skills/session-coherence-guard/SKILL.md`. Its last step overwrites
> `STATE.md`.

In ORC's `AGENTS.md`, after "The map of work":

> ## Before handing off
>
> Run the session-end guard in the orchestration lab,
> `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`, before a session's last commit or the
> merge of its pull request.

ORC's `AGENTS.md` is a guarded path, so this goes through a pull request with a `## Security review` section ("No new
authority; an instruction pointer"). The line names Justin's own Scope, so it is workshop material in `FRICTION.md`'s
sense: a fresh ORC installation would not have it. That is acceptable for an instruction file and keeps it out of
`src/`, which `test/core-ties.ts` ratchets.

## Depth of each check

- **External now, prompted by the instruction files.** Checks that need judgment stay in the guard: whether a document
  still describes the code, which of a description, the code and a test is wrong, whether a decision was recorded, and
  whether `STATE.md` is honest (F3, F5, F6).
- **Move to tooling as each becomes stable.** These checks are mechanical and belong to existing tools rather than to a
  guard:
  - `node tools/map.mjs --check` fails when `STATE.md` has no `**Where we are now:** #N` line. Today `whereWeAre()` in
    `tools/map.mjs` returns null silently (F15).
  - `friction()` in `tools/collect.mjs` accepts a heading with a qualifier after the date, such as
    `## 2026-09-21 night — …`. Today 3 of `FRICTION.md`'s 34 sections are missed (F15).
  - ORC's pull request template gains a `## Package API` section (F20).
  - The network scan in `test/architecture.test.ts` names Playwright's library, with `src/adapters/browser/playwright.ts`
    as an approved module (F7). This is a guarded change.
  - A test in ORC that every repository path named in `README.md`, `AGENTS.md` and `SECURITY-REVIEW.md` exists. It would
    have caught `src/bookwhen.ts` (F6). It belongs to the project's own test suite rather than a new tool.
- **Not automated:** the wording of `STATE.md`, of the README's direction, and of decisions. These still move weekly.

## Adoption

- **`session-coherence-guard`: planned, not adopted.**
  - **Its trigger has fired once:** no. Placing it needs commits to both repositories, which this run could not make.
  - **A fresh session finds it:** not tested. The test, once the pointers land: start a session with no context in
    each way agents load instructions here, and ask "What must you do before handing off?". The answer must name the
    guard's path. The ways to check:
    - Claude Code in the lab. `CLAUDE.md` is a link to `AGENTS.md` there, so the pointer is loaded.
    - Claude Code in ORC. The snapshot has no `CLAUDE.md` in ORC, so whether ORC's `AGENTS.md` is loaded at all is
      unknown (F23). This is the case most likely to fail.
    - A Codex session in ORC, which reads `AGENTS.md`.
    - An opencode run started from a standard brief.
  - **Where the evidence goes:** the date and each answer, in the pull request that adds the pointers, and one line in
    `STATE.md`.

## Plan

- **Now** (after Justin answers Q1 to Q3):
  - Place the guard at the lab's `skills/session-coherence-guard/SKILL.md` and add the two pointers.
  - Apply `patches/lab.diff` (F1, F3, F24) and `patches/orchestrator.diff` (F5, F6, F8). The second goes through a
    pull request with a Security review section.
  - Run the fresh-session test above.
- **Next:**
  - Add the guard line to the Codex and opencode briefs, beside the map-marking rule already planned for them
    (`STATE.md` map follow-ups).
  - Make the tooling changes listed under "Depth" for F7, F15 and F20.
  - Point the systemd unit's `Documentation=` (`scripts/orc-service.ts` line 41) at `README.md` rather than
    `OPERATOR.md`, before the root reports are retired (F9). This is a guarded change.
- **Later:**
  - Tests on every pull request (#144). When it lands, the guard drops `pnpm typecheck && pnpm test` from its commands.
  - A nightly run of the guard over the day's commits, through ORC's scheduling (#166). On 4 Oct Justin decided the
    scheduled processes run through it.
  - The cross-repository name checks: connector settings (orchestrator#198), and packages tested against ORC's real
    parts (#202). The guard's second check exists only until these do (F21).
  - The diary reads ORC's durable work through the running ORC rather than opening its SQLite file directly
    (`reports/2026-10-01-design-review.md` section 5; F22).
  - A link checker such as lychee, for both repositories' Markdown. Check it is installed before any guard depends on
    it; this run did not check.

## Uncertain

- Whether either repository's `.githooks/pre-push` is enabled. The snapshots have no git configuration. The hooks
  only print a summary and never block, so this does not change the guard's placement.
- Whether a user-level Claude Code hook, such as the night prompt in `~/.claude/settings.json` that `FRICTION.md`
  mentions on 27 Sep, already prompts at session end. It is outside the snapshots. A reminder there would sit in a
  vendor folder, so the instruction files stay the entry point.
- Whether GitHub branch protection exists on either repository. `SECURITY-REVIEW.md` says a failed check warns
  rather than blocks.
