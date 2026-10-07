# Questions for the steward

No steward was available, so each question carries the recommended answer the run continued on. Both concern
`agentic-architecture`, which its `README.md` and `AGENTS.md` banners mark as reference-only. Finding ids refer to
`assessment.md`.

## Q1. While the repository is reference-only, do the session-start ritual and the pre-commit guard stay in force?

- **The statements.** The `AGENTS.md` banner (`AGENTS.md:5-6`): "Do not extend or reinterpret this blueprint as
  current design without explicit authorization." Under it, `AGENTS.md:36-45` tells every session to build a
  current-state packet and choose "the 1-3 most plausible next actions"; `AGENTS.md:72` requires
  `skills/entropy-guard.md` before non-trivial commits; `skills/session-kickoff.md` answers "what's next?"; and the
  guard runs "At the start of an architecture session" (`skills/entropy-guard.md:18`). (F5)
- **The readings.**
  - (a) Reference-only means frozen. The ritual and the guard are dormant, and the repository is edited only, with
    authorization, to keep its status and pointers accurate.
  - (b) Authorised design work can still happen here, so the ritual and the guard stay in force for it.
- **Where they diverge.** A fresh agent opened in this repository is asked "what's next?". Today it reads
  `ROADMAP.md` and proposes, for example, fleshing out
  `components/orchestrator/scope/workflows/daily-summary/WORKFLOW.md` (`ROADMAP.md:25`) or drafting a scope-manager
  snapshot (`architecture/PICKUP.md:84-103`). Under (a) it is sent to `../personal-agent` or `../../scope`.
- **Recommended answer: (a).** The banners already name `../personal-agent` and `../../scope` as where current
  architecture lives, so new design work here would start a second home for it. The guard was last evaluated on
  2026-04-27 and predates the snapshots and the status change (F14), so keeping it in force would check the wrong
  things.
- **What the answer changes.** Whether `provisional-q1.patch` is applied. It is drafted on (a).

## Q2. When, and by whom, was the reference-only decision made, and should DECISIONS.md record it?

- **The statements.** The banners (`README.md:3-5`, `AGENTS.md:3-6`) carry no date and no attribution, and no file
  names this repository's steward. `DECISIONS.md` has no entry for the change; its latest dated entry is 2026-07-26
  (`DECISIONS.md:836`). The repository settles conflicts by "the current snapshot/index and dated decisions"
  (`DECISIONS.md:869`, `AGENTS.md:25`). (F1, F2)
- **The readings.**
  - (a) The banners are the record, and `DECISIONS.md` need not repeat them.
  - (b) The decision belongs in `DECISIONS.md`, dated and attributed, like every other conclusion here.
- **Where they diverge.** Someone later asks whether the 2026-07-26 decision making the temporal coordinator a pg-boss
  POC was taken while this repository was still current, or set aside a newer decision in `../personal-agent`.
  Under (b) the dated entry answers it; under (a) nothing can.
- **What the evidence narrows.** The change came after 2026-07-26: that is the latest dated entry, and
  `architecture/PICKUP.md` was still being updated that day. All files in the snapshot share the modification time
  2026-08-01 21:12, which suggests the banners existed by then. That is an inference from file times, not a record.
- **Recommended answer: (b),** with the date, the attribution (Justin, if he is the steward) and any reason supplied
  by the steward. Recording an existing decision is not deciding it again, but its date and author are his to give.
- **What the answer changes.** Whether `provisional-q2.patch` is applied, and the values that replace `<date>` and
  `<steward>` in it.

## Considered and not asked

None of these changes what gets built or checked while the repository is reference-only. Each would need an answer
before reactivating the repository, or before promoting the pattern concerned into `../../scope` or
`../personal-agent`.

- Which document owns open questions: `DECISIONS.md` or the snapshot's "Under Review" list (F10).
- Whether `planned` is a valid scope status (F11).
- Whether manifest entries may carry `display_name` (F12).
- Who may "clarify intent" and update settled positions (F16).
- Whether the API-key "current working decision" in `AUTH_OPTIONS_ANALYSIS.md` still stands (F18).
- Whether `Sol 0.x` is still a current named version anywhere (F3, the part left as it is).
