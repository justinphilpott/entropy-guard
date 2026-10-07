# Integration advice

**No integration step on this route.** The guard decision is `none`, because the repository is reference-only. So
`entropy-assessment` Step 4 hands nothing to `session-coherence-skill-generator`, and the generator's `none` branch
("stop. Report that no guard change is needed, and why") never hands to `guards-integrator`. The integrator skill was
not opened, and no guard was generated or refined.

What this assessment proposes for the repository's working loop instead:

- **Settled now (`settled.patch`).** These are status corrections and a state-file header (assessment F3-F5). They
  change no adoption point: no hook, instruction or ritual is added or removed.
- **Provisional (`provisional.patch`, P2, waiting on Q2 and Q1).** This takes the existing guard out of the loop. It
  replaces the pre-commit instruction at `AGENTS.md:72`, marks the session-start steps historical, and puts historical
  status lines on `skills/entropy-guard.md` and `skills/session-kickoff.md`. Nothing needs uninstalling: the guard was
  never wired to a hook, and the snapshot has no `.githooks/` directory.
- **Nothing to install or verify for adoption.** Under the recommended answer to Q2 (frozen reference), the only guard
  surface left is the pair of banners, plus the `DECISIONS.md` entry once Q1 is answered.

If the steward answers Q2 with "maintained reference", rerun from `entropy-assessment` Step 3 with the decision
`update`. The generator would then build the slim guard from the inputs listed in assessment section 10 (with the
steward from Q1), and hand it to `guards-integrator` for integration advice.
