# Questions for the steward

The steward is Justin, the repository owner, by inference (assessment F16). No steward was available for this
run, so each question below carries the answer I recommend, and the run continued on that recommendation. Work that
depends on an answer is drafted as provisional and is not applied:

- `current-state.patch` and `bootstrap.patch` both depend on Q1;
- nothing in either patch depends on Q2 or Q3.

All three questions are also listed in the proposed `DECISIONS.md` entry as "Awaiting the steward, not decided".

## Q1. What does "reference-only" still allow to change in agentic-architecture?

- **Statement and source:** "this repository is no longer current architecture authority… Do not extend or
  reinterpret this blueprint as current design without explicit authorization." (`AGENTS.md:3-6`). Similar
  wording is in `README.md:3-5`. Neither carries a date or an attribution.
- **Candidate readings:**
  - (a) **Frozen.** Nothing changes; the banners are the only status signal.
  - (b) **Maintained reference.** Corrections taken from dated decisions, and historical labels, may be made. No
    new design, decisions, open questions or roadmap items may be added.
- **A case where they lead to different work:** `ROADMAP.md` "Working towards next" still lists unchecked items,
  for example "Runtime event/action log schema" and the `scopectl` CLI. Step 1 of `AGENTS.md` "Session start"
  sends every fresh session there, and step 6 asks for "the 1-3 most plausible next actions".
  - Under (a), that stays, and each fresh session proposes work on a design that is no longer current.
  - Under (b), the patches add a Status block, historical labels and a rewritten session start, and the commit
    guard is refined so that it refuses new design.
- **Recommended answer: (b).** The corrections carry out the banner rather than extend the design. Without them, the
  session-start ritual works against the banner in every session (F2, F3, F13). Under (a), the existing guard in
  `skills/entropy-guard.md` would also need demoting, because it asks for new open questions and roadmap updates
  (F12).

## Q2. Is `components/temporal-coordinator/SPEC.md` still the authoritative V0 contract for the temporal coordinator?

- **Statement and source:** `DECISIONS.md:847` (2026-07-26) says "The full contract is
  components/temporal-coordinator/SPEC.md". It is also called authoritative at `DECISIONS.md:830`,
  `SCHEDULING.md:20` and `architecture/snapshots/2026-07-16-orchestration/ARCH.md:41`. The implementation lives in
  a sibling repository (`components.yaml:29`). Against that, the banner says "Do not treat decisions in this
  repository as current authority" (`README.md:5`). The banner names new homes only for the Personal Agent
  architecture and the Scope and Project model.
- **Candidate readings:**
  - (a) The banner covers it. The spec here is historical, and the temporal-coordinator repository, or
    `../personal-agent`, owns the contract.
  - (b) It is an exception. The spec stays the live authority, which means this repository is not wholly
    reference-only.
- **A case where they lead to different work:** an agent in the temporal-coordinator repository wants to add a
  recurrence field.
  - Under (b), it must change `SPEC.md` here first. That is the "blueprint SPEC → impl spec/ → code" order in
    `INTERFACE_REFINEMENT_PLAN.md:152`.
  - Under (a), it changes the implementation repository's own spec and leaves this one alone.
- **Recommended answer: (a),** because the banner's wording is blanket. Before answering, confirm that the
  temporal-coordinator repository does not link back here as its authority; I could not read it. Once answered:
  - under (a), add historical labels to `components/temporal-coordinator/`, `SCHEDULING.md` and the
    temporal-coordinator lines of `components.yaml`;
  - under (b), add a temporal-coordinator consistency check to the guard, and record the exception in the
    reference-only entry.

## Q3. Does anything outside this repository still copy `components/scope/template/` or `components/agent/template/`?

- **Statement and source:** "Template source lives in the design repo. `components/{name}/template/` is the single
  source." (`AGENTS.md:19`, from `components/scope/DECISIONS.md:60-64` and `components/agent/DECISIONS.md:48-52`).
  New scopes are "scaffolded by copying the template directory manually or via `scopectl create`"
  (`components/scope/MODEL.md:81`). Against that, the banner says "the current generic Scope/Project model lives in
  `../../scope`" (`README.md:4-5`).
- **Candidate readings:**
  - (a) The templates moved with the model to `../../scope`, and the copies here are historical.
  - (b) They are still the live copy source, for `scopectl create` or by hand.
- **A case where they lead to different work:** creating the soulbodhiwork scope, which is planned in
  `SCOPES_PLANNED.md:54-59`.
  - Under (b), it is copied from `components/scope/template/` here.
  - Under (a), it is copied from the scope repository.

  If both templates exist, they will diverge. That is the drift that got the separate `scope-template`
  repository deleted on 2026-04-03 (`DECISIONS.md:57`).
- **Recommended answer: (a),** if `../../scope` now holds a template and `scopectl create` does not read this
  repository's path. Once answered:
  - under (a), label the template folders as historical, but only from outside them, in the Status block. A note
    placed inside a template is copied into every new repository, so the patches deliberately leave these folders
    untouched.
  - under (b), the guard keeps a check on the templates, and the reference-only entry records them as the exception.
