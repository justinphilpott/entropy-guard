---
title: "Synthesis of two reviews of entropy-guard's skills"
date: 2026-10-04
participants:
  - Justin Philpott
  - Claude Opus 5.5
  - GPT 6.1 Astra
type: review-synthesis
status: approved by Justin on 2026-10-04 ("go ahead with the revision")
---

# Synthesis of two reviews of entropy-guard's skills, 4 October 2026

Two independent reviews of this repository's skills were written on 4 October, ahead of running them on ORC:

- **Claude's review:** `2026-10-04-skills-review.md`.
- **Astra's review:** `2026-10-04-skills-review-astra.md`. Astra did not see Claude's review.

Claude checked every file and line Astra cited, and all of them hold. The list of what was checked is at the top of
Astra's file. Claude's own review needed three corrections, each marked where it was made.

**Searched:**

- GitHub Spec Kit's `/speckit.clarify` and `/speckit.analyze`;
- OpenSpec's change proposals;
- agents-md-lint, ctxlint and agnix;
- the 2026 papers on agent context files;
- Justin's `intent-architect` and `repo-doc-evaluator`.

**Found:** shapes worth borrowing, and nothing to adopt whole:

- **Spec Kit `/speckit.clarify`:** how to ask a steward questions about intent;
- **OpenSpec:** how an intent change is proposed, then merged only once approved;
- **`intent-architect`:** the "refuse to guess" rule.

Adopting a whole spec tool brings its own rules about where memory and tasks live. ORC learned that from the beads
trial (`scope-orchestration-lab/FRICTION.md`, 17 September), so the advice is to borrow shapes, not adopt tools.

---

## The verdict both reviews reach

Keep entropy-guard. Revise the existing skills in a bounded way, then assess ORC and the lab together with the
revised skills. ORC and the lab take part now as read-only test cases, alongside one docs-first repository, so that
the skills are not fitted to ORC alone.

Both reviews say the central gap is intent. Astra stated it more exactly than Claude did:

> making the documents agree can erase the evidence that a choice was never made.

Two of the guards these skills produced resolve a mismatch by rewriting the intent documents to fit the work:

- this repository's own guard, `skills/local/entropy-guard/SKILL.md:68`;
- FlowVoice's guard, at lines 51–53.

Nothing in either asks the steward first. That is a **missing system**, because no skill has the job of telling an
approved change of intent from drift.

---

## What Astra found that Claude missed

All of these were verified in the files.

- **The intent-rewrite repair path,** described above.
- **"Update both."** This repository's own guard (`:88`) asks whether a concept has one home, then says "If so,
  update both". That keeps two copies alive.
- **The current-state packet has no lifecycle.** The docs-first skill says what the packet contains, but not:
  - where each claim came from;
  - who refreshes it;
  - what makes it out of date.

  The lab's `STATE.md`, at its 17:31 commit, shows the result. It says PR #200 is "not merged" and, in the same
  paragraph, merged. Its ORC section still gives ORC as running on `369628b` after restarts up to `8cee662`.
- **Guards freeze temporary state and other owners' rules.** The audio-tools guard holds a current tranche and the
  next issue to look at. It also states its own spend rule: a user request plus an environment flag. That conflicts
  with the 3 October rule that spending goes through ORC.
- **"Delta" is undefined.** FlowBook's guard reviews `git diff origin/main..HEAD`, which leaves out uncommitted work.
- **Adoption is planned, never checked.** Three entries in the lab's `FRICTION.md` record the same kind of failure:
  - a committed pre-push hook never enabled;
  - four coding rules filed where no agent loads them;
  - Moving Stillness's Bookwhen notes never reaching its agent.

  The integrator skill recommends where a guard goes, but nothing confirms that a fresh agent actually finds it and
  that its trigger fires.
- **ORC findings an assessment should catch:**
  - the README names a Bookwhen token that `src/` never reads;
  - the README calls scheduling and workflow execution "deliberately absent", while durable work exists;
  - nothing runs the test suites before a merge, which is #144.

---

## Where Claude's position changed, and on what evidence

- **How to merge the two guard generators.** Claude first proposed one generator, with bootstrap mode becoming a
  branch of the front door. Astra proposes that `session-coherence-skill-generator` own the shared guard
  requirements, with the docs-first skill feeding its canonical-ownership analysis in. Claude now holds Astra's
  version. The evidence: the session-coherence generator already covers verification commands, operational state and
  code-to-docs-to-tests mappings. ORC needs all of these, and the docs-first skill has none of them.
- **Fresh checks at each handoff.** Claude proposed a saved system profile with checks worked out fresh each time.
  Astra's correction: worked out from the current system alone, fresh checks can treat the drift itself as normal.
  They need a fixed reference: the steward's approved intent and constraints, kept separate from what the code now
  does. Claude accepts this. It is the same point as the intent-rewrite finding.
- **Measurement.** Claude proposed a blind-newcomer probe first. Astra proposed comparing current and revised skills
  on cases whose right answer is already known from today's verified findings. Astra's is cheaper and tests the
  upgrade's claims directly, so it comes first. The probe waits until the packet's value is in question.
- **New dimensions.** Claude proposed adding provenance and salience to the five dimensions in `INTENT.md`. Astra
  framed the same ground as the lifetime of a signal:
  - where it came from;
  - whether it still applies;
  - whether it reaches the agent that needs it;
  - whether it is acted on;
  - whether it is retired when its basis changes.

  That framing also covers delivery, which the FRICTION entries show failing and which Claude missed. It goes into
  the revision below, and `INTENT.md` gets no new dimensions.

**Where Claude holds its position:**

- A single concept defined in two repositories, and a written rule that nothing enforces, both need explicit checks.
  Astra reached both independently, through ORC's `entryId` history and `unavailableOperations`.
- The 2026 context-file research still means a current-state packet must carry what code cannot tell: decisions,
  what has been superseded, open questions and rules. It must not be an overview.

---

## The revision, in order

The cost estimates are Astra's, given in its review as rough effort including review. They come to about three and a
half to four days.

### 1. An intent change is a proposal, not an edit (about half a day)

When work and stated intent disagree, the skills and the guards they generate do six things:

- **Sort the difference.** It is an implementation defect, a permitted adaptation, or an unresolved decision.
- **Never rewrite the intent to fit the work.** They record a proposed change in the existing decision surface, and
  the canonical intent changes only on the steward's approval. This is OpenSpec's shape: a proposal holds the change,
  and the change merges on approval.
- **Correct plain staleness directly.** Where an authoritative source settles it, such as a dated decision of
  Justin's already on record, the document is corrected and no question is asked. Astra's example is ORC's
  "scheduling absent" against the 17 September async-work decision.
- **Ask only when the evidence cannot settle a choice that changes what gets built.** At most five questions, one at
  a time. Each gives the candidate readings, one concrete case from the system where they diverge, and a recommended
  answer. Each answer is recorded with its date. This is Spec Kit's `/speckit.clarify` combined with Justin's "find
  the requirements with concrete examples" rule.
- **Label each signal by kind:** a decision by the steward, an observation, or an agent's inference.
- **Hand over to `intent-architect`** when no usable intent exists at all.

### 2. Routing, and one owner for building guards (half a day to a day)

- The front door routes mixed and code-heavy work to `session-coherence-skill-generator`.
- That generator owns the shared guard requirements.
- The docs-first skill keeps its canonical-ownership and supersession analysis, and feeds it into the generator.
- The integrator keeps placement.
- The local guard's "update both" becomes: decide which copy is the owner, then reduce the other copy to a link.

### 3. A lifetime for everything the skills produce (half a day)

- **Guards hold only durable checking policy.** Current direction, tranche and next issue live in the repository's
  own state file, and the guard points at it.
- **Other owners' rules are linked, never restated.** Spending is one example.
- **The packet updates the existing state surface rather than becoming a new authority.** Claims that change often
  carry their source and date.
- **Every guard run states three things:**
  - the baseline it compared against, with uncommitted work included in the delta;
  - what it checked;
  - what it did not cover.

### 4. Adoption is checked, not just planned (half a day)

The integrator counts a guard as adopted only after two things have happened:

- its trigger has fired once;
- a fresh agent session has found it.

Its output says plainly which of three a guard is: a reminder, a check that runs, or an invariant something
enforces.

### 5. Settle the theory record (two to four hours)

- Mark the three 19 March entries in `LEARNINGS.md` as hypotheses.
- Record the settled method: a compact reusable guard, anchored on approved intent, that picks its checks for each
  change, rather than a fresh full assessment at every handoff. Both reviews recommend this.
- Clear the smaller stale items:
  - compare `doc-health-check` with `repo-doc-evaluator` before building it;
  - remove the reference to `distill-article`;
  - close issue #12;
  - add the session-coherence generator to the guard lifecycle in `INTENT.md`.

### 6. Run before and after on cases with known answers (about a day)

Astra's seven cases, each with a right answer already known from today's verified findings:

- **A route that is missing:** the front door never reaches the session-coherence generator.
- **Current-state claims that conflict:** PR #200 in the lab's `STATE.md`.
- **A settled decision with a stale description:** ORC's README calling scheduling absent.
- **An intent choice still open:** persistent or fresh guards, before item 5 settles it.
- **A guard that is never loaded:** the coding rules filed out of reach, from `FRICTION.md`.
- **A change with uncommitted work:** the gap in FlowBook's delta.
- **A legitimate change that should produce no finding.**

One change none of the reviewers has seen is added, so the test does not just reward recognising these reports.

**How it runs:**

- The current skills run first; that is the "before".
- The revised skills run second.
- The test repositories are ORC and the lab, read-only, plus `agentic-architecture` as the docs-first case.

**What is recorded:**

- useful findings;
- misses;
- false alarms;
- the quality of the questions asked;
- minutes taken.

The number of files generated is not a measure of success.

---

## Found outside entropy-guard, and not changed

Each of these belongs to another repository or session:

- **The audio-tools spend rule.** Lines 46–47 and 196–197 of `audio-tools/skills/session-coherence-guard/SKILL.md`
  state the old rule. The global AGENTS.md is loaded in every session and overrides it, so the risk is moderate
  rather than live. It is, though, a second, older statement of the spend rule in the repository where the unapproved
  RunPod spend of 3 October happened. The fix is to replace those lines with a pointer to the ORC rule.
- **The lab's `STATE.md` contradictions,** as read at commit `096b96f` (17:31). The lab's own session should fix
  them.
- **ORC's README staleness,** and tests not run before a merge (#144). Both are inputs for the ORC assessment.
- **Two deployed guards are identical.** The ones in tbt and scope-agentic-tools are the same generic checklist.
  Find out whether either is used before refreshing either.

## What not to build

Both reviews agree on four things to leave alone:

- a guard runner or evaluator runtime;
- an intent language or semantic graph from the autopoiesis discussion;
- new registry documents for each concern;
- wholesale adoption of Spec Kit, OpenSpec or Kiro.

---

## Decision for Justin

**Approve the revision, items 1 to 6,** on a branch in entropy-guard, with item 6's "before" run done first.

**Further work that needs a yes:**

- fix the two spend lines in the audio-tools guard;
- tell the lab session about the contradictions in its `STATE.md`;
- triage which of the 7 deployed guards are still in use;
- commit these three review files to entropy-guard, after running this repository's own guard as its `AGENTS.md`
  requires.
