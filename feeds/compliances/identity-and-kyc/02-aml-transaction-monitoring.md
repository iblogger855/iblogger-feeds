# AML Transaction Monitoring

**Tags:** #compliance #aml #transaction-monitoring #suspicious-activity #sar #fintech

---

## What It Is

Transaction monitoring is the automated and manual process of reviewing financial transactions to detect patterns that may indicate money laundering, fraud, terrorism financing, or other financial crimes. It is a core requirement of AML/CFT regulations globally.

---

## How It Works

```
Transaction occurs
        │
        ▼
Rules engine evaluates transaction against alert rules
        │
   ┌────┴────────────────┐
   │ No alert triggered  │    Alert triggered
   │ (normal)            │        │
   └─────────────────────┘        ▼
                         Alert queue — analyst reviews
                                  │
                        ┌─────────┴─────────┐
                        │ False positive     │  Suspicious
                        │ (dismiss + note)   │      │
                        └────────────────────┘      ▼
                                             File SAR / STR
                                             with national FIU
```

---

## Common Alert Rules

### Volume-Based Rules
| Rule | Description |
|:-----|:------------|
| **Structuring detection** | Multiple transactions just below reporting threshold (e.g. 5× $9,900 in one day) |
| **Velocity** | More transactions than typical for this customer profile in a short period |
| **Large single transaction** | Transaction exceeds defined threshold (e.g. > $10,000 USD) |
| **Cumulative threshold** | Total transactions in 30 days exceed threshold |

### Pattern-Based Rules
| Rule | Description |
|:-----|:------------|
| **Round tripping** | Money goes out and comes back from a different source |
| **Layering** | Rapid movement through multiple accounts or currencies |
| **Geographic mismatch** | Transaction from an unusual country for this customer |
| **High-risk jurisdiction** | Transaction to/from FATF grey/black list country |
| **Dormant account activity** | Account inactive for 6+ months suddenly has large transactions |
| **Same-day in/out** | Funds received and immediately transferred out |
| **Rapid conversion** | Fiat converted to crypto, immediately converted back |

### Relationship-Based Rules
| Rule | Description |
|:-----|:------------|
| **Counterparty risk** | Transaction with a sanctioned or high-risk entity |
| **PEP activity** | Unusual transactions involving a politically exposed person |
| **Network links** | Customer transacts frequently with known suspicious parties |

---

## Alert Thresholds — Tuning

Poorly tuned rules create too many false positives — analysts are overwhelmed and real suspicious activity is buried. Well-tuned rules require:

1. **Baseline profiling** — understand normal transaction patterns for each customer segment
2. **Risk-based thresholds** — higher thresholds for verified, low-risk customers; lower for new/high-risk
3. **Regular calibration** — review false positive rate monthly; adjust thresholds
4. **ML models** (advanced) — anomaly detection trained on historical transaction data

**Target false positive rate:** < 95% of alerts should be dismissed as false positives. If > 99% are false positives, the rules are too sensitive.

---

## SAR / STR Filing

When a transaction is assessed as suspicious:

| Step | Action |
|:-----|:-------|
| 1 | Document the suspicious indicators in detail |
| 2 | Do NOT tip off the customer — tipping off is a criminal offence |
| 3 | File a SAR (Suspicious Activity Report) or STR (Suspicious Transaction Report) with the national FIU |
| 4 | Continue the relationship normally unless the FIU instructs otherwise |
| 5 | Retain a copy of the SAR for 5 years |

### Filing Timeline by Jurisdiction

| Jurisdiction | Filing deadline |
|:-------------|:---------------|
| USA (FinCEN) | Within 30 days of detection (60 days if subject unknown) |
| UK (NCA) | As soon as practicable |
| EU | Varies by member state (typically 24–72 hours) |
| Cambodia (NBC FIU) | Within 2 working days |
| Singapore (SPF) | As soon as practicable |
| Thailand (AMLO) | Within 3 working days |

---

## Technology Options

| Approach | Tools | Best for |
|:---------|:------|:---------|
| Rules-based | Oracle FCCM, Actimize, NICE Actimize | Banks, established institutions |
| ML-based | Featurespace, Feedzai, ComplyAdvantage | FinTechs, real-time monitoring |
| Cloud SaaS | Unit21, Sardine, Sift | Startups, e-commerce, platforms |
| Open source | Open rules engine + custom rules | Very small volumes, internal build |

---

## Record Keeping

| Record | Retention |
|:-------|:----------|
| Alert records (including dismissed alerts) | 5 years |
| SAR copies | 5 years after filing |
| Investigation notes | 5 years |
| Calibration records | 5 years |

---

## Related

- [AML/CFT](../payment-and-financial/03-aml-cft.md)
- [KYC/KYB Fundamentals](./01-kyc-kyb-fundamentals.md)
- [Sanctions Screening](./04-sanctions-screening.md)
- [FATF Recommendations](./03-fatf-recommendations.md)
