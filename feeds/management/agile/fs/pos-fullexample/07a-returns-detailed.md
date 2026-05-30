# FS Module 7 (Detailed): Returns, Refunds & Cancellations — Build-Ready Spec

> Deep companion to [Module 7 — Returns, Refunds & Cancellations](07-returns.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [07](07-returns.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Return / Refund screen** puts stock and money back into a correct state after a sale unwinds. It matters because returns handled in chat (and never booked) are a classic silent leak. Traces to **RT-1…RT-8**.

## 2. Use Case — UC-7.1 Process a return & refund

| Element | Detail |
|---------|--------|
| Primary actor | Sales/Finance |
| Trigger | Customer returns an item, cancels, or rejects COD |
| Pre-conditions | Original order exists |
| Post-conditions | Stock restocked or written off; payment reversed if paid; net reporting updated |
| Main success scenario | 1. Open the order. 2. Choose Cancel or Return + reason. 3. Restock or write-off. 4. Issue refund (method) reversing the payment. |
| Extensions | 2a. COD rejected (unpaid) → release stock, no refund, book courier fee (RT-5). 3a. Dropship → refund without physical return + Owner approval (RT-6). |
| Priority | Medium |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  Return — Order #1042 (Delivered)                │
│  ① Type: ( )Cancel (•)Return                     │
│  ② Reason:[ damaged ▾ ]                          │
│  ③ Items: ☑ Red Tee L x2   ☐ LED Lamp           │
│  ④ Disposition: (•)Restock ( )Write-off          │
│  ⑤ Refund: (•)Transfer ( )Store credit  Amt:[44] │
│         [⑥ Process return ]                       │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| ① | Type | radio | Yes | enum | Cancel/Return | Return | user |
| ② | Reason | dropdown | Yes | enum | damaged/wrong item/changed mind/COD rejected | empty | user |
| ③ | Items | checkbox list | Yes | ref→OrderLine[] | order lines | empty | Order |
| ④ | Disposition | radio | Yes | enum | Restock/Write-off | Restock | user |
| ⑤ | Refund method | radio | Yes (if paid) | enum | Transfer/Cash/Store credit | Transfer | user |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Items | ≥1 selected | "Select at least one item to return" |
| Refund amount | ≤ amount paid on those lines | "Refund exceeds amount paid" |
| Dropship no-return | requires Owner approval | "Owner approval required" |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ⑥ Process return | restock/write-off (RT-3); reverse payment (RT-4); update net (RT-8) | items + reason + disposition set |

## 5. Open Issues

| Issue | Status |
|---|---|
| Store-credit expiry policy? | Open — PO |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
