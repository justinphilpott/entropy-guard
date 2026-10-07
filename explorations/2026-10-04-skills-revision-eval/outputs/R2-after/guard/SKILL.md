---
name: entropy-guard
description: Post-work micro-ritual for the entropy-guard repository. Run before committing meaningful work. Checks only this session's change - intent fit, one owner per concept, supersession, cross-references, exported-skill handoffs, decision and learning capture, state honesty and workflow alignment.
metadata:
  version: "0.3.0"
  generated: "2026-10-04"
  source: "entropy-guard session-coherence-skill-generator v0.3.0, with checks from docs-first-planning-assessment v0.2.0"
  replaces: "entropy-guard 0.2.3 (generated 2026-03-19, last evaluated 2026-04-07)"
  system_snapshot: "markdown-only repo; 4 exported skills under skills/, 2 local skills under skills/local/; no code, tests or CI; one reminder hook in .githooks/"
---

# Skill: Entropy Guard

Run at the end of a meaningful work session, before commit or handoff. Check only this session's change. It takes
2-5 minutes. If you find yourself auditing the whole repo, stop and add the wider problem to `TODO.md` instead.

## When to run

- You have finished a task and are about to commit.
- You resolved a problem whose solution reaches beyond the immediate fix.
- A session is ending and someone else, human or agent, will pick up next.

## When not to run

- After a trivial change, such as a typo or formatting fix.
- As a full audit of the repo. No full-audit skill exists; if one is needed, record that in `TODO.md`.
- More than once per logical piece of work.

## Where things live

Read these. Do not copy their content into this guard.

- **Authorised intent:** `INTENT.md`. Scope is restated in `README.md` "Project status" and `AGENTS.md`
  "Project Constraints". Steward: Justin Philpott, the repo owner.
- **Current state, next steps, open questions, and historical material likely to mislead:** `TODO.md`. Read it first.
- **Decisions:** `DECISIONS.md`, newest entry at the top. **Learnings:** `LEARNINGS.md`.
- **Working practices:** `AGENTS.md`. `README.md` "Contributing" is its short version.
- **Rules owned elsewhere:** skill format follows the agentskills.io specification (`DECISIONS.md`, "Skill format");
  scaffolding feedback goes to the seed project (`AGENTS.md`, "Scaffolding Feedback"); upstream issues are filed only
  through `skills/local/entropy-guard-feedback/SKILL.md`.

## What changed this session

```bash
git status --short                                   # staged, unstaged, untracked at a glance
git log --oneline <start>..HEAD                      # commits this session, if the start commit is known
git log --oneline @{upstream}..HEAD                  # otherwise: commits not yet pushed
git diff HEAD                                        # all uncommitted changes to tracked files
git ls-files --others --exclude-standard             # untracked files: read each one
```

If the session's start commit is unknown, compare against `@{upstream}` and report "coverage incomplete: compared
against @{upstream}". If the branch has no upstream, compare against `main` and say so.

Changes outside the files: this repo has no services, deployments, credentials or spend. If the session filed GitHub
issues through the feedback helper, list their URLs in the report.

## Modes

- Plan / suggest-only: inspect and report; do not edit.
- Build / just-do-it: inspect and make the coherence fixes.
- Discuss-first: propose the changes before editing.
- Audit-only: report risks only.

## Intent

- Does this session's change fit `INTENT.md`? For a changed skill, check it keeps the low-burden requirement, scopes
  to the delta rather than a full audit, maps each entropy vector to an enforcement depth, and addresses inter-domain
  drift where it matters.
- When this session's work and the authorised intent disagree:
  1. Decide which it is: a defect in the work, an adaptation within what was authorised, or a decision nobody has
     made.
  2. Fix a defect in the work.
  3. Record an adaptation or an unmade decision as a proposal for Justin Philpott in `DECISIONS.md`: a new entry at
     the top, headed `Proposed: <title>`, opening with `Proposed <date> by <who>, awaiting Justin.`
  4. Do not edit `INTENT.md`, `README.md` "Project status" or `AGENTS.md` "Project Constraints" to match the work
     unless Justin Philpott has recorded that decision.
  5. Correct a document directly only when a recorded decision of Justin Philpott's already settles it, and cite that
     decision.

## Judgment checks

1. **Decisions.** Did the session choose between approaches, decide against something, find a constraint, or set a
   convention? Record it in `DECISIONS.md` as context, decision, impact. A decision Justin made in the session opens
   with `Justin, <date>:`. Anything else is a `Proposed:` entry, as in Intent step 3. If it supersedes an older entry,
   mark that entry "Superseded by ..." or "Partially superseded by ...", and name what no longer holds.
2. **Learnings.** Did something fail unexpectedly, or did real use confirm or refute an assumption? Add it to
   `LEARNINGS.md` as insight, validated by, implication. "Validated by" names real use, such as a run on a repo or a
   dogfooding pass. Ideas from conversation belong in `PHILOSOPHY.md` or the sibling `entropy-immune-system` repo
   (`DECISIONS.md`, "LEARNINGS.md stays tactical").
3. **One owner per concept.** If the session changed a concept below, did its canonical home change first? When a
   change touches something two documents both describe, decide which owns it and reduce the other to a link or a
   one-line summary. Do not keep both up to date as peers.

   | Concept | Canonical home | Mentions that stay links or summaries |
   |---|---|---|
   | Purpose, scope, entropy model, guard lifecycle | `INTENT.md` | `README.md`, `AGENTS.md` |
   | Enforcement-depth ladder | `INTENT.md` "Enforcement depth spectrum" | Skills may restate it so they stand alone, but use its level names: External, Prompted, Semi-embedded, Fully embedded |
   | Routing a target system to a workflow | `skills/entropy-assessment/SKILL.md` | `README.md` "How to use this repo" |
   | Building guards | The skill `DECISIONS.md` records as the guard builder. Until one is recorded, a change to either `skills/docs-first-planning-assessment/` Phase 2 or `skills/session-coherence-skill-generator/` is checked against the other | `README.md`, `INTENT.md` lifecycle |
   | Placing and adopting guards | `skills/guards-integrator/SKILL.md` | the assessment skills' integration notes |
   | Current state and next steps | `TODO.md` | `README.md` "Project status", `INTENT.md` "Scope boundary" |
   | Working practices | `AGENTS.md` | `README.md` "Contributing", `.githooks/pre-commit`, this guard |

4. **Supersession.** Before restoring a deleted file or section, reviving an old structure, or fixing a broken
   reference by recreating its target, search `DECISIONS.md` for that thing and for "superseded", and check the
   historical list in `TODO.md`.
5. **Cross-references the link check cannot see.** For each name this session renamed or removed, run
   `git grep -n "<old name>"`. Look in particular at skill names in backticks, "Step N" or "Phase N" references to
   another skill, section and table names in `README.md`, and the copy-paste prompts in `README.md` "How to use this
   repo", which people paste into other repos.
6. **Exported-skill handoffs.** If a skill directly under `skills/` changed: do the skills that hand work to it, or
   take work from it, still describe the handoff the same way, meaning who routes, who builds guards and who places
   them? Do `README.md` "What's here" and `AGENTS.md` "Key Files" still describe it? Was `metadata.version` bumped?
7. **State honesty.** In `TODO.md`: is "Doing Now" cleared, are finished items gone, is new work in "Next Up" or
   "Backlog"? If the session touched something a dated claim in "Current state" cites, re-check the claim and its date.
   Fill or remove any placeholder the session's work now answers.
8. **Workflow alignment.** If an agent started from `AGENTS.md` alone, would it follow the loop used in this session?
   Do `AGENTS.md`, `README.md` "Contributing", `.githooks/pre-commit` and this guard agree on when the guard runs and
   how the reminder hook is enabled?

## Mechanical checks

Each prints nothing when clean, except the last, which reports the hook's state.

```bash
# Relative markdown links that do not resolve
git ls-files '*.md' | while read -r f; do
  grep -o '](\([^)]*\))' "$f" | sed 's/^](//; s/)$//; s/#.*//; s/ .*//' |
    grep -v -E '^(https?:|mailto:|$)' | while read -r l; do
      [ -e "$(dirname "$f")/$l" ] || echo "broken link: $f -> $l"
    done
done

# Each SKILL.md's frontmatter name matches its directory (agentskills.io)
git ls-files 'skills/*SKILL.md' | while read -r f; do
  n=$(sed -n '2,6s/^name: *//p' "$f"); d=$(basename "$(dirname "$f")")
  [ "$n" = "$d" ] || echo "name mismatch: $f name=$n dir=$d"
done

# Whitespace errors in uncommitted changes
git diff HEAD --check

# Is the reminder hook active in this clone?
h="$(git rev-parse --git-path hooks)/pre-commit"
[ -x "$h" ] && echo "reminder hook active: $h" || echo "reminder hook NOT active: run git config core.hooksPath .githooks"
```

## Report

- The baseline compared against, and whether coverage was complete.
- What was checked, and what was not.
- Findings caused by this session. List problems that were already there separately, and add them to `TODO.md`
  "Backlog" rather than fixing them mid-task.
- Proposals for Justin Philpott, with the `DECISIONS.md` entry each was recorded in.
- Files updated, such as `TODO.md`, `DECISIONS.md` and `LEARNINGS.md`.
- The first next action for the next session, written into `TODO.md`, not here.
- One line for the commit message: what the check surfaced, or "entropy check clean". Say so if the main issue was
  workflow or practice drift rather than a missing doc update.

## Safety rules

- Do not commit or push unless asked.
- Do not read or write secrets.
- Do not modify changes unrelated to this session.
- Do not add workflow logic under vendor-specific folders such as `.claude/`, `.codex/` or `.cursor/`.

## What this is not

- A full audit.
- A reason to delay committing. A large gap goes into `TODO.md` and a follow-up commit.
- Static. When the exported skill set changes shape, meaning a skill is added, removed or renamed, or a handoff between
  skills changes, re-run `skills/entropy-assessment/SKILL.md` on this repo and refine this guard through the guard
  generator.
