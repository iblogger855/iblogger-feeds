# Europe Regional Compliance Overview

**Region:** European Union, United Kingdom, and Key Member States  
**Tags:** #compliance #europe #eu #gdpr #uk #france #germany #fintech #healthcare

---

## European Union — Supranational Framework

The EU has the most comprehensive regulatory environment in the world. EU Regulations apply directly in all 27 member states without national implementation. EU Directives require member states to implement national laws.

### Core EU Regulations (directly applicable)

| Regulation | Applies to | Summary |
|:-----------|:-----------|:--------|
| [GDPR](../data-privacy/01-gdpr.md) | Any platform processing EU personal data | Data protection, consent, rights, DPAs |
| [EU AI Act](../eu-specific/06-ai-act.md) | AI providers and deployers in EU market | Risk-based AI classification, high-risk obligations |
| [MiCA](../eu-specific/03-mica.md) | Crypto issuers and CASPs | CASP licensing, stablecoin rules |
| [DORA](../eu-specific/02-dora.md) | Financial entities and critical ICT providers | Operational resilience, 4h incident reporting |

### Core EU Directives (implemented by member states)

| Directive | Applies to | Summary |
|:----------|:-----------|:--------|
| [NIS2](../eu-specific/01-nis2.md) | Essential and important entities | Cybersecurity, 24h early warning |
| [ePrivacy](../eu-specific/04-eprivacy.md) | Any website/app serving EU users | Cookies, marketing, consent |
| PSD2 | Payment service providers | Open banking, SCA, fraud monitoring |

---

## France

### Key Authorities
- **CNIL** (Commission Nationale de l'Informatique et des Libertés) — data protection and cookie enforcement
- **ANSSI** (Agence Nationale de la Sécurité des Systèmes d'Information) — national cybersecurity agency
- **ANS** (Agence du Numérique en Santé) — health data and HDS certification
- **AMF** (Autorité des Marchés Financiers) — financial markets regulator
- **ACPR** (Autorité de Contrôle Prudentiel et de Résolution) — banking and insurance supervisor

### France-Specific Regulations

#### HDS — Hébergeur de Données de Santé
The most distinctive French regulation — mandatory certification for hosting health data.

See full guide: [HDS France](../eu-specific/05-hds-france.md)

```
Key requirements:
□ ISO 27001 + ISO 27701 certification prerequisite
□ Six hosting activities — certification per activity performed
□ Data storage ONLY in France/EEA
□ Accredited certification body audit (BSI, Bureau Veritas, LSTI)
□ Valid 3 years — annual surveillance audits
□ Criminal penalties: up to 3 years imprisonment, €225,000 org fine
```

#### CNIL Cookie Enforcement
France has the EU's most active cookie consent enforcement:

```
Key requirements (France-specific interpretation):
□ "Reject all" button must be equal prominence to "Accept all"
□ No consent walls — cannot block site access for refusing tracking
□ Consent records mandatory — who, what, when
□ Notable fines: Google €150M, Facebook €60M (2022)
```

#### RGPD / GDPR Implementation
France implements GDPR with specific CNIL guidance:
- DPO registration with CNIL for organisations processing at scale
- CNIL guidance on legitimate interest vs consent for B2B data
- Specific rules for employee monitoring

---

## Germany

### Key Authorities
- **BfDI** (Bundesbeauftragter für den Datenschutz und die Informationsfreiheit) — federal data protection
- **16 Landesbeauftragte** — state DPAs (each state has its own)
- **BSI** (Bundesamt für Sicherheit in der Informationstechnik) — cybersecurity
- **BaFin** — financial markets and banking supervision

### Germany-Specific Regulations

#### BDSG — Bundesdatenschutzgesetz
German national data protection law complementing GDPR:

```
Key differences from base GDPR:
□ Employee data processing — stricter rules, works council involvement
□ DPO mandatory threshold: 20+ persons regularly processing personal data
  (vs GDPR's risk-based criteria)
□ Video surveillance — specific rules for CCTV in public-accessible areas
□ Scoring and automated decisions — stricter rules for credit scoring
```

#### TTDSG — Telekommunikation-Telemedien-Datenschutz-Gesetz (2021)
Germany's implementation of ePrivacy — stricter than the EU minimum:

```
Key requirements:
□ Consent required for ALL tracking technologies — not just cookies
□ Service providers cannot condition access on tracking consent
□ Consent Management Services (PIMS) can store consent signals
□ Applies to: apps, IoT devices, browser APIs — not just HTTP cookies
```

#### BSI-Grundschutz
Germany's national IT security standard — not mandatory but widely used:
- Comprehensive security baseline catalogue
- Used as reference for NIS2 implementation in Germany
- IT-Grundschutz certification similar to ISO 27001

---

## United Kingdom

### Post-Brexit Landscape
The UK left the EU in 2020. Existing EU law was retained under the European Union (Withdrawal) Act 2018 but the UK now diverges on its own trajectory.

### Key Authorities
- **ICO** (Information Commissioner's Office) — data protection and privacy
- **FCA** (Financial Conduct Authority) — financial services regulation
- **CMA** (Competition and Markets Authority) — competition and consumer protection
- **NCSC** (National Cyber Security Centre) — cybersecurity guidance

### UK-Specific Regulations

#### UK GDPR + Data Protection Act 2018
The UK retained GDPR after Brexit as **UK GDPR** — functionally identical initially but now diverging:

```
Current differences from EU GDPR:
□ ICO (not CNIL/DPA) is the supervisory authority
□ UK-specific adequacy decisions — separate from EU adequacy rulings
□ Data Reform Bill — government proposing changes to reduce some obligations
□ International transfers: UK has its own adequacy decisions
   (EU has adequacy for UK — means EU→UK transfers still permitted)
```

#### PECR — Privacy and Electronic Communications Regulations
UK's ePrivacy equivalent (mirrors EU Cookie Law):
```
□ Consent before non-essential cookies — same as EU
□ Direct marketing opt-in rules
□ ICO actively enforces — fines up to £500,000 (plus UK GDPR maximum £17.5M)
□ SMS/email marketing — soft opt-in exception for existing customers
```

#### FCA Regulations
For fintech platforms operating in the UK:

| Regulation | Applies to | Key requirement |
|:-----------|:-----------|:----------------|
| Payment Services Regulations 2017 | Payment service providers | Authorisation, SCA, fraud reporting |
| Electronic Money Regulations 2011 | E-money issuers | Safeguarding, minimum capital |
| FCA Consumer Duty | All regulated firms | Good outcomes for retail customers |
| Open Banking (CMA Order) | Major UK banks | Account access APIs (PSD2 equivalent) |

```
FCA authorisation requirements for fintech:
□ Apply for relevant authorisation (EMI, PI, broker, etc.)
□ Initial capital: £350K (EMI) — £125K (PI)
□ Safeguarding: 100% client funds ring-fenced
□ Incident reporting: FCA within 1 hour for major operational incidents
□ Consumer Duty: annual outcome monitoring reports
```

---

## Key EU Banking/Fintech Stack

For any European fintech:

```
Regulation stack:
□ GDPR — data protection baseline
□ ePrivacy/PECR — cookie consent and marketing
□ PSD2/PSR — payment authorisation
□ DORA — operational resilience (from Jan 2025)
□ AML/CFT — KYC, transaction monitoring, SAR filing
□ NIS2 — cybersecurity (if essential/important entity)
□ MiCA — if handling crypto assets
□ EU AI Act — if using AI in consequential decisions
```

---

## Key EU Healthcare Stack

```
Regulation stack:
□ GDPR Article 9 — health data as special category
□ EU AI Act (high-risk) — diagnostic AI
□ MDR/IVDR — if product is a medical device
□ HDS (France only) — if hosting French patient data
□ NIS2 — hospitals and healthcare providers as essential entities
```

---

## Related

- [GDPR](../data-privacy/01-gdpr.md)
- [NIS2](../eu-specific/01-nis2.md)
- [DORA](../eu-specific/02-dora.md)
- [MiCA](../eu-specific/03-mica.md)
- [ePrivacy](../eu-specific/04-eprivacy.md)
- [HDS France](../eu-specific/05-hds-france.md)
- [EU AI Act](../eu-specific/06-ai-act.md)
- [PSD2](../payment-and-financial/02-psd2.md)
- [AML/CFT](../payment-and-financial/03-aml-cft.md)
