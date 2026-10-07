# Questions for the steward

The steward is Justin (`scope.yaml` line 7 in the lab: `steward: justin`). He was not available, so each question
carries a recommended answer, and the run continued on that recommendation. Work that depends on an answer is drafted
as provisional: the guard (`guard/SKILL.md`) and the proposed lines in `integration.md`. Nothing was installed or
applied. Four questions, each one about a choice that changes what gets built or what the guard checks. Finding ids
refer to `assessment.md`.

## Q1. Where does the session-end guard live, and is there one already to refine?

- **The statement and its source.** Justin's decision of 4 Oct keeps "entropy guard at session end" among the
  processes (`STATE.md` line 49). Neither repository holds a session-end guard (F22). The one-home rule for skills
  (`reports/2026-09-30-skills-one-home.md`, "The rule, written once") gives three homes: local-config for skills used
  across projects, a Scope's `skills/` for "one Scope's agents", a repository's own folder for one repository.
- **The readings.**
  1. The lab's `skills/session-coherence-guard/SKILL.md`, because on 4 Oct the lab became the central Scope for
     project management and code quality, with one line in each repository's `AGENTS.md` pointing at it.
  2. ORC's repository, because most of what it checks is ORC's code and docs.
  3. An existing cross-project guard outside these repositories, which this draft would refine rather than duplicate.
- **One concrete case where they diverge.** A pull request for #166 (ORC scheduling) starts in ORC and reads ORC's
  `AGENTS.md` only. Under reading 1 it meets the guard through a pointer that names a Scope path. Under reading 2,
  ORC's repository would carry checks about the lab's `STATE.md` and `tools/map.mjs`, a Scope tie in ORC that its
  `AGENTS.md` ("Core ships with no specific Scope…") argues against.
- **Recommended answer: reading 1.** The lab is the home of state, decisions and the map, which most checks are
  about. A path in ORC's `AGENTS.md` is a smaller tie than lab checks inside ORC. If an older session-end guard
  exists outside both repositories, fold this draft's checks into it instead of adding a second guard.

## Q2. Is `STATE.md` capped at about forty content lines or at sixty lines?

- **The statements and their sources.** The lab's `AGENTS.md` line 34: "capped at about forty content lines".
  `STATE.md` line 4: "Target: sixty lines". Neither is attributed or dated, and no recorded decision says which wins
  (F9, a conflict).
- **The readings.** Forty content lines, as the instruction file says; or sixty lines, as the state file's own
  header says.
- **One concrete case where they diverge.** A 50-line `STATE.md` passes one cap and fails the other. The guard's
  state check needs one number. The `STATE.md` of 4 Oct, with 87 non-empty lines, fails both.
- **Recommended answer: about forty content lines, stated only in `AGENTS.md`**, with `STATE.md`'s header pointing
  to that rule rather than restating a number. `AGENTS.md` is the file that defines how state is kept, and one home
  for the number stops the two drifting again. The proposed `STATE.md` (41 content lines, 58 lines) fits either
  answer, and its header line is left unchanged until you decide.

## Q3. #144: should tests run on every pull request through GitHub Actions or a pre-push hook?

- **The statement and its source.** You kept "tests on every PR (#144)" on 4 Oct (`STATE.md` line 45). The
  mechanism has waited on you since 1 Oct (`STATE.md` line 69; `reports/2026-10-01-review-synthesis.md`, item 3). This
  question repeats one already put to you, because the guard's merge check depends on the answer (F11).
- **The readings.** A GitHub Actions job that runs `pnpm typecheck` and `pnpm test` on each pull request; or a
  pre-push hook in `.githooks/`.
- **One concrete case where they diverge.** With a job, the guard's merge check becomes "is CI green". With a hook,
  the guard must still ask whether the hook is enabled in that clone, because a committed hook runs only after
  `git config core.hooksPath .githooks` (ORC `AGENTS.md` lines 145–150). The existing hooks are built never to block.
  A merge from another worktree, or an agent that skips hooks, would then pass untested.
- **Recommended answer: a GitHub Actions job beside Danger** (`.github/workflows/`), running `pnpm typecheck` and
  `pnpm test`. Add `pnpm test:e2e` once that job is green. Danger already runs there, and a job runs whichever
  agent merges. The job would use the same GitHub Actions allowance Danger already uses. Until #144 is built, the
  guard's merge check asks for both commands by hand.

## Q4. ORC's twelve root reports: keep, mark as history, or delete after moving what is recorded nowhere else?

- **The statement and its source.** The 1 Oct design review (`reports/2026-10-01-design-review.md` lines 171–173 and
  §4, lines 248–255) proposes moving any fact recorded nowhere else into `AGENTS.md` or `docs/`, then deleting
  `CLASSIFY`, `FIXES`, `GRANTS-E2E`, `GRANTS`, `MCP`, `OPERATOR`, `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`,
  `TURN-RECORD` and `VISIBILITY`. The synthesis holds this kind of cleanup "on your word" (line 95). Moving or deleting
  files changes how the repository is organised, so it is your call (F7).
- **The readings.** Keep them as they are; mark each as history with a one-line banner, as `MCP.md` already is; or
  delete them after moving what is recorded nowhere else (git keeps them).
- **One concrete case where they diverge.** `scripts/orc-service.ts` line 41 writes
  `Documentation=file://<checkout>/OPERATOR.md` into ORC's systemd unit, so `systemctl --user status orc.service`
  points at a branch report about the approval card. Deleting `OPERATOR.md` without first repointing that line leaves
  the unit's documentation link dead. The design review's "referenced by no code" is wrong for this file.
- **Recommended answer: delete after moving.** First repoint the unit's `Documentation=` to the README's "As a
  service" section. Until you decide, the guard says not to cite these reports as current.
