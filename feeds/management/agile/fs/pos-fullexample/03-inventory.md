# FS Module 3: Inventory & Products

> Part of the [Cross-Border Social Resell POS](00-overview.md). The product catalog and stock truth.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

Every product has a catalog record with its selling info and a **fulfillment type** (stocked or dropship). Stocked products have a live stock level that goes up on receiving and down on sale; dropship products don't hold stock but still need a record to be sold and costed. This module is the bridge between what we *bought* and what we *sell*.

## Users

Owner (pricing, product setup), Inventory staff (stock counts), Sales (reads availability).

## Functional Requirements

- **IN-1:** A **Product** has: name, SKU, photos, variants (size/color), selling price, fulfillment type (**Stocked** / **Dropship**), and links to supplier(s).
- **IN-2:** **Variants** are tracked individually for stock and cost (e.g. "T-shirt / Red / L" is its own stock-keeping unit).
- **IN-3:** **Stocked** products show a live **available quantity**; **Dropship** products show "made to order" instead of a stock number.
- **IN-4:** Stock **increases** when a PO is received (from [Module 1](01-procurement.md)) and **decreases** when an order is confirmed/shipped (from [Module 4](04-channels-orders.md)).
- **IN-5:** The system supports **stock adjustments** (damage, loss, manual recount) with a reason and a log entry — stock never changes silently.
- **IN-6:** A product can be marked **low-stock** at a configurable threshold, surfacing a reorder suggestion to the Buyer.
- **IN-7:** Each stocked unit carries its **landed cost** (from [Module 2](02-landed-cost.md)); when cost differs across batches, the system values stock by a defined method (e.g. **weighted average** — configurable).
- **IN-8:** A product can be **deactivated** (hidden from selling) without deleting its history.

## Acceptance Criteria

- **IN-4 (up):** Given a stocked variant at 0, When a PO receiving 50 units is completed, Then available quantity becomes 50.
- **IN-4 (down):** Given a stocked variant at 50, When an order for 3 is confirmed, Then available becomes 47 (reserved/sold per the order rules in Module 4).
- **IN-3:** Given a Dropship product, When Sales views it, Then it shows "made to order" and never blocks a sale for being "out of stock".
- **IN-5:** Given a variant at 47, When Inventory posts a "-2 damaged" adjustment, Then available becomes 45 and the log shows the reason, user, and timestamp.
- **IN-7 (weighted avg):** Given 50 units at landed cost 3.40 and 50 units at 3.60, When valued by weighted average, Then unit cost = 3.50 and total stock value = 350.

## Edge Cases

- Overselling a stocked item (two agents sell the last unit at once) → the system must prevent the available quantity going negative; the second confirmation is blocked or flagged (ties to order confirmation in Module 4).
- A product switches from Dropship to Stocked (we decide to start holding it) → history is preserved; future units get stock tracking.
- Variant with no sales and no stock → can be deactivated, not deleted.

## Dependencies

- Receives stock-in from [Module 1](01-procurement.md), cost from [Module 2](02-landed-cost.md).
- Serves availability to [Module 4 — Channels & Orders](04-channels-orders.md); stock value to [Module 8 — Reporting](08-reporting.md).

---

## Scope (this module)

**In scope:**
- Product catalog with variants; fulfillment type (Stocked/Dropship); live stock for stocked items; stock in/out; manual adjustments with reason; low-stock flag; valuation.

**Out of scope:**
- How stock arrives (from [Procurement](01-procurement.md)/[Landed Cost](02-landed-cost.md)); how it leaves (from [Orders](04-channels-orders.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Catalog with variants, stocked vs dropship flag, stock up on receive / down on sale, manual adjustment with reason. |
| **Post-MVP** | Low-stock reorder suggestions, weighted-average vs FIFO valuation choice, multi-location stock. |

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
