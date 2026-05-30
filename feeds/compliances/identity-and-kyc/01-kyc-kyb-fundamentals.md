# KYC / KYB — Know Your Customer / Know Your Business

**Jurisdiction:** Global (FATF framework, implemented nationally)  
**Applies to:** Banks, payment processors, e-money issuers, marketplace platforms, lending, crypto exchanges — any regulated financial or trust-based business  
**Tags:** #compliance #kyc #kyb #identity #onboarding #aml

---

## What It Is

**KYC (Know Your Customer)** is the process of verifying the identity of individual customers.  
**KYB (Know Your Business)** is the process of verifying the identity and legitimacy of business customers.

Both are required by AML/CFT regulations globally. The goal: ensure you know who you are doing business with and that they are not using your platform for money laundering, fraud, or terrorism financing.

---

## Why It Exists

```
WITHOUT KYC:
  A person creates an account with a fake name.
  Uses the platform to receive payments from fraud victims.
  Withdraws to an overseas bank account.
  Platform had no way to identify them.
  → Platform is an unwitting tool for fraud.
  → Platform faces regulatory action for "failure to prevent financial crime."

WITH KYC:
  Person must provide government ID and match their face.
  Name matches a sanctions list → application rejected immediately.
  All identity documents retained for 5–10 years.
  → If fraud occurs, law enforcement has a trail.
  → Platform demonstrated due diligence.
```

---

## KYC — Individual Verification

### What to Verify

| Element | Acceptable Documents |
|:--------|:--------------------|
| **Identity** | Passport, national ID card, driver's licence |
| **Date of birth** | From the identity document |
| **Address** | Utility bill, bank statement, government letter (< 3 months old) |
| **Liveness** | Selfie match to ID photo, video liveness check |

### Verification Levels

| Level | What it involves | When to use |
|:------|:----------------|:------------|
| **Basic KYC** | Name, DOB, ID document check | Low-risk, low-value transactions |
| **Standard KYC** | ID + liveness + address | Standard onboarding |
| **Enhanced KYC** | Standard + source of funds + video interview | High-risk, PEPs, large transactions |

### KYC Providers

| Provider | Strength |
|:---------|:---------|
| Onfido | Global, strong OCR + liveness, GDPR compliant |
| Jumio | Strong for financial services, global coverage |
| Sumsub | Cost-effective, good Asia-Pacific coverage |
| IDnow | Strong EU and DACH market presence |
| Veriff | High accuracy, video-based |

---

## KYB — Business Verification

### What to Verify for a Business

| Element | What to Obtain |
|:--------|:--------------|
| **Legal entity** | Company registration certificate |
| **Registered address** | Company registry or utility bill |
| **Directors** | List of all directors + KYC on each |
| **Ultimate Beneficial Owners (UBOs)** | Anyone who owns or controls 25%+ — KYC on each |
| **Business licence** | Industry-specific licence (medical, financial, real estate) |
| **Bank account** | Statement showing company name matching |

### UBO (Ultimate Beneficial Owner)

The real human being(s) who ultimately own or control the company. You must trace through corporate structures until you reach natural persons.

```
Example:
  Company A (your customer)
    → 60% owned by Company B
      → Company B is 80% owned by Person X ← UBO (48% of Company A)
    → 40% owned by Person Y ← UBO (40% of Company A)

Both Person X and Person Y are UBOs — must do KYC on each.
```

---

## Risk-Based Approach

Not all customers need the same level of scrutiny. Apply more rigorous checks to higher-risk customers:

| Risk factor | Higher KYC burden |
|:------------|:-----------------|
| PEP (politically exposed person) | Enhanced Due Diligence required |
| High-risk country | FATF grey/black list jurisdiction |
| High-value transactions | Source of funds verification |
| Unusual business model | More documentation required |
| Anonymous or complex ownership | Trace to UBO level |

---

## Ongoing Monitoring (CDD)

KYC is not a one-time event. Customer Due Diligence (CDD) is ongoing:

- Re-verify documents before expiry
- Monitor transaction patterns for anomalies
- Re-screen against sanctions lists periodically (at least annually)
- Update risk rating when circumstances change
- Trigger enhanced review if suspicious activity detected

---

## Document Retention

| Record | Minimum retention |
|:-------|:-----------------|
| KYC documents and verification results | 5 years after relationship ends (10 years in some jurisdictions) |
| Transaction records | 5–10 years |
| Risk assessments | 5 years |

---

## Related

- [AML/CFT](../payment-and-financial/03-aml-cft.md)
- [FATF Recommendations](./03-fatf-recommendations.md)
- [Sanctions Screening](./04-sanctions-screening.md)
- [Digital Identity Verification](./06-digital-identity-verification.md)
- [KYC Provider Verification Procedure](../../procedures/compliance-and-accounts/kyc/01-kyc-provider-verification.md)
- [KYC Templates](../../templates/kyc/)
