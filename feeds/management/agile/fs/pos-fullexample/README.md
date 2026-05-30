# Full Example FS — Cross-Border Social Resell POS

A comprehensive, modular example Functional Spec for a full operations/POS system: source from China (1688 / Taobao / AliExpress), import, and resell on **TikTok Shop** and **Facebook**. Hybrid model (stocked + dropship), all payment types (COD / bank-ABA / wallet / prepaid).

Built to show the [FS Document Procedure](../fs-document-procedure.md) at real scale. Start with the overview, then read the modules in order.

## Contents

- **[00 — System Overview](00-overview.md)** — summary, business model, roles, expected impact, end-to-end flow, system-wide NFRs.

**Operations backbone (protect profit, scale without chaos)**
- **[01 — Procurement & Suppliers](01-procurement.md)** — buying from China, purchase orders.
- **[02 — Import & Landed Cost](02-landed-cost.md)** — shipping, customs, FX, true per-unit cost.
- **[03 — Inventory & Products](03-inventory.md)** — catalog, stocked vs dropship, stock levels, valuation.
- **[04 — Sales Channels & Orders](04-channels-orders.md)** — TikTok & Facebook capture, order lifecycle.
- **[05 — Fulfillment & Delivery](05-fulfillment.md)** — stocked vs dropship fulfillment, couriers, tracking.
- **[06 — Payments & Reconciliation](06-payments.md)** — COD, bank/ABA, wallet, prepaid, matching money to orders.
- **[07 — Returns, Refunds & Cancellations](07-returns.md)** — after-sales, restock, refund flow.
- **[08 — Reporting & Profit/Loss](08-reporting.md)** — margin, P&L, channel performance, stock value, COD float.
- **[09 — Users, Roles & Audit](09-users-roles.md)** — permissions and an append-only audit trail.

**Revenue / growth layer (drive more sales)**
- **[15 — Product Demand Testing](15-product-testing.md)** — *test before you buy*: validate demand on social, then decide Stock / Dropship / Drop (runs before procurement). Includes an example test report.
- **[10 — Promotions & Discounts](10-promotions.md)** — offers, vouchers, bundles, with a margin guardrail.
- **[11 — Marketing & Attribution](11-marketing-attribution.md)** — which ads/posts/lives make money (ROAS).
- **[12 — Customers, Loyalty & Retention](12-customers-loyalty.md)** — repeat buyers, points, store credit, segments.
- **[13 — Live Selling & Channel Engagement](13-live-selling.md)** — fast claim capture, real-time stock, follow-up.
- **[14 — Reviews & Social Proof](14-reviews-social-proof.md)** — trust that lifts conversion.

**Build-ready detailed specs** — each module above has a companion `NNa-…-detailed.md` with full FSD depth (use case, screen mock-up, field-level spec tables, validation/error rules, button behaviors). Linked from each module's header. *(Field-level detail is illustrative until a module enters a build sprint.)*

**Appendices (shared depth)**
- **[A1 — Data Dictionary & Glossary](A1-data-dictionary.md)** — shared terms + core entities/fields.
- **[A2 — Non-Functional Requirements](A2-nfr.md)** — measurable performance/reliability/security/usability targets.
- **[A3 — Wireframes & Screen Flows](A3-wireframes.md)** — low-fidelity sketches of the key screens.

Each module is sized to become its own epic; tickets are created from it at Gate 0 of the [Ticket Sign-Off Procedure](../../procedure/signoff-jira-ticket-procedure.md).

**A note on impact:** modules 1–9 protect the profit you already make; modules 10–14 drive new revenue. No software guarantees a specific "+X% revenue" — see the [Expected Impact](00-overview.md#3b-expected-impact-honest) section.
