# PDPA — Personal Data Protection Act (Thailand)

**Jurisdiction:** Thailand  
**In force:** 1 June 2022 (full enforcement)  
**Applies to:** Any organisation that collects, uses, or discloses personal data of individuals located in Thailand — including foreign organisations offering goods/services in Thailand  
**Enforced by:** Personal Data Protection Committee (PDPC)  
**Tags:** #compliance #pdpa #data-privacy #thailand #southeast-asia

---

## What It Is

Thailand's PDPA is closely modelled on GDPR. It governs how organisations collect, store, use, and disclose personal data of people in Thailand. Non-compliance carries both civil and criminal liability.

---

## Key Definitions

| Term | Meaning |
|:-----|:--------|
| **Personal data** | Info identifying or capable of identifying a person — name, address, ID, email, phone, location, biometrics |
| **Sensitive data** | Race, ethnicity, political opinions, religion, sexual behaviour, criminal records, health data, disability, union membership, genetic/biometric data |
| **Data controller** | Decides purpose and means of processing |
| **Data processor** | Processes on behalf of the controller |

---

## Legal Bases for Processing

| Basis | Example |
|:------|:--------|
| Consent | User opts in to marketing |
| Contract | Processing needed to deliver your service |
| Vital interests | Life-threatening emergency |
| Public interest | Government functions |
| Legitimate interests | Fraud prevention (balanced against individual rights) |
| Legal obligation | Required by Thai law |

**Sensitive data:** Requires **explicit consent** — no other legal basis applies except in narrow exceptions (medical treatment, legal rights, public interest).

---

## Data Subject Rights

| Right | Timeframe |
|:------|:----------|
| Access | Within 30 days |
| Portability | Within 30 days |
| Objection | Immediately on request |
| Erasure | Within 30 days |
| Restriction of processing | Immediately |
| Correction | Within 30 days |
| Withdraw consent | At any time |

---

## Key Obligations

### Data Controller Obligations
- Maintain a record of processing activities (ROPA)
- Appoint a Data Protection Officer (DPO) if processing sensitive data at large scale, or if a public authority
- Conduct Data Protection Impact Assessment (DPIA) for high-risk processing
- Implement appropriate security measures

### Consent Requirements
- Must be freely given, specific, informed, and unambiguous
- Separate from other terms and conditions
- Withdrawal must be as easy as giving consent
- Records of consent must be kept

### Cross-Border Data Transfer
- Only to countries with adequate protection standards
- Or with explicit consent / contractual safeguards

### Data Breach Notification
- Notify PDPC within **72 hours** of becoming aware
- Notify data subjects if high risk to rights and freedoms

---

## Penalties

| Type | Maximum |
|:-----|:--------|
| Civil liability | Actual damages + punitive damages (up to 2×) |
| Administrative fine | Up to **THB 5,000,000** (~$150,000 USD) per violation |
| Criminal — intentional | Up to **1 year imprisonment** and/or **THB 1,000,000** fine |
| Criminal — sensitive data | Up to **6 months imprisonment** and/or **THB 500,000** fine |

---

## What to Build

```
Minimum PDPA (Thailand) implementation:

□ Privacy notice in Thai (required for Thai users)
□ Consent management — explicit for sensitive data
□ Consent records — who consented, to what, and when
□ Data subject request system — 30-day SLA
□ DPO appointment (if required)
□ ROPA — Record of Processing Activities
□ Cross-border transfer controls
□ 72-hour breach notification capability
□ DPIA process for high-risk activities
□ Data retention and deletion automation
```

---

## Related

- [GDPR](./01-gdpr.md) — the model this law is based on
- [PDPA Singapore](./05-pdpa-singapore.md) — Singapore equivalent
- [Data Privacy Comparison Matrix](./07-comparison-matrix.md)
- [Regional: Thailand Overview](../regional/02-thailand-overview.md)
