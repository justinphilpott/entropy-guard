# Integration brief: the session-coherence guard for Iris-app and the orchestration lab

From guards-integrator 0.4.0. This brief reuses the assessment's loop map (`assessment.md`, section 5) and its
findings by id. The guard is `guard/SKILL.md`. Its home is open as Q1 (`questions.md`). Every mechanism below is
**planned**: this run could not commit, push or run anything in the live repositories.

## Placement

The guard is `session-coherence-guard`. Recommended home, on Q1: `~/scopes/scope-orchestration-lab/skills/`.

- **Trigger:** at the end of every agent session that changed either repository.
  - It runs after the session's own tests and Astra reviews.
  - It runs before the session's last `STATE.md` commit and before `node tools/map.mjs session end <id>`.
  - That is the latest point at which the session still holds the context to repair what it broke: the decisions
    taken, the times read, the pull requests merged (F1, F2, F8).
  - Merge verification (check 6) is the exception. The cheap moment for it is **before** each merge, which is #144's
    local gate. Until #144 is built, the guard only catches an unverified merge after the fact (F7).
- **Actor:** the agent that ran the session: Claude, Codex or opencode.
  - When sub-agents did the work, the parent session runs the guard once, because the parent writes `STATE.md`.
  - Justin runs nothing.
- **Entry point:** a pointer in each repository's instructions, which is what a fresh agent reads.
  - Lab `AGENTS.md`, a new section "Before ending a session".
  - Orchestrator `AGENTS.md`, a new section "Before handing off".
  - A line in `STATE.md`'s "How we work".
  - All three are in the provisional Q1 patches.
- **Output:**
  - The guard's report goes in the session's last message to Justin, in his four-heading format.
  - The next action goes into `STATE.md`.
  - New friction goes into `FRICTION.md`.
- **Escalation:** what happens to a gap too big for the session depends on what it is.
  - **Work:** an issue, opened with `map.mjs open --session <id> --under <branch>` so it lands on the map. The guard
    reports pre-existing problems separately, so a session can say which issues it found rather than caused.
  - **A change of intent:** a proposal in `memory/central-scope.md`, "Waiting".
- **Ordering:** after verification, before `STATE.md` and the session end. No other session guard exists, so it does
  not conflict with one. It runs alongside Danger and pr-names-issue, which act on pull requests, not sessions.
- **Cost against how often it fires:**
  - **Frequency:** sessions run several times a day; `STATE.md` changed 17 to 61 times a day.
  - **A lab-only session** fires few checks, because most are conditional: a few minutes of reading.
  - **A session that changed orchestrator code** adds `pnpm typecheck` and `pnpm test`, about two minutes measured on
    the lab's diary run (`tools/report.mjs` header), plus the reach search.
  - This fits the loop. If it proves too slow, the suite moves into #144's merge gate, and the guard only reads that
    gate's log.

## Depth of each check

- **External, now.** The guard is a skill run by hand, with all eleven checks as judgment.
- **Prompted, next.** A line from `map.mjs session end` reminding the session to run the guard first. That command
  is the one habitual pause every session already reaches under Justin's user-wide rule. This is a small change to
  `tools/map.mjs`, after Q1.
- **Semi-embedded, later.** Each item below is stable enough to move into tooling, and each is linked to its existing
  issue rather than started as new work.
  - **The full suite before every merge:** #144's local merge gate, as Justin re-scoped it on 8 Oct. This turns
    check 6 from judgment into a refused merge.
  - **The reach and tool-surface patterns** in `test/architecture.test.ts`: the browser launch, `node:dns`, `fetch`
    passed as a value, and production tools with operator memories (F4, F5). Recommended as part of #328's step 19.
    Check 3 then only judges what the test cannot see.
  - **A missing "where we are" line:** `map.mjs` now says so, in `settled-lab.patch` (F9).
  - **`core.hooksPath` not set to `.githooks` in the live checkout:** `pnpm service:status` could report it (F12). No
    issue found for this; it would need one, opened through the map tool.
  - **Links between the documents:** lychee would check them, but it is not installed on this machine. Install it
    before any guard depends on it.
- **Fully embedded: none yet.** The candidate is required checks on pull requests (#180, GitHub Pro). That is a spend
  decision, so it is Justin's (user-wide rule on spending through Iris-app's permissions).

## Adoption

The guard counts as adopted only when it has run at its trigger and a fresh session finds it. Neither has happened.

| Mechanism | Kind | Status | Evidence | Date |
|---|---|---|---|---|
| `session-coherence-guard` run at session end | executed check | planned | none: Q1 is open, and this run may not commit | 2026-10-10 |
| `AGENTS.md` pointers in both repositories | reminder | planned | `provisional-Q1-guard-home-*.patch`, which applies cleanly to the snapshot | 2026-10-10 |
| `map.mjs session end` reminder | reminder | planned (Next) | not written | 2026-10-10 |
| `map.mjs` says when there is no "where we are" line | reminder | planned | `settled-lab.patch`; `node --check` passes; not run against GitHub | 2026-10-10 |
| #144 local merge gate | enforced invariant | planned (decided 8 Oct, not built) | `reports/2026-10-09-issue-map-scan.md:122` | 2026-10-10 |
| Danger and pr-names-issue | executed check (warns, does not block) | verified by its record, not by me | `FRICTION.md` 8 Oct ("#224's Astra section stayed 'Pending' until Danger said so"); `danger.yml:29-30`, tried on #179 | 2026-10-02 to 2026-10-08 |

**To verify adoption, once Q1 is answered and the patches land:**
- **It has run at its trigger:** the next session's last message carries a completed guard report, and `STATE.md`
  carries its next action.
- **A fresh session finds it:** ask a fresh session, in the lab and in an orchestrator worktree, "what must you do
  before handing off?". It should name the guard and its path. Check this for each way agents load instructions
  here:
  - Claude Code, which loaded `AGENTS.md` in this run;
  - Codex;
  - opencode, which earlier did not load skills from `~/pro/library` (FRICTION, 22 Sep).

**A trial reading, not adoption.** I applied the checks by hand to the evening of 10 Oct. That is lab
`e3d8ca0^..56a32e0` and orchestrator `02d6e3c..a694039`: #367, #369, #370, #372, #376 and #377. The guard could be
followed from the diffs, and four of its checks would have reported something:
- **Check 6, merge verification:** #372 merged after two test files and broke `main` from 19:33 to 19:37. `FRICTION`
  already records this.
- **Check 9, names:** the rewritten `AGENTS.md:173-175` lines say "Iris raises", "since she watches" and "she raises".
  These are new plain "Iris" (and "she") after the 16:51 glossary rule. Q3 is open, so they are reported, not changed.
- **Check 11, live install:** `STATE.md` says "Needs one restart card". Whether the card appeared after the pull
  depends on `core.hooksPath`, which was not read (F12).
- **Check 3, reach:** nothing new from these merges. The problems in F3–F5 were already there and are listed
  separately.

These checks held: the code changes updated the docs beside them (`AGENTS.md` for #367 and #369; the README for
#372 and #377), and the Registry design report's opening was corrected (check 4).

## Plan

- **Now** (needs Q1's answer for the pointers):
  - Apply `settled-orchestrator.patch` as a pull request. It needs:
    - an issue to name, part of #328's step 19 or its own;
    - "Security review: No new authority; documentation";
    - "Astra review: Not needed, documentation only";
    - the empty changeset it already carries.
  - Apply `settled-lab.patch` straight to the lab's `main`. Re-base the `STATE.md` hunk by hand on the current file.
  - Then, on Q1's answer, apply the Q1 patches and run the guard once at the next session end.
- **Next:**
  - Add the `map.mjs session end` reminder.
  - Move `OPERATOR.md`'s live part into the README and archive the rest (F11a).
  - Add `scripts/rehearse.ts` to Danger's guarded list, with an Astra review (F13).
- **Later:**
  - #144's merge gate, which embeds check 6.
  - The architecture test patterns, which narrow check 3 (#328, step 19).
  - A `core.hooksPath` line in `pnpm service:status` (F12).
  - lychee, once installed.
  - When #182 and #166 give Iris-app a scheduler, the lab's design already lists the entropy guard among the
    processes that could run as a scheduled agent (`reports/2026-10-10-scheduled-agent-design.md:186`). A scheduled
    run would complement the session-end run, not replace it, because only the session holds its own context.

## Uncertain

- Whether `core.hooksPath` is set in `~/pro/orchestrator` and in the lab: not checked, because reading their
  configuration was out of bounds.
- Whether Codex, opencode and Iris-app's own agents load `AGENTS.md` or skills automatically: not checked.
- Whether a pull request that adds only documentation still needs an issue that is open on the map: yes by the rule,
  but which issue the settled orchestrator patch should name is Justin's or the session's choice.
- Applying the `STATE.md` hunk later: `STATE.md` is rewritten many times a day, so the hunk will conflict. Its added
  claims are listed in `assessment.md`, section 7, so they can be re-made by hand.
