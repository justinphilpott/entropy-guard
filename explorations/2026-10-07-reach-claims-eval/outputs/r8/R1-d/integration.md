# Integration brief: the session coherence guard for ORC and the Orchestration Lab

From `guards-integrator` (v0.4.0), 2026-10-07. It reuses the loop map and findings in `assessment.md` (ids F1 to F20)
and places one guard, `guard/SKILL.md`. "ORC" is `~/pro/orchestrator`; "the lab" is `~/scopes/scope-orchestration-lab`.

**The loop as it is** (`assessment.md`, Step 3).
- **The smallest unit of change** is one GitHub issue on the map (orchestrator#140), worked in an ORC worktree or in
  the lab, and merged as a pull request after an Astra review where complexity calls for one.
- **The habitual pauses:**
  - a verified event, when `STATE.md` is overwritten;
  - opening a pull request, when Danger runs;
  - a merge followed by Justin's restart card;
  - the end of a night run.
- **Where follow-up is lost:**
  - `STATE.md` contradicts itself (F7);
  - decisions stay in an overwritten file (F8);
  - the diary skips days (F11);
  - nothing runs at session end (F19).

## Placement

- **`session-coherence-guard`.** Its home is the lab's `skills/session-coherence-guard/SKILL.md`, which waits on
  question P4.
  - **Trigger:** at the end of every work session on ORC or the lab, before its last commit and before it opens a pull
    request or hands off to Justin or another agent. A session whose only change was live, such as an approved restart
    or a grant, runs it too: the guard reads those live changes with the time. Earlier is too soon to see the whole
    change. After the pull request, Danger and the Astra review have already started on an incoherent change.
  - **Actor:** the agent that did the work (Claude Code, Codex or opencode), or Justin. Astra's read-only reviews do
    not run it.
  - **Entry point:** a "Before handing off" section in the lab's `AGENTS.md`, which Claude Code loads through
    `CLAUDE.md`, and one in ORC's `AGENTS.md` giving the guard's absolute path, so a worktree under `/tmp` finds it
    (`patches/provisional-P4-*.patch`).
  - **Output:**
    - the report goes in the pull request's description when there is one, otherwise in the commit message of the
      lab commit that rewrites `STATE.md`;
    - proposals for Justin go to the lab's `decisions/`;
    - the next action goes into `STATE.md`.
  - **Escalation:**
    - a gap too large for the session becomes an issue on the map (orchestrator#140);
    - a change of intent becomes a proposal in `decisions/`;
    - a reach no decision covers is never added to ORC's lists (F1, F2).
  - **Ordering:** after ORC's tests, which the guard's command block runs because CI does not (F5). Before Danger and
    any Astra review, so they review a coherent change. Independent of the pre-push summary hook.
  - **Cost:** reading the session's diff and the named files takes a few minutes. `pnpm typecheck && pnpm test` in ORC
    runs only when ORC changed. Its time is not measured here: the diary's run of both repositories' suites is
    recorded as about two minutes (`tools/report.mjs` header). Once per session, a few sessions a day, that fits the
    loop. `pnpm test:e2e` runs only when the web client or the durable-work surface changed.

## Depth of each check

- **Judgment, kept in the guard:**
  - fit with authorised intent;
  - whether docs and module headers still describe changed code;
  - whether a new reach is decided;
  - the honesty of the state file;
  - whether decisions were recorded;
  - superseded material.
- **Mechanical, belonging in tooling:**
  - reach detection in `test/architecture.test.ts` (the settled patch adds library and DNS confinement, F4);
  - tests on every pull request (orchestrator#144, F5);
  - the map's coverage and its failed reads (F10);
  - the `STATE.md` line count (F6);
  - the connector-name test across ORC and packages (#198, F14);
  - Markdown links.

  The guard runs some of these by hand until they move. Wording and paths still moving, such as the `STATE.md`
  sections, stay judgment.

## Adoption

Nothing below has run at its trigger. The targets are read-only snapshots, and giving advice authorises no commit.

- **`session-coherence-guard`:** executed check; `planned`. It is verified when a completed guard report sits in a
  pull request description or a lab commit message, from a real session end. 2026-10-07.
- **"Before handing off" pointers in both `AGENTS.md` files:** reminder; `planned`, waiting on P4. They are verified
  when a fresh session in each repository, asked "what must you do before handing off?", names the guard and its
  path. Check each way agents load instructions here:
  - Claude Code in the lab, through `CLAUDE.md`;
  - Claude Code in ORC, which has no `CLAUDE.md` link;
  - Codex and opencode, which read `AGENTS.md`.

  2026-10-07.
- **The architecture test's browser and DNS confinement:** enforced invariant; `planned`. It is verified when a
  permitted failing case is refused: add `import { chromium } from "playwright"` to another module under `src/` and
  see `pnpm test` fail. Only its regular expressions and syntax were checked (`assessment.md`, section 10).
  2026-10-07.
- **Danger's Security review and Package API rules:** enforced invariant on pull requests; `verified` as recorded,
  not re-observed. `STATE.md` 79–81 records pass, fail with the section removed, and pass restored on GitHub,
  2026-10-02. It warns rather than blocks, and misses direct pushes (F5).
- **Pre-push summary hooks in both repositories:** reminder of branch state, not a guard; `unknown`. The snapshot has
  no git configuration to show `core.hooksPath` (F18). This is configuration evidence only; seeing the hook fire would
  verify it.

## Plan

- **Now:**
  - Apply the settled patches. ORC's goes through a pull request with a `## Security review` section, because it
    touches `AGENTS.md`, `SECURITY-REVIEW.md` and `test/architecture.test.ts` (F1–F4, F15–F17). The lab's is a commit
    (F6–F11).
  - When Justin answers P4, install the guard and both pointers.
  - Run the guard at the next session end, and record its report.
  - Ask a fresh session in each repository what it must do before handing off (F19).
- **Next:**
  - Add a "Session guard" line to ORC's `.github/pull_request_template.md`, so the report has a place at pull-request
    time.
  - Check `git config core.hooksPath` in both clones (F18).
  - For orchestrator#144, already on Justin's list: the recommendation is a GitHub Actions job running
    `pnpm typecheck && pnpm test` beside the Danger job, rather than a pre-push hook. A hook needs enabling in every
    clone and worktree. A committed hook is on record as never having run (`FRICTION.md`, 23 Sep). A hook's result is
    invisible to whoever merges, and Danger already runs on every pull request. Once the job exists, the guard's
    `pnpm test` line becomes "read the CI result".
- **Later:**
  - When ORC scheduling (orchestrator#166) runs the daily diary, `tools/report.mjs` can print `STATE.md`'s content
    lines against the cap in `AGENTS.md` (F6), and its snapshot should keep the day's test count (F11).
  - Fix the map check's coverage and failed reads through the labels review's follow-up
    (`reports/2026-10-04-labels-review-astra.md`, F10).
  - Read ORC's state directory from one shared place (orchestrator#62, F12).
  - Test connector names across ORC and packages (orchestrator#198, F14).
  - Add a link checker such as lychee to the CI job, once it is installed.

## Uncertain

- Whether Claude Code in ORC loads `AGENTS.md` without a `CLAUDE.md` link: not checked. The lab's link suggests it
  needs one. If it does not load it, the pointer in ORC's `AGENTS.md` reaches only Codex and opencode until a link is
  added.
- Whether either clone sets `core.hooksPath`: not checked (F18).
- How long `pnpm test` takes on its own: not measured.
- Whether GitHub Actions minutes or GitHub Pro would cost money: not checked. local-config holds a rule that spending
  goes through ORC's permissions (lab `reports/2026-10-03-branch-cleanup.md` 46); that rule was not read.
