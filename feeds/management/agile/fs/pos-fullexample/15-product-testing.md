# FS Module 15: Product Demand Testing (Test Before You Buy)

> Part of the [Cross-Border Social Resell POS](00-overview.md). **Validation gate** — test demand on social *before* spending money on inventory. Runs **before** [Procurement](01-procurement.md).
> 
> 📐 **Build-ready detail:** see [15a-product-testing-detailed.md](15a-product-testing-detailed.md) for full use case, mock-up, and field-level specifications.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

The most expensive mistake in resell is buying and stocking a product on a hunch, then watching it sit dead in the warehouse — cash frozen, margin gone. This module flips the order of operations: **before any purchase, test the product's demand on TikTok or Facebook** with a small, cheap experiment (a post, a small ad, or a live feature). Real signals — clicks, comments, "how to buy", and actual orders — then drive a clear decision: **Stock it, Dropship-only, or Drop it.** You spend money on inventory only after the market has voted.

This is "test before you invest." It turns procurement from a gamble into a data-backed decision.

## Users

Owner/Marketing (run tests, read results), Buyer (acts on the decision), Sales.

## User Stories

- As an **Owner**, I want to set up a demand test on social before buying, so that I validate interest instead of gambling on stock. *(→ PT-1, PT-2)*
- As a **Sales agent**, I want to sell a tested product as pre-order only, so that we take orders with zero inventory risk during the test. *(→ PT-4)*
- As an **Owner**, I want to get a Stock/Dropship/Drop recommendation from the result, so that the buy decision is data-backed, not a hunch. *(→ PT-3, PT-5)*
- As a **Buyer**, I want to receive a suggested first PO quantity on a Stock result, so that I order the right amount, not too much. *(→ PT-6)*
- As an **Owner**, I want to keep a record of every test, so that future buying decisions learn from past ones. *(→ PT-7, PT-8)*

---
## Functional Requirements

- **PT-1:** A **test** is created for a candidate product (not yet stocked): hypothesis, channel(s), test type (organic post / small paid ad / live feature), budget cap, and the **test window** (e.g. 3 days).
- **PT-2:** A test can run **A/B variants** of the *listing* (e.g. price A vs price B, photo A vs photo B, hook A vs hook B) to find what resonates — but its primary job is to measure **whether demand exists at all**.
- **PT-3:** The system records **signals** per test/variant: reach/views, clicks/link taps, comments, "how to buy" intents, saved/shared, and **actual orders/pre-orders captured** (the strongest signal).
- **PT-4:** During a test, the product is sold as **dropship / pre-order only** (buy-after-order) so no inventory risk is taken while testing.
- **PT-5:** At the end of the window, the system computes a **demand result** and maps it to a recommended action against configurable thresholds:
  - **Strong demand → Stock** (worth a bulk buy from China).
  - **Moderate demand → Dropship-only** (sell on, buy per order, no stock risk).
  - **Weak demand → Drop** (do not buy; archive the candidate).
- **PT-6:** Accepting a recommendation **sets the product's fulfillment type** in [Inventory](03-inventory.md) and, for "Stock", can hand the Buyer a **suggested first PO quantity** based on test order velocity.
- **PT-7:** The test's **cost** (ad spend) is recorded and attributed via [Marketing & Attribution](11-marketing-attribution.md), so test spend is part of the product's true economics.
- **PT-8:** A **test report** is produced (see example below) showing signals, variant comparison, the decision, and the reasoning — kept as a record so future buying decisions learn from past tests.

## Acceptance Criteria

- **PT-4:** Given a product under test, When a customer orders it, Then the order is created as **dropship/pre-order** and no stock is assumed to exist.
- **PT-5 (strong):** Given thresholds where "Stock" = ≥20 orders or ≥5% order-conversion in the window, When a test gets 34 orders at 6.2%, Then the recommendation is **Stock**.
- **PT-5 (weak):** Given "Drop" = <3 orders and low engagement, When a test gets 1 order and few comments, Then the recommendation is **Drop** and the candidate is archived (not bought).
- **PT-6:** Given the Owner accepts a **Stock** recommendation, When applied, Then the product's fulfillment type becomes Stocked in Module 3 and a suggested PO quantity is shown to the Buyer.
- **PT-2:** Given variants price A=25 and price B=22, When the test ends, Then the report shows orders/conversion for each so the Owner sees which price sold better.
- **PT-7:** Given a test spent 15 on ads, When the product later sells, Then that 15 is part of the product's attributed cost in reporting.
- **PT-1:** Given a candidate product, When the Owner creates a test with channel, type, budget cap and a 3-day window, Then the test is scheduled with those parameters.
- **PT-3:** Given a running test, When signals come in, Then views, clicks, comments and pre-orders are recorded per variant.
- **PT-8:** Given a completed test, When it closes, Then a test report is saved showing signals, variant comparison, decision, and reasoning.

## Edge Cases

- A product tests weak but the Owner believes in it → Owner can override "Drop" and stock anyway, **logged as an override** so the bet is on record.
- High clicks but zero orders → strong interest, wrong price/offer; recommend a **re-test with a different price** (A/B) rather than Stock or Drop.
- Test orders that don't get paid (pre-orders abandoned) → counted as soft interest, weighted below paid orders in the demand result.
- Seasonal product tested off-season → flag the window so a weak result isn't read as permanent.

## Example Test Report

> **Product candidate:** Mini LED desk lamp (rechargeable)
> **Test window:** Jun 10–12 (3 days) · **Channel:** Facebook (small boosted post) + 1 TikTok live mention
> **Mode:** Dropship / pre-order only (no stock bought) · **Ad spend:** $15

| Variant | Listing | Views | Link taps | Comments / "how to buy" | Pre-orders | Order conv. |
|---------|---------|-------|-----------|--------------------------|-----------|-------------|
| A | Price $14 | 5,200 | 240 | 38 | 31 | 0.60% |
| B | Price $11 | 5,000 | 260 | 41 | 36 | 0.72% |
| **Total** | | **10,200** | **500** | **79** | **67** | **0.66%** |

**Thresholds (configured):** Stock ≥ 40 pre-orders OR ≥ 0.6% conv · Dropship 10–39 · Drop < 10.

**Result:** 67 pre-orders at 0.66% conversion → **above the Stock threshold.**

**Recommendation: STOCK.** Demand is real and price-tolerant (it sold well even at the higher $14, though $11 converted slightly better). Suggested first PO: **80 units** (≈ test velocity over a 2-week sell-through, with a margin buffer). Test ad spend of $15 produced 67 pre-orders → strong, cheap signal.

**Decision (Owner):** Accepted — set to **Stocked**, list price **$13** (between the tested points), first PO of 80 units to the Buyer.

> Had the result been 1–2 pre-orders, the recommendation would have been **Drop** — and the business would have saved the cost of a dead inventory buy. That avoided loss is the whole point of this module.

## Dependencies

- Runs **before** [Procurement](01-procurement.md) (gates whether to buy at all).
- Sells via dropship/pre-order using [Channels & Orders](04-channels-orders.md) + [Fulfillment](05-fulfillment.md).
- Test spend attributed in [Marketing & Attribution](11-marketing-attribution.md); decision sets fulfillment type in [Inventory](03-inventory.md).

---

## Scope (this module)

**In scope:**
- Test setup (channel/type/budget/window); A/B listing variants; signal capture; dropship/pre-order-only selling during test; demand result → Stock/Dropship/Drop thresholds; set fulfillment type + suggested PO; test cost attribution; test report.

**Out of scope:**
- The actual purchase (from [Procurement](01-procurement.md)); the selling mechanics (from [Orders](04-channels-orders.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Run a test selling dropship/pre-order-only, capture orders as the signal, map to Stock/Dropship/Drop, set fulfillment type. |
| **Post-MVP** | A/B listing variants, full signal capture (views/clicks/comments), suggested PO quantity, test-report library. |

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
