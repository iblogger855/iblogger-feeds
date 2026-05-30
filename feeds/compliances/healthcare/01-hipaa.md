# HIPAA — Health Insurance Portability and Accountability Act

**Jurisdiction:** United States of America  
**In force:** 1996 (Privacy Rule 2003, Security Rule 2005, Breach Notification Rule 2009, Omnibus Rule 2013)  
**Applies to:** Covered entities (healthcare providers, health plans, healthcare clearinghouses) and their business associates  
**Enforced by:** HHS Office for Civil Rights (OCR)  
**Tags:** #compliance #hipaa #healthcare #phi #usa #health-data

---

## What It Is

HIPAA establishes national standards for protecting sensitive patient health information (Protected Health Information / PHI) in the United States. It applies to healthcare providers, health plans, and any organisation that processes, stores, or transmits PHI on their behalf (Business Associates).

---

## Protected Health Information (PHI)

PHI is any individually identifiable health information transmitted or maintained in any form or medium.

The **18 HIPAA identifiers** that make health information PHI:

1. Names
2. Geographic data (smaller than state)
3. Dates (other than year) related to the individual
4. Phone numbers
5. Fax numbers
6. Email addresses
7. Social security numbers
8. Medical record numbers
9. Health plan beneficiary numbers
10. Account numbers
11. Certificate/licence numbers
12. Vehicle identifiers
13. Device identifiers
14. Web URLs
15. IP addresses
16. Biometric identifiers
17. Full-face photographs
18. Any unique identifying number or code

---

## The Three Rules

### 1. Privacy Rule
- Patients have rights over their PHI: access, amendment, accounting of disclosures
- PHI may only be used/disclosed for treatment, payment, and healthcare operations — or with patient authorisation
- Minimum necessary standard: only use the minimum PHI needed for the purpose

### 2. Security Rule
Applies to **electronic PHI (ePHI)** specifically:

| Safeguard type | Examples |
|:--------------|:---------|
| **Administrative** | Risk analysis, workforce training, access management, incident response |
| **Physical** | Workstation controls, device and media controls, facility access |
| **Technical** | Access control (unique user IDs), audit controls, encryption, automatic logoff |

### 3. Breach Notification Rule
- Notify affected individuals within **60 days** of discovering a breach
- Notify HHS OCR within **60 days** (for < 500 people) or **immediately** (for 500+ in a state)
- Breaches affecting 500+ in a state require media notification

---

## Business Associate Agreements (BAAs)

Any vendor that handles PHI on your behalf must sign a **Business Associate Agreement (BAA)**. This contractually obligates them to protect PHI under HIPAA.

Common business associates requiring BAAs:
- Cloud providers (AWS, Google Cloud, Azure — all offer HIPAA BAAs)
- EHR/EMR systems
- Billing and coding services
- Analytics platforms
- Communication tools (email, messaging)

If a vendor refuses to sign a BAA — you cannot use them to store or process PHI.

---

## Technical Requirements for Engineering

```
□ Unique user IDs — no shared accounts
□ Automatic logoff after inactivity
□ Encryption at rest — all ePHI storage
□ Encryption in transit — TLS 1.2+ for all ePHI transmission
□ Audit logs — who accessed what PHI and when
□ Access controls — RBAC, minimum necessary access
□ Emergency access procedure — break-glass access with logging
□ Backup and recovery — regular, encrypted, tested
□ Risk analysis — documented, annual
□ Workforce training — all staff with access to PHI, annually
□ BAA with all business associates
□ Incident response plan — including breach notification process
□ Decommission — secure disposal of PHI-containing media
```

---

## Penalties

| Tier | Violation | Per violation | Annual maximum |
|:-----|:----------|:-------------|:--------------|
| 1 | Did not know | $100–$50,000 | $25,000 |
| 2 | Reasonable cause | $1,000–$50,000 | $100,000 |
| 3 | Willful neglect, corrected | $10,000–$50,000 | $250,000 |
| 4 | Willful neglect, not corrected | $50,000 | $1,500,000 |

Criminal penalties: up to 10 years imprisonment for knowingly obtaining PHI.

Notable fines: Anthem ($16M, 2018), Providence Health ($100M, 2008), Advocate Health ($5.55M, 2016)

---

## HIPAA vs GDPR for Health Data

| Aspect | HIPAA | GDPR (Article 9) |
|:-------|:------|:----------------|
| Jurisdiction | USA | EU |
| Consent model | Opt-out (treatment doesn't require consent) | Opt-in explicit consent for processing |
| Individual rights | Access, amendment, accounting | Access, rectification, erasure, portability |
| Breach notification | 60 days | 72 hours to DPA |
| Penalties | Up to $1.5M/year per violation type | Up to 4% global turnover |

If you serve both US and EU patients — you must comply with both.

---

## Related

- [HL7 FHIR](./02-hl7-fhir.md) — health data interoperability standard
- [GDPR Health Data](./03-gdpr-health-data.md) — EU equivalent
- [Doctor Prescription & Clinical Workflow](../../procedures/domain-workflows/01-doctor-prescription-and-clinical-workflow.md)
