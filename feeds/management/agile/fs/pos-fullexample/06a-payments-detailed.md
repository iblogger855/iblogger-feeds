# FS Module 6 (Detailed): Payments & Reconciliation — Build-Ready Spec

> Deep companion to [Module 6 — Payments & Reconciliation](06-payments.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [06](06-payments.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Payment / Reconcile screen** makes the money we *should* have match the money we *do* have. It matters because COD, bank, wallet, and prepaid all land at different times, and unreconciled cash is how resell businesses quietly lose money. Traces to **PM-1…PM-9**.

## 2. Use Case — UC-6.1 Record & confirm a payment; reconcile COD

| Element | Detail |
|---------|--------|
| Primary actor | Finance |
| Trigger | Customer pays, or a courier remits COD |
| Pre-conditions | An order exists |
| Post-conditions | Payment(s) Confirmed; order paid/partial status derived |
| Main success scenario | 1. Open the order. 2. Add a payment (method + amount). 3. For bank/COD, confirm against proof/remittance. 4. Status recomputes. |
| Extensions | 3a. COD batch → reconcile a lump remittance across orders (PM-5). 3b. Mismatch → confirm actual amount, leave remainder. |
| Priority | High |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  Order #1042 · Total 59 · Status: PARTIAL        │
│   • Bank-ABA 20  ✓ Confirmed (Chenda)            │
│   • COD 39  ⏳ to collect (courier X)            │
│  ① [ + Add payment ]                             │
│   Method:[ Bank-ABA ▾ ] Amount:[__] Proof:[up]   │
│   ② [ Confirm payment ]  (Finance only)          │
│  ─ COD Reconciliation (courier X) ─────────────  │
│   ③ Remitted:[540]  ☑#1042 ☑#1043 … ☐#1051       │
│   ④ [ Reconcile selected ]                       │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| — | Method | dropdown | Yes | enum | COD/Bank-ABA/Wallet/Prepaid | COD | system |
| — | Amount | number | Yes | money(base) >0 | — | empty | user |
| — | Proof | file upload | No | file | — | empty | user |
| ③ | Remitted total | number | Yes (reconcile) | money(base) | — | empty | Finance |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Amount | > 0 and ≤ remaining (except cash → change due) | "Amount exceeds remaining balance" |
| Confirm | Finance role only | "Requires Finance role" |
| Confirmed payment | immutable | "Confirmed payment — post a logged reversal instead" |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ② Confirm payment | mark Confirmed; recompute order status (PM-4, PM-9) | Finance role; amount valid |
| ④ Reconcile selected | mark selected COD orders paid; update float (PM-5, PM-6) | ≥1 order selected |

## 5. Open Issues

| Issue | Status |
|---|---|
| Auto-confirm via gateway callback in MVP or post-MVP? | Open — Dev |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
