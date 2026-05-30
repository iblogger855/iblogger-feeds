# FS Module 5: Fulfillment & Delivery

> Part of the [Cross-Border Social Resell POS](00-overview.md). Getting the goods to the customer — stocked and dropship paths.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

Once an order is confirmed, it must be fulfilled. **Stocked** orders are packed from the warehouse and handed to a courier. **Dropship** orders first require a supplier purchase, then ship (from us after we receive it, or sometimes direct from supplier). Both paths converge on **delivery and tracking**. The system must run both from the same order without staff having to remember two separate processes.

## Users

Fulfillment/Dispatch (primary), Buyer (for dropship purchasing), Inventory staff.

## Functional Requirements

- **FF-1:** For a **stocked** order, Fulfillment can **pick & pack**, marking the order **Ready to Ship**; stock was already reserved at confirm time.
- **FF-2:** For a **dropship** order, the system raises a **purchase trigger** linking the order to a new PO ([Module 1](01-procurement.md)); the order stays **Awaiting Stock** until that PO is received.
- **FF-3:** A **mixed** order (stocked + dropship lines) can be fulfilled **partially** — ship the stocked lines now, the dropship lines when they arrive — or held to ship together (configurable per order).
- **FF-4:** Fulfillment **books a courier**, records the **tracking number**, and moves the order to **Shipped**.
- **FF-5:** Delivery status updates to **Delivered** (via courier API where available, or manual update).
- **FF-6:** For **COD** orders, the system tracks that the courier is **collecting cash on our behalf** and that it is **owed back** to us until reconciled ([Module 6](06-payments.md)).
- **FF-7:** Shipping label / packing slip can be generated for an order.
- **FF-8:** Each fulfillment action is timestamped, building a delivery timeline visible on the order.

## Acceptance Criteria

- **FF-1:** Given a confirmed stocked order, When Fulfillment marks it packed, Then it becomes Ready to Ship and appears in the dispatch queue.
- **FF-2:** Given a confirmed dropship order, When it is confirmed, Then a linked PO is suggested/created and the order shows "Awaiting Stock — PO #__".
- **FF-3:** Given an order with one stocked and one dropship line, When the stocked line ships, Then the order shows "partially shipped" and the dropship line remains open.
- **FF-4:** Given a Ready-to-Ship order, When Fulfillment enters tracking number "TRK123" and books courier "X", Then the order moves to Shipped with that tracking visible.
- **FF-6:** Given a COD order for 50, When it ships, Then the system records 50 as "COD float — owed by courier" until Finance reconciles the cash.

## Edge Cases

- Dropship PO arrives short → the linked order is flagged; agent contacts customer (refund the missing line or wait).
- Courier marks "delivery failed / customer not home" → order returns to a "delivery problem" state, not silently Delivered.
- Direct-from-supplier dropship (supplier ships to customer) → tracking is the supplier's; the order skips our pick/pack but still records shipped/delivered.
- Customer cancels after Ready to Ship but before courier pickup → stock is **un-reserved** back to inventory (Module 3).

## Dependencies

- Triggered by [Module 4](04-channels-orders.md); for dropship creates a PO in [Module 1](01-procurement.md); COD owed-back feeds [Module 6](06-payments.md); returns handled in [Module 7](07-returns.md).

---

## Scope (this module)

**In scope:**
- Pick/pack for stocked; dropship purchase trigger; partial/mixed-order fulfillment; courier booking + tracking; delivery status; COD owed-back tracking; labels.

**Out of scope:**
- Order capture (from [Orders](04-channels-orders.md)); COD cash reconciliation (see [Payments](06-payments.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Mark stocked order packed → ship with tracking → delivered (manual update); dropship raises a PO and waits. |
| **Post-MVP** | Courier API auto status, partial-shipment handling, direct-from-supplier dropship, delivery-failure states. |

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
