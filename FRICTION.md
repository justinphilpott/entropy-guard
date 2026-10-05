# Friction

What broke in real use, what it cost, and whether it was an instance or a missing system. Newest first. One dated
section per day.

---

## 2026-10-05 — dating approvals, a whitespace slip, and Astra's word cap again

- **Astra returned a summary instead of a report, for the second time in two days.** The size-review brief exempted
  the report from Justin's 150-200 word reply cap in its opening paragraph. Astra still applied the cap, because it
  ranked the global rules above the brief. **Cost:** about 5 minutes and a resumed session. Two failures from one
  cause make this a **missing system**: there is no standing Astra brief template that states, in terms of Justin's
  own rule ("Long tables, audits and multi-part comparisons go to a file"), why a report is exempt. Every brief is
  still written from scratch. Astra briefs are run from the lab Scope, so the template belongs there; recorded here
  for the morning.
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
