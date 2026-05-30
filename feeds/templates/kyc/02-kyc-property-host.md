# Template: KYC — Property Host (Short-Term Rental)

**Tags:** #template #kyc #kyb #property #host #airbnb #short-term-rental  
**Use When:** Onboarding a host who lists a property on a short-term rental marketplace (Airbnb-style)  
**Read Time:** ~5 min

> This template covers the full KYC/KYB verification for a property host. It handles both individual hosts (renting their own home) and professional hosts (property management companies with multiple listings). It covers identity, property ownership, banking, and tax compliance.

---

## 📌 Sections
- [Blank Template](#blank-template)
- [Filled Example](#filled-example)
- [Host Type Reference](#host-type-reference)

---

## Blank Template

```markdown
# KYC Record — Property Host

**Record ID:**        [KYC-HOST-XXXXXXX]
**Application date:** [YYYY-MM-DD]
**Reviewed by:**      [reviewer name / team]
**Host type:**        [Individual / Professional / Corporate]
**Status:**           [Pending / In Review / Approved / Rejected / Suspended]

---

## 1. Personal Identity (Individual Host)

| Field | Value | Verified? |
|:------|:------|:----------|
| Full legal name | | ☐ |
| Date of birth | | ☐ |
| Nationality | | ☐ |
| National ID / Passport number | | ☐ |
| ID expiry date | | ☐ |
| Current residential address | | ☐ |
| Selfie match (liveness check) | | ☐ |

**Documents submitted:**
- [ ] Government-issued photo ID (front + back)
- [ ] Selfie / liveness check
- [ ] Proof of address (utility bill, bank statement — dated within 90 days)

**Identity verification method:** [Manual / eKYC provider]
**Identity check result:** [Pass / Fail / Review]

---

## 1b. Business Identity (Professional / Corporate Host)

| Field | Value | Verified? |
|:------|:------|:----------|
| Company legal name | | ☐ |
| Company registration number | | ☐ |
| Country of incorporation | | ☐ |
| Registered business address | | ☐ |
| Date of incorporation | | ☐ |
| Ultimate Beneficial Owner (UBO) name | | ☐ |
| UBO ownership % | | ☐ |
| UBO identity verified | | ☐ |
| Authorized signatory name | | ☐ |

**Documents submitted:**
- [ ] Certificate of incorporation
- [ ] Articles of association / company statute
- [ ] UBO declaration form
- [ ] UBO government-issued ID
- [ ] Board resolution authorizing platform account

**KYB verification method:** [Manual / Companies House API / local registry]
**Business check result:** [Registered / Dissolved / Flagged / Not Found]

---

## 2. Property Details

| Field | Value | Verified? |
|:------|:------|:----------|
| Property address (full) | | ☐ |
| Property type | [Apartment / House / Villa / Room / Unique] | ☐ |
| Number of bedrooms | | ☐ |
| Listing type | [Entire place / Private room / Shared room] | ☐ |
| Host is owner or manager? | [Owner / Authorized manager] | ☐ |
| Co-host? (if applicable) | | ☐ |

**Documents submitted (choose applicable):**
- [ ] Property title deed (if owner)
- [ ] Lease agreement + landlord consent letter (if tenant-host)
- [ ] Property management agreement (if managing on behalf of owner)
- [ ] Short-term rental permit (if required in jurisdiction)
- [ ] Building permission / HOA approval (if applicable)

**Property verification method:** [Manual document review / Address verification API]
**Property check result:** [Verified / Unverified / Dispute]

---

## 3. Regulatory Compliance

| Requirement | Applicable? | Document | Expiry |
|:------------|:-----------|:---------|:-------|
| Short-term rental permit | [Yes / No / N/A] | | |
| Tourist accommodation license | [Yes / No / N/A] | | |
| Local council registration | [Yes / No / N/A] | | |
| Tax registration number | [Yes / No / N/A] | | |
| VAT / GST registration | [Yes / No / N/A] | | |
| Health & safety certificate | [Yes / No / N/A] | | |
| Fire safety compliance | [Yes / No / N/A] | | |
| Insurance (liability) | [Yes / No / N/A] | | |

**Jurisdiction:** [City / Country — regulations vary widely]
**Compliance check notes:**
[Any jurisdiction-specific requirements or flags]

---

## 4. Bank / Payout Details

| Field | Value | Verified? |
|:------|:------|:----------|
| Account holder name | | ☐ |
| Bank name | | ☐ |
| Account number / IBAN | | ☐ |
| Routing / SWIFT / BIC | | ☐ |
| Payout currency | | ☐ |
| Account matches host identity? | [Yes / No] | ☐ |

**Payout verification method:** [Micro-deposit / Instant bank verification / Manual]

---

## 5. Tax Information

| Field | Value | Verified? |
|:------|:------|:----------|
| Tax country of residence | | ☐ |
| Tax ID / SSN / TIN | | ☐ |
| W-9 form submitted (US hosts) | [Yes / N/A] | ☐ |
| W-8BEN submitted (non-US on US platform) | [Yes / N/A] | ☐ |
| Local tax form submitted | [Yes / N/A] | ☐ |

**Tax withholding required?** [Yes / No — specify rate if yes]

---

## 6. Sanctions & Background Check

| Check | Result | Source |
|:------|:-------|:-------|
| Sanctions / watchlist screening | [Clear / Match found] | [OFAC / EU / UN] |
| Adverse media check | [Clear / Flag found] | [Media screening tool] |
| PEP (Politically Exposed Person) check | [Not a PEP / PEP identified] | [PEP database] |

---

## 7. Platform Agreement

- [ ] Terms of service accepted
- [ ] Host guarantee policy accepted
- [ ] Cancellation policy selected
- [ ] Guest screening policy acknowledged
- [ ] Tax collection consent given

**Agreement accepted date:** [YYYY-MM-DD]

---

## 8. Verification Decision

**Overall result:** [Approved / Rejected / Pending documents]

**Rejection reasons (if applicable):**
- [ ] Identity mismatch
- [ ] Property not verifiable (no ownership/permission docs)
- [ ] Short-term rental not permitted in jurisdiction
- [ ] Sanctions or PEP match
- [ ] Bank account does not match identity
- [ ] Incomplete submission

**Reviewer notes:** [free text]
**Decision date:** [YYYY-MM-DD]
**Next review date:** [YYYY-MM-DD] (permit/license expiry)
```

---

## Filled Example

```markdown
# KYC Record — Property Host

**Record ID:**        KYC-HOST-0019384
**Application date:** 2026-05-15
**Reviewed by:**      KYC Team — Malis K.
**Host type:**        Individual
**Status:**           Approved

---

## 1. Personal Identity

| Field | Value | Verified? |
|:------|:------|:----------|
| Full legal name | Chanthy Ros | ✅ |
| Date of birth | 1990-11-22 | ✅ |
| Nationality | Cambodian | ✅ |
| National ID number | 001 901122 3040 | ✅ |
| ID expiry date | 2030-11-22 | ✅ |
| Residential address | #12 St 29, Tonle Bassac, Phnom Penh | ✅ |
| Selfie match | Passed — Onfido liveness | ✅ |

**Documents:** National ID (front + back), Onfido liveness, ABA bank statement (April 2026)
**Identity check result:** Pass

---

## 2. Property Details

| Field | Value | Verified? |
|:------|:------|:----------|
| Property address | #7 St 282, BKK1, Phnom Penh 12302 | ✅ |
| Property type | Apartment | ✅ |
| Bedrooms | 2 | ✅ |
| Listing type | Entire place | ✅ |
| Host is | Owner | ✅ |

**Documents:** Property title deed (hard title — Ministry of Land, 2021)
**Property check result:** Verified

---

## 3. Regulatory Compliance

| Requirement | Applicable? | Document | Expiry |
|:------------|:-----------|:---------|:-------|
| Short-term rental permit | N/A (Cambodia — not yet regulated) | — | — |
| Tax registration number | Yes | TIN 9304821 | N/A |
| Property liability insurance | Yes | FORTE-HOM-2026-0091 | 2027-04-30 |

---

## 4. Bank / Payout Details

| Field | Value | Verified? |
|:------|:------|:----------|
| Account holder | Chanthy Ros | ✅ |
| Bank | ABA Bank Cambodia | ✅ |
| Account number | 000-987-654321 | ✅ |
| Payout currency | USD | ✅ |
| Account matches identity | Yes | ✅ |

**Payout verification:** Micro-deposit confirmed 2026-05-16

---

## 5. Tax Information

| Field | Value | Verified? |
|:------|:------|:----------|
| Tax country | Cambodia | ✅ |
| TIN | 9304821 | ✅ |

---

## 6. Sanctions & Background

| Check | Result |
|:------|:-------|
| Sanctions / watchlist | Clear |
| Adverse media | Clear |
| PEP check | Not a PEP |

---

## 7. Platform Agreement

- [x] All agreements accepted 2026-05-14 22:18 UTC
- [x] Tax collection consent given

---

## 8. Decision

**Result:** Approved  
**Decision date:** 2026-05-15  
**Next review:** 2027-04-01 (insurance expiry monitoring)
```

---

## Host Type Reference

| Host Type | Identity Check | Business Check | Property Docs | Extra |
|:----------|:--------------|:---------------|:-------------|:------|
| **Individual owner** | Government ID + liveness | — | Title deed | Tax ID |
| **Tenant host** | Government ID + liveness | — | Lease + landlord consent | Short-term rental permit |
| **Property manager** | Government ID + liveness | — | Management agreement + owner consent | Platform authorization letter |
| **Professional / Company** | Director ID + liveness | KYB: registration + UBO | Title or management agreement | VAT + business license |

---

*Last updated: 2026-05-18*
