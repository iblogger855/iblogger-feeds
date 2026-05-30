# DORA — Digital Operational Resilience Act

**Jurisdiction:** European Union  
**In force:** 16 January 2023 (applies from 17 January 2025)  
**Applies to:** Financial entities and their critical ICT third-party service providers in the EU  
**Tags:** #compliance #dora #eu #financial #resilience #ict #fintech

---

## What It Is

DORA creates a unified framework for **digital operational resilience** in the EU financial sector. Before DORA, financial institutions in different member states had inconsistent requirements for managing ICT risk. DORA harmonises them — and crucially, extends obligations directly to **critical third-party ICT providers** (cloud providers, software vendors, data analytics firms) serving financial institutions.

DORA is the financial sector's NIS2 equivalent — but with much more prescriptive requirements.

---

## Who It Applies To

### Financial Entities
- Banks and credit institutions
- Payment institutions and e-money institutions
- Investment firms
- Insurance and reinsurance undertakings
- Crypto-asset service providers (under MiCA)
- Crowdfunding platforms
- Central counterparties, trading venues
- Pension funds and asset managers

### Critical ICT Third-Party Service Providers (CTPPs)
Cloud providers, data analytics firms, and software companies that are **designated critical** by EU supervisory authorities — they face direct oversight for the first time.

---

## Five Pillars

### 1. ICT Risk Management (Articles 5–16)
Financial entities must have a **comprehensive ICT risk management framework**:

```
□ ICT risk management strategy — board approved
□ ICT asset inventory — hardware, software, data, third parties
□ Risk identification — threats, vulnerabilities, impact
□ Protection measures — access control, encryption, network security
□ Detection capabilities — monitoring, alerting
□ Response and recovery — IRP, BCP, DRP
□ Communication — internal and external during incidents
□ Learning — post-incident review, continuous improvement
□ Annual ICT risk assessment
□ Board-level oversight and responsibility
```

### 2. ICT Incident Management, Classification, and Reporting (Articles 17–23)

**Classification of ICT incidents:**
| Criterion | Major incident triggers |
|:----------|:-----------------------|
| Affected clients | Large number or significant financial entities |
| Duration | Extended outage (hours, not minutes) |
| Geographic spread | Multiple member states affected |
| Data loss | Personal or financial data compromised |
| Criticality | Payments system or critical function impaired |
| Economic impact | Significant financial losses |

**Reporting timeline for major ICT incidents:**
| Report | Timeframe |
|:-------|:----------|
| Initial notification | Within **4 hours** of classifying as major |
| Intermediate report | Within **72 hours** |
| Final report | Within **1 month** |

### 3. Digital Operational Resilience Testing (Articles 24–27)

```
□ Annual basic testing — vulnerability assessments, open-source analysis
□ Threat-led penetration testing (TLPT) — every 3 years for significant entities
□ TLPT uses real threat intelligence to simulate advanced persistent threats
□ Results shared with competent authority
```

### 4. ICT Third-Party Risk Management (Articles 28–44)

**Most novel part of DORA — extends compliance obligations to vendors:**

```
For financial entities:
□ Maintain a register of all ICT third-party providers
□ Assess criticality of each provider
□ Pre-contractual due diligence on ICT providers
□ Contracts with ICT providers must include:
    - Service levels, availability, performance
    - Security standards and certifications
    - Data location and portability
    - Audit rights
    - Sub-outsourcing approval requirements
    - Exit strategies
□ Annual review of ICT third-party arrangements
□ Concentration risk assessment

For designated Critical Third-Party Providers:
□ Direct oversight by lead EU supervisory authority
□ Comply with oversight requirements including inspections
□ Adapt contracts with financial entities to DORA requirements
```

### 5. Information Sharing (Articles 45–49)

Financial entities are encouraged (and for some, required) to share cyber threat intelligence with peers and authorities — creating a collective defence.

---

## Interaction with NIS2 and Other Regulations

```
NIS2: General cybersecurity for all sectors
DORA: Lex specialis for financial sector — replaces NIS2 for financial entities

GDPR: Personal data breaches must still be reported under GDPR (72h to DPA)
       DORA major incidents that involve personal data → dual reporting

PSD2: DORA complements PSD2 — does not replace payment security requirements
```

---

## Penalties

| Violation | Maximum |
|:----------|:--------|
| Financial entity non-compliance | Varies by member state — typically % of turnover |
| Critical TPPP non-compliance | Up to €5M or 1% of global daily average turnover per day of non-compliance |
| Personal liability | Competent authorities can require dismissal of senior management |

---

## What Cloud Providers Need to Do

If your company is designated a Critical Third-Party Provider:

```
□ Register with EU supervisory oversight framework
□ Designate a legal representative in the EU
□ Provide audit rights to financial institution clients
□ Contractual terms must comply with DORA Article 30 requirements
□ Maintain sub-outsourcing register
□ Cooperate with oversight visits and inspections
□ Exit planning support for clients
```

---

## What to Build

```
For a fintech/payment platform subject to DORA:

□ ICT risk management framework — documented, board approved
□ ICT asset inventory — complete and maintained
□ Incident classification system — major vs non-major criteria
□ 4-hour initial reporting capability to competent authority
□ Third-party ICT register — all providers, criticality rating
□ Updated contracts with ICT providers — DORA-compliant clauses
□ Annual vulnerability assessments
□ TLPT (if significant entity) — every 3 years
□ Business continuity plan — tested, RTO/RPO defined
□ Information sharing participation — ISAC membership
```

---

## Related

- [NIS2](./01-nis2.md) — companion cybersecurity directive
- [PCI-DSS](../payment-and-financial/01-pci-dss.md)
- [PSD2](../payment-and-financial/02-psd2.md)
- [MiCA](./03-mica.md) — crypto regulation (DORA applies to MiCA entities)
- [ISO 27001](../security-frameworks/02-iso-27001.md)
