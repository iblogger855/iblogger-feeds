# HL7 FHIR — Fast Healthcare Interoperability Resources

**Jurisdiction:** Global standard  
**Current version:** FHIR R4 (widely adopted), FHIR R5 (2023)  
**Applies to:** Healthcare platforms, EHR/EMR systems, health apps, clinical data exchange  
**Administered by:** HL7 International  
**Tags:** #compliance #fhir #hl7 #healthcare #interoperability #clinical-data

---

## What It Is

FHIR (Fast Healthcare Interoperability Resources) is a standard for exchanging healthcare information electronically. It defines a common data model and RESTful API for clinical and administrative health data — enabling different healthcare systems to share patient information securely and meaningfully.

FHIR is not a regulatory requirement itself, but it is mandated by several regulations (US 21st Century Cures Act, Australian My Health Record) and is the de facto standard for modern healthcare integration.

---

## Core Concepts

### Resources

FHIR organises health data into **Resources** — modular, self-contained data objects. Each resource has a standard JSON/XML representation.

| Resource | Contains |
|:---------|:---------|
| **Patient** | Demographics, identifiers, contact info |
| **Practitioner** | Doctor/nurse identity and qualifications |
| **Encounter** | A clinical interaction (appointment, visit) |
| **Observation** | Vitals, lab results, measurements |
| **Condition** | Diagnoses, problems |
| **MedicationRequest** | Prescriptions |
| **AllergyIntolerance** | Allergies and adverse reactions |
| **DiagnosticReport** | Lab reports, imaging reports |
| **Procedure** | Treatments and procedures performed |
| **Immunization** | Vaccination records |
| **DocumentReference** | Links to clinical documents |
| **Appointment** | Booking and scheduling |
| **Organization** | Hospitals, clinics, health plans |

---

## RESTful API

FHIR uses standard HTTP operations:

```
GET    /Patient/{id}              → Read a specific patient
GET    /Patient?name=Dara         → Search patients by name
POST   /Patient                   → Create a new patient
PUT    /Patient/{id}              → Update a patient
DELETE /Patient/{id}              → Delete (if permitted)
GET    /Patient/{id}/_history     → Version history
```

### FHIR Search Parameters

```
GET /Observation?patient=123&code=29463-7&date=2026-01-01
    ← All weight observations for patient 123 since Jan 1 2026

GET /MedicationRequest?patient=123&status=active
    ← All active prescriptions for patient 123

GET /Appointment?patient=123&date=ge2026-05-01&date=le2026-05-31
    ← All appointments in May 2026
```

---

## FHIR in Practice — Doctolib-style Platform

### Booking to Clinical Data Flow

```
1. Patient books appointment
   → Appointment resource created

2. Patient arrives — vitals taken
   → Observation resources created (blood pressure, weight, temp)
   → Linked to the Encounter resource

3. Doctor diagnoses
   → Condition resource created (ICD-10 code)

4. Doctor prescribes
   → MedicationRequest resource created
   → Linked to Condition and Practitioner

5. Pharmacist dispenses
   → MedicationDispense resource created
   → Linked to MedicationRequest

6. All resources linked via:
   → subject (Patient)
   → encounter (Encounter)
   → performer/requester (Practitioner)
```

---

## Coding Systems Used in FHIR

| Code system | Used for |
|:------------|:---------|
| **ICD-10** | Diagnoses (Condition resource) |
| **SNOMED CT** | Clinical findings, procedures |
| **LOINC** | Lab tests and observations |
| **RxNorm** | Medications (US) |
| **ATC** | Medications (international — WHO) |
| **CPT** | Procedures (US billing) |

---

## SMART on FHIR

SMART on FHIR is a standard for building health apps that plug into EHR systems. It uses OAuth2 for authorisation:

```
App requests access to patient data
  → EHR presents consent screen to patient
  → Patient approves specific data access
  → App receives OAuth2 token scoped to approved resources
  → App calls FHIR API with the token
```

This allows third-party health apps to access patient data from EHRs (like Epic, Cerner) with patient consent — the foundation of health data portability.

---

## Security Requirements for FHIR APIs

```
□ OAuth2 / SMART on FHIR for authentication
□ TLS 1.2+ for all FHIR API traffic
□ Audit logging — log all resource access (AuditEvent resource)
□ Patient consent enforcement — only return consented resources
□ Rate limiting — prevent bulk data extraction
□ Data minimisation in search results
□ Break-glass access for emergencies — with enhanced logging
□ FHIR capability statement — document what your server supports
```

---

## FHIR vs HL7 v2

| Aspect | FHIR | HL7 v2 |
|:-------|:-----|:-------|
| Format | JSON / XML / Turtle | Pipe-delimited text (`MSH|^~\&|...`) |
| API | RESTful HTTP | File transfer / point-to-point messaging |
| Readability | Human-readable | Cryptic for non-specialists |
| Modern use | New implementations | Existing hospital systems (still dominant) |
| Interoperability | Excellent with modern systems | Requires interface engines (Mirth, Rhapsody) |

Most new healthcare platforms use FHIR. Most existing hospital systems still use HL7 v2. Integrating with hospitals often means supporting both.

---

## Related

- [HIPAA](./01-hipaa.md) — US health data protection
- [GDPR Health Data](./03-gdpr-health-data.md) — EU health data protection
- [Doctor Prescription & Clinical Workflow](../../procedures/domain-workflows/01-doctor-prescription-and-clinical-workflow.md)
- [Second Opinion Clinical Workflow](../../procedures/domain-workflows/02-second-opinion-clinical-workflow.md)
