# Questions for the steward: agentic-architecture

Raised 2026-10-07 by the entropy assessment in `assessment.md`. No steward was available, so each question carries
the recommended answer and the run continued on it. Work that depends on an answer is drafted as provisional and
nothing was applied to the target. All three questions are written into the proposed `ROADMAP.md` Status block
(`status-correction.patch`) so that they stay visible in the repository.

Who the steward is was not asked: no file names one for this repository, but every scope manifest names `justin`,
and the assessment records that as an inference (finding F11).

---

## Q1. Are authorised edits still expected in agentic-architecture, or is it frozen?

- **Statement and source:** "Do not extend or reinterpret this blueprint as current design without explicit
  authorization." (`AGENTS.md:5-6`). Separately, `AGENTS.md:72` still requires `skills/entropy-guard.md` before
  committing non-trivial changes.
- **Readings:**
  - (a) Frozen. Nothing changes except maintenance of the reference-only status itself.
  - (b) Reference-only, but authorised edits can still happen, such as recording an outcome or a correction.
- **Where they diverge:** a session is asked to record that the reference role
  `roles/professional-presence-profile-editor` was promoted into `scope-professional-presence`, which run 002 left
  undecided (`runs/002-professional-presence-diagnostic/RUN.md:247`). Under (a) that edit does not happen here.
  Under (b) it happens, and something should check that it does not present this repository as current authority.
- **What it changes:** under (b), `skills/entropy-guard.md` is replaced in place by `guard/SKILL.md`, a guard of
  778 words with 6 repo-specific checks for a reference-only repository. Under (a), `skills/entropy-guard.md` is
  marked historical, the mandate at `AGENTS.md:72` is removed, and no guard remains.
- **Recommended answer: (b).** The banner itself names explicit authorization as the route for edits, so edits are
  contemplated, and `AGENTS.md:72` already places a guard at commit time. Replacing the guard's content is a smaller
  change than removing the mandate, and it leaves a check on exactly the edits the banner allows.

## Q2. Are `components/scope/template/` and `components/agent/template/` still copied to make new scopes and roles?

- **Statement and source:** `DECISIONS.md:53-57` (2026-04-03) and `components/scope/DECISIONS.md:60-64` make
  `components/scope/template/` "the single source" for new scopes; `components/agent/DECISIONS.md:48-52`
  (2026-04-21) does the same for roles and bindings; `AGENTS.md:19` repeats it. The banner says the current Scope
  and Project model lives in `../../scope` (`README.md:3-5`).
- **Readings:**
  - (a) Template authority moved with the Scope model to `../../scope`; the templates here are historical.
  - (b) The templates here are still the copy source.
- **Where they diverge:** instantiating the planned `soulbodhiwork` scope (`SCOPES_PLANNED.md:54-59`). Under (a) it
  is made from whatever `../../scope` provides. Under (b) it is copied from `components/scope/template/`, which
  carries a `CLAUDE.md` symlink that run 002 decided against (`runs/002-professional-presence-diagnostic/RUN.md:45`)
  and has no `roles/` directory, which run 002 had to add by hand (`RUN.md:230`) (finding F8).
- **What it changes:** under (b), the guard gains a check for template changes and F8 is fixed in the template.
  Under (a), both `template/` directories are marked historical with a pointer to `../../scope`.
- **Recommended answer: (a).** The banner names `../../scope` as the home of the current Scope model, and the scope
  implementation already lives there (`README.md:43`). This assessment could not read `../../scope` to confirm that
  it provides a template.

## Q3. Should the open work recorded here stay frozen in place, or be carried to the successor repositories?

- **Statement and source:** unchecked items in `ROADMAP.md:12-71`; "Next Up" and "Backlog" in
  `components/scope/TODO.md:24-43` and `components/orchestrator/TODO.md:14-26`; "Pickup Later" in
  `runs/README.md:20-29`; run 001's proposal that Pi's event types become the v0 runtime event-log schema
  (`runs/001-moving-stillness-status/RUN.md:85`, `:117`), never recorded in `DECISIONS.md`.
- **Readings:**
  - (a) Freeze: each list stays where it is, marked as a record of where work stood.
  - (b) Migrate: items still wanted move to `../personal-agent` or `../../scope`, leaving pointers here.
- **Where they diverge:** `ROADMAP.md:26`, "Runtime event/action log schema", together with run 001's proposal.
  Under (a) it remains an unchecked historical item here. Under (b) it becomes an item, or a decision proposal, in a
  successor repository.
- **What it changes:** the content of the cleanup. The proposed status patch already marks these lists as not live
  work in this repository, and says that whether items move is open, so it does not settle this question.
- **Recommended answer: (a).** What a successor repository takes on is that repository's owner's decision, and this
  assessment cannot see either successor. Freezing is reversible and asserts nothing new.
