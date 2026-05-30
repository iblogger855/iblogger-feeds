# FS Module 5 (Detailed): Fulfillment & Delivery — Build-Ready Spec

> Deep companion to [Module 5 — Fulfillment & Delivery](05-fulfillment.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [05](05-fulfillment.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Dispatch screen** is where a confirmed order becomes a moving parcel. It matters because this is where COD float is created and where stocked vs dropship paths diverge — mishandling either loses goods or money. Traces to **FF-1…FF-8**.

## 2. Use Case — UC-5.1 Ship a confirmed order

| Element | Detail |
|---------|--------|
| Primary actor | Fulfillment/Dispatch |
| Trigger | An order is Confirmed / Ready to Ship |
| Pre-conditions | Stock reserved (stocked) or PO received (dropship) |
| Post-conditions | Order is Shipped with tracking; COD owed-back recorded if COD |
| Main success scenario | 1. Open the dispatch queue. 2. Pick & pack a stocked order → Ready. 3. Book courier, enter tracking. 4. Mark Shipped. 5. For COD, system records owed-back. |
| Extensions | 2a. Dropship line → wait for its PO (FF-2). 4a. Mixed order → ship stocked lines, hold dropship (FF-3). |
| Priority | High |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  Dispatch  Order #1042  · COD · Total 59         │
│  Items: Red Tee L x2, LED Lamp x1                │
│  ① [ Mark Packed ]                               │
│  ② Courier:[ X ▾ ]  ③Tracking:[ TRK123 ]         │
│  ④ [ Mark Shipped ]    Status: Ready→Shipped     │
│  ⑤ COD owed-back: 59 (courier X)                 │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| ① | Mark Packed | button | — | — | — | — | — |
| ② | Courier | dropdown | Yes | ref→Courier | couriers | empty | config |
| ③ | Tracking no | textbox | Yes (to ship) | text | — | empty | user/courier |
| ⑤ | COD owed-back | label | — | money(base) | — | computed | system |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Tracking | required before Shipped | "Enter a tracking number to mark shipped" |
| Ship | stocked lines must be packed | "Pack all stocked items before shipping" |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ① Mark Packed | stocked order → Ready to Ship (FF-1) | Confirmed stocked orders |
| ④ Mark Shipped | record courier+tracking → Shipped; set COD owed (FF-4, FF-6) | disabled until tracking entered |

## 5. Open Issues

| Issue | Status |
|---|---|
| Direct-from-supplier dropship tracking source | Open — PM |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
