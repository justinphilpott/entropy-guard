# Feedback on the skills

`entropy-assessment` asks: "If this skill misrouted the system or left a step too implicit, in a way others would
hit, note it." Three notes follow. None was filed as an issue: the feedback helper applies only when working in the
entropy-guard repo.

1. **Taking an adopted guard out of the loop has no owner.** For a reference-only repo the decision is `none`, which
   "may finish with a correction or a demotion". But `none` stops before `guards-integrator`, and docs-first Step 7
   only labels a surface "demote". Nothing says who advises on removing a guard from the loop, such as replacing the
   pre-commit instruction at `AGENTS.md:72`, or what verifies the removal. This run put the demotion in a provisional
   patch and wrote a short `integration.md` saying the integrator was not reached. Any reference-only repo with an
   adopted guard will hit this.

2. **"Stale description" assumes the decision is attributed.** The intent pass corrects a description only against "a
   later recorded steward decision". In this repo no decision is attributed to anyone (all are dated only), and the
   status banner is neither dated nor attributed. The pass says missing attribution does not remove usable intent, but
   not whether an unattributed banner can settle a correction. This run used the repo's own precedence rules
   (`AGENTS.md:25`, `:70`) and said so. Other runs may decide differently.

3. **The rule on claims about everything a system reaches does not cover two cases.**
   - A docs-only repo whose code lives in sibling repos outside the read set: the rule can only return "incomplete".
   - Run records whose evidence is an event log rather than code: this run checked them against `events.jsonl`, which
     the rule does not mention.

   A sentence on each would make results comparable across runs.
