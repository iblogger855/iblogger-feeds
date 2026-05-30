# Template: Jira Story

> **How to use:** Copy the blank template into Jira's Story description. A story must pass **DoR** before entering the sprint and **DoD** before being marked Done. See the [DoR/DoD Guide](../management/02-dor-and-dod-guide.md) for full context.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

## 📖 Story: [STORY TITLE]

**Story Key:** [PROJECT-XXX]  
**Epic:** [EPIC KEY + TITLE]  
**Assignee:** [NAME]  
**Story Points:** [1 / 2 / 3 / 5 / 8]  
**Sprint:** [SPRINT NAME / NUMBER]  
**Priority:** `Critical` | `High` | `Medium` | `Low`  

---

### 👤 User Story

> As a **[USER TYPE]**,  
> I want to **[ACTION / CAPABILITY]**,  
> So that **[BENEFIT / OUTCOME]**.

---

### ✅ Acceptance Criteria

> Each criterion must be independently testable. Write in **Given / When / Then** or plain English.

- [ ] **AC1:** [CRITERION]
- [ ] **AC2:** [CRITERION]
- [ ] **AC3:** [CRITERION]

---

### 🔲 Definition of Ready (DoR)

> Check all before pulling into sprint.

- [ ] User story is written and understood by the team
- [ ] Acceptance criteria are clear and testable
- [ ] UI/UX mockup or wireframe is available (if applicable)
- [ ] API contracts / data contracts are defined (if applicable)
- [ ] Story is estimated in story points
- [ ] Dependencies are identified and unblocked
- [ ] Story fits within one sprint

---

### ✔️ Definition of Done (DoD)

> Check all before marking Done.

- [ ] All acceptance criteria are met
- [ ] Unit tests written and passing (coverage ≥ [X]%)
- [ ] Integration tests passing (if applicable)
- [ ] Code reviewed and approved by at least one peer
- [ ] No new lint / Sonar violations introduced
- [ ] Deployed to staging / UAT environment
- [ ] Tested manually against acceptance criteria
- [ ] Documentation updated (API docs, README, changelog)
- [ ] Product Owner / QA sign-off received

---

### 🧪 Test Cases

> Derive from ACs. Name each test: `should[Behavior]When[Condition]`

| # | Test Name | Type | Expected Result |
|:--|:----------|:-----|:----------------|
| 1 | [TEST NAME] | Unit / Integration / E2E | [EXPECTED] |
| 2 | [TEST NAME] | Unit / Integration / E2E | [EXPECTED] |

---

### 📎 References

- [DESIGN / MOCKUP LINK]
- [API SPEC LINK]
- [RELATED STORY OR BUG KEY]

---

### 💬 Notes / Assumptions

- [ANY ASSUMPTION OR CONSTRAINT THE DEVELOPER NEEDS TO KNOW]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

## 📖 Story: TOTP MFA Enrollment Flow

**Story Key:** AUTH-5  
**Epic:** AUTH-1 — User Authentication Overhaul  
**Assignee:** Chamrong Thor  
**Story Points:** 5  
**Sprint:** Sprint 14  
**Priority:** `High`  

---

### 👤 User Story

> As a **registered user**,  
> I want to **enroll my authenticator app for MFA**,  
> So that **my account has a second layer of protection beyond my password**.

---

### ✅ Acceptance Criteria

- [ ] **AC1:** The user can navigate to Settings → Security → Enable MFA and see a QR code generated for their account.
- [ ] **AC2:** The QR code encodes a valid TOTP URI (`otpauth://totp/...`) compatible with Google Authenticator and Authy.
- [ ] **AC3:** The user must enter a valid 6-digit TOTP code to confirm enrollment. A wrong code shows an error and does not enable MFA.
- [ ] **AC4:** After successful enrollment, MFA status is shown as `Enabled` in Security settings.
- [ ] **AC5:** The system shows 8 one-time backup codes after enrollment. The user must acknowledge they have saved them.
- [ ] **AC6:** The enrollment page is not accessible via direct URL if MFA is already enabled.

---

### 🔲 Definition of Ready (DoR)

- [x] User story is written and understood by the team
- [x] Acceptance criteria are clear and testable
- [x] UI/UX mockup available: [Figma: MFA Enrollment Flow](https://figma.com/mfa-enrollment)
- [x] TOTP library confirmed: `com.warrenstrange:googleauth:1.5.0`
- [x] Story is estimated: 5 points
- [x] Dependencies unblocked: User DB schema (DATA-44) is done
- [x] Story fits within one sprint

---

### ✔️ Definition of Done (DoD)

- [ ] All 6 acceptance criteria are met
- [ ] Unit tests written and passing (coverage ≥ 80%)
- [ ] Integration test: full enrollment flow against test DB
- [ ] Code reviewed and approved by at least one peer
- [ ] No new Sonar violations
- [ ] Deployed to staging
- [ ] Tested manually: QR scan with Google Authenticator, wrong code rejection, backup codes display
- [ ] API docs updated for `POST /auth/mfa/enroll` and `POST /auth/mfa/verify`
- [ ] QA sign-off received

---

### 🧪 Test Cases

| # | Test Name | Type | Expected Result |
|:--|:----------|:-----|:----------------|
| 1 | `shouldGenerateValidTotpUriForUser()` | Unit | URI matches `otpauth://totp/{issuer}:{email}?secret=...` |
| 2 | `shouldEnableMfaWhenCorrectCodeEntered()` | Integration | `user.mfaEnabled == true` after valid code |
| 3 | `shouldRejectEnrollmentWithWrongCode()` | Unit | Returns 422 with `"Invalid TOTP code"` |
| 4 | `shouldReturn8BackupCodesAfterEnrollment()` | Unit | Response contains exactly 8 codes, each 8 chars |
| 5 | `shouldBlockEnrollmentPageIfMfaAlreadyEnabled()` | Integration | GET `/auth/mfa/enroll` returns 403 |

---

### 📎 References

- [Figma: MFA Enrollment Flow](https://figma.com/mfa-enrollment)
- [Tech Spec: JWT + OAuth Design](https://confluence.example.com/auth-spec)
- [Epic: AUTH-1](https://jira.example.com/AUTH-1)

---

### 💬 Notes / Assumptions

- TOTP secret is stored encrypted at rest using AES-256 (handled by existing `EncryptionService`).
- Backup codes are single-use and hashed before storage — same as passwords.
- QR code image is generated server-side as a base64 PNG; not stored.
