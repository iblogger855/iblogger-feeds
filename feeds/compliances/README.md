# ⚖️ Compliances

Reference guides for the regulations, standards, and frameworks that software platforms must comply with. Each file explains what the regulation is, what it requires from a software engineering perspective, what the penalties are for non-compliance, and how to implement it.

---

## 📁 Groups

| Folder | What It Covers |
|:-------|:--------------|
| [data-privacy/](./data-privacy/) | GDPR, PDPA, CCPA, LGPD — user data rights, consent, retention, erasure |
| [payment-and-financial/](./payment-and-financial/) | PCI-DSS, PSD2, AML/CFT, SWIFT — payment security and financial crime prevention |
| [security-frameworks/](./security-frameworks/) | SOC 2, ISO 27001, OWASP ASVS, NIST — security audits and certifications |
| [identity-and-kyc/](./identity-and-kyc/) | KYC, KYB, AML, eIDAS, FATF — identity verification and sanctions |
| [healthcare/](./healthcare/) | HIPAA, HL7 FHIR, CE Marking, FDA 21 CFR — clinical data and medical devices |
| [regional/](./regional/) | Southeast Asia, Europe, Africa, Middle East, USA, India — country-specific overviews |
| [eu-specific/](./eu-specific/) | NIS2, DORA, MiCA, ePrivacy, HDS France, EU AI Act — EU/UK supranational frameworks |

---

## 🗺️ How to Use This

Each file follows the same structure:

1. **What it is** — the regulation in plain language
2. **Who it applies to** — which type of platform or company
3. **What it requires** — the specific technical and organisational obligations
4. **Penalties** — what happens if you don't comply
5. **How to implement it** — practical engineering and operational steps
6. **Related** — links to procedures and templates already in this repo

---

## 🔗 Related Procedures

- [KYC / KYB Provider Verification](../procedures/compliance-and-accounts/kyc/01-kyc-provider-verification.md)
- [Account Deletion & Data Retention](../procedures/compliance-and-accounts/01-account-deletion-and-data-retention.md)
- [File Upload & Validation Pipeline](../procedures/compliance-and-accounts/02-file-upload-validation-pipeline.md)
- [Payment Gateway](../procedures/payments-and-revenue/01-payment-gateway.md)
