# Questions for the steward

Target: the entropy-guard snapshot at `scratchpad/eval/targets/entropy-guard-447da9a`, assessed 2026-10-07.

No steward was available, so each question below carries the answer I recommend. I continued on those recommendations,
but only as drafts. Every change that depends on an answer is in `patches/provisional-Q<n>.patch` and is not to be
applied until the steward answers. Each question is also recorded in the target's own decision log, `DECISIONS.md`,
under "Proposed, awaiting the steward" (in `patches/settled.patch`). Finding ids (F1 and so on) refer to
`assessment.md`.

Asked in priority order. All four meet the intent pass's bar: the evidence cannot settle them, and the answer changes
what gets built or what the guard checks.

---

## Q1. Who may change `INTENT.md`, and who is the steward? (F1, F2)

**What the repo says.** Four places tell any contributor, human or agent, to edit the intent document when work
challenges it:
- `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents — as our understanding deepens.
  When you update it, note the date and what prompted the revision."
- `INTENT.md:139`: "If you find something missing, imprecise, or worth expanding — add it."
- `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `skills/local/entropy-guard/SKILL.md:68` (the repo's guard): "if INTENT.md itself needs revision, update it with a
  dated note explaining what prompted the change."

No file names a steward. The evidence points to Justin Philpott:
- he makes the recorded scope decisions in `explorations/2026-03-24-entropy-immune-system-conversation.md:86` and
  `:713`, dated 2026-03-24;
- he owns the GitHub repositories the repo links to (`skills/local/entropy-guard-feedback/SKILL.md:10`,
  `AGENTS.md:68`, `DECISIONS.md:142`).

**Readings.**
- (a) Any contributor may revise `INTENT.md` on their own judgement, noting the date and the reason.
- (b) Contributors propose, and `INTENT.md` changes only when the steward records a decision.

**Where they diverge in this repo.** `INTENT.md` "The guard lifecycle" (lines 84–96) does not mention
`skills/session-coherence-skill-generator/`. Under (a), the next agent to notice adds it to `INTENT.md`. Under (b), it
records a proposal and waits (Q2 is exactly that proposal).

**Recommended answer: (b), with Justin Philpott named as steward.** The repo's own model ranks intent as the most
protected layer: `LEARNINGS.md:133` says "The intent should be the most protected and slowest-changing element", and
`PHILOSOPHY.md:69` says "intent > machinery > content". The scope decisions on record were made by Justin in session,
not by agents.

**Depends on it:** `patches/provisional-Q1.patch`. It rewrites the three edit-INTENT instructions and installs the
updated guard (`guard/SKILL.md`), whose Intent section carries the intent-change rule.

---

## Q2. Which skill writes guards? (F3)

**What the repo says.**
- `skills/docs-first-planning-assessment/SKILL.md:132–202` (Phase 2) designs and produces the guard.
- `skills/session-coherence-skill-generator/SKILL.md:198–231` writes guards to its own requirements: modes, exact
  commands and safety rules, at `skills/session-coherence-guard/SKILL.md`.
- Neither skill mentions the other, and `skills/entropy-assessment/SKILL.md:68` routes only to the first.
- `INTENT.md:88` names only the assessment workflow as the guard generator. `README.md:91` and `AGENTS.md:46` say the
  session-coherence generator "generates repo-specific session handoff guards".
- No `DECISIONS.md` entry records why the generator was added. Its metadata is dated 2026-05-10, and it mentions
  "FlowBook", a repository that appears nowhere else here.

**Readings.**
- (a) Each skill writes guards for its own kind of repo.
- (b) `session-coherence-skill-generator` is the one guard writer, and `docs-first-planning-assessment` supplies the
  checks it builds in.
- (c) `docs-first-planning-assessment` writes guards, and the generator only bootstraps young repos.

**Where they diverge.** An external docs-first repo with no guard:
- under (a) or (c), Phase 2 produces a combined checklist with no set path;
- under (b), the generator writes `skills/session-coherence-guard/SKILL.md`, with modes, commands and safety rules,
  from Phase 2's checks.

The two routes give a user different guards for the same repo.

**Recommended answer: (b).** "Consolidate domain generators into single skill" (`DECISIONS.md:129–135`) found that
domain knowledge is "reference data, not separate processes", and preferred "one file to read instead of five". The
newest entry, "Session-coherence generation should bootstrap young repos" (`DECISIONS.md:7–11`), invests in the
generator.

**Depends on it:** `patches/provisional-Q2.patch`. It changes `INTENT.md:88`, three lines of `README.md`,
`AGENTS.md:46`, the hand-off in docs-first Phase 2 and its Output, and one "When to Use" line in the generator. Under
(c), discard it and draft the reverse.

---

## Q3. What does the validation batch measure? (F11)

**What the repo says.**
- `DECISIONS.md:26` ("Farm broader entropic-immunity exploration"): "assess a larger set of open source projects ...
  and track whether that produces more merged PRs."
- `INTENT.md:129–135`, `README.md:125` and `TODO.md:11–13` put the batch on docs-first planning repos instead. They
  track "clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and sharper feedback".
- No recorded decision settles which set of targets and measures applies.

**Readings.**
- (a) Merged pull requests on open-source projects.
- (b) Session recovery and coherence on docs-first repos, which may be private.

**Where they diverge.** A private docs-first planning repo with no pull-request flow counts under (b), and yields no
data under (a).

**Recommended answer: (b), also recording merged-PR outcomes where a target has a PR flow.** `INTENT.md`, `README.md`
and `TODO.md` agree on (b), and "Specialize first around docs-first planning repos" (`DECISIONS.md:15–19`) narrowed
the track to docs-first repos.

**Depends on it:** `patches/provisional-Q3.patch`, a partial-supersession note on the "Farm" entry, with the decision
date left as `<date>`.

---

## Q4. When may an agent file an issue on `justinphilpott/entropy-guard`? (F10)

**What the repo says.**
- Three places allow filing only when working inside this repo:
  - `skills/entropy-assessment/SKILL.md:150` and `skills/docs-first-planning-assessment/SKILL.md:217` ("when working
    inside this repo");
  - `AGENTS.md:72` ("when working here").
- Two places also allow it "whenever the local feedback helper is available":
  - `skills/guards-integrator/SKILL.md:174`;
  - `DECISIONS.md:66` ("use the local helper when available").
- The helper runs `gh issue create` against the public repository (`skills/local/entropy-guard-feedback/SKILL.md:44–51`).

**Readings.**
- (a) Only when working inside entropy-guard.
- (b) Whenever the helper can be reached, including while assessing another project with entropy-guard checked out.

**Where they diverge.** Take the repo's own usage instruction, `README.md:36–37`: "Read
skills/entropy-assessment/SKILL.md from the entropy-guard repo, then assess [your project path]". At the integrator's
last step, the agent files a public issue under (b) and not under (a).

**Recommended answer: (a).** Elsewhere, the agent leaves the formatted note in its output, as
`skills/guards-integrator/SKILL.md:175` already says to do when the helper is unavailable. Three of the five places
say (a), and it keeps public issues on your repository to sessions working in it.

**Depends on it:** `patches/provisional-Q4.patch`. It changes two lines of `skills/guards-integrator/SKILL.md` and
adds a partial-supersession note on the "Upstream feedback" entry.
