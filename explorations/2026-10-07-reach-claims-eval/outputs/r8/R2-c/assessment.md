# Entropy assessment: entropy-guard snapshot 447da9a

- **Target:** `scratchpad/eval/targets/entropy-guard-447da9a`, a read-only copy of the entropy-guard repository
  with no `.git`. Its newest dated artifact is from 2026-05-11.
- **Assessed:** 2026-10-07, by an agent following entropy-guard's skills: `entropy-assessment` 0.9.0,
  `docs-first-planning-assessment` 0.3.0, `session-coherence-skill-generator` 0.5.0 and `guards-integrator` 0.4.0.
  The target holds older versions of the same skills; here they are content being assessed, not instructions.
- **Mode: plan.** The target is read-only, so nothing in it was edited. Changes are delivered as patches:
  - `patches/settled.patch`: changes that touch no open question;
  - `patches/provisional-Q1.patch` to `provisional-Q4.patch`: one per open question, to be applied only after the
    steward answers it.
  - Each patch applies to the original tree with `patch -p1`, the provisional ones after the settled one. All five
    apply together (checked 2026-10-07).

## Route

1. `entropy-assessment` Step 1 ran the intent pass (`intent-pass.md`).
2. Step 2 found the lifecycle `active` and the shape **A, docs-first planning**.
3. `docs-first-planning-assessment` then ran as a called skill: Steps 2 to 7.
4. Back in `entropy-assessment` Step 3, the guard decision is **`update`**.
5. Step 4 handed on to `session-coherence-skill-generator`, which updated the existing guard in place
   (`guard/SKILL.md`).
6. The generator handed on to `guards-integrator` (`integration.md`).

Not on this route, so not read: `mixed-profile.md`, and the generator's `bootstrap.md`. The repo already has a state
file and a decision log, so neither was needed.

---

## Intent

### Steward

**The steward is Justin Philpott, inferred; no file in the target names a steward (F2).** The evidence for the
inference:
- he makes the recorded scope decisions in `explorations/2026-03-24-entropy-immune-system-conversation.md`, dated
  2026-03-24 in its front matter:
  - `:86`: "keep it operating within its current structure, but to start a new project";
  - `:713`: "let's keep them in explorations, as I want to preserve the entropy-guard project and really farm this
    new evolution off into its own repo";
- he owns the GitHub repositories the repo links to (`skills/local/entropy-guard-feedback/SKILL.md:10`,
  `AGENTS.md:68`, `DECISIONS.md:142`).

`LICENSE` names "entropy-guard" as the copyright holder. Q1 asks the steward to confirm.

### Authorised intent, by source

| Source | Kind | Authority | Says |
|---|---|---|---|
| `INTENT.md` (whole) | description (north star) | dated 2026-04-07, unattributed | practical entropy guards; five dimensions; guards delta-scoped and low-burden; four-tool lifecycle; next step is validation on docs-first planning repos |
| `DECISIONS.md`, 17 entries | decisions | **none dated, none attributed** | e.g. specialise on docs-first repos, keeping `entropy-assessment` as the front door (`:15-19`); farm the theory out to the sibling repo (`:23-27`); one local guard (`:55-59`); External to Prompted adoption (`:31-35`) |
| `AGENTS.md:29-34` "Project Constraints" | directive | unattributed | markdown-first; exportable skills in `skills/`, local ones in `skills/local/`; theory lives in `entropy-immune-system` |
| `explorations/2026-03-24-...-conversation.md:86, :125, :713` | steward directive | attributed and dated (2026-03-24) | keep entropy-guard as the stable practical project; start the new repo; keep these documents in `explorations/` |
| `README.md:119-127` "Project status" | description | unattributed | summarises INTENT's scope and next phase |

**Authorised intent:** entropy-guard is the practical project. It covers assessment, guard generation and refinement,
integration, and validation on real repos, with docs-first planning repos as the strongest track. Broader theory
belongs to the sibling `entropy-immune-system` repo. Its guiding principles are in `INTENT.md:113-118`: minimum
viable, low burden, cumulative, self-applying.

### Declared, enacted and authorised

- **Declared:** `README.md`, `INTENT.md` and `TODO.md` say the next phase is an external validation batch on
  docs-first repos.
- **Enacted:** this cannot be read from commits, because the snapshot has no `.git`. The newest artifacts show:
  - a generic `session-coherence-skill-generator` was brought in from another repository (metadata 2026-05-10/11,
    "FlowBook" at `:22` and `:193`);
  - it gained a bootstrap mode, recorded at `DECISIONS.md:7-11`.

  Nothing shows the validation batch under way: Doing Now is empty, and all three Next Up items are open.
- **Authorised:** as above. The enacted work is covered by a decision entry, so it is not unauthorised drift. But no
  decision says how the new generator fits the lifecycle (F3).

### Existing guard repair instructions, read against the intent-change rule

- **Intent:** `skills/local/entropy-guard/SKILL.md:68` says "if INTENT.md itself needs revision, update it with a
  dated note". It treats the work as permission to change authorised intent. The same path is opened by
  `AGENTS.md:27`, `INTENT.md:3` and `INTENT.md:139` (F1).
- **Ownership:** `skills/local/entropy-guard/SKILL.md:88` says "Did you change something that another doc also
  describes? If so, update both." It keeps two independent definitions in step, and contradicts the line before it
  (`:87`, "one obvious canonical home") (F8).

  Check 6 (`:99`) keeps `README.md` "What's here" and `AGENTS.md` "Key Files" correct. Those are summaries of each
  skill's front matter, not competing definitions, so they are kept.

### Gaps by condition

| Condition | Gap | Finding |
|---|---|---|
| Ambiguous | Whether contributors may edit `INTENT.md` themselves (`INTENT.md:3`) | F1, Q1 |
| Missing | No named steward or decision authority; decisions unattributed and undated | F2, Q1 |
| Missing | No decision on which skill writes guards | F3, Q2 |
| Conflict | Validation targets and measure: `DECISIONS.md:26` against `INTENT.md:129-135` | F11, Q3 |
| Conflict | When agents may file upstream issues: five places, two readings | F10, Q4 |
| Prose control | `README.md:78` "runs ... before every commit"; nothing enforces it | F9 |
| Ambiguous (not asked) | `INTENT.md:65` "not always a skill file" against `:80` "each guard is a skill file". Case: a link check goes into a skill file under `:80`, into CI or a script under `:65`. No CI exists, so today both readings put it in the guard. | F13 |

There was no stale description: no document contradicts a later decision that plainly settles it, so nothing was
corrected on intent grounds.

### Questions and proposals

- **Questions:** Q1 to Q4, in `questions.md`, each with a recommended answer.
- **Where they are recorded:** as proposals in the target's `DECISIONS.md`, under "Proposed, awaiting the steward"
  (`patches/settled.patch`).
- **Changes that depend on an answer:** drafted in `patches/provisional-Q<n>.patch`, not applied.

---

## Lifecycle, shape, repositories

- **Lifecycle: active**, as of the snapshot. Evidence:
  - `README.md:5` and `:121` say "actively used, actively refined" and "Actively evolving";
  - `TODO.md:11-13` has three open Next Up items;
  - the newest artifact is dated 2026-05-11 (`skills/session-coherence-skill-generator/SKILL.md:6`).

  Whether the project is still active on 2026-10-07 cannot be seen from the snapshot.
- **Shape: A, docs-first planning.** Shape D, workflow-heavy, also fits: the repo exports workflows, and its guard is
  a ritual (`README.md:97` calls it "a docs + workflow-heavy repo").

  A is taken as the riskier because the top risks are documents disagreeing with documents: two guard writers, an
  editable intent, and superseded entries sitting by live ones (R1 to R3). Docs-first's loop map and workflow-drift
  check also cover D's concern. The product artifacts are skills: markdown read as instructions, whose names, steps
  and handoffs are contracts.
- **Repositories: one.** It refers to three others without depending on any of them at run time:
  - `../entropy-immune-system/`, a separate system by decision (`DECISIONS.md:23-27`), not present here and not
    assessed;
  - the seed and writing repositories on GitHub.
- **What the system reaches.** Checked across all 13 non-exploration markdown files and the hook; this list is
  complete for those:
  - GitHub, through `gh issue create` and `gh issue list` in `skills/local/entropy-guard-feedback/SKILL.md:44-51` and
    `:77`;
  - other repositories, by delegation: the exported skills write guard files there in build mode
    (`skills/session-coherence-skill-generator/SKILL.md:235-252`, `README.md:52`);
  - stderr only, from `.githooks/pre-commit`, which exits 0. I ran it on 2026-10-07.

  The four URLs, to agentskills.io and three github.com/justinphilpott repositories, are references, not actions.
  `explorations/` holds transcripts and was not checked for actions.

---

## Findings

Every other section refers to these by id. Line numbers are in the original target.

**F1. Four instructions let any session rewrite the intent.**
- Evidence:
  - `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it";
  - `AGENTS.md:27`: "update INTENT.md and note why";
  - `INTENT.md:3`: "refined collaboratively — by humans and AI agents ... When you update it";
  - `INTENT.md:139`: "add it".
- Why it matters: `INTENT.md:33` itself says intent entropy "is catastrophic to recover".
- Disposition: Q1, and `provisional-Q1.patch`.

**F2. No steward or decision authority is recorded.**
- Evidence:
  - no file names who decides;
  - all 17 `DECISIONS.md` entries are undated and unattributed;
  - the steward can be inferred only from the exploration transcripts and repository ownership (see Intent).
- Disposition: Q1. Dating the entries is a Backlog item in `settled.patch`.

**F3. Two skills write guards, and nothing decides between them.**
- Evidence:
  - `skills/docs-first-planning-assessment/SKILL.md:132-202` (Phase 2) designs and produces guards;
  - `skills/session-coherence-skill-generator/SKILL.md:198-231` writes guards to its own requirements: modes,
    mechanical commands, safety rules, default path `skills/session-coherence-guard/SKILL.md`;
  - neither mentions the other, and `skills/entropy-assessment/SKILL.md:68` routes only to docs-first;
  - `INTENT.md:88` gives the generator role to the assessment workflow alone, while `README.md:91` and `AGENTS.md:46`
    say the session-coherence skill "generates ... guards";
  - no decision records adding that skill;
  - its text refers to "FlowBook" (`:22`, `:193`), named nowhere else in the repo, and its metadata uses its own
    format (`:4-13`).
- Disposition:
  - the FlowBook wording is removed in `settled.patch`;
  - which skill owns guard writing is Q2, with `provisional-Q2.patch`.

**F4. Handoffs went stale after "Specialize first".**
- Evidence:
  - `skills/guards-integrator/SKILL.md:20` says "After `entropy-assessment` generates one or more guards", and `:221`
    says "If the assessment skill generated the guards";
  - `entropy-assessment` 0.6.0 generates no guards (`skills/entropy-assessment/SKILL.md:12`, `:68`).
- Disposition: reworded in `settled.patch` without naming a writer, so Q2 stays untouched.

**F5. Superseded decisions are not marked, and the log has no order.**
- Evidence:
  - 2 of 17 entries carry supersession notes (`DECISIONS.md:105`, `:131`);
  - four more describe parts of `entropy-assessment` that no longer exist (a Phase 2, Steps 5–8, domain appendices):
    `:39-43`, `:47-51`, `:95-99` and `:113-117`;
  - the order is neither newest nor oldest first: `:105` says "below" while `:131` says "above".
- Disposition:
  - `settled.patch` adds four partial-supersession notes, each grounded in `DECISIONS.md:15-19` and checked against
    the current skills;
  - dates are a Backlog item.
  - Not marked: Consolidate's claim to supersede "Exportable skills vs local skills" (`:134`), because that rule fully
    holds today and a note would mislead.

**F6. Superseded and imported material sits by live truth, unmarked.**
- Evidence:
  - `explorations/` holds 4 files and 1,467 lines; two are `status: draft` "for a future derived project";
  - neither `README.md` "What's here" nor `AGENTS.md` lists the folder;
  - the farm decision says that work continues in the sibling repo (`DECISIONS.md:26`);
  - three `LEARNINGS.md` entries (`:117-143`) are validated only by the 2026-03-19 conversation, and one argues that
    the mature form has "no persistent guard artifact" (`:123`).
- Disposition: `settled.patch` adds an `AGENTS.md` Quick Links pointer and lists both under "Misleading material
  nearby" in `TODO.md`. Nothing is moved or deleted, because the steward's 2026-03-24 directive keeps the files in
  `explorations/`.

**F7. The repo does not follow its own session-start practice.**
- Evidence:
  - `INTENT.md:73`, `TODO.md:12` and the docs-first skill (`:186`) prescribe reading current state at session start;
  - `INTENT.md:118` says the project is "Self-applying";
  - this repo's state file, `TODO.md`, holds only task lists: no read-first order, no open questions, no warnings
    about nearby superseded material, no staleness rule.
- Disposition: `settled.patch` adds a "Current state" section to the existing `TODO.md`, with no competing packet.

**F8. The guard contradicts itself and has gone stale.**
- Evidence, in `skills/local/entropy-guard/SKILL.md`:
  - `:87` against `:88`: one canonical home, then "update both" (the ownership flag);
  - `:99` cites `README.md` "Key Documents table", which does not exist (the tables are "What's here", `README.md:82`);
  - `:92` says "20+ markdown files", where there are 17;
  - `:33` says "use doc-health-check", a skill that does not exist (`:137`, `TODO.md:20`);
  - `:3` refers to "guard generators", plural, from the four-generator era;
  - it has no way to find the session's change, no modes or safety rules, and has not been re-evaluated since the
    generator arrived (metadata `:21`, last evaluated 2026-04-07).
- Disposition:
  - line fixes in `settled.patch`;
  - the full update in `guard/SKILL.md`, installed by `provisional-Q1.patch`.

**F9. A claim reads as enforced when nothing enforces it.**
- Evidence:
  - `README.md:78` says the project "runs its own entropy guard before every commit";
  - `AGENTS.md:19` says to skip trivial changes, and calls the run "non-negotiable";
  - the only mechanism is a non-blocking hook that each clone must link by hand (`README.md:140`), which prints and
    exits 0;
  - the snapshot holds no evidence that any run happened.
- Where enforcement would sit: the commit hook. That is already the right depth for a judgment guard
  (`DECISIONS.md:31-35`).
- Disposition: `README.md:78` is reworded to state the instruction, in `settled.patch`.

**F10. When agents may file upstream issues is defined five ways.**
- Evidence:
  - `skills/entropy-assessment/SKILL.md:150`, `skills/docs-first-planning-assessment/SKILL.md:217` and `AGENTS.md:72`
    say inside this repo only;
  - `skills/guards-integrator/SKILL.md:174` and `DECISIONS.md:66` say whenever the helper is available;
  - filing is a public side effect.
- Disposition: Q4, with `provisional-Q4.patch`.

**F11. The validation targets and measure conflict.**
- Evidence: `DECISIONS.md:26` says "open source projects ... more merged PRs"; `INTENT.md:129-135`, `README.md:125`
  and `TODO.md:11-13` say docs-first repos and session-recovery measures.
- Disposition: Q3, with `provisional-Q3.patch`.

**F12. Seed scaffolding assumes code that does not exist.**
- Evidence:
  - `AGENTS.md:21` says "Working code with tests beats perfect code", and `:23` says "Docs travel with code";
  - `.gitignore` has a Go section, and `.editorconfig` has Python, Go and Makefile rules;
  - `AGENTS.md:31` and `:51` say there is no code "yet".
- Disposition: a Backlog check only, because "yet" leaves room for code.

**F13. `INTENT.md` contradicts itself on whether a guard is always a skill file.**
- Evidence: `INTENT.md:65` against `INTENT.md:80` (see the gaps table).
- Disposition: low impact today; noted, not asked.

**F14. Work state is split between `TODO.md` and GitHub issues.**
- Evidence: `DECISIONS.md:17` drives a decision from issues #9–#12, and `TODO.md` mentions no issue.
- Disposition: a Backlog item in `settled.patch`, plus a guard check.

**F15. `README.md` repeats a prompt and refers to a writer it cannot name.**
- Evidence:
  - `README.md:44-48` and `:54-58` differ only in "a delta guard" against "the entropy guard";
  - `:78` says "what the generator produces", which is ambiguous under F3;
  - `LEARNINGS.md:63` names a "distill-article skill" that is not in this repo. It may be in the writing repo, which
    could not be checked.
- Disposition: deferred until Q2, which changes the same lines.

---

## Truth map (docs-first Step 2)

| Concept | Owner | Summaries, links or competitors |
|---|---|---|
| Purpose and scope | `INTENT.md` | summaries: `README.md:1-7, 119-127`; `AGENTS.md:3, 29-34` |
| Entropy model (dimensions, depth, inter-domain drift) | `INTENT.md:9-43, 98-109` | `README.md:70-74` links |
| Guard lifecycle (four tools) | `INTENT.md:84-96` | **contested**: the docs-first Phase 2 and the generator both act as the writer (F3) |
| What each skill is | each `SKILL.md`'s front matter | summaries: `README.md:84-98` "What's here", `AGENTS.md:36-47` "Key Files" |
| Working practices | `AGENTS.md:17-27` | summaries: `README.md:131-140`; reminder: `.githooks/pre-commit`; checked by the guard |
| Current work | `TODO.md` | summary: `README.md` "Project status"; also GitHub issues, not linked (F14) |
| Decisions | `DECISIONS.md`, the only decision log | unattributed and undated (F2, F5) |
| When to file upstream issues | **no owner** | five places, two readings (F10) |
| Validation measure | **no owner** | `DECISIONS.md:26` against `INTENT.md:129-135` (F11) |
| Steward and authority | **no owner** | (F2) |

**Document roles:**
- **Canonical:** `INTENT.md`, `DECISIONS.md`, `AGENTS.md`, `LEARNINGS.md`.
- **Current state:** `TODO.md`.
- **Product artifacts:**
  - the four exported skills in `skills/`;
  - `skills/local/entropy-guard`, the repo's own guard and the reference example;
  - `skills/local/entropy-guard-feedback`;
  - `.githooks/pre-commit`.
- **Templates:** the generator's guard template (`:268-315`) and the integrator's scaffolds.
- **Historical or imported:**
  - `explorations/`;
  - the FlowBook residue in the generator;
  - the four stale `DECISIONS.md` entries (F5);
  - three `LEARNINGS.md` entries (F6).
- **Free space, kept by decision:** `PHILOSOPHY.md` (`DECISIONS.md:142`).

## Loop map (docs-first Step 3)

This is the loop as documented. It could not be observed, because there is no `.git`, no CI and no PR template.

- **Session start:** an agent reads `AGENTS.md`. A fresh read-only agent did this on 2026-10-07 (see
  `integration.md`). Quick Links point to `INTENT.md` and `TODO.md`. Nothing says what to read first, or what not to
  trust (F7).
- **Work tracking:** `TODO.md` "Doing Now", cleared before commit (`AGENTS.md:22`). Some work state lives in GitHub
  issues (F14).
- **Capture:** decisions and learnings are captured at session end, by guard checks 1 and 2.
- **Coherence pause:** the guard runs at the end of meaningful work, before commit (`AGENTS.md:19`). A reminder fires
  at commit if the clone enabled the hook (F9).
- **Handoff:** the commit, whose message carries the guard note (`README.md:138`). Pull requests are sometimes used
  (`LEARNINGS.md:152`).

## Ranked risks (docs-first Step 4)

Ranked by decay rate times recovery cost:

| # | Risk | Decay | Recovery | Symptoms | Anchor for the fix |
|---|---|---|---|---|---|
| R1 | Parallel truth: two guard writers | medium: every edit to either skill widens it | high: users get different guards depending on the route taken | F3, F4, F15 | a `DECISIONS.md` decision on Q2, then `INTENT.md` "The guard lifecycle" |
| R2 | Ungoverned change of intent | slow | catastrophic (`INTENT.md:33`) | F1, F2 | a `DECISIONS.md` decision on Q1 |
| R3 | Superseded material nearby | slow to medium | medium: re-litigating decisions, reviving farmed-out theory | F5, F6 | supersession notes in `DECISIONS.md`; `AGENTS.md` Quick Links; `TODO.md` "Current state" |
| R4 | No session-start state | every session | low to medium | F7, F14 | `TODO.md` |
| R5 | Guard and workflow drift | fast | cheap if caught within a session | F8, F9, F12 | the guard; `AGENTS.md` |

## Recommendations (docs-first Step 6)

- **Consolidate:** one guard writer (Q2). Recommended: `session-coherence-skill-generator` writes guards, and
  `docs-first-planning-assessment` supplies the checks.
- **Demote:**
  - `explorations/`, as seed material for the sibling repo;
  - the three conversation-validated `LEARNINGS.md` entries, as theory. The settled patch only lists them as
    misleading. Moving them out of `LEARNINGS.md` is left to the steward: "LEARNINGS.md stays tactical"
    (`DECISIONS.md:139-143`) is undated, so it may predate these entries.
- **Mark historical:** the four `DECISIONS.md` entries in F5.
- **Name the authority:** record the steward and the rule for changing intent (Q1).

## One-time cleanup

Each item was checked against the current file on 2026-10-07:

| Item | File and line checked | Where |
|---|---|---|
| Remove the FlowBook references | `skills/session-coherence-skill-generator/SKILL.md:22, :193`; no other mention in the repo (grep) | settled |
| Reword the integrator's stale handoffs | `skills/guards-integrator/SKILL.md:20, :221` | settled |
| Add supersession notes to four entries | `DECISIONS.md:39, :47, :95, :113`; each claim checked against `skills/entropy-assessment/SKILL.md:60, :85` and `skills/docs-first-planning-assessment/SKILL.md:152, :199, :202` | settled |
| Add the explorations pointer | `AGENTS.md:15` (sibling line); `explorations/` exists, with 4 files | settled |
| Make the guard's line fixes | `skills/local/entropy-guard/SKILL.md:3, :33, :88, :92, :99` | settled |
| Restate `README.md:78` as the instruction | `README.md:78`, `AGENTS.md:19`, `.githooks/pre-commit` (run) | settled |
| Date the decision entries | `DECISIONS.md`: 17 entries, 0 dated | `TODO.md` Backlog |
| Link the GitHub issues | `DECISIONS.md:17`; `TODO.md` has no issue references | `TODO.md` Backlog |
| Check whether the seed residue still fits | `AGENTS.md:21, :23`; `.gitignore` Go section; `.editorconfig` | `TODO.md` Backlog |

## State-file update (docs-first Step 5)

The update is a new "Current state" section in the existing `TODO.md`, in `patches/settled.patch`. No competing file
was added.

- **What it holds:**
  - where to read first;
  - the settled decisions, linked by their `DECISIONS.md` headings;
  - the four open questions, pointing at their proposals;
  - the misleading material nearby;
  - three next actions.
- **Stage:** it points to `README.md` "Project status" rather than restating it.
- **Freshness:** its claims are dated 2026-10-07. It says what makes it stale, and that whoever ends a session
  refreshes it through the guard.
- **Open questions:** they are listed as open, and nothing in the section states an answer.
- **Generator Step 1** says to record the work in the state file. Here that is the Backlog cleanup items. "Doing Now"
  stays empty, because the patch is the committed end state.

---

## Guard surfaces (docs-first Step 7.1)

| Surface | Executes? | Verdict |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | no (judgment ritual) | **amend**: line fixes now (settled); full update in place (`guard/SKILL.md`, after Q1) |
| `.githooks/pre-commit` | yes, if a clone links it; prints and exits 0 | **keep**: its text still matches the guard path and the "Doing Now" rule |
| `AGENTS.md` "Working Practices" | no | **amend**: the line-27 intent path after Q1; the Quick Links pointer now |
| `README.md` "Contributing" | no | **keep**: a summary; the updated guard's Report now matches its "entropy check clean" rule |
| `TODO.md` | no | **amend**: "Current state" section (settled) |
| `DECISIONS.md` | no | **amend**: proposals and supersession notes (settled) |
| `INTENT.md:3, :139` | no | **amend after Q1** |
| `skills/local/entropy-guard-feedback/SKILL.md` | yes: `gh issue create` | **keep**; when to call it waits on Q4 |
| CI, PR templates, hook frameworks | none exist | n/a |

## Guard checks against this repo's files (docs-first Step 7.2)

Each row of docs-first's matrix became one check in `guard/SKILL.md` "Checks":

| Matrix row | Check, against this repo's files |
|---|---|
| Parallel truth | one owner per concept; the "What's here" and "Key Files" summaries kept correct (Repairs, and standing check 1) |
| Product-artifact handoffs | a skill's name, path, steps or handoff changed, so check its callers, the summaries and `INTENT.md` "The guard lifecycle" (F3, F4) |
| Superseded material nearby | before reviving anything, check the `DECISIONS.md` notes and `TODO.md` "Current state" (F5, F6) |
| Stale references | a bash link check and a search for each old name (F8) |
| Lost decisions and learnings | `DECISIONS.md`, dated (F2); `LEARNINGS.md`, tactical only |
| State dishonesty | `TODO.md` "Current state" and "Doing Now", against `README.md` "Project status" and `INTENT.md` (F7) |
| Workflow drift | `AGENTS.md`, `README.md` "Contributing", the hook and the guard agree (F9) |
| Brittle automation | automate only the link check and `git diff --check`; wording stays a matter of judgment |
| Issues | an issue filed or closed is linked from `TODO.md` (F14) |

## Guard decision and generator inputs

**Decision: `update`.** A sound guard exists, and its single-guard design is a recorded decision
(`DECISIONS.md:55-59`). It needs amending for F1, F8 and F9, and to cover R1, R3 and R4.

The generator's inputs:

- **Steward:** Justin Philpott (inferred, unresolved: Q1).
- **Intent documents:** `INTENT.md` and `AGENTS.md` "Project Constraints". Steward directives sit in
  `explorations/2026-03-24-entropy-immune-system-conversation.md:86, :125, :713`.
- **Decision surface:** `DECISIONS.md`.
- **Open intent questions:** Q1 to Q4.
- **Current-state file:** `TODO.md`, refreshed by whoever ends a session (`AGENTS.md:22`).
- **Rules bound by but not owned:**
  - the agentskills.io skill format (`DECISIONS.md:79-83`). Because of it, the updated guard keeps
    `name: entropy-guard` to match its folder, rather than the template's `session-coherence-guard`;
  - seed scaffolding feedback (`AGENTS.md:66-68`);
  - user-wide agent instructions: unresolved, as none are visible from the snapshot.
- **Verification commands:** none exist (`AGENTS.md:49-58`), and none run by themselves, as there is no CI. The guard
  adds `git diff --check` and a link check.
- **Code areas:** none. The exported skills stand in for code, described by `README.md` "What's here", `AGENTS.md`
  "Key Files" and `INTENT.md` "The guard lifecycle".
- **Live state a session can change:** public issues on `justinphilpott/entropy-guard`, through the feedback helper.
  No spend.
- **Findings:** F1 to F15.

## Generator output

- **Path:** `guard/SKILL.md`, an update in place of `skills/local/entropy-guard/SKILL.md`.
- **Install:** `patches/provisional-Q1.patch` installs it, because its Intent section states what Q1 asks.
- **Interim:** until then, the settled line fixes improve the existing guard.
- **Size:** 1,167 words, measured with `wc -w` on 2026-10-07. That includes a 49-word install note that is deleted on
  install, leaving about 1,118 words. The old guard was 1,400 words.
- **Budget: about 1,153 words.** The terms:
  - the common contract: 706 (the generator's measurement);
  - checks: 9 repo-specific beyond the 2 standing ones, at 36 each, so 324;
  - pointers: about 64 (79 words in "Where things live", less about 15 words of template labels);
  - commands: about 59 (the 52-word repo command block, plus about 7 words for the upstream fallback).

  Installed, the guard is under budget. With the temporary note it is about 14 words over.
- **Contract review (generator Step 4):**
  - it carries "Modes and safety";
  - its baseline is bound, with a fallback to `origin/HEAD`;
  - its repairs are checked against intent: no repair edits `INTENT.md`;
  - nothing in `settled.patch` touches Q1 to Q4.
- **Doc references:** none added. `AGENTS.md:19` and `:41` already name the guard's path, which does not change.
- **Validation, on 2026-10-07:**
  - `git diff --no-index --check` over the original and fully patched trees found no whitespace errors;
  - the guard's own link check, run in bash on the fully patched tree, was clean, and it flagged a planted broken
    link;
  - every patch applies with `patch -p1`, alone and together.
  - On the first run, the link check flagged its own command, whose text contained a literal `](`. I rewrote the
    command and re-ran it.
- **Left open in the guard:** the steward line ("inferred, not yet recorded"), and user-wide instructions. The `<start>`
  placeholder is for the person running the guard to fill in.
- **Handed to** `guards-integrator`: see `integration.md`.

## Patches

| File | Touches | Apply when |
|---|---|---|
| `patches/settled.patch` | no open question. It changes `TODO.md`, `AGENTS.md` (Quick Links), `DECISIONS.md` (proposals and notes), `README.md:78`, the integrator's two lines, the generator's FlowBook lines, and the guard's line fixes | now |
| `patches/provisional-Q1.patch` | Q1. It changes `AGENTS.md:27` and `INTENT.md:3, :139`, and installs `guard/SKILL.md` | after the steward answers Q1 as recommended |
| `patches/provisional-Q2.patch` | Q2. It changes `INTENT.md:88`, `README.md:52, :89, :91`, `AGENTS.md:46`, docs-first's description, Phase 2 and Output, and the generator's "When to Use" | after Q2 |
| `patches/provisional-Q3.patch` | Q3. A note on the farm entry, with `<date>` | after Q3; fill in the date |
| `patches/provisional-Q4.patch` | Q4. It changes the integrator's lines 174–175 and adds a note on the "Upstream feedback" entry | after Q4 |

Record each decision in `DECISIONS.md`, and remove its proposal, before applying that question's patch. If the
steward answers differently from the recommendation, discard that patch.

## Uncertainties

- **No `.git`,** so these were not observed:
  - the enacted intent;
  - the real loop;
  - whether any clone links the hook;
  - whether the guard has ever run, and whether commit messages carry its note.
- **The steward is inferred** (Q1).
- **Snapshot age:** the snapshot dates from about 2026-05-11, and today is 2026-10-07. The current repository may
  differ.
- **How agents load instructions:** there is no `CLAUDE.md` or other vendor instruction file. Agents that do not read
  `AGENTS.md` would miss the guard. The discovery test used an agent asked directly (`integration.md`).
- **Not readable from here:**
  - issues #9–#12;
  - the sibling `entropy-immune-system` repo;
  - the writing repo, so the location of the "distill-article skill" is unknown.
- **Copied, not linked:** `intent-change-rule.md` says a guard inside entropy-guard points to the rule's file instead
  of copying it. This target is entropy-guard, but an older copy without that file, so the guard carries a copy, as
  the template shows.

## What was not covered

- **The four exploration documents:** read for their headers, every line by the steward, and the closing exchange of
  the 2026-03-24 conversation (`:675-749`); not read line by line otherwise.
- **`LICENSE`:** first lines only.
- **Everything else in the target:** read in full.
