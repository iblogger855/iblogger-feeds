# FS Module 11: Marketing & Attribution

> Part of the [Cross-Border Social Resell POS](00-overview.md). **Revenue module** — tells you which marketing actually makes money, so spend follows results.

## Summary

The fastest way to grow revenue is to **stop wasting ad spend and double down on what works**. But most resell sellers can't tell which post, ad, or live session produced which sale — so they guess. This module attributes orders back to their marketing source and reports **ROAS (return on ad spend)** and cost-per-order per campaign, turning marketing from a gamble into a measured lever.

## Users

Marketing/Owner (primary), Finance (spend data), Sales (capture source).

## Functional Requirements

- **MK-1:** A **campaign** record holds: channel (TikTok ad / Facebook ad / boosted post / live session / organic), name, dates, and **spend**.
- **MK-2:** An order can be tagged with its **source** — automatically via a tracked link/UTM or voucher code where available, or manually selected by the agent at capture.
- **MK-3:** The system computes per campaign: **orders attributed, revenue, margin, ad spend, ROAS (revenue ÷ spend), and cost per order**.
- **MK-4:** **Live-session tracking**: a live session is a campaign; orders captured during/just after it (or via its voucher) attribute to it, with viewers→orders conversion shown.
- **MK-5:** Spend can be entered manually or imported from the ad platform where an API exists.
- **MK-6:** A **dashboard** ranks campaigns by ROAS and by net margin contribution, so the Owner sees winners and losers at a glance.
- **MK-7:** Attribution is **best-effort and honest**: orders with no identifiable source are bucketed as "unattributed" rather than force-assigned, so numbers aren't fiction.

## Acceptance Criteria

- **MK-3:** Given a campaign with spend 200 that produced 10 orders totaling 1,000 revenue, When viewed, Then ROAS = 5.0 and cost per order = 20.
- **MK-2 (voucher):** Given campaign "TT-JUN" uses voucher "TTJUN", When an order applies "TTJUN", Then it attributes to that campaign automatically.
- **MK-4:** Given a live session campaign, When 30 orders are captured via its voucher out of 500 viewers, Then it reports a 6% viewer→order conversion.
- **MK-6:** Given three campaigns, When the dashboard loads, Then they are ranked by ROAS with margin contribution shown beside each.
- **MK-7:** Given an order with no source tag, When reports run, Then it counts in "unattributed", not assigned to a random campaign.

## Edge Cases

- One order influenced by several touches (saw an ad, bought in a live) → use last-touch attribution by default; note the limitation rather than overclaiming.
- Ad platform API unavailable → spend entered manually; attribution still works via voucher/UTM/manual.
- Organic (no spend) sales → ROAS is not meaningful; report revenue/margin without dividing by zero.

## Dependencies

- Source captured in [Module 4](04-channels-orders.md); vouchers from [Module 10](10-promotions.md); revenue/margin from [Module 8](08-reporting.md); spend reconciled with [Module 6](06-payments.md)/Finance.
