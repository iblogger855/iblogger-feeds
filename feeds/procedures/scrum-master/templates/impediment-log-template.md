# Template: Impediment Log

> **How to use:** This is the backbone of the [Removing Impediments](../04-removing-impediments.md) discipline. Keep it **visible** to the team (a board column, a shared sheet, a channel). Log every impediment the moment it surfaces. The single most important field is the **age** (today − raised date) — review it daily; anything aging without progress jumps the queue or escalates. One *named* owner per row — never "the team." Use the resolution field to spot recurring patterns to take to the retro.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Impediment Log — [TEAM NAME]

**Maintained by:** [SCRUM MASTER NAME] · **Last reviewed:** [YYYY-MM-DD]

**Status key:** 🆕 Open · 🔧 In progress · ⬆️ Escalated · ✅ Resolved

| ID | Impediment | Raised | Impact | Owner | Escalation | Status | Resolution |
|:---|:-----------|:------:|:-------|:------|:-----------|:------:|:-----------|
| IMP-01 | [one clear sentence] | [date] | [who/what stalled + cost] | [name] | [to whom / when, or —] | 🆕 | [blank until closed] |
| IMP-02 | | | | | | | |
| IMP-03 | | | | | | | |

**Daily review checklist:**
- [ ] Any impediment older than 1–2 days without progress? → push or escalate
- [ ] Every open row has one named owner + a next action?
- [ ] Any resolved rows to celebrate + loop closed with the person?
- [ ] Any recurring pattern to take to the retro?

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Impediment Log — Team Lotus

**Maintained by:** Vanna · **Last reviewed:** 2026-06-18

| ID | Impediment | Raised | Impact | Owner | Escalation | Status | Resolution |
|:---|:-----------|:------:|:-------|:------|:-----------|:------:|:-----------|
| IMP-04 | Flaky CI fails ~30% of runs; team re-runs builds repeatedly | 06-08 | Whole team; ~1 day/sprint lost | Vanna | Eng Manager (06-10) | ✅ | Platform team pinned a bad test container; CI green since 06-15 |
| IMP-05 | Blocked on Payments API spec for the refund story | 06-15 | 2 engineers idle, sprint goal at risk | Vanna | Payments lead (06-15, same day) | ✅ | Spec delivered 06-17 after escalation with impact framing |
| IMP-06 | No shared staging env; QA waits for a free slot | 06-16 | QA blocked ~half the sprint | Sokha (team can clear) | — | 🔧 | Team spinning up per-branch preview envs; pilot this sprint |
| IMP-07 | Refinement keeps leaking into planning → planning runs 3h+ | 06-17 | Whole team; planning fatigue | Vanna | — (process) | 🆕 | (recurring — taking to next retro as root-cause) |
| IMP-08 | Dependency on Team X for the shared auth library — 3rd sprint blocked | 06-17 | Recurring; ~8 people-days over 3 sprints | Vanna | Eng Manager — organizational | ⬆️ | (org impediment; building the data case for a standing fix) |

**Daily review notes (06-18):**
- IMP-06 self-cleared by the team — celebrated in standup. Good self-organization signal.
- IMP-07 + IMP-08 are *recurring* → root-cause candidates for the retro, not one-offs.
- IMP-08 is organizational — escalated with frequency × cost data (8 people-days), framed around team outcomes, not blame on Team X.

---

*Template for the [Scrum Master Playbook](../README.md)*
