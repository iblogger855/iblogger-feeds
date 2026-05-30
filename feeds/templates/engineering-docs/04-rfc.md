# Template: RFC (Request for Comments)

> **How to use:** Write an RFC when proposing a significant change that affects multiple teams, has long-term architectural implications, or needs broad input before implementation. RFCs are different from ADRs: an ADR records a decision already made; an RFC is the process of *reaching* that decision. Share the RFC with all stakeholders and allow a comment period (typically 1–2 weeks) before closing.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# RFC-[NNN]: [PROPOSAL TITLE]

**Author:** [NAME]  
**Date:** [YYYY-MM-DD]  
**Status:** `Open for Comment` | `Accepted` | `Rejected` | `Withdrawn` | `Superseded by RFC-[NNN]`  
**Comment Period:** [YYYY-MM-DD] → [YYYY-MM-DD]  
**Stakeholders:** [NAMES / TEAMS]  
**Related:** [JIRA EPIC / ADR / PRIOR RFC]  

---

## 1. Summary

> 3–5 sentences. What are you proposing and why?

[SUMMARY]

---

## 2. Motivation

### 2.1 Problem

> What is broken, painful, or missing today? Include data or examples where possible.

[DESCRIBE THE PROBLEM]

### 2.2 Goals

- [WHAT THIS RFC AIMS TO ACHIEVE]
- [GOAL 2]

### 2.3 Non-Goals

- [WHAT THIS RFC EXPLICITLY DOES NOT ADDRESS]

---

## 3. Proposal

> Describe the proposed solution in detail. Include architecture, API design, data model changes, or workflow changes as relevant.

### 3.1 Overview

[HIGH-LEVEL DESCRIPTION]

### 3.2 Design Details

[DETAILED DESIGN — diagrams, API contracts, data models, pseudocode]

```
[DIAGRAM / CODE EXAMPLE]
```

### 3.3 Migration Plan

> How do we get from the current state to the proposed state? What is the transition path?

[MIGRATION STEPS / PHASING]

---

## 4. Alternatives Considered

### Alternative 1: [NAME]

[DESCRIPTION]

**Why not chosen:** [REASON]

---

### Alternative 2: [NAME]

[DESCRIPTION]

**Why not chosen:** [REASON]

---

## 5. Impact Analysis

### Teams Affected

| Team | Impact | Action Required |
|:-----|:-------|:----------------|
| [TEAM] | [HOW THEY ARE AFFECTED] | Yes / No — [DETAIL] |

### Risks

| Risk | Likelihood | Impact | Mitigation |
|:-----|:-----------|:-------|:-----------|
| [RISK] | High / Med / Low | High / Med / Low | [PLAN] |

### Timeline Estimate

| Phase | Effort | Owner | Target Date |
|:------|:-------|:------|:------------|
| [PHASE] | [X weeks / pts] | [TEAM] | [DATE] |

---

## 6. Open Questions

> Questions that must be resolved before this RFC can be accepted. Tag owners.

| # | Question | Owner | Due |
|:--|:---------|:------|:----|
| 1 | [QUESTION] | [NAME] | [DATE] |

---

## 7. Comments & Feedback

> Reviewers add feedback here. Author responds inline.

*(Add comments below during the comment period)*

---

## 8. Decision

> Filled in after the comment period closes.

**Decision:** [ACCEPTED / REJECTED / WITHDRAWN]  
**Date:** [YYYY-MM-DD]  
**Summary:** [WHY THIS DECISION WAS MADE]  
**Next Steps:** [WHAT HAPPENS NOW — ADR / JIRA EPIC / ARCHIVE]  

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# RFC-003: Migrate TOTP Secret Storage from EncryptionService to AWS KMS

**Author:** Chamrong Thor  
**Date:** 2026-07-01  
**Status:** `Open for Comment`  
**Comment Period:** 2026-07-01 → 2026-07-14  
**Stakeholders:** Auth Squad, DevOps, Security (Dara Pich), Legal, Payments Squad  
**Related:** ADR-007 (current approach), AUTH-1 (MFA epic)  

---

## 1. Summary

We currently store TOTP secrets encrypted with AES-256-GCM using a single application-level key managed in AWS Secrets Manager (documented in ADR-007). This RFC proposes migrating to AWS KMS with per-user envelope encryption. The goal is to eliminate the "single key compromise = all secrets exposed" risk and satisfy the upcoming SOC 2 Type II audit requirement for cryptographic key isolation.

---

## 2. Motivation

### 2.1 Problem

ADR-007 acknowledged the residual risk: if the `ENCRYPTION_KEY` in Secrets Manager is compromised alongside the database, all TOTP secrets are immediately exposed. With 340+ MFA users today (growing fast post-GA), this is a single point of failure.

Additionally, our SOC 2 Type II audit starts Q4 2026. The auditors have flagged that a shared application-level key for sensitive credential storage does not satisfy cryptographic key isolation requirements.

The INC-2026-0518 incident also revealed we have no per-user audit trail of when MFA secrets are accessed — KMS provides this via CloudTrail automatically.

### 2.2 Goals

- Eliminate single-key-exposes-all-users risk.
- Satisfy SOC 2 Type II cryptographic key isolation requirement.
- Add automatic CloudTrail audit trail per TOTP secret access.

### 2.3 Non-Goals

- Migrating other encrypted fields (session tokens, backup codes) — separate RFC if needed.
- Moving to hardware security keys (FIDO2/WebAuthn) — unrelated to storage security.
- Changing the TOTP algorithm or verification logic.

---

## 3. Proposal

### 3.1 Overview

Replace `EncryptionService.encrypt/decrypt()` calls in `MfaService` with AWS KMS envelope encryption:

1. On MFA enrollment: generate a data encryption key (DEK) via KMS, encrypt the TOTP secret with the DEK, encrypt the DEK with the KMS customer master key (CMK), store the encrypted DEK alongside the encrypted secret in the `users` table.
2. On TOTP verification: call KMS to decrypt the DEK, use DEK to decrypt the TOTP secret, proceed with TOTP verification as today.

### 3.2 Design Details

```
ENROLLMENT:
  1. MfaService calls KMS.generateDataKey(CMK_ARN)
     → returns {plaintext_dek, encrypted_dek}
  2. MfaService encrypts totp_secret with plaintext_dek (AES-256-GCM, in-memory)
  3. MfaService zeros plaintext_dek from memory
  4. Store: users.mfa_secret = base64(encrypted_totp_secret)
           users.mfa_dek    = base64(encrypted_dek)

VERIFICATION:
  1. MfaService fetches mfa_dek from users table
  2. MfaService calls KMS.decrypt(encrypted_dek)
     → returns plaintext_dek
  3. MfaService decrypts mfa_secret with plaintext_dek
  4. MfaService zeros plaintext_dek from memory
  5. TOTP verification proceeds as today
```

**Schema change:**
```sql
ALTER TABLE users ADD COLUMN mfa_dek VARCHAR(512) DEFAULT NULL;
```

**Estimated KMS latency:** 8–15ms per call (p99, same-region). Total added login latency: ~15ms (well within the 50ms budget from ADR-007).

**KMS cost:** $0.03 per 10,000 API calls. At 10,000 daily logins with MFA: ~$0.03/day ($1/month). Acceptable.

### 3.3 Migration Plan

**Phase 1 (Sprint 17):** Add `mfa_dek` column; new enrollments use KMS. Existing users retain old AES-256 encryption (detected by `mfa_dek IS NULL`).

**Phase 2 (Sprint 18):** Background migration — re-encrypt existing `mfa_secret` values using KMS for all users with `mfa_dek IS NULL`.

**Phase 3 (Sprint 19):** Remove `EncryptionService` usage from `MfaService`; remove `ENCRYPTION_KEY` dependency for MFA path.

---

## 4. Alternatives Considered

### Alternative 1: HashiCorp Vault

Full secrets management platform with fine-grained policies, dynamic secrets, and audit logging.

**Why not chosen:** Requires a new self-managed Vault cluster (2–3 weeks ops work), introduces a new single point of failure (Vault availability = MFA availability), and the team has no prior Vault operations experience. AWS KMS achieves our goals with managed infrastructure we already pay for.

---

### Alternative 2: Keep EncryptionService + rotate key more frequently

Increase `ENCRYPTION_KEY` rotation frequency from "never" to quarterly, reducing exposure window.

**Why not chosen:** Does not satisfy SOC 2 auditor requirement for key isolation. Does not provide per-user audit trail. The rotation itself requires re-encrypting all secrets — same migration effort as KMS, but without the long-term benefit.

---

## 5. Impact Analysis

### Teams Affected

| Team | Impact | Action Required |
|:-----|:-------|:----------------|
| Auth Squad | Main implementation work | Yes — owns Phases 1–3 |
| DevOps | KMS CMK provisioning + IAM role for auth-service | Yes — create CMK and `kms:GenerateDataKey` + `kms:Decrypt` policy |
| Security (Dara) | Review KMS key policy and CMK configuration | Yes — sign off on key policy before Phase 1 ships |
| Payments Squad | No impact | No |
| Legal | Satisfies SOC 2 requirement — confirm in writing | Yes — written confirmation needed before audit |

### Risks

| Risk | Likelihood | Impact | Mitigation |
|:-----|:-----------|:-------|:-----------|
| KMS outage → MFA login unavailable | Low | High | KMS SLA is 99.99%; add circuit breaker to fall back to `MFA_UNAVAILABLE` error (not 500) |
| KMS latency spike > 50ms | Low | Medium | Monitor p99 in staging under load before Phase 1 GA |
| Migration Phase 2 causes DB lock under high load | Medium | Medium | Run backfill with LIMIT/OFFSET batching at off-peak hours |

### Timeline Estimate

| Phase | Effort | Owner | Target |
|:------|:-------|:------|:-------|
| Phase 1: New enrollments via KMS | 8 pts | Chamrong | Sprint 17 (2026-08-04) |
| Phase 2: Backfill existing users | 5 pts | Maly | Sprint 18 (2026-08-18) |
| Phase 3: Remove old path | 3 pts | Chamrong | Sprint 19 (2026-09-01) |

---

## 6. Open Questions

| # | Question | Owner | Due |
|:--|:---------|:------|:----|
| 1 | Should we use one CMK for all users or per-user CMKs? Per-user CMKs cost $1/user/month — expensive at scale. | Dara Pich (Security) | 2026-07-08 |
| 2 | What is the KMS key rotation policy? AWS default is annual. Auditors may require more frequent. | Legal | 2026-07-10 |
| 3 | Does DevOps have KMS quota headroom for 10k+ API calls/day? | DevOps | 2026-07-08 |

---

## 7. Comments & Feedback

**Dara Pich (2026-07-03):** Recommend one CMK for all users (not per-user). Per-user CMKs at scale cost $1,200/month at 1,200 users. Envelope encryption with a shared CMK still provides isolation — the per-user DEK is what provides separation. One CMK is standard practice at Google, AWS, Stripe. →  Chamrong: Agreed, updating proposal to one CMK.

**DevOps (2026-07-04):** Current AWS account has soft limit of 10k KMS calls/day. At 10k MFA logins/day that's exactly the limit. Need to request a quota increase before Phase 1. DevOps will open the AWS case this week.

---

## 8. Decision

**Decision:** Pending — comment period closes 2026-07-14  
**Date:** —  
**Summary:** —  
**Next Steps:** After acceptance, Chamrong writes ADR-012 and creates Epic KMS-1 in Jira.
