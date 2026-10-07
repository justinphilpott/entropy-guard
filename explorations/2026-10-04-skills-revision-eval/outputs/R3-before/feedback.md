# Upstream feedback on entropy-guard

These notes come from the upstream feedback checks in `entropy-assessment`, `docs-first-planning-assessment`, and `guards-integrator` Step 7. They are formatted per `skills/local/entropy-guard-feedback/SKILL.md`, but **not filed** as GitHub issues: this run was not working inside the entropy-guard repo, and it had no web access. They are left here for the maintainer to submit manually. The three notes are distinct, so the "one issue per session" limit is not breached in spirit.

---

## F1. Assessment has no lifecycle-stage check; a reference-only repo is assessed as if live

- **Category:** `assessment`
- **What I observed:**
  - The target's `README.md` and `AGENTS.md` open with "Reference-only… do not treat decisions in this repository as current authority". The rest of the repo still describes a live project.
  - `entropy-assessment` Step 1 only stops when intent is *missing*. Step 2's four shapes describe artifact type, not lifecycle stage.
  - `docs-first-planning-assessment` then asks for "current stage", "active fronts" and "1-3 next actions" in the packet, and its delta guard checklist assumes ongoing design work ("State honesty: does TODO.md still match reality?").
  - Followed literally, the skills would have produced a live-repo guard that keeps ROADMAP and TODOs current, which is the opposite of what this repo needs.
  - The vector list has "Superseded-nearby interference" at document level, but nothing for a whole repo superseded by successor repos.
- **Suggestion:**
  - Add a lifecycle-stage question to `entropy-assessment` Step 1: active / maintenance / reference-only / archived. Name it in the Output.
  - In `docs-first-planning-assessment`, add a "retired or superseded repo" vector, and a guard variant whose first check is a mode gate (is this change allowed in this lifecycle stage?) plus a harvest-capture check.
  - Let the packet say "Active fronts: none here; see successors".
- **Project context:** a markdown-first architecture blueprint repo (61 md, 7 YAML, no code) with an AI-agent session loop (`AGENTS.md` + kickoff skill + entropy guard). Its design authority moved to two successor repos; only the banners were updated. Likely general: planning repos are often superseded rather than deleted.

## F2. guards-integrator has no notion of a cross-repo handoff point

- **Category:** `integration`
- **What I observed:** the integrator's loop discovery covers session, commit, PR, CI, deploy and release inside one repo. For the reference-only target, the handoff that matters is moving decisions and run findings into the successor repos. Nothing in the skill prompts for that, so the placement and adoption plan had to be improvised (a harvest ledger here, provenance checks in the successors).
- **Suggestion:**
  - In Step 1 (map the live iteration loops), ask whether change crosses repo boundaries: promotion, harvest, sync, or copy-from-reference.
  - In Step 4, allow a guard placement whose actor works in a different repo from the guard file.
  - The target's own run 002 hit the same pattern (reference role copied into a live scope repo, then drifting), so this is not unique to retirement.
- **Project context:** same repo as F1. The successor repos were not visible to the run.

## F3. Front-door output is ambiguous once it routes to a specialised skill

- **Category:** `skill`
- **What I observed:** `entropy-assessment` Step 3 says "stop here and run docs-first-planning-assessment". Its Output section lists system shape, intent, domain map and so on. It is unclear whether those are still owed when the router hands off. I produced them anyway, at the top of `assessment.md`, because the classification ambiguities (mixed docs+code flavour from a cross-repo SPEC, lifecycle stage) had nowhere else to go.
- **Suggestion:** say explicitly that on routing, the front door still records the classification, the intent summary and the ambiguities in one or two lines, and that the specialised skill's packet absorbs the rest.
- **Project context:** same run. A small friction, but every routed run will hit it.
