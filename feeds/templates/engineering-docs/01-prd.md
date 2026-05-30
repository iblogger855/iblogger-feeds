# Template: Product Requirements Document (PRD)

> **How to use:** Write the PRD *before* the technical spec. The PRD answers **what and why**. The tech spec answers **how**. Sections marked `[REQUIRED]` must be filled; others are optional based on scope.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# PRD: [FEATURE / PRODUCT NAME]

**Author:** [NAME]  
**Date:** [YYYY-MM-DD]  
**Status:** `Draft` | `In Review` | `Approved` | `Superseded`  
**Stakeholders:** [PM / Engineering Lead / Design / Legal / QA]  
**Related Epic:** [EPIC KEY]  
**Version:** v[X.X]  

---

## 1. Executive Summary `[REQUIRED]`

> 3–5 sentences. What are we building, why, and what outcome does it produce?

[SUMMARY]

---

## 2. Problem Statement `[REQUIRED]`

### 2.1 Current Situation

> What is the world like today? What are users doing now?

[DESCRIBE CURRENT STATE]

### 2.2 The Pain

> What specific friction, cost, or failure are users experiencing?

[DESCRIBE THE PAIN]

### 2.3 Evidence

> Data, user research, support tickets, NPS comments, or competitive analysis that proves the problem is real.

| Evidence | Source | Weight |
|:---------|:-------|:-------|
| [DATA POINT] | [SOURCE] | High / Medium / Low |

---

## 3. Goals & Non-Goals `[REQUIRED]`

### Goals

- [GOAL 1 — specific and measurable]
- [GOAL 2]

### Non-Goals

- [WHAT THIS PRD EXPLICITLY DOES NOT ADDRESS]
- [WHAT IS OUT OF SCOPE]

---

## 4. User Personas `[REQUIRED]`

| Persona | Description | Key Need | Frequency of Use |
|:--------|:------------|:---------|:-----------------|
| [PERSONA NAME] | [WHO THEY ARE] | [WHAT THEY NEED FROM THIS FEATURE] | Daily / Weekly / Rare |

---

## 5. User Stories / Jobs to Be Done

> High-level stories. Detailed AC goes in Jira stories.

- As a **[PERSONA]**, I want to **[ACTION]** so that **[OUTCOME]**.
- As a **[PERSONA]**, I want to **[ACTION]** so that **[OUTCOME]**.

---

## 6. Functional Requirements `[REQUIRED]`

> Number each requirement. Engineering and QA trace acceptance criteria back to these.

| ID | Requirement | Priority |
|:---|:------------|:---------|
| FR-01 | [REQUIREMENT] | Must Have |
| FR-02 | [REQUIREMENT] | Should Have |
| FR-03 | [REQUIREMENT] | Nice to Have |

---

## 7. Non-Functional Requirements

| Category | Requirement |
|:---------|:------------|
| Performance | [e.g. p99 latency < 300ms under 1000 concurrent users] |
| Security | [e.g. all tokens encrypted at rest with AES-256] |
| Availability | [e.g. 99.9% uptime SLA] |
| Compliance | [e.g. GDPR — user data deletable within 30 days] |
| Accessibility | [e.g. WCAG 2.1 AA] |

---

## 8. UX / Design

- **Mockups:** [LINK TO FIGMA / PROTOTYPE]
- **Key UX decisions:** [DESCRIBE ANY NON-OBVIOUS UX CHOICES]
- **Edge state designs:** [HOW DOES THE UI BEHAVE ON ERROR / EMPTY / LOADING?]

---

## 9. Success Metrics `[REQUIRED]`

| Metric | Baseline | Target | Timeframe | How Measured |
|:-------|:---------|:-------|:----------|:-------------|
| [METRIC] | [NOW] | [GOAL] | [X days post-launch] | [TOOL] |

---

## 10. Rollout Plan

| Phase | Audience | Date |
|:------|:---------|:-----|
| Internal dog-food | [TEAM / EMPLOYEES] | [DATE] |
| Closed beta | [X% of users / specific segment] | [DATE] |
| General availability | All users | [DATE] |

---

## 11. Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|:-----|:-----------|:-------|:-----------|
| [RISK] | High / Medium / Low | High / Medium / Low | [PLAN] |

---

## 12. Open Questions

| # | Question | Owner | Due Date |
|:--|:---------|:------|:---------|
| 1 | [QUESTION] | [NAME] | [DATE] |

---

## 13. Appendix

- [SUPPORTING RESEARCH LINKS]
- [COMPETITOR ANALYSIS]
- [PRIOR DECISION LOGS]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# PRD: Multi-Factor Authentication (MFA)

**Author:** Sophea Keo  
**Date:** 2026-05-01  
**Status:** `Approved`  
**Stakeholders:** Sophea Keo (PM), Chamrong Thor (Engineering Lead), Dara Pich (Design), Legal, QA  
**Related Epic:** AUTH-1  
**Version:** v1.2  

---

## 1. Executive Summary

We are adding TOTP-based MFA to the login flow so users can protect their accounts with a second authentication factor. This addresses a recurring security request from enterprise customers, reduces account takeover incidents, and unblocks the enterprise tier sales pipeline which requires MFA as a contractual requirement.

---

## 2. Problem Statement

### 2.1 Current Situation

Users currently authenticate with email + password only. There is no second factor. Once a password is compromised, the account is fully accessible.

### 2.2 The Pain

- 12 account takeover incidents in Q1 2026 affecting paying customers.
- 3 enterprise prospects declined to sign because MFA was absent from the security checklist.
- Support receives ~40 "account hacked" tickets per month.

### 2.3 Evidence

| Evidence | Source | Weight |
|:---------|:-------|:-------|
| 12 account takeover incidents in Q1 | Security incident log | High |
| 3 enterprise deals blocked by missing MFA | Sales CRM notes | High |
| 40 "account hacked" tickets/month | Zendesk tag `security` | High |
| 78% of surveyed power users want MFA | User survey Q4 2025, n=320 | Medium |

---

## 3. Goals & Non-Goals

### Goals

- Reduce account takeover incidents by ≥ 60% within 90 days of launch.
- Enable MFA adoption for ≥ 25% of active users within 60 days.
- Unblock at least 2 enterprise deals currently blocked by missing MFA.

### Non-Goals

- SMS-based OTP (excluded — SIM-swap risk; may be added in v2).
- Hardware security keys (FIDO2/WebAuthn — separate roadmap item).
- Mandatory MFA enforcement for all users (opt-in only in v1).

---

## 4. User Personas

| Persona | Description | Key Need | Frequency of Use |
|:--------|:------------|:---------|:-----------------|
| Power User | Technical user, manages integrations | Strong security, familiar with authenticator apps | Daily |
| Enterprise Admin | Manages team accounts, reports to CISO | Compliance evidence, team-wide enforcement controls | Weekly |
| Casual User | Non-technical, uses app occasionally | Simple setup, clear recovery path | Rare |

---

## 5. User Stories / Jobs to Be Done

- As a **power user**, I want to enroll my authenticator app so that my account requires a code I physically possess to log in.
- As an **enterprise admin**, I want to see MFA status for all team members so that I can confirm compliance during audits.
- As a **casual user**, I want clear backup codes so that I can still log in if I lose my phone.

---

## 6. Functional Requirements

| ID | Requirement | Priority |
|:---|:------------|:---------|
| FR-01 | Users can enroll TOTP MFA via Settings → Security | Must Have |
| FR-02 | Enrollment generates a QR code compatible with Google Authenticator and Authy | Must Have |
| FR-03 | Users must enter a valid TOTP code to confirm enrollment | Must Have |
| FR-04 | 8 single-use backup codes are shown after enrollment | Must Have |
| FR-05 | MFA is required at each new login session once enrolled | Must Have |
| FR-06 | Users can disable MFA after re-entering password + TOTP | Must Have |
| FR-07 | Enterprise admins can view MFA enrollment status per team member | Should Have |
| FR-08 | Users receive an email notification when MFA is enabled or disabled | Should Have |
| FR-09 | Admins can require MFA for all team members | Nice to Have |

---

## 7. Non-Functional Requirements

| Category | Requirement |
|:---------|:------------|
| Performance | MFA verification adds < 50ms to login p99 latency |
| Security | TOTP secrets encrypted at rest with AES-256; backup codes hashed with bcrypt |
| Availability | MFA service must not introduce downtime — graceful degradation if TOTP service fails |
| Compliance | GDPR — TOTP secrets deleted within 30 days of account deletion |
| Accessibility | MFA enrollment flow WCAG 2.1 AA compliant |

---

## 8. UX / Design

- **Mockups:** [Figma: MFA Enrollment & Login Flows](https://figma.com/mfa-flows)
- **Key UX decisions:** QR code + manual entry key both shown (some users can't scan QR).
- **Edge state designs:** If TOTP service is unreachable, login falls back to password-only with an alert banner. Backup code entry available at all times.

---

## 9. Success Metrics

| Metric | Baseline | Target | Timeframe | How Measured |
|:-------|:---------|:-------|:----------|:-------------|
| Account takeover incidents/month | 12 | ≤ 5 | 90 days post-launch | Security incident log |
| MFA enrollment rate | 0% | ≥ 25% | 60 days post-launch | Analytics `mfa_enabled` event |
| Enterprise deals unblocked | 0 | ≥ 2 | 30 days post-launch | Sales CRM |

---

## 10. Rollout Plan

| Phase | Audience | Date |
|:------|:---------|:-----|
| Internal dog-food | All employees (opt-in) | 2026-07-01 |
| Closed beta | Power users segment (top 5% by login frequency) | 2026-07-08 |
| General availability | All users | 2026-07-22 |

---

## 11. Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|:-----|:-----------|:-------|:-----------|
| Users lock themselves out with lost phone | Medium | High | 8 backup codes + support admin disable path |
| Low voluntary adoption | Medium | Medium | In-app nudge for power users + email campaign |
| TOTP clock drift causes rejection | Low | High | Allow ±1 TOTP window (30s tolerance) |

---

## 12. Open Questions

| # | Question | Owner | Due Date |
|:--|:---------|:------|:---------|
| 1 | Should MFA be required for API key generation? | Sophea Keo | 2026-06-01 |
| 2 | What is the backup code expiry policy? | Legal | 2026-06-01 |

---

## 13. Appendix

- [NIST SP 800-63B: MFA Guidelines](https://pages.nist.gov/800-63-3/sp800-63b.html)
- [Competitor analysis: How Notion, Linear, GitHub handle MFA](https://confluence.example.com/mfa-competitor)
