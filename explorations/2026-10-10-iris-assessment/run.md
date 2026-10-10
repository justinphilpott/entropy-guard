# How this assessment was run

The first real run of the installed skills, on Justin's "you can run it from here" (10 October 2026).

- **Skills:** the four exportable skills as installed in `~/.claude/skills` (folder links into this repo), at
  `45c8373` on branch `reach-claims-show-search`, so including the patch check under test there.
- **Targets:** read-only `git archive` copies of Iris (the orchestrator repository) at `origin/main` `a694039`
  (Release 0.5.4) and the lab Scope `scope-orchestration-lab` at `origin/main` `56a32e0`, both read at about 21:00
  on 10 October. The run could read history from the live repositories up to those commits, read-only.
- **Runner:** a fresh Claude Opus 5.5 `general-purpose` subagent, with no web, no other entropy-guard material, and
  no steward: it wrote its questions for Justin with recommended answers. 163 tool calls, 31 minutes.
- **Nothing in Iris or the lab was changed.** The patches here are proposals against the copies.

## Checked by the coordinating session before reporting

Each against the copies or the live history, on 10 October:
- **F1:** the merge grant to 15 October appears only in the lab's `STATE.md:19` (and in passing in one report);
  `STATE.md` had 61 commits on 8 October.
- **F3:** orchestrator `AGENTS.md:141` still names `src/bookwhen.ts`, which `19a5561` deleted on 15 September.
- **F4:** `src/adapters/browser/playwright.ts:55` launches Chromium, which the subprocess list in `AGENTS.md` does
  not name; `AGENTS.md:135` says the connector searches Brave, while `config/installation.ts:43` sets `"kagi"`.
- **F7:** `.github/workflows/` holds `danger.yml`, `pr-names-issue.yml` and `release.yml`; none runs the tests.
- **Guard size:** 1,217 words by `wc -w`, against the 1,261 the run derived.

Not checked: F2, F5, F6 and F8 to F14, and whether the patches still apply to today's files. `STATE.md` changes many
times a day, so the lab patch's hunk on it will need re-basing.
