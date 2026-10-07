# Integration brief: the session-coherence guard for ORC and the orchestration-lab Scope

From `guards-integrator` v0.4.0, 2026-10-07. It reuses the assessment's loop map (`assessment.md`, section 4) and
findings by id. One guard: `skills/session-coherence-guard/SKILL.md` in the lab (`guard/SKILL.md` here). Nothing here
has run yet: the targets are read-only snapshots, so every mechanism below is `planned` or `unknown`.

## The loop, as it runs

- **Smallest unit of change:** a commit on an ORC branch or worktree, or an overwrite of the lab's `STATE.md`.
- **Habitual pauses:** a pull request opened (Danger runs), a review (Astra, on request), a merge, the restart card
  approved by Justin and verified by start time, `build.json` and health, then `STATE.md` overwritten, and the
  session's final message.
- **Where follow-up gets lost:** decisions written into the overwritten `STATE.md` (F1); sessions started in ORC that
  never read `STATE.md` (F20); live facts that go stale between overwrites (F14); checks nobody runs (F17).

## Placement

- **`session-coherence-guard`:**
  - **Trigger:** at the end of each work session, after the session's last change is verified (tests run by hand; a
    restart verified if one happened) and before the final `STATE.md` overwrite, the commit and the handoff message.
    Its merge-readiness check also runs before a session calls an ORC pull request ready to merge. Per commit would
    be too often: `STATE.md` is overwritten several times a day, and the guard's reading cost (about 1,100 words,
    plus `pnpm test` when ORC changed) fits a session, not a commit.
  - **Actor:** the working agent (Claude, Codex or opencode today), or Justin when he works directly.
  - **Entry point:** the lab's `AGENTS.md`, new section "Before handing off" (settled patch), which `CLAUDE.md` links
    to. For sessions started in ORC's checkout, ORC's `AGENTS.md` "Before handing off" (provisional patch, Q4).
  - **Output:** the guard's report in the session's final message; the next action written into `STATE.md`;
    proposals for Justin recorded in `decisions/` as proposals.
  - **Escalation:** a gap too large for the session becomes an issue under orchestrator#140 (the map's rule), and a
    question for Justin goes into `STATE.md`'s "Open for Justin".
  - **Ordering:** after tests and restart verification, before the commit; independent of Danger, which runs later on
    the pull request and checks only its description.

## Depth of each check

- **External now:** the whole guard, run by hand from the `AGENTS.md` pointer. Its judgement checks (intent, docs
  against code, decisions recorded, superseded material) stay in the guard.
- **Move to tooling as each is stable:**
  - reach patterns (F7 to F9) into `test/architecture.test.ts`: library launches (`playwright`, `chromium`),
    `fetch` passed as a value, and an explicit `env` on `orc-service.ts`'s `execFile` calls (F10);
  - `STATE.md`'s "**Where we are now:**" line and its cap (F5, F16) into `node tools/map.mjs --check`, which already
    reads that line and returns no ref silently when it does not parse;
  - the lab's readers of ORC (F16) into a check mode of `tools/report.mjs` that fails on a null or empty section;
  - tests and type checks into CI under #144 (F17);
  - links to lychee, once installed (it is not installed on this machine; checked 2026-10-07).
- **Not automated:** wording and paths still moving, such as the root reports while target 4 is pending (F12).

## Adoption

- Lab `AGENTS.md` "Before handing off": reminder; planned (settled patch not applied); 2026-10-07.
- `session-coherence-guard`: executed check; planned. Verified only by a completed report at the end of a real
  session, after the patch lands.
- Fresh-session discovery: planned. Ask a session with no context, in the lab, what it must do before handing off,
  once through Claude Code (which reads `CLAUDE.md`) and once through a tool that reads `AGENTS.md` (Codex or
  opencode). After Q4, the same in ORC's checkout.
- ORC `AGENTS.md` "Before handing off": reminder; planned, provisional on Q4.
- A one-line, non-blocking reminder in the lab's `.githooks/pre-push`: reminder; planned (Next). The hook exists;
  whether `core.hooksPath` points at it is unknown (F24), so check that first.
- Danger's security-review check: executed check, warns without blocking (F18); recorded as proven on GitHub on
  2 Oct in `STATE.md`, not re-checked here.
- Architecture-test reach patterns: enforced invariant once tests run on pull requests; planned (F7 to F10, #144).

## Plan

- **Now:** apply the settled patches (`patches/settled-*.patch`); put Q1 to Q5 to Justin, Q1 first; run the guard at
  the end of the next session and keep its report; file under #140 the defect in F10 and the test gaps in F7 to F9,
  and the `--no-tests` defect in F13.
- **Next:** apply the provisional hunks whose questions are answered; add the pre-push reminder; check
  `core.hooksPath` in both checkouts (F24); decide with Justin whether ORC's checkout needs a `CLAUDE.md` link to its
  `AGENTS.md` so Claude Code sessions there meet the pointer (F20; a new file, so his call).
- **Later:** the tooling moves above, through existing work: tests on every PR (#144), the reach patterns in the
  architecture test, the diary's check mode (with design review target 5 for F16), and lychee.

## Uncertain

- Whether Claude Code sessions in ORC's checkout load ORC's `AGENTS.md`: ORC has no `CLAUDE.md` in the snapshot.
- Whether any tool loads the lab's `skills/` automatically: the lab's report of 30 Sep
  (`reports/2026-09-30-skills-one-home.md`) says Claude Code reads skills from `~/.claude/skills/`, and nothing in the
  snapshot loads a Scope's `skills/`, so the `AGENTS.md` pointer is the entry point.
- Whether either `.githooks/` folder is enabled, and what triggers the nightly diary (F24).
- The guard's cost in practice: estimated, not measured.
