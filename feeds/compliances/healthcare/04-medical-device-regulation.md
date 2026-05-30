# Medical Device Regulation — SaMD, MDR, FDA 21 CFR Part 11

**Tags:** #compliance #mdr #samd #fda #medical-device #healthcare #software

---

## What It Is

Software that qualifies as a **Medical Device** is subject to regulatory oversight separate from general health data privacy laws. The key question: does your software make or support clinical decisions that affect patient health?

---

## Software as a Medical Device (SaMD)

The International Medical Device Regulators Forum (IMDRF) defines SaMD as:
> Software intended to be used for one or more medical purposes that perform these purposes without being part of a hardware medical device.

### Examples of SaMD

| Software | SaMD? |
|:---------|:------|
| AI diagnosing diabetic retinopathy from retinal images | Yes |
| Algorithm detecting atrial fibrillation from ECG | Yes |
| Software that calculates drug dosage based on weight and diagnosis | Yes |
| EHR that stores and displays patient records (no clinical decision support) | Generally No |
| General wellness app that tracks steps | No |
| Blood glucose monitoring software on a glucometer | Yes (combined hardware+software device) |

---

## EU Medical Device Regulation (MDR 2017/745)

In force since May 2021 (replaced MDD 93/42/EEC).

### Risk Classification

| Class | Risk | Example SaMD |
|:------|:-----|:-------------|
| **Class I** | Low | Administrative software with indirect clinical use |
| **Class IIa** | Medium-low | Diagnostic decision support for non-serious conditions |
| **Class IIb** | Medium-high | Diagnostic software for serious conditions |
| **Class III** | High | Software for life-sustaining devices, implants |

### Key Requirements
- **Clinical evaluation** — evidence that the device achieves its intended purpose
- **Quality Management System (QMS)** — ISO 13485 certification
- **Technical documentation** — design, testing, risk management (ISO 14971)
- **CE marking** — required to sell in EU
- **Post-market surveillance** — ongoing safety monitoring
- **Unique Device Identification (UDI)** — device identification system
- **Notified Body** — independent assessment required for Class IIa and above

---

## FDA — 21 CFR Part 11 (Electronic Records)

FDA 21 CFR Part 11 applies to electronic records and electronic signatures used in FDA-regulated activities (clinical trials, pharmaceutical manufacturing, medical device testing).

### Requirements
- **Audit trails** — for all electronic record creation, modification, and deletion
- **Electronic signature controls** — linked to their respective records
- **System validation** — documented evidence that the system does what it's supposed to do
- **Access controls** — unique user IDs, passwords
- **Record retention** — electronic records must be accessible throughout the required retention period

### FDA SaMD Guidance (2019)
FDA published guidance on regulating AI/ML-based SaMD — introducing the concept of a **Predetermined Change Control Plan (PCCP)** to allow continuous improvement of AI algorithms while maintaining regulatory oversight.

---

## IMDRF SaMD Framework

IMDRF's risk-based framework for SaMD considers two dimensions:

1. **Significance of information** to healthcare decision:
   - Treat or diagnose
   - Drive clinical management
   - Inform clinical management

2. **State of healthcare situation**:
   - Critical (immediately life-threatening)
   - Serious
   - Non-serious

The intersection of these determines the risk category.

---

## Cambodia — SaMD Context

Cambodia's Ministry of Health (MOH) regulates medical devices under:
- **Sub-Decree on Medical Devices** — requires registration for devices used in Cambodia
- For software: classification follows ASEAN Medical Device Directive (AMDD) guidance
- Healthcare platforms in Cambodia using AI for clinical support should consult the MOH

---

## When Does Your Platform Need to Consider This?

```
DEFINITELY SaMD (requires regulatory review):
  □ Your AI suggests or makes diagnostic decisions
  □ Your software calculates medication doses
  □ Your software analyses medical images
  □ Your software predicts clinical deterioration

POSSIBLY SaMD (legal opinion required):
  □ Your software provides clinical decision support
  □ Your software risk-stratifies patients
  □ Your software analyses wearable health data for clinical use

NOT SaMD:
  □ Appointment booking
  □ Administrative record keeping
  □ General wellness tracking
  □ Telemedicine video (the communication tool, not the diagnostic software)
```

---

## Practical Steps If Your Software May Be SaMD

1. **Determine intended purpose** — document exactly what clinical function it performs
2. **Risk classification** — use IMDRF and your target jurisdiction's framework
3. **Regulatory consultation** — engage with FDA (US) or Notified Body (EU) early
4. **Quality Management System** — implement ISO 13485
5. **Clinical evaluation** — gather evidence of efficacy and safety
6. **Technical documentation** — complete risk management (ISO 14971)

---

## Related

- [HIPAA](./01-hipaa.md)
- [GDPR Health Data](./03-gdpr-health-data.md)
- [HL7 FHIR](./02-hl7-fhir.md)
- [Doctor Prescription & Clinical Workflow](../../procedures/domain-workflows/01-doctor-prescription-and-clinical-workflow.md)
