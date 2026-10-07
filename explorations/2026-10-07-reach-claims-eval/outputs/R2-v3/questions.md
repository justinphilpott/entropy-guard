# Questions for the steward

Target: snapshot of the entropy-guard repository at commit 447da9a (read-only, no `.git`). Asked 2026-10-07.
No steward was available, so each question carries the answer I recommend, and the work continued on that
recommendation. Anything that depends on an answer is marked provisional in `assessment.md`, and nothing was
installed. Each recommendation is recorded in the target's decision log as a proposal, in
`patches/DECISIONS.md.patch`. Finding ids (F1, F2…) refer to `assessment.md`.

Three questions. Each passes both tests in the intent pass: the evidence cannot settle it, and the answer changes
what gets built or what the guard checks.

---

## Q1. Who is the steward, and may contributors, including agents, edit `INTENT.md` directly? (F1)

**The statements and their sources**

- `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents… When you update it, note the
  date and what prompted the revision."
- `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated note".
- No file names who decides what the project is for. None of the 14 entries in `DECISIONS.md` has an author or a
  date. `LICENSE` names "entropy-guard", not a person.

**The candidate readings**

- (a) Any contributor, human or agent, may revise `INTENT.md` with a dated note. `DECISIONS.md` entries bind whoever
  wrote them.
- (b) A named steward decides intent. Agents record intent changes in `DECISIONS.md` as proposals, and `INTENT.md`
  changes only after the steward's recorded decision.

**A case from this repo where they lead to different work.** `TODO.md:19` says "Consider additional specialized
tracks after docs-first planning validation (code-first, …)". Under (a), an agent that builds a code-first track
also rewrites `INTENT.md:129` ("The first validation wedge should be… docs-first planning systems") and
`README.md:23` itself, in the same session. Under (b), it records "Proposed: add a code-first track to the
validation scope" in `DECISIONS.md`, and leaves `INTENT.md` alone until the steward decides. The refined guard's
intent-change rule (`guard/SKILL.md`, Intent section) works only under (b).

**Recommended answer: (b), with Justin Philpott as steward.**

- He is the only person named anywhere in the repo: `PHILOSOPHY.md:43`, the front matter of the explorations, the
  repository owner in `skills/local/entropy-guard-feedback/SKILL.md:10`, and the links in `AGENTS.md:68` and
  `DECISIONS.md:142`.
- `INTENT.md:33` rates intent entropy "catastrophic to recover".
- Agents are regular contributors here (`AGENTS.md:3`). Under (a), an agent can change the north star in the same
  session as the work that wants it changed.

**If the answer is (a):** the guard's intent-change rule, which the generator copies verbatim (rule v2), no longer
fits this repo. The generator gives no variant for a collaboratively governed intent document, so the guard's Intent
section would need rewriting by hand. This is also noted in `feedback.md`.

**Recorded as:** "Proposed: name the steward, and change intent only on the steward's recorded decision", in
`patches/DECISIONS.md.patch`.

---

## Q2. Which skill owns guard building? (F2)

**The statements and their sources**

- `skills/docs-first-planning-assessment/SKILL.md:132-202`: Phase 2 "Guard Generation / Refinement" designs the
  docs-first delta guard (Step 7), and its output is "the refined or generated guard".
- `skills/session-coherence-skill-generator/SKILL.md:198-231`: it generates `skills/session-coherence-guard/SKILL.md`
  from its own template, with modes, judgment checks and mechanical checks.
- `INTENT.md:86-88`: "the generator and integrator exist as explicit skills". The generator role is "carried by the
  assessment workflow rooted at `skills/entropy-assessment/` and… `skills/docs-first-planning-assessment/`". It does
  not mention `session-coherence-skill-generator`.
- `README.md:91` and `AGENTS.md:46` both say `session-coherence-skill-generator` "generates repo-specific session
  handoff guards".
- `DECISIONS.md:7-11`, the newest entry, adds bootstrap mode to `session-coherence-skill-generator`. No entry adds
  the skill itself or says where it sits in the lifecycle.
- `skills/entropy-assessment/SKILL.md:116-124`, the front door's list of next moves, never names
  `session-coherence-skill-generator`.

**The candidate readings**

- (a) `session-coherence-skill-generator` is the one guard builder for every repo shape. Docs-first Phase 2 supplies
  its docs-first checks to it, and the front door hands it the profile and the ranked risks.
- (b) Docs-first Phase 2 builds guards for docs-first repos. `session-coherence-skill-generator` handles young-repo
  bootstrap, and repos that have no specialised track.
- (c) Both stay as peers, and each run picks one.

**A case from this repo where they lead to different work.** `TODO.md:12` says "Generate or refine guards for those
projects". Take a batch repo shaped like this one:

- Under (a), it gets a guard in the generator's template: modes, mechanical checks, default path
  `skills/session-coherence-guard/SKILL.md`.
- Under (b), it gets a docs-first delta checklist shaped like `skills/local/entropy-guard/SKILL.md`.
- Under (c), each run picks a builder, so `TODO.md:13` ("Use the results to refine…") compares two different guard
  shapes.

**Recommended answer: (a).**

- With one builder, the validation batch produces one guard shape, and its results can be compared.
- The newest recorded work invested in this generator: `DECISIONS.md:7-11`, and the generator's metadata, dated
  2026-05-10 and 2026-05-11.
- Docs-first's Step 7 checklist becomes an input to the generator rather than a second builder.
- It fits `DECISIONS.md` "Guard creation skills over guard libraries": the meta-skill is the product.

**If (a) is chosen, these change:**

- `INTENT.md` "The guard lifecycle", by the steward's decision;
- `README.md:52`;
- the front door's next moves;
- docs-first Phase 2;
- `skills/guards-integrator/SKILL.md:20`.

**Recorded as:** "Proposed: one skill owns guard building", in `patches/DECISIONS.md.patch`.

---

## Q3. What does the validation batch measure? (F5)

**The statements and their sources**

- `DECISIONS.md:26`: "…assess a larger set of open source projects, generate or refine guards, run them locally while
  making targeted improvements, and track whether that produces more merged PRs."
- `INTENT.md:135`, in a document last revised 2026-04-07: "track whether this produces clearer session recovery,
  fewer reintroduced stale ideas, more coherent docs, and sharper feedback on what the methodology gets right or
  wrong".
- `README.md:125`: "…clearer sessions, fewer reintroduced stale ideas, and more useful changes in the wild."
- `TODO.md:12`: "track what changes prove useful".

**The candidate readings**

- (a) Merged PRs in the assessed projects remain the outcome measure.
- (b) The session-quality measures in `INTENT.md` replace it.
- (c) Both: merged PRs as the outcome, and the session measures as the diagnosis.

**A case from this repo where they lead to different work.** The first thing the batch builds is its record of each
assessed repo (`TODO.md:11-13`).

- Under (a), the record lists the guard-driven changes offered upstream and whether each merged. This needs external
  repos with maintainers.
- Under (b), the record holds observations of session recovery. These can come from the steward's own repos, where
  no PR exists.
- A batch made of the steward's own private planning repos counts under (b), and not under (a).

**Recommended answer: (c).**

- `INTENT.md` appears to be the later of the two sources. The farm-out decision follows "the March 2026
  explorations" (`DECISIONS.md:25`), and `INTENT.md` was revised on 2026-04-07. But `INTENT.md` does not say that
  merged PRs were dropped.
- Recording both costs one more column per repo.

**Recorded as:** "Proposed: what the validation batch measures", in `patches/DECISIONS.md.patch`.

---

## Not asked, because the evidence settles them

- **Should `explorations/` be deleted, now that the sibling repo exists? (F10)** No. `PHILOSOPHY.md:45` and
  `LEARNINGS.md:122` cite `explorations/2026-03-19-autopoiesis.md` by path. The smaller fix is to mark the folder
  as historical.
- **Do the `DECISIONS.md` entries that describe the old Phase 2 still apply? (F4)** No. "Specialize first…"
  (`DECISIONS.md:15-19`) replaced that structure, and the current front door
  (`skills/entropy-assessment/SKILL.md`, v0.6.0) has no Phase 2. Corrected by marking them, citing that entry.
- **Where should the refined guard live? (F9)** In place, at `skills/local/entropy-guard/SKILL.md`. The generator
  says to update an existing equivalent guard rather than create a duplicate, and `AGENTS.md`, `README.md` and the
  hook all name that path.
