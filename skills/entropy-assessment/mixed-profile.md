# Profile for mixed, code-first and workflow-heavy systems

Read this when `entropy-assessment` routes a system here (shapes B, C and D). Record each finding once, with an id
and its evidence.

## Domains

Note which are present and actively changed: code, documentation, tests, API and data contracts, workflow and
process, and live operational state (running services, deployed builds, credentials, scheduled jobs).

## Repositories and ownership

Skip this for a single repository.

- Name each concept and the repository that owns it.
- Find concepts with two homes: two names for one thing, or two implementations of it across repositories. These
  seams are usually the costliest drift, because each side looks correct on its own.

## Drift between domains

Check each of these with evidence:

- **Docs against implementation:** settings, commands, paths and identifiers named in prose that the code no longer
  reads or provides. Search the code for each one. Corrections follow "Every correction is limited by its evidence"
  in `SKILL.md`.
- **What the system reaches, launches or stores:** check any list or "only" claim of what the system reaches over the
  network, launches, stores, or reads credentials from against the code, whether the run keeps it, rewrites it or
  reports it consistent.
  - A document and a test that agree with each other are not evidence of completeness.
  - Search the code with a pattern search (ripgrep, ast-grep or Semgrep), including calls that connect or launch on
    the system's behalf, such as a library that starts a browser.
  - Beside the finding, record the patterns, the paths searched, and each hit with the process that runs it.
  - Mark a claim without that record as incomplete.
- **Docs against docs:** state and handoff files that contradict themselves or each other.
- **Tests against implementation:** tests that exist but never run, or that test a different representation from the
  one used in practice.
- **Contracts against implementation:** API reports, schemas and manifests.
- **Workflow against reality:** declared processes, hooks and CI steps that do not run. Read what CI steps actually
  run. A committed hook that is not enabled does not run: check the effective hooks path
  (`git config core.hooksPath`, else `.git/hooks/`) and tracked hook folders such as `.githooks/` or `.husky/`.
- **Rules against enforcement:** rules written as if something enforces them, when nothing does.

Rank the top 3 to 5 risks by decay rate times recovery cost.

## Existing guard surfaces

Sort them by whether they execute:

- **runs by itself:** CI steps, enabled hooks, scheduled checks;
- **runs only by hand:** test suites, scripts, skills;
- **decided, not built:** usually an open issue or a decision record;
- **declared, but missing:** named somewhere, with nothing behind it;
- **unknown:** the evidence, such as a snapshot without git configuration, cannot show whether it runs.

Whether to keep, amend, replace or demote a surface is a separate question; record it alongside only when it helps.
Connect each gap that already has an issue or decision to that work, rather than proposing a parallel project.

## Mechanical checks belong to tools

Recommend maintained tools rather than hand-run checks:

- a link checker such as lychee;
- an instruction-file linter such as ctxlint or agnix;
- ast-grep or Semgrep, for identifiers named in prose and for calls that connect or launch;
- the project's own tests, type checks, linters and API reports.

Check that a tool is installed before a guard depends on it.
