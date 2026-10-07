---
name: entropy-guard
description: Session-end coherence guard for the entropy-guard project itself. Run before committing after meaningful work. Checks this session's change against authorised intent, canonical ownership, the skills' handoffs, decision and learning capture, workflow alignment, cross-references and the current-state section of TODO.md. Also this project's reference example of a generated guard.
metadata:
  version: "0.3.0"
  generated: "2026-03-19"
  last_updated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.3.0, fed by a docs-first planning assessment"
  snapshot: "447da9a: 4 exportable skills, 2 local skills, no code, tests or CI"
  intent_change_rule: "v2 (2026-10-04), from the entropy-guard tool's skills/entropy-assessment/intent-pass.md"
---

# Skill: Entropy Guard

Run at the end of a meaningful work session, before commit or handoff. Check only this session's change. It takes
2 to 5 minutes; if you find yourself auditing the whole repo, stop, and file the gap in `TODO.md`.

## When to run

- You have finished a task and are about to commit.
- You resolved a non-trivial problem whose solution reaches beyond the immediate fix.
- A session is ending and the next one should start clean.

## When not to run

- After trivial changes (typos, formatting): use judgement.
- More than once per logical piece of work.
- As a full documentation audit. That would be `doc-health-check`, which is not built (`TODO.md` Backlog).

## Where things live

Read these; do not copy them into this guard.

- **Authorised intent:** `INTENT.md`, restated in `README.md` "Project status" and `AGENTS.md` "Project Constraints".
  Steward: Justin Philpott, the repository owner. No document names a steward yet; see the `DECISIONS.md` entry
  "Proposed: name the steward…".
- **Current state, open questions, next steps:** `TODO.md`, section "Current state (read first)". Read it first.
- **Decisions:** `DECISIONS.md`. Entries are undated and not reliably ordered; those headed "Proposed:" are not in
  force.
- **Learnings:** `LEARNINGS.md`, for what real use validated.
- **Historical:** `explorations/`, seed material for the sibling `entropy-immune-system` repo, where theory work
  now continues.
- **Rules owned elsewhere:** the agentskills.io skill format (`DECISIONS.md`, "Skill format…"); the seed project's
  scaffolding (`AGENTS.md`, "Scaffolding Feedback"); filing upstream feedback
  (`skills/local/entropy-guard-feedback/SKILL.md`). Link to these; do not restate them.

## What changed this session

```sh
START="${START:-$(git merge-base HEAD '@{upstream}' 2>/dev/null || git merge-base HEAD main)}"
git log --oneline "$START"..HEAD            # commits this session
git diff --stat "$START" HEAD               # files those commits changed
git status --short                          # staged, unstaged and untracked at a glance
git diff --cached                           # staged: what the next commit contains
git diff                                    # unstaged
git ls-files --others --exclude-standard    # untracked; read the ones that matter
```

Set `START` to the commit the session began from when you know it. If the upstream or `main` fallback was used,
the report says "coverage incomplete: compared against <what was used>". Check staged and unstaged changes
separately: `git diff HEAD` alone nets them out.

A finding belongs to this session if the session changed the relationship it is about, not only the file where it
shows. Renumbering a skill's steps makes untouched references to those steps wrong.

## Modes

- Plan/suggest-only: inspect and report; do not edit.
- Build/just-do-it: inspect and make coherence fixes.
- Discuss-first: propose changes before editing.
- Audit-only: report risks only.

## 1. Intent

- Does this session's change fit `INTENT.md`, including its scope boundary: practical guard work here, theory in
  `entropy-immune-system`?
- When the work and the authorised intent disagree:

  > 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
  >    intent nobody has decided.
  > 2. Fix a defect in the work.
  > 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
  >    undecided change of intent as a proposal for Justin Philpott in `DECISIONS.md`; work that depends on it
  >    waits for the decision.
  > 4. Do not edit `INTENT.md`, or the scope statements that restate it, to match the work unless Justin Philpott
  >    has recorded that decision.
  > 5. Correct a document directly only when a recorded decision of Justin Philpott's already settles it, and cite
  >    that decision.
  > 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test
  >    or the code shows what is checked or built; it does not authorise weakening a documented constraint.

  (Intent-change rule v2, from the entropy-guard tool's `skills/entropy-assessment/intent-pass.md`.)
- **Provisional** until the steward decides "Proposed: name the steward…" in `DECISIONS.md`. Today `AGENTS.md`
  ("Consult INTENT.md for significant decisions") and the `INTENT.md` header let any contributor revise `INTENT.md`
  with a dated note. If that practice is kept, rule 4 becomes: "Revise `INTENT.md` only with a dated note saying what
  prompted the change, and record the change in `DECISIONS.md`." Until a decision names who decided them, treat the
  existing `DECISIONS.md` entries as recorded decisions.

## 2. One owner per concept

For each concept this session changed, update its owner and reduce other mentions to a link or a local
implication. Keep summaries and independent tests of a contract; remove duplicate definitions.

| Concept | Owner | Other mentions: links or summaries only |
|---|---|---|
| Purpose, entropy model, principles, guard-tool lifecycle | `INTENT.md` | `README.md`, `AGENTS.md` |
| Next validation loop | `INTENT.md`, "Scope boundary and next validation loop" | `README.md` "Project status", `TODO.md` "Next Up", `DECISIONS.md` "Farm broader…" |
| Settled choices | `DECISIONS.md` | `TODO.md` current state |
| Current state, active work, open questions | `TODO.md` | none |
| Contributor workflow | `AGENTS.md` "Working Practices" | `README.md` "Contributing", `.githooks/pre-commit`, this guard |
| Skill catalogue: names, paths, purposes | `README.md` "What's here" | `AGENTS.md` "Key Files", `INTENT.md` lifecycle |
| Which skill builds guards, for which repo shape | `DECISIONS.md` (see "one guard builder") | `INTENT.md` lifecycle, `README.md`, `AGENTS.md`, the skills' routing |
| Format of an upstream feedback note | `skills/local/entropy-guard-feedback/SKILL.md` | `skills/guards-integrator/SKILL.md` Step 7 |

## 3. Skills are contracts

If this session changed `skills/*/SKILL.md` or this guard:

- Do the skill's name, path, step numbers, inputs and outputs still match every consumer? Consumers are the other
  skills' handoffs (front door, deep path, guard builder, `guards-integrator`, `entropy-guard-feedback`), the
  prompts in `README.md` "How to use this repo", `AGENTS.md` "Key Files", the `INTENT.md` lifecycle, and
  `DECISIONS.md` or `LEARNINGS.md` entries that cite steps.
- Is every exportable skill still reachable from `entropy-assessment` or from `README.md` "How to use this repo"?
- Does it still carry the requirements `DECISIONS.md` set for skills: guards come with their integration ("Guards
  need closed-loop integration…"), bootstrap actions are verified against the current artifact ("Entropy assessment
  should support guard refinement…"), and assessment and integration skills end with an upstream feedback check
  ("Upstream feedback should be embedded…")?
- Does anything imported from another project still carry that project's names or layout?
- Does it keep `INTENT.md`'s principles: low burden, scoped to the delta, enforcement depth matched to the check?
- Self-application: if a skill changed what it tells other repos to keep, such as a current-state view or the
  contents of a guard, does this repo still do it?

## 4. Supersession

- Before restoring a deleted file, reviving an old concept, or fixing a broken reference by recreating something,
  check whether `DECISIONS.md`, `TODO.md` "Current state", or the move of theory to `entropy-immune-system`
  superseded it.
- If this session superseded something, mark the old `DECISIONS.md` entry "Superseded by …" or "Partially
  superseded by …", as the log already does.

## 5. Decisions and learnings

- Did you choose between approaches, decide against something, find a constraint, or set a convention? Add it to
  `DECISIONS.md`: context, decision, impact, the date, and who decided. A change of intent nobody has decided is a
  "Proposed:" entry (section 1).
- Did real use validate or invalidate something non-obvious? Add it to `LEARNINGS.md`: insight, what validated it,
  implication. Insight from a conversation alone goes to `explorations/` or `entropy-immune-system`.

## 6. Workflow alignment

- Would an agent starting from `AGENTS.md` alone follow the loop this session used: read `TODO.md` "Current
  state", write "Doing Now", work, run this guard, clear "Doing Now", commit with the guard's note?
- Do `AGENTS.md` "Working Practices", `README.md` "Contributing", `.githooks/pre-commit` and this guard still agree?

## 7. State honesty: `TODO.md`

- "Doing Now" is cleared, finished items are not marked active, and new work is in "Next Up" or "Backlog".
- In "Current state (read first)", update each claim this session changed, with its source and the date checked,
  and check its other mentions in the file still agree. Add an open question when a proposal is recorded; remove it
  when the steward decides. Write the next session's first action there.

## 8. Cross-references

- Did this session rename, move or delete anything that docs point at: a path, a section name, a step number, a
  count? Run `git grep -n "<old name>"` for each and fix every hit outside `explorations/`. Transcripts there stay
  verbatim.

## Mechanical checks

Run from the repo root. Each prints nothing when clean. No CI runs them yet.

```sh
git diff --check; git diff --cached --check   # whitespace errors, unstaged then staged

# relative markdown links whose target does not exist (fenced code blocks skipped)
find . -name '*.md' -not -path './.git/*' | while read -r f; do
  awk '/^ *```/ { fence = !fence; next } !fence' "$f" |
  grep -o '](\([^)#]*\)[^)]*)' | sed 's/^](\([^)#]*\).*/\1/' | while read -r l; do
    case "$l" in ''|http*|mailto:*) continue ;; esac
    [ -e "$(dirname "$f")/$l" ] || echo "BROKEN $f -> $l"
  done
done

# a skill's frontmatter name must match its folder (agentskills.io; DECISIONS.md "Skill format")
for f in skills/*/SKILL.md skills/local/*/SKILL.md; do
  d=$(basename "$(dirname "$f")"); n=$(sed -n 's/^name: *//p' "$f" | head -1)
  [ "$d" = "$n" ] || echo "MISMATCH $f: name=$n folder=$d"
done
```

## Operational state

None: no services, builds or spending. The one external write is an issue filed through
`skills/local/entropy-guard-feedback/SKILL.md`; if this session filed one, give its number in the report.

## Repair rules

- Before making a description, a skill and a check agree, establish which is wrong. A skill's text shows what was
  built; it does not authorise weakening a constraint in `INTENT.md` or `DECISIONS.md`.
- Fix small gaps now. Put a large gap in `TODO.md` as follow-up work rather than widening this session.
- Never record cleanup or bootstrap progress by editing this guard; record it in `TODO.md`.

## Report

Put this in the commit message, or write "entropy check clean":

- the baseline compared against, and whether coverage was complete;
- what was checked, and what was not;
- findings this session caused, judged by the relationship changed rather than the file edited, and problems that
  were already there, listed separately;
- proposals recorded for Justin Philpott in `DECISIONS.md`;
- files updated, such as `TODO.md` and `DECISIONS.md`;
- whether the main issue was workflow or practice drift rather than a missing doc update.

## Safety

- Never commit or push unless asked.
- Never read or print secrets; `.env` files are git-ignored here and stay unopened.
- Do not modify unrelated changes in the working tree.
- Do not put workflow logic in vendor-specific agent folders such as `.claude/`, `.codex/` or `.cursor/`.
