# CCPA — California Consumer Privacy Act

**Jurisdiction:** California, USA  
**In force:** 1 January 2020 (amended by CPRA, effective 1 January 2023)  
**Applies to:** For-profit businesses that meet any of: annual gross revenue > $25M; buys/sells/receives/shares personal info of 100,000+ California consumers/households; or derives 50%+ of revenue from selling/sharing personal info  
**Tags:** #compliance #ccpa #cpra #data-privacy #usa #california

---

## What It Is

CCPA gives California residents rights over their personal information and requires covered businesses to be transparent about how they collect, use, and share that data. The CPRA (California Privacy Rights Act, 2023) strengthened it further — adding new rights and creating the California Privacy Protection Agency (CPPA).

---

## Key Definitions

| Term | CCPA meaning | vs GDPR |
|:-----|:------------|:--------|
| **Personal information** | Broadly defined — includes name, IP, browsing history, purchase history, biometrics, inferences | Similar to GDPR personal data |
| **Sensitive personal information** | SSN, financial data, health, genetics, precise geolocation, race, religion, sexual orientation | Similar to GDPR special categories |
| **Consumer** | California resident | Data subject |
| **Business** | The covered company | Data controller |
| **Service provider** | Third party processing on behalf of business | Data processor |
| **Sale** | Sharing personal info for monetary or other valuable consideration | Broader than GDPR — includes sharing for targeted advertising |

---

## Consumer Rights

| Right | What the consumer can do | Timeframe |
|:------|:------------------------|:----------|
| **Know** | What categories and specific pieces of personal info are collected | Respond within 45 days |
| **Delete** | Request deletion of their data | Respond within 45 days |
| **Correct** (CPRA) | Correct inaccurate personal information | Respond within 45 days |
| **Opt-out of sale/sharing** | Stop the business selling or sharing their data for cross-context advertising | Must honour immediately |
| **Limit sensitive PI use** (CPRA) | Restrict use of sensitive personal information | Honour within 15 business days |
| **Non-discrimination** | Cannot be denied service or charged more for exercising rights | Immediate |
| **Data portability** (CPRA) | Receive their data in a portable format | Respond within 45 days |

---

## "Do Not Sell or Share My Personal Information"

This is the defining requirement of CCPA. If your business sells or shares personal data (including for targeted advertising), you must:

1. Provide a **"Do Not Sell or Share My Personal Information"** link on your homepage
2. Accept opt-out requests from Global Privacy Control (GPC) browser signals
3. Not sell data of consumers under 16 without opt-in consent (under 13 requires parental consent)

---

## Technical Requirements

### Privacy Notice
- Disclose all categories of personal info collected and why
- Disclose all third parties data is shared with
- Update at least every 12 months

### Consumer Request Mechanism
- Provide at least two methods to submit requests (web form + phone/email)
- Verify identity before responding (without collecting unnecessary data)
- Do not charge a fee for requests (up to 2 per 12-month period)

### Data Mapping
- Know what personal data you collect, where it is stored, and who you share it with
- Required to respond to "Know" requests accurately

### Opt-Out Signal Handling
- Detect and honour Global Privacy Control (GPC) browser signals automatically
- No dark patterns that make opting out harder than opting in

---

## CCPA vs GDPR Key Differences

| Aspect | CCPA | GDPR |
|:-------|:-----|:-----|
| Opt-in vs opt-out | Opt-out model (data collected by default) | Opt-in model (need consent before collection) |
| Threshold | Only large/data-heavy businesses | Any business processing EU resident data |
| Legal basis | No equivalent — opt-out is the mechanism | Must have explicit legal basis |
| Penalties | $100–$750 per consumer per incident (private right of action for data breaches); $2,500–$7,500 per intentional violation | Up to 4% of global turnover |
| Enforcement | California Privacy Protection Agency (CPPA) | National supervisory authorities |

---

## Penalties

| Violation | Fine |
|:----------|:-----|
| Unintentional violation | Up to $2,500 per violation |
| Intentional violation | Up to $7,500 per violation |
| Data breach (private right of action) | $100–$750 per consumer per incident |

---

## What to Build

```
Minimum CCPA implementation:

□ "Do Not Sell or Share" link on homepage and privacy policy
□ Global Privacy Control (GPC) signal detection and honouring
□ Consumer request portal — Know, Delete, Correct, Opt-out flows
□ Identity verification for requests
□ Privacy notice — updated annually, all categories listed
□ Data map — all personal data categories, storage, and sharing partners
□ Service provider agreements — with all third-party processors
□ Record of requests — log all consumer requests and responses
□ Under-16 consent gate — if any minor users possible
```

---

## Related

- [GDPR](./01-gdpr.md) — EU equivalent, stricter opt-in model
- [Data Privacy Comparison Matrix](./07-comparison-matrix.md)
- [Account Deletion & Data Retention Procedure](../../procedures/compliance-and-accounts/01-account-deletion-and-data-retention.md)
