# Decisions

Record architectural choices so future you (and agents) understand why.

---

### LEARNINGS.md stays tactical; articles capture conceptual work

**Context**: Extended discussions produce two kinds of knowledge — tactical learnings (short, specific, validated) and conceptual frameworks (longer-form arguments and analyses). Needed to decide where each lives.
**Decision**: LEARNINGS.md keeps its current format for tactical insights. Conceptual/intellectual work from conversations is captured via the distill-article skill into `articles/` as Substack-ready drafts. PHILOSOPHY.md remains for fragments and reflections that aren't structured enough for an article.
**Impact**: Three containers with clear purposes — no ambiguity about where to put what.

---

### Guard creation skills over guard libraries

**Context**: Debated whether to invest in a large library of system-specific guards or in the meta-skill that creates them.
**Decision**: Invest primarily in the guard creation skill (and potentially domain-specific variants). Maintain only a small number of exemplary guards as reference implementations, not a browsable library.
**Impact**: The meta-skill is the product, not individual guards. Avoids a library of "near misses" that are 70% right for any given system.

---

[Add your decisions here - newest first]
