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
- Authorised intent: this Scope's `scope.yaml`, `SCOPE.md` and `decisions/`; ORC's `README.md` ("Direction",
  "Boundary") and the rules in ORC's `AGENTS.md`. Steward: Justin (`scope.yaml`, `steward`).
- Current state and next steps: this Scope's `STATE.md`. Read it first.
- Decisions: this Scope's `decisions/` for Scope, process and cross-repository decisions; the issue on
  orchestrator#140 that owns an ORC design question. Unresolved: Justin has not named one owner per kind of decision
  (Q1 in `decisions/2026-10-07-proposals-from-entropy-assessment.md`).
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md` (every project, spending included); orchestrator#140's
  description (the map); ORC's `SECURITY-REVIEW.md` and `dangerfile.js`; `/home/justin-philpott/pro/agentic/HOW_NOT_TO_PLAN.md`
  (pace, see Intent); `/home/justin-philpott/pro/scope/docs/MODEL.md` (the Scope model).

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use `origin/main`
and report "coverage incomplete". If neither exists, report committed changes as not covered, and still inspect staged,
unstaged and untracked work. Run the block in this Scope's checkout and in each ORC checkout or worktree the session
changed, each with its own `<start>`.
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
Live changes here: a restart onto merged work, an approved package build or grant, a map mark, a Bookwhen entry
changed through Moving Stillness.

## Intent
Does this change fit the authorised intent in the files above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in this Scope's `decisions/`; work that depends on it waits
>    for the decision.
> 4. Do not edit `scope.yaml`, `SCOPE.md`, `decisions/`, ORC's `README.md` "Direction" and "Boundary", or the rules
>    in ORC's `AGENTS.md` to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

Pace is unresolved (Q3): this Scope's `AGENTS.md` "Pace" and Justin's words of 21 Sep
(`reports/2026-09-22-pushback-analysis.md`, section 7) differ on new capabilities. Report new work against both, and
block on neither, until he decides.

## Checks
<!-- One line per justified check, each with a trigger and a named thing to check. -->
- If ORC code changed: does the document that describes it still describe it? Tools, connectors, subprocesses and
  network calls (`src/`, `config/installation.ts`): ORC's `AGENTS.md` "Boundaries" and `README.md` "Boundary". Durable
  work (`src/app/async/`, `src/core/async/`): `decisions/2026-09-17-async-work-architecture.md`. Commands, scripts and
  `ORCHESTRATOR_*` variables: `README.md` "Run", "As a service" and "Verify". A ratchet or boundary test
  (`test/architecture.test.ts`, `test/core-ties.ts`): the `AGENTS.md` sentence that cites it.
- For each state claim changed in `STATE.md`: do its other mentions still agree?
- If what an agent or ORC itself can reach changed (a subprocess, a network call, a connector, a notice channel,
  `dangerfile.js`'s guarded paths): do ORC's `AGENTS.md` "Boundaries", `README.md` "Boundary" and
  `test/architecture.test.ts` name the same modules? Report which is wrong; a widening waits for Justin's decision.
- If a name crossed a repository seam (a connector setting, a tool name, a manifest field, an environment variable):
  is the old name gone from ORC, this Scope and every repository in `tools/collect.mjs`, agent-facing text included?
- If ORC code changed: did `pnpm typecheck` and `pnpm test` pass on the final commit, and `pnpm test:e2e` when `web/`,
  `src/web-*` or `e2e/` changed? Nothing runs them on a pull request yet (orchestrator#144).
- If `STATE.md` states a live fact (the build ORC runs, a restart, a grant's end, test counts): was it read this
  session, with where and when, and is every older value of it gone from the file?
- If Justin decided something: is it recorded, dated and attributed, where "Decisions" above says, and not only in
  `STATE.md`, a report, a code comment or a vendor-only folder such as `~/.claude/`?
- If an issue was opened or worked on: is it on the map, and is each `working` mark this session set cleared with
  `stopped`?
- If something broke in real use: is there a `FRICTION.md` entry, newest first, naming it an instance or a missing
  system, and is each learning where `AGENTS.md` "Where a learning goes" puts it?
- Before reviving anything described by a report, an ORC root report (`FIXES.md`, `REWORK.md` and the rest) or a dated
  decision: does `decisions/` or `STATE.md` record it as superseded?
- If `STATE.md` changed: was it overwritten rather than appended to, and is it within the cap in `AGENTS.md` "Keeping
  state"? Unresolved: `STATE.md`'s header gives a different number (Q4).
```bash
# In each ORC checkout or worktree this session changed
pnpm typecheck && pnpm test
pnpm test:e2e                      # when web/, src/web-* or e2e/ changed
pnpm service:status                # before STATE.md says what ORC runs
# In this Scope
node tools/map.mjs --check         # every open issue on the map; also lists marks older than 14 h
grep -c . STATE.md                 # non-blank lines, against the cap
# A name that crossed a repository seam, in every repository this work spans
for repo in $(node --input-type=module -e 'import { REPOS } from "./tools/collect.mjs"; console.log(REPOS.map((r) => r.path).join(" "))'); do
  grep -rn --exclude-dir=node_modules --exclude-dir=.git -- '<old name>' "$repo"
done
```

## Repairs
- One owner per concept: when two places define one concept independently, reduce one to a link. Keep summaries,
  generated projections, versioned copies and independent tests, and keep them correct.
- Limit every correction by its evidence. Change only what the evidence settles, and leave open parts visibly open.
  For an exhaustive list or an "only" claim, check the full scope, including delegated behaviour. Never change a
  prescribed boundary because of observed behaviour, and never treat a test or the code as the record: where a
  description, the code and a check disagree, establish which is wrong first.

## Report
- Baseline, and whether coverage was complete; what was checked and what was not.
- Findings caused by this session, judged by the relationship changed, not the file edited: renaming a setting in
  the code makes an untouched README wrong. Problems that were already there, listed separately.
- Proposals for Justin; files updated; the next action, written into `STATE.md`.
