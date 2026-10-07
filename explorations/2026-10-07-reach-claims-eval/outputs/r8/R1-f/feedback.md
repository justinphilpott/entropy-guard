# Notes on entropy-guard from this run

The skills ask for a note where they misrouted or left a step too implicit in a way others would hit. Project context
for each: ORC (TypeScript) and the orchestration-lab Scope that manages its work, assessed as one system, read-only,
with no steward available.

1. **A guard for a system of two repositories.** `session-coherence-skill-generator` writes "a repository's" guard at
   one default path. Nothing says whether a system spanning repositories gets one guard or one each, or where one
   guard lives. It became steward question Q4. Suggestion: say that one guard lives in the repository that owns the
   state file and every other repository's instruction file points to it, unless the steward decides otherwise.
2. **A settled correction held back by a shared sentence.** "A settled hunk may not edit text a question quotes"
   moved the removal of "scheduling" from ORC's "Deliberately absent" list into the provisional patch, although a
   recorded decision of 17 Sep settles it, because Q5 quotes the same sentence. If that is intended, say so; if not,
   let a question quote only the part it asks about.
3. **Contradictory live facts when nothing live can be read.** Docs-first Step 5 says to keep a fresh observation apart
   from an old one, but not what to do when the state file contradicts itself and no fresh read is possible. I
   corrected each contradiction from the file's own later record and marked it "not re-read". A sentence in Step 5
   would settle this.
4. **A decision copied from a state file when its home is an open question.** The intent pass says to copy it to "its
   concern's durable record"; here, where ORC's decisions are recorded was itself open (Q3). I copied the lab's own
   decisions in the settled patch and left ORC's for the provisional one. The intent pass could name this case.
5. **A guard command with side effects.** The mixed profile says to check that a tool is installed before a guard
   depends on it. The obvious command for one check here, `node tools/report.mjs --no-tests`, would have overwritten
   the day's recorded test counts (F13). Suggestion: also check that a command a guard runs is read-only, or say what
   it writes.
6. **Library behaviour that cannot be read.** The reach check covers "calls that connect or launch on the system's
   behalf". With no `node_modules` in the snapshot, library defaults (Playwright's and the MCP SDK's child
   environment) could not be read; I marked them "not covered". The profile could say to do exactly that.
7. **The size budget's terms.** The pointer term ("the words of the filled-in values") leaves open whether the
   template's labels count; I counted values only. The budget's source,
   `explorations/2026-10-05-skills-size-review-astra.md`, is not in the shipped skills folder.
