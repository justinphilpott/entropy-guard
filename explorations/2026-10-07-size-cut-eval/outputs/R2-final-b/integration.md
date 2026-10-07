# Integration brief: entropy-guard's local guard

From `guards-integrator`, 2026-10-07. The guard placed here is `guard/SKILL.md`. It replaces
`skills/local/entropy-guard/SKILL.md` in the entropy-guard repository at commit 447da9a. The loop map is reused from
`assessment.md` ("Loop map"). Findings (F-ids) and proposals (P1 to P3) are defined in `assessment.md` and
`questions.md`.

**The loop, in brief.**
- **The smallest unit of change** is a human or agent work session that ends in a commit.
- **The habitual pauses** are the "Doing Now" entry at the start and the guard plus the commit message at the end.
- **Follow-up gets lost in three places:**
  - feedback issues on GitHub, which TODO.md did not mention (F12);
  - the reminder hook, which is opt-in for each clone (F10);
  - superseded decision entries, which carried no marker (F6).
- **Mechanisms that do not exist:** CI, a hook framework and PR templates.

## Placement

- **`entropy-guard`**, at `skills/local/entropy-guard/SKILL.md`:
  - **Trigger:** the end of a meaningful work session, before the commit that lands it. This is the latest point
    where decisions, learnings and state are still fresh and nothing has been pushed. Trivial changes are skipped,
    as AGENTS.md allows.
  - **Actor:** whoever did the session's work, agent or human.
  - **Entry point:** there are three:
    - AGENTS.md "Working Practices", first bullet, and "Key Files";
    - README.md "Contributing", step 3;
    - the pre-commit reminder, in clones where it is enabled.
  - **Output:** the outcome goes in the commit message ("entropy check clean", or what changed). Fixes go in the same
    commit, the next action in TODO.md "Current State", and intent changes in DECISIONS.md as proposals.
  - **Escalation:** a gap too large for the session goes to TODO.md "Next Up" or "Backlog". A change of intent nobody
    has decided goes to DECISIONS.md, following the guard's intent rule.
  - **Ordering:** this is the only guard. Run its two commands first, which takes seconds, then the judgment checks.
  - **Cost against frequency:**
    - The guard is 1,380 words, about five minutes of reading.
    - Each of its 13 check lines starts with a trigger ("If…", "For each…", "Before…"), so a typical session
      skips most of them.
    - That sits at the top of AGENTS.md's 2–5 minute budget, once per meaningful session.
    - If real runs take longer, the two commands move into the hook (see Next).

**The depth of each check.**
- **The judgment checks stay in the guard: External, with a Prompted reminder.** These are intent, one owner per
  concept, supersession, decisions and learnings, skill handoffs, alignment with INTENT.md, and workflow agreement.
  That is the level DECISIONS.md lines 31–35 authorise.
- **The link check and the skill `name` check are stable invariants,** so they can move into tooling (see Next).
- **The stale-name grep stays a judgment check,** because the old name differs every time.
- **Nothing that checks wording is automated.** Phrases such as "non-negotiable" and step names are still moving.

**Visible to agents.**
- **AGENTS.md** already names the guard, at the same path, in "Working Practices" and "Key Files". Any agent that
  loads AGENTS.md needs no change.
- **There is no CLAUDE.md,** and explorations/ show Claude sessions working here. Whether those sessions load
  AGENTS.md is untested (see Next).

## Adoption

| Mechanism | What it is | Status, 2026-10-07 | Evidence |
|---|---|---|---|
| `.githooks/pre-commit` | reminder | unknown | The snapshot has no `.git`, so neither `git config core.hooksPath` nor a `.git/hooks/pre-commit` link could be read. Never seen firing. |
| `entropy-guard` (new) | executed check | planned | Not installed: the target is read-only, and the guard's Intent section is provisional on P1. No completed report yet. |
| The link and `name` commands in the guard | executed check | commands verified; placement planned | Run clean on the target (49 links, 6 names). Run clean on a copy with `target.patch` and the new guard installed. A copy with one link and one name broken on purpose reported both. |
| A fresh agent finds the guard | discovery | unknown | Not tested: a fresh session on this machine would read entropy-guard material outside the snapshot. The guard path is unchanged from today's. |
| "This is non-negotiable" (AGENTS.md line 19) | none: prose (F10) | — | Enforced only by the reminder above. |

## Plan

**Now**
1. Justin Philpott answers P1 to P3 (`questions.md`). P1 gates installing the guard.
2. Apply `target.patch`. It does not depend on the answers: it adds the state-file section, the proposals, the
   supersession lines, the restored bootstrap rule and the `explorations/` row.
3. Once P1 is answered, copy `guard/SKILL.md` over `skills/local/entropy-guard/SKILL.md`. If the answer differs from
   the recommendation, rewrite the guard's Intent section from the recorded decision first.
4. Enable the reminder in each clone: link it as AGENTS.md line 19 says, or run `git config core.hooksPath
   .githooks`. Make a scratch commit, then record the date the reminder fired. That verifies the reminder.
5. Run the guard at the next real session end, with its report in the commit message. That verifies the executed
   check.

**Next**
- Add the guard's two commands to `.githooks/pre-commit` as warnings, keeping `exit 0`. This stays within the
  non-blocking level DECISIONS.md lines 31–35 authorise (F10).
- Test discovery. Ask a fresh session of each agent tool used here (OpenCode, Claude) "what must you do before
  handing off?", and record the answer and the date. If a Claude session misses the guard, propose a one-line
  CLAUDE.md that points to AGENTS.md. That is a new file, so it needs the owner's approval.
- Once P3 is answered, make one change that fixes `guards-integrator` lines 20 and 227 (F11), INTENT.md "The guard
  lifecycle" and README.md line 52 (F1), and the generator's FlowBook residue (F2).

**Later**
- If the repo gains CI, move the link and `name` checks into it. There is no CI today.
- A guard runner is already in TODO.md's Backlog ("Design a guard runner concept"), and so is `doc-health-check`. Do
  those there, not as parallel work.

## Uncertain

- Whether the reminder hook is enabled in any clone. There is no `.git` to read.
- Whether every agent tool used here loads AGENTS.md. Not checked.
- Whether a real run fits in five minutes. That is estimated from the word count, not measured.

Feedback on the skills used in this run is in `feedback.md`.
