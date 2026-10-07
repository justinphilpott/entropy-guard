---
name: entropy-guard
description: Session-end coherence guard for the entropy-guard project itself. Run before committing after meaningful work. Checks this session's change for fit with authorised intent, decision and learning capture, one home per concept, skill contracts, workflow alignment, supersession, cross-references and honest state.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.3.0, refining entropy-guard 0.2.3 in place"
---

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before commit or handoff. Check only this session's change. It should
take 2–5 minutes; if you find yourself reviewing every doc, stop and file the gap in `TODO.md` instead.

## When to run

- You finished a task and are about to commit. `.githooks/pre-commit` reminds you, where it is enabled.
- You resolved something whose implications reach beyond the immediate fix.
- A session is ending and someone else, human or agent, picks up next.

## When not to run

- After typo or formatting-only changes.
- As a full documentation audit. No skill exists for that yet (`TODO.md` Backlog, `doc-health-check`).
- More than once per logical piece of work.
- To assess another system: use `skills/entropy-assessment/SKILL.md`.

## Where things live

Read these; do not copy them into this guard.

- Authorised intent: `INTENT.md`, and the decisions in `DECISIONS.md`. Steward: not yet named in this repo; see the
  `DECISIONS.md` entry on naming the steward.
- Current state and next steps: `TODO.md` "Current state". Read it first, at session start.
- Decisions: `DECISIONS.md`. Entries are not in date order; follow their supersession markers, not their position.
- Learnings: `LEARNINGS.md`. Reflections: `PHILOSOPHY.md`. Articles: the separate writing repo (`DECISIONS.md`,
  "LEARNINGS.md stays tactical").
- Working practices: `AGENTS.md`. Broader theory: `../entropy-immune-system/`.
- Rules owned elsewhere: none recorded in this repo.

## What changed this session

```bash
# START: the commit the session began from. If unknown, fall back to the upstream branch and say so in the report.
START="${START:-$(git merge-base HEAD '@{upstream}' 2>/dev/null || git merge-base HEAD origin/main)}"
git log --oneline "$START"..HEAD            # commits this session
git diff --stat "$START" HEAD               # what those commits changed
git status --short                          # staged, unstaged and untracked, at a glance
git diff --cached                           # staged: what the next commit will contain
git diff                                    # unstaged
git ls-files --others --exclude-standard    # untracked files; read the ones that matter
```

Check staged and unstaged changes separately; `git diff HEAD` nets them out. If you used the fallback, report
"coverage incomplete: compared against `<what was used>`".

A finding belongs to this session if the session changed the relationship it is about, not only the file where the
symptom shows. Renaming a skill makes an untouched `README.md` row wrong. Check the dependents in check 5 even when
nobody edited them.

## Modes

- Plan/suggest-only: inspect and report; do not edit.
- Build/just-do-it: inspect and make coherence fixes.
- Discuss-first: propose changes before editing.
- Audit-only: report risks only.

## Intent

- Does this session's change fit `INTENT.md` and the decisions in `DECISIONS.md`?
- Did it add broader theory (entropic immunity, autopoiesis, viability) here? That belongs in
  `../entropy-immune-system/` (`DECISIONS.md`, "Farm broader entropic-immunity exploration…").
- When the work and the authorised intent disagree:

  > 1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
  >    intent nobody has decided.
  > 2. Fix a defect in the work.
  > 3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
  >    undecided change of intent as a proposal for the steward (proposed: Justin Philpott) in `DECISIONS.md`, as an
  >    entry titled "Proposed: …"; work that depends on it waits for the decision.
  > 4. Do not edit `INTENT.md` to match the work unless the steward has recorded that decision.
  > 5. Correct a document directly only when a recorded decision of the steward's already settles it, and cite that
  >    decision.
  > 6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
  >    the code shows what is checked or built; it does not authorise weakening a documented constraint.

  (Intent-change rule v2, 4 October 2026, from entropy-guard `skills/entropy-assessment/intent-pass.md`.)

## Judgment checks

Most answers will be "nothing to do". That is expected.

1. **Decisions.** Did you choose between approaches, decide against something, find a constraint, or set a
   convention? Add a `DECISIONS.md` entry: context, decision, impact, the date, and who decided. If it replaces an
   earlier entry, mark that entry "Superseded (in part) by …", naming the new one.
2. **Learnings.** Did you find a non-obvious behaviour, or validate or disprove an assumption, or did an `INTENT.md`
   concept prove useful or inadequate on a real case? Add to `LEARNINGS.md`: insight, what validated it, implication.
   Conceptual frameworks go to `PHILOSOPHY.md` or the writing repo.
3. **One home per concept.** If a concept changed, does it still have one home?
   - purpose, entropy model, guard lifecycle, scope boundary: `INTENT.md`
   - settled choices: `DECISIONS.md`
   - working practices, including how the hook is enabled: `AGENTS.md`
   - current stage, open questions, next actions: `TODO.md`
   - how a skill works: that skill's `SKILL.md`
   - `README.md` summarises and links to all of these.

   When a change touches something two documents both describe, decide which owns it and reduce the other to a link
   or a local implication. Keep summaries and independent checks of the same contract; they are not redundant copies.
   Where reducing a copy would change `INTENT.md`, record a proposal instead (Intent, rule 4).
4. **Skill contracts.** If you changed a skill under `skills/`: do its name, path, inputs and handoffs still match
   every skill and doc that names it (`git grep -n "<skill-name>"`)? Check the front door's routes and next moves,
   what `guards-integrator` says it runs after, and that each exportable skill's upstream feedback check still points
   at `skills/local/entropy-guard-feedback/SKILL.md`. If the change alters which skill builds guards, look for a
   decision in `DECISIONS.md`; if there is none, record a proposal rather than choosing. Does the skill still keep
   `INTENT.md`'s principles: delta-scoped, low burden, judgment in skills and mechanics in tooling, inter-domain drift
   where relevant?
5. **Dependents.** When one of these changed, check the docs listed against it:
   - a skill added, removed, renamed or given a new role: `README.md` "What's here", `AGENTS.md` "Key Files" and
     "Quick Links", other skills that hand to it, and `INTENT.md` "The guard lifecycle" (proposal only);
   - `.githooks/pre-commit` or how it is enabled: `AGENTS.md` "Working Practices" and "Key Files", `README.md`
     "Adapt the project's own guard", "Project operations" and "Contributing", and this guard's "When to run";
   - `AGENTS.md` working practices: `README.md` "Contributing";
   - this guard: `README.md` and `AGENTS.md` descriptions of it, and the hook's message.
6. **Supersession.** Before restoring a deleted file, reviving an old concept, or recreating something to fix a
   reference, check the supersession markers in `DECISIONS.md` and the "Superseded nearby" line in `TODO.md`.
7. **Workflow alignment.** If an agent started from `AGENTS.md` alone, would it follow the workflow you actually used?
   Do `AGENTS.md`, `README.md` "Contributing", `TODO.md` and `.githooks/pre-commit` still agree on when this guard
   runs, how "Doing Now" is used, how the hook is enabled, and how upstream feedback is captured? If a rule is written
   as enforced ("non-negotiable", "mandatory") but only a reminder backs it, say so rather than claim it runs.
8. **Cross-references.** Did you rename, move or delete anything that docs link to? Are section names, paths or
   counts now wrong? `git grep -n "<old name>"`.
9. **Placeholders.** Can you now fill or remove a `[TBD]`, an `[Add X here]`, or an empty section this work answers?
10. **State honesty (`TODO.md`).** Is "Doing Now" cleared? Are finished items still open? For each claim this session
    changed in "Current state", do its other mentions in the file (Next Up, Backlog) still agree, and does it carry its
    source and the date checked? Did this session trigger any of the staleness events "Current state" lists? Should
    anything join Next Up or Backlog?

## Mechanical checks

Run from the repo root. No CI exists, so none of these runs anywhere else.

```bash
git diff --check && git diff --cached --check    # whitespace errors, unstaged and staged

# Relative markdown links resolve. (lychee does this as a maintained tool: lychee --offline --no-progress './**/*.md')
find . -name '*.md' -not -path './.git/*' | while read -r f; do
  grep -oE '\]\([^)#]+' "$f" | sed 's/^](//' | grep -v '^https\?:' | while read -r t; do
    [ -e "$(dirname "$f")/$t" ] || echo "BROKEN $f -> $t"; done; done

# Each skill's front matter name matches its folder (DECISIONS.md, "Skill format: agentskills.io spec").
for f in $(find skills -name SKILL.md); do
  n=$(sed -n '2,5s/^name: *//p' "$f" | head -1); d=$(basename "$(dirname "$f")")
  [ "$n" = "$d" ] || echo "MISMATCH $f: name=$n folder=$d"; done

sed -n '/^## Doing Now/,/^## /p' TODO.md          # should show nothing but "[empty]" before commit
```

## Report

- Baseline compared against, and whether coverage was complete
- What was checked, and what was not
- Findings caused by this session, judged by the relationship changed, not the file edited; problems that were already
  there, listed separately
- Proposals for the steward, and where in `DECISIONS.md` they were recorded
- Files updated, such as `TODO.md`, `DECISIONS.md`, `LEARNINGS.md`
- First next action for the next session, written into `TODO.md`, not here
- For the commit message: what the check surfaced, or "entropy check clean". Say so when the main issue was
  workflow/practice drift rather than a missing doc update.

## Safety rules

- Never commit or push unless asked.
- Never read or print secrets; `.env` files are ignored here and stay unread.
- Do not modify unrelated changes.
- Do not add workflow logic under vendor-specific agent folders such as `.claude/` or `.codex/`.

## What this is not

- Not a reason to delay committing. If the check surfaces a large gap, file it in `TODO.md` and fix it in a follow-up.
- Not static. Re-evaluate it by running `skills/entropy-assessment/SKILL.md` against this repo again.
