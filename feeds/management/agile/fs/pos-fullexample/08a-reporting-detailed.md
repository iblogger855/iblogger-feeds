# FS Module 8 (Detailed): Reporting & Profit/Loss — Build-Ready Spec

> Deep companion to [Module 8 — Reporting & Profit/Loss](08-reporting.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [08](08-reporting.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Reports screen** answers the owner's only real question: are we making money, and where? It matters because revenue without cost is a vanity number — this screen refuses to show one without the other. Traces to **RP-1…RP-8**.

## 2. Use Case — UC-8.1 View P&L and export

| Element | Detail |
|---------|--------|
| Primary actor | Owner/Finance |
| Trigger | Period review, end of month, decision needed |
| Pre-conditions | Orders, costs, payments, returns recorded |
| Post-conditions | Accurate net P&L shown; optional CSV export |
| Main success scenario | 1. Open Reports. 2. Pick date range + filters. 3. View P&L (net of returns), margin, channel, stock value, COD float. 4. Export CSV. |
| Extensions | — |
| Priority | Medium |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  Reports   ① Range:[ Jun 1 – Jun 30 ] ②[All ch ▾]│
├──────────────────────────────────────────────┤
│  P&L (net of returns)                            │
│   Revenue 10,000  COGS 6,000  Fees 800           │
│   Returns 500     ③ NET PROFIT: 2,700            │
│  Stock value: 350    COD float (X): 60           │
│       [④ Export CSV]                             │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| ① | Date range | date range | Yes | daterange | — | this month | user |
| ② | Channel filter | dropdown | No | enum | All/TikTok/Facebook/Manual | All | user |
| ③ | Net profit | label | — | money(base) | — | computed | computed |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Date range | start ≤ end | "Start date must be before end date" |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ④ Export CSV | export the filtered view to CSV (RP-8) | always |

## 5. Open Issues

| Issue | Status |
|---|---|
| Scheduled email reports — MVP or later? | Open — Owner |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
