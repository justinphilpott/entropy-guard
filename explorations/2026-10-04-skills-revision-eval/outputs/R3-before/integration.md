# Integration Brief: agentic-architecture guards

Produced 2026-10-04 by `skills/guards-integrator/SKILL.md` (v0.2.2), handed off from `docs-first-planning-assessment` Step 8 because the repo has several actors and handoff points:

- **Actors:** the steward, Claude Code, OpenCode, and Pi-run agents
- **Handoff points:** session start, commit, and the cross-repo harvest

**Guards being integrated:**
- `guard/SKILL.md`: the refined reference-only entropy guard. It is to be installed at `skills/entropy-guard.md`.
- `skills/session-kickoff.md`: the existing session-start packet builder, amended as below.

**Evidence available:** no `.git`, so commit cadence and whether PRs are used are unknown. No CI files, no `.githooks/`, no `.pre-commit-config.yaml`, no PR template. The only workflow primitives are `AGENTS.md` (auto-loaded; `CLAUDE.md` is a symlink to it) and the two skills.

## Loop map

- **Change starts in:** an agent session (Claude Code primary, OpenCode secondary, per `MANIFEST.md`). The session works in a local checkout at `~/pro/agentic/agentic-architecture` (the path shown in the run records).
- **Agent context load:** `AGENTS.md` is auto-loaded by Claude Code via the `CLAUDE.md` symlink. Run 001 records that Pi also auto-loads both files.
- **Session start:** `AGENTS.md` "Session start" steps 1-6 → `skills/session-kickoff.md` builds the current-state packet in the conversation.
- **First handoff:** local commit. `skills/entropy-guard.md` runs before commit as a standing instruction (`AGENTS.md` line 72). It is external and discipline-only.
- **Second handoff:** push. PR review is unknown; no template is present.
- **Automated gate:** none.
- **Cross-repo handoff (new since retirement):** a decision, finding or learning moves from this repo into `../personal-agent` or `../../scope`. Nothing in either direction records this today.
- **Where entropy enters:** at session start, because the kickoff reads 4 live-mode files and not the status banner. And at the cross-repo handoff, because nothing records what was harvested.

## Guard placement

| Guard | Trigger | Actor | Cost | Why here |
|---|---|---|---|---|
| `skills/session-kickoff.md` (amended) | Start of any session that will change this repo, or that needs this repo's settled positions | Agent, before choosing work | 1-2 min | Status has to be known before the first edit. This is where the current loop goes wrong. |
| `skills/entropy-guard.md` (refined) | Before any commit to this repo | The agent or human committing | 2-5 min | It is the only habitual pause. Its check 0 (mode gate) stops design work before it lands. |
| Harvest capture (check 4 of the refined guard) | Whenever something moves from here to a successor | The agent doing the move, in whichever repo it is working in | Under 1 min | The context is freshest at the moment of moving. Waiting for the next commit here loses it. |

Order: kickoff → work → guard → commit. They do not run in parallel; each needs the previous one's result.

## Amendments to existing surfaces (the `Now` changes, concretely)

**`skills/session-kickoff.md`**
- § Canonical Inputs: insert as item 0 "the status banner at the top of `README.md` / `AGENTS.md`, and the retirement entry in `DECISIONS.md`". Insert `architecture/INDEX.md` after `DECISIONS.md`.
- § Step 1: make the first bullet "repository status (reference-only) and successor repos".
- § Step 3 packet and the Output Template: add **Repository status / successors** as the first element. Allow "Active fronts: none in this repo; see successors".
- § Step 4: add "if the task is live design work, redirect to `../personal-agent` or `../../scope` before proceeding".
- Leave § When to Run unchanged.

**`AGENTS.md`**
- Line 8: replace "This repo holds the current architecture state" with "This repo holds the architecture state as of retirement (see `DECISIONS.md`: '<retirement entry title>')".
- Heading "Settled — current strong positions" → "Settled positions as recorded at retirement".
- § Session start: insert a new step 1, "Read the banner above. If your task is live design, work in the successor repo; read this one only for history." Keep steps 2-6, pointing at the amended kickoff.
- § Working practices: mark "Keep MODEL.md and components.yaml current…", "Update MANIFEST.md…" and "Components are `exploratory` by default…" as suspended while reference-only. Keep line 72 (run the guard before committing), but drop "non-trivial": every commit now.
- § Key files: add `architecture/INDEX.md`, `components/temporal-coordinator/`, `runs/`, `RUNTIME.md`, `SCHEDULING.md`, `SCOPES_PLANNED.md`.

**`skills/README.md`**
- Add one line: the entropy guard runs in reference-only mode; the kickoff leads with status.

## Adoption plan

- **Now** (external; existing primitives only):
  - Complete bootstrap B1-B3 from `assessment.md` § 7 first. Without B1 (a dated retirement entry) the guard's mode gate has nothing canonical to check against.
  - Install `guard/SKILL.md` over `skills/entropy-guard.md`, keeping the same path so `AGENTS.md` and `skills/README.md` links stay valid.
  - Apply the kickoff, `AGENTS.md` and `skills/README.md` amendments above in the same commit.
  - Run the refined guard on that commit as its first real use.
- **Next** (prompted; only if a missed run becomes the main failure mode):
  - Add a non-blocking pre-commit reminder (`.githooks/pre-commit` that prints "run skills/entropy-guard.md (reference-only)"; enable it with `git config core.hooksPath .githooks`).
  - In each successor repo's own guard, add a provenance check: "if this session imported a concept from agentic-architecture, cite the file and dated entry, and add a line to its harvest ledger". This is outside this target; it needs the successors' owners.
- **Later** (semi-embedded, then fully embedded):
  - Move the link check (guard check 7) into a hook or CI step, but only if the repo stays writable and keeps receiving commits. Prefer a maintained markdown link checker over the shell snippet (none was evaluated in this run).
  - Fully embedded: once the harvest ledger shows every run finding and open decision as "moved" or "dropped", archive the repository read-only. Drift then becomes structurally impossible, and the guard and kickoff can be retired.

## Discovery plan

- `AGENTS.md` banner and § Session start: every agent tool used here auto-loads it.
- `AGENTS.md` § Working practices line 72 → `skills/entropy-guard.md` (existing pointer; path unchanged).
- `skills/README.md`: lists both skills and their modes.
- `README.md` banner: add "Agents: see AGENTS.md before changing anything", for humans arriving from GitHub.
- Successor repos: their `AGENTS.md` should say "agentic-architecture is reference-only; cite it, do not extend it" (Next; outside this target).

## Execution plan

- **Order:** kickoff (session start) → work → refined guard (before commit) → commit.
- **Parallelisable:** none. Harvest capture runs inline whenever a move happens.
- **Outputs:**
  - kickoff → the packet, in conversation only (not written to disk)
  - guard → one line in the commit message (`entropy check (reference-only): clean` or what changed)
  - harvest capture → one line per item in `runs/README.md` § Harvest status
- **Escalation:** if the guard's mode gate stops a change, the change goes to the successor repo's backlog with a pointer back. If a fix here would need more than one commit, record it in the harvest ledger and stop.

## Automation opportunities

- **Link integrity (guard check 7):** a durable invariant, already scripted as a tested manual aid (0 broken / 23 sibling links on 2026-10-04). Move it to a hook or CI only under the Later condition above.
- **Live-state wording grep (guard check 1):** encodes current phrasing. Keep it narrative and manual; automating it would false-positive on the historical `DECISIONS.md` text.
- **`components.yaml` path validity:** would need sibling repos present on disk. Not worth automating in a frozen repo; fix the paths once (`questions.md` Q7).
- **Nothing else qualifies.** The other checks are judgment.

## Risks / uncertainties

- **Assumed agent-driven sessions with auto-loaded `AGENTS.md`.** Evidence: the `CLAUDE.md` symlink, and run 001's note that Pi auto-loads both files. If humans edit without an agent, the `README.md` banner pointer becomes the main discovery path.
- **Commit and PR flow unknown** (no `.git` in the snapshot). If PRs are used, a PR description line can replace the commit-message line.
- **Activity level unknown.** If nobody commits here any more, only B1-B3 and the kickoff amendment matter. The guard is then insurance.
- **Successors unread.** The harvest ledger and successor-side provenance checks assume `../personal-agent` and `../../scope` exist and keep their own decision logs.
- **Re-check after a few real iterations:** whether the mode gate is too strict for legitimate maintenance, and whether harvest lines are actually being written.

## Upstream feedback on entropy-guard itself (Step 7)

Yes, feedback is needed. See `feedback.md` F2 (category `integration`): guards-integrator has no notion of a cross-repo handoff point, which is the main handoff for a retired repo. F1 and F3 cover the assessment skills.
