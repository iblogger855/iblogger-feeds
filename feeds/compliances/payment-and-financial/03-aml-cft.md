# AML/CFT — Anti-Money Laundering & Counter Terrorism Financing

**Jurisdiction:** Global (FATF framework, implemented nationally)  
**Applies to:** Banks, payment processors, e-money institutions, crypto exchanges, marketplace platforms, real estate — any "obliged entity" that handles money  
**Administered by:** FATF (Financial Action Task Force) sets standards; national FIUs and central banks enforce  
**Tags:** #compliance #aml #cft #fatf #kyc #transaction-monitoring #financial-crime

---

## What It Is

AML/CFT laws require financial institutions and regulated businesses to detect, prevent, and report money laundering and terrorism financing. Failure to comply results in criminal prosecution of the institution and its officers, not just fines.

---

## The Three Stages of Money Laundering

```
1. PLACEMENT — Putting dirty money into the financial system
   Example: Depositing cash from drug sales into bank accounts in small amounts

2. LAYERING — Obscuring the trail through complex transactions
   Example: Transferring between accounts, converting currencies, buying assets

3. INTEGRATION — Reintroducing the money into the legitimate economy
   Example: Purchasing real estate, investing in businesses
```

AML controls must detect activity at all three stages.

---

## Core AML Obligations

### 1. Know Your Customer (KYC)
Verify the identity of customers before they transact. See [KYC/KYB Fundamentals](../identity-and-kyc/01-kyc-kyb-fundamentals.md).

### 2. Customer Due Diligence (CDD)
Understand who your customer is and what they're doing:

| Level | When to apply | What it involves |
|:------|:-------------|:----------------|
| **Simplified CDD** | Low-risk customers | Verify basic identity |
| **Standard CDD** | Normal customers | Full KYC, purpose of relationship |
| **Enhanced Due Diligence (EDD)** | High-risk customers | PEPs, high-risk countries, large transactions |

### 3. Transaction Monitoring
Monitor transactions for suspicious patterns:

| Pattern | Indicator |
|:--------|:---------|
| Structuring (smurfing) | Multiple transactions just below reporting thresholds |
| Rapid movement | Money in → immediately out to different account |
| Geographic risk | Transactions to/from FATF high-risk jurisdictions |
| Unusual volume | Sudden spike in transaction frequency or size |
| Round amounts | Repeated transactions of exactly $9,999 |
| Dormant account suddenly active | No activity for months, then large transactions |

### 4. Suspicious Activity Reports (SARs)
When you detect suspicious activity, file a SAR with the national Financial Intelligence Unit (FIU):

- Do NOT tell the customer you have filed a SAR (**"tipping off"** is a criminal offence)
- File before a transaction if you can, or within a defined window after
- Keep records of all SARs for minimum 5 years

### 5. Sanctions Screening
Screen customers and transactions against:
- OFAC (US) SDN list
- UN Security Council sanctions
- EU consolidated list
- National lists (Cambodia MOEFresources, Thailand AMLO)

### 6. Record Retention

| Record type | Minimum retention |
|:------------|:-----------------|
| KYC documents | 5 years after relationship ends |
| Transaction records | 5 years after transaction |
| SAR copies | 5 years after filing |
| AML training records | 5 years |

Many jurisdictions require 10 years for financial institutions.

---

## PEPs — Politically Exposed Persons

PEPs are individuals who hold or have held prominent public positions — heads of state, ministers, judges, senior military officers, state-owned enterprise executives, and their family members and close associates.

PEPs are higher risk for corruption and bribery. They require **Enhanced Due Diligence (EDD)**:
- Source of funds verification
- Senior management approval for the relationship
- Enhanced ongoing monitoring

---

## FATF High-Risk Jurisdictions

FATF publishes two lists:
- **Black list** (Call for Action): Countries with critical AML/CFT deficiencies. Transactions with these countries require maximum scrutiny. (As of 2025: DPRK, Iran, Myanmar, Russia heavily restricted)
- **Grey list** (Increased Monitoring): Countries under active monitoring. Requires enhanced due diligence.

---

## AML Programme Requirements

A regulated entity must have:

```
□ AML/CFT Policy — written, board-approved
□ Compliance Officer — named, senior, independent
□ Risk Assessment — documented assessment of your ML/TF risk exposure
□ Customer Due Diligence procedures — by customer risk tier
□ Transaction Monitoring system — rules-based or ML-based
□ SAR filing procedure — including tipping-off prohibition training
□ Sanctions screening — real-time on onboarding and transaction
□ Staff Training — annual, all relevant staff
□ Independent Audit — periodic testing of AML controls
□ Record Keeping — all of the above, 5–10 years
```

---

## Penalties

| Jurisdiction | Maximum penalty |
|:-------------|:---------------|
| USA | Unlimited criminal fines; up to 20 years imprisonment for individuals |
| EU | Up to 10% of annual turnover or €5M (whichever higher) |
| UK | Unlimited fine; up to 14 years imprisonment |
| Cambodia | Revocation of operating licence; up to 10 years imprisonment |

Notable cases: HSBC ($1.9B, 2012), Deutsche Bank ($630M, 2017), Goldman Sachs ($2.9B, 2020)

---

## Related

- [KYC/KYB Fundamentals](../identity-and-kyc/01-kyc-kyb-fundamentals.md)
- [FATF Recommendations](../identity-and-kyc/03-fatf-recommendations.md)
- [Sanctions Screening](../identity-and-kyc/04-sanctions-screening.md)
- [KYC Provider Verification Procedure](../../procedures/compliance-and-accounts/kyc/01-kyc-provider-verification.md)
- [NBC Cambodia](./05-nbc-cambodia.md)
