# Questions for the steward

Five questions from the intent pass of the 2026-10-07 assessment of the entropy-guard snapshot `447da9a`
(`assessment.md`). No steward was available, so each carries a recommended answer, and the work that depends on it
is drafted only in `patch-provisional.diff` or listed in `assessment.md` section 8. Each answer changes what gets
built or what the guard checks. They are listed in the order they should be asked.

## Q1. Who is the steward?

- **Statement and source:** no file in the repository names who decides what entropy-guard is for (finding F1). The
  17 entries in `DECISIONS.md` carry no names or dates (F3). Indirect evidence: the GitHub repository is
  `justinphilpott/entropy-guard` (`skills/local/entropy-guard-feedback/SKILL.md` lines 10 and 47); Justin Philpott
  is a named participant in `PHILOSOPHY.md` line 43 and in all four `explorations/` files, and in
  `explorations/2026-03-19-autopoiesis.md` he is the one evaluating the assessment skill and setting its direction.
- **Readings:** (a) Justin Philpott alone decides intent; (b) intent is decided collaboratively by whoever
  contributes, as `INTENT.md` line 3 ("refined collaboratively — by humans and AI agents") could be read.
- **Where they diverge:** the guard's intent rule says an undecided change of intent waits for the steward. Under
  (a) a proposal in `DECISIONS.md` waits for Justin; under (b) there is nobody to wait for, and any contributor's
  edit is a decision.
- **Recommended answer:** (a), Justin Philpott, recorded as a line in `AGENTS.md` (drafted in the provisional patch)
  and as the attribution on future `DECISIONS.md` entries. Reason: every piece of ownership evidence points to him,
  and without a named steward the intent-change rule has no one to route a proposal to.
- **Depends on it:** the provisional `AGENTS.md` "Steward" line. The guard does not copy the name; it points at
  `AGENTS.md`.

## Q2. May a session edit INTENT.md directly, or only propose a change for the steward?

- **Statement and source:** `INTENT.md` line 3: "It is meant to be refined collaboratively — by humans and AI agents
  — as our understanding deepens. When you update it, note the date and what prompted the revision." Also
  `INTENT.md` line 139 ("add it"), `AGENTS.md` line 27 ("If a decision refines or challenges the intent, update
  INTENT.md and note why") and the local guard's check 3, line 68 ("update it with a dated note"). Finding F2.
- **Readings:** (a) these lines are the steward's standing authorisation: any session may revise the north star,
  with a dated note; (b) they invite refinement, but a change of intent still needs the steward's recorded decision,
  and a session records a proposal.
- **Where they diverge:** a session running the external validation batch concludes that code-first repos should be
  in the first wedge. Under (a) it edits `INTENT.md` "Scope boundary and next validation loop" (lines 122-135) in
  place, with a dated note. Under (b) it records a proposal in `DECISIONS.md` and leaves `INTENT.md` as it is until
  the steward decides.
- **Recommended answer:** (b). Reason: with no steward named (Q1) and no dates or names on decisions (F3), reading
  (a) lets any session rewrite the north star with no record of who decided; the scope changes this repo has made
  so far ("Farm broader…", "Specialize first…") were recorded as decisions first.
- **Depends on it:** in the provisional patch, `AGENTS.md` line 27, `INTENT.md` lines 3 and 139, and the
  replacement of `skills/local/entropy-guard/SKILL.md` by `guard/SKILL.md`, whose intent section carries the
  intent-change rule in place of check 3's "update it". A proposal recording this is at the top of `DECISIONS.md`
  in the settled patch.

## Q3. Which skill owns guard generation?

- **Statement and source:** `skills/docs-first-planning-assessment/SKILL.md` Phase 2 (lines 132-202) generates or
  refines "the docs-first delta guard" with its own checklist areas; `skills/session-coherence-skill-generator/
  SKILL.md` ("Generated Skill Requirements", lines 198-231, and its template, lines 268-315) generates a guard at
  `skills/session-coherence-guard/SKILL.md` with required modes, mechanical commands and safety rules. Neither
  mentions the other. `INTENT.md` lines 86-88 name only the assessment skills as the generator. Findings F4, F5, F6.
- **Readings:** (a) `session-coherence-skill-generator` owns the guard template and writes guards, and the
  docs-first assessment supplies its docs-first checks to it; (b) `docs-first-planning-assessment` owns guard
  generation for docs-first repos, and the session-coherence generator is kept for other repos and bootstrap only;
  (c) both stay as they are.
- **Where they diverge:** this repo's own guard. README line 78 calls it "a concrete example of what the generator
  produces". It matches docs-first Step 7's checklist areas, and lacks every section the session-coherence generator
  requires (modes, mechanical commands, safety rules). Under (a) it must gain them; under (b) it already conforms;
  under (c) it is conformant and non-conformant at once.
- **Recommended answer:** (a). Reason: only the session-coherence generator has a written guard template, mode
  handling and the bootstrap mode the newest decision invested in (`DECISIONS.md` "Session-coherence generation
  should bootstrap young repos…"); the docs-first Step 7 areas are checks, which fit as an input to that template.
  One owner removes the choice every future guard otherwise has to make.
- **Depends on it:** the provisional `INTENT.md` "Guard generator" paragraph, and the undrafted changes in
  `assessment.md` section 8 (docs-first Phase 2 becomes a hand-off; the generator hands guards to
  `guards-integrator`; the front door routes young repos to bootstrap mode; `README.md` "How to use" names it).
  A proposal recording this is at the top of `DECISIONS.md` in the settled patch.

## Q4. How is the external validation batch measured?

- **Statement and source:** `DECISIONS.md` line 26 ("Farm broader…"): "assess a larger set of open source projects,
  generate or refine guards, run them locally … and track whether that produces more merged PRs." `INTENT.md` lines
  129-135: docs-first planning repos, tracking "clearer session recovery, fewer reintroduced stale ideas, more
  coherent docs, and sharper feedback". `README.md` line 125 agrees with `INTENT.md`; `TODO.md` line 12 says "track
  what changes prove useful". The later decision "Specialize first…" (lines 15-19) narrows the skills to docs-first
  but does not speak to the measure. Finding F9.
- **Readings:** (a) merged PRs on open-source projects; (b) session-recovery measures on docs-first planning repos;
  (c) both, one primary.
- **Where they diverge:** a private docs-first planning repo with no pull-request flow is a full validation case
  under (b) and yields nothing under (a); an open-source code library that merges a guard-suggested PR counts under
  (a) but is outside the docs-first wedge.
- **Recommended answer:** (c): docs-first planning repos, with session-recovery measures primary and merged PRs
  recorded where the repo takes PRs. Reason: `INTENT.md`, `README.md` and the later "Specialize first…" decision all
  point at docs-first repos, and merged PRs remain a concrete signal where they exist.
- **Depends on it:** what `TODO.md` Next Up item 2 records for each repo in the batch. No change is drafted.

## Q5. When may an agent file a GitHub issue through the feedback helper?

- **Statement and source:** `skills/entropy-assessment/SKILL.md` line 150, `skills/docs-first-planning-assessment/
  SKILL.md` line 217 and `AGENTS.md` line 72 use the helper "when working inside this repo".
  `skills/guards-integrator/SKILL.md` line 174 adds "or whenever the local feedback helper is available";
  `DECISIONS.md` line 66 says "use the local helper when available"; the helper itself says it is "entirely optional"
  (line 12). The helper runs `gh issue create --repo justinphilpott/entropy-guard` (lines 45-51), and its issue body
  includes the assessed project's context (lines 42, 67-68). Finding F10.
- **Readings:** (a) only while working inside entropy-guard; (b) whenever an agent can reach the helper file,
  including while integrating guards into another project.
- **Where they diverge:** an agent runs `guards-integrator` on a client's repository with entropy-guard checked out
  beside it. Under (b) it files an issue on `justinphilpott/entropy-guard` describing the client project's
  language, domain and loop, and the client's owner never sees it; under (a) it leaves the note in its output.
- **Recommended answer:** (a). Reason: the note then reaches the maintainer either way, through the output, and an
  issue about another project is filed only by someone who can see what it says. `guards-integrator` line 175
  already has the "leave it in your output" path.
- **Depends on it:** the provisional change to `guards-integrator` Step 7 (lines 174-175).
