---
name: session-coherence-guard
description: Check this repository's coherence at the end of a work session, before handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.5.0"
---

# Skill: Orchestration Lab and ORC Session Coherence Guard

Run at the end of a work session, before commit or handoff. Check only this session's change. One guard serves both
repositories: this Scope (`~/scopes/scope-orchestration-lab`) and ORC (`~/pro/orchestrator`); check each one the session
touched.

## Modes and safety
- Follow the invocation's mode: plan, audit-only and discuss-first inspect and report without editing; build permits
  scoped repairs.
- Never commit or push unless asked. Never read, print or write secret values; inspect examples and key names instead.
- Leave unrelated changes alone, and keep committed workflow logic out of vendor-specific agent folders.

## Where things live
- Authorised intent: this Scope's `SCOPE.md`, `scope.yaml` and `decisions/`; ORC's `README.md` ("Direction",
  "Boundary") and `AGENTS.md` ("Boundaries", "Core ships with no specific Scope, model, owner, or agent"). Steward: Justin.
- Current state and next steps: this Scope's `STATE.md`. Read it first.
- Decisions: this Scope's `decisions/`, one dated file each. Open work: orchestrator#140 and the rules in its description.
- Rules owned elsewhere: ORC's `SECURITY-REVIEW.md` and `dangerfile.js`; `~/pro/local-config/home/AGENTS.md`;
  `~/pro/agentic/HOW_NOT_TO_PLAN.md`; `~/pro/scope/docs/MODEL.md`.

## What changed this session
Find the commit the session started from, and write it in place of `<start>` below. If you cannot, use origin/main and
report "coverage incomplete". If neither exists, report committed changes as not covered, and still inspect staged,
unstaged and untracked work.
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
>    undecided change of intent as a proposal for Justin in this Scope's `decisions/`; work that depends on it waits
>    for the decision.
> 4. Do not edit this Scope's `SCOPE.md`, `scope.yaml` or a record in `decisions/`, or ORC's `README.md` or `AGENTS.md`,
>    to match the work unless Justin has recorded that decision.
> 5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
>    decision.
> 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
>    the code shows what is checked or built; it does not authorise weakening a documented constraint.

(Intent-change rule v2, from entropy-guard.)

## Checks
- If ORC's reach, restart or package API code changed: does `AGENTS.md` ("Boundaries", "Security review") or
  `README.md` ("As a service") still describe it? If this Scope's `tools/` changed: does its `README.md`?
- For each state claim changed in `STATE.md`: do its other mentions still agree?
- If ORC code adds or removes a launch, network call, DNS lookup or credential read, its own or a library's: run the
  search below and check every hit is listed in `AGENTS.md`. A passing architecture test is not evidence.
- If a path in `dangerfile.js` `GUARDED` changed: did it go through a pull request with a `## Security review` section,
  not a direct push to `main`; and a `## Package API` section if `src/package-api.api.md` changed?
- If a `test/core-ties.ts` allowance rose: is the rise reported as a proposal for Justin? Whether `config/installation.ts`
  may rise is open (`decisions/2026-10-07-proposed-boundary-questions.md`, Q3).
- If a task type became `grantable`: does it judge its outcome by an independent read (#74)?
- `STATE.md`: is each live fact (the build ORC runs, a grant, a service) given with where and when it was read, a fresh
  read kept apart from a recorded one? Does it stay within its cap (open: forty in `AGENTS.md`, sixty in its header)?
- If the session took a decision of Justin's: is it in `decisions/` or its owner's record, with `STATE.md` linking only?
- If ORC's state directory, durable-work schema, agent discovery or `FRICTION.md` headings changed: does
  `tools/collect.mjs` still read them? Use the read-only probe below, not `report.mjs`, which writes to GitHub.
- Before reviving something an ORC top-level report or `MCP.md` names (an old module, the browser through MCP): does
  `README.md`, `AGENTS.md` or `STATE.md` record that it was superseded?
- Did anything break in real use? Record it in `FRICTION.md`, newest first, and a product defect also as an issue on the map.
- If ORC work merged: was the checkout pulled and the restart left to its card, never a hand build of `dist`?
```bash
# In ORC's checkout, when ORC changed (CI runs neither):
pnpm typecheck && pnpm test
git grep --untracked -nE 'child_process|StdioClientTransport|playwright|chromium|fetch|node:(https?|http2|net|tls|dns|dgram)|process\.env|readScopeCredential' -- src config
# In this Scope, when issues were opened or the map changed:
node tools/map.mjs --check
# In this Scope, a read-only probe of the diary's readers (false or 0 means one broke):
node -e "import('./tools/collect.mjs').then(async (m) => console.log(await m.durableWork() !== null, m.friction().length, m.agents().length))"
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
