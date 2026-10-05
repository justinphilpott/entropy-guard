# Integration brief: agentic-architecture guards

Produced by `guards-integrator` for the guard in `guard/SKILL.md`. That guard replaces the contents of
`skills/entropy-guard.md` in the target, at the same path. *Provisional on Q1-Q3 in `questions.md`.*

## Loop map

- **Change starts in:** an agent session opened in the repository: Claude Code first, OpenCode
  secondary (`MANIFEST.md:9-11`).
- **What loads automatically:** `CLAUDE.md`, a symlink to `AGENTS.md`. Pi also loads both files
  (`runs/001-moving-stillness-status/RUN.md:74`). The banner is the first thing every agent sees.
- **Session start:** `AGENTS.md:36-45` reads `ROADMAP.md`, `MODEL.md`, `DECISIONS.md` and
  `components.yaml`, then runs `skills/session-kickoff.md`. Its packet lives only in the conversation.
- **First handoff:** a local commit. `AGENTS.md:72` says to run `skills/entropy-guard.md` before
  "non-trivial" commits.
- **Second handoff:** none visible. There is no pull-request template and no `CODEOWNERS`.
- **Automated gate:** none. The snapshot has no CI, `.githooks`, `.pre-commit-config.yaml` or `.husky`.
  With no `.git`, `core.hooksPath` could not be checked.
- **Where the real loop differs:** handoff notes moved from `RUN.md` "Pickup" sections (April-May) to
  `architecture/PICKUP.md` (July) to the banner (after July). Nothing persistent recorded the current
  state.
- **The expected loop now, if reference-only:** rare edits, most of them by sessions that came here to
  consult the record while working in `../personal-agent` or `../../scope`.

## Guard placement

| Surface | Trigger | Actor | Why here |
|---|---|---|---|
| `entropy-guard` (`skills/entropy-guard.md`) | Before **any** commit in this repository, not only "non-trivial" ones | The agent or person making the change | In a frozen record every commit is an exception. The commit is the last cheap moment to send architecture work to the repository that owns it. It takes about 2 minutes, because changes here are small |
| `session-kickoff` (`skills/session-kickoff.md`). Not a guard, but the session-start half of the same loop | At session start | The agent | So that a session meets the status before it picks work from the roadmap |

**Classifying the guard** (integrator Step 2):

- **Judgment or mechanical:** mostly judgment. Its mechanical parts are the git commands, the banner
  grep and the link check.
- **Latest useful moment:** before commit. Once a commit is pushed, the extension of the record is
  visible to other sessions.

## Adoption plan

**Now: External, plus the existing prompt.** No new infrastructure. The `AGENTS.md` lines below already
reach Claude Code, OpenCode and Pi.

1. Replace the contents of `skills/entropy-guard.md` with `guard/SKILL.md`.
2. In `AGENTS.md:72`, change "Before committing non-trivial changes, run
   [skills/entropy-guard.md](skills/entropy-guard.md)" to "Before committing any change, run
   [skills/entropy-guard.md](skills/entropy-guard.md). This repository is reference-only, so no change
   is too small to check."
3. In `AGENTS.md`, insert a new first step under "Session start" (line 38):
   "1. Read the status section at the top of ROADMAP.md. This repository is reference-only: unless
   Justin has authorised the work in DECISIONS.md, do not pick work from the roadmap, and take current
   architecture questions to `../personal-agent` or `../../scope`."
   Renumber the steps that follow.
4. In `skills/session-kickoff.md`:
   - add `ROADMAP.md` status section as the first item of Step 1 ("repository status: read first");
   - in Step 3, add: "If the repository is reference-only, the next actions point to the successor
     repository, unless the user's task is a permitted correction."
5. In `skills/README.md:8`, change the description to "checks that a change to this reference-only
   record is permitted and leaves it coherent; run before any commit."
6. Apply `current-state.patch` and `decisions-proposal.patch`.

**Next: a prompted reminder, only if it is needed.**

- If a commit lands here without a guard report, add a non-blocking reminder hook. That was the old
  guard's own planned next step (`skills/entropy-guard.md:118`).
- Install lychee, so that the guard's link check runs instead of being done by hand.

**Later: only if commits here continue.**

- Make the banner grep and an offline lychee run a pre-commit check. Both are stable invariants for a
  frozen record.
- If Justin answers Q2 "archive", retire the guard together with the move. Do not automate anything.

## Adoption status

Both entries below are a **reminder**: a standing instruction prompts the agent. Neither is a check
that runs by itself, nor an enforced invariant.

- **`entropy-guard`: planned.**
  - **Not exercised.** The target is a read-only snapshot with no `.git`, the guard is not installed
    there, no trigger has fired, and no fresh session has been asked what it must do before handing
    off.
  - **What was exercised, 2026-10-04,** on a scratch git copy of the snapshot (since deleted):
    - the four "what changed" commands, the banner grep and the changed-files listing, during a
      simulated session with one commit, one uncommitted edit and one untracked file. All three kinds
      of change were reported;
    - the no-upstream fallback against `main`.
  - **Not exercised:** lychee, which is not installed.
- **`session-kickoff` amendment: planned.** Not exercised.

**To mark either one verified:**

1. Make a scratch commit in the real repository and confirm the agent runs the guard and writes its
   report.
2. Start a fresh session with no context and ask what it must do before handing off. It should name
   `skills/entropy-guard.md` and read the `ROADMAP.md` status section first.

## Discovery plan

- **Where the guard is already linked,** all at the same path, so nothing to add:
  - `AGENTS.md:72` (standing instruction) and `AGENTS.md:103` (Key files);
  - `README.md:29`;
  - `skills/README.md:8`.
- **What changes:** the wording at `AGENTS.md:72` and `skills/README.md:8` (above).
- **Where the status is found:** the banner, the new first session-start step, and the `ROADMAP.md`
  status section.
- **Vendor folders:** none. `AGENTS.md` is the shared surface, and `CLAUDE.md` is only a symlink to it.

## Execution plan

- **Order:** session-kickoff at the start, then the work, then entropy-guard before the commit.
- **Parallel:** nothing; there is one guard.
- **What the guard writes:** its report goes to the conversation or the commit message. Proposals go
  to `DECISIONS.md`, marked proposed. The first next action for the next session goes into the
  `ROADMAP.md` status section, never into the guard.
- **Escalation:** if a change is architecture work, stop. Either take it to `../personal-agent` or
  `../../scope`, or record a proposal for Justin in `DECISIONS.md`, and do not commit it here.

## Automation opportunities

- **In-repository link integrity:** `lychee --offline --no-progress` over changed `.md` files. On
  2026-10-04 a scripted check of the snapshot found no broken in-repository links, plus 20 links to
  sibling repositories that could not be checked from here.
- **Banner presence:** `grep -n "Reference-only" README.md AGENTS.md`. Verified on the snapshot: one
  line from each file.
- **Do not automate:** the "is this change permitted" judgment, or the one-owner and supersession
  checks. They depend on Q1-Q3 and on reading what the change means.

## Risks / uncertainties

- **Q1-Q3 are unanswered.** If Q1 is answered (b) or (c), the guard's Intent section and the session
  start change. If Q2 is "archive", the whole plan reduces to recording the status.
- **No git history,** so how often the repository is actually committed to is unknown. If it is never
  committed to, the guard's real value is the kickoff amendment.
- **Sessions in other repositories may edit this one** in passing. Its `AGENTS.md` only reaches them if
  they open a session here.
- **Unverified commands:** `@{upstream}` assumes a tracking branch. The fallback is documented in the
  guard.

## entropy-guard feedback

Yes; two notes, in `feedback.md`. In short:

- route A has no proportionality branch for a reference-only repository;
- the intent pass has no place for an undated, unattributed directive.

No issue was filed: this run was outside the entropy-guard repository, with no web access.
