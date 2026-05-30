# FS Module 7: Returns, Refunds & Cancellations

> Part of the [Cross-Border Social Resell POS](00-overview.md). After-sales — keeping stock and money correct when things go back.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

Customers cancel, items arrive damaged, COD parcels get rejected at the door. Each of these has to put **stock** and **money** back into a correct state — a returned stocked item should re-enter inventory at its original landed cost, and a refund must reverse the right payment. This module prevents the classic resell-business leak where returns are handled in chat and never reflected in the books.

## Users

Sales/Finance (process returns), Inventory (restock), Owner (approves exceptions).

## Functional Requirements

- **RT-1:** A **Cancellation** before shipping releases any **reserved stock** back to inventory and voids/locks any pending payment.
- **RT-2:** A **Return** after delivery is recorded against the original order, with a **reason** (damaged, wrong item, customer changed mind, COD rejected).
- **RT-3:** A returned **stocked** item can be **restocked** (back to available at its original landed cost) or written off as **damaged** (stock adjustment, not resellable).
- **RT-4:** A **Refund** reverses the matching confirmed payment ([Module 6](06-payments.md)); the method of refund (cash, transfer back, store credit) is recorded.
- **RT-5:** For **COD rejected at the door** (never paid), there is **no refund** — but the system must release stock and close the order as "returned, unpaid", and record any **courier return fee** as a cost.
- **RT-6:** **Dropship returns** are flagged separately, since the goods may not be worth shipping back to China — the system supports "refund without physical return" with Owner approval.
- **RT-7:** Partial returns (one line of a multi-line order) are supported, refunding only that line.
- **RT-8:** Every return/refund is **logged** and feeds the **net** numbers in [Reporting](08-reporting.md) — revenue and margin are after returns, not before.

## Acceptance Criteria

- **RT-1:** Given a confirmed stocked order reserving 2 units, When it is cancelled before shipping, Then 2 units return to available and the pending payment is voided.
- **RT-3 (restock):** Given a delivered order is returned in good condition, When Inventory restocks it, Then available increases by the returned qty at the original landed cost (not a new cost).
- **RT-3 (write-off):** Given a returned item is damaged, When it is written off, Then stock does not increase and a "damaged" cost is recorded.
- **RT-4:** Given an order paid 50 by transfer, When a full refund is processed, Then a 50 reversal is recorded against that payment and the order shows "refunded".
- **RT-5:** Given a COD order rejected at the door, When it is closed, Then no refund is created, stock is released, the order is "returned, unpaid", and the courier return fee is booked as a cost.
- **RT-7:** Given a 2-line order (A=30, B=20) fully paid, When line B is returned, Then only 20 is refunded and line A stays sold.

## Edge Cases

- Customer returns after partial COD remittance already reconciled → refund must reverse correctly even though cash already came in.
- Item returned to wrong place / lost in return transit → order can sit in "return in progress" without prematurely restocking.
- Store credit instead of cash refund → recorded as a customer credit balance usable on a future order.

## Dependencies

- Reverses payments in [Module 6](06-payments.md); restocks via [Module 3](03-inventory.md); net figures into [Module 8 — Reporting](08-reporting.md).

---

## Scope (this module)

**In scope:**
- Cancellations (release stock, void payment); returns with reason; restock vs write-off; refunds reversing payment; COD-rejected handling; partial returns; store credit.

**Out of scope:**
- The original sale (from [Orders](04-channels-orders.md)); how refunds appear in P&L (from [Reporting](08-reporting.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Cancel before ship (release stock), return after delivery with refund reversing the payment, restock or write-off. |
| **Post-MVP** | Partial-line returns, store credit balances, dropship 'refund without physical return', return-in-transit states. |

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
