# Proposed corrections: one-time fixes the targets need

The targets are read-only, so these are written as patches for an agent to apply. They fall into two groups:

- **Group A:** stale descriptions. The intent pass says to correct these from a recorded decision of Justin's, citing
  it, without asking.
- **Group B:** ordinary drift. It does not depend on intent, so it is fixed as usual.

Two rules for applying them:

- **Changes to ORC go through one pull request.** `AGENTS.md`, `src/` and `test/` are guarded paths, so the PR needs a
  `## Security review` section. For documentation alone, "No new authority; documentation now matches
  `test/architecture.test.ts`" is enough. If B5 changes the test, the section must say what was tried.
- **Changes to the lab follow its own conventions.** `STATE.md` changes only from a live re-read; see C below.

---

## A. Stale descriptions, corrected from recorded decisions

### A1. ORC `README.md:152-154`: scheduling is not deliberately absent any more

- **The decision:** `lab/decisions/2026-09-17-async-work-architecture.md`, Decision 1, plus "What a task type
  declares": "**schedule**: `now`, `at` a time, or `recurring`".
- **What the code shows:** a `schedules` table in `src/adapters/async-store/sqlite.ts:41`, and recurrence in
  `src/app/async/calendar.ts`.

Current text:

> Deliberately absent, and each requires a decision rather than a convenience: reminders,
> scheduling, additional external data sources, workflow execution, sandboxes, shell access, and file
> edits.

Proposed text:

> Durable work, including approval cards, one-off and recurring schedules, and notices to the operator, is part of
> ORC by Justin's decision of 2026-09-17 (orchestration-lab `decisions/2026-09-17-async-work-architecture.md`).
> Deliberately absent, and each requires a decision rather than a convenience: reminders, additional external data
> sources, sandboxes, shell access, and file edits.

**Flagged, not changed: "workflow execution".** It has two readings. It may mean a general workflow engine, which is
still absent. Or it may mean executing declared task types, which durable work does. The proposed text drops the
phrase from the list only because the first sentence now covers the second reading. If Justin means the first
reading, add back "a general workflow engine". This does not affect the guard.

### A2. ORC `README.md:1-7`, `:76-79` and `:145-147`: Bookwhen is not part of core

- **The decision:** Justin, 2026-09-12 and 2026-09-13, quoted in ORC `AGENTS.md:33-37`: "There shouldn't be the
  tiniest hint of scope specific code inside the core."
- **What the code shows:** it was carried out.
  - `test/architecture.test.ts:1315-1320` asserts there is no `@jphil/bookwhen-client` and no Bookwhen implementation.
  - No source, script or config file reads `ORCHESTRATOR_BOOKWHEN_API_TOKEN`.
  - `package.json` has no Bookwhen client.

The proposed changes:

- **`:4-7`.** Replace "Its read-only external data paths are published Bookwhen events, fixed Bookwhen admin
  inspection and planning operations, and public webpages through Jina Reader." with:

  > Core reaches public webpages through Jina Reader. Everything specific to a business, such as Bookwhen, comes from
  > an approved Scope package and the grants Justin approves for it.
- **`:76-79`.** Delete the paragraph that begins "Set `ORCHESTRATOR_BOOKWHEN_API_TOKEN`". Nothing reads it.
- **`:145-147`.** Replace the sentence about the Moving Stillness specialist with:

  > A Scope package's agents reach what their approved package and grants allow, through ORC's bounded browser and
  > durable-work capabilities.

  Name no specific Scope; this follows the same decision.

### A3. ORC `AGENTS.md:102-103`: `src/bookwhen.ts`

- **The decision:** as A2.

Current text:

> `src/bookwhen.ts` is the only module
> that imports the pinned Bookwhen client, and it reads published events only.

Proposed text:

> No ORC module imports a Bookwhen client; `test/architecture.test.ts` ("keeps Bookwhen implementations out of ORC
> source") enforces it.

---

## B. Ordinary drift: the documents against the code

### B1. ORC `AGENTS.md:92-96`: the subprocess list

The prose names three modules. `test/architecture.test.ts:822-835` enforces four, adding `src/adapters/orc-service.ts`,
which runs git's read commands, `systemctl --user restart orc.service`, and a frozen-lockfile `pnpm install`.

**Add:**

- `src/adapters/orc-service.ts`, as above;
- `src/adapters/browser/playwright.ts`, which launches one headless Chromium per browser session through Playwright's
  library, since orchestrator#76.

**Point to** the test by name: "confines subprocess access to the exact Pi child, git history, MCP adapter and ORC
service modules".

### B2. ORC `AGENTS.md:98-104`: direct network access

**Add** the browser: "`src/adapters/browser/playwright.ts`, whose Chromium reaches only the hosts its grant approves
(`insideHostGrant` in `connector.ts` and its request handler)". Then go to B5.

### B3. ORC `AGENTS.md:47`: the roots the core-ties scan covers

Replace "in `src/` and `web/src/`" with "in `config/`, `src/` and `web/src/`". The source is `test/core-ties.ts:8`.

### B4. ORC `SECURITY-REVIEW.md:177-181`: which changes ask for a review

**Replace** the prose list with:

> Every path matched by `GUARDED` in `dangerfile.js`, less `EXEMPT`.

**Keep** the paragraph that explains why it is that way round. This leaves `dangerfile.js` as the one list.

### B5. ORC `test/architecture.test.ts`: make the boundary map enforced, not described

This changes a guarded file. It needs a Security review section in the pull request, saying what was tried.

- **Add a test:** `from "playwright"`, `from 'playwright'` and `chromium.launch` occur only in
  `src/adapters/browser/playwright.ts`.
- **Name that module** in the network test's expected list, or in a sibling test, so that the "Direct network access"
  prose in `AGENTS.md` can name a test that covers it.
- **Add `^config\/` and `^AGENTS\.md$`** to the guarded-path assertion at `:723-740`. They are in `dangerfile.js`
  `GUARDED`, but the test does not check them.

### B6. ORC's root reports

These wait for Justin's answer to Q3. Until then, change nothing.

### B7. The lab `README.md:15-17` and `:22-24`: the diary

- **Line 16:** "runs the test suite (~10s)" becomes "runs both test suites (about two minutes)". **Line 17:**
  `--no-tests` becomes "(about ten seconds)". The source is `tools/report.mjs:9-10`.
- **"One snapshot per day is kept in `reports/`"** becomes "One snapshot is kept in `reports/` for each day the diary
  runs; it is not yet scheduled". Snapshots exist for 3 and 7 Sep and for 29 Sep to 2 Oct only.

### B8. The lab `tools/collect.mjs`: stop failing silently, and stop re-encoding ORC

This is a design change, made within the lab's own remit. It is not an intent question.

- **`friction()`:** accept `## YYYY-MM-DD <qualifier> — title`, or report the headings it cannot read, rather than
  folding their findings into the section above. Alternatively, rename the three headings at `FRICTION.md:635`, `:665`
  and `:684` to put the date first and the qualifier after the dash.
- **`durableWork()`:** read through `scripts/orc-env.sh pnpm -s list:async-work`, which prints JSON lines, rather than
  opening ORC's SQLite database with a hardcoded path. ORC's `src/adapters/async-store/sqlite.ts` is the owner of that
  schema.
- **Every reader:** when its source is missing, show it on the page, "durable work: unavailable", rather than letting
  the numbers fall to zero.

### B9. The lab `FRICTION.md`: the order of entries

The header says "Newest first", but the entries for 11-19 Sep sit at the bottom (`:1153-1402`). Move them into date
order.

---

## C. The lab `STATE.md`: needs a live re-read before any edit

These are contradictions inside the snapshot of `STATE.md`, whose header says "Updated 2026-10-04 17:31". This run
did not read the live service, so it proposes no replacement values. An agent applying them must read each value live
and write down where and when.

1. **Which ORC build runs.** Lines `:58` and `:88` say `369628b`, since 3 Oct 22:12:47. Line `:35` says `8cee662`,
   restarted 14:48:27 on 4 Oct. Replace all three with one line from `pnpm service:status`, giving the time it was
   read.
2. **Moving Stillness.** Line `:91` says "`main` `c759f96` … both agents available". Lines `:32-33` say "MS #53 merged
   as `fc830aa`" and "MS is paused". Replace these with one line, from a fresh read of the Moving Stillness checkout
   and ORC's package status.
3. **The grant.** Line `:94` says "Grant `e9675bd9` covers the test entry until 1 Oct 18:00Z". The date has passed.
   Re-read it with `scripts/orc-env.sh pnpm -s list:approval-grants`, then remove the line, or restate it with its
   date.
4. **History in "Next".** Lines `:23-37` hold a dated history of 4 Oct. The history belongs in git and `FRICTION.md`.
   Keep the current position and its links.
5. **Decisions.** Lines `:38-58` hold decisions. Move them to `decisions/`, as in `proposed-decisions.md` P0, once Q1
   is answered. Leave one line with a link.
6. **The cap.** After items 1 to 5, bring the file within the cap in `AGENTS.md`, per Q4.
