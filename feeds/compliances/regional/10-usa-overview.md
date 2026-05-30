# USA Regional Compliance Overview

**Region:** United States of America  
**Tags:** #compliance #usa #hipaa #glba #sox #ccpa #ftc #sec #fintech

---

## Overview

The US has no single comprehensive federal data protection law (unlike GDPR). Instead, compliance is:

1. **Sector-specific federal laws** — HIPAA (healthcare), GLBA (finance), COPPA (children), FERPA (education)
2. **Cross-sector federal agencies** — FTC (consumer protection), FCC (telecoms)
3. **State-level laws** — California (CCPA/CPRA), Virginia, Colorado, Connecticut, and growing patchwork

This creates a complex multi-layer compliance environment — a platform may need to comply with HIPAA, GLBA, CCPA, and multiple state laws simultaneously.

---

## Federal Sector Laws

### HIPAA — Health Insurance Portability and Accountability Act

Full coverage: [HIPAA](../healthcare/01-hipaa.md)

```
Applies to: Covered Entities (healthcare providers, health plans, clearinghouses)
           + Business Associates (any vendor processing PHI on their behalf)

Key rules:
□ Privacy Rule — 18 PHI identifiers, permitted uses and disclosures, patient rights
□ Security Rule — administrative, physical, technical safeguards for ePHI
□ Breach Notification Rule — 60 days to notify HHS + affected individuals
□ Business Associate Agreements — mandatory before sharing PHI with vendors
```

### GLBA — Gramm-Leach-Bliley Act

**Applies to:** Financial institutions — banks, insurance companies, investment firms, and any company that offers financial products or services

#### Safeguards Rule (FTC-enforced)

```
Mandatory information security programme:
□ Designate qualified individual responsible for security programme
□ Risk assessment — identify internal and external risks
□ Implement security controls to address identified risks:
   □ Encryption — in transit and at rest for customer financial information
   □ Access controls — limit access by need
   □ Multi-factor authentication — for any individual accessing customer information
   □ Penetration testing — annual
   □ Vulnerability assessment — continuous
□ Oversee service providers — contracts requiring safeguards
□ Incident response plan — tested annually
□ Report to Board annually
```

#### Privacy Notice

```
□ Annual privacy notice to customers
□ Opt-out right for sharing with non-affiliated third parties
□ Clear disclosure of data sharing practices
```

#### Penalties

| Violation | Maximum |
|:----------|:--------|
| Per violation | $100K |
| Officers/directors personal liability | $10K + imprisonment |
| FTC enforcement action | Consent decrees, unlimited civil penalties |

---

### SOX — Sarbanes-Oxley Act

**Applies to:** Public companies (SEC registrants) and their audit firms

```
IT-relevant requirements:
□ Internal controls over financial reporting (ICFR) — IT general controls
□ Section 302 — CEO/CFO certify quarterly financial report accuracy
□ Section 404 — Annual management report on internal control effectiveness
□ Change management controls — documented procedures for system changes
□ Access controls — segregation of duties for financial systems
□ Audit trail — tamper-proof logs for financial transactions
□ Data retention — 7 years for financial records
□ Whistleblower protection — internal reporting channels
```

---

### COPPA — Children's Online Privacy Protection Act

**Applies to:** Websites and online services directed at children under 13 (or knowingly collecting data from under-13s)

```
Key requirements:
□ Verifiable parental consent — before collecting ANY personal information from under-13
□ Privacy notice — clear disclosure on homepage and at each point of data collection
□ Limited data collection — only what's necessary for the child's activity
□ No conditioning on disclosure — can't require more data than necessary
□ Parental rights — access, review, correct, delete their child's information
□ Data security — reasonable security practices
□ No behavioural advertising — without verifiable parental consent
□ Retention limitation — only as long as necessary for collection purpose
```

**Penalties:** FTC can seek up to $51,744 per violation. Repeat violators have faced $136M+ settlements.

---

### FERPA — Family Educational Rights and Privacy Act

**Applies to:** Educational institutions receiving US Department of Education funding

```
Key requirements for EdTech platforms:
□ School official exception — vendors must be under "direct control" of institution
□ School Official Agreement — contract defining legitimate educational interest
□ No disclosure to third parties without consent — or specific exception
□ Student rights — access and amend education records (18+ or parent)
□ Annual notification — of FERPA rights
□ Data security — reasonable measures to protect education records
```

---

## State Laws

### California — CCPA / CPRA

Full coverage: [CCPA](../data-privacy/02-ccpa.md)

The most influential US state privacy law — enforcement model others follow.

```
Applies to: Businesses meeting any of:
□ Annual gross revenue > $25M
□ Buy/sell/receive personal information of 100,000+ consumers/households
□ Derive 50%+ of revenue from selling personal information

Key rights:
□ Know — what personal information is collected and how it's used/shared
□ Delete — request deletion (with exceptions)
□ Opt-out — of sale or sharing of personal information
□ Non-discrimination — for exercising rights
□ Correct — inaccurate personal information (CPRA)
□ Limit use of sensitive personal information — to necessary purposes (CPRA)
```

### State Privacy Law Patchwork

| State | Law | In Force | Notable Feature |
|:------|:----|:---------|:----------------|
| California | CCPA/CPRA | 2020/2023 | Strongest; private right of action for data breaches |
| Virginia | VCDPA | 2023 | Opt-out of sale and targeting, DPIAs required |
| Colorado | CPA | 2023 | Universal opt-out mechanism required |
| Connecticut | CTDPA | 2023 | No threshold — applies to 100K+ residents |
| Texas | TDPSA | 2024 | No revenue threshold |
| Florida | FDBR | 2024 | Applies to businesses > $1B revenue |
| Washington | My Health MY Data | 2024 | Health data — applies broadly beyond HIPAA |
| Nevada | SB 260 | 2021 | Sale of covered information — opt-out only |
| New York | SHIELD Act | 2020 | Security requirements + breach notification |

---

## Federal Trade Commission (FTC)

The FTC is the US's de facto data protection authority for non-sector-specific violations.

### FTC Act Section 5 — Unfair or Deceptive Practices

```
FTC can act against:
□ Privacy policy violations — collecting more than stated
□ Inadequate security — "reasonable" security expected
□ Broken promises — not delivering on privacy commitments
□ Dark patterns — deceptive UI for data collection
□ Surprise data practices — not disclosed at collection

FTC enforcement tools:
□ Consent decrees — binding corrective action + ongoing monitoring
□ Civil penalties — up to $51,744/day for violations
□ Injunctive relief — requiring specific technical/organisational changes
```

### FTC Health Breach Notification Rule

```
Applies to: Health apps and connected devices NOT covered by HIPAA

Requirements:
□ Notify FTC within 60 days of breach discovery
□ Notify affected consumers within 60 days
□ >500 people: notify media in affected states
□ "PHR identifiable health information" — defined broadly
□ Rule updated 2023 — expanded scope to health apps (e.g. period trackers, fitness apps)
```

---

## Financial Sector

### SEC — Securities and Exchange Commission

For registered investment advisers, broker-dealers, and public companies:

```
Key cybersecurity requirements (2023 rules):
□ Material cybersecurity incident disclosure — Form 8-K within 4 business days
□ Annual cybersecurity risk management disclosure — Form 10-K
□ Board oversight disclosure — how board oversees cybersecurity risk
□ Safeguards Rule — protecting customer information (Reg S-P update 2024)
□ Record retention — electronic books and records (including messaging platforms)
```

### FinCEN — Financial Crimes Enforcement Network

```
Bank Secrecy Act (BSA) obligations:
□ SAR — Suspicious Activity Report — within 30 days of detection
□ CTR — Currency Transaction Report — transactions > $10,000 in cash
□ MSB registration — Money Services Businesses must register with FinCEN
□ AML programme — policies, procedures, internal controls, training
□ Customer Due Diligence (CDD Rule) — beneficial ownership ≥25%
□ Travel Rule — SWIFT / wire transfers must include originator and beneficiary
```

---

## Data Breach Notification

All 50 states have breach notification laws. Key parameters:

| Aspect | Typical Range |
|:-------|:-------------|
| Notification deadline | 30–90 days (California: 72 hours for "expedient") |
| Who to notify | Affected individuals + state AG (varies) |
| What triggers notification | Unencrypted personal information accessed without authorisation |
| Threshold | 500+ residents in some states requires media notice |

Federal sectoral: HIPAA (60 days), GLBA/FTC (30 days), SEC (4 business days for material incidents)

---

## US Compliance Stack by Platform Type

### Healthcare Platform

```
□ HIPAA — BAA with every covered entity customer; Security Rule technical safeguards
□ SOC 2 Type II — expected by enterprise healthcare customers
□ FTC Health Breach Notification — if health app not covered by HIPAA
□ State health data laws — e.g. Washington My Health MY Data
□ CCPA — if serving California residents, not pre-empted by HIPAA for non-PHI
□ HITECH — HIPAA extension; breach notification, EHR meaningful use
```

### Fintech Platform

```
□ GLBA Safeguards Rule — if qualifying financial institution
□ FinCEN BSA/AML — if MSB (money transmitter, currency exchanger)
□ State money transmitter licences — one per state; 50-state patchwork
□ SEC Regulation — if investment-related features
□ CCPA/state privacy — for consumer-facing features
□ SOC 2 — enterprise customers require it
□ PCI-DSS — if storing, processing, or transmitting cardholder data
```

### Consumer App / SaaS

```
□ CCPA/CPRA — if California threshold met
□ Growing state law patchwork — Virginia, Colorado, Connecticut, Texas (opt-out)
□ COPPA — if any users might be under 13
□ FTC Act Section 5 — privacy policy accuracy, reasonable security
□ CAN-SPAM — email marketing compliance
□ TCPA — SMS/phone marketing (opt-in required)
□ State breach notification — all 50 states
```

---

## Related

- [HIPAA](../healthcare/01-hipaa.md)
- [CCPA](../data-privacy/02-ccpa.md)
- [PCI-DSS](../payment-and-financial/01-pci-dss.md)
- [AML/CFT](../payment-and-financial/03-aml-cft.md)
- [SOC 2](../security-frameworks/01-soc2.md)
- [FATF Recommendations](../identity-and-kyc/03-fatf-recommendations.md)
