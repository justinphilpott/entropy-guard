# Questions for Justin

Five questions from the entropy assessment of ORC and the orchestration-lab Scope (`assessment.md`). Each is asked
because the evidence cannot settle it and the answer changes what gets built or what the session-end guard checks.
Justin was not available, so the work went ahead on each recommendation, and anything that depends on an answer is
drafted as provisional. In the order to ask them.

---

## Q1. Where should ORC's design decisions be recorded? (finding F3)

**The statement and its source.** The lab's `SCOPE.md:19-21`: "Facts about ORC belong in its repository … Facts about
their relationship, including Scope-owned agent context and policy, belong here." ORC has no decision log. Its design
decisions sit in five kinds of place:

- the lab's `decisions/2026-09-17-async-work-architecture.md`;
- a lab report (`reports/2026-10-03-browser-stack-prior-art.md:76`: "Decided, 3 Oct: Justin, 'lets use the library'");
- a code comment (`dangerfile.js:7`: "Justin, 2026-10-02: 'B'");
- an ORC branch report (`FIXES.md:138`, "the approved split", approver not named);
- the lab's `STATE.md`, which is overwritten.

**The readings.**

- (a) The lab's `decisions/` holds every steward decision about ORC and the lab.
- (b) A decision about one issue is recorded on that issue, on the map #140; the lab's `decisions/` holds only decisions
  that set direction or process across issues.
- (c) ORC gets its own decision log, because facts about ORC belong in its repository.

**Where they diverge.** The 3 Oct decision to drive Playwright's library in ORC's process. Under (a) it gets a file in
the lab's `decisions/`; under (b) it stays on orchestrator#76 with `STATE.md` linking to it; under (c) it goes into a
new ORC file, and the guard sends ORC sessions there.

**Recommended answer: (b).** Each decision is recorded with the issue it concerns, since #140 is already the reference
point for all work (2 Oct). Direction and process decisions go in the lab's `decisions/`, its existing record. No new
register in ORC. Reason: it uses the two places agents already read, and the entropy-guard rule is to add no register
where one exists.

**What waits on it.** The guard's "Decisions" pointer says the question is open. The copied decisions file goes into
the lab's `decisions/` either way, because its entries are mostly lab process.

---

## Q2. May a core-ties allowance rise when an agent is installed? (finding F5)

**The statement and its source.** ORC's `AGENTS.md:47-48`: "`test/core-ties.ts` ratchets all four ties … a count may
only fall, and its allowance falls in the same change." This carries Justin's directive of 12 and 13 Sep that core
ships tied to no Scope (`AGENTS.md:33-37`). The Scope allowance for `config/installation.ts` rose from 28 to 51 on
30 Sep, then to 64 and 70 on 2 Oct (`test/core-ties.ts:41-48`). Each rise has a comment giving its reason and pointing
to #152 (Scopes loaded by card), which would end the need.

**The readings.**

- (a) An adaptation within what is authorised: installing an approved agent may raise the allowance, with a comment,
  until #152 lands.
- (b) A change of intent: each rise needs Justin's recorded go-ahead before it merges.

**Where they diverge.** The next Scope agent to be installed. Under (a) its pull request raises the allowance and
merges after review. Under (b) it waits for Justin's recorded yes, linked from the pull request's `## Security review`.

**Recommended answer: (b), until #152 lands.** The rule is his own words and is cited as enforced. The test cannot
tell a rise he approved from one he did not. Rises are rare (three in five days), so asking costs little.

**What waits on it.** A check that fails on a rise without that approval. The guard, meanwhile, only reports a rise
and quotes the rule.

---

## Q3. How long may the lab's `STATE.md` be? (finding F7)

**The statements and their sources.**

- The lab's `AGENTS.md:33-36`: "It holds current state only, capped at about forty content lines … A state file that
  grows is a state file that stops being read."
- `STATE.md:4`: "Target: sixty lines."

The file had 99 lines on 4 Oct.

**The readings.** Forty content lines, or sixty lines.

**Where they diverge.** A rewrite of 50 content lines meets one and breaks the other.

**Recommended answer:** keep the rule in one place, the lab's `AGENTS.md`, which every session reads first and which
says why. Then `STATE.md`'s header links to it instead of giving a number. The number is Justin's call. Forty is
reachable: the proposed rewrite has 44 content lines once the decisions move out.

**What waits on it.** The header sentence in the proposed `STATE.md` is unchanged.

---

## Q4. Are reminders and workflow execution still deliberately absent from ORC? (finding F13)

**The statement and its source.** ORC's `README.md:152-154`: "Deliberately absent, and each requires a decision rather
than a convenience: reminders, scheduling, additional external data sources, workflow execution, sandboxes, shell
access, and file edits." Justin's decision of 17 Sep plainly settles scheduling, and the patch removes it from the
list, citing that decision. The decision names a Friday rebuild, a daily mentor report and a weekend-arrangement flow
as uses. It does not mention reminders, or say whether running a task type counts as workflow execution.

**The readings.**

- (a) Both still need their own decision.
- (b) Both are covered: a reminder is a scheduled task type that notifies, and a workflow is a task type's execution.

**Where they diverge.** A Scope package declaring a recurring "remind Justin to send this month's invoices" task. Under
(a) it waits for a decision; under (b) it can be built now.

**Recommended answer: (a).** Leave both in the list until Justin says otherwise. The list exists so that each item
gets a decision, and the 17 Sep decision names scheduled work, not reminders.

**What waits on it.** Nothing else. Both words are left unchanged in the patch.

---

## Q5. Is "a credential is read in exactly one place" a rule or a description? (finding F15)

**The statement and its source.** ORC's `README.md:103-104`: "A credential is read in exactly one place,
`src/runtime.ts`, and handed to the narrow connector that needs it." Today the web token is read in
`src/web-cli.ts:625`, Scope credentials in `src/adapters/scope-credentials.ts`, and `src/runtime.ts` reads none.
`AGENTS.md:106-108` gives a looser rule: credentials stay in composition roots and narrowed connectors.

**The readings.**

- (a) A rule: the code has drifted, and credential reads go back into one module.
- (b) A description from before Scope credentials moved to their Scopes (28 Sep). `AGENTS.md` holds the rule, and the
  README should link to it.

**Where they diverge.** The web token read in `src/web-cli.ts`. Under (a) it moves into `src/runtime.ts`; under (b) it
stays.

**Recommended answer: (b).** Moving a Scope's credentials into that Scope follows Justin's directive that a Scope's
setup belongs to the Scope (`AGENTS.md:40-42`). The narrowness the sentence protects is already in `AGENTS.md`.

**What does not wait on it.** The paragraph's last sentence, "No subprocess ORC launches receives one", is a
constraint either way. The restart card's commands break it (finding F10), and the recommended fix is in the code, not
the README. The patch leaves the whole paragraph unchanged.
