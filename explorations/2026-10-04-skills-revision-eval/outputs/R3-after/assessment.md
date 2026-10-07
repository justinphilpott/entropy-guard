# Entropy assessment: agentic-architecture

Date: 2026-10-04. Target: a read-only snapshot of `agentic-architecture` (82 files, no `.git`).
Skills used, in order: `entropy-assessment` (front door and intent pass) → `docs-first-planning-assessment`
(analysis, route A) → `session-coherence-skill-generator` (guard refinement, plan mode against a read-only
target) → `guards-integrator` (see `integration.md`).

**Provisional.** No steward was available. Three questions are recorded in `questions.md`, each with a
recommended answer. Everything below that depends on them is marked *provisional (Qn)*.

---

## 1. Intent

### Steward

**Justin, by inference.** No document says who decides what this repository is for. `AGENTS.md:5-6`
asks for "explicit authorization" without naming who gives it. The evidence for Justin:

- `steward: "justin"` on every scope (`components/orchestrator/scope/scope.yaml:6,23,34`);
- the repository URL `github.com/justinphilpott/agentic-architecture` (`components/orchestrator/scope/README.md:3`);
- "Justin's ChatGPT Plus subscription" (`runs/001-moving-stillness-status/RUN.md:41`).

No `DECISIONS.md` entry carries a name. Entries are dated but have no author. This assessment treats them
as Justin's decisions because `DECISIONS.md` is the repository's declared decision log on a personal
project. That is an inference, recorded under Uncertainties.

### Statements gathered

| # | Where | Statement | Kind | Date |
|---|---|---|---|---|
| 1 | `README.md:3-5` | "Status: Reference-only. Current Personal Agent architecture lives in `personal-agent`, and the current generic Scope/Project model lives in `scope`. Do not treat decisions in this repository as current authority." | Description phrased as a directive; no author | none |
| 2 | `AGENTS.md:3-6` | Same banner, plus "Do not extend or reinterpret this blueprint as current design without explicit authorization." | Same | none |
| 3 | `AGENTS.md:8` | "This repo holds the current architecture state — settled decisions, active component design…" | Description | none |
| 4 | `README.md:7-9` | "Current named version: Sol 0.x … Bleeding-edge design source for the current named version" | Description | none |
| 5 | `DECISIONS.md:131-142` | `agentic-architecture` is "the bleeding-edge design source for the current named version" | Decision-log entry | 2026-04-23 |
| 6 | `DECISIONS.md:156-162` | The Level 2 distribution lives in `agentic-architecture-distribution` | Decision-log entry | 2026-05-14 |
| 7 | `DECISIONS.md:836-851` | Temporal coordinator V0 is a pg-boss POC; `SPEC.md` holds the full contract | Decision-log entry | 2026-07-26 |
| 8 | `DECISIONS.md:855-861` | Architecture snapshots are the single source of truth for a domain's anatomy | Decision-log entry | 2026-07-16 |
| 9 | `DECISIONS.md:305-309`, `AGENTS.md:28` | `DECISIONS.md` is the only open-question registry | Entry, restated as a rule | 2026-04-05 |
| 10 | `architecture/SCHEMA.md:78`, snapshot `ARCH.md:72` | A snapshot's "Under Review" list is the source of truth for that domain's open items | Description | 2026-07-16 |
| 11 | `NORTH_STAR.md` | Vision: a personal agentic system; map, not territory | Description | none |
| 12 | `AGENTS.md:12-34` | "Settled — current strong positions" | Rules restating decisions | none |
| 13 | `AGENTS.md:72` | "Before committing non-trivial changes, run `skills/entropy-guard.md`" | Rule | none |
| 14 | `AUTH_OPTIONS_ANALYSIS.md:10-16` | "Current Working Decision": direct API-key auth, "no subscription-auth plumbing yet" | Decision outside the log; no author | none |
| 15 | `runs/002-…/RUN.md:41-47` | "Resolved pre-execution decisions", including professional-presence as "a settled active scope" | Decisions outside the log | 2026-05-10 to 05-13 |
| 16 | `runs/README.md:7-9` | The manual experiment line "is paused after Runs 001-003" | Description | none |

### Three readings

- **Declared.** Two incompatible declarations. The banners (1, 2) say the repository is reference-only
  and that current truth lives in `../personal-agent` and `../../scope`. The body (3, 4, 12, 13) and the
  working loop (`AGENTS.md:36-45`, `skills/session-kickoff.md`, `skills/entropy-guard.md`, `ROADMAP.md`)
  still run it as the live design source for Sol 0.x.
- **Enacted.** There is no git history in the snapshot, so this comes from dated content only. The last
  dated architecture work is the 2026-07-26 temporal coordinator pivot, which superseded
  `architecture/PICKUP.md` and `INTERFACE_REFINEMENT_PLAN.md`. The run line stopped after 2026-05-13.
  `personal-agent` appears nowhere except the two banners, which is consistent with the banners being
  written after the last content work.
- **Authorised.** The recorded decisions still make this repository the Level 1 design source (5). No
  recorded decision authorises the reference-only status.

### Gaps, by condition

**Conflict**
- **C1, repository status.** Statements 1-2 conflict with 3-5, and no recorded decision says which wins.
  The guard depends on the answer, so it is asked: **Q1**.
- **C2, the open-question registry.** `DECISIONS.md` is the only registry (9), but a snapshot's Under
  Review list is the source of truth for its domain (10). The later 2026-07-16 entry (8) moves anatomy to
  snapshots but does not say where open questions live. Under reference-only status nothing depends on
  it, so it is not asked.
- **C3, the temporal coordinator contract.** `SCHEDULING.md:20` and `DECISIONS.md:847` call `SPEC.md`
  authoritative. The banner says no decision here is current authority. `components.yaml:31` puts the
  implementation in `../temporal-coordinator`, and `INTERFACE_REFINEMENT_PLAN.md:6-7` names a plan in that
  repository as current. The guard's one-owner check depends on the answer: **Q3**.

**Missing**
- **M1.** No decision records the change to reference-only: when it happened, why, or what it still
  permits. Recorded as a proposal (see "Proposed intent change" below).
- **M2.** No document names who decides this repository's intent. Not asked: it is a personal
  repository, and the answer would not change what gets built.
- **M3.** Some decisions were recorded outside the log: the professional-presence scope (statement 15),
  the `life-integration` scope (`SCOPES_PLANNED.md:84-86`, with no entry), and the auth working
  decision (14). Not asked: under reference-only status they are historical.
- **M4.** Whether the repository stays where it is or moves to `~/pro-archive/`. `DECISIONS.md:176`
  (2026-04-04) puts superseded projects there. This decides whether a guard is needed at all: **Q2**.

**Ambiguous**
- **A1.** "Do not extend or reinterpret this blueprint as current design without explicit authorization"
  (`AGENTS.md:5-6`) has two readings: frozen apart from corrections, or still maintained with no new
  design. They diverge on `runs/001-…/RUN.md:116-120`, which asks for a new decision ("Pi's event types
  are the v0 runtime event/action log schema") and a ticked `ROADMAP.md:26`. Folded into **Q1**.

**Unauthorised drift**
- **U1.** `AUTH_OPTIONS_ANALYSIS.md:12-16` sets direct API-key auth for the first slice. All three runs
  used subscription auth instead: `--model openai-codex/gpt-5.5` after a ChatGPT Plus `/login`
  (`runs/001-…/RUN.md:28,41`; `runs/002-…/RUN.md:33,140`). No decision covers the difference. The runs
  are historical, so the work cannot be fixed. **Response:** no change here. If the auth choice still
  matters, it belongs in the successor repository's decision log.
- **U2.** The old guard and the session-start loop enact active development, which the banner forbids.
  This is C1 seen from the enacted side.

**Stale descriptions.** These documents contradict a later recorded decision. They are corrected from
that decision, without asking, and are listed with their citations as bootstrap action B5.

**Prose controls**
- **P1.** The banner rule "Do not extend … without explicit authorization" has nothing enforcing it.
  Three in-repository mechanisms push the other way:
  - `AGENTS.md:38` sends a fresh session to "what's being worked towards";
  - `skills/session-kickoff.md:78` asks for "Most plausible next actions";
  - the old guard tells agents to update `components.yaml` and `ROADMAP.md` progress (`skills/entropy-guard.md:79-80`).

  It is the only control against extending the repository. Enforcement would have to sit in the guard's
  Intent check and in session start, and the refined guard and `integration.md` put it there.
- **P2.** "No stale docs … in the same commit" (`AGENTS.md:26`, `architecture/INDEX.md:23`) is enforced
  only by the hand-run guard, and is broken. `architecture/PICKUP.md:15` claims the "hygiene pass is
  complete", yet `RUNTIME.md:67,82` still describe a "unified" gateway.
- **P3.** "Never duplicate the question text" (`AGENTS.md:28`) is enforced only by hand, and is broken.
  `components/scope/skills/scope-design.md:161-162` repeats two deferred questions
  (`DECISIONS.md:894-895`). `AUTH_OPTIONS_ANALYSIS.md:246-251` keeps its own open questions.
- `AGENTS.md:72` (run the guard before committing) is honestly labelled discipline-based in the old
  guard's Integration section. It is not a prose control.

### Proposed intent change, and where it is recorded

The proposal is written as a `DECISIONS.md` entry marked "PROPOSED, awaiting Justin":
`decisions-proposal.patch`. It inserts before `## Open Questions` (line 875). Its five points follow the
recommended answers to Q1-Q3. No intent document is edited.

---

## 2. System shape

**A, docs-first planning.** All five criteria hold:

- it is markdown-first, with no code;
- the architecture documents are the product;
- `ROADMAP.md`, the `DECISIONS.md` files, the component `TODO.md` files and `AGENTS.md` carry state;
- the loop is repeated human and AI sessions (`AGENTS.md:36-45`);
- the drift is between documents.

**It spans several repositories**, and is assessed as one system:

| Repository | Role, per this repository's own docs |
|---|---|
| `agentic-architecture` (this one) | Level 1 blueprint; reference-only per the banner |
| `../personal-agent` | Current Personal Agent architecture (banner only) |
| `../../scope` | `scopectl` implementation, and now the current Scope/Project model (banner) |
| `../temporal-coordinator` | Temporal coordinator implementation (`components.yaml:31`) |
| `../agentic-architecture-distribution` | Level 2 distribution source (`DECISIONS.md:156-162`) |
| `../agentic-learning` | Theory and deliberation (`AGENTS.md:10`) |
| `scope-moving-stillness`, `scope-professional-presence` | Live scope repositories; the live copy of the profile-editor role |

**Ambiguity noted.** The repository is also effectively retired. No shape in Step 2 covers that, so this
run applies the front door's proportionality rule ("a retired or reference-only repository needs little
or nothing new"), even though that rule sits in Step 5 rather than on route A. See `feedback.md`.

## 3. Planning horizon

- **Settled:** every `DECISIONS.md` entry not marked superseded, up to 2026-07-26; the orchestration v1
  snapshot; temporal coordinator V0 (`SPEC.md`).
- **Active, as documented, but not authorised now:** the scope-manager seam boundary
  (`architecture/PICKUP.md`, itself superseded); the `daily-summary` workflow; `scopectl`; the event-log
  schema; promoting run 001's findings.
- **Exploratory:** modes, the awareness loop, a domain layer above scopes (`DECISIONS.md:879-887`).
- **Authorised now, per the banner:** nothing new.

## 4. Canonical truth map

| Concept | Canonical home | Other places it appears | Problem |
|---|---|---|---|
| Repository status | No `DECISIONS.md` entry. Banners in `README.md:3-5` and `AGENTS.md:3-6` | Body of `AGENTS.md`, `README.md:7-9`, `ROADMAP.md`, both root skills | **Parallel truth that contradicts**: the body still says "current" |
| Vision | `NORTH_STAR.md` | `README.md` | None |
| System model, five layers | `MODEL.md` | `RUNTIME.md` (layers 3-5), `DECISIONS.md:131-142` | Acceptable: `RUNTIME.md` zooms in and links back |
| Decisions | Root `DECISIONS.md` | Component `DECISIONS.md` files restate "inherited constraints"; `RUN.md` files and `AUTH_OPTIONS_ANALYSIS.md` hold decisions too | Restated constraints are stale (B5); decisions outside the log (M3) |
| Open questions | `DECISIONS.md:875-896` | Snapshot Under Review; `AUTH_OPTIONS_ANALYSIS.md`; `components/orchestrator/MODEL.md:80-87`; workflow and skill files | Two declared registries (C2); duplicates (P3) |
| Orchestration anatomy | `architecture/snapshots/2026-07-16-orchestration/ARCH.md`, via `INDEX.md` | `RUNTIME.md:57-84`, `MODEL.md:86` | `RUNTIME.md` restates the anatomy, and wrongly ("unified") |
| Temporal coordinator contract | `components/temporal-coordinator/SPEC.md` (declared) | `SCHEDULING.md` restates the API and non-goals; `MODEL.md:88`; `RUNTIME.md:33-49`; `components.yaml:30`; the sibling repository | **Five restatements, plus a second home across repositories** (C3) |
| Scope model | `components/scope/MODEL.md` and `template/` | `../../scope`, per the banner | **Two homes across repositories**; `README.md:43` still says the design docs live here |
| Role and binding pattern | `components/agent/` | `roles/` (reference copy); `scope-professional-presence` (live copy) | Copy drift, already seen (`runs/002-…/RUN.md:241`) |
| Planned scopes | `SCOPES_PLANNED.md` | Root `scope.yaml` manifest | Acceptable |
| Current work and next step | `ROADMAP.md` (declared first read, `AGENTS.md:38`) | Component `TODO.md` and `PLAN.md` files, `architecture/PICKUP.md`, `RUN.md` "Pickup" sections, `runs/README.md`, the kickoff packet (chat only) | **Six homes, none persistent and honest** |
| Historical material | `archive/`, struck-through `DECISIONS.md` entries | `INTERFACE_REFINEMENT_PLAN.md` in a live folder; `PICKUP.md`, which `INDEX.md:17` still calls current | Superseded material sitting next to live truth |

## 5. Loop map

- **A fresh session starts:** Claude Code loads `CLAUDE.md`, a symlink to `AGENTS.md`, and sees the
  banner. Pi also auto-loads `AGENTS.md` and `CLAUDE.md` (`runs/001-…/RUN.md:74`). `MANIFEST.md:11`
  lists OpenCode as the secondary agent.
- **Read first** (`AGENTS.md:36-45`): `ROADMAP.md`, then `MODEL.md`, `DECISIONS.md`, `components.yaml`
  and the component docs, then `skills/session-kickoff.md`, which builds a current-state packet in the
  conversation only.
- **Active work is tracked in:** `ROADMAP.md` checkboxes, `components/scope/TODO.md` (which has a
  "Doing Now" section), `components/orchestrator/TODO.md` (which has none), and, in practice, "Pickup"
  sections inside `RUN.md` files (April-May) and `architecture/PICKUP.md` (July).
- **Decisions and learnings go to:** `DECISIONS.md` files, `components/scope/LEARNINGS.md`, and in
  practice also `RUN.md` "Findings" and "Resolved decisions".
- **Coherence pause:** `skills/entropy-guard.md` before non-trivial commits, by discipline. There are no
  hooks or CI in the snapshot, and with no `.git`, `core.hooksPath` could not be checked.
- **Handoff:** commit. No pull-request template.
- **The real loop:** the persistent handoff kept moving (`RUN.md` pickup, then `PICKUP.md`, then the
  banner), and the kickoff packet is never written down. Under reference-only status, the expected loop
  is rare edits, most of them by sessions consulting this repository from elsewhere.

## 6. Entropy profile: top risks, ranked by destructive potential

| # | Risk (vector) | Decay | Recovery cost | Evidence | Anchor for the fix |
|---|---|---|---|---|---|
| 1 | **The status and the operating loop point opposite ways** (workflow drift, superseded material near live truth) | Fast: every fresh session follows `AGENTS.md:36-45`, and the mandatory guard asks for roadmap and status updates | High: architecture written here diverges silently from `personal-agent` and `scope`, and takes a reconciliation across repositories | Banner vs `AGENTS.md:8,38`; `skills/session-kickoff.md:78`; `skills/entropy-guard.md:7,79-80` | Proposed `DECISIONS.md` status entry; `ROADMAP.md` status section |
| 2 | **One concept with homes in two repositories** (standalone residue across repos): Scope model, temporal coordinator contract, profile-editor role | Medium: the successors move while this side stays still, so the gap grows unseen | High: each side looks correct on its own | Banner vs `README.md:43` and `components/scope/`; C3; `runs/002-…/RUN.md:241` | The banner's successor list, a pointer per component, and Q3 |
| 3 | **Superseded material next to live truth** | Medium | Medium: an agent revives EventSink or T09 work, or follows a pickup that no longer exists | `architecture/INDEX.md:17` vs `PICKUP.md:3`; `INTERFACE_REFINEMENT_PLAN.md` beside `SPEC.md`; `RUNTIME.md:67,82` despite `PICKUP.md:15`; `archive/…:5-7` | The 2026-07-26 and 2026-07-16 entries |
| 4 | **The planning state is dishonest, and kept in six places** | Low: frozen, but it misleads every reader | Low to medium: a one-time pass | Already-decided backlog at `ROADMAP.md:54,56,58,63`; `DECISIONS.md:896` contradicts `:156-162`; component `PLAN`/`DECISIONS`/`TODO` files list resolved questions; run 001's pickup was never promoted | Dated `DECISIONS.md` entries (B5) |
| 5 | **Registry rules written as prose** (P2, P3) | Slow now | Low | See P2, P3 | Judgment checks in the guard |

## 7. Guard surfaces

**The four groups from front-door Step 4d:**

- **Runs by itself:** none. There is no CI, `.githooks`, `.pre-commit-config.yaml` or `.husky` in the
  snapshot.
- **Exists, but runs only by hand:**
  - `skills/entropy-guard.md`, which `AGENTS.md:72` makes mandatory;
  - `skills/session-kickoff.md`;
  - the runs procedure.
- **Decided, not yet built:**
  - the old guard's "Next maturity step: Prompted" reminder (`skills/entropy-guard.md:118`);
  - `scopectl validate` (`DECISIONS.md` 2026-04-03, in `components/scope/DECISIONS.md:79`);
  - `skills/run-experiment.md` (`runs/README.md:24`);
  - the backlog line "Entropy guard: automated coherence checks on hooks" (`ROADMAP.md:69`).

  Under reference-only status, none of these should be built here.
- **Declared, but missing:** `PICKUP.md:15` says the "hygiene pass is complete", but `RUNTIME.md:67,82`
  shows it is not. The "portfolio map in agentic-learning" is declared at `DECISIONS.md:127` as "not
  yet created".

**What to do with each surface (docs-first Step 7):**

| Surface | Classification |
|---|---|
| `skills/entropy-guard.md` | **Amend in place, substantially.** Its front matter (line 7) holds a current-state snapshot that a guard must not hold. Most of its checks drive active development. Same path, so `AGENTS.md:72` still finds it. Draft: `guard/SKILL.md` |
| `skills/session-kickoff.md` | **Amend:** check status first (`integration.md`) |
| `AGENTS.md`: Session start and line 72 | **Amend** (`integration.md`) |
| `ROADMAP.md` | **Amend:** add the status section (`current-state.patch`) |
| `architecture/INDEX.md` "Current Pickup" | **Amend** (`current-state.patch`) |
| `architecture/PICKUP.md` | **Keep** as historical; it is already labelled |
| `INTERFACE_REFINEMENT_PLAN.md` | **Demote** to `archive/`, if Justin approves the move (B6) |
| Component `TODO.md` and `PLAN.md` files, run pickups | **Demote to historical.** The `ROADMAP.md` status section covers them, so they need no edits |
| `DECISIONS.md` | **Keep**, and add the proposal |

## 8. Recommendations

1. Justin answers Q1-Q3. Record the answers in `DECISIONS.md`, replacing the proposal.
2. Apply the current-state section, so that a fresh session meets the status before the roadmap.
3. Replace the guard with the reference-only version, and amend session start and kickoff to match.
4. Run the one-time correction pass (B5) only if Q2 is answered "stays".
5. Build nothing more: no hook and no CI for a frozen record. Add lychee only if commits here continue.
6. Do not move open questions or roadmap items into this repository. They belong to the successors.

## 9. Bootstrap actions (one-time; each checked against the snapshot on 2026-10-04)

- **B1.** Apply `decisions-proposal.patch`. Confirmed with `git apply --check` on a clean copy.
- **B2.** Apply `current-state.patch`, which edits `ROADMAP.md` (top) and `architecture/INDEX.md:15-17`.
  It applies cleanly, and every in-repository link still resolves.
- **B3.** Replace the contents of `skills/entropy-guard.md` with `guard/SKILL.md`.
- **B4.** Make the operator-doc edits in `integration.md` ("Now").
- **B5.** *Gated on Q2 being "stays".* Correct each stale description from the decision cited:

  | File and line | What it says now | Correct it from |
  |---|---|---|
  | `RUNTIME.md:67,82` | "unified" gateway | Snapshot 2026-07-16; superseded note at `DECISIONS.md:575` |
  | `ROADMAP.md:54,58,63` | Already-decided backlog items | `DECISIONS.md` 2026-04-27 (`:551-559`, `:622-650`) |
  | `ROADMAP.md:56` | Old scheduling line | `DECISIONS.md` 2026-07-26 |
  | `DECISIONS.md:896` | "Layer 2 distribution form" listed as deferred | `DECISIONS.md:156-162` (2026-05-14) |
  | `SCOPES_PLANNED.md:30,90` | Resolved questions listed as open | 2026-04-27 entries (`:639-650`, `:666-670`, `:688-692`) |
  | `components/orchestrator/MODEL.md:84-87` | Points at a question not in the registry | 2026-04-27 Agent Card entry (`:666-670`) |
  | `components/orchestrator/DECISIONS.md:13` | "(mechanism TBD)" | `DECISIONS.md:551-559` |
  | `components/orchestrator/PLAN.md:28-29` | "format TBD", "whatever mechanism is chosen" | `DECISIONS.md:612-618`, `:551-559` |
  | `components/agent/DECISIONS.md:12` | Communication and runtime setup "still open" | `DECISIONS.md:551-559`, `:622-635` |
  | `components/scope/skills/scope-design.md:155` | "Skill injection is an open question" | `DECISIONS.md:674-678` |

  `components.yaml:35` (`implementation: ../scope`) and `:49-82` (`repo: ../library` and similar)
  disagree with `README.md:43-50` (`../../scope`, `../../library`) and with `DECISIONS.md:176`, which
  says tools sit flat in `~/pro/`. Check this on disk before changing it; it could not be checked here.
- **B6.** *Gated on Justin's approval, because it moves a file.* Move `INTERFACE_REFINEMENT_PLAN.md`
  into `archive/` and update its link at `DECISIONS.md:830`.

Track B1-B6 in the `ROADMAP.md` status section's "Next actions", never in the guard.

## 10. The current-state update

`current-state.patch` adds a "Status — read this first" section to the top of `ROADMAP.md` (the file
`AGENTS.md:38` names as the first read) and corrects `architecture/INDEX.md`'s "Current Pickup". The
section covers:

- stage;
- where current work lives;
- the documents to trust first;
- settled decisions;
- active fronts (none);
- nearby superseded material;
- the three questions;
- next actions.

It carries the date it was last checked and says what makes it stale. *Provisional (Q1-Q3).*

## 11. What was handed to the generator

- **Inputs:** sections 1 (intent), 4 (truth map), 5 (loop map), 7 (surfaces), and the checks below.
- **Docs-first checks, written against this repository's files:**
  - canonical ownership, now meaning "which repository owns it";
  - one owner, not two copies;
  - supersession, with known cases;
  - cross-reference integrity;
  - decisions captured only in `DECISIONS.md`;
  - state honesty of the `ROADMAP.md` status section;
  - workflow alignment of session start and kickoff;
  - plus one check for this repository: is this change permitted under the status?
- **Ready for tooling:** the in-repository link check (lychee, offline) and the banner-presence grep.
  Both are stable now that the repository is frozen. Everything else stays a judgment check.

**Generator report** (plan mode, because the target is read-only):

- **Structures found:** sections 4 and 5.
- **Guard:** updates `skills/entropy-guard.md` in place, keeping the name `entropy-guard` because
  `AGENTS.md:72,103`, `README.md:29` and `skills/README.md:8` point to it. Draft: `guard/SKILL.md`.
- **Files build mode would change:**
  - `skills/entropy-guard.md`;
  - `ROADMAP.md`;
  - `architecture/INDEX.md`;
  - `DECISIONS.md`;
  - `AGENTS.md`;
  - `skills/session-kickoff.md`;
  - `skills/README.md`.
- **Validation, run on a scratch git copy of the snapshot (since deleted):**
  - `git diff --check` was clean on both patches;
  - `git apply --check` passed on a clean copy;
  - the guard's four "what changed" commands, the banner grep and the changed-files listing ran during a
    simulated session with one commit, one uncommitted edit and one untracked file;
  - the first changed-files command missed the committed file, and was fixed and re-run;
  - the fallback on a branch with no upstream behaved as written.
- **Not run:** lychee is not installed.
- **Open questions the guard leaves visible:** Q1-Q3, through its "provisional" metadata and the
  `ROADMAP.md` status section.
- **Handoff:** `integration.md`.

## 12. Recommended next step

Refine the existing guard through the generator rather than writing a new one, and record the status
proposal. Both are done as drafts here. The smallest useful action for Justin is to answer Q1. Q2 and Q3
follow from it.

## 13. Questions for the steward

Three questions, in `questions.md`:

- **Q1:** is reference-only authorised, and what may still change here?
- **Q2:** does the repository stay where it is, or move to `~/pro-archive/`?
- **Q3:** who owns the temporal coordinator contract?

## 14. Uncertainties

- **No git history.** The enacted reading rests on dated content only. When the banner was added cannot
  be known from here.
- **Decision authorship.** No `DECISIONS.md` entry has a named author. Treating the log as Justin's is
  an inference.
- **Sibling repositories were out of bounds.** It is not verified that `personal-agent` and `scope` hold
  the current models, that `temporal-coordinator` has its own specification, or that the
  `components.yaml` paths resolve.
- **Hooks.** Whether any are enabled locally (`core.hooksPath`) could not be checked.
- **Commit frequency** under reference-only status is unknown, so the guard's real trigger rate is
  unknown.
- **lychee** is not installed; its command in the guard has not been run.

## 15. Upstream feedback check

**Yes, there is feedback.** The front door has no route for a retired or reference-only repository on
route A. The intent pass also has no place for an undated, unattributed directive, which here was the most
important intent statement in the repository. Both are written up in `feedback.md`. No issue was filed:
this run was not inside the entropy-guard repository, and the web was off-limits.
