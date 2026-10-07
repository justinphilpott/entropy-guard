# Entropy assessment: `agentic-architecture` (read-only snapshot)

- **Date:** 2026-10-07.
- **Skills used:** `entropy-assessment` v0.9.0, its `intent-pass.md` and `intent-change-rule.md` (v2), then
  `docs-first-planning-assessment` v0.3.0 (route A). The generator was read only for its list of inputs.
- **Mode:** build, but the target is a read-only snapshot. Every change is therefore delivered as a patch in
  `patches/`, and none is applied. No steward was available. The questions are in `questions.md`, each with the answer
  I recommend.
- **Evidence limits:** the snapshot has no `.git`, so there is no commit history, no record of the real loop, and no
  way to tell whether any hook is enabled. Sibling repositories the target points to were outside what this run may
  read (section 14).

---

## 1. Intent

### Steward

No document names the steward of this repository (finding **F4**). The evidence points to Justin:
- `steward: "justin"` and an admin member `justin` in `components/orchestrator/scope/scope.yaml:6,23,34,37`;
- `SCOPES_PLANNED.md:12`;
- the `git@github.com:justinphilpott/...` remotes;
- "Justin's ChatGPT Plus subscription" (`runs/001-moving-stillness-status/RUN.md:41`).

The banner in `AGENTS.md:6` asks for "explicit authorization" but does not say whose. That attribution is an
inference, so it is asked as **Q3**.

### Authorised intent, with sources

| Part | Source | Kind | Authority evidence |
|---|---|---|---|
| The repository is reference-only. Current Personal Agent architecture lives in `../personal-agent`, and the Scope/Project model in `../../scope`. "Do not treat decisions in this repository as current authority." | `README.md:3-5` | directive (status banner) | neither date nor author |
| "Do not extend or reinterpret this blueprint as current design without explicit authorization." | `AGENTS.md:3-6` | directive (status banner) | neither |
| Purpose: a personal agentic system, map rather than territory, with its design values | `NORTH_STAR.md` | description of intent | neither; now historical, under the banner |
| What was settled, and when | `DECISIONS.md` (latest entry 2026-07-26) and `components/*/DECISIONS.md` | decisions | dated, not attributed |
| Standing working rules: settled positions, no stale docs, one canonical owner | `AGENTS.md:12-34, 60-72` | directives | neither |

**Precedence used.** No statement is attributed to the steward. I therefore followed the system's own precedence:
- directives over descriptions;
- "the newer settled state wins" (`AGENTS.md:70`);
- the banner says "no longer", so it postdates the descriptions it overrides.

One complication: the repository's own conflict rule resolves by "current snapshots/index and dated decisions"
(`AGENTS.md:25`, `DECISIONS.md:869`). Under that rule the undated banner ranks lowest (**F1**). The settled patch
copies the banner into `DECISIONS.md` without dating or interpreting it.

### Gaps, by condition

- **Missing:**
  - **F1:** the demotion has no entry in the decision log.
  - **F4:** no steward is named.
- **Stale description:** **F2**. `AGENTS.md:8` and `README.md:9` still describe the repository as current. They
  are corrected from the banner, and only in what the banner plainly covers. Whether "Sol" is still the current
  codename (`README.md:7,9`) is not covered, so it is left as it is.
- **Conflict:**
  - **F3:** the banner against the active-repo rituals in `AGENTS.md:36-45` and `:72`. Both are prescriptions. The
    precedence above favours the banner, but changing a standing instruction is a new decision, so this is **Q2**.
  - **F11:** two homes for open questions. Not asked, because it does not change what gets built in a
    reference-only repository.
- **Ambiguous:**
  - **F5:** does the banner cover the temporal coordinator contract (`SPEC.md`)? This is **Q1**.
  - **F6b:** who "clarifies intent" in `AGENTS.md:25` and `DECISIONS.md:869`?
  - **F19:** "later tranches" against "not specified".
- **Unauthorised drift:** none was found that the work itself caused. **F15** (the runs used a subscription, where
  the analysis's working decision said API keys) was explicitly scoped as "not a long-term commitment"
  (`RUN.md 001:41`). It is recorded, not reversed.
- **Prose control:** **F7**, the commit-time guard instruction.

### The existing guard's repair instructions, read against the intent-change rule (v2)

- **Intent flag.** `skills/entropy-guard.md:79` says "If a component's status has changed, update components.yaml".
  This lets observed work change a status that `AGENTS.md:71` ("only elevate status when explicitly instructed") and
  `DECISIONS.md:39-41` reserve for explicit promotion (**F6a**).
- **Intent flag (instruction file).** `AGENTS.md:25` says "beyond that, clarify intent and update the docs", and
  `DECISIONS.md:869` says "clarify intent and update the records". Neither says who clarifies, so a session can
  clarify intent itself and rewrite the records (**F6b**).
- **Ownership flag.** `skills/entropy-guard.md:38-41` keeps the scope manager, the orchestrator, manifest/interior
  and the workflow primitive "consistent across" three or four files each, and `AGENTS.md:51` says "check what other
  files reference the same concepts and update them too". After `DECISIONS.md:855-861`, the snapshot owns
  orchestration anatomy. The repair should therefore reduce the restatements to links, not keep them in step
  (**F6c**).
- Not flagged: `skills/entropy-guard.md:36` (`RUNTIME.md` is a declared zoom of `MODEL.md`'s layers 3-5, which is a
  projection) and `:98` (recording issues in the open-questions registry).

### Questions for the steward

There are three, in `questions.md`, each with a recommended answer:
- **Q1:** does the banner cover the TC `SPEC.md`? Recommended: yes.
- **Q2:** should the session-start procedure and the commit-time guard be demoted? Recommended: yes, keeping
  corrections allowed.
- **Q3:** who set the banner, and when? Recommended: Justin, with the date of the hand-over.

### Proposed changes, and where they are recorded

- `patches/settled.patch`: corrections, including the `DECISIONS.md` entry that records the banner.
- `patches/provisional-q1.patch` and `patches/provisional-q2.patch`: hold until the steward answers.

No intent document is changed to match the work.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: reference-only.**
  - Evidence: the banners at `README.md:3-5` and `AGENTS.md:3-6`.
  - Supporting: `runs/README.md:7-9` says the experiment line is paused; nothing is dated after 2026-07-26.
  - Contrary: only descriptions written before the demotion (**F2**).
- **Shape: A, docs-first planning.**
  - Markdown is the product.
  - State lives in `DECISIONS.md`, `ROADMAP.md`, `components/*/TODO.md` and `AGENTS.md`.
  - The YAML present is templates and examples. There is no code, no tests and no CI.
- **Repositories: the system spans several.**
  - Design is here.
  - Implementations are in `../temporal-coordinator` and `../../scope` (`components.yaml:29,35`; README).
  - Current authority, per the banner, is in `../personal-agent` and `../../scope`.
  - Shape B (mixed) fits the whole system and would be the riskier route. Its member repositories could not be read
    in this run, so route A was taken for the target. The cross-repo checks that B would run are listed as not
    covered (**F20**, section 14).

---

## 3. Findings

Each finding has an id, its evidence and its source. Other sections refer to them by id.

- **F1, lost decision.** Reference-only status is recorded only in two undated, unattributed banners (`README.md:3-5`,
  `AGENTS.md:3-6`). It is absent from `DECISIONS.md`, `ROADMAP.md`, `components.yaml`, `skills/session-kickoff.md`
  and `skills/entropy-guard.md`. The repository's own conflict rule (`AGENTS.md:25`, `DECISIONS.md:869`) ranks dated
  decisions first, so it cannot see the banner.
- **F2, stale description.** The orientation text contradicts the banner directly above it:
  - `AGENTS.md:8`: "This repo holds the current architecture state";
  - `README.md:9`: "Bleeding-edge design source for the current named version … under active review".
  - Historical frames that say the same are `MODEL.md:31` and `DECISIONS.md:137`. They are not corrected, because
    they are part of the reference record.
- **F3, conflict and workflow drift.** The active-repo rituals are still in force under the banner:
  - the Session start procedure (`AGENTS.md:36-45`) and `skills/session-kickoff.md` build a packet from
    `ROADMAP.md` and "choose work";
  - `AGENTS.md:72` says to run `skills/entropy-guard.md` before committing;
  - `ROADMAP.md` "Working towards next" (`:12-27`), `components/*/TODO.md` "Next Up" and `runs/README.md:20-29`
    "Pickup Later" list next work.
  - Concrete case: asked "what's next?", a fresh session would propose `ROADMAP.md:25`, "start by fleshing out …
    daily-summary/WORKFLOW.md". That extends a blueprint the banner says not to extend. → **Q2**.
- **F4, missing.** No steward is named for the repository. The inference is Justin (section 1). → **Q3**.
- **F5, ambiguous scope of the banner.** `README.md:5` says "Do not treat decisions in this repository as current
  authority". Five places still call the temporal coordinator contract here authoritative:
  - `components/temporal-coordinator/SPEC.md:3` (its status line);
  - `SCHEDULING.md:20` ("The authoritative event and data contract");
  - `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md:6` ("Current authority is SPEC.md and … the
    sibling implementation repository", which gives the contract two homes across repositories);
  - `architecture/snapshots/2026-07-16-orchestration/ARCH.md:41`;
  - `DECISIONS.md:847`.
  - → **Q1**.
- **F6, the existing guard (`skills/entropy-guard.md`).**
  - (a) Intent flag on `:79`.
  - (b) Ambiguity over who clarifies intent (`AGENTS.md:14,25`; `DECISIONS.md:869`).
  - (c) Ownership flag on `:38-41` and `AGENTS.md:51`.
  - (d) Staleness:
    - `generated` 2026-04-02 and `last_evaluated` 2026-04-27, both before the snapshot model (2026-07-16), the
      temporal coordinator work (2026-07) and the banner;
    - its `system_snapshot` says "Open questions reduced from 22 to 11", but the registry now holds 7 open and 6
      deferred (`DECISIONS.md:879-896`);
    - the checklist never mentions `architecture/`, `SCHEDULING.md` or `components/temporal-coordinator/`.
- **F7, prose control.** `AGENTS.md:72` reads as a standing rule, but nothing runs it:
  - the guard calls itself "External (discipline-based)" (`skills/entropy-guard.md:114`);
  - no hook folder is tracked;
  - whether a hook is enabled is unknown, because the snapshot has no `.git`.
  - Enforcement would sit in a pre-commit reminder (`:118`). Nothing cites the rule as a control. The finding is moot
    if **Q2** demotes the guard.
- **F8, state dishonesty.** `architecture/INDEX.md:15-17` says "Current Pickup: Next architecture work starts at
  PICKUP.md". `architecture/PICKUP.md:3` says "superseded historical pickup point (2026-07-26)", and `:8-10` says
  "must not be used to add delivery, adapter, worker, or tick capabilities".
- **F9, superseded wording, and a seam list that is incomplete.**
  - `RUNTIME.md:67` says "Runtime gateway (unified for v0)" and `:82` says "unified sandbox gateway". Both contradict
    `DECISIONS.md:575` (2026-07-16: "the monolithic gateway decomposes into independent seams") and `ARCH.md:22`.
  - `RUNTIME.md:27` lists "lifecycle ops, LLM proxy, task mgmt, event log, comms". The snapshot names a different
    set: ingress, capability resolution, executor, task mgmt, secret broker, LLM proxy, provisioning, event log
    (`ARCH.md:22`, under review at `:74`).
  - `PICKUP.md:15` claims the "unified-gateway wording has been cleaned up". It has not been.
  - Prose that restates anatomy is against `DECISIONS.md:857`.
- **F10, stale open-question pointers.** These point at questions that dated decisions resolved, or gave a direction
  to:
  - `SCOPES_PLANNED.md:30` (answered by `DECISIONS.md:666`);
  - `SCOPES_PLANNED.md:90` (answered by `:275`, `:639-650`, `:688-692`);
  - `RUNTIME.md:126` (`:696`);
  - `components/orchestrator/PLAN.md:28` (`:612-618`) and `:29` (`:551-559`);
  - `components/orchestrator/DECISIONS.md:13` (`:551`);
  - `components/agent/DECISIONS.md:12` (`:551-559`, `:622-635`);
  - `components/scope/skills/scope-design.md:155` (`:674-678`);
  - `components/orchestrator/MODEL.md:84-86`: cross-scope exposure is not in the registry (`:666`).
- **F11, conflict over the open-question registry.**
  - `AGENTS.md:28` and `DECISIONS.md:305-309` say open questions live only in `DECISIONS.md`.
  - `architecture/SCHEMA.md:78` and `ARCH.md:72` say the snapshot's Under Review is the "source of truth for the
    domain".
  - `DECISIONS.md:855-861` does not settle which wins.
  - Other copies of question text exist in `AUTH_OPTIONS_ANALYSIS.md:246-251`, `scope-design.md:159-164` and
    `role-design.md:200-204`. Some of these are scope-level, which `DECISIONS.md:309` allows.
- **F12, parallel truth in the decision logs.** The copies agree today.
  - The root-general naming decision is recorded in full in `DECISIONS.md:489-500` and again in
    `components/orchestrator/DECISIONS.md:18-29`, against that file's own rule at `:5`.
  - The `remotes`/`checkouts` decision is recorded in full in `DECISIONS.md:758-780` and again in
    `components/scope/DECISIONS.md:17-22`.
- **F13, catalog paths.** `components.yaml` gives `../scope` (`:35`) and `../library`, `../seed`, `../entropy-guard`,
  `../entropy-immune-system`, `../git-sync`, `../flowbook` and `../flowvoice`. These contradict:
  - `DECISIONS.md:176-178`: tools flat in `~/pro/`, and the scope implementation at `~/pro/scope/`;
  - `README.md:43-50` (`../../X`);
  - `SCOPES_PLANNED.md:71`.
  - The disk was not checked. `../temporal-coordinator` is consistent with `INTERFACE_REFINEMENT_PLAN.md:7` but was
    not verified.
- **F14, superseded description.** `PI_AGENT_OVERVIEW.md:99` says "External due-event scheduler invoking Pi" (and
  `:94` says "due-event triggered"). `DECISIONS.md:836-851` (V0 enqueues only, has no consumer, and specifies no
  delivery work) supersedes this.
- **F15, observation against a description.** `AUTH_OPTIONS_ANALYSIS.md:176-177` says "Pi is not, by itself, the auth
  answer … a separate provider/auth layer still needs to exist". The runs contradict it: Pi 0.70.5's own `/login`
  Codex provider worked with no separate auth layer (`runs/002…/RUN.md:33,140,218`; `runs/003…/RUN.md:68`;
  `runs/001…/RUN.md:41`).
  - The analysis's "Current Working Decision" (`:10-16`, direct API key) is a prescription, and observation does not
    change it.
- **F16, docs against docs.** `SCOPES_PLANNED.md:26` says the workflows are "commitments tracked here" until
  instantiation. Their drafts already exist under `components/orchestrator/scope/workflows/`
  (`components/orchestrator/DECISIONS.md:45-49`).
- **F17, navigation gaps.**
  - `README.md:16-35` omits `components/temporal-coordinator/`.
  - The key-files list in `AGENTS.md:92-115` omits it as well, and also omits `architecture/`, `SCHEDULING.md`,
    `RUNTIME.md` and `runs/`.
- **F18, lost learnings.** Run findings were left awaiting promotion:
  - `runs/001…/RUN.md:116-120` asks for a decision that Pi's event types are the v0 event-log schema. It was never
    recorded, and `ROADMAP.md:26` is still unchecked;
  - `components/orchestrator/TODO.md:16`;
  - `runs/002…/RUN.md:246-248`.
  - Now that the repository is demoted, they have no home here. Whether they reached `../personal-agent` was not
    checked.
- **F19, ambiguous wording.** `MODEL.md:88` says "Later delivery and recurrence tranches are staged separately", and
  `RUNTIME.md:37-38` says the same. `DECISIONS.md:849-851` and `SPEC.md:139` say nothing deferred "is specified".
  - The readings diverge. Under the first, planned tranches exist. Under the second, nothing is planned.
  - Concrete case: a session cites `MODEL.md:88` to justify adding a delivery worker.
  - This touches **Q1**, so it is not patched.
- **F20, cross-repository claims not checkable here.** Three claims depend on code or documents in other
  repositories:
  - `SPEC.md:23` and `SCHEDULING.md:47`: "`queue.ts` is the only source module that imports pg-boss";
  - `AGENTS.md:33` and `RUNTIME.md:155`: "Only platform services read/write Postgres directly. Currently: scope
    manager and temporal coordinator";
  - the sibling plan named at `INTERFACE_REFINEMENT_PLAN.md:7`.
  - All of them are **incomplete as checked**. No code was searched, because the code is outside this run.
- **F21, superseded material nearby.** Most of it is marked:
  - `PICKUP.md`, `INTERFACE_REFINEMENT_PLAN.md` and `archive/`;
  - the struck-through entries in `DECISIONS.md`;
  - `ORCHESTRATION.md`, which is a pointer stub.
  - The unmarked exception is **F8**.
  - `archive/scheduling-cronicle-investigation.md:5-7` says the "external scheduler … behind the adapter boundary"
    conclusion is retained in `SCHEDULING.md`. The current `SCHEDULING.md` no longer states it. This is a historical
    record, so it is left unchanged.

---

## 4. Truth map

| Concept | Canonical home | Also stated in (role) |
|---|---|---|
| Repository status | `README.md:3-5` and `AGENTS.md:3-6` banners (one directive in two copies) | `DECISIONS.md` entry after the settled patch (versioned copy); `ROADMAP.md` state block (summary) |
| Purpose and values | `NORTH_STAR.md` | `README.md`, `MODEL.md` (summaries) |
| System model, five layers | `MODEL.md` (a cross-cutting frame kept in prose, `DECISIONS.md:857`) | `RUNTIME.md` (projection of layers 3-5) |
| Orchestration anatomy | `architecture/INDEX.md` → `snapshots/2026-07-16-orchestration/ARCH.md` | `RUNTIME.md` scope-manager section, `MODEL.md:78,86`, `components.yaml` roles: restatements (**F9**) |
| Settled decisions | `DECISIONS.md`; component-local ones in `components/*/DECISIONS.md` | two full duplicates (**F12**) |
| Open questions | `DECISIONS.md#open-questions` (`AGENTS.md:28`) | snapshot Under Review claims the same role (**F11**) |
| Version and next work (state) | `ROADMAP.md` | `components/*/TODO.md`, `components/*/PLAN.md`, `architecture/PICKUP.md` (superseded), `runs/README.md` |
| Component status | `components.yaml` | `MODEL.md` primitives (summary) |
| Tools and interfaces | `MANIFEST.md` | — |
| Scope schema and template | `components/scope/template/` and `components/scope/DECISIONS.md` | `scope-design.md` (product artifact) |
| Role and binding schema | `components/agent/template/` and `components/agent/DECISIONS.md` | `role-design.md`, `roles/` (reference examples) |
| Root scope design | `components/orchestrator/scope/` | `SCOPES_PLANNED.md` (inventory summary) |
| Planned scope inventory | `SCOPES_PLANNED.md` | `DECISIONS.md:201-203` (dated history) |
| TC V0 contract | `components/temporal-coordinator/SPEC.md`, its authority now open (**F5**) | `SCHEDULING.md`, `RUNTIME.md`, `MODEL.md:88`, `ARCH.md` (summaries); sibling-repository plan (unverified) |
| Run evidence | `runs/*/RUN.md` (stable records) | `runs/README.md` (summary) |
| Repository workflow | `AGENTS.md` (+ `CLAUDE.md` symlink) | `skills/session-kickoff.md`, `skills/entropy-guard.md` (product artifacts) |

**Roles:**
- **canonical:** `NORTH_STAR`, `MODEL`, `DECISIONS`, `architecture/INDEX` and the snapshot, `components.yaml`,
  `SCOPES_PLANNED`, `MANIFEST`, `SPEC.md` (open);
- **current state:** `ROADMAP.md`, `components/*/TODO.md` and `PLAN.md`;
- **local elaboration:** `components/*/MODEL.md`, `DECISIONS.md` and `LEARNINGS.md`;
- **product artifact:** the templates, `components/*/skills/*`, `skills/*` and `roles/*`;
- **historical:** `archive/`, `PICKUP.md`, `INTERFACE_REFINEMENT_PLAN.md`, `ORCHESTRATION.md`, `runs/*`,
  `AUTH_OPTIONS_ANALYSIS.md` and `PI_AGENT_OVERVIEW.md` (research notes);
- **everything above** is now reference material under the banner.

## 5. Loop map

- **Documented loop:**
  1. `AGENTS.md` loads automatically: `CLAUDE.md` is a symlink to it, and Pi loads both (`runs/001…/RUN.md:74`).
  2. Session start reads `ROADMAP` → `MODEL` → `DECISIONS` → `components.yaml` → the component docs.
  3. `skills/session-kickoff.md` builds a packet in the conversation and chooses work.
  4. Before committing, run `skills/entropy-guard.md` by hand.
  5. Commit. Decisions go to `DECISIONS.md`, learnings to `components/scope/LEARNINGS.md` (the only `LEARNINGS`
     file), and tasks to the component `TODO`s.
  - The handoffs are `architecture/INDEX.md` → `PICKUP.md`, `runs/README.md` "Pickup Later", and each `RUN.md`
    "Pickup".
- **Real loop:** only partly visible.
  - The commit history is missing.
  - `RUN.md 001:68` shows decisions and docs being updated within commits.
  - `PICKUP.md:15` shows a cleanup pass that claimed completion but missed `RUNTIME.md` (**F9**).
  - The guard was not re-evaluated through the July changes (**F6d**).
  - The last dated activity is 2026-07-26. The banner then demoted the repository.
  - The live loop is now presumably in `../personal-agent` and `../../scope`, which were not checked.
- **What a fresh session does today:** it loads the banner, then follows Session start into an active-design ritual
  (**F3**).

## 6. Ranked risks

Ranked by decay rate times recovery cost.

1. **Workflow drift at the front door** (**F1**, **F2**, **F3**, **F6d**).
   - Decay is fast: every session loads `AGENTS.md`.
   - Recovery cost is high: design work lands in a demoted repository and diverges from the current authority.
   - Symptoms: the banner sits above unchanged active rituals, and the state file has no reference-only notice.
   - Anchor: the banner, recorded in `DECISIONS.md`.
   - Fix: settled S-1 to S-4; provisional Q2.
2. **Unclear authority over the TC contract across repositories** (**F5**, **F19**, **F20**).
   - Decay depends on TC activity, which is unknown.
   - Recovery cost is high: a contract can diverge across a repository seam.
   - Symptoms: four documents here say "authoritative", and the contract has two homes.
   - Anchor: the steward's answer to **Q1**, recorded in `DECISIONS.md`.
3. **Superseded material presented as current** (**F8**, **F9**, **F10**, **F14**, **F16**).
   - Decay is slow now.
   - Recovery cost is medium: a reader builds a wrong model, such as the "unified gateway" or resolved questions
     still listed as open.
   - Anchor: the dated `DECISIONS.md` entries and the snapshot.
   - Fix: settled patch.
4. **Lost decisions and learnings** (**F1**, **F18**).
   - Decay is medium.
   - Recovery cost is high once the context of the runs is gone.
   - Anchor: the decision log, here or at the current home.
5. **Parallel truth** (**F11**, **F12**, **F13**).
   - Decay is slow because there are no edits.
   - Recovery cost is low to medium.
   - Recommendation only, beyond **F13**'s paths.

## 7. Recommendations

- **Mark historical (settled):**
  - `ROADMAP.md` gets the state block;
  - `components.yaml` gets a header;
  - `architecture/INDEX.md` "Pickup" is corrected.
  - Optional, same evidence: a one-line "historical, not a current plan" header on `components/*/TODO.md` and
    `PLAN.md`. This is not in the patch. The `ROADMAP` block already names them as misleading.
- **Demote (provisional, Q2):**
  - `skills/entropy-guard.md` and `skills/session-kickoff.md`;
  - Session start in `AGENTS.md:36-45` and the guard line at `:72`;
  - replace them with a reference-only rule: corrections only, each citing the settling `DECISIONS.md` entry.
- **Reference copy (provisional, Q1):** the status line of `SPEC.md`, plus the two documents that call it
  authoritative.
- **Consolidate (recommendation only):**
  - reduce the component copies in **F12** to links;
  - reduce `RUNTIME.md`'s scope-manager anatomy to a link to the snapshot (`DECISIONS.md:857`);
  - if the repository is ever reactivated, settle **F11**.
  - None of these is patched: the repository is reference-only, the copies agree, and no reader is misled today.
- **Keep:**
  - the banners, `DECISIONS.md`, the snapshots, the templates, `roles/`;
  - `runs/` as records;
  - the archive and the superseded plans, which are already marked.
- **Outside this repository (not checked):** whether the **F18** learnings and the **F5** contract have a live owner
  in `../personal-agent` or `../temporal-coordinator`.

## 8. One-time cleanup

Each item was verified against the current file: every old string matched exactly once, and the patch applies
cleanly to the snapshot.

| Item | File | Finding | Patch |
|---|---|---|---|
| Orientation line contradicts the banner | `AGENTS.md:8` | F2 | settled S-1 |
| Orientation line contradicts the status | `README.md:9` | F2 | settled S-2 |
| Record the banner in the decision log (undated, uninterpreted) | `DECISIONS.md` before "Open Questions" | F1 | settled S-3 |
| State block | `ROADMAP.md` top | F3 | settled S-4 |
| Pickup marked historical | `architecture/INDEX.md:15-17` | F8 | settled S-5 |
| "Unified" wording; seam list reduced to a pointer or marked as under review | `RUNTIME.md:27,67,82` | F9 | settled S-6 |
| Stale open-question pointers (9) | see F10 | F10 | settled S-7 |
| Workflow drafts location | `SCOPES_PLANNED.md:26` | F16 | settled S-8 |
| Catalog header and 8 paths | `components.yaml` | F13, F3 | settled S-9 |
| Superseded scheduling row | `PI_AGENT_OVERVIEW.md:99` | F14 | settled S-10 |
| Run observation beside the Pi auth claim | `AUTH_OPTIONS_ANALYSIS.md:177` | F15 | settled S-11 |
| Navigation gaps | `README.md`, `AGENTS.md` key files | F17 | not patched (low; the Q2 patch touches the same lists, so do it after Q2) |
| `PI_AGENT_OVERVIEW.md:94` "due-event triggered" | — | F14 | not patched: "Briefing agent" is undefined elsewhere, and the row would need a decision on what it is |

## 9. State-file update

`ROADMAP.md` is the state file the loop reads first (Session start step 1). The settled patch adds a block at its
top. The roadmap content stays as the record. The block holds:
- **The current stage:** reference-only, with its source.
- **What to trust first:** the banners, `DECISIONS.md` and `architecture/INDEX.md`.
- **Open items:** **Q1** to **Q3**, phrased as open.
- **Misleading material nearby:** marked "not exhaustive".
- **The one next action.**
- **When it goes stale, and who refreshes it:** whoever records a steward answer.

**Claims checked:**
- "Checked on 2026-10-07 against a snapshot".
- "The latest dated entry is 2026-07-26": verified by a search for dates across all `.md` and `.yaml` files. The only
  later date, `2026-08-01`, is an example `run_at` value at `SPEC.md:66`.
- The banners' pointers to `../personal-agent` and `../../scope` are stated as "not checked".
- The other mentions in `ROADMAP.md` were checked: line 3 "Current named version: Sol 0.1" is left alone, because the
  banner does not settle it.

## 10. Patches

**Files:**
- `patches/settled.patch`: 21 hunks in 15 files.
- `patches/provisional-q1.patch`: 3 hunks.
- `patches/provisional-q2.patch`: 8 hunks.

**Verified:**
- `git apply` succeeds on a copy of the snapshot.
- Q1 and Q2 each apply on top of settled, and they are independent of each other.
- After all three, there are no broken internal links (0 missing).
- `git diff --check` reports no whitespace errors.

**Settled hunks, with the finding each answers and the evidence that settles it:**
- **S-1, S-2:** F2, settled by the banners.
- **S-3:** F1, the banner copied verbatim. It states that its date and author are not recorded, and that it does not
  settle what the banner covers.
- **S-4:** F3, docs-first Step 5.
- **S-5:** F8, `PICKUP.md:3`.
- **S-6:** F9, `DECISIONS.md:575,857` and `ARCH.md:22,74`.
- **S-7:** F10, the `DECISIONS.md` lines cited in F10.
- **S-8:** F16, `components/orchestrator/DECISIONS.md:45-49`.
- **S-9:** F13, `DECISIONS.md:176-178` and `README.md:43-50`, plus the banner for the header.
- **S-10:** F14, `DECISIONS.md:836-851`.
- **S-11:** F15, the run records. It leaves the working decision untouched.

**Provisional hunks:**
- **Q1:** the status line of `SPEC.md` (with a visible placeholder for the live owner), `SCHEDULING.md:20` and
  `INTERFACE_REFINEMENT_PLAN.md:6-7`.
- **Q2:** Session start and the guard line in `AGENTS.md`, its key-file lines, `README.md:29`, `skills/README.md`,
  and demotion banners on `skills/entropy-guard.md` and `skills/session-kickoff.md`.

**Patch check: every hunk was read against the findings and the questions.**
- **Q1 quotes:** `README.md:5`, the status line of `SPEC.md`, `SCHEDULING.md:20`,
  `INTERFACE_REFINEMENT_PLAN.md:6` and `ARCH.md:41`. No settled hunk edits these lines.
- **Q2 quotes:** `AGENTS.md:36-45` and `:72`, `skills/entropy-guard.md:116`, and the text of `ROADMAP.md:25`. None
  is edited by a settled hunk; S-4 only inserts above that text.
- **Q3 quotes:** the two banners and `scope.yaml:6`. These are not edited.
- **No settled hunk states an answer to an open question:**
  - S-3 and S-4 name Q1 to Q3 as open;
  - S-9's header concerns catalog statuses, not the authority of the TC contract;
  - S-10 states the 2026-07-26 record, not the contract's current standing.
- **List findings:**
  - F9 says the `RUNTIME.md` seam list is incomplete. S-6 removes it at `:27`, and marks it as under review or "not
    a complete seam list" at `:67` and `:82`.
  - No hunk restates an F20 "only" list.
  - S-4's list of misleading material is marked "not exhaustive".
- **F13:** the S-9 paths follow the recorded decision. They were not observed on disk, and the finding says so.

## 11. Guard inputs (docs-first Step 7)

**Existing guard surfaces:**

| Surface | Verdict | Reason |
|---|---|---|
| `README.md` and `AGENTS.md` banners | keep | the operative guard surface now |
| `skills/entropy-guard.md` and `AGENTS.md:72` | demote (provisional, Q2) | checks active-design coherence; stale (F6d); intent and ownership flags (F6a, F6c); prose control (F7) |
| `skills/session-kickoff.md` and `AGENTS.md:36-45` | demote (provisional, Q2) | chooses next work in a repository that is not to be extended (F3) |
| `AGENTS.md` settled positions and working practices | keep, as the historical record | — |
| `architecture/INDEX.md` snapshot rules | keep; amend "Current Pickup" (settled S-5) | F8 |
| `components/*/template/`, `scope-design.md`, `role-design.md`, `roles/` | keep as reference artifacts; amend `scope-design.md:155` (S-7) | F10 |
| Hooks and CI | none tracked; whether a hook is enabled is unknown (no `.git`) | — |

**The matrix's checks, written against this repository's files.** These are what a correction pass here would apply.
- **Parallel truth:** is a decision in full in both `DECISIONS.md` and a `components/*/DECISIONS.md`, as with
  root-general and `remotes`/`checkouts`? If so, keep the root entry and reduce the other to a link.
- **Local-global inversion:** do the "Current inherited constraints" lists in `components/*/DECISIONS.md` still
  match the root entries they summarise? They did not at `orchestrator:13` and `agent:12`.
- **Superseded material nearby:** before reviving anything from `PICKUP.md`, `INTERFACE_REFINEMENT_PLAN.md`,
  `archive/` or a struck-through `DECISIONS.md` entry, check the 2026-07-26 entry and the banner.
- **Stale references:** run a link checker such as lychee over `*.md`; it is not checked whether it is installed.
  Then search for the old names: `unified`, `workflows.yaml`, `~/scope/`, `Chronos`, `EventSink`, "Current Pickup",
  "open question".
- **Lost decisions and learnings:** did the session produce a decision? Record it in `DECISIONS.md`, or at the
  current home if it is about current design.
- **State dishonesty:** do the `ROADMAP.md` block, `architecture/INDEX.md` "Pickup" and `components.yaml`'s header
  agree with the banners?
- **Workflow drift:** would a fresh agent following `AGENTS.md` try to extend the blueprint?
- **Brittle automation:** none exists. If anything is ever automated, keep it to links and the presence of the
  banners.

**Guard decision: `none`.**
- The system is reference-only, and no further design loop is authorised here.
- The route finishes with a correction (the settled patch) and a demotion (`provisional-q2.patch`, pending Q2).
- Nothing is handed to the generator, and the integrator is not reached.
- **What would change it:**
  - if Q2 is answered "keep the rituals", the decision becomes `update`: refresh the guard for F6;
  - if Q1 is answered "SPEC.md is still live", consider `create` for a narrow guard that checks `SPEC.md` against the
    TC implementation, a cross-repository check.

## 12. The generator's inputs

These are listed as `entropy-assessment`'s Output requires. They are not handed over, because the decision is
`none`.

- **Steward:** unresolved. Inferred to be Justin (**Q3**).
- **Authorised intent documents:** the banners (`README.md:3-5`, `AGENTS.md:3-6`); `NORTH_STAR.md` (historical).
- **Decision surface:** `DECISIONS.md`, with component-local `components/*/DECISIONS.md`.
- **Open intent questions:** **Q1** to **Q3**.
- **Current-state file:** `ROADMAP.md`, using the block from S-4. It is refreshed by whoever records a steward answer;
  nothing refreshes it automatically.
- **Rules owned elsewhere:** unresolved. None is visible in the snapshot. Current authority is in `../personal-agent`
  and `../../scope`, which were not read.
- **Verification commands:** none in the repository; no CI; hooks unknown.
- **Code areas:** none in this repository. Code is in `../temporal-coordinator` and `../../scope` (not covered).
- **Live operational state or spend:** none can be changed from here. Historically, the runs used a paid ChatGPT
  subscription and API keys (`runs/001…/RUN.md:19,41`), and that line is paused.
- **Findings:** F1 to F21.

## 13. Questions for the steward

The full text, with readings, cases and recommendations, is in `questions.md`.
- **Q1:** does the reference-only banner cover the temporal coordinator contract in
  `components/temporal-coordinator/SPEC.md`?
- **Q2:** should the session-start procedure and the commit-time guard be demoted?
- **Q3:** who set the banner, and when?

## 14. Not covered, and uncertainties

- **No `.git`:** there is no commit history, no evidence of the real loop, no view of the effective hooks path, and
  no commit messages to search for steward quotes.
- **Sibling repositories were not read:** `../personal-agent`, `../../scope`, `../temporal-coordinator` and
  `../agentic-architecture-distribution`, along with the external links (23 of them, listed by the link check).
  - Every cross-repository claim is therefore unverified (**F20**).
  - So is whether the **F18** learnings moved.
- **Unknown dates:** the banners' date and author.
- **Checkout paths:** they differ between `/home/justin/...` (`scope.yaml:21,32`; runs 002-003) and
  `/home/justin-philpott/...` (run 001's command and its event `cwd`). This is probably two machines. It is not
  treated as a finding.
- **File modification times** in the snapshot are uniform (the time it was taken), so they are not evidence.
- **Raw run artifacts:** the run event streams (`events.jsonl`) were skimmed, not read in full.
