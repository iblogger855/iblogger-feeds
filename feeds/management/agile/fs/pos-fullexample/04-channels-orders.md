# FS Module 4: Sales Channels & Orders

> Part of the [Cross-Border Social Resell POS](00-overview.md). Capturing orders from TikTok Shop & Facebook, and the order lifecycle.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

This is where sales happen. Orders arrive from **TikTok Shop** (more structured, often via API) and **Facebook** (messy — comments, DMs, live-selling "claims"). The system must capture both into one consistent **Order** object and run it through a clear lifecycle, regardless of where it came from. The order remembers its channel so we can measure each one's performance.

## Users

Sales/Chat agent (primary), Fulfillment, Finance, Owner.

## Functional Requirements

- **OR-1:** An **Order** records: customer (name, phone, social handle, delivery address), channel (TikTok / Facebook / manual), line items (product variant + qty + agreed price), payment method, and notes.
- **OR-2:** **TikTok Shop** orders can be **imported via API** (where available) so the agent doesn't re-type them; imported orders are matched to catalog products by SKU.
- **OR-3:** **Facebook** orders can be created **manually** by an agent from a chat/comment, including live-selling where a customer "claims" an item by comment (e.g. "SOLD" / item code).
- **OR-4:** The Order has a lifecycle: **Draft → Confirmed → Awaiting Payment / Awaiting Stock → Ready to Ship → Shipped → Delivered → Closed**, with side states **On Hold** and **Cancelled**.
- **OR-5:** On **Confirm**, for **stocked** items the system **reserves stock** (decrements available); for **dropship** items it flags the order to trigger a supplier purchase ([Module 5](05-fulfillment.md)).
- **OR-6:** The system **prevents overselling**: confirming an order for more than the available stock of a stocked variant is blocked or flagged.
- **OR-7:** An agent can apply a **manual price/discount** per line (social selling negotiates), and the system records the difference from list price for margin reporting.
- **OR-8:** Each order shows its **payment status** (unpaid / partially paid / paid) sourced from [Module 6](06-payments.md), and its **fulfillment status** from [Module 5](05-fulfillment.md).
- **OR-9:** Orders are **searchable** by customer phone/handle, channel, status, and date.
- **OR-10:** Duplicate detection: if the same customer + same items is captured twice in a short window, the system warns of a possible duplicate.

## Acceptance Criteria

- **OR-2:** Given TikTok API is connected, When a new TikTok order arrives, Then it appears as a Draft/Confirmed order with line items matched to catalog SKUs, with no manual typing.
- **OR-3:** Given a Facebook live session, When an agent records customer "Dara" claiming item code "A12" qty 1, Then an order is created for Dara with that line item.
- **OR-5 (stocked):** Given a stocked variant at 5 available, When an order for 2 is confirmed, Then available becomes 3 and the order moves toward Ready to Ship.
- **OR-5 (dropship):** Given a dropship product, When the order is confirmed, Then it enters "Awaiting Stock" and a purchase trigger is raised for the Buyer.
- **OR-6:** Given a stocked variant at 1 available, When two agents each try to confirm an order for that last unit, Then only the first succeeds and the second is blocked with "insufficient stock".
- **OR-7:** Given a list price of 25, When an agent sells it at 22, Then the order records a −3 discount and the margin report reflects the lower price.
- **OR-4:** Given an order in Draft, When it is moved straight to Shipped, Then the action is blocked — it must pass through Confirmed and the required intermediate states.

## Edge Cases

- TikTok API down → agent can still create the order manually; later de-duplicated against the API import.
- Customer changes their order before shipping → order is editable while in Draft/Confirmed/On Hold; edits adjust reserved stock accordingly.
- Live-selling burst (many claims in seconds) → capture must be fast and not lose claims; duplicate warning helps but doesn't block legitimate repeat buyers.
- Mixed order: some lines stocked, some dropship → order can be **partially** Ready to Ship while waiting on the dropship line (ties to split fulfillment in Module 5).

## Dependencies

- Reads availability from [Module 3](03-inventory.md); triggers [Module 5 — Fulfillment](05-fulfillment.md); shows payment from [Module 6](06-payments.md); feeds [Module 8 — Reporting](08-reporting.md).

---

## Scope (this module)

**In scope:**
- The Order object; manual capture from Facebook/live; TikTok API import where available; order lifecycle; stock reservation on confirm; oversell prevention; manual discounts; search.

**Out of scope:**
- Physical fulfillment (see [Fulfillment](05-fulfillment.md)); money (see [Payments](06-payments.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Manually capture an order from any channel, run it through the lifecycle, reserve stock on confirm, prevent oversell. |
| **Post-MVP** | TikTok API auto-import, duplicate detection, live-claim fast capture (see [Live Selling](13-live-selling.md)). |

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
