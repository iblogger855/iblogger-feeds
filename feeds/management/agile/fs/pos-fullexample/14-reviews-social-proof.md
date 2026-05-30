# FS Module 14: Reviews & Social Proof

> Part of the [Cross-Border Social Resell POS](00-overview.md). **Revenue module** — trust is the #1 conversion lever in social commerce.
> 
> 📐 **Build-ready detail:** see [14a-reviews-social-proof-detailed.md](14a-reviews-social-proof-detailed.md) for full use case, mock-up, and field-level specifications.


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

On TikTok and Facebook, buyers trust other buyers more than the seller. Reviews, ratings, and "customer photos" turn a hesitant viewer into a buyer — and a steady stream of fresh social proof lifts conversion on every future sale. This module collects feedback after delivery, surfaces the good for marketing, and routes the bad to service before it becomes a public complaint. It's a small module with outsized revenue impact.

## Users

Marketing/Owner (use proof), Service/Sales (handle negatives), customers (leave reviews).

## User Stories

- As **Marketing**, I want to request a review after delivery, so that we steadily gather fresh social proof. *(→ RV-1)*
- As a **Customer**, I want to leave a rating, comment and photo, so that my feedback helps other buyers and the seller. *(→ RV-2)*
- As **Marketing**, I want to collect positive reviews into a shareable library, so that I can reuse real proof in posts and lives. *(→ RV-3, RV-5)*
- As a **Service agent**, I want to be alerted to a negative review, so that I resolve it privately before it becomes a public complaint. *(→ RV-4)*
- As an **Owner**, I want to see review rate and rating trend, so that I track trust as a measurable lever. *(→ RV-7)*

---
## Functional Requirements

- **RV-1:** After an order is **Delivered** ([Module 5](05-fulfillment.md)), the system can trigger a **review request** to the customer via their channel (with consent from [Module 12](12-customers-loyalty.md)).
- **RV-2:** A **review** captures rating (1–5), text, and optional customer photo, linked to the order and product.
- **RV-3:** **Positive reviews** (e.g. 4–5★) can be marked **shareable** and collected into a library for use in posts, lives, and product listings.
- **RV-4:** **Negative reviews** (e.g. 1–2★) auto-create a **service follow-up task** so the team can resolve privately before it escalates.
- **RV-5:** Per-product **average rating and review count** are visible to the team (and usable in listings) to inform what to promote or drop.
- **RV-6:** Optional **incentive**: offer loyalty points or a voucher for leaving a review (configurable), without paying for fake positives — incentive is for *a* review, not a *good* one.
- **RV-7:** A small **social-proof metric**: review rate (reviews ÷ delivered orders) and rating trend over time.

## Acceptance Criteria

- **RV-1:** Given an order is marked Delivered, When the review trigger runs, Then the customer receives a review request (unless they opted out of marketing).
- **RV-2:** Given a customer submits 5★ with a photo, When saved, Then it links to that order and product and appears in the product's reviews.
- **RV-3:** Given a 5★ review, When marketing marks it shareable, Then it appears in the social-proof library for reuse.
- **RV-4:** Given a 1★ review arrives, When it is saved, Then a service follow-up task is created and assigned, not left to chance.
- **RV-5:** Given a product has reviews 5,4,5,3, When viewed, Then it shows average 4.25 over 4 reviews.
- **RV-6:** Given review incentives are on, When a customer submits any review (good or bad), Then they receive the configured points/voucher for leaving it.
- **RV-7:** Given a period's delivered orders and reviews, When the metric is viewed, Then it shows review rate (reviews ÷ delivered) and the rating trend.

## Edge Cases

- Review left for a returned/refunded order → still recorded but flagged so it's read in context.
- Customer opted out of marketing → no automated review request (manual ask only).
- Suspected fake/spam review → can be hidden from public use but kept for record.

## Dependencies

- Triggered after delivery in [Module 5](05-fulfillment.md); consent/incentive from [Module 12](12-customers-loyalty.md); negatives route to service; rating trend into [Module 8](08-reporting.md).

---

## Scope (this module)

**In scope:**
- Post-delivery review request (with consent); review capture (rating/text/photo); shareable positive library; negative→service task; per-product rating; optional incentive; review-rate metric.

**Out of scope:**
- Publishing to the social platform itself; the delivery event (from [Fulfillment](05-fulfillment.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Capture a review (rating + text + photo) linked to order/product; route negatives to a service task. |
| **Post-MVP** | Automated post-delivery review requests, shareable library, incentives, rating-trend reporting, spam handling. |

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
