# OWASP ASVS 5.0: The Enterprise Standard

**Author:** ichamrong  
**Category:** Security & Architecture  
**Read Time:** ~5 min  

---

## 1. What is ASVS 5.0?

The **OWASP Application Security Verification Standard (ASVS)** is the industry's most rigorous framework for testing and designing secure web applications. 

ASVS is divided into 14 distinct chapters (V1 through V14). To make this standard actionable for engineering teams, we have grouped these 14 chapters into **4 Core Architectural Domains**. 

Interestingly, nearly every topic in the ASVS standard directly maps to the custom architectural libraries we have built (Gateways, File Uploads, Session Security, Anti-Spam).

---

## 2. The 4 Core Domains (Grouped Topics)

### [Domain A: Identity & Access Management](./01-domain-identity-access.md)
*Verifying who the user is, tracking them, and restricting their permissions.*
- **V2: Authentication** (Passwords, 2FA, Hardware Keys)
- **V3: Session Management** (JWTs, Stateful Redis, Cookies)
- **V4: Access Control** (RBAC, ABAC, preventing IDOR)

### [Domain B: Data & Cryptography](./02-domain-data-cryptography.md)
*Protecting data at rest and validating all incoming data to prevent injection.*
- **V5: Validation & Sanitization** (SQL Injection, XSS)
- **V6: Stored Cryptography** (Hashing passwords, Encrypting DBs)
- **V8: Data Protection** (GDPR, Data Minimization, PII)

### [Domain C: Architecture & Communications](./03-domain-architecture-communications.md)
*Securing the network perimeter, APIs, and overall system design.*
- **V1: Architecture & Threat Modeling** (Designing secure lifecycles)
- **V9: Communications** (TLS, HTTPS, Interception)
- **V13: API & Web Services** (REST, GraphQL, API Gateways)
- **V14: Configuration** (CORS, CSP, Security Headers)

### [Domain D: Business Logic & Operations](./04-domain-logic-and-files.md)
*Handling files, detecting malicious behavior, and managing logs securely.*
- **V7: Error Handling & Logging** (Sanitizing logs, avoiding cleartext)
- **V10: Malicious Code Verification** (Supply chain attacks)
- **V11: Business Logic** (Anti-Spam, Rate Limiting, Checkpoints)
- **V12: File & Resources** (Polyglots, ClamAV, Zip Bombs)

---

**Navigation:** Select a Domain above to dive into the specific engineering requirements for each ASVS chapter.

*Last updated: 2026-05-17*
