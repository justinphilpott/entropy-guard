# Questions for the steward

From the 2026-10-07 entropy assessment of the entropy-guard snapshot `447da9a`. No steward was available, so each
question carries a recommended answer, and the run continued on it. Work that depends on an answer was drafted as
provisional and not installed: the refined guard (`guard/SKILL.md`) and `integration.patch` wait on Q1 and Q2.
`state-update.patch` records all four in the target's DECISIONS.md as "Proposed, awaiting the steward", not as
decisions. Findings are in `assessment.md` by id.

Four questions. Each one changes what gets built or what the guard checks.

---

## Q1. Who is the steward?

- **Statement and source:** nothing in the repo names one (finding F1). LICENSE line 3 says "Copyright (c) 2026
  entropy-guard". INTENT.md line 3 says the north star "is meant to be refined collaboratively — by humans and AI
  agents".
- **Readings:**
  - (a) Justin Philpott decides what the repo is for. Evidence: on 2026-03-24 he set the repo's scope
    (`explorations/2026-03-24-entropy-immune-system-conversation.md` line 713: "I want to preserve the entropy-guard
    project and really farm this new evolution off into its own repo"); the feedback helper files issues on
    `justinphilpott/entropy-guard`; AGENTS.md line 68 credits his `seed` scaffold.
  - (b) Intent is held jointly by whoever contributes, human or agent, as INTENT.md line 3 reads.
- **Where they diverge here:** an outside contributor's pull request rewrites INTENT.md "Scope boundary and next
  validation loop" to add code-first repos to the validation batch (TODO.md Backlog line 19 already floats this).
  Under (a) that is a proposal waiting for Justin; under (b) it can merge as an ordinary documentation change.
- **Recommended:** (a), Justin Philpott, named once in AGENTS.md. Reason: the only scope decision in the snapshot that
  carries a name and a date is his (2026-03-24), and the guard needs one named decider to address proposals to.
- **What it changes:** the guard's "Steward:" line and the addressee of every proposal.

## Q2. May contributors and agents revise INTENT.md directly?

- **Statement and source (finding F2):**
  - INTENT.md line 3: "It is meant to be refined collaboratively — by humans and AI agents — as our understanding
    deepens. When you update it, note the date and what prompted the revision."
  - AGENTS.md line 27: "If a decision refines or challenges the intent, update INTENT.md and note why."
  - The current guard, `skills/local/entropy-guard/SKILL.md` line 68: "if INTENT.md itself needs revision, update it
    with a dated note explaining what prompted the change."
- **Readings:**
  - (a) As written: any contributor edits INTENT.md with a dated note, in the same change as the work.
  - (b) A change of intent is first recorded as a proposal in DECISIONS.md; INTENT.md changes only after the
    steward's recorded decision. Direct correction stays allowed where a recorded decision already settles the text.
- **Where they diverge here:** a session working the Backlog item "Consider additional specialized tracks after
  docs-first planning validation" decides code-first deserves a track now. Under (a) it rewrites INTENT.md lines
  129-135 in the same commit. Under (b) it records a proposal and leaves INTENT.md unchanged until the steward decides.
- **Recommended:** (b). Reason: INTENT.md line 5 records its last revision with a date but no author, so a reader
  cannot tell an authorised revision from drift; INTENT.md line 33 itself calls intent entropy "catastrophic to
  recover". Every patch from this run leaves INTENT.md lines 3 and 139 and AGENTS.md lines 27 and 32 unchanged.
- **What it changes:** the guard's Intent section (the intent-change rule replaces old check 3's "update it with a
  dated note"), and, after the decision, the wording of those four lines.

## Q3. What does the validation batch measure?

- **Statement and source (finding F4):**
  - DECISIONS.md line 26 ("Farm broader…"): "assess a larger set of open source projects, generate or refine guards,
    run them locally while making targeted improvements, and track whether that produces more merged PRs."
  - INTENT.md line 135: "track whether this produces clearer session recovery, fewer reintroduced stale ideas, more
    coherent docs, and sharper feedback on what the methodology gets right or wrong". README.md line 125 matches it.
  - Which repos go in the batch is settled by the later DECISIONS.md "Specialize first around docs-first planning
    repos…" and INTENT.md's 2026-04-07 revision: docs-first planning repos. Only the measure is in conflict.
- **Readings:** (a) merged PRs in the assessed repos; (b) INTENT.md's session-level measures; (c) both.
- **Where they diverge here:** a private docs-first planning repo, with no upstream to send a PR to, is a full data
  point under (b) and yields nothing under (a). A public docs-first repo whose maintainers ignore PRs counts as a
  failure under (a) even if its sessions recover faster.
- **Recommended:** (c), INTENT.md's measures first, with merged PRs also recorded where the assessed repo is open
  source. Reason: INTENT.md was revised for the docs-first specialisation and README.md and TODO.md follow it, while a
  merged PR is the one signal from outside the steward's own judgment that a public repo can give.
- **What it changes:** what TODO.md Next Up item 2 records per repo, and which repos can enter the batch.

## Q4. Which skill writes guards?

- **Statement and source (finding F5):**
  - `skills/docs-first-planning-assessment/SKILL.md` Phase 2 (lines 132-202) generates or refines guards from its own
    checklist areas.
  - `skills/session-coherence-skill-generator/SKILL.md` (lines 198-315) generates guards from its own template, at
    `skills/session-coherence-guard/SKILL.md` by default.
  - INTENT.md line 88 gives the generator role to `entropy-assessment` and `docs-first-planning-assessment` and does
    not name `session-coherence-skill-generator`. README.md lines 52-58 route guard generation through docs-first. No
    DECISIONS.md entry introduces the generator; line 9 calls it "the previous `session-coherence-skill-generator`".
- **Readings:**
  - (a) Docs-first Phase 2 writes guards for docs-first repos; the generator serves other shapes and young repos.
  - (b) The generator is the one guard writer; docs-first supplies its checks to it.
  - (c) Both stay as peers.
- **Where they diverge here:** the first repo in the validation batch. Under (a) its guard follows docs-first Step 7's
  checklist; under (b) it follows the generator's template, with modes, mechanical commands and safety rules. This
  repo's own guard is described as "a reference example of what the guard generators produce" (its line 3; README.md
  line 78), and it can exemplify only one template.
- **Recommended:** (b). Reason: the generator holds the fuller guard contract and is the newest skill (metadata
  2026-05-11), while what is specific to docs-first is its checks, which can be supplied as input. One writer ends the
  two-template parallel truth.
- **What it changes:** README.md "How to use this repo", INTENT.md "The guard lifecycle" (through a proposal, per
  Q2), `guards-integrator`'s trigger line, and which template this repo's guard exemplifies. `cleanup.patch` names
  both writers in `guards-integrator` and chooses neither.
