---
name: entropy-guard
description: Session-end coherence guard for the entropy-guard repository. Run before committing meaningful work. Checks this session's change for fit with authorised intent, one canonical home per concept, supersession, decision and learning capture, the contracts between the exported skills, workflow alignment, cross-references, and honest state in TODO.md.
metadata:
  version: "0.3.0"
  generated: "2026-10-07"
  source: "entropy-guard session-coherence-skill-generator v0.3.0; refines local entropy-guard v0.2.3 in place"
  system_snapshot: "snapshot 447da9a: markdown-first, no runtime, no CI; 4 exportable skills, 2 local skills; one non-blocking pre-commit reminder in .githooks/pre-commit"
---

<!-- DRAFT for skills/local/entropy-guard/SKILL.md. Provisional on proposal P1 in DECISIONS.md: the
     steward's name below, and whether AGENTS.md's instruction to update INTENT.md directly is a standing
     delegation. Do not install until P1 is decided; then delete this comment. -->

# Skill: entropy-guard Session Coherence Guard

Run at the end of a meaningful work session, before committing. Check only this session's change. Most answers
will be "nothing to do". If you find yourself auditing every document, stop: that is a different job (see below).

## When to use

- Before committing meaningful work, as `AGENTS.md` "Working Practices" asks; `.githooks/pre-commit` reminds you
  when it is enabled.
- When a session is ending and someone else, human or agent, will pick the work up.
- After any change to a skill under `skills/`, to `INTENT.md`, `DECISIONS.md`, `AGENTS.md` or `TODO.md`.

## When not to use

- Typo or formatting-only changes.
- As a full audit of the repository: re-run `skills/entropy-assessment/SKILL.md` against this repo instead, as
  `INTENT.md` ("What the guard generator should achieve") asks.
- More than once per logical piece of work.

## Where things live

Read these; do not copy their contents into this guard.

- Authorised intent: `INTENT.md`. Steward: **Justin Philpott** [provisional: inferred from his recorded direction
  in `explorations/2026-03-24-entropy-immune-system-conversation.md` and the repository's GitHub owner; not yet
  recorded in the repo].
- Current state, open questions and next steps: `TODO.md`. Read it first.
- Decisions: `DECISIONS.md`, newest first. Its entries count as recorded decisions even where they carry no date or
  author. Superseded entries are marked "Superseded by" or "Partially superseded by".
- Learnings: `LEARNINGS.md`, tactical and validated only. Articles go to the `writing` repo (`DECISIONS.md`,
  "LEARNINGS.md stays tactical").
- Working practice: `AGENTS.md`, "Working Practices" and "Project Constraints".
- Historical, not live truth: `explorations/` (kept here by the steward's decision; the theory continues in the
  sibling `entropy-immune-system` repo, per `DECISIONS.md` "Farm broader entropic-immunity exploration…").
- Rules owned elsewhere: scaffolding conventions belong to `seed` (`AGENTS.md`, "Scaffolding Feedback");
  upstream issues go through `skills/local/entropy-guard-feedback/SKILL.md`. Link to these; do not restate them.

## What changed this session

```bash
START="${START:-$(git merge-base HEAD '@{upstream}' 2>/dev/null)}"   # set START to the commit the session began from, if known
[ -n "$START" ] || { START=HEAD; echo "coverage incomplete: compared against HEAD only; set START=<commit> to include this session's commits"; }
git log --oneline "$START"..HEAD          # commits this session
git diff --stat "$START" HEAD             # what those commits changed
git status --short                        # staged, unstaged and untracked, at a glance
git diff --cached --stat                  # staged: what the next commit will contain
git diff --stat                           # unstaged
git ls-files --others --exclude-standard  # untracked: read the ones that matter
```

Check staged and unstaged separately; `git diff HEAD` alone nets them out. If this session filed GitHub issues
through the feedback helper, list them as changes outside the files.

A finding belongs to this session if the session changed the relationship it is about, not only the file where the
symptom shows. Renaming a skill makes an untouched `README.md` wrong.

## Modes

- Plan/suggest-only: inspect and report; do not edit.
- Build/just-do-it: inspect and make coherence fixes.
- Discuss-first: propose changes before editing.
- Audit-only: report risks only.

## Intent

- Does this session's change fit `INTENT.md`, in particular "Scope boundary and next validation loop"?
- When the work and the authorised intent disagree:
  1. Decide which it is: a defect in the work, an adaptation within what is already authorised, or a change of
     intent nobody has decided.
  2. Fix a defect in the work.
  3. Go ahead with an adaptation within existing authorisation, and record its reason where that helps. Record an
     undecided change of intent as a proposal for Justin Philpott in `DECISIONS.md`, headed "Proposed — awaiting
     Justin Philpott"; work that depends on it waits for the decision.
  4. Do not edit `INTENT.md`, or the scope statements that restate it (`README.md` "Project status", `AGENTS.md`
     "Project Constraints"), to match the work unless Justin Philpott has recorded that decision.
  5. Correct a document directly only when a recorded decision of Justin Philpott's already settles it, and cite
     that decision.
  6. Before making a description, an implementation and a check agree, establish which of them is wrong. A test or
     the code shows what is checked or built; it does not authorise weakening a documented constraint.

  (Intent-change rule v2, from entropy-guard `skills/entropy-assessment/intent-pass.md`.)
- [Open: proposal P1 in `DECISIONS.md`] `AGENTS.md` "Consult INTENT.md for significant decisions" tells
  contributors to update `INTENT.md` directly. Until Justin Philpott records whether that is a standing delegation, it is not a recorded
  decision under item 4: record a proposal instead.

## Judgment checks

1. **One canonical home.** If a concept changed, is its home still the one below, with other documents carrying
   only a link, a summary or a local implication?
   - purpose, scope, entropy model, guard lifecycle: `INTENT.md`
   - which skill does what, and the routes between them: the skills' own `SKILL.md` files
   - working practice: `AGENTS.md`
   - decisions: `DECISIONS.md`; learnings: `LEARNINGS.md`; current state: `TODO.md`

   When a change touches something two documents both describe, decide which owns it and reduce the other to a
   link. Keep summaries and independent tests of the same contract; they are not redundant copies.
2. **Supersession.** Before restoring a removed file, step or skill, or reviving an idea from `LEARNINGS.md` or
   `explorations/`, check `DECISIONS.md` for a supersession and `TODO.md` for the list of misleading nearby
   material. Step numbers in older `LEARNINGS.md` and `DECISIONS.md` entries refer to skill versions that no longer
   exist.
3. **Contracts between the skills.** If a skill under `skills/` changed, do the skills it hands to and from still
   agree with it about names, paths, inputs, outputs and who does what? The skills that hand to each other are
   `entropy-assessment`, `docs-first-planning-assessment`, `session-coherence-skill-generator`, `guards-integrator`
   and `local/entropy-guard-feedback`. Example: a skill that says "after X generates guards" is wrong if X no longer
   generates guards. Then check the documents that describe the chain: `README.md` "How to use this repo",
   `INTENT.md` "What the guard generator should achieve" and "The guard lifecycle".
4. **Decisions.** Did you choose between approaches, decide against something, find a constraint, or set a
   convention? Record it in `DECISIONS.md` (context, decision, impact), with the date and who decided. If it
   supersedes an older entry, mark that entry "Superseded by" or "Partially superseded by", as the existing
   entries do.
5. **Learnings.** Did something validated on a real case, rather than only argued, belong in `LEARNINGS.md`
   (insight, what validated it, implication)? If this session applied or retired an existing learning's
   implication, note that on the entry.
6. **State honesty.** For each claim this session changed in `TODO.md`: do its other mentions in the file still
   agree, does its "last checked" date and source still hold, and is the work recorded under "Doing Now" handled
   as `AGENTS.md` says? If "Next Up" changed, do `README.md` "Project status" and `INTENT.md` "Scope boundary and
   next validation loop" still agree with it, or does a steward decision need proposing (Intent, item 3)?
7. **Workflow alignment.** If this session changed how contributors work (when the guard runs, how `TODO.md` is
   used, how feedback is filed, the hook), would an agent starting from `AGENTS.md` alone follow the loop you
   actually used? Do `AGENTS.md`, `README.md` "Contributing", `.githooks/pre-commit` and this guard agree?
8. **Claims about practice.** If a document now says something "runs", "is enforced" or is "non-negotiable", name
   what makes it so. If only a reminder or an instruction stands behind it, say that instead.
9. **Guard-induced entropy.** If you propose automating a check, is the invariant durable, such as links or
   frontmatter? Keep checks that depend on current wording or moving structure as judgment checks.

If these changed, check the documents that describe them:

- a skill added, removed or renamed: `AGENTS.md` "Key Files", `README.md` "What's here", and check 3
- `.githooks/pre-commit`: `AGENTS.md` "Working Practices", `README.md` "Adapt the project's own guard" and
  "Contributing"
- `AGENTS.md` "Working Practices": `README.md` "Contributing", the hook's message, this guard
- `INTENT.md` (after a recorded steward decision only): `README.md` "Project status", `AGENTS.md` "Project
  Constraints"

## Mechanical checks

```bash
# Whitespace errors, unstaged and staged
git diff --check; git diff --cached --check

# Relative markdown links resolve, in tracked and new files (fenced code blocks skipped)
git ls-files -co --exclude-standard -- '*.md' | while read -r f; do
  [ -f "$f" ] || continue
  awk '/^ *```/{c=!c; next} !c' "$f" | grep -o '\](\([^)]*\))' | sed 's/^](\(.*\))$/\1/' | while read -r t; do
    case "$t" in http*|mailto:*|'#'*) continue;; esac
    [ -e "$(dirname "$f")/${t%%#*}" ] || echo "broken link: $f -> $t"
  done
done

# Each skill's frontmatter name matches its folder, and it has a description (DECISIONS.md "Skill format")
git ls-files -co --exclude-standard -- 'skills/*SKILL.md' | while read -r f; do
  [ -f "$f" ] || continue
  d=$(basename "$(dirname "$f")"); n=$(sed -n 's/^name: *//p' "$f" | head -1)
  [ "$n" = "$d" ] || echo "name mismatch: $f ($n, folder $d)"
  grep -q '^description: ' "$f" || echo "no description: $f"
done

# After renaming or removing a file, skill, section or term: every remaining mention of the old name
git grep -n -- '<old name>'
```

No output from a check means it passed. There is no CI in this repo, so nothing else runs these.

## Repairs

Repair in the canonical home first, then reduce or fix the other mentions. Where a description, a skill and a
check disagree, establish which is wrong before making them agree (Intent, item 6). If a gap is too large for this
session, add it to `TODO.md` and fix it in a follow-up commit rather than widening this one.

## Report

- Baseline compared against, and whether coverage was complete
- What was checked, and what was not
- Findings caused by this session, judged by the relationship changed, not the file edited; problems that were
  already there, listed separately
- Proposals for Justin Philpott, and where they were recorded in `DECISIONS.md`
- Files updated, such as `TODO.md`, `DECISIONS.md` and `LEARNINGS.md`
- First next action for the next session, written into `TODO.md`, not here

Put one line of the report in the commit message: what was updated, or "entropy check clean", as `README.md`
"Contributing" asks.

## Safety rules

- This guard does not commit or push; committing stays the contributor's step.
- Do not read or write secrets.
- Do not modify changes that are not part of this session's work.
- Do not add workflow logic under vendor-specific agent folders (`.claude/`, `.codex/`, `.cursor/` and similar).
