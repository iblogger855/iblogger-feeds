# FS Module 12: Customers, Loyalty & Retention

> Part of the [Cross-Border Social Resell POS](00-overview.md). **Revenue module** — repeat buyers are the cheapest revenue you'll ever get.

## Summary

Acquiring a new customer costs ad money; selling again to an existing one is nearly free. Yet most social resellers treat every sale as a one-off and never bring buyers back. This module builds a real **customer record** with purchase history, and adds the retention levers — loyalty points, store credit, segments, and re-engagement — that turn a first-time buyer into a repeat one. This is where sustainable revenue growth actually comes from.

## Users

Owner/Marketing (retention strategy), Sales (sees customer history at order time).

## Functional Requirements

- **CU-1:** A **customer** record consolidates orders across channels by phone/social handle: total orders, total spend, last order date, preferred products.
- **CU-2:** At order capture ([Module 4](04-channels-orders.md)), the agent sees the customer's **history** — new vs returning, past issues, lifetime value — to personalize service.
- **CU-3:** **Loyalty points**: customers earn points per spend (configurable rate) and redeem them for discounts; balances are tracked and audited.
- **CU-4:** **Store credit** (from refunds in [Module 7](07-returns.md) or goodwill) is held on the customer and usable on future orders.
- **CU-5:** **Segments**: the system groups customers (e.g. VIP by spend, lapsed = no order in N days, one-time buyers) for targeted follow-up.
- **CU-6:** **Re-engagement export/trigger**: produce a list (e.g. lapsed VIPs) to message via the social channel, optionally with a voucher from [Module 10](10-promotions.md).
- **CU-7:** **Repeat-rate metric**: report the share of revenue from returning vs new customers over a period.
- **CU-8:** Customer data respects **privacy/consent** — contact for marketing only where the customer hasn't opted out.

## Acceptance Criteria

- **CU-1:** Given a customer ordered 3 times across TikTok and Facebook, When their record is viewed, Then it shows 3 orders, combined spend, and last order date — merged, not split by channel.
- **CU-3:** Given a 1-point-per-1-spend rate, When a customer completes a 50 order, Then 50 points are added; redeeming 100 points gives the configured discount.
- **CU-4:** Given a customer has 10 store credit, When they place a 30 order, Then they can apply the 10 and pay 20.
- **CU-5:** Given "lapsed = no order in 60 days", When the segment runs, Then it lists customers whose last order is older than 60 days.
- **CU-7:** Given a month's orders, When repeat-rate is viewed, Then it shows % of revenue from returning customers vs new.

## Edge Cases

- Same person with two phone numbers / handles → support **merging** duplicate customer records (history and points combine, logged).
- Points/credit on a refunded order → points earned are reversed with the refund so they can't be farmed.
- Customer opts out of marketing → excluded from re-engagement lists but still has a record for service.

## Dependencies

- Built from orders in [Module 4](04-channels-orders.md); credit from [Module 7](07-returns.md); vouchers from [Module 10](10-promotions.md); repeat-rate into [Module 8](08-reporting.md).
