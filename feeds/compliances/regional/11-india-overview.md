# India Regional Compliance Overview

**Region:** India  
**Tags:** #compliance #india #dpdp #rbi #sebi #irdai #fintech #healthcare #data-protection

---

## Overview

India's compliance landscape underwent a major transformation in 2023 with the passage of the **Digital Personal Data Protection (DPDP) Act**. Before DPDP, India relied on the Information Technology (Reasonable Security Practices) Rules 2011 (SPDI Rules) under the IT Act 2000. The DPDP Act creates India's first standalone data protection law aligned with GDPR principles.

Additionally, India has a dense financial sector regulatory framework under RBI, SEBI, and IRDAI that applies specifically to fintech and financial services platforms.

---

## DPDP Act — Digital Personal Data Protection Act 2023

**In force:** August 2023 (provisions effective when rules notified by government)  
**Enforced by:** Data Protection Board of India (DPB) — yet to be constituted as of 2024  
**Applies to:** Processing of digital personal data within India, AND processing outside India if it involves offering goods or services to individuals in India

### Key Definitions

| Term | Meaning |
|:-----|:--------|
| Data Principal | The individual whose data is processed |
| Data Fiduciary | Entity that determines purpose and means of processing (= Controller) |
| Data Processor | Entity processing data on behalf of Data Fiduciary |
| Significant Data Fiduciary | Designated by Central Government — higher obligations |
| Consent Manager | Registered entity enabling individuals to manage consent |

### Lawful Bases for Processing

```
1. Consent — freely given, specific, informed, unambiguous
   - Given through Consent Manager platform
   - Request must be in English or any scheduled language
   - Can be withdrawn any time — withdrawal as easy as giving it

2. Legitimate Uses (consent not required):
   □ State (government) functions and public services
   □ Legal obligations
   □ Medical emergency or public health
   □ Disaster or breakdown of law and order
   □ Employer-employee (specific conditions)
   □ Court/tribunal orders
   □ Research, archiving, statistical purposes (with safeguards)
```

### Data Principal Rights

```
□ Right to access — summary of personal data processed and processing activities
□ Right to correction and erasure — where data is inaccurate, incomplete, or outdated
□ Right to nominate — nominate another individual to exercise rights after death
□ Right to grievance redressal — respond within reasonable time
□ Right to withdraw consent — any time
```

### Data Fiduciary Obligations

```
□ Notice — before or at the time of collecting personal data
   Must contain: purpose, goods/services obtained by consent, rights, complaint mechanism
□ Consent — obtain before processing (or establish legitimate use)
□ Data quality — ensure accuracy and completeness
□ Data minimisation — only collect what is necessary for purpose
□ Storage limitation — retain only as long as necessary
□ Security safeguards — reasonable technical and organisational measures
□ Breach notification — Data Protection Board AND each affected Data Principal
   without delay on becoming aware
□ Grievance officer — appoint and publish contact details
□ Children's data — verifiable parental consent for under-18
   Prohibited: tracking, behavioural monitoring of children
   Prohibited: targeted advertising to children
```

### Significant Data Fiduciaries

Designated by Central Government based on:
- Volume and sensitivity of data processed
- Risk to national security or public order
- Potential impact on electoral democracy
- Security of the State

```
Additional obligations for SDFs:
□ Appoint Data Protection Officer — based in India
□ Appoint independent data auditor
□ Conduct periodic DPIAs
□ Periodic audits by data auditor
□ Other measures as may be prescribed by Central Government
```

### Cross-Border Data Transfers

```
□ Transfer allowed to countries NOT on a government-issued blacklist
□ Central Government may restrict transfer to specific countries
□ No explicit adequacy decision mechanism (unlike GDPR)
□ Sector-specific localisation requirements still apply:
   - Payment data (RBI) — localisation required
   - Health data — localisation in practice for some categories
   - Critical infrastructure data — national security basis restrictions
```

### Penalties

| Violation | Maximum |
|:----------|:--------|
| Breach of security safeguards | ₹250 Cr (≈ $30M) |
| Breach of children's data obligations | ₹200 Cr (≈ $24M) |
| Failure to notify breach | ₹200 Cr |
| Non-compliance with DPB directions | ₹150 Cr |
| Other violations | ₹50 Cr |

---

## RBI — Reserve Bank of India

The RBI is the primary regulator for banks, payment systems, and fintech in India.

### Key RBI Frameworks

#### Payment Aggregators and Payment Gateways (RBI Circular 2020)

```
Payment Aggregators (PAs) — facilitate online payments between buyer and seller:

□ RBI authorisation mandatory — existing players by 2021; new by application
□ Minimum net worth: ₹25 Cr on application, ₹100 Cr by March 2023
□ Escrow account — merchant settlements must flow through escrow at scheduled bank
□ KYC — mandatory merchant onboarding due diligence
□ Data Storage — no card data storage at merchants; PA may store subject to PCI-DSS
□ Prohibited: sharing payment data with third parties without explicit customer consent
□ Chargeback mechanism — defined dispute resolution
□ Audit — annual system audit and cyber security audit
□ Grievance redressal — dedicated mechanism with timelines
```

#### Payment Data Localisation

```
CRITICAL: RBI mandates payment data stored ONLY in India.

Applies to: All payment system operators and payment service providers

Scope: ALL data related to payment systems end-to-end
       (data collected, processed, and stored by payment operators)

What must be stored in India:
□ Full end-to-end transaction details
□ Customer and payment data
□ What's in the payment message (sender/receiver details, amount, etc.)

Permitted for processing outside India ONLY IF:
□ Data is brought back to India within the business day
□ Only foreign leg of a transaction can be stored abroad
□ Even then — a copy of the domestic component must be in India
```

#### Prepaid Payment Instruments (PPI)

```
□ Small PPIs (up to ₹10,000): minimum KYC — mobile + self-declaration
□ Full-KYC PPIs (up to ₹2L): Aadhaar + officially valid document
□ Issuers: banks OR non-bank entities (separate authorisation)
□ Interoperability: full-KYC PPIs must be interoperable
```

#### Account Aggregator Framework (NBFC-AA)

```
Account Aggregators — regulated entities enabling data sharing:
□ Data Fiduciary/Provider (FIP) — entities holding user's financial data
□ Data Consumer (FIU) — entities receiving user's data with consent
□ AA — intermediary routing consented data flows

Technical:
□ SAHAMATI network — technical standards
□ Financial Information network (FIN) — standardised APIs
□ Consent artefact — digitally signed, time-bound, granular
□ No data storage by AA — only routing
```

### UPI — Unified Payments Interface Compliance

```
For apps integrating UPI (through NPCI's Third Party Application Provider framework):
□ TPAP agreement with NPCI
□ Full KYC for registered users
□ Aadhaar-based verification recommended
□ UPI lite — limited KYC for small transactions (≤₹500)
□ Transaction limits: per-TPAP limits set by NPCI
□ Dispute resolution: UPI ecosystem grievance mechanism
```

---

## SEBI — Securities and Exchange Board of India

For investment platforms, stock brokers, mutual fund distributors, and WealthTech:

### Key SEBI Requirements

```
□ SEBI registration — relevant category (broker, IA, RIA, distributor)
□ KYC — SEBI KYC Registration Agency (KRA) system
□ CKYC — Central KYC — submit to CKYCR
□ In-Person Verification (IPV) — required for opening accounts
□ PAN — mandatory for all market transactions
□ Risk profiling — for investment advisors
□ Algo trading — SEBI approval for algorithmic trading systems
□ Cybersecurity and cyber resilience framework — for market infrastructure
□ Investor Grievance Redressal — SCORES portal integration
```

### RIA — Registered Investment Advisors

```
□ SEBI RIA registration
□ Minimum networth: ₹50L (individual) / ₹150L (non-individual)
□ Fee-only: cannot take commission AND fees simultaneously
□ Risk suitability assessment mandatory
□ Advice documentation — rationale for each recommendation
□ Annual compliance audit
```

---

## IRDAI — Insurance Regulatory and Development Authority of India

For InsurTech platforms:

```
Key requirements:
□ Licence: Insurance Broker, Insurance Marketing Firm, or Aggregator
□ PolicyHolder Protection Guidelines — disclosure, grievance, claim settlement SLAs
□ Data: policyholder data governed by IRDAI Data Security Guidelines
□ Aadhaar: permitted for KYC in insurance (UIDAI-authorised)
□ Digital insurance: Electronic Insurance Account (eIA) for holding policies
```

---

## TRAI — Telecom Regulatory Authority of India

For platforms using SMS, voice calls, or UPI payments:

```
□ DLT registration — Distributed Ledger Technology for SMS
   All businesses sending commercial SMS must register entity, headers, templates on DLT
□ Consent Framework — TCCCPR 2018 — explicit opt-in for promotional messages
□ DO NOT DISTURB (DND) registry — must be checked before sending promotional SMS
□ OTP messages — transactional; no DND restriction but DLT registration required
```

---

## Healthcare Compliance

India lacks a comprehensive digital health data law, but guidance comes from:

### DISHA — Digital Information Security in Healthcare Act (Draft)

Proposed (not yet enacted as of 2024):
- Defines clinical establishment rights and patient rights over health data
- Proposes National Digital Health Authority as regulator
- Storage and processing standards for digital health records

### ABDM — Ayushman Bharat Digital Mission

```
For health platforms integrating with India's national health ecosystem:
□ ABDM compliance required for Health ID (ABHA) integration
□ Health Data Management Policy — ABDM participants must follow
□ Health Information Provider (HIP) and Health Information User (HIU) roles
□ Patient consent required for each health data share
□ FHIR R4 API standards — for health record exchange
□ PHR App standards — for patient-facing health record apps
```

---

## Aadhaar — Unique Identification Authority of India

```
Aadhaar (12-digit biometric ID) is widely used for KYC but governed by:
□ Aadhaar Act 2016 + Supreme Court 2018 judgment restrictions

Who can authenticate via Aadhaar:
□ Government entities — direct use permitted
□ Banks and telecom — permitted under Section 57 Aadhaar Act
□ Private entities (non-bank/telecom) — CANNOT use Aadhaar-OTP or biometric for KYC
  → Must use non-Aadhaar documents (PAN, passport, voter ID, driving licence)
  → OR use CKYC (Central KYC) which uses already-verified Aadhaar from bank KYC

Alternative for private entities:
□ DigiLocker — access government-issued documents with user consent
□ CKYC — access pre-verified KYC from KRA
□ Video-KYC (V-KYC) — SEBI/RBI approved alternative
```

---

## India Compliance Stack by Platform Type

### Fintech / Payment Platform

```
□ PA/PG authorisation (if aggregating payments) — RBI
□ PPI licence (if issuing wallets) — RBI
□ Payment data localisation — all data in India
□ UPI TPAP agreement — if UPI integration
□ DPDP Act — data protection framework
□ DLT registration — for any SMS communication
□ PCI-DSS — for card payment processing
□ AML/CFT — FIU-IND reporting obligation
□ State-by-state money lending licence — if lending features
```

### InvestTech / WealthTech

```
□ SEBI registration — broker, RIA, or distributor
□ CKYC integration — KRA network
□ SCORES integration — investor grievance
□ DPDP Act — data protection
□ RBI (if banking/payment features) — as above
```

### HealthTech

```
□ DPDP Act — sensitive health data category
□ ABDM compliance — if ABHA integration
□ DISHA (when enacted) — digital health data security
□ MoHFW guidelines — clinical establishment rules
□ State medical council rules — telemedicine regulations
```

---

## Related

- [GDPR](../data-privacy/01-gdpr.md) — global baseline; DPDP is influenced by GDPR
- [PDPA Thailand](./02-thailand-overview.md) — similar architecture
- [PCI-DSS](../payment-and-financial/01-pci-dss.md)
- [AML/CFT](../payment-and-financial/03-aml-cft.md)
- [KYC/KYB](../identity-and-kyc/01-kyc-kyb.md)
- [HL7 FHIR](../healthcare/02-hl7-fhir.md) — ABDM uses FHIR R4
