# entropy-guard feedback

This file holds the upstream feedback checks of `entropy-assessment`, `docs-first-planning-assessment` and
`guards-integrator` (Step 8). It is a set of notes for the entropy-guard maintainer, in the integrator's format. They
were not filed as issues: the local helper (`skills/local/entropy-guard-feedback/`) files to GitHub, and this run had
no web access.

**Project context for all six:**

- **The target system** is two repositories assessed as one: a TypeScript orchestration system, ORC, and a
  docs-first Scope repository that manages its work.
- **The run** was against read-only snapshots, with no `.git`, and with no steward available.

**Did the front door misroute?** No. Shape B, with docs-first Steps 2, 3 and 5 for the docs-first member, fitted the
system well. The intent pass's rule to copy decisions out of overwritten state found the costliest risk (F3).

---

## 1. The integrator says to append its brief to the guard; the generator says keep the guard short

- **Category:** integration
- **What I observed:** `guards-integrator`'s Output says "If the guard was built in the same session, append this
  brief directly after it." Three other rules pull the other way:
  - the generator says a guard must be "short enough to be read in full each time" and must not hold current
    direction;
  - `entropy-assessment` says "Make a separate file only when it has its own reader";
  - the brief has its own reader, the maintainer adopting the guard, and dated status that would go stale inside the
    guard.

  I kept them as separate files.
- **Suggestion:** say "deliver the brief alongside the guard", not "append it after".

## 2. The generator's template assumes the guard covers one repository

- **Category:** guard-quality
- **What I observed:** `entropy-assessment` explicitly assesses a system spanning more than one repository as one
  system. But the generator's "What Changed in a Session" and its template give one `$START` and one set of git
  commands, and nothing says:
  - where a guard covering two repositories should live;
  - how each repository's agents find it;
  - how a start point is set per repository.

  I had to invent a per-repository loop and a "where does it live" question (Q2).
- **Suggestion:** add a short section on multi-repository guards. Cover the home (usually the repository that manages
  the work), pointers from each member repository, a start point per repository, and "set the checkout paths when
  working in worktrees".

## 3. Step 4c does not ask whether a ratchet's baseline has risen

- **Category:** assessment
- **What I observed:** the costliest prose control here was a test-enforced ratchet. It is described as "a count may
  only fall", yet its allowance was raised four times in four days, while the check stayed green. Step 4c's "Rules
  against enforcement" caught it only because I read the comments in the allowance file.
- **Suggestion:** in 4c, add "Ratchets and baselines: compare an allowlist or baseline with its own history or
  comments. A check that enforces exact counts but lets the count rise in the same change is not a ratchet."

## 4. Step 4b does not name consumers that fail silently

- **Category:** assessment
- **What I observed:** one repository's tool read another repository's SQLite tables and state directory directly,
  and returned null on any failure by design. Its predecessor had already died this way for three weeks. Step 4b asks
  where a concept has two homes. It does not ask whether the second home notices when the first moves.
- **Suggestion:** in 4b, add "For each cross-repository reader, does it fail loudly when the thing it reads changes,
  or go quiet?"

## 5. Docs-first Step 5 on a target that moves faster than the assessment

- **Category:** skill
- **What I observed:** the current-state file is overwritten several times a day. A current-state update from a
  snapshot (here, three days old) is stale on arrival.
- **Suggestion:** say "when the current-state file changes faster than the assessment, deliver the update as rules and
  shape (what moves out, what stays, one value per live fact) and re-derive it from the live file, rather than as
  content".

## 6. The front door's hand-on list omits the docs-first outputs on route B

- **Category:** assessment
- **What I observed:** `entropy-assessment` Step 5 hands the generator "the intent section, the profile, and the
  ranked risks". On route B with a docs-first member, the truth map and the loop map from docs-first Steps 2 and 3 are
  just as useful to the generator. The generator's own input list names them for the docs-first route, but not for a
  mixed system that includes a docs-first member.
- **Suggestion:** in Step 5, add "and, where docs-first steps ran for a member repository, its truth map and loop
  map".
