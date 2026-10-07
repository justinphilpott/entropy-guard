# Questions for the steward

Two questions, asked under `intent-pass.md` step 4. No steward was available, so each carries the answer I recommend,
and the work that depends on it is drafted as a provisional patch, not applied. Finding ids refer to `assessment.md`.

The steward is taken to be Justin, inferred from ownership evidence rather than stated anywhere in the repository
(finding F16).

## Q1. What does "reference-only" permit in this repository?

**The statement and its source.** README.md lines 3-5: "Reference-only. Current Personal Agent architecture lives in
`personal-agent`, and the current generic Scope/Project model lives in `scope`. Do not treat decisions in this
repository as current authority." AGENTS.md lines 3-6 adds: "Do not extend or reinterpret this blueprint as current
design without explicit authorization." Neither banner is dated or attributed.

**The readings.** The banners rule out extending the design. They do not say whether the existing record is still
kept coherent.

- **(a) Frozen record.** Only status and pointer corrections are made. Known inconsistencies between the documents
  are listed, not fixed. The existing guard, `skills/entropy-guard.md`, and the AGENTS.md line 72 instruction to run
  it before every non-trivial commit are demoted.
- **(b) Maintained reference.** Inconsistencies are cleaned so that the record stays coherent. The existing guard is
  kept and amended, which changes the guard decision from `none` to `update`.

**One case where they diverge.** RUNTIME.md line 67 still says "Runtime gateway (unified for v0)". That wording was
superseded on 2026-07-16 (DECISIONS.md line 575; the orchestration v1 snapshot, ARCH.md line 22), and
architecture/PICKUP.md line 15 claims it had already been cleaned up (F7).
- Under (a), the line stays, covered by the repository-wide status note.
- Under (b), it is rewritten (`provisional-Q1b-maintained.patch`). The orchestrator-authority conflict (F8) then also
  needs a decision from you, because two recorded positions disagree and no dated decision settles which wins.

**Recommended answer: (a).** The banners already moved current authority to `personal-agent` and `scope`. Cleaning
the roughly 12 inconsistencies here (F7 to F14) would keep a second model in step that nothing treats as authority.
This repository's own decision of 2026-04-02 (DECISIONS.md lines 113-125) names drift between a map and its
territory as the hardest kind to see. A pre-commit guard that keeps checking "does ROADMAP 'working towards next'
reflect the actual state" also invites the extension the banners forbid.

**What it changes.** It decides which provisional patch applies: `provisional-Q1a-frozen.patch` for (a), or
`provisional-Q1b-maintained.patch` for (b). It also decides whether the guard decision stays `none` or becomes
`update`.

## Q2. Which repository now owns the concepts the banners do not name?

**The statement and its source.** The banners name successors for only two things: "Personal Agent architecture"
(`../personal-agent`) and "the Scope and Project model" (`../../scope`). Three concepts are still presented here as
authoritative or as the single source:
- **The temporal coordinator contract.** `components/temporal-coordinator/SPEC.md` is "authoritative" (DECISIONS.md
  line 830) and "the full contract" (DECISIONS.md line 847, MODEL.md line 88, SCHEDULING.md line 20).
- **The template sources.** AGENTS.md line 19 says "`components/{name}/template/` is the single source".
- **Layer 1 of the five-layer stack.** MODEL.md line 31 says it is `agentic-architecture`.

**The readings.**
- **(a)** These concepts moved with the successor repositories, or to the `temporal-coordinator` repository.
- **(b)** They remain authoritative here, as exceptions to the banners.

**One case where they diverge.** An agent working in the temporal-coordinator implementation repository follows
`components.yaml` line 29 (`implementation: ../temporal-coordinator`) back to this repository and treats SPEC.md as
its contract.
- Under (a), SPEC.md should send it to the new owner.
- Under (b), SPEC.md stays current and the banners need an exception note.

**Recommended answer: (a)**, with the owner named for each concept. A hint, not evidence: the superseded plan
`components/temporal-coordinator/INTERFACE_REFINEMENT_PLAN.md` lines 6-7 already points to a plan inside the
`temporal-coordinator` repository for the V0 work. Until you answer, I have not guessed an owner. The draft
`provisional-Q2-successors.patch` carries a placeholder, `<OWNER NAMED BY THE STEWARD>`.

**What it changes.** It decides the pointer text in SPEC.md and SCHEDULING.md (`provisional-Q2-successors.patch`). It
also decides whether the "That list is incomplete" caveat in the settled ROADMAP.md and DECISIONS.md text can be
replaced by the actual successors.

## Not asked

- **The banners' date and author.** Evidence cannot settle them, but the only work they change is one heading in the
  DECISIONS.md entry. That entry therefore says plainly that both are unrecorded (see Uncertainties in
  `assessment.md`).
- **F8, F9, F10 and F11 (conflicts and drift between recorded positions).** These change what gets built only if Q1
  is answered (b). If it is, F8, the orchestrator's authority, is the first question to ask. Otherwise they stay
  listed and are not fixed.
