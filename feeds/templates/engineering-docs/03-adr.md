# Template: Architecture Decision Record (ADR)

> **How to use:** Write an ADR for every significant technical decision that is hard to reverse, affects multiple teams, or will surprise a future engineer reading the code. ADRs are permanent — even superseded ones are kept for history. Number them sequentially: `ADR-001`, `ADR-002`, etc.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# ADR-[NNN]: [DECISION TITLE]

**Date:** [YYYY-MM-DD]  
**Status:** `Proposed` | `Accepted` | `Deprecated` | `Superseded by ADR-[NNN]`  
**Deciders:** [NAMES — who made this decision]  
**Consulted:** [NAMES — who was asked for input but did not decide]  
**Informed:** [NAMES / TEAMS — who needs to know this decision was made]  

---

## 1. Context

> What is the situation that requires a decision? What are the technical, business, or team constraints that make this non-trivial?

[DESCRIBE THE CONTEXT]

---

## 2. Decision Drivers

> The forces at play. What matters most when choosing an option?

- [DRIVER — e.g. "Must not increase login latency by more than 50ms"]
- [DRIVER — e.g. "Must use a library with active maintenance"]
- [DRIVER — e.g. "Team has no prior Go experience — prefer JVM ecosystem"]

---

## 3. Options Considered

### Option 1: [NAME]

**Description:** [WHAT THIS OPTION IS]

**Pros:**
- [PRO]
- [PRO]

**Cons:**
- [CON]
- [CON]

---

### Option 2: [NAME]

**Description:** [WHAT THIS OPTION IS]

**Pros:**
- [PRO]

**Cons:**
- [CON]

---

### Option 3: [NAME] *(if applicable)*

**Description:** [WHAT THIS OPTION IS]

**Pros:**
- [PRO]

**Cons:**
- [CON]

---

## 4. Decision

> State the chosen option and the single most important reason.

**We will use [OPTION NAME]** because [PRIMARY REASON].

---

## 5. Rationale

> Explain the full reasoning. Why did the pros of the chosen option outweigh its cons? Why were the other options rejected?

[DETAILED REASONING]

---

## 6. Consequences

### Positive
- [EXPECTED BENEFIT]

### Negative / Trade-offs
- [KNOWN DOWNSIDE OR COST]

### Risks
- [RISK + MITIGATION]

---

## 7. Implementation Notes

> Optional. If there are non-obvious implementation details that follow from this decision.

- [NOTE]

---

## 8. References

- [LINK TO PRD / SPEC / ISSUE / RFC]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# ADR-007: Use AES-256-GCM via existing EncryptionService for TOTP secret storage

**Date:** 2026-05-12  
**Status:** `Accepted`  
**Deciders:** Chamrong Thor, Sophea Keo  
**Consulted:** Dara Pich (Security), Legal  
**Informed:** All Auth Squad, DevOps  

---

## 1. Context

The MFA feature stores a TOTP secret per user. This secret, combined with the current timestamp, generates the one-time code used to log in. If the secret is exposed, an attacker can generate valid TOTP codes indefinitely — equivalent to stealing a password.

We need to decide how to store this secret at rest. Three options were considered: plaintext (rejected outright), hashing, or symmetric encryption.

Hashing (bcrypt/argon2) is not viable because TOTP verification requires recovering the original secret to compute the expected code — a hash is irreversible by design.

---

## 2. Decision Drivers

- Secret must be recoverable at verification time (rules out hashing).
- Secret must be unreadable if the DB is compromised.
- Must use existing infrastructure — no new key management system for v1.
- Must not add > 5ms to login latency.
- Must satisfy Legal's "data encrypted at rest" requirement for enterprise tier.

---

## 3. Options Considered

### Option 1: Store plaintext

**Description:** Store the base32 TOTP secret as-is in the `mfa_secret` column.

**Pros:**
- Zero implementation complexity.
- No performance overhead.

**Cons:**
- Any DB read access (compromised read replica, SQL injection, DBA) exposes all MFA secrets.
- Fails Legal's encryption-at-rest requirement.
- Fails enterprise security checklist.

---

### Option 2: AES-256-GCM via existing `EncryptionService`

**Description:** Encrypt the TOTP secret before writing to DB using the existing `EncryptionService` (AES-256-GCM). Decrypt at verification time. Encryption key sourced from `ENCRYPTION_KEY` env var, already managed by DevOps in AWS Secrets Manager.

**Pros:**
- Secret is unreadable without the encryption key, which is not stored in the DB.
- Reuses existing, audited `EncryptionService` — no new code to audit.
- Satisfies Legal's encryption-at-rest requirement.
- Decrypt latency is < 1ms on current hardware.

**Cons:**
- If `ENCRYPTION_KEY` is compromised alongside the DB, all secrets are exposed.
- Key rotation requires re-encrypting all stored secrets (one-time migration).

---

### Option 3: Dedicated KMS (AWS KMS / HashiCorp Vault)

**Description:** Use a dedicated key management service to envelope-encrypt each TOTP secret with a per-user key.

**Pros:**
- Strongest isolation — even a compromised DB + app server cannot decrypt secrets without KMS access.
- Fine-grained audit trail per secret access.

**Cons:**
- Requires new infrastructure (Vault cluster or KMS integration) — 3–4 weeks additional work.
- Adds ~10–30ms network latency per login for KMS API call.
- Exceeds scope and timeline for v1.
- Team has no prior KMS operations experience.

---

## 4. Decision

**We will use AES-256-GCM via the existing `EncryptionService`** because it satisfies all Legal and security requirements without requiring new infrastructure, fits within the sprint timeline, and adds negligible latency.

---

## 5. Rationale

Option 1 (plaintext) was rejected immediately — it fails both the Legal requirement and the basic threat model.

Option 3 (KMS) is the architecturally superior long-term choice and should be revisited in v2, but it is out of scope for the current sprint due to infrastructure complexity, team readiness, and a 30ms latency penalty that violates our login performance budget.

Option 2 provides meaningful protection against the most likely threat (DB compromise without app server compromise) and is ready to use today. The residual risk — that a compromised `ENCRYPTION_KEY` alongside the DB breaks the protection — is mitigated by the fact that `ENCRYPTION_KEY` is stored in AWS Secrets Manager with access logging, not in the codebase or DB.

---

## 6. Consequences

### Positive
- TOTP secrets encrypted at rest, satisfying Legal's requirement.
- Zero new infrastructure required.
- Login latency unaffected (< 1ms decrypt overhead).

### Negative / Trade-offs
- Key rotation is a manual migration (acceptable — key rotation is rare).
- AES-256-GCM without per-user keys means a single key breach exposes all secrets simultaneously.

### Risks
- **Risk:** `ENCRYPTION_KEY` compromise exposes all TOTP secrets.  
  **Mitigation:** Key stored in AWS Secrets Manager with CloudTrail access logging; key rotation procedure documented in runbook.
- **Risk:** Key rotation causes downtime.  
  **Mitigation:** Rotation uses a dual-key window: old key decrypts, new key encrypts on next login, old key retired after 30 days.

---

## 7. Implementation Notes

- `EncryptionService.encrypt(String plaintext)` returns a base64 string: `iv:ciphertext`. Store this directly in `mfa_secret`.
- At verification: call `EncryptionService.decrypt(mfa_secret)` to recover the base32 secret, then pass to `GoogleAuthenticator.authorize()`.
- Do not log the decrypted secret at any log level. Add a Sonar custom rule to detect `mfaSecret` in log statements.

---

## 8. References

- [PRD: Multi-Factor Authentication](https://confluence.example.com/mfa-prd)
- [Tech Spec: TOTP MFA — Authentication Service](https://confluence.example.com/mfa-spec)
- [NIST SP 800-175B: Guideline for Using Cryptographic Standards](https://csrc.nist.gov/publications/detail/sp/800-175b/rev-1/final)
- [EncryptionService source](https://github.com/example/repo/blob/main/EncryptionService.java)
