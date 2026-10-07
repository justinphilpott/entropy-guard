---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: Orchestration Lab and ORC Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

<!-- Provisional: where this guard lives and which repositories it covers wait on Justin's answers to Q1 and Q2 of
the 2026-10-07 entropy assessment. Drafted for `~/scopes/scope-orchestration-lab/skills/session-coherence-guard/`,
covering sessions in this Scope and in ORC (`~/pro/orchestrator` and its worktrees). -->

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: this Scope's `scope.yaml`, `SCOPE.md`, `decisions/` and `memory/authority-rules-step-1.md`;
  ORC's `README.md` ("Direction") and `AGENTS.md`. Steward: Justin (`scope.yaml`).
- Current state and next steps: this Scope's `STATE.md`. Read it first.
- Decisions: this Scope's `decisions/`, or the issue a decision settles on the map, orchestrator#140.
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; `~/pro/agentic/HOW_NOT_TO_PLAN.md`; ORC's
  `SECURITY-REVIEW.md` and `dangerfile.js`; orchestrator#140's description.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use origin/main and
report "coverage incomplete". If neither exists, report committed changes as not covered, and still inspect staged,
unstaged and untracked work. Run the block in each repository the session touched: this Scope, ORC's checkout, and
any ORC worktree.
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
Does this change fit the authorised intent in the files above? If not:

> When this session's work and the authorised intent disagree:
>
> 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
>    intent nobody has decided.
> 2. Fix a defect in the work.
> 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
>    undecided change of intent as a proposal for Justin in this Scope's `decisions/`, or on the issue it concerns
>    on the map (orchestrator#140); work that depends on it waits for the decision.
> 4. Do not edit `scope.yaml`, `SCOPE.md`, `decisions/`, `memory/authority-rules-step-1.md`, or ORC's `README.md`
>    ("Direction") and `AGENTS.md` to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard's `skills/entropy-assessment/intent-change-rule.md`.)

## Checks
- If ORC's `src/`, `config/` or `scripts/`, or this Scope's `tools/`, changed: do ORC's `README.md` and `AGENTS.md`,
  or this Scope's `README.md`, still give the commands, flags, settings and paths that changed? Search for each old
  name.
- For each state claim changed in `STATE.md`: do its other mentions still agree?
- If the change could alter what ORC or a Scope tool reaches over the network, launches, stores or reads credentials
  from: is ORC's `AGENTS.md` "Boundaries" (and `README.md`, "Credentials") still true? Search the code with the
  command below, not the docs and `test/architecture.test.ts`, and put the patterns, paths and hits in the report.
  Unresolved: whether `AGENTS.md` lists reach through libraries and child processes (Q4), and where credentials may
  be read (Q5).
- If a path in `dangerfile.js`'s `GUARDED` list changed: will it land through a pull request with a
  `## Security review` section, and a `## Package API` section if `src/package-api.api.md` changed? Danger never sees a
  direct push to `main`.
- If this session changed a live fact (a restart, a package or build approval, a grant, a write to Bookwhen, a
  notice, a map mark): does `STATE.md` say where, when and what was read, replacing the old value, not beside it?
- If Justin decided something this session: is it in `decisions/` or on the issue it settles, and not only in
  `STATE.md`, a chat or a vendor folder such as `~/.claude/plans/`?
- Is `STATE.md` current state only, within the size `AGENTS.md` "Keeping state" sets? Unresolved: about forty content
  lines there, sixty in `STATE.md`'s own header (Q3).
- If an issue was opened or work started or stopped: is every open issue on the map, and are this session's In
  Progress marks cleared (`node tools/map.mjs stopped '<ref>'`)?
- Before reviving or citing ORC's root reports (`CLASSIFY.md` to `VISIBILITY.md`, `MCP.md`'s browser sections) or
  `memory/slots-run-walkthrough.md`: does later code or a record supersede what it says?
- If something broke in real use: is it in `FRICTION.md`, newest first, marked (workshop) where it belongs only here?
```bash
# ORC checkout or worktree. CI runs only Danger; tests run by hand until orchestrator#144.
pnpm typecheck && pnpm test
pnpm api:report                       # only when src/package-api.ts changed
grep -rnE --include='*.ts' --include='*.mjs' --include='*.js' --include='*.sh' \
  -e 'child_process|worker_threads|StdioClientTransport|chromium\.|\.launch\(' \
  -e '\bfetch\b|node:(https?|http2|net|tls|dns|dgram)|WebSocket' \
  -e 'process\.env|credential|storage-?[sS]tate' src config scripts
# This Scope
node tools/map.mjs --check            # exits 1 when an open issue is off the map, 2 when GitHub cannot be read
grep -rnE -e 'child_process|execFile|spawn\(|"gh"|fetch\(|writeFileSync' tools
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
