# FS Module 14 (Detailed): Reviews & Social Proof — Build-Ready Spec

> Deep companion to [Module 14 — Reviews & Social Proof](14-reviews-social-proof.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [14](14-reviews-social-proof.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Review screen** collects post-delivery feedback, surfaces the good for marketing, and routes the bad to service. It matters because trust is the #1 conversion lever in social commerce. Traces to **RV-1…RV-7**.

## 2. Use Case — UC-14.1 Capture & triage a review

| Element | Detail |
|---------|--------|
| Primary actor | Customer (submits); Marketing/Service (handle) |
| Trigger | Order delivered → review request |
| Pre-conditions | Order delivered; customer consent |
| Post-conditions | Review stored; positives shareable, negatives routed to service |
| Main success scenario | 1. After delivery, request sent. 2. Customer submits rating/text/photo. 3. Positive → shareable library; negative → service task. |
| Extensions | 2a. Opted out → no auto request (manual only). |
| Priority | Low/Medium |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  Review — Order #1042 (Red Tee)                  │
│  ① Rating: ★★★★★   ② Text:[ great quality ]      │
│  ③ Photo:[ upload ]                              │
│       [④ Submit ]                                │
│  (admin) ⑤ ☑ Shareable   ⑥ avg 4.25 (4 reviews) │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| ① | Rating | star select | Yes | integer 1-5 | 1–5 | empty | customer |
| ② | Text | textarea | No | text | — | empty | customer |
| ③ | Photo | file upload | No | file | — | empty | customer |
| ⑤ | Shareable | checkbox | No | bool | — | false | Marketing |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Rating | 1–5 required | "Please give a star rating" |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ④ Submit | store review linked to order/product (RV-2); route negatives to service (RV-4) | rating set |
| ⑤ Shareable | add to social-proof library (RV-3) | positive reviews |

## 5. Open Issues

| Issue | Status |
|---|---|
| Incentive: points vs voucher for a review? | Open — Owner |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
