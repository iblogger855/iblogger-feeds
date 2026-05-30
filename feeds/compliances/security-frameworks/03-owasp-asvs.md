# OWASP ASVS — Application Security Verification Standard

**Jurisdiction:** Global  
**Current version:** ASVS 5.0 (2024)  
**Applies to:** Web applications and APIs — used by developers, architects, QA, and security teams  
**Administered by:** OWASP (Open Web Application Security Project)  
**Tags:** #compliance #owasp #asvs #appsec #web-security #verification

---

## What It Is

OWASP ASVS is a framework of security requirements and controls for web applications. It is not a regulation — it is a standard that organisations adopt voluntarily (or as part of a contractual requirement) to verify and improve their application security posture.

It defines three levels of security rigour, allowing organisations to choose the appropriate level for their risk profile.

---

## The Three Levels

| Level | Name | For | Security requirements |
|:------|:-----|:----|:---------------------|
| **L1** | First steps | Low-risk apps, starting point | Basic security hygiene — penetration testing feasible |
| **L2** | Standard | Most web apps — handles sensitive data | Thorough verification — covers most attack vectors |
| **L3** | Advanced | Critical infrastructure — financial, medical, safety systems | Defence in depth — full threat modelling required |

Most web applications should target **L2**.

---

## Domains (ASVS 5.0)

| Domain | Key requirements |
|:-------|:----------------|
| **V1 — Architecture, Design, Threat Modelling** | Security at design phase, data flows documented |
| **V2 — Authentication** | Passwords, MFA, credential storage, account recovery |
| **V3 — Session Management** | Session tokens, timeout, invalidation on logout |
| **V4 — Access Control** | RBAC, deny by default, path traversal |
| **V5 — Validation, Sanitization, Encoding** | Input validation, output encoding, XSS/injection prevention |
| **V6 — Cryptography** | Algorithm selection, key management, random number generation |
| **V7 — Error Handling and Logging** | No stack traces to users, security event logging |
| **V8 — Data Protection** | Data classification, encryption, no sensitive data in logs/URLs |
| **V9 — Communication** | TLS configuration, certificate validation |
| **V10 — Malicious Code** | No backdoors, no undocumented features |
| **V11 — Business Logic** | Workflow abuse prevention, rate limiting |
| **V12 — Files and Resources** | File upload validation, path traversal |
| **V13 — API and Web Service** | API authentication, input validation, HTTP security headers |
| **V14 — Configuration** | Secure defaults, dependency management, CSP |

---

## Key Requirements by Domain

### Authentication (V2)
```
□ Passwords minimum 12 characters, no maximum length
□ No password hints or knowledge-based security questions
□ Credential breach checking (e.g. Have I Been Pwned)
□ TOTP or hardware key for MFA
□ Account lockout after 10 failed attempts
□ Secure password reset — link expires in 10 minutes
□ No default credentials on any system
```

### Session Management (V3)
```
□ Session tokens: 64+ bits of entropy
□ Session invalidated on logout
□ Session timeout: active (30 min inactivity) + absolute (8 hours)
□ Secure + HttpOnly + SameSite flags on session cookies
□ New session token issued after login (prevents fixation)
```

### Input Validation (V5)
```
□ Validate all input server-side — never trust client-side only
□ Parameterised queries for all database access (no string concatenation)
□ HTML encoding for all user-controlled output
□ File upload: check MIME type, scan for malware, store outside webroot
□ Reject or encode all HTML tags in user input displayed to others
```

### Cryptography (V6)
```
□ AES-256 for symmetric encryption
□ RSA 3072+, ECDSA P-384+ for asymmetric
□ Bcrypt/Argon2/PBKDF2 for password hashing — never MD5/SHA1
□ TLS 1.2 minimum, TLS 1.3 preferred
□ No hardcoded keys or secrets in source code
```

### Logging (V7)
```
□ Log: authentication events, access control failures, input validation failures
□ Never log: passwords, tokens, credit card numbers, health data
□ No stack traces in user-facing error messages
□ Logs protected from tampering
□ Centralised log storage
```

---

## ASVS vs OWASP Top 10

| Document | Purpose |
|:---------|:--------|
| **OWASP Top 10** | Awareness list — the 10 most critical web application risks. Good for education. Not a compliance standard. |
| **OWASP ASVS** | Comprehensive verification standard — 250+ specific requirements. Used for compliance and security testing. |

Use the Top 10 to understand the threats. Use ASVS to verify your controls against them.

---

## How to Use ASVS

1. **Choose your target level** (L1, L2, or L3)
2. **Map existing controls** against ASVS requirements
3. **Identify gaps** — requirements not currently met
4. **Remediate** — build the missing controls
5. **Verify** — penetration test against ASVS requirements
6. **Document** — record which requirements are met and how

---

## Related

- [SOC 2](./01-soc2.md) — organisational security certification
- [ISO 27001](./02-iso-27001.md) — ISMS certification
- [NIST CSF](./04-nist-csf.md)
- [Security section](../../security/) — technical implementation guides
