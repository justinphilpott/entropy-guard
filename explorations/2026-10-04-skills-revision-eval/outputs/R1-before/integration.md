# Integration brief: `orc-lab-entropy-guard`

Produced with `guards-integrator` v0.2.2, straight after the guard was generated (`guard/SKILL.md`). The
evidence is the read-only snapshots of ORC (`~/pro/orchestrator`) and the lab (`~/scopes/scope-orchestration-lab`),
read on 2026-10-04. GitHub, git history and the Claude Code settings were not read.

## Loop map

- **Change starts in** an agent session. Claude mostly; also Codex and opencode. It starts:
  - in the lab, where `CLAUDE.md` links to `AGENTS.md`, then `STATE.md`, then `SCOPE.md`, then orchestrator#140; or
  - in an ORC worktree, with `AGENTS.md`, then `README.md`, then `test/architecture.test.ts`, then #140.
- **Work is marked** with `node tools/map.mjs working '<ref>' --agent <A>` and cleared with `stopped`.
- **First handoff: a commit on a branch.**
  - Hooks: `.githooks/pre-push` in both repositories prints local-config's push summary. It never blocks.
- **Second handoff: the pull request.**
  - Danger runs on GitHub (`.github/workflows/danger.yml`). It fails a PR that touches a guarded path and has
    no `## Security review` section, or that changes `src/package-api.api.md` and has no `## Package API`
    section.
  - An adversarial review follows (Astra, read-only; reports in lab `reports/`).
  - **No automated test run** (#144).
- **Merge.** Claude merges once review and tests pass (tests run locally).
- **Live handoff.** Pull the ORC checkout. ORC raises "Restart ORC onto <commit>". Justin approves. The agent
  verifies start time, `build.json` and health.
- **State handoff.** `STATE.md` is overwritten "at each verified event", and re-read after compaction.
- **End of session.** The final message to Justin. When it suggests he stops, it must also say what the agent
  continues with.
- **Periodic:**
  - daily diary (`node tools/report.mjs`, run by hand; last run 2 Oct);
  - weekly adversarial review;
  - FRICTION into rules, monthly (#60).
  - Scheduling for these is to come through ORC (#166).

## Guard placement

- **`orc-lab-entropy-guard`, the whole checklist.**
  - **Trigger:** end of session, before the final message to Justin.
  - **Actor:** the working agent (Claude, Codex or opencode). Justin sees the one-line result.
  - **Why here:** the session end is the one handoff every session reaches. The STATE, decision and learning
    checks need the session's context, which is freshest at that moment.
  - **Why not pre-commit:** the lab commits mid-session. AGENT_IDEAS asks for a commit per idea, and STATE is
    overwritten per event, so a pre-commit trigger would run several times a session.
- **Check 2 (ORC's docs against its code).**
  - **Trigger:** also at the moment of opening an ORC PR, since the docs fix belongs in that PR.
  - **Entry point:** the same file. The guard says "in the same PR".
  - **Why here:** a docs fix made after merge needs a second PR, and a second `## Security review` if it
    touches `AGENTS.md`.
- **Check 8 (STATE honesty).**
  - **Trigger:** it restates the existing "overwrite at each verified event" rule at session end, as a
    catch-up.
  - **Why here:** the per-event rule exists and still produced six contradictions. The session-end pass is
    the net under it.
- **Outputs and escalation.**
  - **Output:** one line, `entropy check: clean | updated <files>; filed <refs>`, in the final message and in
    the lab commit message.
  - **Escalation:** a gap too big for the session becomes an issue placed under #140 with `node tools/map.mjs`.
    The existing work tracker is the escalation path; nothing new is created.

## Adoption plan

- **Now (External).**
  1. Place the guard at `~/scopes/scope-orchestration-lab/skills/orc-lab-entropy-guard/SKILL.md`. The lab's
     `skills/` already exists, empty. `reports/2026-09-30-skills-one-home.md` keeps each Scope's skills in its
     own `skills/`.
  2. Add one line to the lab's `AGENTS.md` under "Keeping state": "At the end of every working session, run
     `skills/orc-lab-entropy-guard/SKILL.md` and put its one-line result in your final message." `CLAUDE.md`
     is a symlink to `AGENTS.md`, so every agent reads it.
  3. Add one line to ORC's `AGENTS.md` under "The map of work", pointing to the guard in the lab.
     `AGENTS.md` already names orchestrator#140, so this adds no new kind of owner tie. It is a guarded path,
     so the PR carries "## Security review: No new authority; adds a pointer to a session-end check".
  4. **Do bootstrap actions B1–B4 first** (`assessment.md`). Otherwise the guard's first run meets the six
     STATE contradictions and the stale ORC docs, and turns into a full audit, which it must not be.
- **Next (Prompted, once missed runs are the main failure).**
  - Name the guard in the session-close prompt that already exists in Claude Code's settings. `FRICTION.md`
    (2026-09-27) records a night prompt in `~/.claude/settings.json`. That is a vendor-specific copy; the lab's
    `AGENTS.md` line stays authoritative, and Codex and opencode read only that.
  - Add a vitest to ORC asserting that every backticked repository path in `README.md`, `AGENTS.md` and
    `SECURITY-REVIEW.md` exists. This is check 2's command made permanent. The invariant (file existence) is
    durable. The new test file is not a guarded path; editing `test/architecture.test.ts` would be.
  - Bootstrap B6: the lab's collector reads ORC's state directory the way `scripts/orc-service.ts` does, and
    the diary prints "could not read" for durable work instead of 0 / 0. After that, check 5 can shrink to
    "look at the diary".
- **Later (Semi- or fully embedded).**
  - **#144, tests on every PR.** Check 1 is deleted from the guard when this lands.
  - **#166, ORC scheduling.** Run the diary daily through it, and let the diary carry the mechanical sub-checks:
    - the map strays (`map.mjs --check`, already drawn);
    - STATE's line count against the cap;
    - the doc-path check result.
    That diary becomes this system's guard runner, with no separate tool.
  - **A non-blocking line in the lab's `.githooks/pre-push`** printing `STATE.md`'s line count against the cap.

## Discovery plan

- **Canonical pointer:** the lab's `AGENTS.md`, under "Keeping state". It is the first file every agent reads
  in the lab.
- **Secondary pointer:** ORC's `AGENTS.md`, under "The map of work". One line, linking the lab file, not
  restating it.
- **Not** `STATE.md`. It holds current state only, and a pointer there would be overwritten or duplicated.
- **Not** the PR template. It is already used for the security review, and adding a checklist there is
  ceremony that the Danger check does not enforce.

## Execution plan

- **Order:** Step 0 (the delta), then:
  1. tests;
  2. ORC docs;
  3. names;
  4. supersession;
  5. lab readers;
  6. learnings;
  7. decisions;
  8. STATE;
  9. map.

  STATE comes late because it summarises the others. The map comes last because filing an escalation issue
  changes it.
- **Can run in parallel:** the mechanical parts of checks 2, 3 and 5 (path check, name grep, diary rebuild).
- **Output:** one line in the final message and the lab commit message. A larger gap becomes an issue under #140.

## Automation opportunities

| Check | Move to | When | Durable enough? |
|---|---|---|---|
| ORC doc paths exist | ORC vitest | Next | yes (file existence) |
| Tests and E2E pass | CI (#144) | Later, when Justin picks Actions or a hook | yes |
| STATE within cap | lab pre-push print, or the diary | Later, after B3 states one cap | yes (one number) |
| Map strays and stale marks | the diary, once scheduled (#166) | Later | yes (already scripted) |
| Lab readers of ORC | collector fails loudly (B6) | Next | yes |
| Old tool names in agent text | per-repository test, like scope-moving-stillness#25 | Later | yes, for names in manifests |
| STATE honesty, decision home, supersession, `Today:` lines | **stay narrative** | — | no: judgment, and volatile wording |

## Risks and uncertainties

- **The 14-hour stale-mark threshold and the rules in #140 were not read.** #140 may already require some of
  these steps, in which case the guard should link to #140 rather than repeat it.
- **The STATE cap.** It is either 40 (lab `AGENTS.md`) or 60 (STATE's header). The guard points at
  `AGENTS.md`, so B3 must settle the number there.
- **ORC's `AGENTS.md` pointing into a private Scope** may conflict with the open-source test in "Core ships
  with no specific Scope". It is assumed acceptable because the same file already names orchestrator#140 and
  `pro/agentic/...`. See `questions.md` Q1.
- **Session ends are not always clean.** Compaction and overnight runs blur them. If agents skip the guard,
  the "Next" prompt step is the remedy, not adding more triggers.
- **After a few real runs, check:**
  - whether checks 3 and 5 ever fire (if never, drop them once B6 and the ORC path test exist);
  - whether quiet sessions really finish in about 2 minutes.

## Upstream feedback on entropy-guard (guards-integrator Step 7)

Yes, there is feedback. It is written as notes in `upstream-feedback.md`. The local helper
(`skills/local/entropy-guard-feedback`) was not used, because this run may not reach GitHub.
