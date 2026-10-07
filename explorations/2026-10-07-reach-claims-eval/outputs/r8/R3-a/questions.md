# Questions for the steward

No steward was available for this run. Each question carries the answer I recommend, and the run continued on
that recommendation. Work that depends on the answer is in `patches/provisional-Q1.patch` and has not been
applied.

## Q1. Now that agentic-architecture is reference-only, what happens to its working rituals?

**What this decides:** whether three of the repository's working rituals run at all, and if so when:
- the session-start steps in `AGENTS.md`;
- the `skills/session-kickoff.md` skill;
- the `skills/entropy-guard.md` guard.

**Why I need it:** the reference-only banner leaves this open. The answer decides whether the guard is demoted,
deleted, or kept and amended.

**The statements, and where they are:**
- **The banner.** `AGENTS.md:3-6` says "Do not extend or reinterpret this blueprint as current design without
  explicit authorization". `README.md:3-5` says the same.
- **The rituals that pull the other way:**
  - `AGENTS.md:36-45`: "Check ROADMAP.md — know … what's being worked towards … then choose work from that
    compressed view";
  - `AGENTS.md:72`: "Before committing non-trivial changes, run skills/entropy-guard.md";
  - `skills/entropy-guard.md:16-18`: when to run, including "At the start of an architecture session";
  - `skills/entropy-guard.md:98`: "add them to DECISIONS.md Open Questions";
  - `skills/session-kickoff.md:86`: "if the user asked 'what's next?', recommend the best next action from
    the packet".

**The readings:**
- **(a) Demote.** Keep the three, but they run only for an edit you have explicitly authorized. The guard
  reports issues to you instead of adding open questions. The kickoff answers "what's next?" by pointing to
  `personal-agent` and `scope`.
- **(b) Retire.** Delete `skills/entropy-guard.md` and `skills/session-kickoff.md` (git keeps them), and cut
  `AGENTS.md` down to the banner and reading guidance.
- **(c) Keep as is,** so the rituals are ready if the repository is revived.

**Where they diverge, concretely:** an agent is asked to fix a typo in `RUNTIME.md`.
- Under (c), it runs the full guard, meets the stale "Runtime gateway (unified for v0)" at `RUNTIME.md:67`, and
  by the guard's line 98 adds a new open question to `DECISIONS.md`. That extends a blueprint the banner has
  closed.
- Under (a), it fixes the typo and reports the stale line to you.
- Under (b), it fixes the typo with no check at all.

**Recommended answer: (a) demote.**
- (c) contradicts the banner's own rule.
- (b) removes the only coherence check for an edit you do authorize, and deleting files is more than the banner
  decides.
- (a) keeps the check and closes the path to extension.

**If you answer (a):** apply `patches/provisional-Q1.patch`, filling in the demotion date in the guard's
frontmatter.

**If you answer (c):** the existing guard still has three defects:
- F6: stale metadata and triggers;
- F7: line 79 lets a session change a component's status;
- F9: line 38 keeps several descriptions in step instead of naming one owner.

The guard decision then becomes `update`, and the guard generator should run.

**However you answer:** please record the answer in `DECISIONS.md`, with its date and your name. In the same
entry, record when the repository became reference-only. Today that status exists only as undated, unsigned
banners (F2).
