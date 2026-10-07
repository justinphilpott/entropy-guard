# Questions for Justin

No steward was available, so each question carries the answer I recommend, and the run continued on that
recommendation. Nothing that needs a new decision has been applied or enforced. Work that depends on an answer is in
the provisional patch named for its question. Finding ids (F1 and so on) refer to `assessment.md`.

## Intent questions

### Q1. Should ORC's reach lists describe everything the code reaches, and may a package choose a phone notice's tap address?

- **The statements:**
  - ORC `AGENTS.md` 92–104: "Subprocess access exists in" three named modules; "Direct network access exists only
    in" `research-tools.ts` and `ntfy.ts`; "No model or agent reaches the ntfy transport".
  - ORC `README.md` 3–7 and 145–154: ORC's "read-only external data paths", and a model surface that plans "without
    applying it".
  - `AGENTS.md` 110: "Any new authority requires an explicit human choice."
  - Not part of this question: "scheduling" in `README.md` 153. Your decision of 17 Sep already settles it, and
    `settled.patch` removes it from the absent list.
- **What a code search found** (F1, F2, F3, F6), outside those lists:
  - the restart card's `git`, `pnpm install --frozen-lockfile`, build and `systemctl` (orchestrator#101);
  - Playwright's headless Chromium and its DNS lookups (#76);
  - Pi's calls to the model provider;
  - the phone connector, which lets a Scope package's agent send ntfy notices (#184);
  - packages that apply Bookwhen changes, write advert files and bind SMTP mail.
- **The two readings:**
  - (a) The lists are an inventory that fell behind. Each reach was approved where it was built, so the lists should
    describe them.
  - (b) The lists are the boundary. A reach that is not listed has no recorded "explicit human choice" and is drift,
    to be approved or removed.
- **Where they diverge:** a package's phone notice may carry any http or https tap address (`phone/index.ts` 50).
  `AGENTS.md` 72–73 counts "a generated link" as an outbound channel. Under (a), the documentation gains "a tap
  address the package chooses". Under (b), the code changes. I found no recorded approval of that address, though
  topic naming was decided (the operator, 2026-10-02, `config/installation.ts` 98–102).
- **Recommended:** (a) for the restart card, Chromium, Pi and the phone connector's topics. Each already has a record:
  - the architecture test's comment for #101, and `README.md` "As a service";
  - the decision of 3 Oct in `playwright.ts`'s header for #76;
  - "Pi owns model integration" (`README.md` "Boundary");
  - the 2 Oct naming decision.

  For the tap address, **restrict it** to hosts named on the package's approval card, as the browser's host grant
  already works. That keeps a review ping that opens the advert's share page, and it removes an arbitrary link from a
  model-written notice. Then widen the architecture test so these reaches are seen and listed. The documentation
  rewrite is `provisional-Q1.patch`.

### Q2. May the core-ties allowance for `config/installation.ts` rise until orchestrator#152?

- **The statements:**
  - ORC `AGENTS.md` 47–48: the ratchet covers "`src/` and `web/src/` ... a count may only fall, and its allowance
    falls in the same change".
  - Your words in `AGENTS.md` 36–37: "There shouldn't be the tiniest hint of scope specific code inside the core."
  - `AGENTS.md` 42: an owner's setup belongs "to that owner's Scopes and config".
- **What happened** (F8): `test/core-ties.ts` also scans `config/`. Its allowance for `config/installation.ts` rose
  from 28 to 51, 64 and 70 between 28 Sep and 2 Oct, each rise with a comment pointing at #152. I found no recorded
  decision of yours about the rises.
- **The two readings:**
  - (a) `config/` is installation config, not core, so rises there are allowed until Scopes load by card.
  - (b) `config/` is inside the ratchet, so "may only fall" applies, and each rise is drift.
- **Where they diverge:** installing the next Scope agent. Under (a), the allowance rises again with a dated comment.
  Under (b), the install waits for #152, or its bindings go somewhere else.
- **Recommended:** (a), with three conditions:
  - every rise is dated and names the agent it installs and #152;
  - no rise is allowed in `src/` or `web/src/`;
  - the session-end guard reports each rise to you.

  The reason: installing agents is the current work, #152 is the recorded way out, and the comments already follow
  this practice. Only you can say whether it is acceptable. The text is `provisional-Q2.patch`.

### Q3. Is the lab's `STATE.md` capped at about forty content lines, or sixty?

- **The statements:** lab `AGENTS.md` 34, "capped at about forty content lines"; lab `STATE.md` 4, "Target: sixty
  lines". Neither is dated or attributed. On 4 Oct the file was 99 lines, 87 of them non-blank.
- **The two readings:** forty or sixty.
- **Where they diverge:** a 50-line `STATE.md` passes one and fails the other, and the session-end guard checks the
  cap.
- **Recommended:** forty, as `AGENTS.md` says. `AGENTS.md` is where the rule for `STATE.md` is defined, in "Keeping
  state", and the header in `STATE.md` restates it. One owner removes the conflict. The 7 Oct update holds 40 content
  lines either way. The text is `provisional-Q3.patch`.

## Approvals asked (not intent questions)

### A1. Delete ORC's unused MCP client?

- **The facts** (F7): `src/adapters/mcp/client.ts` and `src/backends/pi/mcp-tools.ts` have no production caller since
  the browser left MCP on 3 Oct. Only `test/mcp-client.test.ts` composes them, and the package API does not expose
  them.
- **Recommended:** delete both, with their test, the `StdioClientTransport` assertion in the architecture test, the
  `AGENTS.md` mention, and the `@modelcontextprotocol/sdk` dependency, unless you have a use planned for Pi's MCP
  tools. If you do, keep it, and say so in `MCP.md`.

### A2. Mark ORC's root branch reports as history?

- **The facts** (F19): ten September reports sit at ORC's root, unlinked and unmarked: `REWORK.md`, `SEAM.md`,
  `OPERATOR.md`, `FIXES.md`, `SLICE1.md`, `POLICY-STORE.md`, `GRANTS-E2E.md`, `CLASSIFY.md`, `TURN-RECORD.md` and
  `VISIBILITY.md`. `GRANTS.md` is close to them.
- **Recommended:** give each a one-line banner, as `MCP.md` already has, after checking it against the current code.
  Some may still describe live mechanisms, such as `VISIBILITY.md`. Moving them out of the root is a structural change
  and is not proposed without your yes.
