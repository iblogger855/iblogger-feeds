# Template: Backlog Refinement

> **How to use:** Run every sprint, mid-sprint (so stories are ready for the *next* sprint's planning). Time-box to 90 minutes. The output is a set of stories that pass all DoR criteria and are estimated. Stories that fail DoR go back to the Product Owner, not into the next sprint.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Backlog Refinement: [DATE / SPRINT PREP]

**Date:** [YYYY-MM-DD]  
**Facilitator:** [NAME]  
**Attendees:** [NAMES]  
**Preparing for:** Sprint [NUMBER]  

---

## 🎯 Session Goal

> What backlog items do we need to be ready by end of this session?

- [ITEM]

---

## 📋 Stories Reviewed

### [STORY KEY] — [STORY TITLE]

**Current status:** `Needs Refinement` | `Ready` | `Blocked`  

**Story:**
> As a **[USER]**, I want to **[ACTION]** so that **[OUTCOME]**.

**Discussion notes:**
[KEY POINTS — clarifications, scope decisions, open questions answered]

**DoR Gate:**
- [ ] Story clearly written and understood
- [ ] Acceptance criteria testable
- [ ] UI/UX mockup available (if needed)
- [ ] API / data contract defined (if needed)
- [ ] Dependencies unblocked
- [ ] Story fits in one sprint

**Estimate:** [X story points] — Consensus / Split vote: [details if split]

**Outcome:** ✅ Ready for sprint / ❌ Back to PO — [reason] / 🔄 Needs follow-up by [NAME] by [DATE]

---

*(repeat section for each story)*

---

## 📊 Refinement Summary

| Story Key | Title | Points | Outcome |
|:----------|:------|:-------|:--------|
| [KEY] | [TITLE] | [X] | ✅ Ready / ❌ Back to PO / 🔄 Follow-up |

**Total stories refined:** [X]  
**Total points ready:** [X]  

---

## 🅿️ Parking Lot

- [TOPIC RAISED BUT NOT DISCUSSED — assign an owner]

---

## 🔁 Follow-up Actions

| # | Action | Owner | Due |
|:--|:-------|:------|:----|
| 1 | [ACTION] | [NAME] | [DATE] |

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Backlog Refinement: 2026-05-12 — Preparing for Sprint 14

**Date:** 2026-05-12  
**Facilitator:** Sophea Keo  
**Attendees:** Chamrong Thor, Dara Pich, Maly Chea, Ratha Noun  
**Preparing for:** Sprint 14  

---

## 🎯 Session Goal

- Get AUTH-5, AUTH-6, AUTH-7, AUTH-8 to DoR-ready status.
- Estimate AUTH-9 (E2E test suite).

---

## 📋 Stories Reviewed

### AUTH-5 — TOTP MFA Enrollment Flow

**Current status:** `Needs Refinement`

**Story:**
> As a **registered user**, I want to **enroll my authenticator app for MFA** so that **my account requires a second factor to log in**.

**Discussion notes:**
- Team asked: should the QR code page be accessible via deep link? Agreed: No — only via Settings → Security. Chamrong will add AC6 to block direct URL access.
- Dara confirmed Figma mockup is ready and shows both QR code and manual entry key.
- Backup code display: agreed to show 8 codes, user must check "I have saved these" before proceeding.
- TOTP library confirmed: `com.warrenstrange:googleauth:1.5.0`.

**DoR Gate:**
- [x] Story clearly written and understood
- [x] ACs testable (6 ACs agreed)
- [x] Figma mockup available: mfa-enrollment
- [x] `EncryptionService` confirmed for secret storage (ADR-007)
- [x] DATA-44 migration confirmed done
- [x] Fits in one sprint

**Estimate:** 5 points — unanimous

**Outcome:** ✅ Ready for Sprint 14

---

### AUTH-6 — TOTP MFA Verification on Login

**Current status:** `Needs Refinement`

**Story:**
> As a **user with MFA enabled**, I want to **enter my TOTP code after password verification** so that **my account requires both factors to access**.

**Discussion notes:**
- Maly raised: what if user enters a backup code instead of TOTP? Agreed: backup codes accepted on the same screen. Maly adds AC to test this path.
- Rate limiting: agreed 5 attempts per 10 minutes — implemented in `AuthService`, not at load balancer level.
- "Remember this device" feature: Sophea confirmed this is **out of scope** for v1 — listed as non-goal in PRD.

**DoR Gate:**
- [x] Story written and understood
- [x] ACs testable (5 ACs agreed)
- [x] Mockup: same login screen as AUTH-5 second step
- [x] Rate limiter approach decided
- [x] "Remember device" explicitly out of scope — no ambiguity
- [x] Fits in one sprint

**Estimate:** 5 points — unanimous

**Outcome:** ✅ Ready for Sprint 14

---

### AUTH-7 — Password Reset via Email

**Current status:** `Needs Refinement`

**Story:**
> As a **user who forgot their password**, I want to **request a password reset email** so that **I can regain access to my account**.

**Discussion notes:**
- Token expiry: agreed 15 minutes for the reset link. Ratha asked about reuse — agreed: single-use, token invalidated on use or expiry.
- AC3 was rewritten: original said "system sends email" — QA flagged this as not independently testable. Rewritten to: "reset email is delivered within 30 seconds in staging environment with MailHog."
- Chamrong flagged: this requires the email service (INFRA-12) to be confirmed working in staging. Ratha confirms MailHog is configured.

**DoR Gate:**
- [x] Story written and understood
- [x] ACs testable (4 ACs agreed after AC3 rewrite)
- [x] Email service dependency confirmed (INFRA-12 done)
- [x] Token expiry + single-use behavior agreed
- [x] Fits in one sprint

**Estimate:** 5 points — initial split (3 vs 5), discussed, agreed 5 (email delivery + token invalidation edge cases add complexity)

**Outcome:** ✅ Ready for Sprint 14

---

### AUTH-9 — E2E Test Suite for Auth Flows

**Current status:** `Needs Refinement`

**Story:**
> As a **QA engineer**, I want to **run an automated E2E test suite against the full auth flow** so that **regressions are caught before every release**.

**Discussion notes:**
- Ratha proposes Playwright — team agreed (already used in frontend tests).
- Scope: login (password only), login + MFA, password reset, logout.
- Not in scope: OAuth flows (separate story AUTH-11).

**DoR Gate:**
- [x] Story written and understood
- [x] ACs testable (4 flows agreed)
- [x] Tool agreed: Playwright
- [x] Staging environment confirmed available
- [x] Fits in one sprint

**Estimate:** 8 points — unanimous (Ratha noted this is setup cost, future suites will be cheaper)

**Outcome:** ✅ Ready for Sprint 14

---

## 📊 Refinement Summary

| Story Key | Title | Points | Outcome |
|:----------|:------|:-------|:--------|
| AUTH-5 | TOTP MFA Enrollment | 5 | ✅ Ready |
| AUTH-6 | TOTP MFA Verification | 5 | ✅ Ready |
| AUTH-7 | Password Reset | 5 | ✅ Ready |
| AUTH-9 | E2E Test Suite | 8 | ✅ Ready |

**Total stories refined:** 4 | **Total points ready:** 23

---

## 🅿️ Parking Lot

- AUTH-10 (Admin MFA view): not enough detail in ACs — Sophea to rewrite and bring to next refinement.
- "Remember this device": confirmed out of scope for v1, add to v2 backlog.

---

## 🔁 Follow-up Actions

| # | Action | Owner | Due |
|:--|:-------|:------|:----|
| 1 | Add AC6 (block direct URL to enrollment) to AUTH-5 | Chamrong | 2026-05-13 |
| 2 | Add backup code acceptance AC to AUTH-6 | Maly | 2026-05-13 |
| 3 | Rewrite AUTH-10 ACs with testable language | Sophea | 2026-05-19 |
