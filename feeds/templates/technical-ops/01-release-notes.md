# Template: Release Notes

> **How to use:** Write release notes for every production release. Audience is mixed — end users, enterprise admins, and developers. Keep the language clear. Group changes by type. Be honest about known issues. Include rollback instructions for ops teams.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

# Release Notes — v[VERSION]

**Release Date:** [YYYY-MM-DD]  
**Release Type:** `Major` | `Minor` | `Patch` | `Hotfix`  
**Deployed By:** [NAME]  
**Environment:** `Production` | `Staging`  

---

## 🚀 Highlights

> 1–3 bullet points on the most important changes. Non-technical language.

- [HIGHLIGHT]
- [HIGHLIGHT]

---

## ✨ New Features

| Feature | Description | Ticket |
|:--------|:------------|:-------|
| [FEATURE NAME] | [WHAT IT DOES AND WHO IT'S FOR] | [KEY] |

---

## 🛠️ Improvements

| Area | Change | Ticket |
|:-----|:-------|:-------|
| [AREA] | [WHAT CHANGED AND HOW IT'S BETTER] | [KEY] |

---

## 🐛 Bug Fixes

| Bug | Fix | Ticket |
|:----|:----|:-------|
| [DESCRIPTION OF BUG] | [WHAT WAS FIXED] | [KEY] |

---

## ⚠️ Breaking Changes

> Any change that requires action from users, admins, or API consumers.

| Change | Who Is Affected | Action Required |
|:-------|:----------------|:----------------|
| [CHANGE] | [AUDIENCE] | [WHAT THEY MUST DO] |

---

## 🔧 How to Upgrade

> Steps for self-hosted / on-premise installations. Skip if SaaS-only.

1. [STEP]
2. [STEP]

---

## 🐞 Known Issues

| Issue | Workaround | Fix ETA |
|:------|:-----------|:--------|
| [ISSUE] | [WORKAROUND] | [DATE / NEXT RELEASE] |

---

## 🔁 Rollback Instructions

```
[COMMAND OR STEPS TO ROLL BACK THIS RELEASE]
```

---

## 📎 Full Changelog

[LINK TO GITHUB COMPARE / JIRA RELEASE PAGE]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

# Release Notes — v3.1.0

**Release Date:** 2026-07-22  
**Release Type:** `Minor`  
**Deployed By:** Chamrong Thor  
**Environment:** `Production`  

---

## 🚀 Highlights

- **MFA is now available.** Protect your account with a time-based one-time password (TOTP) using Google Authenticator, Authy, or any compatible app. Find it in Settings → Security.
- **Login performance improved.** The new JWT-based session system eliminates the daily forced re-login. Sessions now last 30 days with automatic token refresh.
- **Critical bug fixed.** Users who enrolled MFA before v3.0.1 experienced login failures. This is now resolved.

---

## ✨ New Features

| Feature | Description | Ticket |
|:--------|:------------|:-------|
| TOTP MFA Enrollment | Users can enroll an authenticator app for a second login factor via Settings → Security | AUTH-5 |
| MFA Login Verification | Accounts with MFA enabled require a TOTP code on each new login session | AUTH-6 |
| Backup Recovery Codes | 8 single-use backup codes provided at enrollment in case authenticator app is lost | AUTH-5 |
| Password Reset via Email | Users can request a password reset link sent to their registered email address | AUTH-7 |
| Google OAuth 2.0 | Sign in with Google — no password required | AUTH-3 |

---

## 🛠️ Improvements

| Area | Change | Ticket |
|:-----|:-------|:-------|
| Authentication | Replaced session cookies with JWT (15-min access token + 30-day refresh token) — eliminates daily forced re-login | AUTH-2 |
| Logout | All active sessions invalidated on logout — tokens revoked server-side | AUTH-8 |
| Login performance | p99 login latency reduced from 420ms to 180ms with new token architecture | AUTH-2 |

---

## 🐛 Bug Fixes

| Bug | Fix | Ticket |
|:----|:----|:-------|
| Users with MFA enrolled before v3.0.1 received HTTP 500 on login | Added null-check for `mfa_secret`; backfilled missing secrets from legacy table | AUTH-31, AUTH-33 |
| Password reset link expired before user could use it | Extended expiry from 5 minutes to 15 minutes | AUTH-35 |

---

## ⚠️ Breaking Changes

| Change | Who Is Affected | Action Required |
|:-------|:----------------|:----------------|
| Session cookies removed | All users | None — you will be automatically logged out once. Log in again to receive a JWT session. |
| `GET /auth/session` endpoint removed | API consumers using session check | Migrate to `GET /auth/me` (returns user info if JWT is valid) |

---

## 🔧 How to Upgrade

> For self-hosted deployments:

1. Run database migration: `./migrate up` (applies V20 and V21 — adds MFA columns and backfills secrets).
2. Set new required environment variables: `JWT_SECRET`, `JWT_REFRESH_SECRET`, `ENCRYPTION_KEY`.
3. Deploy new image: `docker pull example/app:3.1.0 && docker-compose up -d`.
4. Verify: `curl https://your-domain/health` returns `{"status":"ok","version":"3.1.0"}`.

---

## 🐞 Known Issues

| Issue | Workaround | Fix ETA |
|:------|:-----------|:--------|
| MFA enrollment QR code not displaying on IE 11 | Use manual key entry below the QR code | v3.1.1 (2026-07-29) |
| Google OAuth login shows brief white flash on redirect | Cosmetic only — no functional impact | v3.2.0 |

---

## 🔁 Rollback Instructions

```bash
# Roll back to v3.0.2
docker pull example/app:3.0.2
docker-compose up -d

# Roll back database migrations (removes MFA columns — data loss warning)
./migrate down 2   # reverts V21 and V20
# WARNING: This removes mfa_secret, mfa_enabled, backup_codes from all users.
# Only run if absolutely necessary. Contact on-call lead first.
```

---

## 📎 Full Changelog

[GitHub: v3.0.2...v3.1.0](https://github.com/example/repo/compare/v3.0.2...v3.1.0) | [Jira Release: v3.1.0](https://jira.example.com/releases/3.1.0)
