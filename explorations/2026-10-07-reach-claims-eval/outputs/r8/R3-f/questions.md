# Questions for the steward

No steward was available for this run. Each question below has the answer I recommend, and the run continued on that
recommendation. The work that depends on an answer is drafted as a provisional patch and is not to be applied until
the steward answers. Answers belong in `DECISIONS.md`, dated and attributed. Ask them one at a time, in this order.

---

## Q1. Does the reference-only banner cover the temporal coordinator contract?

**The statements, and where they are.**
- `README.md:5`: "Do not treat decisions in this repository as current authority."
- `AGENTS.md:3-6`: "this repository is no longer current architecture authority … Do not extend or reinterpret this
  blueprint as current design without explicit authorization."
- Five places still call the temporal coordinator contract here authoritative:
  - `components/temporal-coordinator/SPEC.md:3`: "Status: V0 pg-boss POC implementation spec";
  - `SCHEDULING.md:20`: "The authoritative event and data contract is components/temporal-coordinator/SPEC.md";
  - `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md:6`: "Current authority is SPEC.md and the one-time
    POC implementation plan in the sibling implementation repository";
  - `architecture/snapshots/2026-07-16-orchestration/ARCH.md:41`: "Authoritative shape: SPEC.md";
  - `DECISIONS.md:847`: "The full contract is SPEC.md".
- The banner names new homes only for the Personal Agent architecture (`../personal-agent`) and for the Scope/Project
  model (`../../scope`). It does not name one for the temporal coordinator.

**The readings.**
- **A.** The banner covers the whole repository. `SPEC.md` is a reference copy as of 2026-07-26, and the live
  temporal coordinator contract is owned somewhere else.
- **B.** The banner covers the architecture and the scope model only. `SPEC.md` remains the live contract for the
  `temporal-coordinator` implementation.

**A case where they diverge.** Someone working in the temporal-coordinator implementation wants to add a delivery
worker.
- Under A, they record the contract change where TC authority now lives. `SPEC.md:139` ("No deferred delivery … or
  worker capability is part of V0") is history.
- Under B, they must first change `SPEC.md` here. A guard would then need to check `SPEC.md` against the
  implementation in another repository. That would change this run's guard decision from `none` towards a narrow
  `create`.

**Recommendation: A.**
- The banner's words are unqualified: "decisions in this repository".
- A live contract inside a repository whose working loop is being demoted (Q2) would have no maintainer.
- `INTERFACE_REFINEMENT_PLAN.md:6-7` already gives the contract a second home in the sibling repository.
- Please also name where the live contract is owned. `provisional-q1.patch` leaves a visible placeholder for it,
  because this run could not read the sibling repository.
- If you answer B, the banner should say so explicitly, for example "except `components/temporal-coordinator/SPEC.md`,
  which remains the live TC contract". The guard decision should then be revisited.

**Depends on it:** `patches/provisional-q1.patch`, and the unresolved wording in finding F19 (`MODEL.md:88`
"staged separately").

---

## Q2. Should the active-repository rituals in `AGENTS.md` be demoted?

**The statements, and where they are.**
- **Session start** (`AGENTS.md:36-45`): "Check ROADMAP.md — know what version we're on and what's being worked
  towards … Run skills/session-kickoff.md … Build the current-state packet first, then choose work from that
  compressed view."
- **Working practices** (`AGENTS.md:72`): "Before committing non-trivial changes, run skills/entropy-guard.md".
- **The guard's standing instruction** (`skills/entropy-guard.md:116`): "If you are committing non-trivial changes to
  this repo, run this checklist before committing."
- **Against them**, the banner (`AGENTS.md:3-6`): "Do not extend or reinterpret this blueprint as current design
  without explicit authorization."

**The readings.**
- **(a) Keep both unchanged.** Sessions here still build the current-state packet and run the full guard, for
  whatever corrections are made.
- **(b) Demote both.** Replace them with a short reference-only rule: corrections only, each citing the
  `DECISIONS.md` entry that settles it. Keep the two skills as history.
- **(c) Freeze the repository.** No sessions here at all, not even corrections.

**A case where they diverge.** A session opened here is asked "what's next?".
- Under (a), it builds the packet from `ROADMAP.md` and proposes the first unchecked item, "Workflow requirements
  derived … start by fleshing out `components/orchestrator/scope/workflows/daily-summary/WORKFLOW.md`". That extends
  the blueprint the banner says not to extend. At commit it then runs a guard last evaluated on 2026-04-27. That guard
  does not know the snapshots, the temporal coordinator or the reference-only status. One of its repairs,
  `skills/entropy-guard.md:79` ("If a component's status has changed, update components.yaml"), would change catalog
  statuses that `AGENTS.md:71` reserves for explicit instruction.
- Under (b), the session points the reader to `../personal-agent` or `../../scope`, and makes only cited corrections.
- Under (c), it makes no changes. Even the stale lines corrected by `patches/settled.patch` would stay.

**Recommendation: (b).**
- The banner already forbids extending the repository, and these rituals exist to choose and check new design work.
- The guard is stale (finding F6d).
- Corrections that make the reference agree with its own dated decisions are still worth making. The repository's
  own rules ask for them: `AGENTS.md:26` ("No stale docs") and `DECISIONS.md:857`.
- If you choose (a), the guard decision becomes `update`: the guard needs refreshing for findings F6a to F6d. If you
  choose (c), drop `patches/settled.patch` as well.

**Depends on it:** `patches/provisional-q2.patch`.

---

## Q3. Who set the reference-only banner, and when?

**The statements, and where they are.**
- The banners at `README.md:3-5` and `AGENTS.md:3-6`. Both are undated and unattributed. No `DECISIONS.md` entry
  records the change.
- No document names this repository's steward.
- The evidence points to Justin:
  - `components/orchestrator/scope/scope.yaml:6` (`steward: "justin"`) and the admin member at `:37`;
  - `SCOPES_PLANNED.md:12`;
  - the `justinphilpott` remotes;
  - `runs/001-moving-stillness-status/RUN.md:41` ("Justin's ChatGPT Plus subscription").
- `AGENTS.md:6` asks for "explicit authorization" without saying from whom.

**The readings.**
- **(i)** The steward is Justin alone, and he set the banner on a date he can give.
- **(ii)** Someone else can also authorise work here, such as a collaborator or another repository's owner.

**A case where they diverge.** An agent is asked by someone other than Justin to "extend the blueprint" here.
- Under (i), it needs Justin's authorization.
- Under (ii), the other person's request may be enough.

Separately, the repository's own conflict rule, "resolve by current snapshots/index and dated decisions"
(`AGENTS.md:25`), cannot place an undated banner against the dated entries. One example: the 2026-07-26 entry calling
`SPEC.md` "the full contract".

**Recommendation: (i).**
- Justin is the steward.
- Record the banner's date as the date the current authority moved to `../personal-agent` and `../../scope`.
- `patches/settled.patch` adds a `DECISIONS.md` entry that copies the banner and says its date and author are not
  recorded. Your answer replaces that header with the date and your name.
- The settled entry does not depend on this answer. Only its header does.

**Depends on it:** the header of the `DECISIONS.md` entry in `patches/settled.patch`, and the "explicit
authorization" wording that `provisional-q2.patch` relies on.
