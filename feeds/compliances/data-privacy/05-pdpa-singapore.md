# PDPA — Personal Data Protection Act (Singapore)

**Jurisdiction:** Singapore  
**In force:** 2 January 2013 (major amendments effective 1 February 2021)  
**Applies to:** All private sector organisations that collect, use, or disclose personal data in Singapore  
**Enforced by:** Personal Data Protection Commission (PDPC)  
**Tags:** #compliance #pdpa #data-privacy #singapore #southeast-asia

---

## What It Is

Singapore's PDPA governs personal data protection in the private sector. The 2021 amendments significantly strengthened it — introducing mandatory breach notification, enhanced consent requirements, data portability, and increased penalties.

---

## Key Concepts

| Term | Meaning |
|:-----|:--------|
| **Personal data** | Data about an individual who can be identified from that data or from that data and other information the organisation has |
| **Business contact information** | Name, position, business phone/email — **excluded** from PDPA |
| **Organisation** | Any individual, company, association, or body — public sector excluded |

---

## Obligations

### Collection, Use, and Disclosure
- Only collect data for purposes a reasonable person would consider appropriate
- Inform individuals of the purposes before or at the time of collection
- Obtain consent before or at collection (or rely on a deemed consent / legitimate interests exception)

### Deemed Consent (2021 amendment)
Consent can be implied when:
- Individual voluntarily provides data for an obvious purpose
- Organisation notifies individual and individual does not opt out
- Necessary for a contract

### Legitimate Interests (2021 amendment)
Can process without consent if:
- Legitimate business interest
- Benefit to individual or the public
- Risk of harm to the individual is low

### Data Portability (2021 amendment)
- Organisations must port data to other organisations upon user request
- Applies to user-provided data in digital format used to provide services

---

## Data Breach Notification (2021 amendment)

| Obligation | Timeframe |
|:-----------|:----------|
| Assess whether breach is notifiable | Within 30 days of discovering the breach |
| Notify PDPC | Within **3 calendar days** of assessing the breach as notifiable |
| Notify affected individuals | If breach likely causes significant harm |

A breach is notifiable if it involves 500+ individuals OR data that could cause significant harm (financial info, health data, passwords, etc.).

---

## Individual Rights

| Right | Detail |
|:------|:-------|
| **Access** | What personal data is held and how it has been used/disclosed |
| **Correction** | Correct inaccurate data |
| **Withdrawal of consent** | Stop processing (may affect service delivery) |
| **Data portability** (2021) | Port data to another organisation |

Singapore PDPA does **not** include a general right to erasure (unlike GDPR).

---

## Do Not Call Registry (DNC)

A separate but related requirement — before sending marketing messages (voice calls, SMS, fax) to Singapore numbers, check the DNC Registry. Marketing to numbers on the DNC Registry is prohibited.

---

## Penalties

| Violation | Maximum |
|:----------|:--------|
| General | Up to **SGD 1,000,000** (~$740,000 USD) |
| Post-2021 (turnover-based) | Up to **10% of annual Singapore turnover** (for organisations with annual local turnover > SGD 10M) |
| Criminal (egregious) | Up to **SGD 5,000** fine or 2 years imprisonment per individual |

---

## What to Build

```
Minimum PDPA (Singapore) implementation:

□ Privacy notice — clear statement of purposes
□ Consent mechanism — opt-in where required
□ Withdrawal of consent mechanism
□ DNC Registry check before marketing messages
□ Data breach assessment process — 30-day assessment window
□ 3-day breach notification to PDPC
□ Data portability capability (for service-related data)
□ Access and correction request handling
□ Data protection officer (DPO) appointment (recommended)
□ Data Protection Policy (internal)
□ Vendor contracts with data protection clauses
```

---

## Related

- [GDPR](./01-gdpr.md)
- [PDPA Thailand](./04-pdpa-thailand.md)
- [Data Privacy Comparison Matrix](./07-comparison-matrix.md)
- [Regional: Singapore Overview](../regional/03-singapore-overview.md)
