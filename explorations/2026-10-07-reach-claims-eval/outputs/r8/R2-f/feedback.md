# Feedback on entropy-guard's skills

These notes come from the assessment, generator and integrator feedback steps of this run. No issue was filed: the
feedback helper files issues when working in the entropy-guard repo, and this run was neither in that repo nor allowed
the web.

## 1. An open intent question makes the whole guard update provisional

- **What happened.** The generator's contract copies the intent-change rule into every guard. Here the target's own
  instruction file (`AGENTS.md` line 27) tells agents to edit `INTENT.md` themselves, and the conflict is an open
  question (Q2). Installing the updated guard would state as fact what Q2 asks, so the whole guard update went into a
  provisional patch. Meanwhile the old guard stays in force, and it carries the flagged repair ("update INTENT.md with
  a dated note"). The skills do not say what to do in this case. This run put small corrections to the old guard in the
  settled patch, and carried the conflict as a visible "Unresolved" line in the new guard.
- **Suggestion.** Say in the generator what happens when the contract's rule conflicts with an open question in the
  target: deliver the guard as provisional, and correct only the old guard's question-free lines in the settled patch.
- **Project context.** A markdown-first skills repo whose agent instructions let agents revise the intent document. Any
  repo with a "living intent, edit freely" header will hit this.

## 2. "A guard inside entropy-guard points here instead" does not fit a copy without the file

- **What happened.** `intent-change-rule.md` says a guard inside entropy-guard links to the rule rather than copying
  it. The target was an older entropy-guard snapshot with no `intent-change-rule.md`, so a link would have pointed at
  nothing. This run copied the rule.
- **Suggestion.** Change it to: "points here when this file exists in the same repository; otherwise copy it."
- **Project context.** A fork or old snapshot of entropy-guard. This is niche.

## 3. Updating a guard in place: which name to keep

- **What happened.** The contract's template sets `name: session-coherence-guard`, and also allows "update the repo's
  existing guard in place". The existing guard lives in `skills/local/entropy-guard/`, and the agentskills.io format
  the target follows requires the name to match the directory. This run kept `entropy-guard`.
- **Suggestion.** Add one line: "When updating in place, keep the existing guard's name and path."
- **Project context.** Any repo with a guard that predates the generator.
