# FATF — Financial Action Task Force & the 40 Recommendations

**Jurisdiction:** Global (195 member jurisdictions)  
**Applies to:** All FATF member countries — which implement the Recommendations into national law  
**Administered by:** FATF (intergovernmental body, Secretariat in Paris)  
**Tags:** #compliance #fatf #aml #cft #global-standards #money-laundering

---

## What It Is

FATF is the global standard-setter for anti-money laundering (AML) and counter-terrorism financing (CFT). Its **40 Recommendations** are the international blueprint that countries use to build their AML/CFT laws.

When a country's FATF review finds deficiencies, they are placed on the **Grey List** (Increased Monitoring) or **Black List** (Call for Action). Being on these lists makes it significantly harder and more expensive for institutions in those countries to do international business.

---

## The 40 Recommendations — Summary

### AML/CFT Policies and Coordination (R.1–2)
- R.1: Countries must implement a risk-based AML/CFT framework
- R.2: National coordination and cooperation between agencies

### Money Laundering and Confiscation (R.3–4)
- R.3: Criminalise money laundering
- R.4: Confiscate proceeds of crime

### Terrorist Financing and Proliferation (R.5–8)
- R.5: Criminalise terrorist financing
- R.6: Targeted financial sanctions for terrorism
- R.7: Targeted financial sanctions for proliferation (WMDs)
- R.8: Non-profit organisations — prevent abuse

### Preventive Measures for Financial Institutions (R.9–23) — Most Relevant for Platforms

| Rec | Topic |
|:----|:------|
| R.9 | Financial institution secrecy — cannot block AML information sharing |
| R.10 | Customer Due Diligence (CDD) — KYC requirements |
| R.11 | Record keeping — 5 years minimum |
| R.12 | Politically Exposed Persons (PEPs) — enhanced measures |
| R.13 | Correspondent banking — due diligence |
| R.14 | Money or value transfer services — registration required |
| R.15 | New technologies — risk assessment for FinTech, crypto |
| R.16 | Wire transfers — originator and beneficiary info must travel with the transfer |
| R.17 | Reliance on third parties — can outsource KYC but remain responsible |
| R.18 | Internal controls — AML programme, compliance officer, audit |
| R.19 | High-risk countries — enhanced measures |
| R.20 | Suspicious transaction reporting — file SARs/STRs |
| R.21 | Tipping off — prohibition |
| R.22 | Designated non-financial businesses and professions (DNFBPs) — lawyers, accountants, real estate |
| R.23 | DNFBPs — reporting obligations |

### Transparency and Beneficial Ownership (R.24–25)
- R.24: Transparency of legal persons — beneficial ownership registers
- R.25: Transparency of legal arrangements — trusts

### Powers and Responsibilities (R.26–35)
- Supervision, enforcement, sanctions, law enforcement cooperation

### International Cooperation (R.36–40)
- Mutual legal assistance, extradition, asset sharing

---

## The Travel Rule (R.16)

Recommendation 16 is critical for payment platforms and crypto exchanges:

**All wire transfers and crypto transfers must carry:**
- Originator name
- Originator account number
- Originator address (or DOB or national ID number)
- Beneficiary name
- Beneficiary account number

This must travel with the transfer — the receiving institution must obtain this information and screen it.

For crypto: FATF extended R.16 to Virtual Asset Service Providers (VASPs) — cryptocurrency exchanges must comply with the travel rule for transfers above $1,000 USD equivalent.

---

## FATF Risk-Based Approach

FATF's core philosophy is risk-based: apply more resources to higher-risk customers and transactions, less to lower-risk ones.

```
RISK ASSESSMENT:
  High risk → Enhanced Due Diligence (EDD), enhanced monitoring
  Standard risk → Standard Customer Due Diligence (CDD)
  Low risk → Simplified Due Diligence (SDD) in some jurisdictions
```

---

## Grey List vs Black List

### Grey List (Increased Monitoring)
Countries with strategic deficiencies working with FATF to resolve them.

**Impact on your platform:**
- Transactions to/from grey-listed countries require Enhanced Due Diligence
- Correspondent banks may add surcharges or delay transfers
- Stricter documentation requirements

*Examples of grey-listed countries (check FATF website for current list)*

### Black List (Call for Action)
Countries with critical AML/CFT failures that pose a significant threat to the global financial system.

**Impact on your platform:**
- Most financial institutions refuse transactions
- Heavily restricted by US OFAC, EU, and UN sanctions
- Near-impossible to process payments to/from these countries

*Persistent: DPRK (North Korea), Iran*

---

## VASP Rules (Crypto Platforms)

FATF Recommendation 15 explicitly covers Virtual Asset Service Providers:

- VASPs must register/licence with national authorities
- Travel Rule applies to crypto transfers > $1,000 equivalent
- CDD required for all customers
- SAR reporting required
- Record keeping: 5 years minimum

---

## Related

- [AML/CFT](../payment-and-financial/03-aml-cft.md)
- [KYC/KYB Fundamentals](./01-kyc-kyb-fundamentals.md)
- [AML Transaction Monitoring](./02-aml-transaction-monitoring.md)
- [Sanctions Screening](./04-sanctions-screening.md)
