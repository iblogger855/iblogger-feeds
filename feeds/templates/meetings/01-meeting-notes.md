# Template: Meeting Notes (General)

> **How to use:** Fill before the meeting starts (agenda, attendees). Complete during the meeting (discussion, decisions). Send to all attendees within 24 hours. Every decision and action item must be written down — if it's not written, it didn't happen.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Meeting: [MEETING TITLE]

**Date:** [YYYY-MM-DD]  
**Time:** [HH:MM] → [HH:MM] [TIMEZONE]  
**Location / Link:** [Room / Zoom / Google Meet URL]  
**Facilitator:** [NAME]  
**Note-taker:** [NAME]  
**Attendees:** [NAMES]  
**Absent:** [NAMES — optional]  

---

## 📋 Agenda

> Set before the meeting. Time-box each item.

| # | Topic | Owner | Time |
|:--|:------|:------|:-----|
| 1 | [TOPIC] | [NAME] | [X min] |
| 2 | [TOPIC] | [NAME] | [X min] |
| 3 | [TOPIC] | [NAME] | [X min] |

---

## 🗒️ Discussion Notes

### [TOPIC 1]

[KEY POINTS DISCUSSED]

### [TOPIC 2]

[KEY POINTS DISCUSSED]

---

## ✅ Decisions Made

> Every decision needs: what was decided, who decided, and what it unblocks or closes.

| # | Decision | Decided By | Closes / Unblocks |
|:--|:---------|:-----------|:-----------------|
| 1 | [DECISION] | [NAME(S)] | [WHAT IT AFFECTS] |
| 2 | [DECISION] | [NAME(S)] | [WHAT IT AFFECTS] |

---

## 🔁 Action Items

| # | Action | Owner | Due Date |
|:--|:-------|:------|:---------|
| 1 | [WHAT WILL BE DONE] | [NAME] | [DATE] |
| 2 | [WHAT WILL BE DONE] | [NAME] | [DATE] |

---

## 🅿️ Parking Lot

> Topics raised but not discussed — carry to next meeting or create a ticket.

- [TOPIC]

---

## 📅 Next Meeting

**Date:** [DATE]  
**Goal:** [WHAT NEEDS TO BE DECIDED OR REVIEWED]  

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Meeting: MFA Feature Kickoff

**Date:** 2026-05-10  
**Time:** 14:00 → 15:00 ICT  
**Location / Link:** Google Meet — meet.google.com/abc-defg-hij  
**Facilitator:** Sophea Keo  
**Note-taker:** Maly Chea  
**Attendees:** Sophea Keo (PM), Chamrong Thor (Tech Lead), Dara Pich (Design), Ratha Noun (QA), Legal rep  
**Absent:** DevOps (async review requested)  

---

## 📋 Agenda

| # | Topic | Owner | Time |
|:--|:------|:------|:-----|
| 1 | PRD walkthrough + sign-off | Sophea Keo | 20 min |
| 2 | Tech spec review + open questions | Chamrong Thor | 20 min |
| 3 | QA scope and test environment needs | Ratha Noun | 10 min |
| 4 | Legal: data encryption requirement confirmation | Legal rep | 10 min |

---

## 🗒️ Discussion Notes

### PRD Walkthrough

Sophea walked through the PRD v1.2. Team agreed the non-goal list is correct — SMS OTP deferred to v2. Enterprise admin view (FR-07) confirmed as "Should Have," not "Must Have" for v1.

### Tech Spec Review

Chamrong raised the open question on TOTP secret storage. Three options discussed (plaintext rejected, KMS considered but out of scope, AES-256 via `EncryptionService` agreed). Decision documented in ADR-007. The second open question — whether the rate limiter uses Redis or in-process — was deferred to Chamrong by EOD.

### QA Scope

Ratha confirmed QA needs a staging environment with test TOTP keys that don't expire. Chamrong will provide a `TOTP_TEST_SECRET` env var for staging by Sprint 14 Day 1.

### Legal: Encryption Confirmation

Legal confirmed AES-256-GCM meets the "data encrypted at rest" requirement for the enterprise tier contract. Written confirmation will be sent by 2026-05-12.

---

## ✅ Decisions Made

| # | Decision | Decided By | Closes / Unblocks |
|:--|:---------|:-----------|:-----------------|
| 1 | Use AES-256-GCM via `EncryptionService` for TOTP secret storage | Chamrong, Sophea, Legal | ADR-007, AUTH-5 can enter sprint |
| 2 | SMS OTP deferred to v2 — not in scope for AUTH-1 | Sophea Keo | Removes FR-10 from PRD |
| 3 | Enterprise admin MFA view is "Should Have" — not a blocker for GA | Sophea Keo | AUTH-7 can be deprioritized if sprint is tight |

---

## 🔁 Action Items

| # | Action | Owner | Due Date |
|:--|:-------|:------|:---------|
| 1 | Write ADR-007 for AES-256 decision | Chamrong Thor | 2026-05-12 |
| 2 | Decide rate limiter: Redis vs in-process | Chamrong Thor | 2026-05-11 |
| 3 | Send Legal written encryption confirmation | Legal rep | 2026-05-12 |
| 4 | Provision `TOTP_TEST_SECRET` in staging env | Chamrong Thor | 2026-05-18 |

---

## 🅿️ Parking Lot

- Should MFA be required for API key generation? → Sophea to add as open question in PRD.

---

## 📅 Next Meeting

**Date:** 2026-05-19  
**Goal:** Sprint 14 review — demo MFA enrollment flow to stakeholders.
