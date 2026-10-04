---
title: "Review of entropy-guard's skills before running them on ORC"
date: 2026-10-04
participants:
  - Justin Philpott
  - Claude Opus 5.5
type: review
status: complete; compared with Astra's review in 2026-10-04-skills-review-synthesis.md
---

# Review of entropy-guard's skills before running them on ORC

*Claude Opus 5.5, 4 October 2026, at entropy-guard commit `447da9a` (the last commit, 11 May 2026).*

Justin asked for a review of the skills aimed at three things:

- making them better at producing entropy resistance across intent and signal decay, including flagging unclear
  intent and clarifying it;
- where the work stands and what to change;
- an independent review by Astra on the same grounds.

**What was read:**

- all six skills;
- `README.md`, `INTENT.md`, `DECISIONS.md`, `LEARNINGS.md` and `TODO.md`;
- the autopoiesis conversation (`explorations/2026-03-19-autopoiesis.md`) and the working conclusions
  (`explorations/2026-03-24-entropy-immune-system-working-conclusions.md`);
- the 12 GitHub issues on `justinphilpott/entropy-guard`;
- the outline, not the detail, of ORC (`~/pro/orchestrator`) and the lab Scope (`~/scopes/scope-orchestration-lab`).

Nothing in the skills was changed.

**Where the autopoiesis essay is.** There is no autopoiesis essay in `~/pro/agentic/agentic-architecture` or in its git
history. The only one on disk is the 19 March conversation in this repository's `explorations/`, which was also copied
into `~/pro/entropy-immune-system/`. This review uses that one.

---

## What is here

Justin remembered two skills. The repository has four that are meant for use on other projects, and two that are
for this repository only.

The four for other projects:

- **`skills/entropy-assessment/`** (v0.6.0) is the front door. It sorts a repository into one of four shapes. It
  sends docs-first planning repositories to the skill below, and gives every other shape a "lightweight fallback"
  profile.
- **`skills/docs-first-planning-assessment/`** (v0.1.0) is the deep path, and is the guard generator Justin
  remembers. It produces a map of which document owns which truth, a short current-state packet for the next
  session, and a new or amended end-of-session guard.
- **`skills/guards-integrator/`** (v0.2.2) decides where a guard runs: session end, commit, pull request or CI.
- **`skills/session-coherence-skill-generator/`** (v0.2.0) was added on 10 and 11 May, brought over from FlowBook.
  It also generates an end-of-session guard, and has a bootstrap mode for young repositories.

The two for this repository only: `skills/local/entropy-guard/` (this repository's own pre-commit check) and
`skills/local/entropy-guard-feedback/` (files GitHub issues against entropy-guard).

Guard files named after these skills exist in 7 repositories: agentic-architecture, audio-tools, flowbook,
flowvoice, seed, tbt and scope-agentic-tools.

---

## Prior art

**Searched:**

- spec-driven development tools (GitHub Spec Kit's `/speckit.analyze` and `/speckit.clarify`);
- documentation drift detectors (`drift`, `doc-drift-detector`, and the technique survey in Zylos's August 2026
  article);
- linters for agent instruction files (agnix, ctxlint, agents-md-lint);
- Cline's Memory Bank;
- 2026 research on agent context files and on agents asking clarifying questions;
- Justin's own skills: `intent-architect` (`~/pro/intent-opus`), `repo-doc-evaluator` and `mentor`.

**Found:** nothing that does the whole job, which is to assess one system's drift across intent, state and knowledge
and then fit guards into its loop. Several parts are worth taking rather than writing:

- **Spec Kit's `/speckit.clarify`.** It is the model for clarifying intent. It asks at most five questions, one at a
  time, each with a recommended answer, and records each answer under a dated `## Clarifications` heading in the
  spec.
- **Spec Kit's `/speckit.analyze`.** It is the model for a severity scale. Anything that conflicts with the project
  "constitution" is critical by rule, and every finding gets a stable ID.
- **agents-md-lint's blind sub-agent.** A sub-agent that has not seen the instruction file tries to find each fact
  in it from the code alone. Facts it can find are redundant. That is a way to measure what a document adds, which is
  this repository's own definition of entropy put into practice.
- **lychee, ctxlint, agnix and ast-grep.** They do the mechanical checks: dead links, dead paths, missing commands,
  and identifiers named in prose that no longer exist in the code. The skills should recommend these, not describe
  hand-run versions of them.
- **`intent-architect`'s "refuse to guess" rule.** It covers both directions: inventing a decision the user owes,
  and restating the user's words in technical vocabulary they did not use.

**Two research results bear directly on the outputs:**

- Gloaguen et al., *Evaluating AGENTS.md* (arXiv 2602.11988, 2026), found that repository context files "do not
  generally improve task success rates, while increasing inference cost by over 20% on average". Repository overviews
  did not help; instructions in the files were followed. The benchmark is bug-fixing tasks, not drift across
  sessions, so it does not refute the current-state packet. It does say the packet should carry what code cannot tell
  (decisions, what has been superseded, open questions, rules), and should not be an overview.
- dos Santos et al., *Configuration Smells in AGENTS.md Files* (arXiv 2606.15828, 2026), found at least one of six
  smells in 91 of 100 popular repositories. The commonest were rules already enforced by a linter (62%) and oversized
  files (42%).

---

## Findings, most important first

### 1. The skills do not carry this repository's own conclusions about intent

This is a **missing system**, because checking whether a system still serves its intent has never been any skill's
job. Every step that mentions intent only asks for a summary of it.

**What the repository concluded in March,** in three `LEARNINGS.md` entries dated 19 March and the working
conclusions of 24 March:

- A saved guard file describes the system as it was when the file was written, and drifts from then on. The better
  form is a check worked out fresh at each handoff, from the intent, a saved profile of the system, and the change
  just made.
- Almost nothing checks meaning, that is, whether the running thing still serves what it was built for. Current
  guards check whether documents agree with each other.
- The aim is to tell harmful drift from legitimate change, not to stop change.
- Declared intent (what the documents say), enacted intent (what the work actually pursues) and the steward's actual
  need are three different things.

**What the skills do:**

- Step 1 of both assessment skills says to write a 2 to 4 sentence intent summary, and to stop if there is none.
- Both generators still write a saved `SKILL.md` guard.
- There is no saved profile of the system.
- Nothing distinguishes declared from enacted intent.
- No check asks whether recent work served the stated purpose.

This is the repository showing the entropy it was built to catch: what it learned did not reach its skills. Under
the "something worse underneath" rule, this is what Astra's review should test hardest.

### 2. Unclear intent either stops the assessment or is silently guessed

The skills have one branch: if no intent can be found, stop. The common real cases sit between "clear" and "absent",
and the skills say nothing about any of them. Five conditions each deserve a finding of their own:

- **Missing.** There is no statement of purpose.
- **Conflicting.** Two documents state different purposes or rules for the same thing.
- **Stale.** The steward has not confirmed the intent while a great deal has changed.
- **Ambiguous.** The statement has two plausible readings that lead to different work. Justin's "just `course`, right
  now" tag for SoulBodhiWork's Schedule, in the global AGENTS.md, is the pattern: a narrow statement that the facts on
  the board already outgrew.
- **Prose control.** A rule is written as if something enforces it, and nothing does. ORC's
  `unavailableOperations` rendered a sentence into an agent's prompt, refused nothing, and was cited in a safety
  decision.

**Proposed: an intent pass at the front door, so that every path gets it.** It would do five things:

- Gather every statement of purpose, decision and rule, each with its source: the file, who said it and when. The
  lab already writes these as "Justin, 2026-09-25: …". The pass should look for that form, and should weigh a
  statement without a source as weaker.
- Sort the statements into declared (what the documents say), enacted (what the last stretch of commits and open
  work actually pursued) and the steward's own words.
- Flag each of the five conditions above as a finding.
- Not guess when intent is ambiguous or conflicting. It writes at most five questions. Each question gives the
  candidate readings, one concrete example from the system where the readings lead to different work, and a
  recommended answer. It asks them one at a time, and records each answer, dated, in the place that owns intent. This
  is `/speckit.clarify`'s shape combined with the global rule "find the requirements with concrete examples".
- Ask only questions whose answer changes what gets built. This matches the global rule "escalate for exactly two
  things", and the SAGE-Agent result (ACL 2026 Findings): asking 1.5 to 2.7 times fewer questions covered 7 to 39%
  more of the ambiguous tasks.

When there is no usable intent at all, the pass hands over to `intent-architect` rather than growing an interviewer
of its own.

### 3. Two skills generate the same end-of-session guard

`docs-first-planning-assessment` (its Phase 2) and `session-coherence-skill-generator` both produce an end-of-session
guard, from different templates with different metadata formats. Four places leave the second one out of the
workflow:

- the front door never sends anything to it;
- the README's "How to use" section does not mention it;
- the guard lifecycle in `INTENT.md` lists only the generator and the integrator;
- the session-coherence generator still names FlowBook as its model.

Guards from both are in use. audio-tools has one from the session-coherence generator, dated 12 May. The metadata of
the guards in agentic-architecture, flowbook and flowvoice says they came from `entropy-assessment`, the docs-first
skill, or both. (Corrected on 4 October: the first draft said FlowBook also had a session-coherence guard. It does
not.)

Where should "make an end-of-session guard" be defined once, and why is it defined twice? History: FlowBook's
generator was brought in during May and never folded in. The fix is to merge them, not to make them agree. The
recommendation is one generator. Bootstrap mode becomes a branch of the front door ("young repository"), and there is
one guard template.

### 4. ORC lands on the skills' weakest path

What ORC is, in numbers:

- `~/pro/orchestrator` holds 111 TypeScript source files and 347 commits;
- it also holds 15 top-level Markdown documents (design notes plus `README.md` and `AGENTS.md`), about 3,800 lines
  in all;
- the lab Scope holds `STATE.md`, `FRICTION.md`, a decisions folder and reports;
- Moving Stillness and the other Scopes are separate repositories;
- several agents work on it: Claude, Astra and ORC's own.

The front door calls that "mixed docs + code" and gives it the lightweight fallback, which the skill itself calls
provisional. Nothing in the skills covers more than one repository. Yet the two costliest seams recorded in the
global AGENTS.md were each one concept defined in two repositories: the Bookwhen row identifier `entryId`, and
`remove` against `delete`.

**A path shaped for ORC needs five things:**

- a map of which repository owns which concept;
- a check for one concept with two homes, across repositories;
- comparisons between what the documents say and what the code does, done with maintained tools rather than
  judgment: ast-grep for identifiers named in prose, the API Extractor report ORC already keeps for its package API,
  and lychee or ctxlint for paths and commands;
- the prose-control check from finding 2;
- an inventory of ORC's guards before proposing any new one, separating what runs by itself, what exists but only
  runs by hand, and what is only decided. As read in the files on 4 October:
  - **Runs by itself:** Danger on every pull request (`.github/workflows/danger.yml`, which runs Danger and nothing
    else).
  - **Exists, runs by hand:** the test suites, including `test/architecture.test.ts` and the package-API report
    test. The lab's map check is part of the diary report (`tools/report.mjs`); I found no timer that runs it.
    The pre-push hook (`.githooks/pre-push`) only prints a worktree summary and never blocks.
  - **Decided by Justin on 4 October, not yet built:** tests on every pull request (#144), FRICTION turned into
    rules monthly (#60), and branch and `/tmp` cleanup (#70, #182).

  (Corrected twice on 4 October. The first draft listed tests on every pull request as running. The second listed
  the pre-push hook and the package-API test as running guards; Astra's review showed that neither runs a check
  before a merge.)

### 5. Nothing measures whether a change to the skills made them better

The current evidence:

- the 12 GitHub issues are all from March and April;
- the external validation batch at the top of `TODO.md` never ran;
- three `LEARNINGS.md` entries are "validated by" the 19 March conversation, which by that file's own standard makes
  them hypotheses.

Justin's verdict that the skill works stands: its fixes merged within minutes. What is missing is a way to tell
whether the upgrade improves on it.

**Two measures to build:**

- **A blind-newcomer probe,** using agents-md-lint's method. A sub-agent with no prior context answers a fixed set of
  questions about a system, once with the current-state packet and once without it. The questions are: what is it
  for, what is decided, what is superseded, and what is next. Its answers are scored against the steward's own. This
  measures the repository's own definition of entropy directly: "the effort required for a competent newcomer…".
- **Runs before and after an upgrade, on fixed repositories.** These use the evaluation support in the
  `skill-creator` skill rather than a harness of our own.

### 6. Two kinds of signal decay that the five dimensions miss

`INTENT.md` names five dimensions: intent, consistency, referential, state and knowledge. Two more kinds of decay show
up in Justin's work:

- **Provenance.** A decision recorded without who made it, when, and on what evidence cannot be weighed, and cannot
  be retired safely.
- **Salience.** An important rule loses force as the file around it grows, and as it is restated in several places.
  dos Santos et al.'s oversized-file smell is one measured form of this.

### Smaller items: this repository's own stale state

- The local guard cites a `doc-health-check` skill, which does not exist.
- `LEARNINGS.md` cites a `distill-article` skill, which has left the repository.
- Issue #12 is still open, although the 1 May decision in `DECISIONS.md` made the current-state packet an output of
  the docs-first skill.
- `INTENT.md`'s guard lifecycle omits the session-coherence generator.

---

## Suggested changes, in order

1. Add an intent pass to the front door (finding 2). It applies to every path, ORC's included.
2. Keep one guard generator. Make a saved system profile, with a check worked out fresh at each handoff, the
   default output (findings 1 and 3).
3. Build a path for mixed code and several repositories, against ORC (finding 4).
4. Build the measures: the blind-newcomer probe and the before-and-after runs (finding 5).
5. Add provenance and salience to the dimensions (finding 6).
6. Clear the smaller items.

**Restraint check.** Changes 1, 2 and 4 are this repository's own written conclusions. Change 3 is ORC's visible
shape. None of them is speculative structure. A separate "guard runner" is not proposed here: working out the check
fresh at each handoff covers most of what the runner was for, and ORC's scheduling work (orchestrator#166) is the
natural place to run it later.

---

## Should ORC be part of the first examination?

**Yes, as evidence, not as something to change.** The recommendation has three parts:

- Run the current front door on ORC and the lab now, read-only, and keep the output as the "before". The lab's
  `STATE.md` already plans this ("Astra runs entropy-guard's assessment on ORC and the lab together").
- Give Astra's review of entropy-guard a snapshot of ORC, so that it can judge whether the skills fit the system they
  are about to be used on.
- Make no changes to ORC from the baseline run until the upgraded skills have run too.

**Why:** ORC's shape is the one the skills handle least well. Upgrading without it means upgrading for docs-first
repositories, and ORC is not one. To avoid fitting the skills to ORC alone, keep one docs-first repository, such as
`agentic-architecture`, in the test set too.

---

## Astra's independent review

It would follow the method the lab uses:

- **The pack.** A snapshot holding entropy-guard at `447da9a`, a snapshot of ORC and the lab, and a `BRIEF.md`.
- **Read-only.** `opencode run -m openai/gpt-6-astra --variant xhigh`, with editing, shell, web, sub-agents and
  other directories all denied.
- **Independent.** Astra does not see this review.

The brief would ask, on the same grounds as this review:

- does a maintained tool already do this?
- can the skills produce entropy resistance across intent and signal decay, and where can they not?
- how should unclear or ambiguous intent be flagged and clarified?
- are the skills fit to run on ORC?
- what should be cut?

Claude would then check every finding against the files, as with the lab's earlier Astra reports, and write a
synthesis of both reviews.

---

## Sources

- [GitHub Spec Kit, `/speckit.clarify`](https://www.mintlify.com/github/spec-kit/commands/clarify) and [`speckit-analyze`](https://skills.cat/skills/dceoy/speckit-agent-skills/speckit-analyze)
- [agents-md-lint](https://www.skills.sh/borkweb/skills/agents-md-lint)
- [Agnix](https://codex.danielvaughan.com/2026/04/13/agnix-linting-codex-cli-agent-configurations/), [ctxlint](https://www.producthunt.com/p/ctxlint)
- [Zylos, Documentation-Contract Drift Detection in Evolving Agent Systems (2026-08-21)](https://zylos.ai/research/2026-08-21-documentation-contract-drift-detection-agent-systems/)
- [drift](https://github.com/pallaprolus/drift), [doc-drift-detector](https://github.com/borghei/Claude-Skills/blob/main/engineering/doc-drift-detector/SKILL.md)
- [Gloaguen et al., Evaluating AGENTS.md (arXiv 2602.11988)](https://arxiv.org/abs/2602.11988)
- [dos Santos et al., Configuration Smells in AGENTS.md Files (arXiv 2606.15828)](https://arxiv.org/abs/2606.15828)
- [Structured Uncertainty guided Clarification for LLM Agents (SAGE-Agent)](https://arxiv.org/html/2511.08798v1)
- [Cline Memory Bank](https://docs.cline.bot/best-practices/memory-bank)
