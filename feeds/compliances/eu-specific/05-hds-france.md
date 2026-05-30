# HDS — Hébergeur de Données de Santé (France)

**Jurisdiction:** France  
**In force:** Decree of 26 February 2018 (updated 2022)  
**Applies to:** Any organisation that hosts health data on behalf of healthcare providers in France — including cloud providers, SaaS platforms, data centres  
**Administered by:** ANS (Agence du Numérique en Santé)  
**Tags:** #compliance #hds #france #healthcare #health-data #certification

---

## What It Is

HDS (Hébergeur de Données de Santé) is France's mandatory certification for any organisation that **hosts, stores, or processes health data** on behalf of healthcare professionals or institutions. It is not optional — without HDS certification (or hosting with a certified provider), you cannot legally store French patient health data.

HDS goes beyond GDPR Article 9. GDPR defines the rights — HDS defines the **technical and organisational security standards** for hosting.

---

## When HDS Applies

HDS applies when you host **personal health data** (données de santé à caractère personnel) on behalf of:
- Hospitals and clinics
- GPs, specialists, dentists
- Pharmacies
- Medical laboratories
- Healthcare platforms and telemedicine services
- Health insurers (mutuelle, prévoyance)

**Key question:** Are you storing data that identifies a patient AND relates to their health? If yes, you need HDS or must use an HDS-certified provider.

---

## The Six Activities Requiring HDS Certification

The HDS framework defines six hosting activities:

| Activity | Description |
|:---------|:------------|
| **1. Physical infrastructure hosting** | Data centres — physical servers and facilities |
| **2. Infrastructure management** | Virtualisation, computing, storage, network |
| **3. Infrastructure operation** | OS management, patching, monitoring |
| **4. Application hosting** | SaaS/PaaS — hosting the health applications themselves |
| **5. Application maintenance** | Updates, bug fixes, support for hosted apps |
| **6. Data backup** | Backup and recovery services for health data |

You need certification for each activity you perform. A SaaS healthcare platform typically needs activities 4–6 at minimum.

---

## Certification Requirements

HDS certification is based on **ISO 27001** plus additional health-specific requirements:

### Mandatory Standards
- **ISO 27001** — Information Security Management System (ISMS)
- **ISO 27701** — Privacy Information Management (PIMS) — since 2022
- **HDS-specific requirements** — additional controls from the ANS framework

### Key Technical Requirements

```
□ Data encrypted at rest — all patient data
□ Data encrypted in transit — TLS 1.2+
□ Data storage ONLY in France or EEA — no transfer outside without explicit authorisation
□ Access control — strict RBAC, audit trails on all access to health data
□ Physical security — ISO 27001 Annex A physical controls
□ Backup and recovery — tested, documented RTO/RPO
□ Business continuity plan — health-specific scenarios
□ Subcontractor management — subcontractors must also be HDS certified
□ Reversibility — patient data must be exportable when changing provider
□ Incident notification — notify ANS and the healthcare client
□ Audit right — clients have the right to audit the hosting provider
```

### Contractual Requirements

The contract between the hosting provider and the healthcare client (the Data Processing Agreement / contrat d'hébergement) must include:
- Specific service levels for availability
- Security incident notification within defined timeframes
- Data location (always France/EEA)
- Audit rights for the client
- Data portability and reversibility provisions
- Subcontractor disclosure

---

## The Certification Process

```
1. Implement ISO 27001 + ISO 27701 + HDS requirements
2. Internal audit — gap analysis
3. Choose an accredited HDS certification body
   (e.g. BSI, Bureau Veritas, LSTI, EY CertifyPoint)
4. Stage 1 audit — documentation review
5. Stage 2 audit — on-site verification of controls
6. Certification issued — valid 3 years
7. Annual surveillance audits
8. Re-certification at year 3
```

---

## Certified HDS Cloud Providers (Examples)

Major cloud providers with HDS certification:
- **AWS** — certified for activities 1–3, 6 (infrastructure)
- **Microsoft Azure** — certified
- **Google Cloud** — certified
- **OVHcloud** — French provider, all activities
- **Scaleway** — French provider, all activities
- **Outscale** — French provider by Dassault, all activities

If you use AWS/Azure/GCP for infrastructure (activities 1–3), you still need HDS certification for activities 4–6 (application hosting and maintenance) — the IaaS provider's certification doesn't cover your application layer.

---

## Penalties for Non-Compliance

- Criminal: up to **3 years imprisonment** and **€45,000 fine** for individuals
- For organisations: up to **€225,000 fine**
- Healthcare institution can face suspension of activity
- CNIL (data protection authority) may also investigate under GDPR Article 9

---

## HDS vs GDPR

| Aspect | HDS | GDPR Art. 9 |
|:-------|:----|:------------|
| Focus | Technical hosting security | Data subject rights and legal basis |
| Mandatory? | Yes — for health data hosting in France | Yes — for processing EU health data |
| Certification | ISO 27001 + HDS | No specific certification required |
| Enforcement | ANS + criminal law | CNIL + administrative fines |
| Data location | France/EEA required | Transfer rules apply |

---

## What to Build

```
For a healthcare SaaS platform serving French providers:

□ Achieve ISO 27001 certification first
□ Implement ISO 27701 (privacy management)
□ Engage an accredited HDS certification body
□ Document all six hosting activities relevant to your service
□ Implement HDS-specific controls:
    □ Data storage in France/EEA only
    □ End-to-end encryption
    □ Strict access control with audit trails
    □ Reversibility/portability capability
    □ Tested backup and recovery
□ Update contracts with healthcare clients — include all required clauses
□ Audit rights mechanism for clients
□ Subcontractor HDS certification verification
□ Incident notification process for ANS
□ Annual surveillance audit schedule
```

---

## Related

- [GDPR Health Data](../healthcare/03-gdpr-health-data.md)
- [HIPAA](../healthcare/01-hipaa.md) — US equivalent
- [ISO 27001](../security-frameworks/02-iso-27001.md) — prerequisite for HDS
- [Regional: Europe Overview](../regional/07-europe-overview.md)
