# Integration brief: the ORC and orchestration-lab session coherence guard

This is the `guards-integrator` brief for `guard/SKILL.md`, written in the same run as the guard. Finding ids (F1 and
so on) and question ids (Q1 to Q4) refer to `assessment.md` and `questions.md`. Everything below is a plan: nothing
was exercised on the real repositories, which were read-only snapshots with no git history.

## Loop map

The real workflow, as the snapshot's files show it.

- **Change starts in** an agent session in a worktree of ORC (`.worktrees/`, or `/tmp` per #196) or in the lab's
  checkout. The agent may be Claude Code, Codex, or opencode running GPT 6.1 ("Astra").
- **The first read** is the lab's `STATE.md` (through `AGENTS.md`, which Claude loads as `CLAUDE.md`), or ORC's
  `AGENTS.md`, then `README.md`, then `test/architecture.test.ts`.
- **Work is claimed** on the map: `node tools/map.mjs working <ref> --agent <name>`.
- **The first handoff** is a commit on a branch. The `pre-push` hooks print a summary and never block; whether they
  are enabled is unknown (F20).
- **The second handoff** is a pull request. Danger fails it on GitHub when a guarded path has no `## Security review`,
  or the package API report changed with no `## Package API`. This is the only automated gate.
- **Review** is by Astra or Claude, posted on the pull request. ORC's suites are run by hand (F9).
- **The merge** is done by Claude once review and tests pass (Justin, 25 Sep). After 22:00, work stays on branches.
- **Deploy:** the checkout is pulled, ORC raises its restart card, Justin approves it, and the agent verifies the
  restart by its start time.
- **State:** `STATE.md` is overwritten at each verified event. Failures go to `FRICTION.md`. Decisions mostly land in
  `STATE.md` (F3).
- **Entropy enters** where the follow-up comes later or never:
  - the second mention of a fact in `STATE.md` (F2);
  - a decision left in `STATE.md` (F3);
  - a boundary changed in a test but not in `AGENTS.md` (F5, F6);
  - a reader in the lab not rerun after an ORC store change (F12).

## Guard placement

**`session-coherence-guard` runs at session end.** Precisely, it runs before any of these, whichever comes first:

- the session's final `STATE.md` overwrite;
- the "Merge request, PR #…" line to Justin, or Claude's own merge;
- telling Justin it is time to stop.

**Why there:**

- It is the last moment the session's own context is available, and its two costliest checks need that context: the
  state file's honesty and keeping Justin's decisions.
- It comes before the merge, so a stale `AGENTS.md` (F5, F6) is fixed in the same pull request, while Danger's
  security-review section is still being written.

The rest of the placement:

- **Actor:** the session's agent. Justin reads the report's summary in the session's last reply and the pull request.
- **Entry point:** a pointer in both repositories' `AGENTS.md` (Discovery plan, below).
- **Output:**
  - a short report, using the guard's own "Report" shape, in the session's last reply;
  - for an ORC pull request, the same summary in its description;
  - state into `STATE.md`, decisions into `decisions/`, failures into `FRICTION.md`.
- **Escalation:** a gap too large for this session becomes an issue under Map A (#141) on #140, and a line in
  `STATE.md`'s "Waiting on Justin" when it needs his decision.
- **Cost:** 2 to 5 minutes of judgment, plus ORC's suites at about two minutes. The suites have to run anyway before a
  merge (F9).

## Adoption plan

### Now

These need no new infrastructure.

1. **Apply the bootstrap patches first**, so the guard starts from a clean baseline:
   - `patches/lab-decisions.patch` (B1);
   - `patches/lab-agents.patch` (B4);
   - the shape of `patches/lab-STATE.md.patch` (B2), applied to the live file;
   - `patches/orc-readme-agents.patch` (B3), in an ORC pull request with
     `## Security review: No new authority; documentation corrected to match enforced boundaries`.
2. **Put the guard at `scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`.** This is provisional on Q2.
   The lab's `skills/` folder exists for this and holds only `.gitkeep`.
3. **Add the two `AGENTS.md` pointers** below.
4. **File one issue under Map A (#141)** holding the B1 to B7 checklist from `assessment.md`. Bootstrap completion is
   tracked there, never in the guard.

### Next

These are light prompts and automation, once missed runs become the main failure.

- **ORC's `.github/pull_request_template.md`:**
  - a `## Coherence` section, "guard run: findings, or none";
  - a `## Package API` placeholder (F21).
- **Danger, in ORC's `dangerfile.js`:**
  - `warn` when `test/architecture.test.ts` changes and `AGENTS.md` does not;
  - `fail` when a `test/core-ties.ts` allowance rises outside what Q3's answer permits. Add this only after Justin
    answers Q3.
- **Tests on every pull request:** take the mechanism Justin chooses on #144. This is not parallel work; the guard's
  "say which suites ran" line is the stopgap until then.

### Later

These come through ORC's own scheduler, once #166 is built (Justin, 4 Oct: the kept processes run through it).

- **The nightly diary (`tools/report.mjs`) also runs the guard's mechanical checks** and shows failures on
  `status.html`:
  - `node tools/map.mjs --check`;
  - the document path check;
  - the `STATE.md` line count against the cap;
  - a core-ties allowance compared with yesterday's snapshot.
- **`tools/collect.mjs` fails loudly** when ORC's database or agent directory is present but unreadable (F12). It
  reads through ORC's own operator commands where they offer machine-readable output; whether they do was not
  checked.
- **lychee** for links, and **agnix or ctxlint** for both `AGENTS.md` files.

## Adoption status

| Guard or check | What it is | Status | What was exercised, and when |
|---|---|---|---|
| `session-coherence-guard` as a whole | A reminder: the `AGENTS.md` pointers prompt the agent | **planned** | Nothing; no commit approved, snapshots read-only |
| The guard's shell commands (change listing, path check, `STATE.md` line count, core-ties diff) | Checks that run, by hand | **verified on scratch copies only**, 7 Oct | Run under bash and zsh on copies of the snapshot with a throwaway git history. The path check found F5 on the original `AGENTS.md`; the core-ties diff caught a deliberately raised allowance. |
| ORC's suites and `map.mjs --check`, as guard steps | Checks that run, by hand | **unknown** | Not run: they need `pnpm install` and GitHub |
| Danger's security-review and package-API checks (existing) | An invariant that is enforced, on GitHub | **unknown here**; `STATE.md:79-82` records them proven on 2 Oct (pass, fail with the section removed, pass restored) | Not re-observed |
| Fresh-session discovery | — | **planned** | Not tried. Claude Code's path to ORC's `AGENTS.md` is unknown, because ORC has no `CLAUDE.md` in the snapshot. |

The guard enforces nothing. It is a reminder plus checks run by hand, and only Danger and the cards refuse anything.

## Discovery plan

**Add to the lab's `AGENTS.md`** (also loaded as `CLAUDE.md`), after "Keeping state":

```markdown
## Before handing off

Before the session's last `STATE.md` update, a merge request, or suggesting Justin stops, run
[skills/session-coherence-guard/SKILL.md](skills/session-coherence-guard/SKILL.md). It covers sessions in this Scope
and in ORC. Report its findings in your last reply.
```

**Add to ORC's `AGENTS.md`**, after "The map of work". This is a guarded path, so its pull request needs
`## Security review: No new authority; instruction pointer only`.

```markdown
## Before handing off

Before a merge request or the end of a session that changed ORC, run the session coherence guard kept in the
orchestration-lab Scope: `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/SKILL.md`.
```

**Each way agents load instructions, and whether it leads to the guard:**

- **Codex and opencode** load `AGENTS.md` natively, in both repositories.
- **Claude Code** loads the lab's `CLAUDE.md`, which is a symlink to `AGENTS.md`.
- **Claude Code in ORC: unknown.** ORC has no `CLAUDE.md` in the snapshot. Check that a fresh Claude Code session in
  `~/pro/orchestrator` names the guard when asked "what must you do before handing off?". If it does not, add a
  one-line `CLAUDE.md` in ORC that points to `AGENTS.md`, or symlinks to it as the lab's does. Never add a second set
  of rules.

## Execution plan

**Order:**

1. What changed, in both repositories.
2. Operational state, read with the time.
3. Mechanical checks.
4. The judgment checks, 1 to 11.
5. Write `decisions/` before `STATE.md`, then `FRICTION.md`.
6. The report.

**What runs in parallel:**

- ORC's `pnpm test`, then `pnpm test:e2e` when needed, can run while the lab's `map.mjs --check` and the operational
  reads go ahead.
- The judgment checks wait for the change listing.

**Outputs:**

- the report, in the last reply and the pull request;
- files updated in the lab: `STATE.md`, `decisions/`, `FRICTION.md`;
- in ORC: `AGENTS.md` and `README.md` corrections, in the same pull request as the change that made them stale.

## Automation opportunities

- **The path check** is stable and repository-wide. Move it into ORC's vitest suite as a test over `README.md`,
  `AGENTS.md` and `SECURITY-REVIEW.md`. Leave the history documents out. It would have caught F5 when `src/bookwhen.ts`
  was deleted.
- **A core-ties rise** becomes a Danger rule once Q3 is answered.
- **The `STATE.md` line count, and one value per live fact,** go into the nightly diary (Later). Keep the judgment
  about which value is right in the guard.
- **Keep as judgment, not scripts:**
  - supersession;
  - decision capture;
  - which document owns a concept;
  - boundary prose against tests.

  Their wording changes faster than a script could follow it.

## Risks and uncertainties

- **Q1 to Q4 are open.** The guard's home, its decision surface for ORC, its core-ties check and its check on where
  reports go all follow the recommended answers. Revise after Justin answers.
- **Sessions after 22:00, and long overnight runs, are the likeliest to skip a 2-to-5-minute guard.** Watch the
  FRICTION log for state-file errors after the guard is in use. If they continue, move to Next sooner.
- **`map.mjs --check` needs `gh` authenticated.** Unattended agents may not have that.
- **The bootstrap `STATE.md` patch is stale on arrival.** The live file has moved since 4 Oct; apply its shape and
  rules, not its lines.
- **One guard for two repositories assumes both are checked out** at the paths in the lab's `tools/collect.mjs`. A
  session in a `/tmp` worktree must set `ORC` and `LAB`.

## Upstream feedback

Yes, there is some. The entropy-guard feedback notes are in `upstream-feedback.md`. The local helper that files them
as GitHub issues was not used, because this run had no web access.
