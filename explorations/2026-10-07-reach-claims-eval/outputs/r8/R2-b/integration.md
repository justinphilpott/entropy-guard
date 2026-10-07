# Integration brief: the `entropy-guard` session guard

This applies `guards-integrator` to `guard/SKILL.md`. It reuses the loop map and findings in `assessment.md` §5 and §3
(finding ids F1–F12). The guard is a single guard, and it is not yet installed: the target is a read-only snapshot,
and installing the guard is provisional on Q1.

## Placement

`entropy-guard`, at `skills/local/entropy-guard/SKILL.md`, replaced in place by `guard/SKILL.md`:
- **Trigger:** the end of a meaningful work session, after the last edit and before `git commit`. A trivial change
  may skip it (AGENTS.md:19).
- **Actor:** the agent or person who did the session.
- **Entry point:** AGENTS.md "Run entropy-guard before committing" (line 19). The reminder printed by
  `.githooks/pre-commit` in clones that link it.
- **Output:**
  - a one-line result in the commit message (README.md "Contributing", line 138);
  - proposals for the steward in DECISIONS.md;
  - the next action in TODO.md.
- **Escalation:** a gap too large for the current change goes to TODO.md Next Up or Backlog.
- **Ordering:** the only guard, so there is nothing to order it against.
- **Cost against frequency:** about 1,240 words to read, 12 checks of which most are "no" for a given session, and four
  commands that run in under a second on this repo. The trigger is once per meaningful commit. The old guard's stated
  2–5 minutes still fits that cadence.
- **Depth:**
  - External: the guard itself.
  - Prompted: the hook reminder, and the standing instruction in AGENTS.md.
  - Semi-embedded candidates: the frontmatter-name and broken-link commands. They test stable invariants, not volatile
    wording.

## Adoption

| Mechanism | Kind | Status | Evidence | Date |
|---|---|---|---|---|
| `.githooks/pre-commit` | reminder | **unknown** | The file exists, is executable, prints the reminder and exits 0. Enabling it is documented (README.md:140, AGENTS.md:19). The snapshot has no `.git`, so neither `core.hooksPath` nor `.git/hooks/pre-commit` can be read, and it has not been seen to fire. LEARNINGS.md:22 claims it helped, undated. | 2026-10-07 |
| current guard (`skills/local/entropy-guard/SKILL.md` v0.2.3) | executed check | **unknown** | No commit history in which to find a guard result line (README.md:138). | 2026-10-07 |
| updated guard (`guard/SKILL.md`) | executed check | **planned** | Not installed: the target is read-only, and installing it is provisional on Q1. | 2026-10-07 |
| the guard's four commands | executed checks (of the commands, not of adoption) | **verified** | On a scratch git checkout of the patched snapshot: clean under sh, bash and zsh, with 48 links scanned. Broken on purpose, each fired: a renamed `name:`, two broken links, trailing whitespace. | 2026-10-07 |
| a fresh agent session finds the guard | discoverability | **planned** | Configuration evidence only: AGENTS.md:19 names the guard's path under "Working Practices". No fresh session was asked. | 2026-10-07 |

## Plan

**Now:**
- Apply `patches/settled.patch` (F3, F6–F9, F11, F12, and the TODO.md state). It touches no open question.
- Answer Q1–Q4.
- After Q1, copy `guard/SKILL.md` to `skills/local/entropy-guard/SKILL.md`. After Q4, replace its "Steward:
  unresolved" line, then apply the matching hunks of `patches/provisional.patch`.
- **Your choice:** you may install the guard before answering Q1. Its intent-change rule defers to whatever you
  record. Until then it stops agents editing INTENT.md without a recorded decision, which is what the recommended
  answer would do anyway.
- **Verify adoption in a working clone:**
  1. Link the hook (README.md:140), make a scratch commit, and see the reminder print.
  2. Run the guard once at the next meaningful session end, and check its result line in that commit's message.
  3. Ask a session with no context: "what must you do before handing off in this repo?" It should name
     `skills/local/entropy-guard/SKILL.md`.
- **Optional, one line:** AGENTS.md:22 "derive your commit message from those items" could add "and the guard's result
  line". That would put the guard in the task's completion criteria as well as the standing instructions.

**Next:**
- Add the guard's frontmatter-name and broken-link commands to `.githooks/pre-commit` as non-blocking warnings (still
  `exit 0`). They catch the class of drift in F8, F9 and F12 without anyone remembering, and both test stable
  invariants.
- Keep the judgment checks in the guard.

**Later:**
- Move those two checks into CI once the repo has CI; it has none today.
- Discovering and running several guards belongs to the existing Backlog item "Design a guard runner concept"
  (TODO.md:18), not to new parallel work.

## Uncertain

- Whether agents working here load `skills/` automatically: not checked. AGENTS.md:19's pointer is what counts.
- Whether any clone has the hook enabled, or whether the current guard is actually run: this cannot be seen without
  `.git` and a commit log.
- GitHub issues on `justinphilpott/entropy-guard` may already track some of this. They were not read, because no web
  access was allowed.

## Feedback on entropy-guard

Upstream notes from this run are in `feedback.md`.
