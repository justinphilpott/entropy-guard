# Questions for the steward (Justin)

No steward was available in this run. Each question below is one the evidence in the two repositories cannot settle
and whose answer changes what gets built or what the guard checks. Work continued on the recommended answer only where
nothing depends on it; everything that does is in a provisional patch named after the question
(`patches/provisional-P<n>-*.patch`), not to be applied until Justin answers. The same five are recorded for him in the
lab as `decisions/2026-10-07-proposals-from-entropy-assessment.md` (settled patch). Finding ids refer to
`assessment.md`.

"ORC" is `~/pro/orchestrator`; "the lab" is `~/scopes/scope-orchestration-lab`.

## P1. Is the restart card's subprocess reach authorised? (F1)

- **Statement and source.** ORC `AGENTS.md` lines 92–96 say subprocess access exists in three modules (the Pi child,
  git history, the MCP client), and line 110 says "Any new authority requires an explicit human choice."
  `src/adapters/orc-service.ts` also runs, for the "Restart ORC onto <commit>" card (orchestrator#101): git's read
  commands in ORC's checkout (line 71), `pnpm install --frozen-lockfile`, which downloads packages when a release adds
  them (lines 33–36, 128), `node scripts/build.mjs` (line 107) and `systemctl --user --no-block restart orc.service`
  (line 102). `test/architecture.test.ts` lines 823–835 approve it as the fourth module; `README.md` lines 123–129 and
  `AGENTS.md` line 136 describe the card. No decision of Justin's authorising this reach is in either repository
  (#101 itself could not be read).
- **Readings.** (a) Authorised: Justin asked for the card and approves each restart, so the `AGENTS.md` list is a
  stale description. (b) The list is the boundary, and the restart card's reach, including a dependency install that
  reaches the package registry from ORC's own process tree, still needs his explicit choice.
- **Where they diverge.** A later change adds a fifth command to `orc-service.ts`, say `pnpm prune`. Under (a) the
  session guard checks that `AGENTS.md` lists it; under (b) the guard reports the module's widening as a proposal for
  Justin, and nothing is listed until he decides.
- **Recommended:** (a), authorising exactly the four commands the module's header names ("Never: … runs git with
  anything but read commands, or restarts any unit but ORC's own"). Reason: he approves each card, which lists the
  commits, and the card exists to end restarts only he could do by hand (lab `reports/2026-09-30-agent-loop.md` line
  47; `FRICTION.md`, the 30 Sep and 2 Oct entries on #101). Then apply `provisional-P1-orchestrator.patch`.

## P2. May Scope packages reach ntfy through the phone connector? (F2)

- **Statement and source.** ORC `AGENTS.md` lines 101–102: "No model or agent reaches the ntfy transport, and it
  sends only a title, the notice's summary and the one configured tap address." `test/architecture.test.ts` line 63
  repeats it. `src/adapters/phone/index.ts` gives an approved package a phone connector (`{ "factory": "phone" }`)
  that publishes the package's own title (up to 200 characters), text, up to five tags and any http or https tap
  address through ORC's ntfy sender to the installation's topic. Its header dates the first user to 2 Oct 2026 and
  says it replaced a package's own copy of the ntfy client (orchestrator#184). No decision of Justin's about it is in
  either repository.
- **Readings.** (a) Authorised as built: packages may notify Justin's phone through this bounded connector, and
  `AGENTS.md` is stale. (b) `AGENTS.md`'s sentence is the boundary: no agent reaches ntfy, so the connector needs his
  decision first.
- **Where they diverge.** A package tool that passes model-written text and a link to `notify`. `AGENTS.md` lines
  72–73 name "a generated link" as an outbound channel. Under (a) that tool's security review counts the outbound leg
  and the doc says packages reach ntfy; under (b) the connector is withdrawn or restricted until he decides.
- **Recommended:** (a), and the decision should say whether the tap address may be any http(s) address or only ORC's
  own. Reason: the connector narrowed what came before (a package carrying its own ntfy client), and it is in use.
  Then apply `provisional-P2-orchestrator.patch`, filling in the tap-address rule.

## P3. Which file owns the cap on the lab's `STATE.md`, and what is it? (F6)

- **Statement and source.** Lab `AGENTS.md` line 34: "capped at about forty content lines". Lab `STATE.md` line 4:
  "Target: sixty lines." Nothing records Justin moving the cap. `STATE.md` was 99 lines on 4 Oct, and 405 on 23 Sep
  (`FRICTION.md` lines 536–540, which call forty "its own forty-line cap").
- **Readings.** (a) Forty, owned by `AGENTS.md`, which Claude Code loads through the `CLAUDE.md` link. (b) Sixty, as
  the state file's own header says.
- **Where they diverge.** A session adds fifteen lines to the rewritten `STATE.md` (42 content lines, 60 in all): the
  guard reports it over the cap under (a) and not under (b).
- **Recommended:** (a). One owner for the cap, in the instruction file every session loads; the header points there.
  The settled rewrite fits both. Then apply `provisional-P3-lab.patch`.

## P4. Where does the session-end entropy guard live? (F19)

- **Statement and source.** Justin's 4 Oct decision keeps "entropy guard at session end" (`STATE.md` line 49) but
  does not place it. The skills rule of 30 Sep (lab `reports/2026-09-30-skills-one-home.md` lines 44–49, recorded in
  local-config `DECISIONS.md`): a skill used by one Scope's agents lives in that Scope's `skills/`; a skill for one
  code repository stays in it. This guard serves sessions that span two repositories.
- **Readings.** (a) One guard for both repositories, at the lab's `skills/session-coherence-guard/SKILL.md`, pointed
  at from both `AGENTS.md` files. (b) One guard in each repository. (c) One guard in ORC only.
- **Where they diverge.** A session changes only ORC code, in a worktree under `/tmp`. Under (a) it follows ORC
  `AGENTS.md`'s pointer to the lab's guard and also checks the lab's `STATE.md`, where its state goes. Under (b) ORC's
  own guard must repeat the `STATE.md` checks or skip them, and two guards define one check set. Under (c) a
  lab-only session finds no guard.
- **Recommended:** (a). Sessions span both repositories and record state only in the lab's `STATE.md`, and the 4 Oct
  decision makes the lab the central Scope for code quality. ORC loads a Scope's skills only by installation
  approval (`src/adapters/agent-files/skills.ts` header), so ORC's own agents would not receive it. Then apply
  `provisional-P4-lab.patch` and `provisional-P4-orchestrator.patch`.

## P5. Where are Justin's decisions about ORC itself recorded? (F13)

- **Statement and source.** Lab `SCOPE.md` lines 19–21: "Facts about ORC belong in its repository … Facts about
  their relationship … belong here." Yet ORC's architecture decision is the lab's
  `decisions/2026-09-17-async-work-architecture.md`, ORC has no decision log, ORC `AGENTS.md` quotes Justin's
  decisions inline as standing rules, and ORC's north star (Justin, 25–26 Sep) is only in the lab's `STATE.md`.
- **Readings.** (a) The lab's `decisions/` records Justin's decisions about ORC and the lab; a decision is not a
  "fact about ORC". (b) Decisions about ORC go in ORC's repository, in a decision log yet to be made.
- **Where they diverge.** Copying the north star out of `STATE.md`, and recording the next ORC architecture decision:
  the lab's `decisions/` under (a), a new ORC `DECISIONS.md` under (b). The guard's "Decisions" pointer differs.
- **Recommended:** (a), as the 17 Sep decision already is, and because the 4 Oct decision makes the lab the central
  Scope for project management. ORC's `AGENTS.md` keeps its standing rules and links to the record. Then apply
  `provisional-P5-lab.patch` and `provisional-P5-orchestrator.patch`, filling in the date.

## Already open with Justin, not asked again

orchestrator#144, "tests on every PR: GitHub Actions or a pre-push hook?", is on his list (`STATE.md` line 69). It
decides where the mechanical checks recommended here would run; `integration.md` gives a recommendation for it and
links to the issue rather than asking it again.
