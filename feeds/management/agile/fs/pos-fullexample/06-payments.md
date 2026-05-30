# FS Module 6: Payments & Reconciliation

> Part of the [Cross-Border Social Resell POS](00-overview.md). Matching money to orders across COD, bank/ABA, wallets, and prepaid links.
> 
> 📐 **Build-ready detail:** see [06a-payments-detailed.md](06a-payments-detailed.md) for full use case, mock-up, and field-level specifications.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

Money arrives in different ways and at different times. **Prepaid** (card/wallet/payment link) lands before fulfillment. **Bank transfer / ABA** lands when the customer transfers and Finance confirms it. **COD** is collected by the courier on delivery and paid back to us later — meaning we carry a "COD float" that must be reconciled. This module records every payment against its order and makes sure the money we *should* have matches the money we *do* have.

## Users

Finance (primary), Sales (records intended method), Owner (reads cash position).

## User Stories

- As **Finance**, I want to record one or more payments per order, so that split payments (deposit + COD) reconcile to a single sale. *(→ PM-1, PM-2)*
- As **Finance**, I want to confirm a bank/ABA transfer against proof, so that an order isn't fulfilled on an unconfirmed payment. *(→ PM-4)*
- As **Finance**, I want to reconcile a courier's COD remittance against shipped orders, so that I know exactly which orders' cash arrived. *(→ PM-5, PM-6)*
- As an **Owner**, I want to see total COD float per courier, so that I can chase cash that's overdue. *(→ PM-6)*
- As an **Owner**, I want to have payment status derived from confirmed payments, so that the order never lies about whether it's paid. *(→ PM-8, PM-9)*

---
## Functional Requirements

- **PM-1:** Each order has one or more **payments**, each with method (**COD / Bank-ABA / Wallet / Prepaid link**), amount, and status (**Pending / Confirmed / Failed**).
- **PM-2:** An order supports **split payment** (e.g. part deposit by transfer, balance by COD) — total confirmed payments must equal the order total to be "paid".
- **PM-3:** **Prepaid link / wallet / card**: when the customer pays, the payment is marked Confirmed (via gateway callback where integrated, or manual confirm).
- **PM-4:** **Bank/ABA transfer**: the customer sends proof; **Finance confirms** the matching deposit, moving the payment to Confirmed. Unconfirmed transfers keep the order "Awaiting Payment".
- **PM-5:** **COD**: marked as "to be collected" at ship time; when the **courier remits cash**, Finance **reconciles** the COD batch, confirming which orders' cash was received.
- **PM-6:** The system tracks **COD float** = total COD shipped but not yet remitted by couriers, per courier.
- **PM-7:** A **deposit** can be required for high-value or dropship orders before purchasing (configurable).
- **PM-8:** Every payment, confirmation, and reconciliation is **logged**; a confirmed payment cannot be silently edited (only reversed with a logged reason).
- **PM-9:** The order's payment status (unpaid / partial / paid) is always derived from its confirmed payments, shown in [Module 4](04-channels-orders.md).

## Acceptance Criteria

- **PM-1:** Given an order, When a COD payment is added, Then it is recorded against that order with status Pending until confirmed.
- **PM-2:** Given an order total of 50, When a 20 transfer is confirmed and 30 is later collected by COD, Then the order becomes "paid" (20 + 30 = 50).
- **PM-3:** Given a prepaid-link payment, When the gateway callback (or a manual confirm) reports success, Then the payment moves to Confirmed automatically.
- **PM-4:** Given a customer uploads transfer proof for 50, When Finance confirms a matching 50 deposit, Then the payment is Confirmed and the order leaves "Awaiting Payment".
- **PM-4 (mismatch):** Given proof says 50 but the deposit is 45, When Finance reviews, Then they can confirm 45 (leaving 5 outstanding) — the order stays partially paid.
- **PM-5:** Given 10 COD orders totaling 600 shipped via courier X, When courier X remits 540 covering 9 orders, Then Finance reconciles those 9 as paid and the 10th stays "COD pending / 60 owed".
- **PM-6:** Given the above, When the Owner views COD float for courier X, Then it shows 60 outstanding.
- **PM-7:** Given a product configured to require a deposit, When an order for it is confirmed, Then it cannot proceed to purchase/fulfillment until the deposit payment is Confirmed.
- **PM-8:** Given a Confirmed payment, When someone attempts to change its amount, Then it is blocked and a logged reversal is required instead.
- **PM-9:** Given an order with 20 of 50 confirmed, When its payment status is read, Then it shows "partial"; when the remaining 30 confirms, it shows "paid".

## Edge Cases

- Customer overpays a transfer → record actual; surface the overage for refund or store credit (ties to [Module 7](07-returns.md)).
- Courier remits a lump sum without a clean per-order breakdown → reconciliation screen lets Finance allocate the lump sum across the shipped COD orders.
- Failed prepaid payment (card declined) → order stays Awaiting Payment; not fulfilled.
- Refund after payment → handled in [Module 7](07-returns.md), which reverses the relevant payment.

## Dependencies

- Payment intent set in [Module 4](04-channels-orders.md); COD float created at ship in [Module 5](05-fulfillment.md); refunds in [Module 7](07-returns.md); cash & margin into [Module 8 — Reporting](08-reporting.md).

---

## Scope (this module)

**In scope:**
- Payments per order; methods (COD/bank-ABA/wallet/prepaid); split payment; manual confirm for bank/wallet; COD reconciliation + float; deposits; payment status.

**Out of scope:**
- Refund money flow (see [Returns](07-returns.md)); profit reporting (see [Reporting](08-reporting.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Record a payment per method, manual confirm for bank/COD, derive order paid/partial/unpaid status. |
| **Post-MVP** | Gateway auto-confirm for prepaid/wallet, COD batch reconciliation with lump-sum allocation, deposits. |

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
