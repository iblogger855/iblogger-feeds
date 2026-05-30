# FS Module 1: Procurement & Suppliers

> Part of the [Cross-Border Social Resell POS](00-overview.md). Covers buying from Chinese suppliers and tracking purchase orders.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

The Buyer sources products from Chinese marketplaces and places purchase orders (POs). The system records each supplier, each PO, what was ordered, at what CNY cost, and the state of that PO from "draft" to "received." This is the origin of every cost number that later flows into landed cost and margin.

## Users

Buyer/Sourcer (primary), Owner (approves large POs), Inventory staff (receives against the PO).

## Functional Requirements

- **PR-1:** The Buyer can create a **Supplier** record (name, platform, store link, contact, default lead time, notes).
- **PR-2:** The Buyer can create a **Purchase Order** against a supplier, adding line items (product, quantity, unit cost in **CNY**, supplier SKU/link).
- **PR-3:** A PO has a status lifecycle: **Draft → Ordered → Shipped (China) → Received**, and can be **Cancelled** before Received.
- **PR-4:** The Buyer can record the **CNY total**, plus the supplier's domestic-China shipping and any platform fees, on the PO.
- **PR-5:** A PO over a configurable amount requires **Owner approval** before it can move to Ordered.
- **PR-6:** When goods arrive, Inventory staff **receive against the PO**, entering actual quantities received (which may differ from ordered).
- **PR-7:** A received PO is **locked** from edits to quantities/costs; corrections require a logged adjustment, not a silent change.
- **PR-8:** The Buyer can see, per supplier, history of POs, average lead time (ordered→received), and discrepancy rate (ordered vs received).

## Acceptance Criteria

- **PR-2:** Given a supplier exists, When the Buyer adds a line item of qty 100 at ¥12.50, Then the PO shows a line subtotal of ¥1,250 and a CNY order total reflecting all lines.
- **PR-3:** Given a PO in Draft, When the Buyer marks it Ordered, Then its status changes and it can no longer be deleted (only Cancelled, which is logged).
- **PR-5:** Given the approval threshold is ¥5,000, When the Buyer tries to move a ¥6,000 PO to Ordered without approval, Then the action is blocked with "Owner approval required".
- **PR-6:** Given a PO ordered for 100 units, When Inventory receives 96 units, Then the PO records 96 received and flags a 4-unit shortage for review.
- **PR-7:** Given a Received PO, When someone tries to change a unit cost, Then direct editing is blocked and they are directed to create a logged cost adjustment.

## Edge Cases

- Supplier ships a partial order in two boxes on different dates → the PO supports **multiple receiving events** until fully received or closed short.
- A PO is cancelled after some items shipped → items already in transit can be split to a new "received" PO so cost still tracks.
- Currency: all supplier costs are entered in CNY; conversion to base currency happens in [Landed Cost](02-landed-cost.md), never guessed here.

## Dependencies

- Supplier platform links are stored as plain URLs (no API dependency required in v1).
- Feeds cost data into [Module 2 — Landed Cost](02-landed-cost.md).

---

## Scope (this module)

**In scope:**
- Supplier records; purchase orders with CNY line costs; PO lifecycle (Draft→Ordered→Shipped→Received); owner approval over a threshold; receiving against a PO incl. partial/short.

**Out of scope:**
- Cost conversion to base currency and fee allocation — see [Landed Cost](02-landed-cost.md). Stock levels — see [Inventory](03-inventory.md).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Create supplier + PO, move it through the lifecycle, receive against it. Single receiving event. |
| **Post-MVP** | Multiple receiving events per PO, supplier performance analytics (lead time, discrepancy rate), reorder suggestions. |

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
