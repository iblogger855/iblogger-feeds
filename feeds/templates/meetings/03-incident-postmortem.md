# Template: Incident Post-Mortem

> **How to use:** Complete within 48 hours of incident resolution while details are fresh. This is a **blameless** document — the goal is to understand *why the system failed*, not to assign fault to individuals. Share with the whole team. Archive permanently.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Post-Mortem: [INCIDENT TITLE]

**Incident ID:** [INC-YYYY-MMDD]  
**Date of Incident:** [YYYY-MM-DD]  
**Duration:** [HH:MM] → [HH:MM] ([X hours X minutes total])  
**Severity:** `SEV-1` | `SEV-2` | `SEV-3` | `SEV-4`  
**Status:** `Resolved` | `Monitoring`  
**Author:** [NAME]  
**Reviewers:** [NAMES]  
**Review Date:** [YYYY-MM-DD]  

---

## 🔴 Impact Summary

| Dimension | Detail |
|:----------|:-------|
| Services affected | [SERVICE NAMES] |
| Users affected | [NUMBER / PERCENTAGE] |
| Revenue impact | [$ AMOUNT / UNKNOWN] |
| SLA breach | Yes / No — [DETAIL] |
| Data loss | Yes / No — [DETAIL] |

---

## ⏱️ Timeline

> UTC timestamps. Be precise. One row per event.

| Time (UTC) | Event | Who |
|:-----------|:------|:----|
| [HH:MM] | [EVENT — e.g. "Alert fired: auth.login.error_rate > 5%"] | Monitoring |
| [HH:MM] | [EVENT — e.g. "On-call engineer paged"] | PagerDuty |
| [HH:MM] | [EVENT — e.g. "Root cause identified: null pointer in MfaService"] | [NAME] |
| [HH:MM] | [EVENT — e.g. "Hotfix deployed to production"] | [NAME] |
| [HH:MM] | [EVENT — e.g. "Error rate returned to baseline"] | Monitoring |
| [HH:MM] | [EVENT — e.g. "Incident declared resolved"] | [NAME] |

---

## 🔬 Root Cause

> What single condition, if different, would have prevented this incident?

[PRECISE ROOT CAUSE — system, code, config, or process failure]

---

## 🌊 Contributing Factors

> What conditions made the root cause possible or made recovery harder?

- [FACTOR — e.g. "No null-check in verifyTotp() — assumption that migration was complete"]
- [FACTOR — e.g. "No alert on 500 error rate for individual endpoints — only aggregate"]
- [FACTOR — e.g. "No runbook for this failure mode"]

---

## 🎯 What Went Well

> Blameless celebration — what saved us or limited the impact?

- [ITEM — e.g. "On-call runbook guided responder to root cause in < 10 minutes"]
- [ITEM]

---

## 😬 What Went Poorly

> What made this worse than it needed to be?

- [ITEM — e.g. "Alert fired 8 minutes after the issue started — too slow"]
- [ITEM]

---

## 🔁 Action Items

> Categorize as: **Prevent** (stop this from happening) / **Detect** (catch it sooner) / **Respond** (fix it faster).

| # | Action | Category | Owner | Due Date |
|:--|:-------|:---------|:------|:---------|
| 1 | [ACTION] | Prevent / Detect / Respond | [NAME] | [DATE] |
| 2 | [ACTION] | Prevent / Detect / Respond | [NAME] | [DATE] |

---

## 📎 References

- [LINK TO ALERT / DASHBOARD / LOG QUERY]
- [LINK TO HOTFIX PR]
- [LINK TO JIRA TICKET]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Post-Mortem: MFA Login 500 for Users with Legacy TOTP Enrollment

**Incident ID:** INC-2026-0518  
**Date of Incident:** 2026-05-18  
**Duration:** 08:57 → 13:14 UTC (4 hours 17 minutes)  
**Severity:** `SEV-1`  
**Status:** `Resolved`  
**Author:** Chamrong Thor  
**Reviewers:** Sophea Keo, Ratha Noun  
**Review Date:** 2026-05-19  

---

## 🔴 Impact Summary

| Dimension | Detail |
|:----------|:-------|
| Services affected | `auth-service` — login endpoint for MFA users |
| Users affected | 342 users (all users who enrolled MFA before v3.0.1) |
| Revenue impact | ~$8,400 estimated (3 enterprise accounts unable to log in for 4h) |
| SLA breach | Yes — 3 enterprise accounts have 99.9% uptime SLA; breach window: 4h 17min |
| Data loss | No |

---

## ⏱️ Timeline

| Time (UTC) | Event | Who |
|:-----------|:------|:----|
| 08:57 | v3.0.1 deployed to production | CI/CD pipeline |
| 09:05 | First user-reported login failure via support chat | Sophea Keo |
| 09:11 | Aggregate error rate alert: `auth.error_rate > 2%` | Datadog |
| 09:14 | On-call paged (Ratha Noun) | PagerDuty |
| 09:22 | Ratha identifies error: `NullPointerException` in `AuthService.verifyTotp:147` | Ratha Noun |
| 09:28 | Root cause confirmed: `mfa_secret` null for pre-v3.0.1 MFA users | Chamrong Thor |
| 09:35 | Workaround activated: support disables MFA for top 3 enterprise accounts | Sophea Keo |
| 10:15 | Hotfix PR (AUTH-32) submitted and reviewed | Chamrong Thor |
| 10:44 | Hotfix deployed to staging — tests pass | CI pipeline |
| 11:02 | Hotfix deployed to production | Chamrong Thor |
| 11:09 | Error rate returns to baseline (0.04%) | Datadog |
| 13:14 | Backfill migration (V21) completes — all 342 users restored | Chamrong Thor |
| 13:14 | Incident declared resolved | Chamrong Thor |

---

## 🔬 Root Cause

The DATA-44 migration added a `mfa_secret` column to the `users` table but did not backfill it from the legacy `user_mfa` table. Users who enrolled MFA before v3.0.1 had `NULL` in `mfa_secret`. `AuthService.verifyTotp()` called `.isEmpty()` on the secret without a null check, causing a `NullPointerException` and HTTP 500 on every login attempt for those users.

---

## 🌊 Contributing Factors

- `verifyTotp()` assumed the `mfa_secret` column would always be populated if `mfa_enabled = true` — a valid assumption post-migration, but not for the transition period.
- The DATA-44 migration ticket had no explicit "backfill existing users" step; the assumption was that the new column would be populated by new MFA enrollments only.
- The per-endpoint error rate alert threshold was 5% aggregate — not per-user segment. The 342 affected users were only ~0.4% of total login attempts, so the alert fired 14 minutes after the first user was impacted.
- No QA test case covered "user with `mfa_enabled=true` but `mfa_secret=null`" — this state was considered impossible before the migration gap was identified.

---

## 🎯 What Went Well

- On-call runbook guided Ratha to the relevant log query in under 10 minutes of being paged.
- Chamrong identified root cause and had a hotfix PR up in 53 minutes of incident declaration.
- The support workaround (manually disabling MFA for enterprise accounts) was available and used quickly, limiting enterprise SLA breach window.
- Hotfix was reviewed, tested on staging, and deployed within 90 minutes — no additional incidents introduced.

---

## 😬 What Went Poorly

- The aggregate error rate alert (14-minute delay) was too slow for a SEV-1. A per-endpoint or per-user-segment alert would have fired in < 3 minutes.
- The migration ticket (DATA-44) had no backfill step — a gap in the migration review checklist.
- QA had no test case for the `mfa_enabled=true, mfa_secret=null` state — the scenario was never considered during story refinement.
- 3 enterprise customers experienced a 4+ hour outage; manual apology emails were sent by Sophea but no automated SLA breach notification exists.

---

## 🔁 Action Items

| # | Action | Category | Owner | Due Date |
|:--|:-------|:---------|:------|:---------|
| 1 | Add null-check to `verifyTotp()` (already shipped in hotfix) | Prevent | Chamrong Thor | Done ✅ |
| 2 | Add "backfill existing rows" checklist item to migration PR template | Prevent | Chamrong Thor | 2026-05-21 |
| 3 | Add QA test case for `mfa_enabled=true, mfa_secret=null` to regression suite | Prevent | Ratha Noun | 2026-05-21 |
| 4 | Create per-endpoint error rate alert in Datadog (threshold: 1%, window: 3 min) | Detect | Chamrong Thor | 2026-05-23 |
| 5 | Create automated SLA breach notification to customer success team | Respond | Sophea Keo | 2026-05-28 |

---

## 📎 References

- [Datadog alert: INC-2026-0518](https://app.datadoghq.com/incidents/INC-2026-0518)
- [Hotfix PR: AUTH-32](https://github.com/example/repo/pull/432)
- [Jira: AUTH-31](https://jira.example.com/AUTH-31)
- [Jira: AUTH-33 (backfill migration)](https://jira.example.com/AUTH-33)
