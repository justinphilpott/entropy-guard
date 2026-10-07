# Feedback on entropy-guard from this run

Notes for `skills/local/entropy-guard-feedback/SKILL.md` to file. This run was not in the entropy-guard repository,
so nothing was filed. The project: ORC, a TypeScript orchestrator, plus a docs-first Scope repository that manages its
work. The two were assessed as one system in build mode, with no steward present.

1. **Where does a recorded proposal go: the settled patch or the provisional one?**
   - What happened: intent-pass §5 says proposed intent changes "are recorded there too, marked as awaiting the
     steward". `SKILL.md`'s sorting rule says a change "touches" an open question "if it edits the question's text",
     and such a change goes in the provisional patch. A new decision-log entry recording the question can be read
     either way. In the provisional patch it would never be recorded until it was answered.
   - What this run did: put it in the settled patch.
   - Suggestion: say that recording a proposal, marked as awaiting the steward, is settled.
2. **The guard template assumes one repository.**
   - What happened: "What changed this session" has one `<start>` and one `<upstream>`. For a two-repository system
     with one shared state file, the guard had to add a sentence telling the agent to run the commands in each
     repository the session touched.
   - Suggestion: give the template an optional line for multi-repository systems, and count it in the common
     contract.
3. **No search tool may be installed.**
   - What happened: `mixed-profile.md` names ripgrep, ast-grep and Semgrep. On this machine only Claude Code's shell
     function provides `rg`, and `/usr/bin/sg` is the Unix group command, not ast-grep. A guard run by Codex or
     opencode could not rely on `rg`.
   - What this run did: the guard uses `git grep --untracked`.
   - Suggestion: name `git grep` as the fallback, and warn about the `sg` name clash.
4. **The state-file cap and docs-first Step 5.**
   - What happened: Step 5 rewrites the state file. When the repository states two caps for it (an open question),
     the rewrite has to meet both to stay settled.
   - Suggestion: say so explicitly. It was not obvious, and it shaped the rewrite.
