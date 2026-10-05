# Integration brief: the session-coherence guard for ORC and the orchestration lab

Produced by `guards-integrator` v0.3.0 for `guard/SKILL.md`. The targets are read-only snapshots with no `.git`, so
nothing below has been exercised. Every placement is **planned**.

## Loop map

This is the real loop, taken from `lab/STATE.md`, `lab/AGENTS.md`, `orchestrator/AGENTS.md` and `lab/FRICTION.md`.

- **Change starts in** an agent session. The agents are:
  - **Claude Code**, for most work;
  - **Codex** and **opencode**, for briefed runs, including GPT-6 Astra's reviews;
  - **ORC's own agents**, which act on the live system through cards.

  ORC work happens on a branch in a git worktree; where agent worktrees should live is open in #196. Lab work happens
  in `~/scopes/scope-orchestration-lab`. Whether it happens on a branch or on `main` is not visible.
- **Handoffs within a session.**
  - `STATE.md` is overwritten at each verified event, such as a commit landing, tests passing or a decision being
    taken (`lab/AGENTS.md:33`).
  - The map's In Progress marks are set and cleared with `node tools/map.mjs working` and `stopped`.
- **First handoff:** a commit, then a push. The pre-push hook in each repository prints `push-summary`, if
  `core.hooksPath` is set. That could not be checked.
- **ORC's path to live.** These steps run in order:
  1. A pull request is opened.
  2. Danger runs, the only automated gate. It checks the Security review section and the Package API section. A
     failure warns but does not block.
  3. A review, by Astra for large changes, written into `lab/reports/`.
  4. Claude merges once the review and the tests pass, with the tests run by hand (Justin, 2026-09-25).
  5. The ORC checkout is pulled.
  6. Within a minute, ORC raises the card "Restart ORC onto <commit>".
  7. Justin approves it.
  8. `pnpm service:status` verifies the restart.
  9. `STATE.md` is rewritten.
- **Package path:** a rebuild raises a build card, and Justin approves it.
- **Session end.** It may come at night (after 22:00, work stays on branches), at a compaction, or when the turn
  ends. **No ritual runs at session end today.**
- **Scheduled work:** none. The diary is run by hand. Scheduling (#166) is to be built first.

## Guard placement

| Guard | Trigger | Actor | Why here |
|---|---|---|---|
| `session-coherence-guard` | At the end of any session that changed ORC, the lab, or the running ORC: just before the last `STATE.md` overwrite, and before the final message or handoff | The agent that did the work. Justin reads the report in that final message | `STATE.md` is written by the working agent at verified events, so its honesty is cheapest to fix while that agent still holds the context. The documents-against-code checks need the session's diff, and it is freshest then |
| The state-honesty block of the same guard | Also after any ORC restart card is approved, when `STATE.md` is rewritten to say what runs | The same agent | Four restarts on 4 Oct produced three disagreeing "ORC runs" lines in `STATE.md` |

**Timing and burden.**

- The judgment checks take about 3 to 5 minutes.
- ORC's `pnpm test` takes about 1 to 2 minutes. `tools/report.mjs` puts both suites together at about two minutes.
  `pnpm test:e2e` runs only when the web layer changed.
- The guard is mixed. Its judgment checks are the core. Its mechanical subset is listed under "Automation
  opportunities" below.

## One-time setup before the first run

These are listed separately so that the guard does not carry them every session.

- **S1.** Record P0 from `proposed-decisions.md`, which moves the 3 and 4 Oct decisions out of `STATE.md`. Its home
  depends on Q1.
- **S2.** Apply A1 to A3 and B1 to B4 from `proposed-corrections.md` to ORC, in one documentation pull request with a
  `## Security review` section.
- **S3.** Apply C1 to C6 from `proposed-corrections.md` to `lab/STATE.md`, after a live re-read.
- **S4.** Apply Justin's answer to Q3 on ORC's root reports, then drop the list of those reports from the guard's
  supersession check.
- **S5.** Apply B7 to B9, the lab's README and tools.

Track progress on S1 to S5 in `STATE.md` or in an issue on the map, never in the guard.

## Adoption plan

**Now.** These are external, plus a line in each agent-instruction file.

- Place the guard at `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`, per Q2.
- Add the two pointer lines below, under "Discovery plan".
- Add "run the session coherence guard and include its report" to the completion criteria of every brief handed to
  Codex or opencode. That is the same place `STATE.md:65` plans to add the map-marking rule.
- Do S1 to S3.

**Next.** A prompted reminder at the real handoff, once missed runs become the main failure.

- ORC's `.github/pull_request_template.md` gains a line: `Session guard: run at <time>; findings: …`. That puts a
  reminder in front of the merging agent at the merge.
- `tools/report.mjs`, the diary, shows the date of `STATE.md`'s last live read of ORC beside a live read of ORC's
  `build.json`, and a red line when they disagree. This catches a missed guard run the next morning.
- A reminder in the session-end prompt that Claude Code uses (`~/.claude/settings.json`, noted in
  `lab/FRICTION.md:389-394`) belongs to local-config, and is vendor-specific. Propose it there; it does not go in
  this repository.

**Later.** Move the mechanical parts into tooling.

- **#144, tests on every PR:** a GitHub Actions job runs `pnpm typecheck`, `pnpm test` and `pnpm test:e2e`. The guard's
  ORC block then shrinks to "CI is green".
- **ORC tests** (B5 in `proposed-corrections.md`): Playwright's launch is confined to
  `src/adapters/browser/playwright.ts`, and a test checks that every code path named in a root `*.md` exists.
- **`tools/map.mjs --check` fails on any of these:**
  - a missing `**Where we are now:**` line;
  - a FRICTION heading the diary cannot read;
  - `STATE.md` over its cap.

  The diary runs it daily through ORC's scheduler, #166.
- **lychee, and ctxlint or agnix,** in a CI job in each repository.

## Adoption status

| Guard | What it will be | Status | What was exercised |
|---|---|---|---|
| `session-coherence-guard` | A reminder, once the pointers are in both `AGENTS.md` files. Its mechanical commands become a check that runs once they are in CI and ORC's tests (Later). Nothing in it is an enforced invariant | **Planned** | Nothing. The snapshot is read-only, so no trigger could fire and no session could start. The guard's read-only lab checks and its ORC dead-path loop were dry-run on the snapshot and worked (`generator-report.md`) |

**To make it `verified`, both of these must happen:**

1. **The trigger fires once.** At the next real session end in either repository, the final message carries the
   guard's report, and `STATE.md` shows a live read of ORC with its time.
2. **A fresh session finds the guard.** Start a session with no context in `~/pro/orchestrator`, and another in
   `~/scopes/scope-orchestration-lab`. Ask each "what must you do before handing off?". Each must name the guard and
   its path. If either does not, the discovery path is broken, whatever `AGENTS.md` says.

This links to work that already exists: the kept process "entropy guard at session end" (`lab/STATE.md:49`) and P2 in
`proposed-decisions.md`. It is not a parallel project.

## Discovery plan

No coding tool loads a Scope's `skills/` folder by itself. Per `lab/reports/2026-09-30-skills-one-home.md`, they read
`~/.agents/skills` or `~/.claude/skills`. A guard there without pointers would be "a file loaded by nothing"
(`lab/FRICTION.md:610-616`). These two lines are the discovery path:

- **The lab's `AGENTS.md`, at the end of "Keeping state":**
  > Before the last `STATE.md` write of a session, and before handing off, run
  > [`skills/session-coherence-guard/SKILL.md`](skills/session-coherence-guard/SKILL.md). It covers ORC and this
  > Scope.
- **ORC's `AGENTS.md`, under "Working Style":**
  > At the end of a session that changed this repository, run the session coherence guard in the orchestration-lab
  > Scope: `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`.

  This pull request touches a guarded path, so it needs `## Security review`: "No new authority; documentation only".
  It names a Scope path in ORC's agent instructions, but not in `src/`, `web/src/` or `config/`, which are what the
  core-ties ratchet scans. If Justin prefers ORC's `AGENTS.md` to stay Scope-free, the alternative is a line in the
  rules of the map's root issue, which both `AGENTS.md` files already tell every agent to read.
- **The lab's `README.md` file list** may gain one line, "`skills/session-coherence-guard/` — run at session end". This
  is optional.

## Execution plan

**Order.**

1. Work out what changed, in both repositories.
2. Take the live reads: `pnpm service:status` and the operator commands, through `scripts/orc-env.sh`.
3. Start ORC's mechanical checks in the background.
4. Make the judgment checks, in this order:
   - state honesty;
   - ORC's documents against its code;
   - the seams between the two repositories;
   - workflow;
   - intent.
5. Write the fixes: `decisions/` proposals, `FRICTION.md` entries, and documentation fixes.
6. Make the last `STATE.md` overwrite.
7. Put the report in the final message.

**What can run in parallel:** ORC's `pnpm test` and `pnpm test:e2e` alongside steps 4 and 5. The lab checks are
quick.

**Outputs.**

- the report, in the final message;
- `STATE.md`;
- proposals in `decisions/`;
- issues on the map, under the "keep the system healthy" branch, for any gap too large to fix in the session.

**Escalation.** A gap that needs Justin's decision becomes an issue on the map, plus one line under "Waiting on
Justin" in `STATE.md`. The line carries the question, the options and a recommendation. Do not fix it locally.

## Automation opportunities

| Manual check today | Where it should move | When |
|---|---|---|
| Run ORC's typecheck, tests and E2E by hand | A GitHub Actions job on pull requests (#144) | When Justin picks the mechanism in #144 |
| Find code paths named in prose that no longer exist | An ORC vitest test, or ast-grep in CI | Now; it is cheap, and 8 dead paths exist today |
| Check that the boundary prose matches the enforced modules | Name the tests in the prose, and add the Playwright confinement test (B5) | With S2 |
| Check `STATE.md`'s cap and its "Where we are now" line, and the FRICTION headings | `tools/map.mjs --check`, run by the diary | When #166 schedules the diary |
| Compare `STATE.md`'s live claims against ORC | A diary line comparing them with `build.json`, read live | Next |
| Check markdown links | lychee in CI | Later |
| Lint the agent instruction files | ctxlint or agnix | Later |

Keep these as judgment checks for now: whether the intent fits, which document owns a concept, whether the "Today:"
lines in headers are true, and whether a statement about a live service is honest. Encoding them now would mostly
encode today's wording.

## Risks and uncertainties

- **Skipped runs.** If ORC's tests make the guard feel long at the end of a short session, the guard will be skipped.
  Watch for missing reports in the first week, before moving to the "Next" plan.
- **Concurrent sessions.** Two sessions may write `STATE.md` at once, as Claude does while an Astra run is under way.
  The guard assumes one writer per session end and does not resolve that race. If it recurs, record it in
  `FRICTION.md`.
- **Placement is provisional on Q2.** The ORC pointer adds a Scope path to ORC's agent instructions. The lab's
  `skills/` folder is also where ORC loads approved agent skills (`src/adapters/agent-files/skills.ts`). ORC loads only
  names that have been approved, so the guard is not offered to ORC's agents unless someone approves it.
- **Unknowns.** Whether the pre-push hooks are enabled. Whether lab work goes through branches. The real time the
  guard takes. None of these could be read from the snapshot.
- **Unrun commands.** No command in the guard that needs ORC, GitHub or `node_modules` was run.

## Feedback on entropy-guard (Step 8)

Yes: the run produced reusable feedback. There are four notes, in `feedback.md`:

- the front door has no route for a two-repository system in which one repository is docs-first;
- issue numbers as pointers, and the guard rule against holding them;
- discovering a guard placed in a folder that no tool loads;
- steward decisions held in a state file that is overwritten.
