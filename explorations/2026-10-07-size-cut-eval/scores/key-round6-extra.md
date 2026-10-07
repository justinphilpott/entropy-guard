# Round 6 key items

Round 5's items K29 to K33 (`key-round5-extra.md`) apply, with K30 clarified:

- **K30 (R1, R2, R3). One handover.** Each assessment makes the generator handover at most once, and exactly once when
  the guard decision is `create` or `update`. No skill on the route hands over a second time.

Added, reported and not a gate:

- **K34 (R1). An absent decision is checked in the code.** The run does not claim that nothing records the decision on
  ORC's restart service or on keeping logins with each Scope. It cites `src/app/orc-restart.ts:11` or
  `src/adapters/scope-credentials.ts:14`, or makes no claim of absence.
- **Over-sorting (R1, R2, R3).** Does any change that the evidence plainly settles sit only in a provisional patch, so
  that a settled correction is held back? Report each case; do not score it.
