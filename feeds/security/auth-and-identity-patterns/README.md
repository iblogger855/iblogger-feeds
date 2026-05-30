# Authentication & Identity Architecture

This library covers the architectural patterns, protocols, and trade-offs of modern Identity and Access Management (IAM). 

Many security vulnerabilities stem from developers misunderstanding the difference between *Authentication* (Who are you?) and *Authorization* (What can you do?), or confusing *Stateful Sessions* with *Stateless Tokens*. This guide clarifies the enterprise standards for both human and machine identities.

## 📚 Library Index

### Part 1: Session State Architecture
1. **[Stateful vs. Stateless Sessions](./01-stateful-vs-stateless-sessions.md)** 
   *Opaque Tokens, Redis, and the fatal flaw of JWTs as session tokens.*

### Part 2: Modern Identity Protocols
2. **[OAuth 2.0 & Delegated Access](./02-oauth2-and-delegated-access.md)** 
   *Authorization Code Flow, PKCE, and why OAuth is NOT for authentication.*
3. **[OpenID Connect (OIDC) & SSO](./03-openid-connect-and-sso.md)** 
   *The Identity Layer. ID Tokens, user info endpoints, and enterprise Single Sign-On.*
4. **[SAML 2.0 & Enterprise B2B](./04-saml-and-enterprise-b2b.md)** 
   *XML, assertions, and why legacy corporate clients still demand it.*

### Part 3: Token Management & Systems
5. **[Token Lifecycles & Rotation](./05-token-lifecycle-and-rotation.md)** 
   *Refresh token rotation, sliding windows, and handling expiration.*
6. **[Machine-to-Machine (M2M) Auth](./06-machine-to-machine-auth.md)** 
   *Client Credentials flow, mTLS, and zero-trust service boundaries.*
7. **[Browser Storage Security](./07-browser-storage-security.md)**
   *Cookies vs LocalStorage vs SessionStorage. XSS defenses and HttpOnly flags.*

### Part 4: Advanced Enterprise Federation & Passwordless
8. **[User Federation & Directories](./08-user-federation-and-directories.md)**
   *Identity brokering, Active Directory / LDAP synchronization, and JIT provisioning.*
9. **[AuthN, WebAuthn, & Passkeys](./09-webauthn-and-passkeys.md)**
   *Public Key Cryptography, FIDO2, and the unphishable passwordless future.*
10. **[The Evolution of OAuth: 1.0 to 2.1](./10-oauth-version-history-and-2.1.md)**
    *Why Implicit flows were banned, what changes in OAuth 2.1, and a look at GNAP.*
11. **[Cryptography Fundamentals](./11-cryptography-and-encryption-fundamentals.md)**
    *Hashing vs Encryption, Symmetric vs Asymmetric algorithms (AES, ECC, RSA), and Hybrid systems.*

---

*Last updated: 2026-05-17*
