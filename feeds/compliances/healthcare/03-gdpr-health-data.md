# GDPR Article 9 — Special Category Health Data

**Jurisdiction:** European Union  
**Applies to:** Any organisation processing health data of EU residents  
**Tags:** #compliance #gdpr #healthcare #health-data #special-category #eu

---

## What It Is

Under GDPR, health data is a **special category** of personal data (Article 9) — it receives the highest level of protection because of its sensitivity. Processing it is **prohibited by default** unless a specific Article 9 exception applies.

This is the GDPR chapter most relevant to healthcare platforms, fitness apps, mental health services, and any platform that collects medical information.

---

## What Counts as Health Data

Health data includes any information relating to the physical or mental health of a person that reveals information about their health status:

- Medical records, diagnoses, prescriptions
- Test results, medical imaging
- Fitness data that reveals health condition (heart rate, sleep patterns)
- Biometric data processed for health purposes
- Mental health assessments, therapy notes
- Disability information
- Health insurance information
- Genetic data
- Information about past, present, or future physical or mental conditions

---

## Article 9 Exceptions — When Health Data Can Be Processed

Processing special category health data is only lawful if you meet one of these exceptions **AND** have a valid Article 6 legal basis:

| Exception | Typical use case |
|:----------|:----------------|
| **Explicit consent** (Art. 9.2a) | User explicitly consents to processing of their health data |
| **Employment / social security** (Art. 9.2b) | Occupational health, employee disability |
| **Vital interests** (Art. 9.2c) | Life-threatening emergency |
| **Public interest in public health** (Art. 9.2i) | Pandemic surveillance, food safety |
| **Preventive or occupational medicine** (Art. 9.2h) | Medical diagnosis, treatment, management |
| **Research and statistics** (Art. 9.2j) | Scientific research with safeguards |
| **Legal claims** (Art. 9.2f) | Litigation, legal defence |

**Most healthcare platforms use:** Art. 9.2h (healthcare provision) for treatment data, and Art. 9.2a (explicit consent) for everything beyond direct treatment.

---

## Key Obligations for Health Data

### Higher Consent Standard
Consent for health data must be:
- **Explicit** (not just "freely given, informed" — but actively and clearly stated)
- **Granular** — separate consent for each distinct processing purpose
- **Withdrawable** — as easy to withdraw as to give
- Documented — record what was consented to, by whom, and when

### Data Protection Impact Assessment (DPIA) — Mandatory
Processing health data at scale **always** requires a DPIA:
- Identify and assess the risks to data subjects
- Implement measures to mitigate those risks
- Consult the supervisory authority if high residual risk remains

### Data Protection Officer (DPO) — Required
Organisations processing health data at large scale must appoint a DPO.

### Pseudonymisation and Anonymisation
- **Pseudonymisation** (replacing identifying info with a code) reduces risk but data is still personal
- **Anonymisation** (irreversibly removing all identifiers) takes data outside GDPR scope
- Use pseudonymisation for research datasets; full anonymisation for analytics

### Access Controls
- Strict need-to-know — only treating clinicians should access patient records
- No broad internal access to health data
- Audit trail on all access

### Retention — Strictly Necessary
- Define retention periods for every health data category
- Clinical records: typically 10+ years (medical necessity, legal retention)
- Administrative health data: shorter retention
- Research data: anonymise when personal data is no longer needed

---

## Research Exception (Art. 9.2j)

Health data may be processed for scientific research with:
- Pseudonymisation where possible
- Ethics board approval
- Data sharing agreements
- Participant consent or derogation where consent is not possible

---

## Cross-Border Transfer of Health Data

Health data faces the same GDPR cross-border transfer restrictions as all personal data — but:
- Supervisory authorities take a stricter view of health data transfers
- Standard Contractual Clauses (SCCs) are required for transfers outside EEA
- Additional technical safeguards (encryption, access controls) expected

---

## Practical Checklist

```
For a healthcare platform processing EU patient data:

□ Map all health data — what is collected, where stored, why
□ Identify Article 9 exception for each processing purpose
□ Obtain explicit consent for non-treatment purposes
□ Conduct DPIA — document and mitigate risks
□ Appoint DPO (if required by scale)
□ Implement strict access controls — RBAC, audit logs
□ Encryption at rest and in transit — all health data
□ Retention policy — per data category
□ Erasure procedure — including clinical record legal hold check
□ Patient rights mechanism — access, portability, erasure requests
□ Processor agreements — with all health IT vendors
□ Pseudonymise research datasets
□ 72-hour breach notification capability
□ Staff training on health data handling
```

---

## Related

- [GDPR](../data-privacy/01-gdpr.md) — the parent regulation
- [HIPAA](./01-hipaa.md) — US equivalent
- [HL7 FHIR](./02-hl7-fhir.md) — health data exchange standard
- [Account Deletion & Data Retention](../../procedures/compliance-and-accounts/01-account-deletion-and-data-retention.md)
