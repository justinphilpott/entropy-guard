# Questions for the steward (Justin)

From the entropy assessment of ORC and the orchestration lab, 2026-10-07. No steward was available, so each question
carries the answer I recommend, and the run continued on that recommendation. Work that depends on an answer is drafted
in `patches/provisional.patch` and is not to be applied until the question is answered. Finding ids (F01 and so on)
refer to `assessment.md`.

Each question is asked only because the evidence cannot settle it and the answer changes what gets built or what the
guard checks.

---

## Q1. Are the lists of what ORC reaches rules or descriptions? And are its three newer reaches authorised?

**The statements:**
- ORC `AGENTS.md:92-96` says subprocess access exists in three named modules.
- ORC `AGENTS.md:98-104` says direct network access exists only in `src/core/research-tools.ts` and
  `src/adapters/notifications/ntfy.ts`, and that "No model or agent reaches the ntfy transport".
- ORC `README.md:3-7` and `:103-104` summarise the same reach.
- `test/architecture.test.ts:828-860` and `:1295-1317` approve modules by name.

**What the code also does (F04 to F06, F08):**
- `src/adapters/orc-service.ts` runs git reads, a frozen pnpm install and `systemctl --user restart orc.service`
  (orchestrator#101).
- `src/adapters/browser/playwright.ts` launches a headless Chromium for each approved browser session. The Chromium
  reaches the hosts in the grant, makes DNS lookups, and is given the approved login (#76, #197).
- `src/adapters/phone/index.ts` lets a package's agent send a notice through ORC's ntfy sender (#184).

**The readings:**
- **(a) Rules.** The lists are the authorised reach. Anything outside them is unauthorised until you record a
  decision, and the architecture test enforces the lists.
- **(b) Descriptions.** The lists describe the code and are corrected when it changes. Authority comes from package
  approval cards and each PR's Security review.

**Where they diverge:** take the phone connector of 2 Oct.
- Under (a), it waits for your decision. `AGENTS.md` keeps saying no agent reaches ntfy, and a proposal is recorded.
- Under (b), `AGENTS.md` is edited now to describe it.

The same choice applies to the Chromium, which the network test cannot currently detect.

**Recommended: (a).** Confirm each of the three reaches, or say which one is not authorised. Then make
`test/architecture.test.ts` fail on any reach not on the lists.
- Your own rule supports this: ORC `AGENTS.md:110` says "Any new authority requires an explicit human choice".
- `SECURITY-REVIEW.md` question 1 asks every review "What does this let an agent do that it could not do before?",
  which needs a correct list to compare against.

**Drafted:**
- proposal P1, in lab `decisions/2026-10-07-proposals-awaiting-justin.md` (settled patch);
- the corrected lists and test, in the provisional patch.

---

## Q2. May the core-tie allowance for `config/installation.ts` rise until Scopes load by card?

**The statement:** ORC `AGENTS.md:47-49`: "a count may only fall, and its allowance falls in the same change."

**The evidence (F27):**
- The Scope allowance for `config/installation.ts` in `test/core-ties.ts:41-49` rose 28 → 51 → 64 → 70 between
  28 Sep and 2 Oct.
- Each rise was explained in a comment. None cites a decision of yours.
- The test checks only that each count equals its allowance, so nothing prevents a rise.

**The readings:**
- **(a)** The rule is absolute, and the rises are drift to be reversed. Orchestrator#152 comes first.
- **(b)** The rises are an accepted interim cost of installing Scope agents until #152, as the comments say.

**Where they diverge:** the next Scope agent installed, such as one from `AGENT_IDEAS.md`.
- Under (a), its installation waits for #152.
- Under (b), it raises the allowance again.

**Recommended: (b), as a recorded and bounded exception.** Rises are allowed in `config/installation.ts` only, until
#152 lands, and each rise cites the decision. A rise in any other file is refused.
- Installing agents is active, approved work: finance on 30 Sep, adverts on 2 Oct.
- #152 is already the named way out.
- Recording it turns the comments into something a Danger rule and the guard can check.

**Drafted:** proposal P2 (settled patch). The guard flags any rise that has no recorded decision.

---

## Q3. Which cap does the lab's `STATE.md` keep: forty lines or sixty?

**The statements:**
- Lab `AGENTS.md:34`: "capped at about forty content lines".
- Lab `STATE.md:4`: "Target: sixty lines".

The 4 Oct version had 87 non-blank lines (F17).

**The readings:** forty, as `AGENTS.md` says, or sixty, as `STATE.md` says.

**Where they diverge:**
- The rewritten `STATE.md` in the settled patch has about 33 content lines, so it fits both.
- A session that adds twenty lines of fronts passes sixty and fails forty.

**Recommended:** lab `AGENTS.md` owns the cap and keeps forty, with the derivation written beside it. `STATE.md`'s
header links to it instead of restating it.
- One owner for the rule.
- Your 21 Sep decision to "properly evaluate sizing constants" (`reports/2026-09-22-pushback-analysis-astra.md:146`,
  `:395`) asks for the derivation: the six things the state file must hold fit in about 33 lines today.

**Drafted:** the provisional patch replaces `STATE.md`'s "Target: sixty lines" with a link to `AGENTS.md`.

---

## Q4. May ORC's seven root-level branch reports be removed, and are the other five live documents?

**The statement:**
- These seven ORC root files describe themselves as reports of one branch or slice of work: `REWORK.md`, `SEAM.md`,
  `OPERATOR.md`, `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`, `GRANTS-E2E.md`. Two of them say "Nothing committed" or
  "Nothing pushed", and `SLICE1.md` names `src/adapters/browser/service.ts`, which is gone.
- They sit beside `README.md`, `AGENTS.md` and `SECURITY-REVIEW.md`, with nothing marking them as history (F16).
- ORC `AGENTS.md:154-155` says "Keep documentation concise and retrospective".

**The readings:**
- **(a)** Keep them in ORC's root, marked as historical. The settled patch adds that banner.
- **(b)** Remove them, either by moving them to the lab's `reports/`, where reviews and reports already live, or by
  deleting them, since git keeps them.

**Where they diverge:** `scripts/orc-service.ts:41` writes `Documentation=file://<checkout>/OPERATOR.md` into ORC's
systemd unit (F15).
- Under (a), the unit keeps pointing operators at a branch report.
- Under (b), the pointer must change to `README.md`.

**Recommended: (b).** Delete the seven, and point the unit at `README.md`. Keep `CLASSIFY.md`, `GRANTS.md`, `MCP.md`,
`TURN-RECORD.md` and `VISIBILITY.md` as live documents, which the guard's docs-against-code check covers.
- Nothing maintains the seven.
- `FRICTION.md` 2026-09-27 records an agent copying a dead name from nearby text into new memory.

Removing files changes how the repository is organised, so it needs your say-so.

**Drafted:** banners only (settled patch). No move or delete is drafted.

---

## Q5. Where does the session-end guard live?

**The statements:**
- On 4 Oct you kept "entropy guard at session end" among the lab's processes, and made the lab "the central Scope for
  project management, core issue tracking, code quality and security" (lab `STATE.md:38-54`).
- No guard exists in either repository (F28).
- The skills rule of 30 Sep (`reports/2026-09-30-skills-one-home.md:46-49`) gives a skill for one code repository a
  home in that repository, and a Scope's `skills/` holds skills for that Scope's agents.

**The readings:**
- **(a)** One guard in the lab's `skills/session-coherence-guard/SKILL.md`, covering sessions in both repositories,
  linked from both `AGENTS.md` files.
- **(b)** One guard in each repository.

**Where they diverge:** a session merges an ORC PR and then rewrites lab `STATE.md`.
- Under (a), one run checks both repositories.
- Under (b), two guards run, and must agree on the shared checks.

**Recommended: (a).**
- Your 4 Oct decision makes the lab the home of code quality.
- The highest-ranked risks cross the two repositories (F01, F21).
- One guard keeps one definition of each check.
- ORC loads only skills an installation has approved (`src/adapters/agent-files/skills.ts:1-5`), so a guard in the lab's
  `skills/` is not handed to ORC's agents by accident.

**Drafted:**
- the guard, at `guard/SKILL.md`;
- its placement and the two "Before handing off" pointers, in the provisional patch.
