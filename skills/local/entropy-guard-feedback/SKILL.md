---
name: entropy-guard-feedback
description: Create a GitHub issue on the entropy-guard project to report a suggestion or problem with the tool itself — the assessment heuristics, guard quality, integration advice, or skills.
metadata:
  version: "0.1.0"
---

# Skill: Entropy Guard Feedback

Create a GitHub issue on [justinphilpott/entropy-guard](https://github.com/justinphilpott/entropy-guard) to report something about the tool that could be better — a missing guard type, an assessment heuristic that misfired, a skill that caused friction, or an idea that would benefit other users.

> This is entirely optional. Only use this when you genuinely notice something about entropy-guard itself that could be improved. The output is a new GitHub issue on the entropy-guard repository.

## When to Use This

- A guard was generated that didn't fit the project's iteration loop and had to be rewritten
- The entropy assessment missed a signal that turned out to matter
- The guards-integrator suggested a trigger point that was wrong or impractical
- A skill step was unclear or produced output that needed heavy editing
- You found a pattern or heuristic that would improve guard quality across projects

## When NOT to Use This

- Don't submit feedback about your specific project's guards — fix those directly
- Don't submit vague or speculative suggestions — focus on concrete observations from real usage
- Don't use this as a workaround for fixing your own guards — fix those directly

## Process

1. **Identify the category**:
   - `assessment` — The entropy assessment heuristics or output structure need improvement
   - `guard-quality` — A generated guard was wrong, incomplete, or poorly scoped
   - `integration` — The guards-integrator produced bad trigger mappings or adoption advice
   - `skill` — An existing skill needs improvement, or a new skill would be useful
   - `other` — Anything else

2. **Draft the issue** with this structure:
   - **Title**: Short, specific summary (e.g., "guards-integrator: misidentifies CI pipeline as a manual trigger")
   - **Category**: One of the above
   - **What happened**: What you observed or experienced
   - **Suggestion**: What you think should change
   - **Context**: Briefly, what kind of project this was (language, framework, domain, iteration loop type) — enough to understand whether the suggestion is general or niche

3. **Create the issue on the entropy-guard repository**:
   ```bash
   gh issue create \
     --repo justinphilpott/entropy-guard \
     --title "<title>" \
     --label "agent-feedback" \
     --body "<body>"
   ```

4. **If `gh` is not available or not authenticated**, output the formatted issue to the user so they can submit it manually at https://github.com/justinphilpott/entropy-guard/issues/new.

## Issue Body Template

```
## Category
[assessment | guard-quality | integration | skill | other]

## What I Observed
[Concrete description of what happened or what was missing]

## Suggestion
[What you think should change and why]

## Project Context
[Language/framework/domain/iteration loop type — just enough to assess generalisability]

---
Submitted by an AI agent working in an entropy-guard project.
```

## Scope

- **Do**: Submit focused, actionable observations from real usage
- **Do**: Check existing issues first to avoid duplicates (`gh issue list --repo justinphilpott/entropy-guard --label agent-feedback`)
- **Don't**: Submit more than one issue per session unless they're clearly distinct
- **Don't**: Submit feature requests that only benefit your specific project
- **Don't**: Editorialize — state what happened and what you'd suggest, not lengthy arguments
