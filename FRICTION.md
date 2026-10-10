# Friction

What broke in real use, what it cost, and whether it was an instance or a missing system. Newest first. One dated
section per day.

---

## 2026-10-10 — installing the skills, and their first real run on Iris

- **The skills could not be installed as they were.** The four exportable skills named each other as
  `skills/<name>/SKILL.md`, a path that resolves only from this repo's root. Run by name inside Iris, an agent would
  have looked for that path in Iris, and the generator writes the guard to `skills/session-coherence-guard/` in the
  target, so the two meanings of `skills/` would have collided. **Cost:** one commit (`47eae36`), found before any
  run. A **missing system**: nothing had ever installed the skills outside this repo, so nothing tested that their
  references resolve from an installed folder.
- **A hand-made link would not have survived local-config's sync.** Sync removes any `~/.claude/skills/<name>` link
  into `~/.agents/skills` whose skill is not in local-config. **Cost:** none; read before linking, and the links went
  into local-config instead (`91a7338`). An **instance**, recorded in local-config `DECISIONS.md`, 2026-10-10.
- **The skills assume a guard serves one repository.** On Iris and the lab, a system the front door assesses as one,
  the generator still writes one guard "in the repository" with one baseline, and gives no rule for splitting patches
  by repository or for a state file rewritten up to 61 times a day. The run worked around each and wrote them down
  (`explorations/2026-10-10-iris-assessment/skills-feedback.md`). **Cost:** 61 words of the guard, and a `STATE.md`
  hunk that conflicts before it can be applied. A **missing system** in the generator: multi-repository guards.

## 2026-10-07 — the stall's real cause, and the reply cap in codex

- **A test run wrote one cache file into the live ORC checkout.** To confirm the R4c fixture's tests pass, Claude
  linked the live `~/pro/orchestrator/node_modules` into a scratch copy of ORC at `8cee662`, read-only in intent. The
  lockfiles were identical. vitest then rewrote its results cache, `node_modules/.vite/vitest/<hash>/results.json`, in
  the live checkout at 19:01, while Justin had "big work underway" there. **Cost:** none known. The file is
  git-ignored timing data that vitest rewrites on every run. An **instance**: "read-only" was assumed for a tool
  that writes a cache. Next time, copy dependencies, never link them.
- **Correction to the stall entry of 2026-10-05.** The two Astra stalls were not a missing first-output timeout. The
  orchestration lab's `FRICTION.md` (4 October, line 79) found that `opencode run` hangs at `init` whenever another
  `opencode run` is going at the same time. The likely cause is contention on opencode's one shared database
  (`~/.local/share/opencode/opencode.db`, 19 GB), which the lab has not yet proven. One of the lab's three hung runs
  that day was colliding with this repo's run, 17 minutes in. So this session's reviews also cost the lab time.
  Justin's `astra-review` skill (local-config, 2026-10-06) now runs Astra through codex instead. The retrying runner
  written on 5 October treated a symptom; it is not needed.
- **codex loads the same global rules.** `~/.codex/AGENTS.md` links to the same `AGENTS.md` that opencode loads, so
  the 150-200 word reply cap that refused Astra's reports three times will likely apply to `astra-review`'s codex runs
  too. Not yet tested. The skill does not mention it. A **missing system** in that skill, which is Justin's to change.

- **The test's pass rule failed a round on a miss the change could not explain.** Round 7 of the reach-claims test
  (`explorations/2026-10-07-reach-claims-eval.md`) requires every run to meet every item the old skills met. One R2
  run missed half of K13 (a dead `distill-article` reference), which the new rule about reach claims does not touch.
  The old skills were run once per case, so nothing measures how often they meet each item, and an unrelated miss
  cannot be told from a regression. **Cost:** a failed round, and four extra runs overnight to measure the variation.
  A **missing system**: the evaluation compares against one baseline run per case.
- **Scorers read one key item two ways.** In round 1 the baseline met K3 without examining "workflow execution"; in
  round 6 a run was marked down for the same thing. K3's wording predates K21, which requires "workflow execution" to
  stay open. **Cost:** one score re-applied by hand, with the reasoning in the size-cut eval doc. An **instance**:
  K3's wording, now clarified in the reach-claims key.
- **A scorer was started before the run it scored had finished writing** (round 5, R1-final-a). It reported scoring
  the final files, and its quotes match them. **Cost:** a check. An **instance** of Claude's sequencing; scorers now
  start only after every run's last file is written.

## 2026-10-05 — Astra's word cap and stalls, a self-killing command, dating approvals

- **Astra refused to write a full report three times tonight. The cause is opencode, not the briefs.** opencode
  loads Justin's global `AGENTS.md` into every session as system instructions, through
  `~/.config/opencode/AGENTS.md` (a link to local-config). A brief cannot override a system instruction, so a "report
  exempt from the 150-200 word cap" line in the brief lost every time. The same cause produced yesterday's first
  185-word reply. **Fixed for this run** with a short review-mode file loaded through opencode's `instructions`
  setting, as a system instruction, which says the final report is the file that the rule itself sends long audits
  to. Justin's other rules stay loaded. **Cost:** about 20 minutes over two days. A **missing system**: Astra review
  runs have no standing review-mode instruction. It belongs wherever Astra runs are launched from; that location is
  Justin's decision.
- **Astra stalled before its first output for the second time in two days** (19:12 on 4 October, and 22:36 tonight).
  Both times the opencode log stops at `init` and the process sits idle on a connection. **Cost:** 50 minutes in
  all. One cause twice makes this a **missing system**: no first-output timeout. Tonight's runner retries after
  3 minutes without output. It ran once, and the attempt succeeded, so the retry path is written but not yet
  exercised. Like the review-mode file, it belongs beside wherever Astra runs are launched from.
- **Claude killed its own shell with `pkill -f`**, the second self-match in two days after yesterday's watcher. The
  pattern named the very command line that ran it. **Cost:** one lost command. One cause twice: **rule** — kill by
  process ID, never by a pattern the command itself contains. The new runner does this.
- **Two approvals were recorded with the wrong date.** Justin accepted critique groups 2 and 3 on 5 October, at
  17:23 and 17:48. The `DECISIONS.md` amendments and both commit messages said 2026-10-04, because the date was
  carried over from the previous evening rather than read. **Cost:** two pushed commit messages that cannot be
  corrected without rewriting history. The `DECISIONS.md` amendments were corrected at 22:30. An **instance**, because
  dating a decision already has an owner; the date simply was not read when it was written.
- **A trailing blank line reached a commit attempt.** Cutting the generator's "Rationale" section left a blank line at
  the end of the file. `git diff --check` refused it, and it was fixed in the same minute. **Cost:** none. The
  mechanical check did its job.

## 2026-10-04 — reviewing and revising the skills

- **This repo's reminder hook had never run, here or in any clone that followed the README.** The README said to
  symlink `.githooks/pre-commit` to `.git/hooks/pre-commit`. A relative symlink resolves inside `.git/hooks/`, so the
  reminder silently never fired. An "after" test run found it; it was reproduced and fixed with
  `git config core.hooksPath .githooks`. **Cost:** every commit since April went without the reminder this repo's own
  practice relies on. A **missing system**, because nothing checked that the declared hook actually ran. The
  integrator's new "verify adoption" step is that system.
- **Astra's first review returned 185 words instead of a report.** The brief pointed it at Justin's writing rules
  without exempting the report from the 150-200 word reply cap. **Cost:** about 6 minutes and a resumed session. An
  **instance** of brief-writing. Later briefs state the exemption.
- **Astra's critique run hung for 40 minutes with no output.** It sat idle on a stalled connection after start-up.
  It was found only because Justin asked for status; it was killed and restarted, and the restart finished in
  12 minutes. **Cost:** 40 minutes, and a wrong start time reported to Justin (19:40 against the real 19:12). A
  **missing system**: nothing watched the run for output. Later runs had a watcher for first output.
- **The watcher meant to catch a stall raised a false alarm.** Its `pgrep -f` pattern matched its own command line,
  so it kept polling after Astra had finished, and reported "stalled". **Cost:** one confusing notification. An
  **instance**. Next time, match on the process id, not on a pattern the watcher itself contains.
- **Test agents could not write their report files.** The harness refused writes named `report.md` from subagents
  ("Subagents should return findings as text"), so four reports came back as text and had to be saved by hand.
  **Cost:** a few minutes, and a risk of transcription error. Saved text was marked as such.
- **The answer key's case K16 depended on evidence the test target did not contain.** It assumed the dated commit
  that made agentic-architecture reference-only, but the snapshot was a `git archive` with no history. Corrected in
  the open before scoring. **Cost:** one case scored on a revised rule. An **instance**: check that a fixture
  actually contains each piece of evidence a key relies on, before the runs.
- **Claude's own review needed three corrections.**
  - FlowBook's guard was said to come from the session-coherence generator; it came from entropy-assessment.
  - Tests on every PR (#144) were listed as running; they are only decided.
  - ORC's pre-push hook and package-API test were listed as running guards; neither runs before a merge.

  **Cost:** three corrected passages, each marked. An **instance** of stating what runs from names and plans
  rather than from the CI steps and hook bodies.
