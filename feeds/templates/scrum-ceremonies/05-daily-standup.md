# Template: Daily Standup

> **How to use:** Time-box to 15 minutes. This is a synchronization meeting, not a status report to the manager. The team talks to the sprint goal, not to each other's calendars. Use the **sync format** for in-person/video standups and the **async format** for distributed teams posting in Slack/chat.

---

## ─── BLANK TEMPLATE (SYNC — In-Person / Video) ───────────────────

---

# Daily Standup — [DATE]

**Sprint:** [SPRINT NUMBER]  
**Sprint Day:** Day [X] of [X]  
**Scrum Master:** [NAME]  

---

## 🎯 Sprint Goal Reminder

> Read aloud at the start of every standup.

**"[SPRINT GOAL]"**

---

## 👤 Per-Person Update

> Each person answers 3 questions. Keep each update under 2 minutes.

### [NAME]

**Yesterday:** [WHAT WAS COMPLETED OR PROGRESSED]  
**Today:** [WHAT WILL BE WORKED ON]  
**Blockers:** [ANYTHING PREVENTING PROGRESS — or "None"]  

---

*(repeat for each team member)*

---

## 🚧 Blockers Board

> Blockers raised get a quick owner + resolution plan. Deep dives happen *after* standup.

| Blocker | Raised By | Owner | Resolution Plan |
|:--------|:----------|:------|:----------------|
| [BLOCKER] | [NAME] | [NAME] | [PLAN / FOLLOW-UP AFTER STANDUP] |

---

## 📊 Sprint Board Quick Scan

> Scrum master calls out any stories at risk.

| Story | Status | Risk |
|:------|:-------|:-----|
| [KEY: TITLE] | In Progress / Blocked / Review | ⚠️ At risk / ✅ On track |

---

## ─── BLANK TEMPLATE (ASYNC — Written / Slack) ───────────────────

> Post in team channel by [TIME]. Tag blockers directly.

```
📅 Standup — [DATE]

✅ Yesterday: [WHAT YOU COMPLETED]
🔨 Today: [WHAT YOU'RE WORKING ON]
🚧 Blockers: [BLOCKER — @mention owner] / None

Sprint goal progress: [On track / At risk — brief note]
```

---

## ─── FILLED EXAMPLE (SYNC) ───────────────────────────────────────

---

# Daily Standup — 2026-05-12

**Sprint:** Sprint 14  
**Sprint Day:** Day 6 of 10  
**Scrum Master:** Sophea Keo  

---

## 🎯 Sprint Goal Reminder

**"Deliver a complete, testable MFA enrollment and login verification flow."**

---

## 👤 Per-Person Update

### Chamrong Thor

**Yesterday:** Finished AUTH-5 (TOTP enrollment) — all 6 ACs green. PR approved and merged.  
**Today:** Starting AUTH-6 (MFA verification on login). Will pair with Maly on the rate-limiter logic.  
**Blockers:** None.

---

### Dara Pich

**Yesterday:** Updated Figma for AUTH-6 second-step screen based on feedback from QA.  
**Today:** Starting AUTH-7 (password reset) — email template design.  
**Blockers:** Need email service (INFRA-12) confirmation that MailHog is configured in staging. Blocked on Ratha.

---

### Maly Chea

**Yesterday:** Wrote unit tests for AUTH-5, found 1 edge case (empty backup code list) — raised as AUTH-32.  
**Today:** Pair with Chamrong on AUTH-6 rate limiter. Will also write test cases for AUTH-7 ACs.  
**Blockers:** None.

---

### Ratha Noun

**Yesterday:** E2E test scaffolding done — Playwright connected to staging, 4 test stubs written.  
**Today:** Implement login + MFA E2E test flow.  
**Blockers:** Need staging `TOTP_TEST_SECRET` env var from Chamrong — asked yesterday, not yet done.

---

## 🚧 Blockers Board

| Blocker | Raised By | Owner | Resolution Plan |
|:--------|:----------|:------|:----------------|
| MailHog not confirmed in staging | Dara Pich | Ratha Noun | Ratha checks after standup, confirms by 10:30 |
| `TOTP_TEST_SECRET` not in staging | Ratha Noun | Chamrong Thor | Chamrong adds before 11:00 today |

---

## 📊 Sprint Board Quick Scan

| Story | Status | Risk |
|:------|:-------|:-----|
| AUTH-5: TOTP Enrollment | Done ✅ | — |
| AUTH-6: MFA Verification | In Progress | ✅ On track |
| AUTH-7: Password Reset | In Progress | ⚠️ At risk — blocked on staging env |
| AUTH-8: Logout + Revocation | Not Started | ✅ On track (Day 7 planned start) |
| AUTH-9: E2E Suite | In Progress | ✅ On track |

---

## ─── FILLED EXAMPLE (ASYNC) ───────────────────────────────────────

```
📅 Standup — 2026-05-12 | Chamrong Thor

✅ Yesterday: AUTH-5 MFA enrollment — merged. All 6 ACs green.
🔨 Today: Starting AUTH-6 (MFA verification). Pairing with Maly on rate limiter.
🚧 Blockers: Need to add TOTP_TEST_SECRET to staging for @Ratha — doing this by 11:00.

Sprint goal progress: On track — Day 6 of 10, 3 of 7 stories done.
```
