# FS Module 10 (Detailed): Promotions & Discounts — Build-Ready Spec

> Deep companion to [Module 10 — Promotions & Discounts](10-promotions.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [10](10-promotions.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Promotion setup screen** runs offers that lift conversion and basket size — with a margin guardrail so a discount never quietly sells below cost. Traces to **PRO-1…PRO-8**.

## 2. Use Case — UC-10.1 Create a promotion

| Element | Detail |
|---------|--------|
| Primary actor | Owner/Marketing |
| Trigger | Plan a flash sale, live offer, or bundle |
| Pre-conditions | Products/margin floor exist |
| Post-conditions | An active or scheduled promotion exists |
| Main success scenario | 1. Open New Promotion. 2. Pick type + scope. 3. Set voucher/auto + limits + window. 4. Save (guardrail checks margin). |
| Extensions | 4a. Would breach margin floor → blocked unless Owner override (PRO-4). |
| Priority | Medium |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  New Promotion                                   │
│  ① Type:[ Percent ▾ ]  ② Value:[20]%             │
│  ③ Scope:[ Category ▾ ]  ④Voucher:[ LIVE20 ]     │
│  ⑤ Max uses:[100] per-customer:[1]               │
│  ⑥ Window:[ Jun 16 10:00 – Jun 16 22:00 ]        │
│       [⑦ Save promotion ]                        │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| ① | Type | dropdown | Yes | enum | percent/fixed/bundle/free_ship/bxgy | percent | user |
| ② | Value | number | Yes | number ≥0 | — | empty | user |
| ③ | Scope | dropdown | Yes | enum | product/category/order | order | user |
| ④ | Voucher code | textbox | No | text | — | empty (auto-apply) | user |
| ⑤ | Max uses / per-customer | number | No | integer ≥0 | — | unlimited | user |
| ⑥ | Window | date range | Yes | datetime range | — | empty | user |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Value | ≥0; %≤100 | "Enter a valid discount value" |
| Margin | may not breach margin floor | "Promotion would sell below margin floor" |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ⑦ Save promotion | validate guardrail; activate or schedule (PRO-4, PRO-8) | type+value+window set |

## 5. Open Issues

| Issue | Status |
|---|---|
| Stacking rule: best-one-wins vs stack? | Open — Owner |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
