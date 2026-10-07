---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: Orchestration Lab and ORC Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change.

One system in two repositories: ORC (`~/pro/orchestrator`, or the worktree used) and this Scope
(`~/scopes/scope-orchestration-lab`). Run it after any session that changed either.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: this Scope's `SCOPE.md`, `scope.yaml`, `decisions/` and `memory/authority-rules-step-1.md`;
  ORC's `README.md` ("Direction") and `AGENTS.md` ("Boundaries"; "Core ships with no specific Scope, model, owner, or
  agent"). Steward: Justin (`scope.yaml`).
- Current state and next steps: this Scope's `STATE.md`. Read it first.
- Decisions: this Scope's `decisions/`; a decision about one issue goes on that issue, on the map (orchestrator#140).
- Rules owned elsewhere: `~/pro/local-config/home/AGENTS.md`; ORC's `SECURITY-REVIEW.md`, `dangerfile.js`,
  `test/architecture.test.ts` and `test/core-ties.ts`; the rules in orchestrator#140's description.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use `origin/main`
and report "coverage incomplete". If neither exists, report committed changes as not covered, and still inspect
staged, unstaged and untracked work. Run these in each repository the session touched.
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
If the session merged ORC work or acted on a card or grant, read `pnpm service:status` in `~/pro/orchestrator`, with
the time.

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
> 4. Do not edit this Scope's `SCOPE.md`, `scope.yaml` or `decisions/`, or ORC's `README.md` "Direction" or
>    `AGENTS.md` "Boundaries", to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

Open for Justin (assessment of 7 Oct 2026; remove each when answered). Q1: may ORC's reach lists describe the restart
card's commands, Chromium, Pi's model calls and the phone connector, and may a package choose a notice's tap address?
Q2: may `config/installation.ts`'s core-ties allowance rise until #152? Q3: is `STATE.md` capped at forty content
lines or sixty?

## Checks
- If ORC's `src/`, `config/`, `scripts/` or `package.json` changed: do ORC's `README.md` and `AGENTS.md` still describe
  it, by the names, paths, commands and settings they use?
- For each state claim changed in this Scope's `STATE.md`: do its other mentions still agree?
- If anything now connects, launches a process, stores, or reads a credential, directly or through a library
  (Playwright, Pi, the MCP SDK) or a package connector: run the reach search below and compare its hits with ORC's
  `AGENTS.md` "Boundaries", `README.md` and `test/architecture.test.ts`. Report differences; Q1 is open.
- If a Danger-guarded path changed (`GUARDED` in `dangerfile.js`): does the pull request's `## Security review` name
  what the reach search found? Danger checks only that the section exists.
- If `test/core-ties.ts` changed: did an allowance rise? A rise in `src/` or `web/src/` is a defect; one in
  `config/installation.ts` goes to Justin with its issue (Q2).
- If ORC code changed: were `pnpm typecheck` and `pnpm test` run this session, and `pnpm test:e2e` if `web/` or
  `e2e/` changed? Nothing runs them on a pull request (orchestrator#144). Report each result.
- In `STATE.md`: does each live fact (the build ORC runs, a grant and its expiry) say where and when it was read, with
  expired ones gone? Does `**Where we are now:** #<n>` keep that form (`tools/map.mjs` reads it)?
- Is `STATE.md` within its cap (Q3)? Move history to git and decisions to `decisions/`, not elsewhere in the file.
- Did Justin decide anything this session? Is it recorded in his words, dated, in `decisions/` or on its issue, not
  only in `STATE.md`?
- Did something break in real use? Is it in this Scope's `FRICTION.md`, marked workshop or product, with ORC facts in
  ORC's repository and relationship facts in `memory/`?
- If issues were opened, closed or marked: does `node tools/map.mjs --check` pass with every `gh` read succeeding? A
  failed read counts as no issues.
- If a path, command, tool, setting or identifier was renamed or removed: does `git grep` find the old name in either
  repository, outside `FRICTION.md` and `reports/`?
- Before reviving removed code, or citing ORC's root reports (`REWORK.md`, `SEAM.md`, `OPERATOR.md`, `FIXES.md`,
  `SLICE1.md`) or `MCP.md`'s browser sections: do the current code and `STATE.md` still agree with them?
```bash
# ORC checkout or worktree. CI runs none of these.
pnpm typecheck && pnpm test
pnpm test:e2e                                   # if web/ or e2e/ changed
git grep -nE 'node:(child_process|https?|http2|net|tls|dgram|dns)|\bfetch\b|playwright|@modelcontextprotocol/sdk|createAgentSession|readScopeCredential|process\.env\.[A-Z_]*(TOKEN|KEY|SECRET)' -- src config scripts ':(exclude)*.test.*'
# This Scope
node tools/map.mjs --check
git diff --check
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
- Proposals for Justin; files updated; the next action, written into this Scope's `STATE.md`.
