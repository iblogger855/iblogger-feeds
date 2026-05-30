# FS Module 9 (Detailed): Users, Roles & Audit — Build-Ready Spec

> Deep companion to [Module 9 — Users, Roles & Audit](09-users-roles.md). Full FSD depth: use case, mock-up, field-level specs, validation/error rules, control behaviors.
>
> ⚠️ **Illustrative detail.** Field types, value sets, and error strings are sensible defaults to show the build-ready format — confirmed with the team when this module enters a build sprint, not before.

## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft>` · Version `<0.1>` · Parent [09](09-users-roles.md) |
| Author / Reviewers | Sophea (PO) · PM Dara, Dev Visal, QA Chenda |

---

## 1. Purpose
The **User & Roles screen** controls who can touch money and stock, and the **Audit log** records every such action. It matters because a small team where one mistake drains profit survives on accountability, not trust alone. Traces to **UR-1…UR-7**.

## 2. Use Case — UC-9.1 Manage a user's roles; review audit

| Element | Detail |
|---------|--------|
| Primary actor | Owner/Admin |
| Trigger | Onboard/offboard staff, or investigate a discrepancy |
| Pre-conditions | Owner logged in |
| Post-conditions | User has correct roles; or audit reviewed |
| Main success scenario | 1. Open Users. 2. Assign/adjust roles. 3. Save. 4. To investigate, open Audit, filter by user/action/date. |
| Extensions | 2a. Deactivate a leaver → access removed, history kept (UR-5). |
| Priority | Medium |

## 3. Mock-up

```
┌──────────────────────────────────────────────┐
│  User: Visal           ① Roles:                 │
│   ☑ Dev  ☑ Fulfillment  ☐ Finance  ☐ Owner      │
│   [ Save ]   ② [ Deactivate user ]              │
│  ─ Audit log ──────────────────────────────────│
│  ③ Filter: user[ all ▾] action[ all ▾] date[…] │
│   2026-06-10 Chenda confirmed pay #1042 20→✓    │
│   2026-06-10 Inv −2 Red/L  (damaged) 47→45      │
└──────────────────────────────────────────────┘
```

## 4. Field-Level Specifications

| Call-out | Field | UI control | Mand? | Data type | Value set | Default | Source |
|---|---|---|---|---|---|---|---|
| ① | Roles | checkbox list | Yes | enum[] | Owner/Buyer/Inventory/Sales/Fulfillment/Finance | empty | user |
| ③ | Audit filter | dropdowns + date | No | — | — | all | user |

### Validation / errors

| Field | Rule | Error |
|---|---|---|
| Roles | ≥1 role | "Assign at least one role" |
| Audit entry | append-only | "Audit entries cannot be edited or deleted" |

### Buttons / controls

| Control | OnClick | Enabled |
|---|---|---|
| ② Deactivate user | remove access, keep history (UR-5) | not self |

## 5. Open Issues

| Issue | Status |
|---|---|
| Custom role builder — needed in v1? | Open — Owner |

## 6. Approval
*Internal working agreement, not a legal contract.*

| Role | Name | Status | Date |
|------|------|--------|------|
| PO | Sophea | `<>` | `<>` |
| PM | Dara | `<>` | `<>` |
| Dev Lead | Visal | `<>` | `<>` |
| QA | Chenda | `<>` | `<>` |
