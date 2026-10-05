# Questions for the steward

The steward is Justin, by inference (see `assessment.md`, section 1). He was not available, so each
question carries a recommended answer, the run continued on that recommendation, and the outputs that
depend on it are marked provisional. Ask them one at a time, in this order: Q2 and Q3 mostly follow
from Q1.

The recommended answers are also written into `decisions-proposal.patch`, a `DECISIONS.md` entry marked
"PROPOSED, awaiting Justin". When he answers, his recorded answer replaces that entry.

---

## Q1. Is the reference-only status authorised, and which changes may still be made here?

**The statement and its source.** The banners at `README.md:3-5` and `AGENTS.md:3-6` say: "Reference-only
… Current Personal Agent architecture lives in `../personal-agent`; the current Scope and Project model
lives in `../../scope`. Do not extend or reinterpret this blueprint as current design without explicit
authorization." They are undated and unattributed, and no `DECISIONS.md` entry records them. Against
them stand:

- `AGENTS.md:8`: "This repo holds the current architecture state";
- `README.md:9`: "Bleeding-edge design source";
- the 2026-04-23 entry at `DECISIONS.md:137`.

**The candidate readings:**

- (a) Authorised, and frozen. The only permitted changes are corrections citing a decision, pointers to
  the repository that now owns a concept, and moves into `archive/`.
- (b) Authorised, but still maintained. No new design, but hygiene passes, run records and finishing
  in-flight items are allowed.
- (c) Not authorised, or a draft. The repository is still the Level 1 design source, and the banner
  should go.

**A case where they lead to different work.** `runs/001-moving-stillness-status/RUN.md:116-120` asks for
a new decision, "Pi's event types are the v0 runtime event/action log schema", and for `ROADMAP.md:26` to
be ticked. Under (a), an agent must not do that here; if it is done at all, it is done in
`../personal-agent`. Under (b), it could be done here as finishing the record. Under (c), it is ordinary
work, and the old guard would also ask for `components.yaml` and `ROADMAP.md` progress updates
(`skills/entropy-guard.md:79-80`).

**Recommended answer: (a).** The reasons:

- The banner itself says no decision here is "current authority". A new decision written here would
  carry no authority by the repository's own statement.
- It names successor repositories.
- It sits in both files every agent loads first. `CLAUDE.md` is a symlink to `AGENTS.md`, and Pi
  auto-loads both.
- The run line is paused (`runs/README.md:7-9`), and nothing is dated after 2026-07-26.

**What depends on this:**

- the guard's Intent section and its "permitted kinds of change";
- the `ROADMAP.md` status section;
- the `DECISIONS.md` proposal, points 1, 2 and 5;
- the `AGENTS.md` and `skills/session-kickoff.md` edits in `integration.md`.

---

## Q2. Does this repository stay where it is as a consulted reference, or move to `~/pro-archive/`?

**The statement and its source.** `DECISIONS.md:174-178` (2026-04-04): "`~/pro-archive/` holds
completed/superseded projects." The run commands show the repository at
`~/pro/agentic/agentic-architecture` (`runs/001-moving-stillness-status/RUN.md:29`). The banner says
"reference-only", not "archived".

**The candidate readings:**

- (a) It stays in place, as a reference that is still consulted.
- (b) It is superseded, and moves to `~/pro-archive/`.

**A case where they lead to different work.** Under (a), the refined guard, the `ROADMAP.md` status
section and the one-time correction pass are worth doing, because agents will keep reading the
repository. The correction pass is bootstrap action B5: 10 files, each corrected from the decision it
cites. Under (b), only the status record is worth doing. The guard is retired with the move, B5 is
skipped, and links from other repositories to `../agentic-architecture` need a sweep.

**Recommended answer: (a), for now.** The banner was written to redirect readers who still arrive here,
which says the repository is still being consulted. The temporal coordinator contract may still be read
from here (Q3). Moving it is a change to Justin's directory layout, and its cost is a sweep of links in
other repositories. Revisit once Q3 is settled and nothing points here.

**What depends on this:**

- whether the guard is adopted at all;
- bootstrap actions B5 and B6;
- point 3 of the `DECISIONS.md` proposal.

---

## Q3. Is the temporal coordinator's contract now owned by its own repository?

**The statement and its source.** These say `SPEC.md` in this repository is the authority:

- `SCHEDULING.md:20`: "The authoritative event and data contract is
  `components/temporal-coordinator/SPEC.md`";
- `DECISIONS.md:847` (2026-07-26): "The full contract is `SPEC.md`".

These point the other way:

- `components.yaml:31` puts the implementation at `../temporal-coordinator`;
- `components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md:6-7` names "the one-time POC
  implementation plan in the sibling implementation repository" as current authority;
- the banner says no decision here is current authority, but names successors only for the Personal
  Agent architecture and the Scope model, not for the temporal coordinator.

**The candidate readings:**

- (a) `SPEC.md` here stays the coordinator's authoritative contract, because the banner does not
  mention it.
- (b) The `temporal-coordinator` repository owns its contract. `SPEC.md` and `SCHEDULING.md` here are
  the last blueprint copies.
- (c) It moved into `../personal-agent` along with the rest of the Personal Agent architecture.

**A case where they lead to different work.** Take the next coordinator change, such as adding the
delivery worker that `SPEC.md:125-140` rules out of V0. Under (a), it starts with an edit to `SPEC.md`
here, which the banner forbids without authorisation, so every coordinator change needs a recorded
authorisation in this repository. Under (b), it is made only in `../temporal-coordinator`, and the
guard's one-owner check treats any edit to `SPEC.md` here as a second copy. Under (c), the pointer goes
to `../personal-agent` instead.

**Recommended answer: (b).** The reasons:

- `INTERFACE_REFINEMENT_PLAN.md` already sends readers to the implementation repository's own plan.
- Keeping the contract in a frozen repository would force an edit in two repositories for every change.
  `DECISIONS.md:109` (2026-04-02) records exactly that cost: "Two design repos for one system created a
  reconciliation burden with no compensating benefit."

Check this first: it was not possible from here to see whether `../temporal-coordinator` holds its own
specification.

**What depends on this:**

- the temporal coordinator line in the guard's one-owner check, marked provisional;
- point 4 of the `DECISIONS.md` proposal.
