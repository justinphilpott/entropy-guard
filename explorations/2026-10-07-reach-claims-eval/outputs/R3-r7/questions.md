# Questions for the steward

There are two questions; the limit is five. No steward was available, so each carries the answer this run recommends,
and the run continued on that recommendation. Work that depends on an answer is in `provisional.patch` and is not
applied.

---

## Q1. Record the reference-only status as a decision, with its date and its steward?

- **Statement and source.** The banners at `README.md:3-5` and `AGENTS.md:3-6` say the repository is "Reference-only"
  and "no longer current architecture authority", and name `../personal-agent` and `../../scope` as the current homes.
  Neither banner carries a date or an author. `DECISIONS.md`, which the repo makes its decision owner, has no entry
  for the change. No file names this repository's steward: scope manifests name `justin` for scopes, not for this
  repo.
- **Readings.**
  - (a) The banner records a standing steward decision that belongs in `DECISIONS.md`, dated and attributed.
  - (b) The banners are enough as they stand, and `DECISIONS.md` stays as it is.
- **Where they diverge, in this repo.** A session following `AGENTS.md:40` ("Skim DECISIONS.md — know what's been
  concluded (especially recent entries)") finds the 2026-07-26 temporal-coordinator decision as the latest conclusion
  and nothing about the status. Under (a) it finds the status there too. The answer also fills the steward field that
  any future guard for this repo would need.
- **Recommended answer: (a).** Record one entry, quoting the banner's words, with the date it was decided and your
  name as steward. The draft is hunk P1 in `provisional.patch`; its date and name are placeholders for you to fill.
  Reason: the decision owner is the place fresh sessions are told to read, and the date and author are facts only you
  hold.

---

## Q2. Which maintenance surfaces does a reference-only repo keep?

- **Statement and source.**
  - `AGENTS.md:6` says "Do not extend or reinterpret this blueprint as current design without explicit
    authorization."
  - `AGENTS.md:36-45` still has every session read the roadmap and build a "current-state packet" with
    `skills/session-kickoff.md`.
  - `AGENTS.md:72` says to run `skills/entropy-guard.md` before every non-trivial commit.
  - That guard directs extension work: for example `skills/entropy-guard.md:32` ("Does ROADMAP.md 'working towards
    next' reflect the actual current state of component work?"), `:80` ("update ROADMAP.md progress") and `:98` (add
    open questions to DECISIONS.md).
- **Readings.**
  - (A) **Frozen reference.** Demote the guard, the kickoff skill and the session-start steps to historical. Limit
    edits to status corrections. No guard. Guard decision `none`.
  - (B) **Maintained reference.** Keep a slim guard for occasional corrections. It would check that no edit reasserts
    currency, that the banners, the `ROADMAP.md` status header and `DECISIONS.md` agree, and that the successor links
    resolve. Do the one-time cleanup of the historical inconsistencies (assessment F9-F14). Guard decision `update`.
  - (C) **Active.** Keep the existing guard and rituals as they are. This contradicts the banner, and the existing guard
    would itself need updating (assessment F7).
- **Where they diverge, in this repo.** An agent opens the repo only to fix the stale pickup line in
  `architecture/INDEX.md`. It follows `AGENTS.md:72` and runs the guard, whose check at `:32` leads it to revise the
  roadmap's "Working towards next". Under (C) that is expected. Under (A) it is extension work the banner forbids.
  Under (B) the edit is limited to the status header.
- **Recommended answer: (A), frozen reference.** Reasons:
  - The banner already rules out extension, and no record gives a reason to keep maintaining the repo.
  - Nothing dated was added after 2026-07-26.
  - The current architecture has named homes elsewhere.

  The demotion is drafted as hunk group P2 in `provisional.patch`. It also cites the Q1 entry, so apply it after P1.
