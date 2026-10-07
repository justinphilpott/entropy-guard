# Integration brief: entropy-guard's local guard

From `guards-integrator`, for the refined guard in `guard/SKILL.md`, which is meant to replace
`skills/local/entropy-guard/SKILL.md` in the target. Findings (F..) and questions (Q..) refer to `assessment.md` and
`questions.md`. The run was in plan mode, because the target is read-only.

## Loop map

- **Change starts in:** a human or agent session in a local clone. `AGENTS.md` is read first and leads to
  `TODO.md`. The task goes under "Doing Now" (`AGENTS.md:22`).
- **Work:** skills and core documents, updated in the same change (`AGENTS.md:23,32`).
- **Pause:** the contributor runs `skills/local/entropy-guard/SKILL.md` before committing (`AGENTS.md:19`).
  `.githooks/pre-commit` prints a reminder, but only in clones that enabled it (F11).
- **First handoff:** the local commit, which carries "entropy check clean" or what was updated (`README.md:138`).
- **Second handoff:** a GitHub pull request, sometimes (`LEARNINGS.md:152`). How often is unknown.
- **Automated gate:** none. There is no CI and there are no tests.
- **Upstream:** GitHub issues filed through `skills/local/entropy-guard-feedback`.
- **Real practice is unknown:** the snapshot has no git history.

## Guard placement

**`entropy-guard`, the refined guard:**

- **Trigger:** the end of a meaningful session, before the commit. This is the one stable handoff point
  (`DECISIONS.md:55-59`).
- **Actor:** the contributor making the commit, human or agent.
- **Entry point:** the instruction at `AGENTS.md:19`, the reminder hook and `README.md` "Contributing". All three
  name the guard's path, and the path does not change.
- **Output:**
  - one line in the commit message;
  - updates to `TODO.md`, `DECISIONS.md` and `LEARNINGS.md`;
  - proposals for the steward under "Proposed — awaiting Justin Philpott" in `DECISIONS.md`.
- **Escalation:** a gap too big for the session goes to `TODO.md` "Backlog" for a follow-up commit. A change of
  intent goes to `DECISIONS.md` as a proposal, and the work that depends on it waits.
- **Burden:** 2 to 5 minutes is the target (`AGENTS.md:19`). The checks are mixed: judgment checks, plus 4
  mechanical commands that run in seconds.

## Adoption plan

- **Now:**
  1. Answer Q1, then replace `skills/local/entropy-guard/SKILL.md` with `guard/SKILL.md`, and delete its draft
     header comment.
  2. Apply `patches/01` to `04`, after checking them against the answers to Q2 and Q3.
  3. In each working clone, enable the reminder hook as `README.md:140` describes.
- **Next:** move the 3 durable mechanical checks out of the guard into one script inside `.githooks/`. The checks
  are links, skill frontmatter and whitespace. Call the script from the pre-commit hook as warnings only (still
  `exit 0`), and from the guard's "Mechanical checks" section. Keep one copy of the commands, not two.
  - When: once a broken link or a frontmatter mismatch reaches a commit, or once runs of the guard are seen being
    skipped.
- **Later:** none justified now. The repo has no CI, and the guards-integrator's "Later" horizon means existing CI.
  If pull requests become the main gate, add a link checker such as lychee, plus the frontmatter check, as a PR
  workflow.

## Adoption status

| Guard or surface | What it is | Status | What was exercised, and when |
|---|---|---|---|
| Refined `entropy-guard` | A reminder (instruction plus hook), plus a check that runs when the guard is run | **planned** | Not installed: the target is read-only, and the guard is provisional on Q1. |
| The guard's "What changed" and mechanical commands | A check that runs, when the guard is run | **verified** in scratch copies, 2026-10-07 | Run as written under `sh` and `bash`. They caught a planted broken link, a mismatched `name`, a missing `description` and trailing whitespace. They reported nothing on the patched snapshot. Without a start point they printed "coverage incomplete". |
| `.githooks/pre-commit` reminder | A reminder | Script: **verified** in a scratch copy, 2026-10-07. Real clones: **unknown**. | With `core.hooksPath=.githooks`, a scratch commit printed the reminder and still landed (exit 0). The snapshot has no `.git`, so whether any real clone enables the hook, by symlink or by `core.hooksPath`, cannot be read. The hook is executable in the snapshot (`-r-xr-xr-x`). |
| A fresh session finding the guard | Discovery | **planned** | Not exercised. A clean session could not be started in the target: it is read-only, and this environment preloads other instruction files. On paper, `AGENTS.md:19`, `README.md:137` and the hook's message all name `skills/local/entropy-guard/SKILL.md`. `AGENTS.md` is the only agent instruction file. Whether contributors' agent tools load `AGENTS.md` is unknown. |
| Enforced invariant | None | Not applicable | Nothing refuses a commit, by design (`DECISIONS.md:31-35`). `AGENTS.md:19`'s "non-negotiable" describes a practice, not a mechanism (F11). |

## Discovery plan

- Keep the existing pointers: `AGENTS.md:19`, `README.md` "Contributing" and the hook's message.
- The `TODO.md` current-state section (patch 01) names the guard as the thing that refreshes it, so a session that
  reads `TODO.md` first also meets the guard.
- If contributors use an agent tool that loads a different instruction file, add one line there pointing to
  `AGENTS.md`. Do not copy its contents.
- The check: after installing the guard, start a fresh session in a clone and ask "what must you do before
  committing?" It should name `skills/local/entropy-guard/SKILL.md`. Record the result as execution evidence.

## Execution plan

- **Order:**
  1. "What changed this session".
  2. Mechanical checks.
  3. Judgment checks 1 to 9, and the drift mappings.
  4. Repairs.
  5. Report.
- **Parallel:** none needed. There is one guard.
- **Outputs:**
  - the commit-message line;
  - updates to `TODO.md` and `DECISIONS.md`;
  - the first next action, written into `TODO.md`.

## Automation opportunities

- **Durable invariants, suited to tooling** (the Next step above):
  - relative links resolve;
  - every skill's `name` matches its folder, and it has a `description` (`DECISIONS.md:79-83`);
  - `git diff --check`.

  A maintained link checker such as lychee can replace the shell link check once there is CI.
- **Kept as judgment**, because each depends on wording or on skill structure that is still moving (Q2):
  - canonical home;
  - supersession;
  - contracts between the skills;
  - fit with intent;
  - honest state.
- A linter for agent instruction files, such as ctxlint or agnix, could check `AGENTS.md`. It is not needed until
  the instruction files multiply.

## Risks and uncertainties

- **The guard is longer:** 202 lines against 139. If runs start to be skipped or rushed, trim the drift mappings
  first. Re-check after 3 to 5 real runs.
- **Steward assumed.** The guard names Justin Philpott provisionally (Q1).
- **Real loop assumed.** It was inferred from the documents, not from history. In particular, commit is assumed to
  be the main handoff, not the pull request.
- **Guard-writing route unresolved.** If Q2 is answered (a) or (c), this refined guard is still valid as the repo's
  local guard. Only the description of how it was generated would change.

## Upstream feedback on entropy-guard

Yes, see `feedback.md`. One point is about integration: route A never sorts the guard surfaces by whether they
execute, so the hook's "unknown" status first came up here. The other is about the generator. Neither was filed;
this run has no network access.
