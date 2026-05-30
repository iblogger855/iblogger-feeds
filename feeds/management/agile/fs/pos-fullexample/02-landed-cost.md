# FS Module 2: Import & Landed Cost

> Part of the [Cross-Border Social Resell POS](00-overview.md). Turns a CNY purchase into a true per-unit cost in base currency.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

A product's real cost is not the supplier price. It's the supplier price **plus** international shipping, customs/import fees, local handling, and the FX conversion from CNY to our currency — all divided across the units. Getting this wrong is the #1 way a resell business "makes sales" while quietly losing money. This module computes **landed cost per unit** and attaches it to received stock so margin is always real.

## Users

Buyer (enters shipment costs), Finance (verifies fees & FX), Owner (sets FX policy, reads margin).

## Functional Requirements

- **LC-1:** The system stores a configurable **FX rate** (CNY → base currency), with the rate and effective date recorded on each shipment so historical costs don't change when the rate moves.
- **LC-2:** For an inbound **shipment** (one or more POs traveling together), the Buyer records: international freight, customs/import duty, local delivery/handling, and any other fees — in base currency.
- **LC-3:** The system **allocates** shipment-level costs across units. Allocation method is configurable per shipment: **by quantity**, **by weight**, or **by value**.
- **LC-4:** The system computes **landed cost per unit** = (supplier unit cost × FX) + allocated freight + allocated duty + allocated handling.
- **LC-5:** Received stock is valued at its **landed cost**, and that figure is the cost basis used everywhere downstream (margin, P&L, refunds).
- **LC-6:** If costs arrive late (e.g. a customs invoice comes a week after receiving), Finance can post a **landed-cost adjustment**, which updates valuation and is logged.
- **LC-7:** The Owner can see a breakdown for any unit: supplier cost, FX applied, each allocated fee, and the final landed cost.

## Acceptance Criteria

- **LC-4 (by quantity):** Given a shipment of 200 units, supplier cost ¥10/unit, FX 0.14, freight 280 and duty 120 (base currency) allocated by quantity, When landed cost is computed, Then each unit = (10 × 0.14) + (400 ÷ 200) = 1.40 + 2.00 = **3.40** base currency.
- **LC-1:** Given FX was 0.14 when shipment A was received, When the FX rate later changes to 0.15, Then shipment A's unit costs remain at the 0.14 basis (history is immutable).
- **LC-3 (by value):** Given two products of very different prices in one shipment, When allocation is set to "by value", Then more of the freight is assigned to the higher-value product proportionally.
- **LC-6:** Given a shipment already received and valued, When Finance posts a late ¥0 / 90 base-currency customs fee, Then affected units' landed cost increases and the adjustment appears in the audit log.

## Edge Cases

- A shipment contains both **stocked and dropship** items → only stocked items enter inventory valuation; dropship landed cost is attached to the specific order it was bought for (see [Fulfillment](05-fulfillment.md)).
- Free-shipping promos from supplier → freight = 0 is valid and must still compute correctly.
- Partial receipt (from Module 1) → landed cost allocates only across units actually received.

## Dependencies

- Consumes CNY costs from [Module 1 — Procurement](01-procurement.md).
- Feeds unit cost into [Module 3 — Inventory](03-inventory.md) and margin into [Module 8 — Reporting](08-reporting.md).

---

## Scope (this module)

**In scope:**
- FX rate per shipment; shipment-level fees (freight, duty, handling); allocation by qty/weight/value; landed-cost-per-unit; valuation of received stock; late cost adjustments.

**Out of scope:**
- The CNY purchase data itself (from [Procurement](01-procurement.md)); how stock is held (from [Inventory](03-inventory.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Manual FX per shipment + allocate fees by quantity → landed cost per unit attached to received stock. |
| **Post-MVP** | Allocation by weight/value, late cost adjustments after receiving, automated FX feed. |

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
