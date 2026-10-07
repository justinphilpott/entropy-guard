# Integration brief: the ORC and lab session-coherence guard

From `guards-integrator` v0.4.0, run 2026-10-07. Finding ids (F1–F20), work items (W1–W5) and questions (Q1–Q5)
refer to `assessment.md` and `questions.md`. The guard is `guard/SKILL.md`. Its proposed home is the lab's
`skills/session-coherence-guard/SKILL.md`, which depends on Q1.

## The loop as it is

- **Smallest unit of change:** a branch and pull request in ORC, or a direct commit in the lab. One session often
  touches both, plus `STATE.md`.
- **Habitual pauses:**
  - opening a pull request, where Danger asks for a `## Security review` section;
  - Claude merging after review and tests;
  - Justin approving the restart card;
  - the `STATE.md` overwrite at each verified event.
- **Where follow-up gets lost:**
  - decisions left in `STATE.md` (F1, F2);
  - live facts that are never re-read (F17);
  - ORC paths that the lab's tools hard-code (F15);
  - reach claims nobody re-checks after a new capability (F5, F7–F13).

## Placement

- `session-coherence-guard`:
  - **Trigger:** at the end of any session that changed ORC or the lab. In ORC, it runs after
    `pnpm typecheck && pnpm test` and before the pull request description is finished. Pre-commit is too early for
    ORC, because a session's reach change usually spans several commits.
  - **Actor:** the coding agent on the session (Claude Code, Codex, opencode or Pi), or Justin when he works by hand.
  - **Entry point:** the lab `AGENTS.md`'s "Before handing off" section, and a two-line pointer in ORC's `AGENTS.md`
    (provisional patches, Q1).
  - **Output:**
    - in ORC, the report goes in the pull request description under `## Coherence`, beside `## Security review`;
    - in the lab, it goes in the commit message;
    - in both, the next action goes into the lab `STATE.md`.
  - **Escalation:** a gap too large for the change becomes an issue on the map (orchestrator#140), under A (#141)
    for health or G (#167) for how work is done. It is never tracked in the guard.
  - **Ordering:** after the tests, before the Security review section, and before any Astra review.
  - **Cost:** reading the session's diff, one `grep` and the tests the merge rule already needs. A few minutes, on a
    trigger that fires a few times a day. It fits.

## Depth of each check

- **External now:** all the guard's judgement checks.
- **Prompted now:** the `AGENTS.md` pointers.
- **Semi-embedded later, as tools and not guard text:**
  - delegated launches in `test/architecture.test.ts` (W2, F13);
  - the whole of Danger's `GUARDED` list (W3, F14);
  - a `STATE.md` content-line count in the lab's pre-push hook (F16);
  - a link checker such as lychee, and ast-grep for identifiers named in prose (F7).

## Adoption

Nothing below was observed running in this run. The targets are read-only snapshots, and no commit or push was made.

- `session-coherence-guard`: executed check; **planned**. No guard report exists yet. 2026-10-07.
- Lab `AGENTS.md` "Before handing off": reminder; **planned** (provisional patch, Q1). 2026-10-07.
- ORC `AGENTS.md` pointer: reminder; **planned** (provisional patch, Q1). 2026-10-07.
- Danger's Security review and Package API checks: executed check on GitHub; **unknown in this run**. Lab
  `STATE.md` L79-81 records them proven on 2 Oct (pass, fail, pass restored). That is a recorded result; it was not
  re-observed here.
- `.githooks/pre-push` in both repositories: reminder (prints only); **unknown**. A snapshot without `.git` cannot
  show `core.hooksPath` (F20).
- The architecture and ratchet tests: enforced invariant, run by hand; **unknown in this run**. They were not run:
  there is no `node_modules`.

## Plan

- **Now:**
  - apply the two settled patches (F1, F4, F7–F9, F11, F16–F18);
  - answer Q1–Q5, then apply the provisional patches;
  - run the guard at the end of the next real session and keep its report.
  - Adoption counts only after that run, plus a fresh session in each repository that names the guard when asked
    what it must do before handing off.
- **Next:**
  - Find out whether a fresh Claude Code session in ORC loads `AGENTS.md`. ORC has no `CLAUDE.md`; the lab links
    one to `AGENTS.md` (F20). If it does not, the same link in ORC is the smallest fix. It adds a file, so it needs
    Justin's say-so.
  - Add a `## Coherence` heading to `.github/pull_request_template.md`. That path is guarded, so its pull request
    needs a Security review section ("No new authority").
  - Fix W1 (#155) and W3 (#145).
- **Later:**
  - W2 in the architecture tests;
  - lychee and ast-grep, once checked to be installed;
  - tests on every pull request (#144);
  - the diary, reviews and FRICTION-into-rules running through ORC's scheduling once it exists (#166, W5). They are
    linked there rather than started in parallel.

## Uncertain

- Whether either `.githooks/` folder is the effective hooks path (F20).
- Whether Claude Code loads ORC's `AGENTS.md` without a `CLAUDE.md`.
- Whether lychee or ast-grep is installed on athena.
- Whether Justin wants guard reports in the pull request description, or somewhere else.
