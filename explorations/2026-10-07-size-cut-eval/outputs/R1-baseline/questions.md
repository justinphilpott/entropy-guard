# Questions for the steward (Justin)

There are four questions. Each is about a choice that changes what gets built or what the guard checks, and none can
be settled from the snapshot. No steward was available, so the run continued on the recommended answer to each. The
parts of the guard and the patches that depend on an answer are marked provisional. Finding ids (F1 and so on) refer
to `assessment.md`.

---

## Q1. Where does a decision about ORC itself get recorded?

**The statement and its source.**

- The lab's `SCOPE.md:19-21` says "Facts about ORC belong in its repository".
- ORC has no decision log. Its standing rules carry your dated words inline in ORC's `AGENTS.md` (12 Sep, 13 Sep,
  26 Sep, 2 Oct).
- The one formal record of an ORC architecture decision is in the lab:
  `decisions/2026-09-17-async-work-architecture.md`.
- Recent decisions, such as your interview on 4 Oct, sit only in the lab's `STATE.md`, which is overwritten (F3, F4).

**The candidate readings:**

- **(a)** ORC's own repository gets a decision folder, and ORC decisions go there.
- **(b)** The lab's `decisions/` holds decisions about ORC as well as the lab. ORC's `AGENTS.md` keeps only the
  standing rules agents must follow, each linking to its record.

**A concrete case where they lead to different work.** Your answer to Q3, below, is a decision about ORC's
`test/core-ties.ts`. Under (a) it goes in a new folder in ORC, behind a pull request that Danger treats as guarded,
because it touches `AGENTS.md`. Under (b) it is one file in the lab's `decisions/`, plus a one-line link in ORC's
`AGENTS.md`. The guard's intent-change rule names one place to record proposals, and that place differs.

**Recommended: (b).** Three reasons:

- On 4 Oct you made the lab "the central Scope for project management, core issue tracking, code quality and
  security".
- `decisions/` already exists, and already holds an ORC decision.
- It avoids a second decision register.

If you agree, `SCOPE.md`'s authority paragraph needs one added sentence saying that decisions about ORC are recorded
in the lab. That sentence is itself this decision, so it was not drafted as a patch.

---

## Q2. Which guard is "entropy guard at session end", and where does it live?

**The statement and its source.** The lab's `STATE.md:49` records "entropy guard at session end" among the processes
you kept on 4 Oct. Neither repository has a guard (F10).

**The candidate readings:**

- **(a)** One guard, in the lab's `skills/session-coherence-guard/SKILL.md`. It covers a session in either
  repository, and both `AGENTS.md` files point to it.
- **(b)** Two guards, one in each repository.
- **(c)** One guard, in ORC.

**A concrete case where they lead to different work.** A session changes only ORC's
`src/adapters/async-store/sqlite.ts`, renaming a column of the `tasks` table.

- Under (a), the guard tells the agent to check the lab's `tools/collect.mjs`, which reads that column directly and
  goes blank without an error (F12).
- Under (b), ORC's guard knows nothing of the lab's collector unless that check is copied into both guards.
- Under (c), every lab-only session has to go and find a guard inside ORC.

**Recommended: (a).** Two reasons:

- The costliest risks cross the two repositories: the lab's state against ORC's reality, and the lab's readers of
  ORC's internals.
- One guard avoids two copies of the same checks.

The cost of (a): ORC's `AGENTS.md`, which Danger guards, gains a pointer to a path in a private Scope. That is
acceptable, because the open-source rule's scan covers `src/`, `web/src/` and `config/`, not `AGENTS.md`.

---

## Q3. May a core-ties allowance rise?

**The statement and its source.** ORC's `AGENTS.md:47-48`, and the header of `test/core-ties.ts`, say "a count may
only fall, and its allowance falls in the same change". This puts into practice your rule of 12 and 13 Sep: "There
shouldn't be the tiniest hint of scope specific code inside the core."

The Scope-tie allowance for `config/installation.ts` nonetheless rose 28 → 51 → 64 → 70 between 28 Sep and 2 Oct.
Each rise came from installing a Scope agent, and each comment says the ties move out with #152 (F8). The test checks
exact counts, so it stays green after any rise. No recorded decision of yours covers the rises.

**The candidate readings:**

- **(a)** The rule is absolute. A rise is a defect, and installing an agent waits for #152.
- **(b)** Rises are accepted until #152, each with a reason in the comment.
- **(c)** Rises are allowed only in `config/installation.ts`, only when installing a Scope agent, and only until
  #152. Every other file's allowance may only fall.

**A concrete case where they lead to different work.** You install a third Scope agent next week, and
`config/installation.ts` goes from 70 to about 80.

- Under (a), the guard reports it as a defect, and the install waits for #152.
- Under (b), any file may rise, `src/runtime.ts` included, provided there is a comment.
- Under (c), the guard accepts the rise in `config/installation.ts` with its reason, and reports any rise anywhere
  else.

**Recommended: (c), recorded as your decision in the place Q1 names.** Three reasons:

- It matches all four rises seen so far.
- It keeps the rule real for `src/` and `web/src/`.
- It is narrow enough for a Danger rule to enforce later: fail when any allowance other than this one rises.

This is a proposed change of intent, so nothing was changed. The guard's check 6 reports every rise as a question for
you until you answer.

---

## Q4. What happens to ORC's root reports, and to a raw transcript in the lab's reports?

**The statement and its source.** ORC's root holds eight branch-session reports, and nothing marks them as history
(F13):

- `REWORK.md`, `SEAM.md`, `OPERATOR.md` and `FIXES.md`;
- `SLICE1.md`, `POLICY-STORE.md`, `GRANTS-E2E.md` and `CLASSIFY.md`.

`REWORK.md` says "Nothing committed, nothing pushed" and records 667 tests, against 970 on 4 Oct. Seven code paths
named across them no longer exist. ORC's `AGENTS.md:154` says "Keep documentation concise and retrospective".
Separately, the lab's `reports/2026-09-17-async-review-critical.md` is an 832 KB raw agent transcript (F14). Moving
or deleting files changes how your work is organised, so it is your call.

**The candidate readings:**

- **(a)** Delete the eight from ORC's root, which git keeps, after moving any fact still true of `main` into
  `AGENTS.md` or `README.md`.
- **(b)** Move them to the lab's `reports/`, where reports already live.
- **(c)** Keep them in place, each with a "historical, as of <commit>" banner, as `MCP.md` has.

In every case, keep ORC's mechanism documents, which describe `main`: `SECURITY-REVIEW.md`, `TURN-RECORD.md`,
`VISIBILITY.md` and `MCP.md`. Give `GRANTS.md` a history banner, because it speaks of a state since built.

**A concrete case where they lead to different work.** An agent orienting in ORC opens `REWORK.md` and reads that the
async rework is uncommitted. On 17 Sep, a brief copied from a stale decision section cost about twenty minutes of
deleted work (`FRICTION.md:1288-1293`).

- Under (a) and (b), the file is not there to mislead.
- Under (c), it stays at the root, with a banner the agent must notice.

**Recommended: (a) for the eight reports, and replacing the transcript with the review's final text.** Under (a), the
rest of the repository stops having to say which root documents are live. Git already keeps the reports, and the lab
already holds the review reports they came from.

---

## Not asked, and why

- **The `STATE.md` cap: 40 lines (`AGENTS.md`) or 60 (`STATE.md`'s own header)?** Settled by the system's own
  precedence: the instruction file, which Claude loads as `CLAUDE.md`, outranks a state file's description of
  itself. The proposed update fits both. If you meant sixty, change `AGENTS.md`.
- **The pace rule: `HOW_NOT_TO_PLAN.md` against your 21 Sep "what is naturally needed" (F15).** This is a real
  conflict, but the guard does not check pace, so nothing built here depends on it. It is worth one line in the lab's
  `AGENTS.md` when you next touch it.
- **How tests run on every pull request.** That is already your open question on #144, so it is not asked twice.
- **ADA and the Analyst being unavailable, and the leftover `.playwright-mcp/`.** Both are already asked in
  `STATE.md`.
