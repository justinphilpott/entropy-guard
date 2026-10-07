---
name: guards-integrator
description: Fit a generated guard into a system's real iteration loop and verify it is actually adopted. Maps each guard to a trigger, actor, entry point and output, and reports what has been exercised, not only what is planned.
metadata:
  version: "0.4.0"
---

# Skill: Guards Integrator

A guard nobody runs is dead weight. This skill places each guard at the point in the real loop where drift is still
cheap to fix, and checks that it actually runs and is found.

Run it after `session-coherence-skill-generator` builds or amends a guard, or when an existing guard is skipped,
forgotten or run too late. It does not decide which guards are needed; the assessment and the generator do. A
problem that can be checked mechanically goes to a linter, CI, a schema or a type, not to a guard.

## Inputs

Reuse the assessment's loop map and findings where they exist; look only for what is missing or has changed:

- the guard, or each guard's purpose, scope and trigger;
- the real loop: agent session, commit, pull request, CI, deploy, release or schedule, and who does each handoff;
- existing mechanisms:
  - CI workflow steps;
  - hook frameworks (`.pre-commit-config.yaml`, `.husky/`);
  - tracked hook folders such as `.githooks/`, and the effective hooks path (`git config core.hooksPath`, else
    `.git/hooks/`);
  - PR templates;
  - agent instruction files, wherever this repo's agents load them;
- known pain: skipped updates, stale tests, late review, noisy automation.

Read what CI steps and hooks actually run, not their names. A committed hook that is not enabled does not run. State
any uncertainty.

## Steps

1. **Map the loop as it is.** Name the smallest unit of change, the habitual pauses, and where follow-up gets lost.
2. **Place each guard.** For each guard, record:
   - **Trigger:** exactly when it runs. That is the latest moment it still catches drift cheaply, which is not always
     pre-commit.
   - **Actor:** who runs it.
   - **Entry point:** how they find it.
   - **Output:** where the result is recorded.
   - **Escalation:** what happens to a gap too large to fix in the current change.
   - **Ordering:** whether it runs before, after or alongside the other guards.
3. **Choose the depth of each check.** Keep judgment in the guard, and move stable mechanics into tooling as soon as
   the system supports it. The depths are:
   - **External:** a skill run by hand.
   - **Prompted:** a reminder from a hook, a template or agent instructions.
   - **Semi-embedded:** CI, a script or a test.
   - **Fully embedded:** a type, schema or structural rule.

   Judgment-heavy guards usually mature from External, to Prompted once missed runs become the main failure, to
   embedding their mechanical parts. Do not automate volatile wording or paths that are still moving.
4. **Make it visible to agents.** Put the guard in their standing instructions and in the task's completion
   criteria, choosing the smallest change that a fresh agent will meet at the right moment.
5. **Verify adoption.** A guard counts as adopted only when both of these hold:
   - **Its trigger has fired once.** See the hook or check run on a real or scratch commit, the CI step on a pull
     request, or one scheduled run's output.
   - **A fresh agent session finds it.** Ask a session with no context what it must do before handing off. Check
     each distinct way agents load instructions here; a pointer from an instruction file counts even when skills do
     not load automatically.

   Keep to the invocation's mode. If exercising a trigger needs an unapproved commit or push, report it `planned`;
   giving advice does not authorise either. Keep configuration evidence apart from execution evidence: "the hooks
   path points at `.githooks/`" is not "the hook ran". For an enforced invariant, record a permitted failing case
   that was refused.
6. **Plan the rest.** Use only the horizons with a justified next action: Now, with what exists today; Next, light
   prompting or automation; Later, stable mechanical checks moved into existing CI, schemas, types or a scheduler.
   Link each gap that already has an issue or decision to it, rather than starting parallel work.

## Output

A brief that refers to the assessment's findings by id. Leave out any section with nothing distinct to say.

```md
## Placement
- `session-coherence-guard`: at session end, before commit / agent / AGENTS.md "Before handing off" /
  result in the commit message / large gaps to TODO.md

## Adoption
- `session-coherence-guard`: reminder (pre-commit hook) + check that runs (agent at session end);
  verified 2026-10-05: hook fired on a scratch commit; a fresh session named the guard and its path

## Plan
- Now: link the guard from AGENTS.md (finding F3)
- Later: move the link check into the existing CI job (finding F7)

## Uncertain
- Whether agents in this repo load `skills/` automatically: not checked
```

## Feedback on entropy-guard

If this skill or the surrounding workflow misfired in a way others would hit, such as a wrong trigger, a missed
workflow surface or a step a cold agent could not follow, write a short note: what happened, the suggestion, and the
project context. In the entropy-guard repo, `skills/local/entropy-guard-feedback/SKILL.md` turns it into a GitHub
issue.
