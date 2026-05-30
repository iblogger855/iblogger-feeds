# Template: Jira Task / Sub-task

> **How to use:** Use a Task for technical work that isn't directly a user story (infrastructure, refactoring, tooling, research). Use a Sub-task to break a large story into parallel or sequential units of work.

---

## ─── BLANK TEMPLATE ───────────────────────────────────────────────

---

## ⚙️ Task: [TASK TITLE]

**Task Key:** [PROJECT-XXX]  
**Type:** `Task` | `Sub-task`  
**Parent Story / Epic:** [KEY + TITLE] *(if sub-task)*  
**Assignee:** [NAME]  
**Estimate:** [Xh / X points]  
**Sprint:** [SPRINT NAME / NUMBER]  
**Priority:** `High` | `Medium` | `Low`  

---

### 📋 What Needs to Be Done

> Clear, specific description of the work. One engineer should be able to pick this up cold.

[DESCRIBE THE TECHNICAL WORK]

---

### 🎯 Why (Context)

> Why is this task needed? What breaks or degrades if it's skipped?

[EXPLAIN THE REASON / MOTIVATION]

---

### 📐 Approach / Steps

> Optional but recommended for tasks > 2h. Break down into ordered steps.

1. [STEP 1]
2. [STEP 2]
3. [STEP 3]

---

### ✔️ Definition of Done

- [ ] [SPECIFIC COMPLETION CRITERION]
- [ ] [SPECIFIC COMPLETION CRITERION]
- [ ] Code reviewed (if code change)
- [ ] Tests updated / added (if code change)
- [ ] No new lint violations

---

### ⚠️ Risks / Blockers

- [ANY RISK OR DEPENDENCY THAT COULD BLOCK THIS TASK]

---

### 📎 References

- [LINK TO DESIGN DOC / ADR / TICKET]

---

## ─── FILLED EXAMPLE ───────────────────────────────────────────────

---

## ⚙️ Task: Add null-check and re-enrollment prompt for missing MFA secret

**Task Key:** AUTH-32  
**Type:** `Sub-task`  
**Parent Story / Epic:** AUTH-31 — Bug: Login 500 when MFA secret is null  
**Assignee:** Chamrong Thor  
**Estimate:** 3h  
**Sprint:** Sprint 14 (hotfix)  
**Priority:** `High`  

---

### 📋 What Needs to Be Done

In `AuthService.verifyTotp()`, add a null check for `user.getMfaSecret()` before calling `.isEmpty()`. If null, throw a new `MfaNotConfiguredException` which the controller maps to HTTP 409 with body:

```json
{
  "error": "MFA_NOT_CONFIGURED",
  "message": "Your MFA setup is incomplete. Please re-enroll in Security Settings."
}
```

Also add unit test coverage for this new code path.

---

### 🎯 Why (Context)

The DATA-44 migration added the `mfa_secret` column but did not backfill it for users who enrolled MFA before the column existed. These users have `NULL` in `mfa_secret` which causes a `NullPointerException` at login, resulting in an HTTP 500. This task handles the null case defensively until the backfill migration (AUTH-33) runs.

---

### 📐 Approach / Steps

1. Open `AuthService.java`, locate `verifyTotp()` at line 144.
2. Add null check: `if (user.getMfaSecret() == null) throw new MfaNotConfiguredException(...)`.
3. Create `MfaNotConfiguredException` in `exceptions/` package.
4. In `AuthController`, add `@ExceptionHandler(MfaNotConfiguredException.class)` returning 409.
5. Write unit test: `shouldReturn409WhenMfaSecretIsNull()`.
6. Run full auth test suite locally to confirm no regressions.

---

### ✔️ Definition of Done

- [x] `MfaNotConfiguredException` created and thrown when `mfaSecret == null`
- [ ] `AuthController` returns HTTP 409 with correct JSON body
- [ ] Unit test `shouldReturn409WhenMfaSecretIsNull()` written and passing
- [ ] Full auth test suite passing
- [ ] Code reviewed and approved
- [ ] No new Sonar violations

---

### ⚠️ Risks / Blockers

- Backfill migration (AUTH-33) must still run after this fix — this is a defensive workaround, not the root fix.
- Do not change the response shape for valid MFA attempts — AUTH-34 (E2E tests) depends on it.

---

### 📎 References

- [AUTH-31: Bug ticket](https://jira.example.com/AUTH-31)
- [AUTH-33: Backfill migration task](https://jira.example.com/AUTH-33)
- [AuthService.java line 144](https://github.com/example/repo/blob/main/AuthService.java#L144)
