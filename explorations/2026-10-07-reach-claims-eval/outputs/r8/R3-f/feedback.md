# Feedback on the entropy-guard skills

`entropy-assessment` and `docs-first-planning-assessment` both ask a run to note any place where a skill misrouted
the system or left a step too implicit, in a way other runs would hit. These five notes come from this run. None of
them was filed as an issue, because this run was not working inside the entropy-guard repository.

1. **No step owns a demotion under `none`.**
   - **What the skills say:** `entropy-assessment` Step 3 says a reference-only system "may finish with a correction
     or a demotion".
   - **The gap:** no skill says who drafts the demotion or how it is delivered. Here, demoting the guard meant
     editing a standing instruction (`AGENTS.md:72`). That is a decision, so it went into a provisional patch, but
     the route gives no place to describe how it lands. `guards-integrator` is reached only after `create` or
     `update`.
2. **A directive with no author or date is not covered by the intent pass.**
   - **The classification table:** "Stale description" in `intent-pass.md` needs "a later recorded steward
     decision".
   - **The case it misses:** a status banner whose author and date are unknown, contradicting older descriptions
     beside it. It is neither a stale description nor a conflict.
   - **What this run did:** it treated the banner as a directive and fell back on the system's own precedence ("the
     newer settled state wins"). That reading is mine, not the skill's.
3. **"Take the riskiest shape" assumes the riskier shape can be assessed.**
   - **The case:** shape B fit the wider system, because the code lives in sibling repositories. Those repositories
     were outside what this run could read.
   - **The gap:** the skill does not say what to do when the riskier route cannot run. This run took A and listed
     B's checks as not covered (finding F20).
4. **No guidance for sorting patches when a question asks whether editing is allowed at all.**
   - **The case:** one candidate question was whether a frozen repository allows any edits. If it does not, every
     settled patch touches that question.
   - **What this run did:** it read the banner's own words. They forbid extending and reinterpreting, not
     correcting. So it framed Q2 about the rituals, with "freeze" as one of its readings. The skills give no guidance
     here.
5. **Under `none`, reading the generator is required but not said.**
   - **The requirement:** `entropy-assessment`'s Output asks for "the generator's inputs" even under `none`.
   - **The consequence:** a run must open the generator just to get that list, and the route for `none` does not
     mention this.
