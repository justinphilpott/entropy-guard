# Integration: the session-end guard for ORC and the orchestration lab

From `guards-integrator`, after `session-coherence-skill-generator` built `guard/SKILL.md`. Finding ids (F1 to F25) and
questions (Q1 to Q4) refer to `assessment.md` and `questions.md`. The loop is mapped in `assessment.md`, section 5; this
brief adds only what placement needs.

## The loop, as it is

- **Smallest unit of change:** a pull request to ORC (or to a Scope), merged by Claude once review and tests pass; in the
  lab, a direct commit to `main`.
- **Habitual pauses:** a merge; ORC's restart card; the overwrite of `STATE.md` "at each verified event"; Claude's
  handoff reply to Justin, often at night, when work moves to branches after 22:00 (`STATE.md` line 18).
- **Where follow-up is lost:** decisions left in `STATE.md` (F1), the state file contradicting itself (F3), times typed
  by hand (F5), tests never run in CI (F14), the lab's tools reading ORC silently wrong (F16, F17).

## Placement

- `session-coherence-guard`:
  - **Trigger:** at the end of every work session in ORC or the lab: before the session's final commit, push or merge,
    and before the handoff reply. That is the latest moment its two costliest catches are cheap: a decision still in
    the session's memory (F1), and a `STATE.md` about to be overwritten (F3).
  - **Actor:** the agent that ran the session, usually Claude Code; Codex, opencode or Pi when they work here. Justin
    may ask for it at any time.
  - **Entry point:** a "Before handing off" section in the lab's `AGENTS.md`, which `CLAUDE.md` also is (a symlink),
    and the same section in ORC's `AGENTS.md`, pointing at the lab's `skills/session-coherence-guard/SKILL.md`. Both are
    in `patches/settled.patch`.
  - **Output:** the report goes in the handoff reply and in the session's last lab commit message. Its next action is
    written into `STATE.md`. Proposals for Justin go into the lab's `decisions/` (for ORC, where is Q1). Friction goes
    into `FRICTION.md`.
  - **Escalation:** a gap too large for this session becomes an issue on the map (orchestrator#140), under Map A, "keep
    the system healthy" (#141), or its security branch (#145). The issue is named in `STATE.md`.
  - **Ordering:** after ORC's `pnpm typecheck && pnpm test` (the guard's own commands, until CI runs them, F14), before
    `STATE.md` is overwritten and committed, and independent of Astra's review, which is per pull request.
  - **Cost:** about 5 to 10 minutes a session, mostly reading `git diff` in two repositories. That is an estimate, not a
    measurement. Sessions run a few times a day. The friction it targets cost hours each time (`FRICTION.md`, 12, 22,
    29 and 30 Sep), so the cost fits the loop.

## Depth

- **External, now:** the guard is a skill, run by hand at the trigger.
- **Prompted, now:** the pointers in both `AGENTS.md` files. Next, one reminder line in each repository's
  `.githooks/pre-push`, beside the push summary it already prints. Both hooks never block, so the reminder cannot stop
  a push. A vendor hook such as a Claude Code Stop hook is not recommended: workflow logic stays out of vendor folders,
  and a hook in `~/.claude/settings.json` once blocked every message Justin sent (`FRICTION.md`, 29 Sep).
- **Semi-embedded, later:** the mechanical parts move out of the guard once they stop moving:
  - tests in CI (orchestrator#144);
  - `node tools/map.mjs --check` and the diary, run on ORC's scheduler (#166);
  - a credential and subprocess-environment test in `test/architecture.test.ts` (F11, F12);
  - a lab check for the `STATE.md` cap and the `FRICTION.md` heading format, after Q3 (F4, F17);
  - a link check (lychee) over both repositories' Markdown (F15, F18).
- **Kept as judgment:** whether a change fits the authorised intent, whether a decision was taken, whether a state claim
  is true. These stay in the guard.

## Adoption

Nothing is verified. The targets are read-only snapshots, and this run may not commit, push or run a session in them.

- Pointer in the lab's `AGENTS.md`: reminder; planned (F19); in `patches/settled.patch`.
- Pointer in ORC's `AGENTS.md`: reminder; planned (F19); in `patches/settled.patch`. ORC's `AGENTS.md` is a
  Danger-guarded path, so it goes through a pull request with a `## Security review` section ("No new authority;
  documentation and an agent pointer only").
- `session-coherence-guard`: executed check; planned. It counts as adopted only when a completed guard report exists
  from a real session end, in a commit message or handoff reply.
- Fresh-session discovery: planned. Ask a session with no context, "what must you do before handing off?", once for
  each way agents load instructions here:
  - Claude Code in the lab, through `CLAUDE.md`;
  - Claude Code in ORC, through `AGENTS.md`;
  - Codex and opencode, through `AGENTS.md`.
  Each must name the guard and its path.
- Pre-push reminder: reminder; planned (next). It is verified only by seeing it fire, and only once
  `core.hooksPath` is set in each clone (F25).
- Danger on ORC pull requests: enforced invariant; verified 2 Oct 2026 by the lab's own record of a refused case
  (`STATE.md` lines 79–81); not re-checked in this run.

## Plan

- **Now:**
  - apply `patches/settled.patch` and install the guard (F1, F3, F6, F8, F12, F13, F17, F18);
  - run the guard at the next session end; ask a fresh session the discovery question;
  - file F11 and F12 as issues under #145.
- **Next:**
  - Justin answers Q1 to Q4; apply the matching provisional patches;
  - add the pre-push reminder;
  - mark the guard as adopted in `STATE.md` once both adoption checks have evidence.
- **Later:**
  - orchestrator#144 runs the tests in CI, and the guard's ORC command line becomes "CI has run them";
  - #166 schedules the map check and the diary (F19);
  - the architecture test gains the credential and subprocess-environment checks (F11, F12);
  - after Q2, a Danger rule refuses a rise in a core-ties allowance that does not quote Justin's decision (F10).

## Uncertain

- Whether agents load the lab's `skills/` folder by themselves: not checked. The user-wide skills home is in
  local-config, which was not read. The `AGENTS.md` pointers are what count.
- Whether either clone has `core.hooksPath` set (F25), and whether GitHub requires Danger's check before a merge (F24).
- Whether a user-wide session-end ritual already exists in local-config. If it does, this guard should be invoked from
  it, not duplicated beside it.
