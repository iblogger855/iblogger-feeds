# FS Module 3 (Detailed): Inventory & Products — Build-Ready Spec

> Deep companion to [Module 3 — Inventory](03-inventory.md). Full FSD depth.
>
> ⚠️ **Illustrative detail** — confirmed when the module enters a build sprint.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [03](03-inventory.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Product / Variant screen** is the catalog and the single truth of what we can sell. It matters because the Stocked/Dropship flag here decides the whole downstream flow, and the stock number here is what prevents (or causes) overselling. Traces to **IN-1…IN-8**.

## 2. Use Case — UC-3.1 Create a product & manage stock

| Element | Detail |
|---------|--------|
| Primary actor | Owner (setup); Inventory staff (stock) |
| Trigger | A new product to sell, or a stock count/adjustment |
| Pre-conditions | Logged in with the right role |
| Post-conditions | Product sellable; variants stock-tracked (if Stocked) |
| Main success scenario | 1. Open **New Product**, enter name/SKU/price/photos. 2. Set fulfillment type. 3. Add variants. 4. Save. 5. For stock changes, post a stock adjustment with a reason. |
| Extensions | 2a. Dropship → no stock fields shown; sells "made to order". 5a. Adjustment reason required or save blocked (IN-5). |
| Priority | High |

## 3. Mock-up — Product / Variant

```
┌──────────────────────────────────────────────┐
│  New Product                                    │
│  ① Name:[ Red Tee ]   ② SKU:[ TEE-RED ]         │
│  ③ Price:[25]   ④ Fulfillment: (•)Stocked ( )Drop│
│  ⑤ Photos: [ upload ]                           │
├──────────────────────────────────────────────┤
│  Variants                        [⑥ + Variant]  │
│   Red/L  avail:[47]  low-at:[10]  [adjust ▾]    │
│   Red/M  avail:[12]  low-at:[10]                │
├──────────────────────────────────────────────┤
│         [ Save ]    [⑦ Deactivate ]             │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|----------|-------|-----------|-------|-----------|-----------|---------|--------|
| ① | Name | textbox | Yes | text | — | empty | user |
| ② | SKU | textbox | Yes | text (unique) | — | empty | user |
| ③ | Price | number | Yes | money(base) ≥0 | — | empty | user |
| ④ | Fulfillment type | radio | Yes | enum | Stocked / Dropship | Stocked | user |
| — | Variant available | number | Stocked only | integer ≥0 | — | 0 | Inventory |
| — | Low-stock threshold | number | No | integer ≥0 | — | 0 | user |
| — | Adjustment reason | dropdown | Yes (on adjust) | enum | damage / loss / recount / other | empty | user |

### Validation / errors
| Field | Rule | Error |
|-------|------|-------|
| SKU | unique | "SKU already exists" |
| Available | can't go negative | "Stock cannot go below 0" |
| Adjustment | reason required | "Select a reason for the adjustment" |

### Buttons
| Control | OnClick | Enabled |
|---------|---------|---------|
| ⑥ + Variant | add a variant row | always |
| adjust | open adjustment (qty ±, reason) → logged (IN-5) | Stocked variants only |
| ⑦ Deactivate | hide from selling, keep history (IN-8) | products with no open dependencies |

## 5. Open Issues
| ID | Issue | Status |
|----|-------|--------|
| OI-1 | Allow Dropship→Stocked switch mid-life? | Open — PO |

## 6. Approval
| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
