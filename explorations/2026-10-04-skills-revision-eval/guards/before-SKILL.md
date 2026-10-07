---
name: orc-lab-entropy-guard
description: Session-end check for work on ORC (~/pro/orchestrator) and the Orchestration Lab Scope (~/scopes/scope-orchestration-lab). It keeps STATE.md honest, puts decisions and learnings in their one home, keeps ORC's README and AGENTS.md in line with the code and tests, catches dead names and revived superseded designs, and checks the lab's tools still read ORC. It covers only what this session changed.
metadata:
  generated: "2026-10-04"
  source: "entropy-assessment v0.6.0 -> docs-first-planning-assessment v0.1.0 -> guards-integrator v0.2.2"
  system_snapshot: >
    ORC: TypeScript service, about 26k lines in src/, 62 vitest files plus a Playwright E2E suite. Boundaries
    are enforced by test/architecture.test.ts, core-ties and source-header ratchets, the package API report,
    and Danger's security-review check. No CI test run (#144). Lab: markdown-first Scope holding STATE.md
    (overwrite-only), FRICTION.md, AGENT_IDEAS.md, decisions/ (1 file), memory/, 78 dated reports, and
    tools/map.mjs, report.mjs and collect.mjs. Work is tracked on GitHub under orchestrator#140. Agents:
    Claude, Codex and opencode; Astra reviews.
  integration: "standing instruction in the lab's AGENTS.md ('Keeping state'), one pointer line in ORC's AGENTS.md"
---

# Skill: ORC and Lab Entropy Guard

Run this at the end of a working session on ORC or the lab, before your final message. Justin kept "entropy
guard at session end" as a standing process on 4 Oct 2026 (lab `STATE.md`).

> **Scope: what this session changed, not the whole project.** Every check opens with an "if". Most answers
> will be "no, nothing to do". A quiet session clears in about two minutes; a session that merged and
> restarted ORC takes about five to ten. If you find yourself auditing every document, stop: file what you
> found as an issue on the map (orchestrator#140) and finish the session.

**Paths used below.** ORC is `~/pro/orchestrator` (run ORC commands from its checkout, or from your worktree
for branch work). The lab is `~/scopes/scope-orchestration-lab`.

## When to run

- At the end of any session that changed either repository, merged or restarted anything, or recorded
  something Justin decided.
- Before you tell Justin a session's work is done, or that he can stop for the night. The guard's one-line
  result goes in that message.

## When not to run

- **After a typo or formatting-only change.**
- **During read-only review runs** (for example Astra's adversarial reviews). Those write reports, not state.
- **As a substitute for the existing rule** that STATE is overwritten at each verified event. This guard
  catches what that rule missed during the session; it does not replace it.
- **More than once for the same piece of work.**

## Step 0: name the delta (30 seconds)

Write down, for yourself:

- the ORC commits and PRs this session made or merged;
- the lab files it changed;
- any live events (a restart, a card approved, a run on real Bookwhen);
- anything Justin decided.

The checks below apply only to those.

## Checklist

Run them in this order. The STATE check comes last because it summarises the others.

### 1. Tests, until orchestrator#144 runs them automatically

*If ORC code changed:*

- did `pnpm typecheck && pnpm test` pass on the final commit?
- did you run `pnpm test:e2e` if the web client, composition or approval flow changed?
- Say which in your final message. If a count goes into STATE, it must be the current figure.

> *Why:* nothing runs the suites on a PR. The E2E suite was red on `main` for a week, unnoticed
> (`FRICTION.md`, 2026-09-27). When #144 lands, delete this check.

### 2. ORC's docs against ORC's code

*If this session added, removed or renamed any of these in ORC, or changed what an agent can reach:*

- a module;
- a tool;
- an environment variable;
- a script;
- a subprocess or network path;
- something README calls present or absent.

Then:

- **Update `README.md` and `AGENTS.md` in the same PR.** The truth about boundaries is
  `test/architecture.test.ts`. Where the description and the test disagree, change the description, or change
  the test deliberately, with a security review.
- **Run the path check** from ORC's checkout. It prints nothing when every path the live docs name exists:

  ```bash
  bash -c 'for f in README.md AGENTS.md SECURITY-REVIEW.md; do
    grep -o "\`\(src\|test\|scripts\|config\|web\|e2e\)/[A-Za-z0-9_./-]*\`" "$f" | tr -d "\`" | sort -u |
    while read -r p; do [ -e "$p" ] || echo "$f names missing $p"; done
  done'
  ```

- **For each source file you touched, re-read its header's `Today:` lines.** Are they still true? For example,
  `src/core/iris.ts` says "until slice 3b".
- **`AGENTS.md` is a guarded path.** A PR that edits it needs a `## Security review` section. "No new
  authority; documentation brought in line with `test/architecture.test.ts`" is a complete answer.

> *Why:* on 4 Oct, `AGENTS.md` named the missing `src/bookwhen.ts` and left `src/adapters/orc-service.ts` off
> its subprocess list. `README.md` still told newcomers to set a Bookwhen token for a dependency the
> architecture test forbids. Reviews flagged the README on 29 Sep and 1 Oct, and it stayed stale because
> nothing ran at the moment the code changed.

### 3. Names that agents read

*If you renamed or removed a tool, command, script, environment variable or path,* search both repositories'
agent-facing text for the old name:

```bash
OLD='old_name'
grep -rn -- "$OLD" ~/pro/orchestrator/{AGENTS.md,README.md,SECURITY-REVIEW.md,src/core} \
  ~/scopes/scope-orchestration-lab/{STATE.md,AGENTS.md,SCOPE.md,memory,skills}
```

Fix every hit that is not deliberately historical.

> *Why:* the Moving Stillness agent was told for six days to find entries with a tool that had been removed,
> and the dead name was copied into memory from that line (`FRICTION.md`, 2026-09-27).

### 4. Superseded designs

*If you are about to act on, cite, restore, or fix a broken reference in any of these, stop and check
supersession first:*

- one of ORC's root task reports: `CLASSIFY`, `FIXES`, `GRANTS`, `GRANTS-E2E`, `MCP`, `OPERATOR`,
  `POLICY-STORE`, `REWORK`, `SEAM`, `SLICE1`, `TURN-RECORD`, `VISIBILITY`;
- a lab report in `reports/`;
- a file such a report names.

These are history. Never recreate a file just because a report names it.

Known supersessions (keep this list short, and add to it only when you supersede something):

- **The browser.** It no longer runs through MCP. ORC drives Playwright's library itself (#76, 3 Oct).
- **Bookwhen.** Bookwhen code lives in the Moving Stillness Scope, not in ORC. The test enforces this.
- **Authority.** It is granted by operator commands and approval cards, not by editing
  `config/installation.ts`. `unavailableOperations` was removed; `grantedOperations` is the control.
- **The security trailer.** Danger on GitHub replaced the pre-push trailer check (2 Oct).
- **Branch cleanup.** `wt remove` and `gh poi` replaced `git-tidy-report` (2 Oct).
- **Issue classification.** The map (#140) replaced ORC's labels for it; labels are partly stale.
- **Scope Deck.** `status-tracker` is archived and is not architecture authority.

Before reopening a question, check the lab's `decisions/`, `STATE.md` and #140.

> *Why:* twelve root reports sit beside ORC's `README.md`, several saying "Nothing pushed" or naming files
> that are gone. `reports/2026-09-30-skills-one-home.md` opens with Justin: "we've had this discussion so
> many time".

### 5. The lab's readers of ORC

*If this session changed ORC's durable-work database or state directory, or a format the lab's readers parse,
check them.* The formats that count are:

- the `tasks` and `events` tables, or the `task_type`, `state` and `body` columns;
- `ORCHESTRATOR_STATE_DIR`;
- the front matter of `src/core/*.md`;
- vitest's summary line;
- `FRICTION.md`'s heading shape.

Run `node tools/report.mjs --no-tests` in the lab and look at `status.html`:

- "ORC runs completed / failed" must reflect real runs;
- the agent list must not be empty.

> *Why:* `tools/collect.mjs` turns every read failure into null, and the diary then shows **0 / 0**, not an
> error. It hard-codes `~/.local/share/orchestrator-proof`, while ORC reads its state directory from its
> environment file. It has broken this way before (its own header: "readers pointed at ORC paths that have
> since moved").

### 6. Learnings

*If something broke in real use, or behaved unexpectedly:*

- add it at the **top** of the lab's `FRICTION.md`, under `## YYYY-MM-DD — <what happened>`, with findings as
  `- **...**` bullets (`tools/collect.mjs` counts exactly that shape);
- say whether it is **an instance** or **a missing system**;
- mark it **(workshop)** when only this development setup would hit it;
- if it is a fact about ORC's product that ORC's docs should carry, change ORC's docs too, per the lab's
  `AGENTS.md` table "Where a learning goes".

*If you recorded an agent, tool or skill idea,* it is in `AGENT_IDEAS.md` and committed on its own
(lab `AGENTS.md`).

### 7. Decisions

*If Justin decided something this session* (a "yes", a "B", an interview answer, a choice between options):

- **Record it once, in its home, with his words and the date:**
  - a lab or relationship decision goes in the lab's `decisions/` (one dated file per decision session);
  - an ORC rule goes in ORC's `AGENTS.md`, in a PR;
  - a cross-project rule belongs to local-config, outside this guard.
- **STATE may summarise it in one line with a link.** It is never the only copy, because STATE is overwritten.
- **If it supersedes an earlier decision,** say so in both places, and add a line to check 4's list if a
  fresh agent could plausibly revive the old one.
- **Anything you cite as the record must be a committed file in one of these repositories.** Not chat, and not
  a vendor folder such as `~/.claude/plans/`. If the record exists only there, copy its substance in.

> *Why:* the 4 Oct interview decisions existed only in `STATE.md`. `decisions/` held one file.
> `memory/authority-rules-step-1.md` points at a plan in `~/.claude/plans/`.

### 8. STATE.md is honest

*If anything in Step 0 happened,* re-read the lab's `STATE.md` lines it affects, and:

- **Overwrite, do not add beside.** A PR that merged replaces the line that said "in review". A restart
  replaces the line that said which build runs. Delete lines this session made false.
- **One fact, one line.** Search the file for the facts you touched (a PR number, a commit, "live", "paused",
  "restarted") and make every mention agree.
- **Live facts come from the live source, with where and when.** What ORC runs comes from `pnpm
  service:status` in ORC's checkout, read now. Do not restart or build ORC to check. A grant or login carrying
  a date in the past is removed or marked expired.
- **Length is within the cap stated in the lab's `AGENTS.md` ("Keeping state").** Check with
  `grep -c . STATE.md`. If it is over, the excess is history (it belongs to `git log`) or decisions (check 7).
  The fix is moving it out, not compressing it.
- **The "Updated" line at the top is now.**

> *Why:* a state file is wrong in exactly the places nobody re-reads (`FRICTION.md`, 2026-09-22). On 4 Oct at
> 17:31 STATE said both "#193 in review, not merged" and "#193 is live". It named two different builds as
> running, listed a grant that expired on 1 Oct, and ran to 87 lines against a cap stated as 40 in one file
> and 60 in another.

### 9. The map

*If you opened, closed or worked on issues:*

- `node tools/map.mjs --check` in the lab exits 0, so every open issue is on the map;
- you cleared your own marks with `node tools/map.mjs stopped '<ref>'`.

## Check against this guard's own entropy

- **Did this run make you write one fact in two places?** Keep the canonical home and turn the other into a
  link.
- **Before scripting any check above, is its invariant durable?** File existence and a line count are durable.
  STATE's wording, FRICTION's prose and the supersession list are not, so they stay in this narrative guard.

## Output

Put one line in your final message to Justin, and in the commit message of the lab commit if there is one:

- `entropy check: clean`, or
- `entropy check: updated <files>; filed <issue refs>`.

Say which kind of drift it was:

- **state** (STATE.md);
- **map** (ORC's docs against its code);
- **practice** (the workflow was not followed);
- **reader** (the lab's tools).

If a gap is too big to fix now, file it on the map under #140 and name it in that line. Do not widen the
session.

## What this is not

- **A full audit.** Reviews, the weekly adversarial review and the diary do that.
- **A replacement for `test/architecture.test.ts`, Danger, or tests on every PR.** Mechanical checks belong
  there; this guard only prompts until they exist.
- **Static.** Re-run the generator (entropy-guard's `entropy-assessment`) when either repository's
  documentation structure changes, for example after ORC's root reports are demoted, or after #144 or #166
  land.
- **The place to track bootstrap work.** Record that as issues under #140, never by editing this file.
