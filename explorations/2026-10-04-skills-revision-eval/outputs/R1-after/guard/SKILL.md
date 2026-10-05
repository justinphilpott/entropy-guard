---
name: session-coherence-guard
description: Check ORC (~/pro/orchestrator) and the orchestration-lab Scope together at the end of a work session, before the last STATE.md write and before handoff.
metadata:
  generated: "2026-10-04"
  source: "entropy-guard session-coherence-skill-generator v0.3.0"
  covers: "~/pro/orchestrator and its worktrees; ~/scopes/scope-orchestration-lab"
  provisional: "Its placement, its coverage and its decision surface wait on Justin's recorded answers (lab decisions/)."
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run this at the end of a work session, before you overwrite `STATE.md` for the last time and before you hand off or
end your turn. Check only this session's change, in both repositories.

## When to use

- The session changed ORC or the lab: commits, uncommitted work, or a pull request merged.
- The session changed the running system: ORC restarted, a card approved, a grant or a package approval made.
- You are about to rewrite `STATE.md` after a compaction.

## When not to use

- The session only read or answered questions, and changed nothing.
- The change is a typo or formatting fix in one file.
- The work is in another repository on the map, such as Moving Stillness, the ops tool, finance or scope, and it
  touched neither ORC nor the lab.

## Where things live

Read these. Do not copy them into this guard.

- **Authorised intent.** The steward is Justin (`scope.yaml`, field `steward`). The intent documents are:
  - the lab's `SCOPE.md` and `scope.yaml`;
  - the lab's `decisions/`;
  - the sections of ORC's `AGENTS.md` that quote Justin;
  - the "Direction" section of ORC's `README.md`;
  - the rules in the description of the map's root issue. The root is named in the lab's `AGENTS.md`, and in
    `MAP_ROOT` in `tools/map.mjs`.
- **Current state and next steps:** the lab's `STATE.md`. Read it first.
- **Decisions:** the lab's `decisions/`.
- **Where a learning goes:** the table in the lab's `AGENTS.md`.
- **What broke in real use:** the lab's `FRICTION.md`. New agent ideas go in the lab's `AGENT_IDEAS.md`.
- **What ORC enforces, as opposed to what it describes:** ORC's `test/architecture.test.ts`, `test/core-ties.ts` and
  `dangerfile.js`.
- **Rules owned elsewhere.** Follow them where they live; this guard does not restate them.
  - `~/pro/local-config/home/AGENTS.md`: how to state anything about a live service, spending, worktree cleanup, how
    to ask for a merge, and naming a failure as an instance or a missing system.
  - ORC's `SECURITY-REVIEW.md` and `dangerfile.js`: the "Security review" and "Package API" sections of a pull request.
  - The "Security review" section of ORC's `AGENTS.md`: ORC is restarted and built only through its cards.
  - The map's root issue: where a new issue goes.
  - `~/pro/agentic/HOW_NOT_TO_PLAN.md`: the pace of new design work.
  - `~/pro/scope/docs/MODEL.md`: the Scope model.

## What changed this session

```bash
ORC=~/pro/orchestrator                 # or the ORC worktree this session used
LAB=~/scopes/scope-orchestration-lab
START_ORC=<ORC commit at session start>; START_LAB=<lab commit at session start>   # else origin/main
for R in "$ORC:$START_ORC" "$LAB:$START_LAB"; do
  D=${R%%:*}; S=${R##*:}; echo "== $D since $S"
  git -C "$D" log --oneline "$S..HEAD"
  git -C "$D" status --short
  git -C "$D" diff HEAD --stat
  git -C "$D" ls-files --others --exclude-standard
done
gh pr list --repo justinphilpott/orchestrator --state merged --limit 20 --json number,title,mergedAt
gh pr list --repo justinphilpott/scope-orchestration-lab --state merged --limit 20 --json number,title,mergedAt
```

- Count a merged pull request only if its `mergedAt` falls after the session started.
- If you do not know the start commit, compare against `origin/main` and report "coverage incomplete: compared against
  origin/main".

**Changes outside the files.** Read these live, and write down the time you read each one.

```bash
cd ~/pro/orchestrator
pnpm service:status                                              # unit, build ORC runs and since when, checkout commit
scripts/orc-env.sh pnpm -s list:async-work -- --state input_required    # cards waiting for Justin
scripts/orc-env.sh pnpm -s list:approval-grants                         # standing grants and their expiry
# only if a package was rebuilt or approved this session:
scripts/orc-env.sh pnpm -s status:agent-packages -- <absolute scope root> <agent name>
```

Run the operator commands through `scripts/orc-env.sh`. Run without it, they read ORC's default state directory
rather than the one the running ORC uses, and they show nothing (lab `FRICTION.md`, 2026-09-28).

## Modes

- **Plan or suggest-only:** inspect and report. Do not edit.
- **Build or just-do-it:** inspect, then make the coherence fixes.
- **Discuss-first:** propose changes before editing.
- **Audit-only:** report the risks only.

## Intent

- Does this session's change fit the authorised intent in the documents listed above?
- When the work and the authorised intent disagree:
  1. Decide which it is: a defect in the work, an adaptation within what was authorised, or a decision nobody has
     made.
  2. Fix a defect in the work.
  3. Record an adaptation or an unmade decision as a proposal for Justin, in the lab's `decisions/`, marked as
     proposed.
  4. Do not edit the lab's `SCOPE.md`, `scope.yaml` or `decisions/`, ORC's `README.md` "Direction", or the quoted
     sections of ORC's `AGENTS.md` to match the work, unless Justin has recorded that decision.
  5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
     decision.
- **Did Justin decide something this session?** Then it goes into `decisions/`, dated and in his words, naming any
  entry it supersedes. `STATE.md` gets one line with a link, not the decision itself.

## Judgment checks

**State honesty: the lab's `STATE.md`.**

- Does every statement about a live service carry where it was read and when? This covers which ORC build runs, the
  restarts, the Moving Stillness builds, grants, logins and the cards waiting.
  - Re-read it this session, or date it and call it old.
  - Check it against the `pnpm service:status` you read above.
- Is there exactly one statement of which build ORC runs? Do no two lines disagree about what is live, what is merged,
  or what is paused?
- Is any expiring fact already past its date, such as a grant end time or a credential change that is due? Remove it,
  or restate it with its date.
- Is the file overwritten rather than appended to?
  - Are finished items gone? Their history lives in git, `FRICTION.md` or `reports/`.
  - Is the file within the cap in the lab's `AGENTS.md`, "Keeping state", and does its own header agree with that cap?
- Does the `**Where we are now:** #N` line name the issue actually being worked? `tools/map.mjs` reads that line.
- Can a fresh session find the first concrete action without rediscovering the context?

**ORC's documents against its code.** Check only what this session changed.

- **What an agent can reach.** This applies if the session changed tools, a subprocess, the network, the browser,
  credentials or packages: `src/tools.ts`, `src/runtime.ts`, `config/installation.ts`, `src/core/research-tools.ts`,
  `src/adapters/notifications/`, `src/adapters/browser/`, `src/adapters/mcp/client.ts`,
  `src/core/child-agent-process.ts`, `src/core/analysis-tools.ts` or `src/adapters/orc-service.ts`.
  - Do the "Boundaries" lists in ORC's `AGENTS.md` still match `test/architecture.test.ts`? That covers the parent's
    tools, the subprocess modules, the direct-network modules and credentials.
  - Where the prose and the test differ, the test is the record. Reduce the prose to what the test enforces, and name
    the test.
- **A capability added, removed or moved out to a Scope.** Are ORC `README.md`'s intro, "Run", "Boundary" and
  "Deliberately absent" still true? Does every environment variable and `pnpm` command they name still exist?
- **A source file changed.** Is the "Today:" line in its header still true? The architecture test requires the header;
  nothing checks that it is true.
- **`GUARDED` changed in `dangerfile.js`.** Does `SECURITY-REVIEW.md`, "Which changes ask for this", link to it rather
  than list paths? Does the guarded-path test in `test/architecture.test.ts` still match?
- **The Pi version changed.** Does the "Pi" section of `README.md` match `package.json`?
- **One owner, not two copies.** When a change touches something two documents both describe, decide which owns it,
  and reduce the other to a link.
- **Supersession.** Before reviving a concept, restoring a file, or copying a path or tool name out of prose, check
  that it still exists in the code. Check too that `decisions/`, `STATE.md` or an issue has not retired it.
  - ORC's root branch reports, `REWORK.md`, `SEAM.md`, `OPERATOR.md`, `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md` and
    `GRANTS-E2E.md`, are history, not current design.

**Seams between the two repositories.**

- **ORC's durable-work store or its state directory changed** (`src/adapters/async-store/sqlite.ts`,
  `getDefaultStateDir` in `src/runtime.ts`). Do the lab's `tools/collect.mjs` `durableWork()` and `ORC_STATE` still
  read real data? They return `null` silently when they do not.
- **ORC's agent-definition files or their shape changed.** Does `agents()` in the lab's `tools/collect.mjs` still read
  them?
- **The lab's `FRICTION.md` or `STATE.md` changed.** Does every new heading read `## YYYY-MM-DD — title`, with the date
  first and then the dash? `friction()` in `tools/collect.mjs` skips any other form. Is the "Where we are now" line
  intact?
- **A fact was learned this session.** Is it filed where the table in the lab's `AGENTS.md` says? A fact true of ORC
  goes in ORC's repository; a fact about the relationship goes in the lab's `memory/`.

**Workflow.**

- **Each pull request this session.** Did it get past Danger's checks, with sections that say something real? Were
  the tests run and their counts recorded, while no CI job runs them? See the mechanical checks below.
- **Real-use breakage.** Is it in `FRICTION.md`, newest first? Is each new agent, tool or skill idea in
  `AGENT_IDEAS.md`, committed on its own?
- **The map.** Is each new issue placed on the map? Did you clear your own In Progress marks
  (`node tools/map.mjs stopped <ref>`)?
- **A kept process run this session,** such as the diary, a review or a cleanup. Is its output where the process
  expects it, such as `reports/<date>.json` for the diary?

## Mechanical checks

```bash
# ORC, in the checkout or worktree used. Run while .github/workflows/ has no test job.
cd "$ORC" && ls .github/workflows/ && pnpm typecheck && pnpm test
# only if web/, e2e/, src/web-server.ts or src/web-cli.ts changed:
pnpm test:e2e
# code paths named in ORC's root documents that no longer exist
for f in *.md; do grep -oE '`(src|test|scripts|config|web|e2e)/[A-Za-z0-9_./-]+`' "$f" | tr -d '`' | sed 's/:[0-9]*$//' \
  | sort -u | while read -r p; do [ -e "$p" ] || echo "$f: $p"; done; done
git -C "$ORC" diff --check "$START_ORC"         # commits and uncommitted work since the start

# lab
cd "$LAB"
node tools/map.mjs --check                       # exits 1 when an open issue is off the map
grep -c . STATE.md                               # non-blank lines; compare with the cap in AGENTS.md
grep -nE '^## ' FRICTION.md | grep -vE '^[0-9]+:## [0-9]{4}-[0-9]{2}-[0-9]{2}\s*[—-]\s' # headings the diary cannot read
grep -n '\*\*Where we are now:\*\*' STATE.md
git -C "$LAB" diff --check "$START_LAB"
```

Treat a finding as this session's only if it sits in a file this session touched. Anything else was already there:
list it separately.

## Safety

- Never commit or push unless asked.
- Never print secrets:
  - do not print `~/.config/orchestrator/env` or Scope credential folders;
  - do not print `ORCHESTRATOR_BROWSER_STORAGE_STATE`, which holds the login itself (lab `FRICTION.md`, 2026-09-27);
  - do not print ORC's journal wholesale, because it has held a web token. `pnpm service:status` is enough.
- Do not stop, start or build ORC by hand; see "Rules owned elsewhere".
- Do not touch another session's worktree or uncommitted changes.
- Add no workflow logic that only one agent vendor runs.

## Report

- **Baseline:** what each repository was compared against, and whether coverage was complete.
- **Coverage:** what was checked, and what was not.
- **Live reads:** each one, with its source and the time it was read.
- **Findings:** those caused by this session; then, separately, problems that were already there.
- **Proposals for Justin:** recorded in `decisions/`, marked as proposed.
- **Files updated:** for example `STATE.md`, `decisions/`, `FRICTION.md`, and any documents in ORC.
- **The first action for the next session:** written into `STATE.md`, not here.
