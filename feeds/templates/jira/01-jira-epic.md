# Template: Jira Epic

> **How to use:** Copy the blank template into Jira's Epic description. Fill in every `[PLACEHOLDER]`. Delete sections that don't apply. See the filled example below for reference.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

## 🏔️ Epic: [EPIC TITLE]

**Epic Key:** [PROJECT-XXX]  
**Owner:** [NAME]  
**Target Quarter / Release:** [Q? 20XX / vX.X]  
**Status:** `Draft` | `In Progress` | `Done`  

---

### 🎯 Goal

> One sentence. What outcome does this epic achieve for users or the business?

[DESCRIBE THE GOAL]

---

### 🔍 Problem Statement

> What problem are we solving? Who has this problem? What is the current pain?

[DESCRIBE THE PROBLEM]

---

### 📐 Scope

**In scope:**
- [ITEM]
- [ITEM]

**Out of scope:**
- [ITEM]
- [ITEM]

---

### 👤 Impacted Users / Personas

| Persona | Impact |
|:--------|:-------|
| [PERSONA 1] | [HOW THEY ARE AFFECTED] |
| [PERSONA 2] | [HOW THEY ARE AFFECTED] |

---

### 📊 Success Metrics

| Metric | Baseline | Target | How Measured |
|:-------|:---------|:-------|:-------------|
| [METRIC] | [CURRENT VALUE] | [TARGET VALUE] | [TOOL / METHOD] |
| [METRIC] | [CURRENT VALUE] | [TARGET VALUE] | [TOOL / METHOD] |

---

### 🗂️ Stories Breakdown

| Story Key | Title | Priority | Status |
|:----------|:------|:---------|:-------|
| [PROJECT-XXX] | [STORY TITLE] | High / Medium / Low | To Do |
| [PROJECT-XXX] | [STORY TITLE] | High / Medium / Low | To Do |

---

### 🔗 Dependencies

| Depends On | Type | Status |
|:-----------|:-----|:-------|
| [TEAM / SERVICE / EPIC] | Blocks / Blocked By / Related | [STATUS] |

---

### 📎 References

- [LINK TO PRD / SPEC / DESIGN]
- [LINK TO FIGMA / PROTOTYPE]

---

### 📅 Timeline

| Milestone | Target Date |
|:----------|:------------|
| Design complete | [DATE] |
| Dev start | [DATE] |
| QA complete | [DATE] |
| Release | [DATE] |

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

## 🏔️ Epic: User Authentication Overhaul

**Epic Key:** AUTH-1  
**Owner:** Chamrong Thor  
**Target Quarter / Release:** Q3 2026 / v3.0  
**Status:** `In Progress`  

---

### 🎯 Goal

Replace the legacy session-cookie login system with a JWT-based authentication flow that supports OAuth 2.0 social login and MFA, reducing login-related support tickets by 40%.

---

### 🔍 Problem Statement

The current session-cookie system forces users to log in every 24 hours, does not support social login, and has no MFA option. This causes ~200 support tickets per month ("forgot password", "account locked") and is a blocker for the enterprise sales tier which requires SSO.

---

### 📐 Scope

**In scope:**
- JWT access + refresh token flow
- Google and GitHub OAuth 2.0
- TOTP-based MFA (Google Authenticator compatible)
- Password reset via email

**Out of scope:**
- SAML / enterprise SSO (separate epic: SSO-1)
- Biometric login
- Legacy session migration for existing users (handled by DATA-44)

---

### 👤 Impacted Users / Personas

| Persona | Impact |
|:--------|:-------|
| End users | Faster login, no forced 24h re-auth, social login option |
| Enterprise buyers | Unblocks SSO evaluation (dependency on SSO-1) |
| Support team | Fewer "can't log in" tickets |

---

### 📊 Success Metrics

| Metric | Baseline | Target | How Measured |
|:-------|:---------|:-------|:-------------|
| Login-related support tickets/month | 200 | ≤ 120 | Zendesk tag `auth` |
| Login success rate | 91% | ≥ 97% | Datadog `auth.login.success` |
| MFA adoption (opt-in) | 0% | ≥ 25% within 60 days | Analytics event `mfa_enabled` |

---

### 🗂️ Stories Breakdown

| Story Key | Title | Priority | Status |
|:----------|:------|:---------|:-------|
| AUTH-2 | Implement JWT issue + refresh endpoint | High | In Progress |
| AUTH-3 | Google OAuth 2.0 login | High | To Do |
| AUTH-4 | GitHub OAuth 2.0 login | Medium | To Do |
| AUTH-5 | TOTP MFA enrollment flow | High | To Do |
| AUTH-6 | TOTP MFA verification on login | High | To Do |
| AUTH-7 | Password reset via email | Medium | To Do |
| AUTH-8 | Logout + token revocation | High | To Do |

---

### 🔗 Dependencies

| Depends On | Type | Status |
|:-----------|:-----|:-------|
| Email Service (INFRA-12) | Blocked By | Done ✓ |
| User DB schema migration (DATA-44) | Blocked By | In Progress |
| SSO Epic (SSO-1) | Related | Not Started |

---

### 📎 References

- [PRD: Auth Overhaul v2](https://confluence.example.com/auth-prd)
- [Figma: Login & MFA Flows](https://figma.com/auth-flows)
- [Tech Spec: JWT + OAuth Design](https://confluence.example.com/auth-spec)

---

### 📅 Timeline

| Milestone | Target Date |
|:----------|:------------|
| Design complete | 2026-06-01 |
| Dev start | 2026-06-08 |
| QA complete | 2026-07-15 |
| Release | 2026-07-22 |
