---
name: session-coherence-guard
description: Check ORC and the orchestration-lab Scope for coherence at the end of any work session that changed either repository, before the final STATE.md update, a merge request, or a handoff.
metadata:
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.3.0"
  from_assessment: "entropy-assessment v0.7.0, run on snapshots of both repositories taken 2026-10-04"
  intent_change_rule: "v2, entropy-guard skills/entropy-assessment/intent-pass.md (4 October 2026)"
  proposed_home: "scope-orchestration-lab/skills/session-coherence-guard/SKILL.md"
---

# Skill: ORC and Orchestration Lab Session Coherence Guard

Run this at the end of any session that changed ORC (`~/pro/orchestrator`) or the orchestration lab
(`~/scopes/scope-orchestration-lab`), or a worktree of either. Run it before the session's final `STATE.md` update,
before asking Justin to merge, and before suggesting he stops. Check only this session's change, and what depends on
it. It takes 2 to 5 minutes of judgment, plus ORC's suites (about two minutes).

**When not to use:** for a typo or formatting-only change; as a substitute for the security review, which
`SECURITY-REVIEW.md` and Danger own; or to review a change you did not make.

## Where things live

Read these; do not copy them into this guard.

- **Authorised intent.** Steward: Justin.
  - The lab: `SCOPE.md` and `scope.yaml`.
  - ORC: `README.md` "Direction" and `AGENTS.md`.
  - The north star: in the lab's `decisions/`.
- **Current state and next steps:** the lab's `STATE.md`. Read it first. Open work is the issue tree under
  orchestrator#140 (`node tools/map.mjs`).
- **Decisions:** the lab's `decisions/`, one dated file each; ORC's standing rules in ORC's `AGENTS.md`, each with
  Justin's dated words.
- **Enforced rules:** ORC's `test/architecture.test.ts` and `test/core-ties.ts`; Danger (`dangerfile.js`).
- **Rules owned elsewhere** (link to them; never restate them):
  - `~/pro/local-config/home/AGENTS.md`: prior art, live-service reporting, spending through ORC's permissions,
    worktree cleanup, merge-request lines;
  - ORC `SECURITY-REVIEW.md`: the security review;
  - `~/pro/agentic/HOW_NOT_TO_PLAN.md`: pace;
  - #140's description: the map's rules.

## What changed this session

Set `ORC` and `LAB` to the checkouts this session used, and `START_ORC` and `START_LAB` to the commits the session
began from, if known.

```bash
ORC=${ORC:-$HOME/pro/orchestrator}; LAB=${LAB:-$HOME/scopes/scope-orchestration-lab}
for repo in "$ORC" "$LAB"; do
  [ "$repo" = "$ORC" ] && start=${START_ORC:-} || start=${START_LAB:-}
  [ -n "$start" ] || { start=$(git -C "$repo" merge-base HEAD origin/main); echo "coverage incomplete: $repo compared against merge-base with origin/main"; }
  echo "== $repo on $(git -C "$repo" rev-parse --abbrev-ref HEAD), from $start"
  git -C "$repo" log --oneline "$start"..HEAD        # commits this session
  git -C "$repo" diff --stat "$start" HEAD           # what those commits changed
  git -C "$repo" diff --cached --stat                # staged: what the next commit holds
  git -C "$repo" diff --stat                         # unstaged
  git -C "$repo" ls-files --others --exclude-standard   # untracked; read the ones that matter
done
```

Check staged and unstaged separately. A finding belongs to this session when the session changed the relationship it
is about, even if the file showing the symptom was not edited.

**Outside the files.** Read these from the live source, and note the time read:

```bash
export ORCHESTRATOR_STATE_DIR="$(grep -m1 '^ORCHESTRATOR_STATE_DIR=' ~/.config/orchestrator/env | cut -d= -f2-)"  # this key only; never print the file
cd "$HOME/pro/orchestrator" && pnpm -s service:status       # the build ORC runs, against the checkout
journalctl --user -u orc.service --since "<session start>" | grep -iE 'unavailable|restart'
pnpm -s list:approval-grants                                # each grant's target and end
pnpm -s status:agent-packages                               # package approvals
cd "$LAB" && node tools/map.mjs                             # marks this session left; marks over 14 h
```

## Modes

- **Plan or suggest-only:** inspect and report; edit nothing.
- **Build or just-do-it:** inspect and make the coherence fixes below. Commit only if asked.
- **Discuss-first:** propose the fixes before editing.
- **Audit-only:** report risks only.

## Intent

- Does this session's change fit the authorised intent above? In particular:
  - Does core still ship with no specific Scope, model, owner or agent? (ORC `AGENTS.md`, "Core ships with no
    specific…")
  - Is every boundary enforced rather than asked for in a prompt?
- When this session's work and the authorised intent disagree:
  1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
     intent nobody has decided.
  2. Fix a defect in the work.
  3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
     undecided change of intent as a proposal for Justin in the lab's `decisions/` (a file marked "Proposed, awaiting
     Justin", and a line in `STATE.md`'s "Waiting on Justin"); work that depends on it waits for the decision.
  4. Do not edit ORC's `README.md` or `AGENTS.md`, the lab's `SCOPE.md` or `scope.yaml`, or the north star in
     `decisions/` to match the work unless Justin has recorded that decision.
  5. Correct a document directly only when a recorded decision of Justin's already settles it, and cite that
     decision.
  6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
     the code shows what is checked or built; it does not authorise weakening a documented constraint.

  (Intent-change rule v2, from entropy-guard `skills/entropy-assessment/intent-pass.md`.)

## Judgment checks

1. **State honesty: the lab's `STATE.md`.**
   - For each claim this session changed, do the claim's other mentions in the file still agree? A running build or a
     merge commit stated twice is the usual failure.
   - Is each live fact re-read now, with the time read, or labelled with when it was recorded? Citing a source does
     not refresh a value.
   - Does it hold current state only, within the cap in the lab's `AGENTS.md` ("Keeping state")? History goes to
     `git log` and `FRICTION.md`.
2. **Decisions survive the overwrite.** Did Justin decide anything this session? Record it in his words, dated, in
   `decisions/` (one file), or for a standing ORC rule in ORC's `AGENTS.md` citing it. Do this before `STATE.md` is
   overwritten. A decision in chat or in `STATE.md` alone is lost.
3. **A rule needs its enforcer.** Did this session write, or rely on, a rule as if it were a control? Name what
   enforces it: a test, a Danger rule, a card, a scheduled run. If nothing does, say so in the rule's own text, and link
   the issue that would enforce it.
4. **ORC's boundary text against its enforced tests.** For each row below whose left side this session changed, check
   the right side:

   | If this changed | Check that this still describes it |
   |---|---|
   | The allow-lists in `test/architecture.test.ts` (subprocess, network, tool surface), or `src/**` that spawns, reaches the network or reads a credential | ORC `AGENTS.md` "Core ships with no specific…" paragraphs; README "Boundary" and "Run" |
   | `config/installation.ts` (agents, bindings, parent tools) | ORC `AGENTS.md` parent tool list; README "Run" |
   | `src/package-api.ts`, or `ORC_PACKAGE_API_VERSION` in `src/core/agents/package.ts` | `src/package-api.api.md` regenerated; the pull request has `## Package API` |
   | A host connector's setting names (for example, the expected keys in `src/adapters/browser/index.ts`) | Every Scope package manifest that declares them (#198); the old name searched for in agent definitions, ORC `AGENTS.md` and the lab's `memory/` |
   | A tool or command an agent is told to use | Agent definitions (`src/core/*.md`, each Scope's `agents/`), the lab's `memory/`, `STATE.md` |
   | `package.json` scripts, environment variable names, service commands | ORC README "Run" and "As a service"; ORC `AGENTS.md`; commands quoted in the lab's `memory/` |
   | `dangerfile.js`'s `GUARDED` list | `test/architecture.test.ts` (the guarded-path test); `SECURITY-REVIEW.md`; `.github/pull_request_template.md` |
   | The lab's `tools/map.mjs` commands or `MAP_ROOT` | The map paragraphs in both `AGENTS.md` files |

5. **The lab's readers of ORC.** Did this session change any of these?
   - the tables or columns in ORC's `src/adapters/async-store/sqlite.ts`;
   - state-directory handling (`src/runtime.ts`, `scripts/orc-service.ts`);
   - the front matter of `src/core/*.md`;
   - vitest's summary format.

   If so, run `node tools/report.mjs --no-tests` in the lab, and check that `status.html`'s durable-work and agent
   sections are not blank. The lab's `tools/collect.mjs` returns nothing, not an error, when its reads fail.
6. **Core-ties allowances.** Did any number in ORC's `test/core-ties.ts` rise? A rise is not fixed by quietly lowering
   it back. Report it as an intent question for Justin, with the reason and its link to #152 (provisional, below).
7. **Supersession.** Before reviving, restoring or quoting something from ORC's root reports, a lab report or
   `memory/`, check whether `decisions/`, `STATE.md` or the map superseded it. A report describes its own day, not
   `main`.
8. **Where new writing goes** (provisional, below):
   - a session's report goes in the lab's `reports/`, not ORC's root, and is the report itself, not a transcript;
   - a living mechanism document in ORC says what is true of `main`.
9. **Real-use failures.** Did something break in real use? Add a `FRICTION.md` entry, newest first, with its "This
   is an instance / a missing system, because…" line.
10. **The map.**
    - Is each issue this session opened placed under #140?
    - Did the session clear its own marks (`node tools/map.mjs stopped <ref>`)?
11. **One owner.** Did the session touch something two documents both describe? Decide which owns it, and reduce the
    other to a link. Do not merge a description of intent into the test that enforces it; they are independent
    evidence and should agree.

## Mechanical checks

Danger already runs on GitHub; leave its checks to it.

```bash
cd "$ORC" && pnpm typecheck && pnpm test          # nothing runs these on a pull request yet (#144); say in the PR that they ran
cd "$ORC" && pnpm test:e2e                        # when web/, e2e/, src/web-server.ts, durable work or src/adapters/browser/ changed
cd "$ORC" && pnpm api:report && git diff --exit-code src/package-api.api.md   # when what src/package-api.ts exports changed
cd "$LAB" && node tools/map.mjs --check           # exits 1 when an open issue is outside the map
git -C "$ORC" diff --check; git -C "$LAB" diff --check
# Code paths named in ORC's agent-facing documents that no longer exist
cd "$ORC" && for f in README.md AGENTS.md SECURITY-REVIEW.md; do
  grep -o '`\(src\|test\|scripts\|config\|web\|e2e\)/[^`]*`' "$f" | tr -d '`' | sed 's/:.*//' | sort -u |
    while read -r p; do [ -e "$p" ] || echo "$f names $p, which does not exist"; done
done
# STATE.md's content lines, to compare with the cap in the lab's AGENTS.md
grep -cv '^[[:space:]]*$' "$LAB/STATE.md"
# Core-ties allowances this session added or changed: compare each + line with its - line
git -C "$ORC" diff "${START_ORC:-$(git -C "$ORC" merge-base HEAD origin/main)}" -- test/core-ties.ts | grep -E '^[-+] *"[^"]+": [0-9]+,'
```

## Operational state

- **What ORC runs.** State it only from `pnpm service:status`, read in this session, with the time. Restart only
  through the restart card (ORC `AGENTS.md`, "Security review" section); never by hand.
- **Grants and approvals.** A standing grant past its end, or a package left unapproved by this session's change,
  goes in the report and in `STATE.md`.
- **Spending and live services.** Follow `~/pro/local-config/home/AGENTS.md`. This guard does not restate those
  rules.

## Report

- The baseline compared against in each repository, and whether coverage was complete
- What was checked, and what was not
- Findings this session caused, judged by the relationship changed rather than the file edited; problems that were
  already there, listed separately
- Proposals for Justin, and where they were recorded
- Files updated: `STATE.md`, `decisions/`, `FRICTION.md`, documents
- The first next action, written into `STATE.md`, not here

## Safety

- Never commit or push unless asked.
- Never read or print a secret: from `~/.config/orchestrator/env`, read only the one key above, and never echo a
  credential's value.
- Do not overwrite or tidy changes that are not this session's.
- Keep this guard free of vendor-specific workflow logic.

## Provisional

These checks rest on recommended answers to open questions from the entropy assessment of 7 October 2026. Revise them
when Justin answers.

- **Where this guard lives, and that it covers both repositories.** Recommended: here in the lab, one guard for both.
- **Whether ORC's own decisions also go to the lab's `decisions/`** (Intent, step 3). Recommended: yes.
- **Whether a core-ties allowance may rise** (check 6). Recommended: in `config/installation.ts` only, when installing
  a Scope agent, until #152.
- **Whether ORC's root reports stay** (check 8). Recommended: remove the branch-session reports; keep the mechanism
  documents.
