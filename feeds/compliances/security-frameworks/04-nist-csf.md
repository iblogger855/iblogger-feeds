# NIST CSF — Cybersecurity Framework

**Jurisdiction:** USA (globally adopted)  
**Current version:** CSF 2.0 (February 2024)  
**Applies to:** Originally critical infrastructure; now adopted by all sectors globally  
**Administered by:** NIST (National Institute of Standards and Technology), US Dept of Commerce  
**Tags:** #compliance #nist #csf #cybersecurity #framework #risk

---

## What It Is

NIST CSF is a voluntary framework that helps organisations manage and reduce cybersecurity risk. It is not a regulation — it is a structured approach to cybersecurity that can be used independently or to satisfy regulatory requirements (many US regulations accept NIST CSF as a compliance path).

CSF 2.0 added a sixth function (Govern) to the original five.

---

## The Six Functions (CSF 2.0)

```
GOVERN ─────────────────────────────────────────────────────┐
  Organisational context, risk management strategy,          │
  supply chain risk, policies, roles, oversight              │
                                                             │
IDENTIFY ──► PROTECT ──► DETECT ──► RESPOND ──► RECOVER     │
                                                             │
└───────────────────────────────────────────────────────────┘
```

| Function | What it covers |
|:---------|:--------------|
| **Govern** (new in 2.0) | Cybersecurity strategy, policies, roles, supply chain risk, oversight |
| **Identify** | Asset management, risk assessment, business environment |
| **Protect** | Access control, awareness training, data security, maintenance, protective technology |
| **Detect** | Anomaly detection, continuous monitoring, detection processes |
| **Respond** | Response planning, communications, analysis, mitigation |
| **Recover** | Recovery planning, improvements, communications |

---

## Key Categories per Function

### Identify
- **Asset Management**: Inventory of all hardware, software, data, and personnel
- **Risk Assessment**: Threat identification, vulnerability assessment, risk scoring
- **Supply Chain Risk**: Third-party risk management

### Protect
- **Identity Management and Access Control**: Authentication, least privilege, MFA
- **Awareness and Training**: Regular security training for all staff
- **Data Security**: Data classification, encryption, lifecycle management
- **Protective Technology**: Firewalls, endpoint protection, secure configuration

### Detect
- **Anomalies and Events**: Baseline normal activity, detect deviations
- **Security Continuous Monitoring**: SIEM, log aggregation, threat feeds
- **Detection Processes**: Documented detection procedures, tested regularly

### Respond
- **Response Planning**: Incident response plan
- **Communications**: Internal and external (regulatory, media) communication during incident
- **Analysis**: Forensics, root cause analysis
- **Mitigation**: Containment and eradication

### Recover
- **Recovery Planning**: Business continuity and disaster recovery plans
- **Improvements**: Post-incident improvements
- **Communications**: Restore stakeholder trust

---

## Implementation Tiers

| Tier | Description |
|:-----|:------------|
| **1 — Partial** | Ad hoc, reactive. No formal processes. |
| **2 — Risk Informed** | Some processes in place but not consistent across organisation. |
| **3 — Repeatable** | Formal policies, consistent implementation, risk-informed. |
| **4 — Adaptive** | Continuously improving. Uses threat intelligence. Fully integrated. |

Most organisations should target **Tier 3**. Tier 4 is for critical infrastructure.

---

## NIST CSF vs ISO 27001

| Aspect | NIST CSF | ISO 27001 |
|:-------|:---------|:----------|
| Type | Framework (voluntary) | Certifiable standard |
| Output | Self-assessment / profile | Certificate |
| Prescriptiveness | Flexible, outcomes-based | Prescriptive, controls-based |
| Geography | US-centric but globally used | Global |
| Cost | Free to use | £20K–£80K for certification |
| Use case | Risk management framework | Formal certification for customers |

---

## NIST SP 800-53

NIST Special Publication 800-53 is the detailed control catalogue that underpins CSF. It lists hundreds of specific security controls in 20 families. US federal agencies must comply with SP 800-53. Private sector uses it as a reference.

Key control families relevant to web platforms:
- AC — Access Control
- AU — Audit and Accountability
- IA — Identification and Authentication
- SC — System and Communications Protection
- SI — System and Information Integrity

---

## What to Build

```
Using NIST CSF to structure your security programme:

GOVERN:
□ Information security policy — approved by leadership
□ Defined cybersecurity roles and responsibilities
□ Supply chain risk assessment for critical vendors

IDENTIFY:
□ Asset inventory — all systems, data, personnel
□ Data classification policy
□ Annual risk assessment

PROTECT:
□ MFA on all sensitive systems
□ Role-based access — least privilege
□ Security awareness training — annual
□ Data encryption at rest and in transit
□ Endpoint protection

DETECT:
□ Centralised logging (SIEM)
□ Anomaly detection alerts
□ Regular log review

RESPOND:
□ Incident response plan — documented and tested
□ On-call rotation
□ Communication templates for breaches

RECOVER:
□ Backup and recovery procedures — RTO/RPO defined
□ Post-incident review process
```

---

## Related

- [SOC 2](./01-soc2.md)
- [ISO 27001](./02-iso-27001.md)
- [CIS Benchmarks](./05-cis-benchmarks.md)
