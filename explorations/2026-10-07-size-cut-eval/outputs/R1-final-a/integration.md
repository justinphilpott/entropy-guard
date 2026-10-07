# Integration brief: the session-end guard for ORC and the orchestration lab

From `guards-integrator` v0.4.0, after `session-coherence-skill-generator` built `guard/SKILL.md`. Finding ids (F1 to
F21) and the loop map are in `assessment.md` (§3, and §6 Step 3). Only what is missing or different from those is
added here. Nothing below has been exercised: the targets are read-only snapshots, and giving advice does not
authorise a commit or push. Every mechanism is therefore `planned` or `unknown`.

## The loop as it is

- **The smallest unit of change:**
  - in ORC, a pull request: Danger checks it, Claude merges it, then Justin approves a restart card and the
    restart is verified by process start time;
  - in the lab, a commit that overwrites `STATE.md` at a verified event.
- **The habitual pauses:**
  - a pull request opened;
  - a merge;
  - a restart card approved and verified;
  - `STATE.md` rewritten;
  - the 22:00 cut-off (`STATE.md:18`);
  - the day's `FRICTION.md` entry;
  - an Astra report landing in `reports/`.
- **Where follow-up gets lost:**
  - the `STATE.md` overwrite (F1, F10);
  - sessions that start in an ORC worktree and never see the lab's state (F16);
  - reports nobody links.
- **Known pain:**
  - the state file was wrong twice before (`FRICTION.md:621, 866`);
  - E2E was red for a week (F12);
  - a rename across a seam took an agent down for an hour (F13);
  - the diary stopped because nothing ran it (F14).

## Placement

- **`session-coherence-guard`** (the lab's `skills/session-coherence-guard/SKILL.md`):
  - **Trigger:** at the end of each lead session, before the lab commit that rewrites `STATE.md` for the last time
    in that session, and before telling Justin a piece of work is done.
    - **Why there:** it is the latest moment the session still holds the context to fix what it changed, and
      it is the moment `STATE.md` and the decisions are lost (risks 1 and 4 in the assessment).
    - **Not on every lab commit:** `STATE.md` is rewritten at every verified event, several times a day, and the
      full guard per commit would cost more than the drift it catches between events.
  - **Actor:** the lead agent working in the lab: Claude Code, Codex, opencode or Pi, each loading the same user-wide
    rules (`reports/2026-09-30-skills-one-home.md:16-26`).
    - **Who does not run it:** worker runs in ORC worktrees, and Astra's reviews.
    - **How their work is covered:** the lead runs the guard over their changes, with one `<start>` per checkout.
  - **Entry point:**
    - the lab `AGENTS.md`, "Before handing off" (in `patches/lab-state-and-decisions.patch`);
    - for sessions that start in ORC, a pointer in ORC's `AGENTS.md` (below);
    - for workers, one line in their brief (below).
  - **Output:**
    - the report, summarised in the lab commit message;
    - proposals for Justin, recorded in the lab's `decisions/` (provisional until Q1 is answered);
    - the next action, in `STATE.md` "Next".
  - **Escalation:** a gap too large for the session becomes an issue on the map (orchestrator#140), under "Map A: keep
    the system healthy" (#141), and `STATE.md` names it.
  - **Ordering:**
    - after `pnpm typecheck && pnpm test` and after any restart is verified;
    - before the final `STATE.md` rewrite and the lab commit;
    - independent of Danger, which runs later on the pull request and checks something else.
  - **Cost:** about 5 to 10 minutes a run. That covers reading the session's diffs in two checkouts, 11 checks, and
    both test suites, which take "two minutes" together by `tools/report.mjs:10`. The trigger fires about once or twice
    a day, since `FRICTION.md` has one entry per working day, so this fits the loop.

## Depth of each check

- **Now: External.** The guard is a skill run by hand, made findable by the `AGENTS.md` pointers (Prompted, reminder
  only).
- **Next: Prompted at the moment, only if missed runs become the main failure.**
  - **What to add:** a non-blocking `.githooks/pre-commit` in the lab that prints the guard's path when `STATE.md` is
    staged. It follows the pattern of the existing non-blocking `pre-push` hooks, and is vendor-neutral.
  - **What not to add:** a Claude Code hook in `.claude/`, which Codex and opencode sessions would not see.
- **Later: move the stable mechanical parts into tooling, and delete the matching guard check when each lands:**

  | Mechanical part | Where it goes | Finding | Guard check it replaces |
  |---|---|---|---|
  | Tests on every pull request | #144 | F12 | "did `pnpm typecheck` and `pnpm test` pass" |
  | `playwright` imports and `node:dns` confined to `src/adapters/browser/` | `test/architecture.test.ts` | F7 | narrows the boundary check to judgment |
  | Connector setting names tested across ORC and package manifests | orchestrator#198 | F13 | most of the seam search |
  | Every `ORCHESTRATOR_*` variable and `src/` path named in ORC's `README.md` and `AGENTS.md` exists | a test, or ast-grep | F6 | — |
  | Relative links in both repositories | lychee | — | — |
  | `STATE.md`'s cap | a pre-commit check, once Q4 has one number | F11 | the cap half of the state check |
  | The diary and `map.mjs --check` | scheduled jobs through #166 | F14 | — |

- **Keep as judgment, never automate:**
  - whether a boundary statement or the code is wrong;
  - where a decision belongs;
  - `STATE.md`'s wording.

## Making it visible to agents

1. **The lab's `AGENTS.md`**, "Before handing off". It is in the lab patch, and `CLAUDE.md` is a symlink to it, so
   Claude Code meets it too.
2. **ORC's `AGENTS.md`**, a short section for sessions that start in ORC (F16).
   - **Text:**

     ```markdown
     ## Before handing off

     ORC's current state, including which build runs, is recorded in the `STATE.md` of the Scope that manages this
     work, `scope-orchestration-lab`. The session leading the work ends with that Scope's
     `skills/session-coherence-guard/SKILL.md`; a worker session hands its report back to the lead instead.
     ```

   - **How it lands:** `AGENTS.md` is a guarded path (`dangerfile.js:18`), so the pull request needs a
     `## Security review` section, for example "No new authority; a pointer to the managing Scope's state and guard."
   - **One tension:** it names a Scope inside ORC. ORC's `AGENTS.md` already names #140 and Justin, and the core-ties
     ratchet scans `src/`, `web/src/` and `config/`, not `AGENTS.md`. Still, if ORC is published, this section goes.
3. **Worker briefs:** one completion line for opencode and Codex runs on ORC: "Do not edit the lab's `STATE.md`; put
   any decision or learning in your report; the lead session runs the guard." No brief template was found in either
   repository, so the line goes into each brief.

## Adoption

| Mechanism | What it is | Status | Evidence | Date |
|---|---|---|---|---|
| The lab `AGENTS.md` "Before handing off" pointer | reminder | planned | in `patches/lab-state-and-decisions.patch`, not applied | 2026-10-07 |
| The ORC `AGENTS.md` pointer | reminder | planned | text above; needs an ORC pull request (F16) | 2026-10-07 |
| `session-coherence-guard` at session end | executed check | planned | never run at its trigger. Needed: a completed guard report in a lab commit message | 2026-10-07 |
| A fresh session finds the guard | discovery | planned | after the patch lands, ask fresh sessions "what must you do before handing off?" with no other context. Ask Claude Code in the lab, Codex or opencode in the lab, and a session in an ORC worktree. Each loads instructions differently | 2026-10-07 |
| Danger's security-review and package-API checks | enforced invariant | verified, by record only | `STATE.md:79-81`: pass, then fail with the section removed, then pass, on GitHub on 2 Oct. Configuration read in `.github/workflows/danger.yml`; I did not see it run | 2026-10-02 |
| Tests on every pull request (#144) | enforced invariant | planned | decided 4 Oct; mechanism waiting on Justin (F12) | 2026-10-04 |
| Pre-push hooks in both repositories | reminder (a summary only) | unknown | no git configuration in the snapshot (F19) | 2026-10-07 |

## Plan

**Now** (with what exists):
- Copy `assessment.md` and `questions.md` into the lab's `reports/` as `2026-10-07-entropy-assessment.md` and
  `2026-10-07-entropy-questions.md`.
- Apply `patches/lab-state-and-decisions.patch`, which brings the guard, the pointer, `STATE.md` and the decision
  files (F1, F10).
- Run the guard at the end of the next lead session, and put its report in the commit message. That run is the
  adoption evidence.
- Run the fresh-session test.

**On Justin's word** (synthesis item 7 already asks for it): a pull request with `patches/orc-docs-settled.patch`
(F4, F5, F6, F9).

**Next:**
- Justin answers Q1 to Q4.
- Then a pull request with `patches/orc-boundary-provisional.patch` and the architecture-test change, if he answers Q2
  as recommended (F7, F8).
- The ORC `AGENTS.md` pointer (F16).
- The lab pre-commit reminder, if two lead sessions end without a guard report.

**Later:** #144 (F12), #198 (F13), the named-identifier test and lychee (F6), the `STATE.md` cap check (F11), and the
diary and map check through #166 (F14). Delete each guard check its tool replaces.

## Uncertain

- Whether any tool loads the lab's `skills/` folder automatically: not checked. The `AGENTS.md` pointer works either
  way.
- Whether `core.hooksPath` is set in either clone: unknown (F19).
- Whether lychee or ast-grep is installed on athena: not checked. It was outside this run's read scope.
- The cost estimate is reasoned, not measured. The first real run should record how long it took.
