# Appendix A1: Data Dictionary & Glossary

> Part of the [Cross-Border Social Resell POS](00-overview.md). Shared definitions so every module means the same thing by the same word. This is **functional** data (the concepts and key fields), not a database schema — the physical design lives in an ADR.

## Glossary (business terms)

| Term | Meaning |
|------|---------|
| **Stocked** | A product we buy in advance and hold in our warehouse; sold from our own stock. |
| **Dropship** | A product we sell first, then buy from the supplier per order; we hold no stock. |
| **Landed cost** | The true per-unit cost = supplier price (×FX) + allocated freight + duty + handling. |
| **FX rate** | The CNY→base-currency conversion used to value a supplier purchase; fixed per shipment. |
| **COD** | Cash on Delivery — the courier collects cash from the customer for us. |
| **COD float** | Money shipped as COD but not yet remitted to us by the courier (cash "in the wild"). |
| **Shipment** | One or more POs travelling together, sharing freight/duty for landed-cost allocation. |
| **Reservation** | Stock set aside for a confirmed order so it can't be sold twice. |
| **ROAS** | Return on Ad Spend = revenue ÷ ad spend for a campaign. |
| **Attribution** | Linking an order back to the marketing source (ad/post/live) that produced it. |
| **Demand test** | A small social experiment to validate a product before buying stock (Stock/Dropship/Drop). |
| **Pre-order** | An order taken for a product not yet in stock (used during dropship and demand tests). |
| **Margin floor** | The minimum allowed margin; promotions/discounts cannot breach it without override. |

## Core Entities (key fields, not full schema)

Field types are indicative. `→` marks a reference to another entity. Fields marked **(req)** are required.

### Supplier
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| name | text | **(req)** |
| platform | enum | 1688 / Taobao / AliExpress / other |
| store_url | url | |
| default_lead_time_days | int | |
| notes | text | |

### PurchaseOrder (PO)
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| supplier | → Supplier | **(req)** |
| status | enum | Draft / Ordered / Shipped / Received / Cancelled |
| lines | → POLine[] | each: product, qty, unit_cost_cny, supplier_sku |
| cny_total | money(CNY) | derived from lines + China shipping/fees |
| approved_by | → User | required when over the approval threshold |
| linked_order | → Order | set when the PO was raised for a dropship order |

### Shipment
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| pos | → PurchaseOrder[] | the POs travelling together |
| fx_rate | decimal | **(req)** CNY→base; immutable once set |
| freight, duty, handling | money(base) | shipment-level fees |
| allocation_method | enum | by_quantity / by_weight / by_value |

### Product
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| name, sku | text | **(req)** |
| fulfillment_type | enum | **(req)** Stocked / Dropship |
| selling_price | money(base) | **(req)** |
| variants | → Variant[] | size/color etc. |
| supplier_links | → Supplier[] | where we buy it |
| active | bool | deactivated products keep history |

### Variant (the real stock-keeping unit)
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| product | → Product | **(req)** |
| attributes | map | e.g. {color: Red, size: L} |
| available_qty | int | stocked only |
| landed_cost | money(base) | cost basis (e.g. weighted average) |
| low_stock_threshold | int | |

### Customer
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| name | text | |
| phone, social_handle | text | used to consolidate across channels |
| store_credit | money(base) | |
| loyalty_points | int | |
| marketing_consent | bool | gates re-engagement & review requests |

### Order
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| customer | → Customer | **(req)** |
| channel | enum | **(req)** TikTok / Facebook / Manual / Live |
| campaign | → Campaign | attribution source (optional) |
| status | enum | Draft / Confirmed / Awaiting Payment / Awaiting Stock / Ready to Ship / Shipped / Delivered / Closed / On Hold / Cancelled |
| lines | → OrderLine[] | each: variant, qty, agreed_price, discount |
| payment_status | enum | derived: unpaid / partial / paid |
| fulfillment_status | enum | derived from Fulfillment |

### Payment
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| order | → Order | **(req)** |
| method | enum | **(req)** COD / Bank-ABA / Wallet / Prepaid |
| amount | money(base) | **(req)** |
| status | enum | Pending / Confirmed / Failed |
| confirmed_by | → User | for manual (bank/COD) confirmations |
| courier | → Courier | for COD reconciliation |

### Fulfillment
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| order | → Order | **(req)** |
| type | enum | Stocked / Dropship |
| courier, tracking_no | text | |
| status | enum | Pending / Ready / Shipped / Delivered / Problem / Returned |
| cod_owed | money(base) | set at ship for COD orders |

### Promotion
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| type | enum | percent / fixed / bundle / free_ship / bxgy |
| voucher_code | text | null = auto-apply |
| scope | enum | product / category / order |
| max_uses, max_uses_per_customer | int | |
| starts_at, ends_at | datetime | |

### Campaign
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| channel | enum | TikTok ad / FB ad / boosted / live / organic |
| spend | money(base) | |
| voucher | → Promotion | for auto-attribution |

### DemandTest
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| candidate_product | text/→ Product | the thing being tested |
| channel, type | enum | post / ad / live |
| budget_cap, window | money / daterange | |
| signals | map | views, clicks, comments, pre_orders |
| result | enum | Stock / Dropship / Drop |

### AuditEntry (append-only)
| Field | Type | Notes |
|-------|------|-------|
| id | id | **(req)** |
| actor | → User | **(req)** who |
| at | datetime | **(req)** when |
| action | text | what changed |
| before, after | snapshot | money/stock value before & after |

## Notes

- This dictionary defines **concepts and relationships**, not storage. Index strategy, normalization, and the actual schema are an engineering decision (ADR), made when the modules are built.
- Money fields carry an implied currency: **base currency** unless marked `(CNY)`.
- Derived fields (e.g. order `payment_status`) are computed, never stored as a separate editable truth.
