# Current state: entropy-guard

*Written 2026-10-04 from snapshot 447da9a. Recommended home in the repository is `CURRENT_STATE.md`, linked first from `AGENTS.md` (see Q6). Refresh it at session end whenever the stage, the active fronts or the settled list changes (local guard, check 10).*

## Stage

This repository is a practical skill set:

- a front-door router, `entropy-assessment` v0.6.0;
- one deep track, `docs-first-planning-assessment` v0.1.0;
- an integration skill, `guards-integrator` v0.2.2;
- a session handoff guard generator with a bootstrap mode for young repositories, `session-coherence-skill-generator` v0.2.0, the most recent addition.

The next phase is external validation on a batch of docs-first planning repositories. It has not started yet.

## Trust these first

1. `INTENT.md`: purpose, the entropy model, the guard lifecycle and enforcement depth.
2. `AGENTS.md`: how to work here. Run the local guard before committing.
3. `TODO.md`: what is active now.
4. `skills/entropy-assessment/SKILL.md` Step 3: which skill serves which kind of repository.
5. The top 4 entries of `DECISIONS.md` (the newest decisions are first).

## Settled: do not reopen casually

- `entropy-assessment` is the single front door and a router. Deep method lives in specialised tracks, and docs-first is the first of them.
- The current-state packet is an output of the docs-first assessment, not a separate skill.
- Exportable skills live in `skills/`, and skills for this repository's own use live in `skills/local/`. Every skill is a `SKILL.md` with frontmatter, and its `name` equals its directory.
- This repository has one combined local guard, run at session end or before commit.
- Judgment-heavy guards mature from External (manual) to Prompted (reminder) before any deeper automation.
- The project builds skills that create guards, not a library of finished guards.
- Broader theory lives in the sibling repository `entropy-immune-system`. This repository stays practical.

## Active fronts

- **The validation batch.** Choose the repositories, run them through the front door into docs-first, use the packet at session start, and run the guards.
- **The relationship between the two guard generators** (`docs-first-planning-assessment` Phase 2 and `session-coherence-skill-generator`). It is unresolved, and the front door does not route to the session-coherence generator.
- **Cleanup items B1-B9** from the 2026-10-04 assessment, tracked in `TODO.md`.

## Open questions

- Which guard generator should serve which kind of repository?
- Where do the results of the validation batch get recorded?
- How is validation success measured? `INTENT.md` says clearer session recovery and fewer reintroduced stale ideas. An older `DECISIONS.md` entry says more merged pull requests.

## Nearby material likely to mislead a fresh session

- **5 unmarked entries in `DECISIONS.md`** describe an entropy-assessment that no longer exists: one with a Phase 2 of Steps 5-8, with domain appendices, and with guard generation built in. They are "Rename entry point…", "Entropy assessment should support guard refinement…", "Add workflow/process…", "Guard generation should produce immediate integration advice…", and the success measure in "Farm broader…". Do not restore those structures.
- **`LEARNINGS.md` has entries that are not current practice.** The three entries on just-in-time generation, the four-component hierarchy and guards working at the wrong layer are theory. The "Step 0" entry refers to four domain generators that were deleted. "distill-article skill" is not in this repository.
- **`explorations/` is seed material for the sibling repository**, and two of its documents are drafts. It is not current guidance.
- **`doc-health-check`** is named in the local guard but does not exist.
- **`session-coherence-skill-generator` mentions FlowBook**, which is another project, not this one.

## Plausible next actions

1. Decide and record how the two guard generators divide the work. Then update the routing in `entropy-assessment` Step 3, the lifecycle section of `INTENT.md`, and lines 20 and 227 of `guards-integrator`.
2. Restore bootstrap-action verification to `docs-first-planning-assessment` Step 5, and mark the superseded `DECISIONS.md` entries.
3. Choose where validation results are recorded, then start the batch.
