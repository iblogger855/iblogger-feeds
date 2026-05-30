# LGPD — Lei Geral de Proteção de Dados (Brazil)

**Jurisdiction:** Brazil  
**In force:** September 2020 (enforcement from August 2021)  
**Applies to:** Any organisation that processes personal data of individuals located in Brazil, or where processing occurs in Brazil, or where the purpose is to offer goods/services in Brazil  
**Tags:** #compliance #lgpd #data-privacy #brazil #latin-america

---

## What It Is

LGPD is Brazil's comprehensive data protection law, closely modelled on GDPR. It is enforced by the ANPD (Autoridade Nacional de Proteção de Dados — National Data Protection Authority).

---

## Key Principles

Same 10 principles as GDPR broadly:
- Purpose, adequacy, necessity, free access, quality, transparency, security, prevention, non-discrimination, accountability

---

## Legal Bases for Processing (Article 7)

LGPD has 10 legal bases (more than GDPR's 6):

| Basis | Notes |
|:------|:------|
| Consent | Freely given, specific, informed |
| Contract | Performance of a contract |
| Legal obligation | Required by law |
| Public policy | Government/public body functions |
| Research | With anonymisation where possible |
| Contract (pre-contractual) | Steps before signing a contract |
| Exercise of legal rights | Litigation, arbitration |
| Protection of life | Health/safety emergency |
| Health protection | By health professionals |
| Legitimate interests | Balanced against data subject rights |

---

## Data Subject Rights

| Right | Timeframe |
|:------|:----------|
| Confirmation of processing | Immediate |
| Access | Within 15 days |
| Correction | Within 15 days |
| Anonymisation, blocking, or deletion | Within 15 days |
| Portability | ANPD defines format |
| Sharing information | Who data is shared with |
| Opt-out of consent | At any time |
| Review of automated decisions | Request human review |

---

## Key Differences from GDPR

| Aspect | LGPD | GDPR |
|:-------|:-----|:-----|
| Enforcement body | ANPD | National DPAs |
| Response timeframe | 15 days | 30 days |
| Legal bases | 10 | 6 |
| DPO requirement | Required for some organisations | Required for some organisations |
| Penalties | Up to 2% of Brazil revenue (max R$50M per violation) | Up to 4% of global turnover |
| Children's data | Under 18 requires parental consent | Under 16 (varies by member state) |

---

## Penalties

- Up to **2% of company's revenue in Brazil** in the prior fiscal year
- Maximum **R$50,000,000 (50 million BRL) per violation**
- Daily fines for continued non-compliance
- Public disclosure of the violation
- Blocking or deletion of the data involved

---

## What to Build

```
Minimum LGPD implementation:

□ Privacy notice in Portuguese — all processing purposes listed
□ Consent management — granular, withdrawable
□ Data subject request portal — 15-day SLA
□ DPO (Encarregado) appointment if required
□ Data processing inventory (ROPA equivalent)
□ Security measures — encryption, access control, audit logs
□ Data breach notification to ANPD and affected individuals
□ Contracts with service providers (data operators)
□ Children's consent mechanism for under-18 users
```

---

## Related

- [GDPR](./01-gdpr.md) — European model LGPD was based on
- [Data Privacy Comparison Matrix](./07-comparison-matrix.md)
