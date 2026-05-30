# FS Module 12 (Detailed): Customers, Loyalty & Retention — Build-Ready Spec

> Deep companion to [Module 12 — Customers, Loyalty & Retention](12-customers-loyalty.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [12](12-customers-loyalty.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Customer screen** consolidates a buyer across channels and holds the retention levers (points, credit, segments). It matters because repeat buyers are the cheapest revenue there is. Traces to **CU-1…CU-8**.

## 2. Use Case — UC-12.1 View customer & build a segment

| Element | Detail |
|---------|--------|
| Primary actor | Owner/Marketing/Sales |
| Trigger | Serve a customer; plan re-engagement |
| Pre-conditions | Customer has order history |
| Post-conditions | History shown; segment exported |
| Main success scenario | 1. Open a customer (merged across channels). 2. See history, points, credit. 3. Build a segment (e.g. lapsed VIP). 4. Export for re-engagement (respecting consent). |
| Extensions | 1a. Duplicate handles → merge records (combine history+points). |
| Priority | Medium |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  Customer: Dara  (@dara · 012xxx)                │
│   Orders 4 · LTV 180 · Last 12 days ago          │
│   ① Points:[230]  ② Store credit:[10]            │
│   ③ Consent: ☑ marketing                         │
│  ─ Segments ───────────────────────────────────│
│   ④ [ Lapsed VIP ▾ ]  ⑤ [ Export list ]          │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| ① | Loyalty points | label/number | — | integer | — | computed | system |
| ② | Store credit | label/number | — | money(base) | — | computed | system |
| ③ | Marketing consent | checkbox | No | bool | — | true | customer |
| ④ | Segment | dropdown | No | enum | VIP/Lapsed/One-time/… | — | user |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Redeem points | ≤ balance | "Not enough points" |
| Export | excludes opted-out customers | (CU-8) |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ⑤ Export list | export segment (consent-respecting) for re-engagement (CU-6) | segment selected |

## 5. Open Issues

| Issue | Status |
|---|---|
| Points earn rate + redemption value | Open — Owner |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
