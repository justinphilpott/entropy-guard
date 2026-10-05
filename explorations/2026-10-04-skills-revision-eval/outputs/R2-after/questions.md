# Questions for the steward

Steward: Justin Philpott. No document in the target names him as the person who decides intent; the inference rests on
the GitHub links in `DECISIONS.md` and `skills/local/entropy-guard-feedback/SKILL.md` (`justinphilpott/...`) and on
his attributed words in `PHILOSOPHY.md` line 43 and the `explorations/` transcripts.

No steward was available for this run. Each question below carries the answer I recommend; the run continued on that
recommendation, and the outputs that depend on it are listed and marked provisional in `assessment.md`. When the
steward is present, ask these one at a time, in this order. Answers go into the target's `DECISIONS.md`, dated and
attributed.

All line numbers refer to the snapshot `entropy-guard-447da9a`, read 2026-10-04.

---

## Q1. Who may change `INTENT.md`?

**Statements and sources:**

- `INTENT.md` line 3: "It is meant to be refined collaboratively — by humans and AI agents ... When you update it,
  note the date and what prompted the revision."
- `AGENTS.md` line 27: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `skills/local/entropy-guard/SKILL.md` line 68: "if INTENT.md itself needs revision, update it with a dated note".
- Against these, the guard this run builds carries the intent-change rule: `INTENT.md` changes only after the
  steward's recorded decision.

**Candidate readings:**

- (a) Any contributor, including an AI agent in any session, may revise `INTENT.md`, with a dated note.
- (b) Agents propose intent changes in `DECISIONS.md`; only Justin's recorded decision changes `INTENT.md`.

**Where they lead to different work, in this repo:** `INTENT.md` line 88 says the guard-generator role "is carried by
the assessment workflow rooted at `skills/entropy-assessment/`". A session that makes
`skills/session-coherence-skill-generator/` the only guard builder would, under (a), rewrite line 88 itself in the same
commit. Under (b), it records a `Proposed:` entry in `DECISIONS.md` and leaves line 88 alone until Justin decides.

**Recommended answer: (b).** `INTENT.md` is the fixed reference the guard measures drift against. If the session being
checked may edit it, drift gets absorbed into the reference instead of caught. The "Last revised" line (line 5) is
unattributed, so today nobody can tell which intent revisions Justin made. If accepted, reword `INTENT.md` line 3 and
`AGENTS.md` line 27 to say agents propose and Justin decides, and name Justin as steward in `INTENT.md`. Those edits
are intent-document edits, so they wait for his recorded answer.

**Provisional outputs that depend on it:** the "Intent" section of `guard/SKILL.md` (steps 3-5), which contradicts
`AGENTS.md` line 27 until this is answered; judgment check 1 of `guard/SKILL.md`.

---

## Q2. Do the existing `DECISIONS.md` entries stand as your decisions, and how are new ones recorded?

**Statements and sources:**

- `DECISIONS.md` holds 17 entries. None is dated, and none says who decided.
- The current local guard tells every session to add its own choices directly: `skills/local/entropy-guard/SKILL.md`
  lines 40-46 ("Did you choose between approaches ... If yes to any: does it appear in DECISIONS.md? Add it if not.").
- So the log cannot tell Justin's decisions apart from choices an agent recorded.

**Candidate readings:**

- (a) Every existing entry is Justin's decision: he owns the repo and the entries reached `main`.
- (b) Entries are a mix of Justin's decisions and agents' recorded choices, all with equal standing.
- (c) Entries are descriptions until Justin ratifies each one.

**Where they lead to different work, in this repo:** the "Specialize first around docs-first planning repos" entry
(lines 15-19) says entropy-assessment now does "triage and routing". Under (a), three older entries that still
describe entropy-assessment's removed Phase 2 and appendices are marked partially superseded now, citing it
(`proposed-decisions.patch`). Under (c), each correction waits for Justin.

**Recommended answer: (a) for the 17 existing entries, ratified as a block as of this snapshot.** From now on, an
entry Justin makes opens `Justin, <date>:`. An entry an agent records opens `Proposed <date> by <who>, awaiting Justin.`
and changes status only on his word. Re-hearing 17 settled entries costs more than it returns. The new convention makes
authority visible from here on.

**Provisional outputs that depend on it:** the three supersession notes in `proposed-decisions.patch`; every gap
classified "stale description" in `assessment.md`; judgment check 1 and Intent step 3 of `guard/SKILL.md`.

---

## Q3. Which one skill builds guards?

**Statements and sources:**

- `skills/docs-first-planning-assessment/SKILL.md` Step 7 (lines 154-173) designs the guard, and its Output (line 196)
  delivers "the refined or generated guard".
- `skills/session-coherence-skill-generator/SKILL.md` (lines 198-315) builds guards from its own template. The template
  includes a "Current Repo Direction" paragraph (line 284) and still refers to another project, "FlowBook" (lines 22
  and 193).
- `INTENT.md` line 88 names only the assessment workflows as the guard generator.
- `skills/entropy-assessment/SKILL.md` lines 66-71 route no shape to the session-coherence generator. Its fallback
  (line 122) says "add a lightweight general post-work guard", with nothing that builds one.
- No `DECISIONS.md` entry adopts the session-coherence generator. The top entry (lines 7-11) only adds a mode to it.

**Candidate readings:**

- (a) Two builders: docs-first Phase 2 for docs-first planning repos, the session-coherence generator for every other
  shape and for young repos.
- (b) One builder: the session-coherence generator. The two assessment skills supply analysis and checks to it.
- (c) The session-coherence generator is an imported experiment and not yet part of the exported set.

**Where they lead to different work, in this repo:** the next validation batch (`TODO.md` "Next Up") runs on
docs-first planning repos. Under (a), their guards follow docs-first Step 7's checklist. Under (b), they follow the
generator's template, which adds the current-direction paragraph and the four invocation modes. Two repos assessed in
the same week could get differently shaped guards, and a defect found in one template stays in the other.

**Recommended answer: (b).** The front door's non-docs-first routes have no guard builder today, and the generator is
the only skill that handles young repos. One template means one place to fix a guard defect. If accepted:
entropy-assessment routes young repos to the generator's bootstrap mode; docs-first Phase 2 hands its checks to the
generator; `INTENT.md` line 88 names the generator (after Q1's rule); the FlowBook references go.

**Recorded as:** the `Proposed:` entry at the top of `DECISIONS.md` in `proposed-decisions.patch`.

**Provisional outputs that depend on it:** the "Building guards" row of judgment check 3 in `guard/SKILL.md` (written
to stay correct either way); bootstrap action B6 in `assessment.md`.

---

## Q4. What is the validation batch, and how is success measured?

**Statements and sources:**

- `DECISIONS.md` line 26 ("Farm broader entropic-immunity exploration..."): "assess a larger set of open source
  projects ... and track whether that produces more merged PRs."
- `INTENT.md` lines 129-135, revised 2026-04-07: "docs-first planning / architecture / blueprint repos", tracking
  "clearer session recovery, fewer reintroduced stale ideas, more coherent docs, and sharper feedback".
- `README.md` line 125 adds "more useful changes in the wild". `TODO.md` lines 11-13 follow `INTENT.md`.

**Candidate readings:**

- (a) Open-source docs-first repos owned by others; success means PRs merged by their maintainers.
- (b) Any docs-first planning repos, including Justin's own; success means the session-recovery and coherence
  measures.
- (c) Both kinds; INTENT's measures for all, merged PRs as an extra signal where the repo is someone else's.

**Where they lead to different work, in this repo:** choosing the batch. Justin's own planning repos qualify under (b)
and yield no merged-PR signal under (a).

**Recommended answer: (c).** `INTENT.md`'s statement is the later and more specific one. Keeping merged PRs where they
exist preserves an outside test that the methodology helps someone other than its author.

**Provisional outputs that depend on it:** only next action 3 in `current-state-update.patch`. The guard does not depend
on it, which is why it is asked last.
