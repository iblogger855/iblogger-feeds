# FS Module 15 (Detailed): Product Demand Testing — Build-Ready Spec

> Deep companion to [Module 15 — Product Demand Testing](15-product-testing.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [15](15-product-testing.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Demand Test screen** validates a product on social before any inventory is bought, then maps the result to Stock/Dropship/Drop. It matters because avoiding one dead-inventory buy can outweigh several good sales. Traces to **PT-1…PT-8**.

## 2. Use Case — UC-15.1 Run a demand test & decide

| Element | Detail |
|---------|--------|
| Primary actor | Owner/Marketing |
| Trigger | A candidate product to evaluate before buying |
| Pre-conditions | Candidate defined; sold as pre-order only during test |
| Post-conditions | Decision recorded; fulfillment type set; PO suggested if Stock |
| Main success scenario | 1. Create test (channel/type/budget/window, optional A/B). 2. Sell pre-order only; capture signals. 3. At window end, see result vs thresholds. 4. Accept → set fulfillment type (+ suggested PO). |
| Extensions | 4a. Weak but Owner believes → override Drop, logged. 4b. High clicks/zero orders → re-test at new price. |
| Priority | High |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  Demand Test: Mini LED Lamp   Window: 3 days     │
│  Variant Views Taps Comments Pre-orders          │
│   A $14 5,200 240  38       31                   │
│   B $11 5,000 260  41       36                   │
│   ① Ad spend:[15]                                │
│  ② Result: ✅ STOCK (≥40/≥0.6%)  PO:80  price:13 │
│   [③ Accept→Stocked+PO] [④ Dropship] [⑤ Drop]    │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| — | Channel/type | dropdown | Yes | enum | post/ad/live | post | user |
| — | Budget cap | number | No | money(base) ≥0 | — | 0 | user |
| — | Window | date range | Yes | daterange | — | empty | user |
| ① | Ad spend | number | No | money(base) ≥0 | — | 0 | user/API |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Window | start ≤ end | "Invalid test window" |
| Sell-during-test | pre-order/dropship only | (PT-4 — no stock assumed) |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ③ Accept→Stocked+PO | set fulfillment Stocked + suggest first PO (PT-6) | result computed |
| ⑤ Drop | archive candidate, buy nothing (PT-5) | always |

## 5. Open Issues

| Issue | Status |
|---|---|
| Threshold values for Stock/Dropship/Drop | Open — Owner |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
