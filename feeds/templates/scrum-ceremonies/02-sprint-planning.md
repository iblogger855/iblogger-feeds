# Template: Sprint Planning

> **How to use:** Run at the start of each sprint. Time-box to 2 hours per 1-week sprint (4 hours for 2-week). The output is a **sprint goal** and a **committed backlog** that the team believes is achievable. Stories that don't pass DoR are not pulled in.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Sprint Planning: [SPRINT NAME / NUMBER]

**Date:** [YYYY-MM-DD]  
**Facilitator:** [SCRUM MASTER / LEAD]  
**Attendees:** [NAMES]  
**Sprint Duration:** [YYYY-MM-DD] → [YYYY-MM-DD]  

---

## 🎯 Sprint Goal

> One sentence. What is the team committed to delivering by end of sprint? Stakeholders should be able to judge success from this alone.

**"[SPRINT GOAL]"**

---

## 👥 Team Capacity

| Name | Available Days | Capacity (points or hours) | Notes |
|:-----|:--------------|:--------------------------|:------|
| [NAME] | [X / 10] | [X pts] | [vacation / on-call / other] |
| [NAME] | [X / 10] | [X pts] | |
| **Total** | | **[X pts]** | |

---

## 📋 Committed Stories

> Only stories that pass **all DoR criteria** can be pulled in.

| Key | Title | Points | Assignee | DoR ✓ |
|:----|:------|:-------|:---------|:------|
| [KEY] | [TITLE] | [X] | [NAME] | ✅ / ❌ |
| [KEY] | [TITLE] | [X] | [NAME] | ✅ / ❌ |
| **Total** | | **[X]** | | |

---

## 🔲 DoR Gate — Per Story Checklist

> For each story pulled in, confirm all items are checked.

| Story | ACs testable | Mockup ready | Estimate done | Dependencies clear | Fits sprint |
|:------|:------------|:-------------|:--------------|:-------------------|:------------|
| [KEY] | ✅ / ❌ | ✅ / ❌ / N/A | ✅ / ❌ | ✅ / ❌ | ✅ / ❌ |

---

## 🐛 Bug / Debt Allocation

| Key | Title | Points | Type |
|:----|:------|:-------|:-----|
| [KEY] | [TITLE] | [X] | Bug / Tech Debt |

---

## ⚠️ Risks & Dependencies

| Risk / Dependency | Likelihood | Impact | Mitigation |
|:------------------|:-----------|:-------|:-----------|
| [ITEM] | High / Med / Low | High / Med / Low | [PLAN] |

---

## 🅿️ Stretch Goals *(if capacity allows)*

| Key | Title | Points |
|:----|:------|:-------|
| [KEY] | [TITLE] | [X] |

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Sprint Planning: Sprint 14

**Date:** 2026-05-05  
**Facilitator:** Sophea Keo  
**Attendees:** Chamrong Thor, Sophea Keo, Dara Pich, Maly Chea, Ratha Noun  
**Sprint Duration:** 2026-05-05 → 2026-05-16  

---

## 🎯 Sprint Goal

**"Deliver a complete, testable MFA enrollment and login verification flow — users can enroll TOTP, use it to log in, and recover with backup codes."**

---

## 👥 Team Capacity

| Name | Available Days | Capacity | Notes |
|:-----|:--------------|:---------|:------|
| Chamrong Thor | 10 / 10 | 13 pts | |
| Dara Pich | 8 / 10 | 10 pts | 2 days design review for v2 |
| Maly Chea | 10 / 10 | 10 pts | |
| Ratha Noun | 9 / 10 | 8 pts | 1 day on-call rotation |
| **Total** | | **41 pts** | Buffer: ~15% → **target 35 pts** |

---

## 📋 Committed Stories

| Key | Title | Points | Assignee | DoR ✓ |
|:----|:------|:-------|:---------|:------|
| AUTH-2 | JWT issue + refresh endpoint | 5 | Chamrong | ✅ |
| AUTH-5 | TOTP MFA enrollment flow | 5 | Chamrong + Dara | ✅ |
| AUTH-6 | TOTP MFA verification on login | 5 | Maly | ✅ |
| AUTH-7 | Password reset via email | 5 | Dara | ✅ |
| AUTH-8 | Logout + token revocation | 3 | Chamrong | ✅ |
| AUTH-31 | Bug: Login 500 when MFA null | 3 | Chamrong | ✅ |
| AUTH-9 | E2E test suite for auth flows | 8 | Ratha | ✅ |
| **Total** | | **34 pts** | | All ✅ |

---

## 🔲 DoR Gate

| Story | ACs testable | Mockup ready | Estimate done | Dependencies clear | Fits sprint |
|:------|:------------|:-------------|:--------------|:-------------------|:------------|
| AUTH-2 | ✅ | N/A | ✅ | ✅ | ✅ |
| AUTH-5 | ✅ | ✅ | ✅ | ✅ | ✅ |
| AUTH-6 | ✅ | ✅ | ✅ | ✅ | ✅ |
| AUTH-7 | ✅ | ✅ | ✅ | ✅ | ✅ |
| AUTH-8 | ✅ | N/A | ✅ | ✅ | ✅ |
| AUTH-31 | ✅ | N/A | ✅ | ✅ | ✅ |
| AUTH-9 | ✅ | N/A | ✅ | ✅ | ✅ |

---

## 🐛 Bug / Debt Allocation

| Key | Title | Points | Type |
|:----|:------|:-------|:-----|
| AUTH-31 | Login 500 on MFA null secret | 3 | Bug |

---

## ⚠️ Risks & Dependencies

| Risk / Dependency | Likelihood | Impact | Mitigation |
|:------------------|:-----------|:-------|:-----------|
| DATA-44 backfill migration delayed | Medium | High | AUTH-31 defensive fix ships independently; backfill can follow in Sprint 15 |
| Staging TOTP key not provisioned in time for QA | Low | Medium | Chamrong provisions by Day 1 morning |

---

## 🅿️ Stretch Goals

| Key | Title | Points |
|:----|:------|:-------|
| AUTH-10 | Admin: view MFA status per team member | 5 |
