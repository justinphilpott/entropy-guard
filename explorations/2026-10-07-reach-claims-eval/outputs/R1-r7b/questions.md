# Questions for Justin, the steward

Five questions from the 2026-10-07 entropy assessment of ORC and the orchestration-lab Scope. Each one is a choice the
evidence in the two repositories cannot settle, and each answer changes what gets built or what the session-end guard
checks. No steward was available, so the assessment continued on the recommended answer, and every change that depends
on an answer is in `patches/provisional.diff`, not applied. Finding ids (F1 to F20) refer to `assessment.md`.

## Q1. Where should the session-end guard live, and whose sessions does it cover?

- **The statement:** lab `STATE.md:49`, your decision of 4 Oct: "entropy guard at session end" is one of the processes
  kept; `STATE.md:39-40`: the lab is "the central Scope for project management, core issue tracking, code quality and
  security".
- **The readings:**
  - (a) one guard, in the lab at `skills/session-coherence-guard/SKILL.md`, run at the end of every session on ORC or
    the lab, with a one-line pointer from ORC's `AGENTS.md`;
  - (b) one guard in each repository.
- **Where they diverge:** a session renames an environment variable in ORC's `src/web-cli.ts` and updates the "ORC"
  line in the lab's `STATE.md`. Under (a), one run checks ORC's README and the state file together. Under (b), ORC's
  guard checks the README, the lab's guard is never run, and the state file goes unchecked.
- **Recommended: (a).** The lab holds the system's state file and its decisions, you made it the central Scope for
  code quality, and two guards would each carry the same intent rule and pointers, which would then drift. The cost is
  a line in ORC's `AGENTS.md` naming a path in your machine's layout; that file already names orchestrator#140 and you,
  and ORC's open-source rule is checked on `src/` and `web/src/` only (`test/core-ties.ts`). `AGENTS.md` is a
  Danger-guarded path, so the change needs a Security review section ("No new authority").

## Q2. Does a session-end entropy guard already exist that this one should update?

- **The statement:** `STATE.md:43-49`: "The processes kept, all of them: ... entropy guard at session end". "Kept"
  suggests one exists. Neither repository holds one: a search for "entropy", "session end" and "coherence" finds only
  `STATE.md:49,54` and reports, and the lab's `skills/` holds only `.gitkeep` (F18).
- **The readings:**
  - (a) one exists outside these two repositories, for example in `~/pro/local-config/home/.agents/skills/`, and this
    work should update it;
  - (b) none exists for this system yet, and "kept" means the practice continues.
- **Where they diverge:** under (a), installing the draft gives one session two end-of-session rituals; under (b),
  without it nothing runs at session end.
- **Recommended: (b), create the drafted guard.** If a general-purpose one exists elsewhere, the new guard names it
  under "Rules owned elsewhere" rather than copying it.

## Q3. How large may `STATE.md` be: about forty content lines, or sixty lines?

- **The statement:** lab `AGENTS.md:34`: "capped at about forty content lines"; `STATE.md:4`: "Target: sixty lines". No
  recorded decision settles which (F12).
- **The readings:** (a) about forty content lines, blank lines and headings not counted; (b) sixty lines in all.
- **Where they diverge:** a state file of 50 content lines in 58 lines passes (b) and fails (a). On 4 Oct the file had
  99 lines and failed both; the rewrite in `patches/settled.diff` has 37 content lines in 59 lines and passes both.
- **Recommended: (b), sixty lines in all, written once in `AGENTS.md` "Keeping state", with `STATE.md` linking to it.**
  Forty has not held in any recorded rewrite (`FRICTION.md`: 118 lines on 13 Sep, 405 on 23 Sep, rewritten to 66 the
  same day; 99 on 4 Oct), and a total line count can be checked with `wc -l` without judgment. The one-owner part
  stands whichever number you choose.

## Q4. Does ORC's list of network access cover only Node's network calls in ORC's own code, or everything ORC reaches?

- **The statement:** ORC `AGENTS.md:98-101`: "Direct network access exists only in `src/core/research-tools.ts` ... and
  in `src/adapters/notifications/ntfy.ts`"; `test/architecture.test.ts:1295-1310` checks the same two files for Node's
  network calls (F6).
- **The readings:**
  - (a) "direct" means Node's network primitives in ORC's own source, which is what the test checks;
  - (b) the list covers every reach made on ORC's behalf, including through libraries and processes ORC starts.
- **Where they diverge:** `src/adapters/browser/playwright.ts`. It looks up hosts with `node:dns/promises` (lines 14 and
  520), which `AGENTS.md:73` itself counts as an outbound channel, so the list is wrong under both readings there. It
  also launches Chromium (line 55), which loads pages on the hosts a browser grant approves: outside the list under
  (a), inside it under (b). The same split applies to Pi's calls to the model provider, the restart card's
  `pnpm install`, MCP servers, and the Finance package's SMTP connector (`config/installation.ts:168`).
- **Recommended: (b), keeping the test's narrower check and saying what it covers.** `SECURITY-REVIEW.md` question 2
  asks a reviewer which outbound channels a change adds, and they answer from this list. The provisional patch keeps a
  first paragraph for Node's calls (adding `playwright.ts`'s lookup), lists the rest by the process that does it, marks
  SMTP as waiting on orchestrator#137, and extends the test to count DNS imports and to confine browser launches to
  `playwright.ts`. Simulated on this snapshot, both new checks pass.

## Q5. "Credentials are read in one place": one module in all of ORC, or one module per source?

- **The statement:** ORC `README.md:103`: "A credential is read in exactly one place, `src/runtime.ts`"; `AGENTS.md:64`:
  "credentials are read in one place"; your words of 28 Sep in `src/adapters/scope-credentials.ts:14`: "logins
  available through it should DEFINITELY NOT be centralised" (F7).
- **What the code does:** `src/runtime.ts` reads none. `scripts/orc-env.sh` loads `~/.config/orchestrator/env`;
  `src/web-cli.ts:625` reads `ORCHESTRATOR_WEB_TOKEN`; `src/app/agent-packages.ts:772-777` reads connector credentials
  from the environment or, through `src/adapters/scope-credentials.ts`, from the Scope's own folder.
- **The readings:** (a) one module reads every credential in ORC; (b) each source (ORC's env file, a Scope's folder)
  is read by one module.
- **Where they diverge:** the web token's read in `src/web-cli.ts:625` is a defect to move under (a) and correct under
  (b).
- **Recommended: (b).** It follows your 28 Sep words, which keep each Scope's logins with that Scope, and still gives
  each source one place to look. The provisional patch rewrites the README sentence and `AGENTS.md:64` that way.
- **Not part of this question:** "No subprocess ORC launches receives one" (`README.md:104`) is contradicted by
  `src/adapters/orc-service.ts`, whose git, pnpm, systemctl and node processes inherit ORC's whole environment. That
  is a defect in the code, not the document, and the assessment proposes giving those processes an explicit
  environment.
