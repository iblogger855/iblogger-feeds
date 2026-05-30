# MiCA — Markets in Crypto-Assets Regulation

**Jurisdiction:** European Union  
**In force:** 29 June 2023 (stablecoins: June 2024; all other provisions: December 2024)  
**Applies to:** Issuers of crypto-assets and Crypto-Asset Service Providers (CASPs) in the EU  
**Tags:** #compliance #mica #eu #crypto #stablecoin #casp #defi

---

## What It Is

MiCA is the EU's comprehensive regulatory framework for crypto-assets. Before MiCA, crypto was largely unregulated in the EU (each member state had fragmented rules). MiCA creates a single EU-wide licence for crypto businesses — a "passporting" system similar to banking. It is the world's first comprehensive crypto regulation at continental scale.

---

## Scope

### What MiCA Covers
- Asset-referenced tokens (ARTs) — backed by multiple assets (basket stablecoins)
- Electronic money tokens (EMTs) — backed by a single fiat currency (stablecoins like USDC)
- Other crypto-assets (utility tokens, most other cryptos)
- Crypto-Asset Service Providers (CASPs)

### What MiCA Does NOT Cover
- Financial instruments already regulated (tokenised securities → MiFID II)
- Central Bank Digital Currencies (CBDCs)
- NFTs (mostly) — purely unique tokens fall outside scope
- DeFi — fully decentralised protocols with no identifiable issuer (significant grey area)

---

## Categories and Requirements

### Electronic Money Tokens (EMTs) — Stablecoins
Pegged to a single fiat currency (e.g. EUR, USD):

```
□ Must be issued by authorised credit institution OR e-money institution
□ Reserve assets must fully back the token 1:1
□ Reserves held in segregated accounts — protected if issuer fails
□ Redemption at par value on demand — no fees for small amounts
□ Significant EMTs (>5M transactions/day or >€200M daily volume) face enhanced requirements
```

### Asset-Referenced Tokens (ARTs) — Basket Stablecoins
Backed by multiple currencies, commodities, or crypto-assets:

```
□ Authorisation from home member state national competent authority
□ White paper published and submitted to authority
□ Stable reserve mechanism
□ Governance requirements
□ Significant ARTs supervised by EBA (European Banking Authority)
□ Prohibited to offer interest on ART holdings
```

### Other Crypto-Assets (Utility Tokens)
```
□ White paper — must be published and notified to competent authority
□ White paper is not approved — issuer is responsible for accuracy
□ Marketing communications must be consistent with white paper
□ 14-day right of withdrawal for retail investors
□ No liability cap below €125M for misleading white papers
```

---

## Crypto-Asset Service Providers (CASPs)

To provide crypto services in the EU, you must be a licensed CASP. Services requiring a licence:

| Service | Description |
|:--------|:------------|
| Custody and administration | Holding crypto on behalf of clients |
| Operation of trading platform | Exchange / DEX with an identifiable operator |
| Exchange for fiat | Buying/selling crypto for fiat |
| Exchange crypto-to-crypto | Trading between different crypto-assets |
| Order execution | Executing orders on behalf of clients |
| Placement | Placing crypto-assets on behalf of issuers |
| Reception and transmission | Receiving and forwarding client orders |
| Providing advice | Advising on crypto-assets |
| Portfolio management | Managing client crypto portfolios |
| Transfer services | Transferring crypto-assets on behalf of clients |

### CASP Authorisation Requirements
```
□ Legal entity established in the EU
□ Fit and proper management — no criminal convictions
□ Minimum initial capital (€50K–€150K depending on services)
□ Prudential requirements and ongoing capital
□ Safeguarding client assets — segregation
□ AML/CFT compliance — full KYC, Travel Rule
□ Complaint handling procedures
□ Conflict of interest management
□ Cybersecurity and operational resilience (NIS2/DORA applies)
□ Disclosure obligations
□ White paper for any crypto-asset offered
```

---

## Travel Rule Under MiCA

CASPs must comply with the Travel Rule (extending FATF Recommendation 16 to crypto):
- Transfers above €1,000 equivalent must carry originator and beneficiary information
- Self-hosted wallet transfers: CASPs must assess risk and may require additional verification
- Record keeping: 5 years

---

## Market Manipulation and Insider Trading

MiCA introduces market integrity rules for crypto:
- Insider dealing — trading on material non-public information is prohibited
- Market manipulation — wash trading, spoofing, layering — prohibited
- Unlawful disclosure — prohibited

---

## Penalties

| Violation | Maximum |
|:----------|:--------|
| Operating without authorisation | €5M or 3% of annual turnover |
| Market manipulation | €15M or 15% of annual turnover (for legal entities) |
| Insider trading | €15M or 15% of annual turnover |
| Misleading white paper | Compensation to investors, fines |

---

## What to Build

```
For a crypto exchange or wallet provider in the EU:

□ Legal entity in EU member state
□ CASP authorisation application to home NCA
□ White paper for any tokens issued
□ KYC/AML programme — full CDD
□ Travel Rule implementation for transfers > €1,000
□ Self-hosted wallet risk assessment procedure
□ Client asset segregation — separate from company assets
□ Minimum capital maintenance
□ Cybersecurity programme — DORA requirements
□ Complaint handling process
□ Conflict of interest policy
□ Disclosure framework — prices, costs, risks
□ Market surveillance — detect/prevent manipulation
```

---

## Related

- [AML/CFT](../payment-and-financial/03-aml-cft.md)
- [FATF Recommendations](../identity-and-kyc/03-fatf-recommendations.md) — Travel Rule
- [DORA](./02-dora.md) — operational resilience for CASPs
- [PSD2](../payment-and-financial/02-psd2.md)
- [Regional: Europe Overview](../regional/07-europe-overview.md)
