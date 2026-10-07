# Questions for the steward (Justin)

There are four questions. Each is one that the snapshots cannot settle, and whose answer changes what gets built or
what the guard checks. No steward was available, so each carries a recommended answer, and the run continued on that
recommendation. Work that depends on an answer is drafted as provisional:
- the guard's placement (Q1);
- the guard's cap check (Q2);
- the guard's report check (Q3);
- the guard's repository check (Q4).

Finding ids (`F<n>`) refer to `assessment.md`.

---

## Q1. Where does the session-end guard live, so that sessions in both ORC and the lab meet it?

- **The statement:** "The processes kept, all of them: … entropy guard at session end". This is in the lab's
  `STATE.md:49`, decided by Justin on 4 Oct. No guard exists in either repository (F11).
- **The readings:**
  - (a) one guard in the lab's `skills/`, with a one-line pointer from each repository's `AGENTS.md`;
  - (b) one guard in each repository, each covering its own repository;
  - (c) one guard in ORC.
- **Where they diverge:** an ORC session changes `src/adapters/async-store/sqlite.ts`.
  - Under (a), the one guard sends it to check that the lab's diary still reads ORC's durable work (F9).
  - Under (b), ORC's guard knows nothing of the lab's tools, so that check is lost.
  - Under (c), lab-only sessions, which rewrite `STATE.md` most often, do not meet the guard.
- **Recommended: (a), at the lab's `skills/session-coherence-guard/SKILL.md`.**
  - Reasons:
    - on 4 Oct the lab became the central Scope for code quality;
    - its `skills/` folder already exists, empty;
    - most of the guard's checks (F1–F3) are about the lab's own files;
    - one copy cannot drift from a second.
  - ORC's `AGENTS.md` is a guarded path, so its one-line pointer goes through a PR with a security section ("No new
    authority").

## Q2. Which cap applies to `STATE.md`, and where is it defined once?

- **The statement:** lab `AGENTS.md:34` says "capped at about forty content lines". `STATE.md:4` says "Target: sixty
  lines". The file holds 87 non-empty lines (F3).
- **The readings:**
  - (a) forty content lines, defined in `AGENTS.md`;
  - (b) sixty lines, defined in `STATE.md`.
- **Where they diverge:** the proposed rewrite in `patches/` has 37 content lines and 44 non-empty lines, headings
  included. A 50-line state file passes (b) and fails (a), so the guard's check gives different answers.
- **Recommended: (a), forty content lines, stated only in `AGENTS.md` ("Keeping state").** `STATE.md`'s header then
  points to it rather than restating a number.
  - Reason: the rewrite was measured. It holds everything not recorded elsewhere in 37 content lines, once decisions
    move to `decisions/` and dated events move to `git log`, so forty fits.
  - One home stops the two numbers drifting again.

## Q3. Where do one-off session reports about ORC work go: ORC's root, or the lab's `reports/`?

- **The statement:** `SCOPE.md:19` says "Facts about ORC belong in its repository". Twelve session reports sit at
  ORC's root (`REWORK.md`, `SEAM.md`, `OPERATOR.md` and nine more). The lab's `reports/` holds 68 more about the same
  work (F6).
- **The readings:**
  - (a) a session report is a fact about ORC, so it belongs at ORC's root;
  - (b) a session report is evidence of the work, so it belongs in the lab's `reports/`, and ORC keeps only documents
    that describe what is current.
- **Where they diverge:** the async-work rework.
  - Its reports are split today: `REWORK.md`, `SEAM.md` and `FIXES.md` are in ORC, and
    `reports/2026-09-17-async-review-conflation.md` is in the lab. `FIXES.md` cites the lab report as if it were in ORC.
  - Under (b), all four sit together in the lab, and ORC's root shows only live documents.
- **Recommended: (b).**
  - The lab is now the central Scope for project management and code quality.
  - ORC's `AGENTS.md` asks for documentation that is "concise and retrospective".
  - The design review of 30 Sep already proposed moving the reports' facts, then deleting the reports (recommendation
    4).
  - Moving or deleting files is a structural change, so it waits for this answer. Until then, the history banners the
    assessment recommends are not structural.

## Q4. Which list names the repositories the lab oversees?

- **The statement:** lab `AGENTS.md:19` says "A resource joined or left this Scope: `scope.yaml`, then one line in
  `SCOPE.md`". The three lists today:
  - `scope.yaml` names 2 projects;
  - `tools/collect.mjs` names 6 repositories ("Finance joined on 2026-10-02");
  - the map spans 9 (F8, F10).
- **The readings:**
  - (a) `scope.yaml` is the one list, and the lab's tools read it;
  - (b) `tools/collect.mjs` is the one list, and `scope.yaml` names only what the generic Scope model says a Scope
    owns.
- **Where they diverge:** `local-config` raises an issue that is not attached to the map.
  - Under (a), adding `local-config` to `scope.yaml` makes `node tools/map.mjs --check` see it.
  - Under (b), nothing records why it is or is not checked.
- **Recommended: (a), if `~/pro/scope/docs/MODEL.md` allows a Scope to list Scopes it oversees, for example under
  `uses`. Otherwise (b), with `scope.yaml` linking to it.**
  - Either way, one list, read by `collect.mjs` and the map check.
  - The assessment could not read the Scope model, so this recommendation is conditional on it.
