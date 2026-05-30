# Template: Technical Specification

> **How to use:** Write the tech spec *after* the PRD is approved, *before* sprint planning. The spec answers **how** the system will be built. Engineers and reviewers use this to align before any code is written.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Tech Spec: [FEATURE / SYSTEM NAME]

**Author:** [NAME]  
**Date:** [YYYY-MM-DD]  
**Status:** `Draft` | `In Review` | `Approved`  
**Reviewers:** [NAMES]  
**Related PRD:** [LINK]  
**Related Epic / Stories:** [KEYS]  
**Version:** v[X.X]  

---

## 1. Overview

> 2–4 sentences. What is being built and what is the high-level approach?

[OVERVIEW]

---

## 2. Goals & Constraints

### Technical Goals
- [GOAL — e.g. "Add MFA without breaking existing auth flow"]

### Constraints
- [CONSTRAINT — e.g. "Must use existing `EncryptionService`; no new encryption lib"]
- [CONSTRAINT — e.g. "Must not increase login p99 latency by more than 50ms"]

---

## 3. Architecture

### 3.1 System Context Diagram

> How does this change fit into the existing system?

```
[ASCII DIAGRAM — show components and their relationships]
```

### 3.2 Component Design

> Describe each new or modified component.

| Component | Type | Responsibility | New / Modified |
|:----------|:-----|:---------------|:---------------|
| [NAME] | Service / Controller / Repository / Util | [WHAT IT DOES] | New / Modified |

### 3.3 Sequence Diagram

> Show the happy path request flow end-to-end.

```
[ASCII SEQUENCE DIAGRAM]
```

---

## 4. Data Model

### 4.1 New / Modified Tables

```sql
-- [TABLE NAME]
[DDL]
```

### 4.2 Indexes

```sql
[INDEX DDL]
```

### 4.3 Migrations

| Migration | Description | Reversible |
|:----------|:------------|:-----------|
| [MIGRATION FILE] | [WHAT IT DOES] | Yes / No |

---

## 5. API Design

### 5.1 New Endpoints

---

#### `[METHOD] [PATH]`

**Description:** [WHAT THIS ENDPOINT DOES]  
**Auth:** Required / Not required / Admin only  

**Request:**
```json
{
  "[FIELD]": "[TYPE — description]"
}
```

**Response (200):**
```json
{
  "[FIELD]": "[TYPE — description]"
}
```

**Error Responses:**

| Status | Code | When |
|:-------|:-----|:-----|
| 400 | `VALIDATION_ERROR` | [CONDITION] |
| 401 | `UNAUTHORIZED` | [CONDITION] |
| 409 | `[ERROR_CODE]` | [CONDITION] |

---

## 6. Security Considerations

- [SECURITY DECISION — e.g. "Secrets stored encrypted with AES-256"]
- [SECURITY DECISION — e.g. "Backup codes hashed with bcrypt, cost factor 12"]
- [KNOWN RISK + MITIGATION]

---

## 7. Edge Cases & Error Handling

| Scenario | Behavior | HTTP Status |
|:---------|:---------|:------------|
| [SCENARIO] | [WHAT THE SYSTEM DOES] | [CODE] |

---

## 8. Testing Plan

| Test Type | What Is Tested | Tool |
|:----------|:---------------|:-----|
| Unit | [COMPONENT / METHOD] | JUnit 5 / pytest / Jest |
| Integration | [FLOW] | [TOOL] |
| E2E | [USER JOURNEY] | [TOOL] |
| Load / Performance | [SCENARIO] | [TOOL] |

---

## 9. Rollback Plan

> How do we revert this change if something goes wrong in production?

- [STEP 1]
- [STEP 2]

---

## 10. Open Questions

| # | Question | Owner | Due |
|:--|:---------|:------|:----|
| 1 | [QUESTION] | [NAME] | [DATE] |

---

## 11. References

- [LINK TO PRD]
- [LINK TO ADR]
- [LINK TO EXTERNAL STANDARD / RFC]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Tech Spec: TOTP MFA — Authentication Service

**Author:** Chamrong Thor  
**Date:** 2026-05-10  
**Status:** `Approved`  
**Reviewers:** Dara Pich, Sophea Keo  
**Related PRD:** [PRD: Multi-Factor Authentication](https://confluence.example.com/mfa-prd)  
**Related Epic / Stories:** AUTH-1, AUTH-5, AUTH-6, AUTH-8  
**Version:** v1.1  

---

## 1. Overview

We extend the existing `AuthService` to support TOTP-based MFA using the `googleauth` library. A new `MfaService` handles secret generation, QR code production, TOTP verification, and backup code management. The login flow gains a second step: after password verification, users with MFA enabled must provide a valid TOTP or backup code before receiving a JWT.

---

## 2. Goals & Constraints

### Technical Goals
- Add MFA enrollment and verification without modifying the existing `POST /auth/login` contract.
- Keep MFA verification under 50ms additional latency at p99.

### Constraints
- Must reuse existing `EncryptionService` for secret storage — no new crypto library.
- Backup codes must survive the same `UserRepository` as passwords — no new table for codes.
- Must not break existing non-MFA login flow (100% backward compatible).

---

## 3. Architecture

### 3.1 System Context Diagram

```
  Client
    │
    ▼
  AuthController          ─── POST /auth/login (step 1: password)
    │                     ─── POST /auth/login/mfa (step 2: TOTP)
    │
    ├──► AuthService       validates password, checks mfa_enabled flag
    │
    ├──► MfaService        generates secret, verifies TOTP, manages backup codes
    │       │
    │       ├──► GoogleAuthenticator (warrenstrange/googleauth)
    │       └──► EncryptionService  (existing — AES-256)
    │
    └──► UserRepository    reads/writes users table (mfa_secret, mfa_enabled, backup_codes)
```

### 3.2 Component Design

| Component | Type | Responsibility | New / Modified |
|:----------|:-----|:---------------|:---------------|
| `MfaService` | Service | Generate TOTP secret, QR URI, verify codes, manage backup codes | New |
| `AuthService` | Service | Add MFA step check after password verification | Modified |
| `AuthController` | Controller | Add `POST /auth/login/mfa` endpoint | Modified |
| `MfaController` | Controller | Enrollment and settings endpoints | New |
| `UserRepository` | Repository | Add `mfa_secret`, `mfa_enabled`, `backup_codes` field reads | Modified |

### 3.3 Sequence Diagram — Login with MFA

```
Client        AuthController     AuthService     MfaService     UserRepository
  │                 │                 │               │                │
  │─POST /login────►│                 │               │                │
  │                 │──verifyPassword►│               │                │
  │                 │                 │──findUser─────────────────────►│
  │                 │                 │◄──user────────────────────────│
  │                 │                 │                               │
  │                 │◄──{mfa_pending}─│ (mfa_enabled=true)            │
  │◄──202 mfa_token─│                 │                               │
  │                 │                 │                               │
  │─POST /login/mfa►│                 │                               │
  │  {mfa_token,    │──verifyMfa──────────────────►│                  │
  │   totp_code}    │                              │──verifyTotp       │
  │                 │                              │  (googleauth)     │
  │                 │◄─────────────────────────────│                  │
  │◄──200 {jwt}─────│                              │                  │
```

---

## 4. Data Model

### 4.1 Modified Table: `users`

```sql
ALTER TABLE users
  ADD COLUMN mfa_secret      VARCHAR(255) DEFAULT NULL,  -- AES-256 encrypted
  ADD COLUMN mfa_enabled     BOOLEAN      NOT NULL DEFAULT FALSE,
  ADD COLUMN backup_codes    TEXT         DEFAULT NULL;  -- JSON array of bcrypt hashes
```

### 4.2 Indexes

```sql
-- No new indexes needed; MFA columns accessed via primary key lookup only.
```

### 4.3 Migrations

| Migration | Description | Reversible |
|:----------|:------------|:-----------|
| `V20_add_mfa_columns.sql` | Adds `mfa_secret`, `mfa_enabled`, `backup_codes` to `users` | Yes |
| `V21_backfill_mfa_secret.sql` | Backfills null `mfa_secret` from legacy `user_mfa` table | Yes |

---

## 5. API Design

### 5.1 New Endpoints

---

#### `POST /auth/login/mfa`

**Description:** Second step of login. Verifies TOTP code or backup code. Returns JWT on success.  
**Auth:** Requires `mfa_pending_token` from step 1.

**Request:**
```json
{
  "mfa_pending_token": "string — short-lived JWT from step 1, expires in 5 minutes",
  "code": "string — 6-digit TOTP or 8-character backup code"
}
```

**Response (200):**
```json
{
  "access_token":  "string — JWT, expires in 15 minutes",
  "refresh_token": "string — opaque token, expires in 30 days",
  "token_type":    "Bearer"
}
```

**Error Responses:**

| Status | Code | When |
|:-------|:-----|:-----|
| 401 | `INVALID_MFA_CODE` | TOTP code is wrong or expired |
| 401 | `MFA_TOKEN_EXPIRED` | `mfa_pending_token` is older than 5 minutes |
| 409 | `MFA_NOT_CONFIGURED` | `mfa_secret` is null (migration gap) |
| 429 | `TOO_MANY_ATTEMPTS` | More than 5 failed attempts in 10 minutes |

---

#### `POST /auth/mfa/enroll`

**Description:** Generates a TOTP secret and QR code for the authenticated user.  
**Auth:** Required (valid JWT).

**Response (200):**
```json
{
  "qr_code_uri":   "string — otpauth://totp/... base64 PNG",
  "manual_key":    "string — base32 secret for manual entry",
  "backup_codes":  ["string x8 — single-use 8-char codes"]
}
```

---

#### `POST /auth/mfa/confirm`

**Description:** Confirms enrollment by verifying the user's first TOTP code.  
**Auth:** Required (valid JWT).

**Request:**
```json
{ "code": "string — 6-digit TOTP" }
```

**Response (200):**
```json
{ "mfa_enabled": true }
```

---

## 6. Security Considerations

- TOTP secret stored encrypted with AES-256 via existing `EncryptionService`. Key sourced from env var `ENCRYPTION_KEY`.
- Backup codes are single-use: hashed with bcrypt (cost 12) before DB storage. Plaintext shown only once at enrollment.
- `mfa_pending_token` is a signed JWT with 5-minute expiry; cannot be reused after exchange.
- Rate limit: 5 failed TOTP attempts per 10 minutes per user. 6th attempt locks MFA for 10 minutes (not the account).
- TOTP verification window: ±1 period (30s tolerance for clock drift).

---

## 7. Edge Cases & Error Handling

| Scenario | Behavior | HTTP Status |
|:---------|:---------|:------------|
| User enters wrong TOTP code | Return `INVALID_MFA_CODE`, increment attempt counter | 401 |
| User uses a backup code | Mark code as used (set to null), accept login | 200 |
| User tries to reuse a backup code | `INVALID_MFA_CODE` — hash no longer matches | 401 |
| `mfa_secret` is null (migration gap) | Return `MFA_NOT_CONFIGURED` with re-enrollment prompt | 409 |
| Clock drift > 60s | TOTP outside ±1 window will fail — user instructed to sync device clock | 401 |
| User loses phone, all backup codes used | Support admin can reset MFA via admin panel (`DELETE /admin/users/{id}/mfa`) | — |

---

## 8. Testing Plan

| Test Type | What Is Tested | Tool |
|:----------|:---------------|:-----|
| Unit | `MfaService.generateSecret()`, `verifyTotp()`, `generateBackupCodes()` | JUnit 5 |
| Unit | Null MFA secret path → 409 | JUnit 5 |
| Integration | Full login + MFA flow against test DB | JUnit 5 + Testcontainers |
| Integration | Backup code consumption and rejection of reuse | JUnit 5 |
| E2E | Enroll → log out → log in with TOTP in staging | Playwright |
| Load | 1000 concurrent MFA verifications, p99 < 50ms | Gatling |

---

## 9. Rollback Plan

1. Set feature flag `mfa.enabled=false` in config — disables MFA step in login without code change.
2. If DB migration must be rolled back: `V20` is reversible (`DROP COLUMN`). Run `V20_rollback.sql`.
3. Communicate to users via in-app banner: "MFA temporarily disabled — we are investigating."

---

## 10. Open Questions

| # | Question | Owner | Due |
|:--|:---------|:------|:----|
| 1 | Should backup codes expire after 12 months? | Sophea Keo | 2026-06-01 |
| 2 | Does the rate limiter use Redis or in-process? | Chamrong Thor | 2026-05-20 |

---

## 11. References

- [PRD: Multi-Factor Authentication](https://confluence.example.com/mfa-prd)
- [RFC 6238 — TOTP Standard](https://tools.ietf.org/html/rfc6238)
- [warrenstrange/googleauth library](https://github.com/wstrange/GoogleAuth)
- [ADR-007: Use AES-256 for secrets at rest](https://confluence.example.com/adr-007)
