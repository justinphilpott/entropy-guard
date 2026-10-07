# Entropy assessment: entropy-guard snapshot 447da9a

- **Target:** `scratchpad/eval/targets/entropy-guard-447da9a`, a read-only snapshot with no `.git`. Assessed
  2026-10-07.
- **Skills used:** `entropy-assessment` v0.9.0, run with its intent pass. Route A went into
  `docs-first-planning-assessment` v0.3.0, then `session-coherence-skill-generator` v0.5.0, then `guards-integrator`
  v0.4.0.
- **Mode:** plan mode toward the target, which may not be edited. The guard and the patches are written to this
  output folder, and nothing is applied. The steward was absent, so the questions carry recommendations (`questions.md`).
- **Outputs:**
  - `guard/SKILL.md`: the updated guard.
  - `patches/settled.patch`: settled changes, applied and checked against a fresh copy.
  - `patches/provisional-Q1.patch`, `-Q2.patch` and `-Q3.patch`: provisional changes, one file per open question.
  - `integration.md`, `questions.md`, `feedback.md` and `read-log.md`.

Line references are to the snapshot as received, unless a patch is named.

---

## 1. Intent

### Steward

The repository names no steward (**F1**). The evidence points to **Justin Philpott**:
- his own dated directions for this repository, in
  `explorations/2026-03-24-entropy-immune-system-conversation.md`, lines 86 and 713;
- `github.com/justinphilpott/entropy-guard` as the repository's home, in
  `skills/local/entropy-guard-feedback/SKILL.md`, lines 10 and 47.

This is an inference, and it is labelled as one wherever the guard uses it.

### Authorised intent, with the source of each part

Authority is recorded as attributed, dated, both, or neither.

| # | Intent | Source | Kind | Authority |
|---|---|---|---|---|
| I1 | entropy-guard is the practical project: assessment, guard generation and refinement, integration, and validation on real projects. Keep it in its current structure. | `explorations/2026-03-24-…-conversation.md:86` ("keep it operating within its current structure"); `:713` ("preserve the entropy-guard project and really farm this new evolution off into its own repo"); DECISIONS.md:23-27 | Directive (steward's words); decision | Both (Justin, 2026-03-24); the decision entry has neither |
| I2 | The broader entropic-immunity theory continues in the sibling `entropy-immune-system` repo. The explorations stay here, in `explorations/`. | conversation `:713`; DECISIONS.md:26; README.md:7; INTENT.md:122-127 | Directive and decision | Both, for the steward's words |
| I3 | `entropy-assessment` is the single front door, doing triage and routing. `docs-first-planning-assessment` is the deepest specialised path. | DECISIONS.md:15-19; INTENT.md:5, :71 | Decision; description | DECISIONS has neither. INTENT is dated 2026-04-07 and unattributed. |
| I4 | Guards are delta-scoped and low in burden (2-10 minutes), the minimum viable intervention, with enforcement depth matched to each vector, and applied to this repo too. | INTENT.md:47-120 | Directive in the north star | Dated (2026-04-07 revision), unattributed |
| I5 | The repo stays markdown-first, with no application runtime. Exportable skills live in `skills/` and local ones in `skills/local/`, in agentskills.io format. | AGENTS.md:31-34; DECISIONS.md:71-83 | Directive; decisions | Neither |
| I6 | The next step is external validation on docs-first planning repos. What that validation measures is **contested** (F12, Q3). | INTENT.md:129-135; DECISIONS.md:26; TODO.md:11-13 | Directive; decision | INTENT is dated; DECISIONS has neither |

### Three readings

- **Declared:** README.md and INTENT.md describe practical guard tooling, with docs-first planning as the strongest
  path and external validation next.
- **Enacted:** this snapshot has no git history, so the enacted reading rests on open work and dated artifacts only.
  - TODO.md "Next Up" holds the validation batch, and nothing records it as started.
  - The newest dated artifact is `skills/session-coherence-skill-generator/SKILL.md`, generated 2026-05-10 and last
    updated 2026-05-11. A decision covers it (DECISIONS.md:7-11), so it is not unauthorised drift. It did bring in
    a second guard writer (F3).
- **Authorised:** I1 and I2 are the steward's own dated words. Everything else rests on unattributed entries, whose
  order cannot be read from the file (F2).

### Gaps by condition

The evidence for each is in §3 under the finding's id.

| Condition | Gap |
|---|---|
| Stale description | F9: four decision entries still give entropy-assessment a Phase 2, guard generation or appendices, which the later decision "Specialize first…" removed. Only the parts that decision plainly covers are corrected (settled patch). |
| Conflict | F3: two skills each define how guards are written, and no recorded decision says which owns it (Q2). F12: the decision and INTENT.md name different validation measures (Q3). |
| Missing | F1: no steward is named. F2: decisions carry no date and no author. |
| Ambiguous | F5: INTENT.md's "refined collaboratively — by humans and AI agents" allows two readings (Q1). |
| Unauthorised drift | None demonstrated. Without git history, this could not be checked against commits (§7). |
| Prose control | F13: "This is non-negotiable" (AGENTS.md:19) and "runs its own entropy guard before every commit" (README.md:78). Nothing enforces either, and the reminder is non-blocking by decision. |

**Guard repair instructions read against the intent-change rule.** Each flagged line is quoted.

- **Intent flags (F5).** Each of these is a path for unauthorised drift:
  - `skills/local/entropy-guard/SKILL.md:68`: "if INTENT.md itself needs revision, update it with a dated note
    explaining what prompted the change."
  - AGENTS.md:27: "If a decision refines or challenges the intent, update INTENT.md and note why."
  - INTENT.md:3: "It is meant to be refined collaboratively — by humans and AI agents … When you update it, note the
    date and what prompted the revision."
- **Ownership flags (F6):**
  - `skills/local/entropy-guard/SKILL.md:88`, "Did you change something that another doc also describes? If so,
    update both", is flagged.
  - `:99`, "is this reflected in AGENTS.md (Key Files section), README.md (Key Documents table)… Update if not", was
    checked and cleared. Those lists summarise each skill's own SKILL.md, and summaries are allowed. The line does
    carry a stale reference (F7).
- `.githooks/pre-commit` has no repair instruction to flag.

### Questions and proposals

There are three questions for the steward, each with a recommended answer, in `questions.md`. They are also recorded
as proposals awaiting Justin in DECISIONS.md, the existing decision owner (`patches/settled.patch`). Recording them
does not decide them. The work that depends on each answer is in `patches/provisional-Q1.patch`, `-Q2.patch` and
`-Q3.patch`, none applied.

---

## 2. Lifecycle, shape and repositories

- **Lifecycle: active.**
  - README.md:5 says "actively used, actively refined", and README.md:121 says "Actively evolving".
  - TODO.md holds three open "Next Up" items.
  - The newest dated artifact is from 2026-05-11.
  - No commit history was available to confirm recency.
- **Shape: A, docs-first planning.**
  - The repository holds 17 markdown files and one 9-line shell hook.
  - DECISIONS.md, TODO.md and AGENTS.md carry state.
  - Work runs in repeated sessions: AGENTS.md:22 has the "Doing Now" ritual, and the guard runs each session.
- **Shape D, workflow-heavy, also fits.** The product is instructions and checklists, and the repo's own guard covers
  workflow drift (DECISIONS.md:55-59). A was taken as the riskiest shape because of these:
  - The repo's own record names docs-to-docs consistency as its primary vector
    (`skills/local/entropy-guard/SKILL.md:90`).
  - Route A's risk matrix includes workflow drift, so D's main vector is still covered.
- **Shape B was rejected:** the only code is the hook.
- **Repositories: one.**
  - `entropy-immune-system`, `seed` and `writing` are referenced but are separate projects, and none of them manages
    this repo's work.
  - GitHub issues on `justinphilpott/entropy-guard` are a second work surface: DECISIONS.md:17 mentions issues #9-#12,
    and the feedback helper files issues there. They were not readable here (§7).

---

## 3. Findings

Each finding has an id, a severity, its evidence and its source. Other sections refer to these ids.

**F1. No steward is named (Missing; medium).**
- No file names an owner or steward. LICENSE:3 reads "Copyright (c) 2026 entropy-guard".
- The inference and its evidence are in §1.
- The guard needs a steward, so it carries the inference, labelled as one.

**F2. Decisions have no date and no author, and their order is not chronological (Missing; medium).**
- All 15 entries in DECISIONS.md lack a date and an author.
- DECISIONS.md:105 says "Superseded by … below", while :131 says "Partially superseded by … above". The position of
  an entry therefore does not give its age.
- Precedence had to be inferred from INTENT.md:5 (2026-04-07) and the dates on the explorations.
- Remedy: the guard's decision check now asks for the date and who decided. Old entries are not backfilled, because
  that would mean guessing.

**F3. Two definitions of guard writing (Conflict; high).**
- `skills/docs-first-planning-assessment/SKILL.md:132-202` (Phase 2, Steps 6-8) generates or refines guards with its
  own checklist areas.
- `skills/session-coherence-skill-generator/SKILL.md:198-315` generates or updates guards to its own requirements
  and template, with the default path `skills/session-coherence-guard/SKILL.md`.
- README.md:89 and :91 each say their skill generates guards.
- INTENT.md:88 gives the generator role to entropy-assessment and docs-first, and does not mention the session
  generator.
- DECISIONS.md:7-11 adds a bootstrap mode to the session generator, but settles no ownership.
- This repo's own guard meets neither definition. It lacks the modes, mechanical commands and safety rules that
  `session-coherence-skill-generator/SKILL.md:213-227` requires.
- This is the root of the largest risk (§5, risk R1). Q2 asks which skill owns guard writing.

**F4. Imported residue in the session generator (Standalone residue; low).**
- `skills/session-coherence-skill-generator/SKILL.md:22` and `:193` refer to "FlowBook", which nothing else in the repo
  mentions (checked with `rg -i flowbook`).
- Its metadata (`skill_version`, `generated`) differs from the `metadata.version` that every other skill uses.
- No decision records the skill being imported.
- The FlowBook wording is made generic in the settled patch. That is settled by the skill's own description of
  itself as a "Generic meta skill" (`:9`).

**F5. Agents may edit the intent document (Ambiguous; high).**
- The three lines flagged under §1 let a session rewrite INTENT.md, which is what every guard measures drift against
  (AGENTS.md:38).
- This needs a decision (Q1). Until then the guard keeps the current text in force, and the replacement rule is
  marked provisional.

**F6. A general "update both" repair (Ownership flag; medium).**
- `skills/local/entropy-guard/SKILL.md:88` keeps parallel definitions in step instead of reducing one to a link.
- The updated guard replaces it with the one-owner repair.

**F7. Stale references in the guard (low).**
- `skills/local/entropy-guard/SKILL.md:99` names "README.md (Key Documents table)". README's section is "What's here"
  (README.md:82).
- `:92` says "20+ markdown files". There are 17, counted 2026-10-07 with `find . -name '*.md'`.
- Both are fixed by the guard update.

**F8. The guard has no baseline, no modes and no safety rules, and it copies state (medium).**
- `skills/local/entropy-guard/SKILL.md:36-127` checks "what you just did", with no way to find the session's change.
- It has no mode behaviour.
- Its metadata (`:19-22`) copies a system snapshot and evaluation dates, which belong in the state file.
- All three are fixed by the guard contract.

**F9. Superseded decisions are not marked (Stale description; medium).**
- These entries still prescribe content for `skills/entropy-assessment/SKILL.md`:
  - DECISIONS.md:39-43 (Phase 2, refinement, bootstrap);
  - :47-51 (workflow appendix, Phase 2 generation);
  - :95-99 ("strengthen entropy-assessment so guard generation always includes…");
  - :113-117 (two-phase structure).
- The later decision at DECISIONS.md:18 changed the skill's "role to triage and routing rather than carrying all deep
  guidance itself". The current file has Steps 1-4 only, with no Phase 2 and no appendices (read 2026-10-07).
- Only :131 carries a supersession marker.
- Risk: a fresh session could restore Phase 2.
- The settled patch adds "Partially superseded by…" markers, in the file's own style, covering only what :18 plainly
  covers.

**F10. `explorations/` is unlisted and unmarked (Superseded material nearby; medium).**
- The folder holds 4 files and 1,467 lines.
- Two of them are `status: draft` with a "Near-term direction for the derived project".
- It is absent from README.md "What's here" and from AGENTS.md "Quick Links" and "Key Files". LEARNINGS.md:122 and
  PHILOSOPHY.md:45 cite it.
- Justin chose to keep the files here (conversation `:713`).
- The settled patch lists the folder as history in README and AGENTS, and TODO.md names it as misleading material
  nearby.

**F11. Theory implications in LEARNINGS (Superseded material nearby; medium).**
- LEARNINGS.md:117-143 holds three entries from the 2026-03-19 autopoiesis conversation. Two of their implications
  point away from this repo's current design:
  - "Entropy-assessment should be designed as a generator invoked fresh at each handoff" (:123);
  - "The process generator should be ephemeral" (:133).
- This repo writes persisted guards (DECISIONS.md:87-91 and :7-11), and Justin later chose to keep it "operating
  within its current structure" (conversation `:86`).
- Fix: the learnings are left as written, and TODO.md "Current state" names them as misleading material nearby.

**F12. Conflicting validation measure (Conflict; medium).**
- DECISIONS.md:26 says to "assess a larger set of open source projects … track whether that produces more merged PRs".
- INTENT.md:131-135 and README.md:125 track "clearer session recovery, fewer reintroduced stale ideas, more coherent
  docs, and sharper feedback". TODO.md:12 says "track what changes prove useful".
- No entry records merged PRs being dropped. Q3 asks.

**F13. Prose control on running the guard (low to medium).**
- AGENTS.md:19 says "This is non-negotiable", and README.md:78 says the project "runs its own entropy guard before
  every commit".
- Nothing enforces either.
- `.githooks/pre-commit` always exits 0, which was chosen deliberately (DECISIONS.md:34).
- The hook runs only if someone links it into `.git/hooks` by hand (README.md:140).
- Evidence of runs would be commit-message notes (README.md:138), and this snapshot has no history.
- Enforcement would sit in the hook or in CI, but the decision chose a prompt instead. So the remedy is verified
  adoption (`integration.md`), not a blocking hook.

**F14. Leftovers from the seed scaffold (low).**
- AGENTS.md:21 says "Working code with tests beats perfect code in progress", but the repo has no code and no tests
  (AGENTS.md:51, :57).
- `.gitignore:17-25` has a Go section, and `.editorconfig:11-18` has Python, Go and Makefile sections.
- AGENTS.md:66-68 sends scaffold gaps to the seed project. A feedback note is recommended there; no patch is made here.

**F15. A claim about everything the repo runs, checked against the code (low).** The search record follows.
- **Claims checked:**
  - AGENTS.md:31: "there is no application runtime in this project yet".
  - AGENTS.md:51: "No build, test, or runtime commands yet".
  - README.md:78 and :114, and AGENTS.md:40: the hook is a "non-blocking local reminder".
  - `skills/local/entropy-guard-feedback/SKILL.md:12`: "The output is a new GitHub issue on the entropy-guard
    repository".
- **The search:** ripgrep 14.1.1 run on 2026-10-07 over the whole snapshot (21 files, `rg -n --hidden -i`), plus
  `find . -type f -perm -u+x`. ast-grep and Semgrep are not installed. The patterns:
  - P1, network: `\bgh (issue|pr|api|auth|repo)`, `\bcurl\b`, `\bwget\b`, `\bfetch\(`, `git (push|pull|fetch|clone)`,
    `\bssh\b`, `webhook`.
  - P2, launch: `\b(npx|pnpm|npm|node|python3?|pip|docker|playwright|puppeteer|chromium|selenium|subprocess|spawn|exec)\b`,
    `^#!`.
  - P3, credentials: `secret`, `token`, `credential`, `password`, `api[ _-]?key`, `\.env`, `\bauth(enticat\w*)?\b`.
  - P4, files with the executable bit.
  - P5, URLs: `https?://…`.
- **Hits, and the process that runs each:**
  - `skills/local/entropy-guard-feedback/SKILL.md:46`, `gh issue create`. An agent following the feedback helper runs
    it, when sent there by AGENTS.md:72 or by the feedback sections of the exportable skills. It reaches github.com
    with the contributor's own `gh` login.
  - The same file at `:77`, `gh issue list`. Same process; it only reads.
  - The same file at `:53`, "not authenticated". The `gh` CLI holds the credentials; the repo never reads them.
  - `.githooks/pre-commit:1`, `#!/bin/sh`. Git runs it at commit, but only once it is linked. Its body is only
    `printf` and `exit 0` (read 2026-10-07). It is the only executable file (P4).
  - `.gitignore:6-8`, `.env*`. These are ignore patterns, and no `.env` file exists.
  - `skills/session-coherence-skill-generator/SKILL.md:156`, `:162-163`, `:226` and `:322`. These are instructions not
    to read secrets, not reaches.
  - P5 found five URLs: AGENTS.md:68, DECISIONS.md:81 and :142, and feedback SKILL.md:10 and :53. All are links that
    nothing fetches.
  - P2 had no other hits.
- **Result:**
  - The "no runtime" claims hold for an application runtime.
  - The documented workflow launches one hook and makes one network reach (GitHub issues). AGENTS.md "Commands"
    lists neither.
  - The settled patch adds one line to "Commands"; the decision at DECISIONS.md:63-67 authorises that reach.
- **Not covered:** the sibling repositories; commands an agent might improvise outside the documented workflow.

**F16. Stale references inside LEARNINGS (low).**
- LEARNINGS.md:63 says "Led to the distill-article skill", and there is no such skill here. DECISIONS.md:142 places
  article work in the separate `writing` repo, which could not be checked.
- LEARNINGS.md:33 and :112 cite Steps 5, 7 and 8 of entropy-assessment, which no longer exist.
- These are records of past learning, so they are left as they are. The stale ones are named here.

**F17. The state file gives no orientation (State dishonesty risk; medium).**
- TODO.md (21 lines) has no current stage, no "trust these first" list and no open questions, and it does not flag
  the misleading material nearby.
- The open questions were recorded nowhere.
- Fixed by the "Current state" section in the settled patch (§6).

**F18. Adoption of the guard is unverified (medium).**
- No record shows the guard ever running at its trigger.
- Whether any clone has the hook linked is unknown.
- See `integration.md`.

---

## 4. Truth map and loop map

### Truth map

| Concept | One owner | Summaries or links | Issue |
|---|---|---|---|
| Purpose and guard principles | INTENT.md | README intro and status, AGENTS intro | F5 |
| Scope: practical tooling versus theory | DECISIONS "Farm…", with Justin's words (I1, I2) | README:7 and :123, INTENT:122-127, AGENTS:34 | F10, F11 |
| Validation loop and its measure | **Contested:** DECISIONS:26 versus INTENT:129-135 | README:125, TODO:11-13 | F12 |
| Settled choices | DECISIONS.md | none | F2, F9 |
| Validated learnings | LEARNINGS.md | README:74 | F11, F16 |
| Each skill's purpose, inputs and handoffs | That skill's SKILL.md (a product artifact) | README "What's here", AGENTS "Key Files" | none (summaries) |
| What a guard holds and how it is written | **Contested:** docs-first Steps 6-8 versus session-coherence generator | INTENT:69-96, README:52, :89, :91 | F3 |
| Guard lifecycle (four tools) and enforcement depth | INTENT.md:84-109 | guards-integrator Step 3, docs-first Step 8, TODO backlog (runner) | none |
| Working practices | AGENTS.md "Working Practices" | README "Contributing" | F13, F14 |
| This repo's guard | `skills/local/entropy-guard/SKILL.md` | README:78 and :97, AGENTS:19 and :41, the hook | F6-F8 |
| Pre-commit reminder | `.githooks/pre-commit` | README:78, :114 and :140, AGENTS:19 and :40 | none (content verified) |
| Current state | TODO.md | README "Project status" | F17 |
| Upstream feedback | `skills/local/entropy-guard-feedback/SKILL.md`, DECISIONS:63-67 | AGENTS:70-72, each skill's feedback section | none |
| Skill file format | the agentskills.io specification (owned elsewhere), adopted at DECISIONS:79-83 | all SKILL.md frontmatter | none (checked mechanically) |

Each document's role:
- **Canonical:** INTENT.md, DECISIONS.md, AGENTS.md and LEARNINGS.md.
- **Current state:** TODO.md.
- **Product artifacts:** the files under `skills/`. Their names, paths and handoffs are contracts.
- **Summary and front door:** README.md.
- **Reflection space:** PHILOSOPHY.md.
- **Historical:** `explorations/` and the superseded DECISIONS entries.

### Loop map

These steps are documented. The real loop could not be observed, because the snapshot has no history.

1. A fresh agent session loads AGENTS.md. Its "Quick Links" lead to INTENT.md and TODO.md. A person starts at README.md.
2. Active work goes into TODO.md "Doing Now" (AGENTS.md:22). Upstream feedback goes to GitHub issues.
3. Decisions and learnings are captured at the end of a session, through guard checks 1 and 2, into DECISIONS.md and
   LEARNINGS.md.
4. The pause to check coherence comes before commit: the guard (AGENTS.md:19), prompted by the hook if it is linked.
5. The handoff is the commit, whose message carries the guard's result (README.md:138).
6. No PR template, no CI and no `.github/` folder exist.

---

## 5. Ranked risks

| # | Risk | Findings | Decay | Recovery | Symptoms | Anchor for the fix |
|---|---|---|---|---|---|---|
| R1 | Two documents own guard writing (parallel truth) | F3, F4 | Medium: every edit to either template widens the gap | High: product templates that external repos consume | Two templates; INTENT names neither correctly; this repo's own guard fits neither | Q2's answer, recorded in DECISIONS.md |
| R2 | Agents can rewrite the intent document | F5 | Slow | Very high: the reference point moves | Three standing instructions allow it | Q1's answer, recorded in DECISIONS.md |
| R3 | Superseded material sits nearby | F9, F10, F11, F16 | Slow | Medium | Unmarked decisions, unlisted drafts, theory implications | DECISIONS markers and TODO "Current state" (settled patch) |
| R4 | Workflow drift, and a guard that is not verified to run | F6, F7, F8, F13, F18 | Fast | Low per instance | The guard has no baseline, carries stale references, and has no run record | The updated guard and `integration.md` |
| R5 | The state file is dishonest or empty | F12, F17, F2 | Medium | Medium | No orientation; a contested measure; undated decisions | TODO.md "Current state", and Q3 |

---

## 6. Recommendations, cleanup and the state-file update

Each recommendation names the action it takes:
- **Consolidate guard writing into one owner** (F3, R1), after Q2. The draft is `patches/provisional-Q2.patch`.
- **Mark as historical or superseded** (F9, F10, F11). The changes are in `patches/settled.patch`, and TODO.md names
  the material.
- **Route intent changes through DECISIONS.md** (F5), after Q1. The draft is `patches/provisional-Q1.patch`.
- **Record the steward** (F1). Justin should add one line naming himself; this run does not write it, because only
  he can confirm it.
- **Date new decisions and say who decided them** (F2). This is a check in the guard, and nothing is backfilled.
- **Send a note to the seed project** about the code-and-tests and Go/Python leftovers (F14), following AGENTS.md:66-68.

### One-time cleanup

Each item was checked against the current file on 2026-10-07, and all are in `patches/settled.patch`:

1. Supersession markers on 4 DECISIONS entries (F9). Checked: `skills/entropy-assessment/SKILL.md` has Steps 1-4 and
   no Phase 2 or appendices.
2. `explorations/` listed in README.md "What's here" and in AGENTS.md "Key Files" (F10). Checked: neither lists it
   (README.md:82-115, AGENTS.md:36-47).
3. The FlowBook wording made generic (F4). Checked: only :22 and :193 mention it.
4. A line in AGENTS.md "Commands" naming the `gh` reach and the hook (F15). Checked: feedback SKILL.md:46 and :77,
   and the hook's body.
5. The guard updated in place (F6-F8); see §8.

If the patch is applied in pieces, list the items not yet applied in TODO.md "Next Up", never in the guard.

### State-file update (docs-first Step 5)

The existing state file is TODO.md: AGENTS.md:22 and README.md:135 have it read first. A "Current state" section is
added above "Doing Now" (in `patches/settled.patch`). It holds:
- the stage, with the date it was checked;
- the documents to trust first;
- the settled decisions, each linked;
- the open questions, linked to the DECISIONS proposals, which own them;
- the misleading material nearby;
- the next actions.

It also says who refreshes it and when it goes stale. The open questions appear in DECISIONS.md only and are linked
from TODO.md, so they have one owner.

---

## 7. Guard inputs (docs-first Step 7)

### Existing guard surfaces

| Surface | Verdict | Why |
|---|---|---|
| `skills/local/entropy-guard/SKILL.md` | **Amend** (update in place) | F5-F8. It is sound in scope; it lacks a baseline, modes and safety, and the intent rule |
| `.githooks/pre-commit` | Keep | Content verified as a non-blocking reminder; the path it names is unchanged |
| AGENTS.md "Working Practices" | Keep; line 27 amended provisionally (Q1) | It holds the standing instruction that triggers the guard |
| README.md "Contributing" | Keep | It defines the commit-message output convention |
| TODO.md | Amend | F17 |
| DECISIONS.md | Amend | F2 (by check), F9, and the proposals |
| LEARNINGS.md | Keep | F11 is handled by a pointer from TODO.md |
| `skills/local/entropy-guard-feedback/SKILL.md` | Keep | none |
| The guard templates in docs-first and in the session generator | Not guard surfaces of this repo | They are product; F3 and Q2 |

### Matrix checks written against this repo's files

The checks are in `guard/SKILL.md` "Checks". Each risk in the matrix maps to these checks:
- **Parallel truth:** skill summaries owned by each SKILL.md, and divergence in guard writing (Q2).
- **Local-global inversion:** not applicable. The repo has no component notes.
- **Superseded material nearby:** the revival check, with named examples.
- **Stale references:** structure lists, `rg` for old names, and the link-check command.
- **Lost decisions and learnings:** two checks, each with its format, plus a date and an author for decisions.
- **State dishonesty:** a TODO.md claims check that also covers the README and INTENT mentions.
- **Workflow drift:** the fresh-agent-from-AGENTS.md check, plus the hook check.
- **Brittle automation:** the automation check. Only links and frontmatter names are scripted.

### Guard decision: `update`

A guard exists and is sound in scope. It needs amending for F5-F8, and its checks need refreshing for F3, F9 and
F10. The repo is active, so `none` does not apply.

### Inputs for the generator

| Input | Value |
|---|---|
| Steward | Justin Philpott, inferred (F1) |
| Documents holding authorised intent | INTENT.md; README.md "Project status"; AGENTS.md "Project Constraints" |
| Decision surface | DECISIONS.md, with a "Proposed, awaiting Justin" section once the settled patch is applied |
| Open intent questions | Q1, Q2 and Q3 |
| Current-state file | TODO.md, refreshed by whoever ends a session that changes it, and checked by the guard |
| Rules bound by but not owned | The agentskills.io specification (DECISIONS.md:79-83); the seed scaffold's feedback route (AGENTS.md:66-68); entropy-guard's intent-change rule v2. No user-wide instructions file is referenced by the target, and none outside it was read. |
| Verification commands | None exist, and none run by themselves: there is no CI. The guard adds a link check and a check that each skill's name matches its folder; both were tested 2026-10-07 and caught planted failures. |
| Code areas and the docs that describe them | `.githooks/pre-commit`, described at README.md:78, :114 and :140, and AGENTS.md:19 and :40. No tests. |
| Live state or spend a session can change | GitHub issues on `justinphilpott/entropy-guard`, through `gh issue create` (F15). No spend. |
| Findings | F1-F18 |

---

## 8. Guard generation (`session-coherence-skill-generator`)

- **Decision:** `update`, in place at `skills/local/entropy-guard/SKILL.md`. The draft is `guard/SKILL.md`, and it is
  also in `patches/settled.patch`.
- **Adaptations to the contract:**
  - **Name.** It keeps `name: entropy-guard` instead of the template's `session-coherence-guard`. DECISIONS.md:79-83
    (the agentskills.io specification) requires the name to match the folder.
  - **The baseline fallback** is `origin/main`.
  - **The intent-change rule is copied in**, not linked. The rule file says a guard inside entropy-guard should point
    at it instead, but this snapshot has no `intent-change-rule.md` to point at.
- **How Q1 is handled inside the guard:** the current repo text stays in force, verbatim, and the rule v2 is marked
  "Provisional, takes force only when Justin records Q1". So installing the guard neither edits the question's text
  nor decides it. `patches/provisional-Q1.patch` removes the interim text once Justin answers.
- **Size:** 1,300 words, measured with `wc -w` on 2026-10-07, against a budget of about 1,193. The budget is:
  - 724 for the common contract;
  - 324 for 9 checks beyond the 2 standing ones, at 36 words each;
  - about 62 for the pointer values (86 section words less the template's 24 label words);
  - 83 for the 2 repo commands.
- **The excess of about 107 words** has two causes:
  - The Q1 interim paragraph is 55 words, and it goes away when Q1 is answered.
  - About 52 more words carry this repo's documented conventions:
    - when to skip the guard, and the `doc-health-check` pointer (TODO.md:20 cites the guard for it);
    - the commit-message result (README.md:138);
    - escalation to TODO.md;
    - the live-issue line (F15).

  No duplication remained after one redundant pointer was removed. The checks themselves average about 30 words.
- **Doc references:** AGENTS.md:19 and :41 and README.md:78 and :97 already name the same path, so nothing needs
  adding.
- **Validation run:**
  - `patches/settled.patch` and each provisional patch, alone and in sequence, were applied with `patch -p1` to fresh
    copies of the target. All applied cleanly.
  - The fully patched tree passes the link check and the name check.
  - `git diff --no-index --check` reported no whitespace errors.
- **Open questions the guard leaves visible:** Q1 in "Intent", Q2 in its guard-writing check, and F1 in "Where things
  live".
- **Handoff:** to `guards-integrator`; see `integration.md`.

---

## 9. Uncertainties and what was not covered

- **No git history.** The enacted intent, the real loop, whether the guard has ever run, and whether anything was
  edited without authorisation could not be checked against commits.
- **GitHub issues** (including #9-#12) and the sibling repositories were not read: they are outside scope, and the
  network was not used. Open issues may hold active work that TODO.md does not show.
- **The steward's identity is an inference** (F1).
- **The explorations were searched for the steward's words, not read in full:** 1,467 lines, of which the lines by
  Justin and the headings were read.
- **Only ripgrep was available** for the reach search. ast-grep and Semgrep are not installed.
- **The intent-change rule names "v2, from entropy-guard"**, a version newer than any material in this older
  snapshot. Its source is outside the target.
