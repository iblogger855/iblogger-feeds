# Vietnam — Compliance Overview for Digital Platforms

**Tags:** #compliance #vietnam #cybersecurity-law #decree13 #sbv #southeast-asia

---

## Summary

Vietnam has a complex and rapidly evolving regulatory environment. The Cybersecurity Law (2019) and Decree 13 on Personal Data Protection (2023) are the primary frameworks for digital platforms. Vietnam has strong data localisation requirements, particularly for cybersecurity-classified data. The State Bank of Vietnam (SBV) regulates payments and fintech.

---

## Key Regulators

| Regulator | Acronym | Jurisdiction |
|:----------|:--------|:-------------|
| Ministry of Public Security | MPS | Cybersecurity Law enforcement, data localisation |
| State Bank of Vietnam | SBV | Banking, payments, e-money, fintech |
| Ministry of Information and Communications | MIC | E-transactions, internet platforms, telecom |
| Anti-Money Laundering Department | AMLD (under SBV) | AML/CFT for financial institutions |
| Ministry of Health | MOH | Healthcare regulation |
| Vietnam Food Administration | VFA | Pharmaceuticals |

---

## Data Protection — Decree 13 (2023)

Vietnam does not yet have a standalone Data Protection Law, but **Decree 13/2023/ND-CP on Personal Data Protection** (effective 1 July 2023) is the primary framework:

| Requirement | Detail |
|:------------|:-------|
| Scope | All organisations processing personal data of Vietnamese residents |
| Consent | Required — specific, informed, voluntary, clearly expressed |
| Sensitive data categories | Health, genetic, biometric, racial/ethnic, political, sexual orientation, criminal records, financial info |
| Data subject rights | Access, correction, deletion, withdraw consent, portability |
| DPO | Required for some organisations |
| Data breach notification | Notify PDPD (Personal Data Protection Department) within 72 hours |
| Cross-border transfer | Requires PDPD approval + impact assessment |
| Max penalty | Up to VND 5 billion (~$200,000 USD) per violation |

---

## Data Localisation — Cybersecurity Law (2019)

Vietnam's Cybersecurity Law has significant data localisation requirements for **"important data"**:

```
IMPORTANT DATA includes:
  - Government system data
  - Infrastructure control data
  - Information about Vietnamese citizens
  - Financial, banking, and insurance data
  - Health and medical data

REQUIREMENT:
  Important data collected in Vietnam about Vietnamese users
  must be STORED IN VIETNAM
  
  Foreign platforms must establish a local representative office
  or local data centre (or use a Vietnamese cloud provider)
```

This is one of the strictest data localisation requirements in Southeast Asia.

**Practical impact:** Platforms with significant Vietnamese user bases (users generating "important data") must host that data in Vietnam — or partner with a Vietnamese data centre provider.

---

## Payment Services — SBV

| Licence | Required for |
|:--------|:------------|
| E-money institution | Operating a digital wallet |
| Payment intermediary | Payment gateway services |
| Money transfer | Domestic and cross-border transfers |

**VNPay** and **MoMo** are the dominant payment systems. Foreign payment platforms must partner with a licensed Vietnamese payment intermediary or obtain their own licence.

---

## AML/CFT Requirements

Under the Anti-Money Laundering Law (2022):

| Obligation | Requirement |
|:-----------|:------------|
| CDD / KYC | Mandatory for all financial customers |
| EDD | For PEPs, high-risk countries, large transactions |
| STR filing | Within 3 working days |
| Cash transaction reports | Transactions above VND 300 million (~$12,500) |
| Record retention | Minimum 5 years |

---

## Healthcare Regulations

| Requirement | Regulator |
|:------------|:----------|
| Hospital licensing | MOH |
| Doctor registration | Vietnam Medical Association |
| Telemedicine framework | MOH Circular (framework in development) |
| Pharmaceutical licensing | Drug Administration of Vietnam |

---

## Internet Platform Obligations

For platforms with significant Vietnamese presence:

| Obligation | Regulator |
|:-----------|:----------|
| Platform registration | MIC (for platforms > 1M users in Vietnam) |
| Content moderation | MIC — must remove illegal content within 24–48 hours |
| User data requests | Must comply with MPS and MIC requests |
| Local representative office | Required for large foreign platforms |

---

## Related

- [GDPR](../data-privacy/01-gdpr.md) — implement as best practice for data protection
- [AML/CFT](../payment-and-financial/03-aml-cft.md)
- [Data Privacy Comparison Matrix](../data-privacy/07-comparison-matrix.md)
