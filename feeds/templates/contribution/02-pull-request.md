# Template: Pull Request

> **How to use:** Place the blank template in `.github/PULL_REQUEST_TEMPLATE.md` — GitHub will auto-fill it on every new PR. The filled example shows a complete, well-written PR for reference.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

## 📋 Summary

> What does this PR do? One sentence. What problem does it solve or feature does it add?

[DESCRIPTION]

**Ticket:** [JIRA KEY / GitHub Issue #]  
**Type:** `Feature` | `Bug Fix` | `Refactor` | `Hotfix` | `Chore` | `Docs`  

---

## 🔀 Changes

> List the key changes. Be specific enough that a reviewer knows where to focus.

- [ ] [CHANGE 1]
- [ ] [CHANGE 2]
- [ ] [CHANGE 3]

---

## 🧪 How to Test

> Step-by-step instructions for the reviewer to verify this PR works.

1. [STEP]
2. [STEP]
3. Expected result: [WHAT SHOULD HAPPEN]

---

## ✅ PR Checklist

> Complete before requesting review. Unchecked items block merge.

- [ ] Code follows the project's coding standards
- [ ] Self-reviewed my own diff before requesting review
- [ ] Unit tests written and passing
- [ ] Integration tests passing (if applicable)
- [ ] Coverage threshold maintained (≥ [X]%)
- [ ] No new lint / Sonar violations
- [ ] API docs updated (if endpoint added or changed)
- [ ] README / docs updated (if behavior or setup changed)
- [ ] Breaking changes documented in PR description (if any)
- [ ] ADR written (if this is a significant architecture decision)

---

## 📸 Screenshots / Evidence

> Attach for UI changes, API response changes, or test results. Delete if not applicable.

| Before | After |
|:-------|:------|
| [SCREENSHOT / N/A] | [SCREENSHOT] |

---

## ⚠️ Breaking Changes

> List any breaking changes for API consumers, DB migrations, or config changes. Delete if none.

- [BREAKING CHANGE + MIGRATION PATH]

---

## 📎 Related

- [RELATED PR / ISSUE / TICKET]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

## 📋 Summary

Adds null-check for `mfa_secret` in `AuthService.verifyTotp()` to prevent NullPointerException for users who enrolled MFA before the v3.0.1 migration. Returns HTTP 409 `MFA_NOT_CONFIGURED` with a re-enrollment prompt instead of crashing with a 500.

**Ticket:** AUTH-32  
**Type:** `Bug Fix`  

---

## 🔀 Changes

- [x] `AuthService.verifyTotp()` — null-check on `user.getMfaSecret()` before `.isEmpty()`
- [x] New exception class: `MfaNotConfiguredException` in `exceptions/` package
- [x] `AuthController` — `@ExceptionHandler` for `MfaNotConfiguredException` returns HTTP 409 with body `{ "error": "MFA_NOT_CONFIGURED", "message": "..." }`
- [x] Unit test: `shouldReturn409WhenMfaSecretIsNull()`
- [x] Unit test: `shouldReturn401WhenMfaCodeIsInvalid()` (existing test — confirmed still passes)

---

## 🧪 How to Test

**Option A — automated:**
```bash
mvn test -pl auth-service -Dtest=AuthServiceTest#shouldReturn409WhenMfaSecretIsNull
```
Expected: test passes green.

**Option B — manual (staging):**
1. Find a user account with `mfa_enabled = true` and `mfa_secret = NULL` in staging DB.
   ```sql
   SELECT id, email FROM users WHERE mfa_enabled = true AND mfa_secret IS NULL LIMIT 1;
   ```
2. Attempt to log in with that account's correct password.
3. On the MFA screen, enter any 6-digit code.
4. Expected: HTTP 409 response, UI shows "Your MFA setup is incomplete. Please re-enroll in Security Settings."
5. Expected: No HTTP 500, no `NullPointerException` in logs.

---

## ✅ PR Checklist

- [x] Code follows Java 17 style, Checkstyle passes (`mvn checkstyle:check`)
- [x] Self-reviewed — no accidental debug logs or commented code
- [x] Unit test `shouldReturn409WhenMfaSecretIsNull()` written and passing
- [x] Full auth test suite passing (`mvn test` — 147 tests, 0 failures)
- [x] Coverage: 83% (above 80% threshold) — JaCoCo report attached
- [x] No new SpotBugs violations
- [x] API docs updated: `POST /auth/login/mfa` — added 409 `MFA_NOT_CONFIGURED` to error table
- [ ] README not affected
- [x] No breaking changes — this adds a new error code; existing valid flows unchanged
- [ ] ADR not needed — this is a defensive bugfix, not an architecture decision

---

## 📸 Screenshots / Evidence

| Before (v3.0.1) | After (this PR) |
|:----------------|:----------------|
| HTTP 500, `NullPointerException` in logs | HTTP 409, `{"error":"MFA_NOT_CONFIGURED","message":"Your MFA setup is incomplete..."}` |

JaCoCo coverage report: [See CI artifacts](https://ci.example.com/builds/4421/coverage)

---

## ⚠️ Breaking Changes

None. The 409 response code is new but additive — no existing client was handling this path (it was previously a 500 crash).

---

## 📎 Related

- AUTH-31 — Bug ticket (root cause analysis)
- AUTH-33 — Backfill migration (permanent fix — runs after this hotfix)
- INC-2026-0518 — Production incident post-mortem
