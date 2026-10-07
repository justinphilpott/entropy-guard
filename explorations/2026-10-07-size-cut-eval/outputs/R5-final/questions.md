# Questions for the steward

Five questions from the intent pass (`skills/entropy-assessment/intent-pass.md`, section 4), each about a choice that
changes what gets built or what the guard checks. No steward was available, so work continued on each recommendation,
and the work that depends on an answer is drafted as provisional. Finding ids refer to `assessment.md`; line numbers
refer to the target snapshot.

## Q1. Who is the steward of entropy-guard?

- **Statement and source.** No file names who decides what the project is for (F1). `INTENT.md:3` says the intent is
  "meant to be refined collaboratively — by humans and AI agents", and no `DECISIONS.md` entry carries an author or a
  date.
- **Readings.** (a) One person, the repository owner, is the steward. (b) Stewardship is shared by everyone who
  contributes, agents included.
- **Where they diverge.** A session decides to widen the repo back into entropic-immunity theory and writes a
  `DECISIONS.md` entry saying so. Under (b) that entry authorises the change. Under (a) it is a proposal that waits
  for the owner.
- **Recommended answer.** Justin Philpott. He is a participant in every `explorations/*.md` conversation, and the
  feedback helper files issues on his repository (`skills/local/entropy-guard-feedback/SKILL.md:10`). Record the
  answer in `DECISIONS.md`.
- **Depends on it.** The steward named in the guard's "Where things live" and intent-change rule, now "not yet named".

## Q2. May an agent change `INTENT.md` without a recorded steward decision?

- **Statement and source.** `INTENT.md:3` ("meant to be refined collaboratively — by humans and AI agents. When you
  update it, note the date"); `AGENTS.md:27` ("If a decision refines or challenges the intent, update INTENT.md and
  note why"); the old guard, `skills/local/entropy-guard/SKILL.md:68` (F2).
- **Readings.** (a) A standing permission: any session may revise `INTENT.md`, with a dated note. (b) An invitation
  to propose: a session records a proposal, and `INTENT.md` changes after the steward decides.
- **Where they diverge.** During the validation batch a session finds code-first repos more fruitful and rewrites
  `INTENT.md` "Scope boundary and next validation loop" to say code-first comes next. Under (a) that is allowed with a
  note. Under (b) it is a proposal in `DECISIONS.md`, and `INTENT.md` stays as it is.
- **Recommended answer.** (b). `INTENT.md:33` itself says intent entropy "is catastrophic to recover", and a session
  revising the north star to fit its own work is the drift this project exists to catch. Drafted as a proposal in
  `patches/DECISIONS.md.patch`.
- **Depends on it.** Amending `AGENTS.md:27` and the `INTENT.md` preamble. The guard leaves this open in a line after
  its intent-change rule.

## Q3. Which skill writes guards?

- **Statement and source.** `skills/docs-first-planning-assessment/SKILL.md:132` has "Phase 2: Guard Generation /
  Refinement"; `skills/session-coherence-skill-generator/SKILL.md:200-206` writes `skills/session-coherence-guard/SKILL.md`;
  `INTENT.md:88` gives the generator role to the assessment workflow and does not mention the generator;
  `README.md:52` and `:91` describe both (F4).
- **Readings.** (a) The session-coherence generator is the one guard writer, and docs-first supplies checks. (b)
  Docs-first Phase 2 writes guards for docs-first repos, and the generator covers other repos and bootstrapping. (c)
  Both, deliberately.
- **Where they diverge.** One external user follows the README's "To generate guards" prompt on a docs-first repo and
  gets a guard from docs-first Phase 2. Another follows the README's skills table, runs the generator on the same
  repo, and gets `skills/session-coherence-guard/SKILL.md` from a different template. Under (a) or (b) one of those is
  wrong; under (c) the repo now has two guards.
- **Recommended answer.** (a). The newest decision (`DECISIONS.md:7-11`) invests in the generator, and it carries the
  only written guard template. One writer removes a second way to do the same thing. Drafted as a proposal in
  `patches/DECISIONS.md.patch`.
- **Depends on it.** Reducing the other skill, `INTENT.md` "The guard lifecycle" and the README to links. Tracked in
  `TODO.md` "Backlog" by the patch; nothing is changed now.

## Q4. Is entropy-guard bound by rules it does not own, beyond seed and the agentskills.io specification?

- **Statement and source.** The snapshot names only seed (`AGENTS.md:66-68`) and the agentskills.io specification
  (`DECISIONS.md:79-83`) (F15).
- **Readings.** (a) No other rules apply. (b) A user-wide instructions file, or another policy, also binds sessions
  here.
- **Where they diverge.** A user-wide rule about which package manager to use, or what may be published, would bind a
  session here. Under (b) the guard must point at it, or a session following only this repo's files would break it.
- **Recommended answer.** If such a file exists, link it from "Rules owned elsewhere" in the guard; do not copy its
  rules.
- **Depends on it.** That one pointer in the guard, now shown as open.

## Q5. What does the validation batch measure?

- **Statement and source.** `DECISIONS.md:26` sets the next loop as "assess a larger set of open source projects ...
  and track whether that produces more merged PRs". `INTENT.md:135` and `README.md:125` track "clearer session
  recovery, fewer reintroduced stale ideas, more coherent docs". The later decision, `DECISIONS.md:15-19`, settles the
  repo shape (docs-first) but not the measure (F10).
- **Readings.** (a) Merged PRs on open-source repos. (b) Session-recovery quality on docs-first planning repos.
- **Where they diverge.** A batch of private planning repos with no pull requests counts for nothing under (a) and is
  the main target under (b).
- **Recommended answer.** Record which measure, or both, in `DECISIONS.md` before the batch starts. It does not change
  the guard.
- **Depends on it.** The first item in `TODO.md` "Next Up".
