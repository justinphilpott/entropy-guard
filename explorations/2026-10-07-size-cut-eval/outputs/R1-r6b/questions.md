# Questions for Justin

Four questions from the entropy-guard assessment of ORC and the orchestration lab, 7 October 2026. Each one is a gap
the evidence cannot settle and whose answer changes what gets built or what the guard checks. No steward was present,
so each carries the recommended answer the run continued on; the work that depends on it is in the named
provisional patch and is not to be applied until you answer. Finding ids (F1 to F19) are in `assessment.md`.

## 1. Where does the session guard live, and which instruction files point to it?

- **The statements.** Your 4 Oct interview (lab `STATE.md:38-49`): "The lab is the central Scope for project
  management, core issue tracking, code quality and security", and "entropy guard at session end" is kept. The
  skill-home rule of 30 Sep (`reports/2026-09-30-skills-one-home.md:46-49`): a skill used across projects lives in
  local-config, one used by one Scope's agents in that Scope's `skills/`, one used for one code repository in that
  repository. A guard for two repositories fits none of the three exactly.
- **The readings.**
  - (a) One guard in the lab's `skills/`, covering both repositories, pointed to from both `AGENTS.md` files.
  - (b) One guard per repository.
  - (c) One guard in local-config, loaded everywhere.
- **Where they diverge.** A Codex session in an ORC worktree finishes the CI job for #144.
  - Under (a), ORC's `AGENTS.md` sends it to the lab's guard, which checks ORC's README and the lab's `STATE.md` together.
  - Under (b), it runs ORC's guard, which must still send it to the lab's `STATE.md`, `decisions/` and `FRICTION.md`,
    so the two guards repeat half their checks.
  - Under (c), the same checks load in projects that have no `STATE.md` or map.
- **Recommended: (a).** The state file, the decisions, the map tooling and the friction log all live in the lab, and
  you made the lab the central Scope for code quality; one guard keeps one owner for those checks. ORC's `AGENTS.md`
  would name a path in a private Scope, which its open-source rule does not forbid: that rule scans `config/`, `src/`
  and `web/src/`, and `AGENTS.md` already names #140 and `~/pro/agentic`. Also recommended under (a): a `CLAUDE.md`
  link to `AGENTS.md` in ORC, as the lab has, if Claude Code sessions work there (F13); that is a change to ORC's
  file layout, so it waits for your yes.
- **Patches:** `provisional-Q1-lab.diff`, `provisional-Q1-orchestrator.diff`.

## 2. Which file owns the size limit of the lab's `STATE.md`, and what is it?

- **The statements.** Lab `AGENTS.md:34`: "capped at about forty content lines". `STATE.md:4`: "Target: sixty lines".
  Neither is dated or attributed.
- **The readings.** Forty content lines, or sixty lines in all.
- **Where they diverge.** The `STATE.md` rewritten in the settled patch has 59 lines, 47 of them content lines: inside
  sixty, over forty. Getting under forty means dropping open work that has no other record this run could verify: the
  five map follow-ups and the three 3 Oct decisions.
- **Recommended:** `AGENTS.md` owns the limit, because `STATE.md` is overwritten at every verified event and would
  carry its own rule away with it; `STATE.md` links to it. The number is yours; the recommendation is sixty lines
  in all for now, returning to forty once the 3 Oct decisions and the map follow-ups are confirmed on their issues.
- **Patch:** `provisional-Q2-lab.diff` (the link only; the number is written in `AGENTS.md` when you give it).

## 3. Where are decisions about ORC's direction recorded?

- **The statements.** Lab `AGENTS.md:16`: something true of ORC goes in ORC's repository, which has no decision log.
  The one ORC architecture decision on record is in the lab's `decisions/2026-09-17-async-work-architecture.md`. Your
  north star (25 and 26 Sep) and the merge rule (25 Sep) exist only in `STATE.md`, apart from one report quoting the
  north star (F3, F4).
- **The readings.**
  - (a) The lab's `decisions/`.
  - (b) A new `DECISIONS.md` in ORC.
  - (c) The GitHub issues on the map.
- **Where they diverge.** The north star: under (a) it goes to the lab's `decisions/`, beside the 17 Sep decision;
  under (b) it goes into ORC's repository, which would carry it into the open if ORC were published, as its
  open-source rule imagines; under (c) it needs an issue that is never closed.
- **Recommended: (a)** for direction and for working rules, with ORC's `AGENTS.md` keeping the standing rules an
  agent must follow when changing ORC's code, each citing its source, as it does now. The lab's `decisions/` already
  exists and already holds an ORC decision, and adding a second register is what the intent pass avoids.
- **Patches:** `provisional-Q3-lab.diff` (copies the north star and the merge rule, verbatim, to
  `decisions/2026-09-25-north-star-and-merge-rule.md`, and links `STATE.md` to it), `provisional-Q3-orchestrator.diff`
  (one sentence in ORC's `AGENTS.md`).

## 4. Is "No subprocess ORC launches receives one [credential]" a boundary or a description?

- **The statement.** ORC `README.md:104`, in its "Credentials" section.
- **What the code does.**
  - The Chromium that `src/adapters/browser/playwright.ts:55-69` launches for a browser session is given the Scope's
    login (`storage-state`) as its cookies. Before 3 Oct the Playwright MCP server was
    (`memory/slots-run-walkthrough.md`, step 11).
  - The restart card's commands in `src/adapters/orc-service.ts` (git, `systemctl`, `pnpm install`, the build) are
    run without an `env` option, so they inherit ORC's environment, which `scripts/orc-env.sh` fills from
    `~/.config/orchestrator/env`, including `ORCHESTRATOR_WEB_TOKEN` when it is pinned.
- **The readings.**
  - (a) A boundary. The browser login is an exception that needs your decision. The restart card's environment is a
    defect in the work.
  - (b) A description that was never a control. Reword it to say what happens, and change nothing else.
- **Where they diverge.** Approving "Restart ORC onto <commit>" runs `pnpm install --frozen-lockfile` holding the web
  token. Under (a) that gets fixed with a minimal environment; under (b) the README is reworded and it stays.
- **Size.** The restart card's commands are git, systemctl, pnpm and ORC's own build script, so the exposure there is
  small; whether pnpm runs any dependency's install script during that install was not checked. The browser case is
  the material one: Chromium reads Bookwhen admin pages that carry customer-written text, the case ORC
  `AGENTS.md:76-80` allows only behind enforced controls.
- **Recommended: (a).** The sentence sits in the section that bounds where credentials go, and rewriting a boundary
  to match the code is what the intent-change rule forbids. Record the browser-login exception as your decision,
  confined to the card's allowed hosts, and file a map issue under security (#145) to give the restart card's commands
  a minimal environment.
- **Patch:** `provisional-Q4-orchestrator.diff` (the exception in `README.md` and in `AGENTS.md`'s subprocess list,
  with a placeholder for your decision's date and record). Apply it with the `orc-service.ts` fix, or the sentence
  stays false for the restart card.
