# Round 7 key items

Round 5's items K29 to K33 (`key-round5-extra.md`) and round 6's K34 (`key-round6-extra.md`) apply, with two
clarifications:

- **K3** covers "scheduling" and the Bookwhen token. "Workflow execution" belongs to K21, which requires it left open;
  do not mark K3 down for leaving "workflow execution" unexamined or unchanged.
- **K30 (R1, R2, R3). One handover.** At most once, and exactly once when the guard decision is `create` or `update`.

Added, and a gate:

- **K35 (R1). ORC's reach is stated from a recorded search.** Every claim the run makes, keeps or reports consistent
  about everything ORC reaches over the network or launches, in findings, in lists of things checked, or in any patch:
  - includes the Chromium launched from `src/adapters/browser/playwright.ts` (`chromium.launch`), credited to ORC's
    own process, or is marked incomplete;
  - has its search recorded beside it: the patterns, the paths and the hits.

  Met: both, everywhere. Partly met: the browser is present and correctly owned everywhere, but a search record is
  missing. Not met: any such claim leaves out the browser or credits its reach to packages, without being marked
  incomplete.

Reported, not scored: over-sorting (any change the evidence plainly settles that sits only in a provisional patch).
