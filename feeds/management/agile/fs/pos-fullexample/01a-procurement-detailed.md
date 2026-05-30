# FS Module 1 (Detailed): Procurement & Suppliers — Build-Ready Spec

> Deep companion to [Module 1 — Procurement](01-procurement.md). Full FSD depth: use cases, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings below are sensible defaults to show the build-ready format — they are confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [01](01-procurement.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Purchase Order screen** is where the Buyer commits company money to a Chinese supplier. It matters because every cost number downstream (landed cost, margin, P&L) originates here — a wrong unit cost or quantity poisons every report later. Traces to **PR-1…PR-8**.

## 2. Use Case — UC-1.1 Create & place a purchase order

| Element | Detail |
|---------|--------|
| Primary actor | Buyer |
| Stakeholders | Owner (approves large spend); Inventory (receives against it); Finance (landed cost) |
| Trigger | Need to restock, or a demand test returned "Stock" |
| Pre-conditions | Buyer logged in; supplier exists (or is created inline) |
| Post-conditions | A PO exists in Ordered (or Draft); awaits receiving |
| Main success scenario | 1. Buyer opens **New PO**, selects a supplier. 2. Adds line items (product, qty, CNY unit cost, supplier SKU). 3. Adds China shipping/fees. 4. Reviews CNY total. 5. Clicks **Place Order** → status Ordered (or routes for approval if over threshold). |
| Extensions | 1a. New supplier → create inline (UC-1.2). 5a. Over approval threshold → status stays Draft, Owner notified for approval (PR-5). |
| Priority | High |

## 3. Mock-up — Purchase Order

```
┌──────────────────────────────────────────────┐
│  New Purchase Order            ① Supplier:[1688 ▾]│
├──────────────────────────────────────────────┤
│  Lines                            [④ + Add line] │
│   ② Product[ Red Tee ▾ ] ③Qty[100] ¥[12.50]     │
│      Supplier SKU:[ A-001 ]        = ¥1,250      │
│  ⑤ China shipping: ¥[80]  Fees: ¥[20]            │
│                       ⑥ CNY TOTAL: ¥1,350        │
├──────────────────────────────────────────────┤
│      [⑦ Save Draft ]        [⑧ Place Order ]    │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|----------|-------|-----------|-------|-----------|-----------|---------|--------|
| ① | Supplier | searchable select | Yes | ref→Supplier | suppliers | empty | Supplier |
| ② | Product | searchable select | Yes | ref→Product | catalog | empty | Catalog |
| ③ | Qty | number | Yes | integer ≥1 | — | 1 | user |
| — | Unit cost (CNY) | number | Yes | money(CNY) ≥0 | — | empty | user |
| — | Supplier SKU | textbox | No | text | — | empty | user |
| ⑤ | China shipping / fees | number | No | money(CNY) ≥0 | — | 0 | user |
| ⑥ | CNY total | label | — | money(CNY) | — | computed | computed |

### Validation / errors
| Field | Rule | Error |
|-------|------|-------|
| Qty | integer ≥ 1 | "Quantity must be at least 1" |
| Unit cost | ≥ 0, required per line | "Enter a CNY unit cost" |
| Order | ≥ 1 line | "Add at least one line item" |

### Buttons
| Control | OnClick | Enabled |
|---------|---------|---------|
| ④ Add line | append blank line | always |
| ⑦ Save Draft | save as Draft | always |
| ⑧ Place Order | validate; if ≤ threshold → Ordered, else → Draft + request Owner approval (PR-5) | disabled until ≥1 valid line |

## 5. Open Issues
| ID | Issue | Status |
|----|-------|--------|
| OI-1 | Approval threshold value (CNY) | Open — Owner |

## 6. Approval
| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
