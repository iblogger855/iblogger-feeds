# FS Module 13: Live Selling & Channel Engagement

> Part of the [Cross-Border Social Resell POS](00-overview.md). **Revenue module** — live selling is the single highest-velocity sales channel for TikTok/Facebook resellers.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

Live selling (TikTok Live, Facebook Live) drives a huge share of social-commerce revenue: viewers claim items by comment in real time, and speed wins. The chaos of a live — dozens of "SOLD" comments per minute, stock running out mid-stream — is exactly where manual processes collapse and sales get lost. This module makes the live a first-class, fast capture flow tied to inventory and follow-up, so the team can sell faster without losing orders or overselling.

## Users

Sales/Host (during live), Fulfillment (after), Marketing.

## Functional Requirements

- **LV-1:** A **live session** is set up before going live: featured products with **item codes** (e.g. "A1", "A2") and the stock allocated to the live.
- **LV-2:** During the live, an agent **captures claims fast**: entering "item code + customer handle + qty" creates a draft order line in one action (or via comment-capture where the platform API allows).
- **LV-3:** **Real-time stock**: when allocated stock for an item code hits zero, the system flags "sold out" so the host stops promising it.
- **LV-4:** **Oversell protection**: simultaneous claims on the last unit are resolved first-come; the loser is flagged for restock or alternative, not silently dropped.
- **LV-5:** After the live, claimed drafts become normal **orders** ([Module 4](04-channels-orders.md)) and the system sends/exports a **payment-request list** (handle, items, total, how to pay) for follow-up.
- **LV-6:** The session attributes to a **campaign** ([Module 11](11-marketing-attribution.md)) so its revenue, conversion, and margin are measured.
- **LV-7:** **Unpaid-claim handling**: claims not paid within a configurable window are auto-released back to stock, so non-payers don't tie up inventory.

## Acceptance Criteria

- **LV-2:** Given a live session, When the agent enters "A1 / @dara / 1", Then a draft order line for @dara is created for item A1 qty 1 in under 1 second.
- **LV-3:** Given item A1 has 5 allocated, When 5 are claimed, Then A1 shows "sold out" and further A1 claims are blocked or queued.
- **LV-4:** Given A2 has 1 left, When two viewers claim it within the same second, Then the first claim wins and the second is flagged "waitlist / sold out".
- **LV-5:** Given the live ends with 30 claims, When the host closes it, Then 30 orders exist and a payment-request list is produced for follow-up.
- **LV-7:** Given a claim unpaid after the 24h window, When the window passes, Then that unit returns to available stock and the order is marked "expired / unpaid".

## Edge Cases

- Platform comment API not available → manual fast-entry path must be just as quick; the live can't depend on an API that may break mid-stream.
- A claimed item is dropship (not stocked) → no live stock cap, but it still becomes an order that triggers a supplier purchase ([Module 5](05-fulfillment.md)).
- Viewer claims more than allocated to the live but more exists in main stock → configurable: allow drawing from main stock or hold to the live allocation.

## Dependencies

- Stock from [Module 3](03-inventory.md); claims become orders in [Module 4](04-channels-orders.md); follow-up payment via [Module 6](06-payments.md); attribution in [Module 11](11-marketing-attribution.md).

---

## Scope (this module)

**In scope:**
- Live session setup with item codes + allocated stock; fast claim capture; real-time sold-out; oversell protection; post-live order creation + payment-request list; campaign attribution; unpaid-claim release.

**Out of scope:**
- General order lifecycle (from [Orders](04-channels-orders.md)); payment collection (from [Payments](06-payments.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Set up a live with item codes + allocation, fast manual claim entry → draft orders, real-time sold-out, post-live payment list. |
| **Post-MVP** | Platform comment-API auto-capture, waitlist handling, unpaid-claim auto-release, live conversion analytics. |

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
