# Appendix A2: Non-Functional Requirements (NFRs)

> Part of the [Cross-Border Social Resell POS](00-overview.md). The qualities the system must have — not *what* it does, but *how well*. The overview lists these at a glance; this appendix makes them testable and assigns the modules most affected.

Each NFR has an ID (NFR-#), a measurable target, and the modules it bears on hardest. "Measurable" is the point — an NFR you can't test is just a wish.

## Performance

| ID | Requirement | Target (measurable) | Most affected |
|----|-------------|---------------------|---------------|
| NFR-1 | Common actions feel instant | Capture order, check stock, record payment each respond in **< 1s** at p95 on a normal 4G connection | Orders, Inventory, Payments |
| NFR-2 | Live-selling capture keeps up | A claim entry creates a draft line in **< 1s**, sustained through a burst of **≥ 30 claims/min** | Live Selling |
| NFR-3 | Reports return quickly | A month-range P&L renders in **< 5s** | Reporting |

## Reliability & Data Integrity

| ID | Requirement | Target | Most affected |
|----|-------------|--------|---------------|
| NFR-4 | No lost orders or payments | Zero data loss on a crash/power cut; an in-progress order/sale is recoverable on restart | Orders, Payments, Live Selling |
| NFR-5 | Money & stock never go inconsistent | Stock can't go negative; confirmed payments total can't exceed order total; all enforced at write time | Inventory, Orders, Payments |
| NFR-6 | Cost history is immutable | A shipment's FX/landed cost doesn't change when rates move; corrections are new logged adjustments | Landed Cost |

## Security & Access

| ID | Requirement | Target | Most affected |
|----|-------------|--------|---------------|
| NFR-7 | Least-privilege access | Every sensitive action (pricing, payment confirm, stock adjust, refund) is gated by role; denied actions are blocked, not hidden-but-allowed | Users/Roles (all) |
| NFR-8 | Cost/margin confidentiality | Landed cost, margin, and P&L visible only to Owner/Finance roles | Reporting, Inventory |
| NFR-9 | Tamper-evident audit | Every money/stock change is logged append-only; logs cannot be edited or deleted | Users/Roles |
| NFR-10 | Credential safety | No plaintext secrets; supplier/courier/gateway keys stored securely | Cross-cutting |

## Auditability & Traceability

| ID | Requirement | Target | Most affected |
|----|-------------|--------|---------------|
| NFR-11 | Who/when/before/after | Each audit entry records actor, timestamp, action, and before/after value | Users/Roles, Payments, Inventory |
| NFR-12 | Traceable money | Every payment, COD remittance, refund, and adjustment is traceable to an order and a person | Payments, Returns |

## Usability & Mobile

| ID | Requirement | Target | Most affected |
|----|-------------|--------|---------------|
| NFR-13 | Mobile-first for floor staff | Order capture, live capture, and fulfillment screens are fully usable on a phone | Orders, Live Selling, Fulfillment |
| NFR-14 | Fast capture | Capturing a typical order takes **≤ 30s**; a live claim **≤ 5s** | Orders, Live Selling |
| NFR-15 | Clear errors | Every blocked action shows a plain-language reason (e.g. "exceeds remaining balance"), never a silent failure | All |

## Localization

| ID | Requirement | Target | Most affected |
|----|-------------|--------|---------------|
| NFR-16 | Local language & currency | Staff UI and receipts in the configured locale; amounts in base currency | All |
| NFR-17 | Explicit FX | Supplier costs in CNY, converted via a recorded rate — never silently mixed currencies | Landed Cost, Reporting |

## Availability & Degradation

| ID | Requirement | Target | Most affected |
|----|-------------|--------|---------------|
| NFR-18 | Works when an integration is down | If a platform/courier/gateway API is unavailable, the manual path still works; the system never *requires* an external API to take an order or ship | Orders, Fulfillment, Payments, Marketing |
| NFR-19 | Reasonable uptime | Operational availability target **≥ 99%** during business hours (define maintenance windows) | Cross-cutting |

## Scalability

| ID | Requirement | Target | Most affected |
|----|-------------|--------|---------------|
| NFR-20 | Grows with the business | Handles a planned **10× order volume** without redesign; live capture and reporting degrade gracefully, not catastrophically | Orders, Reporting, Live Selling |

## Notes

- These are **targets to design and test against**, set deliberately modest for a small-team v1 — tighten them as the business scales.
- Specific numbers (1s, 30 claims/min, 99%) are illustrative defaults; confirm them with the team before sign-off.
- How each target is *achieved* (caching, queues, DB choice) is an engineering decision → ADR, not this FS.
