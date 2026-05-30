# GDPR — General Data Protection Regulation

**Jurisdiction:** European Union  
**In force:** 25 May 2018  
**Applies to:** Any organisation that processes personal data of EU residents — regardless of where the organisation is based  
**Tags:** #compliance #gdpr #data-privacy #eu #personal-data

---

## What It Is

GDPR is the EU's comprehensive data protection law. It gives EU residents ("data subjects") rights over their personal data and requires organisations that process that data ("data controllers" and "data processors") to handle it lawfully, transparently, and securely.

If your platform has even one EU user, GDPR applies to you.

---

## Key Definitions

| Term | Meaning |
|:-----|:--------|
| **Personal data** | Any information that can identify a person — name, email, IP address, device ID, location, health data |
| **Data subject** | The individual whose data is being processed (your user) |
| **Data controller** | The entity that decides why and how data is processed (your company) |
| **Data processor** | An entity that processes data on behalf of the controller (your cloud provider, analytics vendor) |
| **Processing** | Any operation on data — collecting, storing, reading, sending, deleting |
| **Special category data** | Sensitive data: health, biometrics, religion, race, political opinions, sexual orientation |

---

## The 7 Principles (Article 5)

| Principle | What It Means in Practice |
|:----------|:--------------------------|
| **Lawfulness, fairness, transparency** | Have a legal basis for processing; tell users what you do with their data |
| **Purpose limitation** | Only use data for the purpose you collected it for |
| **Data minimisation** | Collect only what you actually need |
| **Accuracy** | Keep data up to date; let users correct it |
| **Storage limitation** | Don't keep data longer than necessary |
| **Integrity and confidentiality** | Secure it against loss, theft, and unauthorised access |
| **Accountability** | Be able to demonstrate compliance |

---

## Legal Bases for Processing (Article 6)

You must have one of these to process personal data:

| Basis | When to use |
|:------|:------------|
| **Consent** | User gave explicit, informed, freely given consent |
| **Contract** | Processing is necessary to fulfil a contract with the user |
| **Legal obligation** | You are legally required to process (e.g. AML reporting) |
| **Vital interests** | Life-or-death emergency |
| **Public task** | Government or public authority function |
| **Legitimate interests** | Your business interest, provided it doesn't override user rights |

**Consent rules:** Must be specific, informed, freely given, and unambiguous. Pre-ticked boxes are not valid consent. Users must be able to withdraw consent as easily as they gave it.

---

## User Rights

| Right | What the user can demand | Your obligation |
|:------|:------------------------|:----------------|
| **Access** (Art. 15) | A copy of all data you hold about them | Provide within 30 days |
| **Rectification** (Art. 16) | Correction of inaccurate data | Correct within 30 days |
| **Erasure** (Art. 17) | Deletion of their data ("right to be forgotten") | Delete within 30 days (with legal retention exceptions) |
| **Restriction** (Art. 18) | Stop processing while they dispute accuracy | Pause processing |
| **Portability** (Art. 20) | Their data in a machine-readable format | Export within 30 days |
| **Object** (Art. 21) | Stop processing for direct marketing or legitimate interests | Stop immediately for marketing |
| **No automated decisions** (Art. 22) | Not be subject to decisions made solely by algorithms with significant effects | Provide human review |

---

## Technical Requirements for Engineers

### Data at Rest
- Encrypt databases and file storage (AES-256)
- Encrypt backups
- Use database-level encryption where possible (Transparent Data Encryption)

### Data in Transit
- TLS 1.2 minimum, TLS 1.3 preferred — for all connections
- No personal data in URLs (e.g. no email in query params)
- No personal data in logs

### Access Control
- Role-based access — only staff who need the data can access it
- Audit logs on all access to personal data tables
- MFA for admin access to production systems

### Data Breach Notification (Article 33/34)
- Notify supervisory authority within **72 hours** of discovering a breach
- Notify affected users if the breach is "likely to result in a high risk" to their rights

### Data Protection by Design and Default (Article 25)
- Collect the minimum data necessary
- Default settings must be the most privacy-protective option
- Privacy impact assessments (DPIA) for high-risk processing

### Data Retention
- Define and enforce retention periods for every data category
- Auto-delete or anonymise after the retention period expires
- Document your retention policy

### Third-Party Processors
- Sign a Data Processing Agreement (DPA) with every vendor that processes EU personal data
- Ensure they are GDPR-compliant (e.g. AWS, Google Cloud, Stripe all publish DPAs)

---

## Penalties

| Tier | Maximum fine | Examples |
|:-----|:------------|:---------|
| **Lower tier** | €10M or 2% of global annual turnover | Failure to keep records, no DPA with processors |
| **Upper tier** | €20M or 4% of global annual turnover | Breach of data subject rights, unlawful processing, no legal basis |

Notable fines: Meta (€1.2B, 2023), Amazon (€746M, 2021), WhatsApp (€225M, 2021)

---

## What to Build

```
Minimum GDPR implementation for a web platform:

□ Privacy policy — plain language, all data categories listed
□ Cookie consent banner — granular, no pre-ticked boxes
□ Consent management — store what users consented to and when
□ Data subject request flow — user can request access/deletion in-app
□ Deletion pipeline — actually deletes/anonymises across all systems
□ Retention policy — automated expiry per data category
□ Audit log — who accessed what personal data and when
□ DPAs signed — with every cloud vendor and third-party processor
□ Breach response plan — 72-hour notification capability
□ DPIA process — for new high-risk processing activities
```

---

## Related

- [Account Deletion & Data Retention Procedure](../../procedures/compliance-and-accounts/01-account-deletion-and-data-retention.md)
- [CCPA](./02-ccpa.md) — California equivalent
- [PDPA Thailand](./04-pdpa-thailand.md) — Southeast Asia equivalent
- [GDPR Health Data](../healthcare/03-gdpr-health-data.md) — special rules for health data
