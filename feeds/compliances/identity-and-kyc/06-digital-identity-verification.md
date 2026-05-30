# Digital Identity Verification — Technical Standards

**Tags:** #compliance #kyc #identity #liveness #ocr #biometrics #verification

---

## What It Is

Digital identity verification is the technical process of confirming that a person is who they claim to be — using digital means rather than physical presence. It combines document authentication, biometric matching, and liveness detection.

---

## The Three Pillars

### 1. Document Authentication
Verify that the identity document is genuine and unaltered.

| Check | What it detects |
|:------|:--------------|
| **MRZ (Machine Readable Zone) validation** | Checks the bottom two lines of a passport for consistency |
| **Visual inspection (AI)** | Security features, hologram patterns, font consistency |
| **Chip reading (NFC)** | For biometric passports — reads the chip directly |
| **Barcode / QR scan** | For some national IDs |
| **Database lookup** | Checking against government identity registries (where available) |
| **Fraud pattern detection** | Known document forgery patterns |

### 2. Biometric Matching
Match the person presenting the document to the photo in the document.

| Method | Accuracy | Notes |
|:-------|:---------|:------|
| **Facial recognition** | 99%+ (modern models) | Selfie vs ID photo |
| **1:1 matching** | High | Selfie matches this specific ID photo |
| **1:N matching** | High at scale | Checks against a database (less common in KYC) |

### 3. Liveness Detection
Prevent spoofing with photos, videos, or masks.

| Type | Method |
|:-----|:-------|
| **Passive liveness** | AI analysis of a single image — no user interaction required |
| **Active liveness** | User performs an action (turn head, blink, smile) |
| **Video liveness** | Short video clip processed for liveness signals |
| **3D liveness** | Depth sensors (Face ID type) — highest security |

---

## NIST Face Recognition Vendor Test (FRVT)

NIST runs ongoing evaluations of face recognition algorithms. For high-assurance KYC (financial services, healthcare), use providers with strong FRVT scores. Top performers consistently include: Idemia, NEC, Cognitec, Daon.

---

## Identity Assurance Levels (NIST SP 800-63)

| Level | Name | Verification strength |
|:------|:-----|:---------------------|
| **IAL1** | Self-asserted | No identity proofing — user provides their own info |
| **IAL2** | Remote identity proofing | Document + selfie + liveness — done remotely |
| **IAL3** | In-person | Physical presence or supervised remote with operator |

Most KYC use cases require **IAL2** minimum. High-value financial services may require IAL3.

---

## eKYC (Electronic KYC)

eKYC is the fully digital end-to-end process:

```
User captures ID document photo (or NFC scan)
        │
        ▼
Document authentication — is the document genuine?
        │
        ▼
Data extraction (OCR) — extract name, DOB, ID number
        │
        ▼
Database verification (where available) — check against registry
        │
        ▼
Selfie capture
        │
        ▼
Liveness check — is this a real person?
        │
        ▼
Biometric match — does the selfie match the ID photo?
        │
        ▼
Risk scoring — device fingerprint, IP, velocity checks
        │
        ▼
Decision: PASS / FAIL / REFER FOR MANUAL REVIEW
```

---

## Common Failure Reasons and User Experience

| Failure | Message to show user |
|:--------|:--------------------|
| Blurry document photo | "Your ID photo is blurry. Please retake it in better lighting." |
| Glare on document | "There's glare on your ID. Move away from direct light and retake." |
| ID expired | "Your ID has expired. Please use a valid document." |
| Face not matching | "We couldn't match your selfie to your ID. Please retake both in good lighting." |
| Liveness failed | "Please follow the instructions and look directly at the camera." |
| Document not supported | "This document type is not accepted in your country. Please use [alternatives]." |

---

## Document Coverage by Country

Different countries have different supported documents. Ensure your verification provider has coverage for your target markets:

| Country | Accepted documents |
|:--------|:------------------|
| Cambodia | National ID (new biometric), Passport |
| Thailand | National ID (CID), Passport, Driver's licence |
| Singapore | NRIC, Passport, Employment Pass |
| Vietnam | CCCD (Chip ID), Passport |
| Indonesia | KTP (National ID), Passport |

---

## Vendor Selection Criteria

| Criterion | What to check |
|:----------|:-------------|
| **Document coverage** | Does it support your target countries' documents? |
| **Fraud detection rate** | What is the false acceptance rate (FAR)? |
| **Liveness level** | Passive vs active — what's required for your risk level? |
| **GDPR/data privacy** | Where is data stored? What is the retention policy? |
| **API quality** | SDK vs API? Mobile SDK quality? |
| **SLA** | What is the processing time SLA? |
| **Price** | Per-verification pricing — volume discounts? |
| **Audit trail** | Can you export verification records for compliance? |

---

## Related

- [KYC/KYB Fundamentals](./01-kyc-kyb-fundamentals.md)
- [eIDAS](./05-eidas.md) — EU digital identity framework
- [File Upload & Validation Pipeline](../../procedures/compliance-and-accounts/02-file-upload-validation-pipeline.md) — technical file handling for KYC documents
- [KYC Provider Verification Procedure](../../procedures/compliance-and-accounts/kyc/01-kyc-provider-verification.md)
