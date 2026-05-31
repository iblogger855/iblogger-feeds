# Template: Retrospective Formats

> **How to use:** A team that runs the *same* retro every sprint stops thinking. Rotate through these formats to reach different insights and keep energy up — see [03 — Facilitating Ceremonies](../03-facilitating-ceremonies.md) and [05 — Coaching & Team Health](../05-coaching-and-team-health.md). Every format follows the same arc: **(1)** set safety, **(2)** review last retro's actions (5 min), **(3)** run the format, **(4)** converge to **1–2 concrete, owned actions** — never ten. Pick a format that fits the moment; the filled example shows one in full.

**The universal rules (apply to every format):**
- Open with safety (check-in or the Prime Directive). Blameless — about the system, not people.
- First 5 minutes: review previous actions. Done? Helped?
- Time-box each section. Balance voices (silent writing → share → group; use dot-voting).
- Close with **max 1–2 actions**, each with an **owner**. Review them first thing next retro.

---

## ─── BLANK TEMPLATES ──────────────────────────────────────────────

---

### Format A — Start / Stop / Continue
*Best for:* a quick, action-oriented retro; good default for a new team.

| START doing | STOP doing | CONTINUE doing |
|:------------|:-----------|:---------------|
| [ ] | [ ] | [ ] |

**Facilitation notes:** Silent-write 5 min, post, group similar, dot-vote top items, pick actions. Fast (~45 min). The action almost always comes from START or STOP.

---

### Format B — 4Ls (Liked / Learned / Lacked / Longed For)
*Best for:* reflection-heavy sprints, after a big release or a rough patch.

| LIKED | LEARNED | LACKED | LONGED FOR |
|:------|:--------|:-------|:-----------|
| [ ] | [ ] | [ ] | [ ] |

**Facilitation notes:** Richer than Start/Stop/Continue — surfaces feelings and knowledge, not just process. "Lacked" and "Longed for" often reveal the real impediments. Good when safety needs a gentle on-ramp.

---

### Format C — Sailboat (Wind / Anchors / Rocks / Island)
*Best for:* visual teams; connecting day-to-day friction to a bigger goal.

```
        ☀️ ISLAND (the goal / where we want to be)
   🌬️ WIND ──►   ⛵   ◄── ⚓ ANCHORS
   (what pushes us)     (what holds us back)
              🪨 ROCKS (risks ahead)
```

- **Wind:** what's helping us move
- **Anchors:** what's slowing us down
- **Rocks:** risks we can see coming
- **Island:** the goal we're sailing toward

**Facilitation notes:** Draw it on a whiteboard/Miro. Sticky-note onto the picture. The metaphor lowers defensiveness — people name "anchors" more freely than "problems." Anchors → impediments; Rocks → risks for the [impediment log](./impediment-log-template.md).

---

### Format D — Mad / Sad / Glad
*Best for:* surfacing emotion and morale; teams under stress or with low safety.

| 😠 MAD | 😢 SAD | 😀 GLAD |
|:-------|:-------|:--------|
| [ ] | [ ] | [ ] |

**Facilitation notes:** Explicitly emotional — use when morale or safety is the issue you're coaching. Validate feelings before jumping to fixes. Cluster themes, then ask "what one change would move the most MAD/SAD to GLAD?"

---

## ─── FILLED EXAMPLE (Sailboat, Team Lotus) ────────────────────────

---

# Retrospective — Team Lotus · Sprint 8 · 2026-06-26

**Facilitator:** Vanna · **Format:** Sailboat · **Present:** 8 of 8

**Safety opener:** read the Prime Directive. *(First retro in 6 weeks — Vanna re-established it as non-negotiable.)*

**Prior actions review:** None to review — retros had been skipped. Noted, no blame.

**Participation note:** Used **silent sticky-writing first**, then dot-voting — specifically to stop one voice (Sokha) anchoring the discussion early and to draw in Dara, Bopha, and Veasna. Result: all 8 contributed (vs 2–3 typically).

```
        ☀️ ISLAND: "ship the refunds feature, predictably, without crunch"

🌬️ WIND                          ⚓ ANCHORS
- pairing on the hard story      - retros keep getting skipped → nothing improves
- QA catching issues early       - Sokha decides all the "how" → rest of us disengage
                                 - flaky CI eats ~a day each sprint
                          🪨 ROCKS
                          - Team X auth dependency (blocked 3 sprints running)
```

**Dot-vote top anchors:** (1) skipped retros, (2) one person owns every decision.

**Actions (max 2, owned):**
- [ ] **[Whole team] Retro every sprint — non-negotiable working agreement.** Vanna books it as a recurring, protected slot. *(Owner: Vanna to protect the slot; team to show up.)*
- [ ] **[Sokha] Draft the approach as a short RFC** for the team to react to before planning, instead of deciding live — try for 2 sprints. *(Sokha volunteered — turning the dominant voice into the enabler.)*

**Rocks → impediment log:** auth dependency logged as IMP-08 (organizational), Vanna building the data case.

**Next retro:** review both actions first thing.

---

*Template for the [Scrum Master Playbook](../README.md)*
