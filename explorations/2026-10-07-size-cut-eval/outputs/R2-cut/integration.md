# Integration brief: the refined `entropy-guard`

Produced by `guards-integrator` v0.4.0 on 2026-10-07. It reuses the loop map and the findings (F-ids) in
`assessment.md`.

The loop as it is: the smallest unit of change is one human or agent work session. That session ends in a commit,
which merges by pull request. There is no CI. "Doing Now" in `TODO.md` is written at the start and cleared at the end.
Follow-up gets lost in three places: GitHub issues that `TODO.md` does not link (F12), revisions to `INTENT.md` that
record no author (F3), and superseded entries left unmarked (F6, F8).

## Placement

- **`entropy-guard`** (`skills/local/entropy-guard/SKILL.md`, replaced by `guard/SKILL.md`):
  - **Trigger:** after the session's last content change, before the commit that ends a meaningful session, and so
    before the pull request.
  - **Actor:** the contributor who did the work, a person or an agent.
  - **Entry points:**
    - `AGENTS.md` Working Practices, "Run entropy-guard before committing", which already gives this path;
    - the `.githooks/pre-commit` reminder;
    - `README.md` "Contributing", step 3.
  - **Output:**
    - a line in the commit message, "entropy check clean" or what changed (`README.md`:138);
    - proposals for Justin, in `DECISIONS.md`;
    - the next action, in the `TODO.md` "Current state" section.
  - **Escalation:** a gap too large for this change goes to `TODO.md` Next Up or Backlog. A misfire in an exported skill
    goes to a GitHub issue through `skills/local/entropy-guard-feedback/SKILL.md`.
  - **Ordering:** it is the only guard. It runs after "Doing Now" is written up and before `git commit`.

## Depth of each check

- **Judgment, prompted by `AGENTS.md` and the hook:** intent, skill-contract dependents, which guard writer owns a
  change (F4), supersession (F6, F8), decision and learning capture, state honesty (F11), workflow alignment (F13),
  and issue linkage (F12).
- **Stable mechanics, scripted in the guard for now:**
  - each `SKILL.md` `name` matches its folder;
  - a search for old names after a rename.
- **Kept as judgment on purpose:** "Doing Now cleared". A script would have to match the `[empty]` wording, which is
  brittle.

## Adoption

Adoption has not been verified. Both of the integrator's tests are **planned**, not done.

- **Has the trigger fired?** Planned. The target is a read-only snapshot with no `.git`, so no real commit was possible.
  - **Execution evidence, from a scratch copy only.** The target's `.githooks/` and `TODO.md` were copied into a scratch
    git repo on 2026-10-07. A commit with the default hooks path printed nothing. After
    `git config core.hooksPath .githooks`, the next commit printed the three-line reminder and still committed, so the
    hook is non-blocking, as `DECISIONS.md`:31-35 decides.
  - This shows the hook works once it is enabled. It does not show that any contributor's clone has it enabled (F13).
- **Does a fresh agent session find the guard?** Planned. In the environment this run used, every agent session
  auto-loads a host `AGENTS.md` whose text matches the target's. A "fresh" session there would already know the guard
  path, so the test would prove nothing.
  - Run it from a clean checkout instead, once for each agent tool in use. The transcripts show Claude Sonnet 4.6 and
    OpenCode (gpt-5.4).
  - Ask each session what it must do before handing off.
  - A pass is a session that names `skills/local/entropy-guard/SKILL.md` and reads `TODO.md` "Current state" first.

## Plan

- **Now:**
  - Install `guard/SKILL.md` over `skills/local/entropy-guard/SKILL.md` once Q1 is answered, since its Intent section
    depends on Q1 (F14).
  - Apply `patches/TODO.md.patch` (F11) and `patches/DECISIONS.md.patch` (F6, plus the proposals for Q1–Q3).
  - In `AGENTS.md` Quick Links, change the `TODO.md` line to "Current state and active work — read first", so that a
    fresh agent meets the state section at session start.
  - Enable the reminder in each clone with `git config core.hooksPath .githooks`. This needs no symlink. Say so in
    `README.md`:140 (F13).
  - Make the `README.md`:79 claim honest: the guard is run before commit, prompted by an opt-in reminder (F13).
- **Next:**
  - Install `lychee` and `agnix`. Neither was installed on this machine (checked 2026-10-07).
  - Then add `lychee --offline` on the staged `.md` files to `.githooks/pre-commit`, still exiting 0, so that links are
    checked at every commit without blocking it.
  - Replace the guard's shell loop with `agnix`, which checks `SKILL.md` frontmatter against the agentskills.io format.
- **Later:** when the guard runner tracked at `TODO.md`:18 is designed, it should take over the hook's mechanical
  checks. Do not start a parallel runner here.

## Uncertain

- **Which agent tools load `AGENTS.md` automatically:** not checked. If one of them does not, the smallest fix is a
  root pointer file for that tool that refers to `AGENTS.md`. Workflow logic should not go into a vendor folder.
- **Whether past commits carry the "entropy check" note:** not checked, because there is no git history. This is the
  only existing record of whether the guard is run.
- **The default branch, `origin/main`, used as the guard's fallback baseline:** assumed, not seen.
