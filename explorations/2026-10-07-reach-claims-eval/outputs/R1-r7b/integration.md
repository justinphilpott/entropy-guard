# Integration brief: the session-coherence guard for ORC and the orchestration-lab Scope

From `guards-integrator` 0.4.0, 2026-10-07. It places `guard/SKILL.md` in the real loop described in `assessment.md`
(section 6, Step 3) and refers to its findings by id. Nothing has been installed: the repositories are read-only
snapshots, Justin was not available, and the guard's location waits on Q1 and Q2 (`questions.md`). Every mechanism
below is therefore `planned` or `unknown`, except Danger, which has a recorded run.

## The loop as it is

- **Smallest unit of change:** a commit on a branch in an ORC worktree, or a commit in the lab; ORC work reaches
  `main` through a pull request that Claude merges once review and tests pass (Justin, 25 Sep).
- **Habitual pauses:** the end of an agent session; a compaction (lab `AGENTS.md:3-4` says to re-read `STATE.md`);
  the merge; the restart card Justin approves; the overnight window (work stays on branches after 22:00).
- **Where follow-up is lost:** between a decision taken in conversation and the next overwrite of `STATE.md` (F1,
  F11); between a merged change and the documents that describe it (F3 to F8, F13).
- **Mechanisms that exist:** Danger on ORC pull requests (`.github/workflows/danger.yml`, the only CI);
  `.githooks/pre-push` in both repositories, printing local-config's push summary and never blocking; ORC's pull
  request template, with a Security review section; instruction files: the lab's `AGENTS.md`, loaded through its
  `CLAUDE.md` symlink and by tools that read `AGENTS.md`, and ORC's `AGENTS.md`, with no `CLAUDE.md` beside it; the
  lab's `.claude/settings.json`, which enables two plugins and holds no hooks. No `.pre-commit-config.yaml` or
  `.husky/` in either.
- **Known pain:** state files that lied (`FRICTION.md` 2026-09-12, 09-22, 09-23), rules filed where nothing reads them
  (09-22), a committed hook in a sibling repository that never ran because `core.hooksPath` was never set (09-23), and
  a diary that stopped because nothing ran it (orchestrator#64, and again after 2 Oct: F14).

## Placement

- `session-coherence-guard`: **at the end of every work session on ORC or the lab, before the last commit or push**
  / **actor:** the agent that did the work (Claude, Codex, opencode), or Justin when he works by hand / **entry
  point:** "Before handing off" in the lab's `AGENTS.md`, and a pointer line in ORC's `AGENTS.md` (both in
  `patches/provisional.diff`, Q1) / **output:** the guard's report in the pull request description for ORC work,
  beside its Security review section, or in the commit message for lab work; the next action written into the lab's
  `STATE.md` / **escalation:** a gap too large for this change becomes a GitHub issue placed on the map under the branch
  it serves (orchestrator#140's rules), not a note in the guard / **ordering:** after the session's own tests, before
  the `STATE.md` rewrite is committed and before `node tools/map.mjs stopped` clears the session's mark, so the guard
  can check both; Danger then runs on the pull request.

**Cost against frequency.** The trigger fires a few times a day (several agents work in parallel, and `FRICTION.md`
records most days). One run costs the git block in each repository touched (seconds), ORC's `pnpm typecheck` and
`pnpm test` when ORC changed (the diary's full run of ORC's and Moving Stillness's suites takes about two minutes,
`tools/report.mjs:9-10`), one grep (under a second on the snapshot), and reading time for the judgment checks. That
fits a session end. It does not fit every commit, so the trigger is not pre-commit.

## Depth of each check

- **External now:** the whole guard is a skill run by hand.
- **Prompted next:** a one-line reminder in both `.githooks/pre-push` files ("Ending a session? Run the
  session-coherence guard: ~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md"). It is
  vendor-neutral, unlike a Claude Code hook in `.claude/`, which would put workflow logic in a vendor folder. It only
  helps where `core.hooksPath` is set, which is unknown here.
- **Semi-embedded later,** moving stable mechanics out of the guard:
  - the state-file size: a line count against the number in `AGENTS.md`, once Q3 is answered, printed by the diary
    or warned by the lab's pre-push hook (F11, F12);
  - reach: the architecture-test extension in `patches/provisional.diff` (Q4) catches DNS imports and browser
    launches; ast-grep or Semgrep for calls made through libraries, once installed (neither is, checked 2026-10-07)
    (F5, F6);
  - tests on every pull request (orchestrator#144) (F10);
  - `node tools/map.mjs --check` and the diary, run through ORC's scheduling (orchestrator#166) (F14);
  - a link checker such as lychee (not installed) over both repositories' Markdown, after the root reports are dealt
    with, so it does not report dead paths in history (F15).
- **Kept as judgment:** whether a decision was recorded where it belongs, whether a live fact was re-read, whether
  superseded material was revived, and whether a document still describes changed code. These depend on wording that
  moves weekly.

## Adoption

- `session-coherence-guard`: executed check; **planned**. Not installed; it has never run at its trigger. Evidence
  needed: one completed guard report from a real session end, for example in the next ORC pull request's description.
- Lab `AGENTS.md` "Before handing off": reminder through an instruction file; **planned** (Q1).
- ORC `AGENTS.md` pointer: reminder through an instruction file; **planned** (Q1).
- `.githooks/pre-push` reminder line: reminder; **planned**. Configuration evidence is **unknown**: the snapshots have
  no `.git`, so whether `core.hooksPath` points at `.githooks/` cannot be read, and that would still not show the hook
  firing.
- Danger security-review and package-API checks: executed check (a failed check warns and does not block a merge
  without GitHub Pro, so it is not an enforced invariant); **verified, by record**: `STATE.md:79-81` records a pass, a
  fail with the section removed, and a pass again on orchestrator #179, 2026-10-02. Not re-observed in this run.
- Tests on every pull request (orchestrator#144): executed check; **planned**, decided on 4 Oct, mechanism open.
- "Guarded changes go through a pull request" (F9): would be an enforced invariant; **planned**, with no mechanism
  chosen. Verified only when a direct push to `main` touching a guarded path is refused.

**Fresh-session test, still to do.** Once installed, ask a session with no context "what must you do before handing
off?" in each way agents load instructions here: Claude Code in the lab (through `CLAUDE.md`), Claude Code in an ORC
worktree, and Codex or opencode in each. Record which named the guard and its path, with the date.

## Plan

- **Now:**
  - Justin answers Q1 to Q5 (`questions.md`).
  - Apply `patches/settled.diff`: the lab's parts as a commit; ORC's `AGENTS.md` and `SECURITY-REVIEW.md` changes
    through a pull request with a Security review section ("No new authority; documentation"), since both are
    guarded paths (F1, F3, F4, F5, F8, F11, F13).
  - After the answers, apply `patches/provisional.diff` and copy `guard/SKILL.md` to the lab's
    `skills/session-coherence-guard/SKILL.md` (F18), then run it at the end of the next session and keep the report.
  - The ORC code fix for the restart card's child environment (F7), as its own pull request.
- **Next:** the pre-push reminder line in both repositories; check `git config core.hooksPath` in each clone and
  record it; run the fresh-session test above.
- **Later:** the semi-embedded checks listed under "Depth", each attached to its existing issue (#144, #166) rather
  than a parallel project; the root-report cleanup through target 4 of `reports/2026-10-01-design-review.md` (F15);
  a mechanism for F9, once Justin chooses where it sits.

## Uncertain

- Whether Claude Code sessions in ORC load ORC's `AGENTS.md`. ORC has no `CLAUDE.md`, while the lab has a `CLAUDE.md`
  symlink to its `AGENTS.md`. If they do not, the ORC pointer reaches Codex, opencode and Pi sessions only, and Claude
  sessions in ORC meet the guard only through the lab's `STATE.md` or the user-wide rules. Adding a `CLAUDE.md`
  symlink in ORC would be a structural change for Justin to approve. Not checked.
- Whether any tool loads the lab's `skills/` folder by itself. The lab's `reports/2026-09-30-skills-one-home.md` says
  tools read `~/.agents/skills` and Claude Code `~/.claude/skills`, and a Scope's `skills/` is reached by a pointer;
  the pointer in `AGENTS.md` counts. Not checked with a session.
- Whether either `.githooks/pre-push` is enabled. Not readable from the snapshots.
- Whether the guard's ORC commands (`pnpm typecheck && pnpm test`) pass on a current checkout: not run here.
