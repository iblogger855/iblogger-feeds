# EU AI Act — Artificial Intelligence Regulation

**Jurisdiction:** European Union  
**In force:** 1 August 2024 (phased implementation: 2024–2027)  
**Applies to:** Providers, deployers, importers, and distributors of AI systems in the EU market  
**Tags:** #compliance #ai-act #eu #artificial-intelligence #high-risk-ai

---

## What It Is

The EU AI Act is the world's first comprehensive legal framework for artificial intelligence. It takes a **risk-based approach** — classifying AI systems by risk level and applying proportionate requirements. It applies to any AI system placed on the EU market or used by EU residents, regardless of where the developer is based.

---

## Risk Classification

### Unacceptable Risk (Prohibited) — Article 5

These AI systems are **banned** in the EU:

```
✗ Social scoring by governments or public authorities
✗ Real-time biometric identification in public spaces (law enforcement — with narrow exceptions)
✗ Subliminal manipulation exploiting human weaknesses
✗ Exploitation of vulnerable groups (children, elderly, disability)
✗ Emotion recognition in workplaces and educational institutions
✗ Biometric categorisation inferring sensitive attributes (race, religion, political opinions, etc.)
✗ Predictive policing based on profiling
```

### High-Risk AI — Article 6 and Annex III

These require the strictest compliance before deployment:

| Sector | High-risk AI examples |
|:-------|:---------------------|
| Critical infrastructure | Safety components in energy, water, transport |
| Education | AI for student assessment, admissions decisions |
| Employment | CV screening, job matching, performance monitoring |
| Essential services | Credit scoring, insurance risk assessment, benefits decisions |
| Law enforcement | Risk assessment, evidence evaluation, crime prediction |
| Migration/asylum | Document authenticity, risk assessment |
| Justice | AI-assisted judicial decisions |
| Healthcare | Medical devices classified as SaMD, AI for medical diagnosis |
| Biometric identification | Remote biometric identification systems |

### General Purpose AI (GPAI) — Articles 51–56

Foundation models (LLMs like GPT-4, Gemini, Claude) and GPAI that power other AI systems:

| Type | Obligations |
|:-----|:------------|
| All GPAI | Technical documentation, copyright compliance, training data transparency |
| GPAI with systemic risk (>10^25 FLOPs training compute) | Adversarial testing, incident reporting to Commission, cybersecurity measures |

### Limited Risk

- Chatbots and AI that interacts with humans → must disclose it is AI
- Deepfakes → must be labelled as artificially generated
- Emotion recognition systems → disclose to users

### Minimal Risk (No Obligations)

AI-powered spam filters, video games, AI-powered recommendation systems with no significant impact.

---

## High-Risk AI — Compliance Requirements

If your AI system is high-risk, before placing it on the market you must:

```
□ Risk management system — identify, analyse, evaluate risks
□ Data governance — training, validation, testing data quality
□ Technical documentation — design, development, testing records
□ Record keeping — automatic logging of system operation
□ Transparency — users informed they are interacting with AI
□ Human oversight — ability for humans to intervene and override
□ Accuracy, robustness, cybersecurity — validated performance metrics
□ Conformity assessment — self-assessment or third-party audit
□ EU declaration of conformity
□ CE marking (for product-related AI)
□ Registration in EU database (for deployers of high-risk AI)
□ Post-market monitoring — ongoing performance tracking
□ Incident reporting — serious incidents to market surveillance authority
```

### Fundamental Rights Impact Assessment (FRIA)

Deployers of high-risk AI in public administration, employment, essential services, and law enforcement must conduct a FRIA — assessing impact on fundamental rights.

---

## Timeline

| Date | What comes into force |
|:-----|:----------------------|
| **February 2025** | Prohibited practices ban (unacceptable risk) |
| **August 2025** | GPAI obligations, governance rules |
| **August 2026** | High-risk AI systems (Annex III) — most obligations |
| **August 2027** | High-risk AI in products (medical devices, machinery, vehicles) |

---

## Penalties

| Violation | Maximum |
|:----------|:--------|
| Prohibited AI practices | €35M or 7% of global annual turnover |
| High-risk AI non-compliance | €15M or 3% of global annual turnover |
| Providing incorrect information | €7.5M or 1.5% of global annual turnover |
| SMEs and start-ups | Lower of the above or fixed amount |

---

## Impact on Healthcare AI

Healthcare AI is a primary concern:

- **Diagnostic AI** (AI detecting cancer, reading ECGs) → High-risk → Annex III + Medical Device Regulation
- **Clinical decision support** that could harm patients → High-risk
- **Administrative AI** (appointment scheduling, billing) → Lower risk
- **AI for research** (with appropriate safeguards) → Generally lower risk

Healthcare AI must comply with **both AI Act AND MDR/IVDR** — the stricter requirements apply.

---

## What to Build

```
For a platform deploying AI that may be high-risk:

□ Classify your AI systems by risk category
□ For high-risk: implement full compliance framework above
□ For GPAI use: understand obligations of GPAI provider you use
□ AI transparency: disclose AI interaction to users
□ Human oversight: implement override mechanisms for consequential decisions
□ Document training data, model design, testing procedures
□ Post-market monitoring: track performance, drift, incidents
□ Register in EU database (deployer obligation for high-risk)
□ Incident reporting mechanism
□ Legal review: is your AI a medical device? → MDR also applies
□ Fundamental rights impact assessment (FRIA) if required
```

---

## Related

- [Medical Device Regulation](../healthcare/04-medical-device-regulation.md) — AI as a medical device
- [GDPR](../data-privacy/01-gdpr.md) — AI processing personal data
- [NIS2](./01-nis2.md) — cybersecurity requirements for AI systems
- [Regional: Europe Overview](../regional/07-europe-overview.md)
