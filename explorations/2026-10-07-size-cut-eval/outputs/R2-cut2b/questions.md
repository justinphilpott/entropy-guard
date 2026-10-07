# Questions for the steward

Target: `entropy-guard-447da9a` (read-only snapshot of entropy-guard). Steward, on the evidence in `assessment.md`
finding F1: Justin Philpott. No steward was available in this run, so each question carries the recommended answer,
and the work was continued on that recommendation as a draft only. Nothing that depends on an answer was applied to
the target. Each question is also written as a proposal in `decisions.patch` and listed in `state-file.patch`.

Three questions, in the order to ask them. The first is the one the guard depends on.

---

## Q1. Who may change `INTENT.md`?

**The statements and their sources**

- `INTENT.md:3`: "It is meant to be refined collaboratively — by humans and AI agents — as our understanding deepens.
  When you update it, note the date and what prompted the revision."
- `INTENT.md:139`: "If you find something missing, imprecise, or worth expanding — add it."
- `AGENTS.md:27`: "If a decision refines or challenges the intent, update INTENT.md and note why."
- `AGENTS.md:32`: "Prefer updating the core knowledge docs (`README.md`, `INTENT.md`, ...) in the same change when
  behavior or methodology shifts."
- `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated note".

Findings F3 and F5.

**The readings**

- (a) **Direct collaborative editing.** Any contributor, agent included, may revise `INTENT.md` in the same change as
  the work, with a dated note. This is what the repo says today.
- (b) **Proposal first.** An agent that finds the intent wrong records a proposal in `DECISIONS.md`, marked as
  awaiting you. `INTENT.md`, `README.md` "Project status" and `AGENTS.md` "Project Constraints" change only after you
  record the decision. Agents may still draft the wording inside the proposal.

**Where they diverge, in this repo.** The 2026-04-07 revision of `INTENT.md` (`INTENT.md:5`) set the validation
loop's measure to session recovery and fewer reintroduced stale ideas (`INTENT.md:135`). `DECISIONS.md:26` still
records "more merged PRs". Under (a) that change was legitimate whoever made it, and the conflict in Q2 is just stale
text. Under (b) it would have sat in `DECISIONS.md` as a proposal until you chose, and nothing records who chose.

**Recommended answer: (b), proposal first.** Your own words in the 2026-03-24 conversation
(`explorations/2026-03-24-entropy-immune-system-conversation.md:543`): "we're clear that the 'question intent' signal
is actually rare". `LEARNINGS.md:133` says the intent "should be the most protected and slowest-changing element".
In this snapshot, intent text has already moved twice without a recorded decider (F5, F6).

**What depends on it.** The refined guard's Intent section (`guard/SKILL.md`) carries entropy-guard's intent-change
rule, which is reading (b). It is drafted as provisional and should not replace the current guard until you answer.
`INTENT.md:3`, `INTENT.md:139`, `AGENTS.md:27` and `AGENTS.md:32` are left unchanged by every patch.

**If you choose (a):** record it in `DECISIONS.md`, and replace rule step 4 in the guard with: "Edit `INTENT.md` only
with a dated note saying what prompted the change and who decided it."

---

## Q2. What does the validation batch measure?

**The statements and their sources**

- `DECISIONS.md:26` ("Farm broader entropic-immunity exploration..."): "assess a larger set of open source projects,
  generate or refine guards, run them locally while making targeted improvements, and track whether that produces
  more merged PRs."
- `INTENT.md:129-135`: docs-first planning repos; "track whether this produces clearer session recovery, fewer
  reintroduced stale ideas, more coherent docs, and sharper feedback".
- `README.md:125`: the same docs-first list, ending "more useful changes in the wild". `TODO.md:11-13`: "track what
  changes prove useful".
- `DECISIONS.md:15-19` ("Specialize first around docs-first planning repos...") settles which repos come first. It
  does not settle the measure.

Finding F5.

**The readings**

- (a) Merged PRs on external projects, which matches your description of the method's first results
  (`explorations/2026-03-19-autopoiesis.md:22`: "extremely well targetted work... merged within minutes").
- (b) The session-quality measures in `INTENT.md:135`.
- (c) (b) first, and also record whether changes were accepted wherever the assessed repo has a PR flow.

**Where they diverge, in this repo.** Take one private docs-first planning repo with no pull requests. Under (b) it
is a good batch member. Under (a) it yields no data. Then take an open-source code repo with active PR review. Under
(a) it is a good member, but it falls outside the docs-first wedge that `DECISIONS.md:18` set.

**Recommended answer: (c).** Your `DECISIONS.md:18` decision puts docs-first repos first, and session quality is what
those repos can show. Accepted changes were the first signal of the method's value, and they cost little to record
where they exist. Record the measure once, in `DECISIONS.md`, and have `INTENT.md`, `README.md` and `TODO.md` link to
it, because today four files state the loop.

**What depends on it.** How the batch in `TODO.md` "Next Up" is chosen and scored. The three existing Next Up items
are left word for word.

---

## Q3. Which skill writes guards?

**The statements and their sources**

- `INTENT.md:86-88`: "the generator and integrator exist as explicit skills"; the generator role "is carried by the
  assessment workflow rooted at `skills/entropy-assessment/` and... `skills/docs-first-planning-assessment/`".
- `skills/docs-first-planning-assessment/SKILL.md:132-202`: Phase 2 generates or refines guards.
- `skills/session-coherence-skill-generator/SKILL.md` (metadata dated 2026-05-10 and 2026-05-11) also generates guards,
  with its own template and its own default path `skills/session-coherence-guard/SKILL.md`. `README.md:91` and
  `AGENTS.md:46` list it. `DECISIONS.md:7-11` extends it, but sets no role relative to Phase 2. `INTENT.md` does not
  mention it.

Findings F6 and F7.

**The readings**

- (a) Two writers, split by repo shape: Phase 2 for docs-first repos, the generator for everything else.
- (b) The generator is the only writer. The assessments supply analysis and checks.
- (c) Phase 2 stays the writer. The generator is demoted or retired.

**Where they diverge, in this repo.** Refining this repo's own guard. Under (a) or (c), the shape comes from
docs-first Step 7's checklist areas. Under (b), the shape comes from the generator's template: front matter, modes,
mechanical checks and the output section. The stale line in `guards-integrator` ("After `entropy-assessment`
generates one or more guards") also needs one name, and which name depends on this answer.

**Recommended answer: (b).** It is the newest recorded investment (`DECISIONS.md:7-11`). Its bootstrap mode covers
young repos, which Phase 2 does not. One writer removes two parallel guard contracts. Record the decision in
`DECISIONS.md`, then update `INTENT.md:86-88`.

**What depends on it.** The `cleanup.patch` fix to `guards-integrator` names no generator. `INTENT.md:86-88` and
docs-first Phase 2 are left unchanged. The refined guard covers every checklist area in docs-first Step 7, so it holds
under any of the three answers (see `assessment.md`, "Guard generation report").
