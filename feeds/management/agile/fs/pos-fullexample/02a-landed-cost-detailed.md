# FS Module 2 (Detailed): Import & Landed Cost — Build-Ready Spec

> Deep companion to [Module 2 — Landed Cost](02-landed-cost.md). Full FSD depth.
>
> ⚠️ **Illustrative detail.** Field types and error strings are defaults to show the format; confirmed when the module enters a build sprint.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [02](02-landed-cost.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Shipment / Landed-Cost screen** turns a CNY purchase into a true per-unit cost. It matters because supplier price ≠ real cost — freight, duty, and FX hide here, and getting it wrong means selling at a loss while thinking you're profitable. Traces to **LC-1…LC-7**.

## 2. Use Case — UC-2.1 Compute landed cost for a shipment

| Element | Detail |
|---------|--------|
| Primary actor | Buyer (enters costs); Finance (verifies) |
| Trigger | An inbound shipment (one+ POs) arrives or is in transit |
| Pre-conditions | The POs exist and are Shipped/Received |
| Post-conditions | Each received unit carries a landed cost; stock valued at it |
| Main success scenario | 1. Open the shipment, link its POs. 2. Enter FX rate. 3. Enter freight, duty, handling. 4. Choose allocation method. 5. System computes landed cost/unit; review breakdown. 6. Confirm → stock valued. |
| Extensions | 5a. Late customs invoice → Finance posts an adjustment (LC-6), valuation updates, logged. |
| Priority | High |

## 3. Mock-up — Shipment landed cost

```
┌──────────────────────────────────────────────┐
│  Shipment SH-014        POs: [PO-201][PO-202]   │
├──────────────────────────────────────────────┤
│  ① FX rate (CNY→base): [0.14]  (locked on save) │
│  ② Freight:[280]  ③Duty:[120]  ④Handling:[0]    │
│  ⑤ Allocation: ( ) by qty ( ) by weight (•)value│
├──────────────────────────────────────────────┤
│  ⑥ Computed landed cost / unit:                 │
│     Red Tee  → 3.40     LED Lamp → 2.10          │
│       [⑦ View breakdown]   [⑧ Confirm valuation]│
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|----------|-------|-----------|-------|-----------|-----------|---------|--------|
| ① | FX rate | number | Yes | decimal >0 | — | last rate | user / config |
| ② ③ ④ | Freight / Duty / Handling | number | No | money(base) ≥0 | — | 0 | user |
| ⑤ | Allocation method | radio | Yes | enum | by_quantity / by_weight / by_value | by_quantity | user |
| ⑥ | Landed cost/unit | label | — | money(base) | — | computed | computed |

### Validation / errors
| Field | Rule | Error |
|-------|------|-------|
| FX rate | > 0 | "FX rate must be greater than 0" |
| FX rate | immutable after save | "FX is locked for this shipment; post an adjustment instead" |
| Allocation by_weight | requires unit weights present | "Add unit weights to allocate by weight" |

### Buttons
| Control | OnClick | Enabled |
|---------|---------|---------|
| ⑦ View breakdown | show per-unit: supplier×FX + each fee (LC-7) | always |
| ⑧ Confirm valuation | lock FX, value received stock at landed cost (LC-5) | disabled until FX + ≥1 PO linked |

## 5. Open Issues
| ID | Issue | Status |
|----|-------|--------|
| OI-1 | Default valuation: weighted-average vs FIFO | Open — Owner |

## 6. Approval
| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
