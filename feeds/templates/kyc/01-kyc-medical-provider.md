# Template: KYC — Medical Provider (Doctor / Clinician)

**Tags:** #template #kyc #kyb #healthcare #doctor #provider-verification  
**Use When:** Onboarding a doctor, nurse, therapist, or clinician onto a healthcare platform (Doctolib-style)  
**Read Time:** ~5 min

> This template covers the full KYC/KYB verification checklist for a licensed medical professional joining a platform where patients can discover, book, and pay them. It covers identity verification, license validation, practice details, and malpractice coverage.

---

## 📌 Sections
- [Blank Template](#blank-template)
- [Filled Example](#filled-example)
- [Verification Status Reference](#verification-status-reference)

---

## Blank Template

```markdown
# KYC Record — Medical Provider

**Record ID:**        [KYC-MED-XXXXXXX]
**Application date:** [YYYY-MM-DD]
**Reviewed by:**      [reviewer name / team]
**Status:**           [Pending / In Review / Approved / Rejected / Suspended]

---

## 1. Personal Identity

| Field | Value | Verified? |
|:------|:------|:----------|
| Full legal name | | ☐ |
| Date of birth | | ☐ |
| Nationality | | ☐ |
| National ID / Passport number | | ☐ |
| ID expiry date | | ☐ |
| Selfie match (liveness check) | | ☐ |

**Documents submitted:**
- [ ] National ID (front + back) or Passport
- [ ] Selfie / liveness video

**Identity verification method:** [Manual / Jumio / Onfido / Sumsub / eKYC provider]
**Identity check result:** [Pass / Fail / Review]

---

## 2. Medical License & Credentials

| Field | Value | Verified? |
|:------|:------|:----------|
| Medical license number | | ☐ |
| License issuing body | | ☐ |
| License issue date | | ☐ |
| License expiry date | | ☐ |
| Medical specialty / specialties | | ☐ |
| Medical school + graduation year | | ☐ |
| Postgraduate qualifications | | ☐ |

**Documents submitted:**
- [ ] Medical license certificate
- [ ] Specialty board certificate (if applicable)
- [ ] Medical school diploma
- [ ] Postgraduate training certificate (if applicable)
- [ ] CPD / continuing education record (if required by platform)

**License verification method:** [Manual check against medical council registry / API]
**Registry checked:** [name of national medical council or body]
**License check result:** [Active / Expired / Suspended / Not Found]

---

## 3. Practice Details

| Field | Value | Verified? |
|:------|:------|:----------|
| Clinic / hospital name | | ☐ |
| Practice address (street, city, country) | | ☐ |
| Practice type | [Private clinic / Hospital / Telehealth only] | ☐ |
| Years in practice | | ☐ |
| Languages spoken | | ☐ |
| Consultation types offered | [In-person / Video / Home visit] | ☐ |
| Consultation fee range | | ☐ |

**Documents submitted:**
- [ ] Clinic registration certificate or practice letter
- [ ] Proof of practice address (utility bill, lease, or official letter)

---

## 4. Professional Indemnity / Malpractice Insurance

| Field | Value | Verified? |
|:------|:------|:----------|
| Insurer name | | ☐ |
| Policy number | | ☐ |
| Coverage amount | | ☐ |
| Policy expiry date | | ☐ |
| Coverage type | [Per claim / Aggregate / Both] | ☐ |

**Documents submitted:**
- [ ] Insurance certificate of currency

**Insurance check result:** [Valid / Expired / Insufficient coverage / Not provided]

---

## 5. Background & Disciplinary Check

| Check | Result | Source |
|:------|:-------|:-------|
| Medical council disciplinary record | [Clear / Flag found] | [council registry] |
| Criminal background check | [Clear / Flag found] | [official source] |
| Sanctions / watchlist screening | [Clear / Match found] | [OFAC / UN / local] |

**Notes:**
[Any flags, explanations, or escalation notes]

---

## 6. Bank / Payout Details

| Field | Value | Verified? |
|:------|:------|:----------|
| Account holder name | | ☐ |
| Bank name | | ☐ |
| Account number / IBAN | | ☐ |
| Routing / SWIFT / BIC | | ☐ |
| Account matches identity? | [Yes / No] | ☐ |

**Payout verification method:** [Micro-deposit / Instant bank verification / Manual]

---

## 7. Platform Agreement

- [ ] Terms of service accepted
- [ ] Privacy policy accepted
- [ ] Code of conduct accepted
- [ ] Patient data handling agreement signed
- [ ] Consent to background check signed

**Agreement accepted date:** [YYYY-MM-DD]
**IP address at acceptance:** [logged by system]

---

## 8. Verification Decision

**Overall result:** [Approved / Rejected / Pending additional documents]

**Rejection reasons (if applicable):**
- [ ] License expired or not found in registry
- [ ] Identity document expired or mismatch
- [ ] Insurance insufficient or expired
- [ ] Disciplinary flag on record
- [ ] Incomplete document submission
- [ ] Sanctions match

**Reviewer notes:**
[Free text for human reviewer]

**Decision date:** [YYYY-MM-DD]
**Next review date:** [YYYY-MM-DD] (for license expiry monitoring)
```

---

## Filled Example

```markdown
# KYC Record — Medical Provider

**Record ID:**        KYC-MED-0042891
**Application date:** 2026-05-18
**Reviewed by:**      KYC Team — Sopheap M.
**Status:**           Approved

---

## 1. Personal Identity

| Field | Value | Verified? |
|:------|:------|:----------|
| Full legal name | Dr. Dara Chanthol | ✅ |
| Date of birth | 1982-03-15 | ✅ |
| Nationality | Cambodian | ✅ |
| National ID / Passport number | B8734921 | ✅ |
| ID expiry date | 2029-03-15 | ✅ |
| Selfie match (liveness check) | Passed | ✅ |

**Documents submitted:**
- [x] Passport (scanned, both pages)
- [x] Selfie liveness video via Onfido

**Identity verification method:** Onfido — automated liveness + document check
**Identity check result:** Pass

---

## 2. Medical License & Credentials

| Field | Value | Verified? |
|:------|:------|:----------|
| Medical license number | KH-MED-2009-04821 | ✅ |
| License issuing body | Cambodian Medical Council | ✅ |
| License issue date | 2009-06-01 | ✅ |
| License expiry date | 2027-06-01 | ✅ |
| Medical specialty | General Practice, Internal Medicine | ✅ |
| Medical school + graduation year | University of Health Sciences, Phnom Penh — 2007 | ✅ |
| Postgraduate qualifications | Internal Medicine Fellowship, Calmette Hospital — 2009 | ✅ |

**Documents submitted:**
- [x] Medical license certificate (CMC-issued)
- [x] Specialty board certificate
- [x] Medical school diploma
- [x] Fellowship completion letter

**License verification method:** Manual check against CMC public registry
**Registry checked:** Cambodian Medical Council (cmc.gov.kh)
**License check result:** Active

---

## 3. Practice Details

| Field | Value | Verified? |
|:------|:------|:----------|
| Clinic name | Chanthol Medical Centre | ✅ |
| Practice address | #45 Street 310, BKK1, Phnom Penh | ✅ |
| Practice type | Private clinic | ✅ |
| Years in practice | 17 | ✅ |
| Languages spoken | Khmer, English, French | ✅ |
| Consultation types | In-person + Video | ✅ |
| Consultation fee | $25–$40 USD | ✅ |

**Documents submitted:**
- [x] Ministry of Health clinic registration certificate
- [x] Lease agreement for clinic address

---

## 4. Professional Indemnity Insurance

| Field | Value | Verified? |
|:------|:------|:----------|
| Insurer | Forte Insurance Cambodia | ✅ |
| Policy number | FIC-MED-2026-0034 | ✅ |
| Coverage amount | $500,000 USD per claim | ✅ |
| Policy expiry | 2027-01-31 | ✅ |
| Coverage type | Per claim + aggregate | ✅ |

**Insurance check result:** Valid

---

## 5. Background & Disciplinary Check

| Check | Result | Source |
|:------|:-------|:-------|
| CMC disciplinary record | Clear | Cambodian Medical Council |
| Criminal background check | Clear | Ministry of Interior — Cambodia |
| Sanctions / watchlist | Clear | OFAC + UN consolidated list |

---

## 6. Bank / Payout Details

| Field | Value | Verified? |
|:------|:------|:----------|
| Account holder | Dr. Dara Chanthol | ✅ |
| Bank | ABA Bank Cambodia | ✅ |
| Account number | 000-123-456789 | ✅ |
| Account matches identity | Yes | ✅ |

**Payout verification method:** Micro-deposit verified

---

## 7. Platform Agreement

- [x] Terms of service accepted
- [x] Privacy policy accepted
- [x] Code of conduct accepted
- [x] Patient data handling agreement signed
- [x] Consent to background check signed

**Agreement accepted:** 2026-05-17 09:42 UTC  
**IP address:** 203.189.xx.xx (Phnom Penh, KH)

---

## 8. Verification Decision

**Overall result:** Approved

**Decision date:** 2026-05-18
**Next review date:** 2027-05-18 (license expiry monitoring)
```

---

## Verification Status Reference

| Status | Meaning | Next Action |
|:-------|:--------|:------------|
| **Pending** | Application submitted, not yet reviewed | Auto-assign to KYC queue |
| **In Review** | Human reviewer active | Reviewer owns within 48h |
| **Awaiting Documents** | Reviewer requested additional docs | Email provider — 7-day deadline |
| **Approved** | All checks passed | Activate profile — notify provider |
| **Rejected** | Failed one or more checks | Email reason — appeal window 14 days |
| **Suspended** | Post-approval issue detected | Deactivate profile — internal review |
| **Expired** | License or insurance expired | Email reminder 30 days before — re-verify |

---

*Last updated: 2026-05-18*
