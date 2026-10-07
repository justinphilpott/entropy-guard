# Feedback on entropy-guard, from this run

The skills ask for a note when they misroute or leave a step too implicit in a way others would hit
(`entropy-assessment`, last paragraph; `guards-integrator`, "Feedback on entropy-guard"). These are notes, not filed
issues: this run was outside the entropy-guard repository and had no network.

**Project context:** two repositories assessed as one system:
- ORC, a TypeScript orchestrator;
- a docs-first Scope that manages ORC's work, and holds its state file and decisions.

Read-only snapshots, no `.git`, no steward available.

1. **The guard template assumes one repository.** "What changed this session" has one `<start>` and one `<upstream>`.
   Here the lead session works in the lab and changes ORC in separate worktrees. I added one sentence: run the block
   in each checkout the session changed, each with its own `<start>`. **Suggestion:** say in the contract what to do
   when `entropy-assessment` Step 2 finds a multi-repository system. That covers:
   - where the one guard lives;
   - how its baseline covers each repository;
   - how the other repository's instructions point to it.

2. **An unresolved decision surface has no slot in the intent-change rule.** The rule needs `<decision surface>`
   filled in. When the intent pass leaves the decision owner as an open question, the generator says unresolved inputs
   "stay visible", but the rule's text has nowhere to say "provisional". I named the provisional owner in the rule, and
   marked it unresolved in "Where things live". **Suggestion:** one line in the generator on how a provisional input
   appears in the copied rule.

3. **The size budget has no term for a filled standing check.** The template's first standing check, "If <code area>
   changed: does <doc> still describe it?", grew by 47 words when filled with this system's five code-area mappings.
   The budget counts the template once, so that growth shows as unexplained excess. **Suggestion:** count the filled
   standing checks under "Checks", or give them their own term.

4. **The size reference is outside the exported skills.** The generator's "Size" section cites
   `explorations/2026-10-05-skills-size-review-astra.md` for the 36-word average. That file is not in the skills folder,
   so an agent working from the exported skills cannot check the figure.

5. **Docs-first Step 5 is written for a writable target.** It says "Update the repo's existing state file". With a
   read-only target, or in plan mode, the update has to be a patch. Step 6 allows "as a patch", but Step 5 does not
   say that its rules still apply to the patch, including "a fresh observation apart from an old recorded one" when
   nothing live can be read. I labelled every live value as recorded on its date and not re-read. **Suggestion:** one
   sentence saying so.

6. **Decisions for a repository outside the assessed system have no destination.** The copy rule in §5 ("a steward decision found
   only in an overwritten state file is copied") worked well here. But the lab's state file also held decisions for a
   third repository that was outside the assessed system. **Suggestion:** say where those go when their owner cannot be
   reached. I copied them under a "belongs elsewhere" heading, with an instruction to move them.
