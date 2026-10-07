# Questions for the steward: agentic-architecture

No steward was available, so each question below carries its recommended answer, and the run continued on that
recommendation. The work that depends on an answer is drafted as a provisional patch in `patches/` and has not been
applied. The settled patch records these four questions as open in the target's `DECISIONS.md`, under "About this
repository's status", without answering them. Finding ids (F-xx) refer to `assessment.md`.

## Q1. When was the reference-only status decided, so `DECISIONS.md` can record it as a dated decision?

- **Statement and source.**
  - `README.md` lines 3-5: "Status: Reference-only ... Do not treat decisions in this repository as current
    authority."
  - `AGENTS.md` lines 3-6: "this repository is no longer current architecture authority ... Do not extend or
    reinterpret this blueprint as current design without explicit authorization."
  - Neither is dated or attributed, and `DECISIONS.md` has no entry for the status (F-01). The repository has no
    named steward either (F-02).
- **Readings.**
  - (a) It is your decision, and needs only a dated record.
  - (b) It is not yet your decision, for example a banner an agent added that you have not confirmed.
- **Where they diverge.** The repository resolves conflicting records by "dated decisions" (`AGENTS.md` 25,
  `DECISIONS.md` 869). An undated banner cannot be placed in that order. A later session that finds
  `ROADMAP.md`'s "Working towards next" list beside an undated banner has no record to tell it which wins.
- **Recommended answer: (a).** Give the date, and the entry records you as the steward. If the date is not known,
  record "date not recorded; after 2026-07-26, the latest dated change in the repository".
- **Reason.** Both banners agree, they sit in the two files every session reads first, and they name a successor that
  nothing else in the repository mentions. That is a deliberate status change, not drift.
- **What the answer changes.** `patches/provisional-Q1.patch`: a dated entry at the top of `DECISIONS.md`, Q1
  removed from Open Questions, and both banners linked to the entry.

## Q2. What does "reference-only" permit: is the repository frozen, or maintained as a coherent reference?

- **Statement and source.** The banners settle that the repository is not current authority and must not be extended
  without your authorization. They do not say whether it is still maintained. Meanwhile:
  - `AGENTS.md` 72 still mandates running `skills/entropy-guard.md` before commits;
  - that guard asks whether `ROADMAP.md` "reflect[s] the actual current state" (line 32);
  - the guard runs "At the start of an architecture session" (line 18);
  - the guard adds new open questions to `DECISIONS.md` (line 98);
  - `AGENTS.md` 65-66 ask for `MODEL.md`, `components.yaml` and `MANIFEST.md` to be kept current (F-05).
- **Readings.**
  - (a) **Frozen:** only corrections of factual errors, each citing its evidence, and marking material historical.
    The guard is kept as a record and not run, and the state files are not kept current.
  - (b) **Maintained reference:** the guard keeps running and the state files stay current, but nothing new is
    designed here.
- **Where they diverge.** Take `ROADMAP.md` lines 36-37, 54, 58 and 63, which list questions that `DECISIONS.md`
  resolved on 2026-04-27 (F-11). Under (a) they stay as they are, flagged in the new status block. Under (b) they must
  be ticked, and the "Working towards next" list must be checked against work in `../personal-agent`, which this
  repository does not track. The existing guard would also need rebuilding: it carries a stale `system_snapshot` and
  repair paths that need the steward's eye (F-06, F-07).
- **Recommended answer: (a) frozen.**
- **Reason.** The banner says current architecture lives elsewhere. Keeping a second state file current for work
  that happens in another repository is the cross-repository reconciliation burden that `DECISIONS.md` 2026-04-02
  rejected ("Two design repos for one system created a reconciliation burden with no compensating benefit").
- **What the answer changes.**
  - (a) applies `patches/provisional-Q2.patch`: the existing guard is demoted, the `AGENTS.md` mandate is replaced,
    `ROADMAP.md` and `components.yaml` are marked as not kept current, and a `DECISIONS.md` entry is added. The guard
    decision stays `none`.
  - (b) discards that patch, and the guard decision becomes `update` (`assessment.md` section 12).

## Q3. Who owns the templates and the reference role now?

- **Statement and source.**
  - `AGENTS.md` 19: "`components/{name}/template/` is the single source."
  - `components/scope/skills/scope-design.md` 122: scaffold "by manual copy from `components/scope/template/`".
  - Against these, the `README.md` banner says "the current generic Scope/Project model lives in `scope`" (F-14).
  - Run 002 copied `roles/professional-presence-profile-editor/` into the live scope repository. Its line 241 records
    that a later change needed "updating both the live copied role and the architecture repo reference role" (F-15).
- **Readings.**
  - (a) The templates and the reference role here remain the source.
  - (b) `../../scope` owns the scope template, and some named home owns the role and binding template. The copies
    here become dated references.
- **Where they diverge.** Five scopes in `SCOPES_PLANNED.md` are not yet instantiated: soulbodhiwork, josh, tools,
  planning and life-integration. A session that follows `scope-design.md` today scaffolds the next one from this
  repository's template. If `../../scope` has moved the schema on, that new scope starts out of date.
- **Recommended answer: (b).** The scope template's source is `../../scope`. You name the home of the role and binding
  template; I could not read the sibling repositories to propose one. The live role owns
  `professional-presence-profile-editor`, and the copy here is a dated reference that is not kept in step.
- **Reason.** The banner moves the Scope/Project model to `../../scope`, and a template instantiates that model.
  Keeping two sources in step is the "sync obligation and drift vector" that `DECISIONS.md` 2026-04-03 removed by
  deleting `scope-template`.
- **What the answer changes.** `patches/provisional-Q3.patch`, with `<HOME NAMED BY STEWARD>` filled in.

## Q4. Does the repository stay in `~/pro/agentic/`, or move to `~/pro-archive/`?

- **Statement and source.** `DECISIONS.md` 176: "`~/pro-archive/` holds completed/superseded projects." The banners
  say current architecture lives elsewhere, but call this repository "reference-only", not superseded or archived
  (F-16).
- **Readings.**
  - (a) "Reference-only" is a state of its own, and the repository stays where it is.
  - (b) It counts as superseded, and the layout decision moves it to `~/pro-archive/`.
- **Where they diverge.** The banners' links `../personal-agent` and `../../scope` resolve only from
  `~/pro/agentic/agentic-architecture`. So do the paths in `components.yaml` and the `README.md` "Related" table. A
  move breaks all of them, and breaks any links into this repository from the sibling repositories, which I could not
  read.
- **Recommended answer: (a), stay for now.** Record the choice with Q1's entry. Revisit when no sibling repository
  links here.
- **Reason.** Your wording, "reference-only", differs from the layout decision's "superseded", and a move is a
  structural change whose effect on the successor repositories is unknown.
- **What the answer changes.** No patch. A move would be a separate change that you authorise.

## Considered and not asked

These change nothing built here under the recommended Q2 answer. They are recorded as findings, and the first two are
named in the `ROADMAP.md` status block so the successor repositories can pick them up.

- **F-12.** Orchestrator access: "no secrets and no scope repo access" (`DECISIONS.md` 2026-04-06), against "scope
  access ... mode-tunable" (`MODEL.md` 78, snapshot v1). This is a privacy boundary. If you answer Q2 "maintained",
  ask it next.
- **F-13.** Who owns open questions: the `DECISIONS.md` registry, or the snapshot's "Under Review"?
- **F-19.** `AUTH_OPTIONS_ANALYSIS.md` records a "Current Working Decision" for direct API-key authentication, but
  all three runs used the Codex subscription through Pi.
