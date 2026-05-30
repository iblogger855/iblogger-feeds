# FS Module 13 (Detailed): Live Selling & Channel Engagement — Build-Ready Spec

> Deep companion to [Module 13 — Live Selling & Channel Engagement](13-live-selling.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [13](13-live-selling.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **Live capture screen** turns a chaotic live (dozens of claims/min) into clean orders without overselling. It matters because live is the highest-velocity channel and where manual processes collapse. Traces to **LV-1…LV-7**.

## 2. Use Case — UC-13.1 Capture claims during a live

| Element | Detail |
|---------|--------|
| Primary actor | Host/Sales agent |
| Trigger | A live session is running |
| Pre-conditions | Live set up with item codes + allocated stock |
| Post-conditions | Claims become orders; payment-request list produced |
| Main success scenario | 1. Set up live (item codes + allocation). 2. Enter claim: code + handle + qty → draft line. 3. Stock bar updates; sold-out blocks. 4. End live → orders + payment list. |
| Extensions | 3a. Last-unit race → first wins, second waitlisted (LV-4). 4a. Unpaid claim auto-released after window (LV-7). |
| Priority | High (Post-MVP) |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  LIVE: Friday Flash   ⏺00:42  Viewers 512        │
│  ① Quick claim:[A1][ @handle ][x1] [② CLAIM]     │
│  ③ A1 Red Tee L ████░ 3 left   A2 ░ SOLD OUT⛔    │
│  Recent: @sok A1 x1 ✓  @vinn A2 ⛔waitlist        │
│         [④ End Live → generate orders]           │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| ① | Item code | textbox | Yes | text | live item codes | empty | Live setup |
| ① | Handle | textbox | Yes | text | — | empty | user |
| ① | Qty | number | Yes | integer ≥1 | — | 1 | user |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Item code | must be an allocated live code with stock | "Sold out" / "Unknown code" |
| Claim | ≤ allocated remaining | "Sold out — added to waitlist" |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ② CLAIM | create draft order line in <1s (LV-2) | code+handle present |
| ④ End Live | convert drafts → orders + payment list (LV-5) | always |

## 5. Open Issues

| Issue | Status |
|---|---|
| Draw from main stock when live allocation runs out? | Open — PO |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
