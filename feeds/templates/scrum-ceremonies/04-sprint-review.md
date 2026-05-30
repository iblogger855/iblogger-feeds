# Template: Sprint Review / Demo

> **How to use:** Run at the end of every sprint, before the retrospective. Invite stakeholders. Demo working software — not slides, not "in progress" screens. Time-box to 1–2 hours. The output is stakeholder feedback and a clear picture of what shipped.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Sprint Review: [SPRINT NAME / NUMBER]

**Date:** [YYYY-MM-DD]  
**Facilitator:** [SCRUM MASTER / LEAD]  
**Presenter(s):** [NAMES]  
**Attendees:** [NAMES — include stakeholders]  
**Sprint Duration:** [YYYY-MM-DD] → [YYYY-MM-DD]  

---

## 🎯 Sprint Goal — Did We Achieve It?

**Goal:** "[SPRINT GOAL]"

**Result:** ✅ Achieved / ⚠️ Partially Achieved / ❌ Not Achieved  
**Notes:** [EXPLAIN IF NOT FULLY ACHIEVED]

---

## 📊 Sprint Summary

| Metric | Planned | Actual |
|:-------|:--------|:-------|
| Story Points Committed | [X] | [X] |
| Story Points Delivered | [X] | [X] |
| Stories Completed | [X] | [X] |
| Bugs Fixed | [X] | [X] |
| Carry-over | [X stories / X pts] | — |

---

## 🎬 Demo — What Shipped

> For each shipped story: describe what was built, show it working, explain the value.

### [STORY KEY] — [STORY TITLE]

**Demo by:** [NAME]  
**Value delivered:** [ONE SENTENCE — what can users now do that they couldn't before?]  
**Demo notes:** [WHAT WAS SHOWN / KEY MOMENTS]  

---

*(repeat for each shipped story)*

---

## 📈 Metrics Delta

> Did we move the needle on sprint-level or epic-level success metrics?

| Metric | Before Sprint | After Sprint | Trend |
|:-------|:-------------|:-------------|:------|
| [METRIC] | [VALUE] | [VALUE] | ↑ / ↓ / → |

---

## 💬 Stakeholder Feedback

| Stakeholder | Feedback | Action Required |
|:------------|:---------|:----------------|
| [NAME / ROLE] | [FEEDBACK] | Yes — [ACTION] / No |

---

## 📋 Not Completed — Carry-over

| Key | Title | Reason | Plan |
|:----|:------|:-------|:-----|
| [KEY] | [TITLE] | [WHY NOT DONE] | Sprint [X] / Backlog / Cancelled |

---

## 📅 Next Sprint Preview

> Brief heads-up on what's coming next — not a commitment.

- [UPCOMING STORY / INITIATIVE]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Sprint Review: Sprint 14

**Date:** 2026-05-16  
**Facilitator:** Sophea Keo  
**Presenter(s):** Chamrong Thor, Dara Pich, Ratha Noun  
**Attendees:** Auth Squad, VP Engineering (Kosal Mao), Enterprise Sales (Chan Virak), QA Lead (Maly Chea)  
**Sprint Duration:** 2026-05-05 → 2026-05-16  

---

## 🎯 Sprint Goal — Did We Achieve It?

**Goal:** "Deliver a complete, testable MFA enrollment and login verification flow — users can enroll TOTP, use it to log in, and recover with backup codes."

**Result:** ✅ Achieved  
**Notes:** AUTH-6 and AUTH-8 were completed by Day 8 despite the AUTH-31 P1 hotfix consuming Day 5. All ACs verified by QA.

---

## 📊 Sprint Summary

| Metric | Planned | Actual |
|:-------|:--------|:-------|
| Story Points Committed | 34 | 34 |
| Story Points Delivered | 34 | 34 |
| Stories Completed | 7 | 7 |
| Bugs Fixed | 1 planned | 3 (AUTH-31 + 2 QA-found issues) |
| Carry-over | 0 | — |

---

## 🎬 Demo — What Shipped

### AUTH-5 — TOTP MFA Enrollment

**Demo by:** Dara Pich  
**Value:** Users can now protect their accounts with a second factor using any TOTP app (Google Authenticator, Authy).  
**Demo notes:** Dara showed end-to-end enrollment: Settings → Security → Enable MFA → QR code scan with Google Authenticator → enter 6-digit code to confirm → backup codes displayed. Kosal asked about the manual key entry — Dara showed that below the QR code. Chan Virak confirmed this satisfies the enterprise security checklist requirement.

---

### AUTH-6 — TOTP MFA Verification on Login

**Demo by:** Chamrong Thor  
**Value:** Accounts with MFA enabled now require a second factor on every new login — a stolen password alone is not enough.  
**Demo notes:** Chamrong showed full login flow: email + password → MFA screen → 6-digit TOTP → dashboard. Also showed backup code path and rate limiting (5 wrong attempts triggers 10-minute cooldown). Kosal asked about "remember this device" — Sophea confirmed this is v2 scope and is on the roadmap.

---

### AUTH-9 — E2E Test Suite

**Demo by:** Ratha Noun  
**Value:** Every CI push now runs a full Playwright E2E suite against the auth flows — regressions caught before they reach staging.  
**Demo notes:** Ratha ran the suite live in the meeting (42 tests, 2m 14s). Showed it catch a deliberately broken login endpoint. Kosal asked if it runs on PRs — confirmed yes, blocks merge on failure.

---

## 📈 Metrics Delta

| Metric | Before Sprint 14 | After Sprint 14 | Trend |
|:-------|:----------------|:----------------|:------|
| Login error rate (production) | 0.04% | 0.04% | → Stable |
| MFA-enrolled users | 0 | 0 (feature not yet GA) | → Feature flag off |
| Auth E2E test coverage | 0% | 100% of core flows | ↑ |

---

## 💬 Stakeholder Feedback

| Stakeholder | Feedback | Action Required |
|:------------|:---------|:----------------|
| Kosal Mao (VP Eng) | Impressed by E2E suite — wants same for payments service | Yes — Ratha to present approach to payments team |
| Chan Virak (Sales) | MFA satisfies enterprise security checklist — unblocks 2 deals | Yes — Sophea to notify sales leads to re-engage prospects |
| Maly Chea (QA) | Backup code UX unclear — "I have saved these" checkbox easy to miss | Yes — Dara to increase checkbox prominence before GA |

---

## 📋 Not Completed — Carry-over

*(None — all committed stories delivered.)*

---

## 📅 Next Sprint Preview

- AUTH-10: Admin MFA status view for team accounts (enterprise tier).
- AUTH-11: Google OAuth 2.0 login.
- Begin rollout plan: enable MFA feature flag for internal employees (dog-food phase).
