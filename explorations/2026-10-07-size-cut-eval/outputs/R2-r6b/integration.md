# Integration brief: the entropy-guard local guard

From `guards-integrator`, after `session-coherence-skill-generator` updated the guard (decision `update`). Target:
entropy-guard snapshot `entropy-guard-447da9a`, read-only, no `.git`. Written 2026-10-07. Finding ids (F1–F18) refer
to `assessment.md`; the loop as it is appears there under "Loop map" and is not repeated here.

The guard: `guard/SKILL.md`, installed in place at `skills/local/entropy-guard/SKILL.md` by `patches/settled.diff`.
It stays the repo's one combined session-end guard (`DECISIONS.md` "Keep a single local guard..."), at the same path
and name, so every existing pointer to it still holds.

## Placement

- `entropy-guard` (`skills/local/entropy-guard/SKILL.md`):
  - **Trigger:** end of a meaningful work session, before the commit that closes it. That is where `AGENTS.md`
    "Working Practices" (first bullet) and `.githooks/pre-commit` already place it, and it is the last moment the
    session's own context is available to judge decisions, learnings and workflow changes. Trivial changes skip it, as
    `AGENTS.md` already says.
  - **Actor:** whoever did the session's work, human or agent.
  - **Entry point:** `AGENTS.md` "Working Practices" names the path; `AGENTS.md` "Key Files" lists it; the hook prints
    the path at commit time (`.githooks/pre-commit:4`); `README.md` "Contributing" step 3 links it.
  - **Output:** the guard's report, summarised in the commit message, or "entropy check clean" (`README.md`
    "Contributing" step 4, now also a guard check); the next action written into `TODO.md`.
  - **Escalation:** a gap too large for the current change goes to `TODO.md` "Next Up" or "Backlog"; a change of
    intent goes to `DECISIONS.md` as a proposal for Justin Philpott (guard "Intent" section).
  - **Ordering:** after the work and before the commit message is derived from `TODO.md` "Doing Now" (`AGENTS.md`
    "TODO.md as live context"), so the message can carry the guard's result; then "Doing Now" is cleared, then commit,
    when the hook's reminder fires. One guard, so nothing runs in parallel.
  - **Cost against frequency:** the guard is 1,175 words to read, 11 checks most of which end at "no", plus three
    commands that run in seconds. That fits the "2–5 minutes" the repo budgets (`AGENTS.md` "Working Practices") at a
    once-per-session trigger. No move needed.

## Depth of each check

- **Kept as judgment (External, prompted by the hook):** intent fit, skill contracts, decision and learning capture,
  one home per concept, supersession, workflow agreement, `TODO.md` honesty, the issue-URL and commit-message checks.
  These depend on wording that is still moving (findings F5, F7, F9), so automating them would encode churn.
- **Commands inside the guard (External, run by hand):** whitespace (`git diff --check` and `--cached --check`), a
  grep per old name, and the relative-link check. These are stable invariants (`docs-first-planning-assessment`
  "Brittle automation").
- **Not automated:** nothing checks wording, section names or skill structure; that is deliberate.

## Adoption

Status of each mechanism, with configuration evidence kept apart from execution evidence:

- `.githooks/pre-commit` reminder:
  - **what it is:** a reminder (prints three lines, `exit 0`, `.githooks/pre-commit:3-9`);
  - **status:** `unknown`;
  - **evidence:** the tracked file exists and its text names the guard path and `TODO.md` "Doing Now" correctly (read
    2026-10-07). Whether any clone links it into `.git/hooks/pre-commit` or sets `core.hooksPath` could not be read:
    the snapshot has no `.git`. A committed hook that is not enabled does not run (F13);
  - **date:** 2026-10-07.
- `entropy-guard` guard, as rewritten:
  - **what it is:** an executed check;
  - **status:** `planned`;
  - **evidence:** none at its trigger. The target is read-only and no commit was authorised, so it has not run at a
    session end. Its link-check command was run on 2026-10-07 on a scratch git copy of the patched repo: zero broken
    links, and it caught a link planted to fail (`AGENTS.md: broken link TODO-old.md`). That shows the command works,
    not that the guard has run;
  - **date:** 2026-10-07.
- Discovery by a fresh agent session:
  - **what it is:** a reminder through standing instructions;
  - **status:** `planned`;
  - **evidence:** configuration only: `AGENTS.md` names the guard path in "Working Practices" and "Key Files", and the
    hook text names it. No fresh session was asked: this run could not start one that carried none of its own
    context, so a result from here would not count;
  - **date:** 2026-10-07.
- Commit-message note ("entropy check clean" or what was found):
  - **what it is:** a reminder (a convention in `README.md` "Contributing", now a guard check);
  - **status:** `unknown`;
  - **evidence:** no commit history in the snapshot, so whether past commits carry the note could not be read;
  - **date:** 2026-10-07.

The guard counts as adopted only when it has run once at its trigger, shown by a completed report, and a fresh agent
session finds it. Neither has happened yet.

## Plan

- **Now** (with what exists):
  1. Apply `patches/settled.diff`. Leave the three `patches/provisional-q*.diff` until Justin answers Q1–Q3
     (`questions.md`).
  2. In the working clone, read whether the hook is enabled: `git config core.hooksPath`, else
     `ls -l .git/hooks/pre-commit`. Report it as configuration evidence only (F13).
  3. At the next real session end, run the guard and keep its summary in that commit's message. That is the first
     execution evidence.
  4. Start a session with no context in the repo and ask what it must do before handing off. It counts when it names
     `skills/local/entropy-guard/SKILL.md`.
- **Next** (only if step 2 finds the hook not enabled in clones that commit here): change the enabling instruction in
  `AGENTS.md` and `README.md` "Contributing" to one command per clone that keeps working when more hooks are added to
  `.githooks/` (`git config core.hooksPath .githooks`), and keep the hook non-blocking (`DECISIONS.md` "Guard adoption
  should usually mature from external to prompted...").
- **Later:** once the link check has run at a few session ends without false positives, move it into the pre-commit
  hook as a non-blocking warning. The repo has no CI; if CI is added, the link check belongs there instead. The guard
  runner in `TODO.md` "Backlog" stays separate and is not needed for one guard.

## Uncertain

- Whether agents working here load `skills/` automatically, or only through the `AGENTS.md` pointer: not checked.
- Whether "non-negotiable" in `AGENTS.md` "Working Practices" is meant as a hard rule. Nothing enforces it (F13); this
  brief keeps the guard prompted, not blocking, following the recorded maturity decision. If Justin wants it enforced,
  the place is a commit-message check, which would need his decision.
- The real loop (how often the guard is run, what commit messages say) could not be observed without history.

## Feedback on entropy-guard

See `feedback.md`.
