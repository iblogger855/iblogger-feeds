# FS Module 11 (Detailed): Marketing & Attribution — Build-Ready Spec

> Deep companion to [Module 11 — Marketing & Attribution](11-marketing-attribution.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [11](11-marketing-attribution.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Campaign screen** ties ad spend to orders so the owner sees ROAS and moves money toward what works — turning marketing from a guess into a measured lever. Traces to **MK-1…MK-7**.

## 2. Use Case — UC-11.1 Create a campaign & read ROAS

| Element | Detail |
|---------|--------|
| Primary actor | Marketing/Owner |
| Trigger | Launch an ad/boost/live; review performance |
| Pre-conditions | — |
| Post-conditions | Campaign exists; orders attributed; ROAS shown |
| Main success scenario | 1. New Campaign: channel, dates, spend, voucher. 2. Orders tag to it (voucher/UTM/manual). 3. View ROAS + cost/order. |
| Extensions | 2a. No source → 'unattributed' (MK-7). 1a. API spend import where available. |
| Priority | Medium |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  Campaign: TT-JUN                                │
│  ① Channel:[ TikTok ad ▾ ] ②Spend:[200]          │
│  ③ Dates:[ Jun 1 – Jun 30 ]  ④Voucher:[ TTJUN ]  │
├──────────────────────────────────────────────┤
│  ⑤ Results: 10 orders · rev 1,000 · ROAS 5.0     │
│             cost/order 20                         │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| ① | Channel | dropdown | Yes | enum | TikTok ad/FB ad/boosted/live/organic | TikTok ad | user |
| ② | Spend | number | No | money(base) ≥0 | — | 0 | user/API |
| ③ | Dates | date range | Yes | daterange | — | empty | user |
| ④ | Voucher | ref→Promotion | No | ref | promotions | empty | Promotions |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Spend | ≥0 | "Spend cannot be negative" |
| ROAS | not shown for 0 spend | (organic: show rev/margin only) |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| Save campaign | persist campaign + spend (MK-1, MK-5) | channel+dates set |

## 5. Open Issues

| Issue | Status |
|---|---|
| Last-touch vs multi-touch attribution | Open — Owner |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
