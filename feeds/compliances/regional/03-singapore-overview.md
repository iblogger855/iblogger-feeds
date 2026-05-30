# Singapore — Compliance Overview for Digital Platforms

**Tags:** #compliance #singapore #pdpa #mas #sfa #cybersecurity #southeast-asia

---

## Summary

Singapore is Southeast Asia's leading financial hub with one of the world's most sophisticated regulatory environments. The MAS (Monetary Authority of Singapore) is both the central bank and financial regulator. Singapore is known for its proactive fintech regulation, including a well-developed regulatory sandbox. PDPA (2013, amended 2021) covers data protection.

---

## Key Regulators

| Regulator | Acronym | Jurisdiction |
|:----------|:--------|:-------------|
| Monetary Authority of Singapore | MAS | Banking, payments, insurance, capital markets, fintech |
| Personal Data Protection Commission | PDPC | Data protection, PDPA enforcement |
| Cyber Security Agency | CSA | Cybersecurity Act, national cyber strategy |
| Health Sciences Authority | HSA | Medical devices, pharmaceuticals |
| Ministry of Health | MOH | Healthcare licensing |
| Inland Revenue Authority of Singapore | IRAS | Tax, including GST on digital services |

---

## Data Protection — PDPA (Singapore)

| Requirement | Detail |
|:------------|:-------|
| Consent model | Consent + deemed consent + legitimate interests |
| Data subject rights | Access, correction, portability, withdrawal of consent |
| No general right to erasure | Unlike GDPR |
| Breach notification | Assess within 30 days; notify PDPC within 3 calendar days if notifiable |
| DNC Registry | Check before sending marketing messages |
| DPO | Recommended (not mandatory) |
| Max penalty | 10% of Singapore annual turnover (for turnover > SGD 10M) or SGD 1M |

Full details: [PDPA Singapore](../data-privacy/05-pdpa-singapore.md)

---

## Payment Services — MAS (PSA)

Under the Payment Services Act (PSA) 2019:

| Service | Licence type |
|:--------|:-------------|
| Account issuance (e-wallet) | Major/Standard Payment Institution |
| Domestic money transfer | Major/Standard Payment Institution |
| Cross-border money transfer | Major/Standard Payment Institution |
| Merchant acquisition | Major/Standard Payment Institution |
| Digital payment token (crypto) | DPT service licence |

**PayNow** — Singapore's national QR and proxy payment system. Licensed payment providers integrate with PayNow.

MAS operates a **Fintech Regulatory Sandbox** for innovative payment services.

---

## AML/CFT — MAS and STRO

Singapore's AML/CFT framework is administered by MAS (for financial institutions) and STRO (Suspicious Transaction Reporting Office):

| Obligation | Requirement |
|:-----------|:------------|
| CDD / KYC | Required for all financial customers |
| EDD for PEPs | Enhanced due diligence |
| STR filing | STRO — as soon as practicable |
| Record retention | 5 years |
| Travel Rule | Applies to crypto transfers (MAS Notice PSN02) |

---

## Cybersecurity Act (2018)

Covers **Critical Information Infrastructure (CII)** — banking, energy, healthcare, telecoms, water, transport sectors:
- Mandatory security standards
- Incident reporting within prescribed timeframes
- Regular audits
- CSA has powers to investigate and compel action

---

## Financial Technology (Fintech)

Singapore leads Southeast Asia in fintech regulation:

| Framework | Description |
|:----------|:------------|
| PSA (Payment Services Act) | Comprehensive payments licensing |
| MAS Fintech Sandbox | Test without full licence requirements |
| Project Ubin | Blockchain-based payment prototype |
| SGFinDex | National financial data sharing framework |
| SGQR | Unified QR code standard |

---

## Digital Token (Crypto) Regulation

Under PSA, digital payment token (DPT) services require a MAS licence. Requirements include:
- AML/CFT compliance
- Travel Rule compliance for crypto transfers
- Segregation of customer assets
- No trading against customer flow

---

## GST on Digital Services

From 2020, foreign digital service providers with Singapore customers must register for GST (9%) if annual turnover exceeds SGD 1M globally and they supply digital services to Singapore consumers.

---

## Related

- [PDPA Singapore](../data-privacy/05-pdpa-singapore.md)
- [AML/CFT](../payment-and-financial/03-aml-cft.md)
- [PCI-DSS](../payment-and-financial/01-pci-dss.md)
- [FATF Recommendations](../identity-and-kyc/03-fatf-recommendations.md)
