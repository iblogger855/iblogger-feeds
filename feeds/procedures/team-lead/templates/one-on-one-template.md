# Template: 1-on-1 Notes (Team Lead)

> **How to use:** Keep one running doc per engineer (append each session at the top). As a Tech Lead your leverage comes from trust and growth, and the 1-on-1 is where both are built — it's *their* meeting, not your status update. The discovery questions are especially useful in your first weeks. See [05 — Mentoring & Growth](../05-mentoring-and-growth.md) and [01 — First 90 Days](../01-first-90-days.md).

---

## ─── BLANK TEMPLATE (per session) ─────────────────────────────────

---

## 1-on-1 — [NAME] · [YYYY-MM-DD]

**Their topics (they drive):**
- [ ]

**Blockers I can clear (enable, don't absorb):**
- [ ]

**Growth — what they're working toward:**
- [ ]

**Feedback (both directions):**
- To them: [ ]
- From them (to me): [ ]

**Actions:**
- [ ] [me] [ ]
- [ ] [them] [ ]

**Follow up next time:** [ ]

---

## ─── FIRST-MEETING DISCOVERY QUESTIONS (new Tech Lead) ─────────────

> Ask these of every engineer (and adapt for PM/QA/PO) in your first two weeks. Same questions for each — patterns across answers reveal the real problems. Listen 80%, talk 20%, and resist promising fixes.

**People & ways of working**
- What's working well that I should **not** change?
- What's the most frustrating part of your week — technically and otherwise?
- How do you like to be communicated with, and how often?
- What does "this team is going well" look like to you?

**The codebase & technical**
- If you were in my seat, what's the first thing you'd fix in the codebase?
- Which part of the system do you dread touching, and why?
- Where do we lose the most time — builds, reviews, environments, unclear tickets?
- What's something only you know how to do? (finding the bus-factor risks)

**Growth**
- Where do you want to grow — deeper, broader, toward leading?
- What do you want to learn that you haven't had the chance to?

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

## 1-on-1 — Rith (senior dev, owns payments) · 2026-06-05

**Their topics:** burned out being the only one who can safely touch the payments module; gets pulled into every payments PR and incident.

**Blockers I can clear:** flaky CI makes him re-run the pipeline 3–4× per PR — I'll prioritize the flaky-test quarantine this sprint so it stops eating his time.

**Growth — what he's working toward:** wants to drive architecture, not just own one corner. Perfect — I'll have him lead the ADR for splitting payments out of the monolith.

**Feedback:**
- To them: your write-up of the last payment-timeout incident was the clearest post-mortem I've read here — that's exactly the bar.
- From them: I jumped into a design detail in standup that should've been offline; he's right, I'll take design to the weekly slot.

**Actions:**
- [ ] [me] prioritize flaky-test quarantine (target: green main-branch rate > 95%)
- [ ] [me] pair Sokha onto payments as a second owner to cut the bus factor
- [ ] [me] set up a weekly design discussion so it's not crammed into standup
- [ ] [Rith] draft ADR-001: carve `payments` out of the monolith behind a clean interface
- [ ] [Rith] run the first payments pairing session with Sokha

**Follow up:** flaky-CI progress; ADR-001 first draft; how the Sokha pairing felt.

---

*Template for the [Team Lead Playbook](../README.md)*
