# PCI-DSS — Payment Card Industry Data Security Standard

**Jurisdiction:** Global  
**Version:** PCI-DSS v4.0 (effective March 2024, v3.2.1 retired March 2025)  
**Applies to:** Any organisation that stores, processes, or transmits cardholder data (CHD) — merchants, payment processors, gateways, banks  
**Administered by:** PCI Security Standards Council (PCI SSC)  
**Tags:** #compliance #pci-dss #payment #security #cardholder-data

---

## What It Is

PCI-DSS is a technical security standard for protecting payment card data. It was created by Visa, Mastercard, American Express, Discover, and JCB. Compliance is contractually required by card brands — not a government law, but violations result in fines, increased transaction fees, and ultimately loss of the ability to accept card payments.

---

## Cardholder Data (CHD) vs Sensitive Authentication Data (SAD)

| Data element | Type | Can store (encrypted)? | Can store (unencrypted)? |
|:------------|:-----|:----------------------|:------------------------|
| Primary Account Number (PAN) — the 16-digit card number | CHD | Yes (with strong encryption) | No |
| Cardholder name | CHD | Yes | Yes |
| Expiry date | CHD | Yes | Yes |
| Service code | CHD | Yes | Yes |
| Full magnetic stripe data | SAD | No | No |
| CAV2/CVC2/CVV2/CID (security code) | SAD | No | No |
| PIN / PIN block | SAD | No | No |

**The CVV/CVC must never be stored — ever. Not even in logs.**

---

## SAQ (Self-Assessment Questionnaire) Levels

Your compliance level depends on how you interact with card data:

| SAQ | Who it's for | Typical setup |
|:----|:------------|:--------------|
| **SAQ A** | Merchants that fully outsource card processing | Stripe hosted fields, iFrame checkout — card data never touches your servers |
| **SAQ A-EP** | Merchants with e-commerce, third-party processing but own payment page | Some JavaScript on payment page loads from your server |
| **SAQ B** | Imprint machines or standalone terminals only | Physical POS, no electronic storage |
| **SAQ C** | Payment app connected to internet, no electronic storage | Restaurant POS with internet |
| **SAQ D** | All other merchants and service providers | Direct card processing, own tokenisation |

**For most web platforms using Stripe/Adyen hosted fields: SAQ A** — the simplest and safest scope.

---

## The 12 Requirements

| # | Requirement | Key technical obligation |
|:--|:-----------|:------------------------|
| 1 | Install and maintain network security controls | Firewalls, network segmentation separating CDE |
| 2 | Apply secure configurations | No vendor defaults, no unnecessary services |
| 3 | Protect stored account data | Encryption of PAN, no CVV storage ever |
| 4 | Protect cardholder data in transit | TLS 1.2+ for all card data transmission |
| 5 | Protect systems from malware | AV on all systems, regular scans |
| 6 | Develop and maintain secure systems | Secure SDLC, vulnerability management, patching |
| 7 | Restrict access to cardholder data | Need-to-know basis, RBAC |
| 8 | Identify users and authenticate access | Unique IDs, MFA for remote/admin access |
| 9 | Restrict physical access | Locked server rooms, badge access |
| 10 | Log and monitor all access | Audit logs on all CDE access, 12-month retention |
| 11 | Test security regularly | Quarterly vulnerability scans, annual penetration test |
| 12 | Support information security with policies | Written policies, training, incident response plan |

---

## Cardholder Data Environment (CDE)

The CDE is every system that stores, processes, or transmits CHD, plus all systems that can communicate with those systems.

**The goal is to minimise the CDE scope:**

```
LARGE SCOPE (bad):
  Your entire application server communicates with the payment service.
  All servers are in scope.

MINIMAL SCOPE (good):
  Payment page uses Stripe.js hosted fields.
  Card data goes directly from browser to Stripe — never touches your server.
  Your backend only receives a token.
  CDE = zero servers on your side.
  → SAQ A compliant.
```

---

## How to Stay Out of Scope

1. **Use hosted payment fields** (Stripe Elements, Adyen Drop-in, Braintree hosted fields)
2. **Never log card data** — check all logging libraries and middleware
3. **Tokenise immediately** — replace PAN with a token before any processing
4. **Network segmentation** — keep payment services isolated from the rest of the application

---

## Penalties

Fines are imposed by card brands (Visa, Mastercard), not a government:

| Violation | Consequence |
|:----------|:------------|
| Non-compliance (no breach) | $5,000–$100,000/month per card brand |
| Data breach — non-compliant | $50–$90 per compromised card; full forensic investigation costs |
| Continued non-compliance | Card acceptance privileges revoked |
| Fraudulent charges | Issuing bank chargebacks |

---

## What to Build

```
Minimum PCI-DSS scope reduction (SAQ A):

□ Use Stripe.js / Adyen Drop-in / Braintree hosted fields
   — card data never touches your servers
□ NEVER log card numbers, CVV, or full PANs — anywhere
□ TLS 1.2+ on all endpoints (especially payment pages)
□ Store only the Stripe/Adyen token — never the raw PAN
□ MFA for all admin access to production systems
□ Quarterly vulnerability scans (use a PCI-approved vendor)
□ Annual SAQ completion and submission to acquirer
□ Written information security policy
□ Incident response plan covering card data breach
```

---

## Related

- [Payment Gateway Procedure](../../procedures/payments-and-revenue/01-payment-gateway.md)
- [AML/CFT](./03-aml-cft.md)
- [PSD2](./02-psd2.md)
