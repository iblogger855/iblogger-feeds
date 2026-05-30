# Data Privacy Laws — Comparison Matrix

**Tags:** #compliance #data-privacy #comparison #gdpr #ccpa #pdpa #lgpd

---

## Quick Reference

| Aspect | GDPR (EU) | CCPA/CPRA (CA, USA) | LGPD (Brazil) | PDPA (Thailand) | PDPA (Singapore) | PDPK (Cambodia) |
|:-------|:----------|:--------------------|:--------------|:----------------|:-----------------|:----------------|
| **In force** | May 2018 | Jan 2020 | Aug 2020 | Jun 2022 | Jan 2013 (rev. 2021) | Forthcoming |
| **Model** | Opt-in | Opt-out | Opt-in (GDPR-based) | Opt-in (GDPR-based) | Consent-based | GDPR-based (expected) |
| **Scope** | Any org processing EU resident data | Large CA businesses | Any org processing Brazilian data | Any org processing Thai data | All private orgs in SG | Orgs in Cambodia |
| **Legal bases** | 6 | N/A (opt-out model) | 10 | 6 | Consent + exceptions | TBD |
| **Right to erasure** | Yes | Yes (delete) | Yes | Yes | No general right | TBD |
| **Data portability** | Yes | Yes | Yes | Yes | Yes (2021) | TBD |
| **Breach notification** | 72 hours to DPA | Notify affected users | ANPD + individuals | 72 hours to PDPC | 3 days to PDPC | TBD |
| **DPO required** | Sometimes | No | Sometimes | Sometimes | Recommended | TBD |
| **Max penalty** | 4% global turnover or €20M | $7,500 per intentional violation | 2% Brazil revenue, R$50M cap | THB 5M admin + criminal | 10% SG turnover or SGD 1M | TBD |
| **Children** | Under 16 (varies) | Under 16 (opt-in) | Under 18 | Under 18 | Not specified | TBD |
| **Health data** | Special category — explicit consent | Sensitive PI — limit use right | Sensitive data — explicit consent | Sensitive data — explicit consent | Not specifically called out | MOH Prakas |

---

## Consent Models Compared

```
GDPR / LGPD / PDPA (Thailand):
  Default = cannot collect
  Must get opt-in BEFORE collecting
  Pre-ticked boxes invalid
  Easy withdrawal required

CCPA / CPRA:
  Default = can collect
  Must give opt-OUT mechanism
  "Do Not Sell or Share" link required
  GPC signal must be honoured

Singapore PDPA:
  Consent + legitimate interests + deemed consent
  More flexible than GDPR
  No general right to erasure
```

---

## Breach Notification Timelines

```
GDPR:            72 hours to supervisory authority
LGPD:            "Reasonable time" (ANPD guidance: 72 hours in practice)
PDPA Thailand:   72 hours to PDPC
PDPA Singapore:  3 calendar days to PDPC (after assessment of notifiability)
CCPA:            No time limit specified — "expedient" 
Cambodia:        No formal timeline (cybercrime law: promptly)
```

---

## Data Localisation Requirements

| Country | Requirement |
|:--------|:------------|
| EU (GDPR) | No localisation, but strict cross-border transfer rules |
| Brazil (LGPD) | No general localisation requirement |
| Thailand (PDPA) | Adequate protection required for transfers |
| Singapore (PDPA) | Contractual safeguards for transfers |
| Cambodia (NBC) | Financial data must be stored in Cambodia |
| Vietnam (Cybersecurity Law) | Critical data must be stored locally |
| Indonesia (UU PDP) | Strategic data must be stored locally |

---

## Rights Comparison

| Right | GDPR | CCPA | LGPD | PDPA TH | PDPA SG |
|:------|:----:|:----:|:----:|:-------:|:-------:|
| Access | ✓ | ✓ | ✓ | ✓ | ✓ |
| Correction | ✓ | ✓ (CPRA) | ✓ | ✓ | ✓ |
| Deletion / Erasure | ✓ | ✓ | ✓ | ✓ | ✗ |
| Portability | ✓ | ✓ | ✓ | ✓ | ✓ (2021) |
| Opt-out of sale | N/A | ✓ | N/A | N/A | N/A |
| Object to processing | ✓ | N/A | ✓ | ✓ | ✓ |
| No automated decisions | ✓ | ✓ (CPRA) | ✓ | ✓ | N/A |
| Restrict processing | ✓ | N/A | ✓ | ✓ | N/A |

---

## Which Laws Apply to Your Platform?

```
You have EU users             → GDPR applies
You have California users     → CCPA may apply (check thresholds)
You have Brazilian users      → LGPD applies
You have Thai users           → PDPA (Thailand) applies
You operate in Singapore      → PDPA (Singapore) applies
You operate in Cambodia       → Sub-Decree 32 + sector rules + future PDPK
You have Vietnamese users     → Cybersecurity Law + Decree 13
You have Indonesian users     → UU PDP applies
```

**If multiple laws apply:** Implement the strictest requirements — usually GDPR. A GDPR-compliant system is largely compliant with most other data privacy laws.

---

## Related

- [GDPR](./01-gdpr.md)
- [CCPA](./02-ccpa.md)
- [LGPD](./03-lgpd.md)
- [PDPA Thailand](./04-pdpa-thailand.md)
- [PDPA Singapore](./05-pdpa-singapore.md)
- [PDPK Cambodia](./06-pdpk-cambodia.md)
