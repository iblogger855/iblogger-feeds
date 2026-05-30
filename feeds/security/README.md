# 🛡️ Enterprise Security & Hardening

A state-of-the-art visual reference library detailing application security, authentication patterns, network hardening, anti-abuse architectures, and OWASP compliance standards.

---

## 🗂️ Security Curriculum & Modules

### 🔐 1. Authentication & Federated Identity (`auth-and-identity-patterns/`)

A masterclass in modern sessions, OAuth 2.1, OIDC, SAML, and WebAuthn Passkeys, fully illustrated with dynamic sequence diagrams.

| Module | Title | Level | Read Time | Key Topics |
| :--- | :--- | :--- | :--- | :--- |
| **01** | [Stateful vs. Stateless Session Security](./auth-and-identity-patterns/01-stateful-vs-stateless-sessions.md) | Intermediate | ~15 min | Redis session lookup, CPU stateless verifications, JWT revokes |
| **02** | [OAuth 2.0 & Delegated Access](./auth-and-identity-patterns/02-oauth2-and-delegated-access.md) | Intermediate | ~15 min | PKCE dynamic challenges, Authorization Code Flow architecture |
| **03** | [OIDC & Single Sign-On (SSO)](./auth-and-identity-patterns/03-openid-connect-and-sso.md) | Advanced | ~20 min | Cross-subdomain cookies, OIDC federation, Kerberos tokens |
| **04** | [SAML 2.0 & Enterprise B2B SSO](./auth-and-identity-patterns/04-saml-and-enterprise-b2b.md) | Advanced | ~15 min | XML DOM structures, XML Signature Wrapping (XSW) attacks |
| **05** | [Token Lifecycle & Refresh Token Rotation](./auth-and-identity-patterns/05-token-lifecycle-and-rotation.md) | Advanced | ~12 min | RTR threat models, reuse exceptions, token theft mitigation |
| **06** | [Machine-to-Machine (M2M) Authentication](./auth-and-identity-patterns/06-machine-to-machine-auth.md) | Advanced | ~12 min | OAuth Client Credentials, mutual TLS (mTLS) handshakes |
| **07** | [Browser Storage & Token Delivery Security](./auth-and-identity-patterns/07-browser-storage-security.md) | Intermediate | ~12 min | SameSite cookie flags, CSRF mitigations, LocalStorage hazards |
| **08** | [User Federation & Directory Integrations](./auth-and-identity-patterns/08-user-federation-and-directories.md) | Advanced | ~12 min | Just-in-Time (JIT) shadow profiles, LDAP and AD syncing |
| **09** | [WebAuthn & Passkeys Architecture](./auth-and-identity-patterns/09-webauthn-and-passkeys.md) | Advanced | ~15 min | Asymmetric hardware enclaves, Attestation/Assertion, origin binding |
| **10** | [OAuth Version History & 2.1 Hardening](./auth-and-identity-patterns/10-oauth-version-history-and-2.1.md) | Intermediate | ~10 min | Deprecation lists, exact string redirects, PKCE mandates |
| **11** | [Cryptography & Encryption Fundamentals](./auth-and-identity-patterns/11-cryptography-and-encryption-fundamentals.md) | Advanced | ~25 min | One-way Argon2, AES-256-GCM, Asymmetric ECC/Ed25519, KMS keys |

---

### 🍪 2. Session & Cookie Security (`session-and-cookie-security/`)

Detailed guides on securing client-side state, preventing session hijacking, and avoiding CORS/CSRF pitfalls.

| Module | Title | Level | Read Time |
| :--- | :--- | :--- | :--- |
| **01** | [CSRF & State-Mutating Attacks](./session-and-cookie-security/01-csrf-and-state-mutations.md) | Intermediate | ~8 min |
| **02** | [Device & Session Management](./session-and-cookie-security/02-device-and-session-management.md) | Intermediate | ~8 min |
| **03** | [The Cookie Black Market](./session-and-cookie-security/03-the-cookie-black-market.md) | Advanced | ~10 min |
| **04** | [CORS Misconfigurations](./session-and-cookie-security/04-cors-misconfigurations.md) | Advanced | ~12 min |
| **05** | [Advanced Session Cloning](./session-and-cookie-security/05-advanced-session-cloning.md) | Advanced | ~10 min |
| **06** | [Inactivity & Telecom Recycling](./session-and-cookie-security/06-inactivity-and-telecom-recycling.md) | Intermediate | ~8 min |

---

### 🤖 3. Bot Protection & CAPTCHAs (`bot-protection/`)

Deep dive into defensive strategies for mitigating automated scrapers, credential stuffing, and api brute-forcing.

| Module | Title | Level | Read Time |
| :--- | :--- | :--- | :--- |
| **01** | [Legacy Visual CAPTCHAs](./bot-protection/01-legacy-visual-captchas.md) | Beginner | ~8 min |
| **02** | [Invisible Scoring CAPTCHAs](./bot-protection/02-invisible-scoring-captchas.md) | Intermediate | ~8 min |
| **03** | [Privacy-First CAPTCHAs](./bot-protection/03-privacy-first-captchas.md) | Intermediate | ~10 min |
| **04** | [Enterprise Bot Managers](./bot-protection/04-enterprise-bot-managers.md) | Advanced | ~10 min |
| **05** | [Open-Source Bottlenecks & Honeypots](./bot-protection/05-open-source-and-honeypots.md) | Intermediate | ~10 min |
| **06** | [CAPTCHA Comparison Matrix](./bot-protection/06-captcha-comparison-matrix.md) | Reference | ~8 min |

---

### 🛡️ 4. DDoS Defense & Rate Limiting (`ddos-defense/`)

Advanced network architectures designed to mitigate L3/L4 volumetric attacks and L7 HTTP/WebSocket abuse.

| Module | Title | Level | Read Time |
| :--- | :--- | :--- | :--- |
| **01** | [The Anatomy of a DDoS Attack](./ddos-defense/01-the-anatomy-of-a-ddos.md) | Intermediate | ~8 min |
| **02** | [Dynamic Proxy & IP Rotator Attacks](./ddos-defense/02-dynamic-proxy-attacks.md) | Advanced | ~10 min |
| **03** | [HTTP Layer 7 Defense & Rate Limiting](./ddos-defense/03-http-layer7-defense.md) | Advanced | ~25 min |
| **04** | [WebSocket Tunneling Defense](./ddos-defense/04-websocket-defense.md) | Advanced | ~22 min |
| **05** | [Server-Sent Events (SSE) Exhaustion](./ddos-defense/05-sse-defense.md) | Advanced | ~22 min |
| **06** | [L3/L4 Network Volumetric Mitigations](./ddos-defense/06-network-volumetric-defense.md) | Advanced | ~18 min |
| **07** | [API & GraphQL Security Hardening](./ddos-defense/07-api-graphql-defense.md) | Advanced | ~20 min |
| **08** | [DDoS Mitigation Architecture](./ddos-defense/08-defense-architecture.md) | Reference | ~20 min |

---

### 📧 5. Anti-Spam & Trust Scoring (`anti-spam-architecture/`)

Algorithmic structures designed to assess user trust, block spam funnels, and protect platform integrity.

- [01 - Trust & Velocity Scoring](./anti-spam-architecture/01-trust-and-velocity-scoring.md)
- [02 - The Checkpoint Funnel](./anti-spam-architecture/02-the-checkpoint-funnel.md)
- [03 - Shadowbanning & Tarpits](./anti-spam-architecture/03-shadowbanning-and-tarpits.md)
- [04 - Marketplace Spam Strategies](./anti-spam-architecture/04-marketplace-spam-strategies.md)

---

### 📂 6. File Upload Defenses (`file-upload-defense/`)

Strategies for securing user attachments, blocking polyglot execution, and running virus scan engines.

- [01 - Polyglot File Attack Vectors](./file-upload-defense/01-polyglot-files.md)
- [02 - Malware Scanning with ClamAV](./file-upload-defense/02-malware-scanning-clamav.md)

---

### 📡 7. Network Security & Logs (`network-security/`)

Basics of transit protection, public Wi-Fi risks, and logging pipeline audit trailing.

- [01 - Evil Twins & Captive Portals](./network-security/01-evil-twins-and-captive-portals.md)
- [02 - Transit & Logging Failure Audits](./network-security/02-transit-and-logging-failures.md)

---

### 👥 8. Social Engineering & Pretexting (`social-engineering/`)

Deconstructing psychological manipulation, phishing vectors, and operational security awareness.

- [01 - Phishing & Digital Deception](./social-engineering/01-phishing-and-digital-deception.md)
- [02 - In-Person & Physical Site Attacks](./social-engineering/02-physical-and-in-person-attacks.md)
- [03 - Psychological Manipulation & Pretexting](./social-engineering/03-psychological-manipulation-and-pretexting.md)

---

### 🏷️ 9. OWASP ASVS 5.0 Verification (`owasp-asvs-5.0/`)

Verification checklists and reference guidelines mapping directly to the official OWASP Application Security Verification Standard (Version 5.0).

- [01 - Domain 1: Identity & Access Control Verification](./owasp-asvs-5.0/01-domain-identity-access.md)
- [02 - Domain 2: Data Protection & Cryptography Verification](./owasp-asvs-5.0/02-domain-data-cryptography.md)
- [03 - Domain 3: Architecture & Communications Verification](./owasp-asvs-5.0/03-domain-architecture-communications.md)
- [04 - Domain 4: Business Logic & File Security Verification](./owasp-asvs-5.0/04-domain-logic-and-files.md)

---

## 🎯 Quick Navigation

- [All Articles](../README.md#-quick-links-by-category)
- [Browse by Category](../../INDEX.md)
- [Contributing](../../.github/CONTRIBUTING.md)

---

*Last updated: 2026-05-16*
