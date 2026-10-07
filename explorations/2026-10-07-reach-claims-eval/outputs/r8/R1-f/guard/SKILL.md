---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: Orchestration Lab and ORC Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
<!-- Pointers only. Never copy current direction, work status, next tasks or build ids into the guard; they belong in
the state file. Stable links to an issue or record that owns a policy are fine. -->
- Authorised intent: this Scope's `scope.yaml` and `SCOPE.md`; ORC's `README.md` ("Direction", "Boundary") and
  `AGENTS.md`; `decisions/`; `memory/authority-rules-step-1.md`. Steward: Justin (`scope.yaml`).
- Current state and next steps: this Scope's `STATE.md`. Read it first.
- Decisions: this Scope's `decisions/`. Unresolved: whether ORC's own decisions also go there (Q3 in `STATE.md`).
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`;
  `~/pro/scope/docs/MODEL.md`; orchestrator#140's description; ORC's `SECURITY-REVIEW.md`, `dangerfile.js` and
  `AGENTS.md` "Security review".
- Open questions for Justin, among them whether ORC sessions run this guard: `STATE.md` (Q1 to Q5).

## What changed this session
Do this in each repository the session touched: this Scope (`~/scopes/scope-orchestration-lab`) and ORC
(`~/pro/orchestrator`). Find the commit the session started from, and write it in place of `<start>` below. If you
cannot, use `origin/main` and report "coverage incomplete". If neither exists, report committed changes as not
covered, and still inspect staged, unstaged and untracked work.
```bash
git log --oneline <start>..HEAD           # commits
git diff <start> HEAD                     # what they changed
git status --short
git diff --cached                         # staged: what the next commit holds
git diff                                  # unstaged
git ls-files --others --exclude-standard  # untracked: read those that matter
```
<!-- Check staged and unstaged separately: `git diff HEAD` nets them out, so a change staged and then undone in the
working tree shows nothing yet still lands. Add live changes the checks depend on (a deployed build, a grant), read
with the time. -->

## Intent
Does this change fit the authorised intent in `scope.yaml`, `SCOPE.md`, ORC's `README.md` and `AGENTS.md`, and
`decisions/`? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in this Scope's `decisions/`; work that depends on it waits
>    for the decision.
> 4. Do not edit `scope.yaml`, `SCOPE.md`, ORC's `README.md` or `AGENTS.md` to match the work unless Justin has
>    recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If ORC code, a command or a setting changed: do ORC's `README.md` and `AGENTS.md`, and this Scope's `README.md`,
  still describe it? Search their text for each name renamed or removed.
- For each state claim changed in `STATE.md`: do its other mentions still agree? Does each live fact, such as a
  restart or approval this session caused, say where and when it was read? Does `**Where we are now:** <ref>` still
  match `tools/map.mjs`, and the file keep within `AGENTS.md`'s cap?
- If ORC code that launches, connects, listens, loads package code, reads a credential or sets a subprocess's
  environment changed: run the reach search below on the changed files and compare each hit with ORC `AGENTS.md`
  "Boundaries" and `test/architecture.test.ts`. Record patterns, paths and each hit with the process running it.
- If Justin decided something, or a session quoted a decision: is it in `decisions/`, dated and attributed, and not
  only in `STATE.md`?
- If ORC's durable-work store (`src/adapters/async-store/sqlite.ts`), its state directory, its `src/core/*.md`
  agents or `FRICTION.md`'s headings changed: do this Scope's readers below still return data, not null or zero?
- Before calling an ORC pull request ready to merge: were `pnpm typecheck` and `pnpm test` run, with the commit
  stated, since GitHub runs only Danger? Is Danger green, since a failed check does not block? If
  `src/package-api.ts` changed, was `pnpm api:report` run?
- If an issue was opened, or work on one started or stopped: does `node tools/map.mjs --check` pass, and are this
  session's marks cleared?
- If the session relied on ORC's root reports (`REWORK.md`, `SEAM.md`, `OPERATOR.md` and the rest), `MCP.md`'s
  browser sections or a dated `reports/` file as current: do `STATE.md` and `decisions/` say it still holds?
- If something broke in real use: is there a dated `FRICTION.md` entry?
```bash
# ORC checkout, when ORC changed
pnpm typecheck && pnpm test
git diff --name-only <start> -- src web/src scripts config | xargs -r rg -n 'node:child_process|\b(spawn|execFile|exec|fork)(Sync)?\(|StdioClientTransport|playwright|chromium|\.launch\(|\bfetch\b|node:(https?|http2|net|tls|dgram)|WebSocket|createServer|\.listen\(|process\.env|credential'
# this Scope
node tools/map.mjs --check
node -e 'import("./tools/collect.mjs").then(async (c) => console.log(JSON.stringify({ work: await c.durableWork(), agents: c.agents().length, friction: c.friction().length })))'
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For a claim about everything of a kind, such as what the system reaches or launches, search the code rather than
  trusting a document and a test that agree, and record the search. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin; files updated; the next action, written into `STATE.md`.
