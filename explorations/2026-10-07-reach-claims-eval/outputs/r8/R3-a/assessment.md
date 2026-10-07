# Entropy assessment: agentic-architecture

- **Target:** `scratchpad/eval/targets/agentic-architecture` — a read-only snapshot with no `.git`, 78 regular
  files plus 3 `CLAUDE.md` symlinks to `AGENTS.md`, all Markdown, YAML or JSONL.
- **Assessed:** 2026-10-07, with `entropy-assessment` 0.9.0 and `docs-first-planning-assessment` 0.3.0.
- **Route:** `entropy-assessment` Step 1 (the intent pass), then Step 2 (lifecycle **reference-only**, shape
  **A: docs-first planning**). Shape A ran `docs-first-planning-assessment` Steps 1–7 as a called skill, which
  returned to `entropy-assessment` Step 3. The guard decision is **`none`**, so Step 4 hands nothing to the
  generator, and no new guard or integration brief is produced.
- **Mode:** the caller asked for the route to be carried through. The target cannot be edited, so every change
  is delivered as a patch in `patches/`. One patch is settled, and one is provisional on Q1.

---

## 1. Intent

### Steward

No file names a steward for this repository (**F1**). It is probably Justin (`justinphilpott`), but that is an
agent inference. It rests on three sources, none of which says it about this repository:
- `steward: "justin"` and an admin member `justin` in the root-scope draft
  (`components/orchestrator/scope/scope.yaml:6,36-38`);
- the root scope's steward in `SCOPES_PLANNED.md:12`;
- "Justin's ChatGPT Plus subscription" in `runs/001-moving-stillness-status/RUN.md:41`.

### Statements gathered

| Where | Statement (short) | Kind | Authority | Date |
|---|---|---|---|---|
| `README.md:3-5` | "Status: Reference-only." Current Personal Agent architecture is in `../personal-agent`, the Scope/Project model in `../../scope`. "Do not treat decisions in this repository as current authority." | directive (status banner) | neither attributed nor dated | none |
| `AGENTS.md:3-6` | "Reference-only: this repository is no longer current architecture authority … Do not extend or reinterpret this blueprint as current design without explicit authorization." | directive (standing instruction) | neither | none |
| `README.md:9` | "Bleeding-edge design source for the current named version" | description | neither | none |
| `AGENTS.md:8`, `:12` | "This repo holds the current architecture state"; "Settled — current strong positions" | description | neither | none |
| `NORTH_STAR.md:3-52` | Purpose: a blueprint for a personal agentic system; design values | description (vision) | neither | none |
| `DECISIONS.md` (896 lines) | System decisions and the open-question registry (`:875-896`) | decision log | dated, never attributed | 2026-02-27 … 2026-07-26 |
| `components/{scope,agent,orchestrator}/DECISIONS.md` | Component-local decisions | decision logs | dated, never attributed | 2026-02-27 … 2026-07-10 |
| `architecture/INDEX.md:24` | "This index alone says what is current" (for snapshots) | directive | neither | none |
| `architecture/PICKUP.md:3` | "Status: superseded historical pickup point (2026-07-26)" | directive (status banner) | dated | 2026-07-26 |
| `AUTH_OPTIONS_ANALYSIS.md:10-16` | "Current Working Decision": direct API-key auth, no subscription plumbing | decision held outside the decision log | neither | none |

Three pieces of evidence bear on the banners' recency, though none dates them:
- `personal-agent` is named nowhere in the repository except the two banners;
- the latest dated entry anywhere is 2026-07-26 (`DECISIONS.md:836`, `architecture/PICKUP.md:3-4`). The
  2026-08-01 in `components/temporal-coordinator/SPEC.md:66` is an example request value, not an entry;
- the latest timestamp in the run event streams is 2026-05-13.

### Three readings

- **Declared:** the bodies of `README.md:9` and `AGENTS.md:8` describe the repository as the current design
  source, and `NORTH_STAR.md` gives its purpose.
- **Enacted:** there is no git history, so the last pursued work can only be read from dated content. The last
  dated work, on 2026-07-26, replaced the temporal coordinator with the pg-boss V0 POC and marked
  `PICKUP.md` superseded. Runs 001–003 (to 2026-05-13) are paused (`runs/README.md:7-9`).
- **Authorised:** the repository is **reference-only**, and is not to be extended or reinterpreted as current
  design without explicit authorization (`README.md:3-5`, `AGENTS.md:3-6`). This rests on a directive with no
  attribution. Under the system's own precedence, a directive outranks a description, and nothing prescribes
  the opposite, so the evidence settles the lifecycle. The missing author and date stay visible as **F2**.

### Gaps by condition

| Condition | Findings | Response taken |
|---|---|---|
| Stale description | **F3** (bodies under the banners still say "current"); **F13**, **F15** (texts contradicting later dated decisions, by the repo's "newer settled state wins", `AGENTS.md:70`) | F3: not corrected. The banner is unattributed, and rule 5 of the intent-change rule needs a steward decision. The banners sit above the stale lines in the same files. F13 and F15: recorded, not corrected, because the repository is reference-only (§7). |
| Conflict | **F12** (orchestrator reach: mode-tunable vs "no scope repo access") | Both sides presented in F12. Not asked: in a reference-only repository the answer changes nothing that gets built. Noted as unsettled in the state-file patch. |
| Missing | **F1** (no steward named); **F2** (no dated, attributed record of the reference-only decision); what the repository's rituals become now (**Q1**) | Q1 asked. F1 and F2 go to the steward with Q1's recording advice. |
| Ambiguous | **F8** ("clarify intent and update the docs" names no one who clarifies) | Readings and a case are in F8. The banner's "explicit authorization" resolves it for this repository, so it is not asked. |
| Unauthorised drift | **F20** (runs used subscription auth against the "Current Working Decision") | Recorded. Nothing is fixed in a reference-only repository, and the intent documents were not edited. |
| Prose control | **F10** | Where enforcement would sit is reported in F10. Nothing cites either rule as a control. |

### Existing guard instructions, read against intent-change rule v2

- **Intent: F7.** `skills/entropy-guard.md:79` says "If a component's status has changed, update
  components.yaml". It treats the session's work as permission to change a status that `AGENTS.md:71` and
  `DECISIONS.md:41` reserve for explicit instruction.
- **Intent: F8.** `AGENTS.md:14` says "when it changes we update this list in the same pass". This is not a
  guard repair, but it is a standing instruction with the same effect: settled positions change without a
  steward step.
- **Ownership: F9.** `skills/entropy-guard.md:38` asks whether "the scope manager [is] consistently described
  across MODEL.md, RUNTIME.md, and components.yaml". Lines 39-41 likewise keep several full descriptions in
  step. `AGENTS.md:51` adds "check what other files reference the same concepts and update them too".
  `DECISIONS.md:857` makes the snapshot the one owner of anatomy.
- **Lifecycle: F6** (not an intent or ownership flag). `skills/entropy-guard.md:98` says "add them to
  DECISIONS.md Open Questions", which extends a blueprint the banner closes.

### Questions and proposed changes

- **Q1** is in `questions.md`. It asks whether the session-start steps, the kickoff skill and the guard are
  demoted, retired or kept, and recommends demoting them.
- **Recording.** Record the answer to Q1 in `DECISIONS.md`, dated and attributed, together with the date the
  repository became reference-only (F2). Nothing was recorded in the target, because it is read-only.
- **Proposed changes:** `patches/settled.patch`, and `patches/provisional-Q1.patch`, which applies only after
  Q1 is answered (a).

---

## 2. Lifecycle, shape, repositories

- **Lifecycle: reference-only.** The evidence is `README.md:3-5`, `AGENTS.md:3-6`, the recency signals in §1,
  and `PICKUP.md` already marked superseded. Under `entropy-assessment` Step 2, this limits the route to a
  correction or a demotion. No reconciliation sweep is recommended.
- **Shape: A, docs-first planning.** The evidence:
  - the repository has no code;
  - an 896-line decision log, roadmap, `TODO.md`/`PLAN.md` files and agent instructions carry its state;
  - work happened in repeated agent sessions, through the session-start ritual in `AGENTS.md:36-45`,
    `skills/session-kickoff.md`, run records and pickup notes.

  Shape D (workflow-heavy) partly fits, because the live risk is the session ritual (F4). A is the riskier of
  the two and its analysis covers workflow drift.
- **Repositories.** The banners name two successor repositories, `../personal-agent` and `../../scope`, and the
  text names several siblings (`agentic-learning`, `agentic-architecture-distribution`, `temporal-coordinator`).
  None was read, because they are outside this run's permitted scope. So the assessment covers this repository
  alone. Whether the successors hold the current versions of anything here is **not covered**.

---

## 3. Findings

Every other section refers to these by id.

**F1. No steward is named for this repository.**
- **Evidence:** `README.md`, `AGENTS.md`, `NORTH_STAR.md` and `DECISIONS.md` name no owner, and decision
  entries are dated but never attributed (for example `DECISIONS.md:7`, `:855`). The steward is inferred to be
  Justin from `components/orchestrator/scope/scope.yaml:6` and `runs/001…/RUN.md:41`.
- **Source:** intent pass §1.

**F2. The reference-only status exists only as two undated, unattributed banners.**
- **Where it is:** `README.md:3-5` and `AGENTS.md:3-6`.
- **Where it is missing:** `DECISIONS.md`, `ROADMAP.md`, `architecture/INDEX.md`, `skills/entropy-guard.md`,
  `skills/session-kickoff.md` and every component doc.
- **Search:** `grep -rn -i 'reference-only'` over all files finds only the two banners, plus
  `components/agent/skills/role-design.md:3`, which uses the phrase in an unrelated sense.

**F3. Descriptions under the banners still call the repository current.**
- `README.md:9`: "Bleeding-edge design source for the current named version".
- `AGENTS.md:8`: "This repo holds the current architecture state".
- `AGENTS.md:12`: "Settled — current strong positions".
- `components.yaml:1`: "Component catalog for the agentic architecture current named version".

**F4. The session loop still sends a fresh agent into active architecture work.** The banner says "Do not
extend … without explicit authorization" (`AGENTS.md:5-6`). Against it:
- `AGENTS.md:36-45`: start at `ROADMAP.md` "what's being worked towards", then "choose work from that
  compressed view";
- `skills/session-kickoff.md:9-10` and `:86`: "recommend the best next action from the packet";
- `ROADMAP.md:12-27` "Working towards next", with 3 open items;
- `components/orchestrator/TODO.md:14-20` and `components/scope/TODO.md:24-29`, "Next Up";
- `components/orchestrator/PLAN.md:5-22` "Current Focus".

**F5. The index points at a superseded pickup.** `architecture/INDEX.md:15-17` says "Next architecture work
starts at PICKUP.md", but `architecture/PICKUP.md:3` says "superseded historical pickup point (2026-07-26)".
This contradicts a state file, so it is fixed as usual (settled patch).

**F6. The existing guard, `skills/entropy-guard.md`, is out of step with the lifecycle and its own metadata.**
- Its triggers (`:16-18`, including "At the start of an architecture session") and its output (`:98`, "add
  them to DECISIONS.md Open Questions") extend the blueprint.
- `:118` plans a further "Prompted" maturity step.
- Its `system_snapshot` (`:7`) is stale. It says "Open questions reduced from 22 to 11", but the registry now
  holds 13: 7 genuinely open (`DECISIONS.md:881-887`) and 6 deferred (`:891-896`).
- Its `last_evaluated` is 2026-04-27, which predates the July snapshot, the temporal coordinator V0 and the
  reference-only banners.

**F7. A guard repair lets work change a component's status (intent flag).** `skills/entropy-guard.md:79`, "If
a component's status has changed, update components.yaml", conflicts with `AGENTS.md:71` ("only elevate
status when explicitly instructed") and `DECISIONS.md:41` ("only … when explicitly promoted").

**F8. Two instructions change intent with no steward step (intent flag and ambiguity).**
- `AGENTS.md:14` revises "settled" positions "with strong enough reasoning … update this list in the same
  pass", and no steward decides.
- `AGENTS.md:25` and `DECISIONS.md:869-871`: "clarify intent and update the docs/records". The readings are:
  - (a) ask the steward;
  - (b) the working agent settles intent itself.
- **Where they diverge:** an agent meeting `RUNTIME.md:67` "unified for v0" against the snapshot rewrites
  RUNTIME's scope-manager section on its own reading under (b).

**F9. The guard keeps several full descriptions in step instead of naming one owner (ownership flag).**
- `skills/entropy-guard.md:38` checks the scope manager "consistently described across MODEL.md, RUNTIME.md,
  and components.yaml"; `:37` and `:39-41` are similar.
- `AGENTS.md:51` says "update them too".
- `DECISIONS.md:857` and `architecture/INDEX.md:21` make the current snapshot the sole owner of anatomy, and
  forbid restating it.
- The guard also has the one-owner check at `:74`, so it holds both patterns.

**F10. Two prose controls have nothing enforcing them.**
- **The rules:** `AGENTS.md:72` (run the guard before committing) and the banner's `AGENTS.md:5-6`.
- **Enforcement:** the guard says so itself ("External (discipline-based)", `:114`; "no hooks", `:7`), and the
  snapshot has no hook files.
- **Citations:** nothing cites either rule as a control.
- **Where enforcement would sit:** for the guard, a pre-commit reminder. For the banner, the remote's
  read-only or archive setting.

**F11. `RUNTIME.md` still restates the superseded unified gateway, contradicting the snapshot and PICKUP's
claim of a completed cleanup.**
- **The restated anatomy:** `RUNTIME.md:57-84`, including `:67` "Runtime gateway (unified for v0)" and `:82`
  "unified sandbox gateway".
- **What it contradicts:** orchestration v1 (`architecture/snapshots/2026-07-16-orchestration/ARCH.md:22,67`)
  and `DECISIONS.md:575`, superseded 2026-07-16.
- **The claim it falsifies:** `architecture/PICKUP.md:15`, "unified-gateway wording has been cleaned up
  except historical superseded decision titles".
- **Search:** `grep -i 'unified|gateway'` over all `.md` and `.yaml` files finds only `RUNTIME.md:67,82`
  outside the superseded `DECISIONS.md:573-592` entry (and an unrelated `PI_AGENT_OVERVIEW.md:21`). The
  "direct-TC-to-orchestrator" half of the claim found no counter-example.

**F12. Sources conflict on how far the orchestrator may reach.** Neither side is marked superseded, and the
snapshot does not plainly settle "scope access".
- **Mode-tunable:**
  - `MODEL.md:78`: "authority (scope access, secret reach, tool reach, autonomy) is mode-tunable";
  - `components.yaml:20`;
  - snapshot `ARCH.md:68`, with mode `personal-local-open`, "Broad access", at `ARCH.md:56`.
- **Never:**
  - `DECISIONS.md:370-376`, "Orchestrator has no secrets and no scope repo access", not marked superseded;
  - `AGENTS.md:30`;
  - `components/orchestrator/MODEL.md:27-31,65`;
  - `RUNTIME.md:88`.

**F13. Texts still treat questions as open that recorded decisions say they resolve.**
- `components/scope/skills/scope-design.md:155`, "Skill injection is an open question", against
  `DECISIONS.md:674-678`, which "Resolves … 'Skill injection model'".
- `components/agent/DECISIONS.md:12`, "inter-agent communication and runtime setup are still open questions",
  against `DECISIONS.md:559` and `:635`.
- `components/orchestrator/PLAN.md:28` "format TBD" against `DECISIONS.md:612-618`; `:29` "whatever mechanism
  is chosen" against `DECISIONS.md:551-559`.
- `SCOPES_PLANNED.md:90` lists "workspace lifecycle triggers" and "agent runtime binding location" as key open
  questions. They were resolved at `DECISIONS.md:650` and `:692`. "Sandbox isolation model" is not in the
  registry at all.
- `SCOPES_PLANNED.md:30` and `components/orchestrator/MODEL.md:84-86` point to the registry for cross-scope
  capability exposure. It is not there; `DECISIONS.md:666-670` is a direction-set decision.
- `DECISIONS.md:896`, deferred "Layer 2 distribution form: build step vs separate distribution repo", against
  `DECISIONS.md:156-162` (2026-05-14), which put it in a separate repository.
- `ROADMAP.md:36-37,54,58,63` keep open checklist items for communication, agent runtime setup, "what is a
  running agent", "who triggers each transition" and the communication architecture. All were resolved on
  2026-04-27 (`DECISIONS.md:551-650`). `components/scope/TODO.md:39` does the same for the workspace
  lifecycle.

**F14. Open-question text is copied outside the canonical registry.** This goes against `DECISIONS.md:305-309`
and `AGENTS.md:28`:
- `components/scope/skills/scope-design.md:159-164` and `components/scope/TODO.md:42-43` copy registry items
  `DECISIONS.md:894-895`;
- `components/orchestrator/MODEL.md:86-87` copies `:882`;
- `AUTH_OPTIONS_ANALYSIS.md:246-251` and `components/agent/skills/role-design.md:200-204` hold architecture
  questions in place.

**F15. The orchestrator component still describes it provisioning workspaces.**
- **The text:** `components/orchestrator/MODEL.md:25` ("provision workspace for scope X") and `:40` ("calls
  the scope manager to assemble a workspace"); also `components/scope/MODEL.md:65`.
- **The later decision:** `DECISIONS.md:639-648` (2026-04-27): the orchestrator "never says 'provision a
  sandbox' — it submits work".
- **The earlier decision it matches:** `DECISIONS.md:401` (2026-04-06), which is not marked superseded.

**F16. The manifest field set is stated in many places, and two of them add a field the decision forbids.**
- **The rule:** `DECISIONS.md:466-475` says "Additional manifest fields should not be added until routing or
  auditing proves they are needed".
- **The additions:** `components/orchestrator/scope/scope.yaml:14,28` and the template comment
  `components/scope/template/scope.yaml:20-22` add `display_name` to `kind: scope` entries.
  `components/scope/MODEL.md:16` omits it.
- **Other places that restate the list:** `DECISIONS.md:345,372`, `AGENTS.md:30`, `MODEL.md:62`,
  `components/scope/PLAN.md:32` and `skills/entropy-guard.md:57`.

**F17. The scope template has no `roles/` directory, though two decisions put roles in scope repositories.**
- **The decisions:** `DECISIONS.md:688-692` (bindings under `roles/{role-id}/bindings/` in scope repos) and
  `components/agent/MODEL.md:86`.
- **The template and layout:** neither `components/scope/template/` nor the layout in
  `components/scope/MODEL.md:33-41` has a `roles/` directory.
- **Observed in use:** "The scope template still needed manual supplementation with `roles/`"
  (`runs/002…/RUN.md:230`). Guard check `:76` covers templates and did not catch it.

**F18. Run findings were only partly carried into the decision log.**
- **Recorded:** `DECISIONS.md:731` records Pi's event stream as the "seed" of the runtime event log.
- **Not recorded:**
  - run 001's action items (`runs/001…/RUN.md:85,116-120`): the v0 event schema, sandbox-isolation evidence
    for the 2026-04-05 decision, `AGENTS.md`/`CLAUDE.md` as a load-bearing context surface, and the empty
    `uses: {}` question;
  - run 002's "Copy-from-reference drift risk is real" (`runs/002…/RUN.md:241`), and its two "Decide whether"
    items (`:247-248`).
- **Still open:** `ROADMAP.md:26` "[ ] Runtime event/action log schema" and
  `components/orchestrator/TODO.md:16` "Review run 001 findings".

**F19. Run 001's record understates how far its agent reached.** This was checked against each run's committed
event stream.
- **The claim:** run 001's `RUN.md:89` says the agent's output "references" two paths outside the scope.
- **The stream:** `runs/001…/events.jsonl` shows 16 tool calls:
  - 5 reads, all inside the scope;
  - 5 `ls` calls, including `..` and `/home/justin-philpott`;
  - 6 `find` calls, including 4 recursive searches of `/home/justin-philpott` and one of
    `/home/justin-philpott/scopes`.
- **Effect:** the run's conclusion that filesystem isolation is load-bearing holds, more strongly.
- **Runs 002 and 003:** their "only these three reads" claims (`RUN.md:225`, `:71`) match their streams
  exactly.

**F20. The "Current Working Decision" on auth was not what the runs used.**
- **The decision:** `AUTH_OPTIONS_ANALYSIS.md:10-16` ("direct API-key auth … no subscription-auth plumbing")
  and `:176-177` ("Pi is not, by itself, the auth answer").
- **What the runs did:** runs 001–003 authenticated through Pi's own `/login` with a ChatGPT/Codex
  subscription (`runs/001…/RUN.md:41`, `runs/002…/RUN.md:33,56`, `runs/003…/RUN.md:68`).
- **Caveat:** the runs were diagnostics, not the "first vertical slice" the decision names
  (`AUTH_OPTIONS_ANALYSIS.md:216-220`). The enacted path still differs, and no decision covers it.
- **Also:** the decision lives outside `DECISIONS.md`.

**F21. Two files give different relative paths to the same sibling repositories.**
- `components.yaml:35,51,56,61,66,71,76,81` uses `../scope`, `../library`, `../seed` and so on.
- `README.md:43-50` uses `../../scope`, `../../library`, and so on.
- `DECISIONS.md:176` puts this repository in `~/pro/agentic/` and tools flat in `~/pro/`, which supports the
  README. `components.yaml:86` (`../agentic-colab`) is consistent with it, because `agentic-colab` sits in
  `~/pro/agentic/`.
- Not verified on disk: the sibling paths are outside this run's read scope.

**F22. One work item is tracked in four places.** "Flesh out daily-summary WORKFLOW.md" appears at:
- `ROADMAP.md:25`;
- `components/orchestrator/TODO.md:17`;
- `components/scope/TODO.md:27`;
- `components/orchestrator/PLAN.md:16`.

**F23. Superseded scheduling shapes remain described as current nearby.**
- `archive/scheduling-cronicle-investigation.md:4-8` says `SCHEDULING.md` retains "any external scheduler is
  at most a backend clock/delivery detail behind the adapter boundary". After 2026-07-26, `SCHEDULING.md:3-18`
  has pg-boss owning the queue mechanics, and no adapter boundary.
- `PI_AGENT_OVERVIEW.md:94,99` still describe "due-event triggered" agents and an external scheduler invoking
  Pi or the scope manager. V0 has no consumer (`SCHEDULING.md:17`).

**F24. A component decision log restates a root decision in full (local–global inversion).**
`components/orchestrator/DECISIONS.md:18-29` restates root `DECISIONS.md:489-500` ("root-general") in full.
Its own header, at `:5`, says "Do not duplicate them here in full".

---

## 4. Truth map

| Concept | Canonical home | Also stated in (role) |
|---|---|---|
| Repository status / lifecycle | `README.md:3-5` banner | `AGENTS.md:3-6` (agent-facing copy, plus the authorization rule); missing elsewhere (F2) |
| Purpose and design values | `NORTH_STAR.md` | `README.md:9`, `AGENTS.md:8` (stale, F3) |
| System decisions; open-question registry | `DECISIONS.md` (`:875-896` registry) | Component `DECISIONS.md` (local; F24 inversion); copies outside the registry (F14) |
| What is current for anatomy | `architecture/INDEX.md` | — |
| Orchestration anatomy (scope manager seams, orchestrator authority, modes) | `architecture/snapshots/2026-07-16-orchestration/ARCH.md` | `RUNTIME.md:57-84` (independent restatement, wrong, F11); `MODEL.md:78-88`, `AGENTS.md:30-34`, `components.yaml` roles (summaries; F12 conflict) |
| Temporal coordinator V0 contract | `components/temporal-coordinator/SPEC.md` | `SCHEDULING.md`, `RUNTIME.md:33-49`, `MODEL.md:88`, `components.yaml:26-30`, `PLAN.md` (summaries, currently consistent) |
| Manifest field set | `DECISIONS.md:466-475`, `:758-780` | 7 restatements and 2 divergent instances (F16) |
| `scope.yaml` schema and scope layout | `components/scope/template/` and `components/scope/DECISIONS.md` | `components/scope/MODEL.md`, `PLAN.md` (local elaboration; F17) |
| Role and binding schema | `components/agent/template/` and `components/agent/DECISIONS.md` | `components/agent/MODEL.md`, `skills/role-design.md` |
| Component status | `components.yaml` | `MODEL.md` |
| Work tracking | `ROADMAP.md` (the state file) | component `TODO.md` and `PLAN.md` (overlap, F22) |
| Planned scope inventory | `SCOPES_PLANNED.md` | root manifest instance `components/orchestrator/scope/scope.yaml` |
| Tools and versions | `MANIFEST.md` | — |
| Agent entry point | `AGENTS.md` | `CLAUDE.md`, a symlink (generated projection, fine) |

**Document roles:**
- **Canonical:** `README.md`, `AGENTS.md`, `NORTH_STAR.md`, `DECISIONS.md`, `MODEL.md`, `architecture/INDEX.md`
  and the current snapshot, `components/temporal-coordinator/SPEC.md`, `components.yaml` and `MANIFEST.md`.
- **Current state:** `ROADMAP.md`, `components/*/TODO.md` and `PLAN.md`, `runs/README.md`, and
  `architecture/PICKUP.md` (superseded).
- **Local elaboration:** component `MODEL.md` and `DECISIONS.md`, `RUNTIME.md`, `SCHEDULING.md` and
  `SCOPES_PLANNED.md`.
- **Product artifacts:** `skills/*.md`, `components/*/skills/*.md`, the root-scope draft and `WORKFLOW.md`
  stubs.
- **Templates:** `components/scope/template/` and `components/agent/template/`.
- **Historical:** `architecture/PICKUP.md`, `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md`,
  `archive/`, `ORCHESTRATION.md` (a redirect), `runs/00*`, `roles/` (reference examples), superseded
  `DECISIONS.md` entries, and the research notes `PI_AGENT_OVERVIEW.md` and `AUTH_OPTIONS_ANALYSIS.md`.

## 5. Loop map

- **Documented loop:**
  1. `AGENTS.md` is auto-loaded, through `CLAUDE.md`.
  2. Session start (`:36-45`): `ROADMAP.md`, `MODEL.md`, `DECISIONS.md`, `components.yaml`, the component docs,
     then the `skills/session-kickoff.md` packet, then choose work.
  3. The "Before making changes" checks (`:47-51`).
  4. The work.
  5. `skills/entropy-guard.md` before a non-trivial commit (`:72`).
  6. Commit.
- **Where things are captured:** decisions in `DECISIONS.md`; learnings in `components/scope/LEARNINGS.md`
  and the run records' Findings. There is no root `TODO.md`.
- **Real loop, read from content because there is no git history:** handoffs lived in pickup notes
  (`runs/001…/RUN.md:112-126` "Pickup — start here next session", and `architecture/PICKUP.md`) rather than in
  `ROADMAP.md`, and run pickups were not all carried into the decision log (F18).
- **Today:** no active loop should run here, but the documented one still starts with choosing work (F4).
- **Handoff point:** the commit, with the discipline-based guard (F10).

## 6. Ranked risks

| # | Risk | Findings | Decay rate | Recovery cost | Symptoms seen | Anchor for the fix |
|---|---|---|---|---|---|---|
| 1 | Workflow drift: the rituals still invite extension of a reference-only blueprint | F4, F6, F2, F10 | Immediate: every fresh session that follows `AGENTS.md` | Medium–high: work done here must be moved to the successor repositories and reconciled, and decisions recorded here are orphaned | The session start chooses work from `ROADMAP.md`; the guard writes new open questions; the kickoff recommends next actions | `README.md:3-5` banner |
| 2 | Superseded material nearby that looks current | F5, F11, F12, F13, F15, F23 | Static now; costs each reader who mines the reference | Medium: stale shapes imported into successor designs | `INDEX` pointing at a superseded pickup; the unified gateway in `RUNTIME.md`; resolved questions shown as open | `architecture/INDEX.md` and dated `DECISIONS.md` entries |
| 3 | State dishonesty | F4, F6, F13, F22 | Already happened | Low: one status note | `ROADMAP`, `TODO` and `PLAN` read as live; the guard's snapshot is stale | `ROADMAP.md` (state file) |
| 4 | Parallel truth and local–global inversion | F9, F11, F14, F16, F24 | Frozen; matters only if the repository is revived or mined | Medium | The same anatomy, fields and questions restated, with divergence | The snapshot and `DECISIONS.md` |
| 5 | Lost decisions and learnings | F18, F20 | Frozen | Low–medium, if successors need them | Run action items never promoted; a working decision held outside the log | `DECISIONS.md` (or the successors) |

## 7. Recommendations

- **Demote**, subject to Q1 (a): the session-start steps, `skills/session-kickoff.md` and
  `skills/entropy-guard.md` run only for edits the steward explicitly authorizes (`patches/provisional-Q1.patch`).
- **Mark the status in the state file**, settled: a status note at the top of `ROADMAP.md` (§9).
- **Correct one contradictory state pointer**, settled: `architecture/INDEX.md` "Current Pickup" (F5).
- **Record**, for the steward: a dated, attributed `DECISIONS.md` entry for the reference-only status (F2),
  together with Q1's answer.
- **Do not consolidate or reconcile** F3, F11–F17 or F21–F24 while the repository is reference-only. The banner
  reserves reinterpreting the blueprint for explicit authorization, and reconciliation effort would go into a
  copy that is not current. They stay recorded here as the starting cleanup if the repository is ever revived.
- **F3, specifically:** leave the stale descriptions under the banners. Correcting them needs a recorded steward
  decision (intent-change rule, rule 5), which F2 says does not exist yet. Once the steward records the
  reference-only decision, those 4 lines can be corrected citing it.
- **For successor repositories:** if `personal-agent` or `scope` draws on this one, F12, F18, F19 and F20 are
  the findings most likely to matter there. That is not verified, because the successors were not read.

## 8. One-time cleanup

Each item was verified against the current file on 2026-10-07.

| Item | File and lines (verified) | Status |
|---|---|---|
| C1. Replace "Current Pickup" with "None", citing `PICKUP.md`'s status | `architecture/INDEX.md:15-17`; `PICKUP.md:3` | In `patches/settled.patch` |
| C2. Status note in the state file | `ROADMAP.md:1-3` | In `patches/settled.patch` |
| C3. Demote the rituals; fix F7 and F9 inside the demoted guard; drop the stale snapshot claim | `AGENTS.md:36-45,72`; `skills/entropy-guard.md:2-12,16-18,38,79,98,116-118`; `skills/session-kickoff.md:3-10,86` | In `patches/provisional-Q1.patch`, after Q1 |
| C4. If revived only: F11 `RUNTIME.md:67,82`; F13 items; F14; F15; F16; F17 template; F21 paths; F22; F23; F24; `PICKUP.md:15` claim | lines as given in each finding | Not recommended under reference-only |

## 9. State-file update

`ROADMAP.md` is the state file the loop reads first (`AGENTS.md:38`). The update is the first hunk of
`patches/settled.patch`. It carries:
- the stage, with the source and date checked;
- the documents to trust first, and the one point where they disagree (F12);
- misleading nearby material, marked "not a complete list";
- the open question Q1;
- the next step;
- what makes it stale, and who refreshes it.

It keeps the observation (the banners exist, undated) apart from inference. It does not claim to know what the
successor repositories hold.

## 10. Guard surfaces and docs-first checks

The existing guard surfaces, sorted:

| Surface | Decision |
|---|---|
| `skills/entropy-guard.md` (guard) | **Demote** (provisional, Q1) |
| `AGENTS.md` session start and the guard rule at `:72` (+ `CLAUDE.md` symlink) | **Amend → demote** (provisional, Q1); banner **keep** |
| `skills/session-kickoff.md` | **Demote** (provisional, Q1) |
| `README.md` banner | **Keep**: it owns the lifecycle |
| `ROADMAP.md` (state file) | **Amend** (settled) |
| `architecture/INDEX.md` | **Amend** (settled) |
| `components/scope/template/`, `components/agent/template/` | **Keep** (frozen; F17 recorded) |
| Root-scope draft and scope template `AGENTS.md` | **Keep**: product artifacts for scope instances, not guards of this repository |
| Hooks | **None exist**, and there is no `.git` in the snapshot |

The docs-first matrix checks, written against this repository's files. They apply to any explicitly authorized
edit, and serve as the guard's checks if the repository is revived:

- **Parallel truth:** if an edit touches orchestration anatomy, does any doc other than the current snapshot
  restate it (`RUNTIME.md:57-84`, `MODEL.md:78-88`)? Reduce it to a link (`DECISIONS.md:855-861`).
- **Local–global inversion:** do `components/*/DECISIONS.md` or `MODEL.md` restate a root decision in full (as
  F24 does)?
- **Superseded nearby:** before reviving anything from `PICKUP.md`, `INTERFACE_REFINEMENT_PLAN.md`, `archive/`
  or a superseded `DECISIONS.md` entry, check `architecture/INDEX.md` and the superseding dated entry.
- **Stale references:** for each "Resolves open question: X" in `DECISIONS.md`, search X across the repository
  (F13). Check relative links with a link check.
- **Lost decisions and learnings:** did the edit produce a decision or learning? Record it in `DECISIONS.md` or
  `components/scope/LEARNINGS.md`, not only in a run record (F18).
- **State dishonesty:** does the `ROADMAP.md` status note still match the `README.md` banner? Do other mentions
  of each changed claim agree?
- **Workflow drift:** would a fresh agent following `AGENTS.md` have done what this session did? In particular,
  did the session extend the blueprint without explicit authorization?
- **Brittle automation:** none exists. Keep all of these as judgment.

## 11. Guard decision and generator inputs

**Guard decision: `none`.** The reason: the repository is reference-only (§2). `entropy-assessment` Step 3 and
docs-first Step 7.3 give `none` for that case, finishing with a correction (C1, C2) and a demotion (C3,
provisional on Q1).
- No guard is generated, and nothing is handed to `session-coherence-skill-generator`.
- If the steward answers Q1 (c), "keep as is", the existing guard still needs F6, F7 and F9 fixed. The
  decision then becomes `update`, and the generator should run.

The generator's inputs, as its "Inputs, and the guard decision" section lists them:

| Input | Value |
|---|---|
| Steward | **Unresolved**: not named (F1); inferred Justin |
| Authorised intent documents | `README.md:3-5`, `AGENTS.md:3-6` (status); `NORTH_STAR.md` (historical purpose); `architecture/INDEX.md` (what is current) |
| Decision surface | `DECISIONS.md`, plus component `DECISIONS.md` for local choices |
| Open intent questions | Q1 |
| Current-state file and who refreshes it | `ROADMAP.md`. The refresher is **unresolved**: no owner is named. After the patch, "the steward, or whoever applies a lifecycle change". |
| Rules the repo is bound by but does not own | **Unresolved**: none are found in the repository. The successor repositories and any user-wide instruction file are outside this run's read scope. |
| Verification commands | None exist (no scripts, CI or hooks). The relative-link check in §14 was ad hoc. |
| Code areas and their docs/tests | **Inapplicable**: no code. The temporal coordinator's implementation is in a sibling repository (`components.yaml:29`). |
| Live operational state or spend a session can change | **Inapplicable** in this repository. The run line that used a model subscription is paused (`runs/README.md:7-9`). |
| Findings | F1–F24 |

## 12. Patches, and the check against findings and questions

Both patches were applied to a fresh copy of the target. Each applies alone and in either order. Neither adds
trailing whitespace, and every relative link in the patched files resolves.

**`patches/settled.patch`:**
- **S1, `ROADMAP.md` status note.**
  - It states only what F2 records (two undated banners, no `DECISIONS.md` entry) and the verified latest date,
    2026-07-26.
  - Its list of misleading material is marked "not a complete list", because F13 and F23 show more.
  - It names F12's conflict as unsettled, rather than implying the snapshot and `DECISIONS.md` agree.
  - It lists Q1 as open without stating an answer.
  - It edits no text Q1 quotes. Q1 quotes `AGENTS.md:36-45,72`, `skills/entropy-guard.md:16-18,98` and
    `skills/session-kickoff.md:86`.
- **S2, `architecture/INDEX.md:15-17`.** Settled by `PICKUP.md:3`. It touches no question and contradicts no
  finding.

**`patches/provisional-Q1.patch`.** Not to be applied until the steward answers Q1, and only for answer (a).
- **P1–P3, `AGENTS.md`.** These edit text Q1 quotes.
- **P4–P10, `skills/entropy-guard.md`.**
  - The hunks for `:16-18` and `:98` edit text Q1 quotes.
  - The F7 fix (`:79`) and F9 fix (`:38`) presuppose that the guard survives, which is what Q1 asks, so they
    wait with it.
  - The demotion date is a placeholder for the steward's recorded answer. No date was invented.
- **P11–P13, `skills/session-kickoff.md`.** These edit text Q1 quotes.
- **Check:** no provisional hunk contradicts a finding. The F9 fix points at the snapshot as owner, consistent
  with F11.

## 13. Questions for the steward

See `questions.md`: one question, Q1, with a recommended answer.

## 14. Uncertainties, and what was not covered

- **No git history.** The snapshot has no `.git`, so the enacted reading rests on dated content, and the
  "real loop" could not be read from commits.
- **The banners' authority.** Who wrote them and when is unknown (F1, F2). The lifecycle conclusion rests on
  their being directives, and on the recency evidence in §1.
- **Not read: the successor and sibling repositories** (`personal-agent`, `scope`,
  `agentic-architecture-distribution`, `agentic-learning`, `temporal-coordinator`, and others). Links that
  leave this repository were not checked, and F21 is not verified on disk.
- **Read in part:**
  - `runs/*/events.jsonl` were checked for tool calls and event types only;
  - `runs/*/output.md` were read in part;
  - `archive/scheduling-cronicle-investigation.md` was read in its header and by search, not in full;
  - `runs/002…/RUN.md:85-188` was read through a viewer.
- **Read in full:** every other file.
- **The link check** resolved relative links from `.md` files inside the repository. One apparent break,
  `README.md` → `../agentic-architecture-distribution`, was a prefix-matching artifact of the check: it points
  outside the repository.

## 15. Notes on the entropy-guard skills (feedback, not filed)

- **Who carries out a demotion under `none`.** `entropy-assessment` Step 3 allows `none` to "finish with a
  correction or a demotion", and docs-first Step 7 sorts existing surfaces into keep, amend, replace or demote.
  But no skill says who carries out the demotion of an existing guard's placement. The integrator is reached
  only through the generator, which stops on `none`. Integration advice for a demotion has no home on this
  route; `integration.md` says so.
- **Undated, unattributed directives.** The intent pass's "Stale description" row needs "a later recorded
  steward decision". A lifecycle banner that is a directive, but undated and unattributed, can ground the
  lifecycle under the system's own precedence. It cannot ground corrections under rule 5 of the
  intent-change rule. The skills do not say how to treat that split. This run used the banner for the
  lifecycle, and limited corrections to pointers (F3 left).
- **Instruction files.** The intent pass reads "every existing guard's repair instructions". Agent instruction
  files carry repair-like instructions too (`AGENTS.md:14`, `:51`). This run included them; the skill does not
  say whether to.
