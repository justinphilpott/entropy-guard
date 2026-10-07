# Proposed entries for the lab's `decisions/`, awaiting Justin

The intent pass says to record answers and proposals in the target's existing decision surface. It also says the
intent documents change only after the steward's recorded decision. The lab's existing decision surface is
`decisions/`, which holds one file. That choice is itself Q1.

Each entry below is a draft, marked **Proposed**. It becomes a decision only when Justin records it, in his own words.
The answers drafted here are this run's recommendations, not his.

---

## P0. Record the decisions of 3 and 4 October outside `STATE.md`

**Status:** proposed. This needs no new decision: it copies decisions Justin has already made, word for word, out of
a file that is overwritten. It depends on Q1 only for where they go.

**Proposed file:** `decisions/2026-10-04-central-scope-and-kept-processes.md`

> # Decision: the lab is the central Scope, and nine processes are kept
>
> Decided by Justin on 2026-10-04, in an interview; written by `<agent>` from `STATE.md` as it stood at 17:31 that
> day.
>
> - The lab is the central Scope for project management, core issue tracking, code quality and security.
> - A Scope's issues stay in its own repository, on one central map. A `core` label marks a Scope issue that needs
>   ORC's core changed.
> - The processes kept, all of them:
>   - map and label check;
>   - tests on every PR (#144);
>   - the security-review and package-API checks;
>   - daily diary;
>   - weekly adversarial review;
>   - entropy guard at session end;
>   - FRICTION into rules, monthly (#60);
>   - branch and worktree cleanup (#70);
>   - `/tmp` cleanup (#182).
> - ORC scheduling (#166) is built first, and the scheduled processes run through it.
> - Moving Stillness is paused.
>
> Also recorded from `STATE.md`, Justin's decisions of 3 Oct:
>
> - #194 keeps all six preview items;
> - MS `failure-verdicts` is dropped;
> - MS #52 reads every entry-list page.

`STATE.md` then keeps one line in place of these: "Decisions of 3-4 Oct: `decisions/2026-10-04-…`".

## P1. Where steward decisions are recorded (answers Q1)

**Status:** proposed. This is the recommended answer to Q1, not Justin's.

> Every decision Justin takes about ORC, the lab or how agents work here goes into `decisions/`, one file per
> decision, dated and attributed, naming any decision it supersedes. `STATE.md` links to decisions and never holds
> them. ORC's `AGENTS.md` may quote a decision that constrains its code, with a link to the file here.

**What it supersedes:** nothing recorded. It settles the ambiguity in `SCOPE.md:19` ("Facts about ORC belong in its
repository") for decisions. Facts stay where `SCOPE.md` puts them; decisions come here.

## P2. The session-end guard: where it lives and what it covers (answers Q2)

**Status:** proposed. This is the recommended answer to Q2, not Justin's.

> The entropy guard at session end is `skills/session-coherence-guard/SKILL.md` in this Scope. It covers any session
> that changes ORC or this Scope. Both repositories' `AGENTS.md` point to it. It holds checks and pointers only.
> Current state stays in `STATE.md`, and rules owned by local-config stay there.

## P3. Superseded in part: the async decision's idempotency vocabulary

**Status:** proposed. This is a vocabulary drift the intent pass found, with no steward record covering it.

- **What the decision of 2026-09-17 declares:** "**idempotency**: `natural`, `keyed` (with the key), or `none`"
  (`decisions/2026-09-17-async-work-architecture.md:47`).
- **What ORC enacted on 17 Sep:** the field was split into `repeatEffect` and `submissionKey` (ORC commit `79a33ef`;
  ORC `FIXES.md:13`). The split came from the adversarial review `reports/2026-09-17-async-review-conflation.md`.

**Proposed note,** appended to the 2026-09-17 decision once Justin agrees:

> Superseded in part, `<date>`, Justin: "idempotency" is two declarations, `repeatEffect` (whether running the effect
> twice is safe) and `submissionKey` (whether each submission must be named). See ORC `79a33ef` and
> `reports/2026-09-17-async-review-conflation.md`.

**What happens if Justin does not agree:** the code is the defect, and an issue is filed on the map to restore the
declared vocabulary. The decision record is not edited to match the code until he decides.

## P4. ORC's root branch reports (answers Q3)

**Status:** proposed. This is the recommended answer to Q3, not Justin's. It changes how ORC's files are organised,
so it waits for his yes.

> The seven branch reports at ORC's root are removed: `REWORK.md`, `SEAM.md`, `OPERATOR.md`, `FIXES.md`, `SLICE1.md`,
> `POLICY-STORE.md` and `GRANTS-E2E.md`. Git keeps them. Any decision one of them holds that is recorded nowhere else
> moves first into `decisions/`, or into ORC's `AGENTS.md` if it constrains code. Any whose reasoning would otherwise
> be lost moves instead to a history folder, with a "superseded by" line. The reference documents stay: `GRANTS.md`,
> `MCP.md`, `CLASSIFY.md`, `TURN-RECORD.md`, `VISIBILITY.md` and `SECURITY-REVIEW.md`.

## P5. The cap on `STATE.md` (answers Q4)

**Status:** proposed. This is the recommended answer to Q4, not Justin's.

> `STATE.md` is capped at about forty content lines. The number is written once, in `AGENTS.md`, "Keeping state". The
> header of `STATE.md` points there.
