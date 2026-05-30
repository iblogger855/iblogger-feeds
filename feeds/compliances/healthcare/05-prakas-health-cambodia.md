# Healthcare Regulations in Cambodia — MOH Prakas and Key Laws

**Jurisdiction:** Kingdom of Cambodia  
**Applies to:** Hospitals, clinics, healthcare platforms, telemedicine services, pharmacies operating in Cambodia  
**Administered by:** Ministry of Health (MOH), National Committee for Health, relevant provincial health departments  
**Tags:** #compliance #cambodia #healthcare #moh #prakas #telemedicine #pharmacy

---

## Regulatory Framework Overview

Cambodia's healthcare sector is regulated through a combination of laws, sub-decrees, and Prakas (ministerial orders/regulations) issued by the MOH. The primary laws:

- **Law on the Management of Private Healthcare Services (2000)** — governs private hospitals, clinics, and health workers
- **Law on Pharmaceuticals (2014)** — governs medicine manufacturing, import, distribution, and dispensing
- **Sub-Decree on Medical Devices** — device registration and use
- **Prakas on Telemedicine** — digital health consultations
- **Prakas on Electronic Prescriptions** — digital prescribing rules

---

## Licensing Requirements

| Service | Licence required from |
|:--------|:---------------------|
| Private hospital | MOH + Provincial Health Department |
| Private clinic | Provincial Health Department |
| Medical laboratory | MOH Laboratory Department |
| Pharmacy | MOH Department of Drugs and Food (DDF) |
| Telemedicine platform | MOH (emerging — Prakas being developed) |
| Medical device importer | MOH |

Healthcare platforms must either obtain the relevant licence or partner with a licensed healthcare provider.

---

## Doctor Registration

All doctors practicing in Cambodia must be registered with the:
- **Cambodian Medical Council (CMC)** — the professional body for medical practitioners
- Registration number must appear on all prescriptions and medical documents
- Annual renewal required
- Foreign doctors require special authorisation from MOH and CMC

**For digital health platforms:** Verify CMC registration of all doctors before they can see patients. The CMC maintains a public registry.

---

## Telemedicine Regulations

Cambodia's MOH has been developing a formal telemedicine framework (as of 2024-2025, Prakas in development). Current guidance:

- Telemedicine consultations are permitted as a supplement to (not replacement for) in-person care
- Emergency conditions must be referred to physical facilities
- Prescriptions from telemedicine consultations must comply with pharmaceutical law
- Patient consent required for telemedicine sessions
- Records of telemedicine consultations must be maintained

---

## Electronic Prescription (RCP) Requirements

For platforms issuing electronic prescriptions:

| Requirement | Detail |
|:------------|:-------|
| **Doctor identification** | CMC registration number must appear on prescription |
| **Prescription format** | Must include patient name, DOB, diagnosis, drug name, dosage, quantity, instructions |
| **Digital signature** | Doctor's electronic signature or equivalent |
| **Unique reference number** | Prescription must have a traceable reference (e.g. RCP number) |
| **Pharmacist verification** | Pharmacist must verify prescription authenticity before dispensing |
| **Retention** | Prescription records must be retained for minimum 5 years |

---

## Pharmacy Regulations

Under the Law on Pharmaceuticals:
- Only licensed pharmacies may dispense prescription medications
- Prescription drugs require a valid prescription from a registered doctor
- Pharmacies must maintain dispensing records
- Controlled substances (opioids, psychotropics) have additional reporting requirements to the DDF
- Drug import and distribution requires DDF registration

---

## Traditional Medicine

Cambodia has a significant traditional medicine sector:
- Traditional healers (Kru Khmer) are registered separately under MOH
- Herbal medicines require registration with DDF
- Digital platforms must clearly differentiate between evidence-based medicine and traditional medicine

---

## Patient Data — Cambodia Context

Until the PDPK is enacted, patient health data is governed by:
- Professional ethics obligations (CMC code of conduct for doctors)
- MOH guidelines on patient confidentiality
- General civil liability for breach of confidentiality
- The forthcoming PDPK will add formal data protection rights

**Current practice:** Implement GDPR-equivalent health data protections. This exceeds current requirements and will meet the forthcoming PDPK.

---

## Health Data Localisation

MOH guidelines indicate that:
- Patient health records should be accessible to the patient and treating providers
- Records should be maintained in a format accessible within Cambodia
- Cloud storage for health data: MOH has not published formal guidance, but data sovereignty concerns exist

---

## What to Build for Cambodia Healthcare Platform

```
□ Partner with or hire CMC-registered doctors only
□ Verify CMC registration at onboarding — check public registry
□ MOH/Provincial licence or partnership with licensed facility
□ DDF-compliant pharmacy partnerships for prescription fulfilment
□ RCP number system for all electronic prescriptions
□ Doctor digital signature on all prescriptions
□ 5-year retention for all clinical records
□ Patient consent for telemedicine consultations
□ Clear referral pathway for emergencies
□ Separate consent for research use of anonymised data
□ Monitor MOH Prakas announcements for telemedicine framework
□ GDPR-equivalent data protection as best practice
```

---

## Related

- [GDPR Health Data](./03-gdpr-health-data.md) — best practice to implement now
- [HIPAA](./01-hipaa.md) — US reference standard
- [HL7 FHIR](./02-hl7-fhir.md) — clinical data interoperability
- [Doctor Prescription & Clinical Workflow](../../procedures/domain-workflows/01-doctor-prescription-and-clinical-workflow.md)
- [NBC Cambodia](../payment-and-financial/05-nbc-cambodia.md)
- [Regional: Cambodia Overview](../regional/01-cambodia-overview.md)
