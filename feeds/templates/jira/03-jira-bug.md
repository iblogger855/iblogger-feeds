# Template: Jira Bug Ticket

> **How to use:** Copy the blank template into Jira's Bug description. Be precise — a vague bug report wastes more time than no bug report. Every field has a purpose.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

## 🐛 Bug: [SHORT DESCRIPTION — what broke, not what you expected]

**Bug Key:** [PROJECT-XXX]  
**Reporter:** [NAME]  
**Assignee:** [NAME / Unassigned]  
**Severity:** `Critical` | `High` | `Medium` | `Low`  
**Priority:** `P1` | `P2` | `P3` | `P4`  
**Affects Version:** [vX.X.X]  
**Fix Version:** [vX.X.X / TBD]  
**Environment:** `Production` | `Staging` | `Dev` | `Local`  
**Found In:** `QA` | `Production` | `Code Review` | `Monitoring`  

---

### 📋 Summary

> One sentence. What is broken?

[DESCRIBE THE BUG IN ONE SENTENCE]

---

### 🔁 Steps to Reproduce

> Be exact. Another engineer must be able to reproduce this with zero guessing.

1. [STEP 1]
2. [STEP 2]
3. [STEP 3]
4. ...

---

### 🎯 Expected Behavior

> What *should* happen?

[DESCRIBE EXPECTED OUTCOME]

---

### 💥 Actual Behavior

> What *actually* happens?

[DESCRIBE WHAT ACTUALLY OCCURS]

---

### 📸 Evidence

> Attach screenshot, screen recording, log snippet, or error message.

```
[PASTE ERROR MESSAGE / STACK TRACE / LOG HERE]
```

- [ ] Screenshot attached
- [ ] Screen recording attached
- [ ] Log / error trace attached

---

### 🌍 Environment Details

| Field | Value |
|:------|:------|
| Browser / Client | [Chrome 124 / iOS 17 / Android 14 / API client] |
| OS | [macOS 14 / Windows 11 / Ubuntu 22.04] |
| App Version | [vX.X.X] |
| User Role | [Admin / Regular User / Guest] |
| Account / Tenant | [ID or name — anonymize if production] |
| Data Conditions | [e.g. "only occurs when cart has >10 items"] |

---

### 🔬 Root Cause Analysis

> Fill in after investigation. Leave blank if unknown.

[ROOT CAUSE — class/method/query/config responsible]

---

### 🔧 Proposed Fix

> Optional. Fill in if obvious or if you already know the fix.

[DESCRIBE FIX APPROACH]

---

### 💣 Impact

- **Users affected:** [ALL / subset — describe]
- **Frequency:** `Always` | `Often` | `Sometimes` | `Rarely`
- **Revenue / SLA impact:** [YES — describe / NO]
- **Workaround available:** [YES — describe / NO]

---

### 🔗 Related

- [RELATED STORY / EPIC KEY]
- [PREVIOUS BUG OR INCIDENT KEY]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

## 🐛 Bug: Login succeeds with correct password but returns 500 when MFA is enabled

**Bug Key:** AUTH-31  
**Reporter:** Sophea Keo  
**Assignee:** Chamrong Thor  
**Severity:** `Critical`  
**Priority:** `P1`  
**Affects Version:** v3.0.1  
**Fix Version:** v3.0.2  
**Environment:** `Production`  
**Found In:** `Production`  

---

### 📋 Summary

When a user with MFA enabled logs in with a correct password and valid TOTP code, the server returns HTTP 500 instead of the expected JWT token response.

---

### 🔁 Steps to Reproduce

1. Create an account and enable MFA (TOTP via Google Authenticator).
2. Log out.
3. Go to `/login`.
4. Enter correct email and password → click **Continue**.
5. Enter the current 6-digit TOTP code from Google Authenticator → click **Verify**.
6. **Observe:** HTTP 500 response. User remains on MFA page.

---

### 🎯 Expected Behavior

Server returns HTTP 200 with a JWT access token and refresh token. User is redirected to the dashboard.

---

### 💥 Actual Behavior

Server returns HTTP 500 with no user-visible message. The browser console shows:

```
POST /auth/login/mfa 500 Internal Server Error
```

---

### 📸 Evidence

```
ERROR 2026-05-18T09:14:22Z [AuthController] NullPointerException at
  AuthService.java:147 — user.getMfaSecret() returned null
  after successful password verification

java.lang.NullPointerException: Cannot invoke
  "String.isEmpty()" because "mfaSecret" is null
    at AuthService.verifyTotp(AuthService.java:147)
    at AuthController.loginMfa(AuthController.java:83)
```

- [x] Screenshot attached (auth-31-screenshot.png)
- [ ] Screen recording attached
- [x] Log / error trace attached

---

### 🌍 Environment Details

| Field | Value |
|:------|:------|
| Browser / Client | Chrome 124, Safari 17, iOS Authenticator app |
| OS | macOS 14, iOS 17 |
| App Version | v3.0.1 |
| User Role | Regular User |
| Account / Tenant | All accounts with MFA enabled |
| Data Conditions | Only occurs when MFA was enrolled before v3.0.1 (migration gap) |

---

### 🔬 Root Cause Analysis

The MFA secret column (`mfa_secret`) was added in the DATA-44 migration but not backfilled for existing users. Users who enrolled MFA before the column existed have `NULL` in the column. `AuthService.verifyTotp()` does not null-check before calling `.isEmpty()` on the secret.

---

### 🔧 Proposed Fix

1. Add null check in `AuthService.verifyTotp()` — if `mfaSecret` is null, return an `MfaNotConfiguredException` (HTTP 409) with a clear message prompting re-enrollment.
2. Run a backfill migration to populate `mfa_secret` from the legacy `user_mfa` table for affected users.

---

### 💣 Impact

- **Users affected:** ~340 users who enrolled MFA before v3.0.1 release
- **Frequency:** `Always` — 100% of affected users cannot log in
- **Revenue / SLA impact:** YES — enterprise tier customers are blocked; SLA breach in 4 hours
- **Workaround available:** YES — support can temporarily disable MFA for affected accounts via admin panel

---

### 🔗 Related

- AUTH-5 (MFA enrollment story — root cause)
- DATA-44 (migration that introduced the column)
- INC-2026-0518 (production incident)
