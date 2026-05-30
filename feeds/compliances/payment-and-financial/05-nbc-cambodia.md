# NBC — National Bank of Cambodia Regulations

**Jurisdiction:** Kingdom of Cambodia  
**Applies to:** Banks, microfinance institutions, payment service providers, money changers, e-money issuers operating in Cambodia  
**Administered by:** National Bank of Cambodia (NBC)  
**Tags:** #compliance #nbc #cambodia #banking #payment #khqr #bakong

---

## What It Is

The NBC is Cambodia's central bank and primary financial regulator. It licences and regulates all financial institutions and payment service providers operating in Cambodia, including fintech platforms, e-wallets, and money transfer operators.

---

## Key Licences

| Licence Type | Who Needs It | Capital Requirement |
|:-------------|:------------|:--------------------|
| Commercial Bank | Full banking services | USD 75M minimum |
| Microfinance Institution (MFI) | Loans and deposits for underserved | USD 1.5M |
| Payment Service Provider (PSP) | Processing payments, e-wallets | USD 1M |
| Money Changer | Currency exchange | USD 50K |
| E-Money Issuer | Digital wallet, stored value | USD 1M |
| Representative Office | Foreign bank presence only | No capital requirement |

---

## KHQR — Khmer QR Code Standard

KHQR is Cambodia's national QR payment standard, adopted by the NBC. All licensed payment providers must support KHQR.

```
KHQR encodes:
  - Merchant/payee account information
  - Currency (USD or KHR)
  - Amount (fixed or dynamic)
  - Merchant category code
  - Reference number
  
Supports:
  - ABA Pay
  - Wing
  - Pi Pay
  - All KHQR-participating banks
  - Bakong wallet
```

---

## Bakong — NBC's Digital Currency Platform

Bakong is Cambodia's national payment infrastructure — a blockchain-based payment system launched by the NBC in 2020.

```
Bakong enables:
  - Real-time transfers between participating banks
  - Both KHR (Riel) and USD transactions
  - Mobile QR payments
  - Interbank settlement
  - Cross-border transfers (pilot with Malaysia, Vietnam, Thailand)

All licensed PSPs and banks are encouraged (effectively required) to integrate with Bakong.
```

---

## AML/CFT Requirements (NBC Prakas)

NBC Prakas No. B7-017-344 (and subsequent amendments) on Anti-Money Laundering:

| Obligation | Requirement |
|:-----------|:------------|
| Customer Identification | KYC for all customers — government ID required |
| Enhanced Due Diligence | PEPs, high-risk customers, transactions > $10,000 |
| Transaction Reporting | Cash transactions > $10,000 to NBC Financial Intelligence Unit (FIU) |
| Suspicious Transaction Reports | File STR with FIU Cambodia within 2 working days |
| Record Retention | Minimum 10 years for all transaction and KYC records |
| AML Officer | Designated compliance officer required |
| AML Training | Annual staff training |

---

## Data Localisation

NBC regulation requires financial data of Cambodian customers to be **stored within Cambodia**:
- Transaction records
- Customer KYC data
- Account data

Cloud hosting outside Cambodia for financial data requires NBC approval.

---

## Consumer Protection Requirements

| Requirement | Detail |
|:------------|:-------|
| Fee transparency | All fees disclosed before transaction |
| Complaint mechanism | Must have formal complaint handling process |
| Error resolution | Resolve disputed transactions within defined SLA |
| Terms and conditions | In Khmer language (or bilingual) |

---

## Fintech Regulatory Sandbox

NBC operates a regulatory sandbox allowing fintech companies to test innovative financial products under supervised conditions before full licensing. Application to the NBC's Financial Technology Office.

---

## Penalties

| Violation | Consequence |
|:----------|:------------|
| Operating without licence | Criminal prosecution, asset seizure |
| AML non-compliance | Licence suspension or revocation, fines |
| Failure to report STR | Criminal liability for compliance officer |
| Capital requirement breach | Supervisory intervention |

---

## What to Build

```
For platforms operating in Cambodia's financial sector:

□ NBC licence (appropriate type) or partner with licensed institution
□ KHQR integration for QR payments
□ Bakong integration for interbank transfers
□ KYC for all users — government ID verification
□ EDD for PEPs and transactions > $10,000
□ Cash transaction reports to NBC FIU > $10,000
□ STR filing within 2 working days of detection
□ 10-year record retention
□ Data localisation — store financial data in Cambodia
□ Khmer language terms and conditions
□ Designated AML compliance officer
□ Annual AML training
```

---

## Related

- [AML/CFT](./03-aml-cft.md)
- [KYC/KYB Fundamentals](../identity-and-kyc/01-kyc-kyb-fundamentals.md)
- [Regional: Cambodia Overview](../regional/01-cambodia-overview.md)
- [Platform Revenue & Provider Payout](../../procedures/payments-and-revenue/02-platform-revenue-and-provider-payout.md)
