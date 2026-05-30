# Sanctions Screening

**Jurisdiction:** Global  
**Applies to:** Any business conducting financial transactions or providing services — especially financial services, e-commerce, and marketplace platforms  
**Tags:** #compliance #sanctions #ofac #un #screening #aml #kyc

---

## What It Is

Sanctions are legal restrictions imposed by governments or international bodies against individuals, entities, or countries. Sanctions screening is the process of checking your customers, counterparties, and transactions against these lists before providing services or processing payments.

Violating sanctions — even unknowingly — can result in massive fines and criminal charges. "We didn't know" is not a defence for OFAC.

---

## Key Sanctions Lists

| List | Issuer | Scope |
|:-----|:-------|:------|
| **SDN List** (Specially Designated Nationals) | OFAC (US Treasury) | Individuals and entities — any global business can be fined for dealing with them |
| **Sectoral Sanctions** | OFAC | Restrictions on specific sectors (energy, finance) in certain countries |
| **UN Security Council Consolidated List** | United Nations | Mandatory for all UN member states |
| **EU Consolidated List** | European Union | Mandatory for EU businesses |
| **UK Financial Sanctions** | OFSI (UK Treasury) | Mandatory for UK businesses |
| **OFAC Country Programs** | OFAC | Comprehensive sanctions against Cuba, Iran, North Korea, Syria, Russia (certain sectors) |
| **National Lists** | Cambodia MLSPP, Thailand AMLO, etc. | Country-specific |

---

## OFAC — Why It Matters Even Outside the USA

OFAC (Office of Foreign Assets Control) has extraterritorial reach:

- Any transaction that **passes through the US financial system** (USD transactions, US correspondent banks)
- Any entity with **US persons** involved (US citizens, residents, or US-incorporated entities)
- Any company with **US operations**

Since USD is the world's reserve currency and most international wire transfers pass through US banks (Citibank, JPMorgan, BONY), OFAC effectively applies globally.

**OFAC penalty example:** A European bank processing a payment to an Iranian entity through a US correspondent bank faces full OFAC penalties — even though the bank is not American.

---

## What to Screen

| What | When |
|:-----|:-----|
| New customers (individuals) | At onboarding — before any service is provided |
| New customers (businesses) | At onboarding — screen the entity + all directors + UBOs |
| Existing customers | Periodic re-screening (at least annually, or when lists update) |
| Payees / beneficiaries | Before initiating a payment |
| Transaction counterparties | Real-time or near-real-time |
| Countries | Check if the destination country is sanctioned |

---

## Match Types

| Type | Description | Action |
|:-----|:------------|:-------|
| **True match** | Name, DOB, and other data clearly match the sanctioned person | Reject and report |
| **False positive** | Similar name but different person | Document the dismissal with evidence |
| **Potential match** | Partial match — requires investigation | Escalate to compliance for review |

---

## Fuzzy Name Matching

Names transliterated from Arabic, Chinese, Russian, Khmer, or other scripts may have multiple valid spellings. Screening must account for:
- Name variations (`Mohammed`, `Mohamed`, `Mohamad`)
- Aliases (SDN list includes known aliases)
- Transliteration differences
- Reversed name order (some cultures list surname first)

Most sanctions screening tools use fuzzy matching algorithms (e.g. Jaro-Winkler, Levenshtein distance) with configurable thresholds.

---

## Screening Providers

| Provider | Strengths |
|:---------|:---------|
| **Dow Jones Risk & Compliance** | Comprehensive data, financial industry standard |
| **LexisNexis WorldCompliance** | Broad coverage, PEP + sanctions combined |
| **ComplyAdvantage** | Real-time ML-based screening, API-first |
| **Refinitiv World-Check** | Used by most large banks globally |
| **Trulioo** | Good coverage of emerging markets |
| **SEON** | Cost-effective for SMEs, API-based |

---

## Tipping Off

If you are screening a customer and determine they are on a sanctions list, you must **NOT** tell them. Informing a sanctioned person that they have been identified is "tipping off" — a criminal offence.

```
CORRECT:
  Screen → Match found → Reject application / freeze account → 
  Report to relevant authority → Do not inform the customer of the reason

INCORRECT:
  "We cannot serve you because you appear on the OFAC SDN list."
  ← This is tipping off
```

---

## Record Keeping

| Record | Retention |
|:-------|:----------|
| Screening results (matches and dismissals) | 5 years |
| False positive documentation | 5 years |
| Escalation and decision records | 5 years |

---

## What to Build

```
Minimum sanctions screening implementation:

□ Integrate sanctions screening API (ComplyAdvantage, LexisNexis, etc.)
□ Screen all new customers at onboarding — before account activation
□ Screen all UBOs and directors for business customers
□ Real-time screening of payment beneficiaries
□ Periodic re-screening of existing customers (at least annually)
□ Fuzzy matching with configurable threshold
□ Escalation workflow for potential matches
□ False positive documentation process
□ Tipping off prevention — do not disclose reason for rejection
□ Alert records — 5-year retention
□ Country-level IP blocking for comprehensively sanctioned countries
```

---

## Related

- [KYC/KYB Fundamentals](./01-kyc-kyb-fundamentals.md)
- [AML/CFT](../payment-and-financial/03-aml-cft.md)
- [FATF Recommendations](./03-fatf-recommendations.md)
- [AML Transaction Monitoring](./02-aml-transaction-monitoring.md)
