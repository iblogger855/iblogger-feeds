# SWIFT CSP — Customer Security Programme

**Jurisdiction:** Global  
**Applies to:** All financial institutions connected to the SWIFT network  
**Administered by:** SWIFT (Society for Worldwide Interbank Financial Telecommunication)  
**Tags:** #compliance #swift #csp #financial #banking #security

---

## What It Is

SWIFT CSP is a mandatory security framework for all banks and financial institutions using the SWIFT messaging network — the global system for international wire transfers. It was created after the 2016 Bangladesh Bank heist where attackers stole $81M by compromising SWIFT messaging infrastructure.

---

## Why It Exists

```
THE BANGLADESH BANK HEIST (2016):
  Attackers compromised the bank's SWIFT terminals
  Sent fraudulent SWIFT MT103 messages to the NY Fed
  Instructed transfer of $951M from Bangladesh's account
  $81M was transferred before fraud was detected
  Most was lost through Philippine casinos
  → SWIFT created CSP to prevent recurrence
```

---

## CSCF — Customer Security Controls Framework

The CSP is built around the CSCF (Customer Security Controls Framework), which has **mandatory** and **advisory** controls:

### Mandatory Controls (must comply)

| # | Control | Purpose |
|:--|:--------|:--------|
| 1.1 | SWIFT Environment Protection | Isolate SWIFT infrastructure from the rest of the network |
| 1.2 | Privileged Account Control | Restrict and monitor privileged access |
| 2.1 | Internal Data Flow Security | Protect SWIFT data in transit within the institution |
| 2.2 | Security Updates | Patch all SWIFT-related systems |
| 2.3 | System Hardening | Minimise attack surface |
| 4.1 | Password Policy | Strong passwords for SWIFT systems |
| 5.1 | Logical Access Controls | Multi-factor authentication |
| 5.2 | Token Management | Hardware tokens for SWIFT access |
| 6.1 | Operator Session Integrity | Protect active SWIFT sessions |
| 7.1 | Cyber Incident Response | Formal incident response plan |
| 7.2 | Security Training | Mandatory SWIFT security training |
| 7.3 | Penetration Testing | Annual pen test of SWIFT environment |
| 7.4 | Scenario Risk Assessment | Annual risk assessment |

---

## Annual Attestation

Every SWIFT member must **annually attest** their compliance status through the SWIFT KYC Security Attestation (KYC-SA) platform. Non-attestation is reported to supervisory authorities.

---

## MT103 — The Standard Wire Transfer Message

MT103 is the SWIFT message format for international customer credit transfers. It contains:

```
Field 20:  Transaction Reference Number
Field 32A: Value Date, Currency, Amount
Field 50:  Ordering Customer (sender)
Field 52:  Ordering Institution (sender's bank)
Field 56:  Intermediary Institution (correspondent bank)
Field 57:  Account with Institution (beneficiary's bank)
Field 59:  Beneficiary Customer (recipient)
Field 70:  Remittance Information
Field 71:  Details of Charges (SHA/OUR/BEN)
```

Protecting the integrity of MT103 messages is the core purpose of CSP.

---

## What to Build / Implement

```
For banks and financial institutions on SWIFT:

□ Dedicated, isolated SWIFT environment (separate network segment)
□ No direct internet access from SWIFT systems
□ MFA for all SWIFT operator accounts
□ Hardware tokens for SWIFT authentication
□ Real-time transaction monitoring for anomalous SWIFT messages
□ Callback/confirmation procedure for large-value transfers
□ Annual penetration test of SWIFT infrastructure
□ Annual CSCF attestation on KYC-SA platform
□ Incident response plan specifically covering SWIFT compromise
□ Staff training on social engineering targeting SWIFT credentials
```

---

## Related

- [AML/CFT](./03-aml-cft.md)
- [NBC Cambodia](./05-nbc-cambodia.md)
- [Ad Revenue & Creator Payout](../../procedures/payments-and-revenue/03-ad-revenue-and-creator-payout.md) — uses SWIFT MT103 for international payouts
