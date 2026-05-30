# FS Module 8: Reporting & Profit/Loss

> Part of the [Cross-Border Social Resell POS](00-overview.md). Turning all the data into the numbers the owner actually cares about.
> 
> 📐 **Build-ready detail:** see [08a-reporting-detailed.md](08a-reporting-detailed.md) for full use case, mock-up, and field-level specifications.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

The whole point of tracking landed cost, channel, discounts, and returns is to answer one question honestly: **are we actually making money, and where?** This module reports real **profit/loss** — revenue minus landed cost minus fees minus returns — plus the operational numbers (stock value, COD float, channel performance) that keep the business safe. Revenue alone is a vanity number; this module refuses to show it without cost beside it.

## Users

Owner (primary), Finance, PM.

## User Stories

- As an **Owner**, I want to see real profit/loss net of returns over a date range, so that I know if we actually made money, not just revenue. *(→ RP-1, RP-7)*
- As an **Owner**, I want to see margin per product, so that I double down on winners and drop losers. *(→ RP-2)*
- As an **Owner**, I want to compare TikTok vs Facebook performance, so that I put effort where it pays. *(→ RP-3)*
- As an **Owner**, I want to see current stock value and COD float, so that I know how much capital is tied up and in the wild. *(→ RP-4, RP-5)*
- As **Finance**, I want to export reports to CSV, so that our accountant can work from clean data. *(→ RP-8)*

---
## Functional Requirements

- **RP-1:** A **Profit/Loss** view over a date range: gross revenue, total landed cost of goods sold, fees (shipping, courier, payment), returns/refunds, and **net profit**.
- **RP-2:** **Margin per product / variant**: selling price (incl. manual discounts) minus landed cost, so the owner sees true winners and losers.
- **RP-3:** **Channel performance**: orders, revenue, and margin split by **TikTok vs Facebook vs manual**, so spend follows what works.
- **RP-4:** **Stock value** report: current inventory valued at landed cost (total tied-up capital).
- **RP-5:** **COD float** report: cash shipped but not yet remitted, per courier — the money "in the wild".
- **RP-6:** **Outstanding payments**: orders awaiting payment / partially paid, so nothing is forgotten.
- **RP-7:** Reports reflect **net of returns** (from [Module 7](07-returns.md)) — a refunded sale is not counted as revenue.
- **RP-8:** All reports are **filterable** by date range, channel, product, and exportable (CSV) for the accountant.

## Acceptance Criteria

- **RP-1:** Given in a month: revenue 10,000, COGS (landed) 6,000, fees 800, refunds 500, When the P&L is viewed, Then net profit = 10,000 − 6,000 − 800 − 500 = **2,700**.
- **RP-2:** Given a product sold at 25 with landed cost 14, When margin is viewed, Then it shows 11 per unit (44%); a discounted sale at 22 shows 8 (36%).
- **RP-3:** Given 60 orders from TikTok and 40 from Facebook, When channel performance is viewed, Then revenue and margin are shown separately for each channel.
- **RP-5:** Given 60 of COD is shipped but unremitted via courier X, When COD float is viewed, Then it shows 60 outstanding for courier X.
- **RP-7:** Given a 50 sale that was fully refunded, When the P&L for that period is viewed, Then that 50 is not counted in net revenue.
- **RP-4:** Given stock of 100 units at landed cost 3.50, When the stock-value report runs, Then it shows 350 tied-up capital.
- **RP-6:** Given orders awaiting or partially paid, When the outstanding-payments report runs, Then each is listed with the amount still owed.
- **RP-8:** Given any report, When the user filters by date range and channel and exports, Then a CSV matching the filtered view is produced.

## Edge Cases

- A sale and its return fall in **different months** → the refund reduces the month it occurred in, and the report makes the timing visible (no silent back-dating).
- FX changed between buying and selling → margin uses the **historical landed cost** of the units actually sold (from [Module 2](02-landed-cost.md)), not today's FX.
- Mixed stocked/dropship order → COGS uses each line's actual cost basis (stocked = inventory landed cost; dropship = the cost of the specific PO bought for it).

## Dependencies

- Consumes data from every prior module; this is the read/aggregation layer. Authoritative figures come from [Landed Cost](02-landed-cost.md), [Payments](06-payments.md), and [Returns](07-returns.md).

---

## Scope (this module)

**In scope:**
- P&L over a date range (net of returns); margin per product; channel performance; stock value; COD float; outstanding payments; CSV export.

**Out of scope:**
- The source transactions themselves (owned by their modules); accounting/tax filing (out of system).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | P&L (revenue − COGS − fees − returns), margin per product, stock value, COD float, CSV export. |
| **Post-MVP** | Channel performance breakdown, trend charts, scheduled email reports, cohort/repeat-rate analytics. |

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
