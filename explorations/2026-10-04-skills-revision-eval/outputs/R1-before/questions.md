# Questions for the steward (Justin)

No steward was available. Each question has the answer recommended, and the run continued on it.

**Q1. Should one guard cover both repositories, and where should it live?**
The candidates are:

- one combined guard in the lab;
- one guard in each repository;
- a guard in ORC only.

*Recommended:* one combined guard at `~/scopes/scope-orchestration-lab/skills/orc-lab-entropy-guard/SKILL.md`,
with one pointer line in ORC's `AGENTS.md`.

*Why:*

- you made the lab the central Scope for project management, code quality and security on 4 Oct;
- the riskiest drift runs between the lab's `STATE.md` and ORC;
- a session often touches both repositories;
- ORC's `AGENTS.md` already points at orchestrator#140, so a pointer into the lab adds no new kind of tie.

*Proceeded on:* this.

**Q2. What should the guard be called?**
The candidates are `entropy-guard` (your phrase on 4 Oct), `orc-lab-entropy-guard`, or a neutral
`session-close-guard`.

*Recommended:* `orc-lab-entropy-guard`. It keeps your word "entropy guard". It also avoids sharing a name with
entropy-guard's own `entropy-guard` skill if both ever load from `~/.agents/skills`.

*Proceeded on:* this.

**Q3. What is `STATE.md`'s cap, and where is it written?**
The lab's `AGENTS.md` says "about forty content lines". STATE's own header says "Target: sixty lines". The 4 Oct
file has 87 lines.

*Recommended:* write one number, once, in the lab's `AGENTS.md`, with its derivation. Remove the restatement
from STATE's header. The derivation is the sections STATE must hold, and the lines each needs:

- north star (moving out, per Q5): 0;
- how we work, as links: about 3;
- where we are now: about 12;
- recent decisions, as links: about 4;
- waiting on Justin: about 10;
- live services (ORC, Moving Stillness, logins): about 8;
- of record: about 3.

That totals about 40 lines at 120 characters or less, which supports the `AGENTS.md` figure. The decision is
yours.

*Proceeded on:* the guard points at the `AGENTS.md` cap, whatever it says.

**Q4. Where do decisions live?**
The candidates are:

- the existing `decisions/` folder in the lab;
- a new `DECISIONS.md` log;
- STATE plus GitHub issues, as now.

*Recommended:* the existing `decisions/`, one dated file per decision session (for example
`decisions/2026-10-04-central-scope-and-processes.md`). STATE carries a one-line link. ORC rules stay in
ORC's `AGENTS.md`. This uses the existing structure, so it needs no new folder.

*Proceeded on:* this (guard check 7, bootstrap B1).

**Q5. Should the "North star" move out of `STATE.md`?**

*Recommended:* yes. The product direction goes to ORC's `README.md` "Direction", and your aims for ORC (daily
tool, test ground, showpiece) go to the lab's `SCOPE.md` "Purpose". STATE is "current state only", and a
north star is not state.

*Proceeded on:* recorded as a recommendation only. The guard does not enforce it.

**Q6. May ORC's 12 root task reports and `MCP.md` move into a history folder (for example `docs/history/`)?**
This was proposed on 1 Oct and is tracked as #37. It is a structural change.

*Recommended:* yes. Until then, the guard treats them as history (check 4) and nothing new goes at ORC's root.

*Proceeded on:* not moved. The guard lists them as history.

**Q7. Should the lab's diary fail loudly when it cannot read ORC?**
Two changes are proposed:

- `tools/collect.mjs` reads ORC's state directory the way ORC does (`ORCHESTRATOR_STATE_DIR` from
  `~/.config/orchestrator/env`), instead of hard-coding `~/.local/share/orchestrator-proof`;
- the diary shows "could not read" for durable work instead of 0 / 0.

*Recommended:* yes, both. This is bootstrap B6, filed as an issue under #140.

*Proceeded on:* the guard's check 5 covers the gap until it is fixed.

**Q8. Who runs the guard?**

*Recommended:* every agent that changes either repository: Claude, Codex and opencode. Read-only review runs
(Astra) do not. You see the result as one line in the final message.

*Proceeded on:* this.

**Q9. Which check comes first while there is no CI: the guard's test check, or #144?**

*Recommended:* keep check 1 in the guard until #144 picks GitHub Actions or a pre-push hook, then delete it.
No guard change is needed beyond the deletion.

*Proceeded on:* this.

**Q10. In `STATE.md` on 4 Oct, which line is current?**
Two pairs disagree:

- "ORC live: 369628b since 22:12:47" or "#195 live (`8cee662`, restarted 14:48:27)";
- MS "`c759f96`" or "MS #53 merged as `fc830aa`".

*Recommended:* the later-timestamped lines. Confirm with `pnpm service:status` before STATE is rewritten (B2).

*Proceeded on:* the current-state packet states both and marks them unverified.
