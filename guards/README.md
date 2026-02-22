# Guards Library

This directory contains entropy guard skill files for specific types of systems. Each guard is a targeted, low-burden ritual designed to preserve the coherence and intent of a particular kind of system across repeated iterations.

New guards should be generated using the meta-skill: [skills/meta-guard.md](../skills/meta-guard.md)

---

## What makes a good guard

A guard in this library should satisfy these criteria:

- **Targeted**: it addresses the highest-value entropy vectors for *this type of system*, not generic best practices
- **Low-burden**: 2–10 minutes to run; guards that take longer won't be run
- **Scoped to the delta**: it checks what changed in this iteration, not everything that could theoretically be wrong
- **Self-consistent with INTENT.md**: the guard preserves the things INTENT.md says matter — continuity of intent, internal consistency, accumulated knowledge, legibility, honest state
- **Rationale included**: the guard file explains *why* each check matters for this system type, so future maintainers can adapt it intelligently

---

## Guards

| Guard | System type | Status |
|-------|-------------|--------|
| *(none yet)* | | |

Guards are added as they are developed and evaluated. The first guards will likely emerge from running [meta-guard](../skills/meta-guard.md) against real systems.

---

## How to add a guard

1. Run `skills/meta-guard.md` against the target system
2. Review the proposed guard against the criteria above
3. Save the resulting skill file here as `guards/<system-type>-guard.md`
4. Add a row to the table above
5. Note any key decisions or learnings in DECISIONS.md / LEARNINGS.md

---

## How to evaluate an existing guard

Periodically, guards should be reviewed for staleness — a guard that no longer fits the system it was designed for is itself a source of entropy. Ask:

- Does this guard still target the real entropy vectors, or has the system changed?
- Is it still being run? If not, why not — is it too burdensome, or has it become irrelevant?
- Does it still align with the current INTENT.md?

If a guard needs significant revision, treat it as a new design problem and re-run the meta-skill.
