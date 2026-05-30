# FS Module 11: Marketing & Attribution

> Part of the [Cross-Border Social Resell POS](00-overview.md). **Revenue module** — tells you which marketing actually makes money, so spend follows results.
> 
> 📐 **Build-ready detail:** see [11a-marketing-attribution-detailed.md](11a-marketing-attribution-detailed.md) for full use case, mock-up, and field-level specifications.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

The fastest way to grow revenue is to **stop wasting ad spend and double down on what works**. But most resell sellers can't tell which post, ad, or live session produced which sale — so they guess. This module attributes orders back to their marketing source and reports **ROAS (return on ad spend)** and cost-per-order per campaign, turning marketing from a gamble into a measured lever.

## Users

Marketing/Owner (primary), Finance (spend data), Sales (capture source).

## User Stories

- As **Marketing**, I want to record a campaign with its ad spend, so that every marketing effort has its cost captured. *(→ MK-1, MK-5)*
- As a **Sales agent**, I want to tag an order with its source, so that we know which ad/post/live produced the sale. *(→ MK-2)*
- As an **Owner**, I want to see ROAS and cost-per-order per campaign, so that I move spend toward what actually makes money. *(→ MK-3, MK-6)*
- As **Marketing**, I want to attribute orders from a live session, so that I can measure a live's viewer-to-order conversion. *(→ MK-4)*
- As an **Owner**, I want to see unattributed orders honestly bucketed, so that my marketing numbers aren't fiction. *(→ MK-7)*

---
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
- **MK-1:** Given the Owner creates a campaign 'TT-JUN' with spend 200, When it is saved, Then the campaign exists with its channel, dates, and spend recorded.
- **MK-5:** Given a campaign, When the Owner enters spend manually (or imports it where an API exists), Then that spend is used in the campaign's ROAS.

## Edge Cases

- One order influenced by several touches (saw an ad, bought in a live) → use last-touch attribution by default; note the limitation rather than overclaiming.
- Ad platform API unavailable → spend entered manually; attribution still works via voucher/UTM/manual.
- Organic (no spend) sales → ROAS is not meaningful; report revenue/margin without dividing by zero.

## Dependencies

- Source captured in [Module 4](04-channels-orders.md); vouchers from [Module 10](10-promotions.md); revenue/margin from [Module 8](08-reporting.md); spend reconciled with [Module 6](06-payments.md)/Finance.

---

## Scope (this module)

**In scope:**
- Campaign records with spend; order source tagging (UTM/voucher/manual); ROAS + cost-per-order; live-session attribution; campaign ranking dashboard; honest 'unattributed' bucket.

**Out of scope:**
- Creating ad creative / running ad platforms; the order data itself (from [Orders](04-channels-orders.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Campaign with manual spend, order source tagged via voucher/manual, ROAS + cost-per-order per campaign. |
| **Post-MVP** | Ad-platform API spend import, UTM auto-capture, live-session conversion, multi-touch attribution. |

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
