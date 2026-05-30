# FS Module 10: Promotions & Discounts

> Part of the [Cross-Border Social Resell POS](00-overview.md). **Revenue module** — drives conversion and average order value. Pairs with margin protection from [Landed Cost](02-landed-cost.md).


## Document Control
| Field | Value |
|-------|-------|
| Status | `<Draft / In Review / Approved>` |
| Version | `<0.1>` |
| Author (PO) | Sophea |
| Reviewers | PM Dara, Dev Visal, QA Chenda |
| Last updated | `<YYYY-MM-DD>` |

## Summary

Social commerce runs on offers: flash sales, bundle deals, free shipping over a threshold, voucher codes for live viewers. This module lets the team run promotions **deliberately** — with rules, limits, and a guardrail that no promo silently sells below landed cost. The goal is to lift conversion and basket size *without* giving away the margin the ops modules worked to protect.

## Users

Owner (sets promos & margin floor), Sales (applies promos at order), Marketing.

## Functional Requirements

- **PRO-1:** The Owner can create a **promotion**: type (percent off, fixed amount off, bundle price, free shipping, buy-X-get-Y), scope (product / category / whole order), and validity window.
- **PRO-2:** Promotions can be gated by a **voucher code** (e.g. "LIVE20") or applied automatically when conditions are met (e.g. order over a threshold).
- **PRO-3:** Limits are enforced: **max uses total**, **max uses per customer**, and **start/end time**.
- **PRO-4:** **Margin guardrail** — a promotion that would push a line below its landed cost (or below a configurable minimum margin) is **blocked or requires Owner override**, with the override logged.
- **PRO-5:** A promo applied to an order records the **discount amount per line**, feeding true margin in [Reporting](08-reporting.md).
- **PRO-6:** **Bundle** deals define a set of products sold together at a combined price; the system splits the bundle price across lines for cost/margin accuracy.
- **PRO-7:** **Performance**: each promotion reports uses, revenue generated, and **margin impact** so the Owner can tell which offers actually paid off.
- **PRO-8:** Promotions can be **scheduled** in advance (e.g. for a planned live session) and auto-activate/expire.

## Acceptance Criteria

- **PRO-2:** Given voucher "LIVE20" for 20% off, When a customer's order applies it within the window, Then each eligible line is discounted 20% and the code's use count increments.
- **PRO-3:** Given "LIVE20" capped at 100 uses, When the 101st customer tries it, Then it is rejected with "promotion limit reached".
- **PRO-4:** Given a product with landed cost 14 and a 50%-off promo (would sell at ~12), When applied, Then it is blocked with "below margin floor" unless the Owner overrides (logged).
- **PRO-6:** Given a bundle of A (list 30) + B (list 20) sold at 40, When ordered, Then the 40 is split proportionally (A=24, B=16) so each line's margin is correct.
- **PRO-7:** Given a flash sale ran, When the Owner views its report, Then it shows uses, revenue, and net margin impact (could be negative if discounts were deep).

## Edge Cases

- Stacking: two promos on one order → define whether they stack or the best-one-wins (configurable; default best-one-wins to protect margin).
- Promo + manual agent discount (from [Orders](04-channels-orders.md)) → combined discount still checked against the margin guardrail.
- Expired voucher pasted by a customer → rejected with a clear reason, not silently ignored.

## Dependencies

- Margin floor from [Module 2](02-landed-cost.md); applied in [Module 4](04-channels-orders.md); measured in [Module 8](08-reporting.md).

---

## Scope (this module)

**In scope:**
- Promotion types (% / fixed / bundle / free-ship / BXGY); voucher or auto-apply; usage limits; margin guardrail; per-line discount recording; bundle cost split; scheduling; promo performance.

**Out of scope:**
- Applying the discount at order time (mechanics in [Orders](04-channels-orders.md)); margin floor source ([Landed Cost](02-landed-cost.md)).

## MVP vs Post-MVP

| Phase | What ships |
|-------|-----------|
| **MVP** | Percent/fixed voucher codes with usage limits + the margin guardrail (block below cost). |
| **Post-MVP** | Bundles, BXGY, auto-apply threshold promos, scheduling, stacking rules, promo performance report. |

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
