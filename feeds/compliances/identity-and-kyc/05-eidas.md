# eIDAS — Electronic Identification and Trust Services

**Jurisdiction:** European Union  
**In force:** 1 July 2016 (eIDAS 1.0); eIDAS 2.0 regulation adopted 2024  
**Applies to:** Electronic identity, electronic signatures, electronic seals, timestamps, and website authentication within the EU  
**Tags:** #compliance #eidas #digital-identity #e-signature #eu #trust-services

---

## What It Is

eIDAS (electronic IDentification, Authentication and trust Services) is the EU regulation that establishes a legal framework for:
1. **Electronic identification** — digital identity schemes that can be recognised across EU member states
2. **Trust services** — electronic signatures, seals, timestamps, registered delivery, and website authentication

eIDAS creates the legal equivalence of electronic signatures with wet-ink signatures across the EU.

---

## Key Components

### Electronic Signatures

| Type | Description | Legal effect |
|:-----|:------------|:-------------|
| **Simple Electronic Signature (SES)** | Any electronic data attached to a document (e.g. typed name, scanned signature) | Not denied legal effect but lowest assurance |
| **Advanced Electronic Signature (AdES)** | Uniquely linked to and identifies the signatory; detects changes | Higher assurance — suitable for most contracts |
| **Qualified Electronic Signature (QES)** | Created by a qualified device with a qualified certificate from a Trust Service Provider | Legally equivalent to a handwritten signature across the EU |

### Electronic Seals
For legal entities (companies) rather than individuals — equivalent to a company stamp. Used to prove origin and integrity of documents.

### Qualified Timestamps
Prove that data existed at a specific point in time. Legally admissible as evidence.

### eDelivery / Registered Electronic Mail
Equivalent to registered post — provides proof of sending and receipt.

### Website Authentication (QWAC)
Qualified Website Authentication Certificates — prove a website belongs to the legal entity it claims.

---

## eIDAS 2.0 — EU Digital Identity Wallet

eIDAS 2.0 (adopted 2024) introduces the **EU Digital Identity Wallet** — a personal digital wallet that:
- Every EU citizen can obtain
- Contains verified identity attributes (name, DOB, address, professional qualifications)
- Can be used to authenticate online and in person across the EU
- Eliminates the need for separate KYC processes for compliant platforms

### Impact on KYC
When eIDAS 2.0 is fully implemented:
- Users can present their EU Digital Identity Wallet instead of uploading identity documents
- The wallet attestations are pre-verified by government authorities
- Platforms accepting wallet authentication get legal certainty about the user's identity
- Reduces KYC cost and friction significantly

---

## Trust Service Providers (TSPs)

TSPs provide the infrastructure for qualified trust services. They are audited and supervised by national authorities. The EU's **Trusted List** publishes all qualified TSPs.

Examples:
- DocuSign (qualified in some EU jurisdictions)
- Adobe Sign (qualified)
- Swisscom Trust Services
- BankID (Sweden) — national eID scheme
- France Connect — French national identity

---

## What eIDAS Means for Your Platform

### If you operate in the EU and need electronic signatures:
- For most purposes (NDAs, service agreements): Advanced Electronic Signature is sufficient
- For high-value legal documents (real estate, financial contracts): Qualified Electronic Signature may be required
- Using a qualified TSP gives you legal certainty

### If you do KYC on EU residents:
- Monitor eIDAS 2.0 wallet rollout — it will become an accepted identity verification method
- Accepting wallet authentication will eventually be required for certain regulated services

### For website authentication:
- QWAC certificates provide stronger identity assurance than standard DV/OV certificates

---

## Related

- [KYC/KYB Fundamentals](./01-kyc-kyb-fundamentals.md)
- [Digital Identity Verification](./06-digital-identity-verification.md)
- [GDPR](../data-privacy/01-gdpr.md) — data protection for identity data collected under eIDAS
