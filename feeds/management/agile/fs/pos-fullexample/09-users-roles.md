# FS Module 9: Users, Roles & Audit

> Part of the [Cross-Border Social Resell POS](00-overview.md). Who can do what, and a trail of everything that touches money or stock.
> 
> 📐 **Build-ready detail:** see [09a-users-roles-detailed.md](09a-users-roles-detailed.md) for full use case, mock-up, and field-level specifications.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

A resell business runs on trust but survives on accountability. Staff should see and do only what their job needs, and every action that changes **money or stock** must be traceable to a person and a time. This module defines the roles, their permissions, and the audit log that makes the whole system safe to run with a small team where one mistake (or one bad actor) can quietly drain profit.

## Users

Owner/Admin (manages users), all roles (subject to permissions).

## User Stories

- As an **Owner**, I want to assign roles that gate sensitive actions, so that staff can only do what their job needs. *(→ UR-1, UR-2)*
- As an **Owner**, I want to keep cost and margin hidden from sales staff, so that our buying economics stay confidential. *(→ UR-6)*
- As an **Owner**, I want to review an append-only audit log of money/stock changes, so that every change is traceable to a person and time. *(→ UR-3, UR-4, UR-7)*
- As an **Owner**, I want to deactivate a staff member who leaves, so that they lose access but their history stays intact. *(→ UR-5)*

---
## Functional Requirements

- **UR-1:** Users have one or more **roles** (Owner/Admin, Buyer, Inventory, Sales, Fulfillment, Finance) — roles are permission sets, and one person may hold several.
- **UR-2:** **Permissions** gate sensitive actions: e.g. only Owner sets prices/FX and approves large POs; only Finance confirms payments and processes refunds; only Inventory posts stock adjustments.
- **UR-3:** Every action that changes **money or stock** writes an **audit entry**: who, when, what action, and before/after values.
- **UR-4:** The audit log is **append-only** — entries cannot be edited or deleted, only added.
- **UR-5:** A user can be **deactivated** (loses access) without deleting their history or audit entries.
- **UR-6:** Sensitive reports (P&L, margins, costs) are visible only to **Owner/Finance** roles.
- **UR-7:** The Owner can review an **activity feed** filtered by user, action type, or date.

## Acceptance Criteria

- **UR-2:** Given a Sales-only user, When they try to confirm a bank payment, Then the action is blocked ("requires Finance role").
- **UR-2:** Given a Sales-only user, When they view a product, Then they see the selling price but **not** the landed cost or margin.
- **UR-3:** Given Inventory posts a "−2 damaged" stock adjustment, When the audit log is viewed, Then it shows the user, timestamp, reason, and stock before (47) and after (45).
- **UR-4:** Given an audit entry exists, When anyone (including Admin) tries to edit or delete it, Then the action is rejected.
- **UR-5:** Given a staff member leaves, When the Owner deactivates them, Then they can no longer log in but their past orders and audit entries remain intact.
- **UR-1:** Given a new user, When the Owner assigns them the Sales and Fulfillment roles, Then they gain exactly those two roles' permissions.
- **UR-6:** Given a Sales-only user, When they open the P&L report, Then access is denied (Owner/Finance only).
- **UR-7:** Given activity occurred, When the Owner filters the activity feed by user and date, Then only that user's actions in range are shown.

## Edge Cases

- Owner is also the only Finance person (tiny team) → roles stack on one account; permissions still enforce *which action*, even if one person does all.
- A permission is changed → the change itself is audited (who granted whom what, when).
- Shared device used by multiple staff → each must log in as themselves so the audit trail stays accurate (no shared anonymous account).

## Dependencies

- Cross-cutting: governs access to every other module. The audit log captures money/stock events raised by Modules 1–8.

---

## Scope (this module)

**In scope:**
- Roles as permission sets; permission gates on money/stock actions; append-only audit log; user deactivation; report-visibility by role; activity feed.

**Out of scope:**
- The business actions themselves (owned by each module); external SSO/identity providers (v1).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Core roles with permission gates on sensitive actions, append-only audit log of money/stock changes. |
| **Post-MVP** | Custom role builder, fine-grained per-field permissions, activity-feed filtering, SSO. |

## Approval

This FS module is an internal working agreement, not a legal contract. By approving, each role confirms they have reviewed it and agree to build to it.

| Role | Name | Status (Reviewed / Approved) | Date |
|------|------|------------------------------|------|
| Product Owner (PO) | Sophea | `<>` | `<YYYY-MM-DD>` |
| Project Manager (PM) | Dara | `<>` | `<YYYY-MM-DD>` |
| Dev Lead | Visal | `<>` | `<YYYY-MM-DD>` |
| QA | Chenda | `<>` | `<YYYY-MM-DD>` |

**Approval status:** `<Draft / In Review / Approved>`   ·   **Approved on:** `<YYYY-MM-DD>`

## Change Log

| Version | Date | Author | Change |
|---------|------|--------|--------|
| 0.1 | `<YYYY-MM-DD>` | Sophea | Initial draft |
