# Integration brief: entropy-guard's session guard

From `guards-integrator` v0.4.0, 2026-10-07. The guard is `guard/SKILL.md`, the updated
`skills/local/entropy-guard/SKILL.md`. Finding ids (F..) and question ids (Q..) refer to `assessment.md` and
`questions.md`. This brief reuses the assessment's loop map ("Loop map" in `assessment.md`); the repo's history was not
available, so the real loop could not be observed directly.

## Loop

- **Smallest unit of change:** one meaningful agent or human work session, ending in a commit. It is sometimes
  followed by a pull request with review (`LEARNINGS.md` line 152).
- **Habitual pause:** before commit. `AGENTS.md` line 19 makes the guard a standing instruction there, and the steward
  observed it running at pre-commit on 2026-03-24 (`explorations/2026-03-24-entropy-immune-system-conversation.md`
  line 611).
- **Where follow-up gets lost:** changes to one skill that leave the skills calling it, `INTENT.md` and the routing
  unchanged (F05, F07). Also decisions recorded without a date or author (F02).
- **Existing mechanisms:**
  - `.githooks/pre-commit` prints a reminder and exits 0. It is tracked, and runs only when linked into
    `.git/hooks/` (`README.md` line 140). The effective hooks path cannot be read, because the snapshot has no
    `.git`.
  - There are no CI workflows (no `.github/`), no hook framework (no `.pre-commit-config.yaml` or `.husky/`) and no
    pull request template.
  - The only agent instruction file is `AGENTS.md`.

## Placement

- **`entropy-guard`** is placed as follows:
  - **Trigger:** at the end of a meaningful work session, before commit. Skip it for typo and formatting commits
    (`AGENTS.md` line 19).
  - **Actor:** whoever made the change.
  - **Entry point:** `AGENTS.md` "Working Practices", with the reminder from `.githooks/pre-commit`.
  - **Output:** a one-line result, or "entropy check clean", in the commit message (`README.md` line 138); the next
    action goes into `TODO.md`.
  - **Escalation:** a gap too large for this change goes to `TODO.md` "Next Up" or "Backlog". An undecided intent
    change goes to `DECISIONS.md` as a proposal for Justin Philpott.
- **Cost against frequency:** the guard is 1,057 words, roughly 3-8 minutes with mostly "nothing to do" answers. That
  sits inside the 2-10 minutes `INTENT.md` line 116 allows, and the trigger fires once per meaningful session, not per
  commit. It fits, so no trigger change is needed.
- **Ordering:** it is the only guard. After it, and only if a skill misfired in a way others would hit, the feedback
  helper (`skills/local/entropy-guard-feedback/SKILL.md`) may file a GitHub issue. That is a live action on
  `justinphilpott/entropy-guard`, so it waits for the session's mode to permit it.

## Depth of each check

- **Kept as judgment:** the judgment checks stay in the guard, with Prompted support from `AGENTS.md` and the hook.
  Following the decision recorded in `DECISIONS.md` line 34, the hook stays non-blocking. These checks are:
  - intent;
  - guard-writing ownership;
  - supersession;
  - skill principles;
  - workflow alignment;
  - decisions and learnings;
  - state.
- **Semi-embedded candidate: the folder-name check.** The guard's command checks that every `SKILL.md` is named after
  its folder. That is a stable invariant (`DECISIONS.md` line 81), so it can run from the hook as a printed warning.
- **Semi-embedded candidate: relative links.** A check that every relative markdown link resolves is a stable
  invariant. The old guard already named it as a candidate (its line 110). No CI exists to host it yet.
- **Not automated:** anything that matches wording, such as "Phase 2" or skill descriptions. That wording is still
  moving (F09, F17).

## Adoption

Each mechanism, with what it is, its status, its evidence and the date:
- **Pre-commit reminder:** a reminder, status `unknown`.
  - Evidence: the tracked file exists, and prints the reminder then exits 0 (read 2026-10-07). Whether it is linked
    into `.git/hooks/` cannot be seen. That is configuration evidence only, and nobody has seen it fire.
- **Old guard (`entropy-guard` v0.2.3):** an executed check, status `unknown`.
  - Evidence: the steward said on 2026-03-24 that it "ran as a pre-commit". No completed guard report is visible,
    because there are no commits in the snapshot. Its metadata shows its last evaluation on 2026-04-07 (F15).
- **Updated guard (v0.3.0):** an executed check, status `planned`.
  - Not installed. `patches/provisional-guard-update.patch` waits on Q2 and Q5 (2026-10-07).
- **Fresh-session discovery:** status `planned`.
  - `AGENTS.md` lines 19 and 41 name the guard's path.
  - Agents seen in this repo: Claude Sonnet 4.6, and OpenCode with gpt-5.4 (the frontmatter of the files in
    `explorations/`). Whether each loads `AGENTS.md` automatically was not checked.
  - There is no `CLAUDE.md` or other vendor instruction file.
- **Folder-name check:** an executed check, status `planned`.
  - The command reported nothing on the target, and caught a deliberately mismatched skill in a test copy
    (2026-10-07). That shows the check works, not that it is adopted.

## Plan

- **Now, independent of the questions:** add the guard's one-line result to the commit-message rule in `AGENTS.md`
  line 22 ("derive your commit message from those items"). This makes every run leave evidence, and a skipped run
  visible (F16, F18).
- **Now, after Justin answers Q2 and Q5:**
  - Apply `patches/provisional-guard-update.patch`.
  - Run the updated guard at the end of the next meaningful session, and put its result in that commit's message. That
    commit is the first adoption evidence for the updated guard.
  - In a session with no context, ask what must be done before handing off. Expect "run
    `skills/local/entropy-guard/SKILL.md`". Do this once with each kind of agent used here.
- **Now, with Justin's go-ahead:** confirm the reminder fires.
  - Check the link with `ls -l .git/hooks/pre-commit` or `git config core.hooksPath`.
  - Make a scratch commit and see the message print.
  - A scratch commit is a commit, so it waits for his say-so. Until then the reminder stays `unknown`.
- **Next: add the folder-name check to `.githooks/pre-commit`.** Print mismatches, and keep `exit 0`. This keeps the
  non-blocking decision and catches the class of skill drift seen in F06.
- **Later: add a relative-link check.** Put it in CI if CI is ever added for this repo. A guard runner is already
  tracked in `TODO.md` "Backlog", so link to that item rather than starting parallel work.

## Uncertain

- Whether `.githooks/pre-commit` is linked in any clone: not checked, because the snapshot has no `.git`.
- Which agent tools work in this repo, and whether each loads `AGENTS.md`: not checked.
- Whether pull requests are the normal handoff, or only occasional: only one is mentioned (`LEARNINGS.md` line 152).
- The upstream branch the guard falls back to, `origin/main`: assumed.
